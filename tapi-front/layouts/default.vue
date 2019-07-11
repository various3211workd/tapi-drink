<template>
  <div id="app">
    <v-app id="inspire" style="background-color: #FFE0B2;">
      <!-- header -->
      <v-toolbar color="orange darken-2" dark fixed app clipped-right>
        <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
        <v-toolbar-title>
          <router-link to="/" style="color: white; text-decoration: none;">Tapi-Drink</router-link>
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <SearchForm />
        <div v-if="true">
          <!-- user action alert -->
          <v-btn icon>
            <v-icon color="brown darken-1">notifications</v-icon>
          </v-btn>
        </div>
        <div v-else>
          <v-btn icon>
            <v-icon color="teal accent-2">notifications_active</v-icon>
          </v-btn>
        </div>
      </v-toolbar>
      
      <!-- drawer -->
      <v-navigation-drawer fixed v-model="drawer" app>
        <v-toolbar flat color="orange darken-2">
          <v-list>
            <v-list-tile>
              <div v-if="$store.getters.isSignedIn">
                <setLoginData/>
                <v-list-tile avatar>
                  <v-list-tile-avatar>
                    <v-img :src=$store.state.user_image_url></v-img>
                  </v-list-tile-avatar>
                  <v-list-tile-content>
                    <v-list-tile-title class="title">
                      <p style="color: white;">{{ $store.state.user }}</p>
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

          <!-- tapioka settings -->
          <div v-if="$store.getters.isSignedIn">
            <v-list-group prepend-icon="local_drink" value="true">
              <template v-slot:activator>
                <v-list-tile>
                  <v-list-tile-title>タピオカ</v-list-tile-title>
                </v-list-tile>
              </template>

              <v-list-tile v-for="shop in shops" :key="shop.title" :to="shop.url">
                <v-list-tile-action>
                  <v-icon>{{ shop.icon }}</v-icon>
                </v-list-tile-action>
                <v-list-tile-content>
                  <v-list-tile-title>{{ shop.title }}</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </v-list-group>
          </div>

          <!-- account settings -->
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
import SearchForm from '~/components/SearchForm';
import CreateUser from '~/pages/create_user';
import LoginUser from '~/pages/login_user';
import DeleteUser from '~/pages/delete_user';
import AddShop from '~/pages/add_shop';

export default {
  components: {
    MyFooter,
    SearchForm,
    CreateUser,
    LoginUser,
    DeleteUser,
    AddShop,
  },
  data: () => ({
    drawer: null,
    /* 
      in pages view header
    */
    drawer: false,
    drawerRight: true,
    shops: [
      { title: 'お店を追加', icon: '', url: '/add_shop' },
    ],
    cruds: [
      { title: 'ログイン', icon: 'fa fa-user', url: '/login_user' },
      { title: 'ユーザ作成', icon: 'fa fa-user-plus', url: '/create_user' },
    ],
    crudsLogin: [
      { title: 'ログアウト', icon: '', url: '/logout_user' },
      { title: 'ユーザ設定', icon: '', url: '/config_user' },
    ]
  })
}
</script>