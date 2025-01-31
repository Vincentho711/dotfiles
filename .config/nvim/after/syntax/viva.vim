" Vim syntax file
" Language:	Viva 

" verilog superset

" source $VIMRUNTIME/syntax/verilog.vim

" Read in SystemVerilog syntax files
source $VIMRUNTIME/syntax/systemverilog.vim
unlet b:current_syntax

" include perl

syn include @VivaPerl   $VIMRUNTIME/syntax/perl.vim

" viva functions and guts

syn region  vivaGuts    start="&Ports\|&Wires\|&Regs\|&Sups\|&Ints"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&Ports\|&Wires\|&Regs\|&Sups\|&Ints" end=";" contains=vivaGuts keepend

syn match   vivaGuts    "&Instance"

syn region  vivaGuts    start="&Dangles\|&Contenders\|&Terminates"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&Dangles\|&Contenders\|&Terminates" end=";" contains=vivaGuts keepend

syn match   vivaConn    "\s\(-nowarn\|-fresh\|-final\|-input\|-output\|-inout\|-range\|-snap\|-none\)\s" contained
syn match   vivaConnect "&Connect"

syn match   vivaToff    "\s\(-nowarn\|-fresh\|-final\|-input\|-output\|-inout\|-low\|-high\)\s" contained
syn region  vivaGuts    start="&Terminate "hs=e+1 end=";"he=s-1 contains=vivaToff keepend
syn region  vivaFunc    start="&Terminate " end=";" contains=vivaGuts keepend

syn match   vivaFrce    "\s\(input\|output\|inout\|wire\|wor\|wand\|reg\|internal\|supply0\|supply1\|integer\|\*\)\s" contained
syn region  vivaGuts    start="&Force"hs=e+1 end=";"he=s-1 contains=vivaFrce keepend
syn region  vivaFunc    start="&Force" end=";" contains=vivaGuts keepend

syn match   vivaFrgt    "\s\(declare\|dangle_no_snk\|dangle_no_src\|dangle\|contention\|name_net\|name_inst\|name\|connect_mod\|connect_inst\|connect\|\*\)\s" contained
syn region  vivaGuts    start="&Forget"hs=e+1 end=";"he=s-1 contains=vivaFrgt keepend
syn region  vivaFunc    start="&Forget" end=";" contains=vivaGuts keepend

syn match   vivaGuts    "&Clock"

syn match   vivaRest    "\s\(high\|low\|posedge\|negedge\)\s" contained
syn match   vivaGuts    "&Reset"

syn match   vivaAlwy    "\(-name\|posedge\|negedge\|\sor\s\)" contained
syn region  vivaGuts    start="&Always"hs=e+1 end=";"he=s-1 contains=vivaAlwy keepend
syn region  vivaFunc    start="&Always" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&End"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&End" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&RstVal"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&RstVal" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&BundleUp\|&BundleDn"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&BundleUp\|&BundleDn" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&BlastUp\|&BlastDn"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&BlastUp\|&BlastDn" end=";" contains=vivaGuts keepend

syn region  vivaPerl    start="&Perl "ms=e+1 skip="\\;" end=";"me=s-1 contains=@VivaPerl keepend
syn region  vivaFunc    start="&Perl " skip="\\;" end=";" contains=vivaPerl keepend

syn region  vivaFunc    start="&PerlBeg\|&PerlEnd" end=";" keepend
syn region  vivaPerl    start="&PerlBeg;" end="&PerlEnd;" contains=@VivaPerl,vivaFunc keepend

syn match   vivaShll    "\s\(-raw\)\s" contained
syn region  vivaGuts    start="&ShellBeg\|&ShellEnd\|&Shell "hs=e+1 end=";"he=s-1 contains=vivaShll keepend
syn region  vivaFunc    start="&ShellBeg\|&ShellEnd\|&Shell " end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&Library\|&Catenate\|&Require\|&Depend"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&Library\|&Catenate\|&Require\|&Depend" end=";" contains=vivaGuts keepend

syn match   vivaDsyn    "\s\(on\|off\|ON\|OFF\)" contained
syn region  vivaGuts    start="&Synopsys"hs=e+1 end=";"he=s-1 contains=vivaDsyn keepend
syn region  vivaFunc    start="&Synopsys" end=";" contains=vivaGuts keepend

