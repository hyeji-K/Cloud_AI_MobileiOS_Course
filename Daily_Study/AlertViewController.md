# AlertViewController

- 알림을 보내고 사용자의 선택을 받음

### 1. Alert

![Alert](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/Alert.png)

### 2. ActionSheet

![ActionSheet](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/ActionSheet.png)

</br>


### Alert View 실습

1. Button 생성 후 Action 연결

```swift
@IBAction func actAlert(_ sender: Any) {
    let alert = UIAlertController(title: "Title", message: "message message message", preferredStyle: .alert)
    present(alert, animated: true, completion: nil)
}
```


- UIAlertController를 먼저 만들어준다
- Controller 가 붙어있는 얘들은 present 메소드를 쓰면 됨
- 만든 alert을 띄어줄 코드를 작성한다
    - 만든 alert을 보여달라
    - completion은 메소드 : 보여준 alert을 처리할 함수를 만들면됨. 대개는 쓸일이 잘 없음
        
        ```swift
        func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil)
        ```
        
        - 기본값이 있는 매개변수는 안 써줘도 된다

2. 알림 action 추가

```swift
@IBAction func actAlert(_ sender: Any) {
    let alert = UIAlertController(title: "Title", message: "message message message", preferredStyle: .alert)
    let action1 = UIAlertAction(title: "확인", style: .default, handler: nil)
    alert.addAction(action1)
    present(alert, animated: true, completion: nil)
}
```

- UIAlertController를 먼저 만들어준다
- action을 만들어준다
    - style은 세 가지 타입이 있음 (cancel, default, destructive)
        - cancel은 좀 굵은 글씨
        - default
        - destructive는 빨간 글씨
    - handler : alert의 취소/확인을 클릭했을때 할일을 메소드로 만들면 됨
    - action이 1개 있는 것은 대부분 사용자에게 통지하는 용도
- `addAction` alert에 action을 추가
- `present` 만든 alert을 띄어줄 코드를 작성한다

- 전체 코드

```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func afterPresent() {
        print("after present alert")
    }
    
    func actionHandler(action: UIAlertAction) {
        print("action1 Handler")
    }

    @IBAction func actAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "message message message", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "확인", style: .default, handler: actionHandler)        
        alert.addAction(action1)
        present(alert, animated: true, completion: afterPresent)
    }
}
```

- preferredStyle
    - 뷰 안에서 해결이 될 때는 alert을 사용
        - action을 3개 이상 만들지 않음
    - 삭제의 경우 actionSheet를 사용함
        - action이 많아도 괜찮음
        

</br>

`💡 후행 클로저`
- 익명 메소드

</aside>

- 액션 함수는 한 번만 호출이 되기 때문에 사실상 이름이 필요가 없음
- Handler에서 엔터를 치면 코드가 바뀜 → 함수를 이곳에 만들어주면 위와 같이 사용할 수 있음

```swift
let action4 = UIAlertAction(title: "후행클로져", style: .default) { _ in
    print("action4 Handler")
}
```

alert은 언제 누르는지 모름 → 비동기 방식 (누르면 처리해라!)

누르면 지정해 놓은 코드들이 실행이 되도록