//
//  NotificationVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/14.
//

import UIKit

class OrderVC: UIViewController {
    
    var selectedMonthButton: UIButton?
    
    @IBAction func monthButton(_ sender: UIButton) {
        selectedMonthButton?.isSelected = false
                sender.isSelected = true
                selectedMonthButton = sender
        
    }

    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var containerVW: UIView!
    @IBAction func segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            containerVW.isHidden = true
        case 1:
            containerVW.isHidden = false
        default :
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        containerVW.isHidden = true
        // Do any additional setup after loading the view.
    }
    



}
