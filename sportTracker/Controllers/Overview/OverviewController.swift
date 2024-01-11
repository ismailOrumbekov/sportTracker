//
//  OverviewController.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 21.12.2023.
//

import UIKit
import SnapKit

struct Training{
    struct Data{
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    let date: Date
    let dataSource: [Data]
}

class OverviewController: BaseController {
    
    private var dataSource : [Training] = []
    
    private let navBar = OverviewNavBar()
    
    private let header = SectionHeaderView()

    private let cell = TrainingCellView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        

        return view
    }()
}



extension OverviewController{

    
    override func addViews() {
        super.addViews()
        view.addSubview(navBar)
        view.addSubview(collectionView)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        
        navBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.2)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TrainingCellView.self,
                                forCellWithReuseIdentifier: TrainingCellView.id)
        
        collectionView.register(SectionHeaderView.self, 
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.id)
        
        dataSource = [
                    .init(date: Date(),
                          dataSource: [
                            .init(title: "Warm Up Cardio", subtitle: "Stair Climber • 10 minutes", isDone: true),
                            .init(title: "High Intensity Cardio", subtitle: "Treadmill • 50 minutes", isDone: false),
                          ]),
                    .init(date: Date(),
                          dataSource: [
                            .init(title: "Warm Up Cardio", subtitle: "Stair Climber • 10 minutes", isDone: false),
                            .init(title: "Chest Workout", subtitle: "Bench Press • 3 sets • 10 reps", isDone: false),
                            .init(title: "Tricep Workout", subtitle: "Overhead Extension • 5 sets • 8 reps", isDone: false),
                          ]),
                    .init(date: Date(),
                          dataSource: [
                            .init(title: "Cardio Interval Workout", subtitle: "Treadmill • 60 minutes", isDone: false),
                          ])
                ]
        
        collectionView.reloadData()
        
        
    }
}


@objc extension OverviewController{
    
    func allWorkoutButtonAction(){
        printContent("pressed")
    }
    
}


extension OverviewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TrainingCellView.id, for: indexPath)
                as? TrainingCellView else { return UICollectionViewCell() }
        
        
        let item = dataSource[indexPath.section].dataSource[indexPath.row]
        let roundedType: CellRoundedType
        
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].dataSource.count - 1{
            roundedType = .all
        }else if indexPath.row == 0{
            roundedType = .top
        }else if indexPath.row == dataSource[indexPath.section].dataSource.count - 1 {
            roundedType = .bottom
        }else{
            roundedType = .noRounded
        }
        
        cell.configure(with: item.title, subtitle: item.subtitle, isDone: item.isDone, roundedType: roundedType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath)
                as? SectionHeaderView else {return UICollectionReusableView()}
        view.configure(with: dataSource[indexPath.section].date)
        return view
    }
}

extension OverviewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)

    }
}
