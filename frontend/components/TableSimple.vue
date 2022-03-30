<template>
  <div class="table-responsive text-nowrap">
    <table
      class="table table-striped table-hover table-bordered table-advance"
      height="250"
      fixed-header
    >
      <template v-if="municipesIsNotEmpty">
        <thead>
          <tr>
            <th>Foto</th>
            <th>Nome</th>
            <th>Cpf</th>
            <th>Cns</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Status</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(municipe, index) in municipesList" :key="index">
            <img :src="municipe.photo.url">
            <td>{{ municipe.description }}</td>
            <td>
              {{ municipe.cpf | VMask('###.###.###-##') }}
            </td>
            <td>{{ municipe.cns | VMask('### #### #### ####') }}</td>
            <td>{{ municipe.email }}</td>
            <td>{{ municipe.telephone | VMask('(##) # ####-####') }}</td>
            <td>{{ municipe.status ? 'Ativo' : 'Inativo' }}</td>
            <td>
              <button type="button" class="btn btn-primary btn-sm" @click="funcEdition(index)">
                Editar
              </button>
            </td>
          </tr>
        </tbody>
      </template>
      <template v-else>
        <tbody>
          <tr>
            <th>Dados Não encontrados</th>
          </tr>
        </tbody>
      </template>
    </table>
  </div>
</template>

<script>

export default {
  props: {
    // eslint-disable-next-line vue/require-default-prop
    municipesList: {
      type: Array,
      // eslint-disable-next-line vue/require-valid-default-prop
      default: []
    },
    // eslint-disable-next-line vue/require-default-prop
    funcEdition: Function
  },
  computed: {
    municipesIsNotEmpty () {
      return this.municipesList.length > 0
    }
  }
}
</script>
<style scoped>
  img {
    width: 100px;
    height: 100px;
  }
  .table-responsive {
    min-height: .01%;
    overflow-x: auto;
  }
  .table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    background-color: white;
    border-spacing: 0;
    border-collapse: collapse;
  }
  .table-bordered {
    border: 1px solid #423636;
  }
  tr {
    text-align: center;
  }
</style>
