<template>
  <div>
    <form>
      <h4>Dados Pessoais</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_nome"
            label="Nome"
            required
            type="text"
            @updateValue="description=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_cpf"
            label="CPF"
            required
            type="text"
            @updateValue="cpf=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_cns"
            label="CNS"
            required
            type="text"
            @updateValue="cns=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField
            id="id_data"
            label="Data de Nascimento"
            required
            type="date"
            @updateValue="birth_date=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_email"
            label="Email"
            required
            type="text"
            @updateValue="email=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_fone"
            label="Fone"
            required
            type="text"
            @updateValue="telephone=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <label class="col-form-label">Foto :</label>
          <input type="file" @change="setImage">
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_status"
            label="Status"
            required
            :checked="status"
            type="checkbox"
            @updateValue="status=$event"
          />
        </div>
      </div>

      <h4>Endereço</h4><hr>
      <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_cep"
            label="CEP"
            required
            type="number"
            @updateValue="cep=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_rua"
            label="Rua"
            required
            type="text"
            @updateValue="street=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
          <InputField
            id="id_complemento"
            label="Complemento"
            type="text"
            @updateValue="complement=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_bairro"
            label="Bairro"
            required
            type="text"
            @updateValue="district=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_cidade"
            label="Cidade"
            required
            type="text"
            @updateValue="city=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_estado"
            label="Estado"
            required
            type="text"
            @updateValue="uf=$event"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
          <InputField
            id="id_ibge"
            label="Codigo IBGE"
            type="number"
            @updateValue="ibge_code=$event"
          />
        </div>
      </div>
      <button type="button" class="btn btn-outline-success" @click="createItem">
        Cadastrar
      </button>
    </form>
  </div>
</template>

<script>
import InputField from '~/components/Form/InputField.vue'
export default {
  // eslint-disable-next-line vue/component-definition-name-casing
  name: 'form',
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
      street: '',
      complement: '',
      ibge_code: '',
      district: '',
      city: '',
      cep: '',
      uf: ''
    }
  },
  methods: {
    setImage (e) {
      this.photo = e.target.files[0]
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
      formData.append('endereco_attributes[street]', this.street)
      formData.append('endereco_attributes[complement]', this.complement)
      formData.append('endereco_attributes[IBGE_code]', this.ibge_code)
      formData.append('endereco_attributes[district]', this.district)
      formData.append('endereco_attributes[city]', this.city)
      formData.append('endereco_attributes[CEP]', this.cep)
      formData.append('endereco_attributes[UF]', this.uf)

      // Finally, sending the POST request with our beloved Axios
      this.$axios.$post('/municipes', formData).then((resp) => {
        if (resp.status === 'SUCCESS') {
          this.$router.back()
        }
      })
    }
  }
}
</script>

<style scoped>
form {
    margin-left: 19%;
    margin-right: 1%;
    background: #B2EBF2;
    padding: 10px;
    margin-top: 60px;
  }
  btn {
    margin-left: 0%;
  }
</style>
