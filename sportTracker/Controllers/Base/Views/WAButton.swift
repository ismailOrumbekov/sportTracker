//
//  SecondaryButton.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 25.12.2023.
//

import UIKit
import SnapKit

public enum WAButtonType{
    case primary
    case secondary
}

final class WAButton: UIButton{
    private var type : WAButtonType = .primary
    private let label : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    private let iconView : UIImageView = {
       let iconView = UIImageView()
        iconView.image = UIImage(systemName: "arrowshape.down")?.withRenderingMode(.alwaysTemplate)
        iconView.contentMode = .scaleAspectFill
        return iconView
    }()
    
    
    init(with type: WAButtonType, and title: String ){
        super.init(frame: .zero)
        self.type = type
        label.text = title

        setUpUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setTitle(with title: String?){
        label.text = title
    }
   
}

private extension WAButton{
    func setUpUI(){
        addViews()
        layoutViews()
        configure()
    }
    
    func addViews(){
        addSubview(label)
        addSubview(iconView)
    }
    
    func layoutViews(){
        
        let horizontalOffset : CGFloat = {
            switch type{
            case . primary: return 0;
            case .secondary: return 10;
            }
            
        }()
        
        iconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-horizontalOffset)
            make.height.equalTo(5)
            make.width.equalTo(13)
        }
        
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(horizontalOffset * 2)
            make.trailing.equalTo(iconView.snp.leading).offset(-10)
            make.left.equalToSuperview()
        }
    }
    
    func configure(){
        
        switch type{
        case .primary:
            iconView.tintColor = Resourses.Colors.inactive
            label.textColor = Resourses.Colors.inactive
            label.font = Resourses.Fonts.helvelticalRegular(with: 13)

        case .secondary:
            backgroundColor = Resourses.Colors.secondary
            layer.cornerRadius = 14
            makeSystem(button: self)
            label.textColor = Resourses.Colors.active
            iconView.tintColor = Resourses.Colors.active
            label.font = Resourses.Fonts.helvelticalRegular(with: 15)


        }
    
        
        
        
    }
}
