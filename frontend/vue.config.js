const { defineConfig } = require('@vue/cli-service');

// Function to get WebSocket URL
function getWebSocketURL(domain) {
  if (domain === 'localhost') {
    return 'ws://localhost:8080/ws';
  } else {
    return `wss://${domain}/ws`;
  }
}

// Function to get allowed hosts
function getAllowedHosts(domain) {
  if (domain) {
    return domain.split(',');
  } else {
    return ['localhost'];
  }
}

module.exports = defineConfig({
  devServer: {
    // Set allowedHosts dynamically based on the VUE_APP_DOMAIN
    allowedHosts: getAllowedHosts(process.env.VUE_APP_DOMAIN),

    // Set the WebSocket URL dynamically based on the VUE_APP_DOMAIN
    client: {
      webSocketURL: getWebSocketURL(process.env.VUE_APP_DOMAIN),
    },
  },

  transpileDependencies: true,
});
