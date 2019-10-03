const path = require('path');
const GasPlugin = require('gas-webpack-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

const destination = 'dist';

module.exports = {
  name: 'Server-Side',
  entry: './index.js',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['google-apps-script']
          }
        }
      }
    ]
  },
  output: {
    path: path.resolve(__dirname, destination),
    filename: 'server.js'
  },
  plugins: [
    new GasPlugin()
  ],
  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        parallel: true,
        uglifyOptions: {
          warnings: false,
          ie8: false,
          mangle: false,
          compress: {
            properties: false
          }
        }
      })
    ]
  }
};
