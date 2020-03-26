//
//  WeatherDetailVC.swift
//  WeatherApp
//
//  Created by Bouziane Bey on 26/03/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

import UIKit

class WeatherDetailVC: UIViewController {
    
    @IBOutlet weak var feelsLikeTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    
    var optFeelsTemp: Float?
    var optTempMinimum: Float?
    var optTempMaximum: Float?
    var optHumidity: Int?
    var optWindSpeed: Float?
    var optWindDegree: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignData()
    }
    
    func assignData(){
        if let humidityUnwrap = optHumidity, let feelTempUnwrap = optFeelsTemp, let tempMiniUnwrap = optTempMinimum, let tempMaxUnwrap = optTempMaximum, let windSpeedUnwrap = optWindSpeed, let windDirectionUnwrap = optWindDegree {
            
            humidity.text = "Humidité relative : \(humidityUnwrap)%"
            windSpeed.text = "\(windSpeedUnwrap) m/s"
            windDirection.text = "\(windDirectionUnwrap)°"
            
            let feelLikeTempConvertedToCelsius = Int(feelTempUnwrap - 273.15)
            feelsLikeTemp.text = "\(feelLikeTempConvertedToCelsius)°"
            
            let tempMiniConvertedToCelsius = Int(tempMiniUnwrap - 273.15)
            minTemp.text = "Mini : \(tempMiniConvertedToCelsius)°"
            
            let tempMaxiConvertedToCelsius = Int(tempMaxUnwrap - 273.15)
            maxTemp.text = "Max : \(tempMaxiConvertedToCelsius)°"
        }
    }
}
