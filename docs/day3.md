[프로젝트 개요]
- 백엔드가 /ws/price WebSocket에서 업비트·바이낸스 실시간 시세를 합쳐 push해 줍니다.
- Day 3에는 Flutter 앱에서 이 WebSocket에 연결해, 실시간으로 가격을 수신하고 UI에 표시하고자 합니다.

[Day 3 상세 요구사항]

1) WebSocket 연결
   - Flutter 코드에서 `web_socket_channel`  패키지를 사용
   - 서버 주소: ws://<IP>:8000/ws/price
     - 에뮬레이터는 ws://localhost:8000/ws/price, 실제 기기는 ws://<서버IP>:8000/ws/price
   - 연결 후, 수신 데이터를 StreamBuilder나 setState로 UI 업데이트

   수신 데이타 형식:
   {"krw": 141967000.0, "usd": 94470.83, "timestamp": "2024-12-28T11:42:36.660633", "kimchi_premium": 2.01, "change_24h": {"krw": 0.1, "usd": -1.89}, "rsi": {"15m": 53.31, "1h": 41.79, "4h": 41.84, "1d": 43.08}, "mvrv": 2.88, "dominance": 57.26}

2) 실시간 가격 표시
   - WebSocket 메시지가 들어올 때마다 즉시 값 갱신

3) 에러/연결 해제 처리
   - WebSocket 연결 실패 시, "연결 실패" 문구 표시
   - 재연결 로직(선택 사항) - 기본적으로 StreamBuilder가 재시도를 해줄 수 있지만, 필요하다면 수동 재연결 버튼 구현

4) 코드 구조
   - `pubspec.yaml`에 web_socket_channel 추가
   - Home 화면에서 WebSocketChannel 연결 -> StreamBuilder -> UI
   - 간단 주석으로 어떤 로직인지 설명

5) 최종 결과
   - 앱 실행 시 자동으로 서버와 WebSocket 연결
   - 화면에 실시간(체결 시점) 가격 업데이트

[추가 요청사항]
- 전체 소스 코드(main.dart, price_page.dart, pubspec.yaml 등)를 예시로 보여주세요.
- 어떠한 JSON 포맷으로 오는지, 어떻게 파싱하는지 주석 설명 부탁드립니다.
- 에뮬레이터/실디바이스에서 IP나 포트를 어떻게 맞춰야 하는지 간단한 안내도 추가해 주세요.

위 요구사항에 맞춰 코드를 생성해 주세요.
