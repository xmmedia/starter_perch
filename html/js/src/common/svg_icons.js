// for loading SVG icons
// only works in IE10+ because of no JS FileReader API
export default {
    template : `<div style="height: 0; width: 0; position: absolute; visibility: hidden;" v-html="svg"></div>`,

    props : ['src'],
    data : function() {
        return {
            'svg' : ''
        };
    },

    mounted : function() {
        // load the SVG file
        this.$http.get(this.src).then((response) => {
            return response.blob();
        }).then((blob) => {
            var vm = this;
            var reader = new FileReader();
            reader.addEventListener("loadend", function() {
                vm.svg = reader.result;
            });
            reader.readAsText(blob);
        });
    }
}