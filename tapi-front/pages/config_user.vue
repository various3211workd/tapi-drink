<template>
  <v-container fill-height fluid grid-list-xl>
    <v-layout justify-center wrap>
      <v-flex xs12 md4>
        <material-card class="v-card-profile">
          <v-avatar slot="offset" class="mx-auto d-block" size="130">
            <v-img :src=$store.state.user_image_url></v-img>
          </v-avatar>
          <v-card-text class="text-xs-center">
            <h6 class="category text-gray font-weight-thin mb-3"><!--{{  }}--></h6>
            <h4 class="card-title font-weight-light"><!--{{  }}--></h4>
            <p class="card-description font-weight-light"><!--{{  }}--></p>
            <v-btn color="success" round class="font-weight-light">フォロー</v-btn>
          </v-card-text>
        </material-card>
      </v-flex>
      <v-flex xs12 md8>
        <material-card color="green" title="Edit Profile" text="Complete your profile">
          <v-form>
            <v-container py-0>
              <v-layout wrap>
                <v-flex xs12 md4>
                  <v-text-field label="ユーザー名" class="purple-input"/>
                </v-flex>
                <v-flex xs12 md4>
                  <v-text-field label="メールアドレス" class="purple-input"/>
                </v-flex>
                <v-flex xs12 md6>
                  <v-text-field label="パスワード" class="purple-input"/>
                </v-flex>
                <v-flex xs12 md6>
                  <v-text-field label="パスワード再入力" class="purple-input"/>
                </v-flex>
                <v-flex xs12>
                  <v-textarea class="purple-input" label="自己紹介" value=""/>
                </v-flex>
                <v-flex xs12 text-xs-right>
                  <v-btn class="mx-0 font-weight-light" color="success" href="">プロフィールを更新</v-btn>
                  <v-btn class="mx-0 font-weight-light" color="amber darken-1" href="/delete_user">ユーザーを削除する</v-btn>
                </v-flex>
              </v-layout>
            </v-container>
          </v-form>
        </material-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  methods: {
    async changeUserConfig() {
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
  },
  mounted() {
  }
}
</script>
