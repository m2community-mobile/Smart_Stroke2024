//
//  BloodPopUpViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/03/04.
//

import Foundation
import UIKit

class BloodPopUpViewController: UIViewController {
    
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = ""
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .white
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    var naviBar : UIView!
    var backImage: UIImage!
    var textView: UIView!
    var detailLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        
        
        
        
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
       
        
        
        
        self.view.backgroundColor = UIColor.white

        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.1579108536, green: 0.1717843711, blue: 0.3275443316, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.1579108536, green: 0.1717843711, blue: 0.3275443316, alpha: 1)
        naviBar.layer.addBorder([.bottom], color: .lightGray, width: 0.3)
        self.view.addSubview(naviBar)
        
        
        var buImageView = UIImageView(frame: CGRect(x: 15, y: 15, width: 25, height: 25))
        naviBar.addSubview(buImageView)
        var buImg = UIImage(named: "smRlaVy")
        buImageView.image = buImg
        
        var buTitle = UILabel(frame: CGRect(x: buImageView.frame.maxX + 10, y: 15, width: self.view.frame.width, height: 25))
        buTitle.text = "자가 혈압측정 시 주의사항"
        buTitle.font = UIFont(name: "SUITE-Regular", size: 17)
        buTitle.textColor = .white
        naviBar.addSubview(buTitle)
        
        var xButton = UIButton(frame: CGRect(x: self.view.frame.size.width - 40, y: 15, width: 20, height: 20))
        xButton.setImage(UIImage(named: "imgX"), for: .normal)
        xButton.addTarget(self, action: #selector(back(_ :)), for: .touchUpInside)
        naviBar.addSubview(xButton)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

//          scrollView.addSubview(labelOne)
//
//          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

//        scrollView.addSubview(labelTwo)
//        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2000).isActive = true
//        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        var backScreen = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height / 2.6))
        backScreen.image = UIImage(named: "backScreen")
        
        scrollView.addSubview(backScreen)
        
        
        textView = UIView(frame: CGRect(x: 0, y: backScreen.frame.maxY, width: self.view.frame.width, height: self.view.frame.size.height))
//        textView.backgroundColor = .yellow
        scrollView.addSubview(textView)
        
        
        if IS_IPHONE_N_PLUS {
            detailLabel = UILabel(frame: CGRect(x: 15, y: -180, width: self.view.frame.width - 30, height: textView.frame.size.height))
            detailLabel.font = UIFont(name: "SUITE-Regular", size: 16)
        } else if IS_IPHONE_X{
            detailLabel = UILabel(frame: CGRect(x: 15, y: -230, width: self.view.frame.width - 30, height: textView.frame.size.height))
            detailLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else if IS_IPHONE_N {
            detailLabel = UILabel(frame: CGRect(x: 15, y: -180, width: self.view.frame.width - 30, height: textView.frame.size.height))
            detailLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else {
            detailLabel = UILabel(frame: CGRect(x: 15, y: -260, width: self.view.frame.width - 30, height: textView.frame.size.height))
            detailLabel.font = UIFont(name: "SUITE-Regular", size: 18)
        }
        detailLabel.text = """
혈압은 기상직후 소변을 본 이후 1시간 이내나 또는 취침 전 적어도 하루 두 번 측정 하는 것이 좋습니다.

혈압이 안정되지 않을 때는 1주일에 적어도 5일 이상, 혈압이 잘 조절되는 경우에는 1주일에 3일 이상 측정합니다.

조용한 실내에서 2~5분 정도 안정을 취하고 1분 간격으로 2~3차례 측정하여 평균을 구합니다.

혈압계와 압박대의 위치는 가능한 심장과 같은 높이로 놓습니다.

항상 같은 자세로 앉거나 누워 측정합니다.

식사나 목욕 후라면 1시간 이상 지난 후에 측정합니다.

커피나 담배는 측정 전에 삼가도록 합니다.
"""
        detailLabel.numberOfLines = 0
        
        
        textView.addSubview(detailLabel)
        
        
        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 50).isActive = true
        
    }
    @objc func back(_ sender: UIButton) {
//        self.dismiss(animated: false)
        
//        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
//          let homeVC = BloodPressureViewController2()
//          homeVC.modalPresentationStyle = .fullScreen
//          let appDelegate = UIApplication.shared.delegate as! AppDelegate
//          appDelegate.window?.rootViewController?.present(homeVC, animated: true, completion: nil)
//        })
        
        let vc = BloodPressureViewController2()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
        
    }
    
}
