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

![](https://user-images.githubusercontent.com/9450943/140811276-b794f2d5-4a43-49ea-887b-6b84db9483db.png)

![](https://user-images.githubusercontent.com/9450943/140811459-5a021aff-9cf6-46b1-8ef1-d88a5e972d10.png)

![](https://user-images.githubusercontent.com/9450943/140811822-8e71bfc4-8fea-4f22-b777-a3e85aebf3aa.png)

![](https://user-images.githubusercontent.com/9450943/140811912-748e3f9e-222a-4367-ba4e-8a2a0797844a.png)

![](https://user-images.githubusercontent.com/9450943/140812274-c8d6f376-9819-4d14-b893-0197ba6616f8.png)
