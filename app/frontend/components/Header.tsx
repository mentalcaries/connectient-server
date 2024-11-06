import { router } from '@inertiajs/react';
import React from 'react';

export const Header = () => {
  const handleLogout = () => {
    router.delete('/logout');
  };

  return (
    <header className="flex justify-between">
      Header Logo Here
      <button onClick={handleLogout}>Log out</button>
    </header>
  );
};
