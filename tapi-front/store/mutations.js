export default {
  login(state, payload) {
    state.user = payload.user_name;
    state.user_token = payload.user_token;
    state.user_id = payload.user_id;
    state.status = true;
  },
  logout(state) {
    state.user = null;
    state.user_token = null,
    state.status = false;
  },
  setItems(state, lists) {
    state.lists = lists;
  },
  hideLoading(state) {
    state.isLoading = false;
  },
  showLoading(state) {
    state.isLoading = true;
  }
};