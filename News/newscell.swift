//
//  newscell.swift
//  NewzDaily
//
//  Created by Sumit Bangarwa on 7/31/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//

import UIKit

class newscell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var descrip: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var time: UILabel!
    
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
