## GlobalZOrder 探索

1.  渲染书中节点的默认 GlobalZOrder 为 0
2.  渲染顺序，负数，0，正数

### 基于 GlobalZOrder 的批处理

    基础的代码， 4 * 2 = 8 个 drawcalls

    ```lua
        for i=1,4 do
            local node = display.newSprite('logo.png')
            :addTo(layer)
            :center()

            node:scale(0.5)

            cc.LabelBMFont:create('a123bc', 'fonts/futura-48.fnt')
            :addTo(node)
            :pos(node:getContentSize().width/2, node:getContentSize().height/2)
            :scale(2)
        end
    ```

    优化代码，2 个 drawcalls

    ```lua
    for i=1,4 do
        local node = display.newSprite('logo.png')
        :addTo(layer)
        :center()
        :setGlobalZOrder(1)

        node:scale(0.5)

        cc.LabelBMFont:create('a123bc', 'fonts/futura-48.fnt')
        :addTo(node)
        :pos(node:getContentSize().width/2, node:getContentSize().height/2)
        :scale(2)
        :setGlobalZOrder(2)
    end
    ```

    但是 `LabelBMFont` 没有显示出来 ！
    原因是因为 `LabelBMFont` 使用 `Label` 作为子节点 (_label) 来实现 BMFont。这算是技术债务了。
    所以必须把 `_label` 的 `GlobalZOrder` 也一并设置。

    ```lua
    local LabelBMFont = cc.LabelBMFont

    local originsetGlobalZOrder = cc.Node.setGlobalZOrder
    function LabelBMFont:setGlobalZOrder( globalZOrder )
        originsetGlobalZOrder(self, globalZOrder)
        for k,v in pairs(self:getChildren()) do
            originsetGlobalZOrder(v, globalZOrder)
        end
    end
    ```

## 局限

1.  `setGlobalZOrder` 会让节点逃逸出裁剪。即：节点不再接受裁剪
2.  会在场景最后渲染，因为默认节点的 globalZOrder 都是 0
