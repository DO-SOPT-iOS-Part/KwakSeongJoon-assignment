//
//  DetailTenDayWeatherSectionCollectionReusableView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/9/23.
//

import UIKit

final class DetailTenDayWeatherSectionCollectionViewCell: UICollectionViewCell {
        
    static let identifier = "DetailTenDayWeatherSectionCollectionReusableView"
    
    private let dayLabel = SFFontLabel(size: 22, weight: .medium)
    private let dayWeatherImage = UIImageView()
    private let lowTempLabel: UILabel = {
        let label = SFFontLabel(size: 22, weight: .medium)
        label.alpha = 0.3
        return label
    }()
    private let progressImage = UIImageView()
    private let highTempLabel = SFFontLabel(size: 22, weight: .medium)

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setLayout() {
        self.contentView.addSubviews(dayLabel, dayWeatherImage, lowTempLabel, progressImage, highTempLabel)
        
        dayLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        dayWeatherImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dayLabel.snp.trailing).offset(30)
        }
        
        lowTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dayWeatherImage.snp.trailing).offset(15)
        }
        
        progressImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(lowTempLabel.snp.trailing).offset(6)
        }
        
        highTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(progressImage.snp.trailing).offset(5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
