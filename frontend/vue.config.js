const { defineConfig } = require('@vue/cli-service');

module.exports = defineConfig({
  devServer: {
    // Convert VUE_APP_DOMAIN to an array for allowedHosts
    allowedHosts: process.env.VUE_APP_DOMAIN ? process.env.VUE_APP_DOMAIN.split(',') : [],

    // Set the WebSocket URL dynamically based on the VUE_APP_DOMAIN
    client: {
      webSocketURL: process.env.VUE_APP_DOMAIN ? `ws://${process.env.VUE_APP_DOMAIN}/ws` : 'ws://localhost:8080/ws',
    },
  },

  transpileDependencies: true,
});