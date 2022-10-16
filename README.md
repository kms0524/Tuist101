[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)
#### <b>❗️이 프로젝트는 [MoyaReactorKit](https://github.com/kms0524/MoyaReactorkit101)를 기반으로 작성된 프로젝트이며, Tuist의 버전은 3.12.0 버전에서만 실행됩니다! 반드시 프로젝트 실행시 Tuist의 버전을 3.12.0 버전으로 설정 후, generate 하시기 바랍니다! Tuist 버전 설정 방법은 [이곳](https://docs.tuist.io/guides/version-management)에서 확인하실 수 있습니다.</b>

# Why Tuist?

<img src="https://user-images.githubusercontent.com/48994081/195552718-bc5e486d-27ac-4ff3-87b8-19a057b209ba.png" width="50%" height="50%"/>

###### <i> ~~와정말컨플릭해결하기쉬울거같아요~~ </i>


프로젝트를 협업하다보면, 필연적으로 merge conflict가 일어나게 된다. 특히, iOS 프로젝트르 진행하게되면 가장 많이 conflict가 발생되는곳이 .pbxproj 파일에서 일어난다.

소규모 프로젝트에서의 conflict 해결이야 가능하다고 하다 치자. 대규모 프로젝트라면 가능할 것 같은가?
장담하건데, 하루종이 컨플릭 해결에 모든 시간을 투자해야 할 것이다.

