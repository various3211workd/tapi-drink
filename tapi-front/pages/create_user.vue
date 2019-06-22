<template>
  <section class="container">
    <div>
      <input v-model="user_name" placeholder="edit me">
      <input v-model="user_email" placeholder="edit me">
      <input v-model="user_pass" placeholder="edit me">
      <input v-model="user_repass" placeholder="edit me">
      
      <button @click="userCreate">アカウント作成</button>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const USER_CREATE_URL = 'http://localhost:3000/user/new';

export default {
  components: {
  },
  data() {
    return {
      message: '',
      user_name: '',
      user_email: '',
      user_pass: '',
      user_repass: ''
    };
  },
  methods: {
    async debugFunc() {
      this.items = await this.$axios.$get(
        DEBUG_URL
      );
    },
    async userCreate() {
      this.message = await this.$axios.$POST(
        USER_CREATE_URL,
        {
          'user[name]': this.user_email,
          'user[email]': this.user_name,
          'user[password]': this.user_pass
        });
    },
  }
}

</script>
