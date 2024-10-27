// app/frontend/entrypoints/ssr.tsx
import React from 'react';
import ReactDOMServer from 'react-dom/server';
import { Login } from '../components/auth/Login';

interface SSRProps {
  name: string;
  props: {
    csrf_token: string;
    // other props...
  };
}

export function render({ name, props }: SSRProps) {
  // We'll enhance this to handle different components later
  if (name === 'Auth/Login') {
    return ReactDOMServer.renderToString(<Login {...props} />);
  }
  throw new Error(`Unknown component: ${name}`);
}
