//
//  ForecastData.swift
//  WeatherApp
//
//  Created by Влад Мади on 06.06.2024.
//

import Foundation

struct ForecastData: Decodable {
    var list: [ForecastItem]
    var cod: String
    var message: Int
    
    struct ForecastItem: Decodable {
        var dt: Int
        var main: Main
        var wind: Wind
        var rain: [String: Double]?
        var snow: [String: Double]?
    }
}
