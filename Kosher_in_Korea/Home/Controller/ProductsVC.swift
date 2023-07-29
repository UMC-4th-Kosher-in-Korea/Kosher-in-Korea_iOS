//
//  ProductsVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/29.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var homeView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    
    @IBAction func selectButton(_ sender: UIButton) {
        switch sender.tag {
        case 0 :
            homeView.isHidden = false
            secondView.isHidden = true
        case 1 :
            homeView.isHidden = true
            secondView.isHidden = false
        default:
            break
        }
        
    }
    
    
    

    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            goHome(controller: self)
           }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        
        homeView.isHidden = false
        secondView.isHidden = true
    }


}
