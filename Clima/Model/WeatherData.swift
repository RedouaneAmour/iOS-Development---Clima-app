//
//  WeatherData.swift
//  Clima
//
//  Created by Redouane Amour on 15/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//


import Foundation
//Le protocole codable est un alias permettant de réunir plusieurs protocoles : decodable & encodable
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable{
    let id: Int
}
