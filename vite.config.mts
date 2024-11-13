import vue from '@vitejs/plugin-vue';
import { defineConfig } from 'vite';
import RubyPlugin from 'vite-plugin-ruby';
import autoprefixer from 'autoprefixer';
import { fileURLToPath, URL } from 'node:url';

import tailwind from 'tailwindcss';

export default defineConfig({
  plugins: [vue(), RubyPlugin()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./app/frontend', import.meta.url)),
    },
  },
  css: {
    postcss: {
      plugins: [tailwind(), autoprefixer()],
    },
  },
});
