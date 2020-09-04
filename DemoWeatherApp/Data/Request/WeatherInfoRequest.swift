//
//  WeatherInfoRequest.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct WeatherInfoRequest {
    static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/onecall?")
    static let appid = "b4cf0056f60268e79748af15829585b1"
    var query: [String: String]
    var url: URL?
    init(location: Location) {
        self.query = ["lat": String(location.lat), "lon": String(location.lon), "appid": WeatherInfoRequest.appid]
        if let url = WeatherInfoRequest.baseURL?.withQueries(query) {
            self.url = url
        }
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
