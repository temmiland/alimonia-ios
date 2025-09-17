import Foundation

struct CMeal : Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var notes: String?
    var ingredients: Array<CIngredient>
}
