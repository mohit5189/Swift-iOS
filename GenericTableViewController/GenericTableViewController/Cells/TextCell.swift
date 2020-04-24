//
//  TextCell.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell, GenericCellProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateCell(item: TextModel) {
        titleLabel.text = item.getText()
    }

}
