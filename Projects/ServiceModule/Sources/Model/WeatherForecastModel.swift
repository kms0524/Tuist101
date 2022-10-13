//
//  WeatherForecastModel.swift
//  ServiceModule
//
//  Created by 강민성 on 2022/10/12.
//  Copyright © 2022 minseong. All rights reserved.
//

import Foundation

public struct WetherForecastModel: Codable {
    public let list: [List]
}

// MARK: - List
public struct List: Codable {
    public let main: Main
    public let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case main
        case dtTxt = "dt_txt"
    }
}
