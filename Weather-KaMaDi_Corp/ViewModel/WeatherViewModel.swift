//
//  WeatherViewModel.swift
//  Weather-KaMaDi_Corp
//
//  Created by Jedi on 06.06.2024.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Москва"
    // currentWeather происходит все на главном потоке и обновлять все нужно на главном потоке
    // и это делаем в func getData()
    @Published var currentWeather: CurrentWeatherData?
    
    // создаем переменные для получения данных
    var temp: String { "\(Int(currentWeather?.main.temp ?? 0)) °С" }
    var tempMin: String { "\(Int(currentWeather?.main.tempMin ?? 0)) °С" }
    var tempMax: String { "\(Int(currentWeather?.main.tempMax ?? 0)) °С" }
    var pressure: String { "\(Int(currentWeather?.main.pressure ?? 0) * 750062 / 1000000) мм.рт.ст" }
    var humidity: String { "Влажность \(Int(currentWeather?.main.humidity ?? 0))%" }
    var windSpeed: Int { Int(currentWeather?.wind.speed ?? 0) }
    var windDirection: String {
        guard let degrees = currentWeather?.wind.deg else { return "" }
        switch degrees {
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
    var windDescription: String {"\(windDirection) \(windSpeed) м/с"}
    
    init() {
        getData()
    }
    // Тут мы идем сразу к нашему гонцу NetworkService
    func getData() {
        NetworkService.shared.getCurrentWeather(city: cityName) { result in
            switch result {
            case .success(let weatherData):
                // Вся работа с сетью нужно делать не на главном потоке
                DispatchQueue.main.async { self.currentWeather = weatherData }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

