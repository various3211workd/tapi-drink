<template>
  <section class="container">
    <div>
      <ul>
        <li v-for="item in items" :key="item.id">
          <h3><a :href="item.url" target="_blank">{{item.name}}</a></h3>
          <span>Stars:{{item.stars}}</span>
          <p>{{item.description}}</p>
        </li>
      </ul>
      <button @click="debugFunc">デバッグ関数</button>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const DEBUG_URL = 'https://github-trending-api.now.sh/repositories?language=javascript&since=weekly';

export default {
  components: {
  },
  data() {
    return {
      items: '',
    };
  },
  methods: {
    async debugFunc() {
      this.items = await this.$axios.$get(
        DEBUG_URL
      );
    },
  }
}

</script>
