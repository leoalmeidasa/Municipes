<template>
  <div class="table-responsive text-nowrap">
    <table
      class="table table-light table-striped table-hover table-bordered table-advance"
      height="250"
      fixed-header
    >
      <template v-if="municipesIsNotEmpty">
        <thead>
          <tr>
            <th>Foto</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>CNS</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Status</th>
            <th>Ação</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(municipe, index) in municipesList" :key="index">
            <td><img :src="municipe.photo.url"></td>
            <td>{{ municipe.description }}</td>
            <td>
              {{ municipe.cpf | VMask('###.###.###-##') }}
            </td>
            <td>{{ municipe.cns | VMask('### #### #### ####') }}</td>
            <td>{{ municipe.email }}</td>
            <td>{{ municipe.telephone | VMask('(##) # ####-####') }}</td>
            <td>{{ municipe.status ? 'Ativo' : 'Inativo' }}</td>
            <td>
              <button type="button" class="btn btn-warning btn-sm" @click="funcEdition(index)">
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
    width: 50px;
    height: 50px;
  }
  .table-responsive {
    min-height: .01%;
    overflow-x: auto;
    margin-left: 19%;
    margin-right: 1%;
    width: 80%
  }
  .table {
    margin-bottom: 20px;
    border-spacing: 0;
    border-collapse: collapse;
  }
  tr {
    text-align: center;
    border-left: 1px solid #ccc;
  }
  .table td {
    text-align: center;
    vertical-align: middle;
  }
  th {
    border-left: 1px solid #ccc;
    text-align: center;
    padding: 8px;
    color: #616161;
  }
</style>
