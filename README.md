
#  Clima

## My Goal

The purpose of the application is to display weather conditions (temperature, humidity, weather image) according to : 1) the current location of the user using GPS Data from the iPhone or 2) a specific city searching manually for its name using a UITextField. It is a dark-mode enabled application which makes https requests to the OpenWeather Web API to get a JSON-format response with different fields including the temperature, the city name and the humidity.

Based on UIKit and the Storyboard, the app is composed of several UI elements : 
- a location button. This button is linked to an IBAction called "locationPressed". When pressed, it gets the weather conditions at the current position.
- a UITextField which enables the user to enter a cityname and get its current weather conditions
- a temperature label to display the current temperature (°C) in the city or the current location
- a humidity label to display the current humidity (%) in the city or the current location
- a city name label to display the name of the city 

Light & Dark modes effects : 

![Capture d’écran 2023-01-03 à 04 35 20](https://user-images.githubusercontent.com/74780897/210297023-8c257142-a231-43d6-b9e3-f7ad9ca42b6e.png)

![Capture d’écran 2023-01-03 à 04 59 56](https://user-images.githubusercontent.com/74780897/210298483-21961cfe-e4c5-4626-8e8f-6351b061a63c.png)


API request : https://api.openweathermap.org/data/2.5/weather?q=Bali&appid=YourAPPID&units=metric

Here is an example of the JSON response given by OpenWeather API when I type a valid URL using my personal key : 

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


### How to use the app :

*if you run the app within a physical device (iPhone) : 
The app will first ask you authorization for allowing access to your current location : select the one option that best corresponds to your preferences.
![Capture d’écran 2023-01-03 à 04 42 00](https://user-images.githubusercontent.com/74780897/210297408-cfe829f3-7a4c-48bf-bb02-e9ed3c3b8bf9.png)

Then, you can either select the current location button (represented by an arrow) to get the weather conditions at your current position or tap manually a city name in the UITextField search bar to get weather conditions in the desired city. When using the UITextField and once you're done typing the city name, make sure to press the return key button "Go" at the right bottom of the keyboard, to get the weather conditions. 

*if you run the app with a simulator :
Same procedure but before running the app, in the simulator device settings, go to the "Features" tab -> "location" and Be careful to select "custom location". It will ask you latitude and longitude of the desired simulated location. Also, when selecting this option, you must go to Xcode and select the "Product" tab -> "Scheme" -> "Edit Scheme" -> "Options". Make sure to tick the "Allow Location simulation" and to choose a default location that corresponds to the custom location previously entered.



#### Condition Codes
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
