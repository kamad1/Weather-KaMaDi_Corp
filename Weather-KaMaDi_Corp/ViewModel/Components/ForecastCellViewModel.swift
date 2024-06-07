//
//  ForecastCellViewModel.swift
//  WeatherApp
//
//  Created by Влад Мади on 06.06.2024.
//

import Foundation

class ForecastCellViewModel: ObservableObject {
    @Published var forecast: ForecastData.ForecastItem
    init(forecast: ForecastData.ForecastItem) {
        self.forecast = forecast
    }
    
    var windDescription: String { forecast.wind.windDescription }
    var temp: String { "\(Int(forecast.main.temp)) °С" }
    var tempMin: String { "\(Int(forecast.main.tempMin)) °С" }
    var tempMax: String { "\(Int(forecast.main.tempMax)) °С" }
    
    func dateDescrFromUTC(_ utc: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(utc))
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.day, .month, .year],
//                                                 from: date)
//        
//        let str = "\(components.day?.description ?? "").\(components.month?.description ?? "").\(components.year?.description ?? "")"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let str = formatter.string(from: date)
        return str
    }
    
    func timeDescrFromUTC(_ utc: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(utc))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let str = formatter.string(from: date)
        return str
    }
}



