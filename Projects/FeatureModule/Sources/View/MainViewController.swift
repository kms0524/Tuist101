//
//  MainViewController.swift
//  FeatureModule
//
//  Created by 강민성 on 2022/10/12.
//  Copyright © 2022 minseong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

public class MainViewController: UIViewController, View {
    
    public var disposeBag = DisposeBag()
    
    public typealias Reactor = MainReactor
    
    var currentWeatherButton: UIButton = {
        var button = UIButton()
        button.setTitle("현재온도", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    var forecastWeatherButton: UIButton = {
        var button = UIButton()
        button.setTitle("예상온도", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    var tempLabel: UILabel = {
        var label = UILabel()
        label.text = "temp"
        label.textColor = .red
        return label
    }()
    
    var tempMinLabel: UILabel = {
        var label = UILabel()
        label.text = "min"
        label.textColor = .red
        return label
    }()
    
    var tempMaxLabel: UILabel = {
        var label = UILabel()
        label.text = "max"
        label.textColor = .red
        return label
    }()
    
    var dtLabel: UILabel = {
        var label = UILabel()
        label.text = "asd"
        label.textColor = .red
        return label
    }()
    

    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        view.addSubview(currentWeatherButton)
        view.addSubview(forecastWeatherButton)
        view.addSubview(tempLabel)
        view.addSubview(tempMinLabel)
        view.addSubview(tempMaxLabel)
        view.addSubview(dtLabel)
        self.reactor = MainReactor()
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        currentWeatherButton.frame = CGRect(x: 60, y: 120, width: 120, height: 120)
        forecastWeatherButton.frame = CGRect(x: 200, y: 120, width: 120, height: 120)
        dtLabel.frame = CGRect(x: 80, y: 400, width: 300, height: 100)
        tempLabel.frame = CGRect(x: 20, y: 450, width: 100, height: 100)
        tempMinLabel.frame = CGRect(x: 130, y: 450, width: 150, height: 100)
        tempMaxLabel.frame = CGRect(x: 260, y: 450, width: 150, height: 100)
    }
    
    public func bind(reactor: MainReactor) {
        bindAction(reactor)
        bindState(reactor)
    }
    
    public func bindAction(_ reactor: MainReactor) {
        
        self.rx.viewWillAppear
            .subscribe(onNext: { _ in
                reactor.action.onNext(.tappedCurrentWeather)
            })
            .disposed(by: disposeBag)
        
        currentWeatherButton.rx.tap
            .subscribe(onNext: {
                reactor.action.onNext(.tappedCurrentWeather)
            })
            .disposed(by: disposeBag)
        
        forecastWeatherButton.rx.tap
            .subscribe(onNext: {
                reactor.action.onNext(.tappedForecastedWeather)
            })
            .disposed(by: disposeBag)
    }
    
    public func bindState(_ reactor: MainReactor) {
        
        reactor.state.map {
            $0.isShowingForeacted
        }
        .bind(to: dtLabel.rx.isHidden)
        .disposed(by: disposeBag)
        
        reactor.state.map  {
            String("\($0.dt) 시의 예상 기온")
        }
        .bind(to: dtLabel.rx.text)
        .disposed(by: disposeBag)
        
        reactor.state.map {
            String("온도 : \($0.temp)")
        }
        .bind(to: tempLabel.rx.text)
        .disposed(by: disposeBag)
        
        reactor.state.map {
            String("최고 온도 : \($0.tempMax)")
        }
        .bind(to: tempMaxLabel.rx.text)
        .disposed(by: disposeBag)
        
        reactor.state.map {
            String("최저 온도 : \($0.tempMin)")
        }
        .bind(to: tempMinLabel.rx.text)
        .disposed(by: disposeBag)
    }
    

}

extension RxSwift.Reactive where Base: UIViewController {
    public var viewWillAppear: Observable<Bool> {
    return methodInvoked(#selector(UIViewController.viewWillAppear))
       .map { $0.first as? Bool ?? false }
  }
}
