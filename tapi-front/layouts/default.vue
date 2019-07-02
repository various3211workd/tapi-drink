<template>
  <div id="app">
    <v-app id="inspire" style="background: #FFCC80">
      <!-- header -->
      <v-toolbar color="orange darken-2" dark fixed app clipped-right>
        <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
        <v-toolbar-title>
          <router-link to="/" style="color: white; text-decoration: none;">Tapi-Drink</router-link>
        </v-toolbar-title>
        <v-spacer></v-spacer>
      </v-toolbar>
      
      <!-- drawer -->
      <v-navigation-drawer fixed v-model="drawer" app>
        <v-toolbar flat color="orange darken-4">
          <v-list>
            <v-list-tile>
              <div v-if="$store.getters.isSignedIn">
                <setLoginData/>
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

        <v-list>
          <v-list-tile to="/">
            <v-list-tile-action>
              <v-icon>home</v-icon>
            </v-list-tile-action>
            <v-list-tile-title>ホーム画面</v-list-tile-title>
          </v-list-tile>

          <v-list-group prepend-icon="account_circle" value="true">
            <template v-slot:activator>
              <v-list-tile>
                <v-list-tile-title>アカウント</v-list-tile-title>
              </v-list-tile>
            </template>

          <v-list dense class="pt-0">
            <div v-if="$store.getters.isSignedIn">
              <v-list-tile v-for="crud in crudsLogin" :key="crud.title" :to="crud.url">
                <v-list-tile-action>
                  <v-icon>{{ crud.icon }}</v-icon>
                </v-list-tile-action>
                <v-list-tile-content>
                  <v-list-tile-title>{{ crud.title }}</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </div>
            <div v-else>
              <v-list-tile v-for="crud in cruds" :key="crud.title" :to="crud.url">
                <v-list-tile-action>
                  <v-icon>{{ crud.icon }}</v-icon>
                </v-list-tile-action>
                <v-list-tile-content>
                  <v-list-tile-title>{{ crud.title }}</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </div>

          </v-list>
          
          </v-list-group>
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
import DeleteUser from '~/pages/delete_user';

export default {
  components: {
    MyFooter,
    CreateUser,
    LoginUser,
    DeleteUser
  },
  data: () => ({
    drawer: null,
    /* 
      in pages view header
    */
    drawer: false,
    drawerRight: true,
    left: null,
    cruds: [
      { title: 'ログイン', icon: 'fa fa-user', url: '/login_user' },
      { title: 'ユーザ作成', icon: 'fa fa-user-plus', url: '/create_user' },
    ],
    crudsLogin: [
      { title: 'ログアウト', icon: 'fa fa-user-minus', url: '/logout_user' },
      { title: 'ユーザ削除', icon: 'fa fa-user-minus', url: '/delete_user' },
    ]
  })
}
</script>