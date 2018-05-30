if exists("b:current_syntax")
    finish
endif

" Crashdump labels

syntax keyword hanatraceLabel
            \ Rundirectory Process start Exception SectionTimeout KillTimeout
            \ Version Build host time Platform Compiler Maketype Branch Git hash mergetime Weekstone
            \ Symbol SFrame Params Regs Source Module
            \ processor vendor_id cpu family model name stepping microcode MHz cache
            \ size physical id siblings core cores apicid initial fpu fpu_exception
            \ cpuid level wp flags bogomips clflush cache_alignment address sizes
            \ power management
            \ Max file data stack resident set processes locked locks pending memory
            \ signals msgqueue nice priority realtime timeout files open bytes us space
            \ seconds
            \ user schema version content language breakpoint
highlight hanatraceLabel ctermfg=yellow


" Values

syntax keyword hanatraceBool yes unlimited
syntax match hanatraceInt /\v<((0x)?[a-f0-9]+|\d+)>/
highlight link hanatraceBool hanatraceConst
highlight link hanatraceInt hanatraceConst
highlight hanatraceConst ctermfg=gray

" Permissions

syntax match hanatracePerm /\v(r|-)(w|-)(x|-)(s|p)/
highlight hanatracePerm ctermfg=green


" Locations
syntax match hanatraceSource /\v[A-Za-z0-9_]+\.<(cpp|cc|hpp|h)>/
syntax match hanatraceObject /\v\/?<([/a-zA-Z0-9_\-.+]+.so(.\d+){0,3}|hdb\a+)>/
syntax match hanatraceLine /\v(\(\d+\)|:\d+( |\n))/
highlight hanatraceSource ctermfg=darkmagenta
highlight hanatraceObject ctermfg=magenta
highlight hanatraceLine ctermfg=lightmagenta

" Calls
syntax match hanatraceFuncall /\v(<[A-Za-z_0-9<>]+>(\<.*\>)?::)*(\~)?<[A-Za-z0-9_]+>(\(.*\))?( const)?( )?\+( )?0x[a-f0-9]+/
highlight hanatraceFuncall ctermfg=lightblue


" Contexts
syntax match hanatraceContext =\v\[\d+\]\{(-1|\d+)\}\[(-1|\d+)\/(-1|\d+)\]=
highlight hanatraceContext ctermfg=green

" Timestamps
syntax match hanatraceDate /\v(\d{4}\-\d{2}\-\d{2} )?\d{2}\:\d{2}:\d{2}(.\d{6,7})?/
highlight hanatraceDate ctermfg=blue

" Error levels
syntax keyword hanatraceFatal   f
syntax keyword hanatraceError   e
syntax keyword hanatraceWarning w
syntax keyword hanatraceInfo    i
syntax keyword hanatraceDebug   d

highlight hanatraceFatal   ctermfg=white ctermbg=darkred
highlight hanatraceError   ctermfg=white ctermbg=darkred
highlight hanatraceWarning ctermfg=white ctermbg=red
highlight hanatraceInfo    ctermfg=black ctermbg=lightred
highlight hanatraceDebug   ctermfg=black ctermbg=yellow

" Crashdump sections

syntax keyword hanatraceSection
            \ BUILD SYSTEMINFO CRASH_SHORTINFO MODULES CRASH_EMERGENCYSTACK
            \ CRASH_EXTINFO CRASH_CONTEXT CRASH_STACK CRASH_REGISTERS
            \ STACK_SHORT CPUINFO MEMMAP LIMITS MOUNTINFO SCHEDINFO
            \ PROCSTAT STACK_FULL EXCEPTIONS STATISTICS XSENGINE
            \ JAVASCRIPT EXECUTOR INDEXMANAGER CRYPTO MDC SAVEPOINT_SHAREDLOCK_OWNERS
            \ PRE_RESTART_SWVERSION RESOURCE_CONTAINER OS_MEMORY IMPLICIT_MEMORY_BOOKING
            \ IPMM_MEMORY SYMBOL_CACHE REGISTERED_STACK_OBJECTS DISASSEMBLY
            \ REGISTER_OBJECTS THREADS INDEXMANAGER_STATE MEMORY_ACCOUNTING
            \ DDLCONTEXTSTORE ENCRYPTION DATABASE_HISTORY SERVICE_THREAD_SAMPLES
            \ PROCESS_INFO MEMORY_OOM
            \ OK " section end
highlight hanatraceSection ctermfg=magenta

syntax match hanatraceSectionHeader /\v]  \zs.*\ze/
highlight hanatraceSectionHeader ctermfg=lightmagenta

syntax match hanatraceSubSection /-----------------------------------------/
syntax match hanatraceSubSection /=========================================/
syntax match hanatraceSubSectionHeader /---->.*<----/
highlight hanatraceSubSection ctermfg=blue
highlight hanatraceSubSectionHeader ctermfg=lightblue

" MDS & EPM
highlight hanatraceComponent ctermfg=cyan

syntax keyword hanatraceKw
    \ Authorization CalcEngine expr Executor Basis Memory LJIT FileIO HistoryManager
    \ PersistenceManag PhysicalPageAcce
    \ assign ContainerDirecto Async_Rep Logger LogReplay tz Metadata EmbeddedAPI
    \ StatementRetry ImportExport cs_ddl RowStorePageAcce DTestController
    \ partitioning tu_trigger Statistics RS_TableManager im_task_plan
    \ task_framework REPOSITORY REPO_REST
    \ Cancel GroupMulticast Savepoint
    \ ServiceHandler CacheMgr InA LandscapeReorg Licensing
    \ DaemonClient SessionRemoteReq attributes Thread CalcEngineGC indexserver

highlight link hanatraceKw hanatraceComponent

syntax match hanatraceTrace /\v<Trace?\a* /
highlight link hanatraceTrace hanatraceComponent

syntax match hanatraceSql /\v<(Sql|SQL)(Opt)?(_)?\a* /
highlight link hanatraceSql hanatraceComponent

syntax match hanatraceService /\v<Service(_)?\a* /
highlight link hanatraceService hanatraceComponent

syntax match hanatraceTrexNet /\v<TrexNet\a* /
highlight link hanatraceTrexNet hanatraceComponent

syntax match hanatraceStats /\v<STATS(_)?\a* /
highlight link hanatraceStats hanatraceComponent

syntax match hanatraceCe /\v<ce\a* /
highlight link hanatraceCe hanatraceComponent

syntax match hanatraceEpm /\v<epm\a* /
highlight link hanatraceEpm hanatraceComponent

syntax match hanatraceMds /\v<mds(_)?\a* /
highlight link hanatraceMds hanatraceComponent

let b:current_syntax = "hanatrace"
set nowrap
