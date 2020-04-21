//
//  ViewController.swift
//  LazyLoadingTableView
//
//  Created by Mohit Kumar on 21/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var images = ["https://i.picsum.photos/id/237/200/300.jpg",
    "https://i.picsum.photos/id/866/200/300.jpg",
    "https://i.picsum.photos/id/331/200/300.jpg",
    "https://i.picsum.photos/id/406/200/300.jpg?blur=5",
    "https://i.picsum.photos/id/870/200/300.jpg?blur=2&grayscale",
    "https://i.picsum.photos/id/856/200/300.jpg",
    "https://i.picsum.photos/id/0/5616/3744.jpg",
    "https://i.picsum.photos/id/1/5616/3744.jpg",
    "https://i.picsum.photos/id/2/5616/3744.jpg",
    "https://i.picsum.photos/id/3/5616/3744.jpg",
    "https://i.picsum.photos/id/4/5616/3744.jpg",
    "https://i.picsum.photos/id/5/5616/3744.jpg",
    "https://i.picsum.photos/id/6/5616/3744.jpg",
    "https://i.picsum.photos/id/7/5616/3744.jpg",
    "https://i.picsum.photos/id/8/5616/3744.jpg",
    "https://i.picsum.photos/id/9/5616/3744.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ImageCell else {
            return UITableViewCell()
        }
        
        cell.update(imageUrl: images[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

