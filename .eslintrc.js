module.exports = {
    root: true,
    env: {
        browser: true,
        "cypress/globals": true,
    },
    'extends': ['plugin:vue/recommended', 'eslint:recommended'],
    rules: {
        "no-console": process.env.NODE_ENV === "production" ? "error" : "off",
        "no-debugger": process.env.NODE_ENV === "production" ? "error" : "off",
        "max-len": ["error", {
            "code": 120, // so we have a bit of grace
            "ignoreComments": true,
            "ignoreUrls": true,
            "ignoreStrings": true,
        }],
        "comma-dangle": ["error", {
            "arrays": "always-multiline",
            "objects": "always-multiline",
            "imports": "never",
            "exports": "never",
            "functions": "never",
        }],
        "vue/max-attributes-per-line": [3, {
            "singleline": 3,
            "multiline": {
                "max": 1,
                "allowFirstLine": true,
            },
        }],
        "vue/html-indent": ["error", 4],
        "vue/html-self-closing": ["error", {
            "html": {
                "void": "never",
                "normal": "never",
                "component": "always",
            },
            "svg": "any",
            "math": "always",
        }],
    },
    parserOptions: {
        parser: "babel-eslint",
    },
    plugins: [
        "cypress",
    ],
};
