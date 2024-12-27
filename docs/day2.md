[프로젝트 개요]

- Day 1에서 /prices + 김치 프리미엄 정보를 Flutter 앱에 표시했습니다.
- Day 2에서는 새로 추가된 /indicator/rsi, /indicator/dominance, /indicator/mvrv 엔드포인트를 호출해 각 지표를 화면에 표시하려고 합니다.

[Day 2 상세 요구사항]

1. RSI 표시

   - 백엔드의 `GET /indicator/rsi` 응답(예: { "rsi": 65.3 })
   - 메인 화면 or 별도 화면(Text 위젯)으로 출력: “RSI: 65.3”
   - 가능하다면 심플한 게이지나 ProgressBar로 시각화해도 좋음(선택 사항)

2. 도미넌스(또는 알트코인 시즌 인덱스) 표시

   - 백엔드의 `GET /indicator/dominance` or `GET /indicator/altseason`
   - 예: { "dominance": 45.2 } or { "altcoin_season_index": 72 }
   - “비트코인 도미넌스: 45.2%” 형태로 표시

3. MVRV Z-score 표시
   - 백엔드의 `GET /indicator/mvrv` 응답(예: { "mvrv": 1.2 })
   - “MVRV Z-score: 1.2” 등의 텍스트 출력
   - 구체적 UI 디자인은 간단히(추후 Day 3+에서 알림·차트로 확장)

위 요구사항에 맞춰 코드를 생성해 주세요.
