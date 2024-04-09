//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func fetchWeather(for cityUrl: [String], completion: @escaping ([City]) -> Void) {
        
        let group = DispatchGroup()
        var weatherData = [City]()
        
        for url in cityUrl {
            group.enter()
            
            AF.request(url).responseJSON { response in
                guard let data = response.data else { return }
                do {
                    let cityModel = try JSONDecoder().decode(City.self, from: data)
                    weatherData.append(cityModel)
                    group.leave()
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        group.notify(queue: .main) {
            completion(weatherData)
        }
    }
}
    
//    func performRequest(withCity city: URL, completion: @escaping (Result<City, AFError>) -> Void) {
        
            // Метод для получения данных о погоде для всех городов
//            func fetchWeatherData(for cities: [String]) -> Result<[City]> {
//                return Promise { fulfill, reject in
//                    let requests = cities.map { city in
//                        AF.request($0).responseDecodable(of: City.self) { response in
//                            switch response.result {
//                            case .success(let model):
//                                fulfill([model])
//                            case .failure(let error):
//                                reject(error)
//                            }
//                        }
//                    }
//                    
//                    // Ожидаем завершения всех запросов
//                    Promise.all(requests).sink { _ in } receiveValue: { _ in }
//                }
//            }
//        }
        
    
