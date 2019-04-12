let g:jedi#popup_on_dot = 0 " ドット(.)を入力したとき自動で補完しない(Ctrl+Space)
let g:jedi#popup_select_first = 0 " 補完候補の1番目を選択しない
"set completeopt=menuone                        " 補完候補を呼び出すとき常にポップアップメニューを使う
"let g:jedi#use_tabs_not_buffers = 1 
"let g:jedi#auto_initialization = 0 " 自動で実行される初期化処理を無効
"let g:jedi#auto_vim_configuration = 0 " 'completeopt' オプションを上書きしない
let g:jedi#show_call_signatures = 1 " 関数の引数表示

autocmd FileType python setlocal omnifunc=jedi#completions   " 補完エンジンはjediを使う
autocmd FileType python setlocal completeopt-=preview   "　ポップアップを表示しない

