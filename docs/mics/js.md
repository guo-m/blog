1. string 多行声明

比较老的方式
```
function heredoc(fn) {
    return fn.toString().split('\n').slice(1,-1).join('\n') + '\n'
}

var content = heredoc(function() {/*
{
    "android": {
        "Facebook": {
            "debug": false
        }
    }, 
    "ios": {
        "Facebook": {
            "debug": true
        }
    }
}
*/});
```
