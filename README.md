# 🍎 Smeme-iOS

![Frame 34339](https://user-images.githubusercontent.com/114599559/212286884-40d1f3cc-24dd-4446-bb57-1d888d62796f.jpg)


<br>

## 🖍 Project
> 일기로 시작하는 외국어 훈련, 외국어 학습 서비스 Smeme

<br>

## 🖍 Smeme iOS Developers

|황찬미|원종화|백준|임주민|
|:------:|:---:|:---:|:-----:|
|![KakaoTalk_Photo_2023-01-04-04-18-16](https://user-images.githubusercontent.com/86944161/210426110-082abcde-f8f2-4d7a-b437-4c6c3fca9792.png)|![KakaoTalk_Photo_2023-01-04-04-19-45](https://user-images.githubusercontent.com/86944161/210426306-3bb00033-54f5-413f-84b9-a5728f274800.png)|![KakaoTalk_Photo_2023-01-04-23-17-04](https://user-images.githubusercontent.com/86944161/210574669-30a1eef6-a318-47f1-97c3-7ee8b693a010.png)|![KakaoTalk_Photo_2023-01-04-04-23-27](https://user-images.githubusercontent.com/86944161/210426983-4c04e865-4c25-41f0-9500-373e2b591c2a.png)|
|불꽃 카리스마 리드|군필 공주님|터키 출신 개발자|미성년자|
| **초기 세팅** <br> - Color, Font Custom <br> - Keyboard 높이에 따른 동적 뷰 메서드 구현 <br><br> **소셜 로그인** <br> - Kakao Social Login API <br><br> **오픈 일기 게시판 뷰** <br> - UICollectionView <br> **오픈 일기 게시판 상세 뷰** <br><br> - 동적 UIScrollView <br> UIEditMenuInteraction | **스크랩 보관함 뷰** <br> - 텍스트 양에 따라 CollectionViewCell 레이아웃 동적으로 구현 <br> - Alert 뷰 구현 <br><br> **마이스밈 뷰(마이페이지)** <br> - 컨테이너 뷰를 활용한 AutoLayout <br><br> **스플래시 뷰** <br> - Lottie 이용 그래픽 뷰 구현 <br><br> **토스트 메세지** <br> - UIView 와 Animation을 활용해 커스텀 후 함수화 | **외국어 일기 작성 뷰** <br> **, 한국어 일기 작성 뷰** <br><br> - 파파고 번역 Open API 연결 <br> - 문자열 정규식을 통한 버튼 활성화 <br> - keyboard 감지 시 bottomView 동적 구현 <br> - Constraint Layout을 적용한 동적 뷰 구현 | **회원가입 뷰** <br> - textField와 button을 포함한 커스텀 뷰 <br> - 스플래시 화면 진입 후, 토큰 활성화 유무에 따른 화면 분기 처리 <br><br> **내 일기 뷰(메인)** <br> - 날짜 표시 뷰 Custom <br> - UICollectionView <br><br> **내 일기 상세 뷰** <br> - ScrollView <br> - Floating Action Button <br> - ScrollView 내 contentView 동적 계산 함수화 <br><br> **디자인 시스템** <br> - RandomSubjectView |

<br>

## ☄️ Trouble Shooting (최종 과제 5번)

https://carnation-hearing-eb3.notion.site/2ec8494a5bf34f71b9f74a994ff17457


## Library

<details>
<summary>사용한 라이브러리 보기</summary>
<div markdown="1">

`KakaoSDK` : 카카오 소셜로그인을 API를 사용할 수 있는 라이브러리   
→ 카카오 소셜로그인을 통해 얻은 토큰으로 유저 구분을 쉽게 하기 위해 사용   
   
`Lottie` : 최소한의 코드로 벡터 기반 애니메이션과 Art를 실시간으로 렌더링하는 라이브러리   
→ Lottie 파일을 프로젝트 내에서 쉽게 사용하기 위해 사용   
   
`snapkit` : autolayout을 코드로 쉽고 편리하게 구현할 수 있도록 도와주는 라이브러리   
→ 작성해야 하는 코드의 길이를 줄이고, 가독성을 높여 주기 위해 사용   
     
`then` : 클로저를 사용하여 직관적이고, 깔끔하게 인스턴스를 생성할 수 있도록 도와주는 라이브러리   
→ 인스턴스 생성 후, 속성 설정을 쉽게 하기 위해 사용   
   
`Moya` : URLSession을 추상화한 Alamofire를 다시 추상화해서, Network Layer를 템플릿화하여 재사용성을 높이고, 개발자는 request와 response에만 신경 쓰도록 도와주는 라이브러리   
→ 모듈화된 통신 코드로, 서버 통신을 깔끔하고 편리하게 하기 위해 사용     
   
`RxSwift` : 관찰 가능한 시퀀스를 사용하여 비동기식 및 이벤트 기반 프로그램을 구성하기 위한 라이브러리   
→ 쉽고 편리하게 비동기 이벤트 처리를 하기 위해 사용   
   
</div>
</details>

## Coding Convention

<details>
<summary>코딩 컨벤션 보기</summary>
<div markdown="1">

- `Default`
    - 기본적으로 Swift Style Guide를 따릅니다.
        - ex) lowCamelCase 따르기   
   
- `Naming`
    - 약어 사용을 지양합니다.
        - ex) MainTableViewCell, SettingCollectionViewCell
    - 기본 함수의 네이밍은 set_의 형태를 작성합니다.
        - ex) setLayout, setData
    - Action 함수의 네이밍은 ‘주어+동사+목적어’ 형태를 사용합니다.
        - ex) backButtonDidTap
   
