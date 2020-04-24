//
//  TextModel.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

struct TextModel: GenericModelProtocol {
    var text: String
    
    func getText() -> String {
        text
    }
    
    func reusableIdentifier() -> String {
        return "TextCell"
    }
}
