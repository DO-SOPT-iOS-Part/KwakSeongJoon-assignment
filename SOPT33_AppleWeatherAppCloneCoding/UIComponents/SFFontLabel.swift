//
//  UILabel.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/23.
//

import UIKit

class SFFontLabel: UILabel {
    init(
        size: CGFloat,
        weight: UIFont.Weight
    ) {
        super.init(frame: .zero)
        self.font = UIFont.sfPro(size: size, weight: weight)
        self.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
