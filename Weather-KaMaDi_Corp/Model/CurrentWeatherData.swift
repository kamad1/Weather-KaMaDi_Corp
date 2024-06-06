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
    }
}
