//
//  SettingsController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

class SettingsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.settings
    }


}
