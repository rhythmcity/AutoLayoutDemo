//
//  FirstViewController.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy  var redView:UIView = {
       var view = UIView.init()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.backgroundColor = UIColor.redColor()
        return view
    }()
    
    lazy var greenView:UIView = {
        var view = UIView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.greenColor()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.redView)
        self.view.addSubview(self.greenView)
        
        let redviewContranintLeft = NSLayoutConstraint.init(item: self.redView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 60);
        let redviewContranintTop = NSLayoutConstraint.init(item: self.redView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 80);
        let redviewContranintWidth = NSLayoutConstraint.init(item: self.redView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1, constant: 100);
        let redviewContranintHeight = NSLayoutConstraint.init(item: self.redView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: 100);
        NSLayoutConstraint.activateConstraints([redviewContranintLeft,redviewContranintTop,redviewContranintWidth,redviewContranintHeight])
        
        let greenviewContranintLeft = NSLayoutConstraint.init(item: self.greenView, attribute: .Left, relatedBy: .Equal, toItem: self.redView, attribute: .Right, multiplier: 1, constant: 10);
        let greenviewContranintTop = NSLayoutConstraint.init(item: self.greenView, attribute: .Top, relatedBy: .Equal, toItem: self.redView, attribute: .Bottom, multiplier: 1, constant: 10);
        let greenviewContranintWidth = NSLayoutConstraint.init(item: self.greenView, attribute: .Width, relatedBy: .Equal, toItem: self.redView, attribute: .Width, multiplier: 1, constant: 0);
        let greenviewContranintHeight = NSLayoutConstraint.init(item: self.greenView, attribute: .Height, relatedBy: .Equal, toItem: self.redView, attribute: .Height, multiplier: 1, constant: 0);
        NSLayoutConstraint.activateConstraints([greenviewContranintLeft,greenviewContranintTop,greenviewContranintWidth,greenviewContranintHeight])
        
        
        
        
        
    }

    
    
    
}
