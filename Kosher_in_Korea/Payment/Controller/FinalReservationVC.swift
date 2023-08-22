//
//  Final_ReservationVC.swift
//  test
//
//  Created by 최영우 on 8/14/23.
//

import Foundation
import UIKit

class FinalReservation : UIViewController {
    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    private var RestaurantView : UIView =  {
        var view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var StoreName : UILabel = {
        var label = UILabel()
        label.text = "Kosher Elifood"
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var VeganFoodLabel : UILabel = {
        var label = UILabel()
        label.text = "Israeli VeganFood"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var GuestNumber : UILabel = {
        var label = UILabel()
        label.text = "\(String(cnt)) Guest"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var ReservateWhen : UILabel = {
        var label = UILabel()
        label.text = "\(year) / \(month) / \(day) / \(strDate):00"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var NameLabel : UILabel = {
        var label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var NameTextField : UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.layer.cornerRadius = 8
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        return textfield
    }()
    
    private var EmailLabel : UILabel = {
        var label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var EmailTextField : UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.layer.cornerRadius = 8
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        return textfield
    }()

    
    private var PhoneNumberLabel : UILabel = {
        var label = UILabel()
        label.text = "Phone Number"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var PhoneNumberTextField : UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "    Only Numbers"
        textfield.layer.cornerRadius = 8
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    private var Instruction : UITextField = {
        var textfield = UITextField()
        textfield.backgroundColor = .systemGray5
        textfield.placeholder = "   Add instructions to restaurant"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 8
        textfield.layer.borderColor = UIColor.systemGray5.cgColor
        
        return textfield
    }()
    
    private var ReservationButton : UIButton = {
        var button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Reservation", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemGray4, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
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
        
        scrollView.addSubview(RestaurantView)
        scrollView.addSubview(StoreName)
        scrollView.addSubview(VeganFoodLabel)
        scrollView.addSubview(GuestNumber)
        scrollView.addSubview(ReservateWhen)
        scrollView.addSubview(NameLabel)
        scrollView.addSubview(NameTextField)
        scrollView.addSubview(EmailLabel)
        scrollView.addSubview(EmailTextField)
        scrollView.addSubview(PhoneNumberLabel)
        scrollView.addSubview(PhoneNumberTextField)
        scrollView.addSubview(Instruction)
        scrollView.addSubview(ReservationButton)
        
        NSLayoutConstraint.activate([
            RestaurantView.widthAnchor.constraint(equalToConstant: 360),
            RestaurantView.heightAnchor.constraint(equalToConstant: 140),
            RestaurantView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            RestaurantView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            StoreName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 190),
            StoreName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            VeganFoodLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 220),
            VeganFoodLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            GuestNumber.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 260),
            GuestNumber.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            ReservateWhen.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 290),
            ReservateWhen.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            NameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 350),
            NameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            NameTextField.widthAnchor.constraint(equalToConstant: 360),
            NameTextField.heightAnchor.constraint(equalToConstant: 35),
            NameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 380),
            NameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            EmailLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 430),
            EmailLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            EmailTextField.widthAnchor.constraint(equalToConstant: 360),
            EmailTextField.heightAnchor.constraint(equalToConstant: 35),
            EmailTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 460),
            EmailTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PhoneNumberLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 510),
            PhoneNumberLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            PhoneNumberTextField.widthAnchor.constraint(equalToConstant: 360),
            PhoneNumberTextField.heightAnchor.constraint(equalToConstant: 35),
            PhoneNumberTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 540),
            PhoneNumberTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            Instruction.widthAnchor.constraint(equalToConstant: 360),
            Instruction.heightAnchor.constraint(equalToConstant: 35),
            Instruction.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 620),
            Instruction.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ReservationButton.widthAnchor.constraint(equalToConstant: 360),
            ReservationButton.heightAnchor.constraint(equalToConstant: 45),
            ReservationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 700),
            ReservationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ReservationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
        
        
        NameTextField.addTarget(self, action: #selector(ResButtonTrue), for: .editingChanged)
        EmailTextField.addTarget(self, action: #selector(ResButtonTrue), for: .editingChanged)
        PhoneNumberTextField.addTarget(self, action: #selector(ResButtonTrue), for: .editingChanged)
        
        NameTextField.addTarget(self, action: #selector(ResButtonFalse), for: .editingChanged)
        EmailTextField.addTarget(self, action: #selector(ResButtonFalse), for: .editingChanged)
        PhoneNumberTextField.addTarget(self, action: #selector(ResButtonFalse), for: .editingChanged)
    }
    
    @objc func ResButtonTrue() {
        if NameTextField.text!.isEmpty == false && EmailTextField.text!.isEmpty == false &&  PhoneNumberTextField.text!.isEmpty == false {
            ReservationButton.setTitle("Reservation", for: .normal)
            ReservationButton.backgroundColor = .orange
            ReservationButton.setTitleColor(.white, for: .normal)
            ReservationButton.setTitleColor(.systemGray4, for: .highlighted)
            ReservationButton.addTarget(self, action: #selector(ResButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc func ResButtonFalse() {
        if NameTextField.text!.isEmpty == true || EmailTextField.text!.isEmpty == true || PhoneNumberTextField.text!.isEmpty == true {
            ReservationButton.backgroundColor = .lightGray
            ReservationButton.setTitleColor(.black, for: .normal)
            ReservationButton.setTitleColor(.systemGray4, for: .highlighted)
        }
    }
    
    @objc func ResButtonPressed() {
        let restaurantDetailsVC = RestaurantDetailsVC()
        restaurantDetailsVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}


