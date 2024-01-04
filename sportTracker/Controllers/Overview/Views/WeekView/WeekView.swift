//
//  WeekView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 29.12.2023.
//

import UIKit

final class WeekView: BaseView{
    private let stackView = UIStackView()
    
    
    
}




extension WeekView{
    override func addViews() {
        super.addViews()
        addSubview(stackView)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    override func configure() {
        super.configure()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekdays = Date.calendar.shortStandaloneWeekdaySymbols
        if Date.calendar.firstWeekday == 2{
            let sun = weekdays.remove(at: 0)
            weekdays.append(sun)
        }
        weekdays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configureData(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}
