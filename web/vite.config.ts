import path from 'path';
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    proxy: {
      '/admin': {
        target: 'http://localhost:8000',
        changeOrigin: true, // 允许跨域
        rewrite: (path) => path.replace(/^\/admin/, "/"),
      },
    },
  },
  plugins: [react()],
  resolve: {
    alias: [
      {
        find: /^src(.+)/,
        replacement: path.join(process.cwd(), "src/$1"),
      },
    ],
  },
})
