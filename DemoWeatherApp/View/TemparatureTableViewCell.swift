//
//  TemparatureTableViewCell.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/7/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class TemparatureTableViewCell: UITableViewCell {
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var afternoonTempLabel: UILabel!
    @IBOutlet weak var nightTempLabel: UILabel!
    
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
        temparatureLabel.text = " " + (weather.current?.temp?.convertKevinToCensius() ?? "")
        afternoonTempLabel.text = "C:" + (weather.hourly?[14].temp?.convertKevinToCensius() ?? "")
        nightTempLabel.text = "T:" + (weather.hourly?[1].temp?.convertKevinToCensius() ?? "")
        self.backgroundColor = nil
    }
}
