import UIKit

class Transaction: NSObject {
    let category: String
    let amount: Double
    let date: Date
    
    init(category: String, amount: Double, date: Date) {
    self.category = category
    self.amount = amount
    self.date = date
    }
    
    

}
