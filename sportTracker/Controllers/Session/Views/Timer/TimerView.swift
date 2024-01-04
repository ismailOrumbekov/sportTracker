//
//  TimerView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 04.01.2024.
//

import UIKit

final class TimerView: BaseInfoView{
    private let progressView : ProgressView = {
        let view = ProgressView()
        view.drawProgress(with: 0.8)
        return view
    }()
    private var timer = Timer()
    private var timeProgress : CGFloat = 0
    private var timeDuration = 0.8
    
    func configure(with duration: Double, progress: Double){
        timeDuration = duration
        
        let timeCurrentValue = progress > timeDuration ? duration : progress
    }
}

extension TimerView{
    override func addViews(){
        super.addViews()
        addToContentView(view: progressView)
        
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        
        progressView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(progressView.snp.width)
        }
    }
    override func configure(){
     super.configure()
    }
}
