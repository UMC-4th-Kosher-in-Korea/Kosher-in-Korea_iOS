//
//  RestaurantData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/18.
//

import UIKit

struct BannerInfo: Hashable {
    let title: String
    let description: String
    let imageName: String
    let restaurantID : Int
}
extension BannerInfo {
    static let list = [
        BannerInfo(title: "Kosyeo Elifood", description: "Itaewon gyeongnidan-gil • Open until 5:30 PM ", imageName: "Elifood", restaurantID: 1),
       
    ]
}
