<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm6 md6 >
              <div v-for="(item, index) in shop_list" :key="index">
                <v-card>
                  <v-carousel height="40vh">
                    <v-carousel-item
                      v-for="(item, index) in item.images_url"
                      :key="index"
                      :src="item"
                      reverse-transition="fade"
                      transition="fade"
                    >
                    </v-carousel-item>
                  </v-carousel>
                  <v-card-text>
                    <h2>{{item.name}}</h2>
                    <p>{{item.address}}</p>
                    <span>{{item.details}}</span><br><br>
                  </v-card-text>

                  <v-card-actions>
                    <v-list-tile class="grow">
                      
                      <!-- user icon -->
                      <v-list-tile-avatar color="grey darken-3">
                        <v-img
                          class="elevation-6"
                          src=""
                        ></v-img>
                      </v-list-tile-avatar>         
                      <v-list-tile-content>
                        <v-list-tile-title>{{ item.user_name }}</v-list-tile-title>
                      </v-list-tile-content>
                      
                      <!-- favorite button -->
                      <v-layout align-center justify-end>
                        <v-btn icon disabled>
                          <v-icon class="mr-1">favorite</v-icon>
                          <span class="subheading mr-2"><!-- {{  }} --></span>
                        </v-btn>
                      </v-layout>
                    </v-list-tile>
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

const FECTH_SHOP_LIST_URL = process.env.API_URL + 'api/shops/show';
const TAPI_API_KEY = process.env.TAPI_API_KEY

export default {
  components: {
  },
  data() {
    return{
      default_data: 10,
      shop_list: null
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
    .then(res => {
      this.shop_list = res.data
    })
    .catch(err => console.log(err));
  }
}
</script>
