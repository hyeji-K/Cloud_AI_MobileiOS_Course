# Swift 소개, 변수와 상수
### Swift 소개
- 21년 8월 현재 swift 5.3 (Xcode 12.5)
- swift 특징 
    - fast
    - modern
    - safe
    - interactive

### 상수와 변수
#### 상수(Constant)
- 값을 한번 저장하면 바꿀 수 없음 

```swift
let age = 20
```

- = : 우항에 있는 걸 좌항에 대입한다는 뜻
- age라는 공간에 20이 저장되어 있다. 

</br>

#### 변수(Variable)
- 값을 저장한 후에도 언제나 바꿀 수 있음

```swift
var age = 20
```

</br>

#### 상수와 변수
- 상수와 변수의 용도: 값을 저장하기 위해서 사용 
- 메모리에 저장되어 있는 공간의 이름을 지정하는 것 

- 어떤 변수의 값이 의도치 않게 변하는 것을 막기 위해서 상수/변수로 나누어 줌 

</br>

#### 변수, 상수 작명규칙

1. 중복 선언할 수 없다. 
2. swift 키워드는 사용할 수 없다.
3. 다양한 문자가 사용가능하나 영문자, 숫자, 언더스코어("_") 만 사용하길 권장 
4. 숫자는 제일 앞에 올 수 없다
5. 제일 앞자리는 소문자를 사용하길 권장
6. 두 단어 이상이 겹칠 때는 두 번째 단어 첫 글자는 대문자 권장 - 카멜표기법(camelCase)


`👉 예전에는 메모리가 작아서 변수명을 짧게 지었지만, 요즘에는 가능하면 그 변수의 성격을 잘 표현하는 식으로 변수명을 지음`

</br>

#### 기본 데이터형
- 정수형(Int)
    - 1비트는 0, 1 을 저장. Int는 64비트  

- 실수형(Double)
    - 소수점 15자리를 넘어가면 표현할 수가 없음 → 부동소수점 

- ~~문자형(Character)~~
- 문자열형(String)
- 이진형(Boolean): true/false


`👉 한 번 결정된 데이터형은 변하지 않는다.`

