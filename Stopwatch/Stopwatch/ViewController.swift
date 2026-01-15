//
//  ViewController.swift
//  Stopwatch
//
//  Created by hyewon on 1/15/26.
//

import UIKit
import SnapKit
import Then
import Combine
import CombineCocoa

class ViewController: UIViewController, UITableViewDataSource {

    private let titleLabel = UILabel().then {
        $0.text = "Stopwatch"
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    private let timerLabel = UILabel().then {
        $0.text = "00:00:00"
        $0.font = .monospacedDigitSystemFont(ofSize: 60, weight: .semibold) // 시간 흔들림 방지 - 모든 숫자의 가로 너비가 동일해짐
        $0.textAlignment = .center
    }
    
    private let buttonContainer = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 40
    }
    
    private let lapButton = UIButton().then {
        $0.setTitle("Reset", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let startButton = UIButton().then {
        $0.setTitle("Start", for: .normal)
        $0.setTitleColor(.green, for: .normal)
    }
    
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.register(LapCell.self, forCellReuseIdentifier: LapCell.identifier)
    }
    
    private let input = PassthroughSubject<ViewModel.Input, Never>()
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewModel: ViewModel
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
        bindControls()
    }

    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(timerLabel)
        view.addSubview(buttonContainer)
        buttonContainer.addArrangedSubview(lapButton)
        buttonContainer.addArrangedSubview(startButton)
        view.addSubview(tableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        buttonContainer.snp.makeConstraints {
            $0.top.equalTo(timerLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(buttonContainer.snp.bottom).offset(50)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        
        output.sink { [weak self] event in
            guard let self else { return }
            switch event {
            case .updateTime(let time):
                if time == nil {
                    timerLabel.text = "00:00:00"
                    tableView.reloadData()
                } else {
                    timerLabel.text = time
                }
                print("updateTime")
            case .updateLaps:
                tableView.reloadData()
                print("updateLaps")
            }
        }
        .store(in: &cancellables)
        
        viewModel.$isStarted
            .sink { [weak self] isStarted in
                guard let self else { return }
                if isStarted {
                    startButton.setTitle("Stop", for: .normal)
                    startButton.setTitleColor(.red, for: .normal)
                    lapButton.setTitle("Lap", for: .normal)
                    lapButton.setTitleColor(.black, for: .normal)
                } else {
                    startButton.setTitle("Start", for: .normal)
                    startButton.setTitleColor(.green, for: .normal)
                    lapButton.setTitle("Reset", for: .normal)
                    lapButton.setTitleColor(.black, for: .normal)
                }
            }
            .store(in: &cancellables)
    }
    
    private func bindControls() {
        lapButton.tapPublisher.sink { [weak self] _ in
            guard let self else { return }
            if viewModel.isStarted {
                input.send(.lapButtonTapped)
            } else {
                input.send(.resetButtonTapped)
            }
        }
        .store(in: &cancellables)
        
        startButton.tapPublisher.sink { [weak self] _ in
            guard let self else { return }
            if viewModel.isStarted {
                input.send(.stopButtonTapped)
            } else {
                input.send(.startButtonTapped)
            }
        }
        .store(in: &cancellables)
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LapCell.identifier) as? LapCell else {
            return UITableViewCell()
        }
        cell.configure(lap: indexPath.row, time: viewModel.laps[indexPath.row])
        return cell
    }
}
