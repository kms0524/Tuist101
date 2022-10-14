//
//  Dependency+SPM.swift
//  Plugin
//
//  Created by 강민성 on 2022/10/14.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let RxRelay = TargetDependency.external(name: "RxRelay")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let Moya = TargetDependency.external(name: "Moya")
    static let ReactorKit = TargetDependency.external(name: "ReactorKit")
}
