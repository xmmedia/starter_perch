<template>
    <div v-if="svg" style="height: 0; width: 0; position: absolute; visibility: hidden;" v-html="svg"></div>
</template>

<script>
import fetch from 'unfetch';

export default {
    props: {
        src: {
            type: String,
            required: true,
        },
    },

    data () {
        return {
            svg: '',
        };
    },

    async mounted () {
        const response = await fetch(this.src);

        this.svg = await response.text();
    },
}
</script>