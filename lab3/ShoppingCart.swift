import Foundation

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String? = nil

    init() {}

    func addItem(product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }
        if let idx = items.firstIndex(where: { $0.product.id == product.id }) {
            var existing = items[idx]
            existing.increaseQuantity(by: quantity)
            items[idx] = existing
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }

    func removeItem(productId: String) {
        items.removeAll { $0.product.id == productId }
    }

    func updateItemQuantity(productId: String, quantity: Int) {
        if quantity <= 0 {
            removeItem(productId: productId)
            return
        }
        if let idx = items.firstIndex(where: { $0.product.id == productId }) {
            var it = items[idx]
            it.updateQuantity(quantity)
            items[idx] = it
        }
    }

    func clearCart() {
        items.removeAll()
    }

    var subtotal: Double {
        return items.reduce(0.0) { $0 + $1.subtotal }
    }

    var discountAmount: Double {
        guard let code = discountCode else { return 0.0 }
        switch code {
        case "SAVE10":
            return subtotal * 0.10
        case "SAVE20":
            return subtotal * 0.20
        default:
            return 0.0
        }
    }

    
    var total: Double {
        return max(0.0, subtotal - discountAmount)
    }

    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }

    var isEmpty: Bool {
        return items.isEmpty
    }
}
