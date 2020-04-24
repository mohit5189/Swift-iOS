//
//  ImageCell.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell, GenericCellProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateCell(item: ImageModel) {
        DispatchQueue.global().async {
            let image = UIImage(data: NSData(contentsOf: URL(string: item.getImageUrl())!)! as Data)
            DispatchQueue.main.async {
                self.cellImage.image = image
            }
        }
        titleLabel.text = item.getText()
    }

}
