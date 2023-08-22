//
//  MenuVC.swift
//  Kosher_in_Korea
//
//  Created by 최영우 on 8/21/23.
//

import Foundation
import UIKit

class MenuVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    private var BackButton : UIButton = {
        var button = UIButton()
        button.setTitle("<-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var StoreName : UILabel = {
        var label = UILabel()
        label.text = "Kosher EliFood"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var MenuLabel : UILabel = {
        var label = UILabel()
        label.text = "Menu"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    

    
    private func setConstraint() {
        scrollView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
             
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 190),
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
        
        scrollView.addSubview(BackButton)
        scrollView.addSubview(StoreName)
        scrollView.addSubview(MenuLabel)
        
        NSLayoutConstraint.activate([
            BackButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            BackButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
        ])
        
        NSLayoutConstraint.activate([
            StoreName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 60),
            StoreName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 65),
        ])
        
        NSLayoutConstraint.activate([
            MenuLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            MenuLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 150),
        ])
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        setConstraint()
        tableView.rowHeight = 150
        
        
    }
    
    
}
extension MenuVC  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        return cell
    }
}
