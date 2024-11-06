import React from 'react';

export const Footer = () => {
  const currentYear = new Date().getFullYear();
  return <footer>&copy; {currentYear} Full Stack Collective</footer>;
};
