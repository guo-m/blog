function proxy_start {
    privoxy /usr/local/etc/privoxy/config
}
function proxy_ss {
    export http_proxy=http://127.0.0.1:8118
    export https_proxy=http://127.0.0.1:8118
}
