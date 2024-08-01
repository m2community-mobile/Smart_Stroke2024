
import Foundation
import UIKit



class ChangeDataBloodPressureViewController: BaseViewController {
    
    var BloodPressureWebView : WebView!
    var BloodPressureManagementNotebookView : BloodPressureManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
    
        var bloodPressureListView : BloodPressureListView!
    var set: UIView!
    var segView : SegmentedView!
    
    var addView: UIView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    //
    var showLabel: UILabel!
    
    var circularProgressBarView: CircularProgressView!
        var circularViewDuration: TimeInterval = 2

    var random: CGFloat!
    var perTest: CGFloat!
    //
    
    //
    var contractionInputView: UITextField!
    var relaxtionInputView: UITextField!
    var heartRateInputView: UITextField!
    
    var ShrinkGoal: UITextField!
    var relaxationGoal: UITextField!
    var pulseGoal: UITextField!

    var saveBTN: UIButton!
    var cancelBTN: UIButton!

    
    var goalCancelBTN: UIButton!
    var goalSaveBTN: UIButton!
    
    var today : Date!
    
    var UnderBar: UIView!
    
    var titleName: UILabel!
    
    var saveView: UIView!
    var dateView: UIView!
    var dateViewLabel: UILabel!
    
    var keyCounter = 0
    
    let datePicker = UIDatePicker()
    var changeTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        keyCounter = 0
        
        
        print("count \(keyCounter)")
        
        print("here")
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("goal1"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("goal2"), object: nil)
//        UnderBar = UIView(frame: CGRect(x: button2.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.5, height: 5))
//        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        self.view.addSubview(UnderBar)
        
        setupKeyboardEvent()
        
        hideKeyboardWhenTappedAround()
        scrollView.keyboardDismissMode = .onDrag
        
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        titleName.text = "혈압"
        titleName.textColor = .white
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
     
        label1.text = "혈압관리\n도움말"
        label1.font = UIFont(name: "SUITE-Regular", size: 14)
        label2.text = "혈압\n관리수첩"
        label2.font = UIFont(name: "SUITE-Regular", size: 14)
        label3.text = "혈압\n기록보기"
        label3.font = UIFont(name: "SUITE-Regular", size: 14)
        
        label1.textColor = .lightGray
        label2.textColor = .black
        label3.textColor = .lightGray
        
        

        baseUnderBar.frame.origin = CGPoint(x: self.view.frame.size.width / 2.2, y: button2.frame.size.height - 2)
        
        self.BloodPressureWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: URL_Addres.what_is_high_blood_pressure)
        
        BloodPressureManagementNotebookView = Smart_Stroke2024.BloodPressureManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        BloodPressureManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(BloodPressureManagementNotebookView)
        
        self.view.addSubview(self.BloodPressureWebView)
        
        
        
        
        self.bloodPressureListView = BloodPressureListView(frame: CGRect(
                    x: 0,
                    y: menuView.frame.maxY,
                    width: SCREEN.WIDTH,
                    height: SCREEN.HEIGHT - menuView.frame.maxY))
        bloodPressureListView.backgroundColor = .white
        self.view.addSubview(self.bloodPressureListView)
        
//                self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
        
                
        
        
        
//        addView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 100))
//        addView.backgroundColor = .yellow
////        bloodPressureListView.addSubview(addView)
        bloodPressureListView.backgroundColor = #colorLiteral(red: 0.9450935721, green: 0.9524920583, blue: 0.9736705422, alpha: 1)
        if IS_IPHONE_X {
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.4, y: 20, width: 100, height: 50))
        } else if IS_IPHONE_N{
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.6, y: 20, width: 100, height: 50))
        } else {
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.2, y: 20, width: 100, height: 50))
        }
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.white, for: .normal)
        testBtn1.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        
        testBtn1.layer.cornerRadius = 8
        bloodPressureListView.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 50))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 0.1406538188, green: 0.347869575, blue: 0.5851272941, alpha: 1), for: .normal)
        testBtn2.layer.borderWidth = 1
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        testBtn2.layer.cornerRadius = 8
        bloodPressureListView.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        BloodPressureManagementNotebookView.BloodPressureView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 3))
        
        BloodPressureManagementNotebookView.BloodPressureView.setGradient2(color1: UIColor(red: 0.0 / 255.0, green: 136.0 / 255.0, blue: 241.0 / 255.0, alpha: 1), color2: UIColor(red: 0.0 / 255.0, green: 173.0 / 255.0, blue: 175.0 / 255.0, alpha: 1))
        
        
//        BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = #colorLiteral(red: 0.001859865268, green: 0.6434201002, blue: 0.7680490613, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(BloodPressureManagementNotebookView.BloodPressureView)
        
        
        
        
        let strokeUnderBar = UIView(frame: CGRect(x: 0, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 1, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height - 40))
strokeUnderBar.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
        strokeUnderBar.center.x = BloodPressureManagementNotebookView.BloodPressureView.frame.size.width / 2
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(strokeUnderBar)
        
        
        
        
        
        
        BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        
        if IS_IPHONE_N {
            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 28, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 31, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 31, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        
        if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 31, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        else if IS_IPHONE_MINI{
            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 28, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 40, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//        }
//
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 40, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//        }
        
        
        
        BloodPressureManagementNotebookView.BloodPressureVewLabel.text = "나의 혈압\n목표 수치는?"
        
        BloodPressureManagementNotebookView.BloodPressureVewLabel.numberOfLines = 0
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.layer.borderWidth = 1
        BloodPressureManagementNotebookView.BloodPressureVewLabel.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureVewLabel.textAlignment = .center
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont.systemFont(ofSize: 20)
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Heavy", size: 20)
    
        if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        }   else if IS_IPHONE_MINI{
            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        }else {
            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        }
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewLabel)
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
        
        
        
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.text = "수축기"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 2
        if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
        }
        if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
        }
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textAlignment = .center
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont.systemFont(ofSize: 16)
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont(name: "SUITE-Regular", size: 16)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name)

        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = UserDefaults.standard.string(forKey: "")
        
     if IS_IPHONE_MINI{
         BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 38, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
    }
        
        if IS_IPHONE_N {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 38, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 41, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 41, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        
        if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 41, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
//
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
//



        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textAlignment = .right
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont.systemFont(ofSize: 30)
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont(name: "SUITE-Heavy", size: 26)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number)
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.text = "mmHg"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textAlignment = .left
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont.systemFont(ofSize: 13)
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont(name: "SUITE-Regular", size: 13)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1)
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.text = "이완기"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 2
        if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
        }
        if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
        }
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textAlignment = .center
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont.systemFont(ofSize: 16)
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont(name: "SUITE-Regular", size: 16)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name)
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        
        
        if IS_IPHONE_MINI{
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 38, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
       }
        
        if IS_IPHONE_N {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 38, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 41, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 41, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        
        if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 41, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        }
        
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
//
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
        
        
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = " 80"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textAlignment = .right
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont.systemFont(ofSize: 30)
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont(name: "SUITE-Heavy", size: 26)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number)
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mmHg"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textAlignment = .left
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 13)
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont(name: "SUITE-Regular", size: 13)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.layer.borderWidth = 1
        
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
        
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: 35, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.frame.maxY + 1, width: self.view.frame.size.width / 2, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mg/dL"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 22)
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
        
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 150, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        
        if IS_IPHONE_MINI{
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 125, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
       }
        
        if IS_IPHONE_N {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 125, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 135, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 125, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        
        if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 125, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        }
        
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
//
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
        
        
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.text = " 목표 수치\n달성율은?"
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.numberOfLines = 0
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.layer.borderWidth = 1
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont.systemFont(ofSize: 20)
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 20)
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        
        if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else {
            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        }

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowLabel)
        
        
        BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 55, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
        
        if IS_IPHONE_MINI{
            BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 110, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
       }
        if IS_IPHONE_N {
            BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 110, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
        }
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 90, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 100, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
        }
        
        if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 100, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
        }
        
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
//
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        }
        
        
        
        
        BloodPressureManagementNotebookView.BloodPressureVewGraph.backgroundColor = .clear
        
        //
        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
        
        
        
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 8, y: 22, width: 45, height: 30))
            
            
            
//                    showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 14)
            showLabel.textColor = .white
            showLabel.textAlignment = .center
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = "100%"
//            showLabel.text = "100%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_N_PLUS {
            showLabel = UILabel(frame: CGRect(x: 30, y: 19, width: 45, height: 30))
            
            
            
//                    showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.textAlignment = .center
            showLabel.text = "\(changeShowLabel ?? 0)%"
        } else if IS_IPHONE_12PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 44, y: 33, width: 42, height: 30))
            
            
            showLabel.textAlignment = .center
//                    showLabel.layer.borderWidth = 1
            
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 00)%"
            showLabel.text = "\(changeShowLabel ?? 0)%"
        } else if IS_IPHONE_15PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 44, y: 33, width: 42, height: 30))
            
            
            showLabel.textAlignment = .center
//                    showLabel.layer.borderWidth = 1
            
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 00)%"
            showLabel.text = "\(changeShowLabel ?? 0)%"
        } else if IS_IPHONE_N {
            showLabel = UILabel(frame: CGRect(x: 4, y: 21, width: 53, height: 30))
            
            
            
//                    showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        } else if IS_IPHONE_12PRO {
            showLabel = UILabel(frame: CGRect(x: 16, y: 21, width: 53, height: 30))
            
            
            
//                    showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        } else if IS_IPHONE_15PRO {
            showLabel = UILabel(frame: CGRect(x: 16, y: 21, width: 53, height: 30))
            
            
            
//                    showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        } else {
            showLabel = UILabel(frame: CGRect(x: 17, y: 21, width: 42, height: 30))
            
            
            
//                    showLabel.layer.borderWidth = 1
            
            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
//        else {
//            showLabel = UILabel(frame: CGRect(x: 17, y: 21, width: 42, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        }
        
        
        var perGraphTest = UserDefaults.standard.object(forKey: "perGraph")
        
        
        if IS_IPHONE_12PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 8) - 4, y: 0, width: 100, height: 100), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
            
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                perTest = 00
                
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
//            perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            ProgressView.progress = perTest
            
            
            
            
      
            //
        } else if IS_IPHONE_15PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 8) - 4, y: 0, width: 100, height: 100), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
            
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                perTest = 00
                
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
//            perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            ProgressView.progress = perTest
            
            
            
            
      
            //
        } else if IS_IPHONE_N_PLUS {
            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 15) + 2, y: -5, width: 80, height: 80), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
      
            //
        } else if IS_IPHONE_X {
            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
      
            //
        } else if IS_IPHONE_12PRO {
            let ProgressView = CircularProgressView(frame: CGRect(x: 0, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
      
            //
        } else if IS_IPHONE_15PRO {
            let ProgressView = CircularProgressView(frame: CGRect(x: 0, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
      
            //
        } else {
            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraph") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
            }
      
            //
            
        }
        
        
//        ProgressView.progressColor = .blue
//
//        ProgressView.trackColor = .lightGray
//
////        ProgressView.center = ProgressView.center
//
////        self.view.addSubview(ProgressView)
//        BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//        ProgressView.addSubview(showLabel)
//
//        ProgressView.progress = random * 0.01
//
//        //

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewGraph)
        
        BloodPressureManagementNotebookView.BloodPressureViewBTN.translatesAutoresizingMaskIntoConstraints = false
        
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 100, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        } else if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        } else if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 40, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        }else if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 40, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        } else if IS_IPHONE_N {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 38, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        } else if IS_IPHONE_MINI{
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 38, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
       }else {
            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        }
//        BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
        BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("   나의 목표 수정", for: .normal)
        if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
        }
        if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
        }
        if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
        }
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.borderWidth = 1
        BloodPressureManagementNotebookView.BloodPressureViewBTN.backgroundColor = #colorLiteral(red: 0.04629711807, green: 0.3480906487, blue: 0.5174985528, alpha: 1)
        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 12
        if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 14
        }
        if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 14
        }
        if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 12
        }
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 8)
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
        
        var penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 8, width: 10, height: 10))
        if IS_IPHONE_12PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 7, width: 10, height: 10))
        } else if IS_IPHONE_15PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
        } else if IS_IPHONE_N_PLUS {
            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 7, width: 9, height: 9))
        } else if IS_IPHONE_N {
            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
        } else if IS_IPHONE_MINI{
            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
       }else if IS_IPHONE_12PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
        } else if IS_IPHONE_15PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
        }
        let penBtnImage = UIImage(named: "myGoal")
        penBtnImageView.image = penBtnImage
        
        BloodPressureManagementNotebookView.BloodPressureViewBTN.addSubview(penBtnImageView)
        
//        let imageSize = CGSize(width: 10, height: 10)
//
//            let resizedImage = UIImage(named: "myGoal")?.resize(targetSize: imageSize)
//
//
//
//
//
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.imageView?.contentMode = .scaleToFill
        
        

