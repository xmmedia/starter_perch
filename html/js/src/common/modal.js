// based off of Vue.js's example modal: https://vuejs.org/examples/modal.html
export default {
    template:
    `<transition name="md">
        <div class="md-overlay" @click.self="$emit('close')">
            <div class="md-modal">
                <div class="md-content">
                    <a href="" class="md-close" @click.prevent="$emit('close')">x</a>
                    <div>
                        <slot name="content"></slot>
                    </div>
                    <div class="md-button_wrap">
                        <slot name="button"></slot>
                    </div>
                </div>
            </div>
        </div>
    </transition>`
}