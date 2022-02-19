# Life Cycle

![LifeCycle1](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/LifeCycle1.png)

### viewDidLoad
- 화면이 처음 만들어질 때 한 번만 실행

### viewWillAppear 
- 뷰가 보여지기 전에 실행 → 보일때마다 실행됨 

### viewDidAppear 
- 보여지고 나서 실행됨

### viewWillDisappear 
- 화면이 사라지는 경우 

### viewDidDisappear 
- 화면이 사라지고 나서 실행 

### viewDidUnload 
- 메모리가 해제가 됐음. 중요한 코드를 넣으면 실행된다는 보장을 받지 못함

### viewDidLoad보다 
- 먼저 해야할 일이 있다면 loadView에 실행하면 됨 → 거의 쓸 일이 없음 

> viewDidLoad, viewWillAppear 를 많이 사용함



# APP Level

### iOS 12 이전

![LifeCycle2](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/LifeCycle2.png)

- 데스크탑은 앱은 하나지만 윈도우는 여러 개를 실행할 수가 있는데

- 모바일에서는 윈도우는 하나만 실행함. → 앱의 라이프사이클과 똑같음

#### Not Running
- 앱이 시작되지 않았거나 실행되었지만 시스템에 의해 종료된 상태

#### Inactive 
- 앱은 실행되고 있지만 사용자의 입력은 받지 않는 상태 (Launch 상태)

#### Active 
- 사용자의 이벤트를 입력받는 상태

#### background 
- 앱이 백그라운드에 있지만 여전히 코드가 실행되고 있는 상태

#### suspended 
- 앱이 메모리에 유지되지만 실행되는 코드가 없는 상태


AppDelegate.swift → app level로 관리 
- `application(_:didFinishLaunchingWithOptions:)`


### iOS 12 이후
- 화면분할(아이패드) → 윈도우가 2개를 띄울 수 있게 됨
- SceneDelegate.swift -> Scene level로 관리