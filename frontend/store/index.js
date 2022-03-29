export const state = () => ({
  municipes: [],
  municipeEdit: {}
})
export const mutations = {
  loadMunicipes (state, payload) {
    state.municipes = payload
  },
  loadMunicipeEdit (state, payload) {
    state.municipeEdit = payload
  }
}
