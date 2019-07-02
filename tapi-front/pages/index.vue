<template>
  <section class="container">
<v-layout>
    <v-flex xs12 sm6 offset-sm3  >
      <div v-for="(item, index) in shop_list" :key="index">
      <v-card>
        <v-img
          class="white--text"
          height="200px"
          src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
        >
        </v-img>
        <v-card-text>
          <span>{{item.name}}</span><br>
          <span>{{item.address}}</span><br>
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
  </section>
</template>

<script>
import axios from 'axios'

const FECTH_SHOP_LIST_URL = process.env.API_URL + 'api/shops/show';
const TAPI_API_KEY = process.env.TAPI_API_KEY

export default {
  components: {
  },
  data() {
    return{
      default_data: 10,
      shop_list: []
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