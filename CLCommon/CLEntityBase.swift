//
//  CLEntityBase.swift
//  Ratings
//
//  Created by R_flava_Man on 2017/4/14.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit

protocol CLEntityBase {
    static func itemFromDict(dict: Dictionary<String, Any>) -> Any?
    static func dictFromItem(item: Any) -> Dictionary<String, Any>?
}

extension CLEntityBase {
    
    static func itemFromDict(dict: Dictionary<String, Any>) -> Any? {
        return nil
    }
    
    static func dictFromItem(item: Any) -> Dictionary<String, Any>? {
        return nil
    }
    
    static func itemsFromArray(array: Array<Dictionary<String, Any>>?) -> Array<Any>? {
        if array != nil {
            var tempArray: Array<Any> = []
            for dict: Dictionary<String, Any> in array! {
                if dict.count == 0 {
                    continue
                }
                
                let item = Self.itemFromDict(dict: dict)
                if item != nil {
                    tempArray.append(item!)
                }
            }
            return tempArray
        }
        return nil
    }
    
    static func arrayFromItems(array: Array<Any>?) -> Array<Dictionary<String, Any>>? {
        var tempArray: Array<Dictionary<String, Any>> = []
        if array != nil {
            for item: Any in array! {
                let dict = Self.dictFromItem(item: item)
                if dict != nil {
                    tempArray.append(dict!)
                }
            }
        }
        return nil
    }
}
