//
//  SectionHeaderView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 11.01.2024.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView{
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 13)
        label.textColor = Resourses.Colors.inactive
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String){
        self.title.text = title.uppercased()
    }
}

extension SectionHeaderView{
    func addViews(){
        addSubview(title)
        }
    func setUpConstraint(){
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        }
  
}
