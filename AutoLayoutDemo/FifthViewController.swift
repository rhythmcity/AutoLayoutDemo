//
//  FifthViewController.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    lazy var label1:UILabel = {
        var label = UILabel.init()
        label.text = "AutoLayout!"
        label.backgroundColor = UIColor .brownColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: .Horizontal)
        return label
    }()
    
    lazy var label2:UILabel = {
        var label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AutoLayout！"
        label.backgroundColor = UIColor .yellowColor()
        label.setContentHuggingPriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        return label
    }()
    
    lazy var label3:UILabel = {
        var label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "用纯代码写原生的AutoLayout！"
        label.backgroundColor = UIColor .purpleColor()
        label.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: .Horizontal)
        return label
    }()
    
    lazy var label4:UILabel = {
        var label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "用纯代码写原生的AutoLayout！"
        label.backgroundColor = UIColor .orangeColor()
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        return label
    }()
    
    lazy var label5:UILabel = {
        var label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.userInteractionEnabled = true
        label.text = "用纯代码写原生的AutoLayout！"
        label.backgroundColor = UIColor .greenColor()
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        return label
    }()

    lazy var view1:UIView = {
        var view = UIView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.redColor()
        view.hidden = true
        return view
    }()
    
    var lable5right1 : NSLayoutConstraint!;
    var lable5right2 : NSLayoutConstraint!;
    var view1Width  :NSLayoutConstraint!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.label1)
        self.view.addSubview(self.label2)
        self.view.addSubview(self.label3)
        self.view.addSubview(self.label4)
        self.view.addSubview(self.label5)
        self.view.addSubview(self.view1)
        
        let label1Top = NSLayoutConstraint.init(item: self.label1, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 80)
        let label1Left = NSLayoutConstraint.init(item: self.label1, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10)
        let lable1right = NSLayoutConstraint.init(item: self.label1, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10)
        lable1right.priority = UILayoutPriorityDefaultHigh
        
        let label2Top = NSLayoutConstraint.init(item: self.label2, attribute: .Top, relatedBy: .Equal, toItem: self.label1, attribute: .Bottom, multiplier: 1, constant: 20)
        let label2Left = NSLayoutConstraint.init(item: self.label2, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10)
        let lable2right = NSLayoutConstraint.init(item: self.label2, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10)
        
        NSLayoutConstraint.activateConstraints([label1Top,label1Left,lable1right,label2Top,label2Left,lable2right])
        
        let label3Top = NSLayoutConstraint.init(item: self.label3, attribute: .Top, relatedBy: .Equal, toItem: self.label2, attribute: .Bottom, multiplier: 1, constant: 20)
        let label3Left = NSLayoutConstraint.init(item: self.label3, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10)
        let lable3right = NSLayoutConstraint.init(item: self.label3, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -200)
        lable3right.priority = UILayoutPriorityDefaultHigh
        
        let label4Top = NSLayoutConstraint.init(item: self.label4, attribute: .Top, relatedBy: .Equal, toItem: self.label3, attribute: .Bottom, multiplier: 1, constant: 20)
        let label4Left = NSLayoutConstraint.init(item: self.label4, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10)
        let lable4right = NSLayoutConstraint.init(item: self.label4, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -200)
        NSLayoutConstraint.activateConstraints([label3Top,label3Left,lable3right,label4Top,label4Left,lable4right])
        
        
        let label5Top = NSLayoutConstraint.init(item: self.label5, attribute: .Top, relatedBy: .Equal, toItem: self.label4, attribute: .Bottom, multiplier: 1, constant: 20)
        let label5Left = NSLayoutConstraint.init(item: self.label5, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10)
        self.lable5right1 = NSLayoutConstraint.init(item: self.label5, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: 10)
        self.lable5right2 = NSLayoutConstraint.init(item: self.label5, attribute: .Right, relatedBy: .Equal, toItem: self.view1, attribute: .Left, multiplier: 1, constant: -10)
        self.lable5right1.priority = 750
        self.lable5right2.priority = 500
        
        let view1Top = NSLayoutConstraint.init(item: self.view1, attribute: .Top, relatedBy: .Equal, toItem: self.label5, attribute: .Top, multiplier: 1, constant: 0)
        let view1Left = NSLayoutConstraint.init(item: self.view1, attribute: .Left, relatedBy: .Equal, toItem: self.label5, attribute: .Right, multiplier: 1, constant: 10)
        let view1Right = NSLayoutConstraint.init(item: self.view1, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10)
        let view1Height = NSLayoutConstraint.init(item: self.view1, attribute: .Height, relatedBy: .Equal, toItem: self.label5, attribute: .Height, multiplier: 1, constant: 0)
        self.view1Width = NSLayoutConstraint.init(item: self.view1, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200)
        self.view1Width.priority = 500;
        
        
        NSLayoutConstraint.activateConstraints([label5Top,label5Left,self.lable5right1,self.lable5right2,view1Top,view1Left,view1Right,view1Height,self.view1Width])

    
        let tap = UITapGestureRecognizer.init(target: self, action: Selector("labelTap:"))
        self.label5.addGestureRecognizer(tap)
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func labelTap(tap:UITapGestureRecognizer) -> Void {
        
        
        if self.view1.hidden {
            self.view1Width.priority = 750
            self.lable5right1.priority = 500
            self.lable5right2.priority = 750
            self.view1.hidden = false
        } else {
        
            self.view1Width.priority = 500
            self.lable5right1.priority = 750
            self.lable5right2.priority = 500
            self.view1.hidden = true

        
        }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
