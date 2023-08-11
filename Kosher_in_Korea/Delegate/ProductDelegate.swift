import Foundation

protocol ProductDelegate : AnyObject {
    
    // paymentVC -> Cart : 이미지 , 이름, 가격, 수량
    func productForPayment() -> Product
    
}
protocol CartDelegate: AnyObject {
    func addProductToCart(product: Product)
}

struct Product : Hashable {
    let name : String
    let imageName : String
    let price : Int
    var quantity : Int = 0
    
    // product details 에 넘겨줄때 사용할 이니셜라이저
    init(name: String, imageName: String, price: Int) {
        self.name = name
        self.imageName = imageName
        self.price = price
        
    }
    init(name: String, imageName: String, price: Int, quantity : Int) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.quantity = quantity
    }
}
