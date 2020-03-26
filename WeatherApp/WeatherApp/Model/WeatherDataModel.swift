//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Bouziane Bey on 26/03/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

import Foundation

struct Weather: Codable{
    let list : [ListWeather]
}
struct ListWeather: Codable{
    let main : WeatherTemp
    let weather : [WeatherCondition]
    let dt : Date
    let wind : Wind
}

struct WeatherTemp: Codable{
    let temp : Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let humidity: Int
}

struct WeatherCondition: Codable{
    let description: String
    let icon: String
}

struct Wind: Codable{
    let speed : Float
    let deg : Int
}
