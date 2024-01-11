//
//  TrainingCellView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 11.01.2024.
//

import UIKit

enum CellRoundedType{
    case top, bottom, all, noRounded
}

final class TrainingCellView: UICollectionViewCell{
    
    
    static let id = "TrainingCellView"

    private let checkMarkView = UIImageView(image: Resourses.Images.Overview.checkmark_not_done)
    
    private let rightArrow = UIImageView(image: Resourses.Images.Overview.rightArrow)
    
    private let title: UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 17)
        label.textColor = Resourses.Colors.titleGray
        
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
         label.font = Resourses.Fonts.helvelticalRegular(with: 13)
         label.textColor = Resourses.Colors.inactive
         
         return label
    }()
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setUpConstraint()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType){
        self.title.text = title
        self.subTitle.text = subtitle
        
        checkMarkView.image = isDone ? Resourses.Images.Overview.checkmark_done : Resourses.Images.Overview.checkmark_not_done
        
        switch roundedType{
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .all: self.roundCorners([.allCorners], radius: 5)
        case .noRounded: self.roundCorners([.allCorners], radius: 0)
            
        }
    }
}

extension TrainingCellView{
    func addViews(){
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
        addSubview(checkMarkView)
        addSubview(rightArrow)
        }
    func setUpConstraint(){
        checkMarkView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(28)
            make.width.equalTo(checkMarkView.snp.height)
        }
        
        rightArrow.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(13)
            make.width.equalTo(7)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkMarkView.snp.trailing).offset(15)
            make.trailing.equalTo(rightArrow.snp.leading).offset(-15)
        }
        }
    
    func configureAppearance() {
        backgroundColor = .white
        
    }
  
}
