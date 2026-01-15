# GoodAsOldPhones Project
이 프로젝트는 Swift와 UIKit을 활용하여 제작된 빈티지 전화기 쇼핑몰 애플리케이션 예제입니다. MVC 아키텍처를 기반으로 하며 Storyboard 없이 코드로만 UI를 구성했습니다.

## 📁 파일 구조
프로젝트의 주요 파일 구조는 다음과 같습니다:

GoodAsOldPhones/
├── AppDelegate.swift                # 앱의 생명주기 관리
├── SceneDelegate.swift              # UI의 생명주기 관리 및 초기 화면 설정
├── MainTabBarViewController.swift   # 탭 바 기반 네비게이션 관리
├── ProductsViewController.swift     # 상품 목록 화면 (TableView 구성 및 데이터 관리)
├── ProductDetailsViewController.swift # 상품 상세 화면 (데이터 바인딩)
├── UsViewController.swift           # 회사 소개 화면 (ScrollView 구성)
├── ProductCell.swift                # 상품 목록 표시를 위한 커스텀 테이블 뷰 셀
├── Product.swift                    # 상품 데이터 모델
├── Assets.xcassets                  # 이미지 리소스
└── Info.plist                       # 앱 설정 파일

## 🛠 주요 로직 및 기술 스택
### 1. MVC 아키텍처 (Model-View-Controller)
*   **Model**: `Product.swift` 구조체를 통해 상품 이미지와 타이틀 데이터를 정의합니다.
*   **View**: `ProductCell` 등 커스텀 뷰를 통해 데이터를 시각적으로 표현합니다.
*   **Controller**: `ProductsViewController` 등이 모델 데이터를 관리하고 뷰 갱신 및 화면 이동 로직을 처리합니다.

### 2. UI 구성 (Code-based UI)
*   **Auto Layout**: Storyboard를 사용하지 않고 `NSLayoutConstraint`를 사용하여 코드로 제약 조건을 설정했습니다.
*   **UITableView**: `ProductsViewController`에서 `UITableViewDataSource`, `UITableViewDelegate`를 구현하여 상품 목록을 표시합니다.
*   **UIScrollView**: `UsViewController`에서 콘텐츠 양에 따라 유동적으로 스크롤되도록 `UIScrollView`와 `ContentView` 패턴을 적용했습니다.

### 3. 주요 기능
*   **상품 목록 조회**: 저장된 `Product` 배열 데이터를 기반으로 리스트를 보여줍니다.
*   **상세 화면 이동**: 리스트 아이템 선택 시 `ProductDetailsViewController`를 초기화하며 데이터를 주입(Dependency Injection)하고 화면을 전환합니다.
*   **정보 페이지**: 스크롤 뷰를 통해 긴 텍스트와 여러 이미지가 포함된 회사 소개 페이지를 제공합니다.
