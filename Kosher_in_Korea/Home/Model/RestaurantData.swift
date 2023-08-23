//
//  RestaurantData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/18.
//

import UIKit
import Alamofire
struct BannerInfo: Hashable {
    let title: String
    let description: String
    let imageName: String
    let restaurantID : Int
}
extension BannerInfo {
    static let list = [
        BannerInfo(title: "Kosher Elifood", description: "Itaewon gyeongnidan-gil • Open until 5:30 PM ", imageName: "kosher", restaurantID: 1),
       
    ]
}
struct RestaurantMenu : Hashable {
    let title: String
    let description: String
    let imageName: String
    let price : String
}
extension RestaurantMenu {
    static let list = [RestaurantMenu(title: "Shakshuka ", description: "Vegan shakshuka comes with vegan hala bread or vegan rose bread. (Vegan)", imageName: "Rectangle 5078", price: "17,000 KRW"),
                       RestaurantMenu(title: "Hummus ", description: "Hummus comes with vegan halabread or vegan rosebread. (Vegan)", imageName: "Rectangle 5078-1", price: "15,000 KRW"),
                       RestaurantMenu(title: "Challah Bread", description: "Israel Hallah Bread or Rose Bread.", imageName: "Rectangle 5078-2", price: "5,000 KRW"),
                       RestaurantMenu(title: "KOSHER Americano ", description: "It is an organic Americano made from kosher certified coffee beans. (Hot/Ice)", imageName: "Rectangle 5078-3", price: "4,000 KRW")]
}
// restaurant 모델
struct RestaurantResponse: Codable {
    let header: ResponseHeader
    let body: ResponseBody
    
    struct ResponseHeader: Codable {
        let resultCode: Int
        let codeName: String
    }
    
    struct ResponseBody: Codable {
        let data: Restaurant
    }
}

struct Restaurant: Codable {
    let id: Int
    let userId: Int
    let location: String
    let restaurantName: String
    let restaurantPhone: String
    let capacity: Int
    let openTime: [Int]
    let closeTime: [Int]
    let description: String
    let restaurantMenus: [Menu]
    
    struct Menu: Codable {
        let id: Int
        let restaurantId: Int
        let menuName: String
        let price: Int
        let menuDescription: String
    }
}

func fetchRestaurantDetails(for id: Int, completion: @escaping (Restaurant) -> Void) {
    let url = "http://localhost:8080/api/restaurant/\(id)"
    AF.request(url).responseDecodable(of: RestaurantResponse.self) { response in
        switch response.result {
        case .success(let restaurantResponse):
            completion(restaurantResponse.body.data)
        case .failure(let error):
            print("Error fetching restaurant details: \(error)")
        }
    }
}
