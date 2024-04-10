//
//  MoreCityCell.swift
//  MyWeather
//
//  Created by Анна on 09.04.2024.
//

import UIKit

final class MoreCityCell: UICollectionViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var titleCellLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    
    func configure(with weather: WeatherTitle, with item: WeatherItem) {
        titleCellLabel.text = weather.title
        imageCell.image = item.item
    }
}
