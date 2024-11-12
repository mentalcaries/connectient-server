import { router } from '@inertiajs/react';
import logo from '../assets/images/connectient-logo.png';
import { Button } from './ui/button';

export const Header = ({ isLoggedIn }: { isLoggedIn: boolean }) => {
  const handleLogout = () => {
    router.delete('/logout');
  };

  return (
    <header className="flex justify-between">
      <img
        src={logo}
        alt="Connectient Logo"
        className='className="w-36 md:w-44'
      />
      {isLoggedIn && <Button onClick={handleLogout}>Log out</Button>}
    </header>
  );
};
