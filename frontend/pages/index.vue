<template>
  <main>
    <div class="flex-container">
      <filter-municipe :search-func="search" />
      <table-simple :func-edition="editMunicipes" :municipes-list="municipes" />
      <pagination :paginate-func="paginate" />
      <NuxtLink id="btnNew" to="/form" class="btn btn-outline btn-success">
        Novo Munícipe
      </NuxtLink>
    </div>
  </main>
</template>

<script>
import FilterMunicipe from '~/components/FilterMunicipe.vue'
import Pagination from '~/components/pagination.vue'
import TableSimple from '~/components/TableSimple.vue'

export default {
  // eslint-disable-next-line vue/component-definition-name-casing
  name: 'index',
  components: { TableSimple, FilterMunicipe, Pagination },
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
    listMunicipes (query) {
      const page = this
      this.$axios
        // .$get(`/municipes/${query !== '' ? '?q=' + query : ''}`)
        .$get(`/municipes/${query !== '' && query !== undefined ? '?q[description_cont]=' + query + '&commit=Search' : ''}`)
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
    PageMunicipes (pagination) {
      const page = this
      this.$axios
        // .$get(`/municipes/${query !== '' ? '?q=' + query : ''}`)
        .$get(`/municipes/${pagination !== '' && pagination !== undefined ? '?page=' + pagination : ''}`)
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
    },
    search (value) {
      this.listMunicipes(value)
    },
    paginate (pagination) {
      this.PageMunicipes(pagination)
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
  #btnNew {
    margin-left: 19%;
  }
  .sidebar {
    width: 18%;
  }
</style>
