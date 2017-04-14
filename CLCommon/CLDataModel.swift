//
//  CLDataModel.swift
//  Ratings
//
//  Created by R_flava_Man on 2017/4/14.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit

protocol CLDataModelDelegate {
    func dataModelWillStart(model: CLDataModel)
    func dataModelDidFinish(model: CLDataModel)
    func dataModelDidSuccess(model: CLDataModel)
    func dataModelDidFail(model: CLDataModel)
}

extension CLDataModelDelegate {
    func dataModelPrepareStart(model: CLDataModel) {
        //
    }
    
    func dataModelWillFinish(model: CLDataModel) {
        //
    }
    
    func dataModelDidUpdate(model: CLDataModel) {
        //
    }
}

class CLDataModel: NSObject {
    var delegate: CLDataModelDelegate?
    var loading: Bool = false
    var data: Any?
    var lastUpdateTime: NSDate = NSDate()
    // temp
    var result: CLDataResult?
    
    init(delegate: CLDataModelDelegate?) {
        self.delegate = delegate
        super.init()
    }
    
    func loadData() -> Any? {
        return nil
    }
    
    func parseData(data: Any?) -> Any? {
        return nil
    }
    
    func loadProcess() {
        self.loading = true
        
        DispatchQueue.main.async {
            self.delegate?.dataModelWillStart(model: self)
        }
        
        self.result = self.loadData() as? CLDataResult
        
        if (self.result?.success)! {
            self.data = self.parseData(data: self.result?.data)
        }
        
        self.lastUpdateTime = NSDate()
        
        DispatchQueue.main.async {
            self.delegate?.dataModelWillFinish(model: self)
        }
        
        self.loading = false
        
        if (self.result?.success)! {
            DispatchQueue.main.async {
                self.delegate?.dataModelDidSuccess(model: self)
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.dataModelDidFail(model: self)
            }
        }
        
        DispatchQueue.main.async {
            self.delegate?.dataModelDidFinish(model: self)
        }
    }
}
