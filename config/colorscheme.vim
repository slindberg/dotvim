" only use solarized when running in terminal
if !has("gui_running")
  " tone down invisible characters
  let g:solarized_visibility = "low"

  " make text a little easier to read
  let g:solarized_contrast = "high"

  colorscheme solarized
endif
