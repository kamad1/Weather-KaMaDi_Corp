//
//  Endpoint.swift
//  Weather-KaMaDi_Corp
//
//  Created by Jedi on 06.06.2024.
//

import Foundation
// перечисление конечные точки куда идти в урлменеджере расписал
enum Endpoint: String {
    case currentWeather = "/data/2.5/weather"
    case forecast = "/data/2.5/forecast"
}
