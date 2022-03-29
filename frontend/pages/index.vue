<template>
  <main>
    <div class="flex-container">
      <div class="row">
        <div class="col">
          <table-simple :func-edition="editMunicipes" :municipes-list="municipes" />
          <NuxtLink to="/form" class="btn btn-outline btn-success">
            Novo Munícipe
          </NuxtLink>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import TableSimple from '~/components/TableSimple.vue'

export default {
  components: { TableSimple },
  layout: 'default',
  computed: {
    municipes () {
      return this.$store.state.municipes
    }
  },
  mounted () {
    this.listMunicipes()
  },
  methods: {
    listMunicipes () {
      const page = this
      this.$axios
        .$get('/municipes')
        .then(function (response) {
          if (response.data) {
            page.$store.commit('loadMunicipes', response.data)
          }
        })
        .catch(function (error) {
          // eslint-disable-next-line no-console
          console.error(error)
        })
    },
    editMunicipes (id) {
      this.$store.commit('loadMunicipeEdit', this.municipes[id])
      this.$router.push({ name: 'edit' })
    }
  }
}

</script>

<style>
  .flex-container {
     position: relative;
     overflow: auto;
     z-index: 1;
     padding: none;
  }
  #card-table {
    padding: none;
    margin-left: 20%;
    width: 80%;
    height: 100%;
    background-color:darkcyan;
    color: whitesmoke
  }
  .col {
    margin-left: 20%;
  }
  .row {
    margin-right: 0%;
  }
</style>
