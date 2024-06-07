//
//  AsyncNetworkService.swift
//  WeatherApp
//
//  Created by Влад Мади on 06.06.2024.
//

import Foundation

class AsyncNetworkService {
    static let shared = AsyncNetworkService(); private init() { }
    private let session = URLSession.shared
    
    func getCurrentWeather(city: String) async throws -> CurrentWeatherData {
        guard let url = URLManager.shared.createURL(city: city, 
                                                    endpoint: .currentWeather)
        else { throw HTTPError.invalidURL }
        let (data, _) = try await session.data(from: url)
        let currentWeather = ParsingService.shared.currentWeather(fromData: data)
        return currentWeather
    }
    
    func getForecast(city: String) async throws -> ForecastData {
        guard let url = URLManager.shared.createURL(city: city,
                                                    endpoint: .forecast) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        let forecast = ParsingService.shared.forecast(fromData: data)
        return forecast
    }
}
