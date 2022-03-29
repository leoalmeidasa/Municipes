<template>
  <div class="mb-2">
    <label :for="id" class="form-label">{{ label }}</label>
    <input
      :id="id"
      :type="type"
      :value="value"
      :checked="checked"
      class="form-control"
      v-on="listeners"
    >
  </div>
</template>

<script>
export default {
  name: 'InputField',
  props: {
    // eslint-disable-next-line vue/require-default-prop
    id: {
      type: String
    },
    // eslint-disable-next-line vue/require-default-prop
    type: {
      type: String
    },
    // eslint-disable-next-line vue/require-default-prop
    label: {
      type: String
    },
    // eslint-disable-next-line vue/require-default-prop
    value: {
      type: String
    },
    checked: {
      type: Boolean,
      default: false
    }
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
