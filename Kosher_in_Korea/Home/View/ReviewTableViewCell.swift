import Foundation
import UIKit

var reviewDate : String = "2023.02.05"

let review1: String = "Shakshuka is delicious! They gave me bagels, not bread, but fantastic.. In addition to the main menu, they also give salad and yogurt for appetizers and coffee or tea for dessert. The boss is very kind, too."
let review2: String = "I ordered omelet, hummus, and pollack roe and avocado with rice, and all three were delicious, but I think must eat with pollack roe avocado!!"
let review3: String = "It's really delicious and healthy. The owner is so kind and can be with a dog. Everything is good"
let review4: String = "I like warm food like home-cooked meals and plating..I usually eat Chikindap rice, but other foods taste good. I strongly recommend those who are going to eat alone in a quiet and atmosphere"

let profiles = ["kakao1", "kakao2", "kakao3", "kakao4"]
let ReviewerNames = ["Honey", "Gadi", "Gasom", "Andrew"]
let Reviews = [review1, review2, review3, review4]
let ReviewImg = ["Rectangle 5078-1", "Rectangle 5078-2", "Rectangle 5078-3", "Rectangle 5078"]


class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private let myImageView: UIImageView = {
        let imageView =  UIImageView(image: UIImage(named: profiles[0]))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30 // Adjust the corner radius as needed
        return imageView
    }()
    
    private let ReviewIMG: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ReviewImg[0]))
        imageView.contentMode = .scaleAspectFit // Scale the image to fit within the frame
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        
        // Set the width and height constraints
        let widthConstraint = imageView.widthAnchor.constraint(equalToConstant: 90)
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: 90)
        widthConstraint.isActive = true
        heightConstraint.isActive = true
        
        return imageView
    }()

    
    private let Reviewer: UILabel = {
        let label = UILabel()
        label.text = ReviewerNames[0]
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    private let Review: UILabel = {
        let label = UILabel()
        label.text = Reviews[0]
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(myImageView)
        contentView.addSubview(Reviewer)
        contentView.addSubview(Review)
        contentView.addSubview(ReviewIMG)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        Reviewer.translatesAutoresizingMaskIntoConstraints = false
        Review.translatesAutoresizingMaskIntoConstraints = false
        ReviewIMG.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            myImageView.widthAnchor.constraint(equalToConstant: 60),
            myImageView.heightAnchor.constraint(equalToConstant: 60),
            
            Reviewer.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 15),
            Reviewer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            
            Review.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            Review.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 120),
            Review.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            Review.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            ReviewIMG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ReviewIMG.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
            
        ])
    }
    
    func configure(profileImageName: String, reviewerName: String, reviewText: String, reviewImageName: String) {
        myImageView.image = UIImage(named: profileImageName)
        Reviewer.text = reviewerName
        Review.text = reviewText
        ReviewIMG.image = UIImage(named: reviewImageName) // Set the review image
    }

}
