//
//  LocationButton.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/19.
//

import UIKit

final class LocationButton: UIButton {
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.sfPro(size: 24, weight: .bold)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.sfPro(size: 17, weight: .medium)
        return label
    }()
    
    private let weatherInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.sfPro(size: 16, weight: .medium)
        
        
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.sfPro(size: 52, weight: .light)
        return label
    }()
    
    private let highestTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.sfPro(size: 15, weight: .medium)
        return label
    }()
    
    private let lowestTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.sfPro(size: 15, weight: .medium)
        return label
    }()
    
    private enum Size {
        static let buttonHeight: CGFloat = 117 /  335
    }
    
    var index: Int = 0
    
    var weatherData: WeatherDataStruct? {
        didSet {
            guard let data = weatherData else { return }
            locationLabel.text = data.locationName
            timeLabel.text = data.locationTimeOrMyLocation
            weatherInfoLabel.text = data.locationWeather
            temperatureLabel.text = "\(data.locationTemperature)°"
            highestTempLabel.text = "최고: \(data.locationHighestTemp)°"
            lowestTempLabel.text = "최저: \(data.locationLowestTemp)°"
            
        }
    }
    
    init(
        idx: Int,
        target: Any,
        addTarget: Selector) {
            super.init(frame: .zero)
            self.addTarget(target, action: addTarget, for: .touchUpInside)
            self.setBackgroundImage(ImageLiterals.MainView.mainListBackGroundImage, for: .normal)
            self.index = idx
            setStyle()
            
            
        }
    
    
    private func setStyle() {
        
        
        
        self.addSubviews(locationLabel, timeLabel, weatherInfoLabel, temperatureLabel, highestTempLabel, lowestTempLabel)
        
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
