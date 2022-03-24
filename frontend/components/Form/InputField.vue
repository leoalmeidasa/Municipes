<template>
  <div class="mb-2">
    <label :for="id" class="form-label">{{ label }}</label>
    <input :id="id" :type="type" class="form-control" v-on="listeners">
  </div>
</template>

<script>
export default {
  name: 'InputField',
  props: {
    // eslint-disable-next-line vue/require-default-prop
    id: String,
    // eslint-disable-next-line vue/require-default-prop
    type: String,
    // eslint-disable-next-line vue/require-default-prop
    label: String
  },
  computed: {
    listeners () {
      return {
        input: this.updateValue
      }
    }
  },
  methods: {
    updateValue (event) {
      const value = event.target.value
      this.$emit('updateValue', value)
    }
  }
}
</script>
