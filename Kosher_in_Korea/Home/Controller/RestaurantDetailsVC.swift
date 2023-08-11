
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
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
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
        button.backgroundColor = .systemGray
        return button
    }()
    
    private var LocationButton : UIButton = {
        var button = UIButton()
        button.setTitle("Location", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        return button
    }()
    
    private var ReservationLabel : UILabel = {
        var Res = UILabel()
        Res.text = "Reservation"
        
        Res.translatesAutoresizingMaskIntoConstraints = false
        return Res
    }()
    
    private var ResButton : UIButton = {
        var ResButton = UIButton()
        ResButton.setTitle("Today (Friday) / Two / 2:00 PM", for: .normal)
        ResButton.setTitleColor(.black, for: .normal)
        ResButton.setTitleColor(.gray, for: .highlighted)
        ResButton.backgroundColor = .systemGray
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
        
        return button
    }()
    
    var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        scrollView.addSubview(menuTableView)
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
            CallButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 260),
            CallButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            LocationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 260),
            LocationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 250)
        ])
        NSLayoutConstraint.activate([
            ReservationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 330),
            ReservationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
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
            ReviewLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000),
            ReviewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            ReviewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant : -40)
        ])
        NSLayoutConstraint.activate([
            RSeeAllButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000),
            RSeeAllButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 315),
            RSeeAllButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant : -40)
        ])
        
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: MSeeAllButton.bottomAnchor, constant: 10),
            menuTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            menuTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            menuTableView.heightAnchor.constraint(equalToConstant: 150) // Adjust the height as needed
        ])
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuTableViewCell")
        
        NSLayoutConstraint.activate([
            FinalReservationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1700),
            FinalReservationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            FinalReservationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Change this to the number of rows you want to display
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath)
        cell.textLabel?.text = "Kosher Food" // Set the text here
        return cell
    }
    
    @objc func goResVC() {
        let resVC = ReservationVC()
        self.present(resVC, animated: true, completion: nil)
    }
                                  
}


