# :pushpin: Camp Ping
>지도 API를 이용하여 캠핑장 위치 및 예약 등 캠핑에 대한 정보 공유, 캠핑 용품 판매  
>http://106.10.71.20/camping

</br>

## 1. 제작 기간 & 참여 인원
- 2022년 1월 24일 ~ 3월 2일
- 팀 프로젝트 (5인)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 15
  - Spring Framework 5.0.8 RELLEASE
  - Maven 3.8.4
  - Oracle 11g
  - Mybatis 3.4.6
  - OAuth 2.0 API
#### `Front-end`
  - Javascript
  - jQuery
  - Bootstrap

</br>

## 3. ERD 설계
<img src="https://user-images.githubusercontent.com/84454039/169480113-61abe1a1-b8a3-4729-9ec8-9afec87414fe.png" width="900" height="500"><br>


## 4. 핵심 기능
이 서비스에서 제가 맡아서 구현한 기능은 마이페이지입니다.  
사용자는 회원정보수정, 캠핑장 예약내역 조회, 캠핑용품 장바구니 기능을 마이페이지에서 이용할 수 있습니다.  
아래의 설명을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 사이트 맵
<img src="https://user-images.githubusercontent.com/84454039/169484512-051dda15-3b37-4b39-b5aa-c8c5b9cbc95f.png" width="400" height="300">
  
### 4.2. 플로우 차트
- **ID/PW 찾기 / 주문**
![IDPW 주문 플로우차트](https://user-images.githubusercontent.com/84454039/169484367-ba647976-f8fe-493f-9a11-d1f4dfcc6647.png)
  
- **주문환불 / 예약 / 게시판**
![주문환불_예약_게시판 플로우차트](https://user-images.githubusercontent.com/84454039/169484375-beb2c3e5-d7cc-4676-9d4d-dfdcfa0bbe68.png)


### 4.3. 화면구현
  
- **예약내역 조회** :pushpin: [코드 확인](https://github.com/skwo313/campping/blob/master/src/main/java/com/ssangyong/camping/controller/MypageController.java#:~:text=public%20String%20reservations)
  - 로그인한 세션 아이디로 회원의 예약한 내역을 조회합니다. 세션이 없을 시, 실패 메세지를 출력합니다.
  
![예약조회](https://user-images.githubusercontent.com/84454039/169488337-e7106ea3-d60e-4295-8b14-c858eed8ae15.png)
  
- **장바구니** :pushpin: [코드 확인](https://github.com/skwo313/campping/blob/master/src/main/webapp/WEB-INF/views/mypage/cart.jsp#:~:text=%3C/style%3E-,%3C!%2D%2D%20%EA%B8%88%EC%95%A1%20%EC%B4%9D%20%ED%95%A9%EA%B3%84%20%20%2D%2D%3E,-%3Cscript%20type)
  - 장바구니에 담은 상품을 DB에 저장, 마이페이지에서 해당 아이디의 장바구니에 담은 상품목록을 보여줍니다. 
  - select 박스로 구매할 물품의 갯수를 선택하고 체크박스로 선택한 물품의 가격의 총합을 보여줍니다.
  
<img src="https://user-images.githubusercontent.com/84454039/169488378-cd95ab04-14db-41a3-a14f-b02e5f3064c8.png" height="300">  
  
![장바구니 확인](https://user-images.githubusercontent.com/84454039/169488385-28086c35-5227-4f28-8fd2-e6d707ab2f67.png)
  

</div>
</details>
  
