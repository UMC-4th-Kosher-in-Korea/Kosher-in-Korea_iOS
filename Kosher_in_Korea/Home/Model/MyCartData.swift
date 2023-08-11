//
//  MyCartData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/11.
//

import Foundation
import Alamofire

struct AddCartIngredientDto: Codable {
    let cartId: Int
    let ingredientId: Int
    let count: Int
}

struct CartItemDto: Codable {
    let cartId: Int
    let cartIngredientId: Int
}

extension ApiService {
    static func addIngredientToCart(dto: AddCartIngredientDto, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = "\(baseURL)/api/cart/ingredient"  // API 경로는 실제 서비스 URL에 따라 다를 수 있습니다.

        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(dto) else {
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


    // 장바구니 선택시 구현 프로퍼티
//    let selectedIngredient = ingredients[indexPath.item] // ingredients는 데이터 소스 배열이라고 가정
//
//      let dto = AddCartIngredientDto(cartId: YOUR_CART_ID, ingredientId: selectedIngredient.id, count: 1) // 임의의 카트 ID와 선택한 재료의 ID, 수량을 사용
//
//      ApiService.addIngredientToCart(dto: dto) { result in
//          switch result {
//          case .success:
//              print("Ingredient added to cart successfully!")
//          case .failure(let error):
//              print("Error adding ingredient to cart: \(error)")
//          }
//      }

    // 증가구현
    static func increaseCartItem(dto: CartItemDto, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = "\(baseURL)/api/cart/increase"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(dto) else {
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

// 증가 클릭시
//    let dto = IncreaseCartItemDto(cartId: YOUR_CART_ID, cartIngredientId: SELECTED_INGREDIENT_ID)
//
//        ApiService.increaseCartItem(dto: dto) { result in
//            switch result {
//            case .success:
//                print("Item count increased successfully!")
//            case .failure(let error):
//                print("Error increasing item count: \(error)")
//            }
//        }

    // 감소함수
    static func decreaseCartItem(dto: CartItemDto, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = "\(baseURL)/api/cart/decrease"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(dto) else {
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

// 감소액션

//    let dto = DecreaseCartItemDto(cartId: YOUR_CART_ID, cartIngredientId: SELECTED_INGREDIENT_ID)
//
//       ApiService.decreaseCartItem(dto: dto) { result in
//           switch result {
//           case .success:
//               print("Item count decreased successfully!")
//           case .failure(let error):
//               print("Error decreasing item count: \(error)")
//           }
//       }
    // 삭제 함수
    static func deleteCartItem(dto: CartItemDto, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = "\(baseURL)/api/cart/delete"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(dto) else {
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

// 삭제 버튼

    /*
     let dto = DeleteCartItemDto(cartId: YOUR_CART_ID, cartIngredientId: SELECTED_INGREDIENT_ID)

         ApiService.deleteCartItem(dto: dto) { result in
             switch result {
             case .success:
                 print("Item deleted successfully!")
             case .failure(let error):
                 print("Error deleting item: \(error)")
             }
         }
     */


}
