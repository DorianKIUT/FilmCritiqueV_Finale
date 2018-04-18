<template>
    <div class="container" v-if="no_favorite">
        <h3 class="mx-auto justify-content-center text-center m-2">Vos Films coup de coeur <i class="fa fa-heart" aria-hidden="true"  style="color: red">  </i ></h3>

            <div class="row">
                <div v-for="film in all_films_user" class="mx-auto m-2">
                    <i class="fa fa-video-camera m-1 fa-2x" style="color: limegreen" aria-hidden="true"
                       @click.prevent="goToFilm(film)"></i>
                    <div class="col mx-auto">
                        <vue-flashcard class="size-flashcard"
                            :front=film.name
                            textSizeFront="1.5em"
                            :back=film.resume
                            :headerFront=film.genre
                            :imgFront=film.img :class="img-display"
                            :footerFront=film.realisateur
                            textSizeBack="1.15em"
                            headerBack="Résumé"
                            :footerBack=film.actors
                            >
                        </vue-flashcard>
                    </div>
                        <span>
                            <star-rating  class="padding-star2 text-center" v-model="film.note_film" :read-only="true"
                                         :increment="0.1"
                                         :star-size="20" :show-rating="false"/>
                        </span>

                </div>
            </div>
        </div>
        <h3 v-else>'Vous n'avez pas encore ajouter de films à vos favoris'</h3>
</template>

<script>
    import Vue from 'vue'
    import vueFlashcard from 'vue-flashcard';
    import StarRating from 'vue-star-rating';
    import Multiselect from 'vue-multiselect';
    Vue.component('select2', Multiselect);
    import axios from 'axios'
    export default {
        name: "AllFilmUserDisplay",
        props: {
            films: Array,
            nologin: Boolean,
        },
        components: {StarRating, vueFlashcard},
        data: function () {
            return {
                all_films_user: this.films,
                no_favorite: true
            }
        },
        mounted: function () {
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getallfilmsuser'
            })
                .then((response) => {
                    this.all_films_user = response.data.all_film_user
                })
        },
        methods: {
            goToFilm: function (film) {
                this.$emit('selectfilm', film)
                axios({
                    method: 'POST',
                    url: 'http://127.0.0.1:8001/film',
                    data: {
                        film_info: film
                    }
                });
                window.location = 'http://127.0.0.1:8001/filminfo'
            },
        },
        computed: {
            film_updated: function () {
                return this.films = this.all_films_user
            },
            active_log: function () {
                var log = '';
                return log = this.nologin
            },
        },
        watch: {
            all_films_user: function () {
                if (this.all_films_user.length < 1) {
                    this.no_favorite = false;
                }
            },

        }
    }
</script>


<style scoped>
.img-display{
    width: 150px;
    height: 200px;
}
.mb8{
    margin-bottom: 8px;
}
.padding-star{
    padding-left: 22%;
}

.size-header{
    width: 180px;
}
.size-flashcard{
    width: 280px;
    height: 300px;
    margin-bottom: 80px;
    font-size: 10px;
}
.padding-star2{
    padding-top: 10px;
    margin-top: 10px;
    margin-left: 40px;
    padding-left: 22%;
}
</style>