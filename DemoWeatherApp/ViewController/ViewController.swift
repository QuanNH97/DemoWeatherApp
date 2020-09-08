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
    private var mainWeather = Weather() {
        didSet {
            self.hourly = mainWeather.hourly ?? []
            self.daily = mainWeather.daily ?? []
        }
    }
    private var hourly: [Hourly] = []
    private var daily: [Daily] = []
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var simpleDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
        configTableView()
        registerTableViewCell()
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
            if NSTimeIntervalSince1970 > weather.current?.sunset ?? 0 {
                self.backgroundImageView.image = UIImage(named: "night background")
            } else {
                self.backgroundImageView.image = UIImage(named: "clear day background")
            }
            self.weatherTableView.reloadData()
        }
    }
    func updateCity(placeMark: CLPlacemark?) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = placeMark?.locality
        }
    }
    func registerTableViewCell() {
        let temparatureTableViewCell = UINib(nibName: "TemparatureTableViewCell", bundle: nil)
        weatherTableView.register(temparatureTableViewCell, forCellReuseIdentifier: "TemparatureTableViewCell")
        let hourlyTableViewCell = UINib(nibName: "HourlyTableViewCell", bundle: nil)
        weatherTableView.register(hourlyTableViewCell, forCellReuseIdentifier: "HourlyTableViewCell")
        let dailyTableViewCell = UINib(nibName: "DailyTableViewCell", bundle: nil)
        weatherTableView.register(dailyTableViewCell, forCellReuseIdentifier: "DailyTableViewCell")
        let detailWeatherTableViewCell = UINib(nibName: "DetailWeatherTableViewCell", bundle: nil)
        weatherTableView.register(detailWeatherTableViewCell, forCellReuseIdentifier: "DetailWeatherTableViewCell")
    }
    func configTableView() {
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        weatherTableView.separatorStyle = .none
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
            }
        })
        APIService.share.fetchData(location: location, completion: { fetchedData in
            if let fetchedData = fetchedData {
                self.updateUI(with: fetchedData)
                self.mainWeather = fetchedData
            }
        })
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: DailyTableViewCellDelegate {
    func updateTableView() {
        weatherTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TemparatureTableViewCell", for: indexPath) as? TemparatureTableViewCell else { return UITableViewCell() }
            cell.configCell(weather: mainWeather)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyTableViewCell", for: indexPath) as? HourlyTableViewCell else { return UITableViewCell() }
            cell.configCell(hourly: hourly)
            return cell
        case 2, 3, 4, 5, 6, 7, 8, 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell", for: indexPath) as? DailyTableViewCell else { return UITableViewCell() }
            if daily.count != 0 {
                cell.configCell(daily: daily[indexPath.row - 2], indexPath: indexPath)
            }
            return cell
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWeatherTableViewCell", for: indexPath) as? DetailWeatherTableViewCell else { return UITableViewCell() }
            cell.configCell(weather: mainWeather)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TemparatureTableViewCell", for: indexPath) as? TemparatureTableViewCell else { return UITableViewCell() }
            cell.configCell(weather: mainWeather)
            return cell
        }
    }
}
