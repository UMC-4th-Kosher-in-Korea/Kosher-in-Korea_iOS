//
//  RestaurantViewCell.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/18.
//

import UIKit

class RestaurantViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
    
    }
    func configure (_ info : BannerInfo)
    {
        titleLabel.text = info.title
        descriptionLabel.text = info.description
        thumbnailImageView.image = UIImage(named: info.imageName)
        
    }
}
