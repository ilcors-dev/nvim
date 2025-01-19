" QAK DSL Syntax Highlighting with Embedded Kotlin
if exists("b:current_syntax")
    finish
endif

" Keywords
syntax keyword qakKeyword System Context QActor State Dispatch Event Request Reply Signal Token Transition Facade DisplayHTML connectToMqttBroker publish subscribe terminate whenMsg whenEvent

" Colors
syntax keyword qakColor blue red green black yellow magenta cyan gray

" Terminals
syntax match qakVarID "\<[A-Z_][A-Za-z0-9_]*\>"
syntax match qakKCode "#.*#"

" Strings
syntax region qakString start=+"+ skip=+\\"+ end=+"+

" Numbers
syntax match qakNumber "\<\d\+\>"

" Comments (single-line, from # to #)
syntax region qakComment start=/#/ end=/#/ contains=NONE

" Operators, Braces, and Separators
syntax match qakOperator "->"
syntax match qakBraces "[{}]"
syntax match qakSeparator "[;:,]"

" Embedded Kotlin Code
syntax include @Kotlin syntax/kotlin.vim
syntax region qakKotlinCode matchgroup=qakEmbeddedDelim start="\[#" end="#\]" contains=@Kotlin

" Highlighting Rules
hi def link qakKeyword Keyword
hi def link qakColor Constant
hi def link qakVarID Identifier
hi def link qakKCode Special
hi def link qakString String
hi def link qakNumber Number
hi def link qakComment Comment
hi def link qakOperator Operator
hi def link qakBraces Delimiter
hi def link qakSeparator Delimiter
hi def link qakEmbeddedDelim Special

let b:current_syntax = "qak"

