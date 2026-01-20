# 디자인 시스템 규격

## 색상 체계

### Primary Colors
```css
--color-primary-50:  #EEF2FF;
--color-primary-100: #E0E7FF;
--color-primary-500: #6366F1;  /* 기본 */
--color-primary-600: #4F46E5;  /* 호버 */
--color-primary-700: #4338CA;  /* 액티브 */
```

### Semantic Colors
```css
--color-success: #10B981;
--color-warning: #F59E0B;
--color-error:   #EF4444;
--color-info:    #3B82F6;
```

### Neutral (Gray Scale)
```css
--color-gray-50:  #F9FAFB;  /* 페이지 배경 */
--color-gray-200: #E5E7EB;  /* 테두리 */
--color-gray-500: #6B7280;  /* 보조 텍스트 */
--color-gray-700: #374151;  /* 본문 텍스트 */
--color-gray-900: #111827;  /* 제목 텍스트 */
```

## 타이포그래피

| 용도 | 크기 | 굵기 | 행간 |
|------|------|------|------|
| Display | 36px | 700 | 1.2 |
| H1 | 30px | 600 | 1.3 |
| H2 | 24px | 600 | 1.3 |
| H3 | 20px | 600 | 1.4 |
| Body | 16px | 400 | 1.5 |
| Small | 14px | 400 | 1.5 |
| Tiny | 12px | 400 | 1.4 |

## 간격 (Spacing)
```css
--space-1:  4px;
--space-2:  8px;
--space-3:  12px;
--space-4:  16px;
--space-6:  24px;
--space-8:  32px;
--space-12: 48px;
--space-16: 64px;
```

## 그림자 (Shadows)
```css
--shadow-sm: 0 1px 3px rgba(0,0,0,0.1);
--shadow-md: 0 4px 6px rgba(0,0,0,0.1);
--shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
--shadow-xl: 0 20px 25px rgba(0,0,0,0.1);
```

## 모서리 반경
```css
--radius-sm:  2px;
--radius-md:  4px;
--radius-lg:  8px;
--radius-xl:  12px;
--radius-full: 9999px;
```

## 애니메이션
```css
--duration-fast: 150ms;
--duration-normal: 300ms;
--duration-slow: 500ms;
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
```
