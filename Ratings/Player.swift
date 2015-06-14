//
//  Player.swift
//  Ratings
//
//  Created by R_style_Man on 15/6/14.
//  Copyright (c) 2015年 R_style_Man. All rights reserved.
//

import UIKit

class Player: NSObject {
    var name:String
    var game:String
    var rating:Int
    
    init(name:String, game:String, rating:Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}
