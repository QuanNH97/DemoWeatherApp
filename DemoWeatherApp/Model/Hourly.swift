//
//  Hourly.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Hourly: Codable {
    var durationTime: Double?
    var temp: Double?
    var feelLike: Double?
    var pressure: Int?    //ap suat
    var humidity: Int?       //do am
    var dewPoint: Double?
    var clouds: Int?
    var visibility: Int?     //tam nhin xa
    var windSpeed: Double?
    var windDeg: Int?
    var description: [Description]?
    var pop: Double?
    enum CodingKeys: String, CodingKey {
        case durationTime = "dt"
        case temp
        case feelLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case description = "weather"
        case pop
    }
}
