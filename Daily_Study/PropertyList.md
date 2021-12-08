# iOS Property List

- 목표: PList를 만들어서 데이터를 입력한다. 이를 번들을 통해 끌고 온다. (Document 폴더로 복사 → 읽기 쓰기가 가능하게)

- 목적: 간단한 데이터베이스처럼 사용할 수 있게 하기 위해서

- 사용법: New File → Resource의 Property List 생성 → 데이터 입력

</br>


### iOS SandBox

![iOSSandBox](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/iosSandBox.png)

- 앱 안에서는 다른 앱을 제어할 수가 없음
- 앱은 세 가지의 Container로 나뉘어져 있음 (Bundle Container / Data Container / iCloud Container)
    - 위 세 가지는 하나의 Sandbox로 묶여 있음
- 아이폰은 앱을 설치하면 설치 경로를 알 수가 없음
- 내 앱이 설치된 경로를 어떻게 알 수가 있나 ? 런타임때 설치 경로를 체크
    - 런타임(runtime)때 앱이 설치되는 경로를 확인해서 이를 이용해 데이터를 끌어와야함

</br>


### Data Container

- Documents : 데이터를 읽고 쓰고 할 수 있음
- 런타임때 알게 되는 경로를 이용해서 plist 복사 → 내용을 바꾸기 위해 Documents에 복사하는 것
    - 앱을 종료 후 다시 실행해도 바뀐 내용을 유지하기 위함
- 앱이 실행될 때마다 복사한다고 가정한다면 어떤 문제가 생기나?
    - 복사한 것이 많아짐, 계속해서 데이터가 처음으로 돌아감
- 패키지 안의 내용을 수정할 수 없기 때문에 documents 폴더로 복사하고 데이터를 읽어올때 documents에 있는 것을 읽어와야함 → 수정 된 내용을 그대로 반영할 수 있음
- 앱을 시작할때 복사 (최초의 한 번만 복사 : Documents 안에 plist 파일이 있는지를 확인후 없을때만 복사하도록 코드 짜기)
- 소스의 경로(sourcePath)와 복사되는 경로(targetPath)를 알아야 함
- 소스의 경로는 bundle, 복사할 경로는 Documents
    - documents 폴더들 중에 사용자가 사용할 수 있는 것이 정해져 있음
    - `NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)`
        - documentDirectory를 가져오겠다.
        - userDomainMask: 사용자가 사용할 수 있는 것을

</br>


### Property List 실습
[실습코드](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/tree/master/Example/PListTest)

> 1. 번들이 설치되어 있는 경로 획득하기

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let path = Bundle.main.path(forResource: "cat", ofType: "plist") {
    print(path!)
    }
}
```

- 데이터를 가져오기 위해서 번들이 설치되어 있는 폴더를 읽어와야 함
- 옵셔널이기 때문에 언래핑을 해줘야함. 여기서는 force 언래핑을 해줌
- 시뮬레이터 경로 + /data/Containers/Bundle/Application/<설치경로>/PListTest.app/cat.plist /Users/khyeji/Library/Developer/CoreSimulator/Devices/3351B7E0-DBAF-4ACD-B240-E43B411CCF7E/data/Containers/Bundle/Application/1A9817CE-9CEE-4865-B982-ED363EE5B803/PListTest.app/cat.plist
- 런타임해서 경로를 획득 → 이를 읽어와야 함

</br>

> 2. NSArray 타입의 변수 지정

```swift
import UIKit

class ViewController: UIViewController {
    var cat:NSArray?
}
```

- NSArray: Foundation에서 지원해주는 Collection 라이브러리
- array는 swift에서 기본적으로 제공하는 것임 근데 이를 통해 plist 데이터를 읽어오는 것은 어려움 -> (Structure) 이는 데이터가 복사되서 전달되기 때문에
- 따라서 NSArray를 사용.
    - 이는 Class, 데이터가 참조값
    - 수정 불가능. 패키지의 내용을 읽어오기만 함
- NSMutableArray
    - NSArray와 비슷. 수정 가능

</br>

> 3. 획득한 경로를 이용해서 데이터 복사

```swift
import UIKit

