//
//  Resourses.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

enum Resourses{
    enum Colors{
        static var active = UIColor(hexString: "#437BFE ")
        static var inactive = UIColor(hexString: "#929DA5")
        static var separator = UIColor(hexString: "#EBECEF")
        static var titleGray = UIColor(hexString: "#545C77")
        static var secondary = UIColor(hexString: "#F0F3FF")
        static var background = UIColor(hexString: "#F8F9F9")
        static var subtitleGray = UIColor(hexString: "#D8D8D8")
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Today"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
        
        enum Overview{
            static var allWorkoutButton = "All workouts"
        }
        
        enum Session{
            static var navBarPause = "Pause"
            static var navBarFinish = "Finish"
            static var navBarStart = "Start   "
            static var elepsedTime = "Elepsed time"
            static var remainingTime = "Remaining time"
            
            
        }
    }
    
    enum Fonts {
        static func helvelticalRegular(with size: CGFloat) -> UIFont{
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Images {
        static var overviewIcon = UIImage(systemName: "house")
        static var sessionIcon = UIImage(systemName: "figure")
        static var progressIcon = UIImage(systemName: "line.diagonal.arrow")
        static var settingsIcon = UIImage(systemName: "gear")
    }
}

