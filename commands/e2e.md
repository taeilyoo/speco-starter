# /e2e

E2E(End-to-End) 테스트를 실행하고 결과를 분석합니다.

## 실행

```bash
# Playwright
npx playwright test

# Cypress
npx cypress run
```

## 선택자 우선순위
1. data-testid (권장)
2. role + name
3. label
4. CSS 선택자 (최후)

## 출력 형식

```markdown
## E2E 테스트 결과

### 📊 요약
| 총 테스트 | 통과 | 실패 | 성공률 |

### ❌ 실패한 테스트 상세
```
