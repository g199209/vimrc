if exists("b:current_syntax")
  finish
endif

syn match LogPrefix '20\d\{6} \d\d:\d\d:\d\d.\d\{6}Z \+\d\+ [A-Z]\+ \{1,2}\S\+ '
 \ contains=LogLevelFatal,LogLevelError,LogLevelWarn,LogLevelInfo,
 \ LogLevelDebug,LogLevelTrace,LogDate,LogTime,LogMsPID
syn match LogLevelFatal 'FATAL' contained 
syn match LogLevelError 'ERROR' contained 
syn match LogLevelWarn  'WARN ' contained 
syn match LogLevelInfo  'INFO  \S\+' contained contains=LogFunctionName
syn match LogLevelDebug 'DEBUG \S\+' contained contains=LogFunctionName
syn match LogLevelTrace 'TRACE \S\+' contained contains=LogFunctionName
syn match LogDate '20\d\{6}' contained
syn match LogTime '\d\d:\d\d:\d\d' contained
syn match LogMsPID '.\d\{6}Z \+\d\+' contained
 \ contains=LogPID,LogTimeMs
syn match LogPID '\d\+' contained
syn match LogTimeMs '.\d\{6}'ms=s+1 contained

" Only INFO, DEBUG, TRACE level log has function name yet.
syn match LogFunctionName ' \S\+'ms=s+1 contained

syn match LogSuffix ' - \w\+.[a-z]\{1,3}:\d\+'
 \ contains=LogFileName,LogLineNumber
syn match LogFileName '\w\+.[a-z]\{1,3}' contained
syn match LogLineNumber ':\d\+'ms=s+1 contained

hi LogLevelFatal cterm=bold ctermfg=Red
hi LogLevelError ctermfg=DarkRed
hi LogLevelWarn ctermfg=Yellow
hi LogLevelInfo ctermfg=Green
hi LogLevelDebug ctermfg=DarkGreen
hi LogLevelTrace ctermfg=DarkGray

hi LogDate cterm=bold ctermfg=DarkGray
hi LogTime ctermfg=Blue
hi LogTimeMs ctermfg=DarkBlue
hi LogMsPID ctermfg=DarkGray
hi LogPID ctermfg=Brown

hi LogFunctionName ctermfg=DarkCyan

hi LogSuffix ctermfg=DarkGray
hi LogFileName ctermfg=DarkMagenta
hi LogLineNumber ctermfg=DarkMagenta
