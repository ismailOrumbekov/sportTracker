//
//  MonthlyPerformanceView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 08.01.2024.
//

import UIKit

import UIKit

final class MonthlyPerformanceView: BaseInfoView{
    private let chatsView = ChartsView()
    
    
    
    func configure(with items: [ChartsView.ChartData], topChartOffset: Int ){
        chatsView.configure(with: items, topChartsOffset: topChartOffset)
    }
}

extension MonthlyPerformanceView{
    override func addViews(){
        super.addViews()
        backgroundColor = .black
        addToContentView(view: chatsView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        chatsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
    override func configure(){
        super.configure()
    }

}


