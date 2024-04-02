;;! target = "s390x"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; wasm[0]::function[0]:
;;       stmg    %r6, %r15, 0x30(%r15)
;;       lgr     %r1, %r15
;;       aghi    %r15, -0xa0
;;       stg     %r1, 0(%r15)
;;       lgr     %r11, %r2
;;       llgfr   %r3, %r4
;;       llilf   %r2, 0xffff0004
;;       algfr   %r2, %r4
;;       jgnle   0x28
;;       lgr     %r6, %r11
;;       lg      %r11, 0x58(%r6)
;;       lghi    %r4, 0
;;       ag      %r3, 0x50(%r6)
;;       llilh   %r12, 0xffff
;;       agr     %r3, %r12
;;       clgr    %r2, %r11
;;       locgrh  %r3, %r4
;;       strv    %r5, 0(%r3)
;;       lmg     %r6, %r15, 0xd0(%r15)
;;       br      %r14
;;
;; wasm[0]::function[1]:
;;       stmg    %r6, %r15, 0x30(%r15)
;;       lgr     %r1, %r15
;;       aghi    %r15, -0xa0
;;       stg     %r1, 0(%r15)
;;       lgr     %r5, %r2
;;       llgfr   %r3, %r4
;;       llilf   %r2, 0xffff0004
;;       algfr   %r2, %r4
;;       jgnle   0x88
;;       lgr     %r6, %r5
;;       lg      %r5, 0x58(%r6)
;;       lghi    %r4, 0
;;       ag      %r3, 0x50(%r6)
;;       llilh   %r11, 0xffff
;;       agr     %r3, %r11
;;       clgr    %r2, %r5
;;       locgrh  %r3, %r4
;;       lrv     %r2, 0(%r3)
;;       lmg     %r6, %r15, 0xd0(%r15)
;;       br      %r14