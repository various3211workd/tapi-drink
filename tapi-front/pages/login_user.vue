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
const TAPI_API_KEY = process.env.TAPI_API_KEY;

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
      await axios.post(
        LOGIN_URL,
        {
          'login': {
            'email': this.user_email,
            'password': this.user_pass
          }
        },
        {
          headers: { 
            'Content-Type': 'application/json',
            'API_KEY': TAPI_API_KEY
          }
        })
          .then(response => console.log(response.data))
          .catch(err => console.log(err));
    }
  }
}

</script>
