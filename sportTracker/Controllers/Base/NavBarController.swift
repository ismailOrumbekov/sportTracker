//
//  NavBarController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit

final class NavBarController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resourses.Colors.titleGray,
            .font: Resourses.Fonts.helvelticalRegular(with: 17)
        ]
        
        navigationBar.addBottomBorder(with: Resourses.Colors.separator, height: 1)
    }
}
