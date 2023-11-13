//
//  WeatherAppData.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/13/23.
//

import Foundation

struct WeatherAppData {
    let weather: [WeatherApp]
    let main: MainApp
    let name: String
    let timeZone: String
}

struct MainApp {
    let temp: Int
    let temp_min: Int
    let temp_max: Int
}

struct WeatherApp {
    let id: Int
    let description: String
    let icon: String
}
