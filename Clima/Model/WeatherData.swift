//
//  WeatherData.swift
//  Clima
//
//  Created by Amir Bakhshi on 2021-08-26.
//  Copyright © 2021 Baam Dev. All rights reserved.
//

import Foundation

// this is the top level of that JSON file
// typealias: Codable
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

// mail is a object in JSON file
struct Main: Codable {
    let temp: Double
}
// weather is an array in JSON file
struct Weather: Codable {
    let id: Int
}



