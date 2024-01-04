//
//  BaseInfoView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 01.01.2024.
//

import UIKit

 class BaseInfoView: BaseView{
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 15)
        label.textColor = Resourses.Colors.inactive
        return label
    }()
    
    private let button = WAButton()
    private let contentView : UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resourses.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    
    init(with title: String? = nil, buttonTitle: String? = nil){
        titleLabel.text = title == nil ? nil : title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(with: buttonTitle)
        
        button.isHidden = buttonTitle == nil ? true : false
        super.init(frame: .zero)

    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    
    func addButtonTarget(target: Any?, action: Selector){
        button.addTarget(target, action: action, for: .touchUpInside)
    }
     
     func addToContentView(view : UIView){
         contentView.addSubview(view)
     }
}



extension BaseInfoView{
    
    
    override func addViews() {
        super.addViews()
        addSubview(titleLabel)
        addSubview(contentView)
        addSubview(button)
    }
    
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.height.equalTo(30)
        }
        
        contentView.snp.makeConstraints { make in
            if (titleLabel.text != nil){
                make.top.equalTo(titleLabel.snp.bottom).offset(15)
            }else{
                print("nil")
                make.top.equalToSuperview()
            }
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func configure() {
        super.configure()
        
        backgroundColor = .clear
    }
    
    
    
    
}

