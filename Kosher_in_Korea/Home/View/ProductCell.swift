//
//  ProductCollectionViewCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/30.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
    
    }
    func configure (_ info : ProductInfo)
    {
        nameLabel.text = info.name
        priceLabel.text = "\(info.price) 원"
        productImageView.image = UIImage(named: info.imageName)
        
    }
}
