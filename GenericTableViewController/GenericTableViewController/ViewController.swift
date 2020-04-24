//
//  ViewController.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textCellData = [TextModel(text: "text1"),TextModel(text: "text2"),TextModel(text: "text3"),TextModel(text: "text4"),TextModel(text: "text5"),TextModel(text: "text6"),TextModel(text: "text7")]
    
    let imageCellData = [ImageModel(text: "text1", imageUrl: "https://i.picsum.photos/id/0/5616/3744.jpg"),
    ImageModel(text: "text2", imageUrl: "https://i.picsum.photos/id/0/5616/3744.jpg"),
    ImageModel(text: "text3", imageUrl: "https://i.picsum.photos/id/0/5616/3744.jpg"),
    ImageModel(text: "text4", imageUrl: "https://i.picsum.photos/id/0/5616/3744.jpg"),
    ImageModel(text: "text5", imageUrl: "https://i.picsum.photos/id/0/5616/3744.jpg"),
    ImageModel(text: "text6", imageUrl: "https://i.picsum.photos/id/0/5616/3744.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openTableView(_ sender: Any) {
        let genericTableVC = GenericTableViewController<TextModel, TextCell>(data: textCellData)
        self.navigationController?.pushViewController(genericTableVC, animated: true)
    }
    
    @IBAction func openTableViewWithImage(_ sender: Any) {
        let genericTableVC = GenericTableViewController<ImageModel, ImageCell>(data: imageCellData)
        self.navigationController?.pushViewController(genericTableVC, animated: true)
    }
}

