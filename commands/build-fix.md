# /build-fix

빌드 에러를 자동으로 분석하고 해결합니다.

## 실행 단계

### 1. 에러 수집
```bash
npm run build 2>&1
tsc --noEmit
```

### 2. 에러 분류 및 분석
- Type Error
- Module Not Found
- Syntax Error
- Lint Error

### 3. 자동 수정 적용

### 4. 검증
```bash
npm run build
```

## 출력 형식

```markdown
### 📊 에러 요약
| 유형 | 수량 | 상태 |

### 🔧 수정 내역
파일별 수정 사항

### ✅ 검증 결과
```

## 참조 Subagent
- Build Error Resolver
