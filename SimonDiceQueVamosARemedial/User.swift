//
//  User.swift
//  SimonDiceQueVamosARemedial
//
//  Created by mac03 on 04/03/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class User:Codable{
    var username: String
    
    init(_ username:String){
        self.username = username
    }
}
