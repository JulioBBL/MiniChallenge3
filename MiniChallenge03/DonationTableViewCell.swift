//
//  DonationTableViewCell.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class DonationTableViewCell: UITableViewCell {

    @IBOutlet weak var donationNumber: UILabel!
    @IBOutlet weak var donationDate: UILabel!
    @IBOutlet weak var donationLocale: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
