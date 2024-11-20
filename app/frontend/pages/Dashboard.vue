<script setup>
import { router } from '@inertiajs/vue3';

import { Button } from '@/components/ui/button';

const logOut = () => {
  router.delete('/logout')
}

</script>

<template>
  <Button @click="logOut">Log Out</Button>
  <h1>Hello From Dashboard</h1>
</template>