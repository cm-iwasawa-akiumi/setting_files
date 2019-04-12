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

