
# Class

사용자정의자료형

</br>

### 객체지향 프로그래밍

- 객체로 프로그램을 구성한다.
- 객체는 정보(변수)와 동작(함수)로 구성된다.
- 객체를 만들때는 클래스라는 설계도를 이용해서 만든다.

</br>

### 클래스 정의

- 클래스 이름의 첫글자는 대문자
- 내가 필요한 데이터형을 만드는 것.

```swift
class SimpleClass {
    var name = "SimpleClass"
    var count = 0
}

var sClass1 = SimpleClass()
sClass1.count // 0
sClass1.name // SimpleClass

sClass1.count = 100
sClass1.name = "뭉치"

var sClass2 = SimpleClass()
sClass2.name = "삐용"
sClass2.count = 50

print("sClass1 : 이름은 \(sClass1.name), 츄르 개수는 \(sClass1.count)")
print("sClass2 : 이름은 \(sClass2.name), 츄르 개수는 \(sClass2.count)")
// sClass1 : 이름은 뭉치, 츄르 개수는 100
// sClass2 : 이름은 삐용, 츄르 개수는 50
// sClass1과 sClass2 는 다름. 타입만 같음.
```

</br>

- 클래스 안에 정의된 함수를 메소드라고 한다.

```swift
class Vehicle {
    var speed = 0
    func speedUp() {
        speed += 10
    }
    func speedDn() {
        speed -= 10
    }
}

var vehicle1 = Vehicle()
vehicle1.speedUp()
print(vehicle1.speed) // 10
vehicle1.speedDn()
print(vehicle1.speed) // 0
```

</br>

- 반환값이 있는 메소드

```swift
class Vehicle1 {
    var speed = 0
    func speedUp() { speed += 10 }
    func speedDn() { speed -= 10 }
    func speed2Mile() -> Double {
        return Double(speed) * 0.6213
    }
}

var someVehicle1 = Vehicle1()
someVehicle1.speedUp()
print(someVehicle1.speed)
var mile = someVehicle1.speed2Mile()
print(mile)
```

</br>

- 클래스는 객체를 생성해서 써야한다. 

```swift
class Vehicle2 {
    // 프로퍼티(속성)
    var speed = 0

    // 연산프로퍼티 
    var mile: Double {
        return Double(speed) * 0.6213
    }
    
    // 메소드
    func speedUp() {
        speed += 10
    }
    func speedDn() {
        speed -= 10
    }
    func speed2Mile() -> Double {
        return Double(speed) * 0.6213
    }
}

var someVehicle2 = Vehicle2()
someVehicle2.speedUp()
someVehicle2.speedUp()
print(someVehicle2.speed) // 20
print(someVehicle2.speed2Mile()) // 12.425999999999998
print(someVehicle2.mile) // 12.425999999999998
```


`💡 데이터가 중심이면 연산프로퍼티를 사용하고 액션이 중심이면(해야할 일이 많으면) 메소드를 사용한다.`


`💡 인스턴스를 생성할때 클래스명 뒤에 괄호()를 붙이는 이유?
구조와 클래스는 모두 새 인스턴스에 대해 이니셜라이저 구문을 사용합니다. 이니셜라이저 구문의 가장 간단한 형식은 클래스 또는 구조의 유형 이름 뒤에 Resolution()또는 와 같은 빈 괄호를 사용하는 것 VideoMode()입니다. 그러면 모든 속성이 기본값으로 초기화된 클래스 또는 구조의 새 인스턴스가 생성됩니다.`

`💡 read-only 속성`

</br>

### get / set

get은 속성값을 읽을때 사용. set은 속성값을 쓸때 사용. (set은 생략가능) 

```swift
class Vehicle3 {
    var speed = 0.0
    var mile: Double {
        get {
            return speed * 0.6213
        }
        set(newValue) {
            speed = newValue * 1.6
        }
    }
    
    func speedUp() {
        speed += 10
    }
    func speedDn() {
        speed -= 10
    }
    func speed2Mile() -> Double {
        return speed * 0.6213
    }
}

var vehicle3 = Vehicle3()
vehicle3.mile = 94
print(vehicle3.speed) 
```

</br>

### 클래스 정의 실습

- 정사각형을 관리하는 클래스를 정의하라
- 넓이를 입력받아 가로, 세로를 관리하는 연산프로퍼티를 정의하라
- 가로, 세로를 두 배로 만들고 변경된 가로, 세로를 튜플로 반환하는 메소드를 정의하라

```swift
class Square {
    var width = 0.0
    var height = 0.0
    
    var area: Double {
        get {
            return width * height
        }
        set(value) {
            width = sqrt(value)
            height = width
        }
    }
    
    func duplicate() -> (Double, Double) {
        width = 2 * width
        height = width
        return (width, height)
    }
}

var square = Square()
square.area = 40.0
print(square.width)
print(square.height)
print(square.duplicate())
```

</br>

### 생성자

- 가로, 세로를 초기화.
- 클래스 안의 생성값들을 초기화해줌.
- 프로퍼티와 생성자의 파라미터를 같은 이름으로 한다.

