# /code-review

코드 품질을 리뷰하고 개선점을 제안합니다.

## 사용법

```
/code-review                    # 최근 변경 파일 리뷰
/code-review src/components/    # 특정 경로 리뷰
/code-review --staged           # staged 파일만 리뷰
```

## 리뷰 항목

1. 코드 품질 (중복, 복잡도)
2. 가독성 (네이밍, 구조)
3. 타입 안전성
4. 테스트 커버리지
5. 성능 이슈

## 출력 형식

```markdown
### 📊 리뷰 요약
점수 및 통계

### 🔴 Must Fix
### 🟡 Should Fix
### 🟢 Nice to Have
### ✅ 잘된 점
```

## 참조 Subagent
- Code Reviewer
