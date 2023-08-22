//
//  RestaurantViewCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/18.
//

import UIKit

class RestaurantViewCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 50
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.shadowColor = UIColor.black.cgColor
        thumbnailImageView.layer.shadowOpacity = 0.1
               thumbnailImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
               thumbnailImageView.layer.shadowRadius = 4
    }
    func configure (_ info : BannerInfo)
    {
        titleLabel.text = info.title
        descriptionLabel.text = info.description
        thumbnailImageView.image = UIImage(named: info.imageName)
       // priceLabel.text = info.price
        
    }
}
