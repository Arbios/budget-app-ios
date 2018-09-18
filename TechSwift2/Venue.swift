import UIKit
import CoreData

@objc(Venue)
class Venue: NSManagedObject {
    @NSManaged var id: String
    @NSManaged var name: String
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var address: String
    
    var distance: Int?
    
    convenience init(id: String, name: String, latitude: Double, longitude: Double, address: String, distance: Int?) {
        
        self.init(entity: NSEntityDescription.entity(forEntityName: "Venue", in: CoreDataHelper.main.context)!, insertInto: nil)
        
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.distance = distance
        
        
    }
}
