# Git Workflow Rules

Git 사용 시 반드시 준수해야 하는 규칙입니다.

## 커밋 메시지 형식

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type (필수)

| Type | 설명 |
|------|------|
| `feat` | 새로운 기능 |
| `fix` | 버그 수정 |
| `docs` | 문서 변경 |
| `style` | 코드 포맷팅 (동작 변경 없음) |
| `refactor` | 리팩토링 |
| `test` | 테스트 추가/수정 |
| `chore` | 빌드, 설정 변경 |

### 예시

```bash
feat(auth): 소셜 로그인 기능 추가

- Google OAuth 연동
- Kakao OAuth 연동
- 로그인 상태 유지 기능

Closes #123
```

## 브랜치 전략

```
main (production)
  └── develop
        ├── feature/login-page
        ├── feature/user-profile
        └── fix/header-bug
```

### 브랜치 네이밍

| 유형 | 형식 | 예시 |
|------|------|------|
| 기능 | `feature/<name>` | `feature/social-login` |
| 버그 | `fix/<name>` | `fix/login-error` |
| 핫픽스 | `hotfix/<name>` | `hotfix/critical-bug` |
| 리팩토링 | `refactor/<name>` | `refactor/auth-module` |

## PR 규칙

### PR 제목
```
[Type] 간단한 설명
```

예: `[Feat] 소셜 로그인 기능 추가`

### PR 체크리스트
- [ ] 테스트 통과
- [ ] 코드 리뷰 완료
- [ ] 문서 업데이트 (필요시)
- [ ] 충돌 해결

## 금지 사항

- `main` 브랜치에 직접 푸시 금지
- Force push 금지 (공유 브랜치)
- 대용량 파일 커밋 금지
- `.env`, 비밀키 커밋 금지
