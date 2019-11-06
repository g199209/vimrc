if exists("b:current_syntax")
  finish
endif

syn match LogPrefix '20\d\{6} \d\d:\d\d:\d\d.\d\{6}Z \d\+ [A-Z]\+ \{1,2}\w\+(\?)\? '
 \ contains=LogLevelFatal,LogLevelError,LogLevelWarn,LogLevelInfo,
 \ LogLevelDebug,LogLevelTrace,LogDate,LogTime,LogMsPID
syn match LogLevelFatal 'FATAL' contained 
syn match LogLevelError 'ERROR' contained 
syn match LogLevelWarn  'WARN ' contained 
syn match LogLevelInfo  'INFO  \w\+(\?)\?' contained contains=LogFunctionName
syn match LogLevelDebug 'DEBUG \w\+(\?)\?' contained contains=LogFunctionName
syn match LogLevelTrace 'TRACE \w\+(\?)\?' contained contains=LogFunctionName
syn match LogDate '20\d\{6}' contained
syn match LogTime '\d\d:\d\d:\d\d' contained
syn match LogMsPID '.\d\{6}Z \d\+' contained
 \ contains=LogPID,LogTimeMs
syn match LogPID 'Z \d\+'ms=s+2 contained
syn match LogTimeMs '.\d\{6}'ms=s+1 contained

" Only INFO, DEBUG, TRACE level log has function name yet.
syn match LogFunctionName ' \w\+(\?)\?'ms=s+1 contained

syn match LogSuffix ' - \w\+.[a-z]\{1,3}:\d\+'
 \ contains=LogFileName,LogLineNumber
syn match LogFileName '\w\+.[a-z]\{1,3}' contained
syn match LogLineNumber ':\d\+'ms=s+1 contained

hi LogLevelFatal cterm=bold ctermfg=Red
hi LogLevelError ctermfg=DarkRed
hi LogLevelWarn ctermfg=Yellow
hi LogLevelInfo ctermfg=Green
hi LogLevelDebug cterm=italic ctermfg=DarkGreen
hi LogLevelTrace cterm=italic ctermfg=DarkGray

hi LogDate cterm=bold ctermfg=DarkGray
hi LogTime ctermfg=Blue
hi LogTimeMs cterm=italic ctermfg=DarkBlue
hi LogMsPID ctermfg=DarkGray
hi LogPID ctermfg=Brown

hi LogFunctionName cterm=italic ctermfg=DarkCyan

hi LogSuffix ctermfg=DarkGray
hi LogFileName ctermfg=DarkMagenta
hi LogLineNumber cterm=italic ctermfg=DarkMagenta
