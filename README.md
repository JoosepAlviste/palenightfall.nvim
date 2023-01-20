# 🌑 Palenightfall

## ![](https://user-images.githubusercontent.com/9450943/132907523-7033ec1d-281e-418c-907c-1f2de2d4b7c6.png)

A Neovim theme inspired by material palenight. I've used the [material 
palenight](https://github.com/kaicataldo/material.vim) theme for a long time and
have made many adjustments to it in my config. I thought that it would make 
sense to turn this into an actual theme.

Here are some differences from the material themes:

- **Darker**: A darker background color
- **Easier on the eyes**: Much less red and brown
- **Smaller and simpler codebase**: A single theme since I only used the 
  palenight variant

## ⚡️ Requirements

- Neovim >= 0.5.0


## 📦 Installation

Install with your favorite plugin manager:

```lua
use 'JoosepAlviste/palenightfall.nvim'
```


## 🚀 Usage

In Vimscript:

```vim
colorscheme palenightfall
```

Or in Lua:

```lua
require('palenightfall').setup()
```


## ⚙️ Configuration

Any colors and highlights can be overridden in Lua with the `setup` function:

```lua
require('palenightfall').setup({
  color_overrides = {
    cyan = '#fff0000',
  },
  highlight_overrides = {
    -- Check the exact highlight configuration format from the code
    Normal = { fg = '#ff0000' },
  },
})
```

There are also explicit functions for overriding either the colors or the 
highlights:

```lua
require('palenightfall').configure_colors({
  cyan = '#fff0000',
})
require('palenightfall').configure_highlights({
  Normal = { fg = '#ff0000' },
})

-- Make sure to call `.setup()` *after* configuration
require('palenightfall').setup()
```

You can access the colors if you would like to use them in your own 
customizations:

```lua
local colors = require('palenightfall').colors

require('palenightfall').setup({
  highlight_overrides = {
    Normal = { fg = colors.cyan },
  },
})
```


## More screenshots

![](https://user-images.githubusercontent.com/9450943/213535377-2f8a4659-d124-4831-8174-e103e20393ce.png)

![](https://user-images.githubusercontent.com/9450943/213535691-2e14f221-8802-4c1a-8634-2d45b8ce6bca.png)

![](https://user-images.githubusercontent.com/9450943/213536594-85831ac3-80e4-413e-a9b5-ce6eb3d31b93.png)

![](https://user-images.githubusercontent.com/9450943/213536758-d5c0f7ba-7006-42c4-80b8-5028de0f5b30.png)

![](https://user-images.githubusercontent.com/9450943/213537003-e25c8d5c-d7f2-4018-9fe2-59ff1611522a.png)

![](https://user-images.githubusercontent.com/9450943/213640206-21b20169-4b92-438d-982b-e4efd57476bd.png)

![](https://user-images.githubusercontent.com/9450943/213548641-caccc513-52d5-49c5-86e1-4df361a0cb49.png)

![](https://user-images.githubusercontent.com/9450943/213640659-e65cc5cc-7ea1-43c4-9d84-ab0e38c378fa.png)

![](https://user-images.githubusercontent.com/9450943/213641206-e26f2f59-2519-408a-882b-ff0675830dbe.png)
