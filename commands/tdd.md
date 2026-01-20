# /tdd

TDD(Test-Driven Development) 워크플로우를 시작합니다.

## 워크플로우

```
RED → GREEN → REFACTOR → (반복)
```

1. **RED**: 실패하는 테스트 작성
2. **GREEN**: 테스트 통과하는 최소 코드
3. **REFACTOR**: 코드 개선 (테스트 유지)

## AAA 패턴

```typescript
it('should...', () => {
  // Arrange: 준비
  // Act: 실행
  // Assert: 검증
});
```

## 참조 Skills
- ~/.claude/skills/tdd-workflow.md
