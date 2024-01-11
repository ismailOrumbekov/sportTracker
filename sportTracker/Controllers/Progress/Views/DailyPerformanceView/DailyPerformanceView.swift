//
//  DailyPerformanceView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 08.01.2024.
//

import UIKit

final class DailyPerformanceView: BaseInfoView{
    private let barsView = BarsView()
    
    
    
    func configure(with items: [BarsView.BarData]){
        barsView.configure(with: items)
    }
}

extension DailyPerformanceView{
    override func addViews(){
        super.addViews()
        
        addToContentView(view: barsView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        barsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    override func configure(){
        super.configure()
    }

}

