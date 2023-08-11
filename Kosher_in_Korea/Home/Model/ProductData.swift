//
//  ProductData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/30.
//

import UIKit

struct ProductInfo: Hashable {
    let name: String
    let price: Int
    let imageName: String
}
extension ProductInfo {
    static let judaicaList = [
    
        ProductInfo(name: "Postcards", price: 75000, imageName: "judaica01"),
        ProductInfo(name: "2", price: 32500, imageName: "judaica02"),
        ProductInfo(name: "3", price: 25500, imageName: "judaica03"),
        ProductInfo(name: "4", price: 25700, imageName: "judaica04"),
        ProductInfo(name: "5", price: 25300, imageName: "judaica05"),
        ProductInfo(name: "6", price: 12500, imageName: "judaica06"),
        ProductInfo(name: "7", price: 200, imageName: "judaica07"),
    ]
    
    static let groceryList = [
    
        ProductInfo(name: "1", price: 75000, imageName: "name02"),
        ProductInfo(name: "2", price: 27500, imageName: "name03"),
        ProductInfo(name: "3", price: 52500, imageName: "name04"),
        ProductInfo(name: "4", price: 22500, imageName: "name05"),
        ProductInfo(name: "5", price: 92500, imageName: "name06"),
        ProductInfo(name: "6", price: 22500, imageName: "name07"),
        ProductInfo(name: "7", price: 12500, imageName: "name08"),
    ]
    static let wineList = [
    
        ProductInfo(name: "1", price: 75000, imageName: "Wine01"),
        ProductInfo(name: "2", price: 2500, imageName: "Wine02"),
        ProductInfo(name: "3", price: 2500, imageName: "Wine03"),
        ProductInfo(name: "4", price: 2500, imageName: "Wine04"),
        ProductInfo(name: "5", price: 2500, imageName: "Wine05"),
        ProductInfo(name: "6", price: 2500, imageName: "Wine06"),
        ProductInfo(name: "7", price: 2500, imageName: "Wine07"),
    ]
}

