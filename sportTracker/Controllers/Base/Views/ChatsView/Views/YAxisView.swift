//
//  YAxisView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 08.01.2024.
//

import UIKit






final class YAxisView: BaseView{
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [ChartsView.ChartData]){

        stackView.arrangedSubviews.forEach{
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach{
            let label = UILabel()
            label.font = Resourses.Fonts.helvelticalRegular(with: 9)
            label.textColor = Resourses.Colors.inactive
            label.textAlignment = .right
            label.text = "\($0 * 10)"
            
            stackView.addArrangedSubview(label)
        }
    }

    
}

extension YAxisView{
    override func addViews(){
        super.addViews()
        addSubview(stackView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
       
    }
    override func configure(){
        super.configure()
    }

}
