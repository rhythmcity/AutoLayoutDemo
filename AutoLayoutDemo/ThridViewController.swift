//
//  ThridViewController.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class ThridViewController: UIViewController {
    
    lazy  var redView:UIView = {
        var view = UIView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.redColor()
        return view;
    }()
    
    lazy  var greenView:UIView = {
        var view = UIView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.greenColor()
        return view;
    }()
    
    lazy  var blueView:UIView = {
        var view = UIView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blueColor()
        return view;
    }()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.redView)
        self.view.addSubview(self.greenView)
        self.view.addSubview(self.blueView)
        
        let redviewContrantWidth = NSLayoutConstraint.init(item: self.redView, attribute: .Width, relatedBy: .Equal, toItem: self.greenView, attribute: .Width, multiplier: 1, constant: 0)
        let greenviewContrantWidth = NSLayoutConstraint.init(item: self.greenView, attribute: .Width, relatedBy: .Equal, toItem: self.blueView, attribute: .Width, multiplier: 1, constant: 0)
        let blueviewContrantWidth = NSLayoutConstraint.init(item: self.blueView, attribute: .Width, relatedBy: .Equal, toItem: self.redView, attribute: .Width, multiplier: 1, constant: 0)
        
        let redviewContrantHeight = NSLayoutConstraint.init(item: self.redView, attribute: .Height, relatedBy: .Equal, toItem: self.greenView, attribute: .Height, multiplier: 1, constant: 0)
        let greenviewContrantHeight = NSLayoutConstraint.init(item: self.greenView, attribute: .Height, relatedBy: .Equal, toItem: self.blueView, attribute: .Height, multiplier: 1, constant: 0)
        let blueviewContrantHeight = NSLayoutConstraint.init(item: self.blueView, attribute: .Height, relatedBy: .Equal, toItem: self.redView, attribute: .Height, multiplier: 1, constant: 0)
        
   
        NSLayoutConstraint.activateConstraints([redviewContrantWidth,greenviewContrantWidth,blueviewContrantWidth,redviewContrantHeight,greenviewContrantHeight,blueviewContrantHeight])
        let  padding = 20
        
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[redView]-padding-[greenView]-padding-[blueView]-|", options: .AlignAllBaseline, metrics: ["padding" : padding], views: ["redView" : self.redView ,"greenView":self.greenView,"blueView":self.blueView]))
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[redView(100)]->=0-|", options: .AlignAllBaseline, metrics: nil, views: ["redView" : self.redView]))
        
        
        
        
        
        
    }

}
