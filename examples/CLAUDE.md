# Project: My Awesome App

이 파일은 프로젝트 루트에 위치하며, Claude Code가 프로젝트 컨텍스트를 이해하는 데 사용됩니다.

## 프로젝트 개요

- **이름**: My Awesome App
- **설명**: 직장인을 위한 점심 메이트 매칭 서비스
- **기술 스택**: Next.js 14, TypeScript, Tailwind CSS, Supabase

## 디렉토리 구조

```
src/
├── app/              # Next.js App Router 페이지
├── components/       # 공용 컴포넌트
│   ├── ui/          # 기본 UI 컴포넌트
│   └── features/    # 기능별 컴포넌트
├── hooks/           # 커스텀 훅
├── lib/             # 유틸리티, 설정
├── services/        # API 서비스
├── stores/          # 상태 관리 (Zustand)
└── types/           # TypeScript 타입
```

## 코딩 컨벤션

- 컴포넌트: PascalCase (`UserProfile.tsx`)
- 훅: camelCase with `use` prefix (`useAuth.ts`)
- 유틸: camelCase (`formatDate.ts`)
- 상수: SCREAMING_SNAKE_CASE

## 주요 명령어

```bash
npm run dev        # 개발 서버
npm run build      # 빌드
npm run test       # 테스트
npm run lint       # 린트
```

## 환경 변수

```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_KEY=
```

## 비활성화할 MCP

이 프로젝트에서 불필요한 MCP:

```json
{
  "disabledMcpServers": ["railway", "clickhouse", "stripe"]
}
```

## 참고 문서

- [기획 문서](./docs/planning.md)
- [API 명세](./docs/api.md)
- [디자인 시스템](./docs/design-system.md)

## 작업 시 주의사항

1. PR 전 `npm run lint && npm run test` 실행
2. 커밋 메시지 컨벤션 준수
3. 새 컴포넌트는 Storybook 스토리 추가
