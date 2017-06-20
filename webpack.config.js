const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    entry: {
        public : './html/js/src/public.js'
    },
    output: {
        path: path.resolve(__dirname, './html'),
        publicPath: '/',
        // only for JS files
        filename: 'js/[name].js',
        // chunkhash will be 12 chars long
        chunkFilename: 'js/[id].[chunkhash:12].js',
    },
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                options: {
                    loaders: {
                        // configuration for SCSS within .vue files
                        'scss': 'vue-style-loader!css-loader!sass-loader'
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
                            loader: 'postcss-loader',
                            options: {
                                sourceMap: true
                            }
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
        extensions: ['.js', '.vue', '.json'],
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
