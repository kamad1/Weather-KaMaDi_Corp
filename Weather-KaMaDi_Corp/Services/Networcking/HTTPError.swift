//
//  HTTPError.swift
//  WeatherApp
//
//  Created by Влад Мади on 03.06.2024.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, badRequest, badResponce, invalidDecoding, invalidEncoding
}
