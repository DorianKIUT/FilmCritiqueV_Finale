<template>
    <div>
        <div class="container">
            <div class="w-75 p-3 bg-warning text-white text-center justify-content-center mx-auto">
                <div class="container color-container mx-auto">
                    <div class="align-items-center justify-content-center">
                        <h3 class="h3-title">{{actor_selected}}</h3>
                        <div class="text-center">
                            <star-rating class="big-marks-film text-center justify-content-center"
                            v-model="note_globale" :read-only="true"
                            :increment="0.1"
                            :star-size="50" :show-rating="true"/>
                        </div>
                        <div class="nb-note text-center">
                            ({{count_globale}})
                        </div>
                        <div class="text-center justify-content-center mx-auto">
                                <pie-chart class="justify-content-center mx-auto" :donut="true"
                                            width="200px"
                                            :legend="false"
                                            :data="[['note0/5', all_notes[0]['note0/5']],
                                            ['note1/5', all_notes[1]['note1/5']],
                                            ['note2/5', all_notes[2]['note2/5']],
                                            ['note3/5', all_notes[3]['note3/5']],
                                            ['note4/5', all_notes[4]['note4/5']],
                                            ['note5/5', all_notes[5]['note5/5']]]"
                                            :colors="['#EF0B0B','#EA4E2C','#C77D2D', '#C1AC37', '#81B428', '#5BE506']"></pie-chart>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-150 p-3 m-2 bg-warning">
                <div class="container film-color-container">
                    <div class="row">
                        <div class="mx-auto " v-for="film in all_films_actor_selected">
                            <div class="col m-2 ">
                                <div class="card mb8 hover-card">
                                    <div class="card-header size-header p-0">
                                        <label>{{film.name}}</label>
                                    </div>
                                    <div class="card-body p-0 text-center justify-content-center mx-auto ">
                                        <img class="mx-auto img-display p-2" :src="film.img" @click="goToFilm(film)">
                                        <star-rating class="padding-star text-center justify-content-center mx-auto " v-model="film.note_film" :read-only="true"
                                                     :increment="0.1"
                                                     :star-size="20" :show-rating="false"/>
                                    </div>
                                </div>
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
    import Chartkick from 'chartkick'
    import VueChartkick from 'vue-chartkick'
    import axios from 'axios'
    import StarRating from 'vue-star-rating'
    Vue.use(VueChartkick, { Chartkick });
    export default {
        name: "ActorInfo",
        props:{
            film_selected: Array
        },
        components:{StarRating},
        mounted: function () {
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getinfoactor'
            })
            .then((response) => {
                this.actor_selected = response.data.name_actor;
                this.all_films_actor_selected = response.data.all_films_actor_selected;
                this.sum_globale = response.data.sum_globale;
                this.count_globale = response.data.count_globale;
                this.note_globale = response.data.note_globale;
                this.all_notes = response.data.list_all_notes;

            })

        },
        data: function () {
            return {
                count: 0,
                film_data: Array,
                count_globale: 0,
                sum_globale: 0,
                actor_selected: Array,
                all_notes: Array,
                all_films_actor_selected: Array,
            }
        },
         watch: {

            },
            methods: {
                newSumAndCount: function (note) {
                    this.nb_note = this.nb_note + 1;
                    this.sum_note = this.sum_note + note;
                    this.moyenne_film = this.sum_note / this.nb_note;

                },
                newSumAndCount_Actor: function (actor, note) {
                    actor.count = actor.count + 1;
                    actor.sum = actor.sum + note;
                    actor.note = actor.sum / actor.count;

                },

                filter_note: function (data_filter) {
                    axios({
                        method: 'POST',
                        url: 'http://127.0.0.1:8001/notefilter',
                        data: {
                            data_filter: data_filter,
                            film_selected: this.film_data[0]['id']
                        }
                    })
                        .then((response) => {
                            if (response.data.new_list_negative.length !== 0) {
                                console.log('OUI')
                                this.list_negative = response.data.new_list_negative;
                            }
                            else {
                                this.list_negative = [];
                                this.all_critique_less = []
                            }
                            if (response.data.new_list_positive.length !== 0) {
                                this.list_positive = response.data.new_list_positive;
                            }
                            else {
                                this.list_positive = [];
                                this.all_critique_plus = [];
                            }
                        })

                },
                actor_review: function () {
                    this.list_positive = this.all_critique_actors_plus;
                    this.list_negative = this.all_critique_actors_less;
                },
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
    background-color: #5B5959;
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
</style>