//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(resizedImage, for: .normal)
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
//        } else {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(resizedImage, for: .normal)
//
//
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = .init(top: 0, left: -3, bottom: 0, right: 0)
//        }
        if IS_IPHONE_N_PLUS {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 11)
        } else if IS_IPHONE_12PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else if IS_IPHONE_15PRO {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else if IS_IPHONE_15PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else if IS_IPHONE_12PRO_MAX {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else {
            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 10)
        }
        BloodPressureManagementNotebookView.BloodPressureViewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
        
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewBTN)
//        BloodPressureManagementNotebookView.BloodPressureView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 3))
////        BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = #colorLiteral(red: 0.001859865268, green: 0.6434201002, blue: 0.7680490613, alpha: 1)
//        BloodPressureManagementNotebookView.BloodPressureView.setGradient2(color1: UIColor(red: 0.0 / 255.0, green: 136.0 / 255.0, blue: 241.0 / 255.0, alpha: 1), color2: UIColor(red: 0.0 / 255.0, green: 173.0 / 255.0, blue: 175.0 / 255.0, alpha: 1))
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
//        scrollView.addSubview(BloodPressureManagementNotebookView.BloodPressureView)
//
//        let strokeUnderBar = UIView(frame: CGRect(x: 0, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 1, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height - 40))
//strokeUnderBar.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
//        strokeUnderBar.center.x = BloodPressureManagementNotebookView.BloodPressureView.frame.size.width / 2
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(strokeUnderBar)
//
////        let strokeUnderBar = UIView(frame: CGRect(x: 0, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 1, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height - 40))
////strokeUnderBar.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
////        strokeUnderBar.center.x = BloodPressureManagementNotebookView.BloodPressureView.frame.size.width / 2
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(strokeUnderBar)
////
//
//        BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.text = "나의 혈압\n목표 수치는?"
//
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.numberOfLines = 0
////        BloodPressureManagementNotebookView.BloodPressureVewLabel.layer.borderWidth = 1
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.textAlignment = .center
////        BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont.systemFont(ofSize: 20)
////        BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Heavy", size: 20)
//
////        if IS_IPHONE_12PRO_MAX {
////            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
////        } else if IS_IPHONE_N_PLUS {
////            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////        } else if IS_IPHONE_X {
////            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
////        } else {
////            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////        }
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewLabel)
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.text = "수축기"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textAlignment = .center
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont.systemFont(ofSize: 16)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont(name: "SUITE-Regular", size: 16)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.layer.borderWidth = 1
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name)
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = "120"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textAlignment = .right
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont.systemFont(ofSize: 30)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont(name: "SUITE-Heavy", size: 26)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.layer.borderWidth = 1
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number)
////
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.text = "mmHg"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textAlignment = .left
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont.systemFont(ofSize: 13)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont(name: "SUITE-Regular", size: 13)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.layer.borderWidth = 1
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1)
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.text = "이완기"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textAlignment = .center
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont.systemFont(ofSize: 16)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont(name: "SUITE-Regular", size: 16)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.layer.borderWidth = 1
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name)
////
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = " 80"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textAlignment = .right
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textColor = .white
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont.systemFont(ofSize: 30)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont(name: "SUITE-Heavy", size: 26)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.layer.borderWidth = 1
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number)
////
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mmHg"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textAlignment = .left
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 13)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont(name: "SUITE-Regular", size: 13)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.layer.borderWidth = 1
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
////
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: 35, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.frame.maxY + 1, width: self.view.frame.size.width / 2, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mg/dL"
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
//////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 22)
//////
//////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
////
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 150, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.text = " 목표 수치\n달성율은?"
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.numberOfLines = 0
//////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.layer.borderWidth = 1
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.textColor = .white
//////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont.systemFont(ofSize: 20)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 20)
//////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
////
////        if IS_IPHONE_12PRO_MAX {
////            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
////        } else if IS_IPHONE_N_PLUS {
////            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////        } else if IS_IPHONE_X {
////            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 15)
////        } else {
////            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////        }
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowLabel)
////
////
////        BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 55, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
////        BloodPressureManagementNotebookView.BloodPressureVewGraph.backgroundColor = .clear
////
////        //
////        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
////
////        self.view.backgroundColor = .white
////        // Do any additional setup after loading the view.
////
////        if IS_IPHONE_X {
////            showLabel = UILabel(frame: CGRect(x: 8, y: 22, width: 45, height: 30))
////
////
////
////            //        showLabel.layer.borderWidth = 1
////
//////            var changeShowLabel = Int(random)
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////            print(changeShowLabel, "여기의 값은?")
////            showLabel.textAlignment = .center
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 14)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
//////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
////        } else if IS_IPHONE_N_PLUS {
////            showLabel = UILabel(frame: CGRect(x: 30, y: 19, width: 45, height: 30))
////
////
////
////            //        showLabel.ㄴayer.borderWidth = 1
////            showLabel.textAlignment = .center
//////            var changeShowLabel = Int(random)
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
////
////        } else if IS_IPHONE_12PRO_MAX {
////            showLabel = UILabel(frame: CGRect(x: 44, y: 33, width: 42, height: 30))
////
////            showLabel.textAlignment = .center
////
////            //        showLabel.layer.borderWidth = 1
////
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////            print(changeShowLabel, "여기의 값은?")
////
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
////        }  else if IS_IPHONE_N {
////            showLabel = UILabel(frame: CGRect(x: 4, y: 21, width: 53, height: 30))
////
////
////
//////                    showLabel.layer.borderWidth = 1
////            showLabel.textAlignment = .center
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////            print(changeShowLabel, "여기의 값은?")
////
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
////        } else if IS_IPHONE_12PRO {
////            showLabel = UILabel(frame: CGRect(x: 16, y: 21, width: 53, height: 30))
////
////
////
//////                    showLabel.layer.borderWidth = 1
////            showLabel.textAlignment = .center
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////            print(changeShowLabel, "여기의 값은?")
////
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
////        } else {
////            showLabel = UILabel(frame: CGRect(x: 17, y: 21, width: 42, height: 30))
////
////
////
//////                    showLabel.layer.borderWidth = 1
////
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////            print(changeShowLabel, "여기의 값은?")
////
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
////        }
////
////
////        var perGraphTest = UserDefaults.standard.object(forKey: "perGraph")
////
////
////        if IS_IPHONE_12PRO_MAX {
////            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 8) - 4, y: 0, width: 100, height: 100), lineWidth: 10, rounded: false)
////            ProgressView.progressColor = .white
////
////            ProgressView.trackColor = .white.withAlphaComponent(0.5)
////
////    //        ProgressView.center = ProgressView.center
////
////    //        self.view.addSubview(ProgressView)
////            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
////
////
////            ProgressView.addSubview(showLabel)
////
//////            ProgressView.progress = random * 0.01
////
////            if UserDefaults.standard.object(forKey: "perGraph") == nil {
////                perTest = 00
////            } else {
////                perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            }
//////            perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            ProgressView.progress = perTest
////
////
////
////
////
////            //
////        } else if IS_IPHONE_N_PLUS {
////            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 15) + 2, y: -5, width: 80, height: 80), lineWidth: 10, rounded: false)
////            ProgressView.progressColor = .white
////
////            ProgressView.trackColor = .white.withAlphaComponent(0.5)
////
////    //        ProgressView.center = ProgressView.center
////
////    //        self.view.addSubview(ProgressView)
////            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
////
////
////            ProgressView.addSubview(showLabel)
////
//////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            if UserDefaults.standard.object(forKey: "perGraph") == nil {
////                ProgressView.progress = 0
////                showLabel.textAlignment = .center
////            } else {
////                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            }
////
////            //
////        } else if IS_IPHONE_X {
////            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
////            ProgressView.progressColor = .white
////
////            ProgressView.trackColor = .white.withAlphaComponent(0.5)
////
////    //        ProgressView.center = ProgressView.center
////
////    //        self.view.addSubview(ProgressView)
////            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
////
////
////            ProgressView.addSubview(showLabel)
////
//////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            if UserDefaults.standard.object(forKey: "perGraph") == nil {
////                ProgressView.progress = 0
////                showLabel.textAlignment = .center
////            } else {
////                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            }
////
////            //
////        } else if IS_IPHONE_12PRO {
////            let ProgressView = CircularProgressView(frame: CGRect(x: 0, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
////            ProgressView.progressColor = .white
////
////            ProgressView.trackColor = .white.withAlphaComponent(0.5)
////
////    //        ProgressView.center = ProgressView.center
////
////    //        self.view.addSubview(ProgressView)
////            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
////
////
////            ProgressView.addSubview(showLabel)
////
//////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            if UserDefaults.standard.object(forKey: "perGraph") == nil {
////                ProgressView.progress = 0
////                showLabel.textAlignment = .center
////            } else {
////                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            }
////
////            //
////        } else  {
////            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
////            ProgressView.progressColor = .white
////
////            ProgressView.trackColor = .white.withAlphaComponent(0.5)
////
////    //        ProgressView.center = ProgressView.center
////
////    //        self.view.addSubview(ProgressView)
////            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
////
////
////            ProgressView.addSubview(showLabel)
////
//////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            if UserDefaults.standard.object(forKey: "perGraph") == nil {
////                ProgressView.progress = 0
////                showLabel.textAlignment = .center
////            } else {
////                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
////            }
////
////            //
////
////        }
////
////
//////        ProgressView.progressColor = .blue
//////
//////        ProgressView.trackColor = .lightGray
//////
////////        ProgressView.center = ProgressView.center
//////
////////        self.view.addSubview(ProgressView)
//////        BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//////
//////
//////        ProgressView.addSubview(showLabel)
//////
//////        ProgressView.progress = random * 0.01
//////
//////        //
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewGraph)
////
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.translatesAutoresizingMaskIntoConstraints = false
////
////
////        if IS_IPHONE_N_PLUS {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 100, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
////        } else {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
////        }
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("   나의 목표 수정", for: .normal)
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.backgroundColor = #colorLiteral(red: 0.04629711807, green: 0.3480906487, blue: 0.5174985528, alpha: 1)
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.borderWidth = 1
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 12
////        var penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 8, width: 10, height: 10))
////        if IS_IPHONE_12PRO {
////            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
////        } else if IS_IPHONE_N_PLUS {
////            penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 7, width: 10, height: 10))
////        } else if IS_IPHONE_N {
////            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
////        } else if IS_IPHONE_12PRO_MAX {
////            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 10, width: 10, height: 10))
////        }
////        let penBtnImage = UIImage(named: "myGoal")
////        penBtnImageView.image = penBtnImage
////
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.addSubview(penBtnImageView)
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
//////
//////
//////        if IS_IPHONE_12PRO_MAX {
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
//////        } else {
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = UIEdgeInsets(top: 6, left: -3, bottom: 6, right: 4)
//////        }
////
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
////        if IS_IPHONE_N_PLUS {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 11)
////        } else {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
////        }
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewBTN)
////
////        var saveData = UILabel(frame: CGRect(x: 20, y: BloodPressureManagementNotebookView.BloodPressureView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
////        saveData.text = "측정하신 혈압과 맥박을 입력해주세요."
//////        saveData.font = UIFont.systemFont(ofSize: 18)
////        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
////
////        scrollView.addSubview(saveData)
////
//////        var saveView: UIView!
////
//////        var afterBTN: UIButton!
//////        var beforeBTN: UIButton!
//////        var bloodTF: UITextField!
//////        var glycated: UITextField!
////
////        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 2.5))
////        saveView.backgroundColor = .white
//////        saveView.layer.borderWidth = 1
////        saveView.layer.cornerRadius = 8
////        scrollView.addSubview(saveView)
////
////        dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
////        dateView.backgroundColor = .white
////
////        saveView.addSubview(dateView)
////
////        dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
////        dateViewLabel.text = "일시"
//////        dateViewLabel.layer.borderWidth = 1
////        dateView.addSubview(dateViewLabel)
////        dateViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        dateViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////
////
////
////
//////        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//////        date.text = Date()
////
////        var time = Date()
////        var formatter = DateFormatter()
//////        formatter.dateFormat = "MM.dd.yyyy a h:mm"
////        formatter.locale = Locale(identifier: "ko_KR")
////
////        formatter.dateFormat = "yyyy.MM.dd a h:mm"
////        formatter.amSymbol = "오전"
////            formatter.pmSymbol = "오후"
////
////        let formattedDateInString = formatter.string(from: time)
////
////        //        if IS_IPHONE_X {
////                    BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: dateView.frame.size.width - 20 - dateViewLabel.frame.width, height: dateView.frame.height))
////        //        }
////        //        if IS_IPHONE_12PRO_MAX {
////        //            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
////        //        }
////        //        if IS_IPHONE_N_PLUS {
////        //            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
////        //        }
////        //        BloodPressureManagementNotebookView.dateLable.layer.borderWidth = 1
////                BloodPressureManagementNotebookView.dateLable.text = formattedDateInString
////                BloodPressureManagementNotebookView.dateLable.textAlignment = .right
////                BloodPressureManagementNotebookView.dateLable.layer.addBorder([.bottom], color: .lightGray, width: 1)
////
////                dateView.addSubview(BloodPressureManagementNotebookView.dateLable)
////
////                var mysystoleView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
////                mysystoleView.backgroundColor = .white
////
////                saveView.addSubview(mysystoleView)
////
////                var mysystoleViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
////                mysystoleViewLabel.text = "수축기"
////                mysystoleViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////                mysystoleViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
////                mysystoleView.addSubview(mysystoleViewLabel)
////
////
////
////        //        if IS_IPHONE_X {
////                contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mysystoleViewLabel.frame.width, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        if IS_IPHONE_12PRO_MAX {
////        //            contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 120, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        if IS_IPHONE_N_PLUS {
////        //            contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 107, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////                contractionInputView.placeholder = "측정치를 적어주세요."
////        //        contractionInputView.layer.borderWidth = 1
////                contractionInputView.textAlignment = .right
////                contractionInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
////                contractionInputView.font = UIFont(name: "SUITE-Regular", size: 17)
////                mysystoleView.addSubview(contractionInputView)
////
////
////                var mydiastoleView = UIView(frame: CGRect(x: 10, y: mysystoleView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
////                mydiastoleView.backgroundColor = .white
////
////                saveView.addSubview(mydiastoleView)
////
////                var mydiastoleViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
////                mydiastoleViewLabel.text = "이완기"
////                mydiastoleViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
////                mydiastoleViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////
////                mydiastoleView.addSubview(mydiastoleViewLabel)
////
////        //        if IS_IPHONE_X {
////                relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mydiastoleViewLabel.frame.width, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        if IS_IPHONE_12PRO_MAX {
////        //            relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 120, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        if IS_IPHONE_N_PLUS {
////        //            relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 107, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////                relaxtionInputView.placeholder = "측정치를 적어주세요."
////                relaxtionInputView.textAlignment = .right
////                relaxtionInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
////                relaxtionInputView.font = UIFont(name: "SUITE-Regular", size: 17)
////                mydiastoleView.addSubview(relaxtionInputView)
////
////
////                var mypulseView = UIView(frame: CGRect(x: 10, y: mydiastoleView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
////                mypulseView.backgroundColor = .white
////
////                saveView.addSubview(mypulseView)
////
////                var mypulseViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
////                mypulseViewLabel.text = "맥박"
////                mypulseViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////                mypulseView.addSubview(mypulseViewLabel)
////
////
////        //        if IS_IPHONE_X {
////                heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mypulseViewLabel.frame.width, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        if IS_IPHONE_12PRO_MAX {
////        //            heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 120, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        if IS_IPHONE_N_PLUS {
////        //            heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 107, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////        //        }
////        //        heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
////                heartRateInputView.placeholder = "측정치를 적어주세요."
////                heartRateInputView.textAlignment = .right
////                heartRateInputView.font = UIFont(name: "SUITE-Regular", size: 17)
////                mypulseView.addSubview(heartRateInputView)
////
////        var dangerBTN = UIButton(frame: CGRect(x: 20, y: mypulseView.frame.maxY + 5, width: dateView.frame.size.width - 20, height: dateView.frame.height / 1.5))
////                dangerBTN.setTitle("자가 혈압측정 시 주의사항", for: .normal)
////                dangerBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
////                dangerBTN.setTitleColor(.blue, for: .normal)
////                dangerBTN.layer.borderWidth = 1
////                dangerBTN.layer.cornerRadius = 8
//////                dangerBTN.setImage(UIImage(named: "smRlaVy"), for: .normal)
////
////        var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
////        if IS_IPHONE_12PRO {
////            btnImageView = UIImageView(frame: CGRect(x: 50, y: 12.5, width: 18, height: 18))
////        } else if IS_IPHONE_N_PLUS {
////            btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
////        } else if IS_IPHONE_N {
////            btnImageView = UIImageView(frame: CGRect(x: 42, y: 7, width: 18, height: 18))
////        }
////        let btnImage = UIImage(named: "smRlaVy")
////        btnImageView.image = btnImage
////
////        dangerBTN.addSubview(btnImageView)
////
////        dangerBTN.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
////                dangerBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
////                dangerBTN.titleLabel?.textAlignment = .center
////                saveView.addSubview(dangerBTN)
////
////         cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
////        cancelBTN.setTitle("취소", for: .normal)
////        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
////        cancelBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
//////        cancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
////        scrollView.addSubview(cancelBTN)
////
////         saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
////        saveBTN.setTitle("저장", for: .normal)
////        saveBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
////        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
////        saveBTN.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
////        scrollView.addSubview(saveBTN)
////
////
//////        testBtn1 = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
//////        testBtn1.setTitle("눌러", for: .normal)
//////        testBtn1.setTitleColor(.black, for: .normal)
//////        testBtn1.layer.borderWidth = 1
//////        scrollView.addSubview(testBtn1)
//////        testBtn1.addTarget(self, action: #selector(rightButton2Pressed(_ :)), for: .touchUpInside)
////
//////        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//////        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//////        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//////        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
////
////
////        if IS_IPHONE_N_PLUS {
////            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 1.9))
////        } else if IS_IPHONE_12PRO_MAX {
////            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.1))
////        } else {
////            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 1.9))
////        }
////        set.layer.cornerRadius = 8
////        set.backgroundColor = .white
////        scrollView.addSubview(set)
////
////        var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
////        set.addSubview(setImgView)
////
////        var setImg = UIImage(named: "bloodSetImg")
////        setImgView.image = setImg
////
////        set.isHidden = true
////
////        var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//////        hideView.backgroundColor = .lightGray
//////        hideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
////        hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
////        set.addSubview(hideView)
////
////        var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4, y: setImgView.frame.maxY, width: 300, height: 50))
////        setTitle.font = UIFont.systemFont(ofSize: 18)
////        setTitle.text = "나의 혈압 관리 목표 설정하기"
//////        setTitle.numberOfLines = 0
////        set.addSubview(setTitle)
////
////        var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 35))
////        Shrink.text = "수축기"
//////        Shrink.font = UIFont.systemFont(ofSize: 20)
////        Shrink.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        Shrink.font = UIFont(name: "SUITE-Regular", size: 17)
////        set.addSubview(Shrink)
////
////        ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - Shrink.frame.width, height: 35))
////        ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
////        ShrinkGoal.textAlignment = .right
//////        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
////        ShrinkGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        ShrinkGoal.font = UIFont(name: "SUITE-Regular", size: 17)
////        set.addSubview(ShrinkGoal)
////
////        var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 35))
////        relaxation.text = "이완기"
//////        relaxation.font = UIFont.systemFont(ofSize: 20)
////        relaxation.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        relaxation.font = UIFont(name: "SUITE-Regular", size: 17)
////        set.addSubview(relaxation)
////
////        relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX, y: ShrinkGoal.frame.maxY + 10, width: set.frame.size.width - 40 - relaxation.frame.width, height: 35))
////        relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
////        relaxationGoal.textAlignment = .right
//////        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
////        relaxationGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        relaxationGoal.font = UIFont(name: "SUITE-Regular", size: 17)
////        set.addSubview(relaxationGoal)
////
////        var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 35))
////        pulse.text = "맥박"
//////        pulse.font = UIFont.systemFont(ofSize: 20)
////        pulse.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        pulse.font = UIFont(name: "SUITE-Regular", size: 17)
////        set.addSubview(pulse)
////
////        pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX, y: relaxationGoal.frame.maxY + 10, width: set.frame.size.width - 40 - pulse.frame.width, height: 35))
////        pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
////        pulseGoal.textAlignment = .right
//////        pulseGoal.font = UIFont.systemFont(ofSize: 20)
////        pulseGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
////        pulseGoal.font = UIFont(name: "SUITE-Regular", size: 17)
////        set.addSubview(pulseGoal)
////
////        var dangerBTN2 = UIButton()
////        if IS_IPHONE_N_PLUS {
////
////            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
////            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
////            //            if IS_IPHONE_12PRO {
//////                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
////            //            } else if IS_IPHONE_N_PLUS {
////                            btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
////            //            } else if IS_IPHONE_N {
//////                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
////            //            }
////                        let btnImage = UIImage(named: "smRlaVy")
////                        btnImageView.image = btnImage
////
////            dangerBTN2.addSubview(btnImageView)
////        } else if IS_IPHONE_12PRO_MAX {
////            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 25, width: dateView.frame.size.width - 20, height: 45))
////
////            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
////            //            if IS_IPHONE_12PRO {
////                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
////            //            } else if IS_IPHONE_N_PLUS {
////            //                btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
////            //            } else if IS_IPHONE_N {
//////                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
////            //            }
////                        let btnImage = UIImage(named: "smRlaVy")
////                        btnImageView.image = btnImage
////
////            dangerBTN2.addSubview(btnImageView)
////        } else {
////            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
////            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
////            //            if IS_IPHONE_12PRO {
//////                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
////            //            } else if IS_IPHONE_N_PLUS {
////                            btnImageView = UIImageView(frame: CGRect(x: 50, y: 9, width: 18, height: 18))
////            //            } else if IS_IPHONE_N {
//////                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
////            //            }
////                        let btnImage = UIImage(named: "smRlaVy")
////                        btnImageView.image = btnImage
////
////            dangerBTN2.addSubview(btnImageView)
////        }
//////        dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
////        dangerBTN2.setTitle("자가 혈압측정 시 주의사항", for: .normal)
////        dangerBTN2.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
////        dangerBTN2.setTitleColor(.blue, for: .normal)
////        dangerBTN2.layer.borderWidth = 1
////        dangerBTN2.layer.cornerRadius = 8
//////        dangerBTN2.setImage(UIImage(named: "smRlaVy"), for: .normal)
////        dangerBTN2.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
////        dangerBTN2.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
////        dangerBTN2.titleLabel?.textAlignment = .center
////        set.addSubview(dangerBTN2)
////
////
////        if IS_IPHONE_X {
////            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.2))
////            set.layer.cornerRadius = 8
////            set.backgroundColor = .white
////            scrollView.addSubview(set)
////
////            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
////            set.addSubview(setImgView)
////
////            var setImg = UIImage(named: "bloodSetImg")
////            setImgView.image = setImg
////
////            set.isHidden = true
////
////            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//////            hideView.backgroundColor = .lightGray
//////            hideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
////            hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
////            set.addSubview(hideView)
////
////            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4.2, y: setImgView.frame.maxY, width: 300, height: 50))
////            setTitle.font = UIFont.systemFont(ofSize: 18)
////            setTitle.text = "나의 혈압 관리 목표 설정하기"
////    //        setTitle.numberOfLines = 0
////            set.addSubview(setTitle)
////
////            var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
////            Shrink.text = "수축기"
////    //        Shrink.font = UIFont.systemFont(ofSize: 20)
////            Shrink.layer.addBorder([.bottom], color: .lightGray, width: 1)
////            Shrink.font = UIFont(name: "SUITE-Regular", size: 17)
////            set.addSubview(Shrink)
////
////            ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - Shrink.frame.width, height: 30))
////            ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
////    //        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
////            ShrinkGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
////            ShrinkGoal.textAlignment = .right
////            ShrinkGoal.font = UIFont(name: "SUITE-Regular", size: 17)
////            set.addSubview(ShrinkGoal)
////
////            var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 30))
////            relaxation.text = "이완기"
////    //        relaxation.font = UIFont.systemFont(ofSize: 20)
////            relaxation.layer.addBorder([.bottom], color: .lightGray, width: 1)
////            relaxation.font = UIFont(name: "SUITE-Regular", size: 17)
////            set.addSubview(relaxation)
////
////            relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX, y: ShrinkGoal.frame.maxY + 10, width: set.frame.size.width - 40 - relaxation.frame.width, height: 30))
////            relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
////            relaxationGoal.textAlignment = .right
////
////    //        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
////            relaxationGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
////            relaxationGoal.font = UIFont(name: "SUITE-Regular", size: 17)
////            set.addSubview(relaxationGoal)
////
////            var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 30))
////            pulse.text = "맥박"
////    //        pulse.font = UIFont.systemFont(ofSize: 20)
////            pulse.layer.addBorder([.bottom], color: .lightGray, width: 1)
////            pulse.font = UIFont(name: "SUITE-Regular", size: 17)
//////            pulse.textAlignment = .right
////            set.addSubview(pulse)
////
////            pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX, y: relaxationGoal.frame.maxY + 10, width: set.frame.size.width - 40 - pulse.frame.width, height: 30))
////            pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
////            pulseGoal.textAlignment = .right
////    //        pulseGoal.font = UIFont.systemFont(ofSize: 20)
////            pulseGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
////            pulseGoal.font = UIFont(name: "SUITE-Regular", size: 17)
////            set.addSubview(pulseGoal)
////
////            var dangerBTN3 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 45))
////            dangerBTN3.setTitle("자가 혈압측정 시 주의사항", for: .normal)
////            dangerBTN3.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
////            dangerBTN3.setTitleColor(.blue, for: .normal)
////            dangerBTN3.layer.borderWidth = 1
////            dangerBTN3.layer.cornerRadius = 8
//////            dangerBTN3.setImage(UIImage(named: "smRlaVy"), for: .normal)
////            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
////            //            if IS_IPHONE_12PRO {
//////                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
////            //            } else if IS_IPHONE_N_PLUS {
////                            btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
////            //            } else if IS_IPHONE_N {
//////                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
////            //            }
////                        let btnImage = UIImage(named: "smRlaVy")
////                        btnImageView.image = btnImage
////
////            dangerBTN3.addSubview(btnImageView)
////            dangerBTN3.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
////            dangerBTN3.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
////            dangerBTN3.titleLabel?.textAlignment = .center
////            set.addSubview(dangerBTN3)
//
////            saveView.isHidden = true
////            dateView.isHidden = true
////            dateViewLabel.isHidden = true
//
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        }
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewLabel)
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.text = "수축기"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textAlignment = .center
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont.systemFont(ofSize: 16)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont(name: "SUITE-Regular", size: 16)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.layer.borderWidth = 1
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name)
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = UserDefaults.standard.string(forKey: "")
//
//
//
//
//
//
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textAlignment = .right
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont.systemFont(ofSize: 30)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont(name: "SUITE-Heavy", size: 26)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.layer.borderWidth = 1
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number)
//
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.text = "mmHg"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textAlignment = .left
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont.systemFont(ofSize: 13)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont(name: "SUITE-Regular", size: 13)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.layer.borderWidth = 1
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1)
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.text = "이완기"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textAlignment = .center
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont.systemFont(ofSize: 16)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont(name: "SUITE-Regular", size: 16)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.layer.borderWidth = 1
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name)
//
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 55, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = " 80"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textAlignment = .right
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont.systemFont(ofSize: 30)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont(name: "SUITE-Heavy", size: 26)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.layer.borderWidth = 1
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number)
//
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mmHg"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textAlignment = .left
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 13)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont(name: "SUITE-Regular", size: 13)
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.layer.borderWidth = 1
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
//
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: 35, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.frame.maxY + 1, width: self.view.frame.size.width / 2, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mg/dL"
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 22)
////
////        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
//
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 150, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.text = " 목표 수치\n달성율은?"
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.numberOfLines = 0
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.layer.borderWidth = 1
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.textColor = .white
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont.systemFont(ofSize: 20)
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 20)
////        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        }
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowLabel)
//
//
//        BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 55, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
//        BloodPressureManagementNotebookView.BloodPressureVewGraph.backgroundColor = .clear
//
//        //
//        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
//
//
//
//        self.view.backgroundColor = .white
//        // Do any additional setup after loading the view.
//
//        if IS_IPHONE_X {
//            showLabel = UILabel(frame: CGRect(x: 8, y: 22, width: 45, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 14)
//            showLabel.textColor = .white
//            showLabel.textAlignment = .center
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = "100%"
////            showLabel.text = "100%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_N_PLUS {
//            showLabel = UILabel(frame: CGRect(x: 30, y: 19, width: 45, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.textAlignment = .center
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        } else if IS_IPHONE_12PRO_MAX {
//            showLabel = UILabel(frame: CGRect(x: 44, y: 33, width: 42, height: 30))
//
//
//            showLabel.textAlignment = .center
////                    showLabel.layer.borderWidth = 1
//
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 00)%"
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        } else if IS_IPHONE_15PRO_MAX {
//            showLabel = UILabel(frame: CGRect(x: 44, y: 33, width: 42, height: 30))
//
//
//            showLabel.textAlignment = .center
////                    showLabel.layer.borderWidth = 1
//
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 00)%"
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        } else if IS_IPHONE_N {
//            showLabel = UILabel(frame: CGRect(x: 4, y: 21, width: 53, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        } else if IS_IPHONE_12PRO {
//            showLabel = UILabel(frame: CGRect(x: 16, y: 21, width: 53, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        } else if IS_IPHONE_15PRO {
//            showLabel = UILabel(frame: CGRect(x: 16, y: 21, width: 53, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        } else {
//            showLabel = UILabel(frame: CGRect(x: 17, y: 21, width: 42, height: 30))
//
//
//
////                    showLabel.layer.borderWidth = 1
//
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//        }
////        else {
////            showLabel = UILabel(frame: CGRect(x: 17, y: 21, width: 42, height: 30))
////
////
////
//////                    showLabel.layer.borderWidth = 1
////
////            var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
////            print(changeShowLabel, "여기의 값은?")
////
////            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
////            showLabel.textColor = .white
////            showLabel.text = "\(changeShowLabel ?? 0)%"
////        }
//
//
//        var perGraphTest = UserDefaults.standard.object(forKey: "perGraph")
//
//
//        if IS_IPHONE_12PRO_MAX {
//            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 8) - 4, y: 0, width: 100, height: 100), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
////            ProgressView.progress = random * 0.01
//
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                perTest = 00
//
//            } else {
//                perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
////            perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            ProgressView.progress = perTest
//
//
//
//
//
//            //
//        } else if IS_IPHONE_15PRO_MAX {
//            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 8) - 4, y: 0, width: 100, height: 100), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
////            ProgressView.progress = random * 0.01
//
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                perTest = 00
//
//            } else {
//                perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
////            perTest = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            ProgressView.progress = perTest
//
//
//
//
//
//            //
//        } else if IS_IPHONE_N_PLUS {
//            let ProgressView = CircularProgressView(frame: CGRect(x: (BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 15) + 2, y: -5, width: 80, height: 80), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                ProgressView.progress = 0
//                showLabel.textAlignment = .center
//            } else {
//                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//
//            //
//        } else if IS_IPHONE_X {
//            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                ProgressView.progress = 0
//                showLabel.textAlignment = .center
//            } else {
//                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
//
//            //
//        } else if IS_IPHONE_12PRO {
//            let ProgressView = CircularProgressView(frame: CGRect(x: 0, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                ProgressView.progress = 0
//                showLabel.textAlignment = .center
//            } else {
//                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
//
//            //
//        } else if IS_IPHONE_15PRO {
//            let ProgressView = CircularProgressView(frame: CGRect(x: 0, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                ProgressView.progress = 0
//                showLabel.textAlignment = .center
//            } else {
//                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
//
//            //
//        } else {
//            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -3, width: 80, height: 80), lineWidth: 10, rounded: false)
//            ProgressView.progressColor = .white
//
//            ProgressView.trackColor = .white.withAlphaComponent(0.5)
//
//    //        ProgressView.center = ProgressView.center
//
//    //        self.view.addSubview(ProgressView)
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//
//
//            ProgressView.addSubview(showLabel)
//
////            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            if UserDefaults.standard.object(forKey: "perGraph") == nil {
//                ProgressView.progress = 0
//                showLabel.textAlignment = .center
//            } else {
//                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraph") as! CGFloat * 0.01
//            }
//
//            //
//
//        }
//
//
////        ProgressView.progressColor = .blue
////
////        ProgressView.trackColor = .lightGray
////
//////        ProgressView.center = ProgressView.center
////
//////        self.view.addSubview(ProgressView)
////        BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
////
////
////        ProgressView.addSubview(showLabel)
////
////        ProgressView.progress = random * 0.01
////
////        //
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewGraph)
//
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.translatesAutoresizingMaskIntoConstraints = false
//
////        if IS_IPHONE_N_PLUS {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 100, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
////        } else {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
////        }
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("   나의 목표 수정", for: .normal)
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.borderWidth = 1
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.backgroundColor = #colorLiteral(red: 0.04629711807, green: 0.3480906487, blue: 0.5174985528, alpha: 1)
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 12
//////        BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
////
////        var penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 8, width: 10, height: 10))
////        if IS_IPHONE_12PRO {
////            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
////        } else if IS_IPHONE_15PRO {
////            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
////        } else if IS_IPHONE_N_PLUS {
////            penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 7, width: 10, height: 10))
////        } else if IS_IPHONE_N {
////            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
////        } else if IS_IPHONE_12PRO_MAX {
////            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 10, width: 10, height: 10))
////        } else if IS_IPHONE_15PRO_MAX {
////            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 10, width: 10, height: 10))
////        }
////        let penBtnImage = UIImage(named: "myGoal")
////        penBtnImageView.image = penBtnImage
//
//        if IS_IPHONE_N_PLUS {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 100, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
//        } else if IS_IPHONE_12PRO {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 11.5))
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
//        } else {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10.5))
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
//        }
////        BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 115, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("   나의 목표 수정", for: .normal)
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
//        }
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
//        }
//        if IS_IPHONE_12PRO {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
//        }
//        if IS_IPHONE_15PRO {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("     나의 목표 수정", for: .normal)
//        }
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.borderWidth = 1
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.backgroundColor = #colorLiteral(red: 0.04629711807, green: 0.3480906487, blue: 0.5174985528, alpha: 1)
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 12
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 14
//        }
//        if IS_IPHONE_15PRO_MAX {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 14
//        }
//        if IS_IPHONE_12PRO {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 12
//        }
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 8)
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
//
//        var penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 8, width: 10, height: 10))
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
//        let penBtnImage = UIImage(named: "myGoal")
//        penBtnImageView.image = penBtnImage
//
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.addSubview(penBtnImageView)
//
////        let imageSize = CGSize(width: 10, height: 10)
////
////            let resizedImage = UIImage(named: "myGoal")?.resize(targetSize: imageSize)
////
////
////
////
////
////        BloodPressureManagementNotebookView.BloodPressureViewBTN.imageView?.contentMode = .scaleToFill
//
//
//
////        if IS_IPHONE_12PRO_MAX {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(resizedImage, for: .normal)
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
////        } else {
////            BloodPressureManagementNotebookView.BloodPressureViewBTN.setImage(resizedImage, for: .normal)
////
////
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
//////            BloodPressureManagementNotebookView.BloodPressureViewBTN.imageEdgeInsets = .init(top: 0, left: -3, bottom: 0, right: 0)
////        }
//        if IS_IPHONE_N_PLUS {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 11)
//        } else {
//            BloodPressureManagementNotebookView.BloodPressureViewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//        }
//        BloodPressureManagementNotebookView.BloodPressureViewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewBTN)
        
        var saveData = UILabel(frame: CGRect(x: 20, y: BloodPressureManagementNotebookView.BloodPressureView.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "측정하신 혈압과 맥박을 입력해주세요."
//        saveData.font = UIFont.systemFont(ofSize: 18)
        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
        
        scrollView.addSubview(saveData)
        
//        var saveView: UIView!
        
//        var afterBTN: UIButton!
//        var beforeBTN: UIButton!
//        var bloodTF: UITextField!
//        var glycated: UITextField!
        
        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 2.5))
        saveView.backgroundColor = .white
