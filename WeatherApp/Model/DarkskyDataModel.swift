//
//  DarkskyDataModel.swift
//  WeatherApp
//
//  Created by Jeffrey Qiu on 11/9/19.
//  Copyright © 2019 Jeffrey Qiu. All rights reserved.
//

import Foundation
import UIKit

class DarkskyDataModel {
    var temperature: Int = 0
    var forecastCondition: String = ""
    var city: String = "Los Angeles"
    
    func updateWeatherIcon(forecastCondition: String) -> Int {
        switch(forecastCondition) {
        case "clear-day":
            return 1
        case "clear-night":
            return 2
        case "rain":
            return 3
        case "snow":
            return 4
        case "sleet":
            return 5
        case "wind":
            return 6
        case "fog":
            return 7
        case "cloudy":
            return 8
        case "partly-cloudy-day":
            return 9
        case "partly-cloudy-night":
            return 10
        default:
            return -1
        }
    }
}
