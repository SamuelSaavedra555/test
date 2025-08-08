## Components Documentation

Use this section to document UI components (React, Vue, Svelte, etc.) with live examples and usage instructions.

### Recommended approach
- Use Storybook or Ladle for interactive component docs
- Add MDX stories with inline usage examples and prop tables
- Co-locate stories next to components for easy maintenance

### Structure
- `docs/components/` — high-level guidance and additional how-to docs
- `stories/` (in repo root) — interactive stories for each component

### Example (React)
```tsx
/** Button.tsx */
import React from 'react';

type ButtonProps = {
  label: string;
  onClick?: () => void;
};

export function Button({ label, onClick }: ButtonProps) {
  return <button onClick={onClick}>{label}</button>;
}
```

```mdx
// Button.stories.mdx
import { Meta, Story, Preview, Props } from '@storybook/addon-docs';
import { Button } from './Button';

<Meta title="Components/Button" component={Button} />

# Button

Use the `Button` component to trigger actions.

## Basic usage
<Preview>
  <Story name="Default">
    <Button label="Click me" />
  </Story>
</Preview>

## Props
<Props of={Button} />
```

### Quick start (Storybook)
- `npm i -D storybook @storybook/react vite` (framework adapters as needed)
- `npx storybook init --builder vite --yes`
- Run with `npm run storybook`