class ViewController: UIViewController {
    var cat:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "cat", ofType: "plist") {
            if let cat = NSArray(contentsOfFile: path) {
                if let member = cat[0] as? [String:String] {
                    print(member["stage_name"])
                }
            }
        }
    }
}
```

- .path 는 옵셔널이기 때문에 언래핑을 해줘야함
- cat 에 파일의 경로를 줘서 파일의 데이터를 array로 바꿀 수 있으면 바꿔서 전달해줌
- class 이기 때문에 데이터 주소값을 가지고 있음 -> 데이터를 꺼내려면 한 단계를 더 거쳐야 함
- [String:String] : array를 dictionary 타입으로 변경해줌
- NSArray는 데이터 수정이 불가능함으로 우리가 사용할 수 있는 Documents 경로로 복사해야함

</br>

> 불러온 데이터로 실습

```swift
import UIKit

class CatTestTableViewController: UITableViewController {
    var cat:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let path = Bundle.main.path(forResource: "cat", ofType: "plist") else { return }
        cat = NSArray(contentsOfFile: path)
    }
```

- .path() 가 nil이면 코드 밑으로 실행하나마나 아무 의미가 없는 것임으로 여기선 gaurd let 을 쓰는 것이 유리
- `NSArray(contentsOfFile: path)`  plist 파일을 이용할 것이기에 contentsOfFile을 사용 → 경로를 이용해 불러온 데이터를 cat에 전달

```swift
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cat = self.cat {
            return cat.count
        } else {
            return 0
        }
    }
```

- `if let cat = self.cat`
    - scope가 달라!
    - <지역변수> = self.<전역변수>
    - 명확하게 구분해주기 위해서 self 사용
- 값이 nil일때도 반환값이 필요하기 때문에 반환값으로 (int) 0 을 줌

```swift
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let cat = self.cat,
              let member = cat[indexPath.row] as? [String:String]
        else { return cell }
        
        if let imageView = cell.viewWithTag(1) as? UIImageView {
            if let imageName = member["image"] {
                let image = UIImage(named: imageName)
                imageView.image = image
            }
            
            if let lblStage = cell.viewWithTag(2) as? UILabel {
                lblStage.text = member["stage_name"]
            }
            
            if let lblName = cell.viewWithTag(3) as? UILabel {
                lblName.text = member["name"]
            }
        }

        return cell
    }
}
```

- imageView는 없어도 아래 코드의 label은 있을 수도 있으니까 if let으로 언래핑
- `member["image"]` → 딕셔너리에서 꺼내면 무조건 옵셔널임
- `imageView.image = image` → 같은 옵셔널 이미지이기 때문에 언래핑을 하지 않음 -> 이의 언래핑은 UIImage 내에서 이루어짐
- 이 코드는 항상 쓰는 코드이기때문에 익숙해져야 함!
    
    ```swift
    // 이렇게도 사용할 수 있음
    if let imageView = cell.viewWithTag(1) as? UIImageView, let imageName = member["image"] {
        let image = UIImage(named: imageName)
        imageView.image = image
    }
    ```
    
</br>

### plist 를 우리가 사용할 수 있는 곳으로 가져오기

- 멤버 관리 앱 만들기

1. plist 파일을 doc에 복사
2. doc에 있는 plist 파일 읽기
3. 데이터 추가 및 이동

- Bar Button Item 을 Navigation 에 추가

</br>

>CATTableViewController.swift

```swift
func getFileName(_ fileName: String) -> String {
    let docDirs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		let docPath = docDirs[0]
		let fullPath = docPath+"/"+fileName
    return fullPath
}
```

- 위에처럼 써도 되고 아래를 추천

```swift
func getFileName(_ fileName: String) -> String {
    let docDirs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let docPath = docDirs[0] as NSString 
    let fullPath = docPath.appendingPathComponent(fileName)
    return fullPath
}
```

- plist 파일을 doc에 복사한 경로를 함수로 만들어 줌 → doc에 있는 파일을 가져올 경로를 만들기 위해
- `getFileName(_ fileName: String)` 메소드 명에 FileName이 있기 때문에 중복을 피하기 위해서 외부매개변수를 _로 지정
- docDirs의 type은 array
- `let docPath = docDirs[0] as NSString`
    - class
    - 형변환인데 as? 안 쓴 이유?
        - String -> NSString 으로는 100프로 성공하기 때문에 옵셔널이 아님 (묵시적으로 변환이 가능)
- 위 코드는 잘 안 쓰이기 때문에 필요할때 복붙하면 됨

```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let targetPath = getFileName("cat.plist")
    print(targetPath)
