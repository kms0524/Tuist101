//
//  APIService.swift
//  ServiceModule
//
//  Created by 강민성 on 2022/10/12.
//  Copyright © 2022 minseong. All rights reserved.
//

import Foundation
import Moya

public enum APIService {
    case currentWeather(lat: String, lon: String)
    case forecastWeather(lat: String, lon: String)
}



extension APIService: TargetType {

    public var baseURL: URL { URL(string: BaseAPI.baseURL)!}
    
    public var path: String {
        switch self {
        case .currentWeather(_, _) :
            return "weather"
        case .forecastWeather(_, _) :
            return "forecast"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .currentWeather, .forecastWeather :
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case let .currentWeather(lat, lon) :
            return .requestParameters(parameters: ["lat" : lat, "lon" : lon, "appid" : BaseAPI.apiKey, "units" : "metric"], encoding: URLEncoding.queryString)
        case let .forecastWeather(lat, lon):
            return .requestParameters(parameters: ["lat" : lat, "lon" : lon, "appid" : BaseAPI.apiKey, "units" : "metric"], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}
