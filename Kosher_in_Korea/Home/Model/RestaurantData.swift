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
}
extension BannerInfo {
    static let list = [
        BannerInfo(title: "서울 식당", description: "용산구에 위치함", imageName: "eevee"),
        BannerInfo(title: "부산 식당", description: "남포동에 위치함", imageName: "oddish"),
        
    ]
}
