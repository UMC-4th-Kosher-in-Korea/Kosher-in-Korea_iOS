//
//  MyCartCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/08.
//

import UIKit
import SDWebImage
class MyCartCell: UICollectionViewCell {
    
    var delegate: MyCartCellDelegate?
    var cartItem: CartIngredient?
    
    
    @IBAction func quantityBtn(_ sender: UIButton) {
           
            switch sender.tag {
            case -1: // x 버튼
                self.isHidden = true
                delegate?.didTapDeleteButton(in: self)
            case 0: // 수량 감소 버튼
                if numberOfProducts > 1 { // 수량이 1보다 큰 경우에만 감소 가능
                    numberOfProducts -= 1
                    delegate?.didTapSubtractButton(in: self)
                }
            case 1: // 수량 증가 버튼
                if numberOfProducts < 10 { // 수량이 10보다 작은 경우에만 증가 가능
                    numberOfProducts += 1
                    delegate?.didTapAddButton(in: self)
                }
            default:
                break
            }
            updateUI() // UI 업데이트
      

        }
    
    var numberOfProducts : Int = 0
    var price : Int = 0
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
    
    }
    func configure (_ info : CartIngredient)
    {
        cartItem = info
        nameLabel.text = info.ingredientName
        priceLabel.text = "\(formatPrice(info.price * info.quantity))"
        quantityLabel.text = "\(info.quantity)"
        productImageView.sd_setImage(with: URL(string: info.ingredientImage), placeholderImage: UIImage(named: "placeholder"))
        numberOfProducts = info.quantity
        price = info.price
    }
    func updateUI() {
        guard let item = cartItem else { return }
        print("Updating UI with quantity: \(item.quantity)")
        let updatedPriceValue = price * numberOfProducts
        priceLabel.text = "\(formatPrice(updatedPriceValue))"
        quantityLabel.text = "\(numberOfProducts)"
        delegate?.didUpdatePrice(in: self, updatedPrice: updatedPriceValue)
    }
}
