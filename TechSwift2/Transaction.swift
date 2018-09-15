import Foundation


class Transaction {
    var category: String
    var amount: Double
    
    
    init(category: String, amount: Double) {
        self.category = category
        self.amount = amount
    }
}
