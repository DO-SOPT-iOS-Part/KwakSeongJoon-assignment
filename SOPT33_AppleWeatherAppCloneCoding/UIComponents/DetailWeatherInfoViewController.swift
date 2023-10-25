//
//  DetailWeatherInfoViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/23.
//

import UIKit

class DetailWeatherInfoViewController: UIViewController {
        
    private let detailVerticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let detailVerticalContentView = UIView()
    
    
    private let backgroundImage = UIImageView(image: ImageLiterals.detailView.backgroundImage)
    
    private let locationNameLabel = SFFontLabel(size: 36, weight: .regular)
    private let currentTempLabel = SFFontLabel(size: 102, weight: .thin)
    private let locationWeatherLabel = SFFontLabel(size: 24, weight: .regular)
    private let highAndLowTempLabel = SFFontLabel(size: 20, weight: .medium)
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let weatherDescripLabel = SFFontLabel(size: 18, weight: .regular)
    private let timeLabel = SFFontLabel(size: 17, weight: .medium)
    private let tempByTime = SFFontLabel(size: 22, weight: .medium)

    private let weatherInfoByHourView = WeatherInfoByHourView()
    
    
    var detailWeatherData: WeatherDataStruct? {
        didSet {
            guard let data = detailWeatherData else { return }
            self.locationNameLabel.text = data.locationName
            self.currentTempLabel.text = "\(data.locationTemperature)°"
            self.locationWeatherLabel.text = data.locationWeather
            self.highAndLowTempLabel.text = "최고:\(data.locationHighestTemp)°  최저:\(data.locationLowestTemp)°"
            
            weatherInfoByHourView.hourData = data.detailWeatherByHour
            weatherInfoByHourView.descripLabel.text = data.weatherDescription
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        
    }
    
    //처음 디테일뷰에 진입할 때도 안보이게 하기 위해
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
    
    private func setLayout() {
        
        self.view.addSubviews(backgroundImage, detailVerticalScrollView)
        self.view.sendSubviewToBack(backgroundImage)
        
        detailVerticalScrollView.addSubviews(detailVerticalContentView)
        headerStackView.addArrangedSubviews(locationNameLabel, currentTempLabel, locationWeatherLabel, highAndLowTempLabel)
        detailVerticalContentView.addSubviews(headerStackView, weatherInfoByHourView)
        
        
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailVerticalScrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.bottom.equalToSuperview()
        }
        
        detailVerticalContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(detailVerticalScrollView.frameLayoutGuide)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.trailing.leading.equalToSuperview()
        }
        
        weatherInfoByHourView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(44)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(212)
        }
    }
}