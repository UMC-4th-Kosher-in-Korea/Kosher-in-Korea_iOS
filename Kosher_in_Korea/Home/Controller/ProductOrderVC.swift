//
//  productOrderVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/11.
//

import UIKit

class ProductOrderVC: UIViewController {

    var selectedMonthButton: UIButton?
    
    @IBAction func monthButton(_ sender: UIButton) {
        selectedMonthButton?.isSelected = false
                sender.isSelected = true
                selectedMonthButton = sender
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
