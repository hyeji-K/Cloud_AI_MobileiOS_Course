# 함수
### Function

- 프로그램의 기본적인 구성요소
- 재사용 가능한 코드블록
- 함수 이름의 첫글자는 대체로 소문자로 쓴다.

```swift
// 함수 정의
func sayHello() {
    print("Hello func!")
}

// 함수 호출
sayHello()
```

- 매개변수가 있는 함수

```swift
func sayHello(name: String) {
	print("Hello \(name)")
}

sayHello(name: "뭉치")
```

- 반환값이 있는 함수

```swift
func sayHello2() -> String {
    return "Hello Func"
}

// 리턴값을 받아서 저장할 공간이 필요함
var result = sayHello2()
print(result)
```

`💡 리턴은 항상 함수의 제일 끝에 존재함 → 리턴하면 함수를 빠져나가기 때문에`

`💡 반환값은 한 개만`

</br>

- 매개변수와 반환값이 있는 함수

```swift
func sayHello3(name: String) -> String {
    return "Hello \(name)"
}

var result3 = sayHello3(name: "삐용")
print(result3)
```


`💡 오버로딩? -> class.md`

</br>


- 내부 매개변수 & 외부 매개변수

```swift
func sayHelloWithName2(exName name: String, exAge age: Int) -> String {
    return "\(name) is \(age) years old"
}

var person2 = sayHelloWithName2(exName: "J", exAge: 30)
print(person2)
```

`💡 호출시에는 외부매개변수명을 사용하고 함수 정의시에는 내부매개변수명을 사용함`

`💡 외부 매개변수가 없을때 더 직관적인 경우가 있음 —> ?`

`💡 함수 호출시 매개변수를 생략하고 싶을때는 언더스코어("_")를 사용`

</br>

```swift
func sayHelloWithName3(_ name: String, _ age: Int) -> String {
    return "\(name) is \(age) years old"
}

print(sayHelloWithName3("I", 40))
```

- 매개변수의 기본값

```swift
func sayHello5(name: String = "뭉치") {
    print("Hello \(name)")
}

sayHello5()
sayHello5(name: "삐용")
```

</br>

### 실습: 계산기 함수 만들기

- 두 정수와 연산자(String)를 입력받아서 사칙연산을 수행하는 함수를 만드시오.

```swift
func cal(a: Int, b: Int, c: String) {
    switch c {
    case "+":
        print(a + b)
    case "-":
        print(a - b)
    case "*":
        print(a * b)
    case "/":
        print(a / b)
    default:
        print("계산할 수 없습니다")
    }
}

cal(a: 3, b: 2, c: "-")

func cal2(_ a: Int, _ operate: String, _ b: Int) -> Int {
    var result = 0
    if operate == "+" {
        result = a + b
    } else if operate == "-" {
        result = a - b
    } else if operate == "*" {
        result = a * b
    } else if operate == "/" {
        result = a / b
    } else {
        print("계산할 수 없습니다.")
    }
    return result
}

print(cal2(3, "-", 6))
```

</br>

- 가변인자 매개변수

```swift
func avg(scores: Int...) -> Double {
    var total = 0
    for score in scores {
        total += score
    }
    return (Double(total)/Double(scores.count))
}

print(avg(scores: 10, 20, 30, 40))
```


`👉 (scores: Int...) → Array로 만들어짐`

</br>

- 튜플반환 함수

```swift
func swap(fisrtNumber n1: Int, secondNumber n2: Int) -> (Int, Int) {
    return (n1, n2)
}

let result1 = swap(fisrtNumber: 5, secondNumber: 3)
print(result1)

let (first, second) = swap(fisrtNumber: 4, secondNumber: 4)
print(first)
print(second)
```


`👉 반환값으로 튜플을 사용할 수 있음`

</br>

#### 변수의 범위와 생명주기

```swift
do {
    let ccnt: Int = 0
    do {
        let ccnt = 3
        print(ccnt) // 3
    }
    print(ccnt) // 0
}

var count2 = 3
func fool(count2: Int) -> Int {
    return count2
}

print(fool(count2: 2)) // 2
print(count2) // 3
```


`👉 상위의 변수는 하위에서 사용가능`

`👉 함수의 매개변수는 외부에서 사용불가능`

</br>

#### 변수의 검색순서
블럭 내부에서 정의된 변수를 찾음 → 함수 내부에서 정의된 변수를 찾음 → 함수 외부에서 정의된 변수를 찾음 → 글로벌에서 정의된 변수를 찾음 → import된 라이브러리 범위

</br>

### 실습

1. 점수를 입력받아 평점을 구하는 함수를 만드시오. calcGrade(score: 95)를 실행하면 "A"를 반환하는 식으로 만드시오.

