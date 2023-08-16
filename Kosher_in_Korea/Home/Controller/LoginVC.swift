//
//  LoginVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/17.
//

import UIKit
import GoogleSignIn
import FacebookLogin

class LoginVC: UIViewController {
    
    //구글 로그인
    @IBAction func loginButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
                if error == nil, signInResult != nil {
                    // 로그인에 성공했을 때만 goHome 함수를 호출
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let sceneDelegate = windowScene.delegate as? SceneDelegate {
                        sceneDelegate.setRootToTabBarController()
                    }

                } else {
                    // 로그인에 실패했을 때, 또는 signInResult가 nil인 경우에 대한 처리
                    // 필요에 따라 다른 동작을 수행하거나 오류 메시지를 표시할 수 있습니다.
                }
            }
    }
    //구글 로그아웃 버튼
    @IBAction func logoutButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()

    }
    //페이스북 로그인 버튼
    @IBAction func faceBookloginButton(_ sender: Any) {
        
        let loginManager = LoginManager()
          loginManager.logIn(permissions: ["public_profile"], from: self) { result, error in
               // Process result or error
              if let error = error {
                              print("Facebook login error: \(error)")
                          } else if let result = result, !result.isCancelled {
                              // 페이스북 로그인 성공 시, goHome 함수 호출
                              goHome(controller: self)
                          }
           }
           
            
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

   
}
