<template>
  <div>
    <form>
      <h4>Dados Pessoais</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_nome" label="Nome" type="text" @updateValue="description=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cpf" label="Cpf" type="text" @updateValue="cpf=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cns" label="Cns" type="text" @updateValue="cns=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField id="id_data" label="Data de Nascimento" type="date" @updateValue="birth_date=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_email" label="Email" type="text" @updateValue="email=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_fone" label="Fone" type="text" @updateValue="telephone=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <label class="col-form-label">Foto :</label>
          <input type="file" @change="setImage">
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_status" label="Status" type="checkbox" @updateValue="status=$event" />
        </div>
      </div>

      <h4>Endereço</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cep" label="Cep" type="number" @updateValue="cep=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_rua" label="Rua" type="text" @updateValue="street=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField id="id_complemento" label="Complemento" type="text" @updateValue="complement=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_bairro" label="Bairro" type="text" @updateValue="district=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cidade" label="Cidade" type="text" @updateValue="city=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_estado" label="Estado" type="text" @updateValue="uf=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_ibge" label="Codigo IBGE" type="number" @updateValue="ibge_code=$event" />
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
      description: '',
      cpf: '',
      cns: '',
      email: '',
      birth_date: '',
      telephone: '',
      status: '',
      photo: '',
      public_place: '',
      complement: '',
      ibge_code: '',
      district: '',
      city: '',
      cep: '',
      uf: ''
    }
  },
  mounted () {
    this.loadData()
  },
  methods: {
    async fetchMunicipes () {
      return await this.$axios.$get(`${this.$axios.defaults.baseURL}`)
    },
    handleCheck (value, municipe) {
      const componentForm = this
      this.$axios.$put(`${this.$axios.defaults.baseURL}${municipe.id}`, {
        ...municipe,
        status: value
      }).then(function (response) {
        if (response) {
          municipe.status = value
        } else {
          componentForm.$notify({
            text: 'Ocorreu um erro ao atualizar!',
            type: 'warn'
          })
        }
      })
        .catch(function (error) {
          componentForm.$notify({
            text: `ERROR: ${error}`,
            type: 'error'
          })
        })
    },
    setImage (e) {
      this.photo = e.target.files[0]
    },
    // Collecting everything inside our FormData object
    loadData (obj) {
      if (obj) {
        this.description = obj.description || ''
        this.cpf = obj.cpf || ''
        this.cns = obj.cns || ''
        this.email = obj.email || ''
        this.birth_date = this.$dateFormatting(obj.birth_date) || ''
        this.telephone = obj.telephone || ''
        this.status = obj.status || false
        if (obj.photo) {
          this.objFile = { file: undefined, url: this.$axios.defaults.baseURL + obj.photo.url }
        }
        if (obj.endereco) {
          if (obj.endereco.length > 0) {
            this.street = obj.endereco[0].street
            this.complement = obj.endereco[0].complement
            this.ibge_code = obj.endereco[0].ibge_code
            this.district = obj.endereco[0].district
            this.city = obj.endereco[0].city
            this.cep = obj.endereco[0].cep
            this.uf = obj.endereco[0].uf
          }
        }
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
      formData.append('public_place', this.public_place)
      formData.append('complement', this.complement)
      formData.append('ibge_code', this.ibge_code)
      formData.append('district', this.district)
      formData.append('city', this.city)
      formData.append('cep', this.cep.replace(/\D/g, ''))
      formData.append('uf', this.uf)

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
