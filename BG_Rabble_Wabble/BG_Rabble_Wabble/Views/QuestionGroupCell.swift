//
//  QuestionGroupCell.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 21/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit
import Combine

class QuestionGroupCell: UITableViewCell {

    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var percentageLabel: UILabel!
    public var percentageSubscriber: AnyCancellable?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
