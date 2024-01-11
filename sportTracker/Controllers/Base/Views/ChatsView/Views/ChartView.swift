//
//  ChartView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 10.01.2024.
//

import UIKit

final class ChartView: BaseView{
    private let yAxisSeparator : UIView = {
       let view = UIView()
        view.backgroundColor = Resourses.Colors.separator
        return view
    }()
    
    private let xAxisSeparator : UIView = {
       let view = UIView()
        view.backgroundColor = Resourses.Colors.separator
        return view
    }()
    
    func configure(with data: [ChartsView.ChartData], topChartOffset: Int ){
        layoutIfNeeded()
        drawDashLines()
        drawChart(with: data, topChartOffset: topChartOffset)
    }
    
}


extension ChartView{
    override func addViews(){
        super.addViews()
        addSubview(yAxisSeparator)
        addSubview(xAxisSeparator)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        
        yAxisSeparator.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        
        xAxisSeparator.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    override func configure(){
        super.configure()
    }

}


private extension ChartView{
    
    func drawDashLines(with counts: Int = 9){
        (0..<counts).map{ CGFloat($0) } .forEach {
            drawDashLine(at: bounds.height/CGFloat(counts) * $0)
        }
    }
    func drawDashLine(at yPosition: CGFloat){
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resourses.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
    
    func drawChart(with data: [ChartsView.ChartData], topChartOffset: Int){
        guard let maxValue = data.sorted(by: {$0.value > $1.value}).first?.value else {return}
        
        let valuePoint = data.enumerated().map{ CGPoint(x: CGFloat($0), y: CGFloat($1.value))}
        
        let chartHeight = bounds.height / CGFloat(maxValue + topChartOffset)
        
        let points = valuePoint.map{
            let x = bounds.width / CGFloat(valuePoint.count - 1) * $0.x
            let y = bounds.height - $0.y * chartHeight
            
            return CGPoint(x: x, y: y)
        }
        
        let charPath = UIBezierPath()
        charPath.move(to: points[0])
        
        
        points.forEach{
            charPath.addLine(to: $0)
            drawChartDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = charPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = Resourses.Colors.active.cgColor
        charPath.lineWidth = 3
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    func drawChartDot(at point: CGPoint){
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = Resourses.Colors.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
    }
}
