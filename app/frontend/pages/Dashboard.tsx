import React from 'react';
import Header from '../components/Header';

export default function Dashboard({appointments} :{appointments: []}) {
  return (
    <>
    <Header />
    <div className="p-5">
      <h1 className="font-semibold text-2xl text-blue-800">Connectient Admin Dashboard</h1>
      {
        appointments.map(appointment =>{
          return(
            <p key={appointment.id}>{appointment.first_name}</p>
          )
        })
      }
    </div>
    </>
  );
}
