<template>
  <v-text-field
    v-model="searchForm.keyword" 
    :append-icon-cb="() => { /*search('searchForm')*/ }"
    flat 
    solo-inverted
    append-icon="search"
    label="検索" 
    hide-details
  ></v-text-field>
</template>

<script lang="babel">
export default {
  data () {
    return {
      searchForm: {
        keyword: ''
      }
    }
  },
  methods: {
    // バリデーションチェックのために残しておく
    search (form) {
      this.sendRequest()
    },
    sendRequest () {
      this.$store.dispatch('getItems', {
        keyword: this.searchForm.keyword
      })
    }
  }
}
</script>