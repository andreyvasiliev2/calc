//
//  TableViewCell.swift
//  table
//
//  Created by Гость on 03.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var lab3: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
