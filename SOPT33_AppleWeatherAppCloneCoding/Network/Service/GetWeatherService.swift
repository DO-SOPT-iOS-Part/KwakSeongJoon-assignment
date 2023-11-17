//
//  GetWeatherService.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/13/23.
//

import Foundation

class GetWeatherService {
    static let shared = GetWeatherService()
    private init() {}
    
    func makeRequest(cityName: String) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
        let url = URL(string: baseURL + "/data/2.5/forecast?q=\(cityName)&lang=kr&cnt=14&units=metric&appid=\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "apllication/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getWeatherData(cityName: String) async throws -> WeatherAppData? {
        do{
            let request = self.makeRequest(cityName: cityName)
            let (data, _) = try await URLSession.shared.data(for: request)
            return parseWeatherData(data: data)
        }
        catch {
            throw error
        }
        
    }
    
    func parseWeatherData(data: Data) -> WeatherAppData? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherDataDTO.self, from: data)
            return result.toAppData()
        } catch {
            print(error)
            return nil
        }
    }
}
