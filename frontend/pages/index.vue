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
          if (response) {
            page.$store.commit('loadMunicipes', response)
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
    color: whitesmoke
  }
  .col {
    margin-left: 19%;
    width: 80%;
  }
  .row {
    margin-right: 0%;
  }
  .sidebar {
    width: 18%;
    overflow-x: hidden;
    overflow-y: auto;
  }

  @media (min-width: 768px) {
    .main {
    padding-right: 40px;
    padding-left: 220px; /* 180 + 40 */
    }
  }
</style>
