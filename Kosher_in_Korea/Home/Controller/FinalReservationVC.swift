//
//  Final_ReservationVC.swift
//  test
//
//  Created by 최영우 on 8/14/23.
//

import Foundation
import UIKit

class FinalReservation : UIViewController {
    
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
        label.text = "Sunday / 18 Jul / 14:00 PM"
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
    
    private var ResButton : UIButton = {
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
        self.view.addSubview(RestaurantView)
        self.view.addSubview(StoreName)
        self.view.addSubview(VeganFoodLabel)
        self.view.addSubview(GuestNumber)
        self.view.addSubview(ReservateWhen)
        self.view.addSubview(NameLabel)
        self.view.addSubview(NameTextField)
        self.view.addSubview(EmailLabel)
        self.view.addSubview(EmailTextField)
        self.view.addSubview(PhoneNumberLabel)
        self.view.addSubview(PhoneNumberTextField)
        self.view.addSubview(Instruction)
        self.view.addSubview(ResButton)
        
        NSLayoutConstraint.activate([
            RestaurantView.widthAnchor.constraint(equalToConstant: 360),
            RestaurantView.heightAnchor.constraint(equalToConstant: 140),
            RestaurantView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            RestaurantView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            StoreName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 190),
            StoreName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            VeganFoodLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 220),
            VeganFoodLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            GuestNumber.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 260),
            GuestNumber.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            ReservateWhen.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 290),
            ReservateWhen.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            NameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
            NameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            NameTextField.widthAnchor.constraint(equalToConstant: 360),
            NameTextField.heightAnchor.constraint(equalToConstant: 35),
            NameTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 380),
            NameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            EmailLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 430),
            EmailLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            EmailTextField.widthAnchor.constraint(equalToConstant: 360),
            EmailTextField.heightAnchor.constraint(equalToConstant: 35),
            EmailTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 460),
            EmailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PhoneNumberLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 510),
            PhoneNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            PhoneNumberTextField.widthAnchor.constraint(equalToConstant: 360),
            PhoneNumberTextField.heightAnchor.constraint(equalToConstant: 35),
            PhoneNumberTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 540),
            PhoneNumberTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            Instruction.widthAnchor.constraint(equalToConstant: 360),
            Instruction.heightAnchor.constraint(equalToConstant: 35),
            Instruction.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 620),
            Instruction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ResButton.widthAnchor.constraint(equalToConstant: 360),
            ResButton.heightAnchor.constraint(equalToConstant: 45),
            ResButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 700),
            ResButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
