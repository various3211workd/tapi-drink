import axios from 'axios'

const FECTH_SHOP_LIST_URL = process.env.API_URL + 'api/shops/show';
const TAPI_API_KEY = process.env.TAPI_API_KEY;
const DEFAULT_ITEM_DATA = 10;

export default {
  async getItems({ commit }, payload) {
    commit("showLoading");
    const response = await axios.get(
      FECTH_SHOP_LIST_URL + '?number=' + DEFAULT_ITEM_DATA,
      {
        headers: { 
          'Content-Type': 'application/json',
          'API_KEY': TAPI_API_KEY
        },
        timeout: 15000
      }
    )
    .catch(error => {
      console.error(error);
      this.$store.commit("hideLoading");
      location.replace('/error');
    });
    console.log(response.data);
    commit('setItems', response.data);
    commit('hideLoading');
    console.log($store.state.lists);
  }
};
