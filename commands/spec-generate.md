# /spec-generate

자연어 요구사항을 구조화된 기능 명세서로 변환합니다.

## 실행 단계

1. 요구사항 파싱 (기능, 사용자, 성공조건)
2. 사용자 스토리 생성 (As a/I want/So that)
3. 수용 조건 작성 (Given-When-Then)
4. 화면 목록 도출
5. RICE 우선순위 제안

## 출력 형식

```markdown
# 기능 명세서: [기능명]

## 1. 개요
## 2. 사용자 스토리
## 3. 수용 조건
## 4. 화면 설계
## 5. 데이터 요구사항
## 6. 비기능 요구사항
```

## 참조 Skills
- ~/.claude/skills/service-planning.md
