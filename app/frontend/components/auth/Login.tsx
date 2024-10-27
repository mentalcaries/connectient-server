// app/frontend/components/auth/Login.tsx
import React from 'react'

interface LoginProps {
  csrf_token: string;
}

export function Login({ csrf_token }: LoginProps) {
  return (
    <div>
      <h1>Login</h1>
      <form>
        <input type="hidden" name="authenticity_token" value={csrf_token} />
        <div>
          <input type="email" name="email" placeholder="Email" />
        </div>
        <div>
          <input type="password" name="password" placeholder="Password" />
        </div>
        <button type="submit">Sign In</button>
      </form>
    </div>
  )
}