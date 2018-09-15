import Foundation


class Transaction {
    var category: String
    var amount: Double
    var date: Date
    
    init(category: String, amount: Double, date: Date) {

        self.date = date
        self.category = category
        self.amount = amount
    }
}
