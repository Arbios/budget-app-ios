import UIKit
import CoreData



class CoreDataHelper: NSObject {
    
    let model: NSManagedObjectModel
    
    let coordinator: NSPersistentStoreCoordinator
    
    let context: NSManagedObjectContext
    
    static let main = CoreDataHelper()
    
    override init() {
        let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd")
        
        self.model = NSManagedObjectModel(contentsOf: modelURL!)!
        
        self.coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let storeURL = docsURL.appendingPathComponent("store.sqlite")
        
        do {
            try self.coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch let error {
            print("Не смогли открыть/создать хранилище: \(error)")
        }
        
        self.context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.context.persistentStoreCoordinator = coordinator
    }
}
