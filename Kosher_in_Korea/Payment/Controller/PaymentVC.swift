//
//  PaymentVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/07.
//

import UIKit
import SDWebImage
class PaymentVC: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    
    var numberOfItems : Int = 1
    var ingredientId : Int?
    
    func updateUI(with product: ProductInfo) {
            productNameLabel.text = product.ingredientName
            productImage.sd_setImage(with: URL(string: product.ingredientImage), completed: nil)
        let totalPrice = product.price * numberOfItems
        productPriceLabel.text = "\(formatPrice(totalPrice))"
//            let formatter = NumberFormatter()
//            formatter.numberStyle = .decimal
//            formatter.groupingSeparator = ","
//            formatter.maximumFractionDigits = 0
//            if let formattedPrice = formatter.string(from: NSNumber(value: totalPrice)) {
//                productPriceLabel.text = formattedPrice
//            }
    }
    
    func fetchProductDetails(for ingredientId: Int) {
        APIService.fetchProductDetails(for: ingredientId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let product):
                    self?.updateUI(with: product)
                case .failure(let error):
                    print("Error fetching product details: \(error.localizedDescription)")
                }
            }
        }
    }

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
        fetchProductDetails(for: ingredientId!)
        
    }
    @IBAction func goHomeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false

            guard let id = ingredientId else { return }
            fetchProductDetails(for: id)
    }
    
    @IBAction func addCartBtn(_ sender: Any) {
        let dto = AddCartIngredientDto(cartId: UserDataManager.shared.cartID, ingredientId: ingredientId!, count: numberOfItems)
        print("\(UserDataManager.shared.cartID)")
        APIService.addIngredientToCart(dto) { result in
            switch result {
            case .success:
                print("재료가 장바구니에 추가되었습니다.")
                let storyboard = UIStoryboard(name: "Payment", bundle: nil)
                guard let nextVC = storyboard.instantiateViewController(withIdentifier: "MyCartVC") as? MyCartVC else {return}
                self.navigationController?.pushViewController(nextVC, animated: false)
            case .failure(let error):
                print("요청 오류: \(error.localizedDescription)")
            }
        }

        
    }
    
}
