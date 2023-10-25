//
//  ListByLocationWithSearchViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/16.
//

import UIKit
import SnapKit

final class ListByLocationWithSearchViewController: UIViewController {
    
    private var weatherData = WeatherDataStruct.dummy()
    
    //    private var filteredBySearchWeatherData: [WeatherDataStruct] = []
    
    private let locationSearchController = UISearchController(searchResultsController: nil)
    
    private let locationListScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let locationListContentView = UIView()
    
    private lazy var optionButton: UIBarButtonItem = {
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
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private lazy var myLocationButton = LocationButton(idx: 0, target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private lazy var mokdongButton =  LocationButton(idx: 1, target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private lazy var incheonButton =  LocationButton(idx: 2, target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private lazy var cheonanButton =  LocationButton(idx: 3, target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
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
            $0.trailing.bottom.leading.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        locationListContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(locationListScrollView.frameLayoutGuide)
        }
        
        locationButtonStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(20)
        }
        
    }
    
    @objc
    func pushToLocationDetailWeatherView(sender: LocationButton) {
        
        let index = sender.index
        
        let nextVC = LocationDetailWeatherViewController()
        nextVC.index = index
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


extension ListByLocationWithSearchViewController {
    
    private func setSearchController() {
        
        locationSearchController.searchBar.placeholder = "도시 또는 공항 검색"
        locationSearchController.hidesNavigationBarDuringPresentation = false
        //        locationSearchController.searchResultsUpdater = self
        locationSearchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = locationSearchController
        
        //검색창 검색 글씨 색깔 변경
        let textFieldInsideSearchBar = locationSearchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        
        self.navigationItem.title = "날씨"
        
        self.navigationItem.rightBarButtonItem = optionButton
        
        // Large title로 하고 싶을 때 추가
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Large title 색 변경
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setWeatherData() {
        myLocationButton.weatherData = weatherData[0]
        mokdongButton.weatherData = weatherData[1]
        incheonButton.weatherData = weatherData[2]
        cheonanButton.weatherData = weatherData[3]
    }
    
}

//extension ListByLocationWithSearchViewController: UISearchResultsUpdating {
//
//
//    func updateSearchResults(for searchController: UISearchController) {
//
//        guard let enteringText = searchController.searchBar.text else {
//            filteredBySearchWeatherData = weatherData
//            reloadView()
//            return
//        }
//
//        filteredBySearchWeatherData = weatherData.filter { data in
//            return data.locationName.contains(enteringText)
//        }
//
//        reloadView()
//    }
//
//    func reloadView() {
//
//        print(filteredBySearchWeatherData)
//
//    }
//}
//
//
//

