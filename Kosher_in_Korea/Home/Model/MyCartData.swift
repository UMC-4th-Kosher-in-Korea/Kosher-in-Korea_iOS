//
//  MyCartData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/11.
//

import Foundation
import Alamofire
struct AddCartIngredientDto: Encodable {
    var cartId: Int
    var ingredientId: Int
    var count: Int
}
struct CartResponse: Decodable {
    let header: APIHeader
    let body: CartBody
}

struct CartBody: Decodable {
    let data: CartData
    let msg: String
}

struct CartData: Decodable {
    let cartId: Int
    let userId: Int
    let cartIngredients: [CartIngredient]
    let totalPrice: Int
}

struct CartIngredient: Decodable, Hashable {
    let cartIngredientId: Int
    let ingredientName: String
    let ingredientImage: String
    let price: Int
    var quantity: Int
}


extension APIService {
    static func addIngredientToCart(_ dto: AddCartIngredientDto, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = "\(baseURL)/carts/\(UserDataManager.shared.cartID)/ingredients"

        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

        AF.request(url, method: .post, parameters: dto, encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(())) // Void를 반환합니다. 필요하다면 다른 데이터 타입으로 변경하실 수 있습니다.
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    static func fetchUserCart(for userID: Int, completion: @escaping (Result<CartData, Error>) -> Void) {
        let url = "\(baseURL)/user/\(userID)/cart"

            AF.request(url, method: .get).responseDecodable(of: CartResponse.self) { response in
                switch response.result {
                case .success(let cartResponse):
                    completion(.success(cartResponse.body.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    // 수량 감소
        static func decreaseIngredientCount(dto: ModifyCartIngredientDto, completion: @escaping (Result<CartData, Error>) -> Void) {
            let url = "\(baseURL)/carts/\(UserDataManager.shared.cartID)/ingredients/\(dto.cartIngredientId)/decrease"

            AF.request(url, method: .put, parameters: dto, encoder: JSONParameterEncoder.default)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: CartResponse.self) { response in
                    switch response.result {
                    case .success(let cartResponse):
                        completion(.success(cartResponse.body.data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    static func increaseIngredientCount(dto: ModifyCartIngredientDto, completion: @escaping (Result<CartData, Error>) -> Void) {
        let url = "\(baseURL)/carts/\(UserDataManager.shared.cartID)/ingredients/\(dto.cartIngredientId)/increase"

            AF.request(url, method: .put, parameters: dto, encoder: JSONParameterEncoder.default)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: CartResponse.self) { response in
                    switch response.result {
                    case .success(let cartResponse):
                        completion(.success(cartResponse.body.data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    static func deleteIngredientFromCart(dto: ModifyCartIngredientDto, completion: @escaping (Result<CartData, Error>) -> Void) {
        let url = "\(baseURL)/carts/\(UserDataManager.shared.cartID)/ingredients/\(dto.cartIngredientId)"

           AF.request(url, method: .delete)
               .validate(statusCode: 200..<300)
               .responseDecodable(of: CartResponse.self) { response in
                   switch response.result {
                   case .success(let cartResponse):
                       completion(.success(cartResponse.body.data))
                   case .failure(let error):
                       completion(.failure(error))
                   }
               }
       }
    
}
struct ModifyCartIngredientDto: Encodable {
    var cartId: Int = UserDataManager.shared.cartID
    var cartIngredientId: Int
  }
