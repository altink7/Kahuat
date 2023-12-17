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
    return [domain];
  } else {
    return ['localhost'];
  }
}

// Use process.env.VUE_APP_DOMAIN if defined, otherwise use 'localhost'
const domain = process.env.VUE_APP_DOMAIN || 'localhost';

module.exports = defineConfig({
  devServer: {
    // Set allowedHosts dynamically based on the VUE_APP_DOMAIN or default to 'localhost'
    allowedHosts: getAllowedHosts(domain),

    // Set the WebSocket URL dynamically based on the VUE_APP_DOMAIN or default to 'localhost'
    client: {
      webSocketURL: getWebSocketURL(domain),
    },
  },

  transpileDependencies: true,
});
