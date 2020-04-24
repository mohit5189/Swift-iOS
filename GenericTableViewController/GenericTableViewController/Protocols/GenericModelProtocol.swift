//
//  GenericModelProtocol.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

protocol GenericModelProtocol {
    func getImageUrl() -> String
    func getText() -> String
    func reusableIdentifier() -> String
}

extension GenericModelProtocol {
    func getImageUrl() -> String { "" }
    func getText() -> String {""}

}
