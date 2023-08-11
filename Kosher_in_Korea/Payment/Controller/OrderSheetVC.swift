//
//  OrderSheetVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/07.
//

import UIKit

class OrderSheetVC: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
