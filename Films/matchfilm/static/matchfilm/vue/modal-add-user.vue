<template>
    <transition name="modal">
        <div v-if="showModal" class="modal-mask">
            <div class="modal-wrapper">
                <div class="modal-container">
                    <div class= "modal-header">
                        <h3>Vous êtes à quelques secondes d'une expérience unique</h3>
                    </div>
                    <p>{{text}}</p>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Nom d'utilisateur</label>
                            <input name="username"  class="form-control" placeholder="Username"
                                    v-model="form.username" v-validate="{ required: true, min: 5}" data-vv-delay="500"
                                   :class="{'input': true, 'is-danger': errors.has('username') }">
                            <i v-show="errors.has('username')" class="fa fa-warning"></i>
                            <span v-show="errors.has('username')" class="help is-danger" style="color: red">{{ errors.first('username') }}</span>
                            <small class="form-text text-muted">
                                Ce nom sera visible par les autres utilisateurs.</small>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input name="password" type="password" class="form-control" placeholder="Password"
                                    v-model="form.password" v-validate="{ required: true, min: 5}" data-vv-delay="500"
                                   :class="{'input': true, 'is-danger': errors.has('password') }">
                            <i v-show="errors.has('password')" class="fa fa-warning"></i>
                            <span v-show="errors.has('password')" class="help is-danger" style="color: red">{{ errors.first('password') }}</span>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input name="email" type="email" class="form-control" placeholder="Email" v-validate="{ required: true, email}"
                                   data-vv-delay="500"
                                   :class="{'input': true, 'is-danger': errors.has('email') }"
                                   v-model="form.email">
                             <i v-show="errors.has('email')" class="fa fa-warning"></i>
                            <span v-show="errors.has('email')" class="help is-danger" style="color: red">{{ errors.first('email') }}</span>
                        </div>
                        <slot name="body">
                            <button id='rightButton' @click.prevent="submit(true, form)" type="submit" class="btn btn-success">Poster</button>
                            <button id='leftButton' @click.prevent="close" class="btn btn-danger">Annuler</button>
                        </slot>
                    </div>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
    import Vue from 'vue'
    import VeeValidate from 'vee-validate';
    import french from 'vee-validate/dist/locale/fr';
    import swal from 'sweetalert';
    const config = {
        errorBagName: 'errors', // change if property conflicts
        fieldsBagName: 'fields',
        delay: 0,
        locale: 'fr',
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
        name: 'ModalAddUser',
        components:{},
        data: function(){
            return {
                showModal: false,
                form: {
                    username: '',
                    password: '',
                    email: '',
                },
                text: '',
                widthModal: 600,
                data: '',
                rate: 0,

            }
        },
        mounted() {
            this.$nextTick(() => {
                this.$bus.$on('open-modal-user', () => {
                    this.showModal = true;
                    this.form.username = '';
                    this.form.password = '';
                    this.form.email = '';
                });
            });
            this.$parent.$on('close-modal', () => {
                this.close();
            });

        },
        created() {
        },
        methods: {
            close: function(){
                this.showModal = false;
                // this.form.username = '';
                // this.form.password = '';
                // this.form.email = '';
            },

            submit: function (confirm, form) {
                console.log(confirm, form);
                this.validateBeforeSubmit(confirm, form);
                this.close()
            },
             validateBeforeSubmit: function(confirm, form) {
                this.$validator.validateAll().then((result) => {
                if (result) {
                  this.$bus.$emit('confirm',confirm, form);
                }
                else {
                    swal("Une erreur est survenue", 'formulaire invalide', "warning");
                }

              });
            },
        },


    }
</script>

<style scoped>

    .modal-enter .modal-container,
    .modal-leave-active .modal-container {
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    .modal-mask {
      position: fixed;
      z-index: 9998;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, .5);
      display: table;
      transition: opacity .3s ease;
    }

    .modal-wrapper {
      display: table-cell;
      vertical-align: middle;
    }

    .modal-container {
      width: 600px;
      margin: 0px auto;
      padding: 10px 20px;
      background-color: #fff;
      border-radius: 2px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
      transition: all .3s ease;
      font-family: Helvetica, Arial, sans-serif;
      font-weight: bold;
    }

    .modal-header h3 {
      margin-top: 0;
      color: #42b983;
      font-weight: bold;
      text-align: center;
    }

    .modal-body {
      margin: 10px 0;
      font-weight: bold;
    }

    .modal-enter .modal-container,
    .modal-leave-active .modal-container {
      -webkit-transform: scale(1.1);
      transform: scale(1.1);
    }
    #leftButton{
        float: left;
        //color: #DC0A0A ;
    }
    #rightButton{
        float: right;
        //color: #42b983;
    }

</style>