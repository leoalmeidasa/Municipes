<template>
  <main>
    <div class="flex-container">
      <div class="row">
        <div class="col">
          <table-simple />
          <NuxtLink to="/form" class="btn btn-outline btn-success">
            Novo Munícipe
          </NuxtLink>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import TableSimple from '~/components/TableSimple.vue'

export default {
  components: { TableSimple },
  layout: 'default'
}

</script>

<style>
  .flex-container {
     position: relative;
     overflow: auto;
     z-index: 1;
     padding: none;
  }
  #card-table {
    padding: none;
    margin-left: 20%;
    width: 80%;
    height: 100%;
    background-color:darkcyan;
    color: whitesmoke
  }
  .col {
    margin-left: 20%;
  }
  .row {
    margin-right: 0%;
  }
</style>
