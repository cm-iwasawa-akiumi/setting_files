if &compatible
  set nocompatible
endif

" pythonの位置指定. activate中ならばそちらを、それ以外は固定位置を。
if exists("$VIRTUAL_ENV")
  if !empty(glob("$VIRTUAL_ENV/bin/python3"))
    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
  else
    let g:python_host_prog = substitute(system("which python"), '\n', '', 'g')
  endif
else
    let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
    " QuickRun実行時対応
    let $PATH = $HOME . '/.pyenv/versions/neovim3/bin:' . $PATH
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めたTOMLファイル
  " 予め TOML ファイル（後述）を用意しておく
  "let g:rc_dir    = "expand('~/.vim/rc')
  let g:rc_dir    = $XDG_CONFIG_HOME . '/nvim/dein'
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" Uninstall するときは、tomlからコメントアウトして以下を叩く。
" 常時呼び出しだと重いので行わないこと
"call map(dein#check_clean(), "delete(v:val, 'rf')")
"call dein#recache_runtimepath()


filetype plugin indent on
syntax enable

" コメントの色を固定する(colorschemeより前に設定すること)
autocmd ColorScheme * highlight Comment ctermfg=167 guifg=#008800

set background=dark
"colorscheme hybrid
"colorscheme jellybeans
"colorscheme molokai
"colorscheme lucius
colorscheme atom-dark-256

runtime! options.rc.vim
runtime! keymap.rc.vim

