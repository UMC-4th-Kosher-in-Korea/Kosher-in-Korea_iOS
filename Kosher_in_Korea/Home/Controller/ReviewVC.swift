//
//  ReviewVC.swift
//  Kosher_in_Korea
//
//  Created by 최영우 on 8/21/23.
//

import Foundation
import UIKit

class ReviewVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    
    private var StoreName : UILabel = {
        var label = UILabel()
        label.text = "Kosher EliFood"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    

    
    private func setConstraint() {
        scrollView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
             
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }

    
    private var ReservationButton : UIButton = {
        var button = UIButton()
        button.setTitle("Reservation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor =  .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        // Enable Auto Layout
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up scrollView and contentView constraints
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        scrollView.addSubview(StoreName)
        //scrollView.addSubview(ReservationButton)
        
        
        NSLayoutConstraint.activate([
            StoreName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            StoreName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 65),
        ])
        
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setConstraint()
        tableView.rowHeight = 300
        
        
    }
    
    
}
extension ReviewVC  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        // Get the data for the current cell
        let profileImageName = profiles[indexPath.row % profiles.count]
        let reviewerName = ReviewerNames[indexPath.row % ReviewerNames.count]
        let reviewText = Reviews[indexPath.row % Reviews.count]
        let reviewImageName = ReviewImg[indexPath.row % ReviewImg.count]
        
        // Configure the cell with data
        cell.configure(profileImageName: profileImageName, reviewerName: reviewerName, reviewText: reviewText, reviewImageName: reviewImageName)
        
        return cell
    }

}
