# Coding Style Rules

코드 작성 시 항상 따라야 하는 스타일 규칙입니다.

## 파일 구조

### 크기 제한
- 파일: **300줄** 초과 시 분리
- 함수: **50줄** 초과 시 분리
- 컴포넌트: **200줄** 초과 시 분리

### 임포트 순서
```typescript
// 1. 외부 라이브러리
import React from 'react';
import { useQuery } from '@tanstack/react-query';

// 2. 내부 모듈 (절대 경로)
import { Button } from '@/components/ui';
import { useAuth } from '@/hooks';

// 3. 상대 경로
import { formatDate } from './utils';

// 4. 타입
import type { User } from '@/types';
```

## 불변성 (Immutability)

```typescript
// ❌ Bad - 직접 수정
array.push(item);
object.key = value;

// ✅ Good - 새 객체 생성
const newArray = [...array, item];
const newObject = { ...object, key: value };
```

## 네이밍

| 유형 | 규칙 | 예시 |
|------|------|------|
| 컴포넌트 | PascalCase | `UserProfile.tsx` |
| 함수/변수 | camelCase | `getUserById` |
| 상수 | SCREAMING_SNAKE | `MAX_RETRY_COUNT` |
| 타입/인터페이스 | PascalCase | `UserData` |
| Boolean | is/has/can/should | `isLoading`, `hasPermission` |

## 금지 사항

- `any` 타입 사용 금지
- `console.log` 커밋 금지 (디버깅 후 제거)
- Magic Number 금지 (상수로 추출)
- 3단계 이상 중첩 금지 (Early Return 사용)

## 주석

```typescript
// ✅ Good - 왜(Why)를 설명
// 레거시 API 호환을 위해 snake_case 유지
const user_name = response.user_name;

// ❌ Bad - 무엇(What)을 설명 (코드로 알 수 있음)
// 이름을 가져온다
const name = getName();
```
