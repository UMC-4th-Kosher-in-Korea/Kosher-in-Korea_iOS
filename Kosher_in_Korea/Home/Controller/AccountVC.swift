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
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var LocationButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Location                                             >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var ShippingButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Shipping                                             >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var PaymentButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Payment                                             >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var NotificationsButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Notifications                                      >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var LanguageButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Language                                           >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var FAQsButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("FAQs                                                   >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var SendFeedbackButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Send feedback                                  >", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var LogoutButton : UIButton = {
        var button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Logout                                                >", for: .normal)
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
        scrollView.addSubview(AccountView)
        scrollView.addSubview(AccountEditButton)
        scrollView.addSubview(LocationButton)
        scrollView.addSubview(ShippingButton)
        scrollView.addSubview(PaymentButton)
        scrollView.addSubview(NotificationsButton)
        scrollView.addSubview(LanguageButton)
        scrollView.addSubview(FAQsButton)
        scrollView.addSubview(SendFeedbackButton)
        scrollView.addSubview(LogoutButton)
        
        
        
        NSLayoutConstraint.activate([
            AccountLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            AccountLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

        
        NSLayoutConstraint.activate([
            AccountView.widthAnchor.constraint(equalToConstant: 330),
            AccountView.heightAnchor.constraint(equalToConstant: 70),
            AccountView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            AccountView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        

        
        NSLayoutConstraint.activate([
            AccountEditButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            AccountEditButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 320)
        ])

        
        NSLayoutConstraint.activate([
            LocationButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            LocationButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)
        ])

        
        NSLayoutConstraint.activate([
            ShippingButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            ShippingButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)

        ])

        
        NSLayoutConstraint.activate([
            PaymentButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250),
            PaymentButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)

        ])

        
        NSLayoutConstraint.activate([
            NotificationsButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
            NotificationsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)

        ])

        
        NSLayoutConstraint.activate([
            LanguageButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            LanguageButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)

        ])

        
        NSLayoutConstraint.activate([
            FAQsButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 450),
            FAQsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)

        ])

        
        NSLayoutConstraint.activate([
            SendFeedbackButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 500),
            SendFeedbackButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)

        ])

        
        NSLayoutConstraint.activate([
            LogoutButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600),
            LogoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)
        ])

        
    }
}
