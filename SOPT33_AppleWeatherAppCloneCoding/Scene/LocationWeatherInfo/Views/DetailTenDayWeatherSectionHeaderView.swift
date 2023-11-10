//
//  DetailTenDayWeatherSectionHeaderView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/10/23.
//

import UIKit

final class DetailTenDayWeatherSectionHeaderView: UICollectionReusableView {
    
    static let identifier = "DetailTenDayWeatherSectionHeaderView"
    
    private let tenDayheaderLabel: SFFontLabel = {
        let label = SFFontLabel(size: 15, weight: .medium)
        label.text = "10일간의 일기예보"
        return label
    }()
    
    private let calenderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.detailView.calenderImage
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    private func setStyle() {
        self.backgroundColor = UIColor(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
    }
    
    private func setLayout() {
        self.addSubviews(tenDayheaderLabel, calenderImage)
        
        calenderImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        tenDayheaderLabel.snp.makeConstraints {
            $0.leading.equalTo(calenderImage.snp.trailing).offset(5)
            $0.centerY.equalToSuperview()
        }
        
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
