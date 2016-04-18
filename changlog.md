## compile tcc on osx

```bash
./configure --sysincludepaths=/usr/local/include:`xcrun --show-sdk-path`/usr/include
```

error:
```
src/luatcc.c:3:10: fatal error: 'libtcc.h' file not found
```