//        saveView.layer.borderWidth = 1
        saveView.layer.cornerRadius = 8
        scrollView.addSubview(saveView)
        
        dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        dateView.backgroundColor = .white
        
        saveView.addSubview(dateView)
        
         dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
        dateViewLabel.text = "일시"
//        dateViewLabel.layer.borderWidth = 1
        dateView.addSubview(dateViewLabel)
        dateViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        dateViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        
       
        
        
//        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        date.text = Date()

        var time = Date()
        var formatter = DateFormatter()
//        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")

        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
            
        let formattedDateInString = formatter.string(from: time)
        
        changeTf = UITextField(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: saveView.frame.size.width - 40 - dateViewLabel.frame.width, height: dateView.frame.height))
        changeTf.placeholder = formattedDateInString
        
        
        changeTf.textAlignment = .right
        changeTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        dateView.addSubview(changeTf)
        
         
//        showDatePicker()
        
        setupToolBar()
        setupDatePicker()
        
//        if IS_IPHONE_X {
            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: dateView.frame.size.width - 20 - dateViewLabel.frame.width, height: dateView.frame.height))
//        }
//        if IS_IPHONE_12PRO_MAX {
//            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        }
//        if IS_IPHONE_N_PLUS {
//            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        }
//        BloodPressureManagementNotebookView.dateLable.layer.borderWidth = 1
        BloodPressureManagementNotebookView.dateLable.text = formattedDateInString
        BloodPressureManagementNotebookView.dateLable.textAlignment = .right
        BloodPressureManagementNotebookView.dateLable.layer.addBorder([.bottom], color: .lightGray, width: 1)
        