syn match   vivaVeri    "\s\(on\|off\|ON\|OFF\)\s\(\d\+\)\s" contained
syn region  vivaGuts    start="&Verilint"hs=e+1 end=";"he=s-1 contains=vivaVeri keepend
syn region  vivaFunc    start="&Verilint" end=";" contains=vivaGuts keepend

syn match   vivaLeda    "\s\(on\|off\|ON\|OFF\)\s\(\w\+\)\s" contained
syn region  vivaGuts    start="&Leda"hs=e+1 end=";"he=s-1 contains=vivaLeda keepend
syn region  vivaFunc    start="&Leda" end=";" contains=vivaGuts keepend

syn match   vivaSpys    "\s\(on\|off\|ON\|OFF\)\s\(\w\+\)\s" contained
syn region  vivaGuts    start="&Spyglass"hs=e+1 end=";"he=s-1 contains=vivaSpys keepend
syn region  vivaFunc    start="&Spyglass" end=";" contains=vivaGuts keepend

syn match   vivaVec    "&Vector"

syn match   vivaViva   "\(push\|pop\)" contained
syn match   vivaViva   "\(depend_parser_off\|depend_parser_on\)" contained
syn match   vivaViva   "\(data_parser_off\|data_parser_on\)" contained
syn match   vivaViva   "\(parser_off\|parser_on\)" contained
syn match   vivaViva   "\(conn_matrix_off\|conn_matrix_on\)" contained
syn match   vivaViva   "\(implicit_connection_off\|implicit_connection_on\)" contained
syn match   vivaViva   "\(width_learning_on\|width_learning_off\)" contained
syn match   vivaViva   "\(param_preserve_on\|param_preserve_off\)" contained
syn match   vivaViva   "\(ifdef_resolve_on\|ifdef_resolve_off\)" contained
syn match   vivaViva   "\(ifdef_ignore_on\|ifdef_ignore_off\)" contained
syn match   vivaViva   "\(name_checks_on\|name_checks_off\)" contained
syn match   vivaViva   "\(dangle_checks_on\|dangle_checks_off\)" contained
syn region  vivaGuts    start="&Viva"hs=e+1 end=";"he=s-1 contains=vivaViva keepend
syn region  vivaFunc    start="&Viva" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&ModulePorts\|&Module\|&EndModule"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&ModulePorts\|&Module\|&EndModule" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&ModuleGuts\|&EndModuleGuts"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&ModuleGuts\|&EndModuleGuts" end=";" contains=vivaGuts keepend

syn region  vivaGuts    start="&Attachment\|&Attach"hs=e+1 end=";"he=s-1 keepend
syn region  vivaFunc    start="&Attachment\|&Attach" end=";" contains=vivaGuts keepend

syn region  vivaPsub    start=/::\w\+/hs=s+2 end="[^\l]"he=s-1 keepend
syn region  vivaPlug    start=/::\w\+/ end="[^\l]" contains=vivaPsub keepend

syn region vivaAssertPsub  start="::assert\>" end="[,;]" keepend
syn region vivaAssertPlug  start="::assert\>" end="[,;]" contains=vivaAssertPsub keepend

syntax match vivaStatement /#\s*\(\if\s\+defined\|ifdef\|ifndef\|if\|else\|endif\|define\)\s*\>/

" highlight colors

hi def link vivaGuts       Statement
hi def link vivaFunc       Statement
hi def link vivaConn       Statement
hi def link vivaConnect    Statement
hi def link vivaFrce       Statement
hi def link vivaFrgt       Statement
hi def link vivaRest       Statement
hi def link vivaAlwy       Statement
hi def link vivaDire       Statement
hi def link vivaViva       Statement
hi def link vivaShll       Statement
hi def link vivaVec        Statement

hi def link vivaDsyn       Statement
hi def link vivaVeri       Statement
hi def link vivaLeda       Statement
hi def link vivaSpys       Statement

hi def link vivaPlug       Statement
hi def link vivaPsub       Statement
hi def link vivaAssertPsub Define
hi def link vivaAssertPlug Statement

hi def link vivaDefine     Define
hi def link vivaStatement  Define
" viva lives

let b:current_syntax = "viva"


