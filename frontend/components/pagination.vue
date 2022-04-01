<template>
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <li class="page-item">
        <a class="page-link" @click="paginateFunc(page)">Previous</a>
      </li>
      <li class="page-item">
        <a class="page-link" @click="paginateFunc(1)">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" @click="paginateFunc(2)">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" @click="paginateFunc(3)">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" @click="paginateFunc(4)">4</a>
      </li>
      <li class="page-item">
        <a class="page-link" @click="paginateFunc(page)">Next</a>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  props: {
    // eslint-disable-next-line vue/require-default-prop
    paginateFunc: Function
  },
  data () {
    return {
      pagination: ''
    }
  }
}
</script>
<style scoped>
  nav {
    margin-top: 0%;
    margin-left: 18%;
    cursor:pointer;
  }
</style>