//        dateView.addSubview(BloodPressureManagementNotebookView.dateLable)
        
        var mysystoleView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mysystoleView.backgroundColor = .white
        
        saveView.addSubview(mysystoleView)
        
        var mysystoleViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        mysystoleViewLabel.text = "수축기"
        mysystoleViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        mysystoleViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        mysystoleView.addSubview(mysystoleViewLabel)
        
      
        
//        if IS_IPHONE_X {
        contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mysystoleViewLabel.frame.width, height: mysystoleViewLabel.frame.height))
//        }
//        if IS_IPHONE_12PRO_MAX {
//            contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 120, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
//        }
//        if IS_IPHONE_N_PLUS {
//            contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 107, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
//        }
//        contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
        contractionInputView.placeholder = "수축기 혈압을 입력해 주세요."
//        contractionInputView.layer.borderWidth = 1
        contractionInputView.keyboardType = .numberPad
        contractionInputView.textAlignment = .right
        contractionInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        contractionInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        mysystoleView.addSubview(contractionInputView)
        
        
        var mydiastoleView = UIView(frame: CGRect(x: 10, y: mysystoleView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mydiastoleView.backgroundColor = .white
        
        saveView.addSubview(mydiastoleView)
        
        var mydiastoleViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        mydiastoleViewLabel.text = "이완기"
        mydiastoleViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        mydiastoleViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)

        mydiastoleView.addSubview(mydiastoleViewLabel)
        
//        if IS_IPHONE_X {
        relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mydiastoleViewLabel.frame.width, height: mysystoleViewLabel.frame.height))
