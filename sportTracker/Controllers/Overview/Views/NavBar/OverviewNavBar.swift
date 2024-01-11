//
//  OverviewNavBar.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 28.12.2023.
//

import UIKit

final class OverviewNavBar: BaseView{
    
    private let allWorkoutsButton = WAButton(with: .secondary, and: Resourses.Strings.Overview.allWorkoutButton)
    private let addButton = UIButton()
    private let titleLabel = UILabel()
    
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resourses.Colors.separator, height: 1)

    }
    
    
    func addAllWorkoutAction(_ action: Selector, with target: Any?){
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAddingAction(_ action: Selector, with target: Any?){
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }

}

extension OverviewNavBar{
    override func addViews() {
        super.addViews()
        addSubview(allWorkoutsButton)
        addSubview(titleLabel)
        addSubview(addButton)
        addSubview(weekView)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()

        addButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
        
        allWorkoutsButton.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.top)
            make.trailing.equalTo(addButton.snp.leading).offset(-15)
            
            make.height.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(allWorkoutsButton.snp.centerY)
            make.trailing.equalTo(allWorkoutsButton.snp.leading)
            make.leading.equalToSuperview().offset(15)
        }
        
        weekView.snp.makeConstraints { make in
            make.top.equalTo(allWorkoutsButton.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(addButton.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
        
        

    }
    
    
    override func configure() {
        super.configure()
        backgroundColor = .white
       
        titleLabel.text = Resourses.Strings.TabBar.overview
        titleLabel.textColor = Resourses.Colors.titleGray
        titleLabel.font = Resourses.Fonts.helvelticalRegular(with: 20)
        
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.imageView?.contentMode = .scaleAspectFill
        addButton.contentVerticalAlignment = .fill
        addButton.contentHorizontalAlignment = .fill
        
    }
}

@objc extension OverviewNavBar{
    
}
