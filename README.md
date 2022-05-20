# :pushpin: Camp Ping
>지도 API를 이용하여 캠핑장 위치 및 예약 등 캠핑에 대한 정보 공유, 캠핑 용품 판매  
>링크예정

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
  
- **장바구니** :pushpin: [코드 확인]()
  - 장바구니에 담은 상품을 DB에 저장, 마이페이지에서 해당 아이디의 장바구니에 담은 상품목록을 보여줍니다. 
  - 체크박스로 선택한 물품의 가격의 총합을 보여줍니다.
  
<img src="https://user-images.githubusercontent.com/84454039/169488378-cd95ab04-14db-41a3-a14f-b02e5f3064c8.png" height="300">  
  
![장바구니 확인](https://user-images.githubusercontent.com/84454039/169488385-28086c35-5227-4f28-8fd2-e6d707ab2f67.png)
  
  - Service 계층에서 넘어온 로직 처리 결과(메세지)를 화면단에 응답해줍니다.
  - DB에 저장된 비밀번호를 복호화하여 사용자가 입력한 비밀번호와 일치했을 시에 로그인이 완료됩니다.
  - 소셜 로그인 흐름: 사용자의 요청 > 해당 서비스에서 authorization code 발급 > access token 발급 > 받은 token과 함께 받아 올 프로필 정보 요청 > 첫 로그인 시 DB에 저장 후 로그인, 기존에 아이디가 있을 시 바로 로그인. [코드 확인](https://github.com/skwo313/FFunding/blob/master/src/main/java/com/ffunding/web/auth/SNSLogin.java#:~:text=public%20MemberVO%20getUserProfile(String%20code)%20throws%20Exception%20%7B)
  
- **front단** :pushpin: [코드 확인](https://github.com/skwo313/FFunding/blob/master/src/main/webapp/WEB-INF/views/member/login.jsp#:~:text=%7D%3B-,%24.ajax(%7B,-type%20%3A%20%22))
  - Ajax 통신으로 controller와 통신합니다.
  - 웹에 정보를 저장하는 localStorage를 이용하여 아이디 저장 기능을 지원합니다
  - 아이디/비밀번호 찾기는 6자리의 랜덤 난수를 SMTP 라이브러리를 이용하여 이메일로 전송하여 본인인증하는 방식으로 지원합니다.

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. OAuth scribeJava 라이브러리로 소셜로그인 구현 중 카카오에서 오류
- 저는 scribeJava 라이브러리를 이용하여 네이버,구글 로그인 구현 완료했고,
네이버,구글 로그인 구현 시 만든 인터페이스를 카카오로그인에 적용했습니다.

- 하지만, 접근 토큰(access token)을 반환하여 사용자 정보를 가져오는 메서드에서 scribeJava가 카카오에 대한 처리를 잘 못 하는건지,  
기존에 구현한 인터페이스를 사용하면 오류가 떠 당황했습니다.

- 때문에, 직접 Query에 정보를 직접 입력하여 날려야했습니다.

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

~~~java
public SNSLogin (SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.defaultScope(scope) // OAuth2Service가 사용자 정보를 가져옴
				.build(sns.getApi20Instance());
}  
  
/**
 * 접근 토큰 반환 메서드
 */
public MemberVO getUserProfile(String code) throws Exception {
	// 접근 토큰
	OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
	// 사용자 정보 응답 반환
	OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
	oauthService.signRequest(accessToken, request);
		
	Response response = oauthService.execute(request);
		
	return parseJson(response.getBody());
}
~~~

</div>
</details>

- 이 때, **기존 코드**에서 처럼 scribeJava가 정보를 담아 요청하였지만,  
- 아래 **개선된 코드**와 같이 직접 요청을 생성하여 프로필 정보를 받아 올 수 있었습니다.  
- 직접 요청하는 메서드를 구현 중 오류: parameter에 정보를 담는 AccessTokenRequestParams class가 제가 사용중인 API 버전에서 찾지 못했습니다.  
최신 버전인 8.3.1 버전으로 업그레이드하여 해결했고, 언어 및 API 버전에 따른 차이에 대한 공부의 중요성을 다시금 깨달았습니다.
<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
public SNSLogin (SnsValue sns) {
	this.sns = sns;
		
	String scope = "";
	if (this.sns.isKakao()) {
		scope = "account_email profile_nickname";
	} else {
		scope = "openid profile email";
	}
		
	this.oauthService = new ServiceBuilder(sns.getClientId())
			.apiSecret(sns.getClientSecret())
			.callback(sns.getRedirectUrl())
			.defaultScope(scope) // OAuth2Service가 사용자 정보를 가져옴
			.build(sns.getApi20Instance());
}
/**
 * 카카오 접근 토큰 반환 메서드
 */
public MemberVO getKakaoUserProfile(String code) throws Exception {
	AccessTokenRequestParams params = new AccessTokenRequestParams(code);
	params.addExtraParameter("client_id", sns.getClientId());
	params.addExtraParameter("client_secret", sns.getClientSecret());
	OAuth2AccessToken accessToken = getAccessToken(params);
		
	OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
	oauthService.signRequest(accessToken, request);
		
	Response response = oauthService.execute(request);
		
	return parseJson(response.getBody());
}
~~~

</div>
</details>
    
</br>

## 6. 회고 / 느낀점
> 프로젝트를 진행하면서 직접 모르는 부분을 찾으면서 오류를 해결했을 때 실력이 가장 성장한 것 같습니다.  
> 무엇보다 모르는 부분을 팀원들에게 도움을 요청하고, 팀원들이 해결한 방법을 저에게 적용시키며 좋은 피드백이 되어  
> 커뮤니케이션의 중요성을 직접 피부로 느꼈습니다.

