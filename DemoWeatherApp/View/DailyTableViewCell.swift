//
//  DailyTableViewCell.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/7/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

protocol DailyTableViewCellDelegate: class {
    func updateTableView()
}

class DailyTableViewCell: UITableViewCell {
    weak var delegate: DailyTableViewCellDelegate?
    
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var maxTemparatureLabel: UILabel!
    @IBOutlet weak var minTemparatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(daily: Daily, indexPath: IndexPath) {
        let numberOfDay = indexPath.row - 2
        dayOfWeekLabel.text = DateFormatter().weekdaySymbols[(Calendar.current.component(.weekday, from: Date()) - 1 + numberOfDay) % 6]
        switch daily.description?.first?.main {
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
        minTemparatureLabel.text = daily.temp?.min?.convert()
        maxTemparatureLabel.text = daily.temp?.max?.convert()
        minTemparatureLabel.textColor = .lightGray
        delegate?.updateTableView()
    }
}
