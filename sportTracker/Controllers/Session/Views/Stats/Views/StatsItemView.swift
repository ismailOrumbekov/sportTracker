//
//  StatsItemView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 06.01.2024.
//

import UIKit

enum StatsItem{
    case averagePace(value: String)
    case heartRate(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData {
        switch self{
        case .averagePace(let value):
            return .init(image: Resourses.Images.Session.stats_averagePace, value: "\(value) / km", title: Resourses.Strings.Session.averagePace)
        case .heartRate(let value):
            return .init(image: Resourses.Images.Session.stats_heartRate, value: "\(value) bpm", title: Resourses.Strings.Session.averagePace)
        case .totalDistance(let value):
            return .init(image: Resourses.Images.Session.stats_totalDistance, value: "\(value) km", title: Resourses.Strings.Session.averagePace)
        case .totalSteps(let value):
            return .init(image: Resourses.Images.Session.stats_totalSteps, value: "\(value)", title: Resourses.Strings.Session.averagePace)

        }
    }
}


final class StatsItemView: BaseView {
    
    struct ItemData{
        let image: UIImage?
        let value: String
        let title: String
    }
    
    
    
    private let imageView = UIImageView()
    private let valueLabel : UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 15)
        label.textColor = Resourses.Colors.titleGray
        
        return label
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 14)
        label.textColor = Resourses.Colors.inactive
        
        return label
    }()
    
    private let stackView : UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    
    func configure(item: StatsItem){
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title
    }
}

extension StatsItemView{
    override func addViews(){
        super.addViews()
        addSubview(imageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
        
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(23)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    override func configure(){
        super.configure()
    }
}
