//
//  DetailHourSectionBackgroundView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/9/23.
//

import UIKit

final class DetailHourSectionBackgroundView: UICollectionReusableView {
      
    static let identifier = "DetailHourSectionBackgroundView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSelfStyle()
    }
    
    private func setSelfStyle() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        self.alpha = 0.2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
