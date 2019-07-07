import axios from 'axios'

const FECTH_SHOP_LIST_URL = process.env.API_URL + 'api/shops/show';
const TAPI_API_KEY = process.env.TAPI_API_KEY;
const DEFAULT_ITEM_DATA = 10;

export default {
  async getItems({ commit }, payload) {
    commit("showLoading");
    const response = axios.get(
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
      commit("hideLoading");
      location.replace('/error');
    });
    // 'lists' にレスポンスを設定
    commit("setItems", response.data);
    // 'isLoading' を 'false' に設定
    commit("hideLoading");
  }
}
/*
import axios from "axios";
const BASE_URL = "https://qiita.com/api/v2/";
export default {
  async getItems({ commit }, payload) {
    // 'isLoading' を 'true' に設定
    commit("showLoading");
    // リクエスト送信
    const response = await axios
      .get(`${BASE_URL}items`, {
        headers: { "Content-Type": "application/json" },
        params: {
          page: 1,
          per_page: 20,
          query: payload.keyword
        },
        timeout: 15000
      })
      .catch(error => {
        console.error(error);
        // 'isLoading' を 'false' に設定
        commit("hideLoading");
        // エラー画面に遷移
        this.$router.push("/error");
      });
    // 'lists' にレスポンスを設定
    commit("setItems", response.data);
    // 'isLoading' を 'false' に設定
    commit("hideLoading");
  }
};
*/