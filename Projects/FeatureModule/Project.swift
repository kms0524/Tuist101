//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2022/10/10.
//

import ProjectDescription
import ProjectDescriptionHelpers

import Plugin

let project = Project.makeModule(
    name: "FeatureModule",
    product: .staticFramework,
    dependencies: [
        .project(target: "ServiceModule", path: .relativeToRoot("Projects/ServiceModule"))
    ],
    resources: ["Resources/**"]
)
