export const state = () => ({
  user: null,
  user_token: null,
  user_image_url: null,
  status: false
})

export const mutations = {
  login(state, payload) {
    state.user = payload.user_name;
    state.user_token = payload.user_token;
    state.user_id = payload.user_id;
    state.user_image_url = payload.user_image_url;
    state.status = true;
  },
  logout(state) {
    state.user = null;
    state.user_token = null,
    state.status = false;
  }
}

export const getters = {
  isSignedIn(state) {
    return state.status
  }
}