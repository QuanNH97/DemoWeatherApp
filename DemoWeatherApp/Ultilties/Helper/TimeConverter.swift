//
//  TimeConverter.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/7/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

extension Double {
    func convertDurationTime() -> String {
        let date = NSDate(timeIntervalSinceReferenceDate: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let localDate = dateFormatter.string(from: date as Date)
        return localDate
    }
}
