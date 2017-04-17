//
//  CLTableViewController.swift
//  Ratings
//
//  Created by R_flava_Man on 17/3/17.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit

class CLTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    var dataSource:[displayItem?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView)
        
        tableView.tableFooterView = UIView()
        
        for i in (0...10) {
            var item: displayItem? = nil
            if i%2 == 0 {
                item = displayItem(text: "fsdfffdsfdsfdsfdsfdsfdsfdfdsf", isShow: false)
                
            } else {
                item = displayItem(text: "fsdfdsfdssssssssssdsfsdfsd234324322222222222222222222222223244324322343243222222222222222222222222232443243223432432222222222222222222222222324432432fsdfffdsfdsfdsfdsfdsfdsfdfdsffsdfffdsfdsfdsfdsfdsfdsfdfdsffsdfffdsfdsfdsfdsfdsfdsfdfdsf123", isShow: false)
            }
            self.dataSource.append(item)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CLDataService.getCommonDataResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableViewDelegate & TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CLTableViewCell.cellHeightWith(item: (dataSource[indexPath.row])!, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "tableViewCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? CLTableViewCell
        if cell == nil {
            cell = CLTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell!.tapFunction = tapXXXX
        cell?.index = indexPath.row
        cell!.displayItem = (dataSource[indexPath.row])!
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tapXXXX(index: Int) {
        var item: displayItem = self.dataSource[index]!
        if item.isShow {
            item.isShow = false
        } else {
            item.isShow = true
        }
        self.dataSource.remove(at: index)
        self.dataSource.insert(item, at: index)
        self.tableView.reloadData()
    }
}

struct displayItem {
    var text: String?
    var isShow: Bool = false
}
