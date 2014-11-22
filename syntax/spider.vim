" Vim syntax file
" Language:     Spider Script
" Maintainer:   Yulong Ruan
" URL:          https://github.com/ruanyl/vim-spider

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'spider'
endif

syn keyword spiderCommentTodo           TODO FIXME XXX TBD contained
syn keyword spiderConditional           if else switch
syn keyword spiderLabel                 case default fallthrough or and
syn keyword spiderRepeat                for in of while until
syn keyword spiderOperator              new typeof
syn keyword spiderFunction              func
syn keyword spiderIdentifier            this var super extends
syn keyword spiderType                  Array Boolean Date Function Number Object String RegExp
syn keyword spiderJsGlobal              console window document screen location navigator setTimeout alert console global require exports module process setTimeout JSON others...
syn keyword spiderStatement             return
syn keyword spiderBoolean               true false
syn keyword spiderNull                  null undefined

if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink spiderCommentTodo              Todo
  HiLink spiderConditional              Conditional
  HiLink spiderLabel                    Label
  HiLink spiderRepeat                   Repeat
  HiLink spiderOperator                 Operator
  HiLink spiderFunction                 Function
  HiLink spiderIdentifier               Identifier
  HiLink spiderType                     Type
  HiLink spiderJsGlobal                 Special
  HiLink spiderStatement                Statement
  HiLink spiderBoolean                  Boolean
  HiLink spiderNull                     Keyword

  delcommand HiLink
endif

let b:current_syntax = "spider"
if main_syntax == 'spider'
  unlet main_syntax
endif
