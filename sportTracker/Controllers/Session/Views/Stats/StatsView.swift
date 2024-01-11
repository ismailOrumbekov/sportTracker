//
//  StatsView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 06.01.2024.
//

import UIKit

final class StatsView: BaseInfoView {
    private let itemView = StatsItemView()
    private let stackView : UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        view.distribution = .fillEqually
        return view
    }()
   
    
    func configure(with items: [StatsItem]){
        items.forEach{
            let itemView = StatsItemView()
            itemView.configure(item: $0)
            stackView.addArrangedSubview(itemView)
        }
    }
}


extension StatsView{
    override func addViews(){
        super.addViews()
        addToContentView(view: stackView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    override func configure(){
        super.configure()
    }

}
//
//override func addViews() {
//    super.addViews()
//    addToContentView(view: itemView)
//    itemView.configure(item: StatsItemView.StatsItem(image: UIImage(named:"stats_heartRate"), value: "155 bpm", title: Resourses.Strings.Session.heartRate))
//}
//
//override func setUpConstraint() {
//    super.setUpConstraint()
//    itemView.snp.makeConstraints { make in
//        make.top.equalToSuperview().offset(10)
//        make.leading.equalToSuperview().offset(15)
//    }
//}
