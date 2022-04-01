<template>
  <div id="filters" class="col-xs-12 well hidden">
    <div class="form-group col-md-5 lg-4">
      <input-field type="search" placeholder="Buscar Munícipe" @updateValue="query=$event" />
    </div>
    <div class="form-group col-md-2">
      <button class="btn btn-primary" @click="searchFunc(query)">
        Buscar
      </button>
    </div>
  </div>
</template>

<script>
import InputField from './Form/InputField.vue'
export default {
  components: { InputField },
  props: {
    // eslint-disable-next-line vue/require-default-prop
    searchFunc: Function
  },
  data () {
    return {
      query: ''
    }
  }
}
</script>
<style scoped>
  #filters {
    margin-top: 7%;
    margin-left: 18%;
    width: 60%;
  }
  .btn-primary {
    color: #fff;
    background: #00bcd4;
    border-color: #00bcd4;
    box-shadow: none;
  }

  button {
    color: #fff;
    background-color: #00bcd4;
    border-color: #00bcd4;
    box-shadow: none;
  }
</style>
