//
//  ViewModel.swift
//  Stopwatch
//
//  Created by hyewon on 1/15/26.
//

import Foundation
import Combine

public final class ViewModel: AnyObject {
    
    public var laps: [String] = []
    @Published public var isStarted: Bool = false
    
    private var elapsedSeconds: Double = 0.0
    
    enum Input {
        case startButtonTapped
        case stopButtonTapped
        case lapButtonTapped
        case resetButtonTapped
    }
    
    enum Output {
        case updateTime(String?)
        case updateLaps
    }
    
    private let output: PassthroughSubject<Output, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    private var timerCancellable: AnyCancellable?
    
    public init() {}
    
    func transform(input: AnyPublisher<Input,Never>) -> AnyPublisher<Output, Never> {
        input.sink { [weak self] event in
            guard let self else { return }
            switch event {
            case .startButtonTapped:
                isStarted = true
                startTimer()
                print("startButtonTapped")
            case .stopButtonTapped:
                isStarted = false
                stopTimer()
                print("stopButtonTapped")
            case .lapButtonTapped:
                addLap()
                print("lapButtonTapped")
            case .resetButtonTapped:
                resetTimer()
                print("resetButtonTapped")
            }
        }
        .store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
    
    private func startTimer() {
        timerCancellable?.cancel()
        
        timerCancellable = Timer.publish(every: 0.01, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                elapsedSeconds += 0.01
                sendUpdateTime()
            }
    }
    
    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
    
    private func sendUpdateTime() {
        let minutes = Int(elapsedSeconds) / 60
        let seconds = Int(elapsedSeconds) % 60
        let centiseconds = Int((elapsedSeconds.truncatingRemainder(dividingBy: 1)) * 100)
        
        let timeString = String(format: "%02d:%02d:%02d", minutes, seconds, centiseconds)
        
        output.send(.updateTime(timeString))
    }
    
    private func resetTimer() {
        elapsedSeconds = 0
        laps = []
        output.send(.updateTime(nil))
    }
    
    private func addLap() {
        let minutes = Int(elapsedSeconds) / 60
        let seconds = Int(elapsedSeconds) % 60
        let centiseconds = Int((elapsedSeconds.truncatingRemainder(dividingBy: 1)) * 100)
        
        let timeString = String(format: "%02d:%02d:%02d", minutes, seconds, centiseconds)
        laps.append(timeString)
        output.send(.updateLaps)
    }
}
