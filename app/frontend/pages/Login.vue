<script setup>
import { ref } from 'vue';
import { toTypedSchema } from '@vee-validate/zod';
import * as z from 'zod';
import { router } from '@inertiajs/vue3';

import { Button } from '@/components/ui/button';
import { Label } from '@/components/ui/label';
import { Input } from '@/components/ui/input';
import { cn } from '@/lib/utils';
import { Loader } from 'lucide-vue-next';
import {
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form';
import { useForm } from 'vee-validate';

defineProps({ errors: Object });

const loginFormSchema = toTypedSchema(
  z.object({
    email: z.string().email(),
    password: z.string().min(6),
  })
);

const form = useForm({ validationSchema: loginFormSchema });

const isLoading = ref(false);

// const resetFormLoading = () => {
//   isLoading.value = false;
//   loginError.value = '';
// };

const onSubmit = form.handleSubmit((values) => {
  isLoading.value = true;
  router.post('/sign_in', values, {
    onFinish: () => {
      isLoading.value = false;
    },
  });
});
</script>

<template>
  <div class="max-w-md mx-auto my-8">
    <h1 class="my-8 font-bold text-2xl">Login to Your Dashboard</h1>
    <form @submit="onSubmit">
      <div class="grid gap-8">
        <div class="grid gap-5">
          <FormField v-slot="{ componentField }" name="email">
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input
                  type="email"
                  placeholder="hello@connectient.co"
                  v-bind="componentField"
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          </FormField>
          <FormField v-slot="{ componentField }" name="password">
            <FormItem>
              <FormLabel>Password</FormLabel>
              <FormControl>
                <Input type="password" v-bind="componentField" />
              </FormControl>
              <FormMessage />
            </FormItem>
          </FormField>
        </div>
        <Button :disabled="isLoading">
          <Loader v-if="isLoading" class="mr-2 h-4 w-4 animate-spin" />
          Sign In with Email
        </Button>
      </div>
    </form>
    <p
      v-if="errors?.message || !isLoading"
      class="text-sm text-destructive mt-5 text-center"
    >
      {{ errors?.message }}
    </p>
  </div>
</template>
