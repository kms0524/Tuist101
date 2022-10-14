//
//  Dependency+Project.swift
//  Plugin
//
//  Created by 강민성 on 2022/10/14.
//

import ProjectDescription

extension TargetDependency {
    public enum Project {}
}

public extension TargetDependency.Project {
    static let FeatureModule = TargetDependency.project(target: "FeatureModule", path: .relativeToRoot("Projects/FeatureModule"))
    static let ServiceModule = TargetDependency.project(target: "ServiceModule", path: .relativeToRoot("Projects/ServiceModule"))
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
}
