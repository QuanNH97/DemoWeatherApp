//
//  DetailWeatherTableViewCell.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/7/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class DetailWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var changeOfRainLabel: UILabel!
    @IBOutlet weak var hummidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var rainVolumnLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var uviLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(weather: Weather) {
        sunriseLabel.text = weather.current?.sunrise?.convertDurationTime()
        sunsetLabel.text = weather.current?.sunset?.convertDurationTime()
        hummidityLabel.text = "\(weather.current?.humidity ?? 0)"
        windSpeedLabel.text = "\(weather.current?.windSpeed ?? 0) km/h"
        hummidityLabel.text = "\(weather.current?.humidity ?? 0) %"
        feelLikeLabel.text = weather.current?.feelLike?.convertKevinToCensius()
        rainVolumnLabel.text = "\((weather.daily?.first?.rain ?? 0) / 100) cm"
        visibilityLabel.text = "\((weather.current?.visibility ?? 0) / 1000) km"
        uviLabel.text = "\(weather.current?.uvi ?? 0)"
        pressureLabel.text = "\(weather.current?.pressure ?? 0) hPa"
        changeOfRainLabel.text = "\(Int((weather.hourly?.first?.pop ?? 0) * 100)) %"
    }
}
