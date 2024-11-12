import React, { ReactNode, useState, useTransition } from 'react';
import { DashboardLayout } from '../layouts/DashboardLayout';
import { router } from '@inertiajs/react';
import * as z from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useForm } from 'react-hook-form';

import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form';
import { Input } from '@/components/ui/input';

import { Button } from '@/components/ui/button';

type LoginProps = {
  message: {
    error?: string;
  };
};

const formSchema = z.object({
  email: z.string().email('Not a valid email'),
  password: z.string().min(8, 'Password should be atleast 8 chars long'),
});

const Login = ({ message }: LoginProps) => {
  // const [loginDetails, setLoginDetails] = useState({
  //   email: '',
  //   password: '',
  // });
  const [isFormSubmitted, setIsFormSubmitted] = useState(false);
  const [, startTransition] = useTransition();

  const defaultValues = {
    email: '',
    password: '',
  };

  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues,
    mode: 'onChange',
  });

  const handleLoginSubmit = (loginDetails: typeof defaultValues) => {
    // event.preventDefault();
    router.post('/login', loginDetails);
  };

  const onSubmit = ({ email, password }: z.infer<typeof formSchema>) => {
    setIsFormSubmitted(true);

    startTransition(() => {
      // Authenticate the user
      handleLoginSubmit({ email, password });
    });
  };

  return (
    <main className="flex-1 flex flex-col justify-center items-center">
      <h1 className="mt-8 mb-6 w-full max-w-lg text-4xl font-semibold  text-center md:leading-snug">
        Unlock the Gateway to{' '}
        <span className="w-full text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-rose-500">
          Seamless Scheduling
        </span>
      </h1>
      <Form {...form}>
        <form
          onSubmit={(event) => void form.handleSubmit(onSubmit)(event)}
          className="p-4 w-full max-w-md border bg-background rounded-lg flex flex-col gap-4"
        >
          {/* Email */}
          <FormField
            control={form.control}
            name="email"
            render={({ field }) => (
              <FormItem className="flex flex-col gap-1">
                <FormLabel className="text-lg">
                  <span className="after:content-['*'] after:ml-0.5 after:text-red-500">
                    Email
                  </span>
                </FormLabel>
                <FormControl>
                  <Input type="email" {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />
          {/* Password */}
          <FormField
            control={form.control}
            name="password"
            render={({ field }) => (
              <FormItem className="flex flex-col gap-1">
                <FormLabel className="text-lg">
                  <span className="after:content-['*'] after:ml-0.5 after:text-red-500">
                    Password
                  </span>
                </FormLabel>
                <FormControl>
                  <Input type="password" {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />
          <Button
            type="submit"
            className="mt-4 w-full text-lg"
            disabled={
              !form.formState.isDirty ||
              (form.formState.isDirty && !form.formState.isValid)
            }
          >
            Login
          </Button>
        </form>
      </Form>
    </main>
  );
};

Login.layout = (page: ReactNode) => <DashboardLayout children={page} />;

export default Login;
