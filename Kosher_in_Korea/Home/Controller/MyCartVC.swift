//
//  MyCartVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/08.
//

import UIKit

class MyCartVC: UIViewController,CartDelegate,UICollectionViewDelegate {
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    var numberOfItems : Int = 0
    var cartItems :[Product] = []
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            numberOfItems = max(numberOfItems - 1, 1)
        case 1:
            numberOfItems = min(numberOfItems + 1 , 10)
        default :
            break
        }
        numberOfItemsLabel.text = "\(numberOfItems)"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    func addProductToCart(product: Product) {
        cartItems.append(product)
        updateDataSource()
    }
    
    enum Section {
        case main
    }

    var datasource: UICollectionViewDiffableDataSource<Section, Product>!

    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cartItems, toSection: .main)
        datasource.apply(snapshot, animatingDifferences: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        datasource = UICollectionViewDiffableDataSource<Section, Product>(collectionView: collectionView) { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCartCell", for: indexPath) as? MyCartCell else {
                fatalError("Cannot create new cell")
            }
            cell.configure(item)
            return cell
        }

        updateDataSource()
    }
}