```swift
func calcGrade(score: Int) -> String {
    switch score {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}

print(calcGrade(score: 95))
```

```swift
func calcGrade(score: Int) -> String {
    let score1 = score/10
    switch score1 {
    case 9, 10:
        return "A"
    case 8:
        return "B"
    case 7:
        return "C"
    case 6:
        return "D"
    default:
        return "F"
    }
}

```

```swift
func calcGrade2(score: Int) -> String {
    var result = ""
    if score >= 90 {
        result = "A"
    } else if score >= 80 {
        result = "B"
    } else if score >= 70 {
        result = "C"
    } else if score >= 60 {
        result = "D"
    } else {
        result = "F"
    }
    return result
}

print(calcGrade2(score: 0))
```

</br>

2. 젯수와 피젯수(정수형)을 입력받아 몫과 나머지를 튜플로 반환하는 함수를 만드시오. divide(firstNumber: 15, secondNumber: 4) 실행하면 (3, 3)을 반환하는 식으로 만드시오.

```swift
func divide(firstNumber: Int, secondNumber: Int) -> (Int, Int) {
    let quo = firstNumber / secondNumber
    let rem = firstNumber % secondNumber
    return (quo, rem)
}
print(divide(firstNumber: 15, secondNumber: 4))

let (res1, res2) = divide(firstNumber: 50, secondNumber: 4)
print("몫은 \(res1)이고, 나머지는 \(res2)이다.")
```

</br>

3. 로또 발생기를 만드시오. 랜덤 발생함수 arc4random() 함수 사용. arc4random() 함수는 UInt32형을 반환함. 정수형으로 형변환하려면 Int(arc4random() % 45 + 1) 형태로 사용

```swift
func lotto() -> [Int] {
    var nums: [Int] = []
    for _ in 1...6 {
        nums.append(Int(arc4random() % 45 + 1))
    }
    return nums.sorted() // 정렬
}
print(lotto())

// 반환값이 Array이므로 중복이 발생할 수 있음.
```

```swift
// 중복을 없애기 위하여 Array 대신 Set으로. 
// 그러나, 중복된 값을 빼줘야하기 때문에 6자리의 숫자를 얻기 위한 횟수를 알 수가 없음
// 따라서 for-in 대신 while 사용 

func lotto() -> [Int] {
    var nums: Set<Int> = []
    while true {
        nums.insert(Int(arc4random() % 45 + 1))
        if result.count == 6 {
            break
        }
    }
    return nums.sorted()
}

// sorted()는 정렬이기때문에 순서가 존재함. 따라서 return 값은 Array로 반환되는 것임
// 그러므로 반환값은 Array 
```


    💡 랜덤발생함수 arc4random() 
        나오길 원하는 숫자까지의 숫자로 나눈 나머지를 구하면 됨
* 로또는 1부터 45까지의 숫자이므로 1부터 45까지의 숫자가 나오게 하기 위해 45로 나눈다. 그러나 0은 포함되지 않기 때문에 " + 1 "을 해준다. 
→ Int(arc4random() % 45 + 1)

</br>

#### 함수의 형(Type)

함수도 매개변수와 반환값에 따라서 형(Type)이 나뉜다. 

```swift
// 1. () -> () / () -> Void 
func hello1() {
    print("Hello World")
}

// 1-1. 같은 타입이므로 대입 가능 
let func1: () -> () = hello1
func1()

let func11 = hello1
func11()

// 2. (String) -> () / (String) -> Void
func hello2(name: String) {
    print("Hello \(name)")
}

// 2-1.
let func2: (String) -> () = hello2
func2("덕선")

let func22 = hello2
func22("덕선")

// 3. (String, Int) -> ([Int])
func hello3(name: String, age: Int) -> [Int] {
    print("Hello World")
    return []
}

// 형추정에 의해서 타입 추정 가능 
let func2 = hello3 // (String, Int) -> ([Int])
```


`💡 함수에 매개변수로 함수를 넘겨줄 경우에 사용할 수 있기 때문에 익혀두기`

    ex. func function(func1: () → ()) {}

</br>

- 함수형 매개변수 및 반환값

```swift
// 함수형 매개변수 
func hello(name: String) {
      print("Hello \(name)")
}

func hello1(name:String, hfunc:(String)->()) {
      hfunc(name)
}

hello1(name: "홍길동", hfunc: hello) // Hello 홍길동

// 함수형 반환값 
func hello(name: String) {
      print("Hello \(name)")
}

// 반환값으로 함수를 반환함
func hello1() -> (String)->() {
      return hello
}

let hello2 = hello1()
hello2("홍길동")
```
