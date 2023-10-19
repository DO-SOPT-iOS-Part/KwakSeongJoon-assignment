//
//  WeatherListByLocationInfoModel.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/19.
//

import Foundation

struct WeatherDataStruct {
    let location: String
    let locationWeatherData: [LocationWeatherDataStruct]
}

struct LocationWeatherDataStruct {
    let locationName: String
    let locationTimeOrMyLocation: String
    let locationWeather: String
    let locationTemperature: Int
    let locationHighestTemp: Int
    let locationLowestTemp: Int
}

extension WeatherDataStruct {
    static func dummy() -> [WeatherDataStruct] {
        [WeatherDataStruct(location: "나의 위치", locationWeatherData: [LocationWeatherDataStruct(locationName: "나의 위치", locationTimeOrMyLocation: "서울특별시", locationWeather: "흐림", locationTemperature: 18, locationHighestTemp: 21, locationLowestTemp: 12)]),
         WeatherDataStruct(location: "목동", locationWeatherData: [LocationWeatherDataStruct(locationName: "목동", locationTimeOrMyLocation: "18:51", locationWeather: "맑음", locationTemperature: 20, locationHighestTemp: 30, locationLowestTemp: 10)]),
         WeatherDataStruct(location: "인천", locationWeatherData: [LocationWeatherDataStruct(locationName: "인천", locationTimeOrMyLocation: "18:51", locationWeather: "비옴", locationTemperature: 22, locationHighestTemp: 25, locationLowestTemp: 12)]),
         WeatherDataStruct(location: "천안", locationWeatherData: [LocationWeatherDataStruct(locationName: "천안", locationTimeOrMyLocation: "18:51", locationWeather:"흐림", locationTemperature: 24, locationHighestTemp: 27, locationLowestTemp: 20)])
         
        ]
    }
}
