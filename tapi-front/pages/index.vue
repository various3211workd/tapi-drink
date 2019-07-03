<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
    <v-flex xs12 sm6 md6 >
      <div v-for="(item, index) in shop_list" :key="index">
      <v-card>
    <v-carousel height="300">
      <v-carousel-item
        v-for="(item,i) in items"
        :key="i"
        :src="item.src"
        reverse-transition="fade"
        transition="fade"
      ></v-carousel-item>
    </v-carousel>
        <v-card-text>
          <p>{{item.name}}</p>
          <p>aaaaaaaaaaaaaaaa</p>
          <span>{{item.details}}</span><br>
          <span>投稿者{{item.user_id}}さん</span>
        </v-card-text>
        <v-card-actions>
          <v-btn flat color="orange">いいね</v-btn>
        </v-card-actions>
      </v-card>
      <br>
      </div>
    </v-flex>
          </v-layout>
        </v-container>
      </v-content>
  </section>
</template>

<script>
import axios from 'axios'
import Carousel from 'vue-carousel/src/Carousel.vue'
import Slide from 'vue-carousel/src/Slide.vue'

const FECTH_SHOP_LIST_URL = process.env.API_URL + 'api/shops/show';
const TAPI_API_KEY = process.env.TAPI_API_KEY

export default {
  components: {
    Carousel,
    Slide
  },
  data() {
    return{
      default_data: 10,
      shop_list: [],
        items: [
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/squirrel.jpg'
          },
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/sky.jpg'
          },
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/bird.jpg'
          },
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/planet.jpg'
          }
        ]
    }
  },
  mounted (){
    axios.get(
      FECTH_SHOP_LIST_URL + '?number=' + this.default_data,
      {
        headers: { 
          'Content-Type': 'application/json',
          'API_KEY': TAPI_API_KEY
        }
      }
    )
    .then(res => (this.shop_list = res.data.shop_list_data))
    .catch(err => console.log(err));
  }
}
</script>