```

- targetPath 지정 후 런타임을 통해 경로 확인
- /Users/khyeji/Library/Developer/CoreSimulator/Devices/3351B7E0-DBAF-4ACD-B240-E43B411CCF7E/**data/Containers/Data/Application/1671D6C9-2EF1-421C-909B-CECE2A9ABC23/Documents/cat.plist**

```swift
import UIKit

class CATTableViewController: UITableViewController {
    var cat:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targetPath = getFileName("cat.plist")
        guard let sourcePath = Bundle.main.path(forResource: "cat", ofType: "plist") else { return }

        let FileManager = FileManager.default
        if !FileManager.fileExists(atPath: targetPath) {
            do {
                try FileManager.copyItem(atPath: sourcePath, toPath: targetPath)
            } catch {
                print("복사 실패")
            }
        }
        cat = NSMutableArray(contentsOfFile: targetPath)
    }
```

- 내용을 수정할 수 있어야하기 때문에 NSMutableArray 사용
- `targetPath` doc에 복사된 plist 파일의 경로
- `sourcePath` Bundle에 있는 것을 Doc에 복사하기 위해 plist 파일의 경로를 가져옴
- 복사하기 전에 이 경로에 파일이 있는지 없는지 확인부터 해야함 → FileManager
- `FileManager` 싱글톤(singleton)객체 : 앱에서 하나만 만들어지는 객체. 파일명이 비슷한 인스턴스가 있으면 그 파일에 넘겨주고, 없으면 새로 만듦?
    - 한 파일에 동시에 접근을 하면 문제가 생기기 때문에 싱글톤임
    - FileManager한테 복사를 시키고, 파일이 존재하는지도 물어볼거임 !!
    - `fileExists` 반환값이 bool 이고 파일이 있으면 true 없으면 false 이지만, 우리는 파일이 없을때 true를 줘야하기 때문에 FileManager 앞에 !를 붙여줌. doc 폴더에 파일이 없을때만 복사해줘라!
    - `throws` 예외를 던져! 폴더에 파일을 위한 공간이 없을수도 있고 파일이 존재하지 않을 수도 있는 등등의 이유로 우리에게 예외를 만들도록 함
        - 왜 우리한테 던져? FileManager는 상황을 모르기 때문에 어떤 이유로 복사가 안 되는지에 대한 상황을 우리가 해줘야함
        - do-catch 구문 사용
        - `do` 파일 복사
        - `catch`  예외가 발생했을때 처리
            - 실제는 알럿을 띄어서 '다시 시도하겠습니까' 와 같은 문구를 보여줌
            - 복사가 성공하면 doc 폴더에 cat.plist 파일이 있어야 함
- .plist 파일을 수정했을때 시뮬레이션에서 앱을 삭제한 후에 다시 실행을 해야 변경된 내용이 적용됨 !!
- 동기 : 코드가 순차적으로 실행되는 것. 위의 코드가 모두 실행되어야 다음 코드가 실행됨
- `cat` 복사한 파일 읽음

```swift
// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cat = self.cat {
            return cat.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let cat = self.cat,
              let member = cat[indexPath.row] as? [String:String] else { return cell }
        
        cell.textLabel?.text = member["stage_name"]
        
        return cell
    }
