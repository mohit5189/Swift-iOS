//
//  GenericCellProtocol.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

protocol GenericCellProtocol {
    associatedtype Item
    func updateCell(item: Item)
}
