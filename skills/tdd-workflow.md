# TDD 워크플로우

## TDD 사이클

```
RED → GREEN → REFACTOR → (반복)
```

| 단계 | 목표 | 행동 |
|------|------|------|
| RED | 실패하는 테스트 | 테스트 먼저 작성 |
| GREEN | 테스트 통과 | 최소한의 코드 |
| REFACTOR | 코드 개선 | 중복 제거, 구조화 |

## FIRST 원칙

| 원칙 | 의미 |
|------|------|
| Fast | 빠르게 실행 |
| Independent | 테스트 간 독립 |
| Repeatable | 반복 가능 |
| Self-validating | 자가 검증 |
| Timely | 적시 작성 |

## AAA 패턴

```typescript
it('should calculate total', () => {
  // Arrange: 준비
  const items = [{ price: 100 }];
  
  // Act: 실행
  const result = calculateTotal(items);
  
  // Assert: 검증
  expect(result).toBe(100);
});
```

## 테스트 네이밍
```typescript
// should [예상 동작] when [조건]
it('should return 0 when cart is empty', () => {});
it('should throw error when invalid', () => {});
```

## 커버리지 목표
| 영역 | 목표 |
|------|------|
| 비즈니스 로직 | 90%+ |
| 유틸 함수 | 90%+ |
| 커스텀 훅 | 80%+ |
| UI 컴포넌트 | 70%+ |
