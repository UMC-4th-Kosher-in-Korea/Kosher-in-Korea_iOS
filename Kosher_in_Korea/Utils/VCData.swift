//
//  VCData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/14.
//
import Foundation
import UIKit

func formatPrice(_ price: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal // 천 단위마다 쉼표 표시
    numberFormatter.locale = Locale(identifier: "ko_KR") // 한국 로케일 설정
    if let formattedPrice = numberFormatter.string(from: NSNumber(value: price)) {
        return formattedPrice + " KRW"
    } else {
        return "\(price) KRW"
    }
}
