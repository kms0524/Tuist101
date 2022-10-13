//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2022/10/10.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ServiceModule",
    product: .staticFramework,
    dependencies: [
        .project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
    ]
)
