//
//  DetailWeatherInfoViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/23.
//

import UIKit

final class DetailWeatherInfoViewController: UIViewController {
    
    var weatherData: WeatherDataStruct?
    
    private let detailWeatherCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    private let backgroundImage = UIImageView(image: ImageLiterals.detailView.backgroundImage)
    
    private let weatherDescripLabel = SFFontLabel(size: 18, weight: .regular)
    private let timeLabel = SFFontLabel(size: 17, weight: .medium)
    private let tempByTime = SFFontLabel(size: 22, weight: .medium)
    
    private let weatherInfoByHourView = WeatherInfoByHourView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    private func setLayout() {
        
        self.view.addSubviews(backgroundImage, detailWeatherCollectionView)
        self.view.sendSubviewToBack(backgroundImage)
        
        
        
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailWeatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.bottom.equalToSuperview()
            
        }
        
    }
    
    private func setCollectionView() {
        detailWeatherCollectionView.delegate = self
        detailWeatherCollectionView.dataSource = self
        
        detailWeatherCollectionView.register(DetailHeaderSectionCollectionViewCell.self, forCellWithReuseIdentifier: DetailHeaderSectionCollectionViewCell.identifier)
        detailWeatherCollectionView.register(DetailWeatherSectionZeroCollectionViewCell.self, forCellWithReuseIdentifier: DetailWeatherSectionZeroCollectionViewCell.identifier)
        detailWeatherCollectionView.register(DetailCollectionWeatherByHourHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailCollectionWeatherByHourHeaderView.identifier)
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(280)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1.5)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 56, trailing: 0)
                return section
                
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(60), heightDimension: .absolute(90)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
                return section
                
            default:
                return nil
                
                
            }
        }
    }
}



extension DetailWeatherInfoViewController: UICollectionViewDelegate { }

extension DetailWeatherInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            guard let weatherData else { return 0}
            return weatherData.detailWeatherByHour.count
        default:
            return 0
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCollectionWeatherByHourHeaderView.identifier, for: indexPath) as? DetailCollectionWeatherByHourHeaderView else { return UICollectionReusableView()}
            return header
            
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailHeaderSectionCollectionViewCell.identifier, for: indexPath) as? DetailHeaderSectionCollectionViewCell else { return UICollectionViewCell()}
            
            cell.detailWeatherData = weatherData
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailWeatherSectionZeroCollectionViewCell.identifier, for: indexPath) as? DetailWeatherSectionZeroCollectionViewCell else { return UICollectionViewCell() }
            
            cell.hourWeatherData = weatherData?.detailWeatherByHour[indexPath.row]
            return cell
            
            
        default:
            return UICollectionViewCell()
        }
        
    }
}

