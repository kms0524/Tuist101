[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)
#### <b>❗️이 프로젝트는 [MoyaReactorKit](https://github.com/kms0524/MoyaReactorkit101)를 기반으로 작성된 프로젝트이며, Tuist의 버전은 3.12.0 버전에서만 실행됩니다! 반드시 프로젝트 실행시 Tuist의 버전을 3.12.0 버전으로 설정 후, generate 하시기 바랍니다!. Tuist 버전 설정 방법은 [이곳](https://docs.tuist.io/guides/version-management)에서 확인하실 수 있습니다.</b>

# What is Tuist?

<img src="https://user-images.githubusercontent.com/48994081/195552718-bc5e486d-27ac-4ff3-87b8-19a057b209ba.png" width="50%" height="50%"/>

###### <i> ~~와정말컨플릭해결하기쉬울거같아요~~ </i>


프로젝트를 협업하다보면, 필연적으로 merge conflict가 일어나게 된다. 특히, iOS 프로젝트르 진행하게되면 가장 많이 conflict가 발생되는곳이 .pbxproj 파일에서 일어난다.

소규모 프로젝트에서의 conflict 해결이야 가능하다고 하다 치자. 대규모 프로젝트라면 가능할 것 같은가?
장담하건데, 하루종이 컨플릭 해결에 모든 시간을 투자해야 할 것이다.

이런 고통의 시간을 줄이기 위해 [SwiftGen](https://github.com/SwiftGen/SwiftGen)과 같이 xcodeproj, xcworkspace 파일을 관리해주는 라이브러리들이 이미 존재했다.
그런데, SwiftGen은 관리방식이 yml, json 형태로 관리를 해줘야하는데, Tuist는 Swift 언어를 사용하기때문에 좀 더 Swift 친화적인 라이브러리이다.

Tuist는 또한 프로젝트를 모듈화 하여 대규모 프로젝트에서의 빌드시간을 비약적으로 줄여준다. 물론, Tuist를 쓰지않고 Framework를 추가하는 방식으로 모듈화를 진행할 수 있지만, .pbxproj 파일이 늘어나기 때문에 고통의 시간이 배로 올라가는걸 체감하게될것이다.

