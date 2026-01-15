# Stopwatch Project

이 프로젝트는 Swift와 UIKit을 활용하여 제작된 간단한 스톱워치 애플리케이션입니다. MVVM 아키텍처와 Combine 프레임워크를 리액티브 프로그래밍을 위해 사용했습니다.

## 📁 파일 구조

프로젝트의 주요 파일 구조는 다음과 같습니다:

```
Stopwatch/
├── AppDelegate.swift       # 앱의 생명주기 관리
├── SceneDelegate.swift     # UI의 생명주기 관리 및 초기 화면 설정
├── ViewController.swift    # 메인 뷰 컨트롤러 (UI 구성 및 데이터 바인딩)
├── ViewModel.swift         # 비즈니스 로직 처리 (타이머 로직, 상태 관리)
├── LapCell.swift           # 랩 타임을 표시하기 위한 커스텀 테이블 뷰 셀
├── Assets.xcassets         # 이미지 및 색상 리소스
├── Base.lproj              # 기본 로컬라이제이션 리소스
└── Info.plist              # 앱 설정 파일
```

## 🛠 주요 로직 및 기술 스택

### 1. MVVM 아키텍처 & Combine
- **ViewModel**: `ViewModel.swift`에서 타이머 로직과 상태를 관리합니다.
  - `Input` 열거형을 통해 사용자 액션(시작, 정지, 랩, 리셋)을 정의합니다.
  - `Output` 열거형을 통해 UI 업데이트 이벤트(시간 업데이트, 랩 기록 업데이트)를 방출합니다.
  - `PassthroughSubject`와 `AnyPublisher`를 사용하여 데이터 스트림을 처리합니다.
  - `Timer.publish`를 사용하여 0.01초 단위의 정밀한 타이머를 구현했습니다.

- **ViewController**: `ViewController.swift`는 UI를 담당하며 ViewModel과 바인딩됩니다.
  - `bindViewModel()` 메서드에서 ViewModel의 출력을 구독하여 UI(`timerLabel`, `tableView`)를 업데이트합니다.
  - `bindControls()` 메서드에서 버튼의 탭 이벤트를 ViewModel의 입력으로 전달합니다.

### 2. UI 구성 (Code-based UI)
- **SnapKit**: 오토레이아웃을 코드로 간편하게 제약조건을 설정하기 위해 사용했습니다.
- **Then**: 객체 초기화 시 속성 설정을 간결하게 하기 위해 사용했습니다.
- **UI Components**:
  - `UILabel`: 타이머 시간 표시 (`monospacedDigitSystemFont`를 사용하여 숫자가 흔들리는 현상 방지)
  - `UITableView`: 기록된 랩 타임 목록 표시
  - `UIButton`: 시작/정지 및 랩/리셋 기능을 수행하며 상태에 따라 타이틀과 색상이 변경됩니다.

### 3. 주요 기능
- **타이머 시작/정지**: Start 버튼으로 타이머를 시작하고 Stop 버튼으로 일시 정지합니다.
- **랩 타임 기록**: 타이머가 작동 중일 때 Lap 버튼을 눌러 현재 시간을 리스트에 기록합니다.
- **리셋**: 타이머가 정지된 상태에서 Reset 버튼을 눌러 초기화합니다.