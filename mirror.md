# 使用镜像加速下载

## Ubuntu APT 镜像

- [Tuna 镜像](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)

## Docker 镜像

没有，请使用 TUN 模式强制所有流量通过代理

## Python 镜像

### UV (Python 包管理器)

配置文件: `~/.zshrc`

```shell
# uv
export UV_PYTHON_INSTALL_MIRROR="https://mirror.nju.edu.cn/github-release/astral-sh/python-build-standalone/"
export UV_DEFAULT_INDEX="https://pypi.tuna.tsinghua.edu.cn/simple"
```

## Node.js 镜像

### NVM

配置文件: `~/.zshrc`

```shell
export NVM_NODEJS_ORG_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
```

### npm

配置文件: `~/.npmrc`

```shell
registry=https://registry.npmmirror.com
```
### Bun

配置文件: `~/.bunfig.toml`

```toml
[install]
registry = "https://registry.npmmirror.com"
```

## Oh My zsh 及部分插件镜像

- [NJU](https://mirror.nju.edu.cn/mirrorz-help/ohmyzsh.git?mirror=NJU)