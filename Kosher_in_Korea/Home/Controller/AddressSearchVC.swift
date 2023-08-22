import UIKit
import MapKit


class AddressSearchVC: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
   
    var delegate : AddressDelegate?
    @IBOutlet weak var myMap: MKMapView!
    var locationManager: CLLocationManager!
    var geocoder = CLGeocoder() // CLGeocoder 인스턴스
    
    @IBOutlet weak var addressTextField: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextField.delegate = self
        // 위치 서비스 관련 설정
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 위치 서비스 사용 동의 요청
        locationManager.startUpdatingLocation() // 위치 정보 업데이트 시작
        
        myMap.showsUserLocation = true
    }
    
    // CLLocationManagerDelegate 메서드
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

    @IBAction func moveToHomeBtn(_ sender: Any) {
        delegate?.sentToAddress(addressTextField.text ?? " ")
        navigationController?.popViewController(animated: false)
    }
}