//        }
//        if IS_IPHONE_12PRO_MAX {
//            relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 120, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
//        }
//        if IS_IPHONE_N_PLUS {
//            relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 107, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
//        }
//        relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
        relaxtionInputView.placeholder = "이완기 혈압을 입력해 주세요."
        relaxtionInputView.textAlignment = .right
        relaxtionInputView.keyboardType = .numberPad
        relaxtionInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        relaxtionInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        mydiastoleView.addSubview(relaxtionInputView)
        
        
        var mypulseView = UIView(frame: CGRect(x: 10, y: mydiastoleView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mypulseView.backgroundColor = .white
        
        saveView.addSubview(mypulseView)
        
        var mypulseViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        mypulseViewLabel.text = "맥박"
        mypulseViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        mypulseView.addSubview(mypulseViewLabel)
        
        
//        if IS_IPHONE_X {
        heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mypulseViewLabel.frame.width, height: mysystoleViewLabel.frame.height))
//        }
//        if IS_IPHONE_12PRO_MAX {
//            heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 120, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
//        }
//        if IS_IPHONE_N_PLUS {
//            heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 107, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
//        }
//        heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
        heartRateInputView.placeholder = "맥박 목표를 입력해 주세요."
        heartRateInputView.textAlignment = .right
        heartRateInputView.keyboardType = .numberPad
        heartRateInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        mypulseView.addSubview(heartRateInputView)
        
        var dangerBTN = UIButton(frame: CGRect(x: 20, y: mypulseView.frame.maxY + 5, width: dateView.frame.size.width - 20, height: dateView.frame.height / 1.5))
        dangerBTN.setTitle("  자가 혈압측정 시 주의사항", for: .normal)
        dangerBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
        dangerBTN.setTitleColor(#colorLiteral(red: 0.0866452679, green: 0.3060935736, blue: 0.5585445762, alpha: 1), for: .normal)
        dangerBTN.layer.borderWidth = 1
        dangerBTN.layer.cornerRadius = 5
        dangerBTN.layer.borderColor = #colorLiteral(red: 0.7721378207, green: 0.8275449872, blue: 0.8910073042, alpha: 1).cgColor
//        dangerBTN.setImage(UIImage(named: "smRlaVy"), for: .normal)
        
        var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
        if IS_IPHONE_12PRO {
            btnImageView = UIImageView(frame: CGRect(x: 50, y: 12.5, width: 18, height: 18))
        } else if IS_IPHONE_15PRO {
            btnImageView = UIImageView(frame: CGRect(x: 50, y: 12.5, width: 18, height: 18))
        } else if IS_IPHONE_N_PLUS {
            btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
        } else if IS_IPHONE_N {
            btnImageView = UIImageView(frame: CGRect(x: 42, y: 7, width: 18, height: 18))
        }
        let btnImage = UIImage(named: "smRlaVy")
        btnImageView.image = btnImage
        
        dangerBTN.addSubview(btnImageView)
        
        dangerBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
        dangerBTN.titleLabel?.textAlignment = .center
        dangerBTN.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
        saveView.addSubview(dangerBTN)
        
         cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        cancelBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
//        cancelBTN.addTarget(self, action: #selector(<#T##@objc method#>), for: <#T##UIControl.Event#>)
        scrollView.addSubview(cancelBTN)
        
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
         saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
        
        
//        testBtn1 = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
//        testBtn1.setTitle("눌러", for: .normal)
//        testBtn1.setTitleColor(.black, for: .normal)
//        testBtn1.layer.borderWidth = 1
//        scrollView.addSubview(testBtn1)
//        testBtn1.addTarget(self, action: #selector(rightButton2Pressed(_ :)), for: .touchUpInside)
        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 0).isActive = true

        if IS_IPHONE_N_PLUS {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.1))
            scrollView.frame.size.height = 100
        } else if IS_IPHONE_12PRO_MAX {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.5))
        } else if IS_IPHONE_15PRO_MAX {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.5))
        } else {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.3))
        }
        set.layer.cornerRadius = 8
        set.backgroundColor = .white
        
        scrollView.addSubview(set)
        
        var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
        set.addSubview(setImgView)
        
        var setImg = UIImage(named: "bloodSetImg")
        setImgView.image = setImg
    
        set.isHidden = true
        
       
        var hideView = UIView(frame: CGRect(x: -20, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//        hideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        set.addSubview(hideView)
        
        var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4, y: setImgView.frame.maxY, width: 300, height: 50))
        setTitle.font = UIFont.systemFont(ofSize: 18)
        setTitle.text = "나의 혈압 관리 목표 설정하기"
        setTitle.font = UIFont(name: "SUITE-Regular", size: 18)
//        setTitle.numberOfLines = 0
        set.addSubview(setTitle)
        
        var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 35))
        Shrink.text = "수축기"
//        Shrink.font = UIFont.systemFont(ofSize: 20)
        Shrink.layer.addBorder([.bottom], color: .lightGray, width: 1)
        Shrink.font = UIFont(name: "SUITE-Regular", size: 17)
        set.addSubview(Shrink)

        ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - Shrink.frame.width, height: 35))
        ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
        ShrinkGoal.keyboardType = .numberPad
//        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
        ShrinkGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
        ShrinkGoal.font = UIFont(name: "SUITE-Regular", size: 17)
        ShrinkGoal.textAlignment = .right
        set.addSubview(ShrinkGoal)
        
        var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 35))
        relaxation.text = "이완기"
//        relaxation.font = UIFont.systemFont(ofSize: 20)
        relaxation.layer.addBorder([.bottom], color: .lightGray, width: 1)
        relaxation.font = UIFont(name: "SUITE-Regular", size: 17)
        set.addSubview(relaxation)
        
        
        relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX, y: ShrinkGoal.frame.maxY + 10, width: set.frame.size.width - 40 - relaxation.frame.width, height: 35))
        relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
        relaxationGoal.keyboardType = .numberPad
        relaxationGoal.textAlignment = .right
        
//        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
        relaxationGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
        relaxationGoal.font = UIFont(name: "SUITE-Regular", size: 17)
        set.addSubview(relaxationGoal)
        
        var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 35))
        pulse.text = "맥박"
//        pulse.font = UIFont.systemFont(ofSize: 20)
        pulse.layer.addBorder([.bottom], color: .lightGray, width: 1)
        pulse.font = UIFont(name: "SUITE-Regular", size: 17)
//        set.addSubview(pulse)

        pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX, y: relaxationGoal.frame.maxY + 10, width: set.frame.size.width - 40 - pulse.frame.width, height: 35))
        pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
        pulseGoal.textAlignment = .right
        pulseGoal.keyboardType = .numberPad
//        pulseGoal.font = UIFont.systemFont(ofSize: 20)
        pulseGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
        pulseGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//        set.addSubview(pulseGoal)
        
        var dangerBTN2 = UIButton()
        if IS_IPHONE_N_PLUS {
            
            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 38))
            
            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
            //            if IS_IPHONE_12PRO {
//                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
            //            } else if IS_IPHONE_N_PLUS {
                            btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
            //            } else if IS_IPHONE_N {
//                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
            //            }
                        let btnImage = UIImage(named: "smRlaVy")
                        btnImageView.image = btnImage
                        
            dangerBTN2.addSubview(btnImageView)
        } else if IS_IPHONE_12PRO_MAX {
            
            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 25, width: dateView.frame.size.width - 20, height: 45))
            
            
            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
            //            if IS_IPHONE_12PRO {
                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
            //            } else if IS_IPHONE_N_PLUS {
            //                btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
            //            } else if IS_IPHONE_N {
//                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
            //            }
                        let btnImage = UIImage(named: "smRlaVy")
                        btnImageView.image = btnImage
                        
            dangerBTN2.addSubview(btnImageView)
            
        } else if IS_IPHONE_15PRO_MAX {
            
            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 25, width: dateView.frame.size.width - 20, height: 45))
            
            
            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
            //            if IS_IPHONE_12PRO {
                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
            //            } else if IS_IPHONE_N_PLUS {
            //                btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
            //            } else if IS_IPHONE_N {
//                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
            //            }
                        let btnImage = UIImage(named: "smRlaVy")
                        btnImageView.image = btnImage
                        
            dangerBTN2.addSubview(btnImageView)
            
        } else if IS_IPHONE_X {
            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 40))
            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
            //            if IS_IPHONE_12PRO {
//                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
            //            } else if IS_IPHONE_N_PLUS {
                            btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
            //            } else if IS_IPHONE_N {
//                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
            //            }
                        let btnImage = UIImage(named: "smRlaVy")
                        btnImageView.image = btnImage
                        
            dangerBTN2.addSubview(btnImageView)
        } else {
            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 38))
            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
            //            if IS_IPHONE_12PRO {
//                            btnImageView = UIImageView(frame: CGRect(x: 57, y: 12.5, width: 18, height: 18))
            //            } else if IS_IPHONE_N_PLUS {
                            btnImageView = UIImageView(frame: CGRect(x: 50, y: 9, width: 18, height: 18))
            //            } else if IS_IPHONE_N {
//                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
            //            }
                        let btnImage = UIImage(named: "smRlaVy")
                        btnImageView.image = btnImage
                        
            dangerBTN2.addSubview(btnImageView)
        }
//        dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
        dangerBTN2.setTitle(" 자가 혈압측정 시 주의사항", for: .normal)
        dangerBTN2.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
        dangerBTN2.setTitleColor(#colorLiteral(red: 0.0866452679, green: 0.3060935736, blue: 0.5585445762, alpha: 1), for: .normal)
        dangerBTN2.layer.borderWidth = 1
        dangerBTN2.layer.borderColor = #colorLiteral(red: 0.7721378207, green: 0.8275449872, blue: 0.8910073042, alpha: 1).cgColor
        dangerBTN2.layer.cornerRadius = 5
//        dangerBTN2.setImage(UIImage(named: "smRlaVy"), for: .normal)
        dangerBTN2.imageEdgeInsets = UIEdgeInsets(top: 7, left: -3, bottom: 7, right: 4)
        dangerBTN2.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
        dangerBTN2.titleLabel?.textAlignment = .center
        
        
        
        
        set.addSubview(dangerBTN2)
        
        
        if IS_IPHONE_X {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.3))
            set.layer.cornerRadius = 8
            set.backgroundColor = .white
            scrollView.addSubview(set)
            
            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
            set.addSubview(setImgView)
            
            var setImg = UIImage(named: "bloodSetImg")
            setImgView.image = setImg
        
            set.isHidden = true
            
            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//            hideView.backgroundColor = .lightGray
            hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            set.addSubview(hideView)
            
            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4.5, y: setImgView.frame.maxY, width: 300, height: 50))
            setTitle.font = UIFont.systemFont(ofSize: 18)
            setTitle.text = "나의 혈압 관리 목표 설정하기"
            setTitle.font = UIFont(name: "SUITE-Regular", size: 18)
    //        setTitle.numberOfLines = 0
            set.addSubview(setTitle)
            
            var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
            Shrink.text = "수축기"
    //        Shrink.font = UIFont.systemFont(ofSize: 20)
            Shrink.layer.addBorder([.bottom], color: .lightGray, width: 1)
            Shrink.font = UIFont(name: "SUITE-Regular", size: 17)
            
            set.addSubview(Shrink)

            ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - Shrink.frame.width, height: 30))
            ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
            ShrinkGoal.keyboardType = .numberPad
    //        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
            ShrinkGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            
            ShrinkGoal.textAlignment = .right
            ShrinkGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(ShrinkGoal.text, forKey: "sh")
            set.addSubview(ShrinkGoal)
            
            var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 30))
            relaxation.text = "이완기"
    //        relaxation.font = UIFont.systemFont(ofSize: 20)
            relaxation.layer.addBorder([.bottom], color: .lightGray, width: 1)
            relaxation.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(relaxation)

            relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX, y: ShrinkGoal.frame.maxY + 10, width: set.frame.size.width - 40 - relaxation.frame.width, height: 30))
            relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
            relaxationGoal.keyboardType = .numberPad
    //        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
            relaxationGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            relaxationGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(relaxationGoal.text, forKey: "re")
            set.addSubview(relaxationGoal)
            
            var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 30))
            pulse.text = "맥박"
    //        pulse.font = UIFont.systemFont(ofSize: 20)
            pulse.layer.addBorder([.bottom], color: .lightGray, width: 1)
            pulse.font = UIFont(name: "SUITE-Regular", size: 17)
