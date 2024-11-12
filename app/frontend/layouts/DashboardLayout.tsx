import { Head } from '@inertiajs/react';
import { Footer } from '../components/Footer';
import { ReactNode } from 'react';

export const DashboardLayout = ({ children }: { children: ReactNode }) => {
  return (
    <>
      <Head>
        <title>Connectient V2</title>
        <meta name="description" content="Connectient Appointment Dashboard" />
      </Head>
      <div className="p-5">
        {children}
        <Footer />
      </div>
    </>
  );
};
