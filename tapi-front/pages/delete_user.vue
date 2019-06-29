<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm8>

              <!-- success delete user -->
              <div v-if="this.response.message === 'complete'">
                <v-alert :value="true" type="success">
                  ユーザを削除しました
                </v-alert>
              </div>
              <!-- can't delete user... -->
              <div v-else-if="this.response.message === 'error'">
                <v-alert :value="true" type="error">
                  ユーザの削除に失敗しました
                </v-alert>
                <v-card class="elevation-12">
                  <v-card-text>
                    <p>しばらく時間がたってから再度お試しください</p>
                  </v-card-text>
                </v-card>
              </div>

                <!-- user delete form -->     
                <v-card class="elevation-12">
                  <v-toolbar dark color="amber darken-1">
                    <v-toolbar-title>本当に削除しますか？</v-toolbar-title>
                  </v-toolbar>
                  <v-card-text>
                    <p>一度アカウントを削除すると復元できません。</p>
                    <p>本当にアカウントを削除しますか？</p>
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="userDelete" color="amber darken-1">削除します</v-btn>
                  </v-card-actions>
                </v-card>
            
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
  </section>
</template>

<script>
import axios from 'axios'

const USER_DELETE_URL = process.env.API_URL + 'api/auth/login';
const TAPI_API_KEY = process.env.TAPI_API_KEY;

export default {
  components: {
  },
  data() {
    return {
      response: ''
    };
  },
  methods: {
    async userDelete() {
      await axios.post(
        USER_DELETE_URL,
        {
          'login': {
            'email': this.user_email,
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
          if( this.response.message === 'complete' ) {
            this.$store.commit('logout');
          }
        })
        .catch(err => console.log(err));
    }
  }
}

</script>
