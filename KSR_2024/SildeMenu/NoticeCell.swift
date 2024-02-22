//
//  File.swift
//  KSR_2024
//
//  Created by m2comm on 2024/02/20.
//


import Foundation
import UIKit

class NoticeCell: UITableViewCell {
    
    static var height : CGFloat = {
      
        return 50
    }()
    
    static let cellId = "cell"
    
    var titleLabel : UILabel!
    var subTitleLabel: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        
        
        setUp()
        
              
        
        
    }
    
    func setUp() {
        titleLabel = UILabel(frame: CGRect(x: 20, y: 36, width: self.frame.width, height: 20))
        titleLabel.text = ""
        titleLabel.textColor = .black
//        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.font = UIFont(name: "SUITE-Heavy", size: 18)
        
        
        self.addSubview(titleLabel)
        
        subTitleLabel = UILabel(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 5, width: self.frame.width, height: 20))
        subTitleLabel.font = UIFont(name: "SUITE-Regular", size: 16)
        self.addSubview(subTitleLabel)
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:  10).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10).isActive = true
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
