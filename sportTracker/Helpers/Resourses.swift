//
//  Resourses.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

enum Resourses{
    enum Colors{
        static let active = UIColor(hexString: "#437BFE ")
        static let inactive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#EBECEF")
        static let titleGray = UIColor(hexString: "#545C77")
        static let secondary = UIColor(hexString: "#F0F3FF")
        static let background = UIColor(hexString: "#F8F9F9")
        static let subtitleGray = UIColor(hexString: "#D8D8D8")
    }
    
    enum Strings {
        enum TabBar {
            static let overview = "Today"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
        
        enum Overview{
            static let allWorkoutButton = "All workouts"
        }
        
        enum Session{
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            static let navBarStart = "Start   "
            static let elepsedTime = "Elepsed time"
            static let remainingTime = "Remaining time"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"
            static let stepcCounter = "Steps Counter"
        }
        
        enum Progress{
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
            static let dailyPerfomance = "Daily performance"
            static let last7Days = "Last 7 days"
            static let monthlyPerformance = "Monthly performance"
            static let last10Month = "Last 10 months"
        }
    }
    
    enum Fonts {
        static func helvelticalRegular(with size: CGFloat) -> UIFont{
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Images {
        static let overviewIcon = UIImage(systemName: "house")
        static let sessionIcon = UIImage(systemName: "figure")
        static let progressIcon = UIImage(systemName: "line.diagonal.arrow")
        static let settingsIcon = UIImage(systemName: "gear")
        static let WAButton = UIImage(systemName: "arrowtriangle.down")
        
        enum Session{
            static let stats_averagePace = UIImage(named: "stats_averagePace")
            static let stats_heartRate = UIImage(named: "stats_heartRate")
            static let stats_totalDistance = UIImage(named: "stats_totalDistance")
            static let stats_totalSteps = UIImage(named: "stats_totalSteps")
        }
        
        enum Overview{
            static let rightArrow = UIImage(named: "right_arrow")
            static let checkmark_done = UIImage(named: "checkmark_done")
            static let checkmark_not_done = UIImage(named: "checkmark_not_done")
            
        }
        
    }
}

