//
//  WeatherManager.swift
//  Clima
//
//  Created by Redouane Amour on 14/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let weatherURL : String = "https://api.openweathermap.org/data/2.5/weather?"
    
    func fetchWeatherWithCityName(cityName : String){
        let urlString : String = self.weatherURL + "q=" + cityName + "&appid=981ac2cdcbb0e149ba409ae72a35a026&units=metric"
        performRequest(urlString)
    }
    
    func fetchWeatherWithCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
//        let urlString : String = self.weatherURL + "lat=\(latitude) &lon=\(longitude).1&appid=981ac2cdcbb0e149ba409ae72a35a026&units=metric"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=981ac2cdcbb0e149ba409ae72a35a026&units=metric"
        print("URL: " + urlString + "\n")
        performRequest(urlString)
    }
    
    func performRequest(_ urlString : String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URL session : the URL session works just as a browser
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    let safeDataString = String(data: safeData, encoding: .utf8)
                    print("API Response: " + safeDataString! + "\n")
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4. Start the task (hit enter in the search bar)
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        //weatherData.self équivaut au type de la classe weatherData
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodeData.weather[0].id
            let name = decodeData.name
            let temperature = decodeData.main.temp
            let humidity = decodeData.main.humidity
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temperature, humidity: humidity)
            return weather
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

var weatherManager : WeatherManager = WeatherManager()
