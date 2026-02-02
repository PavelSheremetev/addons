#!/usr/bin/with-contenv bashio
# ==============================================================================
# Настройка Proxy перед основным запуском
# ==============================================================================

if bashio::config.has_value 'http_proxy'; then
    PROXY=$(bashio::config 'http_proxy')
    bashio::log.info "Setting Proxy: ${PROXY}"
    
    export http_proxy="${PROXY}"
    export https_proxy="${PROXY}"
    export HTTP_PROXY="${PROXY}"
    export HTTPS_PROXY="${PROXY}"
    
    export NO_PROXY="localhost,127.0.0.1,local.hass.io"
fi

