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
        guard let description = hour.description?.first else { return }
        let iconImageName = WeatherIconHelper(description: description).iconImageName
        weatherImageView.image = UIImage(named: iconImageName)
        temparatureLabel.text = hour.temp?.convertKevinToCensius()
        self.backgroundColor = nil
    }
}
