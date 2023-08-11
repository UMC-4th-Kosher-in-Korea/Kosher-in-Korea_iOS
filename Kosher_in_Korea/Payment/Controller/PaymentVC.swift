//
//  PaymentVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/07.
//

import UIKit

class PaymentVC: UIViewController, CartDelegate {
    func addProductToCart(product: Product) {
        
    }
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    weak var cartDelegate: CartDelegate?

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
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    var numberOfItems : Int = 0
    @IBAction func goHomeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    var productDelegate : ProductDelegate?
    
    private var productName: String {
        guard let name = productDelegate?.productForPayment().name else {
            return ""
        }
        return name
    }
    private var imageName: String {
        guard let imageName = productDelegate?.productForPayment().imageName else {
            return ""
        }
        return imageName
    }
    
    private var productPrice: Int {
        guard let price = productDelegate?.productForPayment().price else {
            return 0
        }
        return price
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        productImage.image = UIImage(named: imageName)
        productNameLabel.text = productName
        productPriceLabel.text = "\(productPrice)"
        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let product = Product(name: productName, imageName: imageName, price: productPrice, quantity: numberOfItems)
           cartDelegate?.addProductToCart(product: product)
        let storyboard = UIStoryboard(name: "Payment", bundle: nil)
        if let myCartVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentVC {
            myCartVC.cartDelegate = self
            navigationController?.pushViewController(myCartVC, animated: true)
        }

    }
    

}
