//
//  detailWeatherSectionZeroCollectionViewCell.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/11/03.
//

import UIKit

class DetailWeatherByHourSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "detailWeatherSectionZeroCollectionViewCell"
    
    private let hourWeatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    private var hourLabel = SFFontLabel(size: 17, weight: .medium)
    private var weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var hourTempLabel = SFFontLabel(size: 22, weight: .medium)
    
    var hourWeatherData: WeatherInfoByHour? {
        didSet {
            guard let data = hourWeatherData else { return }
            self.hourLabel.text = data.time
            self.weatherImage.image = data.weatherImage.weatherImage()
            self.hourTempLabel.text = "\(data.tempByHour)°"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
        
    }
    
    private func setLayout() {
        self.contentView.addSubviews(hourWeatherStackView)
        hourWeatherStackView.addArrangedSubviews(hourLabel, weatherImage, hourTempLabel)
        
        hourWeatherStackView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
