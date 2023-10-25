//
//  WeatherInfoByHourView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/25.
//

import UIKit

class WeatherInfoByHourView: UIView {
    
    
    let descripLabel: SFFontLabel = {
        let label = SFFontLabel(size: 18, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    private let divideView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.backgroundColor = .white
        view.layer.borderWidth = 0.2
        return view
    }()
    
    private let weatherByHourScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = true
        return scrollView
    }()
    
    private let weatherByHourContentView = UIView()
    
    private let wholeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        return stackView
    }()
    
    private let nowStackView = WeatherInfoByHourStackView()
    private let firStackView = WeatherInfoByHourStackView()
    private let seStackView = WeatherInfoByHourStackView()
    private let thStackView = WeatherInfoByHourStackView()
    private let foStackView = WeatherInfoByHourStackView()
    private let fiStackView = WeatherInfoByHourStackView()
    private let sixStackView = WeatherInfoByHourStackView()
    private let sevStackView = WeatherInfoByHourStackView()
    private let eigStackView = WeatherInfoByHourStackView()
    private let ninStackView = WeatherInfoByHourStackView()
    
    
    var hourData: [WeatherInfoByHour]? {
        didSet {
            guard let hourData else { return }
            nowStackView.weatherInfoByHour = hourData[0]
            firStackView.weatherInfoByHour = hourData[1]
            seStackView.weatherInfoByHour = hourData[2]
            thStackView.weatherInfoByHour = hourData[3]
            foStackView.weatherInfoByHour = hourData[4]
            fiStackView.weatherInfoByHour = hourData[5]
            sixStackView.weatherInfoByHour = hourData[6]
            sevStackView.weatherInfoByHour = hourData[7]
            eigStackView.weatherInfoByHour = hourData[8]
            ninStackView.weatherInfoByHour = hourData[9]
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setSelfView()
        setData()
        setLayout()
    }
    
    
    func setData() {
        
    }
    
    private func setSelfView() {
        
        self.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.white.withAlphaComponent(0.03)
    }
    
    private func setLayout() {
        self.addSubviews(descripLabel, divideView, weatherByHourScrollView)
        weatherByHourScrollView.addSubview(weatherByHourContentView)
        weatherByHourContentView.addSubview(wholeStackView)
        wholeStackView.addArrangedSubviews(nowStackView, firStackView, seStackView, thStackView, foStackView, fiStackView, sixStackView, sevStackView, eigStackView, ninStackView)
        
        descripLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(305)
            $0.height.equalTo(45)
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(descripLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        weatherByHourScrollView.snp.makeConstraints {
            $0.top.equalTo(divideView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        weatherByHourContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
//            $0.height.equalTo(weatherByHourScrollView.frameLayoutGuide)
            $0.width.equalTo(wholeStackView.snp.width)
        }
        
        wholeStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
