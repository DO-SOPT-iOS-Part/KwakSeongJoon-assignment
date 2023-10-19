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
    
    private lazy var seoulButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    private lazy var daeguButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    
    private lazy var incheonButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()
    
    private let locationButtonStackView = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        locationListContentView.backgroundColor = .black
        setLaytout()
        setSearchController()
    }
    
    private func setLaytout() {
        self.view.addSubviews(locationListScrollView)
        
        locationListScrollView.addSubviews(locationListContentView)
        
        locationListScrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        locationListContentView.snp.makeConstraints{
            $0.edges.equalTo(locationListScrollView.contentLayoutGuide)
            $0.width.equalTo(locationListScrollView.frameLayoutGuide)
            $0.height.equalTo(locationListScrollView)
        }
        
    }
    
    private func setSearchController() {

        locationSearchController.searchBar.placeholder = "도시 또는 공항 검색"
        locationSearchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = locationSearchController

        self.navigationItem.title = "날씨"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때 추가

        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]


    }
    
}
