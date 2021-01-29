let g:quickrun_config = { 
    \ "_" : { 
            \ "runner": "vimproc",
            \ "outputter/buffer/split" : ":botright",
            \ "outputter/buffer/close_on_empty" : 1
    \ },
\ }

" pythonを実行
" __file__を認識してくれないが仕方なし...
nnoremap <leader>u :QuickRun<Enter>
"nnoremap <leader>R :QuickRun<Enter>
" nnoremap py :! python  %<Enter>

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
