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
    
    private let timerDuration = 15.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStoped || timerView.state == .isPaused{
            timerView.startTimer()
            timerView.state = .isRuning
            setTitleForNavBarButton(Resourses.Strings.Session.navBarPause, at: .left)
        }else{
            timerView.pauseTimer()
            timerView.state = .isPaused
            
            setTitleForNavBarButton(Resourses.Strings.Session.navBarStart, at: .left)

        }
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStoped
        setTitleForNavBarButton(Resourses.Strings.Session.navBarStart, at: .left)

        
    }
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
//            make.height.equalTo(500)
            
        }
    }
    
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        addNavBarButton(at: .left, with: Resourses.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Resourses.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)

        
        timerView.callBack = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.navBarRightButtonHandler()

            }
        }
    }
}
