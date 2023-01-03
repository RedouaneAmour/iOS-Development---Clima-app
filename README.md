
![App Brewery Banner](Documentation/AppBreweryBanner.png)

#  Clima

## My Goal

The purpose of the application is to display weather conditions (temperature, humidity, weather image) according to : 1) the current location of the user using GPS Data from the iPhone or 2) a specific city searching manually for its name using a UITextField. It is a dark-mode enabled application which makes https requests to the OpenWeather Web API to get a JSON-format response with different fields including the temperature, the city name and the humidity.

Therefore, based on UIKit and the Storyboard, the app is composed of several UI elements : 
- a location button. This button is linked to an IBAction called "locationPressed". When pressed, it gets the weather conditions at the current position.
- a UITextField which enables the user to enter a cityname and get its current weather conditions
- a temperature label to display the current temperature (°C) in the city or the current location
- a humidity label to display the current humidity (%) in the city or the current location
- a city name label to display the name of the city 

![Capture d’écran 2023-01-03 à 04 12 41](https://user-images.githubusercontent.com/74780897/210295729-a1de5ed6-761a-4bb2-a9f8-bdefbe5247d3.png)


Here is a general insight of the JSON response : 

![Capture d’écran 2023-01-03 à 04 23 18](https://user-images.githubusercontent.com/74780897/210296360-1954016e-ed64-494d-9877-cd4dc58cb63e.png)


## What I learnt throughout this app :

* How to create a dark-mode enabled app.
* How to use vector images as image assets.
* Learn to use the UITextField to get user input. 
* Learn about the delegate design pattern.
* Swift protocols and extensions. 
* Swift computed properties.
* Swift closures and completion handlers.
* Learn to use URLSession to network and make HTTP requests.
* Parse JSON with the native Encodable and Decodable protocols. 
* Learn to use Grand Central Dispatch to fetch the main thread.
* Learn to use Core Location to get the current location from the phone GPS. 

### Condition Codes
```
switch conditionID {
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
```


![End Banner](Documentation/readme-end-banner.png)
