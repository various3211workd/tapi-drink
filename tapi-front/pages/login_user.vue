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

const LOGIN_URL = process.env.API_URL + 'api/auth/login';
const config = {headers: {
  'Content-Type': 'application/json',
  'API_KEY': process.env.TAPI_API_KEY
}}

export default {
  components: {
  },
  data() {
    return {
      response: '',
      user_email: '',
      user_pass: '',
    };
  },
  methods: {
    async userLogin() {
      /*
      const params = new URLSearchParams();
      params.append('login[email]', this.user_email);
      params.append('login[password]', this.user_pass);

      await axios.post(LOGIN_URL, params, config)
        .then(response => console.log(response.data))
        .catch(err => console.log(err));
      */
      await axios.post(
        LOGIN_URL,
        {
          'login[email]': this.user_email,
          'login[password]': this.user_pass
        },
        config)
          .then(response => console.log(response.data))
          .catch(err => console.log(err));
    }
  }
}

</script>
