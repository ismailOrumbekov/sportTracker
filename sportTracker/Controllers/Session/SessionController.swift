//
//  SessionController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    
    private let statsView = StatsView(with: Resourses.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: Resourses.Strings.Session.stepcCounter)
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
        view.addSubview(statsView)
        view.addSubview(stepsView)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        timerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        statsView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(timerView.snp.bottom).offset(10)
            make.trailing.equalTo(view.snp.centerX).offset(-7.5)
        }
        
        stepsView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.centerX).offset(7.5)
            make.top.equalTo(statsView.snp.top)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(200)
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
        
        statsView.configure(with: [.averagePace(value: "8'20''"),
            .heartRate(value: "155"),
            .totalDistance(value: "8.25"),
            .totalSteps(value:  "7,682")])
        
        stepsView.configure(with:[
                                .init(value: "8k", heightPar: 1, title: "2/14"),
                                .init(value: "7k", heightPar: 0.8, title: "2/15"),
                                .init(value: "5k", heightPar: 0.6, title: "2/16"),
                                .init(value: "6k", heightPar: 0.4, title: "2/17")
                                ])
    }
}

