import UIKit
import CoreData
class ViewController: UIViewController, NewEntryViewControllerDelegate, UITableViewDataSource {
    var nsManagedObjectContext: NSManagedObjectContext?
    @IBOutlet weak var tableTransactions: UITableView!
    var transactions: [Transaction] = Transaction.getAllTransactions()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableTransactions.dataSource = self

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? NewEntryViewController {
            // Подпишемся на события, став его делегатом
            controller.delegate = self
        }
        
    }
    
    // Обрабатываем событие делегата
    func transactionCreated(transaction: Transaction) {
        do {
            try CoreDataHelper.main.context.save()
        } catch let error {
            print("Ошибка сохранения данных в базу \(error)")
        }
        transactions = Transaction.getAllTransactions()
        tableTransactions.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Просим у таблицы найти доступную для показа ячейку
        // или создать новую
        let cell = tableTransactions.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        
        // Достаем транзакуию которую будем показывать
        let transaction = transactions[indexPath.row]
        
        cell.labelCategory.text = transaction.category
        cell.labelAmount.text = "₽\(transaction.amount)"
        return cell
    }
    
}

