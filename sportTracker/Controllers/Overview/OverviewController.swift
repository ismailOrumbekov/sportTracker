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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.overview
    }


}



extension OverviewController{

    
    override func addViews() {
        super.addViews()
        view.addSubview(navBar)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        navBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.2)
        }
        
       
    }
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true

        
    }
}


@objc extension OverviewController{
    
    func allWorkoutButtonAction(){
        printContent("pressed")
    }
    
}
