<template>
  <section class="container">
    <div>
      <input v-model="user_email" placeholder="edit me">
      <input v-model="user_pass" placeholder="edit me">
      <button @click="userLogin">ログイン</button>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const LOGIN_URL = 'http://localhost:30000/api/auth/login';

export default {
  components: {
  },
  data() {
    return {
      message: '',
      user_email: '',
      user_pass: '',
    };
  },
  methods: {
    async userLogin() {
      this.message = await this.$axios.$POST(
        LOGIN_URL,
        {
          'login[email]': this.user_email,
          'login[password]': this.user_pass,
        });
    },
  }
}

</script>
