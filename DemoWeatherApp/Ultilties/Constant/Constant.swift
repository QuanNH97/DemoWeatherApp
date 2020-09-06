//
//  Constant.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/4/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct Constant {
    static let baseURLString = "https://api.openweathermap.org"
    static let path = APIPath().path
    public static let appid = "b4cf0056f60268e79748af15829585b1"
    public static let baseURL = URL(string: Constant.baseURLString + Constant.path)
}
