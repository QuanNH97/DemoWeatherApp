//
//  HourlyTableViewCell.swift
//  DemoWeatherApp
//
//  Created by Quan Nguyen on 9/7/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    private var hourly: [Hourly] = [] {
        didSet {
            hourlyCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCollectionView()
        registerCollectionViewCell()
        selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configCollectionView() {
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
    }
    func configCell(hourly: [Hourly]) {
        self.hourly = hourly
        self.backgroundColor = nil
    }
    func registerCollectionViewCell() {
        let hourlyCollectionViewCell = UINib(nibName: "HourlyCollectionViewCell", bundle: nil)
        hourlyCollectionView.register(hourlyCollectionViewCell, forCellWithReuseIdentifier: "HourlyCollectionViewCell")
    }
}

extension HourlyTableViewCell: UICollectionViewDelegate {}

extension HourlyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourly.count - 24
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as? HourlyCollectionViewCell
            else { return UICollectionViewCell() }
        cell.configCell(hour: hourly[indexPath.row], indexPath: indexPath)
        return cell
    }
}
