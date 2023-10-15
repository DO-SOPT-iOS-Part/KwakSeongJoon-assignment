//
//  ImageLiterals.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/16.
//

import UIKit

enum ImageLiterals {
    enum MainView {
        static var mainListBackGroundImage: UIImage { .load(named: "mainListBackgroundImage") }
        static var searchImage: UIImage { .load(named: "searchImage") }
        static var navigationSettingImage: UIImage { .load(named: "navigationSettingImage") }
    }
    
    enum detailView {
        static var backgroundImage: UIImage { .load(named: "backgroundImage") }
        static var cloudyImage: UIImage { .load(named: "cloudyImage") }
        static var GPSImage: UIImage { .load(named: "GPSImage") }
        static var locationDotImage: UIImage { .load(named: "locationDotImage") }
        static var locationListImage: UIImage { .load(named: "locationListImage") }
        static var mapImage: UIImage { .load(named: "mapImage") }
        static var rainyAndSunnyImage: UIImage { .load(named: "rainyAndSunnyImage") }
        static var rainyImage: UIImage { .load(named: "rainyImage") }
        static var searchImage: UIImage { .load(named: "searchImage") }
        static var snowImage: UIImage { .load(named: "snowImage") }
        static var ThunderImage: UIImage { .load(named: "ThunderImage") }

    }
}
