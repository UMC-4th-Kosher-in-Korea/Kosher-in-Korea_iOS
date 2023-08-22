//
//  RestaurantInforVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/22.
//

import UIKit

class RestaurantInforVC: UIViewController,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    let list : [RestaurantMenu] = RestaurantMenu.list
    let bannerInfos : [RestaurantMenu] = RestaurantMenu.list
    typealias Item = RestaurantMenu
    var datasoucre : UICollectionViewDiffableDataSource<Section , Item>!
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        datasoucre = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: {collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
                    as? MenuCell else {
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
        
        collectionView.collectionViewLayout = menuLayout()
        collectionView.alwaysBounceVertical = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRestaurant = bannerInfos[indexPath.row]
        let storyboard = UIStoryboard(name: "Reservation", bundle: nil)
        if let reservationVC = storyboard.instantiateViewController(withIdentifier: "RestaurantInforVC") as? RestaurantInforVC {
            
            navigationController?.pushViewController(reservationVC, animated: true)
        }
    }
    func menuLayout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
                
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                let layout = UICollectionViewCompositionalLayout(section: section)
                return layout
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
