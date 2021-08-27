//
//  weatherManager.swift
//  Clima
//
//  Created by Amir Bakhshi on 2021-08-25.
//  Copyright © 2021 Baam Dev. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d4ba171d11b68ee36d96d4ab27c7542a&units=metric"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performReauest(urlString: urlString)
    }

    // Networking starts here:
    func performReauest(urlString: String) {
        // 1. creat a url
        // using if let, meaning craete the constant as long as the input is not nil
        if let url = URL(string: urlString) {

            // 2. create a url Session
            let session = URLSession(configuration: .default)

            // 3. give the session a task
            // completionHandler take in a function that runs while data is being transfered
            let task = session.dataTask(with: url) { data, response, error in

                if error != nil {
                    print(error!)
                    // return keyword >> if there was an error, exit out of this function
                    // going further makes problem bigger
                    return
                }
                // if there was no errors:
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }

            // 4. start the task
            task.resume()
        }
    }

    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }

    }

}












