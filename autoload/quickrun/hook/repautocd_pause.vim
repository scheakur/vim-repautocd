" Author: scheakur <scheakur@gmail.com>
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim


let s:hook = {
\	'config': {
\		'enable': 0
\	}
\}


function! quickrun#hook#repautocd_pause#new()
	return deepcopy(s:hook)
endfunction


function! s:hook.on_module_loaded(session, context)
	let g:repautocd_pause = 1
endfunction


function! s:hook.on_exit(session, context)
	let g:repautocd_pause = 0
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
