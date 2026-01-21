# Frontend Patterns

프론트엔드 개발 시 참조하는 패턴과 모범 사례입니다.

## 컴포넌트 설계

### 컴포넌트 분류

| 유형 | 설명 | 예시 |
|------|------|------|
| UI 컴포넌트 | 순수 표현, 상태 없음 | Button, Card, Input |
| 컨테이너 | 로직 + 데이터 페칭 | UserListContainer |
| 페이지 | 라우트 단위 | HomePage, ProfilePage |
| 레이아웃 | 공통 구조 | MainLayout, AuthLayout |

### 컴포넌트 구조

```typescript
// 1. Imports
import { useState } from 'react';
import { Button } from '@/components/ui';

// 2. Types
interface Props {
  title: string;
  onSubmit: (data: FormData) => void;
}

// 3. Component
export function MyComponent({ title, onSubmit }: Props) {
  // 3a. Hooks
  const [value, setValue] = useState('');
  
  // 3b. Handlers
  const handleSubmit = () => {
    onSubmit({ value });
  };
  
  // 3c. Render
  return (
    <div>
      <h1>{title}</h1>
      <Button onClick={handleSubmit}>Submit</Button>
    </div>
  );
}
```

## 상태 관리

### 상태 분류

| 유형 | 관리 방법 | 예시 |
|------|----------|------|
| UI 상태 | useState | 모달 열림, 탭 선택 |
| 서버 상태 | TanStack Query | API 데이터 |
| URL 상태 | useSearchParams | 필터, 페이지 |
| 전역 상태 | Zustand/Jotai | 사용자 정보, 테마 |

### TanStack Query 패턴

```typescript
// 조회
const { data, isLoading, error } = useQuery({
  queryKey: ['users', userId],
  queryFn: () => fetchUser(userId),
  staleTime: 5 * 60 * 1000, // 5분
});

// 수정
const mutation = useMutation({
  mutationFn: updateUser,
  onSuccess: () => {
    queryClient.invalidateQueries({ queryKey: ['users'] });
  },
});
```

## 폼 처리

### React Hook Form + Zod

```typescript
const schema = z.object({
  email: z.string().email('이메일 형식이 아닙니다'),
  password: z.string().min(8, '8자 이상 입력하세요'),
});

const { register, handleSubmit, formState: { errors } } = useForm({
  resolver: zodResolver(schema),
});
```

## 성능 최적화

### 렌더링 최적화

```typescript
// 메모이제이션
const MemoizedComponent = memo(ExpensiveComponent);

// 콜백 메모이제이션
const handleClick = useCallback(() => {
  doSomething(id);
}, [id]);

// 값 메모이제이션
const computedValue = useMemo(() => {
  return expensiveCalculation(data);
}, [data]);
```

### 코드 분할

```typescript
// 동적 임포트
const HeavyComponent = lazy(() => import('./HeavyComponent'));

// 사용
<Suspense fallback={<Loading />}>
  <HeavyComponent />
</Suspense>
```

## 에러 처리

### Error Boundary

```typescript
<ErrorBoundary fallback={<ErrorFallback />}>
  <MyComponent />
</ErrorBoundary>
```

### API 에러 처리

```typescript
const { error } = useQuery({...});

if (error) {
  if (error.status === 401) return <LoginRedirect />;
  if (error.status === 404) return <NotFound />;
  return <GenericError />;
}
```

## 테스트

### 컴포넌트 테스트

```typescript
import { render, screen, fireEvent } from '@testing-library/react';

it('should call onSubmit when button clicked', () => {
  const onSubmit = vi.fn();
  render(<MyForm onSubmit={onSubmit} />);
  
  fireEvent.click(screen.getByRole('button', { name: '제출' }));
  
  expect(onSubmit).toHaveBeenCalled();
});
```
