//
//  MainReactor.swift
//  FeatureModule
//
//  Created by 강민성 on 2022/10/12.
//  Copyright © 2022 minseong. All rights reserved.
//

import Foundation
import Moya
import ReactorKit

import ServiceModule

public class MainReactor: Reactor {
    
    var disposeBag = DisposeBag()
    
    public enum Action {
        case tappedCurrentWeather
        case tappedForecastedWeather
    }
    
    public enum Mutation {
        case checkCurrentWeather(CurrentWeatherModel)
        case checkForecastedWeather(WetherForecastModel)
    }
    
    public struct State {
        var isShowingForeacted: Bool = true
        var temp, tempMin, tempMax: Double
        var dt: String
    }
    
    public let initialState: State
    
    init() {
        self.initialState = State(temp: 0.0, tempMin: 0.0, tempMax: 0.0, dt: "")
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        
        switch action {
        case .tappedCurrentWeather:
            let response = Observable<Mutation>.create { observer in
                let provider = MoyaProvider<APIService>()
                provider.request(.currentWeather(lat: "37.27", lon: "127.11")) { result in
                    switch result {
                        
                    case let .success(response):
                        let result = try! response.map(CurrentWeatherModel.self)
                        observer.onNext(Mutation.checkCurrentWeather(result))
//                            result ?? CurrentWeatherModel(main: Main(temp: 0.0, tempMin: 0.0, tempMax: 0.0))))
                        observer.onCompleted()
                    case let .failure(error):
                        observer.onError(error)
                        
                    }
                }
                return Disposables.create()
            }
            return response
            
        case .tappedForecastedWeather:
            let response = Observable<Mutation>.create { observer in
                let provider = MoyaProvider<APIService>()
                provider.request(.forecastWeather(lat: "37.27", lon: "127.11")) { result in
                    switch result {
                        
                    case let .success(response):
                        let result = try! response.map(WetherForecastModel.self)
                        observer.onNext(Mutation.checkForecastedWeather(result))
//                        observer.onNext(Mutation.checkForecastedWeather(result ?? WetherForecastModel(list: [])))
                    case let .failure(error):
                        observer.onError(error)
                        
                    }
                }
                return Disposables.create()
            }
            return response
        }
                
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        
        var newState = state
        
        switch mutation {
        case .checkCurrentWeather(let currentWeatherModel):
            newState.temp = currentWeatherModel.main.temp
            newState.tempMin = currentWeatherModel.main.tempMin
            newState.tempMax = currentWeatherModel.main.tempMax
            newState.isShowingForeacted = true
        case .checkForecastedWeather(let wetherForecastModel):
            newState.temp = wetherForecastModel.list[0].main.temp
            newState.tempMin = wetherForecastModel.list[0].main.tempMin
            newState.tempMax = wetherForecastModel.list[0].main.tempMax
            newState.dt = wetherForecastModel.list[0].dtTxt
            newState.isShowingForeacted = false
        }
        
        return newState
    }
    
}
