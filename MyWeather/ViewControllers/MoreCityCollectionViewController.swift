//
//  MoreCityCollectionViewController.swift
//  MyWeather
//
//  Created by Анна on 09.04.2024.
//

import UIKit

final class MoreCityCollectionViewController: UICollectionViewController {
    
    // MARK: - Public Properties
    var cities: City?
    
    // MARK: - Private Properties
    private var weatherData: [String] = []
    private var isDataLoaded = false
    private let weatherTitles = WeatherTitle.allCases
    private let weatherItems = WeatherItem.allCases
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        view.putGradientCollectionVC()
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherTitles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreCityCell", for: indexPath)
        
        guard let cell = cell as? MoreCityCell else { return UICollectionViewCell() }
        
        title = cities?.name
        if cities?.name == "Новая Голландия" {
            title = "Санкт-Петербург"
        }
        
        let title = weatherTitles[indexPath.item]
        let item = weatherItems[indexPath.item]
        cell.configure(with: title, with: item)
        
        let sunrise = self.unixTimeToLocalTime(unixTime: Int64(cities?.sys.sunrise ?? 0))
        let sunset = self.unixTimeToLocalTime(unixTime: Int64(cities?.sys.sunset ?? 0))
        let speed = Int(cities?.wind.speed.rounded() ?? 0)
        let feelsLike = Int(cities?.main.feelsLike.rounded() ?? 0)
        let pressure = Int(( Double(cities?.main.pressure ?? 0) / 1.333).rounded())
        self.weatherData = [String(describing: sunrise),
                            String(describing: sunset),
                            String(describing: "\(speed) м/с"),
                            String(describing: "\(feelsLike)°"),
                            String(describing: "\(cities?.main.humidity ?? 0)%"),
                            String(describing: pressure)]
        self.isDataLoaded = true
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        if self.isDataLoaded && self.weatherData.indices.contains(indexPath.item) {
            cell.dataLabel.text = self.weatherData[indexPath.item]
        } else {
            cell.dataLabel.text = "-"
        }
        
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        cell.layer.borderWidth = 0.75
        cell.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension MoreCityCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: collectionView.bounds.width - 32,
            height: collectionView.bounds.width / 2 - 80
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}

