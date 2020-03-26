//
//  WeatherIcon.swift
//  WeatherApp
//
//  Created by Bouziane Bey on 26/03/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

import Foundation

class WeatherIcon{
    
    var condition : String = ""
    
    func updateWeatherIcon(condition : String) -> String{
           
           switch (condition) {
               
           case "01d" :
               return "01d"
               
           case "01n" :
               return "01d"
               
           case "02d" :
               return "02d"
               
           case "02n" :
               return "02d"
               
           case "03d" :
               return "03d"
               
           case "03n" :
               return "03d"
               
           case "04d" :
               return "04d"
               
           case "04n" :
               return "04d"
               
           case "09d" :
               return "09d"
               
           case "09n" :
               return "09d"
               
           case "10d" :
               return "10d"
               
           case "10n" :
               return "10d"
               
           case "11d" :
               return "11d"
               
           case "11n" :
               return "11d"
               
           case "13d" :
               return "13d"
               
           case "13n" :
               return "13d"
               
           case "50d" :
               return "50d"
               
           case "50n" :
               return "50d"
               
           default :
               return "Unavailable"
           }
       }
}
