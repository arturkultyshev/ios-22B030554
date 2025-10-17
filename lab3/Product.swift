import Foundation

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String

    enum Category {
        case electronics, clothing, food, books
    }

    var displayPrice: String {
        return "$" + String(format: "%.2f", price)
    }

    init(id: String, name: String, price: Double, category: Category, description: String) {
        self.id = id
        self.name = name
        self.price = price > 0 ? price : 0.01
        self.category = category
        self.description = description
    }
}
