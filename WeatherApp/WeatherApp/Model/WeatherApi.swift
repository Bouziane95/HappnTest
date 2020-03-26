//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by Bouziane Bey on 26/03/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

import Foundation
import UIKit

class WeatherApi{
    let urlQuery = "http://api.openweathermap.org/data/2.5/forecast?q=Paris&appid=c5c12c9a46b01504d1e3c9c570f5450f"
    
    func getWeatherFromApi(completion: @escaping (Weather?) -> Void){
        let url = URL(string: urlQuery)
        var request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse{
                switch httpResponse.statusCode {
                case 200:
                    guard let data = data else {completion(nil); return}
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        print(jsonObject)
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .secondsSince1970
                        let weather = try decoder.decode(Weather.self, from: jsonData)
                        completion(weather)
                    } catch {
                        print(error)
                        completion(nil)
                    }
                case 404:
                    print("404 Error")
                default: print("Error")
                
                }
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }    
}
