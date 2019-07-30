module.exports = {
  theme: {
    extend: {
        colors: {
            'inherit': 'inherit',
        },
        borderWidth: {
            '10': '10px',
        },
        maxWidth: {
            '1/2': '50%',
            '11/12': '91%',
        },
        screens: {
            'xs': '400px',
            'max': '1245px',
        },
    },
  },
  variants: {
    textColor: ['group-hover'],
    borderColor: ['group-hover'],
    opacity: ['responsive', 'hover', 'focus'],
  },
  plugins: []
}
