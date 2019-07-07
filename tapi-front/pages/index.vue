<template>
  <section class="container">
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center>
            <v-flex xs12 sm6 md6 >
              <div v-loading.fullscreen.lock="isLoading">
                <search-form />
                <search-result />
              </div>
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
  </section>
</template>

<script>
import {mapState} from 'vuex'
import SearchResult from '~/components/SearchResult.vue'
import SearchForm from '~/components/SearchForm.vue'

export default {
  layout: 'navbar',
  components: {
    SearchForm,
    SearchResult
  },
  // store の state からデータを取得
  computed: mapState(['isLoading']),
  // store の action に用意した 'getItems' を呼ぶ
  fetch ({ store }) {
    store.dispatch('getItems', {
      keyword: 'nuxt.js'
    })
  }
}
</script>
