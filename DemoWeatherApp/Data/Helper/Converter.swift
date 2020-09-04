//
//  ConvertTemperatureHelper.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/4/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Converter {
    static let share = Converter()
    func convert(kevin: Double) -> String {
        let censius = kevin - 273
        return String(format: "%.f", censius)
    }
}
