//
//  WeatherListByLocationInfoModel.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/19.
//

import UIKit

struct WeatherDataStruct {
    let locationName: String
    let locationTimeOrMyLocation: String
    let locationWeather: String
    let locationTemperature: Int
    let locationHighestTemp: Int
    let locationLowestTemp: Int
    let weatherDescription: String
    let detailWeatherByHour: [WeatherInfoByHour]
    let tenDayWeather: [TendayWeatherInfo]
    
}

struct WeatherInfoByHour {
    let time: String
    let weatherImage: WeatherStatusImage
    let tempByHour: Int
}

struct TendayWeatherInfo {
    let day: String
    let weatherImage: WeatherStatusImage
    let rainyPercent: Int?
    let lowTemp: Int
    let weatherProgressImage: WeatherStatusImage
    let highTemp: Int
}

enum WeatherStatusImage {
    case cloudy
    case rainy
    case snowy
    case thundery
    case rainyAfterSunny
    
    func weatherImage() -> UIImage {
        switch self {
        case .cloudy: return ImageLiterals.detailView.cloudyImage
        case .rainy: return ImageLiterals.detailView.rainyImage
        case .snowy: return ImageLiterals.detailView.snowImage
        case .thundery: return ImageLiterals.detailView.ThunderImage
        case .rainyAfterSunny: return ImageLiterals.detailView.rainyAndSunnyImage
        }
    }
}

