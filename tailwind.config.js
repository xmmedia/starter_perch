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
                'print': { 'raw': 'print' },
                'retina': { 'raw': '(-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi)' },
            },
            fontFamily: {
                'headings': [
                    '"Helvetica Neue"',
                    'Arial',
                    'sans-serif',
                    '"Apple Color Emoji"',
                    '"Segoe UI Emoji"',
                    '"Segoe UI Symbol"',
                    '"Noto Color Emoji"',
                ],
            },
        },
    },
    variants: {
        textColor: ['responsive', 'hover', 'focus', 'group-hover'],
        borderColor: ['responsive', 'hover', 'focus', 'group-hover'],
        opacity: ['responsive', 'hover', 'focus', 'group-hover'],
    },
    plugins: []
}
