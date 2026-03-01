function proxy() {
  usage="代理配置脚本

  用法:
    proxy on|off|status

  命令:
    on          设置代理
    off         取消代理
    status      查看状态

  准备:
    代理软件配置参考:
      - 开启"允许来自局域网的连接"
      - 本地端口与 proxy_port 变量一致
    防火墙配置参考:
      - v2rayN: 允许 v2rayN 和 xray
      - shadowsocksR: 允许 shadowsocksr
  "
  local proxy_port=7897
  # WSL Mirrored mode
  local proxy_server=localhost
  # WSL NAT mode
  #   local proxy_server=`cat /etc/resolv.conf|grep nameserver|awk '{print $2}'`

  if [ "$1" = "on" ]; then
    export all_proxy=http://$proxy_server:$proxy_port
    export ALL_PROXY=$all_proxy
    export http_proxy=$all_proxy
    export HTTP_PROXY=$all_proxy
    export https_proxy=$all_proxy
    export HTTPS_PROXY=$all_proxy
  elif [ "$1" = "off" ]; then
    unset all_proxy ALL_PROXY http_proxy HTTP_PROXY https_proxy HTTPS_PROXY
  elif [ "$1" = "status" ]; then
    curl -s https://lumtest.com/myip.json | python3 -m json.tool
  else
    echo "$usage"
  fi
}