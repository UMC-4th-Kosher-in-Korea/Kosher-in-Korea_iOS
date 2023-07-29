//
//  ProductHomeVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/30.
//

import UIKit

class ProductHomeVC: UIViewController, UICollectionViewDelegate {
        let list : [ProductInfo] = ProductInfo.list
        let productInfos : [ProductInfo] = ProductInfo.list
        typealias Item = ProductInfo
        var datasoucre : UICollectionViewDiffableDataSource<Section , Item>!
    
        enum Section {
            case main
        }
    //
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
                datasoucre = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: {collectionView, indexPath, item in
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
                            as? ProductCollectionViewCell else {
                        return UICollectionViewCell()
                    }
                    cell.configure(item)
                    return cell
                })
        
                // data : snapshot
                var snapshot = NSDiffableDataSourceSnapshot<Section,Item> ()
                snapshot.appendSections([.main])
                snapshot.appendItems(productInfos,toSection: .main)
                datasoucre.apply(snapshot)
        
                // layout : compositional layout
        
                collectionView.collectionViewLayout = layout()
                collectionView.alwaysBounceVertical = false
                
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
