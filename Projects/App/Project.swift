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
    name: "MoyaWithTuist",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.FeatureModule
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
