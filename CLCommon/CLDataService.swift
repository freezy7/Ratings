//
//  CLDataService.swift
//  Ratings
//
//  Created by R_flava_Man on 2017/4/17.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit
import Alamofire

class CLDataService: NSObject {
    
    static func getCommonDataResult() -> CLDataResult {
        Alamofire.request("https://baojia.chelun.com/v2-car-getModelEntranceInfo.html").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value as? Dictionary<String, Any> {
                print("JSON: \(JSON)")
            }
        }
        return CLDataResult()
    }
}
