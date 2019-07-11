<template>
<div>
  <section class="container">
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center>
          <v-flex xs12 sm6 md6 >
            <div v-if="isLoading">
              <v-progress-circular indeterminate color="purple"></v-progress-circular>
            </div>
            <div v-else>
              <search-result />
            </div>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </section>
</div>
</template>

<script>
import {mapState} from 'vuex'
import SearchResult from '~/components/SearchResult.vue'

export default {
  components: {
    SearchResult
  },
  computed: mapState(['isLoading']),
  fetch ({ store }) {
    store.dispatch('getItems', {
      keyword: 'nuxt.js'
    })
  }
}
</script>