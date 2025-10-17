import Foundation

struct CartItem {
    let product: Product
    private(set) var quantity: Int

    var subtotal: Double {
        return product.price * Double(quantity)
    }

  
    mutating func updateQuantity(_ newQuantity: Int) {
        self.quantity = newQuantity > 0 ? newQuantity : 1
    }

    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else { return }
        self.quantity += amount
    }
}
