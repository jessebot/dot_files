" this function just quits neovim if we're running in headless mode
function! QuitNeovimIfHeadless()
  let s:ui = nvim_list_uis()
  if empty(s:ui)
    echom 'we are headless, so we will now exit'
    quitall
  else
    echom '♥ ♥ ♥'
  endif
endfunction

" PackerComplete fires after PackerSync finishes
augroup packer_exit
  autocmd!
  " this quits, but only in headless mode after packersync
  autocmd User PackerComplete call QuitNeovimIfHeadless()
augroup end
