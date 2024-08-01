//
//  PrecautionsView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 25..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class PrecautionsView: UIButton {

    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 72))
    }
    
    var contentLabel : UILabel!
    
    private var contentView : UIView!
    private var labelBackView : UIView!
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView = UIView(frame: CGRect(x: 20, y: 15, width: SCREEN.WIDTH - 40, height: 42))
        contentView.layer.borderColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1).cgColor
        contentView.layer.borderWidth = 0.5
        contentView.isUserInteractionEnabled = false
        self.addSubview(contentView)
        
        labelBackView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 16))
        labelBackView.isUserInteractionEnabled = false
        contentView.addSubview(labelBackView)
        
        let iConImage = #imageLiteral(resourceName: "btnBNoti")
        let iConView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        iConView.image = iConImage
        iConView.isUserInteractionEnabled = false
        labelBackView.addSubview(iConView)
        
        self.contentLabel = UILabel(frame: CGRect(x: iConView.frame.maxX + 7.5, y: 0, width: 0, height: 16))
        self.contentLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        self.contentLabel.textColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
        self.contentLabel.isUserInteractionEnabled = false
        labelBackView.addSubview(self.contentLabel)
        
        labelBackView.frame.size.width = self.contentLabel.frame.maxX
        labelBackView.center = CGPoint(x: contentView.frame.size.width / 2, y: contentView.frame.size.height / 2)
    }
    
    func setContentLabelString( content : String ){
        self.contentLabel.text = content
        var newSize = self.contentLabel.sizeThatFits(CGSize(width: SCREEN.WIDTH , height: 16))
        newSize.height = 16
        self.contentLabel.frame.size = newSize
        
        labelBackView.frame.size.width = self.contentLabel.frame.maxX
        labelBackView.center = CGPoint(x: contentView.frame.size.width / 2, y: contentView.frame.size.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
