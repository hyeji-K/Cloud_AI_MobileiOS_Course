# Structure (구조체)

- 하나이상의 변수를 묶어 그룹화하는 사용자 정의 자료형
- 다양한 자료형을 하나의 자료형으로 그룹화할 수 있음
- 생성자를 안 만들어줘도 됨. 생성자를 자동으로 만들어줌. 생성자의 매개변수는 Structure에 만들어 놓은 모든 변수를 초기화함.
- 속성과 메소드를 가질 수 있음
- 첫글자는 대문자

<aside>
💡 class와 structure의 차이?

</aside>

- 예

```swift
struct Person {
    var name: String
    var age: Int
    var gender: String
    var height: Double
}

var person = Person(name: "홍길동", age: 15, gender: "남", height: 171.7)

print(person.name)
print(person.age)
print(person.gender)
print(person.height)
```

```swift
struct Person1 {
    var name: String
    var age: Int
    var gender: String
    var height: Double
    
    func info() {
        print("이름: \(name), 나이: \(age), 성별: \(gender), 키: \(height)")
    }
}

var person1 = Person1(name: "홍길동", age: 15, gender: "남", height: 171.7)
person1.info()
```

```swift
var person2 = person1
person2.info() // 이름: 홍길동, 나이: 15, 성별: 남, 키: 171.7
person2.name = "띠용"
person2.info() // 이름: 띠용, 나이: 15, 성별: 남, 키: 171.7
person1.info() // 이름: 홍길동, 나이: 15, 성별: 남, 키: 171.7
```

<aside>
💡 클래스는 주소값(저장공간)이 복사되지만, 구조체는 똑같은 것이 복사됨 (저장공간이 다름)

</aside>

### 클래스와 구조체의 차이점

- 구조체는 상속할 수 없다
- 구조체는 Stack 영역에 생성
- 클래스는 참조 타입(Reference Type) → 주소값이 같음
- 구조체는 값 타입(Value Type) → 값만 복사됨
- Int, Double, Boolean, Array, Dictionary ... 등이 struct (구조체와 같은 특성을 가지고 있음)

### 언제 구조체를 쓰나

- 저장하는 데이터가 개별성을 가지는 경우(Person, Student)
- 멤버변수로 Array와 같이 많은 데이터를 가지지 않는 경우
- 저장된 데이터가 보존되어야 할 경우
- 공유될 필요가 없는 경우
- 빈번히 생성될 경우

<aside>
💡 데이터를 다뤄야 하는 경우 → 구조체 사용
UIKit에서 class를 대부분 사용

</aside>

# Enumeration(열거형)

- 개수가 정해져있다. (경우의 수가 한정적일때)
- 객체를 생성하지 않음.
- 타입이 정해진 후에는 타입이 생략이 가능.
- 경우가 몇가지로 정해져 있는 경우

- 정의

```swift
enum Direction {
    case north
    case south
    case west, east
}

var dir: Direction = .north
print(dir) // north
```

```swift
// 열거형을 사용하는 Switch
var dir: Direction = .east
print(dir)

switch dir {
case .north:
    print("북쪽입니다.")
case .south:
    print("남쪽입니다.")
case .east:
    print("동쪽입니다.")
case .west:
    print("서쪽입니다.")
}

// 동쪽입니다. 
```

- 열거형은 각 항목으로도 값의 역할을 하지만 각 항목별로 원시값을 지정할 수 있다.

```swift
enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
}

print(HTTPCode.OK) // OK
print(HTTPCode.OK.rawValue) // 200

enum Rank: Int {
    case one = 1
    case two, three, four, five
}

print(Rank.four.rawValue) // 4
```

# Extension (확장)

- 클래스나 구조체 확장
- 상속 X
- 1회성으로 확장이 필요할때 사용 → 자주 사용할때는 상속 받아서 사용

- Double은 Structure임.

```swift
extension Double {
    var km: Double {
        get { return self / 1000.0 }
        set(newValue) { newValue * 1000.0 }
    }
    var m: Double { return self }
    var cm: Double { return self * 100.0 }
    var mm: Double { return self * 1000.0 }
    var description: String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)m입니다."
    }
}

2.km
5.5.cm
print(7.0.description)
let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m 입니다.")
```

- mutating → 자신의 값을 바꿀 수 있게 하는 거?

```swift
extension Int {
    mutating func square() {
        self = self * self
    }
}

var value = 3
value.square()
print(value) // 9
```

### Protocol

 

- 규약/약속

