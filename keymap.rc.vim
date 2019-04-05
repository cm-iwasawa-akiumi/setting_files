"-----------------------------------
"ショートカットキー設定
"----------------------------------
" ファイラを起動
nnoremap fe :VimFilerExplorer<Enter>
" 次のbufferへ
nnoremap bt :bn<Enter>
" 前のbufferへ
nnoremap bT :bp<Enter>
" buffer削除
nnoremap bd :bdelete<Enter>
" 水平分割
nnoremap bs :split<Enter>
" 垂直分割
nnoremap bv :vsplit<Enter>
" 他ウィンドウを閉じる
nnoremap bo :only<Enter>
" 隣のウィンドウへ
nnoremap bw <C-w>w
" 高さ大きく
nnoremap b+ <C-w>+
" 高さ小さく
nnoremap b- <C-w>-
" 高さ均等
nnoremap b= <C-w>=
" 幅を大きく
nnoremap b< <C-w><
" 幅を小さく
nnoremap b> <C-w>>
" ビジュアルモード選択した部分を*で検索
vnoremap * h"zy:let @/ = @z<CR>n

