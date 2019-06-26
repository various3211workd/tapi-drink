<template>
  <section class="container">
    <div>
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
const config = {headers: {
  'API_KEY': process.env.TAPI_API_KEY
}}
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
      const params = new URLSearchParams();
      params.append('user[email]', this.user_email);
      params.append('user[name]', this.user_name);
      params.append('user[password]', this.user_pass);

      await axios.post(USER_CREATE_URL, params, config)
        .then(response => {
          this.response = response.data;
          console.log(response.data);
        })
        .catch(err => console.log(err));
    }
  }
}

</script>
