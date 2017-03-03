const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    entry: {
        public : [
            'babel-polyfill',
            './html/js/src/public.js'
        ]
    },
    output: {
        path: path.resolve(__dirname, './html'),
        // only for JS files
        filename: 'js/[name].min.js',
    },
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                options: {
                    loaders: {
                        // Since sass-loader (weirdly) has SCSS as its default parse mode, we map
                        // the "scss" and "sass" values for the lang attribute to the right configs here.
                        // other preprocessors should work out of the box, no loader config like this necessary.
                        'scss': 'vue-style-loader!css-loader!sass-loader',
                        'sass': 'vue-style-loader!css-loader!sass-loader?indentedSyntax'
                    }
                    // other vue-loader options go here
                }
            },
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
            },
            {
                test: /\.scss$/,
                exclude: /node_modules/,
                loader: ExtractTextPlugin.extract({
                    fallback: 'style-loader',
                    use: [
                        {
                            loader: 'css-loader',
                            options: {
                                sourceMap: true
                            }
                        },
                        {
                            loader: 'postcss-loader'
                        },
                        {
                            loader: 'sass-loader',
                            options: {
                                // outputStyle: 'compressed',
                                sourceMap: true,
                                sourceMapContents: true
                            }
                        }
                    ]
                })
            },
            {
                test: /\.css$/,
                loader: "style-loader!css-loader"
            }
        ]
    },
    plugins: [
        // always uglify so we're actually testing real world code in the browser
        new webpack.optimize.UglifyJsPlugin({
            sourceMap: true,
            compress: {
                warnings: false
            }
        }),
        // only for files that use this plugin (only SASS/CSS atm)
        new ExtractTextPlugin('css/[name].css')
    ],
    resolve: {
        alias: {
            // see: https://github.com/vuejs/vue/blob/dev/dist/README.md
            // can't use runtime version because we have inline-templates
            'vue$': 'vue/dist/vue.common.js',
        }
    },
    devtool: 'cheap-module-eval-source-map'
};

if (process.env.NODE_ENV === 'production') {
    module.exports.devtool = 'source-map';

    // see https://github.com/vuejs-templates/webpack-simple/blob/master/template/webpack.config.js
    module.exports.plugins = (module.exports.plugins || []).concat([
        new webpack.LoaderOptionsPlugin({
            minimize: true
        })
    ]);
}