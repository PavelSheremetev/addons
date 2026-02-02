#!/usr/bin/with-contenv bashio
# ==============================================================================
# Настройка Proxy перед основным запуском
# ==============================================================================

if bashio::config.has_value 'http_proxy'; then
    PROXY=$(bashio::config 'http_proxy')
    bashio::log.info "Pre-start: Proxy detected: ${PROXY}"
    # Здесь мы не можем просто сделать export, так как это другой процесс.
    # Поэтому мы запишем прокси в системный файл окружения.
    echo "http_proxy=${PROXY}" >> /etc/environment
    echo "https_proxy=${PROXY}" >> /etc/environment
    echo "HTTP_PROXY=${PROXY}" >> /etc/environment
    echo "HTTPS_PROXY=${PROXY}" >> /etc/environment
fi
