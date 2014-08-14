" Change current directory to top of repositories automatically.
" Version: 0.1.0
" Author : scheakur <scheakur@gmail.com>
" License: MIT License

if exists('g:loaded_repautocd')
	finish
endif
let g:loaded_repautocd = 1

let s:save_cpo = &cpo
set cpo&vim

let g:repautocd_markers = get(g:, 'repautocd_markers', ['.git', '.hg', '.svn'])

augroup plugin-repautocd
	autocmd!
	autocmd VimEnter * nested
	\	if argc() == 0
	\|		call repautocd#cd(g:repautocd_markers)
	\|	endif
	autocmd BufNewFile,BufReadPost,BufEnter * nested
	\	call repautocd#cd(g:repautocd_markers)
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
