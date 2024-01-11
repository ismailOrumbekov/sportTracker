//
//  ChartsView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 08.01.2024.
//

import UIKit

extension ChartsView{
    struct ChartData{
        let value: Int
        let title: String
    }
}


final class ChartsView: BaseView{
    
    private let xAxisView = XAxisView()
    private let yAxisView = YAxisView()
    private let chartView = ChartView()
    
    func configure(with data: [ChartsView.ChartData], topChartsOffset: Int = 10){
        
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data, topChartOffset: topChartsOffset)
    }
}


extension ChartsView{
    override func addViews(){
        super.addViews()
        addSubview(yAxisView)
        addSubview(xAxisView)
        addSubview(chartView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        yAxisView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(xAxisView.snp.top).offset(-12)
        }
        
        xAxisView.snp.makeConstraints { make in
            make.leading.equalTo(yAxisView.snp.trailing).offset(8)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(4)
        }
        
        chartView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalTo(xAxisView.snp.top).offset(-17)
            make.trailing.equalToSuperview().offset(-5)
            make.leading.equalTo(yAxisView.snp.trailing).offset(17)
        }
    }
    override func configure(){
        super.configure()
    }

}
