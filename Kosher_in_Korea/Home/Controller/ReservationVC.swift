//
//  ResVC.swift
//  test
//
//  Created by 최영우 on 8/6/23.
//

import UIKit

var cnt : Int = 0

class ReservationVC: UIViewController {
    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
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
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(whenMinus), for: .touchUpInside)
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    private var Plus : UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(whenPlus), for: .touchUpInside)
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.backgroundColor = .systemBlue
        
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
    
    private var NextButton : UIButton = {
        var button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaLayoutGuide
        
        HowMuch.text = String(cnt)
        
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
        
        scrollView.addSubview(Calendar)
        scrollView.addSubview(people)
        scrollView.addSubview(Minus)
        scrollView.addSubview(Plus)
        scrollView.addSubview(HowMuch)
        scrollView.addSubview(TimeLabel)
        scrollView.addSubview(NextButton)
        
        view.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
            Calendar.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            Calendar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            people.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            people.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            Minus.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 250),
            Minus.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            HowMuch.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 300),
            HowMuch.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 455)
        ])
        
        NSLayoutConstraint.activate([
            Plus.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 330),
            Plus.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            TimeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            TimeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 550)
        ])
        
        NSLayoutConstraint.activate([
            NextButton.widthAnchor.constraint(equalToConstant: 360),
            NextButton.heightAnchor.constraint(equalToConstant: 50),
            NextButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            NextButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 650),
            NextButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
        
    }
    
    @objc func whenMinus() {
        if cnt > 0 {
            cnt -= 1
            HowMuch.text = String(cnt)
        }
        if cnt > 0 {
            NextButton.backgroundColor = .systemOrange
            NextButton.setTitleColor(.white, for: .normal)
            NextButton.setTitleColor(.systemGray4, for: .highlighted)
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemBlue
            Plus.setTitleColor(.systemGray4, for: .highlighted)
            Minus.setTitleColor(.systemGray4, for: .highlighted)
        }
        if cnt == 0 {
            NextButton.setTitleColor(.gray, for: .normal)
            NextButton.backgroundColor = .systemGray4
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemGray4
            Plus.setTitleColor(.systemGray4, for: .highlighted)
        }
    }
    
    @objc func whenPlus() {
        cnt += 1
        HowMuch.text = String(cnt)
        if cnt > 0 {
            NextButton.backgroundColor = .systemOrange
            NextButton.setTitleColor(.white, for: .normal)
            NextButton.setTitleColor(.systemGray4, for: .highlighted)
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemBlue
            Plus.setTitleColor(.systemGray4, for: .highlighted)
            Minus.setTitleColor(.systemGray4, for: .highlighted)
        }
        if cnt == 0 {
            NextButton.setTitleColor(.gray, for: .normal)
            NextButton.backgroundColor = .systemGray4
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemGray4
            Plus.setTitleColor(.systemGray4, for: .highlighted)
        }
    }
    
    @objc func goNext() {
        if cnt > 0 {
            let FinalRes = FinalReservation()
            self.present(FinalRes, animated: true, completion: nil)
        }

    }
    
}


