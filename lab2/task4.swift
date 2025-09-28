var shoppingList: [String] = []

shoppingList.append("test1")
shoppingList.append("test2")
print("List:", shoppingList)

if let index = shoppingList.firstIndex(of: "test1") {
    shoppingList.remove(at: index)
}
print("After removing test1:", shoppingList)
