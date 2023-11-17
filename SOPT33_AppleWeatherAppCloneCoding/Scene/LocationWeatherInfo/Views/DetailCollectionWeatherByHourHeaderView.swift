//
//  DetailCollectionWeatherByHourHeaderView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/8/23.
//

import UIKit

final class DetailCollectionWeatherByHourHeaderView: UICollectionReusableView {
    
    static let identifier = "DetailCollectionWeatherByHourHeaderView"
    
    var headerData: WeatherAppData? {
        didSet {
            guard let data = headerData else { return }
            
            let time = data.city.timezone.components(separatedBy: [":"])
            let timePlus = Int(time[0])! + 1
            let timePPlus = Int(time[0])! + 6
            hourWeatherDescriptionLabel.text = ("\(time[0])시 ~ \(timePlus)시에 강우 상태가,  \(timePPlus)시 경에 한 때는 폭설 상태가 예상됩니다.")
            
        }
    }
    
    private let divideView: UIView = {
        let view = UIView()
//        view.alpha = 0.5
        view.backgroundColor = .white
        return view
    }()
    
     var hourWeatherDescriptionLabel: SFFontLabel = {
        let label = SFFontLabel(size: 18, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
        
    }
    
    private func setStyle() {
        self.backgroundColor = UIColor(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
        self.layer.cornerRadius = 15
        
    }
    
    private func setLayout() {
        self.addSubviews(hourWeatherDescriptionLabel, divideView)
        
        hourWeatherDescriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

