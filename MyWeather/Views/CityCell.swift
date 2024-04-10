//
//  CityCell.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import UIKit

final class CityCell: UICollectionViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTemperatureLabel: UILabel!
    @IBOutlet weak var cityMinMaxTemperatureLabel: UILabel!
    @IBOutlet weak var cityDescriptionLabel: UILabel!
}
