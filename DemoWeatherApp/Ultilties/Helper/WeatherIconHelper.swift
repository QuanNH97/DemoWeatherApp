//
//  GetWeatherIcon.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/8/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct WeatherIconHelper {
    var iconImageName: String
    init(description: Description) {
        switch description.main {
        case WeatherDescription.clouds.rawValue:
            iconImageName = "cloudy"
        case WeatherDescription.rain.rawValue:
            iconImageName = "rain"
        case WeatherDescription.thunderstorm.rawValue :
            iconImageName = "heavy rain"
        case WeatherDescription.drizzle.rawValue :
            iconImageName = "rain"
        case WeatherDescription.snow.rawValue :
            iconImageName = "snow"
        case WeatherDescription.clear.rawValue :
            iconImageName = "sunny"
        default:
            iconImageName = ""
        }
    }
}
