//
//  ProgressController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout progress"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.progress
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }


}
