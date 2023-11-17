//
//  NetworkRequest.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/17/23.
//


import Foundation

struct NetworkRequest {
    let path: String
    let httpMethod: HttpMethod
    let query: Codable?
    let body: Data?
    let header: [String: String]?
    
    init(path: String, httpMethod: HttpMethod, query: Codable? = nil, body: Data? = nil, header: [String : String]? = nil) {
        self.path = path
        self.httpMethod = httpMethod
        self.query = query
        self.body = body
        self.header = header
    }
    
    func makeURLRequest(cityName: String) throws -> URLRequest {
        var urlComponents = URLComponents(string: Config.baseURL)
        
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""

        let queryItemArray = [URLQueryItem(name: "q", value: cityName),
                              URLQueryItem(name: "appid", value: apiKey),
                              URLQueryItem(name: "cnt", value: "14"),
                              URLQueryItem(name: "lang", value: "kr"),
                              URLQueryItem(name: "units", value: "metric")]
        
        urlComponents?.queryItems = queryItemArray
        
        guard let urlRequestURL = urlComponents?.url?.appendingPathComponent(self.path) else {
            throw NetworkError.requstEncodingError
        }
        
        var urlRequest = URLRequest(url: urlRequestURL)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.httpBody = self.body
        return urlRequest
    }
}



