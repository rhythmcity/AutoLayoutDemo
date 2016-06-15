//
//  AutoLayoutCell.swift
//  AutoLayoutDemo
//
//  Created by 李言 on 16/6/15.
//  Copyright © 2016年 李言. All rights reserved.
//


import UIKit

class AutoLayoutCell: UITableViewCell {
    
    lazy var headimage:UIImageView = {
        var imageView = UIImageView.init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel:UILabel = {
        var label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentImage:UIImageView = {
        var imageView = UIImageView.init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var desLabel:UILabel = {
        var label = UILabel.init()
        label.numberOfLines = 0
        label.backgroundColor = UIColor.grayColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contranit1:NSLayoutConstraint?
    var contranrt2:NSLayoutConstraint?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.headimage)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.contentImage)
        self.contentView.addSubview(self.desLabel)
    
        self.addConstraintToHeadImage()
        self.addConStraintToNameLabel()
        self.addConstraintToContentImage()
        self.addconstraintToDesLabel()
    
    }
    
    func addConstraintToHeadImage() -> Void {
        let headImageLeft = NSLayoutConstraint.init(item: self.headimage, attribute: .Left, relatedBy: .Equal, toItem: self.contentView, attribute: .Left, multiplier: 1, constant: 10)
        let headImageTop = NSLayoutConstraint.init(item: self.headimage, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1, constant: 10)
        let headImageWidth = NSLayoutConstraint.init(item: self.headimage, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        let headImageHeight = NSLayoutConstraint.init(item: self.headimage, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activateConstraints([headImageLeft,headImageTop,headImageWidth,headImageHeight])
    
    }
    
    func addConStraintToNameLabel() -> Void {
        
        let nameLabelLeft = NSLayoutConstraint.init(item: self.nameLabel, attribute: .Left, relatedBy: .Equal, toItem: self.headimage, attribute: .Right, multiplier: 1, constant: 10)
        let nameLabelCentetY = NSLayoutConstraint.init(item: self.nameLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.headimage, attribute: .CenterY, multiplier: 1, constant: 0)

        NSLayoutConstraint.activateConstraints([nameLabelLeft,nameLabelCentetY])
    }
    
    func addConstraintToContentImage() -> Void {
        
        let contentImageTop = NSLayoutConstraint.init(item: self.contentImage, attribute: .Top, relatedBy: .Equal, toItem: self.headimage, attribute: .Bottom, multiplier: 1, constant: 10)
        let contentImageLeft = NSLayoutConstraint.init(item: self.contentImage, attribute: .Left, relatedBy: .Equal, toItem: self.headimage, attribute: .Left, multiplier: 1, constant: 0)
        let contentImageWidth = NSLayoutConstraint.init(item: self.contentImage, attribute: .Width, relatedBy: .Equal, toItem: self.contentView, attribute: .Width, multiplier: 1, constant: -20)
        let contentImageHeight = NSLayoutConstraint.init(item: self.contentImage, attribute: .Height, relatedBy: .Equal, toItem: self.contentImage, attribute: .Width, multiplier: 1, constant: 0)
        NSLayoutConstraint.activateConstraints([contentImageLeft,contentImageTop,contentImageWidth,contentImageHeight])
    }
    
     func addconstraintToDesLabel() -> Void {
        self.contranit1 = NSLayoutConstraint.init(item: self.desLabel, attribute: .Top, relatedBy: .Equal, toItem: self.headimage, attribute: .Bottom, multiplier: 1, constant: 10)
        self.contranrt2 = NSLayoutConstraint.init(item: self.desLabel, attribute: .Top, relatedBy: .Equal, toItem: self.contentImage, attribute: .Bottom, multiplier: 1, constant: 10)
        
        self.contranit1?.priority = UILayoutPriorityDefaultHigh
        self.contranrt2?.priority = UILayoutPriorityDefaultLow
        
        let desLabelLeft = NSLayoutConstraint.init(item: self.desLabel, attribute: .Left, relatedBy: .Equal, toItem: self.contentView, attribute: .Left, multiplier: 1, constant: 10)
        let desLabelRight = NSLayoutConstraint.init(item: self.desLabel, attribute: .Right, relatedBy: .Equal, toItem: self.contentView, attribute: .Right, multiplier: 1, constant: -10)
        let desLabelBottom = NSLayoutConstraint.init(item: self.desLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1, constant: -10)
        
    
       NSLayoutConstraint.activateConstraints([self.contranit1!,self.contranrt2!,desLabelRight,desLabelLeft,desLabelBottom])
    }
    
    
    internal func setDataModel(model:DataModel)  {
    
        self.headimage.image = model.head
        self.nameLabel.text = model.name
        
        if let image = model.image {
            self.contranit1?.priority = UILayoutPriorityDefaultLow
            self.contranrt2?.priority = UILayoutPriorityDefaultHigh
      
            self.contentImage.image = image
            self.contentImage.hidden = false
        } else {
            self.contranit1?.priority = UILayoutPriorityDefaultHigh
            self.contranrt2?.priority = UILayoutPriorityDefaultLow
            self.contentImage.hidden = true
        
        }
        self.desLabel.text = model.des
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
