<template>
  <section class="container">
    <div>
      <!-- success login -->
      <div v-if="this.response.message === 'succesful login'">
        <h1>ログインに成功しました!!</h1>
      </div>
      <!-- can't login... -->
      <div v-else>
        <h1>ログインに失敗しました...</h1>
      </div>

      <br>
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
        .then(res => {
          this.response = res.data;
          // need token save...
        })
        .catch(err => console.log(err));
    }
  }
}

</script>
