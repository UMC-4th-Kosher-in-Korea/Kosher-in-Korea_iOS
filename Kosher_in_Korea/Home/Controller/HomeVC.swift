//
//  ViewController.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/13.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBAction func moveToCart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Payment", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "MyCartVC") as? MyCartVC else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    
    }
    @IBOutlet weak var selectProductView: UIView!
    @IBOutlet weak var restaurantView: UIView!
    @IBAction func segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            restaurantView.isHidden = false
            selectProductView.isHidden = true
        case 1 :
            restaurantView.isHidden = true
            selectProductView.isHidden = false
        default:
            break
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectProductView.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
