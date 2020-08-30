## 自动批渲染条件



1.  材质 (`materialID`) 是否一样，决定是否自动合并渲染

cocos2dx-lite/frameworks/cocos2d-x/cocos/renderer/CCRenderer.cpp:759

```c++
        // in the same batch ?
        if (batchable && (prevMaterialID == currentMaterialID || firstCommand))
        {
            CC_ASSERT((firstCommand || _triBatchesToDraw[batchesTotal].cmd->getMaterialID() == cmd->getMaterialID()) && "argh... error in logic");
            _triBatchesToDraw[batchesTotal].indicesToDraw += cmd->getIndexCount();
            _triBatchesToDraw[batchesTotal].cmd = cmd;
        }
```

2.  材质 (`materialID`)  的计算方式

    -   纹理 id
    -   混合方式
    -   是否同一个 `glProgramState`
        -   输入变量 `uniforms`
        -   glProgram `shader`

    cocos2dx-lite/frameworks/cocos2d-x/cocos/renderer/CCTrianglesCommand.cpp:88

    ```c++
    void TrianglesCommand::generateMaterialID()
    {
        // glProgramState is hashed because it contains:
        //  *  uniforms/values
        //  *  glProgram
        //
        // we safely can when the same glProgramState is being used then they share those states
        // if they don't have the same glProgramState, they might still have the same
        // uniforms/values and glProgram, but it would be too expensive to check the uniforms.
        struct {
            void* glProgramState;
            GLuint textureId;
            GLenum blendSrc;
            GLenum blendDst;
        } hashMe;

        // NOTE: Initialize hashMe struct to make the value of padding bytes be filled with zero.
        // It's important since XXH32 below will also consider the padding bytes which probably 
        // are set to random values by different compilers.
        memset(&hashMe, 0, sizeof(hashMe)); 

        hashMe.textureId = _textureID;
        hashMe.blendSrc = _blendType.src;
        hashMe.blendDst = _blendType.dst;
        hashMe.glProgramState = _glProgramState;
        _materialID = XXH32((const void*)&hashMe, sizeof(hashMe), 0);
    }
    ```

    ​