export const state = () => ({
  user: null,
  status: false
})

export const mutations = {
  login(state, user) {
    state.user = user;
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