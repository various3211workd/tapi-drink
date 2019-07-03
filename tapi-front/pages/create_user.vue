<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm8>
              {{user_repass}}{{user_pass}}
              <!-- success create account -->
              <div v-if="this.response.message === 'success!!'">
                <v-alert :value="true" type="success">
                  アカウントを作成しました!!
                </v-alert>
                <router-link to="/" style="color: white; text-decoration: none;">ログインする</router-link>
              </div>
              <!-- can't create account... -->
              <div v-else-if="this.response.message === 'failed save'">
                <v-alert :value="true" type="error">
                  アカウントの作成に失敗しました...
                </v-alert>
              </div>
              <br><br><br>

              <!-- create account form -->
              <div v-if="this.response.message !== 'success!!'">
                <v-card class="elevation-12">
                  <v-toolbar dark color="amber darken-1">
                    <v-toolbar-title>アカウント作成</v-toolbar-title>
                  </v-toolbar>
                  <v-card-text>
                    <v-form>
                      <v-text-field prepend-icon="person" v-model="user_name" label="ユーザ名" type="text"></v-text-field>
                      <v-text-field prepend-icon="mail" v-model="user_email" label="メールアドレス" type="address"></v-text-field>
                      <v-text-field prepend-icon="lock" v-model="user_pass" label="パスワード" type="password"></v-text-field>
                      <v-text-field prepend-icon="lock" v-model="user_repass" label="パスワード再入力" type="password"></v-text-field>
                    </v-form>
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="userCreate" color="amber darken-1">アカウントを作成</v-btn>
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
            'password': this.user_pass,
            'password_confirmation': this.user_repass
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
