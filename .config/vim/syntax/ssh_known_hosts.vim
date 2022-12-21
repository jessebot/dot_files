" Vim syntax file
" Language:    ssh_known_hosts
" Maintainer:  YOSHIOKA Takuma <tashioka.256@gmail.com>
" Last Change: 2017 Jun 02
" Remark:      OpenSSH known_hosts syntax.

if exists("b:current_syntax")
    finish
endif

syn case ignore


syn region SshKnownHostsLine start=/^/ end=/$/ contains=SshKnownHostsLineComment,SshKnownHostsMarkers,SshKnownHostsHostnames

syn match SshKnownHostsHostnames excludenl nextgroup=SshKnownHostsKeytype skipwhite '[^ ]\+ ' contained contains=SshKnownHostsHostname
syn match SshKnownHostsMarkers excludenl nextgroup=SshKnownHostsHostnames skipwhite '^@[^ ]\+' contained

syn match SshKnownHostsKeytype excludenl nextgroup=SshKnownHostsBase64EncodedKey skipwhite '[^ ]\+ ' contained
syn match SshKnownHostsBase64EncodedKey excludenl nextgroup=SshKnownHostsBodyComment skipwhite '[a-zA-Z0-9+/]\+=*' contained
syn match SshKnownHostsBodyComment excludenl '.*' contained

" Single hostname.
syn match SshKnownHostsHostname excludenl '[^, ]\+' contained contains=SshKnownHostsHostnameNegativePattern,SshKnownHostsHostnamePattern

" hostname / ipv4 / [hostname] / [ipv4] / [ipv6] / [hostname]:port / [ipv4]:port / [ipv6]:port
syn match SshKnownHostsHostnamePattern excludenl /[^!][^, ]*/ contained transparent
            \ contains=SshKnownHostsHostnameBracket,SshKnownHostsHostnameSimpleHostname,SshKnownHostsHostnameSimpleIpv4Addr,SshKnownHostsHostnameHashedHostname
" !pattern
syn match SshKnownHostsHostnameNegativePattern excludenl /!/ contained nextgroup=SshKnownHostsHostnamePattern

" [hostname] / [ipv4] / [ipv6]
syn match SshKnownHostsHostnameBracket excludenl /\[[^][, ]\+\]/ contained nextgroup=SshKnownHostsHostnamePort
            \ contains=SshKnownHostsHostnameBracketHostname,SshKnownHostsHostnameBracketIpAddr
" :port
syn match SshKnownHostsHostnamePort excludenl /\(:\d\+\)\?/ contained
" [hostname]
syn match SshKnownHostsHostnameBracketHostname excludenl /\[[^][, :]\+\]/ms=s+1,me=e-1 contained
" [ipv4] / [ipv6]
syn match SshKnownHostsHostnameBracketIpAddr excludenl /\[\([0-9*?]\+\(\.[0-9*?]\+\)\{3}\|[0-9a-fA-F*?]*\(:[0-9a-fA-F*?]*\)\{,7}\)\]/ms=s+1,me=e-1 contained nextgroup=SshKnownHostsHostnamePort
" hostname
syn match SshKnownHostsHostnameSimpleHostname excludenl /[^][, :]\+/ contained
" ipv4
syn match SshKnownHostsHostnameSimpleIpv4Addr excludenl /\([0-9*?]\+\.\)\{3}[0-9*?]\+/ contained
" |fmt|hashed_base64_hostname|
syn match SshKnownHostsHostnameHashedHostname /|[^|]*|[a-zA-Z0-9+/]\+=*|/ contained

syn region SshKnownHostsLineComment oneline start=/^#/ end=/$/ contained containedin=SshKnownHostsLine


hi def link SshKnownHostsLineComment Comment
hi def link SshKnownHostsMarkers Keyword
hi def link SshKnownHostsKeytype Special
hi def link SshKnownHostsBase64EncodedKey String
hi def link SshKnownHostsBodyComment Comment

hi def link SshKnownHostsHostnames Delimiter
hi def link SshKnownHostsHostnameNegativePattern Exception
hi def link SshKnownHostsHostnameBracket Label
hi def link SshKnownHostsHostnamePort Number
hi def link SshKnownHostsHostnameSimpleHostname Title
hi def link SshKnownHostsHostnameBracketHostname Title
hi def link SshKnownHostsHostnameSimpleIpv4Addr Constant
hi def link SshKnownHostsHostnameBracketIpAddr Constant
hi def link SshKnownHostsHostnameHashedHostname Identifier

let b:current_syntax = "ssh_known_hosts"
