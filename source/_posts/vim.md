---
title: vim使用心得
date: 2019-11-08 15:33:11
description: tabris的vim使用心得
toc: true
author: tabris
# 图片推荐使用图床(腾讯云、七牛云、又拍云等)来做图片的路径.如:http://xxx.com/xxx.jpg
img: 
# 如果top值为true,则会是首页推荐文章
top: false
# 如果要对文章设置阅读验证密码的话,就可以在设置password的值,该值必须是用SHA256加密后的密码,防止被他人识破
password: 
# 本文章是否开启mathjax，且需要在主题的_config.yml文件中也需要开启才行
mathjax: false
summary: 
categories: 实用技能
tags:
  - editor
---



# vim简介

Vim是从 vi 发展出来的一个文本编辑器。代码补完、编译及错误跳转等方便编程的功能特别丰富，在程序员中被广泛使用。

所有的 Unix Like 系统都会内建 vi 文本编辑器，其他的文本编辑器则不一定会存在。

但是目前我们使用比较多的是 vim 编辑器。

vim 具有程序编辑的能力，可以主动的以字体颜色辨别语法的正确性，方便程序设计。

vim主要有以下几个优点.

- 可以不使用鼠标，完全用键盘操作。
- 系统资源占用小，打开大文件毫无压力。
- 键盘命令变成肌肉记忆以后，操作速度极快。

同时现今很多开源软件(ranger,lazygit)采用的快捷键都与vim类似.学习vim变得很有必要.

但我这里采用的是`neovim`

