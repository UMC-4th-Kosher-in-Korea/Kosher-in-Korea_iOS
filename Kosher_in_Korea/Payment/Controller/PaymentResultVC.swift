//
//  PaymentResultVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/22.
//

import UIKit
import Alamofire
class PaymentResultVC: UIViewController {

    @IBAction func moveToHome(_ sender: Any) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.setRootToTabBarController()
        }
        
    }
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userAddressLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var userAddress : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        userAddressLabel.text = "\(userAddress ?? " ")"
        // Do any additional setup after loading the view.
        fetchUserProfile()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userAddressLabel.text = userAddress ?? "pick UP"
        fetchTotalPrice()
        
      
    }
    func updateUIWithProfileData(data: [String: Any]) {
        if let userName = data["userName"] as? String {
            nameLabel.text = userName
        }
        if let userPhone = data["userPhone"] as? String {
            phoneNumberLabel.text = userPhone
        }
        
        // 다른 필드도 마찬가지로 설정 가능
    }
    func fetchUserProfile() {
        guard let userId = UserDataManager.shared.userID else { return }
        let url = "http://15.164.20.244:8080/api/user/\(userId)"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let body = json["body"] as? [String: Any],
                   let data = body["data"] as? [String: Any] {
                    self.updateUIWithProfileData(data: data)
                }
            case .failure(let error):
                print("Error fetching user profile: \(error)")
            }
        }
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
                        self?.totalPriceLabel.text = "Total :\(formatPrice(totalPrice + 4000))"
                    }
                }
            } catch {
                // Handle error - data couldn't be decoded
            }
        }
        task.resume()
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
