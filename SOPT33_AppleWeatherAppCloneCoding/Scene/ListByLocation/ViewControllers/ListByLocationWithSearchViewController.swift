//
//  ListByLocationWithSearchViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/16.
//

import UIKit
import SnapKit

final class ListByLocationWithSearchViewController: UIViewController {
    
    private let locationSearchController = UISearchController(searchResultsController: nil)
    
    private let locationListScrollView = UIScrollView()
    
    private let locationListContentView = UIView()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        var button = UIBarButtonItem()
        button.isHidden = false
        button.image = ImageLiterals.MainView.navigationSettingImage
        button.tintColor = .white
        button.customView?.backgroundColor = .white
        return button
    }()
    
    private let locationButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var myLocationButton = LocationButton( target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private lazy var mokdongButton =  LocationButton(target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private lazy var incheonButton =  LocationButton(target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private lazy var cheonanButton =  LocationButton(target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLaytout()
        setSearchController()
        setWeatherData()
        
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        locationListContentView.backgroundColor = .black
    }
    
    private func setLaytout() {
        self.view.addSubviews(locationListScrollView)
        
        locationListScrollView.addSubviews(locationListContentView)
        
        locationListContentView.addSubviews(locationButtonStackView)
        
        locationButtonStackView.addArrangedSubviews(myLocationButton, mokdongButton, incheonButton, cheonanButton)
        
        locationListScrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        locationListContentView.snp.makeConstraints{
            $0.edges.equalTo(locationListScrollView.contentLayoutGuide)
            $0.width.equalTo(locationListScrollView.frameLayoutGuide)
            $0.height.equalTo(locationListScrollView)
        }
        
        locationButtonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            
        }
        
    }
    
    @objc
    private func pushToLocationDetailWeatherView() {
        let nextVC = LocationDetailWeatherViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


extension ListByLocationWithSearchViewController {
    
    private func setSearchController() {
        
        locationSearchController.searchBar.placeholder = "도시 또는 공항 검색"
        locationSearchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = locationSearchController
        
        self.navigationItem.title = "날씨"
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        // Large title로 하고 싶을 때 추가
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Large title 색 변경
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setWeatherData() {
        myLocationButton.weatherData = WeatherDataStruct.dummy()[0].locationWeatherData[0]
        mokdongButton.weatherData = WeatherDataStruct.dummy()[1].locationWeatherData[0]
        incheonButton.weatherData = WeatherDataStruct.dummy()[2].locationWeatherData[0]
        cheonanButton.weatherData = WeatherDataStruct.dummy()[3].locationWeatherData[0]
    }
    
}
