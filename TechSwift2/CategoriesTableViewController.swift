import UIKit
protocol CategoriesTableViewControllerDelegate {
    func sendData(category: String)
}


class CategoriesTableViewController: UITableViewController {

    
    var categories = ["Бензин","Транспорт","Ресторан","Связь","Еда","Другое"]
    var delegate: CategoriesTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tapCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source
    // Сколько всего секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Сколько всего ячеек (строк) в секции номер 'section'
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    // Нужно создать и настроить ячейку для строки под номером indexPath.row
    // в секции indexPath.section
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Таблица из сториборда достанет ячейку по шаблону с идентификатором
        // CategoryCell. Изначально это будет UITableViewCell и мы преобразем
        // его в наш собственнй класс CategoryCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        // Настраиваем внешний вид ячейки
        let category = categories[indexPath.row]
        cell.labelCategory.text = category
        print("\(indexPath.section) - \(indexPath.row)")
        return cell
        
    }
    
    // Метод для обработки выделения ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = categories[indexPath.row]
        delegate?.sendData(category: category)
        dismiss(animated: true, completion: nil)
    }

}
