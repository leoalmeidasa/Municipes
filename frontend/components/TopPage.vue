<template>
  <nav id="top-navbar" class="navbar navbar-fixed-top navbar-scroll navbar-scroll-fixed navbar-color" role="navigation">
    <div class="campanha-title-container">
      <img class="logo" height="60" width="60" src="~/assets/img.jpeg">
      <h5 class="campanha-title">
        OM30
      </h5>
    </div>
    <span id="title-top" class="navbar-text"><strong>SICAM - SISTEMA CADASTRO DE MUNÍCIPES</strong></span>
  </nav>
</template>

<style scoped>
  #top-navbar {
    font-family: Roboto,sans-serif;
    background: #660924;
    flex-wrap: none;
    position:fixed;
    width: 100%;
    top: 0;
    padding-bottom: 0;
  }
  #title-top {
    margin-right: 35%;
    text-align: center;
    color: white;
    margin-bottom: 1%;
  }
  .logo {
    display: block;
    max-height: 40px;
  }
  .campanha-title-container {
    display: flex;
    align-items: center;
  }
  .campanha-title-container .campanha-title {
    color: #FFFFFF;
    max-height: 17px;
    -webkit-line-clamp: 1;
    flex: 1;
    padding-left: 13px;
  }
</style>
