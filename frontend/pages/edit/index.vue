<template>
  <div>
    <form>
      <h4>Dados Pessoais</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_nome" label="Nome" type="text" :value="description" @updateValue="description = $event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cpf" label="Cpf" type="text" :value="cpf" @updateValue="cpf=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cns" label="Cns" type="text" :value="cns" @updateValue="cns=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField id="id_data" label="Data de Nascimento" :value="birth_date" type="date" @updateValue="birth_date=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_email" label="Email" type="text" :value="email" @updateValue="email=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_fone" label="Fone" type="text" :value="telephone" @updateValue="telephone=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <label class="col-form-label">Foto :</label>
          <input type="file" @change="setImage">
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_status" label="Status" type="checkbox" :checked="status" @updateValue="status=$event" />
        </div>
      </div>

      <h4>Endereço</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cep" label="Cep" type="number" :value="cep" @updateValue="cep=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_rua" label="Rua" type="text" :value="street" @updateValue="street=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField id="id_complemento" label="Complemento" type="text" :value="complement" @updateValue="complement=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_bairro" label="Bairro" type="text" :value="district" @updateValue="district=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_cidade" label="Cidade" type="text" :value="city" @updateValue="city=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_estado" label="Estado" type="text" :value="district" @updateValue="uf=$event" />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField id="id_ibge" label="Codigo IBGE" type="number" :value="ibge_code" @updateValue="ibge_code=$event" />
        </div>
      </div>
      <button type="button" class="btn btn-outline-primary" @click="createItem">
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
      id: '',
      description: '',
      cpf: '',
      cns: '',
      email: '',
      birth_date: '',
      telephone: '',
      status: '',
      photo: '',
      id_endereco: '',
      street: '',
      complement: '',
      ibge_code: '',
      district: '',
      city: '',
      cep: '',
      uf: ''
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
        this.id = this.municipeEdit.id
        this.description = this.municipeEdit.description
        this.cpf = this.municipeEdit.cpf
        this.cns = this.municipeEdit.cns
        this.email = this.municipeEdit.email
        this.birth_date = this.municipeEdit.birth_date
        this.telephone = this.municipeEdit.telephone
        this.status = this.municipeEdit.status
        this.photo = this.municipeEdit.photo
        this.id_endereco = this.municipeEdit.endereco.id
        this.street = this.municipeEdit.endereco.street
        this.complement = this.municipeEdit.endereco.complement
        this.ibge_code = this.municipeEdit.endereco.IBGE_code
        this.district = this.municipeEdit.endereco.district
        this.city = this.municipeEdit.endereco.city
        this.cep = this.municipeEdit.endereco.CEP
        this.uf = this.municipeEdit.endereco.UF
      }
    },
    // Collecting everything inside our FormData object
    createItem () {
      const formData = new FormData()
      formData.append('description', this.description)
      formData.append('cpf', this.cpf)
      formData.append('cns', this.cns)
      formData.append('email', this.email)
      formData.append('birth_date', this.birth_date)
      formData.append('telephone', this.telephone)
      formData.append('status', this.status)
      formData.append('photo', this.photo)
      formData.append('endereco_attributes[id]', this.id_endereco)
      formData.append('endereco_attributes[street]', this.street)
      formData.append('endereco_attributes[complement]', this.complement)
      formData.append('endereco_attributes[IBGE_code]', this.ibge_code)
      formData.append('endereco_attributes[district]', this.district)
      formData.append('endereco_attributes[city]', this.city)
      formData.append('endereco_attributes[CEP]', this.cep)
      formData.append('endereco_attributes[UF]', this.uf)

      // Finally, sending the POST request with our beloved Axios
      this.$axios.$put(`/municipes/${this.id}`, formData).then((resp) => {
        if (resp.status === 'SUCCESS') {
          this.$router.push({
            path: '/'
          })
        }
      })
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
