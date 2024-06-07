//
//  CurrentWeatherData.swift
//  Weather-KaMaDi_Corp
//
//  Created by Jedi on 06.06.2024.
//
//Температура
//Мин. температура
//макс. температура
//Давление
//Влажность
//скорость ветра
//Направление ветра

import Foundation

struct CurrentWeatherData: Decodable {
    var main: Main
    var wind: Wind
    var cod: Int
}

struct Main: Decodable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Int
    var humidity: Int
}

struct Wind: Decodable {
    var speed: Double
    var deg: Double
    
    var windDirection: String {
        switch deg {
        case 22.5...67.5: return "СВ"
        case 67.5...112.5: return "В"
        case 112.5...157.5 : return "ЮВ"
        case 157.5...202.5: return "Ю"
        case 202.5...247.5: return "ЮЗ"
        case 247.5...292.5: return "З"
        case 292.5...337.5: return "СЗ"
        default: return "С"
        }
    }
    var windDescription: String {"\(windDirection) \(Int(speed)) м/с"}
}