```swift
protocol SampleProtocol {
    var name: String { get set }
    var discription: String { get }
}

struct SampleStruct: SampleProtocol {
    var name = "홍길동"
    var discription: String {
        return "Name: \(self.name)"
    }
}
```

- 장점: 자격?
- 프로토콜을 여러 개 받을 수 있음

```swift
struct SampleStruct: SampleProtocol, SampleProtocol2 {
}
```

- 프로토콜에서 메소드를 만들때 코드블록을 정해주지 않음 (?)

```swift
protocol SampleMethodProtocol {
    func execute(cmd: String)
    func showPort(port: Int) -> String
}

struct Process: SampleMethodProtocol {
    func execute(cmd: String) {
        if cmd == "Start" {
            print("실행합니다.")
        }
    }
    func showPort(port: Int) -> String {
        return "Port: \(port)"
    }
}

var process = Process()
print(type(of: process)) // 타입은 Process

var process1: SampleMethodProtocol = Process()
process1.execute(cmd: "Start")
process1.showPort(port: 8)
```

# Optional

<aside>
💡 nil이란 "값이 없다"의 의미

</aside>

- Swift는 안정성(Safety)를 중요하게 생각하는 언어로 기본적으로 Swift에서는 변수나 객체가 nil이 될 수 없다.
- nil이 될 수 있는 변수나 객체는 옵셔널 변수, 옵셔널 객체로 선언시에 타입뒤에 "?"를 넣는다.
- 옵셔널로 감싼(wrapping) 변수끼리의 +, -와 같은 기본 연산은 불가능하므로 옵셔널 변수를 "!"로 언랩핑(unwrapping)하여 일반 변수로 만들어서 사용해야한다.

앱이 팅기는 경우 중 한 가지 → 값이 nil에 접근할때 

```swift
var optInt: Int?
optInt = nil
print(optInt) // nil

var optInt1: Int? = 1
print(optInt1) // Optional(1)

var optStr: String? = "Swift"
print(optStr) // Optional("Swift")

var optArr: [String]?
optArr = ["C", "JAVA", "오브젝티브-C", "SmallTalk"]
print(optArr) // Optional(["C", "JAVA", "오브젝티브-C", "SmallTalk"])

var optDic: [String:Int]?
optDic = ["국어":94, "수학":88, "영어":96]
print(optDic) // Optional(["국어": 94, "영어": 96, "수학": 88])
```

- 옵셔널 형은 연산이 불가. 사용하려면 언래핑 후 사용가능.

```swift
var temp1: Int? = 3
var temp2: Int? = 5
temp1 + temp2 // 연산불가 -> 오류
temp1 + 30 // 연산불가 -> 오류

var optInt2: Int? = 3
print("옵셔널 자체의 값: \(optInt2)") // 옵셔널 자체의 값: Optional(3)
print("!로 강제 언래핑한 값: \(optInt2!)") // !로 강제 언래핑한 값: 3
print(temp1! + temp2!) // 8

var index7 = Int("123")!
print(index7) // 123
```

```swift
var temp4: Int?
print(temp4!)
```

<aside>
💡 값이 nil인 것을 언래핑하면 오류남

</aside>

- 언래핑을 위한 문법을 제공
    - if let

```swift
var temp2: Int? = 123

if temp2 != nil {
    print("변환된 값은 \(temp2!)입니다.")
} else {
    print("값 변환에 실패하였습니다.")
}

// ⭐️
if let val = temp2 {
    print("변환된 값은 \(val)입니다.")
}
```

<aside>
💡 temp2 값이 nil이 아니면 val 에 넣어줘서 결과 출력. 
val은 if 블럭 내부에서만 사용가능
nil이 아닐때만 실행할때 사용한다.

</aside>

- guard let

```swift
var idol: String? = "BTS"

func guardLet() {
    guard let val = idol else { return }
    print("변환된 값은 \(val)입니다.")
}

guardLet() // 변환된 값은 BTS입니다.
```

<aside>
💡 값이 nil이 아니면 val 에 값을 넣어주고 nil이면 return 값을 반환
val은 현재 코드 블럭내에서 사용가능 
nil 또는 nil이 아닐 경우에 사용한다.

</aside>

- Optional형 자동 해제

```swift
let optInt3: Int? = 123
if(optInt3 != nil) {
    if(optInt3 == 123) {
        print("optInt3 == 123")
    } else {
        print("optInt3 != 123")
    }
}

let tempInt: Int? = 123
tempInt! == 123 // true
tempInt == 123 // true
tempInt! == Optional(123) // true
tempInt == Optional(123) // true
```