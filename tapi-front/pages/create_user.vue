<template>
  <section class="container">
    <div>
      <!-- success login -->
      <div v-if="this.response.message === 'success!!'">
        <h1>アカウントを作成しました!!</h1>
      </div>
      <!-- can't login... -->
      <div v-else>
        <h1>アカウントの作成に失敗しました...</h1>
      </div>

      <br>
      ユーザ名: <input v-model="user_name" placeholder="edit me">
      <br>
      メールアドレス:　<input v-model="user_email" placeholder="edit me">
      <br>
      パスワード: <input v-model="user_pass" placeholder="edit me">
      <br>
      <input v-model="user_repass" placeholder="edit me">
      <br>
      
      <button @click="userCreate">アカウント作成</button>
      <br>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const USER_CREATE_URL = process.env.API_URL + 'api/user/new';
const TAPI_API_KEY = process.env.TAPI_API_KEY

export default {
  components: {
  },
  data() {
    return {
      response: '',
      user_name: '',
      user_email: '',
      user_pass: '',
      user_repass: '',
    };
  },
  methods: {
    async userCreate() {
      await axios.post(
        USER_CREATE_URL,
        {
          'user': {
            'email': this.user_email,
            'name': this.user_name,
            'password': this.user_pass
          },
        },
        {
          headers: { 
            'Content-Type': 'application/json',
            'API_KEY': TAPI_API_KEY
          }
        })
        .then(res => {
          this.response = res.data;
        })
        .catch(err => console.log(err));
    }
  }
}

</script>
