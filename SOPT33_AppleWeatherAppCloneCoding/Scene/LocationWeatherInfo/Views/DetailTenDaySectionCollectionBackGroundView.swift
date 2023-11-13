//
//  DetailTenDaySectionCollectionReusableView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/10/23.
//

import UIKit

final class DetailTenDaySectionCollectionBackGroundView: UICollectionReusableView {
        
    static let identifier = "DetailTenDaySectionCollectionBackGroundView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    private func setStyle() {
        self.backgroundColor = UIColor(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
