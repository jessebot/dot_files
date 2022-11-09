" Vim syntax file
" Language:	Python
"

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

"-------------------------------- "strings" -------------------------------
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
syn keyword pythonConstant	NotImplemented Ellipsis __debug__
" built-in functions
syn keyword pythonBuiltin	abs all any bin bool chr classmethod
syn keyword pythonBuiltin	compile complex delattr dict dir divmod
syn keyword pythonBuiltin	enumerate eval filter float format
syn keyword pythonBuiltin	frozenset getattr globals hasattr hash
syn keyword pythonBuiltin	help hex id input int isinstance
syn keyword pythonBuiltin	issubclass iter len list locals map max
syn keyword pythonBuiltin	min next object oct open ord pow print
syn keyword pythonBuiltin	property range repr reversed round set
syn keyword pythonBuiltin	setattr slice sorted staticmethod str
syn keyword pythonBuiltin	sum super tuple type vars zip __import__
syn keyword pythonBuiltin	sum super tuple type vars zip __file__
" Python 3.0 only
syn keyword pythonBuiltin	ascii bytearray bytes exec memoryview

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
syn keyword pythonBoolean True False
