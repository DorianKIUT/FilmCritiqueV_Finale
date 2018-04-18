<template>
    <div>
        <div class="row">
            <div class="col-md-12 m-2 justify-content-center mx-auto">
                <div class="mx-auto w-50 p-3 bg-warning text-white text-center">
                    <div class="container color-container mx-auto">
                        <div class="row">
                            <img  class="img_film m-4" :src="film_data[0]['img']" alt="Image" @click="" />
                            <div>
                                <i @click="addToFavorite()"
                                 class="fa fa-heart fa-2x m-2" aria-hidden="true"
                                 style="color: red">
                                </i>
                                <h3 class="h3-title text-center">{{film_data[0]['name']}}
                                    <button class="btn btn-warning btn-sm" type="submit" @click="openModalResume(film_data)">
                                         <i class="fa fa-file-text-o fa-1x m-2" aria-hidden="true"></i>
                                     </button>
                                </h3>
                            <span class="info-realisateur text-center">{{film_data[0]['realisateur']}}</span>
                                <div class="row">
                                    <div class="col mx-auto">
                                        <star-rating class="big-marks-film m-2 mx-auto"
                                            v-model="moyenne_film" :read-only="true"
                                            :increment="0.1"
                                            :star-size="50" :show-rating="true"/>
                                    </div>
                                    <div class="col mx-auto nb-note p-3">
                                        ({{nb_note}})
                                    </div>
                                <div class="col m-3">
                                    <button class="btn btn-warning" type="submit" @click.prevent="AddReviewFilm()">Poster une critique</button>
                                </div>
                                <div class="col mx-auto m-3">
                                     <button class="btn btn-success btn-sm" type="submit" @click="openModalFilm()">
                                         <i class="fa fa-video-camera fa-1x m-2" aria-hidden="true"></i>
                                     </button>

                                </div>
                                </div>
                                <div class="row">
                                    <div v-for="actor in actors">
                                        <div class="col">
                                            <div class="info-actors m-1">
                                               {{actor.name}}
                                                <i class="fa fa-plus-circle" aria-hidden="true"
                                                   style="color: green"
                                                    @click.prevent="AddReviewActor(actor)"></i>
                                            </div>
                                            <div>
                                                <star-rating class="marks-actors" style="color: white;"
                                                             v-model="actor.note" :read-only="true"
                                                             :increment="0.1"
                                                             :star-size="20" :show-rating="true"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-5">
                            <i class="fa fa-smile-o title-positive" aria-hidden="true"></i>
                            <div v-show="no_review" class="text-no-review">
                                <i class="fa fa-pencil" style="font-size:3em" aria-hidden="true"></i>
                                Pas de critique, sois le 1er à en poster une !
                            </div>
                            <div v-for="review in list_positive">
                                <div class="card mb8">
                                    <div class="card-header">
                                        <star-rating class="marks-film mx-auto padding-star2 " v-model="review['note']" :star-size="20"
                                                     :read-only="true" :increment="0.5" active-color="#43C81A"
                                                     :show-rating="false"/>
                                         <span class="p-0" v-show="acteur_option">{{review['name']}}</span>
                                         <span class="p-0">{{review['username']}}</span>
                                    </div>
                                    <div class="card-body">
                                        <div>{{review['review']}}</div>
                                    </div>
                                </div>
                            </div>
                            <infinite-loading  v-if="film_select" spinner="waveDots" @infinite="infiniteFilmPositive"/>
                            <infinite-loading  v-if="actor_select" spinner="waveDots" @infinite="infiniteActorPositive"/>
                        </div>
                        <div class="col-md-2 text-center">
                            <img class="m-6" width="30%" src="https://vignette.wikia.nocookie.net/deathbattle/images/4/47/VS.png/revision/latest?cb=20160727174407" alt="Image" />
                            <div class="col">
                                <div class="form-group has-feedback mx-auto text-center">
                                    <label>Filtre:</label>
                                     <select2 v-model="select_filter"
                                            :options="filter"
                                            :multiple="false"
                                            select-label=""
                                            :preselect-first="true"
                                            selected-label=""
                                            deselect-label=""
                                            placeholder="filtre les critiques">
                                     </select2>
                                </div>
                            </div>
                            <div class="col" v-if="film_option">
                              <div class="form-group has-feedback">
                                <label>Notes:</label>
                                    <vue-slider class="p-2" ref="slider" v-model="note_selected" v-bind="options"></vue-slider>
                                    <button class="btn btn-success" type="submit" @click.prevent="filter_note(note_selected)">Filtrer</button>
                                </div>

                            </div>
                            <div class="col" v-show="acteur_option">
                              <div class="form-group has-feedback">
                                <label>Acteurs:</label>
                                 <select2 v-model="actor_selected"
                                    :options="actors"
                                    :multiple="false"
                                    select-label=""
                                    selected-label=""
                                    deselect-label=""
                                    label="name"
                                    placeholder="acteur"
                                    @input="filter_note(actor_selected['name'])">
                                 </select2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <i class="fa fa-meh-o title-positive" style="color: #a61717" aria-hidden="true"></i>

                            <div v-show="no_review" class="text-no-review">
                                <i class="fa fa-pencil" style="font-size:3em" aria-hidden="true"></i>
                                Pas de critique, sois le 1er à en poster une !
                            </div>
                            <div v-for="review in list_negative">
                                <div class="card mb8">
                                    <div class="card-header">
                                        <star-rating class="marks-film mx-auto padding-star2" v-model="review['note']" :star-size="20"
                                                     :read-only="true" :increment="0.5" active-color="#E61717"
                                                     :show-rating="false"/>
                                        <span class="p-0" v-show="acteur_option">{{review['name']}}</span>
                                        <span class="p-0">{{review['username']}}</span>
                                    </div>
                                    <div class="card-body">
                                        <div>{{review['review']}}</div>
                                    </div>
                                </div>
                            </div>
                            <infinite-loading v-if="film_select" spinner="waveDots" @infinite="infiniteFilmNegative"/>
                            <infinite-loading  v-if="actor_select" spinner="waveDots" @infinite="infiniteActorNegative"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Multiselect from 'vue-multiselect';
    import Vue from 'vue'
    import axios from 'axios'
    import StarRating from 'vue-star-rating'
    import infiniteScroll from 'vue-infinite-scroll';
    import InfiniteLoading from 'vue-infinite-loading';
    import vueSlider from 'vue-slider-component';
    import swal from 'sweetalert';
    Vue.use(infiniteScroll);
    Vue.component('select2', Multiselect);
    const VuePopper = require('vue-popper-component');
    export default {
        name: "FilmInfo",
        props:{
            film_selected: Array,
            nologin: Boolean,
            username_login: ''
        },
        components:{StarRating, InfiniteLoading, vueSlider, VuePopper},
        mounted: function () {
            axios({
                method: 'GET',
                url: 'http://127.0.0.1:8001/getinfofilm'
            })
            .then((response) => {
                this.film_data = response.data.films;
                this.moyenne_film = response.data.moyenne;
                this.nb_note = response.data.nb_note;
                this.sum_note = response.data.sum_note;
                this.actors = response.data.actors;
                this.all_critique_plus = response.data.all_review_positive;
                this.all_critique_less = response.data.all_review_negative;
                this.all_critique_actors_plus = response.data.all_review_acteur_positive;
                this.all_critique_actors_less = response.data.all_review_acteur_negative;

            })

        },
        data: function () {
            return {
                count: 0,
                film_data: Array,
                moyenne_film: 0,
                nb_note: 0,
                sum_note: 0,
                new_critique: '',
                no_review: false,
                film_option: false,
                acteur_option: false,
                film_select: true,
                actor_select: false,
                note_selected: [0,5],
                actor_selected: 0,
                actors: Array,
                select_filter: '',
                filter: ['films', 'acteurs'],
                all_critique_plus: Array,
                all_critique_less: Array,
                all_critique_actors_plus: Array,
                all_critique_actors_less: Array,
                list_negative: [],
                list_positive: [],
                test_filter: Array,
                testif: false,
                active_login: '',
                msg: 'test',
                options: {
                    value:[0,0],
                    min: 0,
                    max: 5,
                    interval: 0.5
                  }


            }
        },
         watch: {
            select_filter: function (val) {
                if(val === 'films'){
                    this.film_select = true;
                    this.actor_select = false;
                    this.acteur_option = false;
                    this.list_positive =  this.all_critique_plus;
                    this.list_negative =  this.all_critique_less;
                    this.film_option = true;
                    this.acteur_option = false;

                }
                else if(val === 'acteurs') {
                    this.actor_select = true;
                    this.acteur_option = true;
                    this.film_select = false;
                    this.list_positive =  this.all_critique_actors_plus;
                    this.list_negative =  this.all_critique_actors_less;
                    this.acteur_option = true;
                    this.film_option = false;
                }

            },


        },
        computed: {
            active_log: function () {
                    var log = '';
                    return log = this.nologin
                }
        },
        methods: {
            addReview: function (review, note) {
                axios({
                    method: 'POST',
                    url: 'http://127.0.0.1:8001/addreview',
                    data: {
                        review: review,
                        note: note,
                        id: this.film_data[0]['id'],
                        username: this.username_login
                    }
                })
                    .then((response) => {
                        this.actor_select = false;
                        this.acteur_option = false;
                        this.film_select = true;
                        this.film_option = true;
                        this.select_filter = 'films'
                        this.all_critique_plus = response.data.all_review_positive;
                        this.all_critique_less = response.data.all_review_negative;
                        this.list_positive = response.data.all_review_positive;
                        this.list_negative = response.data.all_review_negative;
                        review = '';
                        note = '';
                    });
                this.newSumAndCount(note);
            },
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
            addReview_Actor: function (review, note, actor) {
                axios({
                    method: 'POST',
                    url: 'http://127.0.0.1:8001/addnoteactor',
                    data: {
                        review: review,
                        note: note,
                        actor: actor,
                        username: this.username_login
                    }
                })
                    .then((response) => {
                        this.actor_select = true;
                        this.acteur_option = true;
                        this.film_select = false;
                        this.film_option = false;
                        this.select_filter = 'acteurs';
                        this.list_positive = response.data.all_review_acteur_positive;
                        this.list_negative = response.data.all_review_acteur_negative;
                    });
                this.newSumAndCount_Actor(actor, note);
                review = '';
                note = 0;
            },
            infiniteFilmNegative($state) {
                setTimeout(() => {
                    const temp = [];
                    for (let i = this.list_negative.length; i <= this.list_negative.length + 1; i++) {
                        if (i >= this.all_critique_less.length) {
                            $state.complete();
                        }
                        else {
                            temp.push(this.all_critique_less[i]);
                            console.log(temp)
                        }


                    }
                    this.list_negative = this.list_negative.concat(temp);
                    $state.loaded();
                }, 500);
            },
            infiniteFilmPositive($state) {
                setTimeout(() => {
                    const temp = [];
                    for (let i = this.list_positive.length; i <= this.list_positive.length + 1; i++) {
                        if (i >= this.all_critique_plus.length) {
                            $state.complete();
                        }
                        else {
                            temp.push(this.all_critique_plus[i]);
                            console.log(temp);
                        }
                    }
                    this.list_positive = this.list_positive.concat(temp);
                    $state.loaded();

                }, 500);
            },
            infiniteActorPositive($state) {
                setTimeout(() => {
                    const temp = [];
                    for (let i = this.list_positive.length; i <= this.list_positive.length + 1; i++) {
                        if (i >= this.all_critique_actors_plus.length) {
                            $state.complete();
                        }
                        else {
                            temp.push(this.all_critique_actors_plus[i]);
                            console.log(temp)
                        }


                    }
                    this.list_positive = this.list_positive.concat(temp);
                    $state.loaded();
                }, 500);
            },
            infiniteActorNegative($state) {
                setTimeout(() => {
                    const temp = [];
                    for (let i = this.list_negative.length; i <= this.list_negative.length + 1; i++) {
                        if (i >= this.all_critique_actors_less.length) {
                            $state.complete();
                        }
                        else {
                            temp.push(this.all_critique_actors_less[i]);
                            console.log(temp);
                        }
                    }
                    this.list_negative = this.list_negative.concat(temp);
                    $state.loaded();

                }, 500);
            },
            AddReviewFilm: function () {
                if (!this.active_log) {
                    this.$bus.$emit(
                        'open-modal',
                        this.film_data[0]['name'],
                        'poste une critique générale sur le film ' + this.film_data[0]['name']
                    );
                    this.$nextTick(() => {
                        this.$bus.$on('confirm', (result, new_data, note) => {
                            if (result) this.addReview(new_data, note);
                            this.$bus.$off('confirm');
                        });
                    });
                }
                else {
                    swal("Veuillez vous authentifiez", 'Vous devez être authentifé pour pouvoir ajouter une critique',
                        "warning");
                }
            },
            AddReviewActor: function (actor) {
                if (!this.active_log) {
                    this.$bus.$emit(
                        'open-modal',
                        actor.name,
                        'poste une critique sur la performance de ' + actor.name + ' dans le film '
                        + this.film_data[0]['name']
                    );
                    this.$nextTick(() => {
                        this.$bus.$on('confirm', (result, new_data, note) => {
                            if (result) this.addReview_Actor(new_data, note, actor);
                            this.$bus.$off('confirm');
                            new_data = '';
                            note = '';
                            actor = ''
                        });
                    });
                }
                else {
                    swal("Veuillez vous authentifiez", 'Vous devez être authentifé pour pouvoir ajouter une critique',
                        "warning");
                }
            },
            openModalFilm: function () {
                this.$bus.$emit(
                    'open-modal-trailer',
                    this.film_data[0]['trailer'],
                    this.film_data[0]['name']
                );
                this.$nextTick(() => {
                    this.$bus.$on('confirm', (result, new_data, note) => {
                        if (result) this.addReview(new_data, note);
                        this.$bus.$off('confirm');
                    });
                });
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
                            this.list_negative = response.data.new_list_negative;
                        }
                        else {
                            this.list_negative = [];
                            this.all_critique_less = [];
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
            addToFavorite: function () {
                if (!this.active_log) {
                    axios({
                        method: 'POST',
                        url: 'http://127.0.0.1:8001/addtofavorite',
                        data: {
                            film_to_add: this.film_data[0]['id']
                        }
                    })
                        .then((response) => {
                            console.log(response.data.message_ret)
                            if (response.data.message_ret === 1) {
                                swal("Suppression de vos favoris", 'le film ' + this.film_data[0]['name'] +
                                    ' a été supprimé de vos favoris', "warning");
                            }
                            else {
                                swal("Ajout aux favoris", 'le film ' + this.film_data[0]['name'] +
                                    ' a été ajouté à vos favoris', "success");
                            }

                        })
                }
                else {
                    swal("Veuillez vous authentifiez", 'Vous devez être authentifé pour pouvoir ajouter le film' +
                        ' à vos favoris', "warning");
                }

            },
            openModalResume: function (film) {
                 swal("Resumé", film[0]['resume'], film[0]['img']);
            }
        }
    }
</script>


<style scoped>

.img_film{
    width: 150px;
    height: 220px;
}


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

.marks-film{
    margin-left: 10px;
    width: 80%;
    padding-top: -20px;
    margin-top: -15px;
    height: 50px;
    color: white;
}
.big-marks-film{
    width: 80%;
    height: 50px;
    color: white;
}

.text-no-review{
    font-size: 20px;
}

.nb-note{
    font-size: 30px;
    color: white;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .5);
    -ms-word-wrap: break-word;
    word-wrap: break-word;
}
.info-realisateur{
    display: inline-block;
    color: white;
    font-size: 15px;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .5);
    -ms-word-wrap: break-word;
    word-wrap: break-word;
    padding-left: 10px;
    margin-bottom: 2px;
}
.info-actors{
    color: white;
    font-size: 15px;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .5);
    -ms-word-wrap: break-word;
    word-wrap: break-word;
}
.marks-actors{
    width: 80%;
    height: 50px;
    color: black;
}

.title-positive{
    color: #28a745;
    text-shadow: 2px 2px 2px #ccc;
    font-size: 3.5em;
    text-align: center;
}
.mb8{
    margin-bottom: 8px;
}
.color-container{
    background-color: #040404;
}
.padding-star2{
    padding-left: 27%;
}
</style>



