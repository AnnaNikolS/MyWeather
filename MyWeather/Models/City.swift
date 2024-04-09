//
//  City.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import Foundation

//var cityLink = [
//    "https://api.openweathermap.org/data/2.5/weather?lat=55.755864&lon=37.617698&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70",
//    
//    "https:api.openweathermap.org/data/2.5/weather?lat=43.585472&lon=39.723098&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12",
//    
//    "https://api.openweathermap.org/data/2.5/weather?lat=59.938784&lon=30.314997&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12",
//    
//    "https://api.openweathermap.org/data/2.5/weather?lat=45.035470&lon=38.975313&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70"
//    
//]

//enum CityLink: CaseIterable {
//    case moscow
//    case sochi
//    case piter
//    case krasnodar
//    
//    var url: URL {
//        switch self {
//        case .moscow:
//            return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=55.755864&lon=37.617698&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70")!
//        case .sochi:
//            return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=43.585472&lon=39.723098&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12")!
//        case .piter:
//            return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=59.938784&lon=30.314997&units=metric&lang=ru&appid=2facd6704941d5124ba835d8dc90db12")!
//        case .krasnodar:
//            return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=45.035470&lon=38.975313&units=metric&lang=ru&appid=826e886dca4cc78c7a790f83d2366f70")!
//        }
//    }
//}


// MARK: - Welcome
struct City: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
}

// MARK: - Coord
struct Coord: Decodable {
    let lon, lat: Double
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
    let id: Int
    let main: String
    let description: String
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
}
