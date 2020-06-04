"-----------------------------------
"ショートカットキー設定
"----------------------------------
" ファイラを起動
nnoremap fe :VimFilerExplorer<Enter>
" 次のbufferへ
nnoremap gt :bn<Enter>
" 前のbufferへ
nnoremap gT :bp<Enter>
" buffer削除
nnoremap gd :bdelete<Enter>
" 水平分割
nnoremap gs :split<Enter>
" 垂直分割
nnoremap gv :vsplit<Enter>
" 他ウィンドウを閉じる
nnoremap go :only<Enter>
" 隣のウィンドウへ
nnoremap gw <C-w>w
" 高さ大きく
nnoremap g+ <C-w>+
" 高さ小さく
nnoremap g- <C-w>-
" 高さ均等
nnoremap g= <C-w>=
" 幅を大きく
nnoremap g< <C-w><
" 幅を小さく
nnoremap g> <C-w>>
" ビジュアルモード選択した部分を*で検索
vnoremap * h"zy:let @/ = @z<CR>n

" 余計なプラグインをアンインストール
nnoremap ui :call map(dein#check_clean(), "delete(v:val, 'rf')")<Enter>:call dein#recache_runtimepath()<Enter>

"nnoremap :! :call vimproc#system('

" ビジュアルモード選択した部分を*で検索
vnoremap g* h"zy:vimgrep <C-r>" **/*.*

" ctags使う
" nmap <Leader>t :TagbarToggle<CR>
