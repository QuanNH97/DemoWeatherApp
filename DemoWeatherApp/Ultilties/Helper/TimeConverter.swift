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
        let time = NSInteger(self)
        let minutes = (time / 60) % 60
        let hours = (time / 3600 + 7) % 24
        return String(format: "%0.2d:%0.2d", hours, minutes)
    }
}
