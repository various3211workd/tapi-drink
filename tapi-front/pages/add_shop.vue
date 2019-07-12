<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm8>
              <!-- success add shop -->
              <div v-if="this.response.message === 'success create'">
                <v-alert :value="true" type="success">
                  お店の追加に成功しました!!
                </v-alert>
                <br>
              </div>
              <!-- can't add shop... -->
              <div v-else-if="this.response.message === 'failed create'">
                <v-alert :value="true" type="error">
                  お店の追加に失敗しました...
                </v-alert>
              </div>
              <br><br><br>

              <!-- add shop form -->
              <div v-if="this.response.message !== 'success create'">
                <v-card class="elevation-12">
                  <v-toolbar dark color="amber darken-1">
                    <v-toolbar-title>お店の追加</v-toolbar-title>
                  </v-toolbar>
                  <v-card-text>
                    <v-form>
                      <v-flex xs12 class="text-xs-center text-sm-center text-md-center text-lg-center">
                        <v-img :src="this.image_url" :aspect-ratio="16/9" v-if="this.image_url" ></v-img>
                        <v-text-field prepend-icon="insert_photo" v-model="image_name" label="画像を選択" @click="pickFile"></v-text-field>
                        <input 
                          type="file"
                          style="display: none;"
                          ref="images"
                          accept="image/*"
                          multiple
                          v-on:change="ImagesUpload()"
                        />
                      </v-flex>
                      <v-text-field prepend-icon="person" v-model="shop_name" label="お店の名前" type="text"></v-text-field>
                      <v-text-field prepend-icon="home" v-model="shop_address" label="住所" type="text"></v-text-field>
                      <v-img prepend-icon="photo" v-model="shop_image" label="画像" type="password"></v-img>                    
                      <v-textarea prepend-icon="receipt" v-model="shop_details" label="詳細" type="textfield"></v-textarea>
                    </v-form>
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="shopAdd" color="amber darken-1">お店を追加</v-btn>
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

const SHOP_ADD_URL = process.env.API_URL + 'api/shops/create';
const TAPI_API_KEY = process.env.TAPI_API_KEY

export default {
  data() {
    return {
      response: '',
      shop_name: '',
      shop_address: '',
      shop_details: '',
      shop_images: [],
      image_names: ''
    };
  },
  methods: {
    pickFile(){
      this.$refs.images.click()
    },
    ImageUpload(){
      this.shop_images = this.$refs.images.files;
      /*
      this.image_name = this.user_image.name

      const filereader = new FileReader()
      filereader.addEventListener("load", () => {
        this.image_url = filereader.result;
      }, false);
      if (this.user_image) {
        filereader.readAsDataURL(this.user_image);
      }
      */
    },
    async shopAdd() {
      await axios.post(
        SHOP_ADD_URL,
        {
          'shop': {
            'name': this.shop_name,
            'address': this.shop_address,
            'details': this.shop_details,
            'user_id': this.$store.state.user_id,
            'images': this.shop_images,
          },
        },
        {
          headers: { 
            'Content-Type': 'application/json',
            'API_KEY': TAPI_API_KEY,
            'USER_TOKEN': this.$store.state.user_token,
          }
        })
        .then(res => {
          this.response = res.data;
          console.log(this.response);
        })
        .catch(err => console.log(err));
    }
  }
}

</script>
