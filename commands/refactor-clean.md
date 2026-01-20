# /refactor-clean

죽은 코드, 불필요한 파일을 정리합니다.

## 실행 단계

### 1. 죽은 코드 탐지
- 사용되지 않는 함수/변수
- 호출되지 않는 export
- 주석 처리된 코드

### 2. 불필요한 파일 식별
- 참조되지 않는 파일
- 빈 파일, 중복 파일

### 3. 코드 스멜 탐지
- 300줄 초과 파일
- 50줄 초과 함수
- 깊은 중첩 (3단계+)

### 4. 리팩토링 계획 수립

## 탐지 도구

```bash
# 사용되지 않는 export
npx ts-prune

# 참조되지 않는 파일
npx unimported

# 중복 코드
npx jscpd src/
```

## 출력 형식

```markdown
### 📊 요약
| 항목 | 수량 |

### 🗑️ 삭제 권장
### 📏 크기 초과 파일
### 🔄 중복 코드
```

## 참조 Skills
- ~/.claude/skills/refactoring-principles.md
