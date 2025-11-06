---
trigger: always_on
---

 Design Decisions

# Backend Development Guide

### Model Development
- Inherit from `BaseAbstractModel` in `core.models`
- Place business logic in service layer

### Service Layer
- Create services in `[app]/services/[domain]_service.py`
- Keep services stateless and focused
- Handle all business logic here

### ViewSet DevelopmentS
- Inherit from `AbstractModelViewset`
- Keep viewsets thin (HTTP layer only)
- Delegate to service layer

### API Documentation
- Update `api-specs.yml` for new endpoints
- Document request/response schemas
- Include error responses

# Frontend Development Guide

## Technology Stack

- **Framework**: React 18+ with Vite
- **UI Components**: shadcn/ui (Radix + TailwindCSS)
- **Forms**: React Hook Form with Zod validation
- **Routing**: React Router (declarative approach)
- **State Management**: React Context API (Zustand for complex state)
- **Styling**: TailwindCSS with shadcn/ui components
- **API Client**: Axios with interceptors

## Project Structure

- `src/components/` - Reusable UI components
  - `ui/` - shadcn/ui components
  - `layout/` - Layout components
- `src/features/` - Feature-based modules
  - `[feature-name]/`
    - `components/` - Feature-specific components
    - `hooks/` - Custom hooks
    - `types/` - TypeScript types
    - `index.tsx` - Main feature component
- `src/lib/` - Utilities and configs
  - `api/` - API client and services
  - `utils/` - Helper functions
- `src/pages/` - Page components
- `src/routes/` - Route configurations

## Component Development

### shadcn/ui Components
- Use shadcn/ui as the base component library
- Extend/customize with Tailwind classes
- Follow composition pattern for complex components
- Keep components small and focused

### Form Handling
- Define form schemas with Zod
- Use `useForm` with `zodResolver`
- Leverage shadcn form components
- Implement proper validation and error handling
- Group related fields in field arrays when needed

## Routing

- Use `createBrowserRouter` for type-safe routes
- Implement route loaders for data fetching
- Use `Outlet` for nested layouts
- Handle 404 and error states
- Implement route-based code splitting

## API Integration

- Centralized Axios instance with interceptors
- Handle authentication tokens automatically
- Global error handling
- Type-safe API responses
- React Query for server state management

## State Management

- **Local State**: `useState` for simple state, `useReducer` for complex logic
- **Global State**: Use Zustand for global state management
- **Server State**: React Query for API data
- **URL State**: Use URL params for shareable states

## Styling Guidelines

- Use Tailwind utility classes directly
- Follow mobile-first responsive design
- Use CSS variables for theming
- Keep consistent spacing and typography scales
- Use semantic HTML elements

## Best Practices

### Type Safety
- Use TypeScript for all components
- Define types for all props and API responses
- Use `z.infer` for form types

### Performance
- Code split with React.lazy and Suspense
- Memoize expensive calculations
- Avoid unnecessary re-renders
- Use `React.memo` for pure components

### Testing
- Unit test utility functions with Jest
- Component tests with React Testing Library 
- Mock API responses in tests
- Test critical user flows

## Development Workflow

### Commands
- `npm run dev` - Start dev server
- `npm run build` - Production build
- `npm run preview` - Preview production build
- `npx shadcnui@latest add [component]` - Add new component
- `npm run lint` - Lint code
- `npm run format` - Format code


## VS Code Extensions
- ESLint
- Prettier
- Tailwind CSS IntelliSense
- TypeScript/JavaScript features
- Path Intellisense