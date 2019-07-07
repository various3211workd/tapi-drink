<template>
  <div class="container">
    <h1 v-if="error.statusCode === 404">404 not found</h1>
    <h1 v-else>error</h1>
    <nuxt-link to="/">Back Top</nuxt-link>
  </div>
</template>

<script>
export default {
  props: ['error']
}
</script>

<style scoped>
</style>