//
//  URLManager.swift
//  Weather-KaMaDi_Corp
//
//  Created by Jedi on 06.06.2024.
//

import Foundation
// пути из которых мы и составляем тунель сервер и тд
//https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}

// Это класс как Логист и он один всего и планирует все пути и направляет потоки
class URLManager {
    static let shared = URLManager(); private init() {}
    private let apiKey = "9df1096a330304ba2fa1c3836246b265"
    // тунель HTTP HTTPs WebSocket FTP
    private let getaway = "https://"
    // адрес самого сервера
    private let server = "api.openweathermap.org"

    // после getaway и server в адресе добавляем Endpoint которые берем из модели ЮЗЕРЫ, Корзина, Создать Аккаунт- то есть Конечная точка маршрута (РОУТ)
    // в конце добавили &units=metric  это приобразует келвины в цельсий
    func createURL(city: String, endpoint: Endpoint) -> URL? {
        let urlStr = getaway + server + endpoint.rawValue + "?appid=\(apiKey)&q=\(city)&units=metric"
        return URL(string: urlStr)
    }
}

