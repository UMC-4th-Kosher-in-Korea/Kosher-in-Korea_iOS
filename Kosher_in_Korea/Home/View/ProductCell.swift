//
//  ProductCollectionViewCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/30.
//

import UIKit
import SDWebImage
class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
    
    }
    func configure (_ info : ProductInfo)
    {
        nameLabel.text = info.ingredientName
        priceLabel.text = "\(formatPrice(info.price))"
        productImageView.sd_setImage(with: URL(string: info.ingredientImage), placeholderImage: UIImage(named: "placeholder"))
        
    }
}
