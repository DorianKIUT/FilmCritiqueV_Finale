<template>
    <div>
    <div class="container">
        <div class="row">
            <div class="col-md-2 mx-auto">
              <div class="form-group has-feedback">
                <label>Filtre:</label>
                 <select2 v-model="film_filter"
                    :options="filter"
                    :multiple="false"
                    select-label=""
                    selected-label=""
                    deselect-label=""
                    placeholder="filtre les films"
                    @input="filter_data(film_filter)">
                 </select2>
                </div>
            </div>
            <div class="col-md-2 mx-auto" v-show="genre_selected">
              <div class="form-group has-feedback">
                <label>Filtre:</label>
                 <select2 v-model="genre_film"
                    :options="genre"
                    :multiple="false"
                    select-label=""
                    selected-label=""
                    deselect-label=""
                    placeholder="genre du film"
                    @input="filter_genre(genre_film)">
                 </select2>
                </div>
            </div>
        </div>
        <!--<div class="row">-->
            <!--<div v-for="film in all_films">-->
                <!--<div class="col">-->
                    <!--<div class="card mb8">-->
                        <!--<div class="card-header size-header p-0">-->
                            <!--<label>{{film.name}}</label>-->
                        <!--</div>-->
                        <!--<div class="card-body p-0 text-center">-->
                            <!--<img class="mx-auto img-display p-2" :src="film.img" @click="goToFilm(film)">-->
                            <!--<star-rating class="padding-star text-center" v-model="film.note_film" :read-only="true"-->
                                         <!--:increment="0.1"-->
                                         <!--:star-size="20" :show-rating="false"/>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</div>-->
        <!--</div>-->
           <div class="row">
                <div v-for="film in all_films" class="mx-auto m-2">
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
    </div>
</template>

<script>
    import Vue from 'vue'
    import vueFlashcard from 'vue-flashcard';
    import StarRating from 'vue-star-rating';
    import Multiselect from 'vue-multiselect';
    Vue.component('select2', Multiselect);
    import axios from 'axios'
    export default {
        name: "AllFilmDisplay",
        props: {
            films: Array,
            genre: Array,
        },
        components:{StarRating, vueFlashcard},
        data: function () {
            return{
                film_filter: [],
                filter: ['name', 'genre', 'note'],
                all_films: this.films,
                genre_selected: false,
                genre_film: '',
                html25: '<star-rating class="padding-star2 text-center mx-auto" v-model="film.note_film" :read-only="true"\n' +
                    '                                        :increment="0.1"\n' +
                    '                                         :star-size="20" :show-rating="false"/>'


            }
        },
        mounted: function () {
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getallfilms'
            })
            .then((response) => {
                this.all_films = response.data.allfilms
            })
        },
        methods:{
            goToFilm: function (film) {
                this.$emit('selectfilm',film)
                axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/film',
                     data:  {
                        film_info: film
                     }
                });
                window.location='http://127.0.0.1:8001/filminfo'
            },
            filter_data: function (data_filter) {
                axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/filmfilter',
                     data:  {
                        filter: data_filter
                     }
                })
                .then((response) => {
                        this.all_films = response.data.new_select;
                    })

            },
            filter_genre: function (data_filter) {
                axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/genrefilter',
                     data:  {
                        genre: data_filter
                     }
                })
                .then((response) => {
                        this.all_films = response.data.new_genre;
                    })

            },

        },
        computed: {
            film_updated: function () {
                return this.films = this.all_films
            }
        },

        watch: {
            film_filter: function (val) {
                if(val === 'genre'){
                    this.genre_selected = true
                }
                else{
                    this.genre_selected = false;
                }
            },
        },
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