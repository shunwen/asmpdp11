" Vim syntax file
" Language: PDP11/40
" Maintainer: Shunwen Hsiao <hsiaoshunwen@gmail.com>
" Latest Revision: 21 Feb 2013

" Modify asm68k.vim to support pdp11-40 syntax

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Partial list of register symbols
" General registers: r0 - r5
" Kernel stack pointer: r6 (sp)
" User stack pointer: r6 (with memory management option)
" Program counter: r7 (pc)
syn keyword asmpdp11Reg r0 r1 r2 r3 r4 r5 r6 r7
syn keyword asmpdp11Reg pc sp

" Processor Status Word (PS), located at location 777776
syn keyword asmpdp11Symbol PS


" PDP11-40 opcodes - order is important
" SINGLE OPERAND
" General
syn match asmpdp11Opcode /\<clr[b]\=\s/ " clear destination
syn match asmpdp11Opcode /\<com[b]\=\s/ " complement dst
syn match asmpdp11Opcode /\<inc[b]\=\s/ " increment dst
syn match asmpdp11Opcode /\<dec[b]\=\s/ " decrement dst
syn match asmpdp11Opcode /\<neg[b]\=\s/ " negate dst
syn match asmpdp11Opcode /\<tst[b]\=\s/ " test dst
" Shift and Rotate
syn match asmpdp11Opcode /\<asr[b]\=\s/ " arithmetic shift right
syn match asmpdp11Opcode /\<asl[b]\=\s/ " arithmetic shift left
syn match asmpdp11Opcode /\<ror[b]\=\s/ " rotate right
syn match asmpdp11Opcode /\<rol[b]\=\s/ " rotate left
syn match asmpdp11Opcode /\<swab\s/ " swap bytes
" Multiple Precision
syn match asmpdp11Opcode /\<adc[b]\=\s/ " add carry
syn match asmpdp11Opcode /\<sbc[b]\=\s/ " subtract carry
syn match asmpdp11Opcode /\<sxt\s/ " sign extend

" DOUBLE OPERAND
" General
syn match asmpdp11Opcode /\<mov[b]\=\s/ " move source to destination
syn match asmpdp11Opcode /\<cmp[b]\=\s/ " compare src to dst
syn match asmpdp11Opcode /\<add\s/ " add src to dst
syn match asmpdp11Opcode /\<sub\s/ " substract src from dst
" Logical
syn match asmpdp11Opcode /\<bit[b]\=\s/ " bit test
syn match asmpdp11Opcode /\<bic[b]\=\s/ " bit clear
syn match asmpdp11Opcode /\<bis[b]\=\s/ " bit set
" Register
syn match asmpdp11Opcode /\<mul\s/ " multiply
syn match asmpdp11Opcode /\<div\s/ " divide
syn match asmpdp11Opcode /\<ash\s/ " shift arithmetically
syn match asmpdp11Opcode /\<ashc\s/ " arithmetic shift combined
syn match asmpdp11Opcode /\<xor\s/ " exclusive OR

" PROGRAM CONTROL
" Branch
syn match asmpdp11Opcode /\<br/ " branch (unconditional)
syn match asmpdp11Opcode /\<bne/ " branch if not equal (to zero)
syn match asmpdp11Opcode /\<beq/ " branch if equal (to zero)
syn match asmpdp11Opcode /\<bpl/ " branch if plus
syn match asmpdp11Opcode /\<bmi/ " branch if minus
syn match asmpdp11Opcode /\<bvc/ " branch if overflow is clear
syn match asmpdp11Opcode /\<bvs/ " branch if overflow is set
syn match asmpdp11Opcode /\<bcc/ " branch if carry is clear
syn match asmpdp11Opcode /\<bcs/ " branch if carry is set
" Signed Conditional Branch
syn match asmpdp11Opcode /\<bge/ " branch if greater than or equal (to zero)
syn match asmpdp11Opcode /\<blt/ " branch if less than (zero)
syn match asmpdp11Opcode /\<bgt/ " branch if greater than (zero)
syn match asmpdp11Opcode /\<ble/ " branch if less than or equal (to zero)
" Unsigned Conditional Branch
syn match asmpdp11Opcode /\<bhi/ " branch if higher
syn match asmpdp11Opcode /\<blos/ " branch if lower or same
syn match asmpdp11Opcode /\<bhis/ " branch if higher or same
syn match asmpdp11Opcode /\<blo/ " branch if lower
" Jump and Subroutine
syn match asmpdp11Opcode /\<jmp\s/ " jump
syn match asmpdp11Opcode /\<jsr\s/ " jump to subroutine
syn match asmpdp11Opcode /\<rts/ " return from subroutine
syn match asmpdp11Opcode /\<mark/ " mark
syn match asmpdp11Opcode /\<sob\s/ " substract one and branch (if != 0)
" Trap and Interrupt 
syn match asmpdp11Opcode /\<emt/ " emulator trap
syn match asmpdp11Opcode /\<trap/ " trap
syn match asmpdp11Opcode /\<bpt/ " breakpoint trap
syn match asmpdp11Opcode /\<iot/ " input/output trap
syn match asmpdp11Opcode /\<rti/ " return from interrupt
syn match asmpdp11Opcode /\<rtt/ " return from interrupt

