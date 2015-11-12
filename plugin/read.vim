if exists('g:loaded_read') && g:loaded_read
  finish
endif
let g:loaded_read = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:read_cmd')
  let g:read_cmd='say'
endif

nnoremap <silent> <Plug>Read :<C-U>set opfunc=read#filterop<CR>g@
nnoremap <silent> <Plug>StopReading :<C-U>call read#stop()<CR>
xnoremap <silent> <Plug>Read :<C-U>call read#filterop(visualmode())<CR>

nmap yr <Plug>Read
nmap yrr <Plug>Read_
nmap yrs <Plug>StopReading
xmap <C-R> <Plug>Read

augroup VimRead
  autocmd!
  autocmd VimLeave * call read#stop()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim et sw=2:
