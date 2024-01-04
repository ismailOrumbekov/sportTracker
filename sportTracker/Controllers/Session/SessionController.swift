//
//  SessionController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: TimerView = {
        let view = TimerView(with: "Hello", buttonTitle: "button")
        
        return view
    }()
}

extension SessionController{
    override func addViews() {
        super.addViews()
        
        view.addSubview(timerView)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        timerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(500)
        }
    }
    
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")

    }
}
