<template>
  <nav>
    <div class="profile">
      <h3>Where Does it Hurt?</h3>
    </div>
    <ul>
      <li class="active">
        <router-link
          :to="{
            name: 'index',
          }"
          class="item"
        >
          My Dashboard
        </router-link>
      </li>

      <li>
        <span class="item">Settings</span>
      </li>
    </ul>
  </nav>
</template>

<script setup lang="ts"></script>
