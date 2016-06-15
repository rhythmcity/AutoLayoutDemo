//
//  SecondViewController.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var redView : UIView = {
        var view = UIView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.redColor()
        return view
    
    }()
    
    lazy var actionButton:UIButton = {
        var button = UIButton.init(type: .Custom)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("动一下", forState: .Normal)
            button.backgroundColor = UIColor.orangeColor()
            button.addTarget(self, action: Selector("buttonTap:"), forControlEvents: .TouchUpInside)
            return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.redView)
        self.view.addSubview(self.actionButton);
        
        let actionButtonViewContrantLeft = NSLayoutConstraint.init(item: self.actionButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 64)
        let actionButtonViewContrantTop = NSLayoutConstraint.init(item: self.actionButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 64)
        let actionButtonViewContrantWidth = NSLayoutConstraint.init(item: self.actionButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1, constant: 100)
        let actionButtonViewContrantHeight = NSLayoutConstraint.init(item: self.actionButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: 60)
        NSLayoutConstraint.activateConstraints([actionButtonViewContrantLeft,actionButtonViewContrantTop,actionButtonViewContrantWidth,actionButtonViewContrantHeight])

        
        let redViewContrantCenterX = NSLayoutConstraint.init(item: self.redView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let redViewContrantCenterY = NSLayoutConstraint.init(item: self.redView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0)
        let redViewContrantWidth = NSLayoutConstraint.init(item: self.redView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1, constant: 100)
        let redViewContrantHeight = NSLayoutConstraint.init(item: self.redView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: 100)
        NSLayoutConstraint.activateConstraints([redViewContrantCenterX,redViewContrantCenterY,redViewContrantWidth,redViewContrantHeight])
        
    }

    internal func buttonTap(sender:UIButton) -> Void {
        
        
  
        
        if  sender.selected {
            for  contrant in  self.redView.constraints {
                if contrant.firstAttribute == .Width {
                    contrant.constant = 100;
                }
                
            }
            
            for  contrant in  self.redView.constraints {
                if contrant.firstAttribute == .Height {
                    contrant.constant = 100;
                }
            }
        } else {
        
            for  contrant in  self.redView.constraints {
                if contrant.firstAttribute == .Width {
                    contrant.constant = 50;
                }
                
            }
            
            for  contrant in  self.redView.constraints {
                if contrant.firstAttribute == .Height {
                    contrant.constant = 50;
                }
            }

        }
        
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
        sender.selected = !sender.selected;
       
    
    
    }
 }
