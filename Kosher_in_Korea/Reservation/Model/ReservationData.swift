//
//  ReservationData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/11.
//

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
    static let baseURL = "YOUR_BASE_URL" // baseURL을 여기에 작성하세요.

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
        let url = "\(baseURL)/api/reservation"  // 경로는 실제 API 경로에 따라 달라질 수 있습니다.

        AF.request(url, method: .get).responseDecodable(of: [ReservationDto].self) { response in
            switch response.result {
            case .success(let reservations):
                completion(.success(reservations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    


}

//let reservation = Reservation(userId: 1, restaurantId: 123, reservationDate: "2023-08-07", reservationTime: "19:00", numberOfPeople: 3, status: "Pending")
//
//ApiService.createReservation(reservation: reservation) { result in
//    switch result {
//    case .success:
//        print("Reservation created successfully!")
//    case .failure(let error):
//        print("Error creating reservation: \(error)")
//    }
//}


// 전체예약조회 관련 프로퍼티

struct ReservationDto: Codable {
    let id: Int
    let userId: Int
    let restaurantId: Int
    let reservationDate: String
    let reservationTime: String
    let numberOfPeople: Int
    let status: String
}

