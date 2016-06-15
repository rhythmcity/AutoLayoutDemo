//
//  FourthViewController.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit
private let cellid = "cell"

struct DataModel {
    var head:UIImage?
    var name:String?
    var des:String?
    var image:UIImage?
}

class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var table:UITableView =  {
        var table = UITableView.init(frame: CGRectZero, style: .Plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 300
        table.registerClass(AutoLayoutCell.self , forCellReuseIdentifier: cellid)
        return table
    }()
    
    lazy var list:Array<DataModel> = {
         var list :Array<DataModel> =  []
        for i in 0...9 {
            var model:DataModel? = nil
            if i % 2 == 0 {
             model = DataModel.init(head: UIImage.init(named: "2.jpg"), name: "Mr.Tomato", des: "用纯代码写原生的AutoLayout是在是太麻烦了！", image: nil)
        
            }else {
            
             model = DataModel.init(head: UIImage.init(named: "2.jpg"), name: "Mr.Tomato", des: "用纯代码写原生的AutoLayout是在是太麻烦了！", image: UIImage.init(named: "3"))
            }
            
          list.append(model!)
        }
        return list
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.table)
        let layoutControntrainH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[table]-0-|", options: .AlignAllLeft, metrics: nil, views: ["table" : self.table])
        let layoutControntrainV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[table]-0-|", options: .AlignAllLeft, metrics: nil, views: ["table" : self.table])
        
        NSLayoutConstraint.activateConstraints(layoutControntrainH)
        NSLayoutConstraint.activateConstraints(layoutControntrainV)

    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:AutoLayoutCell = tableView.dequeueReusableCellWithIdentifier(cellid, forIndexPath: indexPath) as! AutoLayoutCell
        cell.setDataModel(self.list[indexPath.row])
        return cell
    }
}
