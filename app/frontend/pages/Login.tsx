import React, { ReactNode } from 'react';
import { DashboardLayout } from "../layouts/DashboardLayout";


const Login = () => {
  return <div>Login Page</div>;
};

Login.layout = (page: ReactNode) => <DashboardLayout children={page} />

export default Login