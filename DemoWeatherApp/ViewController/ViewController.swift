//
//  ViewController.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/3/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var locationManager = CLLocationManager()
    var location = Location(lat: 0.0, lon: 0.0)
    var city: String = ""
    var weather = Weather()
    
//    @IBOutlet weak var timezoneOffset: UILabel!
//    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
    }
    func setupLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startMonitoringSignificantLocationChanges()
        }
    }
    func updateUI(with weather: Weather) {
        DispatchQueue.main.async {
//            guard let temp = weather.current?.temp else { return }
//            self.temperatureLabel.text = Converter.share.convert(kevin: temp)
        }
    }
    func updateCity(placeMark: CLPlacemark?) {
        DispatchQueue.main.async {
//            self.timezoneOffset.text = placeMark?.locality
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        location.lat = locValue.latitude
        location.lon = locValue.longitude
        LocationHelper.location.getPlace(completion: { placeMark in
            self.updateCity(placeMark: placeMark)
            print(self.location)
            print(placeMark?.locality)
        }, location: location)
        APIService.share.fetchData(completion: { fetchedData in
            self.updateUI(with: fetchedData)
            print(fetchedData)
        }, location: location)
    }
}
