import Foundation
import CoreData

@objc(Transaction)
class Transaction: NSManagedObject {
    @NSManaged var category: String
    @NSManaged var amount: Double
    @NSManaged var date: Date
    
    
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: CoreDataHelper.main.context)
    }
    
    init(category: String, amount: Double, date: Date) {

        let entity  = NSEntityDescription.entity(forEntityName: "Transaction", in: CoreDataHelper.main.context)!
        super.init(entity: entity, insertInto: CoreDataHelper.main.context)
        self.date = date
        self.category = category
        self.amount = amount
    }
    
    
    class func getAllTransactions() -> [Transaction] {
        let request = NSFetchRequest<Transaction>(entityName: "Transaction")
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]

        do {
            let transactions = try CoreDataHelper.main.context.fetch(request)
            return transactions
        } catch let error {
            print("Не удалось достать из базы: \(error)")
            return []
        }
    
    }
    
}
