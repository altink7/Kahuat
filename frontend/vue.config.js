const { defineConfig } = require('@vue/cli-service')

module.exports = defineConfig({
  devServer: {
    allowedHosts: process.env.VUE_APP_DOMAIN,
  },
  transpileDependencies: true,
})