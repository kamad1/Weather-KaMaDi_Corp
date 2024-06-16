//
//  ParsingService.swift
//  WeatherApp
//
//  Created by Влад Мади on 03.06.2024.
//

import Foundation
// Сервис который приобразует JSON в модель свифта
class ParsingService {
    static let shared = ParsingService(); private init() { }
    private let decoder: JSONDecoder = {
        var decoder = JSONDecoder()
        // конвертация из снейк в верблюжий то есть в джисоне снейк в свифте верблюжий
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    // Принимает и возвращает нужную модель
    func currentWeather(fromData data: Data) -> CurrentWeatherData? {
        try? decoder.decode(CurrentWeatherData.self, from: data)
    }
    // Принимает и возвращает нужную модель для таблицы 
    func forecast(fromData data: Data) -> ForecastData? {
        try? decoder.decode(ForecastData.self, from: data)
    }
    
}
