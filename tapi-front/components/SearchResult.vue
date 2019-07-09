<template>
  <!-- if search result 0 -->
  <div v-if="lists && lists.length == 0 && !isLoading">
    <i class="">&nbsp;No results found for your keyword.</i>
  </div>
  <!-- else -->
  <div v-else>
    <div v-for="(item, index) in lists" :key="index">
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
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  data () {
    return {
      scrollY: 0,
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleScroll)
  },
  computed: mapState(['lists', 'isLoading']),
  methods: {
    handleScroll: function () {
      this.scrollY = window.scrollY
    },
    scrollTop: function () {
      document.body.scrollTop = 0
      document.documentElement.scrollTop = 0
    }
  }
}
</script>