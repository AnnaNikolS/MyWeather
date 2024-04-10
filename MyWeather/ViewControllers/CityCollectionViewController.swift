//
//  CityCollectionViewController.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import UIKit

final class CityCollectionViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private var weatherData = [City]()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.putGradientCollectionVC()
        collectionView.backgroundColor = .clear
        fetchData()
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherData.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath)
        
        guard let cell = cell as? CityCell else { return UICollectionViewCell() }
        
        let weatherData = weatherData[indexPath.item]
        
        let maxTemp = Int(weatherData.main.tempMax.rounded())
        let minTemp = Int(weatherData.main.tempMin.rounded())
        
        cell.cityNameLabel.text = weatherData.name
        if weatherData.name == "Новая Голландия" {
            cell.cityNameLabel.text = "Санкт-Петербург"
        }
        cell.cityDescriptionLabel.text = weatherData.weather.map { $0.description }.formatted()
        cell.cityMinMaxTemperatureLabel.text = "Макс.: \(maxTemp)°, мин.: \(minTemp)°"
        cell.cityTemperatureLabel.text = String(Int(weatherData.main.temp.rounded())) + "°"
        
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        cell.layer.borderWidth = 0.75
        cell.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MoreCityCollectionViewController, let indexPath = collectionView!.indexPathsForSelectedItems?.first {
            destination.cities = weatherData[indexPath.item]
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CityCollectionViewController: UICollectionViewDelegateFlowLayout {
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

// MARK: - Networking 
extension CityCollectionViewController {
    func fetchData() {
        NetworkManager.shared.fetchWeather(for: cityLink) { models in
            switch models {
            case .success(let weatherCities):
                self.weatherData = weatherCities
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}


