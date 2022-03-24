<template>
  <div>
    <img-preview
      :file-object="objFile"
      :help-text="feedbackTextPhoto"
      :file-invalid="invalidPhoto"
      :change-image="handleImageSelection"
    />

    <div class="row">
      <custom-input
        id="photo"
        id-img-preview="preview"
        is-file-input
        hidden
        :required="urlImage == undefined"
        @updateValue="handleChangeImage"
      />
    </div>

    <h4>Dados do municipe</h4><hr>
    <div class="row mb-3">
      <div class="col-12 col-sm-12 col-md-6 col-lg-6 ">
        <custom-input
          label="Nome Completo"
          required
          :value="full_name"
          @updateValue="full_name = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="CPF"

          mask="###.###.###-##"
          required
          :value="cpf"
          :valid="invalidCpf"
          :invalid-text="feedbackTextCpf"
          @blur="validCpf"
          @updateValue="cpf = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="CNS"

          mask="### #### #### ####"
          required
          :value="cns"
          :valid="invalidCns"
          :invalid-text="feedbackTextCns"
          @blur="validCns"
          @updateValue="cns = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="Data de nascimento"

          input-type="date"
          required
          :value="'2021-12-10'"
          :valid="invalidDate"
          :invalid-text="feedbackTextDate"
          @blur="validDate"
          @updateValue="birth_date = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="Telefone"

          mask="(##) 9 ####-####"
          required
          :valid="invalidPhone"
          :invalid-text="feedbackTextPhone"
          :value="phone"
          @blur="validPhone"
          @updateValue="phone = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-12 col-lg-12 ">
        <custom-input
          label="Foto"

          id-img-preview="preview"
          is-file-input
          :required="urlImage == undefined"
          :valid="invalidPhoto"
          :invalid-text="feedbackTextPhoto"
          @updateValue="handleChangeImage"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-check-box
          id="is-active"
          text="Ativo"
          label="Status"
          :checked="status"
          @updateValue="status = $event.checked"
        />
      </div>
    </div>

    <h4>Endereço do municipe</h4><hr>

    <div class="row">
      <div class="col-12 col-sm-12 col-md-6 col-lg-6 ">
        <custom-input
          label="Logradouro"
          required
          :value="logradouro"
          @updateValue="logradouro = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="Complemento"
          :value="complement"
          @updateValue="complement = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="Code IBGE"
          :value="ibge_code"
          @updateValue="ibge_code = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="Bairro"
          required
          :value="district"
          @updateValue="district = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-4 col-lg-4 ">
        <custom-input
          label="Cidade"
          required
          :value="city"
          @updateValue="city = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
        <custom-input
          label="CEP"
          required
          :value="cep"
          mask="#####-###"
          @updateValue="cep = $event"
        />
      </div>
      <div class="col-12 col-sm-12 col-md-2 col-lg-2 ">
        <custom-input
          label="UF"
          required
          :value="uf"
          @updateValue="uf = $event"
        />
      </div>
    </div>
  </div>
</template>
