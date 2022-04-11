<template>
  <div class="mb-2">
    <label v-if="label" :for="id" class="form-label">{{ label }}</label>
    <input
      :id="id"
      v-mask="mask"
      :type="type"
      :value="value"
      :checked="checked"
      :required="required"
      :placeholder="placeholder"
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
    },
    mask: {
      type: String,
      default: ''
    },
    required: {
      type: Boolean
    },
    // eslint-disable-next-line vue/require-default-prop
    placeholder: {
      type: String
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
      const value = this.type === 'checkbox' ? event.target.checked : event.target.value
      this.$emit('updateValue', value)
    }
  }
}
</script>
