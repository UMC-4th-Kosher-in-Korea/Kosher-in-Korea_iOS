//
//  MyCartCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/08.
//

import UIKit

class MyCartCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
    
    }
    func configure (_ info : Product)
    {
        nameLabel.text = info.name
        priceLabel.text = "\(info.price) 원"
        productImageView.image = UIImage(named: info.imageName)
        
    }
   
}
