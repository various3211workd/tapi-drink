<template>
  <section class="container">
    <div>
      <ul>
        <li v-for="item in items" :key="item.id">
          <h3><a :href="item.url" target="_blank">{{item.name}}</a></h3>
          <span>Stars:{{item.stars}}</span>
          <p>{{item.description}}</p>
        </li>
      </ul>
      <input v-model="user_name" placeholder="edit me">
      <input v-model="user_email" placeholder="edit me">
      <input v-model="user_pass" placeholder="edit me">
      <input v-model="user_repass" placeholder="edit me">
      <button @click="debugFunc">デバッグ関数</button>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const API_URLS = {
  debug_url: 'https://github-trending-api.now.sh/repositories?language=javascript&since=weekly',
  user_create: 'http://localhost:3000/user/new',
  user_login: 'http://localhost:3000/auth/login'
}

export default {
  components: {
  },
  data() {
    return {
      items: '',
      user_name: '',
      user_email: '',
      user_pass: '',
      user_repass: ''
    };
  },
  methods: {
    async debugFunc() {
      this.items = await this.$axios.$get(
        API_URLS.debug_url
      );
    },
    async userCreate() {
      this.items = await this.$axios.$POST(
        API_URLS.user_create,
        {
          'user[name]': this.user_email,
          'user[email]': this.user_name,
          'user[password]': this.user_pass
        });
    },
    /*
    async userLogin() {
      this.items = await this.$axios.$POST(
        API_URLS.user_login
        {
          login[email]: ,
          login[password]: 
        });
    },
    */
  }
}

</script>
