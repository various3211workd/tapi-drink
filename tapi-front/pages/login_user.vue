<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm8>
              
              <!-- success login -->
              <div v-if="this.response.message === 'succesful login'">
                <v-alert :value="true" type="success">
                  ログインに成功しました!!
                </v-alert>
              </div>
              <!-- can't login... -->
              <div v-else-if="this.response.message === 'failed login'">
                <v-alert :value="true" type="error">
                  ログインに失敗しました...
                </v-alert>
              </div>
              <br><br><br>

              <!-- login form -->
              <div v-if="this.response.message !== 'succesful login'">
                <v-card class="elevation-12">
                  <v-toolbar dark color="amber darken-1">
                    <v-toolbar-title>ログイン</v-toolbar-title>
                  </v-toolbar>
                  <v-card-text>
                    <v-form>
                      <v-text-field prepend-icon="mail" v-model="user_email" label="メールアドレス" type="text"></v-text-field>
                      <v-text-field prepend-icon="lock" v-model="user_pass" label="パスワード" type="password"></v-text-field>
                    </v-form>
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="userLogin" color="amber darken-1">ログイン</v-btn>
                  </v-card-actions>
                </v-card>
              </div>
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
  </section>
</template>

<script>
import axios from 'axios'
import { mapMutations } from 'vuex'

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
          'user': {
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
          console.log(this.response);
          if( this.response.message === 'succesful login' ) {
            this.$store.commit('login', {
              user_name: this.response.user_name, 
              user_token: this.response.user_token,
              user_id: this.response.user_id,
              user_image_url: this.response.user_image_url
            });
          }
        })
        .catch(err => console.log(err));
    }
  }
}

</script>
