//
//  ViewController.swift
//  test
//
//  Created by 최영우 on 8/6/23.
//

//
//  RestauInfo.swift
//  test
//
//  Created by 최영우 on 8/7/23.
//

import Foundation
import UIKit

class RestaurantDetailsVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    
    
    
    private var BackButton : UIButton = {
        var button = UIButton()
        button.setTitle("<-", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.systemGray4, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var imgView : UIView = {
        var img = UIView()
        img.backgroundColor = .gray
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private var StoreName : UILabel = {
        var name = UILabel()
        name.text = "Kosher Elifood"
        name.font = UIFont.systemFont(ofSize: 40)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private var StoreStar : UILabel = {
        var star = UILabel()
        star.text = "5.0, Israeli VeganFood"
        
        star.translatesAutoresizingMaskIntoConstraints = false
        return star
    }()
    
    private var OpenUntil : UILabel = {
        var time = UILabel()
        time.text = "Open Until 17:30"
        time.font = UIFont.systemFont(ofSize: 15)
        time.textColor = .gray
        time.translatesAutoresizingMaskIntoConstraints = false
        
        return time
    }()
    
    private var StoreInfo : UILabel = {
        var info = UILabel()
        info.text = "Kosher Elifood, the Best in Korea"
        
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    private var CallButton : UIButton = {
        var button = UIButton()
        button.setTitle("Call", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        
        return button
    }()
    
    private var LocationButton : UIButton = {
        var button = UIButton()
        button.setTitle("Location", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        
        return button
    }()
    
    private var ReservationLabel : UILabel = {
        var Res = UILabel()
        Res.text = "Reservation"
        
        Res.translatesAutoresizingMaskIntoConstraints = false
        return Res
    }()
    
    public var ResButton : UIButton = {
        var ResButton = UIButton()
        ResButton.setTitle("\(month) / \(day) / \(cnt) Guest(s) / \(strDate):00", for: .normal)
        //ResButton.setTitle("\(month) / \(day) / \(cnt) Guest(s) / \(strDate):00", for: .normal)
        ResButton.setTitleColor(.black, for: .normal)
        ResButton.setTitleColor(.gray, for: .highlighted)
        
        ResButton.layer.cornerRadius = 8
        ResButton.layer.borderWidth = 1
        ResButton.layer.borderColor = UIColor.systemGray5.cgColor
        
        ResButton.translatesAutoresizingMaskIntoConstraints = false
        
        ResButton.addTarget(self, action: #selector(goResVC), for: .touchUpInside)
        
        return ResButton
    }()
    
    private var MenuLabel : UILabel = {
        var menu = UILabel()
        menu.text = "Menu"
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    private var MSeeAllButton : UIButton = {
        var button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.addTarget(self, action: #selector(MSeeAllButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var ReviewLabel : UILabel = {
        var label = UILabel()
        label.text = "Review"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var RSeeAllButton : UIButton = {
        var button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var FinalReservationButton : UIButton = {
        var button = UIButton()
        button.setTitle("Reservation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemOrange.cgColor
        
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private func setConstraint() {
        scrollView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: MSeeAllButton.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -700),
            tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    
    

    
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
        scrollView.addSubview(imgView)
        scrollView.addSubview(StoreName)
        scrollView.addSubview(StoreStar)
        scrollView.addSubview(OpenUntil)
        scrollView.addSubview(StoreInfo)
        scrollView.addSubview(CallButton)
        scrollView.addSubview(LocationButton)
        scrollView.addSubview(ReservationLabel)
        scrollView.addSubview(ResButton)
        scrollView.addSubview(MenuLabel)
        scrollView.addSubview(MSeeAllButton)
        scrollView.addSubview(ReviewLabel)
        scrollView.addSubview(RSeeAllButton)
        scrollView.addSubview(FinalReservationButton)
        
        NSLayoutConstraint.activate([
            BackButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            BackButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
            
        ])
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            imgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            imgView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            StoreName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            StoreName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            StoreStar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 170),
            StoreStar.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            OpenUntil.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 195),
            OpenUntil.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            StoreInfo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 220),
            StoreInfo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            CallButton.widthAnchor.constraint(equalToConstant: 150),
            CallButton.heightAnchor.constraint(equalToConstant: 50),
            CallButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 260),
            CallButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            LocationButton.widthAnchor.constraint(equalToConstant: 150),
            LocationButton.heightAnchor.constraint(equalToConstant: 50),
            LocationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 260),
            LocationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 210)
        ])
        NSLayoutConstraint.activate([
            
            ReservationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 330),
            ReservationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            ResButton.widthAnchor.constraint(equalToConstant: 360),
            ResButton.heightAnchor.constraint(equalToConstant: 50),
            ResButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 370),
            ResButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            MenuLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 510),
            MenuLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            MSeeAllButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 510),
            MSeeAllButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 315)
        ])
        NSLayoutConstraint.activate([
            ReviewLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1200),
            ReviewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
        ])

        NSLayoutConstraint.activate([
            RSeeAllButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1200),
            RSeeAllButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 315),
        ])

        NSLayoutConstraint.activate([
            FinalReservationButton.widthAnchor.constraint(equalToConstant: 360),
            FinalReservationButton.heightAnchor.constraint(equalToConstant: 50),
            FinalReservationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1800),
            FinalReservationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            FinalReservationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])

        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        setConstraint()
        tableView.rowHeight = 150
    }
    
    
    
    @objc func goResVC() {
        let resVC = ReservationVC()
        self.present(resVC, animated: true, completion: nil)
    }
    
    @objc func MSeeAllButtonPressed() {
        let menuVC = MenuVC()
        self.present(menuVC, animated: true, completion : nil)
    }
    
        
}

extension RestaurantDetailsVC  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        return cell
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}


