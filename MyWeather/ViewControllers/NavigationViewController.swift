//
//  NavigationViewController.swift
//  MyWeather
//
//  Created by Анна on 12.04.2024.
//

import UIKit

final class NavigationViewController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let topViewController = self.topViewController as? UICollectionViewController {
            topViewController.navigationController?.navigationBar.barTintColor = .clear
            
        }
    }
}
