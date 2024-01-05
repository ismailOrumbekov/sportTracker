//
//  PercentView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 06.01.2024.
//

import UIKit
extension TimerView{
    
    final class PercentView: BaseView{
        
        private let stackView : UIStackView = {
           let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            
            return view
        }()
        
        private let percentLabel: UILabel = {
           let label = UILabel()
            label.font = Resourses.Fonts.helvelticalRegular(with: 20)
            label.textColor = Resourses.Colors.titleGray
            label.textAlignment = .center
            
            return label
        }()
        
        private let subtitleLabel: UILabel = {
           let label = UILabel()
            label.font = Resourses.Fonts.helvelticalRegular(with: 10)
            label.textColor = Resourses.Colors.inactive
            label.textAlignment = .center
            
            return label
        }()
        
        override func addViews(){
            super.addViews()
            addSubview(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subtitleLabel)
        }
        
        override func setUpConstraint(){
            super.setUpConstraint()
            
            stackView.snp.makeConstraints { make in
                make.top.left.right.bottom.equalToSuperview()
            }
        }
        
        override func configure(){
            super.configure()
        }
        
        func configureValues(with title: String, andValue value: Int){
            subtitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
    }
    
  
    
}
