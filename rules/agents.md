# Agents (Subagents) Rules

Subagent 위임 시 따라야 하는 규칙입니다.

## 언제 Subagent를 사용하는가?

### 위임이 필요한 상황

| 상황 | 권장 Subagent |
|------|--------------|
| 보안 취약점 분석 | Security Reviewer |
| 코드 품질 리뷰 | Code Reviewer |
| 기능 구현 계획 | Planner |
| 시스템 설계 결정 | Architect |
| UI/UX 일관성 검토 | UI Reviewer |
| 플로우 분석 | Flow Analyst |
| 프로토타입 검증 | Prototype Validator |
| 기능 명세 작성 | Spec Writer |

### 위임하지 않는 상황

- 단순한 코드 수정
- 명확한 버그 수정
- 간단한 질문 응답
- 파일 생성/삭제

## Subagent 위임 원칙

### 1. 명확한 범위 설정
```
// ✅ Good
"Security Reviewer로서 이 PR의 인증 로직만 검토해줘"

// ❌ Bad  
"보안 리뷰해줘"
```

### 2. 필요한 컨텍스트 전달
```
// ✅ Good
"Planner로서 좋아요 기능 구현 계획 세워줘.
 - 백엔드: Supabase 사용
 - 프론트: React + TanStack Query
 - 실시간 업데이트 필요"
```

### 3. 결과물 형식 지정
```
// ✅ Good
"UI Reviewer로서 검토하고, 
 Critical/Warning/Info로 분류해서 테이블로 정리해줘"
```

## Subagent 권한 매트릭스

| Subagent | 읽기 | 쓰기 | 실행 |
|----------|------|------|------|
| Planner | ✅ | ❌ | ❌ |
| Architect | ✅ | ❌ | ❌ |
| Security Reviewer | ✅ | ❌ | 제한적 |
| UI Reviewer | ✅ | ❌ | ❌ |
| Spec Writer | ✅ | 문서만 | ❌ |

## 컨텍스트 보존

Subagent 작업은 메인 컨텍스트를 점유하지 않습니다.
복잡한 분석 작업은 Subagent에게 위임하여 메인 컨텍스트를 보존하세요.
