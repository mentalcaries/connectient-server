import { ReactNode } from "react";
import { DashboardLayout } from "../layouts/DashboardLayout";

type Appointment = {
  id: string;
  first_name: string;
};

const Dashboard = ({ appointments }: { appointments: Appointment[] }) => {
  return (
    <>
      <div className="p-5">
        <h1 className="font-semibold text-2xl text-blue-800">
          Connectient Admin Dashboard
        </h1>
        {appointments.map((appointment) => {
          return <p key={appointment.id}>{appointment.first_name}</p>;
        })}
      </div>
    </>
  );
};

Dashboard.layout = (page: ReactNode) => <DashboardLayout children={page} />

export default Dashboard