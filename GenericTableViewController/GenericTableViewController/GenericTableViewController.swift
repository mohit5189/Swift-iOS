//
//  GenericTableViewController.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class GenericTableViewController<T: GenericModelProtocol, Cell: UITableViewCell & GenericCellProtocol>: UITableViewController where Cell.Item == T {

    var data: [T]
    
    init(data: [T]) {
        self.data = data
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard data.count > 0 else {
            return
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(UINib(nibName: data[0].reusableIdentifier(), bundle: .main), forCellReuseIdentifier: data[0].reusableIdentifier())
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
         1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         data.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: data[indexPath.row].reusableIdentifier(), for: indexPath) as? Cell else {
            return UITableViewCell()
        }

        cell.updateCell(item: data[indexPath.row])
        
        return cell
    }
}
