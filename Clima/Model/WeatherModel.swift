//
//  weatherModel.swift
//  Clima
//
//  Created by Redouane Amour on 16/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double // stored properties
    var temperatureString: String {
        return String(format: "%.1f", self.temperature)
    }
    let humidity: Int //Stored property
    var humidityString: String {
        return String(self.humidity)
    }
    
    // computed properties : always var cause the value is always going to change depending on the computation. It the body of the computed property always has to return a value.
    var conditionName: String {
        switch self.conditionID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
}