[NeoVim](https://neovim.io/) 旨在成为Vim的升级版，有不少对它的介绍，我就不赘述了。NeoVim官网强调了它的四大特点:

- Powerful plugins（强大的插件）
- Better out-of-the-box（更好的开箱即用）
- First-class embedding（高度支持嵌入模式）
- Drop-in replacement for Vim（直接替换Vim）。

## vim基本配置

> 了解的还不是很详细, 暂时以我自己的配置介绍

```vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number

set termguicolors                                  " true color
colorscheme NeoSolarized                           " scheme
set background=dark

set encoding=utf-8

" 自动折行
set linebreak
set nowrap
"垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set scrolloff=5

"set textwidth=80
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽,space:·

" 高亮当前行列
set cursorcolumn
set cursorline

" 搜索时忽略大小写。
set ignorecase
" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。
set smartcase

" 打开英语单词的拼写检查。
set spell spelllang=en_us

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keyboard map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sudo保存
ca w!! w !sudo tee "%" 

tnoremap <ESC>    <C-\><C-n>

"去行首空格
":%s/^\s\+
"去行末空格
":%s/\s\+$

```



## vim插件管理器

> 参考 https://www.jianshu.com/p/0c83e6aed270
>
> **每安装一个插件最好都要去github官网看下,顺便看看文档, 会让你安装的插件用起来更顺手.**

### 安装

现在流行的有这几种插件管理器,`VBunle`,`NeoBunle`,`vim-plug`, 我这里采用的是`vim-plug`.

neovim下安装命令

```shell
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ 
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

vim下安装命令

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ 
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 用法

#### 安装插件

要安装插件，你必须如下所示首先在 Vim 配置文件中声明它们。一般 Vim 的配置文件是 `~/.vimrc`，Neovim 的配置文件是 `~/.config/nvim/init.vim`。请记住，当你在配置文件中声明插件时，列表应该以 `call plug#begin(PLUGIN_DIRECTORY)` 开始，并以 `plug#end()` 结束。

例如，我们安装 “lightline.vim” 插件。为此，请在 `~/.vimrc` 的顶部添加以下行。

```typescript
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
call plug#end()
```

在 vim 配置文件中添加上面的行后，通过输入以下命令重新加载：
 `:source ~/.vimrc`
 或者，只需重新加载 Vim 编辑器。

 现在，打开 vim 编辑器：
 `$ vim`
 使用以下命令检查状态：
 `:PlugStatus`
 然后输入下面的命令，然后按回车键安装之前在配置文件中声明的插件。
 `:PlugInstall`

#### 更新插件

要更新插件，请运行：

```vim
:PlugUpdate
```

更新插件后，按下 `d` 查看更改。或者，你可以之后输入 `:PlugDiff`。

#### 审查插件

有时，更新的插件可能有新的 bug 或无法正常工作。要解决这个问题，你可以简单地回滚有问题的插件。输入 `:PlugDiff` 命令，然后按回车键查看上次 `:PlugUpdate`的更改，并在每个段落上按 `X` 将每个插件回滚到更新前的前一个状态。

#### 删除插件

删除一个插件删除或注释掉你以前在你的 vim 配置文件中添加的 `plug` 命令。然后，运行 `:source ~/.vimrc` 或重启 Vim 编辑器。最后，运行以下命令卸载插件：
 `:PlugClean`

该命令将删除 vim 配置文件中所有未声明的插件。

#### 升级 Vim-plug

要升级vim-plug本身，请输入：
 `:PlugUpgrade`

如你所见，使用 Vim-plug 管理插件并不难。它简化了插件管理。现在去找出你最喜欢的插件并使用 Vim-plug 来安装它们。

# 安装插件

> 插件这个东西,少即是多,运行速度会更快

## 工具篇

### 安装[vim中文手册](https://github.com/yianwillis/vimcdoc)

[yianwillis/vimcdoc](https://github.com/yianwillis/vimcdoc)

`Plug 'yianwillis/vimcdoc'`

### 编码优化插件

#### 代码补全

vim要有python支持,如果没有需要输入`pip install neovim`命令安装neovim的python支持模块.

`Plug 'Valloric/YouCompleteMe'`

**上面的插件对C++的支持是很强大的但是在麻烦.后来改用`deoplete`了**

```typescript
Plug 'shougo/unite.vim'                            " deoplete依赖
Plug 'Shougo/deoplete.nvim'                        " 代码补全
Plug 'jiangmiao/auto-pairs'                        " 括号自动补全
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'                        " 静态代码分析
Plug 'neomake/neomake'                             " 语法检查
Plug 'mg979/vim-visual-multi'                      " 多光标 
```

### GitHelp

```typescript
Plug 'tpope/vim-fugitive'                          " git plugin
Plug 'airblade/vim-gitgutter'                      "
```

### 文件树

> ```typescript
> Plug 'shougo/vimfiler.vim'                         " file explorer 这个项目已经不维护了
> ```

现在采用`shougo/defx.nvim`这个插件

```typescript
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" 这是defx的两个支持插件
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
```

defx 没有提供默认的键盘映射,所以需要自己进行设置

```typescript
" 这是我的配置. 参考文档种的配置做的修改.  还需完善
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  setl nonumber
  setl norelativenumber
  setl listchars=

  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
"  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#is_opened_tree() ? defx#do_action('close_tree') :defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction
```



### 语法树

```typescript
Plug 'majutsushi/tagbar'                           "浏览tag    
```

## **美化篇**

### 安装开始界面插件

```typescript
Plug 'mhinz/vim-startify'                              "start page
```

### 安装主题

`Plug 'icymind/NeoSolarized'                 "主题    `

### 安装状态栏插件

状态栏能显示当前的状态，还是有不少用处的，好看的状态栏就是为了美观，毕竟谁也不喜欢对着个难看的东西吧。
 　　这里使用的是 [airline ](https://link.jianshu.com?t=https%3A%2F%2Fgithub.com%2Fvim-airline%2Fvim-airline)：

```typescript
Plug 'vim-airline/vim-airline'                     "状态栏工具    
Plug 'vim-airline/vim-airline-themes'              "状态栏主题    
```

```typescript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'
```

-----

这是我自己的neovim配置

https://github.com/tabris233/config/blob/master/neovim/init.vim

