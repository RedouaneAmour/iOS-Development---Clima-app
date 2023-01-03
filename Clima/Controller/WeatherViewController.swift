//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        weatherManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        searchTextField.delegate = self
        //le ViewController devient le delegate du searchTextField, cad qu'il va être notifié à chaque fois qu'une action aura lieu sur le textField, le delegate devant être de classe UITextFieldDelegate c'est la raison pour laquelle il a fallu ajouter "UITextFieldDelegate" comme classe à notre ViewController.
    }
    
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
}

// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
    }
    
    //fonction qui permet de définir les instructions dès lors que l'utilisateur appuie sur "enter" plus communément appelé le "return key" (situé en bas à droit du clavier.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    
    //Cette fonction permet d'autoriser ou non (en retournant true or false) le keyboard dismiss et notamment le "endEdditing". Si elle retourne false, la fonction "textFieldDidEndEdditing" n'aura pas lieu.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != "") {
            return true
        }
        else {
            textField.placeholder = "type something"
            return false
        }
    }
    
    
    //cette fonction permet de dire au text field ce qu'il doit faire quand l'utilisateur a terminé sa saisie : en l'occurence ici on lui dit de remettre le champ de text vide pour ne pas garder ce qui a été saisie constamment même après avoir terminé.
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeatherWithCityName(cityName: city)
        }
        searchTextField.text = ""
        searchTextField.placeholder = "Search"
    }
}


// MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.humidityLabel.text = weather.humidityString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Current location:")
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            print("latitude: \(lat)")
            print("longitude: \(long) \n")
            weatherManager.fetchWeatherWithCoordinates(latitude: lat, longitude: long)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Hello Redouane the App failed with error : ")
        print(error)
    }
}

