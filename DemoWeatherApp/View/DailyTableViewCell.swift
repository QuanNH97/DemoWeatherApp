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
        guard let description = daily.description?.first else { return }
        let iconImageName = WeatherIconHelper(description: description).iconImageName
        weatherImageView.image = UIImage(named: iconImageName)
        minTemparatureLabel.text = daily.temp?.min?.convertKevinToCensius()
        maxTemparatureLabel.text = daily.temp?.max?.convertKevinToCensius()
        minTemparatureLabel.textColor = .lightGray
        delegate?.updateTableView()
    }
}
