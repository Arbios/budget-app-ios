import UIKit
import Alamofire
import SwiftyJSON

protocol VenuesViewControllerDelegate {
    func venueSelected(_ venue: Venue)
}

class VenuesTableViewController: UITableViewController {

    
    
    var delegate: VenuesViewControllerDelegate?
    var venues: [Venue] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // After first presenting view
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadVenues()
        // After every presenting view
    }
    func loadVenues() {
        let url = "https://api.foursquare.com/v2/venues/search?ll=45.2,37.3&client_id=CLHULJXDBAOKARAAMUN4GJYH3EKOACFICOBOSMTBAHUQDBIF&client_secret=1AWHQJAXWXWCFL2GIYNKCORT25CJ5X1VCK03WLNFJLTSMKYA&v=20181609"
        Alamofire.request(url).responseJSON { (response) in
            if let obj = response.result.value {
                let json = JSON(obj)
                var results: [Venue] = []
                let venues = json["response"]["venues"].arrayValue
                for item in venues {
                    let name = item["name"].string!
                    let distance = item["location"]["distance"].int!
                    let address = item["location"]["address"].stringValue
                    let latitude = item["location"]["lat"].double!
                    let longitude = item["location"]["lng"].double!
                    let id = item["id"].string!
                
                    let venue = Venue(id: id, name: name, latitude: latitude, longitude: longitude, address: address, distance: distance)
                    results.append(venue)
                }
                
                self.venues = results
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    
    
    @IBAction func tapCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return venues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell") as! VenueCell
        let venue = venues[indexPath.row]
        
        cell.labelName.text = venue.name
        cell.labelDistance.text = "\(venue.distance!) м."
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.venueSelected(venues[indexPath.row])
    }
}
