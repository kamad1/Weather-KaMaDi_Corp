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
    @Published var forecast = ForecastData(list: [], cod: "", message: 0)
    
    // создаем переменные для получения данных
    var temp: String { "\(Int(currentWeather?.main.temp ?? 0)) °С" }
    var tempMin: String { "\(Int(currentWeather?.main.tempMin ?? 0)) °С" }
    var tempMax: String { "\(Int(currentWeather?.main.tempMax ?? 0)) °С" }
    var pressure: String { "\(Int(currentWeather?.main.pressure ?? 0) * 750062 / 1000000) мм.рт.ст" }
    var humidity: String { "Влажность \(Int(currentWeather?.main.humidity ?? 0))%" }
    var windDescription: String { currentWeather?.wind.windDescription ?? "" }
    
    var minimumForecastTemp: Int {
        let mins = forecast.list.map { item in
            item.main.tempMin
        }
        
        let min = mins.min()
        return Int(min ?? 0)
    }
    
    var maximumForecastTemp: Int {
        let maxes = forecast.list.map { item in
            item.main.tempMax
        }
        
        let max = maxes.max()
        return Int(max ?? 0)
    }
    
    init() {
        getData()
    }
    // Тут мы идем сразу к нашему гонцу NetworkService
    func getData() {
        Task {
            let currentWeather = try await AsyncNetworkService.shared.getCurrentWeather(city: cityName)
            // Вся работа с сетью нужно делать не на главном потоке
            DispatchQueue.main.async {
                self.currentWeather = currentWeather
            }
        }
        
        Task {
            let forecast = try await AsyncNetworkService.shared.getForecast(city: cityName)
            // Вся работа с сетью нужно делать не на главном потоке
            DispatchQueue.main.async {
                self.forecast = forecast
            }
        }
    }
    
}



