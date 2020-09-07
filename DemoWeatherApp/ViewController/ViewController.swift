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
    private var locationManager = CLLocationManager()
    private var location = Location(lat: 0.0, lon: 0.0)
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var simpleDescriptionLabel: UILabel!
    
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
            self.simpleDescriptionLabel.text = weather.current?.description?[0].main
        }
    }
    func updateCity(placeMark: CLPlacemark?) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = placeMark?.locality
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        location.lat = locValue.latitude
        location.lon = locValue.longitude
        LocationHelper.shared.getPlace(location: location, completion: { placeMark in
            if let placeMark = placeMark {
                self.updateCity(placeMark: placeMark)
                print(self.location)
                print(placeMark.locality ?? "")
            }
        })
        APIService.share.fetchData(location: location, completion: { fetchedData in
            if let fetchedData = fetchedData {
                self.updateUI(with: fetchedData)
                print(fetchedData)
            }
        })
    }
}
