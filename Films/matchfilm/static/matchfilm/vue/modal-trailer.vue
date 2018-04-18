<template>
     <!--Include stylesheet -->
    <transition name="modal">
        <div v-if="showModal" class="modal-mask">
            <div class="modal-wrapper">
                <div class="modal-container">
                    <span class= "modal-header">
                        <h3>Bande Annonce du film {{' ' + text}} </h3>
                        <i id="rightButton"
                           style="color: red"
                           class="fa fa-times fa-2x" aria-hidden="true"
                           @click.prevent="submit(false)"></i>
                    </span>
                    <section>
                        <youtube :video-id="videoId" player-width="800"
                                 player-height="480" @ready="ready"
                                 @playing="playing"
                                 :player-vars="{autoplay: 1}"></youtube>
                    </section>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
    import Multiselect from 'vue-multiselect';
    import Vue from 'vue'
    import StarRating from 'vue-star-rating'
    import VueVideoPlayer from 'vue-video-player'
    import VueYouTubeEmbed from 'vue-youtube-embed'
    Vue.use(VueYouTubeEmbed);
    Vue.component('select2', Multiselect);
    Vue.use(VueVideoPlayer, /* {
          options: global default options,
          events: global videojs events
        } */);
    export default {
        name: 'ModalTrailer',
        data: function(){
            return {
                showModal: false,
                text: '',
                videoId: '',
            }
        },
        mounted() {
            this.$nextTick(() => {
                this.$bus.$on('open-modal-trailer', (url_trailer, film_name) => {
                    this.videoId = this.$youtube.getIdFromURL(url_trailer);
                    this.text = film_name;
                    this.showModal = true;
                });
                 setTimeout(() => {
                    console.log('dynamic change options', this.player)
                }, 2000)
            });
            this.$parent.$on('close-modal', () => {
                this.close();
            });
        },
        methods: {
            close: function(){
                this.showModal = false;
                this.videoId = '';
                this.text= '';
            },

            submit: function () {
                this.close();
            },
             ready (player) {
              this.player = player
            },
            playing (player) {
              // The player is playing a video.
            },
            change () {
              // when you change the value, the player will also change.
              // If you would like to change `playerVars`, please change it before you change `videoId`.
              // If `playerVars.autoplay` is 1, `loadVideoById` will be called.
              // If `playerVars.autoplay` is 0, `cueVideoById` will be called.
              this.videoId = 'another video id'
            },
            stop () {
              this.player.stopVideo()
            },
            pause () {
              this.player.pauseVideo()
            },
            method (url) {
              this.videoId = this.$youtube.getIdFromURL('https://youtu.be/noTuWxGmYlw');
              this.startTime = this.$youtube.getTimeFromURL('https://youtu.be/noTuWxGmYlw');
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
      width: 850px;
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