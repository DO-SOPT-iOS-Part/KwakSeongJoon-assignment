//
//  detailWeatherSectionZeroCollectionViewCell.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/11/03.
//

import UIKit

class DetailWeatherByHourSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "detailWeatherSectionZeroCollectionViewCell"
    
    var index: IndexPath = IndexPath(item: 0, section: 0)
    
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
    
    var hourWeatherData: WeatherAppData? {
        didSet {
            guard let data = hourWeatherData else { return }
            let split = data.list[index.item + 2].dttxt.components(separatedBy: " ")
            let secondSplit = split[1].components(separatedBy: [":"] )
            let hour = Int(secondSplit[0])!
            self.hourLabel.text = "\(hour) 시"
            self.hourTempLabel.text = "\(data.list[index.item + 2].main.temp)°"
            self.weatherImage.image = data.list[index.item + 2].weather[0].icon
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
