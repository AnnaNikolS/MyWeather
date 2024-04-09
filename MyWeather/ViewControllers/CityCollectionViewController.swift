//
//  CityCollectionViewController.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import UIKit

final class CityCollectionViewController: UICollectionViewController {
  
    var cityLink = [
        "https://api.openweathermap.org/data/2.5/weather?lat=55.755864&lon=37.617698&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70",
        
        "https:api.openweathermap.org/data/2.5/weather?lat=43.585472&lon=39.723098&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12",
        
        "https://api.openweathermap.org/data/2.5/weather?lat=59.938784&lon=30.314997&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12",
        
        "https://api.openweathermap.org/data/2.5/weather?lat=45.035470&lon=38.975313&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70"
        
    ]
    
    //    enum CityLink: CaseIterable {
    //        case moscow
    //        case sochi
    //        case piter
    //        case krasnodar
    //
    //        var url: URL {
    //            switch self {
    //            case .moscow:
    //                return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=55.755864&lon=37.617698&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70")!
    //            case .sochi:
    //                return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=43.585472&lon=39.723098&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12")!
    //            case .piter:
    //                return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=59.938784&lon=30.314997&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12")!
    //            case .krasnodar:
    //                return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=45.035470&lon=38.975313&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70")!
    //            }
    //        }
    //    }
    //
    //
    private var weatherData = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.putGradientCollectionVC()
        collectionView.backgroundColor = .clear
        NetworkManager.shared.fetchWeather(for: cityLink) { models in
            self.weatherData = models
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherData.count
        
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath)
        
        guard let cell = cell as? CityCell else { return UICollectionViewCell() }
        let weatherData = weatherData[indexPath.item]
        
        cell.cityNameLabel.text = weatherData.name
        if weatherData.name == "Новая Голландия" {
            cell.cityNameLabel.text = "Санкт-Петербург"
        }
        cell.cityDescriptionLabel.text = weatherData.weather.map { $0.description }.formatted()
        let maxTemp = Int(weatherData.main.tempMax.rounded())
        let minTemp = Int(weatherData.main.tempMin.rounded())
        cell.cityMinMaxTemperatureLabel.text = "Макс.: \(maxTemp)°, мин.: \(minTemp)°"
        cell.cityTemperatureLabel.text = String(Int(weatherData.main.temp.rounded())) + "°"
        
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
        
        cell.layer.cornerRadius = 20
        return cell
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


