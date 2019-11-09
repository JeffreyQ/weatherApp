//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Jeffrey Qiu on 11/9/19.
//  Copyright © 2019 Jeffrey Qiu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
