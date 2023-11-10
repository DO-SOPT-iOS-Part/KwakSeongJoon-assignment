//
//  DetailCollectionWeatherByHourHeaderView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/8/23.
//

import UIKit

final class DetailCollectionWeatherByHourHeaderView: UICollectionReusableView {
    
    static let identifier = "DetailCollectionWeatherByHourHeaderView"
    
    var headerData: WeatherDataStruct? {
        didSet {
            guard let data = headerData else { return }
            hourWeatherDescriptionLabel.text = data.weatherDescription
            
        }
    }
    
    private let divideView: UIView = {
        let view = UIView()
        view.alpha = 0.5
        view.backgroundColor = .white
        return view
    }()
    
    private let hourWeatherDescriptionLabel: SFFontLabel = {
        let label = SFFontLabel(size: 18, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        
    }
    
    private func setLayout() {
        self.addSubviews(hourWeatherDescriptionLabel, divideView)
        
        hourWeatherDescriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(hourWeatherDescriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
