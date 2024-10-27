// app/frontend/entrypoints/application.tsx
import React from 'react';
import { createRoot } from 'react-dom/client';
import App from '../App'; // We'll create this next

// Wait for DOM to load
document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('root');
  if (container) {
    const root = createRoot(container);
    root.render(
      <React.StrictMode>
        <App />
      </React.StrictMode>
    );
  }
});
