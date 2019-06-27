<template>
  <div id="app">
    <v-app id="inspire" style="background: #FFCC80">
      <!-- header -->
      <v-toolbar color="orange darken-2" dark fixed app clipped-right>
        <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
        <v-toolbar-title>Tapi-Drink</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-toolbar-items class="hidden-sm-and-down">
          <v-btn flat v-for="item in items" :key="item.title" :to="item.url">
            {{ item.title }}
          </v-btn>
        </v-toolbar-items>
      </v-toolbar>
      
      <!-- drawer -->
      <v-navigation-drawer fixed v-model="drawer" app>
        <v-toolbar flat>
          <v-list>
            <v-list-tile>
              <!-- watch loggin state -->
              <div v-if="$store.getters.isSignedIn">
                <v-list-tile avatar>
                  <v-list-tile-avatar>
                    <v-icon medium>account_circle</v-icon>
                  </v-list-tile-avatar>
                  <v-list-tile-content>
                    <v-list-tile-title class="title">
                      {{ $store.state.user }}
                    </v-list-tile-title>
                  </v-list-tile-content>
                </v-list-tile>
              </div>
            </v-list-tile>
          </v-list>
        </v-toolbar>
        <v-list dense class="pt-0">
        <v-list-tile v-for="item in items" :key="item.title" :to="item.url">
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
      </v-navigation-drawer>
      
      <!-- content -->
      <v-content>
        <v-container fluid fill-height>
          <v-layout justify-center align-center>
            <v-flex text-xs-center>
            <div>
              <nuxt/>
            </div>
          </v-flex>
          </v-layout>
        </v-container>
      </v-content>
      
      <!-- footer -->
      <MyFooter />
    
    </v-app>
  </div>
</template>

<script>
import MyFooter from '~/components/Footer';
import CreateUser from '~/pages/create_user';
import LoginUser from '~/pages/login_user';

export default {
  components: {
    MyFooter,
    CreateUser,
    LoginUser
  },
  data: () => ({
    drawer: null,
    /* 
      in pages view header
    */
    items: [
      { title: 'Home', icon: 'home', url: '/' },
      { title: 'CreateUser', icon: 'fa fa-user-plus', url: '/create_user' },
      { title: 'LoginUser', icon: 'fa fa-user', url: '/login_user' },
    ],
    drawer: false,
    drawerRight: true,
    left: null
  })
}
</script>