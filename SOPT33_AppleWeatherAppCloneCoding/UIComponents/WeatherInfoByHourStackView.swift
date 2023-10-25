//
//  WeatherInfoByHourStackView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/25.


import UIKit

class WeatherInfoByHourStackView: UIStackView {
    
    let timeByhourLabel = SFFontLabel(size: 17, weight: .medium)
    let weatherImage = UIImageView()
    let tempByHourLabel = SFFontLabel(size: 22, weight: .medium)
    
    var weatherInfoByHour: WeatherInfoByHour? {
        didSet {
            guard let data = weatherInfoByHour else { return }
            timeByhourLabel.text = data.time
            weatherImage.image = data.weatherImage.weatherImage()
            tempByHourLabel.text = "\(data.tempByHour)°"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setLayout()
        setStackView()
    }
    
    private func setStackView() {
        self.spacing = 14
        self.axis = .vertical
//        self.distribution = .equalSpacing
    }
    
    private func setLayout() {
        self.addArrangedSubviews(timeByhourLabel,weatherImage,tempByHourLabel)
        
        self.snp.makeConstraints {
            $0.width.equalTo(44)
            $0.height.equalTo(122)
        }
        
        weatherImage.snp.makeConstraints {
            $0.width.height.equalTo(44)
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