```swift
class Square2 {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            return width * height
        }
        set(newValue) {
            width = sqrt(newValue)
            height = width
        }
    }
    
    func duplicate() -> (Double, Double) {
        width = 2 * width
        height = width
        return (width, height)
    }
    
    init(w: Double, h: Double) {
        width = w
        height = h
    }
}

var square2 = Square2(w: 10, h: 10)
square2.width
```

</br>

- self

```swift
class Square3 {
    var width = 0.0
    var height = 0.0
    
    var area: Double {
        get {
            return width * height
        }
        set(newValue) {
            width = sqrt(newValue)
            height = width
        }
    }
    
    func duplicate() -> (Double, Double) {
        width = 2 * width
        height = 2 * height
        return (width, height)
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

var square3 = Square3(width: 10, height: 10)
print(square3.width)
```


`💡 생성자를 두 개 만들 수 있음 → 타입으로 구분함`

`💡 기본 생성자 init(){}는 자동으로 만들어지지만 단, 생성자가 하나도 없을 때만`

`오버로딩 : 같은 함수의 이름을 가지고 있지만 파라미터를 다르게 하여 다양한 유형의 호출에 응답이 가능한 것 / 같은 이름의 메소드에 매개변수는 다르게 선언 할 수 있는 것`



```swift
// 위의 코드가 정사각형이기때문에 생성자를 아래와 같이 만들어줄 수도 있음
init(width: Double) {
    self.width = width
    self.height = width
}
```

</br>

### 상속

- 상속의 구현

![상속의 구현](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/%EC%83%81%EC%86%8D%EC%9D%98%20%EA%B5%AC%ED%98%84.png)


Vehicle을 Car가 상속받는다. → Car의 Super class

Truck이 Car를 상속받는다. → Car의 Sub class



```swift
class Vehicle {
    var speed = 0.0
    var mile: Double {
        return speed * 0.6213
    }
    
    func speedUp() { speed += 10 }
    func speedDn() { speed -= 10 }
}

// Vehicle 상속
class Car : Vehicle {
    var wheelCount: Int
    var seatCount: Int
    
    init(wheelCount: Int, seatCount: Int) {
        self.wheelCount = wheelCount
        self.seatCount = seatCount
    }
}

var car = Car(wheelCount: 4, seatCount: 4)
car.speedUp()
print(car.speed)
```

</br>

### 클래스 상속 실습

- Car class를 상속받아서 Truck class를 정의하라
- 적재량을 관리하는 loadage 변수를 정의하라
- 'load'를 화면에 인쇄하는 load 메소드를 정의하라
- 'unLoad'를 화면에 인쇄하는 unLoad 메소드를 정의하라

```swift
class Truck : Car {
    var loadage: Int = 0
    
    func load() {
        print("load")
    }
    func unLoad() {
        print("unLoad")
    }
}
```

</br>


### 메소드 재정의

```swift
class Truck: Car {
    var loadage: Int = 0
    
    func load() {
        print("load")
    }
    func unLoad() {
        print("unLoad")
    }
    // 메소드 재정의: 상위 클래스에 있는 메소드를 하위 클래스에서 수정하는 것
    override func speedUp() {
        speed += 5
    }
}
```

```swift
class SportsCar: Car {
    override func speedUp() {
        speed += 20
    }
}

var car1 = Car(wheelCount: 4, seatCount: 4)
car1.speedUp()
print(car1.speed) // 10
var truck1 = Truck(wheelCount: 6, seatCount: 2)
truck1.speedUp()
print(truck1.speed) // 5
var sportsCar = SportsCar(wheelCount: 4, seatCount: 2)
sportsCar.speedUp()
print(sportsCar.speed) // 20
```

</br>

### 생성자 재정의

```swift
class Truck1: Car {
    var loadage: Int
    
    func load() { print("load") }
    func unLoad() { print("nuLoad") }
    
    init(loadage: Int, wheelCount: Int, seatCount: Int) {
        self.loadage = loadage
        super.init(wheelCount: wheelCount, seatCount: seatCount)
    }
    
    override func speedUp() {
        speed += 5
    }
}
```

</br>

### 객체지향의 동작방식
메모리를 쓰거나 읽기 위해서 메모리마다 주소가 있음 → memory address

</br>

### OS에 의한 메모리 구분
| 구분 | 설명 |
|:----------|:----------:|
| Stack | 지역변수와 매개변수가 저장 |
| Heap | 동적할당을 위한 공간 |
| Data | 전역변수와 정적변수가 저장 |
| Code(text) | 프로그램 코드가 저장 |


</br>


앱 실행 → 메모리 할당 

앱을 실행하기 전엔 보조기억장치에 저장되어 있음 → 실행하면 메모리로 올라옴 

class를 생성하면 Heap 영역에 저장됨 

코드블록 안에서 선언하는 것들(지역변수), 매개변수들은 Stack에 저장됨 → 코드 블록이 끝나면 사라짐 → 자동으로 사용량이 늘었다가 줄었다가 함 

</br>

stack : 참조형이 아닌 것들이 저장됨. 주소를 참조한다

heap : 참조형이 저장됨. class는 참조형

보조기억장치에 저장되어 있는 프로그램 코드를 읽어서 주기억장치에 코드를 올려줌 -> 코드들이 동작

</br>

### 메모리 관리
- [ARC(Automatic Reference Counting)](https://mildwhale.github.io/2019-10-31-reference-counting/)

