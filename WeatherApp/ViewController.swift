//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jeffrey Qiu on 11/8/19.
//  Copyright © 2019 Jeffrey Qiu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {
    let locationManager = CLLocationManager()
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            // fetchWeather()
            guard let locVal: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            print("locations = \(locVal.latitude) \(locVal.longitude)")
            
        }
    }

    @IBAction func refreshWeather(_ sender: Any) {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
    }
}

