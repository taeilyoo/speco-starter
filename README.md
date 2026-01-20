# 🚀 Speco-Starter

<p align="center">
  <img src="https://img.shields.io/badge/Speco-Starter-6366F1?style=for-the-badge&logo=anthropic&logoColor=white" alt="Speco-Starter">
  <img src="https://img.shields.io/badge/Claude%20Code-Compatible-10B981?style=for-the-badge" alt="Claude Code Compatible">
</p>

<p align="center">
  <strong>🎨 UI/UX 디자인 & 서비스 기획을 위한 Claude Code 스타터 패키지</strong>
</p>

<p align="center">
  <a href="#-빠른-시작">빠른 시작</a> •
  <a href="#-구성-요소">구성 요소</a> •
  <a href="#-워크플로우">워크플로우</a> •
  <a href="#-커스터마이징">커스터마이징</a>
</p>

---

## 📋 개요

Claude Code의 자동화 시스템을 활용한 UI/UX 디자인 및 서비스 기획 스타터 패키지입니다.

### 아키텍처

| 레이어 | 역할 | 작동 방식 | 핵심 질문 |
|--------|------|-----------|-----------|
| **Skills** | 워크플로우 지침 | 참조 문서 | "어떻게" 할 것인가 |
| **Commands** | 실행 진입점 | `/명령어` 호출 | "무엇을" 할 것인가 |
| **Hooks** | 이벤트 자동화 | 특정 이벤트에 반응 | "언제" 개입할 것인가 |
| **Subagents** | 역할 분담 | 하위 에이전트 위임 | "누가" 처리할 것인가 |

## 🚀 빠른 시작

### 자동 설치

```bash
git clone https://github.com/YOUR_USERNAME/speco-starter.git
cd speco-starter
chmod +x install.sh
./install.sh
```

### 수동 설치

```bash
# 디렉토리 생성
mkdir -p ~/.claude/{skills,commands,subagents}

# 파일 복사
cp skills/* ~/.claude/skills/
cp commands/* ~/.claude/commands/
cp subagents/* ~/.claude/subagents/
```

## 📦 구성 요소

### Skills (8개)

| 파일 | 용도 |
|------|------|
| `ui-ux-guidelines.md` | UI/UX 디자인 원칙, 접근성 가이드 |
| `design-system.md` | 색상, 타이포, 간격 시스템 규격 |
| `service-planning.md` | 기획 문서 구조, RICE/MoSCoW |
| `prototype-checklist.md` | 프로토타입 품질 체크리스트 |
| `coding-standards.md` | 네이밍 컨벤션, 파일 구조 |
| `tdd-workflow.md` | TDD 사이클, AAA 패턴 |
| `security-checklist.md` | 보안 점검 항목 |
| `refactoring-principles.md` | 리팩토링 원칙, 코드 스멜 |

### Commands (10개)

| 명령어 | 용도 |
|--------|------|
| `/design-review` | 디자인 시스템 준수 검사 |
| `/flow-check` | 사용자 플로우 검증 |
| `/spec-generate` | 기능 명세서 생성 |
| `/wireframe` | ASCII 와이어프레임 생성 |
| `/a11y-audit` | 접근성(WCAG 2.1) 검사 |
| `/tdd` | TDD 워크플로우 시작 |
| `/e2e` | E2E 테스트 실행 |
| `/test-coverage` | 커버리지 분석 |
| `/security-audit` | 보안 취약점 점검 |
| `/refactor-clean` | 죽은 코드 정리 |

### Subagents (6개)

| 에이전트 | 역할 |
|----------|------|
| `ui-reviewer` | UI/UX 일관성, 접근성 검토 |
| `planner` | 기능 구현 계획 수립 |
| `flow-analyst` | 사용자 플로우 분석 |
| `spec-writer` | 기능 명세서 작성 |
| `prototype-validator` | 프로토타입 완성도 검증 |
| `security-reviewer` | 보안 취약점 분석 |

### Hooks

- **PreToolUse**: 위험 명령 경고, 장시간 실행 권고
- **PostToolUse**: 자동 포맷팅, 타입 체크, console.log 경고
- **Stop**: 최종 감사 (잔존 console.log, TODO)

## 🎯 워크플로우

### 신규 기획

```
/spec-generate → Planner → /wireframe → /flow-check
```

### 디자인 QA

```
/design-review → UI Reviewer → /a11y-audit
```

### 프로토타입 검증

```
Prototype Validator → Flow Analyst → /design-review
```

### TDD 개발

```
/tdd → /e2e → /test-coverage
```

## ⚙️ 커스터마이징

### Skills 수정

`~/.claude/skills/` 내 마크다운 파일을 프로젝트에 맞게 수정하세요.

```markdown
# ui-ux-guidelines.md

## 프로젝트 전용 색상
- Primary: #YOUR_COLOR
- ...
```

### Hooks 설정

`hooks/hooks-config.json`의 내용을 `~/.claude/settings.json`에 병합하세요.

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": { "file_pattern": "\\.(ts|tsx)$" },
        "hooks": [{ "command": "npx prettier --write $CLAUDE_FILE_PATH" }]
      }
    ]
  }
}
```

## 💡 컨텍스트 관리 팁

> **"20-30개 설정, 10개 미만 활성화, 80개 미만 도구"**

- MCP/플러그인이 많으면 실사용 컨텍스트가 70k까지 감소
- 프로젝트별로 필요한 것만 활성화

| 프로젝트 유형 | 권장 MCP |
|--------------|----------|
| 프론트엔드 | Vercel, Figma |
| 백엔드 API | Supabase, Railway |
| 풀스택 | GitHub, Vercel, Supabase |

## 📁 디렉토리 구조

```
speco-starter/
├── README.md
├── LICENSE
├── install.sh
├── skills/
│   ├── ui-ux-guidelines.md
│   ├── design-system.md
│   ├── service-planning.md
│   ├── prototype-checklist.md
│   ├── coding-standards.md
│   ├── tdd-workflow.md
│   ├── security-checklist.md
│   └── refactoring-principles.md
├── commands/
│   ├── design-review.md
│   ├── flow-check.md
│   ├── spec-generate.md
│   ├── wireframe.md
│   ├── a11y-audit.md
│   ├── tdd.md
│   ├── e2e.md
│   ├── test-coverage.md
│   ├── security-audit.md
│   └── refactor-clean.md
├── subagents/
│   ├── ui-reviewer.md
│   ├── planner.md
│   ├── flow-analyst.md
│   ├── spec-writer.md
│   ├── prototype-validator.md
│   └── security-reviewer.md
└── hooks/
    └── hooks-config.json
```

## 🤝 기여하기

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 라이선스

MIT License - 자유롭게 사용, 수정, 배포할 수 있습니다.

## 🔗 관련 링크

- [Claude Code 공식 문서](https://docs.anthropic.com/claude-code)
- [Anthropic](https://www.anthropic.com)

---

<p align="center">
  Made with ❤️ for UI/UX Designers & Service Planners
</p>
