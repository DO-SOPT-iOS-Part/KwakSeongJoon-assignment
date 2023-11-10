//
//  DetailTenDayWeatherSectionCollectionReusableView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/9/23.
//

import UIKit

final class DetailTenDayWeatherSectionCollectionViewCell: UICollectionViewCell {
        
    static let identifier = "DetailTenDayWeatherSectionCollectionReusableView"
    
    private let divideView: UIView = {
        let view = UIView()
        view.alpha = 0.5
        view.backgroundColor = .white
        return view
    }()
    
    private var dayLabel = SFFontLabel(size: 22, weight: .medium)
    private var dayWeatherImage = UIImageView()
    private var rainPercentLabel: SFFontLabel = {
        let label = SFFontLabel(size: 15, weight: .semibold)
        label.textColor = UIColor(red: 0.506, green: 0.812, blue: 0.98, alpha: 1)
        return label
    }()
    
    private var lowTempLabel: UILabel = {
        var label = SFFontLabel(size: 22, weight: .medium)
        label.alpha = 0.3
        return label
    }()
    
    private var progressImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.detailView.progressImage
        return imageView
    }()
    
    private var highTempLabel = SFFontLabel(size: 22, weight: .medium)
    

    var tenDayWeatherData: TendayWeatherInfo? {
        didSet {
            guard let data = tenDayWeatherData else { return }
            self.dayLabel.text = data.day
            self.dayWeatherImage.image = data.weatherImage.weatherImage()
            self.lowTempLabel.text = "\(data.lowTemp)°"
//            self.progressImage.image = data.weatherProgressImage.weatherImage()
            self.highTempLabel.text = "\(data.highTemp)°"
            
            guard let rain = data.rainyPercent else { return }
            if data.rainyPercent == nil {
                self.rainPercentLabel.text = ""
            } else {
                self.rainPercentLabel.text = "\(rain)%"
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    private func setLayout() {
        self.contentView.addSubviews(dayLabel, dayWeatherImage, rainPercentLabel, lowTempLabel, progressImage, highTempLabel, divideView)
        
        dayLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        dayWeatherImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dayLabel.snp.trailing).offset(30)
        }
        
        rainPercentLabel.snp.makeConstraints {
            $0.top.equalTo(dayWeatherImage.snp.bottom).offset(1)
            $0.centerX.equalTo(dayWeatherImage)
        }
        
        lowTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dayWeatherImage.snp.trailing).offset(15)
        }
        
        progressImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(lowTempLabel.snp.trailing).offset(6)
            $0.width.equalTo(108)
            $0.height.equalTo(12)
        }
        
        highTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(progressImage.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(7)
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(dayLabel.snp.bottom).offset(15)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
