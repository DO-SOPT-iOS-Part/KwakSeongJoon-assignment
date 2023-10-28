
//
//  UIStackView+.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/19.
//

import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0)
        }
        
    }
}
