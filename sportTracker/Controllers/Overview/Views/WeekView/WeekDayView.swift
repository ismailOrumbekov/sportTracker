//
//  WeekDayView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 29.12.2023.
//

import UIKit
extension WeekView{
    
    final class WeekDayView: BaseView{
       private let nameLabel = UILabel()
       private let dateLabel = UILabel()
       private let stackView = UIStackView()
        
        func configureData(with index: Int, and name: String){
            let startOfWek = Date().startOfWeek
            let currentDay = startOfWek.goForward(to: index)
            let day = Date.calendar.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? Resourses.Colors.active : Resourses.Colors.background
            
            nameLabel.text = name
            nameLabel.textColor = isToday ? .white : Resourses.Colors.inactive
            
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resourses.Colors.inactive
        }
        
        
        
        
    }
    
}


extension WeekView.WeekDayView{
    override func addViews() {

        super.addViews()
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .brown
        layer.cornerRadius = 5
        
        
        nameLabel.font = Resourses.Fonts.helvelticalRegular(with: 15)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resourses.Fonts.helvelticalRegular(with: 18)
        dateLabel.textAlignment = .center
        
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
