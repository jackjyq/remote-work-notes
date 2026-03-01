# initilize proxy function
function proxy {
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('on', 'off', 'status')]
        [string]$Command
    )

    $proxy_server = "127.0.0.1"
    $proxy_port = 7897

    $usage = @"
代理配置脚本

用法:
  proxy on|off|status

命令:
  on          设置代理
  off         取消代理
  status      查看状态
"@

    $all_proxy = "http://${proxy_server}:${proxy_port}"
    switch ($Command) {
        "on" {
            Write-Output "代理设置为: $all_proxy"
            $env:all_proxy = $all_proxy
            $env:ALL_PROXY = $all_proxy
            $env:http_proxy = $all_proxy
            $env:HTTP_PROXY = $all_proxy
            $env:https_proxy = $all_proxy
            $env:HTTPS_PROXY = $all_proxy
        }
        "off" {
            Write-Output "代理已取消"
            $env:all_proxy = $null
            $env:ALL_PROXY = $null
            $env:http_proxy = $null
            $env:HTTP_PROXY = $null
            $env:https_proxy = $null
            $env:HTTPS_PROXY = $null
        }
        "status" {
            if ($env:http_proxy) {
                Write-Output "代理状态为: $env:http_proxy"
                Write-Output (Invoke-RestMethod -Uri "https://lumtest.com/myip.json" -Proxy $env:http_proxy)
            } else {
                Write-Output "代理状态为: 未设置"
                Invoke-RestMethod -Uri "https://lumtest.com/myip.json" -NoProxy
            }
        }
        default {
            Write-Output $usage
        }
    }
}