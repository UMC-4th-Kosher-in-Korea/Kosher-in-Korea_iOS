//
//  LoginVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/17.
//

import UIKit
import GoogleSignIn
import FacebookLogin
import Alamofire

class LoginVC: UIViewController {
   
//    var userEmail : String?
//    var userID : Int?
    @IBOutlet weak var lauchScreen: UIImageView!
    // LoginVC.swift
    @IBAction func loginButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            if error == nil, let user = signInResult?.user, let email = user.profile?.email {
                // 서버에 userEmail을 전송하여 로그인 처리
               // self.userEmail = email
                UserDataManager.shared.userEmail = email
                APIService.login(userEmail: email) { result in
                    switch result {
                    case .success(let responseDict):
                        if let userData = responseDict["data"] as? [String: Any],
                           let userId = userData["id"] as? Int {
                            // 로그인 성공 시 유저 정보를 저장
                            var loginData = LoginData()
                            loginData.userId = userId // id만 저장
                            UserDataManager.shared.userID = userId
                            //self.userID = userId
                            //print("Login Successful. UserId: \(self.userID ?? -1)")
                            // 로그인에 성공했을 때의 동작
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                                sceneDelegate.setRootToTabBarController()
                                
                            }
                        } else {
                            print("Failed to extract user id from response.")
                        }
                    case .failure(let error):
                        goSetup(self)
                    }
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
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { result, error in
            if let error = error {
                print("Facebook login error: \(error)")
            } else if let result = result, !result.isCancelled {
                // 페이스북 로그인 성공
                Profile.loadCurrentProfile { profile, error in
                    if let profile = profile, let email = profile.email {
                        UserDataManager.shared.userEmail = email

                        // 서버에 userEmail을 전송하여 로그인 처리
                        APIService.login(userEmail: email) { result in
                            switch result {
                            case .success(let responseDict):
                                if let userData = responseDict["data"] as? [String: Any],
                                   let userId = userData["id"] as? Int {
                                    // 로그인 성공 시 유저 정보를 저장
                                    var loginData = LoginData()
                                    loginData.userId = userId // id만 저장
                                    UserDataManager.shared.userID = userId

                                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                       let sceneDelegate = windowScene.delegate as? SceneDelegate {
                                        sceneDelegate.setRootToTabBarController()
                                    }
                                } else {
                                    print("Failed to extract user id from response.")
                                }
                            case .failure(let error):
                                print("Error logging in: \(error)")
                            }
                        }
                    } else {
                        print("Failed to load Facebook profile or email.")
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
            self.lauchScreen.isHidden = true
        }
    }
}
