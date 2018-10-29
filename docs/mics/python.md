1. [升级所有 py 包到最新版本](https://stackoverflow.com/a/3452888/5443510)

```bash
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
```
