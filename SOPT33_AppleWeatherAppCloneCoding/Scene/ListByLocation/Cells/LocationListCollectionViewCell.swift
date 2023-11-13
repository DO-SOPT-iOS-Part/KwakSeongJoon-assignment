//
//  LocationListCollectionViewCell.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/11/01.
//

import UIKit

class LocationListCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "LocationListCollectionViewCell"
    
    private let locationLabel = SFFontLabel(size: 24, weight: .bold)
    private let timeLabel = SFFontLabel(size: 17, weight: .medium)
    private let weatherInfoLabel = SFFontLabel(size: 16, weight: .medium)
    private let temperatureLabel = SFFontLabel(size: 52, weight: .light)
    private let highestTempLabel = SFFontLabel(size: 15, weight: .medium)
    private let lowestTempLabel = SFFontLabel(size: 15, weight: .medium)
    
    private enum Size {
        static let buttonHeight: CGFloat = 117 /  335
    }
        
    var cellWeatherData: WeatherAppData? {
        didSet {
            guard let data = cellWeatherData else { return }
            locationLabel.text = data.name
            timeLabel.text = data.timeZone
            weatherInfoLabel.text = data.weather[0].description
            temperatureLabel.text = "\(data.main.temp)°"
            highestTempLabel.text = "최고: \(data.main.temp_max)°"
            lowestTempLabel.text = "최저: \(data.main.temp_min)°"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 15
        
        setLayout()
        setBackgroundImage()
    }
    
    private func setBackgroundImage() {
        let view = UIImageView(image: ImageLiterals.MainView.mainListBackGroundImage)
        view.contentMode = .scaleAspectFill
        self.backgroundView = view
    }
    
    private func setLayout() {
        
        self.contentView.addSubviews(locationLabel, timeLabel, weatherInfoLabel, temperatureLabel, highestTempLabel, lowestTempLabel)
        
        locationLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalTo(locationLabel.snp.bottom).offset(2)
            $0.leading.equalTo(locationLabel.snp.leading)
        }
        
        weatherInfoLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(23)
            $0.leading.equalTo(timeLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        temperatureLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        highestTempLabel.snp.makeConstraints{
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(23)
            $0.trailing.equalToSuperview().inset(79)
        }
        
        lowestTempLabel.snp.makeConstraints{
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(23)
            $0.leading.equalTo(highestTempLabel.snp.trailing).offset(6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
