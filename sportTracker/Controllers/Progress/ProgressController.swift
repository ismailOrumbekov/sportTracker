//
//  ProgressController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

class ProgressController: BaseController {

    private let dailyPerformanceView = DailyPerformanceView(with: Resourses.Strings.Progress.dailyPerfomance,
                                                            buttonTitle: Resourses.Strings.Progress.last7Days)
    private let monthlyPerformanceView = MonthlyPerformanceView(with: Resourses.Strings.Progress.monthlyPerformance,
                                                               buttonTitle: Resourses.Strings.Progress.last10Month)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout progress"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.progress
        addNavBarButton(at: .left, with: Resourses.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Resourses.Strings.Progress.navBarRight)
    }


}

extension ProgressController{
    override func addViews(){
        super.addViews()
        view.addSubview(dailyPerformanceView)
        view.addSubview(monthlyPerformanceView)
    }
    
    override func setUpConstraint(){
        super.setUpConstraint()
        dailyPerformanceView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(dailyPerformanceView.snp.width).multipliedBy(0.68)
        }
        
        monthlyPerformanceView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(dailyPerformanceView.snp.bottom).offset(15)
            make.height.equalTo(monthlyPerformanceView.snp.width).multipliedBy(1.06)
        }
    }
    
    
    override func configure(){
        super.configure()
        dailyPerformanceView.configure(with:[
            .init(value: "1", heightPar: 0.01, title: "Mon"),
                                .init(value: "2", heightPar: 0.8, title: "Tue"),
                                .init(value: "3", heightPar: 0.6, title: "Wen"),
                                .init(value: "4", heightPar: 1, title: "Thu"),
                                .init(value: "5", heightPar: 0.8, title: "Fri"),
                                .init(value: "6", heightPar: 0.6, title: "Sat"),
                                .init(value: "7", heightPar: 0.4, title: "Sun")
                                ])
        
        monthlyPerformanceView.configure(with: [
            .init(value: 45, title: "Mar"),
            .init(value: 55, title: "Apr"),
            .init(value: 60, title: "May"),
            .init(value: 65, title: "Jun"),
            .init(value: 70, title: "Jul"),
            .init(value: 80, title: "Aug"),
            .init(value: 65, title: "Sep"),
            .init(value: 45, title: "Okt"),
            .init(value: 30, title: "Nov"),
            .init(value: 15, title: "Dec")],
            
        topChartOffset: 10)
    }
    
}
