//
//  GoBrainCell.swift
//  Smart_Stroke2024
//
//  Created by m2comm on 2024/08/01.
//











import UIKit
class GoBrainCell: UITableViewCell {
    
    static var height : CGFloat = {
      
        return 40
    }()
    
    
    static let cellId = "cell"
    
    var titleLabel : UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        
        
        setUp()
        print("test")
              
        
        
    }
    
    func setUp() {
        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        titleLabel.text = ""
        titleLabel.textColor = .black
        
        
        self.addSubview(titleLabel)
        
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
