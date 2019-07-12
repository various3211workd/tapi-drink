require('dotenv').config()
const { TAPI_API_KEY } = process.env;
const { API_URL } = process.env;

module.exports = {
  /**
   * modules
   */
  modules: [
    '@nuxtjs/vuetify',
    '@nuxtjs/font-awesome',
    '@nuxtjs/axios',
  ],
  /*
  ** Headers of the page
  */
  head: {
    title: 'シェアタピ',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Nuxt.js project' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  },
  /**
   * vuetify
   */
  vuetify: {
    theme: {
      primary: '#3f51b5',
      secondary: '#b0bec5',
      accent: '#8c9eff',
      error: '#b71c1c'
    }
  },
  env: {
    TAPI_API_KEY,
    API_URL
  },
  plugins: [
    { src: "~plugins/persistedstate.js", ssr: false }
  ]
}

