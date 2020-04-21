//
//  ImageCell.swift
//  LazyLoadingTableView
//
//  Created by Mohit Kumar on 21/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(imageUrl: String) {
        cellImage.setImage(url: imageUrl, placeholderImage: UIImage(named: "placeholder"))
    }
}
