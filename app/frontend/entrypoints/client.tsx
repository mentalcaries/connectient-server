// app/frontend/entrypoints/client.tsx
import React from 'react';
import { hydrateRoot } from 'react-dom/client';
import { Login } from '../components/auth/Login';

declare global {
  interface Window {
    __INITIAL_PROPS__: any; // Type this according to your props
  }
}

const rootElement = document.getElementById('root');
if (rootElement) {
  const props = window.__INITIAL_PROPS__;
  hydrateRoot(rootElement, <Login {...props} />);
}

