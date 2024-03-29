//
//  UIView + ext.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat){
        let separatop = UIView()
        separatop.backgroundColor = color
        separatop.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separatop.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        
        addSubview(separatop)
    }
    
    func makeSystem(button: UIButton){
        button.addTarget(self, action: #selector(handleIn), for: [.touchDown, .touchDragInside ])
        button.addTarget(self, action: #selector(handleOut), for: [.touchDragOutside, .touchUpInside, .touchUpOutside, .touchDragExit, .touchCancel])
    }
    
    @objc func handleIn(){
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        
        }
    }
    @objc func handleOut(){
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = bounds
        borderLayer.path = path.cgPath
        borderLayer.strokeColor = Resourses.Colors.separator.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 1
        
        layer.addSublayer(borderLayer)
    }
}
