//
//  Constants.swift
//  MultiEnvironmentSetup
//
//  Created by Mohit Kumar on 08/09/19.
//  Copyright © 2019 Mohit Kumar. All rights reserved.
//

import Foundation

struct Constants {
    static var serverUrl: String {
        return Bundle.main.object(forInfoDictionaryKey: "server_url") as! String
    }
    
    static var timeout: String {
        return Bundle.main.object(forInfoDictionaryKey: "timeout") as! String
    }
}
