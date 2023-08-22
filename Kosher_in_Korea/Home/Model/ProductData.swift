//
//  ProductData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/30.
//

import UIKit
import Alamofire

struct APIResponse<T: Decodable>: Decodable {
    let header: APIHeader
    let body: T
}

struct APIHeader: Decodable {
    let resultCode: Int
    let codeName: String
}

struct APIBodyForProducts: Decodable {
    let data: APIDataForProducts
    let msg: String
}

struct APIDataForProducts: Decodable {
    let content: [ProductInfo]
}

struct ProductInfo: Decodable,Hashable {
    let ingredientId: Int
    let ingredientName: String
    let ingredientImage: String
    let price: Int
    let categoryName: String
}
struct APIBodyForProductDetails: Decodable {
    let data: ProductInfo
    let msg: String
}

extension APIService {
    static func fetchProducts(from category: Int, page : Int, size: Int, completion: @escaping (Result<[ProductInfo], Error>) -> Void) {
        let url = "\(baseURL)/category/\(category)/ingredient"
        
        var parameters: Parameters = ["page": page, "size": size]
        
        AF.request(url, method: .get,parameters: parameters).responseDecodable(of: APIResponse<APIBodyForProducts>.self) { response in
            switch response.result {
            case .success(let apiResponse):
                completion(.success(apiResponse.body.data.content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    static func fetchProductDetails(for ingredientId: Int, completion: @escaping (Result<ProductInfo, Error>) -> Void) {
        let url = "\(baseURL)/ingredient/\(ingredientId)"

        AF.request(url).responseDecodable(of: APIResponse<APIBodyForProductDetails>.self) { response in
            switch response.result {
            case .success(let apiResponse):
                let productInfo = apiResponse.body.data
                completion(.success(productInfo))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
