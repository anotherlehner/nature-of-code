Core Syntax & Control Flow
if cond case when unless do while begin begin* lambda case-lambda apply eval quote quasiquote unquote unquote-splicing quote-promise ignore try raise raise-continuable with-exception-handler guard guard-aux

Variables, Scope & Environment
define define-values define-global set! unset! unbind let let* letrec letrec* let-values let*-values let-env let-env-values env new global self lips globalize bound? environment-bound? current-environment null-environment scheme-report-environment interaction-environment **interaction-environment** **interaction-environment-defaults** **internal-env** _this_env Y

Pairs & Lists
cons car cdr caar cadr cdar cddr caaar caadr cadar cddar cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr cddaar cddadr cdddar cddddr caaaaar caaaadr caaadar caaaddr caadaar caadadr caaddar caadddr cadaaar cadaadr cadadar cadaddr caddaadr caddaar caddadr cadddar caddddr cdaaaadr cdaaadr cdaadar cdaaddr cdadaar cdadadr cdaddar cdadddr cddaaadr cddaadr cddadar cddaddr cdddaar cdddadr cddddar cdddddr empty? null? pair? list? list make-list list* length append append! reverse nth nth-pair %nth-pair list-tail list-ref list-copy list-set! list-match? flatten pluck shuffle %common-tail

Higher-Order & Functional Helpers
map %map1 for-each fold reduce filter fold-right fold-left tree-map pair-map find %some? some %every every identity compose pipe curry flip always once complement unfold single matcher -->

Macros & Metaprogramming
define-macro defmacro? define-syntax syntax-rules let-syntax letrec-syntax define-symbol-macro define-syntax-parameter syntax-parameterize syntax-error macroexpand macroexpand-1 free-identifier=? gensym gensym? gensym-literal define-formatter-rule

Continuations & Delays (Async/Promises)
call/cc call-with-current-continuation dynamic-wind *winders* %do-wind parameterize make-parameter delay force delay-force make-promise promise? await promisify timer wait

Numbers & Arithmetic
+ - * / % ** 1+ 1- ++ -- = == < > <= >= min max abs sqrt expt square gcd lcm even? odd? positive? negative? zero? quotient remainder modulo remainder__ quotient&remainder floor ceiling truncate round floor/ floor-quotient floor-remainder truncate/ truncate-quotient truncate-remainder exact-integer-sqrt log exp sin cos tan asin acos atan degree->radians radians->degree exact? inexact? exact inexact exact->inexact inexact->exact number? real? integer? complex? rational? exact-integer? number->string string->number numerator denominator imag-part real-part make-polar make-rectangular angle magnitude nan? infinite? finite? NaN random pseudo-random-seed %number-type _maths *zero-number-chars* digit-value

Bitwise Operations
|\|| |&| |~| ^ >> << not

Strings & Characters
string make-string string? string-length string-ref string-set! string-copy string-copy! string-fill! substring concat join string-join split string-split replace match search string-append string-map string-for-each string-upcase string-downcase string-foldcase string=? string<? string>? string<=? string>=? string-ci=? string-ci<? string-ci>? string-ci<=? string-ci>=? %string-cmp %string-ci-cmp %string-vector-cmp %string-ci-vector-cmp char? char->integer integer->char char-upcase char-downcase char-foldcase char-whitespace? char-numeric? char-alphabetic? char-upper-case? char-lower-case? char=? char<? char>? char<=? char>=? char-ci=? char-ci<? char-ci>? char-ci<=? char-ci>=? %char-cmp %char-ci-cmp %define-chr-re %char-vector-cmp %char-ci-vector-cmp escape-regex regex? regex %foldcase-string

Symbols, Keys & Types
symbol? quoted-symbol? symbol->string string->symbol symbol-append symbol=? native-symbol? boolean? boolean=? true false type typecheck typecheck-number typecheck-args numbers? instanceof instance? prototype? macro? continuation? function? procedure? key? key->string eq? eqv? equal? %same-functions %same

