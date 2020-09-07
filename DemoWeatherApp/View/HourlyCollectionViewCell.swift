//
//  HourlyCollectionViewCell.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/7/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(hour: Hourly, indexPath: IndexPath) {
        let currentHour = Calendar.current.component(.hour, from: Date())
        hourLabel.text = indexPath.row == 0 ? "Now" : "\((currentHour + indexPath.row) % 24)"
        switch hour.description?.first?.main {
        case "Clouds":
            weatherImageView.image = UIImage(named: "cloudy")
        case "Rain":
            weatherImageView.image = UIImage(named: "rain")
        case "Thunderstorm" :
            weatherImageView.image = UIImage(named: "heavy rain")
        case "Drizzle" :
            weatherImageView.image = UIImage(named: "rain")
        case "Snow" :
            weatherImageView.image = UIImage(named: "snow")
        case "Clear" :
            weatherImageView.image = UIImage(named: "sunny")
        default:
            weatherImageView.image = nil
        }
        temparatureLabel.text = hour.temp?.convert()
        self.backgroundColor = nil
    }
}
