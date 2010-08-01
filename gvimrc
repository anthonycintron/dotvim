set guifont=Inconsolata:h20     " Font family and size
set encoding=utf-8              " Use UTF-8
set guioptions-=T               " no toolbar
set guioptions+=c               " use console dialogs

set guioptions-=R               " Turn off scrollbars
set guioptions-=r
set guioptions-=L
set guioptions-=l

" MacVim options
if has("gui_macvim")
  set antialias                 " Smooth fonts
  set fuoptions=maxvert,maxhorz " Full screen options
endif

