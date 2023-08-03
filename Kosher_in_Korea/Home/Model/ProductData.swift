//
//  ProductData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/30.
//

import UIKit

struct ProductInfo: Hashable {
    let name: String
    let price: String
    let imageName: String
}
extension ProductInfo {
    static let list = [
        ProductInfo(name: "Salad Topper", price: "15,800 KRW", imageName: "saladTopper"),
        ProductInfo(name: "Salad", price: "25,800 KRW", imageName: "tahini"),

        
       
    ]
}

