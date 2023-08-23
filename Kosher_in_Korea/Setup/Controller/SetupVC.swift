//
//  SetupVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/17.
//

import UIKit
import Alamofire
import MapKit

class SetupVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate ,CLLocationManagerDelegate{

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var profileImageView: UIImageView!{
        didSet {
                // 이미지 뷰의 모서리를 둥글게 만듭니다.
                profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
                profileImageView.clipsToBounds = true
            }
    }
    
    @IBAction func profileUpdate(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            present(imagePickerController, animated: true, completion: nil)
        
    }
    func updateUIWithProfileData(data: [String: Any]) {
        if let userName = data["userName"] as? String {
            nameTextField.text = userName
        }
        if let userPhone = data["userPhone"] as? String {
            phoneNumberTextField.text = userPhone
        }
        if let profileImageUrl = data["profileImage"] as? String {
            let url = URL(string: profileImageUrl)
            if let imageUrl = url {
                profileImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "person.crop.circle.fill")) // sd_setImage는 'SDWebImage' 라이브러리 사용 예시
            }
        }
        if let userAddress = data["userAddress"] as? String {
            addressTextField.text = userAddress
        }
        // 다른 필드도 마찬가지로 설정 가능
    }
    func fetchUserProfile() {
        guard let userId = UserDataManager.shared.userID else { return }
        let url = "http://15.164.20.244:8080/api/user/\(userId)"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let body = json["body"] as? [String: Any],
                   let data = body["data"] as? [String: Any] {
                    self.updateUIWithProfileData(data: data)
                }
            case .failure(let error):
                print("Error fetching user profile: \(error)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self
                nameTextField.delegate = self
        addressTextField.delegate = self
        fetchUserProfile()
     
        // map
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 위치 서비스 사용 동의 요청
        locationManager.startUpdatingLocation() // 위치 정보 업데이트 시작
        
        myMap.showsUserLocation = true
    }
    
    @IBAction func createProfileBtn(_ sender: Any) {
        if let userName = nameTextField.text,
           let userPhone = phoneNumberTextField.text,
           let userAddress = addressTextField.text,
           let userEmail = UserDataManager.shared.userEmail,
           let profileImage = profileImageView.image,
           let profileImageData = profileImage.jpegData(compressionQuality: 0.9) {

            let dto = CreateUserDto(userName: userName, userEmail: userEmail, userPhone: userPhone, profileImage: profileImageData, userAddress: userAddress)
            
            // 여기서 dto를 전달
            APIService.createUser(dto) { result in
                switch result {
                case .success:
                    print("User created successfully!")
                    APIService.login(userEmail: userEmail) { result in
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
//                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
//                                    sceneDelegate.setRootToTabBarController()
                                    
                                //}
                            } else {
                                print("Failed to extract user id from response.")
                            }
                        case .failure(let error):
                            goSetup(self)
                        }
                    }

                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let sceneDelegate = windowScene.delegate as? SceneDelegate {
                        sceneDelegate.setRootToTabBarController()
                        
                    }
                case .failure(let error):
                    print("Error creating user: \(error)")
                }
            }
            
        }
    }
    
    @IBAction func moveToback(_ sender: Any) {
        
        navigationController?.popViewController(animated: false)
    }
    @IBOutlet weak var myMap: MKMapView!
    var locationManager: CLLocationManager!
    var geocoder = CLGeocoder() // CLGeocoder 인스턴스
    
    @IBOutlet weak var addressTextField: UITextField!
}
extension SetupVC :UITextFieldDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
            //uploadProfileImage(selectedImage)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // 현재 텍스트 필드의 편집을 종료하고 키보드를 숨김
            textField.resignFirstResponder()
            return true
        }
    
    
}
extension SetupVC {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            // 위치 서비스 사용 동의 받았을 때
            print("Authorized for location when in use")
            
        default:
            // 다른 상태 처리
            print("Location authorization status changed: \(status)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // 영어 로케일을 지정
        let locale = Locale(identifier: "en_US")
        
        // 위치 정보를 영문 주소로 변환
        geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { placemarks, error in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }
            if let placemark = placemarks?.first {
                // placemark에서 영문 주소 정보 추출
                let address = self.getEnglishFormattedAddress(from: placemark)
                print("English Address: \(address)")
                DispatchQueue.main.async {
                    self.addressTextField.text = address
                }
            }

        }
        
        // 위치 정보 업데이트 중단
        locationManager.stopUpdatingLocation()
    }
    
    // 한국식 주소 형식으로 주소 정보 가져오기
    func getEnglishFormattedAddress(from placemark: CLPlacemark) -> String {
        var address = " "
        if let country = placemark.country {
            address += country + ", "
        }
        if let administrativeArea = placemark.administrativeArea {
            address += administrativeArea + ", "
        }
        if let locality = placemark.locality {
            address += locality + ", "
        }
        if let subLocality = placemark.subLocality {
            address += subLocality + ", "
        }
        if let thoroughfare = placemark.thoroughfare {
            address += thoroughfare + " "
        }
        if let subThoroughfare = placemark.subThoroughfare {
            address += subThoroughfare
        }
        return address
    }

   
}
