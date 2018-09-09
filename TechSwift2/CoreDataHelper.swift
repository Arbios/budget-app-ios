//
//import Foundation
//import UIKit
//import CoreData
//
//class CoreDataHelper {
//    
//    /**
//     * Returns an NSManagedObjectContext, which is used for core data fetching
//     */
//    class func getManagedContext() -> NSManagedObjectContext {
//        var appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
////        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
//        var context: NSManagedObjectContext = appDel.managedObjectContext!
//        
//        return context
//    }
//    
//    /**
//     * Returns an NSArray of results from a core data request
//     * @var entityName The name of the core data entity to request
//     */
//    class func getCoreDataResults(entityName: String) -> NSArray {
//        var context = getManagedContext()
//        
//        var request = NSFetchRequest(entityName: entityName)
//        request.returnsObjectsAsFaults = false
//        
//        var results: NSArray = context.executeFetchRequest(request, error: nil)!
//        
//        return results
//    }
//    
//    /**
//     * Returns the object inside of the core data request at @id or nil if none
//     * @var entityName The name of the core data entity to request
//     * @var id The Id of the core data object to fetch
//     */
//    class func getCoreDataResultById(entityName: String, id: Int) -> NSManagedObject? {
//        var results = getCoreDataResults(entityName)
//        
//        if(id >= 0 && results.count > id) {
//            return results[id] as? NSManagedObject
//        }
//        
//        return nil
//    }
//    
//    /**
//     * Returns the first object inside of the core data request or nil if none
//     * @var entityName The name of the core data entity to request
//     */
//    class func getFirstCoreDataResult(entityName: String) -> NSManagedObject? {
//        return getCoreDataResultById(entityName, id: 0)
//    }
//    
//    /**
//     * Saves an object to core data using a dictionary for the core data object key value pairs
//     * @var entityName The name of the core data entity to request
//     * @var dictionary The key value pair dictionary that represents the core data object properties
//     */
//    class func save(entityName: String, dictionary: Dictionary<String, AnyObject?>) {
//        var context = getManagedContext()
//        
//        var saveObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context)
//        
//        for(key, value) in dictionary {
//            saveObject.setValue(value, forKey: key)
//        }
//        
//        var error: NSError?
//        
//        context.save(&error)
//        
//        if(error != nil) {
//            println(error)
//        }
//    }
//}

