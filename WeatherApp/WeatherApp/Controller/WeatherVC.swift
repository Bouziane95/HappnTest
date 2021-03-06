//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bouziane Bey on 26/03/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var mainTemp: UILabel!
    @IBOutlet weak var mainWeatherStateImg: UIImageView!
    
    @IBOutlet weak var temp1: UILabel!
    @IBOutlet weak var weatherStateImg1: UIImageView!
    @IBOutlet weak var date1: UILabel!
    
    @IBOutlet weak var temp2: UILabel!
    @IBOutlet weak var weatherStateImg2: UIImageView!
    @IBOutlet weak var date2: UILabel!
    
    @IBOutlet weak var temp3: UILabel!
    @IBOutlet weak var weatherStateImg3: UIImageView!
    @IBOutlet weak var date3: UILabel!
    
    @IBOutlet weak var temp4: UILabel!
    @IBOutlet weak var weatherStateImg4: UIImageView!
    @IBOutlet weak var date4: UILabel!
    
    let weatherApi = WeatherApi()
    let weatherIcon = WeatherIcon()
    var feelsLike: Float?
    var tempMin: Float?
    var tempMax: Float?
    var humidit: Int?
    var windSpeed: Float?
    var deg: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        tapImage()
    }
    
    func tapImage(){
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(moveOnToDetailVC))
        mainWeatherStateImg.isUserInteractionEnabled = true
        mainWeatherStateImg.addGestureRecognizer(imageTap)
    }
    
    @objc func moveOnToDetailVC(_ sender: Any){
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WeatherDetailVC{
            destination.optFeelsTemp = feelsLike
            destination.optHumidity = humidit
            destination.optTempMinimum = tempMin
            destination.optTempMaximum = tempMax
            destination.optWindSpeed = windSpeed
            destination.optWindDegree = deg
        }
    }
    
    func getWeather(){
        weatherApi.getWeatherFromApi { (response) in
            if response != nil {
                if response!.list.count > 0 {
                    DispatchQueue.main.async {
                        let tempKelvin = response?.list[0].main.temp
                        let tempConvertedToCelsius = Int(tempKelvin! - 273.15)
                        self.mainTemp.text = "\(tempConvertedToCelsius)°"
                        self.mainWeatherStateImg.image = UIImage(named: self.weatherIcon.updateWeatherIcon(condition: (response?.list[0].weather[0].icon)!))
                        self.feelsLike = response?.list[0].main.feels_like
                        self.humidit = response?.list[0].main.humidity
                        self.tempMin = response?.list[0].main.temp_min
                        self.tempMax = response?.list[0].main.temp_max
                        self.windSpeed = response?.list[0].wind.speed
                        self.deg = response?.list[0].wind.deg
                        
                        for index in 1...4{
                            let tempKelvin = response?.list[index].main.temp
                            let tempConvertedToCelsius = Int(tempKelvin! - 273.15)
                            
                            let date = response?.list[index].dt
                            let convertDate = NSDate(timeIntervalSince1970: date!)
                            let dateFormatter = DateFormatter()
                            dateFormatter.timeStyle = DateFormatter.Style.medium
                            dateFormatter.timeZone = .current
                            let local = dateFormatter.string(from: convertDate as Date)
                            
                            if index == 1 {
                                self.temp1.text = "\(tempConvertedToCelsius) °"
                                self.weatherStateImg1.image = UIImage(named: self.weatherIcon.updateWeatherIcon(condition: (response?.list[index].weather[0].icon)!))
                                self.date1.text = "\(local)"
                            } else if index == 2 {
                                self.temp2.text = "\(tempConvertedToCelsius) °"
                                self.weatherStateImg2.image = UIImage(named: self.weatherIcon.updateWeatherIcon(condition: (response?.list[index].weather[0].icon)!))
                                self.date2.text = "\(local)"
                            } else if index == 3 {
                                self.temp3.text = "\(tempConvertedToCelsius) °"
                                self.weatherStateImg3.image = UIImage(named: self.weatherIcon.updateWeatherIcon(condition: (response?.list[index].weather[0].icon)!))
                                self.date3.text = "\(local)"
                            } else if index == 4 {
                                self.temp4.text = "\(tempConvertedToCelsius) °"
                                self.weatherStateImg4.image = UIImage(named: self.weatherIcon.updateWeatherIcon(condition: (response?.list[index].weather[0].icon)!))
                                self.date4.text = "\(local)"
                            }
                        }
                    }
                } else {
                    print("error")
                }
            }
        }
    }
}

