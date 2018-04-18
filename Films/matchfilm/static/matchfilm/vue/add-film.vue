<template>
    <div>
        <br>
        <button type="button" class="btn btn-success btn-circle btn-xl" @click="formadd = !formadd">
            +
        </button>
        <br>
        <div class="container">
            <form @submit.prevent="validateBeforeSubmit" data-toggle="validator" role="form" novalidate >
                    <div class="row" v-show="formadd" style="text-align: center">
                       <div class="col">
                            <div class="form-group has-feedback mx-auto text-center" >
                                <label>Nom du film:</label>
                                <p class="control has-icon has-icon-right">
                                    <input name="name_film" placeholder="nom du film"
                                            :class="{'has_errors': errors.has('name_film') }"
                                           v-model="FormFilm.name"
                                           class="form-control">
                                           <!--v-validate="{ required: true, regex: /^[A-Za-z0-9\-_\s\.]*$/}"-->
                                    <span v-show="errors.has('name_film')" class="is-danger">
                                        <i class="fa fa-times"></i>
                                        {{ errors.first('name_film') }}
                                    </span>
                                </p>
                            </div>
                        </div>
                       <div class="col">
                            <div class="form-group has-feedback mx-auto text-center">
                                <label>Réalisateur:</label>
                                 <select2 v-model="FormFilm.realisateur"
                                        :options="reals"
                                        :multiple="false"
                                        select-label=""
                                        selected-label=""
                                        deselect-label=""
                                        placeholder="Ajoute le réalisateur"
                                        :taggable="true"
                                        @tag="addReal">
                                 </select2>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group has-feedback mx-auto text-center">
                                <label>Acteurs:</label>
                                 <select2 v-model="FormFilm.actors"
                                        :options="actors"
                                        :multiple="true"
                                        select-label=""
                                        selected-label=""
                                        deselect-label=""
                                        placeholder="Ajoute des acteurs"
                                        :taggable="true"
                                        @tag="addActors">
                                 </select2>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group has-feedback mx-auto text-center">
                                <label>Genre:</label>
                                 <select2 v-model="FormFilm.genre"
                                        :options="genre"
                                        :multiple="false"
                                        select-label=""
                                        selected-label=""
                                        deselect-label=""
                                        placeholder="Genre du film"
                                        :taggable="true"
                                        @tag="selectGenre">
                                 </select2>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group has-feedback mx-auto text-center">
                                <label>Image:</label>
                                <p class="control has-icon has-icon-right">
                                    <input name="image" placeholder="url image internet"
                                           v-validate="{ required: false}"
                                           :class="{'has_errors': errors.has('image') }"
                                           v-model="FormFilm.img" class="form-control">
                                    <span v-show="errors.has('image')" class="is-danger">
                                        <i class="fa fa-times"></i>
                                        {{ errors.first('image_url"') }}
                                    </span>
                                </p>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group has-feedback mx-auto text-center" >
                                    <label>Ajouter:</label>
                                    <p class="control has-icon has-icon-right">
                                    <button class="btn btn-success" type="submit" @click.prevent="validateBeforeSubmit()">Ajouter</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
</template>

<script>
    import Vue from 'vue'
    import Multiselect from 'vue-multiselect';
    import VeeValidate from 'vee-validate';
    import swal from 'sweetalert';
    Vue.component('select2', Multiselect);


    const config = {
        errorBagName: 'errors', // change if property conflicts
        fieldsBagName: 'fields',
        delay: 0,
        locale: 'en',
        dictionary: null,
        strict: true,
        classes: false,
        classNames: {
            touched: 'touched', // the control has been blurred
            untouched: 'untouched', // the control hasn't been blurred
            valid: 'valid', // model is valid
            invalid: 'invalid', // model is invalid
            pristine: 'pristine', // control has not been interacted with
            dirty: 'dirty' // control has been interacted with
        },
        events: 'input|blur',
        inject: true,
        validity: false,
        aria: true,
        i18n: null, // the vue-i18n plugin instance,
        i18nRootKey: 'validations' // the nested key under which the validation messsages will be located
    };
    Vue.use(VeeValidate, config);

    export default {
        name: 'AddFilm',
        props: {
            create_film: '',
            genre: Array,
            reals: Array,
            actors: Array,
        },
        components:{},
        data: function () {
            return{
                formadd: false,
                FormFilm: {
                      name: '', realisateur: '', genre:'', actors: [],img:'',id: 0
                },
                add_success: false
            }
        },
        methods: {
            addHost: function () {
                if (this.FormFilm.name && this.FormFilm.realisateur && this.FormFilm.genre && this.FormFilm.actors) {
                    swal("Good job!", this.FormFilm.name + ' ajouté avec succès', "success");
                    this.$emit('addfilm', this.FormFilm);
                    this.FormFilm = {name: '', realisateur: '', genre:'', actors: [], img:'', id: 0};

                }
                else {
                     swal("Une erreur est survenue", 'formulaire invalide', "warning");
                }
            },
            validateBeforeSubmit: function () {
                this.$validator.validateAll().then((result) => {
                    if (result)
                        this.addHost();
                        this.add_success = !this.add_success
                });
            },
            selectGenre: function(newGenre){
                this.genre.push(newGenre);
            },
            addActors: function(newActors){
                this.actors.push(newActors);
            },
            addReal: function (newReal) {
                this.reals.push(newReal);
            }

        },
        watch: {
            create_film: function (val) {
                if(val){
                    this.FormFilm.name = this.create_film;
                    this.formadd = true
                }
                else{
                    this.FormFilm.name = '';
                }
            },
        },
    };

</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
<style>
.is-danger {
    color: #9f191f;
    font-weight: bold;
}

.btn-circle.btn-xl {
    width: 50px;
    height: 50px;
    color: white;
    font-size: 24px;
    line-height: 1.33;
    border-radius: 50%;
    margin: auto;
}
.add-film-success{
    color: #009926;
    font-size: 18px;
    font-weight: bold;
}

</style>