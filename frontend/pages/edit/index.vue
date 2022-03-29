<template>
  <div>
    <form>
      <h4>Dados Pessoais</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_nome" label="Nome" type="text" :value="municipe.description" @updateValue="description = $event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cpf" label="Cpf" type="text" :value="municipe.cpf" @updateValue="cpf=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cns" label="Cns" type="text" :value="municipe.cns" @updateValue="cns=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField id="id_data" label="Data de Nascimento" :value="municipe.birth_date" type="date" @updateValue="birth_date=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_email" label="Email" type="text" :value="municipe.email" @updateValue="email=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_fone" label="Fone" type="text" :value="municipe.telephone" @updateValue="telephone=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <label class="col-form-label">Foto :</label>
          <input type="file" @change="setImage">
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_status" label="Status" type="checkbox" :value="municipe.status" @updateValue="status=$event" />
        </div>
      </div>

      <h4>Endereço</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cep" label="Cep" type="number" :value="municipe.cep" @updateValue="cep=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_rua" label="Rua" type="text" :value="municipe.street" @updateValue="street=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField id="id_complemento" label="Complemento" type="text" :value="municipe.complement" @updateValue="complement=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_bairro" label="Bairro" type="text" :value="municipe.district" @updateValue="district=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cidade" label="Cidade" type="text" :value="municipe.city" @updateValue="city=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_estado" label="Estado" type="text" :value="municipe.district" @updateValue="uf=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_ibge" label="Codigo IBGE" type="number" :value="municipe.ibge_code" @updateValue="ibge_code=$event" />
        </div>
      </div>
      <button class="btn btn-outline-primary" @click="createItem">
        Editar
      </button>
    </form>
  </div>
</template>

<script>
import InputField from '~/components/Form/InputField.vue'

export default {
  name: 'MunicipeForm',
  components: { InputField },
  layout: 'default',
  data () {
    return {
      municipe: {}
    }
  },
  computed: {
    municipeEdit () {
      return this.$store.state.municipeEdit
    }
  },
  beforeMount () {
    this.loadData()
  },
  methods: {
    setImage (e) {
      this.photo = e.target.files[0]
    },
    // Collecting everything inside our FormData object
    loadData () {
      if (this.municipeEdit) {
        this.municipe = this.municipeEdit
      }
    },
    // Collecting everything inside our FormData object
    createItem () {
      const formData = new FormData()
      formData.append('description', this.description)
      formData.append('cpf', this.cpf.replace(/\D/g, ''))
      formData.append('cns', this.cns.replace(/\D/g, ''))
      formData.append('email', this.email)
      formData.append('birth_date', this.birth_date)
      formData.append('telephone', this.telephone.replace(/\D/g, ''))
      formData.append('status', this.status)
      formData.append('photo', this.photo)
      formData.append('street', this.street)
      formData.append('complement', this.complement)
      formData.append('IBGE_code', this.ibge_code)
      formData.append('district', this.district)
      formData.append('city', this.city)
      formData.append('CEP', this.cep.replace(/\D/g, ''))
      formData.append('UF', this.uf)

      // Finally, sending the POST request with our beloved Axios
      this.$axios.$post('/municipes', formData)
    }
  }
}
</script>

<style scoped>
form {
    margin-left: 20%;
    background: #B2EBF2;
    padding: 10px;
  }
</style>
