<template>
  <div class="sidebar">
    <nav id="sidebar" class="sidebar-wrapper">
      <div class="profile">
        <img src="https://media-exp1.licdn.com/dms/image/C4E03AQFoh6LPspzsow/profile-displayphoto-shrink_800_800/0/1573563047233?e=1654128000&v=beta&t=Y-wA4BT0x-uwuqU6uXWfktElifQjVkLSQCR2C_VB79s" alt="profile_picture">
        <h3>Leonardo Almeida</h3>
        <p>Developer</p>
      </div>
      <ul>
        <li>
          <router-link tag="li" to="/" class="nav-item has-treeview">
            <a id="dashboard_tab" href="#" class="nav-link">
              <span>Dashboard</span>
            </a>
          </router-link>
        </li>
        <li>
          <router-link tag="li" to="/form" class="nav-item has-treeview">
            <a id="dashboard_tab" href="#" class="nav-link">
              <span>Novo Munícipe</span>
            </a>
          </router-link>
        </li>
      </ul>
    </nav>
  </div>
</template>
<style scoped>
  .sidebar {
    position: fixed;
    width:18%;
    height: 100%;
    background:#424242;
    color:white;
    max-height: 100%;
    position: fixed;
    top: 0;
    overflow-x: hidden;
    overflow-y: auto;
  }
  .sidebar li {
    list-style-type: none;
    text-decoration-line: none;
    position:relative;
    display: block;
  }
  .sidebar li a {
    margin-top: 10%;
    color:aliceblue;
  }
  .sidebar .profile{
    margin-bottom: 30px;
    text-align: center;
  }

  .sidebar .profile img{
    display: block;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin: 0 auto;
  }

  .sidebar .profile h3{
    color: #ffffff;
    margin: 10px 0 5px;
  }

  .sidebar .profile p{
    color: rgb(206, 240, 253);
    font-size: 14px;
  }
</style>
