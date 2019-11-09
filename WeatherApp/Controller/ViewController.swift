//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jeffrey Qiu on 11/8/19.
//  Copyright © 2019 Jeffrey Qiu. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate,
UITableViewDelegate {
    
    // constants
    let SECRET_KEY = "f672ddd4106d7f83041825d250d48427"
    let DARKSKY_URL = "https://api.darksky.net/forecast/"
    
    let locationManager = CLLocationManager()
    let weatherModel = DarkskyDataModel()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

    // Get Weather Data
    func getWeatherData(url: String, params: [String: String]) {
        if let latitude = params["latitude"], let longitude = params["longitude"] {
            let endpoint = DARKSKY_URL + SECRET_KEY + "/" + latitude + "," + longitude
//        let endpoint = DARKSKY_URL + SECRET_KEY + "/34.0689,-118.4452"
        
            AF.request(endpoint)
                .responseJSON { response in
                
                // check for errors
                    guard response.error == nil else {
                        print("Error in fetching weather data: \(response.error!)")
                        return
                    }
                    
                    if let json = response.value {
//                        print("JSON: \(json)")
                        self.updateWeatherData(json: JSON(json))
                    } else {
                        print("Network Error")
                    }
                
            }
        } else {
            print("Invalid latitude or longitude")
        }
    }
    
    func updateWeatherData(json: JSON) {
        if !json["daily"]["data"][0].isEmpty {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayOfTheWeek = dateFormatter.string(from: date)
            let high = json["daily"]["data"][0]["temperatureHigh"].double!
            let low = json["daily"]["data"][0]["temperatureLow"].double!
            
            weatherModel.temperatureReport = "\(dayOfTheWeek) H:\(Int(high)) L:\(Int(low))"
            weatherModel.forecastCondition = json["currently"]["icon"].stringValue
            updateUI()
        } else {
            print("Weather data is unavailable at the moment")
        }
    }
    
    
    func updateUI() {
        tempLabel.text = "\(weatherModel.temperatureReport)"
        weatherIcon.image = UIImage(named: weatherModel.forecastCondition)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["latitude" : latitude, "longitude" : longitude, "appid" : SECRET_KEY]
            print("params \(params)")
            getWeatherData(url: DARKSKY_URL, params: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    @IBAction func refreshWeather(_ sender: Any) {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
//
//
//        if CLLocationCoordinate2DIsValid(locVal) {
//            cell.weatherData.text = "locations = \(locVal.latitude) \(locVal.longitude)"
//        }
//        return cell
//    }
//
}

