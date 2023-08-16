import UIKit
import Alamofire

struct Reservation: Codable {
    let userId: Int
    let restaurantId: Int
    let reservationDate: String
    let reservationTime: String
    let numberOfPeople: Int
    let status: String
}

class ApiService {
    static let baseURL = "http://localhost:8080" // baseURL을 여기에 작성하세요.

    static func createReservation(reservation: Reservation, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/api/reservation")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(reservation) else {
            completion(.failure(NSError(domain: "EncodingError", code: 0, userInfo: nil)))
            return
        }
        request.httpBody = jsonData
        
        AF.request(request).response { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // 전체예약관리
    static func fetchReservations(completion: @escaping (Result<[ReservationDto], Error>) -> Void) {
        let url = "\(baseURL)/api/reservation"
        
        AF.request(url, method: .get).responseDecodable(of: ApiResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                completion(.success(apiResponse.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// 전체예약조회 관련 프로퍼티
struct ReservationDto: Codable {
    let id: Int64
    let userId: Int64
    let restaurantId: Int64
    let reservationDate: String
    let reservationTime: String
    let numberOfPeople: Int
    let status: String
}

struct ApiResponse: Codable {
   // let status: String
    let data: [ReservationDto]
}
