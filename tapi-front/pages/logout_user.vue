<template>
  <section class="container">
      <v-content>
        <!-- success logout -->
        <div v-if="userLogout">
          <v-alert :value="true" type="success">
            ログアウトしました!!
          </v-alert>
        </div>
        <!-- can't logout... -->
        <div v-else>
          <v-alert :value="true" type="error">
            ログアウトに失敗しました...
          </v-alert>
        </div>
      </v-content>
  </section>
</template>

<script>
import axios from 'axios'

const LOGIN_URL = process.env.API_URL + 'api/auth/logout';
const TAPI_API_KEY = process.env.TAPI_API_KEY;

export default {
  methods: {
    async userLogout() {
      await axios.post(
        LOGOUT_URL,
        {
        },
        {
          headers: { 
            'Content-Type': 'application/json',
            'API_KEY': TAPI_API_KEY
          }
        })
        .then(res => {
          this.response = res.data;
          if( this.response.message === 'succesful logout' ) {
            this.$store.commit('logout');
            return true;
          }
        })
        .catch(err => {
          console.log(err);
          return false;
        });
    }
  }
}

</script>
