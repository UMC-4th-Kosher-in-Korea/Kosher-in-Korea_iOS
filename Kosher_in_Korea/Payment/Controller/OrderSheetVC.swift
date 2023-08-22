import UIKit
import iamport_ios
import SwiftUI

protocol AddressDelegate {
    func sentToAddress(_ address : String)
}

class OrderSheetVC: UIViewController, AddressDelegate {
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var userAddressLabel: UILabel!
    func sentToAddress(_ address : String) {
            userAddress = address
    }
    var userAddress : String?
   
    @IBAction func resultBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Payment", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "PaymentResultVC") as? PaymentResultVC else {return}
        nextVC.userAddress = userAddress
        self.present(nextVC, animated: true)
        
    }
    @IBAction func moveToAddressBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "AddressSearchVC") as? AddressSearchVC else {return}
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userAddressLabel.text = userAddress ?? " "
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userAddressLabel.text = userAddress ?? " "
        //priceLabel.text = "\(formatPrice(UserDataManager.shared.totalPrice))"
        fetchTotalPrice()

       // totalPriceLabel.text = "Total :\(formatPrice(UserDataManager.shared.totalPrice + 4000))"
    }

  
    func fetchTotalPrice() {
         let cartId = UserDataManager.shared.cartID
           

        let urlString = "http://15.164.20.244:8080/api/carts/\(cartId)/price"
        guard let url = URL(string: urlString) else {
            // Handle error - URL is invalid
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                // Handle error - no data or error present
                return
            }

            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let body = jsonResponse["body"] as? [String: Any],
                   let totalPrice = body["data"] as? Int {
                    
                    DispatchQueue.main.async {
                        self?.priceLabel.text = "\(formatPrice(totalPrice))"
                        self?.totalPriceLabel.text = "Total :\(formatPrice(totalPrice + 4000))"
                    }
                }
            } catch {
                // Handle error - data couldn't be decoded
            }
        }
        task.resume()
    }

    
}