" MISCELLANEOUS
syn match asmpdp11Opcode /\<halt/ " halt
syn match asmpdp11Opcode /\<wait/ " wait for interrupt
syn match asmpdp11Opcode /\<reset/ " reset external bus
syn match asmpdp11Opcode /\<mfpi\s/ " move from previous instruction space
syn match asmpdp11Opcode /\<mtpi\s/ " move to previous instruction space
" Condition Code Operation
syn match asmpdp11Opcode /\<clc/ " clear
syn match asmpdp11Opcode /\<clv/
syn match asmpdp11Opcode /\<clz/
syn match asmpdp11Opcode /\<cln/
syn match asmpdp11Opcode /\<ccc/
syn match asmpdp11Opcode /\<sec/ " set
syn match asmpdp11Opcode /\<sev/
syn match asmpdp11Opcode /\<sez/
syn match asmpdp11Opcode /\<sen/
syn match asmpdp11Opcode /\<scc/

" Valid labels
syn match asmpdp11Label /^\s*[a-z0-9_?.][a-z0-9_?.$]*:/he=e-1

" Various number formats
syn match asmpdp11OctNumber /\<[0-7]\+\>/
syn match asmpdp11DecNumber /\<[0-9]\+\.\>/

" Immediate data
syn match asmpdp11Immediate /\$[0-9]\+\./ contains=asmpdp11DecNumber
syn match asmpdp11Immediate /\$[0-7]\+/ contains=asmpdp11OctNumber
"syn match asmpdp11Symbol /[a-z_?.][]/ TODO

" Special items for comments
syn keyword asmpdp11Todo contained TODO

" Operaters
syn match asmpdp11Operator /[-+]/ 
" Deferred addressing
syn match asmpdp11Operator /@/ 
" Use of the PC as a general register
syn match asmpdp11Operator /#/ " Immediate
syn match asmpdp11Operator /@#/ " Absolute

" Comments
syn match asmpdp11Comment /\/.*/ contains=asmpdp11Todo
syn region asmpdp11Comment start=/\/\*/ end=/\*\// contains=asmpdp11Todo

" storage types
syn match asmpdp11Type /\.globl/

syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asmpdp11_syntax_inits")
  if version < 508
    let did_asmpdp11_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting. Can be overridden later
  " Comment Constant Error Identifier PreProc Special Statement Todo Type
  "
  " Constant        Boolean Character Number String
  " Identifier      Function
  " PreProc         Define Include Macro PreCondit
  " Statement       Conditional Exception Keyword Label Operator Repeat
  " Type            StorageClass Structure Typedef
    
  HiLink asmpdp11Comment Comment
  HiLink asmpdp11Todo Todo
  HiLink asmpdp11Immediate SpecialChar

  HiLink asmpdp11String String
  HiLink asmpdp11CharError Error
  HiLink asmpdp11StringError Error

  HiLink asmpdp11Reg Macro 
  HiLink asmpdp11Operator Identifier

  HiLink asmpdp11Opcode Statement
  HiLink asmpdp11Type Type    
  HiLink asmpdp11Label Macro
  HiLink asmpdp11Macro Macro
  HiLink asmpdp11OctNumber Number
  HiLink asmpdp11DecNumber Number

  delcommand HiLink
endif

let b:current_syntax = "asmpdp11"

" vim: ts=4 sw=2
