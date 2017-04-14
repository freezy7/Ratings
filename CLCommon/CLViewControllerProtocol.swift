//
//  CLViewControllerProtocol.swift
//  Ratings
//
//  Created by R_flava_Man on 2017/4/14.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit

protocol CLViewControllerProtocol {
    func backAction()
}

protocol CLTableViewControllerProtocol: CLViewControllerProtocol {
    func reloadData()
}

protocol CLHttpTableViewControllerProtocol: CLTableViewControllerProtocol {
    func creatDataModel() -> CLDataModel
}