//            set.addSubview(pulse)

            pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX, y: relaxationGoal.frame.maxY + 10, width: set.frame.size.width - 40 - pulse.frame.width, height: 30))
            pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
            pulseGoal.keyboardType = .numberPad
    //        pulseGoal.font = UIFont.systemFont(ofSize: 20)
            pulseGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            pulseGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(pulseGoal.text, forKey: "pu")
//            set.addSubview(pulseGoal)
            
            var dangerBTN3 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: dateView.frame.size.width - 20, height: 45))
            dangerBTN3.setTitle("자가 혈압측정 시 주의사항", for: .normal)
            dangerBTN3.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
            dangerBTN3.setTitleColor(#colorLiteral(red: 0.0866452679, green: 0.3060935736, blue: 0.5585445762, alpha: 1), for: .normal)
            dangerBTN3.layer.borderWidth = 1
            dangerBTN3.layer.borderColor = #colorLiteral(red: 0.7721378207, green: 0.8275449872, blue: 0.8910073042, alpha: 1).cgColor
            dangerBTN3.layer.cornerRadius = 5
//            dangerBTN3.setImage(UIImage(named: "smRlaVy"), for: .normal)
            
            dangerBTN3.imageEdgeInsets = UIEdgeInsets(top: 5, left: -3, bottom: 5, right: 4)
            dangerBTN3.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
            dangerBTN3.titleLabel?.textAlignment = .center
            set.addSubview(dangerBTN3)
            
//            saveView.isHidden = true
//            dateView.isHidden = true
//            dateViewLabel.isHidden = true
            
            
            
        }
        if IS_IPHONE_N {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 1.8))
            set.layer.cornerRadius = 8
            set.backgroundColor = .white
            scrollView.addSubview(set)
            
            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.4, y: set.frame.minY + 15, width: 50, height: 60))
            set.addSubview(setImgView)
            
            var setImg = UIImage(named: "bloodSetImg")
            setImgView.image = setImg
        
            set.isHidden = true
            
            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//            hideView.backgroundColor = .lightGray
            hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            set.addSubview(hideView)
            
            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4.5, y: setImgView.frame.maxY, width: 300, height: 50))
            setTitle.font = UIFont.systemFont(ofSize: 18)
            setTitle.text = "나의 혈압 관리 목표 설정하기"
    //        setTitle.numberOfLines = 0
            setTitle.font = UIFont(name: "SUITE-Regular", size: 18)
            set.addSubview(setTitle)
            
            var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
            Shrink.text = "수축기"
    //        Shrink.font = UIFont.systemFont(ofSize: 20)
            Shrink.layer.addBorder([.bottom], color: .lightGray, width: 1)
            Shrink.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(Shrink)

            ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - Shrink.frame.width, height: 30))
            ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
    //        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
            ShrinkGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            ShrinkGoal.keyboardType = .numberPad
            ShrinkGoal.textAlignment = .right
            ShrinkGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(ShrinkGoal.text, forKey: "sh")
            set.addSubview(ShrinkGoal)
            
            var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 30))
            relaxation.text = "이완기"
    //        relaxation.font = UIFont.systemFont(ofSize: 20)
            relaxation.layer.addBorder([.bottom], color: .lightGray, width: 1)
            relaxation.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(relaxation)

            relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX, y: ShrinkGoal.frame.maxY + 10, width: set.frame.size.width - 40 - relaxation.frame.width, height: 30))
            relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
            relaxationGoal.keyboardType = .numberPad
    //        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
            relaxationGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            relaxationGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(relaxationGoal.text, forKey: "re")
            set.addSubview(relaxationGoal)
            
            var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 30))
            pulse.text = "맥박"
    //        pulse.font = UIFont.systemFont(ofSize: 20)
            pulse.layer.addBorder([.bottom], color: .lightGray, width: 1)
            pulse.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(pulse)

            pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX, y: relaxationGoal.frame.maxY + 10, width: set.frame.size.width - 40 - pulse.frame.width, height: 30))
            pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
    //        pulseGoal.font = UIFont.systemFont(ofSize: 20)
            pulseGoal.keyboardType = .numberPad
            pulseGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            pulseGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(pulseGoal.text, forKey: "pu")
            set.addSubview(pulseGoal)
            
            var dangerBTN3 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
            dangerBTN3.setTitle("자가 혈압측정 시 주의사항", for: .normal)
            dangerBTN3.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
            dangerBTN3.setTitleColor(#colorLiteral(red: 0.0866452679, green: 0.3060935736, blue: 0.5585445762, alpha: 1), for: .normal)
            dangerBTN3.layer.borderWidth = 1
            dangerBTN3.layer.borderColor = #colorLiteral(red: 0.7721378207, green: 0.8275449872, blue: 0.8910073042, alpha: 1).cgColor
            dangerBTN3.layer.cornerRadius = 5
//            dangerBTN3.setImage(UIImage(named: "smRlaVy"), for: .normal)
            dangerBTN3.imageEdgeInsets = UIEdgeInsets(top: 5, left: -3, bottom: 5, right: 4)
            dangerBTN3.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
            dangerBTN3.titleLabel?.textAlignment = .center
            set.addSubview(dangerBTN3)
            
//            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
//            if IS_IPHONE_12PRO {
//                btnImageView = UIImageView(frame: CGRect(x: 50, y: 12.5, width: 18, height: 18))
//            } else if IS_IPHONE_N_PLUS {
//                btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
//            } else if IS_IPHONE_N {
              var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
//            }
            let btnImage = UIImage(named: "smRlaVy")
            btnImageView.image = btnImage
            
            dangerBTN3.addSubview(btnImageView)
            
        }
        if IS_IPHONE_N {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2))
            set.layer.cornerRadius = 8
            set.backgroundColor = .white
            scrollView.addSubview(set)
            
            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.4, y: set.frame.minY + 15, width: 50, height: 60))
            set.addSubview(setImgView)
            
            var setImg = UIImage(named: "bloodSetImg")
            setImgView.image = setImg
        
            set.isHidden = true
            
            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//            hideView.backgroundColor = .lightGray
//            hideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            set.addSubview(hideView)
            
            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4.5, y: setImgView.frame.maxY, width: 300, height: 50))
            setTitle.font = UIFont.systemFont(ofSize: 18)
            setTitle.text = "나의 혈압 관리 목표 설정하기"
    //        setTitle.numberOfLines = 0
            setTitle.font = UIFont(name: "SUITE-Regular", size: 18)
            set.addSubview(setTitle)
            
            var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
            Shrink.text = "수축기"
    //        Shrink.font = UIFont.systemFont(ofSize: 20)
            Shrink.layer.addBorder([.bottom], color: .lightGray, width: 1)
            Shrink.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(Shrink)

            ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - Shrink.frame.width, height: 30))
            ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
            ShrinkGoal.keyboardType = .numberPad
    //        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
            ShrinkGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            ShrinkGoal.textAlignment = .right
            ShrinkGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(ShrinkGoal.text, forKey: "sh")
            set.addSubview(ShrinkGoal)
            
            var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 30))
            relaxation.text = "이완기"
    //        relaxation.font = UIFont.systemFont(ofSize: 20)
            relaxation.layer.addBorder([.bottom], color: .lightGray, width: 1)
            relaxation.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(relaxation)

            relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX, y: ShrinkGoal.frame.maxY + 10, width: set.frame.size.width - 40 - relaxation.frame.width, height: 30))
            relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
            relaxationGoal.textAlignment = .right
            relaxationGoal.keyboardType = .numberPad
    //        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
            relaxationGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            relaxationGoal.font = UIFont(name: "SUITE-Regular", size: 17)
//            UserDefaults.standard.setValue(relaxationGoal.text, forKey: "re")
            set.addSubview(relaxationGoal)
            
            var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 30))
            pulse.text = "맥박"
    //        pulse.font = UIFont.systemFont(ofSize: 20)
            pulse.layer.addBorder([.bottom], color: .lightGray, width: 1)
            pulse.font = UIFont(name: "SUITE-Regular", size: 17)
//            set.addSubview(pulse)

            pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX, y: relaxationGoal.frame.maxY + 10, width: set.frame.size.width - 40 - pulse.frame.width, height: 30))
            pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
    //        pulseGoal.font = UIFont.systemFont(ofSize: 20)
            pulseGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            pulseGoal.keyboardType = .numberPad
            pulseGoal.font = UIFont(name: "SUITE-Regular", size: 17)
            pulseGoal.textAlignment = .right
