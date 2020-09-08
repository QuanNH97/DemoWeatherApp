//
//  ConvertTemperatureHelper.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/4/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

extension Double {
    func convertKevinToCensius() -> String {
        let censius = self - 273
        return String(format: "%.f°", censius)
    }
}
