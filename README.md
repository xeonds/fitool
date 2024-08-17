# FiTool

一个用于解析佳明.Fit格式文件的工具，使用`Flask`，`python-fitool`和`Vue3`开发。

## 用法

- 裸机部署：

```bash
# 安装依赖&编译
pip install --no-cache-dir -r requirements.txt
pnpm i && pnpm run build
# 运行
python main.py
```

- 容器化部署

```bash
make build && make deploy
```

完成后，访问`localhost:8513`来使用服务

或者参考`main.py`的代码编写手动转换工具。

## LICENSE

GNU General Public License V3
