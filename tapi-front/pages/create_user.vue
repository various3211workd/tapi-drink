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
      {{ message }}
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const USER_CREATE_URL = 'http://localhost:30000/api/user/new';

export default {
  components: {
  },
  data() {
    return {
      message: '',
      user_name: '',
      user_email: '',
      user_pass: '',
      //user_repass: '',
    };
  },
  methods: {
    async userCreate() {
      const params = new URLSearchParams();
      params.append('user[email]', this.user_email);
      params.append('user[name]', this.user_name);
      params.append('user[password]', this.user_pass);

      await axios.post(USER_CREATE_URL, params)
        .then(response => console.log(response.data))
        .catch(err => console.log(err));
    }
  }
}

</script>
