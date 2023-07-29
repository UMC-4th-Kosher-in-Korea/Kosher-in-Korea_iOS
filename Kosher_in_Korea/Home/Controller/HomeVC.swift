//
//  ViewController.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/13.
//

import UIKit

class HomeVC: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func addressButtonTapped(_ sender: Any) {
        goAddressSearch(controller: self)
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            sender.selectedSegmentIndex = 0
            goProducts(controller: self)
        }
    }
    let list : [BannerInfo] = BannerInfo.list
    let bannerInfos : [BannerInfo] = BannerInfo.list
    typealias Item = BannerInfo
    var datasoucre : UICollectionViewDiffableDataSource<Section , Item>!
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // presentation diffable datasource
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
}

extension HomeVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goReservation(controller: self)
    }
}
