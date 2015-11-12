" load guard {{{1

if exists('g:autoloaded_read')
  finish
endif
let g:autoloaded_read = 1

" }}}
" opfunc() {{{1

function! s:opfunc(type) abort
  let sel_save = &selection
  let cb_save = &clipboard
  let reg_save = @@
  try
    set selection=inclusive clipboard-=unnamed clipboard-=unnamedplus
    if a:type =~ '^\d\+$'
      silent exe 'normal! ^v'.a:type.'$hy'
    elseif a:type =~# '^.$'
      silent exe "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'line'
      silent exe "normal! '[V']y"
    elseif a:type ==# 'block'
      silent exe "normal! `[\<C-V>`]y"
    else
      silent exe "normal! `[v`]y"
    endif
    redraw
    return @@
  finally
    let @@ = reg_save
    let &selection = sel_save
    let &clipboard = cb_save
  endtry
endfunction

" }}}
" read#stop() {{{1

" stops reading (if running)
function! read#stop()
  " if read command is still running
  if exists('s:pid') && len(system('ps -p '.s:pid.' -o "command" | grep ^'.g:read_cmd))
    call system('kill -9 '.s:pid)
  endif
endfunction

" }}}
" read#filterop() {{{1

function! read#filterop(type) abort
  if !executable(g:read_cmd)
    echohl ErrorMSG | echo g:read_cmd.' executable not found!' | echohl NONE
    return
  endif
  try
    let expr = s:opfunc(a:type)

    let command = g:read_cmd
    if exists('g:read_voice')
      let command .= ' -v '.g:read_voice
    endif

    call read#stop()
    let pid = system(command.' "'.shellescape(expr).'" & echo $!')
    let s:pid = substitute(pid, "\n", "", "")
  catch /^.*/
    echohl ErrorMSG | echo v:errmsg | echohl NONE
  endtry
endfunction

" }}}
" vim:set ft=vim et sw=2:
