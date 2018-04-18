<template>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                 <button class="btn btn-success my-2 btn-lg" @click.prevent="registerUser">
                 Pas encore inscrit sur FilmCritique ? <img src="https://vignette.wikia.nocookie.net/deathbattle/images/4/47/VS.png/revision/latest?cb=20160727174407"
                        width="30" height="35" class="d-inline-block align-top" alt=""
                        @click="goToHome"></button>
            </div>
        </div>

    </div>
</template>

<script>
    import Vue from 'vue'
    import axios from 'axios'
    import swal from 'sweetalert';
    export default {
        name: "ButtonRegister",
        methods: {
             registerUser: function () {
                this.$bus.$emit(
                    'open-modal-user',
                );
                this.$nextTick(() => {
                    this.$bus.$on('confirm', (result, formuser) => {
                        if (result) {
                            this.addUser(formuser);
                            this.$bus.$off('confirm');
                        }

                    });
                });
            },
            addUser: function (formuser) {
                 axios({
                    method: 'POST',
                    url: 'http://127.0.0.1:8001/adduser',
                    data: {
                        new_user: formuser,
                    }
                })
                .then((response) => {
                    if(response.data.message_ret === 1 ){
                        swal("Une erreur est survenue", 'Nom d\'utilisateur déjà utilisé', "warning");
                    }
                    else {
                        swal("Vous êtes prêt", 'Connectez vous pour commencer l\'aventure', "success");
                    }

                });

            },
        }

    }
</script>

<style scoped>

</style>