//
//  CommonModel.swift
//  ServiceModule
//
//  Created by 강민성 on 2022/10/12.
//  Copyright © 2022 minseong. All rights reserved.
//

import Foundation

public struct Main: Codable {
    public let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
