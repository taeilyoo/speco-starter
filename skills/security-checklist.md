# 보안 점검 체크리스트 (Security Checklist)

## 인증 (Authentication)

### 비밀번호 정책
- [ ] 최소 길이: 8자 이상
- [ ] 복잡도: 대문자, 소문자, 숫자, 특수문자 조합
- [ ] 비밀번호 해싱: bcrypt, argon2 사용 (MD5, SHA1 금지)
- [ ] Salt 사용

### 세션 관리
- [ ] 세션 ID: 충분히 긴 랜덤 값 사용
- [ ] 세션 만료: 적절한 타임아웃 설정
- [ ] 로그아웃 시 세션 완전 삭제

### 토큰 보안 (JWT)
- [ ] 안전한 서명 알고리즘: HS256+ 또는 RS256
- [ ] 적절한 만료 시간
- [ ] 민감 정보 제외

## 인가 (Authorization)

### 접근 제어
- [ ] 역할 기반 접근 제어 (RBAC)
- [ ] 최소 권한 원칙
- [ ] 모든 API 엔드포인트 권한 검사

## 입력 검증 (Input Validation)

### SQL Injection 방지
```typescript
// Bad
const query = `SELECT * FROM users WHERE id = '${userId}'`;

// Good: Parameterized Query
const query = 'SELECT * FROM users WHERE id = ?';
db.query(query, [userId]);
```

### XSS 방지
- [ ] 출력 인코딩
- [ ] Content Security Policy (CSP)
- [ ] sanitize 라이브러리 사용

## 민감 정보 보호

### 노출 금지 항목
- [ ] API 키, 비밀 키
- [ ] 데이터베이스 자격 증명
- [ ] 개인 식별 정보 (PII)

### 환경 변수 관리
```bash
# .env (버전 관리 제외)
API_SECRET_KEY=...

# .env.example (버전 관리 포함)
API_SECRET_KEY=your-secret-key-here
```

## 의존성 보안

```bash
npm audit
npm audit fix
```

## API 보안

### Rate Limiting
- [ ] 요청 빈도 제한
- [ ] IP 기반 제한

### HTTP 보안 헤더
```typescript
import helmet from 'helmet';
app.use(helmet());
```
