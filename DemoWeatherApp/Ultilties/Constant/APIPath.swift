//
//  APIPath.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/4/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct APIPath {
    var data = "/data"
    var version = "/2.5"
    var oneCall = "/onecall?"
    var path: String
    init() {
        path = data + version + oneCall
    }
}
