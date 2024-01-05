//
//  BaseController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    
}


@objc extension BaseController{
    func setUpUI(){
        addViews()
        setUpConstraint()
        configure()
    }
    func addViews(){}
    func setUpConstraint(){}
    func configure(){
        view.backgroundColor = Resourses.Colors.background
    }
    
    func navBarLeftButtonHandler(){
        print("left tapped")
    }
    func navBarRightButtonHandler(){
        print("right pressed")
    }
    
}

extension BaseController{
    func addNavBarButton(at position: NavBarPosition, with title: String){
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resourses.Colors.active, for: .selected)
        button.setTitleColor(Resourses.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resourses.Fonts.helvelticalRegular(with: 17)
        
        switch position{
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

        }
    }
    
    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition){
        switch position{
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)

        }
    }
}
