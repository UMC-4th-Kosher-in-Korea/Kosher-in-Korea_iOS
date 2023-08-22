//
//  MenuTableViewCell.swift
//  Kosher_in_Korea
//
//  Created by 최영우 on 8/22/23.
//

import Foundation
import UIKit

var Cost : Int = 0
class MenuTableViewCell : UITableViewCell {
    
    private let img: UIImageView = {
        let newWidth = 110
        let newHeight = 120
        let imgView = UIImageView(image: UIImage(named: "Shakshuka"))

        // Resize and render the image
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        imgView.image?.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()

        // Set the modified image to the UIImageView
        imgView.image = newImage

        return imgView
    }()

    
    private let TableMenuName : UILabel = {
        let label = UILabel()
        label.text = "Shakshuka"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let TableCost : UILabel = {
        let label = UILabel()
        label.text = "\(Cost) KRW"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let TableMenuInfo : UILabel = {
        let label = UILabel()
        label.text = "Vegan Shakshuka comes with Vegan \nhala bread or vegan rose bread.\n(Vegan)"
        label.numberOfLines = 3
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private func setConstraint() {
        contentView.addSubview(img)
        contentView.addSubview(TableMenuName)
        contentView.addSubview(TableCost)
        contentView.addSubview(TableMenuInfo)
        img.translatesAutoresizingMaskIntoConstraints = false
        TableMenuName.translatesAutoresizingMaskIntoConstraints = false
        TableCost.translatesAutoresizingMaskIntoConstraints = false
        TableMenuInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            TableMenuName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            TableMenuName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            TableCost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            TableCost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            TableMenuInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            TableMenuInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 260),
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
             
        ])
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
