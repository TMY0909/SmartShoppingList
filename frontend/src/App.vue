<script setup>
import { RouterView } from 'vue-router'
</script>

<template>
  <div class="min-h-screen bg-gray-100 text-gray-900">
    <header class="bg-blue-600 text-white p-4 shadow-md">
      <div class="max-w-6xl mx-auto flex items-center justify-center gap-3"> 
        
        <svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="w-10 h-10">
            <path d="M14 3H7a2 2 0 00-2 2v14a2 2 0 002 2h10a2 2 0 002-2v-9" />
            <path d="M 18 1 C 18 3 19.5 4.5 22 4.5 C 19.5 4.5 18 6 18 8 C 18 6 16.5 4.5 14 4.5 C 16.5 4.5 18 3 18 1 Z" />
            <rect x="7.5" y="7.5" width="2" height="2" rx="0.5" />
            <path d="M11.5 8.5h4" />
            <rect x="7.5" y="11.5" width="2" height="2" rx="0.5" />
            <path d="M11.5 12.5h5" />
            <path d="M7.5 17.5l1 1l2.5-2.5" />
            <path d="M12.5 17.5h3" />
        </svg>

        <h1 class="text-3xl font-black tracking-wide">SmartShoppingList</h1>
        
      </div>
    </header>
    
    <RouterView />
  </div>
</template>