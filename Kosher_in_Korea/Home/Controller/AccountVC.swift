//
//  AccountVC.swift
//  test
//
//  Created by 최영우 on 8/12/23.
//

import Foundation
import UIKit

class AccountVC : UIViewController {
    
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
    
    private var AccountLabel : UILabel = {
        var label = UILabel()
        label.text = "Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var AccountView : UIView = {
        var view = UIView()
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowRadius = 1
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var AccountEditButton : UIButton = {
        var button = UIButton()
        button.setTitle("Profile Edit", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var Location : UILabel = {
        var label = UILabel()
        label.text = "Location"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var Shipping : UILabel = {
        var label = UILabel()
        label.text = "Shipping"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var Payment : UILabel = {
        var label = UILabel()
        label.text = "Payment"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var Notification : UILabel = {
        var label = UILabel()
        label.text = "Notification"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private var Language : UILabel = {
        var label = UILabel()
        label.text = "Language"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    private var FAQs : UILabel = {
        var label = UILabel()
        label.text = "Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private var SendFeedback : UILabel = {
        var label = UILabel()
        label.text = "Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var Logout : UILabel = {
        var label = UILabel()
        label.text = "Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var LocationButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var ShippingButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var PaymentButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var NotificationsButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var LanguageButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var FAQsButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var SendFeedbackButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var LogoutButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func logoutButton(_ sender: Any) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.setRootToLoginController()
            }
    }
    @objc private func editButtonTapped() {
           let storyboard = UIStoryboard(name: "Setup", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "SetupVC") as? SetupVC
        else {return}
        self.navigationController?.pushViewController(nextVC, animated: false)
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LogoutButton.addTarget(self, action: #selector(logoutButton), for: .touchUpInside)
        AccountEditButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)

        view.backgroundColor = .white
        
        view.addSubview(scrollView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        scrollView.addSubview(AccountLabel)
        scrollView.addSubview(AccountEditButton)
        scrollView.addSubview(LocationButton)
        scrollView.addSubview(ShippingButton)
        scrollView.addSubview(PaymentButton)
        scrollView.addSubview(NotificationsButton)
        scrollView.addSubview(LanguageButton)
        scrollView.addSubview(FAQsButton)
        scrollView.addSubview(SendFeedbackButton)
        scrollView.addSubview(LogoutButton)
        scrollView.addSubview(Location)
        scrollView.addSubview(Shipping)
        scrollView.addSubview(Payment)
        scrollView.addSubview(Notification)
        scrollView.addSubview(Language)
        scrollView.addSubview(FAQs)
        scrollView.addSubview(SendFeedback)
        scrollView.addSubview(Logout)
        
        NSLayoutConstraint.activate([
            Location.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            Location.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 150)
        ])
        
        NSLayoutConstraint.activate([
            Shipping.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            Shipping.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200)
        ])
        
        NSLayoutConstraint.activate([
            Language.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            Language.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 400)
        ])
        
        NSLayoutConstraint.activate([
            FAQs.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            FAQs.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            SendFeedback.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            SendFeedback.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 500)
        ])
        
        
        NSLayoutConstraint.activate([
            Logout.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            Logout.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 600)
        ])
        
        NSLayoutConstraint.activate([
            Notification.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            Notification.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 350)
        ])
        
        NSLayoutConstraint.activate([
            Payment.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            Payment.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 250)
        ])
        
        NSLayoutConstraint.activate([
            AccountLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            AccountLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])

        
        
        

        
        NSLayoutConstraint.activate([
            AccountEditButton.widthAnchor.constraint(equalToConstant: 330),
            AccountEditButton.heightAnchor.constraint(equalToConstant: 50),
            AccountEditButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 70),
            AccountEditButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])

        
        NSLayoutConstraint.activate([
            LocationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 143),
            LocationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)
        ])

        
        NSLayoutConstraint.activate([
            ShippingButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 193),
            ShippingButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)

        ])

        
        NSLayoutConstraint.activate([
            PaymentButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 243),
            PaymentButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)

        ])

        
        NSLayoutConstraint.activate([
            NotificationsButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 343),
            NotificationsButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)

        ])

        
        NSLayoutConstraint.activate([
            LanguageButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 393),
            LanguageButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)

        ])

        
        NSLayoutConstraint.activate([
            FAQsButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 443),
            FAQsButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)

        ])

        
        NSLayoutConstraint.activate([
            SendFeedbackButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 493),
            SendFeedbackButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)

        ])

        
        NSLayoutConstraint.activate([
            LogoutButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 593),
            LogoutButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 325)
        ])

        
    }
}
