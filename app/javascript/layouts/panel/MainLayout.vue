<template>
  <BaseLayout>
    <v-card class="mx-auto" max-width="1024">
      <v-app-bar color="primary">
        <v-btn to="/pain" icon="mdi-human" />
        <v-btn to="/treatment" icon="mdi-pill" />
        <v-btn icon="mdi-setting" />
      </v-app-bar>
      <div>
        <router-view />
      </div>
    </v-card>

  </BaseLayout>
</template>

<script setup lang="ts">
import BaseLayout from '../BaseLayout.vue';
import { useAuthStore } from '@/stores/auth.store';
const authStore = useAuthStore();
var drawer = false;
</script>
