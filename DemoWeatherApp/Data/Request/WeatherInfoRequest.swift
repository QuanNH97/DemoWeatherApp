//
//  WeatherInfoRequest.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct WeatherInfoRequest {
    var query: [String: String]
    var url: URL?
    init(location: Location) {
        self.query = [APIParamKeys.lat.rawValue: String(location.lat), APIParamKeys.lon.rawValue: String(location.lon), APIParamKeys.appid.rawValue: Constant.appid]
        if let url = Constant.baseURL?.withQueries(query) {
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
