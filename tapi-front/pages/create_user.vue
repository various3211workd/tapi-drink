<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm8>
              <!-- success create account -->
              <div v-if="this.response.message === 'success!!'">
                <v-alert :value="true" type="success">
                  アカウントを作成しました!!
                </v-alert>
                <br>
                <v-btn href="/login_user" color="amber darken-1">
                  ログインする
                </v-btn>
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
                      <v-flex xs12 class="text-xs-center text-sm-center text-md-center text-lg-center">
                        <v-img :src="this.image_url" :aspect-ratio="16/9" v-if="this.image_url" ></v-img>
                        <v-text-field prepend-icon="insert_photo" v-model="image_name" label="画像を選択" @click="pickFile"></v-text-field>
                        <input 
                          type="file"
                          style="display: none;"
                          ref="image"
                          accept="image/*"
                          v-on:change="ImageUpload()"
                        />
                      </v-flex>
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
      user_image: null,
      image_name: null,
      image_url:  null
    };
  },
  methods: {
    pickFile(){
      this.$refs.image.click()
    },
    ImageUpload(){
      this.user_image = this.$refs.image.files[0];
      this.image_name = this.user_image.name

      const filereader = new FileReader()
      filereader.addEventListener("load", () => {
        this.image_url = filereader.result;
      }, false);
      if (this.user_image) {
        filereader.readAsDataURL(this.user_image);
      }
    },
    async userCreate() {
      const user_data = new FormData();
      user_data.append('user[email]', this.user_email);
      user_data.append('user[name]', this.user_name);
      user_data.append('user[password]', this.user_pass);
      user_data.append('user[password_confirmation]', this.user_repass);
      if( this.user_image != null ){
        user_data.append('user[image]', this.user_image);
      }
      await axios.post(
        USER_CREATE_URL,
        user_data,
        {
          headers: { 
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