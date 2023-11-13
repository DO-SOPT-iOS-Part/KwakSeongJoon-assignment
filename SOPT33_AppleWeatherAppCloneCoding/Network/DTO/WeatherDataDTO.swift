//
//  WeatherDataDTO.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/13/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherDataDTO = try? JSONDecoder().decode(WeatherDataDTO.self, from: jsonData)

import Foundation

// MARK: - WeatherDataDTO
struct WeatherDataDTO: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
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
}


extension WeatherDataDTO {
    //서버에서 받아오는 DTO 데이터에서 필요한 것을 앱에서 사용할 AppData 구조체로 보내는 func
    func toAppData() -> WeatherAppData {
        let data = self.weather.map { data in
            WeatherApp(id: data.id, description: data.description, icon: data.icon)
        }
        
        let main = MainApp(temp: Int(self.main.temp), temp_min: Int(self.main.tempMin), temp_max: Int(self.main.tempMax))
        
        return WeatherAppData(weather: data, main: main, name: translateCityNameToKorean(name: self.name), timeZone: makeTimeZoneToTime(timeZone: self.timezone))
    }
        
    //서버에서 주는 timezone을 이용해 지역 시간 구해서 String 값으로 반환하는 function
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
                   "Jeju": "제주",
                   "Busan": "부산"
               ]
               return translations[name] ?? name
           }

    
}



