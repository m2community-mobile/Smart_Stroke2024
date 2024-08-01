//
//  compnent4TableViewCell.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class Compnent4TableViewCell: UITableViewCell {

    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 130
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent4TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent4TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<4 {
            let cellComponentViewX = (innerView.frame.size.width / 2) * CGFloat(i % 2)
            let cellComponentViewY = (((innerView.frame.size.height) / 2)) * CGFloat(i / 2)
            let cellComponentView = CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            cellComponentView.frame.size.width = innerView.frame.size.width * 0.5
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    override var frame: CGRect {
           get {
               return super.frame
           }
           set (newFrame) {
               var frame = newFrame
               let newWidth = frame.width * 0.94 // get 80% width here
               let space = (frame.width - newWidth) / 2
               frame.size.width = newWidth
               frame.origin.x += space

               super.frame = frame

           }
       }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
}


class Compnent5TableViewCell: UITableViewCell {
    
    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 130
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent5TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent5TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<5 {
            let cellComponentViewX = (innerView.frame.size.width / 3) * CGFloat(i % 3)
            let cellComponentViewY = (((innerView.frame.size.height) / 2)) * CGFloat(i / 3)
            let cellComponentView = CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    override var frame: CGRect {
           get {
               return super.frame
           }
           set (newFrame) {
               var frame = newFrame
               let newWidth = frame.width * 0.94 // get 80% width here
               let space = (frame.width - newWidth) / 2
               frame.size.width = newWidth
               frame.origin.x += space

               super.frame = frame

           }
       }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// 1) cell에 Protocol을 만들어준다.
// 위치 : TableViewCell

// 범용성을 위해 class가 아닌 AnyObject로 선언해준다.
protocol ContentsMainTextDelegate: AnyObject {
    // 위임해줄 기능
    func categoryButtonTapped(_ button: UIButton)
    func editButtonTapper(_ button: UIButton)
}


class Compnent3TableViewCell: UITableViewCell {
    
    var cellComponentViews = [CellComponentView]()
    
    var cellDelegate: ContentsMainTextDelegate?

    
    var redButton: UIButton!
    var editButton: UIButton!
    var isChecked = true
    
    static let cellHeight : CGFloat = 70
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent3TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent3TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        redButton = UIButton(frame: CGRect(x: self.frame.size.width * 0.7, y: 0, width: 150, height: 90))
        redButton.backgroundColor = .red
        redButton.setTitle(" 삭제", for: .normal)
        
        
        
        var penBtnImageView = UIImageView(frame: CGRect(x: 40, y: 40, width: 20, height: 20))
//        if IS_IPHONE_12PRO {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 7, width: 10, height: 10))
//        } else if IS_IPHONE_15PRO {
//            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
//        } else if IS_IPHONE_N_PLUS {
//            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 7, width: 9, height: 9))
//        } else if IS_IPHONE_N {
//            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
//        } else if IS_IPHONE_12PRO_MAX {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
//        } else if IS_IPHONE_15PRO_MAX {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
//        }
        let penBtnImage = UIImage(named: "trash")
        penBtnImageView.image = penBtnImage
        redButton.layer.zPosition = 999
        redButton.addSubview(penBtnImageView)
        redButton.addTarget(self, action: #selector(redAc(_ :)), for: .touchUpInside)
        self.addSubview(redButton)
        
        
        editButton = UIButton(frame: CGRect(x: SCREEN.WIDTH - self.frame.size.width * 0.7, y: 0, width: 150, height: 90))
        editButton.backgroundColor = .blue
        editButton.setTitle(" 수정", for: .normal)
        
        
        
        var penBtnImageView2 = UIImageView(frame: CGRect(x: 40, y: 40, width: 20, height: 20))
//        if IS_IPHONE_12PRO {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 7, width: 10, height: 10))
//        } else if IS_IPHONE_15PRO {
//            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
//        } else if IS_IPHONE_N_PLUS {
//            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 7, width: 9, height: 9))
//        } else if IS_IPHONE_N {
//            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
//        } else if IS_IPHONE_12PRO_MAX {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
//        } else if IS_IPHONE_15PRO_MAX {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
//        }
        let penBtnImage2 = UIImage(named: "")
        penBtnImageView2.image = penBtnImage2
        editButton.layer.zPosition = 999
        editButton.addSubview(penBtnImageView2)
        editButton.addTarget(self, action: #selector(editAc(_ :)), for: .touchUpInside)
        self.addSubview(editButton)
        
        
        
//        redButton.isHidden = true
        
        for i in 0..<3 {
            let cellComponentViewX = (innerView.frame.size.width / 3) * CGFloat(i % 3)
            let cellComponentViewY = (((innerView.frame.size.height))) * CGFloat(i / 3)
            let cellComponentView = CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            cellComponentView.valueLabel.font = UIFont.boldSystemFont(ofSize: 15)
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    override var frame: CGRect {
           get {
               return super.frame
           }
           set (newFrame) {
               var frame = newFrame
               let newWidth = frame.width * 0.94 // get 80% width here
               let space = (frame.width - newWidth) / 2
               frame.size.width = newWidth
               frame.origin.x += space

               super.frame = frame

           }
       }
    
    
    @objc func redAc(_ button: UIButton) {
        cellDelegate?.categoryButtonTapped(redButton)
        
    }
    
    
    @objc func editAc(_ button: UIButton) {
        cellDelegate?.editButtonTapper(editButton)
    }
    
    
    func showButton(show: Bool) {
           if show {
               editButton.isHidden = !show
               redButton.isHidden = !show
               print("no hidden")
           } else {
               editButton.isHidden = !show
               redButton.isHidden = !show
               print("hidden")
           }
       }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func showButton(show: Bool) {
//         if show {
//             
//             redButton.isHidden = !show
//         } else {
//             
//             redButton.isHidden = !show
//         }
//     }
    
}

class Compnent2TableViewCell: UITableViewCell {
    
    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 70
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent3TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent2TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<2 {
            let cellComponentViewX = (innerView.frame.size.width / 2) * CGFloat(i % 2)
            let cellComponentViewY = (((innerView.frame.size.height))) * CGFloat(i / 2)
            
            let cellComponentView = CellComponentView(frame: CGRect(x: cellComponentViewX, y: cellComponentViewY, width: innerView.frame.size.width / 2, height: CellComponentView.height))
//                CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