```

### Row 편집

```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    self.navigationItem.leftBarButtonItem = editButtonItem
```

- Edit 추가

```swift
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // row 제거
            cat?.removeObject(at: indexPath.row)
            // 수정된 상태 저장
            cat?.write(toFile: getFileName("cat.plist"), atomically: true)
            // cat? 옵셔널 체이닝 - nil이 아닐 경우에만 사용
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 임시 보관
        guard let cat = self.cat else { return }
        let temp = cat[fromIndexPath.row]
        cat.removeObject(at: fromIndexPath.row)
        
        // 삭제 후 이동
        cat.insert(temp, at: to.row)
        
        // 수정된 상태 저장
        cat.write(toFile: getFileName("cat.plist"), atomically: true)
        // atomically: 동시접속 안정성 보장
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
```

- 위와 같은 저장은 수정된 부분만 저장하는 것이 아니라 전체를 다시 저장하는 것이기 때문에 많은 데이터에는 적절치 않음

</br>

> AddViewController.swift

```swift
// CATTableViewController.swift

		// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        // AddViewController가 segue의 destination
        guard let destVC = segue.destination as? AddViewController else { return }
        // segue.destination 얘는 UIViewController 속성이기 때문에 AddViewController 속성으로 바꿔줌
        // 스위프트의 array라면 복사가 되지만 NS 는 참조값이 된다 !!
        // 따라서 CATTableViewC 에서 접근하는 것과 AddViewC에서 접근하는 곳이 같음
        destVC.cat = self.cat
    }
}
```

```swift
import UIKit

class AddViewController: UIViewController {
    var cat:NSMutableArray?

		// 입력 필드 아웃렛
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
		// 추가 버튼 액션
    @IBAction func actDone(_ sender: Any) {
        // 추가를 누르면 cat에 추가가 되어야함
        guard let name = txtName.text else { return }
        let newMember = ["stage_name":name] // cat 안의 타입이 딕셔너리이기 때문에
        cat?.add(newMember)
        
        // 수정된 사항 저장
        // 3. 글로벌 getFileName 함수를 따로 파일을 만들어줌
        cat?.write(toFile: getFileName("cat.plist"), atomically: true)
    }
}
```

- 수정된 사항 저장하는 방법
    1. 똑같은 메소드를 만들어주는 방법 
    2. path를 넘겨주는 방법 
    3. 글로벌 getFileName 함수를 따로 파일을 만들어줌 

</br>

> Utils.swift

- 글로벌 getFileName 함수를 따로 파일을 만들어줌

```swift
import Foundation

func getFileName(_ fileName: String) -> String {
    let docDirs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let docPath = docDirs[0] as NSString 
    let fullPath = docPath.appendingPathComponent(fileName)
    return fullPath
}
```


- textField를 이용해 데이터 추가 후 반영

```swift
// CATTableViewController.swift
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
```

- textField에 입력 후 저장 버튼 클릭 → 이전 화면으로 돌아가면 추가된 데이터가 보임
- `viewWillAppear` 화면이 보이기 직전에 테이블뷰를 다시 그림 (추가된 데이터 포함해서)
- viewdidload는 한번만 실행되지만 viewwillappear은 여러번 실행될 수 있음 보일때마다 실행됨 ?
- 쉽게 생각할 수 있는 방법일뿐 이렇게 쓰면 안됨

- 위와 다른 방법

```swift
// CATTableViewController.swift

@IBAction func exitFromAddVC(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
```


```swift
// AddViewController.swift

@IBAction func actBack(_ sender: Any) {
        // 코드로 seque 실행
        performSegue(withIdentifier: "back", sender: self)
    }
```
