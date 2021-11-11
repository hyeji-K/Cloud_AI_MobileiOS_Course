# 자료형
### Collections

- 집단자료형
- 서로 관련이 있는 데이터끼리 모아서 관리
- 데이터를 그룹단위로 묶을 수 있으므로 다량의 데이터 다룰때 편리함

- 배열(Array): 일련번호로 구분되는 순서에 따라 데이터가 정렬된 목록 형태의 자료형
- 집합(Set): 중복되지 않은 데이터들이 모인 집합 형태의 자료형
- 튜플(Tuple): 종류에 상관없이 데이터들을 모은 자료형. 수정 및 삭제를 할 수 없음
- 딕셔너리(Dictionary): 키(Key)-값(Value)로 연관된 데이터들이 순서 없이 모인 자료형


`👉 스위프트는 타입을 추론하기 때문에 타입을 생략할 수 있음`

</br>

#### **Array**

```swift
var array: [String] = [String]()
var array: [String] = []
var array = []
```

`👉 Array의 값을 바꾸는 경우는 별로 없음. let 으로 선언하면 체감상 느끼지는 못하지만 빠름`

</br>


- Array 활용

```swift
// 값 추가하기
bts.append()
bts += ["둘리"]

// 값 삽입
bts.insert("손흥민", at: 2)

// 개수 구하기
bts.count

// 값 삭제하기
bts.remove(at: 1)

// 값 대체 (개수는 상관없음)
bts[0...3] = ["마이콜"]
```
</br>


#### **Set**

```swift
var set1: Set<String> = Set<String>()
var set2: Set<String> = []

var set3: Set<String> = ["뭉치", "삐용"]
```


`💡 set 에서는 형지정을 생략하면 Array로 인식된다. 
set은 순서가 보장되지 않는다.`

</br>

- set 활용

```swift
// 값 추가하기 - 같은 값이 있으면 추가되지 않음
set3.insert("고양이")
// (inserted true, memberAfterInsert "고양이")
print(set3)

set3.insert("뭉치")
// (inserted false, memberAfterInsert "뭉치")
print(set3)

// 값 삭제하기
set3.remove("고양이")
print(set3)

set3.remove("고양이")
// nil
print(set3)
```


`💡 Array와 달리 순서가 없기 때문에 (at:)이 필요하지 않음`

`💡 nil은 아무것도 없다는 의미`

`💡 집합(교집합, 합집합, 여집합, 차집합)`

</br>

#### **Tuple**

```swift
let tpl: (Int, Int) = (100, 100)
```


`💡 여러 개의 데이터를 저장할 수 있다. 
값을 바꿀 수 없다. → 선언과 동시에 초기화`

</br>

#### **Dictionary**

```swift
var dic1: Dictionary<String, String> = Dictionary<String, String>()
var dic2: [String:String] = [:]

var dic3 = ["KR":"Seoul", "EN":"London", "FR":"Paris"]
```


`💡 Dictionary를 아이템으로 가지고 있는 Array를 많이 사용함`

`💡 값을 삭제할때는 키만 삭제해도 됨 
키는 중복될 수 없음. 값은 중복 상관 없음`

</br>

- Dictionary 활용

```swift
// 값 추가 
var capital = ["US":"Washington"]
capital.updateValue("Seoul", forKey: "KR")
capital.updateValue("London", forKey: "EN")
capital.updateValue("Paris", forKey: "FR")
capital.updateValue("Ottawa", forKey: "CA")
capital.updateValue("Beijing", forKey: "CN")
print(capital)

capital.updateValue("Sejong", forKey: "KR") // 키에 대한 값이 수정됨
print(capital)

// 키값 삭제
capital.removeValue(forKey: "CN")
print(capital)
```

```swift
var capital2 = ["KR":"Seoul", "EN":"London", "FR":"Paris"]
print(capital2["KR"])
capital2["KR"] = "Sejong" // 값이 수정됨
capital2["JP"] = "Tokyo" // 값이 추가됨 
print(capital2) // ["JP": "Tokyo", "FR": "Paris", "EN": "London", "KR": "Sejong"]
capital2["JP"] = nil // 값이 삭제됨
print(capital2) // ["FR": "Paris", "EN": "London", "KR": "Sejong"]
print(capital2["FR"]) // Optional("Paris")
```

- Dictionary의 순회 탐색

```swift
var capitals = ["KR":"Seoul", "EN":"London", "FR":"Paris"]

for (country, capital) in capitals {
    print("\(country)'s capital = \(capital)")
}
```

- Collection 간의 사용

```swift
// 배열요소로 튜플 사용
// var array: Array<String> = Array<String>()
// var array: [String] = []
var tArray: Array<(String, Int)> = [("a", 1), ("b", 2)]
print(tArray[0])
let t1 = tArray[0]
t1.1
t1.0

// 튜플요소로 배열 사용
// var tuple: (Int, Int) = () 
var tuple: ([String], Int) = (["덕선", "수현"], 3)
tuple.0
tuple.1
let t2 = tuple.0
t2[1]
let t3 = tuple.1

// 딕셔너리의 Value로 배열 사용
// var dic: Dictionary<String, String> = Dictionary<String, String>()
// var dic: [String:String] = [:]
var diction: [String:[String]] = ["name":["덕선", "수현"]]
print(diction["name"])

// 배열요소로 딕셔너리 사용
var dArray: [[String:String]] = [["a":"b", "c":"d"], ["c":"d"]]
print(dArray[0])
```


`💡 튜플도 데이터타입의 한 종류로써 다른 Collection과 같이 사용할 수 있음`
