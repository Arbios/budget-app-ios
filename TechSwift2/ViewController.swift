import UIKit

class ViewController: UIViewController, NewEntryViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableTransactions: UITableView!
    
    var transactions: [Transaction] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? NewEntryViewController {
            // Подпишемся на события, став его делегатом
            controller.delegate = self
        }
        
    }
    
    // Обрабатываем событие
    func transactionCreated(transaction: Transaction) {
        transactions.append(transaction)
    }
    
    
    // MARK: - Table View

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    }
    
}

