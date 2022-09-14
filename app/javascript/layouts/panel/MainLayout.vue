<template>
  <BaseLayout>
    <v-app-bar color="primary">
      <template v-slot="prepend">
        <v-app-bar-nav-icon @click="drawer = !drawer" />
        <v-toolbar-title>Where Does It Hurt?</v-toolbar-title>
        <v-icon>mdi-logout</v-icon>
      </template>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer">
      <v-list density="compact" nav>
        <v-list-item prepend-icon="mdi-human" title="Pain Check" value="/panel/pain"></v-list-item>
        <v-list-item prepend-icon="mdi-pill" title="Therapeutic" value="/panel/therapy"></v-list-item>
        <v-list-item prepend-icon="mdi-star" title="Settings" value="/panel/settings"></v-list-item>
      </v-list>
    </v-navigation-drawer>
    <div>
        <router-view />
    </div>
  </BaseLayout>
</template>

<script setup lang="ts">
import BaseLayout from '../BaseLayout.vue';
import { useAuthStore } from '@/stores/auth.store';
const authStore = useAuthStore();
var drawer = false;
const logout = () => {
  authStore.logout();
};
</script>
