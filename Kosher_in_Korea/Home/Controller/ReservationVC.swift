//
//  ReservationVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/22.
//

import UIKit

class ReservationVC: UIViewController {


    lazy var cnt : Int = 0
    
    private var Calendar : UICalendarView = {
        var calendar = UICalendarView()
        calendar.wantsDateDecorations = true
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        return calendar
    }()
    
    private var people : UILabel = {
        var label = UILabel()
        label.text = "People"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var Minus : UIButton = {
        var button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(whenMinus), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    private var Plus : UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(whenPlus), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var HowMuch : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var TimeLabel : UILabel = {
        var label = UILabel()
        label.text = "Time"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var ReservationButton : UIButton = {
        var button = UIButton()
        button.setTitle("Reservation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaLayoutGuide
        
        HowMuch.text = String(cnt)
        
        self.view.addSubview(Calendar)
        self.view.addSubview(people)
        self.view.addSubview(Minus)
        self.view.addSubview(Plus)
        self.view.addSubview(HowMuch)
        self.view.addSubview(TimeLabel)
        self.view.addSubview(ReservationButton)
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            Calendar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            Calendar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            people.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            people.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            Minus.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 250),
            Minus.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            HowMuch.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 300),
            HowMuch.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 455)
        ])
        
        NSLayoutConstraint.activate([
            Plus.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 330),
            Plus.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            TimeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            TimeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 550)
        ])
        
        NSLayoutConstraint.activate([
            ReservationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ReservationButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 650)
        ])
        
    }
    
    @objc func whenMinus() {
        if cnt > 0 {
            cnt -= 1
            HowMuch.text = String(cnt)
        }
    }
    
    @objc func whenPlus() {
        cnt += 1
        HowMuch.text = String(cnt)
    }

   
}
