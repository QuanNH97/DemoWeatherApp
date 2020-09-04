//
//  FeelsLike.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct FeelLike: Codable {
    var day: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
    enum CodingKeys: String, CodingKey {
        case day
        case night
        case eve
        case morn
    }
}
