var webpack = require('webpack');
var path = require('path');
var BundleTracker = require('webpack-bundle-tracker')


module.exports = {
    context: __dirname,
    entry: '../matchfilm/static/matchfilm/js/matchfilm.js',
    output: {
        path: path.resolve('./matchfilm/bundles/'),
        filename: 'app.js'
    },
    plugins: [
        new BundleTracker({filename: './webpack-stats.json'}),
    ],
    module: {
        loaders: [
            {
                test: /\.less$/,
                use: ['style-loader', 'css-loader', 'less-loader']
            },
            {
                test: /\.css/,
                use: ['style-loader', 'css-loader']
            },
            {
                test: /\.js$/,
                exclude: /node_modules/,
            },
            {
                test: /\.vue$/,
                loader: 'vue-loader'
            },
            {
                test: /\.(gif|png|jpe?g|svg)$/i,
                use: [
                    'file-loader',
                    {
                      loader: 'image-webpack-loader',
                      options: {
                        bypassOnDebug: true,
                  },
                },],
            }
        ],
    },
    resolve: {
        alias: {vue: 'vue/dist/vue.js'}
    },
    watch: true,

    watchOptions: {
      aggregateTimeout: 300,
      poll: 1000
    }

};