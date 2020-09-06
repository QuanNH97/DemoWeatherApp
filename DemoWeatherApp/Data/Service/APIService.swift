//
//  APIService.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

struct APIService {
    static let share = APIService()
    func fetchData(location: Location, completion: @escaping (Weather?) -> Void) {
        guard let url = WeatherInfoRequest(location: location).url else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let result = try jsonDecoder.decode(Weather.self, from: data)
                    completion(result)
                } catch let error {
                    print(error)
                    completion(nil)
                }
            }
            else {
                completion(nil)
                return
            }
        }
        task.resume()
    }
}
