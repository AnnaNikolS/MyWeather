//
//  City.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import Foundation
import UIKit

var cityLink = [
    "https://api.openweathermap.org/data/2.5/weather?lat=55.751521&lon=37.615664&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70",
    
    "https:api.openweathermap.org/data/2.5/weather?lat=43.592616&lon=39.726791&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12",
    
    "https://api.openweathermap.org/data/2.5/weather?lat=59.940247&lon=30.318543&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12",
    
    "https://api.openweathermap.org/data/2.5/weather?lat=45.038506&lon=38.971891&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70"
]

enum WeatherTitle: CaseIterable {
    case sunrise
    case sunset
    case speedWind
    case feelsLike
    case humidity
    case pressure
    
    var title: String {
        switch self {
        case .sunrise:
            return "ВОСХОД СОЛНЦА"
        case .sunset:
            return "ЗАХОД СОЛНЦА"
        case .speedWind:
            return "СКОРОСТЬ ВЕТРА"
        case .feelsLike:
            return "ОЩУЩАЕТСЯ КАК"
        case .humidity:
            return "ВЛАЖНОСТЬ"
        case .pressure:
            return "ДАВЛЕНИЕ"
        }
    }
}

enum WeatherItem: CaseIterable {
    case sunrise
    case sunset
    case speedWind
    case feelsLike
    case humidity
    case pressure
    
    var item: UIImage {
        switch self {
        case .sunrise:
            return UIImage(systemName: "sunrise.fill")!
        case .sunset:
            return UIImage(systemName: "sunset.fill")!
        case .speedWind:
            return UIImage(systemName: "wind")!
        case .feelsLike:
            return UIImage(systemName: "thermometer.variable.and.figure")!
        case .humidity:
            return UIImage(systemName: "humidity.fill")!
        case .pressure:
            return UIImage(systemName: "gauge.with.dots.needle.50percent")!
        }
    }
}

// MARK: - City
struct City: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let sys: Sys
    let timezone, id: Int
    let name: String
}

// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Decodable {
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Decodable {
    let description: String
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
}
