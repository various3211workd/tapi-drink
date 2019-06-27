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
      axios.defaults.headers.common = {
        'X-Requested-With': 'XMLHttpRequest',
        'API_KEY': process.env.TAPI_API_KEY
      };
      await axios.post(
        USER_CREATE_URL,
        {
          'user': {
            'email': this.user_email,
            'name': this.user_name,
            'password': this.user_pass
          },
        })
          .then(response => console.log(response.data))
          .catch(err => console.log(err));
    }
  }
}

</script>
