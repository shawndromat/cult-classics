const webpack = require('webpack')
const path = require('path')

const config = {
  entry: "./javascripts/app.js",
  output: {
    path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'application.js'
  },
  module: {
    rules: [{
      use: [{
        loader: 'babel-loader',
        options: {
          presets: ['env'],
          plugins: [require('babel-plugin-transform-class-properties')]
        }
      }]
    }]
  }
}

module.exports = config;
