//
//  Weather.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var lat: Double?
    var lon: Double?
    var timeZone: String?
    var timeZoneOffset: Int?
    var current: Current? 
    var hourly: [Hourly]?
    var daily: [Daily]?
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case timeZone = "timezone"
        case timeZoneOffset = "timezone_offset"
        case current
        case hourly
        case daily
    }
}
