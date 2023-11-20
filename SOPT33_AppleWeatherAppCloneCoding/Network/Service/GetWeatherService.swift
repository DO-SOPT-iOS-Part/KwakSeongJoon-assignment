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
    
    func getWeatherData(cityName: String) async throws -> WeatherAppData? {
        do{
            let request = try NetworkRequest(path: "/data/2.5/forecast", httpMethod: .get).makeURLRequest(cityName: cityName)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
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