//            UserDefaults.standard.setValue(pulseGoal.text, forKey: "pu")
//            set.addSubview(pulseGoal)
            
            var dangerBTN3 = UIButton(frame: CGRect(x: 20, y: relaxation.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
            dangerBTN3.setTitle("자가 혈압측정 시 주의사항", for: .normal)
            dangerBTN3.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
            dangerBTN3.setTitleColor(#colorLiteral(red: 0.0866452679, green: 0.3060935736, blue: 0.5585445762, alpha: 1), for: .normal)
            dangerBTN3.layer.borderWidth = 1
            dangerBTN3.layer.borderColor = #colorLiteral(red: 0.7721378207, green: 0.8275449872, blue: 0.8910073042, alpha: 1).cgColor
            dangerBTN3.layer.cornerRadius = 5
//            dangerBTN3.setImage(UIImage(named: "smRlaVy"), for: .normal)
            //            var btnImageView = UIImageView(frame: CGRect(x: 70, y: 13, width: 18, height: 18))
            //            if IS_IPHONE_12PRO {
            //                btnImageView = UIImageView(frame: CGRect(x: 50, y: 12.5, width: 18, height: 18))
            //            } else if IS_IPHONE_N_PLUS {
            //                btnImageView = UIImageView(frame: CGRect(x: 55, y: 9, width: 18, height: 18))
            //            } else if IS_IPHONE_N {
                          var btnImageView = UIImageView(frame: CGRect(x: 42, y: 9, width: 15, height: 15))
            //            }
                        let btnImage = UIImage(named: "smRlaVy")
                        btnImageView.image = btnImage
                        
                        dangerBTN3.addSubview(btnImageView)
            
            dangerBTN3.addTarget(self, action: #selector(goPopUp(_ :)), for: .touchUpInside)
            dangerBTN3.imageEdgeInsets = UIEdgeInsets(top: 5, left: -3, bottom: 5, right: 4)
            dangerBTN3.titleLabel?.textAlignment = .center
            set.addSubview(dangerBTN3)
            
//            saveView.isHidden = true
//            dateView.isHidden = true
//            dateViewLabel.isHidden = true
            
            
            
        }
        
//        if IS_IPHONE_N_PLUS {
//            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        } else if IS_IPHONE_12PRO_MAX {
//            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 210, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        } else {
//            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 210, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        }
//        goalCancelBTN.setTitle("취소", for: .normal)
//        goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
//        goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
//        scrollView.addSubview(goalCancelBTN)
//
//        goalCancelBTN.isHidden = true
//
//
//        if IS_IPHONE_N_PLUS {
//            goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        } else if IS_IPHONE_12PRO_MAX {
//            goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 210, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        } else {
//                    goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 210, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//
//        }
//
//
////        goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        goalSaveBTN.setTitle("저장", for: .normal)
//        goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
//
//        goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
//        scrollView.addSubview(goalSaveBTN)
//        goalSaveBTN.isHidden = true
        
        goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 190, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        goalCancelBTN.setTitle("취소", for: .normal)
//        goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
        goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(goalCancelBTN)
        goalCancelBTN.isHidden = true
        
        goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 190, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        goalSaveBTN.setTitle("저장", for: .normal)
        goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
        scrollView.addSubview(goalSaveBTN)
        goalSaveBTN.isHidden = true
        
        
        if IS_IPHONE_N_PLUS {
            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 130, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalCancelBTN.setTitle("취소", for: .normal)
//            goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
            goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
            scrollView.addSubview(goalCancelBTN)
            goalCancelBTN.isHidden = true
            
            goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 130, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalSaveBTN.setTitle("저장", for: .normal)
            goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
            goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
            scrollView.addSubview(goalSaveBTN)
            goalSaveBTN.isHidden = true
        }
        if IS_IPHONE_N {
            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 120, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalCancelBTN.setTitle("취소", for: .normal)
//            goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
            goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
            scrollView.addSubview(goalCancelBTN)
            goalCancelBTN.isHidden = true
            
            goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 120, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalSaveBTN.setTitle("저장", for: .normal)
            goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
            goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
            scrollView.addSubview(goalSaveBTN)
            goalSaveBTN.isHidden = true
        }
        
        BloodPressureWebView.isHidden = true
        BloodPressureManagementNotebookView.isHidden = false
        bloodPressureListView.isHidden = true
        
        self.dataUpdate()
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 0).isActive = true
        
        print("?????\(keyCounter)")
        
//        /////////////////////////////////////here
        if keyCounter == 0 {
            scrollView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
            BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = true
            set.isHidden = false
            goalCancelBTN.isHidden = false
            goalSaveBTN.isHidden = false
            
           
            
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = true
            BloodPressureManagementNotebookView.BloodPressureView.isHidden = true
            saveView.isHidden = true
            dateView.isHidden = true
            dateViewLabel.isHidden = true
            
            keyCounter = 10
            UserDefaults.standard.setValue(keyCounter, forKey: "key")
            
            print("key?????\(keyCounter)")
        }
//        else {
//            scrollView.backgroundColor = .lightGray
//                        BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
//                        BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
//                        set.isHidden = true
//                        goalCancelBTN.isHidden = true
//                        goalSaveBTN.isHidden = true
//
//
//
//                        BloodPressureWebView.isHidden = true
//                        BloodPressureManagementNotebookView.isHidden = false
//                        bloodPressureListView.isHidden = true
//                        BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
//                        saveView.isHidden = false
//                        dateView.isHidden = false
//                        dateViewLabel.isHidden = false
//
//        }
        
//        if BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text != nil {
//            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
//                                   BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
//                                   set.isHidden = true
//                                   goalCancelBTN.isHidden = true
//                                   goalSaveBTN.isHidden = true
//
//
//
//                                   BloodPressureWebView.isHidden = true
//                                   BloodPressureManagementNotebookView.isHidden = false
//                                   bloodPressureListView.isHidden = true
//                                   BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
//                                   saveView.isHidden = false
//                                   dateView.isHidden = false
//                                   dateViewLabel.isHidden = false
//        }
        
        
        
//        if keyCounter == UserDefaults.standard.integer(forKey: "key"){
//            scrollView.backgroundColor = .lightGray
//            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
//            set.isHidden = true
//            goalCancelBTN.isHidden = true
//            goalSaveBTN.isHidden = true
//
//
//
//            BloodPressureWebView.isHidden = true
//            BloodPressureManagementNotebookView.isHidden = false
//            bloodPressureListView.isHidden = true
//            BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
//            saveView.isHidden = false
//            dateView.isHidden = false
//            dateViewLabel.isHidden = false
//        }
        

        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(edit(_ :)), name: NSNotification.Name("edit"), object: nil)
         
        
    }
    
    
    @objc func edit(_ button: Notification) {
        
        
        
        
        
        
//        // notification.userInfo 값을 받아온다.
//     let vc = ChangeDataBloodPressureViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: false)
//        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        super.viewDidAppear(animated)
        print("------1")
        
        dataUpdateBl()
//        dataUpdate()
//        singUPData()
        print("------2")
        
        if set.isHidden == false {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        UnderBar = UIView(frame: CGRect(x: button2.center.x - 20 , y: button2.frame.size.height - 2, width: button1.frame.size.width / 3, height: 2))
//        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//
//        button2.addSubview(UnderBar)
//    }
    
    //use this func
    func dataUpdateBl(){
        print("dmdkdkkdk")
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        
        let sid = "\((UserDefaults.standard.object(forKey: "userSid")) ?? 0)"
        
        Server.getData(type: Server.InfoType.BLOOD_USER, otherInfo: ["user_sid":sid]) { (kData : Data?) in
            if let data = kData {
                print("1")
                do {
                    print("2")
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("json:\n\(jsonDic)")
                        
                        
                        
                        
                        let max = jsonDic["max"] ?? ""
                        let min = jsonDic["min"] ?? ""
                        let seccess = jsonDic["success"] ?? ""
                        let cnt = jsonDic["cnt"] ?? ""
                        let seccess2 = jsonDic["seccess2"] ?? ""
                        let cnt2 = jsonDic["cnt2"] ?? ""
                        
                        let successValue = Int(seccess, radix: 10)
                        let cntValue = Int(cnt, radix: 10)
                        
                        let successValue2 = Int(seccess2, radix: 10)
                        let cntValue2 = Int(cnt2, radix: 10)
                        
                        
                        
                        
                        
                        
                        if let integerJson = jsonDic["success"]!.toCGFloat(){
                            print("Integer conversion successful : \(integerJson)")
                            
                            
                            let z = integerJson
                            UserDefaults.standard.setValue(z, forKey: "s")
                            bp1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
                            
                        }
                        else{
                            print("Integer conversion failed")
                        }
                        
                        
                        if let integerJson = jsonDic["cnt"]!.toCGFloat(){
                            print("Integer conversion successful : \(integerJson)")
                            
                            
                            let y = integerJson
                            UserDefaults.standard.setValue(y, forKey: "c")
                            bp2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
                        }
                        else{
                            print("Integer conversion failed")
                        }
                        
                        
                        print(bp1)
                        print(bp2)
                        
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
//                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
//                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
//                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
//                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        
                        print("여기로 와주세요1")
                        
                        if let success = successValue , let cnt = cntValue {
                            print("여기로 와주세요2")
                            let persent : Int
                            let perGraph: CGFloat
                            if cnt != 0 {
                                
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                                perGraph = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                
                                print("---------------1")
                                UserDefaults.standard.setValue(persent, forKey: "persent")
                                print(persent)
                                UserDefaults.standard.setValue(perGraph, forKey: "perGraph")
                                
                                print(perGraph)
                                print("---------------1")
                                
                                
                                
                                
                                
                                
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                        if let success = successValue2 , let cnt = cntValue2 {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                    }
                    
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    func moveSelected(view :UIView, button: UIButton) {
        view.center.x = button.center.x
    }
    
    
    @objc func setDown(_ sender: UIButton) {
        BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
        set.isHidden = true
        goalCancelBTN.isHidden = true
        goalSaveBTN.isHidden = true

        cancelBTN.isHidden = false
        saveBTN.isHidden = false

        BloodPressureWebView.isHidden = true
        BloodPressureManagementNotebookView.isHidden = false
        bloodPressureListView.isHidden = true
        BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
        saveView.isHidden = false
        dateView.isHidden = false
        dateViewLabel.isHidden = false
        scrollView.isScrollEnabled = true
    }


    @objc func show(_ sender: UIButton) {
        
        
        
        UserDefaults.standard.set(ShrinkGoal.text, forKey: "shrink")
        
        UserDefaults.standard.set(relaxationGoal.text, forKey: "relax")
        
        scrollView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
        BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = true
        set.isHidden = false
        goalCancelBTN.isHidden = false
        goalSaveBTN.isHidden = false
        
        cancelBTN.isHidden = true
        saveBTN.isHidden = true
       
        
        BloodPressureWebView.isHidden = true
        BloodPressureManagementNotebookView.isHidden = true
        bloodPressureListView.isHidden = true
        BloodPressureManagementNotebookView.BloodPressureView.isHidden = true
        saveView.isHidden = true
        dateView.isHidden = true
        dateViewLabel.isHidden = true
        
        scrollView.isScrollEnabled = false
      
        
    }

    func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    /////////////////////////////////////here
    override func viewWillAppear(_ animated: Bool) {
    
        
        if BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text != nil {
            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
                                   BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
                                   set.isHidden = true
                                   goalCancelBTN.isHidden = true
                                   goalSaveBTN.isHidden = true
           
           
           
                                   BloodPressureWebView.isHidden = true
                                   BloodPressureManagementNotebookView.isHidden = false
                                   bloodPressureListView.isHidden = true
                                   BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
                                   saveView.isHidden = false
                                   dateView.isHidden = false
                                   dateViewLabel.isHidden = false
        }
        
//        keyCounter = 10
//        UserDefaults.standard.set(keyCounter, forKey: "key")
//
//        if keyCounter == 1 {
//            scrollView.backgroundColor = .lightGray
//            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = true
//            set.isHidden = false
//            goalCancelBTN.isHidden = false
//            goalSaveBTN.isHidden = false
//
//
//
//            BloodPressureWebView.isHidden = true
//            BloodPressureManagementNotebookView.isHidden = true
//            bloodPressureListView.isHidden = true
//            BloodPressureManagementNotebookView.BloodPressureView.isHidden = true
//            saveView.isHidden = true
//            dateView.isHidden = true
//            dateViewLabel.isHidden = true
//
//            keyCounter = 10
//            UserDefaults.standard.setValue(keyCounter, forKey: "key")
//            print("??????\(UserDefaults.standard.setValue(keyCounter, forKey: "key"))")
//        }
//        if keyCounter == UserDefaults.standard.integer(forKey: "key") {
//            scrollView.backgroundColor = .lightGray
//            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
//            BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
//            set.isHidden = true
//            goalCancelBTN.isHidden = true
//            goalSaveBTN.isHidden = true
//
//
//
//            BloodPressureWebView.isHidden = true
//            BloodPressureManagementNotebookView.isHidden = false
//            bloodPressureListView.isHidden = true
//            BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
//            saveView.isHidden = false
//            dateView.isHidden = false
//            dateViewLabel.isHidden = false
//        }
        
//        self.dataUpdate()
        //        NotificationCenter.default.addObserver(self, selector: #selector(test(_ :)), name: Notification.Name("test"), object: nil)
        var time = Date()
        var formatter = DateFormatter()
        //        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        
        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        
        let formattedDateInString = formatter.string(from: time)
        
        changeTf.placeholder = formattedDateInString
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        
        
        if set.isHidden == true {
            //        keyCounter = keyCounter + 1
            //        print("Key Counter = ",keyCounter)
            // 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
            guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            // ⭐️ 이 조건을 넣어주지 않으면, 각각의 텍스트필드마다 keyboardWillShow 동작이 실행되므로 아래와 같은 현상이 발생
                    if view.frame.origin.y == 0 {
                        view.frame.origin.y -= keyboardHeight
                    }
        } else {
            guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            let keyboardHeight = keyboardFrame.cgRectValue.height
        }
    }

    @objc func keyboardWillHide(_ sender: Notification) {
//        keyCounter = keyCounter + 1
//        print("Key Counter = ",keyCounter)
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    func dataUpdate(){
//        keyCounter = keyCounter + 1
//        print("Key Counter = ",keyCounter)
        print("hgdhgfhgfgh")
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        
        let regNumString = "SB-12500-1"
        
        
        
        
        
        Server.getData(type: Server.InfoType.BLOOD_USER, otherInfo: ["user_sid":"\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"]) { (kData : Data?) in
            if let data = kData {
                print("들어와?")
                do {
                    print("들어와222?")
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("json:\n\(jsonDic)")
                        let max = jsonDic["max"] ?? ""
                        let min = jsonDic["min"] ?? ""
                        let seccess = jsonDic["seccess"] ?? ""
                        let cnt = jsonDic["cnt"] ?? ""
                        let seccess2 = jsonDic["seccess2"] ?? ""
                        let cnt2 = jsonDic["cnt2"] ?? ""
                        
                       
                        
                        
                        
                        let sucV = Int(seccess, radix: 10)
                        let cntV = Int(cnt, radix: 10)
                        
                        
                        UserDefaults.standard.setValue(sucV, forKey: "suc")
                        
                        
//                        UserDefaults.standard.setValue(sucV, forKey: "sucV")
//                        UserDefaults.standard.setValue(cntV, forKey: "cntV")
                        
                        
                        
                        
                        
                        let successValue2 = Int(seccess2, radix: 10)
                        let cntValue2 = Int(cnt2, radix: 10)
                        
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
                        
                        
                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        
                        
                        if let success = sucV , let cnt = cntV {
                            let persent : Int
                            if cnt != 0 {
                                print("sdkjsaldjsakldjasljdasdkjl")
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                                print("persent--->\(persent)")
                                UserDefaults.standard.setValue(persent, forKey: "perB")
                                print(".........")
                                print("perB---->\(UserDefaults.standard.object(forKey: "perB"))")
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                        if let success = successValue2 , let cnt = cntValue2 {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                    }
                    
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    @objc func test(_ noti: Notification) {
        print("succestt")
        
        testBtn1.isHidden = true
        
//        BloodPressureWebView.isHidden = true
//        BloodPressureManagementNotebookView.isHidden = false
//        bloodPressureListView.isHidden = true
        

        
        
    }
    
    @objc func saveData(_ sender: UIButton) {
        
        if self.contractionInputView.text == "" {
            showToast(message: "수축기를 입력하세요1.", font: UIFont(name: "SUITE-Regular", size: 20)!)

            
            
            return
        }
        
        if self.relaxtionInputView.text == "" {
//            toastShow(message: "이완기를 입력하세요.")
            showToast(message: "이완기를 입력하세요1.", font: UIFont(name: "SUITE-Regular", size: 20)!)
            return
        }
        
        if self.heartRateInputView.text == "" {
//            toastShow(message: "맥박을 입력하세요.")
            showToast(message: "맥박을 입력하세요1.", font: UIFont(name: "SUITE-Regular", size: 20)!)
            return
        }
//
        let max = self.contractionInputView.text!
        let min = self.relaxtionInputView.text!
        let pulse = self.heartRateInputView.text!
//
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        
        
        UserDefaults.standard.setValue(max, forKey: "maxmax")
        UserDefaults.standard.setValue(min, forKey: "minmin")
        UserDefaults.standard.setValue(pulse, forKey: "pulsepulse")
        
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a HH:mm"
        var current_date_string = formatter.string(from: Date())
        print(current_date_string)
        
        var formatter_year = DateFormatter()
        formatter_year.dateFormat = "yyyy"
        var current_year_string = formatter_year.string(from: Date())
        print(current_year_string)
        
        var formatter_month = DateFormatter()
        formatter_month.dateFormat = "MM"
        var formatter_month_string = formatter_month.string(from: Date())
        print(formatter_month_string)
        
        var formatter_day = DateFormatter()
        formatter_day.dateFormat = "dd"
        var formatter_day_string = formatter_day.string(from: Date())
        print(formatter_day_string)
        
        var formatter_dayWeek = DateFormatter()
        formatter_dayWeek.dateFormat = "c"
        var formatter_dayWeek_string = formatter_dayWeek.string(from: Date())
        print(formatter_dayWeek_string)
        
        var formatter_week = DateFormatter()
        formatter_week.dateFormat = "w"
        var formatter_week_string = formatter_week.string(from: Date())
        print(formatter_week_string)
        
   
        
        
        let regNumString = "SB-12500-1"
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
//     let year = dateToStringWithFormat(formatString: "yyyy", date: today)
        let year = current_year_string
         
        let month = formatter_month_string
        let week = formatter_week_string
        let dayweek = formatter_dayWeek_string
        let day = formatter_day_string
//        let dateTime = current_date_string
        var dateTime = changeTf.text
        
//
        let sendDataDic = [
            "user_sid":sid,
//            "reg_num":regNumString,
            "max":max,
            "min":min,
            "pulse":pulse,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
        ] as? [String:String]
        
        
//        if var json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//            var objects = json["data"] as? [String: Any]
//            if var accounts = objects?["accounts"] as? [[String:Any]] {
//                for index in 0..<accounts.count {
//                    accounts[index]["balance"] = 0
//                }
//                objects?["accounts"] = accounts
//            }
//            json["data"] = objects
//        }
      
        
        
        self.showToast(message: "데이터가 등록 되었습니다.", font: UIFont(name: "SUITE-Regular", size: 18)!)
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.BLOOD_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("dataString?:\(dataString)")
                    self.contractionInputView.text = ""
                    self.relaxtionInputView.text = ""
                    self.heartRateInputView.text = ""
                    self.view.endEditing(true)
                    print("go")
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                     
                    self.bloodPressureListView.dataScrollView.dataUpdate()
                }
            }
        }
        
        
    }
    
    @objc func rightButton2PressedList(_ button: UIButton) {
        
        
        testBtn1.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        testBtn2.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn1.setTitleColor(.white, for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 36.0 / 255.0, green: 89.0 / 255.0, blue: 149.0 / 255.0, alpha: 1), for: .normal)
        testBtn1.layer.borderWidth = 0
        testBtn2.layer.borderWidth = 1
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        
        self.bloodPressureListView.graphScrollView.isHidden = true
        self.bloodPressureListView.dataScrollView.isHidden = false

        self.bloodPressureListView.dataScrollView.dataUpdate()
        dataUpdate()
    }
    
    @objc func rightButton2PressedGraph(_ button: UIButton) {

        testBtn1.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        testBtn1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn1.layer.borderWidth = 1
        testBtn2.layer.borderWidth = 0
        
        
        testBtn2.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        testBtn1.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        
//        testBtn1.setTitleColor(.black, for: .normal)
        testBtn1.setTitleColor(#colorLiteral(red: 36.0 / 255.0, green: 89.0 / 255.0, blue: 149.0 / 255.0, alpha: 1), for: .normal)
        testBtn2.setTitleColor(.white, for: .normal)
        
        self.bloodPressureListView.graphScrollView.isHidden = false
        self.bloodPressureListView.dataScrollView.isHidden = true

        self.bloodPressureListView.graphScrollView.dataUpdate(index: 1)
        
        
    }
    
    
    
   @objc func rightButton2Pressed(_ button: UIButton) {
   
           button.isSelected = !button.isSelected
           if button.isSelected {
               //그래프로 보기 -> 데이터로 보기 버튼 활성화
//               self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "goForward")
               self.bloodPressureListView.graphScrollView.isHidden = false
               self.bloodPressureListView.dataScrollView.isHidden = true
   
               self.bloodPressureListView.graphScrollView.dataUpdate(index: 1)
           }else{
               //데이터로 보기 -> 그래프로 보기 버튼 활성화
//               self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "goBack")
               self.bloodPressureListView.graphScrollView.isHidden = true
               self.bloodPressureListView.dataScrollView.isHidden = false
   
               self.bloodPressureListView.dataScrollView.dataUpdate()
           }
       }
    
    @objc func segButtonPressed(_ sender: UIButton) {
print("tab")
        self.view.endEditing(true)
        
        if sender.tag == 0 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button1)
                
            })
            
            BloodPressureWebView.isHidden = false
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = true
            
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
            
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button2)
                
            })
            
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = false
            bloodPressureListView.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button3)
                
            })
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = false
            
            label1.textColor = .lightGray
            label2.textColor = .lightGray
            label3.textColor = .black
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = UserDefaults.standard.string(forKey: "sh")
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = UserDefaults.standard.string(forKey: "re")
        
        if BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text != nil {
            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
                                   BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
                                   set.isHidden = true
                                   goalCancelBTN.isHidden = true
                                   goalSaveBTN.isHidden = true
           
           
           
                                   BloodPressureWebView.isHidden = true
                                   BloodPressureManagementNotebookView.isHidden = false
                                   bloodPressureListView.isHidden = true
                                   BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
                                   saveView.isHidden = false
                                   dateView.isHidden = false
                                   dateViewLabel.isHidden = false
        }
    }
    
    override func viewWillLayoutSubviews() {
                BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = UserDefaults.standard.string(forKey: "sh")
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = UserDefaults.standard.string(forKey: "re")
        
        if BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text != nil {
            BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
                                   BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
                                   set.isHidden = true
                                   goalCancelBTN.isHidden = true
                                   goalSaveBTN.isHidden = true
           
           
           
                                   BloodPressureWebView.isHidden = true
                                   BloodPressureManagementNotebookView.isHidden = false
                                   bloodPressureListView.isHidden = true
                                   BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
                                   saveView.isHidden = false
                                   dateView.isHidden = false
                                   dateViewLabel.isHidden = false
        }
    }
    
    @objc func saveGoalData(_ sender: UIButton) {
        
        
        print("save clikck here")
        
        
        if ShrinkGoal.text == "" {
            UserDefaults.standard.removeObject(forKey: "sh")
            print("비어있음")
            
            showToast(message: "모든 항목을 입력해 주세요.", font: UIFont.systemFont(ofSize: 15))
            
        } else {
            print("값있음")
            
            
            UserDefaults.standard.setValue(ShrinkGoal.text, forKey: "sh")

            UserDefaults.standard.setValue(relaxationGoal.text, forKey: "re")
            UserDefaults.standard.setValue(pulseGoal.text, forKey: "pu")
            
            
            let vc = BloodPressureViewController2()
           
                                                                       vc.modalPresentationStyle = .fullScreen
                                                                       self.present(vc, animated: false)
            
            BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
            set.isHidden = true
            goalCancelBTN.isHidden = true
            goalSaveBTN.isHidden = true
            
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = false
            bloodPressureListView.isHidden = true
          
            
            BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
            saveView.isHidden = false
            dateView.isHidden = false
            dateViewLabel.isHidden = false

            NotificationCenter.default.post(name: NSNotification.Name("goal1"), object: nil, userInfo: nil)
            NotificationCenter.default.post(name: NSNotification.Name("goal2"), object: nil, userInfo: nil)
            
            
        }
        
        
        
        
//        UserDefaults.standard.setValue(ShrinkGoal.text, forKey: "sh")
//
//        UserDefaults.standard.setValue(relaxationGoal.text, forKey: "re")
//        UserDefaults.standard.setValue(pulseGoal.text, forKey: "pu")
//
//
//        let vc = BloodPressureViewController2()
//
//                                                                   vc.modalPresentationStyle = .fullScreen
//                                                                   self.present(vc, animated: false)
//
//        BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = false
//        set.isHidden = true
//        goalCancelBTN.isHidden = true
//        goalSaveBTN.isHidden = true
//
//        BloodPressureWebView.isHidden = true
//        BloodPressureManagementNotebookView.isHidden = false
//        bloodPressureListView.isHidden = true
//
//
//        BloodPressureManagementNotebookView.BloodPressureView.isHidden = false
//        saveView.isHidden = false
//        dateView.isHidden = false
//        dateViewLabel.isHidden = false
//
//        NotificationCenter.default.post(name: NSNotification.Name("goal1"), object: nil, userInfo: nil)
//        NotificationCenter.default.post(name: NSNotification.Name("goal2"), object: nil, userInfo: nil)
//
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/3.6, y: self.view.frame.size.height / 1.8 , width: 200, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.8, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    @objc func didRecieveTestNotification(_ notification: Notification) {
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = UserDefaults.standard.string(forKey: "sh")
                BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = UserDefaults.standard.string(forKey: "re")
    }
    @objc func goPopUp(_ sender: UIButton) {
        
        
        let vc = BloodPopUpViewController()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
        
        
        
    }
    private func setupToolBar() {
        
        let toolBar = UIToolbar()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandeler))

        toolBar.items = [flexibleSpace, doneButton]
        // 적절한 사이즈로 toolBar의 크기를 만들어 줍니다.
        toolBar.sizeToFit()

        // textField의 경우 클릭 시 키보드 위에 AccessoryView가 표시된다고 합니다.
        // 현재 inputView를 datePicker로 만들어 줬으니 datePicker위에 표시되겠죠?
        changeTf.inputAccessoryView = toolBar
    }
    private func setupDatePicker() {
        // datePickerModed에는 time, date, dateAndTime, countDownTimer가 존재합니다.
        datePicker.datePickerMode = .dateAndTime
        // datePicker 스타일을 설정합니다. wheels, inline, compact, automatic이 존재합니다.
        datePicker.preferredDatePickerStyle = .wheels
        // 원하는 언어로 지역 설정도 가능합니다.
        datePicker.locale = Locale(identifier: "ko-KR")
        // 값이 변할 때마다 동작을 설정해 줌
        self.datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        // textField의 inputView가 nil이라면 기본 할당은 키보드입니다.
        changeTf.inputView = datePicker
        // textField에 오늘 날짜로 표시되게 설정
        changeTf.text = dateFormat(date: Date())
    }
    @objc func doneButtonHandeler(_ sender: UIBarButtonItem) {
        changeTf.text = dateFormat(date: datePicker.date)
        // 키보드 내리기
        changeTf.resignFirstResponder()
    }
    // 값이 변할 때 마다 동작
    @objc func dateChange(_ sender: UIDatePicker) {
        // 값이 변하면 UIDatePicker에서 날자를 받아와 형식을 변형해서 textField에 넣어줍니다.
        changeTf.text = dateFormat(date: sender.date)
    }
    
    // 텍스트 필드에 들어갈 텍스트를 DateFormatter 변환
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a h:mm"
        formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
        
        
        
        return formatter.string(from: date)
    }
}
