<template>
  <section class="container">
    <v-content>
      <v-btn @click="userLogout" color="amber darken-1">ログアウトする</v-btn>
    </v-content>
  </section>
</template>

<script>
export default {
  methods: {
    userLogout() {
      try {
        this.$store.commit('logout');
        location.replace('../');
      }
      catch(err) { }
    }
  }
}

</script>