extension WeatherDataStruct {
    static func dummy() -> [WeatherDataStruct] {
        [
            WeatherDataStruct(locationName: "나의 위치", locationTimeOrMyLocation: "서울특별시", locationWeather: "흐림", locationTemperature: 18, locationHighestTemp: 30, locationLowestTemp: 12, weatherDescription: "00:00~02:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다.", detailWeatherByHour: [
                WeatherInfoByHour(time: "Now", weatherImage: .cloudy, tempByHour: 10),
                WeatherInfoByHour(time: "02시", weatherImage: .rainy, tempByHour: 12),
                WeatherInfoByHour(time: "04시", weatherImage: .rainy, tempByHour: 14),
                WeatherInfoByHour(time: "06시", weatherImage: .rainyAfterSunny, tempByHour: 16),
                WeatherInfoByHour(time: "08시", weatherImage: .cloudy, tempByHour: 18),
                WeatherInfoByHour(time: "10시", weatherImage: .rainyAfterSunny, tempByHour: 20),
                WeatherInfoByHour(time: "12시", weatherImage: .thundery, tempByHour: 22),
                WeatherInfoByHour(time: "14시", weatherImage: .snowy, tempByHour: 24),
                WeatherInfoByHour(time: "16시", weatherImage: .cloudy, tempByHour: 26),
                WeatherInfoByHour(time: "18시", weatherImage: .thundery, tempByHour: 28)
            ], tenDayWeather: [
                TendayWeatherInfo(day: "오늘", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 13, weatherProgressImage: .rainyAfterSunny, highTemp: 21),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 14, weatherProgressImage: .rainyAfterSunny, highTemp: 22),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: 60, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 23),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: 70, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 24),
                TendayWeatherInfo(day: "목", weatherImage: .cloudy, rainyPercent: 40, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 25),
                TendayWeatherInfo(day: "금", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 26),
                TendayWeatherInfo(day: "토", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 19, weatherProgressImage: .rainyAfterSunny, highTemp: 27),
                TendayWeatherInfo(day: "일", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 28),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 29),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 30),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 31)
            ]),
            WeatherDataStruct(locationName: "목동", locationTimeOrMyLocation: "01:00", locationWeather: "흐림", locationTemperature: 19, locationHighestTemp: 32, locationLowestTemp: 12, weatherDescription: "00:00~02:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다.", detailWeatherByHour: [
                WeatherInfoByHour(time: "Now", weatherImage: .rainy, tempByHour: 10),
                WeatherInfoByHour(time: "02시", weatherImage: .rainy, tempByHour: 12),
                WeatherInfoByHour(time: "04시", weatherImage: .cloudy, tempByHour: 14),
                WeatherInfoByHour(time: "06시", weatherImage: .cloudy, tempByHour: 16),
                WeatherInfoByHour(time: "08시", weatherImage: .cloudy, tempByHour: 18),
                WeatherInfoByHour(time: "10시", weatherImage: .cloudy, tempByHour: 20),
                WeatherInfoByHour(time: "12시", weatherImage: .cloudy, tempByHour: 22),
                WeatherInfoByHour(time: "14시", weatherImage: .cloudy, tempByHour: 24),
                WeatherInfoByHour(time: "16시", weatherImage: .cloudy, tempByHour: 26),
                WeatherInfoByHour(time: "18시", weatherImage: .cloudy, tempByHour: 28)
            ], tenDayWeather: [
                TendayWeatherInfo(day: "오늘", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 13, weatherProgressImage: .rainyAfterSunny, highTemp: 21),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 14, weatherProgressImage: .rainyAfterSunny, highTemp: 22),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: 60, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 23),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: 70, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 24),
                TendayWeatherInfo(day: "목", weatherImage: .cloudy, rainyPercent: 40, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 25),
                TendayWeatherInfo(day: "금", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 26),
                TendayWeatherInfo(day: "토", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 19, weatherProgressImage: .rainyAfterSunny, highTemp: 27),
                TendayWeatherInfo(day: "일", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 28),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 29),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 30),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 31)
            ]),
            WeatherDataStruct(locationName: "인천", locationTimeOrMyLocation: "01:00", locationWeather: "맑아짐", locationTemperature: 20, locationHighestTemp: 34, locationLowestTemp: 12, weatherDescription: "00:00~02:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다.", detailWeatherByHour: [
                WeatherInfoByHour(time: "Now", weatherImage: .rainyAfterSunny, tempByHour: 10),
                WeatherInfoByHour(time: "02시", weatherImage: .rainyAfterSunny, tempByHour: 12),
                WeatherInfoByHour(time: "04시", weatherImage: .cloudy, tempByHour: 14),
                WeatherInfoByHour(time: "06시", weatherImage: .cloudy, tempByHour: 16),
                WeatherInfoByHour(time: "08시", weatherImage: .cloudy, tempByHour: 18),
                WeatherInfoByHour(time: "10시", weatherImage: .cloudy, tempByHour: 20),
                WeatherInfoByHour(time: "12시", weatherImage: .cloudy, tempByHour: 22),
                WeatherInfoByHour(time: "14시", weatherImage: .cloudy, tempByHour: 24),
                WeatherInfoByHour(time: "16시", weatherImage: .cloudy, tempByHour: 26),
                WeatherInfoByHour(time: "18시", weatherImage: .cloudy, tempByHour: 28)
            ], tenDayWeather: [
                TendayWeatherInfo(day: "오늘", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 13, weatherProgressImage: .rainyAfterSunny, highTemp: 21),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 14, weatherProgressImage: .rainyAfterSunny, highTemp: 22),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: 60, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 23),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: 70, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 24),
                TendayWeatherInfo(day: "목", weatherImage: .cloudy, rainyPercent: 40, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 25),
                TendayWeatherInfo(day: "금", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 26),
                TendayWeatherInfo(day: "토", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 19, weatherProgressImage: .rainyAfterSunny, highTemp: 27),
                TendayWeatherInfo(day: "일", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 28),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 29),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 30),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 31)
            ]),
            WeatherDataStruct(locationName: "부산", locationTimeOrMyLocation: "01:00", locationWeather: "천둥", locationTemperature: 21, locationHighestTemp: 36, locationLowestTemp: 12, weatherDescription: "00:00~02:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다.", detailWeatherByHour: [
                WeatherInfoByHour(time: "Now", weatherImage: .thundery, tempByHour: 10),
                WeatherInfoByHour(time: "02시", weatherImage: .thundery, tempByHour: 12),
                WeatherInfoByHour(time: "04시", weatherImage: .cloudy, tempByHour: 14),
                WeatherInfoByHour(time: "06시", weatherImage: .cloudy, tempByHour: 16),
                WeatherInfoByHour(time: "08시", weatherImage: .cloudy, tempByHour: 18),
                WeatherInfoByHour(time: "10시", weatherImage: .cloudy, tempByHour: 20),
                WeatherInfoByHour(time: "12시", weatherImage: .cloudy, tempByHour: 22),
                WeatherInfoByHour(time: "14시", weatherImage: .cloudy, tempByHour: 24),
                WeatherInfoByHour(time: "16시", weatherImage: .cloudy, tempByHour: 26),
                WeatherInfoByHour(time: "18시", weatherImage: .cloudy, tempByHour: 28)
            ], tenDayWeather: [
                TendayWeatherInfo(day: "오늘", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 13, weatherProgressImage: .rainyAfterSunny, highTemp: 21),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 14, weatherProgressImage: .rainyAfterSunny, highTemp: 22),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: 60, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 23),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: 70, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 24),
                TendayWeatherInfo(day: "목", weatherImage: .cloudy, rainyPercent: 40, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 25),
                TendayWeatherInfo(day: "금", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 26),
                TendayWeatherInfo(day: "토", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 19, weatherProgressImage: .rainyAfterSunny, highTemp: 27),
                TendayWeatherInfo(day: "일", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 15, weatherProgressImage: .rainyAfterSunny, highTemp: 28),
                TendayWeatherInfo(day: "월", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 16, weatherProgressImage: .rainyAfterSunny, highTemp: 29),
                TendayWeatherInfo(day: "화", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 17, weatherProgressImage: .rainyAfterSunny, highTemp: 30),
                TendayWeatherInfo(day: "수", weatherImage: .cloudy, rainyPercent: nil, lowTemp: 18, weatherProgressImage: .rainyAfterSunny, highTemp: 31)
            ])]
    }
}


