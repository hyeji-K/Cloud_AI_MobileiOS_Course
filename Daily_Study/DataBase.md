# DataBase

### DataBase 의 정의

- Data의 집합체
- Data의 추가, 수정, 삭제 가능
- Data의 정렬 및 열람가능


### SQL의 이해

- Structured Query Language
- 인간의 언어와 흡사(영어)
- ISO에서 표준제정
- 대부분의 DBMS는 SQL-92(SQL2)를 지원

### 테이블구성

![DataBase](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/Database.png)

- 필드는 각각의 속성

### MySQL 설치


### MySQL의 주요 데이터형

- INT
- FLOAT, DOUBLE
- CHAR(n): 1~255의 고정 길이
    - 전화번호(11자리) 같은 길이가 보장되어 있는 것들에 사용
    - VARCHAR(n)도 있는데 따로 둔 이유는? 속도차이때문에. VARCHAR로 하면 남는 공간이 많아짐
- VARCHAR(n): 1~255의 가변 길이
    - 학과명을 저장한다면.. 길이를 모르기때문에 입력하는 키만큼 담음
- TEXT: ~65535길이의 문자데이터
- DATETIME 날짜 시간

### SQL CURD

- Create : INSERT : 생성
- Retrieve(Read) : SELECT : 조회
- Update : UPDATE : 수정
- Delete : DELETE : 삭제

### INSERT

`INSERT INTO 테이블명(컬럼명1, 컬럼명2...) VALUES(값1, 값 2....)`

### SELECT

`SELECT (컬럼명1, 컬럼명2...) FROM 테이블명`

- WHERE 조건문
    
    `SELECT (컬럼명1, 컬럼명2...) FROM 테이블명 WHERE 조건`
    
    - =,<,>,<=,>=,<>,!= 등의 비교연산자지원
    - 필드명 연산자 값
        - (grade>2, gender=’여’)
    - 두개이상의 조건절- AND로 연결
        - grade>2 **AND** gender=’여’
    
    - LIKE 조건문: 조건을 일부만 주는 것 → 부하가 걸리기 때문에 안 쓰는 것이 좋음 (성능저하)
        - `SELECT (컬럼명1, 컬럼명2...) FROM 테이블명 WHERE 필드명 LIKE 조건`
        - SELECT * FROM students WHERE major LIKE ‘정보%’ : 정보로 시작하는 단어
        - SELECT * FROM students WHERE major LIKE ‘%통신’
        - SELECT * FROM students WHERE name LIKE ‘현_’ : 현자로 시작하는 두글자
        - SELECT * FROM students WHERE name LIKE ‘_빈’
    - BETWEEN 조건문
        - SELECT * FROM students WHERE grade **BETWEEN** 2 **AND** 3
    - IN 조건문
        - SELECT * FROM students WHERE grade **IN** (2, 3)
        - SELECT * FROM studentsWHERE major **IN** (‘정보통신’, ‘컴퓨터공학’)
    - NOT 연산자
        - SELECT * FROM students WHERE **NOT** grade = 2
        - SELECT * FROM studentsWHERE **NOT** major IN (‘정보통신’,‘컴퓨터공학’)
        - SELECT * FROM StudentsWHERE **NOT** grade BETWEEN 2 AND 3
        - SELECT * FROM Students WHERE **NOT** Major LIKE ‘정보%’

### 💡Safe Updates 체크 해제를 해줘야 UPDATE와 DELETE를 할 수 있음

### UPDATE

- 데이터를 바꾸는 것이므로 **무조건 조건식**이 따라와야 함

`UPDATE 테이블 SET 필드명=값 WHERE 조건식`

`UPDATE 테이블 SET 필드명1=값1, 필드명2=값2... 조건식`

UPDATE school1.student SET grade=2 WHERE name = '빠삐용';

### DELETE

- 실제로 쓸 일은 많이 없음

`DELETE FROM 테이블 WHERE 조건식`

DELETE FROM students WHERE grade = 1

DELETE FROM students WHERE major LIKE ‘컴퓨터%’

DELETE FROM studentsWHERE grade BETWEEN 2 AND 3

### Primary Key

- 중복되지않는 유일한 값(Unique)
- Null을 가질 수 없음
- 한 테이블에 하나만 가질 수 있음
- ex. 학번은 고유해야함 → Primary Key

```sql
CREATE TABLE students (
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
major varchar(50) NOT NULL,
grade int,
gender char(1))
```

- AUTO_INCREMENT : 1씩 자동으로 증가시킴
- NOT NULL : 필수 항목