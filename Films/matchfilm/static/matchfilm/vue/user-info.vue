<template>
    <div>
        <div class="container">
            <div class="w-75 p-3 bg-warning text-white text-center justify-content-center mx-auto">
                <div class="container color-container mx-auto">
                    <div class="align-items-center justify-content-center">
                        <h3 class="h3-title" style="color: black">{{username_login}}</h3>
                            <div class="text-center justify-content-center mx-auto">
                                   <bar-chart class="justify-content-center mx-auto"
                                              height="100px" :data="[['Nombre de Critique FILM', nb_film_reviews], ['Nombre de Critique Actor', nb_actor_reviews]]"></bar-chart>
                            </div>
                        </div>
                    </div>
                </div>
                <h3 class="mx-auto justify-content-center text-center m-2">Vos Films coup de coeur
                    <i class="fa fa-heart" aria-hidden="true"  style="color: red">  </i >
                </h3>
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
                <!--<div class="w-150 p-3 m-2 bg-warning">-->
                    <!--<div class="container film-color-container">-->
                     <!--<div class="row">-->
                        <!--<div class="mx-auto " v-for="film in all_films_user">-->
                            <!--<div class="col m-2 ">-->
                                <!--<div class="card mb8 hover-card">-->
                                    <!--<div class="card-header size-header p-0">-->
                                        <!--<label>{{film.name}}</label>-->
                                    <!--</div>-->
                                    <!--<div class="card-body p-0 text-center justify-content-center mx-auto ">-->
                                        <!--<img class="mx-auto img-display p-2" :src="film.img" @click="goToFilm(film)">-->
                                        <!--<star-rating class="padding-star text-center justify-content-center mx-auto " v-model="film.note_film" :read-only="true"-->
                                                     <!--:increment="0.1"-->
                                                     <!--:star-size="20" :show-rating="false"/>-->
                                    <!--</div>-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</div>-->
        </div>
    </div>
</template>

<script>

    import Vue from 'vue'
    import vueFlashcard from 'vue-flashcard';
    import Chartkick from 'chartkick'
    import VueChartkick from 'vue-chartkick'
    import Chart from 'chart.js'
    import Multiselect from 'vue-multiselect';
    import axios from 'axios'
    import StarRating from 'vue-star-rating'
    import infiniteScroll from 'vue-infinite-scroll';
    import InfiniteLoading from 'vue-infinite-loading';
    import vueSlider from 'vue-slider-component';
    Vue.use(infiniteScroll);
    Vue.use(VueChartkick, { Chartkick });
    Vue.component('select2', Multiselect);
    export default {
        name: "UserInfo",
        props:{
            username_login: ''
        },
        components:{StarRating, InfiniteLoading, vueSlider, vueFlashcard},
        mounted: function () {
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getallfilmsuser'
            })
           .then((response) => {
                    this.all_films_user = response.data.all_film_user
                });
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getcountuserreview'
            })
            .then((response) => {
                    this.nb_actor_reviews = response.data.nb_actor_reviews;
                    this.nb_film_reviews = response.data.nb_film_reviews;
                });

        },
        data: function () {
            return {
                count: 0,
                film_data: Array,
                note_global: 0,
                count_globale: 0,
                sum_globale: 0,
                actor_selected: Array,
                all_notes: Array,
                all_films_actor_selected: Array,
                new_critique: '',
                no_review: false,
                film_option: false,
                acteur_option: false,
                film_select: true,
                actor_select: false,
                note_selected: [0,5],
                actors: Array,
                select_filter: '',
                test_filter: Array,
                testif: false,
                all_films_user: Array,
                nb_actor_reviews: 0,
                nb_film_reviews: 0,
                options: {
                    value:[0,0],
                    min: 0,
                    max: 5,
                    interval: 0.5
                  }


            }
        },
         watch: {

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
            }

    }
</script>


<style scoped>

.h3-title {
    font-size: 31px;
    font-family: 'Lato', Arial, 'Helvetica Neue', Helvetica, sans-serif;
    font-weight: 700;
    line-height: 44px;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .5);
    -ms-word-wrap: break-word;
    word-wrap: break-word;
    color: white;
}

.big-marks-film{
    height: 50px;
    color: white;
    /*padding-left: 135px;*/
}

.nb-note{
    font-size: 30px;
    color: white;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .5);
    -ms-word-wrap: break-word;
    word-wrap: break-word;
}


.color-container {
    background-color: #F5F5F5;
}
.padding-chart{
    margin-top: 0px;
}
.img_film {
    width: 150px;
    height: 200px;
}

.img-display{
    width: 150px;
    height: 200px;
}
.size-header{
    width: 180px;
}
.film-color-container{
   background-color: #F5F5F5;
}
.hover-card:hover{
    cursor: pointer;
}
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



