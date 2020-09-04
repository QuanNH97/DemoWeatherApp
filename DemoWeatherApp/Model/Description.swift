//
//  Description.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Description: Codable {
    var descriptionID: Int?
    var main: String?
    var description: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case descriptionID = "id"
        case main
        case description
        case icon
    }
}
