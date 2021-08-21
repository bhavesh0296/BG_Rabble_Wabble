//
//  QuestionGroupCell.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 21/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

class QuestionGroupCell: UITableViewCell {

    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var percentageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
