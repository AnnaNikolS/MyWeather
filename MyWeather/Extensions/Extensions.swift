//
//  Extensions.swift
//  MyWeather
//
//  Created by Анна on 08.04.2024.
//

import UIKit

extension UIView {
    
    func putGradientCollectionVC() {
        let gradientView = CAGradientLayer()
        gradientView.frame = bounds
        gradientView.colors = [UIColor.mintWeatherDark.cgColor, UIColor.systemBlue.cgColor, UIColor.blueWeather.cgColor]
        gradientView.locations = [0.1, 0.5, 1.0]
        layer.insertSublayer(gradientView, at: 0)
    }
    
    func putBackground() {
        let image = UIImage(named: "back2")
        backgroundColor = UIColor(patternImage: image!)
    }
}

extension UIViewController {
    func unixTimeToLocalTime(unixTime: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}