이런 고통의 시간을 줄이기 위해 [SwiftGen](https://github.com/SwiftGen/SwiftGen)과 같이 xcodeproj, xcworkspace 파일을 관리해주는 라이브러리들이 이미 존재했다.
그런데, SwiftGen은 관리방식이 yml, json 형태로 관리를 해줘야하는데, Tuist는 Swift 언어를 사용하기때문에 좀 더 Swift 친화적인 라이브러리이다.

Tuist는 또한 프로젝트를 모듈화 하여 대규모 프로젝트에서의 빌드시간을 비약적으로 줄여준다. 물론, Tuist를 쓰지않고 Framework를 추가하는 방식으로 모듈화를 진행할 수 있지만, .pbxproj 파일이 늘어나기 때문에 고통의 시간이 배로 올라가는걸 체감하게될것이다.

# How to start

## 설치

Tuist 설치 방법은 아래 커맨드를 터미널에 입력하면 설치가 된다.

```shell
curl -Ls https://install.tuist.io | bash
```
## Initialization

터미널에 위 커맨드를 입력하여 설치가 완료된후 프로젝트를 만들 경로로 이동한다.
이후, 아래 커맨드를 입력하여 Tuist 프로젝트를 생성한다

```bash
tuist init --platform ios
```
만약, SwiftUI가 적용된 프로젝트를 생성하고 싶다면

```bash
tuist init --platform ios --template swiftui
```

위 커맨드를 입력하면 된다. 이 프로젝트는 UIKit를 사용하여 만든 프로젝트 이기에 SwiftUI가 적용된 프로젝트를 생성하지 않았다.
프로젝트가 생성된 후 폴더를 학인하면 Project.swift 파일과 Targets, Tuist, Plugins 폴더가 생성된걸 확인할 수 있다.

## Edit

설치된 경로에 
```shell
tuist edit
```
위 명령어를 입력하면 프로젝트 Manifest를 설정할 수 있다.
모든 수정을 마치면 터미널에서 ctrl+c 를 누르면 편집을 종료하고 적용시킬 수 있다.


## Generate

```shell
tuist generate
```

위 명령어를 입력하면 Project.swift 파일에 작성된 내용을 바탕으로 실제 프로젝트가 생성되며 xcode가 실행된다.


# Project.swift

실제 프로젝트를 생성시의 Manifest로, 아래와 같은 initializer가 있다.

```swift
let project = Project(
    name: <String>,
    organizationName: <String?>,
    options: <Project.Options>,
    packages: <[Package]>,
    settings: <Settings?>,
    targets: <[Target]>,
    schemes: <[Scheme]>,
    fileHeaderTemplate: <FileHeaderTemplate?>,
    additionalFiles: <[FileElement]>,
    resourceSynthesizers: <[ResourceSynthesizer]>
)
```

- name: 프로젝트의 이름
- organizationName: organization의 이름
- options: xcodeproj 파일 생성시의 옵션을 설정할 수 있다. 자동으로 scheme을 생성해주거나, 개발환경 국가, xcodeproj의 이름 설정 등을 변경할 수 있다.
- packages: SPM의 packages
- settings: 프로젝트의 Build Settings을 설정할 수 있다.
- targets: 프로젝트의 Targets을 뜻하는 것으로, 아래에서 같이 설명하겠다.
- scheme: build, test, run, archive, profile, analyize scheme을 정의할 수 있다.
- fileHeaderTemplate: 파일을 생성할때 적혀있는 헤더를 수정할 수 있다.
- additionalFiles: Xcode에서 연결되지 않는 파일들을 연결시켜줄 수 있다.
- resourceSynthesizers: Xcode에서 지원하는 Asset 파일이 아닌 다른 파일들(ex. json파일)이 /resource 경로에 들어가있을때 자동생성시 방식을 설정 할 수 있다.

# Config.swift

Tuist를 실행할때 모든 프로젝트에 설정을 공유하는 Manifest로, 아래와 같은 initializer가 있다.

```swift
let config = Config(
    compatibleXcodeVersions: CompatibleXcodeVersions,
    cloud: Cloud?,
    cache: Cache?,
    swiftVersion: Version?,
    plugins: [PluginLocation],
    generationOptions: Config.GenerationOptions
)
```

- compatibleXcodeVersions: 특정 Xcode 버전을 적용할 수 있다.
- cloud: 클라우드 캐싱을 위한 클라우드 연결 설정을 할 수 있다.
- cache: 로컬 캐싱을 위한 캐시 설정을 할 수 있다.
- swiftVersion: Swift 언어 버전을 적용할 수 있다.
- plugins: Tuist를 확장시킬 수 있는 플러그인들을 적용한다.
- generationOptions: 프로젝트의 세대(generation)를 정의 할 수 있다.

# Target.swift

프로젝트의 타겟으로, 각 프로젝트의 사용할 모듈을 정의 할 수 있으며 아래와 같은 initializer가 있다.

```swift
let target = Target(name: String,
                    platform: Platform,
                    product: Product,
                    productName: String?,
                    bundleId: String,
                    deploymentTarget: DeploymentTarget?,
                    infoPlist: InfoPlist?,
                    sources: SourceFilesList?,
                    resources: ResourceFileElements?,
                    copyFiles: [CopyFilesAction]?,
                    headers: Headers?,
                    entitlements: Path?,
                    scripts: [TargetScript],
                    dependencies: [TargetDependency],
                    settings: Settings?,
                    coreDataModels: [CoreDataModel],
                    environment: [String : String],
                    launchArguments: [LaunchArgument],
                    additionalFiles: [FileElement]
)
```
- name: 타겟의 이름을 설정할 수 있다.
- platform: iOS, macOS, watchOS, tvOS 등을 설정할 수 있다.
- product: 해당 프로젝트를 app, Framework, staticFramework 등으로 설정할 수 있다.
- productName: product의 이름을 설정할 수 있다.
- bundleId: Bundle Identifier를 지정할 수 있다.
- deploymentTarget: 배포타겟을 설정할 수 있다. iOS, macOS, watchOS, tvOS 등이 있으며, iOS의 경우는 iPhone, iPad, Mac 등을 추가로 설정해야한다.
- infoPlist: info.plist를 정의한다.
- sources: 실제 작성하는 코드가 적혀있는 경로를 정의한다.
- resources: 코드가 아닌 프로젝트에 필요한 여러 리소스들의 경로를 정의한다.
- copyFiles: Build Phase 파일 복사에 대한 정의를 할 수 있다.
- headers: 타겟에 대한 헤더를 정의할 수 있다.
- entitlements: 타겟의 자격증명 파일의 경로를 설정할 수 있다.
- scripts: Build Phase에 적용할 스크립트데 대한 정의할 수 있다.
- dependencies: 타겟의 의존성을 정의할 수 있다.
- settings: Build Settings 혹은 .xcconfig 를 이용할 수 있다.
- coreDataModels: CoreData의 경로를 설정할 수 있다.
- environment:  














