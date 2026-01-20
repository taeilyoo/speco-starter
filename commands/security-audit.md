# /security-audit

보안 취약점을 점검합니다.

## 실행 단계

### 1. 의존성 취약점 스캔
```bash
npm audit
```

### 2. 코드 정적 분석
- 하드코딩된 비밀 탐지
- SQL/NoSQL Injection 패턴
- XSS 취약 패턴

### 3. 설정 검토
- 환경 변수 관리
- CORS / 보안 헤더

## 출력 형식

```markdown
### 📊 요약
| 심각도 | 수량 |
|--------|------|
| 🔴 Critical | |
| 🟠 High | |
| 🟡 Medium | |

### 상세 내용
위치, 취약점, 해결 방안
```

## 참조 Skills
- ~/.claude/skills/security-checklist.md
