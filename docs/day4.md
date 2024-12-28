[프로젝트 개요]
- Day 3까지 WebSocket으로 실시간 시세를 화면에 표시했습니다.
- Day 4에서는 사용자가 직접 “알림 조건”을 설정하고, 백엔드로 전송하여,
  특정 시세나 지표가 충족되면 푸시 알림을 받을 수 있도록 UI와 로직을 구현합니다.
- 또한 FCM(푸시 알림) 연동하여 앱에서 푸시를 수신하는 부분도 초안으로 잡습니다.

[Day 4 상세 요구사항]

1) 알림 조건 설정 UI
   -`NotificationSettingsScreen`에서 사용자에게 조건 입력받기
     - Type(“가격”, “RSI”, “프리미엄” 등) → Dropdown
     - Threshold → TextField
     - Direction(above/below) → Switch or Radio
   - “저장” 버튼 클릭 시, 백엔드 `/alerts/condition`에 POST
     - 성공 시, 조건 목록에 추가 표시

2) 알림 목록/관리 화면
   - 현재 등록된 조건을 백엔드에서 GET해서 목록 표시
   - 필요하면 삭제 기능(“X” 버튼 클릭 시 DELETE /alerts/condition/:id)

3) FCM(푸시 알림) 연동 초안
   - 앱 최초 실행 시 알림 권한 요청(iOS), FCM Token 발급
   - 받은 Token을 백엔드에 `POST /users/token` 등으로 전달 → 백엔드가 알림 발송 시 사용
   - Day 4에서는 알림 수신 시 콘솔에 “Push Received” 정도만 출력
   - Day 5에서 알림 UI(Toast, Notification Tray 등) 세부 설정

4) 코드 구조
   - `pubspec.yaml`: firebase_messaging 추가
   - main.dart: Firebase 초기화, 권한 요청

5) 최종 결과
   - 앱 실행 후 AlertSettingsPage에서 “BTC 가격 above 30000000” 등 조건 등록 → 백엔드
   - 시세 충족 시 백엔드가 FCM Push → Flutter 앱에 알림 이벤트 발생(콘솔 로그 또는 Notification Tray)
   - Day 5에서 알림 UI, 소리, 메시지 형태를 개선

[추가 요청사항]
- FCM 초기 설정(AndroidManifest, Info.plist 등)이나 iOS 권한 설정 설명도 간단히 언급해 주세요.
- 실제 테스트 시나리오(“Price > 30,000,000” 등록 후 시세가 올라갈 때 알림 발생)도 설명해 주세요.

위 요구사항에 맞춰 코드를 생성해 주세요.
