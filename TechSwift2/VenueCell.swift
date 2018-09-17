//
//  VenueCell.swift
//  TechSwift2
//
//  Created by ARBI BASHAEV on 17/09/2018.
//  Copyright © 2018 ARBI BASHAEV. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDistance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
