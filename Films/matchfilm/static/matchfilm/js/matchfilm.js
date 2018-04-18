require('./bus');
//require('vue-multiselect/dist/vue-multiselect.min.css');
window.$ = window.jQuery = require('jquery');
require('bootstrap');
import 'bootstrap/dist/css/bootstrap.min.css';
import Vue from 'vue'
import axios from 'axios'
axios.defaults.xsrfCookieName = 'csrftoken';
axios.defaults.xsrfHeaderName = 'X-CSRFToken';
import $ from 'jquery'
import 'bootstrap';
import ListFilm from '../vue/list-film.vue'
import FilmInfo from '../vue/film-info.vue'
import AddFilm from '../vue/add-film.vue'
import AllFilmDisplay from '../vue/all-film-display.vue'
import ModalAddFilm from '../vue/modal-add-film.vue'
import AllActorDisplay from '../vue/all-actors-display.vue'
import ActorInfo from '../vue/actor-info.vue'
import ModalTrailer from '../vue/modal-trailer.vue'
import AllFilmUserDisplay from '../vue/all-film-user-display.vue'
import ButtonRegister from  '../vue/button-register.vue'
import ModalAddUser from  '../vue/modal-add-user.vue'
import FooterComponent from  '../vue/footer-component.vue'
import UserInfo from  '../vue/user-info.vue'

window.onload = function () {
    var app = new Vue({
        el: '#app',
        components: {
            ListFilm, FilmInfo, AddFilm, AllFilmDisplay,ModalAddFilm, AllActorDisplay, ActorInfo, ModalTrailer,
            AllFilmUserDisplay, ButtonRegister, ModalAddUser, FooterComponent, UserInfo
        },
        data: {
            films: [],
            reals: [],
            genre: [],
            actors: [],
            username_login: '',
            long_actors: [],
            film_selected:[],
            actor_selected: [],
            create_film: '',
            nologin: true,

        },
        mounted: function () {
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getallfilms'
            })
            .then((response) => {
                this.parse_film(response.data.allfilms)

            });
            this.getConnexionActive();

        },
        methods:{
            doSelectFilm: function (datafilm) {
                this.film_selected = datafilm;
                console.log(this.film_selected)

            },
            doSelectActor: function (dataactor) {
                this.actor_selected = dataactor;
                console.log(this.actor_selected)

            },
            insertFilmName: function (nameFilm) {
                console.log(nameFilm)
                this.create_film = nameFilm
            },
            doAddFilm: function (data_film) {
                console.log(data_film);
                 axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/addfilm',
                     data:  {
                        film_data: data_film
                     }
                })
                .then((response) => {
                this.parse_film(response.data.update_list_film)

            })

            },
            getconnexion: function () {
                this.getConnexionActive()

            },
             deconnexion: function () {
                this.getConnexionActive()
            },
            getConnexionActive: function (){
                 axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getconnexionactive'
            })
            .then((response) => {
                if (response.data['active_connexion'] === false) {
                    if(this.nologin === false){
                        this.nologin = true
                    }

            }
                else {
                    this.nologin = !this.nologin;
                    this.username_login = response.data['username']
                    }

                });

            },
            parse_film: function (data) {
                this.films = data;
                console.log(data);
                console.log(this.films);
                for(var film of this.films){
                    if (!this.reals.includes(film.realisateur))
                            this.reals.push(film.realisateur);
                    if (!this.genre.includes(film.genre))
                            this.genre.push(film.genre);
                    if (!film.actors.includes(','))
                        if (!this.actors.includes(film.actors))
                                this.actors.push(film.actors);
                    if (film.actors.includes(','))
                        this.long_actors = film.actors.split(',');
                        this.long_actors.pop();
                        for(var long_film of this.long_actors) {
                            if (!this.actors.includes(long_film))
                                this.actors.push(long_film);
                        }
                    }

            }

        }
    });
}







