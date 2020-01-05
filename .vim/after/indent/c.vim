setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" Commands to undo the above
if exists('b:undo_indent')
  let b:undo_indent = b:undo_indent . '|setlocal tabstop<'
  let b:undo_indent = b:undo_indent . '|setlocal softtabstop<'
  let b:undo_indent = b:undo_indent . '|setlocal shiftwidth<'
  let b:undo_indent = b:undo_indent . '|setlocal expandtab<'
endif
