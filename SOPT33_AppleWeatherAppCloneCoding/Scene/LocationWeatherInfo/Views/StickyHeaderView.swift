//
//  StickyHeaderView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/16/23.
//

import UIKit

class StickyHeaderView: UIView {
    
    private let locationNameLabel = SFFontLabel(size: 36, weight: .regular)
    private let locationWeatherLabel = SFFontLabel(size: 24, weight: .regular)
    private let currentTempLabel = SFFontLabel(size: 24, weight: .regular)
    private let tempAndWeatherInfoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        locationNameLabel.text = "목동"
        locationWeatherLabel.text = "흐림"
        currentTempLabel.text = "8도"
        
        setLayout()
        self.backgroundColor = .systemBlue
    }
    
    private func setLayout() {
        
        self.addSubviews(locationNameLabel, tempAndWeatherInfoStackView)
        tempAndWeatherInfoStackView.addArrangedSubviews(locationWeatherLabel, currentTempLabel)
        locationNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150)
            $0.top.equalToSuperview().inset(50)
        }
        
        tempAndWeatherInfoStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150)
            $0.top.equalTo(locationNameLabel.snp.bottom).offset(10)
        }
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
