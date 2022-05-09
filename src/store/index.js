import Vue from 'vue'
import Vuex from 'vuex'
import router from '@/router/index'

// Modules
import app from './app'
import appConfig from './app-config'
import verticalMenu from './vertical-menu'


Vue.use(Vuex)

export default new Vuex.Store({
  strict: process.env.DEV,
  modules: {
    app,
    appConfig,
    verticalMenu,
  },
  state: {
    link: 'https://www.sahguard.com/api/webservis.php',
    userToken: '',
  },
  mutations: {
    setToken(state, token) {
      state.userToken = token
      localStorage.setItem('userToken', token)
    },
    clearToken(state) {
      state.userToken = ''
    },
  },
  actions: {
    login({ commit, state }, authData) {
      const data = {
        serviceName: "account",
        methodName: "logIn",
        user: authData.user,
        pwd: authData.pwd,
        firmaKodu: authData.firmaKodu,
      };
      $.ajax({
        type: "POST",
        url: state.link,
        data: data,
        success: function (res) {
          if (res.status == 200) {
            commit('setToken', res.userToken)
            router.push('/')
            console.log(res);
          } else {
            console.log('Giriş Başarısız');
          }
          return false
        },
        dataType: 'json'
      });
    },
    logout({ commit }) {
      localStorage.removeItem('userToken')
      commit('clearToken')
      router.push('/login')
    }
  }
})
