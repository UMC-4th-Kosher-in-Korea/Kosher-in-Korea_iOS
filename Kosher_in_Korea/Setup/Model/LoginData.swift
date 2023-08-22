import Foundation
import Alamofire
// 로그인 확인 관련 프로퍼티
struct CreateUserDto: Encodable {
    let userName: String
    let userEmail: String
    let userPhone: String
    let profileImage: Data
    let userAddress: String
}

extension APIService {
    static func login(userEmail: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
            let url = "\(baseURL)/user/login"
            let parameters: [String: Any] = ["userEmail": userEmail]
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let header = json["header"] as? [String: Any],
                       let resultCode = header["resultCode"] as? Int,
                       resultCode == 200,
                       let body = json["body"] as? [String: Any] {
                        completion(.success(body))
                    } else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse response"])
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

    
    static func createUser(_ dto: CreateUserDto, completion: @escaping (Result<Any, Error>) -> Void) {
            let url = "\(baseURL)/user/create"
            let headers: HTTPHeaders = ["Content-type": "multipart/form-data"]

            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(dto.userName.data(using: .utf8)!, withName: "userName")
                multipartFormData.append(dto.userEmail.data(using: .utf8)!, withName: "userEmail")
                multipartFormData.append(dto.userPhone.data(using: .utf8)!, withName: "userPhone")
                multipartFormData.append(dto.profileImage, withName: "profileImage", fileName: "profile.jpg", mimeType: "image/jpg")
                // 이 부분은 다른 데이터도 같은 방식으로 추가할 수 있습니다.
            }, to: url, headers: headers).response { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }}

struct LoginData {
    var userId: Int?
    // 기타 필요한 데이터...
    var userEmail : String?
    mutating func saveUser(data: [String: Any]) {
        if let body = data["data"] as? [String: Any],
           let id = body["id"] as? Int {
            self.userId = id
        }
        // 기타 필요한 데이터 저장...
    
    }
}

class UserDataManager {
    static let shared = UserDataManager()

    var userEmail: String?
    var userID: Int? {
        didSet {
            // userID가 변경될 때마다 cartID를 userID - 1로 업데이트합니다.
            cartID = userID! - 1
        }
    }
    var cartID: Int = -1 // 초기값을 설정해주어야 합니다.
    var totalPrice: Int = 0
    private init() {}
}
