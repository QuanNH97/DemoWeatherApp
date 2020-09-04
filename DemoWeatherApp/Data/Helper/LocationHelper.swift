//
//  LocationHelper.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationHelper {
    static let location = LocationHelper()
    func getPlace(completion: @escaping (CLPlacemark?) -> Void, location: Location) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: location.lat, longitude: location.lon)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }
            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }
            completion(placemark)
        }
    }
}
