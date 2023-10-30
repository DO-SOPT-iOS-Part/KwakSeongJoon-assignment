
//
//  UIFont+.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/16.
//

import UIKit

extension UIFont {
    static func sfPro(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        
        let familyName = "SFProText"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .thin:
            weightString = "Thin"
        case .light:
            weightString = "Light"
        default:
            weightString = "Medium"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize)!
    }
}


