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
    
    private var filteredBySearchWeatherData: [String] = []
    
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
    
    private lazy var busanButton =  LocationButton(idx: 3, target: self, addTarget: #selector(pushToLocationDetailWeatherView))
    
    private var locationButtonSet: [LocationButton] = []
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setWeatherData()
        setLayout()
        setSearchController()
        
    }
    
    //다시 화면 돌아왔을 때, 초기화면으로 돌리기 위해
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFiltering {
            locationButtonSet.forEach { $0.isHidden = false }
            locationSearchController.searchBar.text = nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        locationListContentView.backgroundColor = .black
        
        //스크롤했을 때 네비바 색깔
        self.navigationController?.navigationBar.barTintColor = .black
        
    }
    
    private func setLayout() {
        self.view.addSubviews(locationListScrollView)
        
        locationListScrollView.addSubviews(locationListContentView)
        
        locationListContentView.addSubviews(locationButtonStackView)
        
        locationButtonStackView.addArrangedSubviews(myLocationButton, mokdongButton, incheonButton, busanButton)
        
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
    
    private func setSearchController() {
        
        locationSearchController.searchBar.placeholder = "도시 또는 공항 검색"
        locationSearchController.hidesNavigationBarDuringPresentation = false
        locationSearchController.searchResultsUpdater = self
        locationSearchController.obscuresBackgroundDuringPresentation = false
        
        //cancel 버튼 text를 "취소로" 변경
        locationSearchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = locationSearchController
        
        
        //검색창 검색 글씨 색깔 변경
        let textFieldInsideSearchBar = locationSearchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        
        self.navigationItem.title = "날씨"
        
        self.navigationItem.rightBarButtonItem = optionButton
        
        
        
        //스크롤 됐을 때, 타이틀 색 변경
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Large title로 하고 싶을 때 추가
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Large title 색 변경
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setWeatherData() {
        myLocationButton.weatherData = weatherData[0]
        mokdongButton.weatherData = weatherData[1]
        incheonButton.weatherData = weatherData[2]
        busanButton.weatherData = weatherData[3]
    }
    
    @objc
    private func pushToLocationDetailWeatherView(sender: LocationButton) {
        
        let index = sender.index
        
        let nextVC = LocationDetailWeatherViewController()
        nextVC.index = index
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ListByLocationWithSearchViewController: UISearchResultsUpdating {

    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchingText = searchController.searchBar.searchTextField.text else { return }
        
        [myLocationButton, mokdongButton, incheonButton, busanButton].forEach { button in
            locationButtonSet.append(button)
        }
        
        if isFiltering == false {
            locationButtonSet.forEach { button in
                button.isHidden = false
            }
        } else {
            locationButtonSet.forEach { button in
                if button.weatherData?.locationName.contains(searchingText) == true {
                    button.isHidden = false
                } else {
                    button.isHidden = true
                }
            }
        }
    }
}





