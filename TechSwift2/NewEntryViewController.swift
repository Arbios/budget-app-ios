import UIKit

protocol NewEntryViewControllerDelegate: NSObjectProtocol {
    func transactionCreated(transaction: Transaction)
}


class NewEntryViewController: UIViewController, CategoriesTableViewControllerDelegate, VenuesViewControllerDelegate {
    func sendData(category: String) {
        selectCategoryButton.setTitle(category, for: .normal)
        currentCategory = category
        
    }
    func venueSelected(_ venue: Venue) {
        selectVenueButton.setTitle(venue.name, for: .normal)
        dismiss(animated: true, completion: nil)
    }

    var currentCategory: String?
    
    weak var delegate: NewEntryViewControllerDelegate?
    
    @IBOutlet weak var selectCategoryButton: UIButton!
    @IBOutlet weak var selectVenueButton: UIButton!
    @IBOutlet weak var textFieldAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        if let categoriesController = navigation.viewControllers.first as? CategoriesTableViewController {
            categoriesController.delegate = self
        } else if let venuesController = navigation.viewControllers.first as? VenuesTableViewController {
            venuesController.delegate = self
        }
        
        print("Prepared for segue")
    }
    
    
    
    
    @IBAction func tapCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapDone(_ sender: Any) {
        if let text = textFieldAmount.text {
            if let amount = Double(text) {
                print("You entered \(amount)")
                
                // Cоздать новую транзакцию и передать ее
                // на экран списка затрат (самый первый экран)
                
                if let category = currentCategory {
                    
                    // Delete it
                    let daaata = Date(timeIntervalSinceNow: 2222)
                    let transaction = Transaction(category: category, amount: amount, date: daaata)
                    delegate?.transactionCreated(transaction: transaction)
                    // передать на первый экран и показать в списке
//                    delegate?.transactionCreated(transaction: transaction)
                    
                }
                
            }
        }
    }
    
}
