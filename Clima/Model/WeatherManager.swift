//
//  weatherManager.swift
//  Clima
//
//  Created by Amir Bakhshi on 2021-08-25.
//  Copyright © 2021 Baam Dev. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=d4ba171d11b68ee36d96d4ab27c7542a&units=metric"
    
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handler(data:response:error:))
            task.resume()
        }
        
        
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let dataSafe = data {
            let dataString = String(data: dataSafe, encoding: .utf8)
            print(dataString)
        }
    }
    
}








