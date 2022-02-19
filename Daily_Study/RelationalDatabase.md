# 관계형 데이터베이스

- 테이블 간의 관계를 맺어준다.
- 테이블 분리
- 공간낭비를 막음, 관리하기 용이하게 하기 위해서, 1:1 관계
- 연결시켜주기 위해 primary 키를 줌
- 테이블 속의 중복된 정보 / 빈 공간 → 테이블 나누기
- 정규화 과정 / 비정규화 과정
- 식별관계(실선) / 비식별관계(점선)

### FOREIGN KEY

- 중복과 비어있는 값이 존재 → 테이블을 나눔 → 관계를 맺어줌(학번으로 연결)
- 외래 키 : 다른 테이블의 primary key
- 여기서 학번은 외래키라고 함
- 외래키를 사용하지 일반 필드명을 사용하면 없는 데이터가 들어가게 되면 무결성을 해침
- → 무결성을 유지하기 위해 외래키를 사용함

### INNER JOIN

- 두 테이블에서 데이터가 존재하는 것들만 가져와서 연결

`SELECT 테이블명.컬럼명1, 테이블명.컬럼명2.... FROM 테이블1 (INNER) JOIN 테이블2 ON join조건문`

- 중복되는 컬럼명이 있으면 컬럼명 앞에 테이블명을 붙여줘야함

### OUTER JOIN

`SELECT 테이블명.컬럼명1, 테이블명.컬럼명2... FROM 테이블1 LEFT OUTER JOIN 테이블2 ON Join조건문`

### 관계형 데이터베이스 실습

1. students 테이블 생성

```sql
use university;

CREATE TABLE students (
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
major varchar(50) NOT NULL,
grade int,
gender char(1)
);
```

1. 데이터 입력

```sql
INSERT INTO students(id, name, major, grade, gender) VALUES(1, 'RM', '정보통신', 1, '남');
INSERT INTO students VALUES(2, '제이홉', '컴퓨터공학', 2, '여');
INSERT INTO students VALUES(3, '슈가', '도술학', 3, '남');
INSERT INTO students VALUES(4, '정국', '토목공학', 4, '남');
```

1. cars 테이블 생성

```sql
CREATE TABLE cars (
no VARCHAR(30) PRIMARY KEY NOT NULL UNIQUE,
model varchar(30) NOT NULL,
students_id int NOT NULL,
FOREIGN KEY(students_id) REFERENCES students(id)
);
```

1. 데이터 입력

```sql
INSERT INTO cars(no, model, students_id) VALUES('5387', '그랜져', 1);
INSERT INTO cars(no, model, students_id) VALUES('2011', '소나타', 2);
```

1. books 테이블 생성

```sql
CREATE TABLE books (
no varchar(30) PRIMARY KEY NOT NULL UNIQUE,
title varchar(50) NOT NULL,
student_id int NOT NULL,
FOREIGN KEY(students_id) REFERENCES students(id)
);
```

1. 데이터 입력

```sql
INSERT INTO books(no, title, students_id) VALUES('1234', 'android Progrademming', 1);
INSERT INTO books(no,title,students_id) VALUES('1235', '데이터베이스개론', 2); 
INSERT INTO books(no,title,students_id) VALUES('1237', '슈가전', 3);
INSERT INTO books(no,title,students_id) VALUES('1238', 'Core Data', 1);
INSERT INTO books(no,title,students_id) VALUES('1239', 'Cocoa Framework', 1);
```

1. join

```sql
SELECT id, name, major, gender, no, model FROM students JOIN cars ON students.id = cars.students_id;
```


- `order by id asc` id를 오름차순으로 정렬
- `order by id desc` id를 내림차순으로 정렬

```sql
SELECT students.id, students.name, students.major, cars.no, cars.model
FROM students INNER JOIN cars
ON students.id=cars.students_id WHERE grade >=2
```


- 테이블 명에 대한 별칭 설정

```sql
SELECT s.id, s.name, s.major, c.no, c.model FROM students AS s JOIN cars AS c 
WHERE s.id=c.students_id AND grade >= 2;
```

- join 조건절은 where 조건절로 사용 가능

- AS 생략 가능

- students 와 books join

```sql
SELECT s.id, s.name, s.major, b.no, b.title FROM students AS s JOIN books AS b
ON s.id=b.students_id;
```


1. OUTER JOIN
- 학생 정보 + 차량 정보가 다 같이 나와야 함, 왼쪽의 테이블이 기준

```sql
SELECT s.id, s.name, s.major, c.no, c.model FROM students s LEFT OUTER JOIN cars c ON s.id=c.students_id;
```


```sql
SELECT s.id, s.name, s.major, b.no, b.title FROM students s LEFT OUTER JOIN books b ON s.id=b.students_id;
```


### 테이블 수정

- 테이블명 수정

`ALTER TABLE 테이블명 RENAME TO 바꿀 테이블명`

ALTER TABLE students RENAME TO student;

- 컬럼추가

`ALTER TABLE 테이블명 ADD 칼럼명 타입`

ALTER TABLE students ADD addr varchar(50);

- 데이터가 들어가 있을 시에는 NOT NULL 을 사용하면 안됨!

### 트랜잭션: 실행 단위

```sql
BEGIN;
INSERT INTO cars(no,model,students_id) VALUES('53874','그랜져',1);
INSERT INTO cars VALUES('53875','그랜져2',1); 
ROLLBACK;
```

- ROLLBACK 실행된 것들 모두 취소가 됨

```sql
BEGIN;
INSERT INTO cars(no,model,students_id) VALUES('53874','그랜져',1);
INSERT INTO cars VALUES('53875','그랜져2',1); 
COMMIT;
```

- COMMIT 실행됨

### E-R 다이어그램

![school2.png](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/erd.png)