Vectors, Arrays & Typed Arrays
vector make-vector vector? vector-length vector-ref vector-set! vector-copy vector-copy! vector-fill! vector-map vector-for-each vector-append vector-literal vector->list list->vector string->vector vector->string array? array->list list->array tree->array typed-array? %make-vector %range-function

Typed Vectors & Bytevectors:

    u8: u8vector u8vector? make-u8vector u8vector-length u8vector-ref u8vector-set! u8vector->list list->u8vector vector->u8vector %u8vector-in-range?

    s8: s8vector s8vector? make-s8vector s8vector-length s8vector-ref s8vector-set! s8vector->list list->s8vector vector->s8vector %s8vector-in-range?

    u16: u16vector u16vector? make-u16vector u16vector-length u16vector-ref u16vector-set! u16vector->list list->u16vector vector->u16vector %u16vector-in-range?

    s16: s16vector s16vector? make-s16vector s16vector-length s16vector-ref s16vector-set! s16vector->list list->s16vector vector->s16vector %s16vector-in-range?

    u32: u32vector u32vector? make-u32vector u32vector-length u32vector-ref u32vector-set! u32vector->list list->u32vector vector->u32vector %u32vector-in-range?

    s32: s32vector s32vector? make-s32vector s32vector-length s32vector-ref s32vector-set! s32vector->list list->s32vector vector->s32vector %s32vector-in-range?

    f32: f32vector f32vector? make-f32vector f32vector-length f32vector-ref f32vector-set! f32vector->list list->f32vector vector->f32vector %f32vector-in-range?

    f64: f64vector f64vector? make-f64vector f64vector-length f64vector-ref f64vector-set! f64vector->list list->f64vector vector->f64vector %f64vector-in-range?

    Bytevectors: bytevector bytevector? make-bytevector bytevector-length bytevector-u8-ref bytevector-u8-set! bytevector-append bytevector-copy bytevector-copy! string->utf8 utf8->string

Objects & Data Structures
object object? plain-object? set-object! clone get |.| alist->object object->alist pair-map key? key->string freeze-prop! freeze-list! %object-expander %object-literal %as.data %hidden-props memq memv member %mem/search assoc assq assv %assoc/accessor %assoc/search qsort sort

Iterators & Generators
iterator? do-iterator iterator->array generator %make-generator async-generator make-coroutine-generator

OOP / Class System
class define-class constructor %class-lambda %class-method-name define-record-type

Input, Output & Ports
display display-error print pprint pretty-format format newline write write-char write-string write-shared write-simple read read-char peek-char read-line read-all read-string read-u8 peek-u8 read-bytevector read-bytevector! write-u8 write-bytevector u8-ready? char-ready? eof eof-object eof-object? port? input-port? output-port? binary-port? textual-port? input-port-open? output-port-open? open-input-file open-output-file open-binary-input-file open-binary-output-file open-input-string open-output-string open-input-bytevector open-output-bytevector get-output-string get-output-bytevector close-port close-input-port close-output-port flush-output flush-output-port with-input-from-file with-output-to-file with-input-from-port with-input-from-string call-with-port call-with-input-file call-with-output-file call-with-values values values-ref current-input-port current-output-port current-error-port %define-binary-input-lambda %define-binary-output-lambda %read-interpolated %string-interpolation

System, File System, Network & Environment
command-line current-directory set-current-directory! delete-file file-exists? get-environment-variable get-environment-variables current-second current-jiffy jiffies-per-second %%start-jiffy performance browser? indexed-db? worker? http-get response->content response->buffer response->text buffer->u8vector __dirname __filename require require.resolve %read-file %read-binary-file %read-text-file %fs-promisify-proc exit get-resource

Debugging, Errors & Utilities
help __help inspect stack-trace trace error error-object? error-object-message error-object-irritants is-debug set-debug! debugger set-repr! unset-repr! repr set-special! unset-special! set-global! set-hash-syntax! apropos %doc dir tree features include cond-expand define-library define-library/export new-library import %import-name %export %Library native.number value n-ary unary binary sxml pragma->sxml sxml-unquote sxml-unquote-mapper %sxml %internal %set-internal %any-null? %not-implemented %make-env