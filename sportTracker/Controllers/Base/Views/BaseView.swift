//
//  BaseView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 28.12.2023.
//

import UIKit

class BaseView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView{
    func setUpUI(){
        addViews()
        setUpConstraint()
        configure()
    }
    func addViews(){}
    func setUpConstraint(){}
    func configure(){
    }

}
