//
//  WeatherByHourDTO.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/17/23.
//

import Foundation
import UIKit


// MARK: - WeatherDTO
struct WeatherDataDTO: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sys
    let dtTxt: String
    let snow: Rain?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
        case snow
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}


extension WeatherDataDTO {
    //서버에서 받아오는 DTO 데이터에서 필요한 것을 앱에서 사용할 AppData 구조체로 보내는 func
    func toAppData() -> WeatherAppData {
        let listApp = self.list.map { list in
            ListApp(main: MainApp(temp: Int(list.main.temp),
                                  temp_min: Int(list.main.tempMin),
                                  temp_max: Int(list.main.tempMax)),
                    weather: list.weather.map { weather in
                WeatherApp(id: weather.id,
                           weatherDescription: weather.description,
                           icon: iconToImage(icon : weather.icon))
            },
                    dttxt: list.dtTxt)
        }
        
        let cityApp = CityApp(name: translateCityNameToKorean(name: self.city.name),
                              timezone: makeTimeZoneToTime(timeZone: self.city.timezone))
        
        return WeatherAppData(list: listApp, city: cityApp)
    }
    
    //    서버에서 주는 timezone을 이용해 지역 시간 구해서 String 값으로 반환하는 function
    func makeTimeZoneToTime(timeZone: Int) -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: today)
        
    }
    
    //서버에서 주는 지역이름을 한글로 바꾸는 function
    func translateCityNameToKorean(name: String) -> String {
        let translations: [String: String] = [
            "Seoul": "서울",
            "Daejeon": "대전",
            "Cheonan": "천안",
            "Jeju City": "제주",
            "Busan": "부산"
        ]
        return translations[name] ?? name
    }
    
    // String인 icon을 UIImage로 바꾸는 function
    func iconToImage(icon: String) -> UIImage? {
        let translations: [String: UIImage?] = [
            "01d": UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
            "01n": UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
            "02d": UIImage(systemName: "cloud.sun.fill")?.withRenderingMode(.alwaysOriginal),
            "02n": UIImage(systemName: "cloud.sun.fill")?.withRenderingMode(.alwaysOriginal),
            "03d": ImageLiterals.detailView.cloudyImage,
            "03n": ImageLiterals.detailView.cloudyImage,
            "04d": ImageLiterals.detailView.cloudyImage,
            "04n": ImageLiterals.detailView.cloudyImage,
            "09d": ImageLiterals.detailView.rainyImage,
            "09n": ImageLiterals.detailView.rainyImage,
            "10d": ImageLiterals.detailView.rainyImage,
            "10n": ImageLiterals.detailView.rainyImage,
            "11d": ImageLiterals.detailView.ThunderImage,
            "11n": ImageLiterals.detailView.ThunderImage,
            "13n": ImageLiterals.detailView.snowImage,
            "13d": ImageLiterals.detailView.snowImage,
            "50n": ImageLiterals.detailView.rainyAndSunnyImage,
            "50d": ImageLiterals.detailView.rainyAndSunnyImage,
        ]
        return translations[icon] ?? ImageLiterals.detailView.snowImage
        
    }
    
    
}







