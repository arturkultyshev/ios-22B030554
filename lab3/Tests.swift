import Foundation

let laptop = Product(id: "p1", name: "Laptop", price: 999.99, category: .electronics, description: "Simple laptop")
let book = Product(id: "p2", name: "Swift Book", price: 19.99, category: .books, description: "Learn Swift")
let headphones = Product(id: "p3", name: "Headphones", price: 49.99, category: .electronics, description: "Good sound")

print(laptop.displayPrice)
print("")
let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

cart.addItem(product: laptop, quantity: 1)
print("Laptop count:", cart.items.first(where: { $0.product.id == "p1" })?.quantity ?? -1)

print("")

print("Subtotal:", String(format: "%.2f", cart.subtotal))
print("Item count:", cart.itemCount)

print("")

cart.discountCode = "SAVE10"
print("Total with SAVE10:", String(format: "%.2f", cart.total))

print("")

cart.removeItem(productId: book.id)
print("After removing book, itemCount:", cart.itemCount)

print("")

func modifyCart(_ c: ShoppingCart) {
    c.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
print("After modifyCart, has headphones:", cart.items.contains { $0.product.id == headphones.id })

print("")

let item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("item1 qty:", item1.quantity, "item2 qty:", item2.quantity)

print("")

let address = Address(street: "Main St 1", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
let order = Order(from: cart, shippingAddress: address)
print("Order items count:", order.itemCount)

print("")

cart.clearCart()
print("Order items still:", order.itemCount, "Cart items now:", cart.itemCount)
