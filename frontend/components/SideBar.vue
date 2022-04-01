<template>
  <div class="sidebar">
    <nav class="main-menu">
      <h3>Munícipes</h3>
      <ul>
        <li>
          <NuxtLink to="/">
            <i class="fa fa-home fa-2x" />
            <span class="link">DashBoard</span>
          </NuxtLink>
        </li>
      </ul>
    </nav>
  </div>
</template>
<script>
export default {
  methods: {
    navigateSidebar (route) {
      this.$router.push({ name: route })
    }
  }
}
</script>
<style scoped>
  @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
  @import url(https://fonts.googleapis.com/css?family=Titillium+Web:300);
  h3 {
    font-weight:bold;
    font-size:1.6em;
    font-style:normal;
    margin: 2em 0 2em 0.81em;
    color:rgb(255,255,255);
    border-bottom: 4px solid rgb(155,155,155);
  }
  .fa-2x {
    font-size: 2em;
    margin-top: 10%;
  }
  .fa {
    position: relative;
    display: table-cell;
    width: 60px;
    height: 36px;
    text-align: center;
    vertical-align: middle;
    font-size:20px;
  }

  .main-menu {
    position: fixed;
    width: 18%;
    height: 100%;
    background:#212121;
    color:white;
    top:60px;
    bottom:0;
    border-right:1px solid #660924;
  }

  .main-menu>ul {
    margin:7px 0;
  }

  .main-menu li {
    position:relative;
    display:block;
    width:100%;
  }

  .main-menu li>a {
    position:relative;
    border-spacing:0;
    color:white;
    font-size: 14px;
    text-decoration:none;
  }

  .main-menu .nav-icon {
    position:relative;
    width:60px;
    height:36px;
    text-align:center;
    vertical-align:middle;
    font-size:18px;
  }

  .link {
    position:relative;
    display:table-cell;
    vertical-align:middle;
    width:190px;
  }
  @font-face {
    font-family: 'Titillium Web';
    font-style: normal;
    font-weight: 300;
    src: local('Titillium WebLight'), local('TitilliumWeb-Light'), url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff) format('woff');
  }
</style>
