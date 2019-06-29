export const state = () => ({
  user: null,
  user_token: null,
  status: false
})

export const mutations = {
  login(state, user, user_token) {
    state.user = user;
    state.user_token = user_token;
    state.status = true;
  },
  logout(state) {
    state.user = null;
    state.status = false;
  }
}

export const getters = {
  isSignedIn(state) {
    return state.status
  }
}