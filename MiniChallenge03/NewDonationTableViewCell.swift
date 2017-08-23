//
//  NewDonationTableViewCell.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class NewDonationTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    private let presetText = "Você poderá doar novamente a partir do dia:"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setDate(to date: Date) {
        if Calendar(identifier: .gregorian).compare(date, to: Date(), toGranularity: .day) == ComparisonResult.orderedAscending {
            label.text = "Você já pode doar novamente :D"
        } else {
            if let user = DatabaseConnection.sharedInstance.user {
                if user.gender == .male {
                    self.label.text = "\(self.presetText) \(Utils.dateToString(Calendar(identifier: .gregorian).date(byAdding: .day, value: 60, to: date)!))"
                } else {
                    self.label.text = "\(self.presetText) \(Utils.dateToString(Calendar(identifier: .gregorian).date(byAdding: .day, value: 90, to: date)!))"
                }
            }
        }
    }
}
