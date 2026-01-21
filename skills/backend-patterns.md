# Backend Patterns

백엔드 개발 시 참조하는 패턴과 모범 사례입니다.

## API 설계

### RESTful 엔드포인트

| 메서드 | 경로 | 설명 |
|--------|------|------|
| GET | /users | 목록 조회 |
| GET | /users/:id | 단일 조회 |
| POST | /users | 생성 |
| PUT | /users/:id | 전체 수정 |
| PATCH | /users/:id | 부분 수정 |
| DELETE | /users/:id | 삭제 |

### 응답 형식

```typescript
// 성공
{
  "success": true,
  "data": { ... },
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}

// 에러
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "이메일 형식이 올바르지 않습니다",
    "details": [...]
  }
}
```

### HTTP 상태 코드

| 코드 | 용도 |
|------|------|
| 200 | 성공 |
| 201 | 생성 성공 |
| 204 | 삭제 성공 (본문 없음) |
| 400 | 잘못된 요청 |
| 401 | 인증 필요 |
| 403 | 권한 없음 |
| 404 | 리소스 없음 |
| 422 | 유효성 검사 실패 |
| 500 | 서버 에러 |

## 데이터베이스

### 쿼리 최적화

```typescript
// ❌ N+1 문제
const users = await db.user.findMany();
for (const user of users) {
  user.posts = await db.post.findMany({ where: { userId: user.id } });
}

// ✅ 관계 포함 조회
const users = await db.user.findMany({
  include: { posts: true }
});
```

### 트랜잭션

```typescript
await db.$transaction(async (tx) => {
  const user = await tx.user.create({ data: userData });
  await tx.profile.create({ data: { userId: user.id, ...profileData } });
});
```

## 인증/인가

### JWT 구조

```typescript
// Access Token: 짧은 만료 (15분)
// Refresh Token: 긴 만료 (7일), httpOnly 쿠키

interface JWTPayload {
  sub: string;      // userId
  email: string;
  role: string;
  iat: number;
  exp: number;
}
```

### 미들웨어 패턴

```typescript
const authMiddleware = async (req, res, next) => {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'No token' });
  
  try {
    const payload = verifyToken(token);
    req.user = payload;
    next();
  } catch {
    return res.status(401).json({ error: 'Invalid token' });
  }
};
```

## 에러 처리

### 커스텀 에러 클래스

```typescript
class AppError extends Error {
  constructor(
    public code: string,
    public message: string,
    public statusCode: number = 400
  ) {
    super(message);
  }
}

// 사용
throw new AppError('USER_NOT_FOUND', '사용자를 찾을 수 없습니다', 404);
```

## 캐싱

| 데이터 유형 | TTL | 전략 |
|-------------|-----|------|
| 사용자 세션 | 15분 | Write-through |
| 게시글 목록 | 5분 | Cache-aside |
| 설정 데이터 | 1시간 | Read-through |
