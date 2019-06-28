<template>
  <v-footer color="orange darken-2" app class="white--text">
    &copy;2019 — <strong>Tapi-Drink team</strong>
    <v-spacer></v-spacer>
    <v-btn v-for="icon in icons" :key="icon" icon class="white--text">
      <v-icon small>{{ icon }}</v-icon>
    </v-btn>
  </v-footer>
</template>

<script>
export default {
  components: {
  },
  data: () => ({
    icons: [
      'fa-github',
      'fa-facebook', 
      'fa-twitter'
    ],
  })
}
</script>