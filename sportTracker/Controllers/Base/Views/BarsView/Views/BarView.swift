//
//  BarView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 06.01.2024.
//

import UIKit



extension BarsView{
    struct BarData{
        let value: String
        let heightPar: Double
        let title: String
    }
}


final class BarView: BaseView{
    
    private let heightPar : Double
    
    private let valueLabel : UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 13)
        label.textColor = Resourses.Colors.active
        
        
        return label
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 10)
        label.textColor = Resourses.Colors.inactive
        
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = Resourses.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    init(data: BarsView.BarData){
        heightPar = data.heightPar
        super.init(frame: .zero)
        valueLabel.text = data.value
        titleLabel.text = data.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BarView{
    override func addViews(){
        super.addViews()
        addSubview(valueLabel)
        addSubview(barView)
        addSubview(titleLabel)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        
        valueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(10)
        }
        barView.snp.makeConstraints { make in
            make.top.equalTo(valueLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(17)
            make.height.equalToSuperview().multipliedBy(heightPar * 0.8)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(barView.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    override func configure(){
        super.configure()
    }

}
