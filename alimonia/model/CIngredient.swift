import Foundation

struct CIngredient: Identifiable {
    let id = UUID()
    var name: String
    var amount: Int32
    var uom: CUom
    
    init(name: String, amount: Int32, uom: CUom) {
        self.name = name
        self.amount = amount
        self.uom = uom
    }
}
