//
//  SelectionOptionVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/07.
//

import UIKit

class SelectionOptionVC: UIViewController, UICollectionViewDelegate,ProductDelegate {
    func productForPayment() -> Product {
        return selectedProduct!
    }
    
    var selectedProduct : Product?
    var list : [ProductInfo] = ProductInfo.groceryList
    typealias Item = ProductInfo
    var datasource : UICollectionViewDiffableDataSource<Section,Item>!

    enum Section {
        case main
    }
    
    func updateDataSource() {
    
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        datasource.apply(snapshot, animatingDifferences: true)
    }

    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func optionSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            list = ProductInfo.groceryList
        case 1:
            list = ProductInfo.wineList
        case 2:
            list = ProductInfo.judaicaList
        default:
            break
        }
        updateDataSource()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
                datasource = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: {collectionView, indexPath, item in
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
                            as? ProductCollectionViewCell else {
                        return UICollectionViewCell()
                    }
                    cell.configure(item)
                    return cell
                })
        
               updateDataSource()
                // layout : compositional layout
        
                collectionView.collectionViewLayout = itemLayout()
                collectionView.alwaysBounceVertical = false
                
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = list[indexPath.item]
        selectedProduct = Product(name: product.name, imageName: product.imageName, price: product.price)
        goPayment(controller: self)
    }

}
