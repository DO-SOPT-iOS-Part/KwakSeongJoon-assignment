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
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    private let backgroundImage = UIImageView(image: ImageLiterals.detailView.backgroundImage)
    
    private let weatherDescripLabel = SFFontLabel(size: 18, weight: .regular)
    private let timeLabel = SFFontLabel(size: 17, weight: .medium)
    private let tempByTime = SFFontLabel(size: 22, weight: .medium)
    
    private let weatherInfoByHourView = WeatherInfoByHourView()
    
    private var shouldHideSection: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false

    }
    
    private func setLayout() {
        
        self.view.addSubviews (backgroundImage, detailWeatherCollectionView)
        self.view.sendSubviewToBack(backgroundImage)
        
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailWeatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.bottom.equalToSuperview().inset(20)
            
        }
        
    }
    
    private func setCollectionView() {
        detailWeatherCollectionView.delegate = self
        detailWeatherCollectionView.dataSource = self
        
        detailWeatherCollectionView.register(DetailHeaderSectionCollectionViewCell.self, forCellWithReuseIdentifier: DetailHeaderSectionCollectionViewCell.identifier)
        detailWeatherCollectionView.register(DetailWeatherByHourSectionCollectionViewCell.self, forCellWithReuseIdentifier: DetailWeatherByHourSectionCollectionViewCell.identifier)
        detailWeatherCollectionView.register(DetailCollectionWeatherByHourHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailCollectionWeatherByHourHeaderView.identifier)
        detailWeatherCollectionView.register(DetailTenDayWeatherSectionCollectionViewCell.self, forCellWithReuseIdentifier: DetailTenDayWeatherSectionCollectionViewCell.identifier)
        detailWeatherCollectionView.register(DetailTenDayWeatherSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailTenDayWeatherSectionHeaderView.identifier)
        
        detailWeatherCollectionView.register(DetailStickyHeaderCollectionViewCell.self, forCellWithReuseIdentifier: DetailStickyHeaderCollectionViewCell.identifier)
        
        
    }
    
    static func createLayout() -> UICollectionViewLayout {
      
            let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
                
                switch sectionNumber {
                case 0:
                    // 기존 코드
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(280)))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1.5)), subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 44, trailing: 0)
                    
                    return section
                    
                case 1:
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(55), heightDimension: .absolute(100)))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .continuous
                    section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 20, trailing: 0)
                    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top
                    )
                    header.pinToVisibleBounds = true
                    section.boundarySupplementaryItems = [header]
                    
                    let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: DetailHourSectionBackgroundView.identifier)
                    sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
                    section.decorationItems = [sectionBackgroundDecoration]
                    
                    return section
                    
                case 2:
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(335), heightDimension: .absolute(55)))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top
                    )
                    header.pinToVisibleBounds = true

                    section.boundarySupplementaryItems = [header]
                    
                    
                    let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: DetailTenDaySectionCollectionBackGroundView.identifier)

                    section.decorationItems = [sectionBackgroundDecoration]
                    
                    return section
                    
                default:
                    return nil
                    
                }
            }
        layout.register(DetailHourSectionBackgroundView.self, forDecorationViewOfKind: DetailHourSectionBackgroundView.identifier)
        layout.register(DetailTenDaySectionCollectionBackGroundView.self, forDecorationViewOfKind: DetailTenDaySectionCollectionBackGroundView.identifier)
                return layout
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
        case 2:
            guard let weatherData else { return 0}
            return weatherData.tenDayWeather.count
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
            switch indexPath.section {
            case 1:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCollectionWeatherByHourHeaderView.identifier, for: indexPath) as? DetailCollectionWeatherByHourHeaderView else { return UICollectionReusableView()}
                header.headerData = weatherData
                return header
                
            case 2:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailTenDayWeatherSectionHeaderView.identifier, for: indexPath) as? DetailTenDayWeatherSectionHeaderView else { return UICollectionReusableView()}
                return header
                
            default:
                return UICollectionReusableView()

            }
            
        default:
            return UICollectionReusableView()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
         
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailHeaderSectionCollectionViewCell.identifier, for: indexPath) as? DetailHeaderSectionCollectionViewCell else { return UICollectionViewCell()}
                cell.detailWeatherData = weatherData
                cell.isHidden = false
                return cell
            
            
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailWeatherByHourSectionCollectionViewCell.identifier, for: indexPath) as? DetailWeatherByHourSectionCollectionViewCell else { return UICollectionViewCell() }
            
            cell.hourWeatherData = weatherData?.detailWeatherByHour[indexPath.row]
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailTenDayWeatherSectionCollectionViewCell.identifier, for: indexPath) as? DetailTenDayWeatherSectionCollectionViewCell else { return UICollectionViewCell() }
            
            cell.tenDayWeatherData = weatherData?.tenDayWeather[indexPath.row]
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
}



