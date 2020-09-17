if !has('python') && !has('python3')
    let g:pymode = 0
else
    let g:pymode = 1
    let g:pymode_lint = 1
    let g:pymode_rope = 0
    let g:pymode_rope_lookup_project = 0
    let g:pymode_rope_autoimport = 0
    let g:pymode_doc = 1
    let g:pymode_virtualenv = 1
    let g:pymode_lint_ignore = "E501"
    let g:pymode_python = 'python3'
endif
