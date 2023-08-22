//
//  MenuCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/22.
//

import UIKit

class MenuCell: UICollectionViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
    
    }
    func configure (_ info : RestaurantMenu)
    {
        titleLabel.text = info.title
        descriptionLabel.text = info.description
        thumbnailImageView.image = UIImage(named: info.imageName)
        priceLabel.text = info.price
        
    }
}
