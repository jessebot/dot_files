" Vim syntax file
" Language:	Python

" :shrug:
syn keyword pythonSelf self cls

" Operators - https://docs.python.org/3/reference/lexical_analysis.html#operators
syn match pythonOperator display	'[=*+\-%/<>|&~^]'
syn match pythonOperator display	'\*\*\|//\|<<\|>>'
syn match pythonOperator display	'[=!><]='
syn match pythonOperator display	'@\|:='

" conditional operators
syn match pythonExtraOperator "\%([~!^&|/%+-]\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\.\.\.\|\.\.\|::\)"
syn keyword pythonExtraOperator not is


" Delimiters - https://docs.python.org/3/reference/lexical_analysis.html#delimiters
syn match pythonDelimiter display	'[().,:[\]{};]'
syn match pythonDelimiter display	'->'

" Doc strings and comments are the same colors :)
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
hi link pythonDocstring    Comment

" strings
syn region pythonString     start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString     start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell

" Unicode raw strings
syn region pythonUniRawString	start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString	start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString	start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniRawString	start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonUniRawEscape		"\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
syn match  pythonUniRawEscapeError	"\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained

syn match pythonStrFormatting	"%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormatting	"%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormat	"{\([a-zA-Z_][a-zA-Z0-9_]*\|\d\+\)\(\.[a-zA-Z_][a-zA-Z0-9_]*\|\[\(\d\+\|[^!:\}]\+\)\]\)*\(![rs]\)\=\(:\({\([a-zA-Z_][a-zA-Z0-9_]*\|\d\+\)}\|\([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*\(\.\d\+\)\=[bcdeEfFgGnoxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" numbers: int or float
syn match   pythonNumber    "\<\d\+[lLjJ]\=\>" display

" built-ins and lambda
syn keyword pythonLambdaExpr lambda
syn keyword pythonBuiltinObj Ellipsis None NotImplemented
syn keyword pythonBuiltinObj __debug__ __doc__ __file__ __name__ __package__
syn keyword pythonBuiltinType type object
syn keyword pythonBuiltinType str basestring unicode buffer bytearray bytes chr unichr
syn keyword pythonBuiltinType dict int long float complex set frozenset list tuple
syn keyword pythonBuiltinType file super vars zip

" python function definition (parameters)
syn match       pythonFunction          "\%(\%(def\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars
syn region      pythonVars              start="(" skip=+\(".*"\|'.*'\)+ end=")" contained contains=pythonParameters transparent keepend
syn keyword     pythonStatement         def nextgroup=pythonFunction skipwhite
syn match       pythonParam             "[^,]*" contained contains=pythonOperator,pythonExtraOperator,pythonLambdaExpr,pythonRepeat,pythonConditional,
                                                                  \pythonBuiltinObj,pythonBuiltinType,pythonBuiltinFunc,pythonConstant,
                                                                  \pythonString,pythonNumber,pythonBrackets,pythonSelf,pythonComment,pythonCall
                                                                  \skipwhite
syn match       pythonParameters        "[^,]*" contained contains=pythonParam skipwhite
syn match       pythonBrackets          "{[(|)]}" contained skipwhite

syn match   pythonDecorator	"@" display nextgroup=pythonDottedName skipwhite
syn match   pythonDottedName "[a-zA-Z_][a-zA-Z0-9_]*\(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
syn match   pythonDot        "\." display containedin=pythonDottedName

" boolean
syn keyword pythonBoolean     True False
