//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Jeffrey Qiu on 11/11/19.
//  Copyright © 2019 Jeffrey Qiu. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var weatherSummary: UILabel!
    var weatherModel: DarkskyDataModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        weatherSummary.text = weatherModel?.forecastSummary
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
