//
//  Daily.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Daily: Codable {
    var durationTime: Double?
    var sunrise: Double?
    var sunset: Double?
    var temp: Temp?
    var feelLike: FeelLike?
    var pressure: Int?       //ap suat
    var humidity: Int?       //do am
    var dewPoint: Double?
    var windSpeed: Double?
    var windDeg: Int?
    var description: [Description]?
    var clouds: Int?
    var pop: Double?
    var rain: Double? //rain volumn (mm)
    var uvi: Double?
    enum CodingKeys: String, CodingKey {
        case durationTime = "dt"
        case sunrise
        case sunset
        case temp
        case feelLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case description = "weather"
        case clouds
        case pop
        case rain
        case uvi
    }
}
