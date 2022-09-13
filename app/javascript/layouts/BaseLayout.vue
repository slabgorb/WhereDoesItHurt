<template>
  <v-app>
    <v-main>
      <slot></slot>
    </v-main>

  </v-app>
  <Toast />
</template>

<script setup lang="ts">

import Toast from '@/components/Toast/Index.vue';
</script>
