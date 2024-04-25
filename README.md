## **프로젝트 소개**
온라인식품관을 이용하는 고객에게 OpenAI API(GPT 3.5 turbo)를 통해 다양한 식사 메뉴 경험을 제공한다. GPT 검색창에 식사 관련 키워드를 입력하면 GPT가 메뉴를 선정해 조리법과 식재료를 함께 알려준다. 메뉴와 관련된 상품 목록을 하단에 나열하여 고객이 필요한 식재료를 손쉽게 구매할 수 있도록 한다. 
<br><br>

## 구현 기능

**1. 회원 관련 기능**
  - 회원가입
  - 회원 정보 수정
  - 로그인/로그아웃

**2. 상품 관련 기능**
   - 상품 추천
   - 카테고리별 상품 조회
   - 상품 검색

**3. 주문 기능**
   - 장바구니 목록 조회
   - 장바구니에 상품 담기 및 삭제
   - 장바구니 상품 수량 변경
   - 바로 구매
   - 전체 구매
   - 주문 목록 조회
     
**4. 식사 메뉴 추천**
   - GPT 메뉴 검색
   - GPT 식사 메뉴 및 레시피 생성
   - GPT 레시피 조회하기
<br>


## 실행 화면
### 메인페이지
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/메인페이지.png" width="500"/>

### 주문
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/장바구니.png" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/주문페이지.png" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/주문완료페이지.png" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/주문목록조회페이지.png" width="500"/>

### gpt 메뉴 추천
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/GPT검색.PNG" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/GPT요리중.PNG" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/gpt식사메뉴.PNG" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/gpt재료.PNG" width="500"/>
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/gpt레시피.PNG" width="500"/>



<br><br>

## 기술 스택
|분류|기술|
| :-: |:- |
|Language| <img src="https://img.shields.io/badge/java-000000?style=for-the-badge&logo=JAVA&logoColor=white"> <img src="https://img.shields.io/badge/jsp-000000?style=for-the-badge&logo=JSP&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"> |
|IDE| <img src="https://img.shields.io/badge/spring tool suite-3DDC84?style=for-the-badge&logo=springtoolsuite&logoColor=white"> |
|Framework| <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-000000?style=for-the-badge&logo=mybatis&logoColor=white"> 
|Library| <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white">
|Build Tool| <img src="https://img.shields.io/badge/apachemaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white"> |
|DB| <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> |
|Collaboration| <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/-googledocs-4285F4?style=for-the-badge&logo=googledocs&logoColor=white"> |
|etc| <img src="https://img.shields.io/badge/openai api-412991?style=for-the-badge&logo=openai&logoColor=white"> |

<br>

## **아키텍처**
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/아키텍처.png" width="400"/>
<br>

## **DB 설계 (ERD)**
<img src="https://github.com/it-e-7/GPTEveningFeast/blob/master/img/erd.png" width="600"/>
<br><br>

## 역할
### 오혁진
- ERD 설계
- 로그인 및 인증 관련
- 상품 페이지
- 상품 검색
- GPT 검색 및 GPT 검색 결과 조회

### 장서윤
- ERD 설계
- 상품 데이터 크롤링
- 회원가입
- 상품 상세 페이지
- 주문 및 주문 내역 조회

### 홍진욱
- ERD 설계
- 상품 데이터 크롤링
- 회원가입 및 회원 정보 수정
- 메인페이지
- 주문 기능
