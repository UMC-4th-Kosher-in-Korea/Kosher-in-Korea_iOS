//
//  RestaurantVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/07.
//

import UIKit

class RestaurantVC: UIViewController,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let list : [BannerInfo] = BannerInfo.list
    let bannerInfos : [BannerInfo] = BannerInfo.list
    typealias Item = BannerInfo
    var datasoucre : UICollectionViewDiffableDataSource<Section , Item>!
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        datasoucre = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: {collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantViewCell", for: indexPath)
                    as? RestaurantViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            return cell
        })
        
        // data : snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item> ()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos,toSection: .main)
        datasoucre.apply(snapshot)
        
        // layout : compositional layout
        
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRestaurant = bannerInfos[indexPath.row]
        let storyboard = UIStoryboard(name: "Reservation", bundle: nil)
        if let reservationVC = storyboard.instantiateViewController(withIdentifier: "RestaurantDetailsVC") as? RestaurantDetailsVC {
            
            navigationController?.pushViewController(reservationVC, animated: true)
        }
    }

    
    
}
extension RestaurantVC: RestaurantSelectionDelegate {
    func didSelectRestaurant(with id: Int) {
        // Here, you can handle the selected restaurant ID if needed.
    }
}
