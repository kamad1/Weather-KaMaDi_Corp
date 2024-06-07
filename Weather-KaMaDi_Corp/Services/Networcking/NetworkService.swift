//
//  NetworckService.swift
//  Weather-KaMaDi_Corp
//
//  Created by Jedi on 06.06.2024.
//

import Foundation
// Это гонец тот перевозчик который запросит и привезет данные
class NetworkService {
    static let shared = NetworkService(); private init() {}
  // Создаем сессию возможность нашего гонца это и есть машина которая поедит за данными
    private let session = URLSession.shared
    
    func getCurrentWeather(city: String,
                           completion: @escaping (Result<CurrentWeatherData,
                                                  Error>) -> ()) {
//       №1  Идем к логисту URLManager и спрашиваем дай мне путь куда ехать
        guard let url = URLManager.shared.createURL(city: city,
                                                    endpoint: .currentWeather) else {
            // если не получилось
            completion(.failure(HTTPError.invalidURL))
            return
        }
        // №2   ДЕЛАЕМ ЗАДАЧУ в навигатор с урлом должен получить data или ошибку
        session.dataTask(with: url) { data, response, error in
            guard let data, let response else {
                if let error { completion(.failure(error)) }
                return
            }
            // №3  тут получаем статус код если 200 то все ок
            let statusCode = (response as! HTTPURLResponse).statusCode
            guard statusCode / 100 == 2 else { return }
            
            // №4 Получив все данные от сервера то есть машина вернулась
//            но прочитать их не могу так как они в формате например JSON и мне их надо приобразовать
//            создаем парсинг ParsingService
            // Получаем данные с парсинга сервиса 
            let weather = ParsingService.shared.currentWeather(fromData: data)
            // передаем в комплишен с успешным кейсом
            completion(.success(weather))
            // ниже resume нужен что бы подтолкнуть нашу сессию
        }.resume()
    }
    
    //Ниже повторяем все по аналогии для таблицы как наверху
    func getForecast(city: String,
                     completion: @escaping (Result<ForecastData,
                                            Error>) -> ()) {
        guard let url = URLManager.shared.createURL(city: city, endpoint: .forecast) else {
            completion(.failure(HTTPError.invalidURL))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            guard let data,
                  let response else {
                if let error { completion(.failure(error)) }
                return
            }
            
            let forecast = ParsingService.shared.forecast(fromData: data)
            
            completion(.success(forecast))
        }.resume()
    }
}
    





