//
//  Graph.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

import Foundation
import UIKit

struct GraphData {
    var value : CGFloat = 0
}

enum GraphType {
    case line
    case bar
}

protocol KJG_GraphViewDelegate {
    var y_axisViewWidthRatio    : CGFloat {get set}
    var x_axisViewHeightRatio   : CGFloat {get set}
}

protocol KJG_GraphDelegate {
    var pointBorderColor        : UIColor  {get set}
    var pointBackgroundColor    : UIColor  {get set}
    var pathStrokeColor         : UIColor  {get set}
    
    func valueUpdate( graphValues kGraphValues : [GraphData?] )
    
    func setMax(maxValue kMaxValue : CGFloat, minValue kMinValue : CGFloat )
    
    /*
     valueUpdate와는 별개로 addValue 추가
     (그래프 추가, 레이어와 패스 모두 추가해야함)
     
     xColums = [String]()
     xColumColor
     xColumFontSize
     
     yColums = [String]()
     yColumColor
     yColumFontSize
     
     
     */
    
    
}


class KJG_GraphView : UIView, KJG_GraphViewDelegate, UITableViewDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public var graph : KJG_Graph!
    public var y_axisViewWidthRatio : CGFloat  = 0.1
    public var x_axisViewHeightRatio : CGFloat = 0.1
    
    private var y_axisView : UIView!
    private var x_axisView : UIView!
    
    private var type : GraphType!
    
    public var graphs = [KJG_Graph]()
    
    init(frame: CGRect, type : GraphType, numberOfGraph : Int) {
        super.init(frame: frame)

        self.type = type
        
        self.backgroundColor = UIColor.white
        
        self.y_axisView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: self.frame.size.width * self.y_axisViewWidthRatio,
            height: self.frame.size.height * (1 - self.x_axisViewHeightRatio)))
        self.y_axisView.backgroundColor = UIColor.white //UIColor.clear //?/
        self.addSubview(self.y_axisView)
        
        self.x_axisView = UIView(frame:CGRect(
            x: self.frame.size.width * self.y_axisViewWidthRatio,
            y: self.frame.size.height * (1 - self.x_axisViewHeightRatio),
            width: self.frame.size.width * (1 - self.y_axisViewWidthRatio),
            height: self.frame.size.height * self.x_axisViewHeightRatio))
        self.x_axisView.backgroundColor = UIColor.white
        self.addSubview(self.x_axisView)
        
        for _ in 0..<numberOfGraph {
            let graph = KJG_Graph(frame: CGRect(
                x: self.frame.size.width * self.y_axisViewWidthRatio,
                y: 0,
                width: self.frame.size.width * (1 - self.y_axisViewWidthRatio),
                height: self.frame.size.height * (1 - self.x_axisViewHeightRatio)), type : self.type)
            self.addSubview(graph)
            
            self.graphs.append(graph)
        }
    }
    
    let yAxisLabelHeight : CGFloat = 30

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.y_axisView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.frame.size.width * self.y_axisViewWidthRatio,
            height: self.frame.size.height * (1 - self.x_axisViewHeightRatio) - (yAxisLabelHeight / 2))
        
        self.x_axisView.frame = CGRect(
            x: self.frame.size.width * self.y_axisViewWidthRatio,
            y: self.frame.size.height * (1 - self.x_axisViewHeightRatio),
            width: self.frame.size.width * (1 - self.y_axisViewWidthRatio),
            height: self.frame.size.height * self.x_axisViewHeightRatio)
        
        for graph in self.graphs {
            graph.frame = CGRect(
                x: self.frame.size.width * self.y_axisViewWidthRatio,
                y: 0,
                width: self.frame.size.width * (1 - self.y_axisViewWidthRatio),
                height: self.frame.size.height * (1 - self.x_axisViewHeightRatio))
        }
    }
    
    var yAxisLabels = [UILabel]()
    var ySeparatorViews = [UIView]()
    func setYAxisStrings( yAxisStrings : [String] ){
        
        //초기화
        for yAxisLabel in self.yAxisLabels {
            yAxisLabel.removeFromSuperview()
        }
        yAxisLabels.removeAll()
        
        for ySeparatorView in ySeparatorViews {
            ySeparatorView.removeFromSuperview()
        }
        ySeparatorViews.removeAll()
        
        
        
        var minY : CGFloat = 0
        var maxY : CGFloat = 0
        for i in 0..<yAxisStrings.count {
            let yAxisLabel = UILabel(frame: CGRect(
                x: 0,
                y: CGFloat(i) * (self.y_axisView.frame.size.height / CGFloat(yAxisStrings.count)),
                width: self.y_axisView.frame.size.width,
                height: yAxisLabelHeight))
            
            yAxisLabel.backgroundColor = UIColor.clear
            yAxisLabel.text = yAxisStrings[i]
            yAxisLabel.textColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
            yAxisLabel.font = UIFont.systemFont(ofSize: 12)
            yAxisLabel.textAlignment = .center
            self.y_axisView.addSubview(yAxisLabel)
            self.yAxisLabels.append(yAxisLabel)
            
            if i == 0 { minY = yAxisLabel.center.y}
            if i == yAxisStrings.count - 1 { maxY = yAxisLabel.center.y }
            
            let ySeparatorView = UIView(frame: CGRect(x: 0, y: yAxisLabel.center.y, width: self.bounds.size.width, height: 1))
//            if yAxisLabel.text == "120" ||  yAxisLabel.text == "80"{
//                ySeparatorView.backgroundColor = UIColor(red: 211/255, green: 43/255, blue: 43/255, alpha: 1)
//            }else{
            ySeparatorView.backgroundColor = UIColor(white: 237/255, alpha: 1)
//            }
            
            self.insertSubview(ySeparatorView, at: 0)
//            self.addSubview(ySeparatorView)
            self.ySeparatorViews.append(ySeparatorView)
            
            
        }
        for graph in self.graphs {
            graph.graphValueViewHeight = maxY - minY
            graph.graphValueViewY = minY
//                graph.frame.size.height * (CGFloat(yAxisStrings.count - 1) / CGFloat(yAxisStrings.count))
            graph.setNeedsDisplay()
        }
        
    }
    
    
    var redSeparatorViews = [UIView]()
    func setRedLineValues(values : [CGFloat]){
        //?/
        
        for redSeparatorView in redSeparatorViews {
            redSeparatorView.removeFromSuperview()
        }
        redSeparatorViews = [UIView]()
        
        for graph in self.graphs {
            
            graph.drawFunc()
            
            for value in values {
                let valueGap = graph.maxValue! - graph.minValue!
                let y_ratio = ((value - graph.minValue!) / valueGap)
                let pointY = graph.scrollView.frame.size.height * (y_ratio)
                let redSeparatorView = UIView(frame: CGRect(x: -self.bounds.size.width / 2, y: pointY, width: self.bounds.size.width * 2, height: 1))
                redSeparatorView.backgroundColor = UIColor(red: 211/255, green: 43/255, blue: 43/255, alpha: 1)
                graph.scrollView.insertSubview(redSeparatorView, at: 0)
                self.redSeparatorViews.append(redSeparatorView)
            }
        }
    }
    
    var xAxisLabels = [UILabel]()
    func setXAxisStrings( xAxisStrings : [String] ){
        //?/
        if xAxisStrings.count == 0 {
            //  / 0 방지
            return
        }

        for graph in self.graphs {
            graph.graphValueViewWidth = graph.frame.size.width * (CGFloat(xAxisStrings.count - 1) / CGFloat(xAxisStrings.count))
            graph.setNeedsDisplay()
            graph.layoutIfNeeded()
            
        }
        
        //초기화
        for xAxisLabel in self.xAxisLabels {
            xAxisLabel.removeFromSuperview()
        }
        xAxisLabels.removeAll()
        
        for i in 0..<xAxisStrings.count {
            
            if xAxisStrings.count >= 20 && i % 2 == 1{
                continue
            }
            
            let xAxisLabelWidth : CGFloat = (self.x_axisView.frame.size.width / CGFloat(xAxisStrings.count))
            //일월화수목금 
            let xAxisLabel = UILabel(frame: CGRect(x: 0, y: -40, width: xAxisLabelWidth * 2, height: self.x_axisView.frame.size.height))
            print("xAxisStrings.count:\(xAxisStrings.count)")
            if xAxisStrings.count - 1 == 0 {
                xAxisLabel.center.x = self.x_axisView.frame.size.width / 2
            }else{
                xAxisLabel.center.x = (xAxisLabelWidth / 2) + (CGFloat(i) * (self.x_axisView.frame.size.width - xAxisLabelWidth) / CGFloat(xAxisStrings.count - 1))
            }
            xAxisLabel.text = xAxisStrings[i]
            xAxisLabel.textColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
            xAxisLabel.font = UIFont.systemFont(ofSize: 12)
            xAxisLabel.textAlignment = .center
            self.x_axisView.addSubview(xAxisLabel)
            
            self.xAxisLabels.append(xAxisLabel)
            
            
        }
    }
    
    class KJG_Graph: UIView, KJG_GraphDelegate {
        
        //=============================================================================================================================//
        // Public 변수
        //=============================================================================================================================//

        //public
        public var pointBorderColor     = UIColor.orange
        public var pointBackgroundColor = UIColor.white
        public var pathStrokeColor      = UIColor.orange
        
        //항상 두개를 "동시에" 초기화 할 수 있도록 한다
        public func setMax(maxValue kMaxValue : CGFloat, minValue kMinValue : CGFloat ){
            self.maxValue = kMaxValue
            self.minValue = kMinValue
        }
        
        public var graphValueViewY : CGFloat = 100
        public var graphValueViewHeight : CGFloat = 100
        public var graphValueViewWidth : CGFloat  = 100
        
        public var type : GraphType               = .line
        public var index : Int                    = 0
        public var numberOfGraphs : Int           = 0
        
        public var maxValue : CGFloat?
        public var minValue : CGFloat?
        
        public var scrollView : UIScrollView!
        //=============================================================================================================================//
        // Private 변수
        //=============================================================================================================================//

        private var pointViews = [UIView]()
        private var graphValues = [GraphData?]()
        
        private var lineShapeLayer : CAShapeLayer!
        private var linePath : UIBezierPath!
        
        private var graphValueView : UIView!
        
        
        //=============================================================================================================================//
        // KJG_Graph Function
        //=============================================================================================================================//

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(frame: CGRect, type : GraphType) {
            super.init(frame: frame)
            
            self.type = type
            
            self.backgroundColor = UIColor.clear
            self.clipsToBounds = true
//            self.clipsToBounds = false
            
            self.graphValueView = UIView(frame: self.bounds)
            self.addSubview(self.graphValueView)
            self.graphValueViewHeight = self.bounds.size.height
            
            self.lineShapeLayer = CAShapeLayer()
            self.linePath       = UIBezierPath()
            
            self.scrollView = UIScrollView(frame: self.graphValueView.bounds)
            self.scrollView.clipsToBounds = false
            self.graphValueView.addSubview(self.scrollView)
            
        }
        
        func drawFunc(){
            self.graphValueView.frame.origin.y = graphValueViewY
            self.graphValueView.frame.size.height = self.graphValueViewHeight
//            self.graphValueView.center.y = self.frame.size.height / 2
            
            self.graphValueView.frame.size.width = self.graphValueViewWidth
            self.graphValueView.center.x = self.frame.size.width / 2
            
            self.scrollView.frame = self.graphValueView.bounds
            
            self.valueUpdate(graphValues: self.graphValues)
        }
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            self.drawFunc()
            
        }
        
        
        func valueUpdate( graphValues kGraphValues : [GraphData?] ){
            
            if kGraphValues.count == 0 { return }
            
            //초기화
            for pointView in self.pointViews {
                pointView.removeFromSuperview()
            }
            self.pointViews.removeAll()
            self.lineShapeLayer.removeFromSuperlayer()
            self.graphValues = kGraphValues
            self.linePath.removeAllPoints()
            
            //min max값을 따로 지정하지 않았다면 주어진 데이터를 기반으로 min max값을 추출
            if self.maxValue == nil || self.minValue == nil{
                self.maxValue = -100_000
                self.minValue = 100_000
                for i in 0..<self.graphValues.count {
                    if let graphValue = self.graphValues[i] {
                        if graphValue.value > self.maxValue! {
                            self.maxValue = graphValue.value
                        }
                        if graphValue.value < self.minValue! {
                            self.minValue = graphValue.value
                        }
                    }
                }
            }
            
            //범위
            let valueGap = self.maxValue! - self.minValue!
            let gapX =  (self.frame.size.width) * (1 / CGFloat(graphValues.count))

            //linePath를 가지는 ShapeLayer
            lineShapeLayer.lineCap = CAShapeLayerLineCap.butt
            lineShapeLayer.lineJoin = CAShapeLayerLineJoin.round
            lineShapeLayer.strokeColor = self.pathStrokeColor.cgColor
            lineShapeLayer.fillColor = UIColor.clear.cgColor
            if self.type == .line {
                lineShapeLayer.lineWidth = 1
            }else{
                lineShapeLayer.lineWidth = gapX * 0.75 * (1 / CGFloat(self.numberOfGraphs))
            }
            self.scrollView.layer.addSublayer(lineShapeLayer)
            
            
            //스크롤뷰의 콘텐츠 너비 = 기본값의 경우 당연히 스크롤뷰의 너비가 된다.
            self.scrollView.contentSize.width = (gapX * CGFloat(graphValues.count - 1))
            
            //각 값을 그리기 위해 위치를 세팅
            var points = [CGPoint]()
            for i in 0..<graphValues.count {
                if let graphValue = graphValues[i] {
                    let value = graphValue.value
                    var pointX = (CGFloat(i) * gapX)
                    if self.type == .bar && self.numberOfGraphs > 1{
                        pointX = pointX - (gapX * 0.75 / 2) + (lineShapeLayer.lineWidth * CGFloat(self.index))
                    }
                    
                    let y_ratio = ((value - self.minValue!) / valueGap)
                    let pointY = self.scrollView.frame.size.height * (y_ratio)
                    
                    let currentPoint = CGPoint(x: pointX, y: pointY)
                    points.append(currentPoint)
                    
                    if self.type == .line {
                        //각 값마다 붙일 뷰
                        let pointView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: 9))
                        pointView.center = currentPoint
                        pointView.backgroundColor = self.pointBackgroundColor
                        pointView.layer.cornerRadius = pointView.frame.size.width / 2
                        pointView.layer.borderColor = self.pointBorderColor.cgColor
                        pointView.layer.borderWidth = 1
                        self.scrollView.addSubview(pointView)
                        self.pointViews.append(pointView)
                    }
                }
            }
            
            if points.count == 0 { return}
            
            //처음 포인트로 이동
            if type == .line {
                linePath.move(to: points[0])
            }else{
                linePath.move(to: CGPoint(x: points[0].x, y: self.graphValueView.frame.size.height))
                linePath.addLine(to: points[0])
            }
            
            //두번째부터 선 그리기
            for i in 1..<points.count{
                if type == .line {
                    linePath.addLine(to: points[i])
                }else{
                    linePath.move(to: CGPoint(x: points[i].x, y: self.graphValueView.frame.size.height))
                    linePath.addLine(to: points[i])
                }
            }
            
            //그린 선을 레이어에 반영
            lineShapeLayer.path = linePath.cgPath
            
        }
    }
    
}


