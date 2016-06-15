//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

private let cellIndentity = "cellIndentity"

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    
   lazy var table:UITableView =  {
        var table = UITableView.init(frame: CGRectZero, style: .Plain)
            table.translatesAutoresizingMaskIntoConstraints = false
            table.delegate = self
            table.dataSource = self
            table.registerClass(UITableViewCell.self , forCellReuseIdentifier: cellIndentity)
            return table
    }()
    
   lazy var list:Array<Any> = {
        var list :Array<Any> =  ["正常的布局","有动画的布局","三等分","优先级"]
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
    
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentity, forIndexPath: indexPath)
        cell.textLabel!.text = self.list[indexPath.row] as? String
        
        return cell
    }
    
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        
        case 0:
        
            self.navigationController?.pushViewController(FirstViewController(), animated: true)
            break
            
        case 1 :
            self.navigationController?.pushViewController(SecondViewController(), animated: true)
            break
        case 2 :
            self.navigationController?.pushViewController(ThridViewController(), animated: true)
            break
        case 3:
            self.navigationController?.pushViewController(FourthViewController(), animated: true)
            break
        default :
            break
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

