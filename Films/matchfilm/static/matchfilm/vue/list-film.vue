<template>
        <div>
        <nav class="navbar navbar-expand-lg" style="background-color: #fecc00">
            <div class="container">
              <a class="navbar-brand color-black-title" href="http://127.0.0.1:8001/">
                   <img src="https://vignette.wikia.nocookie.net/deathbattle/images/4/47/VS.png/revision/latest?cb=20160727174407"
                        width="30" height="35" class="d-inline-block align-top" alt=""
                        @click="goToHome">
                    FilmCritique
              </a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link color-black" href="http://127.0.0.1:8001/listfilm">Film <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link color-black" href="http://127.0.0.1:8001/listactor">Acteurs</a>
                  </li>
                  <li class="nav-item" v-if="!nologin">
                    <a class="nav-link color-black" href="http://127.0.0.1:8001/user">Mon profil</a>
                  </li>
                </ul>
                <form v-if="nologin" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" v-model="form.username" placeholder="login" aria-label="login">
                    <input class="form-control mr-sm-2" type="password" v-model="form.password" placeholder="mdp" aria-label="mdp">
                    <button class="btn btn-success my-2 my-sm-0" @click.prevent="checkConnection">Connexion</button>
                </form>
                <span v-if="!nologin">
                    <label class="font-weight-bold">Bienvenue {{ username_login}} </label>
                    <button class="btn btn-success my-2 my-sm-0" @click.prevent="disConnection">Deconnexion</button>
                </span>

              </div>
            </div>
        </nav>
          <div class="select-film">
            <div class="mx-auto w-50 p-1 text-white text-center">
                 <select2 v-model="film_data"
                        :options="films"
                        :custom-label="nameWithLang"
                        label="name"
                        select-label=""
                        selected-label=""
                        :show-labels="false"
                        placeholder="Recherchez des Film(s), Acteur(s)..."
                        :taggable="true"
                        :maxHeight=400
                        tagPlaceholder="appuyer sur entrer pour ajouter ce film à la base de donnée"
                        @tag="addNameFilm"
                        @input="ChangePage(film_data)">
                        <template slot="option" slot-scope="props">
                            <div class="row m-1">
                                 <div>
                                     <img class="option_small" :src="props.option.img">
                                 </div>
                                <div class="col">
                                    <div>
                                         <span class="option__title">{{ props.option.name }}</span>
                                    </div>
                                     <div>
                                        <span class="option__real">{{  props.option.realisateur }}</span>
                                     </div>
                                </div>
                            </div>
                            <hr class="m-0">
                        </template>
                 </select2>
                </div>
            </div>
        </div>
</template>
<script>
    import Multiselect from 'vue-multiselect';
    import Vue from 'vue'
    import axios from 'axios'
    import swal from 'sweetalert';
    Vue.component('select2', Multiselect);
    export default {
        name: "ListFilm",
        props: {
            films: Array,
            nologin: Boolean,
            username_login: '',
        },
        components:{},
        data: function () {
            return {
                edition_mode: false,
                edit_row: {},
                film_data: [],

                form:{
                    username: '',
                    password: ''
                },

            }
        },
        methods:{
            nameWithLang ({ name, realisateur }) {
              return `${name} +-+ ${realisateur}`
            },
            addNameFilm (newFilm) {
                this.$emit('add-name-film', newFilm)
            },
            ChangePage: function (data) {
                this.$emit('selectfilm',this.film_data);
                axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/film',
                     data:  {
                        film_info: this.film_data
                     }
                });
                window.location='http://127.0.0.1:8001/filminfo'
            },
            goToHome: function () {
                 window.location='http://127.0.0.1:8001/'
            },
            checkConnection: function () {
                axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/getconnexion',
                     data:  {
                        connexion_info: this.form
                     }
                })
                .then((response) => {
                        if(response.data.message_ret === 1){
                            swal("Error!", 'Login ou mot de passe incorect ', "warning");
                            this.form.username = '';
                            this.form.password = '';
                        }
                        else{
                             this.$emit('connexion');
                             swal("Connexion OK!", 'Bienvenue sur FilmCritique ' + this.form.username, "success");
                        }
                });
            },
            disConnection: function () {
                 axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/deconnexion',
                     data:  {
                     }
                });
                this.$emit('deconnexion');
                this.form.username = '';
                this.form.password = '';
            }

        },
    }
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>

<style scoped>

h3{
    text-align: center;
}

a{
    text-decoration: none;/*Pour que le lien ne soit plus "souligné"...*/
}
.img_film {
    height: 150px;
    width: 250px;
    padding-right: 70px;
    opacity: 1;
    margin: 0px;
}

.h3-title {
    font-size: 42px;
    font-family: 'Lato', Arial, 'Helvetica Neue', Helvetica, sans-serif;
    font-weight: 700;
    line-height: 44px;
    margin-right: 10px;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .5);
    -ms-word-wrap: break-word;
    word-wrap: break-word;
    color: black;
    opacity: 1;
}
.option__image{
    height: 100px;
    width: 80px;
}
.color-black{
    color: black;
    font-weight: bold;
    font-size: 20px;

}
.color-black-title{
    color: black;
    font-weight: bold;
    font-size: 30px;

}
.option_small{
    width: 60px;
    height: 80px;
}
.option__title{
    font-weight: bold;
}
.option__real{
    font-size: 80%;
}
.nav-link:hover{
    color: white;
}
</style>
