//
//  MoreCityCollectionViewController.swift
//  MyWeather
//
//  Created by Анна on 09.04.2024.
//

import UIKit

final class MoreCityCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        view.putGradientCollectionVC()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreCityCell", for: indexPath)
        
        guard let cell = cell as? MoreCityCell else { return UICollectionViewCell() }
        
        
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
        
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

