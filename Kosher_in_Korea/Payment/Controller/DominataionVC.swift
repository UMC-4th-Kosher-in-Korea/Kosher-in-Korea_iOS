//
//  DominataionVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/23.
//

import UIKit
import WebKit

class DominataionVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
let url = URL(string: "https://www.zeffy.com/en-US/donation-form/828bb78d-d50e-4e7a-96d4-147159a55bdd")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
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
