import { Head } from '@inertiajs/react';
import { Header } from '../components/Header';
import { Footer } from '../components/Footer';
import { ReactNode } from 'react';

export const DashboardLayout = ({ children }: { children: ReactNode }) => {
  return (
    <>
      <Head>
        <title>Connectient V2</title>
        <meta name="description" content="Connectient Appointment Dashboard" />
      </Head>
      <div className="p-2">
        <Header />
        {children}
        <Footer />
      </div>
    </>
  );
};
