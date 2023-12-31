//
//  DetailHeaderSectionCollectionViewCell.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/7/23.
//

import UIKit

final class DetailHeaderSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "DetailHeaderSectionCollectionViewCell"
    
    private let locationNameLabel = SFFontLabel(size: 36, weight: .regular)
    private let currentTempLabel = SFFontLabel(size: 102, weight: .thin)
    private let locationWeatherLabel = SFFontLabel(size: 24, weight: .regular)
    private let highAndLowTempLabel = SFFontLabel(size: 20, weight: .medium)
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var detailWeatherData: WeatherDataStruct? {
        didSet {
            guard let data = detailWeatherData else { return }
            self.locationNameLabel.text = data.locationName
            self.currentTempLabel.text = "\(data.locationTemperature)°"
            self.locationWeatherLabel.text = data.locationWeather
            self.highAndLowTempLabel.text = "최고:\(data.locationHighestTemp)°  최저:\(data.locationLowestTemp)°"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        self.contentView.backgroundColor = .clear
    }
    
    
    
    private func setLayout() {
        
        
        contentView.addSubviews(headerStackView)
        headerStackView.addArrangedSubviews(locationNameLabel, currentTempLabel, locationWeatherLabel, highAndLowTempLabel)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.centerX.equalToSuperview()
            
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
