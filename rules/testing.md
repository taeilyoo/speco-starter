# Testing Rules

테스트 작성 시 반드시 준수해야 하는 규칙입니다.

## TDD 워크플로우

```
RED → GREEN → REFACTOR
```

1. **RED**: 실패하는 테스트 먼저 작성
2. **GREEN**: 테스트 통과하는 최소 코드 작성
3. **REFACTOR**: 코드 개선 (테스트 유지)

## 커버리지 요구사항

| 영역 | 최소 커버리지 |
|------|-------------|
| 비즈니스 로직 | **90%** |
| 유틸 함수 | **90%** |
| 커스텀 훅 | **80%** |
| API 서비스 | **80%** |
| UI 컴포넌트 | **70%** |
| **전체** | **80%** |

## 테스트 구조 (AAA 패턴)

```typescript
it('should calculate total price with discount', () => {
  // Arrange - 준비
  const items = [{ price: 100 }, { price: 200 }];
  const discount = 0.1;
  
  // Act - 실행
  const result = calculateTotal(items, discount);
  
  // Assert - 검증
  expect(result).toBe(270);
});
```

## 테스트 네이밍

```typescript
// should [예상 동작] when [조건]
it('should return empty array when input is null', () => {});
it('should throw error when user is not authenticated', () => {});
```

## 필수 테스트 케이스

- [ ] Happy Path (정상 케이스)
- [ ] Edge Cases (경계값)
- [ ] Error Cases (에러 상황)
- [ ] Empty/Null Cases

## 금지 사항

- 스냅샷 테스트만으로 컴포넌트 테스트 완료 금지
- Mock만 검증하고 실제 로직 검증 누락 금지
- 테스트 간 의존성 금지 (독립 실행 가능해야 함)
