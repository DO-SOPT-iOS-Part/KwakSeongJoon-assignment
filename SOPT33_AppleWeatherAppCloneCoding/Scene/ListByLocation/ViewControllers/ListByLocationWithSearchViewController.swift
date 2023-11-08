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
    
    private var filteredBySearchWeatherData: [WeatherDataStruct] = []
    
    private let locationSearchController = UISearchController(searchResultsController: nil)
    
    private let locationListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .black
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    private lazy var optionButton: UIBarButtonItem = {
        var button = UIBarButtonItem()
        button.isHidden = false
        button.image = ImageLiterals.MainView.navigationSettingImage
        button.tintColor = .white
        button.customView?.backgroundColor = .black
        return button
    }()
        
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setSearchController()
        setCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        //스크롤했을 때 네비바, 툴바 색깔
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.toolbar.barTintColor = .black
        
    }
    
    private func setLayout() {
        
        self.view.addSubviews(locationListCollectionView)
        
        locationListCollectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setCollectionView() {
        locationListCollectionView.delegate = self
        locationListCollectionView.dataSource = self
        locationListCollectionView.register(LocationListCollectionViewCell.self, forCellWithReuseIdentifier: LocationListCollectionViewCell.identifier)
    }
}

extension ListByLocationWithSearchViewController: UICollectionViewDelegate { }

extension ListByLocationWithSearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return isFiltering ? filteredBySearchWeatherData.count : weatherData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationListCollectionViewCell.identifier, for: indexPath) as? LocationListCollectionViewCell else { return UICollectionViewCell()}
        
        if isFiltering {
            cell.cellWeatherData = self.filteredBySearchWeatherData[indexPath.section]
        } else {
            cell.cellWeatherData = self.weatherData[indexPath.section]
        }
        
        return cell
                
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nextVC = LocationDetailWeatherViewController()
        nextVC.index = indexPath.section
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ListByLocationWithSearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 40, height: 117)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}

extension ListByLocationWithSearchViewController {
    
    private func setSearchController() {
        locationSearchController.searchBar.placeholder = "도시 또는 공항 검색"
        locationSearchController.hidesNavigationBarDuringPresentation = true
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
}


extension ListByLocationWithSearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchingText = searchController.searchBar.searchTextField.text else { return }
        
        filteredBySearchWeatherData = weatherData.filter { $0.locationName.contains(searchingText)}
        
        self.locationListCollectionView.reloadData()
      
    }

}

