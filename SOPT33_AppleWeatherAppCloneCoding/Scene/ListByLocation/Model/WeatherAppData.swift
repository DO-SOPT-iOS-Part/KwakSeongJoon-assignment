//
//  WeatherAppData.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/13/23.
//

import Foundation
import UIKit


struct WeatherAppData {
    let list: [ListApp]
    let city: CityApp
}

struct MainApp {
    let temp: Int
    let temp_min: Int
    let temp_max: Int
}

struct WeatherApp {
    let id: Int
    let weatherDescription: String
    let icon: UIImage?
}

struct ListApp {
    let main: MainApp
    let weather: [WeatherApp]
    let dttxt: String
}

struct CityApp {
    let name: String
    let timezone: String
}

