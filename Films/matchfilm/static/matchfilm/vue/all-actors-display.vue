<template>
    <div>
    <div class="container">
        <div class="row">
            <div class="col-md-2">
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
            <div class="col-md-2" v-show="genre_selected">
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
        <div class="row">
            <div v-for="actor in actors">
                <div class="col">
                    <div class="card mb8">
                        <div class="card-header size-header p-0">
                            <label>{{actor}}</label>
                        </div>
                        <div class="card-body p-0 text-center">
                            <img class="mx-auto img-display p-2"
                                 src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" @click="goToFilm(actor)">
                            <!--<star-rating class="padding-star text-center" v-model="film.note_film" :read-only="true"-->
                                         <!--:increment="0.1"-->
                                         <!--:star-size="20" :show-rating="false"/>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</template>

<script>
    import Vue from 'vue'
    import StarRating from 'vue-star-rating';
    import Multiselect from 'vue-multiselect';
    Vue.component('select2', Multiselect);
    import axios from 'axios'
    export default {
        name: "AllActorDisplay",
        props: {
            films: Array,
            genre: Array,
            actors: Array,
        },
        components:{StarRating},
        data: function () {
            return{
                film_filter: [],
                filter: ['name', 'genre', 'note'],
                all_films: this.films,
                genre_selected: false,
                genre_film: ''

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
            goToFilm: function (actor) {
                this.$emit('selectactor', actor)
                axios({
                     method: 'POST',
                     url: 'http://127.0.0.1:8001/actor',
                     data:  {
                        actor_info: actor
                     }
                });
                window.location='http://127.0.0.1:8001/filmactor'
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
</style>