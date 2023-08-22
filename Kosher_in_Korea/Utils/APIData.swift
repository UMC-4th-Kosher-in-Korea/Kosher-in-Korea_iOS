import Foundation
import Alamofire

class APIService {
    static let baseURL = "http://15.164.20.244:8080/api"
    
}
// userData 구성
extension APIService {

    
    static func checkLoginStatus(userEmail: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "\(baseURL)/user/check/\(userEmail)"
        // 로그인 이력 확인 프로퍼티
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let header = json["header"] as? [String: Any],
                   let resultCode = header["resultCode"] as? Int,
                   resultCode == 200,
                   let body = json["body"] as? [String: Any],
                   let isLogged = body["data"] as? Bool {
                    completion(.success(!isLogged))
                } else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse response"])))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


}


