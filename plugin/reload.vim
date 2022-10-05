if !exists('*reload#save_and_exec')
  function! reload#save_and_exec() abort
    if &filetype == 'vim'
      :silent! write
      :source %
      :lua print('reload! vim')
    elseif &filetype == 'lua'
      :silent! write
      :luafi %
      :lua print('reload! lua')
    endif

    return
  endfunction
endif

nnoremap <leader><leader>x :call reload#save_and_exec()<cr>
