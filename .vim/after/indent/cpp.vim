setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" Commands to undo the above
if exists('b:undo_indent')
  let b:undo_indent = b:undo_indent . '|setlocal tabstop<'
  let b:undo_indent = b:undo_indent . '|setlocal softtabstop<'
  let b:undo_indent = b:undo_indent . '|setlocal shiftwidth<'
  let b:undo_indent = b:undo_indent . '|setlocal expandtab<'
endif
