//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchWeather(for cityUrl: [String], completion: @escaping (Result<[City], NetworkError>) -> Void) {
        
        let group = DispatchGroup()
        var weatherData = [City]()
        
        for url in cityUrl {
            group.enter()
            
            guard let url = URL(string: url) else {
                completion(.failure(.invalidURL))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
       
                guard let data else {
                    completion(.failure(.noData))
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
                
                do {
                    let cityModel = try JSONDecoder().decode(City.self, from: data)
                    weatherData.append(cityModel)
                    group.leave()
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
        group.notify(queue: .main) {
            completion(.success(weatherData))
        }
    }
}

    
