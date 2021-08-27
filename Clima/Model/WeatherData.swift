//
//  WeatherData.swift
//  Clima
//
//  Created by Amir Bakhshi on 2021-08-26.
//  Copyright © 2021 Baam Dev. All rights reserved.
//

import Foundation

// this is the top level of that JSON file
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: sys
}

// mail is a object in JSON file
struct Main: Decodable {
    let temp: Double
}
// weather is an array in JSON file
struct Weather: Decodable {
    let id: Int
}

struct sys: Decodable {
    let country: String
}


