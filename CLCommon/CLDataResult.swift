//
//  CLDataResult.swift
//  Ratings
//
//  Created by R_flava_Man on 2017/4/14.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit

class CLDataResult: NSObject, NSCoding {
    
    var code: Int = 0
    var success: Bool = false
    var msg: String?
    var data: Any?
    
    override init() {
        //此处应该有个初始值
        
        super.init()
    }
    
    convenience init(dict: Dictionary<String, Any>) {
        self.init()
        //需要做检测
        self.code = dict["code"] as! Int
        self.success = (self.code == 1)
        self.msg = dict["msg"] as? String
        self.data = dict["data"]
    }

    // NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(CLDataResult.dictFromItem(item: self), forKey: "coder")
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        self.init(dict: aDecoder.decodeObject(forKey: "coder") as! Dictionary<String, Any>)
    }
}

extension CLDataResult: CLEntityBase {
    static func itemFromDict(dict: Dictionary<String, Any>) -> Any? {
        return CLDataResult(dict: dict)
    }
    
    static func dictFromItem(item: CLDataResult) -> Dictionary<String, Any>? {
        var mDict: Dictionary<String, Any> = Dictionary()
        mDict["code"] = item.code
        mDict["msg"] = item.msg
        mDict["data"] = item.data
        return mDict
    }
}
