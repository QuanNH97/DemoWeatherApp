//
//  Temp.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Temp: Codable {
    var day: Double?
    var min: Double?
    var max: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
    enum CodingKeys: String, CodingKey {
        case day
        case min
        case max
        case night
        case eve
        case morn
    }
}
