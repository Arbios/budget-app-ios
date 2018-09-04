import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var labelCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("created")
    }

    
    override func prepareForReuse() {
        print("reused")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