- `MARK`
    - Snippet을 사용해 공통적인 MARK 주석을 작성하고, MARK 구문 다음 한 줄 띄어쓰기 공백을 추가합니다.
```swift
class ViewController: UIViewController {
    // MARK: - Property
    // MARK: - UI Property
    // MARK: - Life Cycle
    // MARK: - @objc
    // MARK: - Custom Method
}

// MARK: - UITableView Delegate
```
   
- `Extension`
    - 필요할 경우, 코드 하단에 작성합니다.
   
- `ETC`
    - 강제 언래핑을 지양합니다.

</div>
</details>

## Git Flow

<details>
<summary>깃 플로우 보기</summary>
<div markdown="1">

개인 로컬 저장소와 공개된 자신의 원격 저장소(중앙 원격 저장소를 `fork`한 것), 두 개의 저장소로 협업을 진행합니다.   
   
모든 코드 기여자가 중앙 저장소에 푸시하는 것이 아니라, 각자 자신의 원격 저장소에 푸시하고, 이 내용을 중앙 원격 저장소에 Pull Request 합니다.   
   
Pull Request는 `기능`별로 올리며, 나머지 `팀원의 한 명 이상의 승인`과 `코드리뷰`를 해야 머지가 가능합니다.   

</div>
</details>

## Foldering

<details>
<summary>폴더링 보기</summary>
<div markdown="1">

    - 🗂️ Resources

      - Protocol : 중복되는 코드들을 Protocol로 구현 후 관리
    
      - DesignSystem : Button, TextField 등의 UI Component를 관리하는 디자인 시스템
    
      - Extension : 기존의 클래스, 구조체, 열거형 타입에 새로운 기능 추가
    
      - Constant : Asset, Font, ViewController 등을 상수화
    
      - Support : Info.pilst, App Delegate, Scene Delegate와 같은 프로젝트 기본 파일
    
      - Color : 프로젝트에서 사용한 Color Asset
    
      - Font : 프로젝트에서 사용한 폰트 파일
    
      - Asset : 프로젝트에서 사용한 Image Asset
    
      - Storyboard : LaunchScreen
      
    - 🗂️ Sources
    
      - Network
    
          - Base : 네트워크 Base 파일
        
          - API : 네트워크 API 파일
        
          - Service : 네트워크 Service 파일
        
          - DataModel : Request, response 데이터 모델
        
      - Screen
    
          - 기본적으로 MVC 폴더 구조를 사용하지만, 특정 뷰는 MVVM 폴더를 사용합니다.

</div>
</details>
