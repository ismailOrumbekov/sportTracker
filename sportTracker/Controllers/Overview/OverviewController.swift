//
//  OverviewController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit
import SnapKit
class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
    
    private let header = SectionHeaderView()

}



extension OverviewController{

    
    override func addViews() {
        super.addViews()
        view.addSubview(navBar)
        view.addSubview(header)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        navBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.2)
        }
        header.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(32)
        }
       
    }
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        header.configure(with: dateFormatter.string(from: Date()))
        
    }
}


@objc extension OverviewController{
    
    func allWorkoutButtonAction(){
        printContent("pressed")
    }
    
}
