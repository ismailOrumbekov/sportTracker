//
//  TimerView.swift
//  sportTracker
//
//  Created by Исмаил Орумбеков on 04.01.2024.
//

import UIKit

enum TimerState{
    case isRuning
    case isPaused
    case isStoped
}

final class TimerView: BaseInfoView{
    
    private let elepseTimeLabel: UILabel = {
       let label = UILabel()
        label.text = Resourses.Strings.Session.elepsedTime
        label.font = Resourses.Fonts.helvelticalRegular(with: 14)
        label.textColor = Resourses.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elepseTimeValueLabel: UILabel = {
       let label = UILabel()
        label.font = Resourses.Fonts.helvelticalRegular(with: 46)
        label.textColor = Resourses.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
       let label = UILabel()
        label.text = Resourses.Strings.Session.remainingTime
        label.font = Resourses.Fonts.helvelticalRegular(with: 13)
        label.textColor = Resourses.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLabel: UILabel = {
       let label = UILabel()

        label.font = Resourses.Fonts.helvelticalRegular(with: 13)
        label.textColor = Resourses.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        
        return stack
        
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    private let bottomSeparatorView : UIView = {
       let view = UIView()
        view.backgroundColor = Resourses.Colors.separator
        return view
    }()
    
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    
    var callBack: (()-> Void)?
    
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timeProgress : CGFloat = 0
    private var timeDuration = 0.0
    
    public var state: TimerState = .isStoped
    
    func configure(with duration: Double, progress: Double){
        timeDuration = duration
        
        let timeCurrentValue = progress > timeDuration ? duration : progress
        
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = timeCurrentValue / goalValueDevider
        let roundedPercent = Int(round(percent * 100))
        completedPercentView.configureValues(with: "COMPLETED", andValue: roundedPercent)
        remainingPercentView.configureValues(with: "REMAINING", andValue: 100 - roundedPercent)

        elepseTimeValueLabel.text = getDisplayedString(from: Int(timeCurrentValue))
        remainingTimeValueLabel.text = getDisplayedString(from: Int(timeDuration) - Int(timeCurrentValue))
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else {return}
            self.timeProgress += 0.01
            if self.timeProgress > self.timeDuration {
                self.timeProgress = self.timeDuration
                timer.invalidate()
                self.callBack?()
            }
            
            self.configure(with: self.timeDuration, progress: self.timeProgress)
        })
    }
    
    func pauseTimer(){
        timer.invalidate()
    }
    
    func stopTimer(){
        guard self.timeProgress > 0 else {return}
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else {return}
            self.timeProgress -= self.timeDuration * 0.02
            if self.timeProgress <= 0 {
                self.timeProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timeDuration, progress: self.timeProgress)
        })

    }
}

extension TimerView{
    override func addViews(){
        super.addViews()
        addToContentView(view: progressView)
        addToContentView(view: timeStackView)
        addToContentView(view: bottomStackView)
        
        [
            elepseTimeLabel,
            elepseTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach {
            timeStackView.addArrangedSubview($0)

        }
        
        bottomStackView.addArrangedSubview(completedPercentView)
        bottomStackView.addArrangedSubview(bottomSeparatorView)
        bottomStackView.addArrangedSubview(remainingPercentView)
    }
    override func setUpConstraint(){
        super.setUpConstraint()
        
        progressView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(progressView.snp.width)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        timeStackView.snp.makeConstraints { make in
            make.center.equalTo(progressView.snp.center)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(175)
            make.bottom.equalToSuperview().offset(-28)
        }
        
        bottomSeparatorView.snp.makeConstraints { make in
            make.width.equalTo(1)
        }
    }
    override func configure(){
     super.configure()
        
    }
}

private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value/60)%60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minuteStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0 ?
            [minuteStr, secondStr].joined(separator: ":") :
            [hoursStr, minuteStr, secondStr].joined(separator: ":")
        
    }
}
