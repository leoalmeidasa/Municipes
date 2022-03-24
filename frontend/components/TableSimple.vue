<template>
  <div class="table-responsive-lg">
    <table
      class="table table-dark table-scoped table-hover"
      height="250"
      fixed-header
    >
      <thead>
        <tr>
          <th>Nome</th>
          <th>Cpf</th>
          <th>Cns</th>
          <th>Email</th>
          <th>Data de Nascimento</th>
          <th>Telefone</th>
          <th>Status</th>
          <th>Foto</th>
          <th>Ações</th>
        </tr>
      </thead>
      <tbody v-if="municipes.length">
        <tr v-for="(municipe, index) in municipes" :key="index">
          <td>{{ municipe.description }}</td>
          <td>{{ municipe.cpf }}</td>
          <td>{{ municipe.cns }}</td>
          <td>{{ municipe.email }}</td>
          <td>{{ municipe.birth_date }}</td>
          <td>{{ municipe.telephone }}</td>
          <td>{{ municipe.status }}</td>
          <img :src="municipe.photo.url">
          <td>
            <NuxtLink to="/edit" class="btn btn-outline btn-warning" @click="showModal(municipe)">
              Editar
            </NuxtLink>
          </td>
        </tr>
      </tbody>
      <tbody v-else>
        <td>
          Dados não encontrados !
        </td>
      </tbody>
    </table>
    <municipe-form ref="MunicipeForm" />
  </div>
</template>

<script>
export default {
  data () {
    return {
      municipes: [],
      form: {
        description: '',
        cpf: '',
        cns: '',
        email: '',
        birth_date: '',
        telephone: '',
        status: '',
        photo: ''
      }
    }
  },
  computed: {
    municipesIsNotEmpty () {
      return this.municipes.length > 0
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
          response.data.map(item => page.municipes.push(item))
        })
        .catch(function (error) {
          // eslint-disable-next-line no-console
          console.error(error)
        })
    },
    addMunicipe () {
      this.$axios
        .$post('/municipes', this.form)

        .then(function (response) {
          // eslint-disable-next-line no-console
          console.log(response.data)
        })
    },
    showModal (municipe) {
      if (municipe) {
        this.$refs.municipeForm.loadData(municipe)
      }
      this.show = !this.show
    }
  }
}
</script>
<style scoped>
  img {
    width: 100px;
    height: 100px;
  }
</style>
