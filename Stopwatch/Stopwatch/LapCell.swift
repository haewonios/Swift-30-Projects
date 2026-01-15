//
//  LapCell.swift
//  Stopwatch
//
//  Created by hyewon on 1/15/26.
//

import UIKit
import Then
import SnapKit

class LapCell: UITableViewCell {
    
    static let identifier: String = "LapCell"
    
    private let lapLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private let timeLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(lap: Int, time: String) {
        self.lapLabel.text = "Lap \(lap)"
        self.timeLabel.text = time
    }
    
    private func setupUI() {
        contentView.addSubview(lapLabel)
        contentView.addSubview(timeLabel)
        
        lapLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(60)
            $0.centerY.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-60)
            $0.centerY.equalToSuperview()
        }
    }
}
