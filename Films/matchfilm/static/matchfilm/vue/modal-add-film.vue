<template>
    <transition name="modal">
        <div v-if="showModal" class="modal-mask">
            <div class="modal-wrapper">
                <div class="modal-container">
                    <div class= "modal-header">
                        <h3>Critique {{ data }}</h3>
                    </div>
                    <p>{{text}}</p>
                    <div class="modal-body">
                            <textarea class="form-control" v-model="new_critique" rows="6"></textarea>
                            <star-rating class="marks-film" v-model="rate" :star-size="20" :increment="0.5"></star-rating>
                        <slot name="body">
                            <button id='rightButton' @click.prevent="submit(true, new_critique, rate)" type="submit" class="btn btn-success">Poster</button>
                            <button id='leftButton' @click.prevent="submit(false)" class="btn btn-danger">Annuler</button>
                        </slot>
                    </div>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
    import Multiselect from 'vue-multiselect';
    import Vue from 'vue'
    import StarRating from 'vue-star-rating'
    Vue.component('select2', Multiselect);
    export default {
        name: 'ModalAddFilm',
        components:{StarRating},
        data: function(){
            return {
                showModal: false,
                text: '',
                widthModal: 600,
                data: '',
                rate: 0,
                new_critique:'',
            }
        },
        mounted() {
            this.$nextTick(() => {
                this.$bus.$on('open-modal', (data, text) => {
                    this.data = data;
                    this.text = text;
                    this.showModal = true;
                });
            });
            this.$parent.$on('close-modal', () => {
                this.close();
            });
        },
        methods: {
            close: function(){
                this.showModal = false;
                this.text = '';
                this.data = '';
                this.new_critique = '';
                this.rate = 0;
            },

            submit: function (confirm, new_critique, rate) {
                this.$bus.$emit('confirm', confirm, new_critique, rate);
                this.close();

            }
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