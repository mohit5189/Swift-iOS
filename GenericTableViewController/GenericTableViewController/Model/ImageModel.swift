//
//  ImageModel.swift
//  GenericTableViewController
//
//  Created by Mohit Kumar on 23/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//


struct ImageModel: GenericModelProtocol {
    var text: String
    var imageUrl: String
    
    func getImageUrl() -> String {
        imageUrl
    }
    func getText() -> String {
        text
    }
    
    func reusableIdentifier() -> String {
        return "ImageCell"
    }
}
