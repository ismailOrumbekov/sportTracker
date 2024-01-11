//
//  BarsView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 06.01.2024.
//

import UIKit

final class BarsView: BaseView{
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [BarsView.BarData]){
        data.forEach {
            let barView = BarView(data: $0)
            
            stackView.addArrangedSubview(barView)
        }
    }
}


extension BarsView{
    override func addViews(){
        super.addViews()
        addSubview(stackView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        stackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    override func configure(){
        super.configure()
    }

}
