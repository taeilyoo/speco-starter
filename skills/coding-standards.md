# 코딩 표준 (Coding Standards)

## 네이밍 컨벤션

| 유형 | 컨벤션 | 예시 |
|------|--------|------|
| 컴포넌트 파일 | PascalCase | UserProfile.tsx |
| 유틸 파일 | camelCase | formatDate.ts |
| 변수/함수 | camelCase | userName, getUserById |
| 상수 | SCREAMING_SNAKE | MAX_RETRY_COUNT |
| 타입/인터페이스 | PascalCase | UserData |

### Boolean 네이밍
```typescript
const isLoading = true;
const hasPermission = false;
const canEdit = true;
```

### 이벤트 핸들러
```typescript
// Props: on + 동사
onSubmit, onClick, onChange

// 함수: handle + 명사 + 동작
handleFormSubmit, handleButtonClick
```

## 파일 구조
```
src/
├── components/    # 공용 컴포넌트
├── features/      # 기능별 모듈
├── hooks/         # 커스텀 훅
├── services/      # API 서비스
├── stores/        # 상태 관리
├── types/         # 공용 타입
├── utils/         # 유틸리티
└── constants/     # 상수
```

## 파일 크기 제한
- 파일: 300줄 초과 금지
- 함수: 50줄 이내 권장

## 금지 사항
- console.log (PR 전 제거)
- Magic Number/String (상수로 추출)
- 3단계 이상 중첩 (Early return 사용)
- any 타입 사용
