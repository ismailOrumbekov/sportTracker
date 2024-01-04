//
//  TabBarController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import Foundation
import UIKit

enum Tabs: Int, CaseIterable{
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController{
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        tabBar.tintColor = Resourses.Colors.active
        tabBar.barTintColor = Resourses.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resourses.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewConroller = OverviewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewConroller)
        let sessionNavigation = NavBarController(rootViewController: sessionController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingNavigation = NavBarController(rootViewController: settingsController)
        
        overviewConroller.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.overview, image: Resourses.Images.overviewIcon, tag: Tabs.overview.rawValue)
        
        sessionController.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.session, image: Resourses.Images.sessionIcon, tag: Tabs.session.rawValue)
        
        progressNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.progress, image: Resourses.Images.progressIcon, tag: Tabs.progress.rawValue)
        
        settingNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.settings, image: Resourses.Images.settingsIcon, tag: Tabs.settings.rawValue)
        
        setViewControllers([overviewNavigation, sessionNavigation, progressNavigation, settingNavigation], animated: false)
    }
    
    
    private func getController(for tab: Tabs) -> BaseController{
        switch tab{
        case .overview: return OverviewController()
        case .progress: return ProgressController()
        case .session: return SessionController()
        case .settings: return SettingsController()
        }
        
    }
}
