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
syn keyword spiderFunction              func nextgroup=spiderFuncName,spiderFuncArgs skipwhite
syn keyword spiderIdentifier            var
syn keyword spiderSpecialIdentifier     this super extends
syn keyword spiderType                  Array Boolean Date Function Number Object String RegExp
syn keyword spiderJsGlobal              console window document screen location navigator setTimeout alert console global require exports module process setTimeout JSON others...
syn keyword spiderStatement             return
syn keyword spiderBoolean               true false
syn keyword spiderNull                  null undefined
syn keyword spiderNumber                Infinity

syn match spiderNoiseString             /\<[a-zA-Z_$][0-9a-zA-Z_$]*/
syn match spiderFuncName                /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=spiderFuncArgs skipwhite
syn match spiderSpecial                 "\v\\%(0|\\x\x\{2\}\|\\u\x\{4\}\|\c[A-Z]|.)" contained
syn match spiderGlobalIdentifier        /\:\:/
syn match spiderNumber                  /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syn match spiderFloat                   /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syn match spiderLineComment             "\/\/.*" contains=@Spell,spiderCommentTodo
syn match spiderDotNotation             "\." nextgroup=spiderNoiseString
syn match spiderEqualNotation           "=" nextgroup=spiderFunction,spiderNoiseString skipwhite
syn match spiderLogicKeyWords           /\!/ nextgroup=spiderNoiseString skipwhite
syn match spiderLogicKeyWords           /=\{1,3\}\|&&\|||/ nextgroup=spiderNoiseString skipwhite
syn region spiderComment                start="/\*"  end="\*/" contains=@Spell,spiderCommentTodo

syn region spiderFuncArgs               start='(' end=')'
syn region spiderStringD                start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=spiderSpecial,@htmlPreproc,@Spell"
syn region spiderStringS                start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=spiderSpecial,@htmlPreproc,@Spell'
syn region spiderComment                start="/\*"  end="\*/" contains=@Spell,spiderCommentTodo
syn region spiderFuncBlock              start="{" end="}" fold transparent

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
  HiLink spiderFunction                 Type
  HiLink spiderIdentifier               Type
  HiLink spiderSpecialIdentifier        Special
  HiLink spiderType                     Special
  HiLink spiderJsGlobal                 Special
  HiLink spiderStatement                Statement
  HiLink spiderBoolean                  Boolean
  HiLink spiderNull                     Keyword
  HiLink spiderFuncName                 Function
  HiLink spiderStringD                  String
  HiLink spiderStringS                  String
  HiLink spiderGlobalIdentifier         Special
  HiLink spiderNumber                   Special
  HiLink spiderFloat                    Special
  HiLink spiderLogicKeyWords            Operator

  delcommand HiLink
endif

let b:current_syntax = "spider"
if main_syntax == 'spider'
  unlet main_syntax
endif
