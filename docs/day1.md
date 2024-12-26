[프로젝트 개요]  
- Flutter 앱으로 FastAPI 서버에서 제공하는 /prices 엔드포인트를 호출해 BTC 원화/달러 시세를 불러오려 합니다.
- Day 1 목표: 최소 기능으로 REST API 호출 & 화면 표시 (UI는 간단히 텍스트 정도).

[Day 1 상세 요구사항]  
1) Flutter 프로젝트 초기 셋업  
   - 이미 생성된 프로젝트를 사용합니다.

2) FastAPI 연동 테스트  
   - 한국 시세: /prices/krw (예: http://127.0.0.1:8000/prices/krw) 엔드포인트 GET 요청  
   - 미국 시세: /prices/usd (예: http://127.0.0.1:8000/prices/usd) 엔드포인트 GET 요청  
   - JSON 응답 예시: 
/prices/krw:
{
  "btc_krw": 143726000,
  "percent_change_24h": 2.94095799,
  "timestamp": 1735215141
}
/prices/usd:
{
  "btc_usd": 95508.02,
  "percent_change_24h": -2.638,
  "timestamp": 1735215114
}
   - 이 데이터를 파싱하여 화면에 표시

3) UI 구성  
   - 메인 화면(`HomePage`)에 버튼 or 자동 호출 로직을 두어, 앱 시작 시 /prices를 불러옴  
   - 결과를 Text 위젯에 표시  
   - 큰 글자로 표시

4) 코드/파일 구조 예시  
   - lib/main.dart: MaterialApp, HomePage 연결  
   - 기타 필요한 부분만 간단하게 구현 (디자인은 기본 Material UI)

5) 결과물  
   - 에뮬레이터/실기기(안드로이드/iOS)에서 실행 시, FastAPI 서버가 동작 중이라면 버튼을 누르거나 자동으로 GET 요청  
   - 화면에 BTC 원/달러 시세가 텍스트로 표시되어야 함  
   - 이후 Day 2 이상에서 알림/지표 계산 UI 등을 확장 예정

[추가 요청사항]  
- 가능한 전체 소스(예: pubspec.yaml, main.dart, home_page.dart 등)를 출력할 때, 주석으로 어떤 역할을 하는지 적어주세요.  
- FastAPI 서버 주소(로컬 IP나 도메인)는 변수로 추출하여 관리해주세요(예: BASE_URL = "http://127.0.0.1:8000").  
- 예외 처리(서버 응답 오류 시 메시지 표시)도 간단히 포함해 주세요.

위 요구사항을 만족하는 Flutter 코드를 생성해 주세요.  
모든 코드에 주석을 달아주시면 좋겠습니다.
