# Component Documentation

## [Component Name]

[Brief description of what this component does]

### Props / Parameters

| Prop/Parameter | Type | Required | Default | Description |
|----------------|------|----------|---------|-------------|
| prop1 | string | Yes | - | Description of prop1 |
| prop2 | number | No | 0 | Description of prop2 |
| onEvent | function | No | - | Callback when event occurs |

### Usage

#### Basic Example

```[language]
<ComponentName 
  prop1="value"
  prop2={42}
/>
```

#### With All Options

```[language]
<ComponentName 
  prop1="value"
  prop2={42}
  onEvent={(data) => console.log(data)}
/>
```

### Examples

#### Example 1: [Use Case]

[Description of use case]

```[language]
[code example]
```

#### Example 2: [Another Use Case]

[Description of use case]

```[language]
[code example]
```

### Styling

[If applicable]

**CSS Classes:**
- `.component-name`: Main container
- `.component-name__element`: Sub-element

**CSS Variables:**
- `--component-bg`: Background color
- `--component-border`: Border color

**Example:**
```css
.component-name {
  --component-bg: #ffffff;
  --component-border: #cccccc;
}
```

### Accessibility

[Accessibility considerations]

- Keyboard navigation: [description]
- Screen reader support: [description]
- ARIA attributes: [description]

### State Management

[If component has internal state]

**Internal State:**
- `state1`: [description]
- `state2`: [description]

### Events

[If component emits events]

| Event | Payload | Description |
|-------|---------|-------------|
| event1 | {data} | When X happens |
| event2 | {data} | When Y happens |

### Slots / Children

[If component accepts children/slots]

**Slots:**
- `default`: Main content
- `header`: Header content
- `footer`: Footer content

### Notes

[Important notes, gotchas, or warnings]

- Note 1
- Note 2

### Related Components

- [Related Component 1](./component1.md)
- [Related Component 2](./component2.md)

### See Also

- [Pattern Guide](./patterns.md)
- [Styling Guide](./styling.md)
