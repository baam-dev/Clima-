//
//  weatherManager.swift
//  Clima
//
//  Created by Amir Bakhshi on 2021-08-25.
//  Copyright © 2021 Baam Dev. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d4ba171d11b68ee36d96d4ab27c7542a&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
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
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            // 4. start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
}












