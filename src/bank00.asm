;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank00", ROM0[$0000]

add_hl_a:
    push BC                                            ;; 00:0000 $c5
    ld   B, $00                                        ;; 00:0001 $06 $00
    ld   C, A                                          ;; 00:0003 $4f
    add  HL, BC                                        ;; 00:0004 $09
    pop  BC                                            ;; 00:0005 $c1
    ret                                                ;; 00:0006 $c9
    db   $00                                           ;; 00:0007 ?

call_00_0008:
    ld   A, [wC6E3]                                    ;; 00:0008 $fa $e3 $c6
    and  A, A                                          ;; 00:000b $a7
    ret                                                ;; 00:000c $c9
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 00:000d ????????
    db   $00, $00, $00                                 ;; 00:0015 ???

;@shortcall
rst_00_0018:
    jp   jp_00_378a                                    ;; 00:0018 $c3 $8a $37
    db   $00, $00, $00, $00, $00                       ;; 00:001b ?????

pushActiveBankSafe:
    di                                                 ;; 00:0020 $f3
    call pushActiveBank                                ;; 00:0021 $cd $e1 $38
    reti                                               ;; 00:0024 $d9
    db   $00, $00, $00                                 ;; 00:0025 ???

popActiveBankSafe:
    di                                                 ;; 00:0028 $f3
    call popActiveBank                                 ;; 00:0029 $cd $fc $38
    reti                                               ;; 00:002c $d9
    db   $00, $00, $00                                 ;; 00:002d ???

rst_00_0030:
    jp   jp_00_38d4                                    ;; 00:0030 $c3 $d4 $38

SECTION "isrVBlank", ROM0[$0040]

isrVBlank:
    jp   wC0B9                                         ;; 00:0040 $c3 $b9 $c0

SECTION "isrLCDC", ROM0[$0048]

isrLCDC:
    jp   wC0BC                                         ;; 00:0048 $c3 $bc $c0

call_00_004b:
    ld   HL, call_00_3c03                              ;; 00:004b $21 $03 $3c
    call call_00_00b4                                  ;; 00:004e $cd $b4 $00
    ld   HL, call_00_3c0b                              ;; 00:0051 $21 $0b $3c
    call call_00_00c7                                  ;; 00:0054 $cd $c7 $00
    ld   HL, call_00_3c14                              ;; 00:0057 $21 $14 $3c
    call call_00_00c7                                  ;; 00:005a $cd $c7 $00
    ld   HL, call_00_3c1d                              ;; 00:005d $21 $1d $3c
    call call_00_00b4                                  ;; 00:0060 $cd $b4 $00
    ld   HL, call_00_3c25                              ;; 00:0063 $21 $25 $3c
    call call_00_00c7                                  ;; 00:0066 $cd $c7 $00
    ld   HL, call_00_3c2e                              ;; 00:0069 $21 $2e $3c
    call call_00_00b4                                  ;; 00:006c $cd $b4 $00
    ld   HL, call_00_3c36                              ;; 00:006f $21 $36 $3c
    call call_00_00c7                                  ;; 00:0072 $cd $c7 $00
    ld   HL, call_00_3c3f                              ;; 00:0075 $21 $3f $3c
    call call_00_00c7                                  ;; 00:0078 $cd $c7 $00
    ld   HL, call_00_3c48                              ;; 00:007b $21 $48 $3c
    call call_00_00b4                                  ;; 00:007e $cd $b4 $00
    ld   HL, call_00_3c50                              ;; 00:0081 $21 $50 $3c
    call call_00_00b4                                  ;; 00:0084 $cd $b4 $00
    ld   HL, call_00_3c58                              ;; 00:0087 $21 $58 $3c
    call call_00_00b4                                  ;; 00:008a $cd $b4 $00
    ld   HL, call_00_3c60                              ;; 00:008d $21 $60 $3c
    call call_00_00b4                                  ;; 00:0090 $cd $b4 $00
    ld   HL, call_00_3c68                              ;; 00:0093 $21 $68 $3c
    call call_00_00b4                                  ;; 00:0096 $cd $b4 $00
    ld   HL, call_00_3c70                              ;; 00:0099 $21 $70 $3c
    call call_00_00b4                                  ;; 00:009c $cd $b4 $00
    ld   HL, call_00_3c78                              ;; 00:009f $21 $78 $3c
    call call_00_00b4                                  ;; 00:00a2 $cd $b4 $00
    ld   HL, call_00_3c80                              ;; 00:00a5 $21 $80 $3c
    call call_00_00b4                                  ;; 00:00a8 $cd $b4 $00
    ld   HL, call_00_3c88                              ;; 00:00ab $21 $88 $3c
    call call_00_00b4                                  ;; 00:00ae $cd $b4 $00
    ld   HL, call_00_3c80                              ;; 00:00b1 $21 $80 $3c

call_00_00b4:
    call call_00_00e8                                  ;; 00:00b4 $cd $e8 $00
    ld   B, [HL]                                       ;; 00:00b7 $46
    ldh  A, [hFF96]                                    ;; 00:00b8 $f0 $96
    inc  A                                             ;; 00:00ba $3c
    ldh  [hFF96], A                                    ;; 00:00bb $e0 $96
    call wCA53                                         ;; 00:00bd $cd $53 $ca
    ld   [HL], B                                       ;; 00:00c0 $70
    ldh  A, [hFF96]                                    ;; 00:00c1 $f0 $96
    dec  A                                             ;; 00:00c3 $3d
    ldh  [hFF96], A                                    ;; 00:00c4 $e0 $96
    ret                                                ;; 00:00c6 $c9

call_00_00c7:
    call call_00_00e8                                  ;; 00:00c7 $cd $e8 $00
    ld   A, [HL+]                                      ;; 00:00ca $2a
    ld   [wC800], A                                    ;; 00:00cb $ea $00 $c8
    ld   A, [HL]                                       ;; 00:00ce $7e
    ld   [wC801], A                                    ;; 00:00cf $ea $01 $c8
    ldh  A, [hFF96]                                    ;; 00:00d2 $f0 $96
    inc  A                                             ;; 00:00d4 $3c
    ldh  [hFF96], A                                    ;; 00:00d5 $e0 $96
    call wCA53                                         ;; 00:00d7 $cd $53 $ca
    ld   A, [wC800]                                    ;; 00:00da $fa $00 $c8
    ld   [HL+], A                                      ;; 00:00dd $22
    ld   A, [wC801]                                    ;; 00:00de $fa $01 $c8
    ld   [HL], A                                       ;; 00:00e1 $77
    ldh  A, [hFF96]                                    ;; 00:00e2 $f0 $96
    dec  A                                             ;; 00:00e4 $3d
    ldh  [hFF96], A                                    ;; 00:00e5 $e0 $96
    ret                                                ;; 00:00e7 $c9

call_00_00e8:
    ld   A, $c3                                        ;; 00:00e8 $3e $c3
    ld   [wCA53], A                                    ;; 00:00ea $ea $53 $ca
    ld   A, L                                          ;; 00:00ed $7d
    ld   [wCA54], A                                    ;; 00:00ee $ea $54 $ca
    ld   A, H                                          ;; 00:00f1 $7c
    ld   [wCA55], A                                    ;; 00:00f2 $ea $55 $ca
    jp   wCA53                                         ;; 00:00f5 $c3 $53 $ca

SECTION "entry", ROM0[$0100]

entry:
    nop                                                ;; 00:0100 $00
    jp   jp_00_0200                                    ;; 00:0101 $c3 $00 $02
    ds   $30                                           ;; 00:0104
    db   "SAGA3", $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ;; 00:0134
    db   CART_COMPATIBLE_DMG                           ;; 00:0143
    db   $00, $00                                      ;; 00:0144 ??
    db   CART_INDICATOR_GB                             ;; 00:0146
    db   CART_ROM_MBC1_RAM_BAT, CART_ROM_256KB, CART_SRAM_8KB ;; 00:0147
    db   CART_DEST_NON_JAPANESE, $c3, $00              ;; 00:014a $01 $c3 $00
    ds   3                                             ;; 00:014d

SECTION "bank00_0150", ROM0[$0150]

call_00_0150:
    call call_00_1d9e                                  ;; 00:0150 $cd $9e $1d
    call call_00_0427                                  ;; 00:0153 $cd $27 $04
    jp   call_00_1dfd                                  ;; 00:0156 $c3 $fd $1d

call_00_0159:
    ld   BC, $10                                       ;; 00:0159 $01 $10 $00
    jp   call_00_20ff                                  ;; 00:015c $c3 $ff $20

call_00_015f:
    ld   BC, $20                                       ;; 00:015f $01 $20 $00
    jp   call_00_20ff                                  ;; 00:0162 $c3 $ff $20

call_00_0165:
    ld   A, [wC6F0]                                    ;; 00:0165 $fa $f0 $c6
    and  A, $03                                        ;; 00:0168 $e6 $03
    ld   HL, $17d                                      ;; 00:016a $21 $7d $01
    rst  add_hl_a                                      ;; 00:016d $c7
    ld   A, [HL]                                       ;; 00:016e $7e
    ld   [wC6F4], A                                    ;; 00:016f $ea $f4 $c6
    ret                                                ;; 00:0172 $c9

call_00_0173:
    push HL                                            ;; 00:0173 $e5
    and  A, $03                                        ;; 00:0174 $e6 $03
    ld   HL, $17d                                      ;; 00:0176 $21 $7d $01
    rst  add_hl_a                                      ;; 00:0179 $c7
    ld   A, [HL]                                       ;; 00:017a $7e
    pop  HL                                            ;; 00:017b $e1
    ret                                                ;; 00:017c $c9
    db   $01, $02, $04, $08                            ;; 00:017d ...?

call_00_0181:
    call call_00_0187                                  ;; 00:0181 $cd $87 $01
    jp   jp_01_4ee1                                    ;; 00:0184 $c3 $e1 $4e

call_00_0187:
    call call_01_4dff                                  ;; 00:0187 $cd $ff $4d
    ld   A, [DE]                                       ;; 00:018a $1a
    ld   [wC806], A                                    ;; 00:018b $ea $06 $c8
    and  A, $3f                                        ;; 00:018e $e6 $3f
    ld   E, A                                          ;; 00:0190 $5f
    ld   D, $00                                        ;; 00:0191 $16 $00
    ld   A, $06                                        ;; 00:0193 $3e $06
    rst  pushActiveBankSafe                            ;; 00:0195 $e7
    call call_00_0e13                                  ;; 00:0196 $cd $13 $0e
    add  HL, DE                                        ;; 00:0199 $19
    ld   A, [HL]                                       ;; 00:019a $7e
    ld   [wC805], A                                    ;; 00:019b $ea $05 $c8
    rst  popActiveBankSafe                             ;; 00:019e $ef
    ret                                                ;; 00:019f $c9

call_00_01a0:
    ld   A, [wCA14]                                    ;; 00:01a0 $fa $14 $ca
    and  A, A                                          ;; 00:01a3 $a7
    ret  NZ                                            ;; 00:01a4 $c0
    ld   A, $01                                        ;; 00:01a5 $3e $01
    ld   [wCA14], A                                    ;; 00:01a7 $ea $14 $ca
    ld   A, [wCD39]                                    ;; 00:01aa $fa $39 $cd
    ld   C, A                                          ;; 00:01ad $4f
    ld   A, $01                                        ;; 00:01ae $3e $01
    ld   [wCD39], A                                    ;; 00:01b0 $ea $39 $cd
    ldh  A, [hFF96]                                    ;; 00:01b3 $f0 $96
    ld   B, A                                          ;; 00:01b5 $47
    push BC                                            ;; 00:01b6 $c5
    ld   A, $01                                        ;; 00:01b7 $3e $01
    rst  pushActiveBankSafe                            ;; 00:01b9 $e7
    call call_00_3a24                                  ;; 00:01ba $cd $24 $3a
    xor  A, A                                          ;; 00:01bd $af
    ldh  [hFF97], A                                    ;; 00:01be $e0 $97
    call call_01_53a9                                  ;; 00:01c0 $cd $a9 $53
    call call_01_543c                                  ;; 00:01c3 $cd $3c $54
    call call_01_541e                                  ;; 00:01c6 $cd $1e $54
    rst  popActiveBankSafe                             ;; 00:01c9 $ef
    pop  BC                                            ;; 00:01ca $c1
    ld   A, C                                          ;; 00:01cb $79
    ld   [wCD39], A                                    ;; 00:01cc $ea $39 $cd
    ld   A, B                                          ;; 00:01cf $78
    ldh  [hFF96], A                                    ;; 00:01d0 $e0 $96
    xor  A, A                                          ;; 00:01d2 $af
    ld   [wCA14], A                                    ;; 00:01d3 $ea $14 $ca
    ret                                                ;; 00:01d6 $c9

call_00_01d7:
    xor  A, A                                          ;; 00:01d7 $af
    ldh  [hFF96], A                                    ;; 00:01d8 $e0 $96
    ret                                                ;; 00:01da $c9

call_00_01db:
    ld   HL, wC20F                                     ;; 00:01db $21 $0f $c2
.jr_00_01de:
    ld   A, [HL-]                                      ;; 00:01de $3a
    and  A, A                                          ;; 00:01df $a7
    jr   NZ, .jr_00_01de                               ;; 00:01e0 $20 $fc
    inc  L                                             ;; 00:01e2 $2c
    ld   A, L                                          ;; 00:01e3 $7d
    ldh  [hFF96], A                                    ;; 00:01e4 $e0 $96
    ret                                                ;; 00:01e6 $c9

call_00_01e7:
    ld   A, $0b                                        ;; 00:01e7 $3e $0b
    rst  pushActiveBankSafe                            ;; 00:01e9 $e7
    call call_00_04f7                                  ;; 00:01ea $cd $f7 $04
    call call_00_04b1                                  ;; 00:01ed $cd $b1 $04
    ld   A, [wC6EE]                                    ;; 00:01f0 $fa $ee $c6
    call $5272                                         ;; 00:01f3 $cd $72 $52
    jp   call_00_3a6b                                  ;; 00:01f6 $c3 $6b $3a
    db   $00, $00, $00, $00, $00, $00, $00             ;; 00:01f9 ???????

jp_00_0200:
    di                                                 ;; 00:0200 $f3
    call call_00_374a                                  ;; 00:0201 $cd $4a $37
    ld   SP, $cfff                                     ;; 00:0204 $31 $ff $cf
    call call_00_3727                                  ;; 00:0207 $cd $27 $37
    call call_00_39b8                                  ;; 00:020a $cd $b8 $39
    ld   A, $01                                        ;; 00:020d $3e $01
    call call_00_3910                                  ;; 00:020f $cd $10 $39
    xor  A, A                                          ;; 00:0212 $af
    ldh  [rBGP], A                                     ;; 00:0213 $e0 $47
    ldh  [rOBP0], A                                    ;; 00:0215 $e0 $48
    ldh  [rOBP1], A                                    ;; 00:0217 $e0 $49
    ld   HL, $9800                                     ;; 00:0219 $21 $00 $98
    ld   BC, $800                                      ;; 00:021c $01 $00 $08
    ld   A, $ff                                        ;; 00:021f $3e $ff
    call call_00_3921                                  ;; 00:0221 $cd $21 $39
    ld   HL, $11a2                                     ;; 00:0224 $21 $a2 $11
    call call_00_3d46                                  ;; 00:0227 $cd $46 $3d
    ld   HL, $11e3                                     ;; 00:022a $21 $e3 $11
    call call_00_3d5a                                  ;; 00:022d $cd $5a $3d
    xor  A, A                                          ;; 00:0230 $af
    ldh  [rSTAT], A                                    ;; 00:0231 $e0 $41
    ld   A, $01                                        ;; 00:0233 $3e $01
    ldh  [rIE], A                                      ;; 00:0235 $e0 $ff
    ld   A, $c3                                        ;; 00:0237 $3e $c3
    ldh  [rLCDC], A                                    ;; 00:0239 $e0 $40
    ei                                                 ;; 00:023b $fb
    call call_01_7c79                                  ;; 00:023c $cd $79 $7c
    ld   A, $31                                        ;; 00:023f $3e $31
    call call_00_3cb2                                  ;; 00:0241 $cd $b2 $3c
    jr   C, .jr_00_025c                                ;; 00:0244 $38 $16
    call call_00_3a0c                                  ;; 00:0246 $cd $0c $3a
    xor  A, A                                          ;; 00:0249 $af
    ld   BC, $612                                      ;; 00:024a $01 $12 $06
    ld   DE, $101                                      ;; 00:024d $11 $01 $01
    ld   HL, $6015                                     ;; 00:0250 $21 $15 $60
    rst  rst_00_0018                                   ;; 00:0253 $df
    db   $90                                           ;; 00:0254 .
    ld   A, $31                                        ;; 00:0255 $3e $31
    call call_00_3ca0                                  ;; 00:0257 $cd $a0 $3c
    jr   .jr_00_0262                                   ;; 00:025a $18 $06
.jr_00_025c:
    call call_00_027d                                  ;; 00:025c $cd $7d $02
    call call_00_3d38                                  ;; 00:025f $cd $38 $3d
.jr_00_0262:
    xor  A, A                                          ;; 00:0262 $af
    ldh  [rLYC], A                                     ;; 00:0263 $e0 $45
.jr_00_0265:
    xor  A, A                                          ;; 00:0265 $af
    ld   [wCA0E], A                                    ;; 00:0266 $ea $0e $ca
    call call_00_07bb                                  ;; 00:0269 $cd $bb $07
    call call_01_4f24                                  ;; 00:026c $cd $24 $4f
    call call_01_4f66                                  ;; 00:026f $cd $66 $4f
    call call_00_01a0                                  ;; 00:0272 $cd $a0 $01
    call call_00_3a6b                                  ;; 00:0275 $cd $6b $3a
    call call_01_54a0                                  ;; 00:0278 $cd $a0 $54
    jr   .jr_00_0265                                   ;; 00:027b $18 $e8

call_00_027d:
    ld   A, $01                                        ;; 00:027d $3e $01
    ld   [wCA14], A                                    ;; 00:027f $ea $14 $ca
    call call_00_039b                                  ;; 00:0282 $cd $9b $03
    call call_00_3a4b                                  ;; 00:0285 $cd $4b $3a
    xor  A, A                                          ;; 00:0288 $af
    ldh  [hFF8B], A                                    ;; 00:0289 $e0 $8b
    ldh  [hFF8A], A                                    ;; 00:028b $e0 $8a
    ld   [wCA01], A                                    ;; 00:028d $ea $01 $ca
    ld   HL, wC200                                     ;; 00:0290 $21 $00 $c2
    ld   BC, $180                                      ;; 00:0293 $01 $80 $01
    call call_00_3921                                  ;; 00:0296 $cd $21 $39
    ld   A, [wC6E8]                                    ;; 00:0299 $fa $e8 $c6
    cp   A, $0a                                        ;; 00:029c $fe $0a
    ld   A, $0a                                        ;; 00:029e $3e $0a
    call C, call_00_3ca6                               ;; 00:02a0 $dc $a6 $3c
    ld   A, $01                                        ;; 00:02a3 $3e $01
    rst  pushActiveBankSafe                            ;; 00:02a5 $e7
    ld   A, $06                                        ;; 00:02a6 $3e $06
    rst  pushActiveBankSafe                            ;; 00:02a8 $e7
    ld   A, [wC6E8]                                    ;; 00:02a9 $fa $e8 $c6
    ld   HL, $6c58                                     ;; 00:02ac $21 $58 $6c
    call call_00_3741                                  ;; 00:02af $cd $41 $37
    ld   A, [HL]                                       ;; 00:02b2 $7e
    and  A, $7f                                        ;; 00:02b3 $e6 $7f
    ld   [wCA15], A                                    ;; 00:02b5 $ea $15 $ca
    ld   A, [HL+]                                      ;; 00:02b8 $2a
    and  A, $80                                        ;; 00:02b9 $e6 $80
    ld   [wCA6C], A                                    ;; 00:02bb $ea $6c $ca
    ld   A, [HL+]                                      ;; 00:02be $2a
    ld   [wCA1D], A                                    ;; 00:02bf $ea $1d $ca
    ld   A, [HL+]                                      ;; 00:02c2 $2a
    ld   [wCA1E], A                                    ;; 00:02c3 $ea $1e $ca
    ld   A, [HL+]                                      ;; 00:02c6 $2a
    ld   [wCA18], A                                    ;; 00:02c7 $ea $18 $ca
    ld   A, [wCA6E]                                    ;; 00:02ca $fa $6e $ca
    and  A, A                                          ;; 00:02cd $a7
    jr   NZ, .jr_00_02d7                               ;; 00:02ce $20 $07
    ld   A, [wC7CC]                                    ;; 00:02d0 $fa $cc $c7
    ldh  [hCurrentMusic], A                            ;; 00:02d3 $e0 $ba
    jr   .jr_00_02e6                                   ;; 00:02d5 $18 $0f
.jr_00_02d7:
    ld   A, [wCA59]                                    ;; 00:02d7 $fa $59 $ca
    and  A, A                                          ;; 00:02da $a7
    jr   NZ, .jr_00_02e6                               ;; 00:02db $20 $09
    ld   A, [HL]                                       ;; 00:02dd $7e
    and  A, $1f                                        ;; 00:02de $e6 $1f
    cp   A, $1f                                        ;; 00:02e0 $fe $1f
    jr   Z, .jr_00_02e6                                ;; 00:02e2 $28 $02
    ldh  [hCurrentMusic], A                            ;; 00:02e4 $e0 $ba
.jr_00_02e6:
    xor  A, A                                          ;; 00:02e6 $af
    ld   [wCA59], A                                    ;; 00:02e7 $ea $59 $ca
    ld   A, [HL+]                                      ;; 00:02ea $2a
    swap A                                             ;; 00:02eb $cb $37
    srl  A                                             ;; 00:02ed $cb $3f
    and  A, $07                                        ;; 00:02ef $e6 $07
    push HL                                            ;; 00:02f1 $e5
    ld   HL, $119a                                     ;; 00:02f2 $21 $9a $11
    rst  add_hl_a                                      ;; 00:02f5 $c7
    ld   A, [HL]                                       ;; 00:02f6 $7e
    ld   [wCA2B], A                                    ;; 00:02f7 $ea $2b $ca
    pop  HL                                            ;; 00:02fa $e1
    ld   A, [HL]                                       ;; 00:02fb $7e
    ld   [wCA2D], A                                    ;; 00:02fc $ea $2d $ca
    call call_00_0409                                  ;; 00:02ff $cd $09 $04
    rst  popActiveBankSafe                             ;; 00:0302 $ef
    ld   A, $03                                        ;; 00:0303 $3e $03
    rst  pushActiveBankSafe                            ;; 00:0305 $e7
    ld   A, [wCA1D]                                    ;; 00:0306 $fa $1d $ca
    ld   HL, $731c                                     ;; 00:0309 $21 $1c $73
    call call_00_3741                                  ;; 00:030c $cd $41 $37
    ld   A, [HL]                                       ;; 00:030f $7e
    and  A, $0f                                        ;; 00:0310 $e6 $0f
    dec  A                                             ;; 00:0312 $3d
    ld   [wCA05], A                                    ;; 00:0313 $ea $05 $ca
    ld   A, [HL+]                                      ;; 00:0316 $2a
    swap A                                             ;; 00:0317 $cb $37
    and  A, $0f                                        ;; 00:0319 $e6 $0f
    dec  A                                             ;; 00:031b $3d
    ld   [wCA04], A                                    ;; 00:031c $ea $04 $ca
    ld   A, [HL+]                                      ;; 00:031f $2a
    ld   [wCA19], A                                    ;; 00:0320 $ea $19 $ca
    ld   A, [HL+]                                      ;; 00:0323 $2a
    ld   [wCA1A], A                                    ;; 00:0324 $ea $1a $ca
    ld   A, [HL+]                                      ;; 00:0327 $2a
    ld   [wCA1B], A                                    ;; 00:0328 $ea $1b $ca
    ld   A, [HL+]                                      ;; 00:032b $2a
    ld   [wCA1C], A                                    ;; 00:032c $ea $1c $ca
    ld   A, [HL]                                       ;; 00:032f $7e
    ld   [wCA17], A                                    ;; 00:0330 $ea $17 $ca
    ld   A, [wC6E8]                                    ;; 00:0333 $fa $e8 $c6
    cp   A, $01                                        ;; 00:0336 $fe $01
    jr   NZ, .jr_00_0346                               ;; 00:0338 $20 $0c
    ld   A, $ec                                        ;; 00:033a $3e $ec
    call call_00_3cb2                                  ;; 00:033c $cd $b2 $3c
    jr   NC, .jr_00_0346                               ;; 00:033f $30 $05
    ld   A, $11                                        ;; 00:0341 $3e $11
    ld   [wCA17], A                                    ;; 00:0343 $ea $17 $ca
.jr_00_0346:
    rst  popActiveBankSafe                             ;; 00:0346 $ef
    ld   A, [wC6E4]                                    ;; 00:0347 $fa $e4 $c6
    ldh  [hFF92], A                                    ;; 00:034a $e0 $92
    ld   A, [wC6E5]                                    ;; 00:034c $fa $e5 $c6
    ld   HL, wCA04                                     ;; 00:034f $21 $04 $ca
    and  A, [HL]                                       ;; 00:0352 $a6
    ld   [wCA03], A                                    ;; 00:0353 $ea $03 $ca
    ld   A, [wC6E6]                                    ;; 00:0356 $fa $e6 $c6
    ldh  [hFF91], A                                    ;; 00:0359 $e0 $91
    ld   A, [wC6E7]                                    ;; 00:035b $fa $e7 $c6
    ld   HL, wCA05                                     ;; 00:035e $21 $05 $ca
    and  A, [HL]                                       ;; 00:0361 $a6
    ld   [wCA02], A                                    ;; 00:0362 $ea $02 $ca
    call call_00_3d2b                                  ;; 00:0365 $cd $2b $3d
    call call_00_1756                                  ;; 00:0368 $cd $56 $17
    ld   A, $0b                                        ;; 00:036b $3e $0b
    rst  pushActiveBankSafe                            ;; 00:036d $e7
    call call_0b_78f5                                  ;; 00:036e $cd $f5 $78
    rst  popActiveBankSafe                             ;; 00:0371 $ef
    call call_00_0150                                  ;; 00:0372 $cd $50 $01
    ld   A, $06                                        ;; 00:0375 $3e $06
    rst  pushActiveBankSafe                            ;; 00:0377 $e7
    call call_00_054d                                  ;; 00:0378 $cd $4d $05
    rst  popActiveBankSafe                             ;; 00:037b $ef
    xor  A, A                                          ;; 00:037c $af
    ld   [wCA14], A                                    ;; 00:037d $ea $14 $ca
    call call_00_01a0                                  ;; 00:0380 $cd $a0 $01
    call call_00_0e34                                  ;; 00:0383 $cd $34 $0e
    call call_00_3a6b                                  ;; 00:0386 $cd $6b $3a
    call call_00_03a8                                  ;; 00:0389 $cd $a8 $03
    rst  popActiveBankSafe                             ;; 00:038c $ef
    ld   A, $01                                        ;; 00:038d $3e $01
    ld   [wCA6E], A                                    ;; 00:038f $ea $6e $ca
    jp   call_00_3a6b                                  ;; 00:0392 $c3 $6b $3a
    db   $06, $07, $08, $22, $28, $2e                  ;; 00:0395 ??????

call_00_039b:
    ld   A, [wCA6B]                                    ;; 00:039b $fa $6b $ca
    call doJumptable                                   ;; 00:039e $cd $3a $37
;@jumptable amount=3
    dw   call_00_39f3                                  ;; 00:03a1 pP $00
    dw   call_00_03cd                                  ;; 00:03a3 pP $01
    dw   call_00_03a7                                  ;; 00:03a5 ?? $02

call_00_03a7:
    ret                                                ;; 00:03a7 $c9

call_00_03a8:
    ld   A, [wCA6B]                                    ;; 00:03a8 $fa $6b $ca
    call doJumptable                                   ;; 00:03ab $cd $3a $37
;@jumptable amount=3
    dw   call_00_03b4                                  ;; 00:03ae pP $00
    dw   call_00_03e9                                  ;; 00:03b0 pP $01
    dw   call_00_03c5                                  ;; 00:03b2 ?? $02

call_00_03b4:
    ld   A, [wCD3D]                                    ;; 00:03b4 $fa $3d $cd
    push AF                                            ;; 00:03b7 $f5
    ld   A, $ff                                        ;; 00:03b8 $3e $ff
    ld   [wCD3D], A                                    ;; 00:03ba $ea $3d $cd
    call call_00_3a0c                                  ;; 00:03bd $cd $0c $3a
    pop  AF                                            ;; 00:03c0 $f1
    ld   [wCD3D], A                                    ;; 00:03c1 $ea $3d $cd
    ret                                                ;; 00:03c4 $c9

call_00_03c5:
    ld   A, $01                                        ;; 00:03c5 $3e $01
    rst  pushActiveBankSafe                            ;; 00:03c7 $e7
    call $5f9d                                         ;; 00:03c8 $cd $9d $5f
    rst  popActiveBankSafe                             ;; 00:03cb $ef
    ret                                                ;; 00:03cc $c9

call_00_03cd:
    ld   A, $0f                                        ;; 00:03cd $3e $0f
    rst  pushActiveBankSafe                            ;; 00:03cf $e7
    call call_0f_7e18                                  ;; 00:03d0 $cd $18 $7e
    ld   E, $00                                        ;; 00:03d3 $1e $00
    call call_0f_7e86                                  ;; 00:03d5 $cd $86 $7e
    inc  E                                             ;; 00:03d8 $1c
    call call_0f_7e9d                                  ;; 00:03d9 $cd $9d $7e
    inc  E                                             ;; 00:03dc $1c
    call call_0f_7e9d                                  ;; 00:03dd $cd $9d $7e
    inc  E                                             ;; 00:03e0 $1c
    call call_0f_7e9d                                  ;; 00:03e1 $cd $9d $7e
    call call_0f_7e74                                  ;; 00:03e4 $cd $74 $7e
    rst  popActiveBankSafe                             ;; 00:03e7 $ef
    ret                                                ;; 00:03e8 $c9

call_00_03e9:
    ld   A, $0f                                        ;; 00:03e9 $3e $0f
    rst  pushActiveBankSafe                            ;; 00:03eb $e7
    call call_0f_7e18                                  ;; 00:03ec $cd $18 $7e
    xor  A, A                                          ;; 00:03ef $af
    ld   [wCDB1], A                                    ;; 00:03f0 $ea $b1 $cd
    ld   E, $03                                        ;; 00:03f3 $1e $03
    dec  E                                             ;; 00:03f5 $1d
    call call_0f_7e9d                                  ;; 00:03f6 $cd $9d $7e
    dec  E                                             ;; 00:03f9 $1d
    call call_0f_7e9d                                  ;; 00:03fa $cd $9d $7e
    dec  E                                             ;; 00:03fd $1d
    call call_0f_7e9d                                  ;; 00:03fe $cd $9d $7e
    call call_0f_7e8d                                  ;; 00:0401 $cd $8d $7e
    call call_0f_7e74                                  ;; 00:0404 $cd $74 $7e
    rst  popActiveBankSafe                             ;; 00:0407 $ef
    ret                                                ;; 00:0408 $c9

call_00_0409:
    ld   A, $31                                        ;; 00:0409 $3e $31
    call call_00_3cb2                                  ;; 00:040b $cd $b2 $3c
    jr   C, .jr_00_0415                                ;; 00:040e $38 $05
    xor  A, A                                          ;; 00:0410 $af
    ld   [wCA2D], A                                    ;; 00:0411 $ea $2d $ca
    ret                                                ;; 00:0414 $c9
.jr_00_0415:
    ld   A, [wC6E8]                                    ;; 00:0415 $fa $e8 $c6
    cp   A, $01                                        ;; 00:0418 $fe $01
    ret  NZ                                            ;; 00:041a $c0
    ld   A, $ce                                        ;; 00:041b $3e $ce
    call call_00_3cb2                                  ;; 00:041d $cd $b2 $3c
    ret  NC                                            ;; 00:0420 $d0
    ld   A, $43                                        ;; 00:0421 $3e $43
    ld   [wCA2D], A                                    ;; 00:0423 $ea $2d $ca
    ret                                                ;; 00:0426 $c9

call_00_0427:
    ld   A, $07                                        ;; 00:0427 $3e $07
    rst  pushActiveBankSafe                            ;; 00:0429 $e7
    call call_07_7f4f                                  ;; 00:042a $cd $4f $7f
    rst  popActiveBankSafe                             ;; 00:042d $ef
    ld   A, $03                                        ;; 00:042e $3e $03
    rst  pushActiveBankSafe                            ;; 00:0430 $e7
    call call_00_0438                                  ;; 00:0431 $cd $38 $04
    rst  popActiveBankSafe                             ;; 00:0434 $ef
    jp   jp_00_0535                                    ;; 00:0435 $c3 $35 $05

call_00_0438:
    ld   A, $07                                        ;; 00:0438 $3e $07
    rst  pushActiveBankSafe                            ;; 00:043a $e7
    call call_07_7f00                                  ;; 00:043b $cd $00 $7f
    rst  popActiveBankSafe                             ;; 00:043e $ef
    ld   A, [wCA1E]                                    ;; 00:043f $fa $1e $ca
    ld   HL, $751c                                     ;; 00:0442 $21 $1c $75
    call call_00_3741                                  ;; 00:0445 $cd $41 $37
    ld   A, [HL+]                                      ;; 00:0448 $2a
    ld   [wC800], A                                    ;; 00:0449 $ea $00 $c8
    ld   DE, $7f00                                     ;; 00:044c $11 $00 $7f
.jr_00_044f:
    inc  D                                             ;; 00:044f $14
.jr_00_0450:
    ld   A, $88                                        ;; 00:0450 $3e $88
    cp   A, D                                          ;; 00:0452 $ba
    jr   Z, .jr_00_0485                                ;; 00:0453 $28 $30
    ld   A, [wC800]                                    ;; 00:0455 $fa $00 $c8
    sla  A                                             ;; 00:0458 $cb $27
    ld   [wC800], A                                    ;; 00:045a $ea $00 $c8
    jr   NC, .jr_00_044f                               ;; 00:045d $30 $f0
    ld   A, [HL+]                                      ;; 00:045f $2a
    cp   A, $40                                        ;; 00:0460 $fe $40
    jr   NC, .jr_00_046e                               ;; 00:0462 $30 $0a
    push AF                                            ;; 00:0464 $f5
    ld   A, $04                                        ;; 00:0465 $3e $04
    rst  pushActiveBankSafe                            ;; 00:0467 $e7
    pop  AF                                            ;; 00:0468 $f1
    push HL                                            ;; 00:0469 $e5
    ld   H, $40                                        ;; 00:046a $26 $40
    jr   .jr_00_0478                                   ;; 00:046c $18 $0a
.jr_00_046e:
    sub  A, $40                                        ;; 00:046e $d6 $40
    push AF                                            ;; 00:0470 $f5
    ld   A, $03                                        ;; 00:0471 $3e $03
    rst  pushActiveBankSafe                            ;; 00:0473 $e7
    pop  AF                                            ;; 00:0474 $f1
    push HL                                            ;; 00:0475 $e5
    ld   H, $49                                        ;; 00:0476 $26 $49
.jr_00_0478:
    add  A, H                                          ;; 00:0478 $84
    ld   H, A                                          ;; 00:0479 $67
    ld   L, $00                                        ;; 00:047a $2e $00
    ld   BC, $100                                      ;; 00:047c $01 $00 $01
    rst  rst_00_0018                                   ;; 00:047f $df
    db   $01                                           ;; 00:0480 .
    pop  HL                                            ;; 00:0481 $e1
    rst  popActiveBankSafe                             ;; 00:0482 $ef
    jr   .jr_00_0450                                   ;; 00:0483 $18 $cb
.jr_00_0485:
    ld   DE, $8600                                     ;; 00:0485 $11 $00 $86
.jr_00_0488:
    ld   A, [HL+]                                      ;; 00:0488 $2a
    cp   A, $ff                                        ;; 00:0489 $fe $ff
    jr   Z, call_00_04b1                               ;; 00:048b $28 $24
    push HL                                            ;; 00:048d $e5
    push AF                                            ;; 00:048e $f5
    ld   A, $03                                        ;; 00:048f $3e $03
    rst  pushActiveBankSafe                            ;; 00:0491 $e7
    pop  AF                                            ;; 00:0492 $f1
    and  A, $7f                                        ;; 00:0493 $e6 $7f
    ld   L, A                                          ;; 00:0495 $6f
    ld   H, $00                                        ;; 00:0496 $26 $00
    push DE                                            ;; 00:0498 $d5
    ld   DE, $40                                       ;; 00:0499 $11 $40 $00
    call call_00_1c7e                                  ;; 00:049c $cd $7e $1c
    ld   A, E                                          ;; 00:049f $7b
    add  A, $00                                        ;; 00:04a0 $c6 $00
    ld   L, A                                          ;; 00:04a2 $6f
    ld   A, D                                          ;; 00:04a3 $7a
    adc  A, $49                                        ;; 00:04a4 $ce $49
    ld   H, A                                          ;; 00:04a6 $67
    pop  DE                                            ;; 00:04a7 $d1
    ld   BC, $40                                       ;; 00:04a8 $01 $40 $00
    rst  rst_00_0018                                   ;; 00:04ab $df
    db   $01                                           ;; 00:04ac .
    pop  HL                                            ;; 00:04ad $e1
    rst  popActiveBankSafe                             ;; 00:04ae $ef
    jr   .jr_00_0488                                   ;; 00:04af $18 $d7

call_00_04b1:
    ld   A, $04                                        ;; 00:04b1 $3e $04
    rst  pushActiveBankSafe                            ;; 00:04b3 $e7
    call call_00_04c6                                  ;; 00:04b4 $cd $c6 $04
    add  A, $40                                        ;; 00:04b7 $c6 $40
    ld   L, $00                                        ;; 00:04b9 $2e $00
    ld   H, A                                          ;; 00:04bb $67
    ld   DE, $8000                                     ;; 00:04bc $11 $00 $80
    ld   BC, $100                                      ;; 00:04bf $01 $00 $01
    rst  rst_00_0018                                   ;; 00:04c2 $df
    db   $01                                           ;; 00:04c3 .
    rst  popActiveBankSafe                             ;; 00:04c4 $ef
    ret                                                ;; 00:04c5 $c9

call_00_04c6:
    ld   A, $0b                                        ;; 00:04c6 $3e $0b
    rst  pushActiveBankSafe                            ;; 00:04c8 $e7
    ld   A, [wC6F3]                                    ;; 00:04c9 $fa $f3 $c6
    and  A, $c0                                        ;; 00:04cc $e6 $c0
    rlca                                               ;; 00:04ce $07
    rlca                                               ;; 00:04cf $07
    ld   HL, wC500                                     ;; 00:04d0 $21 $00 $c5
    and  A, A                                          ;; 00:04d3 $a7
    jr   Z, .jr_00_04dd                                ;; 00:04d4 $28 $07
    ld   DE, $60                                       ;; 00:04d6 $11 $60 $00
.jr_00_04d9:
    add  HL, DE                                        ;; 00:04d9 $19
    dec  A                                             ;; 00:04da $3d
    jr   NZ, .jr_00_04d9                               ;; 00:04db $20 $fc
.jr_00_04dd:
    ld   DE, $0d                                       ;; 00:04dd $11 $0d $00
    add  HL, DE                                        ;; 00:04e0 $19
    ld   A, [HL]                                       ;; 00:04e1 $7e
    and  A, $07                                        ;; 00:04e2 $e6 $07
    cp   A, $02                                        ;; 00:04e4 $fe $02
    jr   NZ, .jr_00_04f5                               ;; 00:04e6 $20 $0d
    ld   A, [HL]                                       ;; 00:04e8 $7e
    srl  A                                             ;; 00:04e9 $cb $3f
    srl  A                                             ;; 00:04eb $cb $3f
    srl  A                                             ;; 00:04ed $cb $3f
    and  A, $0f                                        ;; 00:04ef $e6 $0f
    add  A, $f0                                        ;; 00:04f1 $c6 $f0
    jr   call_00_04f7                                  ;; 00:04f3 $18 $02
.jr_00_04f5:
    inc  HL                                            ;; 00:04f5 $23
    ld   A, [HL]                                       ;; 00:04f6 $7e

call_00_04f7:
    push AF                                            ;; 00:04f7 $f5
    ld   A, $0a                                        ;; 00:04f8 $3e $0a
    call call_00_3cb2                                  ;; 00:04fa $cd $b2 $3c
    pop  BC                                            ;; 00:04fd $c1
    ld   A, B                                          ;; 00:04fe $78
    jr   NC, .jr_00_050e                               ;; 00:04ff $30 $0d
    ld   A, $8d                                        ;; 00:0501 $3e $8d
    call call_00_3cb2                                  ;; 00:0503 $cd $b2 $3c
    jr   C, .jr_00_050c                                ;; 00:0506 $38 $04
    ld   A, $fa                                        ;; 00:0508 $3e $fa
    jr   .jr_00_050e                                   ;; 00:050a $18 $02
.jr_00_050c:
    ld   A, $fb                                        ;; 00:050c $3e $fb
.jr_00_050e:
    push AF                                            ;; 00:050e $f5
    ld   HL, data_0b_748f                              ;; 00:050f $21 $8f $74
    rst  add_hl_a                                      ;; 00:0512 $c7
    ld   A, [HL]                                       ;; 00:0513 $7e
    and  A, $c0                                        ;; 00:0514 $e6 $c0
    rlca                                               ;; 00:0516 $07
    rlca                                               ;; 00:0517 $07
    push AF                                            ;; 00:0518 $f5
    call call_00_01d7                                  ;; 00:0519 $cd $d7 $01
    call call_00_3c70                                  ;; 00:051c $cd $70 $3c
    pop  AF                                            ;; 00:051f $f1
    ld   [HL], A                                       ;; 00:0520 $77
    ld   B, A                                          ;; 00:0521 $47
    call call_00_3c80                                  ;; 00:0522 $cd $80 $3c
    ld   [HL], B                                       ;; 00:0525 $70
    call call_00_08ad                                  ;; 00:0526 $cd $ad $08
    pop  AF                                            ;; 00:0529 $f1
    ld   HL, data_0b_748f                              ;; 00:052a $21 $8f $74
    rst  add_hl_a                                      ;; 00:052d $c7
    ld   A, [HL]                                       ;; 00:052e $7e
    and  A, $3f                                        ;; 00:052f $e6 $3f
    push AF                                            ;; 00:0531 $f5
    rst  popActiveBankSafe                             ;; 00:0532 $ef
    pop  AF                                            ;; 00:0533 $f1
    ret                                                ;; 00:0534 $c9

jp_00_0535:
    ld   A, $07                                        ;; 00:0535 $3e $07
    rst  pushActiveBankSafe                            ;; 00:0537 $e7
    call call_07_7f5b                                  ;; 00:0538 $cd $5b $7f
    call call_07_7fbc                                  ;; 00:053b $cd $bc $7f
    rst  popActiveBankSafe                             ;; 00:053e $ef
    ld   A, $01                                        ;; 00:053f $3e $01
    rst  pushActiveBankSafe                            ;; 00:0541 $e7
    call call_01_5501                                  ;; 00:0542 $cd $01 $55
    call call_01_6092                                  ;; 00:0545 $cd $92 $60
    call call_01_6082                                  ;; 00:0548 $cd $82 $60
    rst  popActiveBankSafe                             ;; 00:054b $ef
    ret                                                ;; 00:054c $c9

call_00_054d:
    ld   A, $00                                        ;; 00:054d $3e $00
    ldh  [hFF96], A                                    ;; 00:054f $e0 $96
    ld   A, [wCA00]                                    ;; 00:0551 $fa $00 $ca
    and  A, A                                          ;; 00:0554 $a7
    jr   NZ, .jr_00_055c                               ;; 00:0555 $20 $05
    call call_00_3c03                                  ;; 00:0557 $cd $03 $3c
    ld   [HL], $01                                     ;; 00:055a $36 $01
.jr_00_055c:
    xor  A, A                                          ;; 00:055c $af
    ld   [wCA00], A                                    ;; 00:055d $ea $00 $ca
    call call_00_3c98                                  ;; 00:0560 $cd $98 $3c
    ld   [HL], $01                                     ;; 00:0563 $36 $01
    call call_00_3c0b                                  ;; 00:0565 $cd $0b $3c
    ld   [HL], $50                                     ;; 00:0568 $36 $50
    call call_00_3c14                                  ;; 00:056a $cd $14 $3c
    ld   [HL], $50                                     ;; 00:056d $36 $50
    call call_00_3c48                                  ;; 00:056f $cd $48 $3c
    ld   [HL], $80                                     ;; 00:0572 $36 $80
    call call_00_3c0b                                  ;; 00:0574 $cd $0b $3c
    ld   E, L                                          ;; 00:0577 $5d
    ld   D, H                                          ;; 00:0578 $54
    call call_00_3c36                                  ;; 00:0579 $cd $36 $3c
    ld   A, [wC6E4]                                    ;; 00:057c $fa $e4 $c6
    ld   C, A                                          ;; 00:057f $4f
    ld   A, [wC6E5]                                    ;; 00:0580 $fa $e5 $c6
    ld   B, A                                          ;; 00:0583 $47
    ld   A, [DE]                                       ;; 00:0584 $1a
    add  A, C                                          ;; 00:0585 $81
    ld   [HL+], A                                      ;; 00:0586 $22
    ld   [DE], A                                       ;; 00:0587 $12
    inc  DE                                            ;; 00:0588 $13
    ld   A, [DE]                                       ;; 00:0589 $1a
    adc  A, B                                          ;; 00:058a $88
    push HL                                            ;; 00:058b $e5
    ld   HL, wCA04                                     ;; 00:058c $21 $04 $ca
    and  A, [HL]                                       ;; 00:058f $a6
    pop  HL                                            ;; 00:0590 $e1
    ld   [HL+], A                                      ;; 00:0591 $22
    ld   [DE], A                                       ;; 00:0592 $12
    call call_00_3c14                                  ;; 00:0593 $cd $14 $3c
    ld   E, L                                          ;; 00:0596 $5d
    ld   D, H                                          ;; 00:0597 $54
    call call_00_3c3f                                  ;; 00:0598 $cd $3f $3c
    ld   A, [wC6E6]                                    ;; 00:059b $fa $e6 $c6
    ld   C, A                                          ;; 00:059e $4f
    ld   A, [wC6E7]                                    ;; 00:059f $fa $e7 $c6
    ld   B, A                                          ;; 00:05a2 $47
    ld   A, [DE]                                       ;; 00:05a3 $1a
    add  A, C                                          ;; 00:05a4 $81
    ld   [HL+], A                                      ;; 00:05a5 $22
    ld   [DE], A                                       ;; 00:05a6 $12
    inc  DE                                            ;; 00:05a7 $13
    ld   A, [DE]                                       ;; 00:05a8 $1a
    adc  A, B                                          ;; 00:05a9 $88
    push HL                                            ;; 00:05aa $e5
    ld   HL, wCA05                                     ;; 00:05ab $21 $05 $ca
    and  A, [HL]                                       ;; 00:05ae $a6
    pop  HL                                            ;; 00:05af $e1
    ld   [HL+], A                                      ;; 00:05b0 $22
    ld   [DE], A                                       ;; 00:05b1 $12
    ld   A, $01                                        ;; 00:05b2 $3e $01
    rst  pushActiveBankSafe                            ;; 00:05b4 $e7
    call call_01_4000                                  ;; 00:05b5 $cd $00 $40
    call call_00_08ad                                  ;; 00:05b8 $cd $ad $08
    call call_01_4f2b                                  ;; 00:05bb $cd $2b $4f
    rst  popActiveBankSafe                             ;; 00:05be $ef

call_00_05bf:
    ld   A, $02                                        ;; 00:05bf $3e $02
    ldh  [hFF96], A                                    ;; 00:05c1 $e0 $96
    ld   A, [wC6E8]                                    ;; 00:05c3 $fa $e8 $c6
    ld   HL, $6c58                                     ;; 00:05c6 $21 $58 $6c
    call call_00_3741                                  ;; 00:05c9 $cd $41 $37
    ld   A, $06                                        ;; 00:05cc $3e $06
    rst  add_hl_a                                      ;; 00:05ce $c7
.jp_00_05cf:
    ld   A, [HL+]                                      ;; 00:05cf $2a
    cp   A, $ff                                        ;; 00:05d0 $fe $ff
    jp   Z, .jp_00_06be                                ;; 00:05d2 $ca $be $06
    ld   D, H                                          ;; 00:05d5 $54
    ld   E, L                                          ;; 00:05d6 $5d
    and  A, A                                          ;; 00:05d7 $a7
    jr   Z, .jr_00_05e6                                ;; 00:05d8 $28 $0c
    call call_00_3cb2                                  ;; 00:05da $cd $b2 $3c
    jr   C, .jr_00_05e6                                ;; 00:05dd $38 $07
    call call_00_3c03                                  ;; 00:05df $cd $03 $3c
    xor  A, A                                          ;; 00:05e2 $af
    ld   [HL], A                                       ;; 00:05e3 $77
    jr   .jr_00_05eb                                   ;; 00:05e4 $18 $05
.jr_00_05e6:
    call call_00_3c03                                  ;; 00:05e6 $cd $03 $3c
    ld   A, [DE]                                       ;; 00:05e9 $1a
    ld   [HL], A                                       ;; 00:05ea $77
.jr_00_05eb:
    call call_00_3c98                                  ;; 00:05eb $cd $98 $3c
    ld   A, [DE]                                       ;; 00:05ee $1a
    ld   [HL], A                                       ;; 00:05ef $77
    inc  DE                                            ;; 00:05f0 $13
    call call_00_3c48                                  ;; 00:05f1 $cd $48 $3c
    xor  A, A                                          ;; 00:05f4 $af
    ld   [HL], A                                       ;; 00:05f5 $77
    inc  DE                                            ;; 00:05f6 $13
    ld   A, [DE]                                       ;; 00:05f7 $1a
    sla  A                                             ;; 00:05f8 $cb $27
    rr   [HL]                                          ;; 00:05fa $cb $1e
    ld   A, [DE]                                       ;; 00:05fc $1a
    swap A                                             ;; 00:05fd $cb $37
    and  A, $04                                        ;; 00:05ff $e6 $04
    ld   B, A                                          ;; 00:0601 $47
    dec  DE                                            ;; 00:0602 $1b
    ld   A, [DE]                                       ;; 00:0603 $1a
    sla  A                                             ;; 00:0604 $cb $27
    rr   [HL]                                          ;; 00:0606 $cb $1e
    call call_00_3c90                                  ;; 00:0608 $cd $90 $3c
    ld   A, [DE]                                       ;; 00:060b $1a
    and  A, $40                                        ;; 00:060c $e6 $40
    or   A, B                                          ;; 00:060e $b0
    ld   [HL], A                                       ;; 00:060f $77
    call call_00_3c0b                                  ;; 00:0610 $cd $0b $3c
    ld   A, [DE]                                       ;; 00:0613 $1a
    and  A, $0f                                        ;; 00:0614 $e6 $0f
    swap A                                             ;; 00:0616 $cb $37
    ld   [HL+], A                                      ;; 00:0618 $22
    ld   C, A                                          ;; 00:0619 $4f
    ld   A, [DE]                                       ;; 00:061a $1a
    and  A, $30                                        ;; 00:061b $e6 $30
    swap A                                             ;; 00:061d $cb $37
    ld   [HL], A                                       ;; 00:061f $77
    ld   B, A                                          ;; 00:0620 $47
    call call_00_3c36                                  ;; 00:0621 $cd $36 $3c
    ld   A, C                                          ;; 00:0624 $79
    ld   [HL+], A                                      ;; 00:0625 $22
    ld   A, B                                          ;; 00:0626 $78
    ld   [HL], A                                       ;; 00:0627 $77
    inc  DE                                            ;; 00:0628 $13
    call call_00_3c14                                  ;; 00:0629 $cd $14 $3c
    ld   A, [DE]                                       ;; 00:062c $1a
    and  A, $0f                                        ;; 00:062d $e6 $0f
    swap A                                             ;; 00:062f $cb $37
    ld   [HL+], A                                      ;; 00:0631 $22
    ld   C, A                                          ;; 00:0632 $4f
    ld   A, [DE]                                       ;; 00:0633 $1a
    and  A, $30                                        ;; 00:0634 $e6 $30
    swap A                                             ;; 00:0636 $cb $37
    ld   [HL], A                                       ;; 00:0638 $77
    ld   B, A                                          ;; 00:0639 $47
    call call_00_3c3f                                  ;; 00:063a $cd $3f $3c
    ld   A, C                                          ;; 00:063d $79
    ld   [HL+], A                                      ;; 00:063e $22
    ld   A, B                                          ;; 00:063f $78
    ld   [HL], A                                       ;; 00:0640 $77
    inc  DE                                            ;; 00:0641 $13
    call call_00_3c70                                  ;; 00:0642 $cd $70 $3c
    ld   A, [DE]                                       ;; 00:0645 $1a
    and  A, $1f                                        ;; 00:0646 $e6 $1f
    ld   [HL], A                                       ;; 00:0648 $77
    ld   B, A                                          ;; 00:0649 $47
    call call_00_3c80                                  ;; 00:064a $cd $80 $3c
    ld   [HL], B                                       ;; 00:064d $70
    call call_00_3c88                                  ;; 00:064e $cd $88 $3c
    ld   A, [DE]                                       ;; 00:0651 $1a
    and  A, $c0                                        ;; 00:0652 $e6 $c0
    rlca                                               ;; 00:0654 $07
    rlca                                               ;; 00:0655 $07
    ld   [HL], A                                       ;; 00:0656 $77
    inc  DE                                            ;; 00:0657 $13
    call call_00_3c2e                                  ;; 00:0658 $cd $2e $3c
    ld   A, [DE]                                       ;; 00:065b $1a
    and  A, $c0                                        ;; 00:065c $e6 $c0
    jr   NZ, .jr_00_0667                               ;; 00:065e $20 $07
    ld   A, [DE]                                       ;; 00:0660 $1a
    and  A, $07                                        ;; 00:0661 $e6 $07
    swap A                                             ;; 00:0663 $cb $37
    jr   .jr_00_066c                                   ;; 00:0665 $18 $05
.jr_00_0667:
    ld   A, [DE]                                       ;; 00:0667 $1a
    and  A, $3f                                        ;; 00:0668 $e6 $3f
    add  A, $60                                        ;; 00:066a $c6 $60
.jr_00_066c:
    ld   [HL], A                                       ;; 00:066c $77
    ld   B, A                                          ;; 00:066d $47
    call call_00_3c78                                  ;; 00:066e $cd $78 $3c
    ld   [HL], B                                       ;; 00:0671 $70
    call call_00_0715                                  ;; 00:0672 $cd $15 $07
    push DE                                            ;; 00:0675 $d5
    ld   A, $01                                        ;; 00:0676 $3e $01
    rst  pushActiveBankSafe                            ;; 00:0678 $e7
    call call_00_3c48                                  ;; 00:0679 $cd $48 $3c
    ld   A, [HL]                                       ;; 00:067c $7e
    call call_01_5272                                  ;; 00:067d $cd $72 $52
    call call_00_3c50                                  ;; 00:0680 $cd $50 $3c
    ld   A, $47                                        ;; 00:0683 $3e $47
    ld   [HL], A                                       ;; 00:0685 $77
    call call_00_3c68                                  ;; 00:0686 $cd $68 $3c
    ld   A, $01                                        ;; 00:0689 $3e $01
    ld   [HL], A                                       ;; 00:068b $77
    call call_01_4700                                  ;; 00:068c $cd $00 $47
    call call_00_0ffd                                  ;; 00:068f $cd $fd $0f
    call call_01_463d                                  ;; 00:0692 $cd $3d $46
    call call_01_4e48                                  ;; 00:0695 $cd $48 $4e
    call call_00_3c58                                  ;; 00:0698 $cd $58 $3c
    ld   A, [HL]                                       ;; 00:069b $7e
    cp   A, $08                                        ;; 00:069c $fe $08
    jr   NZ, .jr_00_06ae                               ;; 00:069e $20 $0e
    call call_00_3c50                                  ;; 00:06a0 $cd $50 $3c
    ld   A, [HL]                                       ;; 00:06a3 $7e
    and  A, $fd                                        ;; 00:06a4 $e6 $fd
    ld   [HL], A                                       ;; 00:06a6 $77
    call call_00_3c1d                                  ;; 00:06a7 $cd $1d $3c
    ld   A, [HL]                                       ;; 00:06aa $7e
    or   A, $06                                        ;; 00:06ab $f6 $06
    ld   [HL], A                                       ;; 00:06ad $77
.jr_00_06ae:
    rst  popActiveBankSafe                             ;; 00:06ae $ef
    pop  DE                                            ;; 00:06af $d1
    call call_00_0730                                  ;; 00:06b0 $cd $30 $07
    inc  DE                                            ;; 00:06b3 $13
    ld   L, E                                          ;; 00:06b4 $6b
    ld   H, D                                          ;; 00:06b5 $62
    ldh  A, [hFF96]                                    ;; 00:06b6 $f0 $96
    inc  A                                             ;; 00:06b8 $3c
    ldh  [hFF96], A                                    ;; 00:06b9 $e0 $96
    jp   .jp_00_05cf                                   ;; 00:06bb $c3 $cf $05
.jp_00_06be:
    ld   A, [wC6E3]                                    ;; 00:06be $fa $e3 $c6
    cp   A, $03                                        ;; 00:06c1 $fe $03
    ret  NC                                            ;; 00:06c3 $d0
    ld   A, $82                                        ;; 00:06c4 $3e $82
    call call_00_3cb2                                  ;; 00:06c6 $cd $b2 $3c
    ret  NC                                            ;; 00:06c9 $d0
    ld   HL, wC6E8                                     ;; 00:06ca $21 $e8 $c6
    ld   A, [wC6ED]                                    ;; 00:06cd $fa $ed $c6
    cp   A, [HL]                                       ;; 00:06d0 $be
    ret  NZ                                            ;; 00:06d1 $c0
    call call_00_01db                                  ;; 00:06d2 $cd $db $01
    call call_00_1552                                  ;; 00:06d5 $cd $52 $15
    call call_00_3c36                                  ;; 00:06d8 $cd $36 $3c
    ld   A, [wC6E9]                                    ;; 00:06db $fa $e9 $c6
    add  A, $50                                        ;; 00:06de $c6 $50
    ld   [HL+], A                                      ;; 00:06e0 $22
    ld   D, H                                          ;; 00:06e1 $54
    ld   E, L                                          ;; 00:06e2 $5d
    ld   HL, wCA04                                     ;; 00:06e3 $21 $04 $ca
    ld   A, [wC6EA]                                    ;; 00:06e6 $fa $ea $c6
    adc  A, $00                                        ;; 00:06e9 $ce $00
    and  A, [HL]                                       ;; 00:06eb $a6
    ld   [DE], A                                       ;; 00:06ec $12
    dec  E                                             ;; 00:06ed $1d
    call call_00_3c0b                                  ;; 00:06ee $cd $0b $3c
    ld   A, [DE]                                       ;; 00:06f1 $1a
    ld   [HL+], A                                      ;; 00:06f2 $22
    inc  DE                                            ;; 00:06f3 $13
    ld   A, [DE]                                       ;; 00:06f4 $1a
    ld   [HL], A                                       ;; 00:06f5 $77
    call call_00_3c3f                                  ;; 00:06f6 $cd $3f $3c
    ld   A, [wC6EB]                                    ;; 00:06f9 $fa $eb $c6
    add  A, $50                                        ;; 00:06fc $c6 $50
    ld   [HL+], A                                      ;; 00:06fe $22
    ld   D, H                                          ;; 00:06ff $54
    ld   E, L                                          ;; 00:0700 $5d
    ld   HL, wCA05                                     ;; 00:0701 $21 $05 $ca
    ld   A, [wC6EC]                                    ;; 00:0704 $fa $ec $c6
    adc  A, $00                                        ;; 00:0707 $ce $00
    and  A, [HL]                                       ;; 00:0709 $a6
    ld   [DE], A                                       ;; 00:070a $12
    dec  E                                             ;; 00:070b $1d
    call call_00_3c14                                  ;; 00:070c $cd $14 $3c
    ld   A, [DE]                                       ;; 00:070f $1a
    ld   [HL+], A                                      ;; 00:0710 $22
    inc  DE                                            ;; 00:0711 $13
    ld   A, [DE]                                       ;; 00:0712 $1a
    ld   [HL], A                                       ;; 00:0713 $77
    ret                                                ;; 00:0714 $c9

call_00_0715:
    call call_00_3c88                                  ;; 00:0715 $cd $88 $3c
    ld   A, [HL]                                       ;; 00:0718 $7e
    cp   A, $01                                        ;; 00:0719 $fe $01
    ret  NZ                                            ;; 00:071b $c0
    call call_00_3c03                                  ;; 00:071c $cd $03 $3c
    ld   A, [HL]                                       ;; 00:071f $7e
    dec  A                                             ;; 00:0720 $3d
    call call_00_3cca                                  ;; 00:0721 $cd $ca $3c
    ret  NC                                            ;; 00:0724 $d0
    call call_00_3c2e                                  ;; 00:0725 $cd $2e $3c
    ld   [HL], $78                                     ;; 00:0728 $36 $78
    call call_00_3c78                                  ;; 00:072a $cd $78 $3c
    ld   [HL], $78                                     ;; 00:072d $36 $78
    ret                                                ;; 00:072f $c9

call_00_0730:
    call call_00_3c88                                  ;; 00:0730 $cd $88 $3c
    ld   A, [HL]                                       ;; 00:0733 $7e
    cp   A, $02                                        ;; 00:0734 $fe $02
    jr   Z, .jr_00_0741                                ;; 00:0736 $28 $09
    and  A, A                                          ;; 00:0738 $a7
    ret  NZ                                            ;; 00:0739 $c0
    call call_00_3c98                                  ;; 00:073a $cd $98 $3c
    ld   A, [HL]                                       ;; 00:073d $7e
    cp   A, $df                                        ;; 00:073e $fe $df
    ret  C                                             ;; 00:0740 $d8
.jr_00_0741:
    push DE                                            ;; 00:0741 $d5
    call call_00_004b                                  ;; 00:0742 $cd $4b $00
    call call_00_3c48                                  ;; 00:0745 $cd $48 $3c
    ld   B, [HL]                                       ;; 00:0748 $46
    ldh  A, [hFF96]                                    ;; 00:0749 $f0 $96
    inc  A                                             ;; 00:074b $3c
    ldh  [hFF96], A                                    ;; 00:074c $e0 $96
    ld   A, B                                          ;; 00:074e $78
    and  A, A                                          ;; 00:074f $a7
    jr   Z, .jr_00_076d                                ;; 00:0750 $28 $1b
    cp   A, $40                                        ;; 00:0752 $fe $40
    jr   Z, .jr_00_0780                                ;; 00:0754 $28 $2a
    cp   A, $80                                        ;; 00:0756 $fe $80
    jr   Z, .jr_00_0793                                ;; 00:0758 $28 $39
    call call_00_3c14                                  ;; 00:075a $cd $14 $3c
    ld   A, [HL]                                       ;; 00:075d $7e
    sub  A, $10                                        ;; 00:075e $d6 $10
    ld   [HL+], A                                      ;; 00:0760 $22
    ld   D, H                                          ;; 00:0761 $54
    ld   E, L                                          ;; 00:0762 $5d
    ld   A, [DE]                                       ;; 00:0763 $1a
    sbc  A, $00                                        ;; 00:0764 $de $00
    ld   HL, wCA05                                     ;; 00:0766 $21 $05 $ca
    and  A, [HL]                                       ;; 00:0769 $a6
    ld   [DE], A                                       ;; 00:076a $12
    jr   .jr_00_07aa                                   ;; 00:076b $18 $3d
.jr_00_076d:
    call call_00_3c0b                                  ;; 00:076d $cd $0b $3c
    ld   A, [HL]                                       ;; 00:0770 $7e
    sub  A, $10                                        ;; 00:0771 $d6 $10
    ld   [HL+], A                                      ;; 00:0773 $22
    ld   D, H                                          ;; 00:0774 $54
    ld   E, L                                          ;; 00:0775 $5d
    ld   A, [DE]                                       ;; 00:0776 $1a
    sbc  A, $00                                        ;; 00:0777 $de $00
    ld   HL, wCA04                                     ;; 00:0779 $21 $04 $ca
    and  A, [HL]                                       ;; 00:077c $a6
    ld   [DE], A                                       ;; 00:077d $12
    jr   .jr_00_07a4                                   ;; 00:077e $18 $24
.jr_00_0780:
    call call_00_3c14                                  ;; 00:0780 $cd $14 $3c
    ld   A, [HL]                                       ;; 00:0783 $7e
    add  A, $10                                        ;; 00:0784 $c6 $10
    ld   [HL+], A                                      ;; 00:0786 $22
    ld   D, H                                          ;; 00:0787 $54
    ld   E, L                                          ;; 00:0788 $5d
    ld   A, [DE]                                       ;; 00:0789 $1a
    adc  A, $00                                        ;; 00:078a $ce $00
    ld   HL, wCA05                                     ;; 00:078c $21 $05 $ca
    and  A, [HL]                                       ;; 00:078f $a6
    ld   [DE], A                                       ;; 00:0790 $12
    jr   .jr_00_07aa                                   ;; 00:0791 $18 $17
.jr_00_0793:
    call call_00_3c0b                                  ;; 00:0793 $cd $0b $3c
    ld   A, [HL]                                       ;; 00:0796 $7e
    add  A, $10                                        ;; 00:0797 $c6 $10
    ld   [HL+], A                                      ;; 00:0799 $22
    ld   D, H                                          ;; 00:079a $54
    ld   E, L                                          ;; 00:079b $5d
    ld   A, [DE]                                       ;; 00:079c $1a
    adc  A, $00                                        ;; 00:079d $ce $00
    ld   HL, wCA04                                     ;; 00:079f $21 $04 $ca
    and  A, [HL]                                       ;; 00:07a2 $a6
    ld   [DE], A                                       ;; 00:07a3 $12
.jr_00_07a4:
    dec  DE                                            ;; 00:07a4 $1b
    call call_00_3c36                                  ;; 00:07a5 $cd $36 $3c
    jr   .jr_00_07ae                                   ;; 00:07a8 $18 $04
.jr_00_07aa:
    dec  DE                                            ;; 00:07aa $1b
    call call_00_3c3f                                  ;; 00:07ab $cd $3f $3c
.jr_00_07ae:
    ld   A, [DE]                                       ;; 00:07ae $1a
    ld   [HL+], A                                      ;; 00:07af $22
    inc  DE                                            ;; 00:07b0 $13
    ld   A, [DE]                                       ;; 00:07b1 $1a
    ld   [HL], A                                       ;; 00:07b2 $77
    call call_00_3c25                                  ;; 00:07b3 $cd $25 $3c
    inc  HL                                            ;; 00:07b6 $23
    xor  A, A                                          ;; 00:07b7 $af
    ld   [HL], A                                       ;; 00:07b8 $77
    pop  DE                                            ;; 00:07b9 $d1
    ret                                                ;; 00:07ba $c9

call_00_07bb:
    call call_01_43f9                                  ;; 00:07bb $cd $f9 $43
    ret  NZ                                            ;; 00:07be $c0
    call call_01_5cd3                                  ;; 00:07bf $cd $d3 $5c
    ld   A, [wCA2C]                                    ;; 00:07c2 $fa $2c $ca
    and  A, A                                          ;; 00:07c5 $a7
    call NZ, call_00_10c2                              ;; 00:07c6 $c4 $c2 $10
    xor  A, A                                          ;; 00:07c9 $af
    ldh  [hFF96], A                                    ;; 00:07ca $e0 $96
    call call_00_08f3                                  ;; 00:07cc $cd $f3 $08
    call call_01_6374                                  ;; 00:07cf $cd $74 $63
    call call_01_4bf6                                  ;; 00:07d2 $cd $f6 $4b
    ret  Z                                             ;; 00:07d5 $c8
    ld   A, [wC6E3]                                    ;; 00:07d6 $fa $e3 $c6
    and  A, A                                          ;; 00:07d9 $a7
    jr   NZ, .jr_00_0800                               ;; 00:07da $20 $24
    xor  A, A                                          ;; 00:07dc $af
    ldh  [hFF96], A                                    ;; 00:07dd $e0 $96
    call call_00_3c78                                  ;; 00:07df $cd $78 $3c
    ld   B, [HL]                                       ;; 00:07e2 $46
    call call_00_3c2e                                  ;; 00:07e3 $cd $2e $3c
    ld   [HL], B                                       ;; 00:07e6 $70
    call call_00_3c80                                  ;; 00:07e7 $cd $80 $3c
    ld   B, [HL]                                       ;; 00:07ea $46
    call call_00_3c70                                  ;; 00:07eb $cd $70 $3c
    ld   [HL], B                                       ;; 00:07ee $70
    ld   A, [wC6EE]                                    ;; 00:07ef $fa $ee $c6
    call call_01_5272                                  ;; 00:07f2 $cd $72 $52
    ld   A, [wC6E8]                                    ;; 00:07f5 $fa $e8 $c6
    cp   A, $0c                                        ;; 00:07f8 $fe $0c
    jr   C, .jr_00_0800                                ;; 00:07fa $38 $04
    call call_01_47b2                                  ;; 00:07fc $cd $b2 $47
    ret  NZ                                            ;; 00:07ff $c0
.jr_00_0800:
    xor  A, A                                          ;; 00:0800 $af
    ld   [wCA13], A                                    ;; 00:0801 $ea $13 $ca
    ldh  A, [hFF8A]                                    ;; 00:0804 $f0 $8a
    and  A, $80                                        ;; 00:0806 $e6 $80
    jr   Z, .jr_00_080f                                ;; 00:0808 $28 $05
    call call_01_441d                                  ;; 00:080a $cd $1d $44
    jr   .jr_00_082c                                   ;; 00:080d $18 $1d
.jr_00_080f:
    ldh  A, [hFF8A]                                    ;; 00:080f $f0 $8a
    and  A, $40                                        ;; 00:0811 $e6 $40
    jr   Z, .jr_00_081a                                ;; 00:0813 $28 $05
    call call_01_44a8                                  ;; 00:0815 $cd $a8 $44
    jr   .jr_00_082c                                   ;; 00:0818 $18 $12
.jr_00_081a:
    ldh  A, [hFF8A]                                    ;; 00:081a $f0 $8a
    and  A, $10                                        ;; 00:081c $e6 $10
    jr   Z, .jr_00_0823                                ;; 00:081e $28 $03
    call call_01_4520                                  ;; 00:0820 $cd $20 $45
.jr_00_0823:
    ldh  A, [hFF8A]                                    ;; 00:0823 $f0 $8a
    and  A, $20                                        ;; 00:0825 $e6 $20
    jr   Z, .jr_00_082c                                ;; 00:0827 $28 $03
    call NZ, call_01_4599                              ;; 00:0829 $c4 $99 $45
.jr_00_082c:
    ldh  A, [hFF8B]                                    ;; 00:082c $f0 $8b
    and  A, $01                                        ;; 00:082e $e6 $01
    call NZ, call_00_0945                              ;; 00:0830 $c4 $45 $09
    ldh  A, [hFF8B]                                    ;; 00:0833 $f0 $8b
    and  A, $02                                        ;; 00:0835 $e6 $02
    call NZ, call_00_0861                              ;; 00:0837 $c4 $61 $08
    ld   A, [wC6EF]                                    ;; 00:083a $fa $ef $c6
    and  A, A                                          ;; 00:083d $a7
    jr   NZ, .jr_00_0860                               ;; 00:083e $20 $20
    ldh  A, [hFF8B]                                    ;; 00:0840 $f0 $8b
    and  A, $08                                        ;; 00:0842 $e6 $08
    jr   Z, .jr_00_084b                                ;; 00:0844 $28 $05
    rst  rst_00_0018                                   ;; 00:0846 $df
    db   $4c                                           ;; 00:0847 .
    call call_01_402d                                  ;; 00:0848 $cd $2d $40
.jr_00_084b:
    ldh  A, [hFF8B]                                    ;; 00:084b $f0 $8b
    and  A, $04                                        ;; 00:084d $e6 $04
    jr   Z, .jr_00_0860                                ;; 00:084f $28 $0f
    ld   A, $3c                                        ;; 00:0851 $3e $3c
    ldh  [hSFX], A                                     ;; 00:0853 $e0 $bc
    ld   A, [wC6F3]                                    ;; 00:0855 $fa $f3 $c6
    rlca                                               ;; 00:0858 $07
    rlca                                               ;; 00:0859 $07
    ld   [wC6F3], A                                    ;; 00:085a $ea $f3 $c6
    call call_00_01e7                                  ;; 00:085d $cd $e7 $01
.jr_00_0860:
    ret                                                ;; 00:0860 $c9

call_00_0861:
    ld   A, [wC6E3]                                    ;; 00:0861 $fa $e3 $c6
    call doJumptable                                   ;; 00:0864 $cd $3a $37
;@jumptable amount=9 bank=1
    dw   call_00_0879                                  ;; 00:0867 ?? $00
    dw   call_01_4311                                  ;; 00:0869 ?? $01
    dw   call_01_4272                                  ;; 00:086b ?? $02
    dw   call_01_4250                                  ;; 00:086d ?? $03
    dw   call_01_4250                                  ;; 00:086f ?? $04
    dw   call_01_4250                                  ;; 00:0871 ?? $05
    dw   call_01_4250                                  ;; 00:0873 ?? $06
    dw   call_01_4250                                  ;; 00:0875 ?? $07
    dw   call_01_4250                                  ;; 00:0877 ?? $08

call_00_0879:
    ret                                                ;; 00:0879 $c9
    db   $ff, $00, $bc, $00, $40, $00, $ff, $01        ;; 00:087a ..??????
    db   $bc, $01, $bc, $02, $00, $01, $00, $02        ;; 00:0882 ????????
    db   $00, $03, $00, $00, $1d, $20, $1e, $28        ;; 00:088a ????????
    db   $1a, $10, $1a, $10, $1a, $10, $1a, $10        ;; 00:0892 ????????
    db   $1a, $10, $1a, $10                            ;; 00:089a ????

call_00_089e:
    call call_00_08ad                                  ;; 00:089e $cd $ad $08
    ld   A, $01                                        ;; 00:08a1 $3e $01
    rst  pushActiveBankSafe                            ;; 00:08a3 $e7
    call $4000                                         ;; 00:08a4 $cd $00 $40
    rst  popActiveBankSafe                             ;; 00:08a7 $ef
    ld   A, [wC6E3]                                    ;; 00:08a8 $fa $e3 $c6
    and  A, A                                          ;; 00:08ab $a7
    ret                                                ;; 00:08ac $c9

call_00_08ad:
    ld   A, [wC6E3]                                    ;; 00:08ad $fa $e3 $c6
    add  A, A                                          ;; 00:08b0 $87
    ld   HL, $87a                                      ;; 00:08b1 $21 $7a $08
    rst  add_hl_a                                      ;; 00:08b4 $c7
    ld   A, [HL+]                                      ;; 00:08b5 $2a
    ld   [wCA0F], A                                    ;; 00:08b6 $ea $0f $ca
    ld   A, [HL]                                       ;; 00:08b9 $7e
    ld   [wC6F1], A                                    ;; 00:08ba $ea $f1 $c6
    call call_00_01d7                                  ;; 00:08bd $cd $d7 $01
    ld   A, [wC6E3]                                    ;; 00:08c0 $fa $e3 $c6
    and  A, A                                          ;; 00:08c3 $a7
    jr   Z, .jr_00_08db                                ;; 00:08c4 $28 $15
    ld   A, [wC6E3]                                    ;; 00:08c6 $fa $e3 $c6
    add  A, A                                          ;; 00:08c9 $87
    ld   HL, $88c                                      ;; 00:08ca $21 $8c $08
    rst  add_hl_a                                      ;; 00:08cd $c7
    ld   A, [HL+]                                      ;; 00:08ce $2a
    ld   B, A                                          ;; 00:08cf $47
    ld   C, [HL]                                       ;; 00:08d0 $4e
    call call_00_3c70                                  ;; 00:08d1 $cd $70 $3c
    ld   [HL], B                                       ;; 00:08d4 $70
    call call_00_3c2e                                  ;; 00:08d5 $cd $2e $3c
    ld   [HL], C                                       ;; 00:08d8 $71
    jr   .jr_00_08eb                                   ;; 00:08d9 $18 $10
.jr_00_08db:
    call call_00_3c80                                  ;; 00:08db $cd $80 $3c
    ld   B, [HL]                                       ;; 00:08de $46
    call call_00_3c70                                  ;; 00:08df $cd $70 $3c
    ld   [HL], B                                       ;; 00:08e2 $70
    call call_00_3c78                                  ;; 00:08e3 $cd $78 $3c
    ld   B, [HL]                                       ;; 00:08e6 $46
    call call_00_3c2e                                  ;; 00:08e7 $cd $2e $3c
    ld   [HL], B                                       ;; 00:08ea $70
.jr_00_08eb:
    ld   A, [wC6EE]                                    ;; 00:08eb $fa $ee $c6
    rst  rst_00_0018                                   ;; 00:08ee $df
    db   $9d                                           ;; 00:08ef .
    jp   call_00_3a6b                                  ;; 00:08f0 $c3 $6b $3a

call_00_08f3:
    ld   A, [wCA52]                                    ;; 00:08f3 $fa $52 $ca
    and  A, A                                          ;; 00:08f6 $a7
    jr   Z, .jr_00_0901                                ;; 00:08f7 $28 $08
    ld   A, $2b                                        ;; 00:08f9 $3e $2b
    ld   [wCA29], A                                    ;; 00:08fb $ea $29 $ca
    jp   call_00_1236                                  ;; 00:08fe $c3 $36 $12
.jr_00_0901:
    ld   A, [wCA56]                                    ;; 00:0901 $fa $56 $ca
    and  A, A                                          ;; 00:0904 $a7
    ret  Z                                             ;; 00:0905 $c8
    ld   A, [wC6E3]                                    ;; 00:0906 $fa $e3 $c6
    cp   A, $02                                        ;; 00:0909 $fe $02
    jr   Z, .jr_00_091b                                ;; 00:090b $28 $0e
    cp   A, $03                                        ;; 00:090d $fe $03
    jr   NC, .jr_00_0915                               ;; 00:090f $30 $04
    and  A, A                                          ;; 00:0911 $a7
    ret  NZ                                            ;; 00:0912 $c0
    jr   .jr_00_091b                                   ;; 00:0913 $18 $06
.jr_00_0915:
    ld   A, [wC2F0]                                    ;; 00:0915 $fa $f0 $c2
    cp   A, $ea                                        ;; 00:0918 $fe $ea
    ret  NZ                                            ;; 00:091a $c0
.jr_00_091b:
    ld   A, [wC2F0]                                    ;; 00:091b $fa $f0 $c2
    and  A, $c0                                        ;; 00:091e $e6 $c0
    cp   A, $c0                                        ;; 00:0920 $fe $c0
    ret  NZ                                            ;; 00:0922 $c0
    xor  A, A                                          ;; 00:0923 $af
    ld   [wCA13], A                                    ;; 00:0924 $ea $13 $ca
    call call_01_4f24                                  ;; 00:0927 $cd $24 $4f
    ld   A, [wC2F0]                                    ;; 00:092a $fa $f0 $c2
    and  A, $3f                                        ;; 00:092d $e6 $3f
    ld   [wCA29], A                                    ;; 00:092f $ea $29 $ca
    jp   call_00_1236                                  ;; 00:0932 $c3 $36 $12
    db   $02, $03, $04, $05, $06, $06, $07, $08        ;; 00:0935 ????????
    db   $06, $06, $07, $08, $02, $03, $04, $05        ;; 00:093d ????????

call_00_0945:
    call $6313                                         ;; 00:0945 $cd $13 $63
    ret  Z                                             ;; 00:0948 $c8
    ld   A, [wC6E3]                                    ;; 00:0949 $fa $e3 $c6
    cp   A, $02                                        ;; 00:094c $fe $02
    jr   NZ, .jr_00_097f                               ;; 00:094e $20 $2f
    ld   A, [wC6E8]                                    ;; 00:0950 $fa $e8 $c6
    ld   B, A                                          ;; 00:0953 $47
    ld   HL, $935                                      ;; 00:0954 $21 $35 $09
    ld   C, $ff                                        ;; 00:0957 $0e $ff
.jr_00_0959:
    inc  C                                             ;; 00:0959 $0c
    ld   A, $08                                        ;; 00:095a $3e $08
    cp   A, C                                          ;; 00:095c $b9
    jr   Z, .jr_00_097c                                ;; 00:095d $28 $1d
    ld   A, [HL+]                                      ;; 00:095f $2a
    cp   A, B                                          ;; 00:0960 $b8
    jr   NZ, .jr_00_0959                               ;; 00:0961 $20 $f6
    ld   A, C                                          ;; 00:0963 $79
    ld   HL, $93d                                      ;; 00:0964 $21 $3d $09
    rst  add_hl_a                                      ;; 00:0967 $c7
    ld   A, [HL]                                       ;; 00:0968 $7e
    ld   [wC6E8], A                                    ;; 00:0969 $ea $e8 $c6
    cp   A, $02                                        ;; 00:096c $fe $02
    jr   NZ, .jr_00_097c                               ;; 00:096e $20 $0c
    ld   A, $0e                                        ;; 00:0970 $3e $0e
    call call_00_3cb2                                  ;; 00:0972 $cd $b2 $3c
    jr   NC, .jr_00_097c                               ;; 00:0975 $30 $05
    ld   A, $03                                        ;; 00:0977 $3e $03
    ld   [wC6E8], A                                    ;; 00:0979 $ea $e8 $c6
.jr_00_097c:
    jp   call_00_027d                                  ;; 00:097c $c3 $7d $02
.jr_00_097f:
    call $431e                                         ;; 00:097f $cd $1e $43
    ret  Z                                             ;; 00:0982 $c8
    call call_00_3a6b                                  ;; 00:0983 $cd $6b $3a
    call call_00_3c88                                  ;; 00:0986 $cd $88 $3c
    ld   A, [HL]                                       ;; 00:0989 $7e
    call doJumptable                                   ;; 00:098a $cd $3a $37
;@jumptable amount=4
    dw   call_00_0995                                  ;; 00:098d ?? $00
    dw   call_00_09d4                                  ;; 00:098f ?? $01
    dw   call_00_0a2f                                  ;; 00:0991 ?? $02
    dw   call_00_09b7                                  ;; 00:0993 ?? $03

call_00_0995:
    call call_00_3c03                                  ;; 00:0995 $cd $03 $3c
    ld   A, $0a                                        ;; 00:0998 $3e $0a
    rst  pushActiveBankSafe                            ;; 00:099a $e7
    ld   A, [HL]                                       ;; 00:099b $7e
    cp   A, $ff                                        ;; 00:099c $fe $ff
    jr   NZ, .jr_00_09a2                               ;; 00:099e $20 $02
    rst  popActiveBankSafe                             ;; 00:09a0 $ef
    ret                                                ;; 00:09a1 $c9
.jr_00_09a2:
    dec  A                                             ;; 00:09a2 $3d
    ld   HL, $4004                                     ;; 00:09a3 $21 $04 $40
    call call_00_3741                                  ;; 00:09a6 $cd $41 $37
    rst  popActiveBankSafe                             ;; 00:09a9 $ef
    ld   A, $08                                        ;; 00:09aa $3e $08
    ld   DE, $101                                      ;; 00:09ac $11 $01 $01
    ld   BC, $612                                      ;; 00:09af $01 $12 $06
    rst  rst_00_0018                                   ;; 00:09b2 $df
    db   $a0                                           ;; 00:09b3 ?
    jp   call_00_35d2                                  ;; 00:09b4 $c3 $d2 $35

call_00_09b7:
    call call_00_3c03                                  ;; 00:09b7 $cd $03 $3c
    ld   A, [HL]                                       ;; 00:09ba $7e
    cp   A, $09                                        ;; 00:09bb $fe $09
    ret  NC                                            ;; 00:09bd $d0
    ld   A, $0a                                        ;; 00:09be $3e $0a
    rst  pushActiveBankSafe                            ;; 00:09c0 $e7
    ld   A, [HL]                                       ;; 00:09c1 $7e
    dec  A                                             ;; 00:09c2 $3d
    ld   HL, $791e                                     ;; 00:09c3 $21 $1e $79
    call call_00_3741                                  ;; 00:09c6 $cd $41 $37
    rst  popActiveBankSafe                             ;; 00:09c9 $ef
    xor  A, A                                          ;; 00:09ca $af
    ld   DE, $101                                      ;; 00:09cb $11 $01 $01
    ld   BC, $612                                      ;; 00:09ce $01 $12 $06
    rst  rst_00_0018                                   ;; 00:09d1 $df
    db   $a0                                           ;; 00:09d2 ?
    ret                                                ;; 00:09d3 $c9

call_00_09d4:
    call call_00_3c03                                  ;; 00:09d4 $cd $03 $3c
    ld   A, [HL]                                       ;; 00:09d7 $7e
    dec  A                                             ;; 00:09d8 $3d
    ld   B, A                                          ;; 00:09d9 $47
    cp   A, $80                                        ;; 00:09da $fe $80
    jr   NC, .jr_00_0a1f                               ;; 00:09dc $30 $41
    call call_00_3cca                                  ;; 00:09de $cd $ca $3c
    jr   C, .jr_00_0a1f                                ;; 00:09e1 $38 $3c
    push BC                                            ;; 00:09e3 $c5
    ld   A, $03                                        ;; 00:09e4 $3e $03
    rst  pushActiveBankSafe                            ;; 00:09e6 $e7
    pop  AF                                            ;; 00:09e7 $f1
    ld   HL, $762a                                     ;; 00:09e8 $21 $2a $76
    rst  add_hl_a                                      ;; 00:09eb $c7
    ldh  A, [hFF96]                                    ;; 00:09ec $f0 $96
    push AF                                            ;; 00:09ee $f5
    ld   A, [HL]                                       ;; 00:09ef $7e
    ld   [wCE94], A                                    ;; 00:09f0 $ea $94 $ce
    rst  popActiveBankSafe                             ;; 00:09f3 $ef
    rst  rst_00_0018                                   ;; 00:09f4 $df
    db   $6a                                           ;; 00:09f5 ?
    pop  AF                                            ;; 00:09f6 $f1
    ldh  [hFF96], A                                    ;; 00:09f7 $e0 $96
    ld   A, $01                                        ;; 00:09f9 $3e $01
    call call_00_3cb2                                  ;; 00:09fb $cd $b2 $3c
    jr   C, .jr_00_0a1e                                ;; 00:09fe $38 $1e
    call call_00_3c2e                                  ;; 00:0a00 $cd $2e $3c
    ld   [HL], $78                                     ;; 00:0a03 $36 $78
    call call_00_3c78                                  ;; 00:0a05 $cd $78 $3c
    ld   [HL], $78                                     ;; 00:0a08 $36 $78
    xor  A, A                                          ;; 00:0a0a $af
    call $5272                                         ;; 00:0a0b $cd $72 $52
    call call_00_3c03                                  ;; 00:0a0e $cd $03 $3c
    ld   A, [HL]                                       ;; 00:0a11 $7e
    push AF                                            ;; 00:0a12 $f5
    cp   A, $61                                        ;; 00:0a13 $fe $61
    jr   C, .jr_00_0a19                                ;; 00:0a15 $38 $02
    rst  rst_00_0018                                   ;; 00:0a17 $df
    db   $78                                           ;; 00:0a18 ?
.jr_00_0a19:
    pop  AF                                            ;; 00:0a19 $f1
    dec  A                                             ;; 00:0a1a $3d
    call call_00_3cb8                                  ;; 00:0a1b $cd $b8 $3c
.jr_00_0a1e:
    ret                                                ;; 00:0a1e $c9
.jr_00_0a1f:
    ld   A, $0c                                        ;; 00:0a1f $3e $0c
    ld   BC, $612                                      ;; 00:0a21 $01 $12 $06
    ld   DE, $101                                      ;; 00:0a24 $11 $01 $01
    ld   HL, $611d                                     ;; 00:0a27 $21 $1d $61
    rst  rst_00_0018                                   ;; 00:0a2a $df
    db   $10                                           ;; 00:0a2b ?
    jp   call_00_35d2                                  ;; 00:0a2c $c3 $d2 $35

call_00_0a2f:
    call call_00_3c03                                  ;; 00:0a2f $cd $03 $3c
    ld   A, [HL]                                       ;; 00:0a32 $7e
    dec  A                                             ;; 00:0a33 $3d
    ld   [wCA2F], A                                    ;; 00:0a34 $ea $2f $ca
    jp   $6fd4                                         ;; 00:0a37 $c3 $d4 $6f

call_00_0a3a:
    ld   A, [wC6EF]                                    ;; 00:0a3a $fa $ef $c6
    and  A, $1f                                        ;; 00:0a3d $e6 $1f
    cp   A, $10                                        ;; 00:0a3f $fe $10
    jr   Z, .jr_00_0a49                                ;; 00:0a41 $28 $06
    cp   A, $08                                        ;; 00:0a43 $fe $08
    jp   Z, .jp_00_0ad9                                ;; 00:0a45 $ca $d9 $0a
    ret                                                ;; 00:0a48 $c9
.jr_00_0a49:
    call call_00_0d91                                  ;; 00:0a49 $cd $91 $0d
    xor  A, A                                          ;; 00:0a4c $af
    ld   [wC800], A                                    ;; 00:0a4d $ea $00 $c8
.jr_00_0a50:
    ld   A, [wC801]                                    ;; 00:0a50 $fa $01 $c8
    ld   L, A                                          ;; 00:0a53 $6f
    ld   A, [wC802]                                    ;; 00:0a54 $fa $02 $c8
    ld   H, A                                          ;; 00:0a57 $67
    ld   E, [HL]                                       ;; 00:0a58 $5e
    ld   D, $00                                        ;; 00:0a59 $16 $00
    sla  E                                             ;; 00:0a5b $cb $23
    sla  E                                             ;; 00:0a5d $cb $23
    call call_01_5ea6                                  ;; 00:0a5f $cd $a6 $5e
    ld   A, $06                                        ;; 00:0a62 $3e $06
    ld   [$2100], A                                    ;; 00:0a64 $ea $00 $21
    call call_00_0e0a                                  ;; 00:0a67 $cd $0a $0e
    add  HL, DE                                        ;; 00:0a6a $19
    ld   E, L                                          ;; 00:0a6b $5d
    ld   D, H                                          ;; 00:0a6c $54
    ld   HL, wC880                                     ;; 00:0a6d $21 $80 $c8
    ld   A, [wC800]                                    ;; 00:0a70 $fa $00 $c8
    add  A, L                                          ;; 00:0a73 $85
    ld   L, A                                          ;; 00:0a74 $6f
    jr   NC, .jr_00_0a78                               ;; 00:0a75 $30 $01
    inc  H                                             ;; 00:0a77 $24
.jr_00_0a78:
    ld   A, [DE]                                       ;; 00:0a78 $1a
    ld   [HL+], A                                      ;; 00:0a79 $22
    inc  DE                                            ;; 00:0a7a $13
    ld   A, [DE]                                       ;; 00:0a7b $1a
    ld   [HL], A                                       ;; 00:0a7c $77
    inc  DE                                            ;; 00:0a7d $13
    ld   BC, $15                                       ;; 00:0a7e $01 $15 $00
    add  HL, BC                                        ;; 00:0a81 $09
    ld   A, [DE]                                       ;; 00:0a82 $1a
    ld   [HL+], A                                      ;; 00:0a83 $22
    inc  DE                                            ;; 00:0a84 $13
    ld   A, [DE]                                       ;; 00:0a85 $1a
    ld   [HL], A                                       ;; 00:0a86 $77
    ld   A, $01                                        ;; 00:0a87 $3e $01
    ld   [$2100], A                                    ;; 00:0a89 $ea $00 $21
    ld   HL, wCA07                                     ;; 00:0a8c $21 $07 $ca
    ld   A, [wC801]                                    ;; 00:0a8f $fa $01 $c8
    add  A, [HL]                                       ;; 00:0a92 $86
    ld   [wC801], A                                    ;; 00:0a93 $ea $01 $c8
    ld   A, [wC802]                                    ;; 00:0a96 $fa $02 $c8
    adc  A, $00                                        ;; 00:0a99 $ce $00
    ld   HL, wCA06                                     ;; 00:0a9b $21 $06 $ca
    and  A, [HL]                                       ;; 00:0a9e $a6
    or   A, $d0                                        ;; 00:0a9f $f6 $d0
    ld   [wC802], A                                    ;; 00:0aa1 $ea $02 $c8
    ld   A, [wC800]                                    ;; 00:0aa4 $fa $00 $c8
    add  A, $02                                        ;; 00:0aa7 $c6 $02
    ld   [wC800], A                                    ;; 00:0aa9 $ea $00 $c8
    cp   A, $16                                        ;; 00:0aac $fe $16
    jr   NZ, .jr_00_0a50                               ;; 00:0aae $20 $a0
    ld   BC, $b0                                       ;; 00:0ab0 $01 $b0 $00
    call call_00_0de4                                  ;; 00:0ab3 $cd $e4 $0d
    ld   DE, wC880                                     ;; 00:0ab6 $11 $80 $c8
    ld   BC, $1601                                     ;; 00:0ab9 $01 $01 $16
    call call_00_394c                                  ;; 00:0abc $cd $4c $39
    ld   A, [wC6E6]                                    ;; 00:0abf $fa $e6 $c6
    add  A, $10                                        ;; 00:0ac2 $c6 $10
    ld   [wC6E6], A                                    ;; 00:0ac4 $ea $e6 $c6
    ld   A, [wC6E7]                                    ;; 00:0ac7 $fa $e7 $c6
    adc  A, $00                                        ;; 00:0aca $ce $00
    ld   HL, wCA05                                     ;; 00:0acc $21 $05 $ca
    and  A, [HL]                                       ;; 00:0acf $a6
    ld   [wC6E7], A                                    ;; 00:0ad0 $ea $e7 $c6
    ld   A, $01                                        ;; 00:0ad3 $3e $01
    ld   [wCA0E], A                                    ;; 00:0ad5 $ea $0e $ca
    ret                                                ;; 00:0ad8 $c9
.jp_00_0ad9:
    ld   BC, $b0                                       ;; 00:0ad9 $01 $b0 $00
    call call_00_0de4                                  ;; 00:0adc $cd $e4 $0d
    ld   DE, wC896                                     ;; 00:0adf $11 $96 $c8
    ld   BC, $1601                                     ;; 00:0ae2 $01 $01 $16
    call call_00_394c                                  ;; 00:0ae5 $cd $4c $39
    ld   A, $01                                        ;; 00:0ae8 $3e $01
    ld   [wCA0E], A                                    ;; 00:0aea $ea $0e $ca
    ret                                                ;; 00:0aed $c9

call_00_0aee:
    ld   A, [wC6EF]                                    ;; 00:0aee $fa $ef $c6
    and  A, $1f                                        ;; 00:0af1 $e6 $1f
    cp   A, $10                                        ;; 00:0af3 $fe $10
    jr   Z, .jr_00_0afd                                ;; 00:0af5 $28 $06
    cp   A, $08                                        ;; 00:0af7 $fe $08
    jp   Z, .jp_00_0b8d                                ;; 00:0af9 $ca $8d $0b
    ret                                                ;; 00:0afc $c9
.jr_00_0afd:
    call call_00_0d6d                                  ;; 00:0afd $cd $6d $0d
    xor  A, A                                          ;; 00:0b00 $af
    ld   [wC800], A                                    ;; 00:0b01 $ea $00 $c8
.jr_00_0b04:
    ld   A, [wC801]                                    ;; 00:0b04 $fa $01 $c8
    ld   L, A                                          ;; 00:0b07 $6f
    ld   A, [wC802]                                    ;; 00:0b08 $fa $02 $c8
    ld   H, A                                          ;; 00:0b0b $67
    ld   E, [HL]                                       ;; 00:0b0c $5e
    ld   D, $00                                        ;; 00:0b0d $16 $00
    sla  E                                             ;; 00:0b0f $cb $23
    sla  E                                             ;; 00:0b11 $cb $23
    call call_01_5ea6                                  ;; 00:0b13 $cd $a6 $5e
    ld   A, $06                                        ;; 00:0b16 $3e $06
    ld   [$2100], A                                    ;; 00:0b18 $ea $00 $21
    call call_00_0e0a                                  ;; 00:0b1b $cd $0a $0e
    add  HL, DE                                        ;; 00:0b1e $19
    ld   E, L                                          ;; 00:0b1f $5d
    ld   D, H                                          ;; 00:0b20 $54
    ld   HL, wC880                                     ;; 00:0b21 $21 $80 $c8
    ld   A, [wC800]                                    ;; 00:0b24 $fa $00 $c8
    add  A, L                                          ;; 00:0b27 $85
    ld   L, A                                          ;; 00:0b28 $6f
    jr   NC, .jr_00_0b2c                               ;; 00:0b29 $30 $01
    inc  H                                             ;; 00:0b2b $24
.jr_00_0b2c:
    ld   A, [DE]                                       ;; 00:0b2c $1a
    ld   [HL+], A                                      ;; 00:0b2d $22
    inc  DE                                            ;; 00:0b2e $13
    ld   A, [DE]                                       ;; 00:0b2f $1a
    ld   [HL], A                                       ;; 00:0b30 $77
    inc  DE                                            ;; 00:0b31 $13
    ld   BC, $15                                       ;; 00:0b32 $01 $15 $00
    add  HL, BC                                        ;; 00:0b35 $09
    ld   A, [DE]                                       ;; 00:0b36 $1a
    ld   [HL+], A                                      ;; 00:0b37 $22
    inc  DE                                            ;; 00:0b38 $13
    ld   A, [DE]                                       ;; 00:0b39 $1a
    ld   [HL], A                                       ;; 00:0b3a $77
    ld   A, $01                                        ;; 00:0b3b $3e $01
    ld   [$2100], A                                    ;; 00:0b3d $ea $00 $21
    ld   HL, wCA07                                     ;; 00:0b40 $21 $07 $ca
    ld   A, [wC801]                                    ;; 00:0b43 $fa $01 $c8
    add  A, [HL]                                       ;; 00:0b46 $86
    ld   [wC801], A                                    ;; 00:0b47 $ea $01 $c8
    ld   A, [wC802]                                    ;; 00:0b4a $fa $02 $c8
    adc  A, $00                                        ;; 00:0b4d $ce $00
    ld   HL, wCA06                                     ;; 00:0b4f $21 $06 $ca
    and  A, [HL]                                       ;; 00:0b52 $a6
    or   A, $d0                                        ;; 00:0b53 $f6 $d0
    ld   [wC802], A                                    ;; 00:0b55 $ea $02 $c8
    ld   A, [wC800]                                    ;; 00:0b58 $fa $00 $c8
    add  A, $02                                        ;; 00:0b5b $c6 $02
    ld   [wC800], A                                    ;; 00:0b5d $ea $00 $c8
    cp   A, $16                                        ;; 00:0b60 $fe $16
    jr   NZ, .jr_00_0b04                               ;; 00:0b62 $20 $a0
    ld   BC, $e8                                       ;; 00:0b64 $01 $e8 $00
    call call_00_0de4                                  ;; 00:0b67 $cd $e4 $0d
    ld   DE, wC896                                     ;; 00:0b6a $11 $96 $c8
    ld   BC, $1601                                     ;; 00:0b6d $01 $01 $16
    call call_00_394c                                  ;; 00:0b70 $cd $4c $39
    ld   A, [wC6E6]                                    ;; 00:0b73 $fa $e6 $c6
    sub  A, $10                                        ;; 00:0b76 $d6 $10
    ld   [wC6E6], A                                    ;; 00:0b78 $ea $e6 $c6
    ld   A, [wC6E7]                                    ;; 00:0b7b $fa $e7 $c6
    sbc  A, $00                                        ;; 00:0b7e $de $00
    ld   HL, wCA05                                     ;; 00:0b80 $21 $05 $ca
    and  A, [HL]                                       ;; 00:0b83 $a6
    ld   [wC6E7], A                                    ;; 00:0b84 $ea $e7 $c6
    ld   A, $01                                        ;; 00:0b87 $3e $01
    ld   [wCA0E], A                                    ;; 00:0b89 $ea $0e $ca
    ret                                                ;; 00:0b8c $c9
.jp_00_0b8d:
    ld   BC, $e8                                       ;; 00:0b8d $01 $e8 $00
    call call_00_0de4                                  ;; 00:0b90 $cd $e4 $0d
    ld   DE, wC880                                     ;; 00:0b93 $11 $80 $c8
    ld   BC, $1601                                     ;; 00:0b96 $01 $01 $16
    call call_00_394c                                  ;; 00:0b99 $cd $4c $39
    ld   A, $01                                        ;; 00:0b9c $3e $01
    ld   [wCA0E], A                                    ;; 00:0b9e $ea $0e $ca
    ret                                                ;; 00:0ba1 $c9

call_00_0ba2:
    ld   A, [wC6EF]                                    ;; 00:0ba2 $fa $ef $c6
    and  A, $1f                                        ;; 00:0ba5 $e6 $1f
    cp   A, $10                                        ;; 00:0ba7 $fe $10
    jr   Z, .jr_00_0bb1                                ;; 00:0ba9 $28 $06
    cp   A, $08                                        ;; 00:0bab $fe $08
    jp   Z, .jp_00_0c46                                ;; 00:0bad $ca $46 $0c
    ret                                                ;; 00:0bb0 $c9
.jr_00_0bb1:
    call call_00_0d14                                  ;; 00:0bb1 $cd $14 $0d
    xor  A, A                                          ;; 00:0bb4 $af
    ld   [wC800], A                                    ;; 00:0bb5 $ea $00 $c8
.jr_00_0bb8:
    ld   A, [wC801]                                    ;; 00:0bb8 $fa $01 $c8
    ld   L, A                                          ;; 00:0bbb $6f
    ld   A, [wC802]                                    ;; 00:0bbc $fa $02 $c8
    ld   H, A                                          ;; 00:0bbf $67
    ld   E, [HL]                                       ;; 00:0bc0 $5e
    ld   D, $00                                        ;; 00:0bc1 $16 $00
    sla  E                                             ;; 00:0bc3 $cb $23
    sla  E                                             ;; 00:0bc5 $cb $23
    call call_01_5ea6                                  ;; 00:0bc7 $cd $a6 $5e
    ld   A, $06                                        ;; 00:0bca $3e $06
    ld   [$2100], A                                    ;; 00:0bcc $ea $00 $21
    call call_00_0e0a                                  ;; 00:0bcf $cd $0a $0e
    add  HL, DE                                        ;; 00:0bd2 $19
    ld   E, L                                          ;; 00:0bd3 $5d
    ld   D, H                                          ;; 00:0bd4 $54
    ld   HL, wC880                                     ;; 00:0bd5 $21 $80 $c8
    ld   A, [wC800]                                    ;; 00:0bd8 $fa $00 $c8
    add  A, L                                          ;; 00:0bdb $85
    ld   L, A                                          ;; 00:0bdc $6f
    jr   NC, .jr_00_0be0                               ;; 00:0bdd $30 $01
    inc  H                                             ;; 00:0bdf $24
.jr_00_0be0:
    ld   A, [DE]                                       ;; 00:0be0 $1a
    ld   [HL+], A                                      ;; 00:0be1 $22
    inc  DE                                            ;; 00:0be2 $13
    inc  DE                                            ;; 00:0be3 $13
    ld   A, [DE]                                       ;; 00:0be4 $1a
    ld   [HL], A                                       ;; 00:0be5 $77
    dec  DE                                            ;; 00:0be6 $1b
    ld   BC, $17                                       ;; 00:0be7 $01 $17 $00
    add  HL, BC                                        ;; 00:0bea $09
    ld   A, [DE]                                       ;; 00:0beb $1a
    ld   [HL+], A                                      ;; 00:0bec $22
    inc  DE                                            ;; 00:0bed $13
    inc  DE                                            ;; 00:0bee $13
    ld   A, [DE]                                       ;; 00:0bef $1a
    ld   [HL], A                                       ;; 00:0bf0 $77
    ld   A, $01                                        ;; 00:0bf1 $3e $01
    ld   [$2100], A                                    ;; 00:0bf3 $ea $00 $21
    ld   A, [wCA07]                                    ;; 00:0bf6 $fa $07 $ca
    dec  A                                             ;; 00:0bf9 $3d
    xor  A, $ff                                        ;; 00:0bfa $ee $ff
    ld   B, A                                          ;; 00:0bfc $47
    ld   A, [wC801]                                    ;; 00:0bfd $fa $01 $c8
    and  A, B                                          ;; 00:0c00 $a0
    ld   C, A                                          ;; 00:0c01 $4f
    ld   A, [wCA07]                                    ;; 00:0c02 $fa $07 $ca
    dec  A                                             ;; 00:0c05 $3d
    ld   B, A                                          ;; 00:0c06 $47
    ld   A, [wC801]                                    ;; 00:0c07 $fa $01 $c8
    add  A, $01                                        ;; 00:0c0a $c6 $01
    and  A, B                                          ;; 00:0c0c $a0
    or   A, C                                          ;; 00:0c0d $b1
    ld   [wC801], A                                    ;; 00:0c0e $ea $01 $c8
    ld   A, [wC800]                                    ;; 00:0c11 $fa $00 $c8
    add  A, $02                                        ;; 00:0c14 $c6 $02
    ld   [wC800], A                                    ;; 00:0c16 $ea $00 $c8
    cp   A, $18                                        ;; 00:0c19 $fe $18
    jr   NZ, .jr_00_0bb8                               ;; 00:0c1b $20 $9b
    ld   BC, $f8f0                                     ;; 00:0c1d $01 $f0 $f8
    call call_00_0de4                                  ;; 00:0c20 $cd $e4 $0d
    ld   DE, wC898                                     ;; 00:0c23 $11 $98 $c8
    ld   BC, $118                                      ;; 00:0c26 $01 $18 $01
    call call_00_394c                                  ;; 00:0c29 $cd $4c $39
    ld   A, [wC6E4]                                    ;; 00:0c2c $fa $e4 $c6
    sub  A, $10                                        ;; 00:0c2f $d6 $10
    ld   [wC6E4], A                                    ;; 00:0c31 $ea $e4 $c6
    ld   A, [wC6E5]                                    ;; 00:0c34 $fa $e5 $c6
    sbc  A, $00                                        ;; 00:0c37 $de $00
    ld   HL, wCA04                                     ;; 00:0c39 $21 $04 $ca
    and  A, [HL]                                       ;; 00:0c3c $a6
    ld   [wC6E5], A                                    ;; 00:0c3d $ea $e5 $c6
    ld   A, $01                                        ;; 00:0c40 $3e $01
    ld   [wCA0E], A                                    ;; 00:0c42 $ea $0e $ca
    ret                                                ;; 00:0c45 $c9
.jp_00_0c46:
    ld   BC, $f8f0                                     ;; 00:0c46 $01 $f0 $f8
    call call_00_0de4                                  ;; 00:0c49 $cd $e4 $0d
    ld   DE, wC880                                     ;; 00:0c4c $11 $80 $c8
    ld   BC, $118                                      ;; 00:0c4f $01 $18 $01
    call call_00_394c                                  ;; 00:0c52 $cd $4c $39
    ld   A, $01                                        ;; 00:0c55 $3e $01
    ld   [wCA0E], A                                    ;; 00:0c57 $ea $0e $ca
    ret                                                ;; 00:0c5a $c9

call_00_0c5b:
    ld   A, [wC6EF]                                    ;; 00:0c5b $fa $ef $c6
    and  A, $1f                                        ;; 00:0c5e $e6 $1f
    cp   A, $10                                        ;; 00:0c60 $fe $10
    jr   Z, .jr_00_0c6a                                ;; 00:0c62 $28 $06
    cp   A, $08                                        ;; 00:0c64 $fe $08
    jp   Z, .jp_00_0cff                                ;; 00:0c66 $ca $ff $0c
    ret                                                ;; 00:0c69 $c9
.jr_00_0c6a:
    call call_00_0d41                                  ;; 00:0c6a $cd $41 $0d
    xor  A, A                                          ;; 00:0c6d $af
    ld   [wC800], A                                    ;; 00:0c6e $ea $00 $c8
.jr_00_0c71:
    ld   A, [wC801]                                    ;; 00:0c71 $fa $01 $c8
    ld   L, A                                          ;; 00:0c74 $6f
    ld   A, [wC802]                                    ;; 00:0c75 $fa $02 $c8
    ld   H, A                                          ;; 00:0c78 $67
    ld   E, [HL]                                       ;; 00:0c79 $5e
    ld   D, $00                                        ;; 00:0c7a $16 $00
    sla  E                                             ;; 00:0c7c $cb $23
    sla  E                                             ;; 00:0c7e $cb $23
    call call_01_5ea6                                  ;; 00:0c80 $cd $a6 $5e
    ld   A, $06                                        ;; 00:0c83 $3e $06
    ld   [$2100], A                                    ;; 00:0c85 $ea $00 $21
    call call_00_0e0a                                  ;; 00:0c88 $cd $0a $0e
    add  HL, DE                                        ;; 00:0c8b $19
    ld   E, L                                          ;; 00:0c8c $5d
    ld   D, H                                          ;; 00:0c8d $54
    ld   HL, wC880                                     ;; 00:0c8e $21 $80 $c8
    ld   A, [wC800]                                    ;; 00:0c91 $fa $00 $c8
    add  A, L                                          ;; 00:0c94 $85
    ld   L, A                                          ;; 00:0c95 $6f
    jr   NC, .jr_00_0c99                               ;; 00:0c96 $30 $01
    inc  H                                             ;; 00:0c98 $24
.jr_00_0c99:
    ld   A, [DE]                                       ;; 00:0c99 $1a
    ld   [HL+], A                                      ;; 00:0c9a $22
    inc  DE                                            ;; 00:0c9b $13
    inc  DE                                            ;; 00:0c9c $13
    ld   A, [DE]                                       ;; 00:0c9d $1a
    ld   [HL], A                                       ;; 00:0c9e $77
    dec  DE                                            ;; 00:0c9f $1b
    ld   BC, $17                                       ;; 00:0ca0 $01 $17 $00
    add  HL, BC                                        ;; 00:0ca3 $09
    ld   A, [DE]                                       ;; 00:0ca4 $1a
    ld   [HL+], A                                      ;; 00:0ca5 $22
    inc  DE                                            ;; 00:0ca6 $13
    inc  DE                                            ;; 00:0ca7 $13
    ld   A, [DE]                                       ;; 00:0ca8 $1a
    ld   [HL], A                                       ;; 00:0ca9 $77
    ld   A, $01                                        ;; 00:0caa $3e $01
    ld   [$2100], A                                    ;; 00:0cac $ea $00 $21
    ld   A, [wCA07]                                    ;; 00:0caf $fa $07 $ca
    dec  A                                             ;; 00:0cb2 $3d
    xor  A, $ff                                        ;; 00:0cb3 $ee $ff
    ld   B, A                                          ;; 00:0cb5 $47
    ld   A, [wC801]                                    ;; 00:0cb6 $fa $01 $c8
    and  A, B                                          ;; 00:0cb9 $a0
    ld   C, A                                          ;; 00:0cba $4f
    ld   A, [wCA07]                                    ;; 00:0cbb $fa $07 $ca
    dec  A                                             ;; 00:0cbe $3d
    ld   B, A                                          ;; 00:0cbf $47
    ld   A, [wC801]                                    ;; 00:0cc0 $fa $01 $c8
    add  A, $01                                        ;; 00:0cc3 $c6 $01
    and  A, B                                          ;; 00:0cc5 $a0
    or   A, C                                          ;; 00:0cc6 $b1
    ld   [wC801], A                                    ;; 00:0cc7 $ea $01 $c8
    ld   A, [wC800]                                    ;; 00:0cca $fa $00 $c8
    add  A, $02                                        ;; 00:0ccd $c6 $02
    ld   [wC800], A                                    ;; 00:0ccf $ea $00 $c8
    cp   A, $18                                        ;; 00:0cd2 $fe $18
    jr   NZ, .jr_00_0c71                               ;; 00:0cd4 $20 $9b
    ld   BC, sA0F0                                     ;; 00:0cd6 $01 $f0 $a0
    call call_00_0de4                                  ;; 00:0cd9 $cd $e4 $0d
    ld   DE, wC880                                     ;; 00:0cdc $11 $80 $c8
    ld   BC, $118                                      ;; 00:0cdf $01 $18 $01
    call call_00_394c                                  ;; 00:0ce2 $cd $4c $39
    ld   A, [wC6E4]                                    ;; 00:0ce5 $fa $e4 $c6
    add  A, $10                                        ;; 00:0ce8 $c6 $10
    ld   [wC6E4], A                                    ;; 00:0cea $ea $e4 $c6
    ld   A, [wC6E5]                                    ;; 00:0ced $fa $e5 $c6
    adc  A, $00                                        ;; 00:0cf0 $ce $00
    ld   HL, wCA04                                     ;; 00:0cf2 $21 $04 $ca
    and  A, [HL]                                       ;; 00:0cf5 $a6
    ld   [wC6E5], A                                    ;; 00:0cf6 $ea $e5 $c6
    ld   A, $01                                        ;; 00:0cf9 $3e $01
    ld   [wCA0E], A                                    ;; 00:0cfb $ea $0e $ca
    ret                                                ;; 00:0cfe $c9
.jp_00_0cff:
    ld   BC, sA0F0                                     ;; 00:0cff $01 $f0 $a0
    call call_00_0de4                                  ;; 00:0d02 $cd $e4 $0d
    ld   DE, wC898                                     ;; 00:0d05 $11 $98 $c8
    ld   BC, $118                                      ;; 00:0d08 $01 $18 $01
    call call_00_394c                                  ;; 00:0d0b $cd $4c $39
    ld   A, $01                                        ;; 00:0d0e $3e $01
    ld   [wCA0E], A                                    ;; 00:0d10 $ea $0e $ca
    ret                                                ;; 00:0d13 $c9

call_00_0d14:
    ld   A, [wC6E6]                                    ;; 00:0d14 $fa $e6 $c6
    sub  A, $10                                        ;; 00:0d17 $d6 $10
    ld   E, A                                          ;; 00:0d19 $5f
    ld   A, [wC6E7]                                    ;; 00:0d1a $fa $e7 $c6
    sbc  A, $00                                        ;; 00:0d1d $de $00
    ld   D, A                                          ;; 00:0d1f $57
    ld   A, [wC6E4]                                    ;; 00:0d20 $fa $e4 $c6
    sub  A, $10                                        ;; 00:0d23 $d6 $10
    ld   C, A                                          ;; 00:0d25 $4f
    ld   A, [wC6E5]                                    ;; 00:0d26 $fa $e5 $c6
    sbc  A, $00                                        ;; 00:0d29 $de $00
    ld   HL, wCA04                                     ;; 00:0d2b $21 $04 $ca
    and  A, [HL]                                       ;; 00:0d2e $a6
    ld   B, A                                          ;; 00:0d2f $47
    ld   A, C                                          ;; 00:0d30 $79
    swap A                                             ;; 00:0d31 $cb $37
    and  A, $0f                                        ;; 00:0d33 $e6 $0f
    ld   C, A                                          ;; 00:0d35 $4f
    ld   HL, wD000                                     ;; 00:0d36 $21 $00 $d0
    ld   A, C                                          ;; 00:0d39 $79
    swap B                                             ;; 00:0d3a $cb $30
    or   A, B                                          ;; 00:0d3c $b0
    ld   C, A                                          ;; 00:0d3d $4f
    jp   jp_00_0db3                                    ;; 00:0d3e $c3 $b3 $0d

call_00_0d41:
    ld   A, [wC6E6]                                    ;; 00:0d41 $fa $e6 $c6
    sub  A, $10                                        ;; 00:0d44 $d6 $10
    ld   E, A                                          ;; 00:0d46 $5f
    ld   A, [wC6E7]                                    ;; 00:0d47 $fa $e7 $c6
    sbc  A, $00                                        ;; 00:0d4a $de $00
    ld   D, A                                          ;; 00:0d4c $57
    ld   A, [wC6E4]                                    ;; 00:0d4d $fa $e4 $c6
    add  A, $a0                                        ;; 00:0d50 $c6 $a0
    ld   C, A                                          ;; 00:0d52 $4f
    ld   A, [wC6E5]                                    ;; 00:0d53 $fa $e5 $c6
    adc  A, $00                                        ;; 00:0d56 $ce $00
    ld   HL, wCA04                                     ;; 00:0d58 $21 $04 $ca
    and  A, [HL]                                       ;; 00:0d5b $a6
    ld   B, A                                          ;; 00:0d5c $47
    ld   A, C                                          ;; 00:0d5d $79
    swap A                                             ;; 00:0d5e $cb $37
    and  A, $0f                                        ;; 00:0d60 $e6 $0f
    ld   C, A                                          ;; 00:0d62 $4f
    ld   HL, wD000                                     ;; 00:0d63 $21 $00 $d0
    ld   A, C                                          ;; 00:0d66 $79
    swap B                                             ;; 00:0d67 $cb $30
    or   A, B                                          ;; 00:0d69 $b0
    ld   C, A                                          ;; 00:0d6a $4f
    jr   jp_00_0db3                                    ;; 00:0d6b $18 $46

call_00_0d6d:
    ld   A, [wC6E6]                                    ;; 00:0d6d $fa $e6 $c6
    sub  A, $20                                        ;; 00:0d70 $d6 $20
    ld   E, A                                          ;; 00:0d72 $5f
    ld   A, [wC6E7]                                    ;; 00:0d73 $fa $e7 $c6
    sbc  A, $00                                        ;; 00:0d76 $de $00
    ld   D, A                                          ;; 00:0d78 $57
    ld   A, [wC6E4]                                    ;; 00:0d79 $fa $e4 $c6
    ld   C, A                                          ;; 00:0d7c $4f
    ld   A, [wC6E5]                                    ;; 00:0d7d $fa $e5 $c6
    ld   B, A                                          ;; 00:0d80 $47
    ld   A, C                                          ;; 00:0d81 $79
    swap A                                             ;; 00:0d82 $cb $37
    and  A, $0f                                        ;; 00:0d84 $e6 $0f
    ld   C, A                                          ;; 00:0d86 $4f
    ld   HL, wD000                                     ;; 00:0d87 $21 $00 $d0
    ld   A, C                                          ;; 00:0d8a $79
    swap B                                             ;; 00:0d8b $cb $30
    or   A, B                                          ;; 00:0d8d $b0
    ld   C, A                                          ;; 00:0d8e $4f
    jr   jp_00_0db3                                    ;; 00:0d8f $18 $22

call_00_0d91:
    ld   A, [wC6E6]                                    ;; 00:0d91 $fa $e6 $c6
    add  A, $b0                                        ;; 00:0d94 $c6 $b0
    ld   E, A                                          ;; 00:0d96 $5f
    ld   A, [wC6E7]                                    ;; 00:0d97 $fa $e7 $c6
    adc  A, $00                                        ;; 00:0d9a $ce $00
    ld   D, A                                          ;; 00:0d9c $57
    ld   A, [wC6E4]                                    ;; 00:0d9d $fa $e4 $c6
    ld   C, A                                          ;; 00:0da0 $4f
    ld   A, [wC6E5]                                    ;; 00:0da1 $fa $e5 $c6
    ld   B, A                                          ;; 00:0da4 $47
    ld   A, C                                          ;; 00:0da5 $79
    swap A                                             ;; 00:0da6 $cb $37
    and  A, $0f                                        ;; 00:0da8 $e6 $0f
    ld   C, A                                          ;; 00:0daa $4f
    ld   HL, wD000                                     ;; 00:0dab $21 $00 $d0
    ld   A, C                                          ;; 00:0dae $79
    swap B                                             ;; 00:0daf $cb $30
    or   A, B                                          ;; 00:0db1 $b0
    ld   C, A                                          ;; 00:0db2 $4f

jp_00_0db3:
    ld   B, $04                                        ;; 00:0db3 $06 $04
.jr_00_0db5:
    srl  D                                             ;; 00:0db5 $cb $3a
    rr   E                                             ;; 00:0db7 $cb $1b
    dec  B                                             ;; 00:0db9 $05
    jr   NZ, .jr_00_0db5                               ;; 00:0dba $20 $f9
    ld   A, [wCA07]                                    ;; 00:0dbc $fa $07 $ca
    dec  A                                             ;; 00:0dbf $3d
    ld   B, A                                          ;; 00:0dc0 $47
    ld   D, $00                                        ;; 00:0dc1 $16 $00
    ld   A, E                                          ;; 00:0dc3 $7b
    and  A, B                                          ;; 00:0dc4 $a0
    ld   E, A                                          ;; 00:0dc5 $5f
    add  HL, DE                                        ;; 00:0dc6 $19
    ld   A, C                                          ;; 00:0dc7 $79
    and  A, A                                          ;; 00:0dc8 $a7
    jr   Z, .jr_00_0dd5                                ;; 00:0dc9 $28 $0a
    ld   A, [wCA07]                                    ;; 00:0dcb $fa $07 $ca
    ld   E, A                                          ;; 00:0dce $5f
    ld   D, $00                                        ;; 00:0dcf $16 $00
.jr_00_0dd1:
    add  HL, DE                                        ;; 00:0dd1 $19
    dec  C                                             ;; 00:0dd2 $0d
    jr   NZ, .jr_00_0dd1                               ;; 00:0dd3 $20 $fc
.jr_00_0dd5:
    ld   A, L                                          ;; 00:0dd5 $7d
    ld   [wC801], A                                    ;; 00:0dd6 $ea $01 $c8
    ld   A, H                                          ;; 00:0dd9 $7c
    ld   HL, wCA06                                     ;; 00:0dda $21 $06 $ca
    and  A, [HL]                                       ;; 00:0ddd $a6
    or   A, $d0                                        ;; 00:0dde $f6 $d0
    ld   [wC802], A                                    ;; 00:0de0 $ea $02 $c8
    ret                                                ;; 00:0de3 $c9

call_00_0de4:
    ld   A, [wCA2A]                                    ;; 00:0de4 $fa $2a $ca
    ld   E, A                                          ;; 00:0de7 $5f
    ldh  A, [hFF91]                                    ;; 00:0de8 $f0 $91
    and  A, $f8                                        ;; 00:0dea $e6 $f8
    add  A, C                                          ;; 00:0dec $81
    srl  A                                             ;; 00:0ded $cb $3f
    srl  A                                             ;; 00:0def $cb $3f
    srl  A                                             ;; 00:0df1 $cb $3f
    ld   L, A                                          ;; 00:0df3 $6f
    ld   A, $98                                        ;; 00:0df4 $3e $98
    or   A, E                                          ;; 00:0df6 $b3
    ld   H, A                                          ;; 00:0df7 $67
    ld   D, $00                                        ;; 00:0df8 $16 $00
    ldh  A, [hFF92]                                    ;; 00:0dfa $f0 $92
    and  A, $f8                                        ;; 00:0dfc $e6 $f8
    add  A, B                                          ;; 00:0dfe $80
    sla  A                                             ;; 00:0dff $cb $27
    rl   D                                             ;; 00:0e01 $cb $12
    sla  A                                             ;; 00:0e03 $cb $27
    rl   D                                             ;; 00:0e05 $cb $12
    ld   E, A                                          ;; 00:0e07 $5f
    add  HL, DE                                        ;; 00:0e08 $19
    ret                                                ;; 00:0e09 $c9

call_00_0e0a:
    ld   HL, $4000                                     ;; 00:0e0a $21 $00 $40
    ld   A, [wCA17]                                    ;; 00:0e0d $fa $17 $ca
    jp   call_00_3741                                  ;; 00:0e10 $c3 $41 $37

call_00_0e13:
    ld   HL, $5acc                                     ;; 00:0e13 $21 $cc $5a
    ld   A, [wCA17]                                    ;; 00:0e16 $fa $17 $ca
    jp   call_00_3741                                  ;; 00:0e19 $c3 $41 $37

call_00_0e1c:
    ld   HL, data_07_4000                              ;; 00:0e1c $21 $00 $40
    ld   A, [wCurrentBank]                             ;; 00:0e1f $fa $b1 $c0
    cp   A, $08                                        ;; 00:0e22 $fe $08
    jr   NZ, .jr_00_0e2d                               ;; 00:0e24 $20 $07
    ld   A, [wCA15]                                    ;; 00:0e26 $fa $15 $ca
    sub  A, $10                                        ;; 00:0e29 $d6 $10
    jr   .jr_00_0e31                                   ;; 00:0e2b $18 $04
.jr_00_0e2d:
    ld   A, [wCA15]                                    ;; 00:0e2d $fa $15 $ca
    dec  A                                             ;; 00:0e30 $3d
.jr_00_0e31:
    jp   call_00_3741                                  ;; 00:0e31 $c3 $41 $37

call_00_0e34:
    call call_00_1d9e                                  ;; 00:0e34 $cd $9e $1d
    ld   A, $f0                                        ;; 00:0e37 $3e $f0
    ld   [wC803], A                                    ;; 00:0e39 $ea $03 $c8
    ld   [wC804], A                                    ;; 00:0e3c $ea $04 $c8
    call call_00_0d14                                  ;; 00:0e3f $cd $14 $0d
    xor  A, A                                          ;; 00:0e42 $af
    ld   [wC805], A                                    ;; 00:0e43 $ea $05 $c8
    ld   A, [wC801]                                    ;; 00:0e46 $fa $01 $c8
    ld   [wC806], A                                    ;; 00:0e49 $ea $06 $c8
    ld   A, [wC802]                                    ;; 00:0e4c $fa $02 $c8
    ld   [wC807], A                                    ;; 00:0e4f $ea $07 $c8
.jp_00_0e52:
    xor  A, A                                          ;; 00:0e52 $af
    ld   [wC800], A                                    ;; 00:0e53 $ea $00 $c8
    ld   A, [wC806]                                    ;; 00:0e56 $fa $06 $c8
    ld   [wC801], A                                    ;; 00:0e59 $ea $01 $c8
    ld   A, [wC807]                                    ;; 00:0e5c $fa $07 $c8
    ld   [wC802], A                                    ;; 00:0e5f $ea $02 $c8
.jr_00_0e62:
    ld   A, [wC801]                                    ;; 00:0e62 $fa $01 $c8
    ld   L, A                                          ;; 00:0e65 $6f
    ld   A, [wC802]                                    ;; 00:0e66 $fa $02 $c8
    ld   H, A                                          ;; 00:0e69 $67
    ld   A, [wCA2E]                                    ;; 00:0e6a $fa $2e $ca
    and  A, A                                          ;; 00:0e6d $a7
    jr   NZ, .jr_00_0e7c                               ;; 00:0e6e $20 $0c
    ld   E, [HL]                                       ;; 00:0e70 $5e
    sla  E                                             ;; 00:0e71 $cb $23
    sla  E                                             ;; 00:0e73 $cb $23
    ld   D, $00                                        ;; 00:0e75 $16 $00
    call call_01_5ea6                                  ;; 00:0e77 $cd $a6 $5e
    jr   .jr_00_0e84                                   ;; 00:0e7a $18 $08
.jr_00_0e7c:
    ld   A, [HL]                                       ;; 00:0e7c $7e
    and  A, $3f                                        ;; 00:0e7d $e6 $3f
    add  A, A                                          ;; 00:0e7f $87
    add  A, A                                          ;; 00:0e80 $87
    ld   E, A                                          ;; 00:0e81 $5f
    ld   D, $00                                        ;; 00:0e82 $16 $00
.jr_00_0e84:
    ld   A, $06                                        ;; 00:0e84 $3e $06
    rst  pushActiveBankSafe                            ;; 00:0e86 $e7
    call call_00_0e0a                                  ;; 00:0e87 $cd $0a $0e
    add  HL, DE                                        ;; 00:0e8a $19
    ld   E, L                                          ;; 00:0e8b $5d
    ld   D, H                                          ;; 00:0e8c $54
    ld   HL, wC880                                     ;; 00:0e8d $21 $80 $c8
    ld   A, [wC800]                                    ;; 00:0e90 $fa $00 $c8
    ld   C, A                                          ;; 00:0e93 $4f
    ld   B, $00                                        ;; 00:0e94 $06 $00
    add  HL, BC                                        ;; 00:0e96 $09
    ld   A, [DE]                                       ;; 00:0e97 $1a
    ld   [HL+], A                                      ;; 00:0e98 $22
    inc  DE                                            ;; 00:0e99 $13
    inc  DE                                            ;; 00:0e9a $13
    ld   A, [DE]                                       ;; 00:0e9b $1a
    ld   [HL], A                                       ;; 00:0e9c $77
    dec  DE                                            ;; 00:0e9d $1b
    ld   BC, $17                                       ;; 00:0e9e $01 $17 $00
    add  HL, BC                                        ;; 00:0ea1 $09
    ld   A, [DE]                                       ;; 00:0ea2 $1a
    ld   [HL+], A                                      ;; 00:0ea3 $22
    inc  DE                                            ;; 00:0ea4 $13
    inc  DE                                            ;; 00:0ea5 $13
    ld   A, [DE]                                       ;; 00:0ea6 $1a
    ld   [HL], A                                       ;; 00:0ea7 $77
    rst  popActiveBankSafe                             ;; 00:0ea8 $ef
    ld   A, [wCA07]                                    ;; 00:0ea9 $fa $07 $ca
    dec  A                                             ;; 00:0eac $3d
    xor  A, $ff                                        ;; 00:0ead $ee $ff
    ld   B, A                                          ;; 00:0eaf $47
    ld   A, [wC801]                                    ;; 00:0eb0 $fa $01 $c8
    and  A, B                                          ;; 00:0eb3 $a0
    ld   C, A                                          ;; 00:0eb4 $4f
    ld   A, [wCA07]                                    ;; 00:0eb5 $fa $07 $ca
    dec  A                                             ;; 00:0eb8 $3d
    ld   B, A                                          ;; 00:0eb9 $47
    ld   A, [wC801]                                    ;; 00:0eba $fa $01 $c8
    add  A, $01                                        ;; 00:0ebd $c6 $01
    and  A, B                                          ;; 00:0ebf $a0
    or   A, C                                          ;; 00:0ec0 $b1
    ld   [wC801], A                                    ;; 00:0ec1 $ea $01 $c8
    ld   A, [wC800]                                    ;; 00:0ec4 $fa $00 $c8
    add  A, $02                                        ;; 00:0ec7 $c6 $02
    ld   [wC800], A                                    ;; 00:0ec9 $ea $00 $c8
    cp   A, $18                                        ;; 00:0ecc $fe $18
    jr   NZ, .jr_00_0e62                               ;; 00:0ece $20 $92
    ld   DE, wC880                                     ;; 00:0ed0 $11 $80 $c8
.jr_00_0ed3:
    ld   A, [wC803]                                    ;; 00:0ed3 $fa $03 $c8
    ld   C, A                                          ;; 00:0ed6 $4f
    ld   A, [wC804]                                    ;; 00:0ed7 $fa $04 $c8
    ld   B, A                                          ;; 00:0eda $47
    push DE                                            ;; 00:0edb $d5
    call call_00_0de4                                  ;; 00:0edc $cd $e4 $0d
    pop  DE                                            ;; 00:0edf $d1
.jr_00_0ee0:
    ldh  A, [rLY]                                      ;; 00:0ee0 $f0 $44
    ld   B, A                                          ;; 00:0ee2 $47
    ldh  A, [rLYC]                                     ;; 00:0ee3 $f0 $45
    sub  A, B                                          ;; 00:0ee5 $90
    cp   A, $03                                        ;; 00:0ee6 $fe $03
    jr   C, .jr_00_0ee0                                ;; 00:0ee8 $38 $f6
    ld   B, $18                                        ;; 00:0eea $06 $18
.jr_00_0eec:
    ldh  A, [rSTAT]                                    ;; 00:0eec $f0 $41
    and  A, $03                                        ;; 00:0eee $e6 $03
    jr   Z, .jr_00_0eec                                ;; 00:0ef0 $28 $fa
    call call_00_3a78                                  ;; 00:0ef2 $cd $78 $3a
    ld   A, [DE]                                       ;; 00:0ef5 $1a
    ld   [HL], A                                       ;; 00:0ef6 $77
    inc  DE                                            ;; 00:0ef7 $13
    ld   A, L                                          ;; 00:0ef8 $7d
    and  A, $e0                                        ;; 00:0ef9 $e6 $e0
    ld   C, A                                          ;; 00:0efb $4f
    ld   A, L                                          ;; 00:0efc $7d
    add  A, $01                                        ;; 00:0efd $c6 $01
    and  A, $1f                                        ;; 00:0eff $e6 $1f
    or   A, C                                          ;; 00:0f01 $b1
    ld   L, A                                          ;; 00:0f02 $6f
    dec  B                                             ;; 00:0f03 $05
    jr   NZ, .jr_00_0eec                               ;; 00:0f04 $20 $e6
    ld   A, [wC804]                                    ;; 00:0f06 $fa $04 $c8
    add  A, $08                                        ;; 00:0f09 $c6 $08
    ld   [wC804], A                                    ;; 00:0f0b $ea $04 $c8
    and  A, $0f                                        ;; 00:0f0e $e6 $0f
    jr   NZ, .jr_00_0ed3                               ;; 00:0f10 $20 $c1
    ld   A, [wCA07]                                    ;; 00:0f12 $fa $07 $ca
    ld   B, A                                          ;; 00:0f15 $47
    ld   A, [wC806]                                    ;; 00:0f16 $fa $06 $c8
    add  A, B                                          ;; 00:0f19 $80
    ld   [wC806], A                                    ;; 00:0f1a $ea $06 $c8
    ld   A, [wC807]                                    ;; 00:0f1d $fa $07 $c8
    adc  A, $00                                        ;; 00:0f20 $ce $00
    ld   HL, wCA06                                     ;; 00:0f22 $21 $06 $ca
    and  A, [HL]                                       ;; 00:0f25 $a6
    or   A, $d0                                        ;; 00:0f26 $f6 $d0
    ld   [wC807], A                                    ;; 00:0f28 $ea $07 $c8
    ld   A, [wC805]                                    ;; 00:0f2b $fa $05 $c8
    add  A, $01                                        ;; 00:0f2e $c6 $01
    ld   [wC805], A                                    ;; 00:0f30 $ea $05 $c8
    cp   A, $0b                                        ;; 00:0f33 $fe $0b
    jp   NZ, .jp_00_0e52                               ;; 00:0f35 $c2 $52 $0e
    xor  A, A                                          ;; 00:0f38 $af
    ld   [wCA2A], A                                    ;; 00:0f39 $ea $2a $ca
    ld   [wCA2E], A                                    ;; 00:0f3c $ea $2e $ca
    jp   call_00_1dfd                                  ;; 00:0f3f $c3 $fd $1d

call_00_0f42:
    ld   HL, wC100                                     ;; 00:0f42 $21 $00 $c1
    ld   DE, $9c00                                     ;; 00:0f45 $11 $00 $9c
    ld   BC, $400                                      ;; 00:0f48 $01 $00 $04
    rst  rst_00_0018                                   ;; 00:0f4b $df
    db   $01                                           ;; 00:0f4c .
    ld   A, $07                                        ;; 00:0f4d $3e $07
    rst  pushActiveBankSafe                            ;; 00:0f4f $e7
    ld   A, [wCA15]                                    ;; 00:0f50 $fa $15 $ca
    ld   HL, $7ea0                                     ;; 00:0f53 $21 $a0 $7e
    rst  add_hl_a                                      ;; 00:0f56 $c7
    ld   A, [HL]                                       ;; 00:0f57 $7e
    ld   [wCA07], A                                    ;; 00:0f58 $ea $07 $ca
    rst  popActiveBankSafe                             ;; 00:0f5b $ef
    ld   HL, wCA15                                     ;; 00:0f5c $21 $15 $ca
    inc  [HL]                                          ;; 00:0f5f $34
    call call_00_0e1c                                  ;; 00:0f60 $cd $1c $0e
    ld   D, H                                          ;; 00:0f63 $54
    ld   E, L                                          ;; 00:0f64 $5d
    ld   HL, wCA15                                     ;; 00:0f65 $21 $15 $ca
    dec  [HL]                                          ;; 00:0f68 $35
    call call_00_0e1c                                  ;; 00:0f69 $cd $1c $0e
    ld   BC, wC100                                     ;; 00:0f6c $01 $00 $c1
    call call_00_3d76                                  ;; 00:0f6f $cd $76 $3d
    ld   A, $07                                        ;; 00:0f72 $3e $07
    rst  pushActiveBankSafe                            ;; 00:0f74 $e7
    ld   A, [wCA15]                                    ;; 00:0f75 $fa $15 $ca
    add  A, A                                          ;; 00:0f78 $87
    ld   HL, $7ec0                                     ;; 00:0f79 $21 $c0 $7e
    rst  add_hl_a                                      ;; 00:0f7c $c7
    ld   A, [HL+]                                      ;; 00:0f7d $2a
    ld   C, A                                          ;; 00:0f7e $4f
    ld   B, [HL]                                       ;; 00:0f7f $46
    dec  BC                                            ;; 00:0f80 $0b
    ld   A, B                                          ;; 00:0f81 $78
    ld   [wCA06], A                                    ;; 00:0f82 $ea $06 $ca
    rst  popActiveBankSafe                             ;; 00:0f85 $ef
    inc  BC                                            ;; 00:0f86 $03
    ld   DE, wD000                                     ;; 00:0f87 $11 $00 $d0
    ld   HL, wC100                                     ;; 00:0f8a $21 $00 $c1
    srl  B                                             ;; 00:0f8d $cb $38
    rr   C                                             ;; 00:0f8f $cb $19
    srl  B                                             ;; 00:0f91 $cb $38
    rr   C                                             ;; 00:0f93 $cb $19
.jr_00_0f95:
    push HL                                            ;; 00:0f95 $e5
    push DE                                            ;; 00:0f96 $d5
    push BC                                            ;; 00:0f97 $c5
    push HL                                            ;; 00:0f98 $e5
    ld   HL, $4022                                     ;; 00:0f99 $21 $22 $40
    ld   A, [wCurrentBank]                             ;; 00:0f9c $fa $b1 $c0
    cp   A, $08                                        ;; 00:0f9f $fe $08
    jr   NZ, .jr_00_0faa                               ;; 00:0fa1 $20 $07
    ld   A, [wCA15]                                    ;; 00:0fa3 $fa $15 $ca
    sub  A, $10                                        ;; 00:0fa6 $d6 $10
    jr   .jr_00_0fae                                   ;; 00:0fa8 $18 $04
.jr_00_0faa:
    ld   A, [wCA15]                                    ;; 00:0faa $fa $15 $ca
    dec  A                                             ;; 00:0fad $3d
.jr_00_0fae:
    call call_00_3741                                  ;; 00:0fae $cd $41 $37
    ld   C, L                                          ;; 00:0fb1 $4d
    ld   B, H                                          ;; 00:0fb2 $44
    pop  HL                                            ;; 00:0fb3 $e1
    ld   L, [HL]                                       ;; 00:0fb4 $6e
    ld   H, $00                                        ;; 00:0fb5 $26 $00
    add  HL, HL                                        ;; 00:0fb7 $29
    add  HL, HL                                        ;; 00:0fb8 $29
    add  HL, BC                                        ;; 00:0fb9 $09
    pop  BC                                            ;; 00:0fba $c1
    ld   A, [HL+]                                      ;; 00:0fbb $2a
    ld   [DE], A                                       ;; 00:0fbc $12
    inc  HL                                            ;; 00:0fbd $23
    inc  DE                                            ;; 00:0fbe $13
    ld   A, [HL+]                                      ;; 00:0fbf $2a
    ld   [DE], A                                       ;; 00:0fc0 $12
    push HL                                            ;; 00:0fc1 $e5
    ld   HL, wCA07                                     ;; 00:0fc2 $21 $07 $ca
    ld   A, E                                          ;; 00:0fc5 $7b
    add  A, [HL]                                       ;; 00:0fc6 $86
    ld   E, A                                          ;; 00:0fc7 $5f
    ld   A, D                                          ;; 00:0fc8 $7a
    adc  A, $00                                        ;; 00:0fc9 $ce $00
    ld   D, A                                          ;; 00:0fcb $57
    pop  HL                                            ;; 00:0fcc $e1
    ld   A, [HL-]                                      ;; 00:0fcd $3a
    ld   [DE], A                                       ;; 00:0fce $12
    dec  HL                                            ;; 00:0fcf $2b
    dec  DE                                            ;; 00:0fd0 $1b
    ld   A, [HL]                                       ;; 00:0fd1 $7e
    ld   [DE], A                                       ;; 00:0fd2 $12
    pop  DE                                            ;; 00:0fd3 $d1
    pop  HL                                            ;; 00:0fd4 $e1
    inc  HL                                            ;; 00:0fd5 $23
    inc  DE                                            ;; 00:0fd6 $13
    inc  DE                                            ;; 00:0fd7 $13
    push HL                                            ;; 00:0fd8 $e5
    ld   A, [wCA07]                                    ;; 00:0fd9 $fa $07 $ca
    dec  A                                             ;; 00:0fdc $3d
    ld   L, A                                          ;; 00:0fdd $6f
    inc  A                                             ;; 00:0fde $3c
    ld   H, A                                          ;; 00:0fdf $67
    ld   A, E                                          ;; 00:0fe0 $7b
    and  A, L                                          ;; 00:0fe1 $a5
    jr   NZ, .jr_00_0feb                               ;; 00:0fe2 $20 $07
    ld   A, E                                          ;; 00:0fe4 $7b
    add  A, H                                          ;; 00:0fe5 $84
    ld   E, A                                          ;; 00:0fe6 $5f
    ld   A, D                                          ;; 00:0fe7 $7a
    adc  A, $00                                        ;; 00:0fe8 $ce $00
    ld   D, A                                          ;; 00:0fea $57
.jr_00_0feb:
    pop  HL                                            ;; 00:0feb $e1
    dec  BC                                            ;; 00:0fec $0b
    ld   A, C                                          ;; 00:0fed $79
    or   A, B                                          ;; 00:0fee $b0
    jr   NZ, .jr_00_0f95                               ;; 00:0fef $20 $a4
    ld   HL, $9c00                                     ;; 00:0ff1 $21 $00 $9c
    ld   DE, wC100                                     ;; 00:0ff4 $11 $00 $c1
    ld   BC, $400                                      ;; 00:0ff7 $01 $00 $04
    rst  rst_00_0018                                   ;; 00:0ffa $df
    db   $01                                           ;; 00:0ffb .
    ret                                                ;; 00:0ffc $c9

call_00_0ffd:
    call call_00_0181                                  ;; 00:0ffd $cd $81 $01
    ld   A, [wC805]                                    ;; 00:1000 $fa $05 $c8
    cp   A, $eb                                        ;; 00:1003 $fe $eb
    ret  Z                                             ;; 00:1005 $c8
    and  A, $c0                                        ;; 00:1006 $e6 $c0
    cp   A, $c0                                        ;; 00:1008 $fe $c0
    jr   Z, jp_00_101f                                 ;; 00:100a $28 $13
    ld   A, [wC805]                                    ;; 00:100c $fa $05 $c8
    and  A, $c0                                        ;; 00:100f $e6 $c0
    cp   A, $80                                        ;; 00:1011 $fe $80
    ret  Z                                             ;; 00:1013 $c8
    ld   A, [wC805]                                    ;; 00:1014 $fa $05 $c8
    ld   B, A                                          ;; 00:1017 $47
    ld   A, [wC804]                                    ;; 00:1018 $fa $04 $c8
    and  A, $47                                        ;; 00:101b $e6 $47
    and  A, B                                          ;; 00:101d $a0
    ret                                                ;; 00:101e $c9

jp_00_101f:
    ld   A, $ff                                        ;; 00:101f $3e $ff
    bit  0, A                                          ;; 00:1021 $cb $47
    ret                                                ;; 00:1023 $c9

call_00_1024:
    call call_00_0181                                  ;; 00:1024 $cd $81 $01
    ld   A, [wC805]                                    ;; 00:1027 $fa $05 $c8
    cp   A, $eb                                        ;; 00:102a $fe $eb
    jr   Z, jp_00_101f                                 ;; 00:102c $28 $f1
    and  A, $c0                                        ;; 00:102e $e6 $c0
    cp   A, $c0                                        ;; 00:1030 $fe $c0
    ret  Z                                             ;; 00:1032 $c8
    ld   A, [wC805]                                    ;; 00:1033 $fa $05 $c8
    and  A, $c0                                        ;; 00:1036 $e6 $c0
    cp   A, $80                                        ;; 00:1038 $fe $80
    ret  Z                                             ;; 00:103a $c8
    ld   A, [wC6E8]                                    ;; 00:103b $fa $e8 $c6
    cp   A, $06                                        ;; 00:103e $fe $06
    jr   NC, .jr_00_1049                               ;; 00:1040 $30 $07
    ld   A, [wC6E3]                                    ;; 00:1042 $fa $e3 $c6
    cp   A, $02                                        ;; 00:1045 $fe $02
    jr   Z, .jr_00_1058                                ;; 00:1047 $28 $0f
.jr_00_1049:
    ld   A, [wC805]                                    ;; 00:1049 $fa $05 $c8
    ld   B, A                                          ;; 00:104c $47
    ld   A, [wC804]                                    ;; 00:104d $fa $04 $c8
    and  A, $47                                        ;; 00:1050 $e6 $47
    and  A, B                                          ;; 00:1052 $a0
    ld   HL, wCA0F                                     ;; 00:1053 $21 $0f $ca
    and  A, [HL]                                       ;; 00:1056 $a6
    ret                                                ;; 00:1057 $c9
.jr_00_1058:
    ld   A, [wC805]                                    ;; 00:1058 $fa $05 $c8
    and  A, $40                                        ;; 00:105b $e6 $40
    cp   A, $40                                        ;; 00:105d $fe $40
    ret                                                ;; 00:105f $c9

call_00_1060:
    call $4dff                                         ;; 00:1060 $cd $ff $4d
    ld   A, [DE]                                       ;; 00:1063 $1a
    ld   [wC806], A                                    ;; 00:1064 $ea $06 $c8
    and  A, $3f                                        ;; 00:1067 $e6 $3f
    ld   E, A                                          ;; 00:1069 $5f
    ld   D, $00                                        ;; 00:106a $16 $00
    ld   A, $06                                        ;; 00:106c $3e $06
    rst  pushActiveBankSafe                            ;; 00:106e $e7
    call call_00_0e13                                  ;; 00:106f $cd $13 $0e
    add  HL, DE                                        ;; 00:1072 $19
    ld   A, [HL]                                       ;; 00:1073 $7e
    ld   [wC805], A                                    ;; 00:1074 $ea $05 $c8
    rst  popActiveBankSafe                             ;; 00:1077 $ef
    call $4ee1                                         ;; 00:1078 $cd $e1 $4e
    ld   A, [wC805]                                    ;; 00:107b $fa $05 $c8
    and  A, $c0                                        ;; 00:107e $e6 $c0
    cp   A, $c0                                        ;; 00:1080 $fe $c0
    ret  Z                                             ;; 00:1082 $c8
    ld   A, [wC805]                                    ;; 00:1083 $fa $05 $c8
    and  A, $c0                                        ;; 00:1086 $e6 $c0
    cp   A, $80                                        ;; 00:1088 $fe $80
    ret  Z                                             ;; 00:108a $c8
    ld   A, [wC805]                                    ;; 00:108b $fa $05 $c8
    ret                                                ;; 00:108e $c9

call_00_108f:
    ld   A, [wC6F2]                                    ;; 00:108f $fa $f2 $c6
    and  A, A                                          ;; 00:1092 $a7
    ret  Z                                             ;; 00:1093 $c8
    ld_long_load A, hFF93                              ;; 00:1094 $fa $93 $ff
    and  A, $01                                        ;; 00:1097 $e6 $01
    ret  NZ                                            ;; 00:1099 $c0
    ld_long_load A, hFF93                              ;; 00:109a $fa $93 $ff
    rr   A                                             ;; 00:109d $cb $1f
    and  A, $03                                        ;; 00:109f $e6 $03
    ld   B, A                                          ;; 00:10a1 $47
    ld   HL, $10be                                     ;; 00:10a2 $21 $be $10
    rst  add_hl_a                                      ;; 00:10a5 $c7
    ldh  A, [hFF92]                                    ;; 00:10a6 $f0 $92
    add  A, $10                                        ;; 00:10a8 $c6 $10
    add  A, [HL]                                       ;; 00:10aa $86
    ldh  [rSCY], A                                     ;; 00:10ab $e0 $42
    ld   A, B                                          ;; 00:10ad $78
    ld   HL, $10ba                                     ;; 00:10ae $21 $ba $10
    rst  add_hl_a                                      ;; 00:10b1 $c7
    ldh  A, [hFF91]                                    ;; 00:10b2 $f0 $91
    add  A, $08                                        ;; 00:10b4 $c6 $08
    add  A, [HL]                                       ;; 00:10b6 $86
    ldh  [rSCX], A                                     ;; 00:10b7 $e0 $43
    ret                                                ;; 00:10b9 $c9
    db   $02, $02, $fe, $fe, $fe, $02, $fe, $02        ;; 00:10ba ????????

call_00_10c2:
    nop                                                ;; 00:10c2 $00
    ld   A, $01                                        ;; 00:10c3 $3e $01
    rst  pushActiveBankSafe                            ;; 00:10c5 $e7
    call call_00_10d7                                  ;; 00:10c6 $cd $d7 $10
    ld   A, [wCA2D]                                    ;; 00:10c9 $fa $2d $ca
    call call_00_10f5                                  ;; 00:10cc $cd $f5 $10
    call call_00_1126                                  ;; 00:10cf $cd $26 $11
    call call_00_1151                                  ;; 00:10d2 $cd $51 $11
    rst  popActiveBankSafe                             ;; 00:10d5 $ef
    ret                                                ;; 00:10d6 $c9

call_00_10d7:
    ldh  A, [hCurrentMusic]                            ;; 00:10d7 $f0 $ba
    ldh  [hFFA0], A                                    ;; 00:10d9 $e0 $a0
    xor  A, A                                          ;; 00:10db $af
    ldh  [hCurrentMusic], A                            ;; 00:10dc $e0 $ba
    call call_00_3a60                                  ;; 00:10de $cd $60 $3a
    ld   A, $01                                        ;; 00:10e1 $3e $01
    rst  pushActiveBankSafe                            ;; 00:10e3 $e7
    ld   A, $36                                        ;; 00:10e4 $3e $36
    ldh  [hSFX], A                                     ;; 00:10e6 $e0 $bc
    call call_00_3a60                                  ;; 00:10e8 $cd $60 $3a
    ld   A, $31                                        ;; 00:10eb $3e $31
    call call_00_3cb2                                  ;; 00:10ed $cd $b2 $3c
    call C, call_01_5eb8                               ;; 00:10f0 $dc $b8 $5e
    rst  popActiveBankSafe                             ;; 00:10f3 $ef
    ret                                                ;; 00:10f4 $c9

call_00_10f5:
    push AF                                            ;; 00:10f5 $f5
    ld   A, $03                                        ;; 00:10f6 $3e $03
    rst  pushActiveBankSafe                            ;; 00:10f8 $e7
    pop  AF                                            ;; 00:10f9 $f1
    call call_00_1186                                  ;; 00:10fa $cd $86 $11
    ld   D, $00                                        ;; 00:10fd $16 $00
    ld   HL, $07                                       ;; 00:10ff $21 $07 $00
    call call_00_1c7e                                  ;; 00:1102 $cd $7e $1c
    ld   HL, $76c2                                     ;; 00:1105 $21 $c2 $76
    add  HL, DE                                        ;; 00:1108 $19
    push HL                                            ;; 00:1109 $e5
    call call_00_39d5                                  ;; 00:110a $cd $d5 $39
    ld   HL, $76bc                                     ;; 00:110d $21 $bc $76
    ld   C, $00                                        ;; 00:1110 $0e $00
    ld   B, $06                                        ;; 00:1112 $06 $06
.jr_00_1114:
    cp   A, [HL]                                       ;; 00:1114 $be
    jr   NC, .jr_00_111c                               ;; 00:1115 $30 $05
    inc  HL                                            ;; 00:1117 $23
    inc  C                                             ;; 00:1118 $0c
    dec  B                                             ;; 00:1119 $05
    jr   NZ, .jr_00_1114                               ;; 00:111a $20 $f8
.jr_00_111c:
    pop  HL                                            ;; 00:111c $e1
    ld   B, $00                                        ;; 00:111d $06 $00
    add  HL, BC                                        ;; 00:111f $09
    ld   L, [HL]                                       ;; 00:1120 $6e
    ld   A, L                                          ;; 00:1121 $7d
    ldh  [hFFCA], A                                    ;; 00:1122 $e0 $ca
    rst  popActiveBankSafe                             ;; 00:1124 $ef
    ret                                                ;; 00:1125 $c9

call_00_1126:
    ld   A, $01                                        ;; 00:1126 $3e $01
    ld   [wCA14], A                                    ;; 00:1128 $ea $14 $ca
    res  7, L                                          ;; 00:112b $cb $bd
    ld   H, $00                                        ;; 00:112d $26 $00
    ld   DE, $05                                       ;; 00:112f $11 $05 $00
    call call_00_1c7e                                  ;; 00:1132 $cd $7e $1c
    ld   HL, $758b                                     ;; 00:1135 $21 $8b $75
    add  HL, DE                                        ;; 00:1138 $19
    ld   B, $05                                        ;; 00:1139 $06 $05
    ld   DE, wCC59                                     ;; 00:113b $11 $59 $cc
    rst  rst_00_0018                                   ;; 00:113e $df
    db   $b3                                           ;; 00:113f .
    call call_00_1d62                                  ;; 00:1140 $cd $62 $1d
    ldh  A, [hFFCA]                                    ;; 00:1143 $f0 $ca
    ld   L, A                                          ;; 00:1145 $6f
    ld   A, [wCEDA]                                    ;; 00:1146 $fa $da $ce
    inc  A                                             ;; 00:1149 $3c
    jr   Z, call_00_1126                               ;; 00:114a $28 $da
    xor  A, A                                          ;; 00:114c $af
    ld   [wCA14], A                                    ;; 00:114d $ea $14 $ca
    ret                                                ;; 00:1150 $c9

call_00_1151:
    xor  A, A                                          ;; 00:1151 $af
    ldh  [hCurrentMusic], A                            ;; 00:1152 $e0 $ba
    ld   [wCA2C], A                                    ;; 00:1154 $ea $2c $ca
    ld   A, [wCA15]                                    ;; 00:1157 $fa $15 $ca
    and  A, A                                          ;; 00:115a $a7
    jr   NZ, .jr_00_115d                               ;; 00:115b $20 $00
.jr_00_115d:
    cp   A, $10                                        ;; 00:115d $fe $10
    jr   C, .jr_00_1165                                ;; 00:115f $38 $04
    ld   A, $08                                        ;; 00:1161 $3e $08
    jr   .jr_00_1167                                   ;; 00:1163 $18 $02
.jr_00_1165:
    ld   A, $07                                        ;; 00:1165 $3e $07
.jr_00_1167:
    rst  pushActiveBankSafe                            ;; 00:1167 $e7
    call call_00_0f42                                  ;; 00:1168 $cd $42 $0f
    rst  popActiveBankSafe                             ;; 00:116b $ef
    ld   A, $0b                                        ;; 00:116c $3e $0b
    rst  pushActiveBankSafe                            ;; 00:116e $e7
    call $78f5                                         ;; 00:116f $cd $f5 $78
    rst  popActiveBankSafe                             ;; 00:1172 $ef
    ldh  A, [hFFA0]                                    ;; 00:1173 $f0 $a0
    ldh  [hCurrentMusic], A                            ;; 00:1175 $e0 $ba
    call call_00_0150                                  ;; 00:1177 $cd $50 $01
    call call_00_0e34                                  ;; 00:117a $cd $34 $0e
    call call_00_01a0                                  ;; 00:117d $cd $a0 $01
    call call_00_3d2b                                  ;; 00:1180 $cd $2b $3d
    jp   call_00_3a0c                                  ;; 00:1183 $c3 $0c $3a

call_00_1186:
    ld   E, A                                          ;; 00:1186 $5f
    ld   A, [wC6E3]                                    ;; 00:1187 $fa $e3 $c6
    cp   A, $01                                        ;; 00:118a $fe $01
    jr   Z, .jr_00_1198                                ;; 00:118c $28 $0a
    cp   A, $02                                        ;; 00:118e $fe $02
    jr   Z, .jr_00_1197                                ;; 00:1190 $28 $05
    cp   A, $04                                        ;; 00:1192 $fe $04
    jr   NC, .jr_00_1198                               ;; 00:1194 $30 $02
    ret                                                ;; 00:1196 $c9
.jr_00_1197:
    inc  E                                             ;; 00:1197 $1c
.jr_00_1198:
    inc  E                                             ;; 00:1198 $1c
    ret                                                ;; 00:1199 $c9
    db   $00, $03, $04, $05, $06, $07, $08, $09        ;; 00:119a .??.????
    di                                                 ;; 00:11a2 $f3
    push AF                                            ;; 00:11a3 $f5
    push BC                                            ;; 00:11a4 $c5
    push DE                                            ;; 00:11a5 $d5
    push HL                                            ;; 00:11a6 $e5
    ld   A, [wCD39]                                    ;; 00:11a7 $fa $39 $cd
    or   A, A                                          ;; 00:11aa $b7
    call Z, hFF80                                      ;; 00:11ab $cc $80 $ff
    call call_00_36f1                                  ;; 00:11ae $cd $f1 $36
    ldh  A, [hFF8A]                                    ;; 00:11b1 $f0 $8a
    and  A, $f0                                        ;; 00:11b3 $e6 $f0
    jr   NZ, .jr_00_11bb                               ;; 00:11b5 $20 $04
    xor  A, A                                          ;; 00:11b7 $af
    ld   [wCA26], A                                    ;; 00:11b8 $ea $26 $ca
.jr_00_11bb:
    ldh  A, [hFF95]                                    ;; 00:11bb $f0 $95
    and  A, A                                          ;; 00:11bd $a7
    jr   Z, .jr_00_11d6                                ;; 00:11be $28 $16
    ld   HL, hFF95                                     ;; 00:11c0 $21 $95 $ff
    dec  [HL]                                          ;; 00:11c3 $35
    ld   HL, wC100                                     ;; 00:11c4 $21 $00 $c1
    call call_00_3757                                  ;; 00:11c7 $cd $57 $37
    xor  A, A                                          ;; 00:11ca $af
    ld   [wC100], A                                    ;; 00:11cb $ea $00 $c1
    ld   HL, hFF93                                     ;; 00:11ce $21 $93 $ff
    inc  [HL]                                          ;; 00:11d1 $34
    jr   NZ, .jr_00_11d6                               ;; 00:11d2 $20 $02
    inc  HL                                            ;; 00:11d4 $23
    inc  [HL]                                          ;; 00:11d5 $34
.jr_00_11d6:
    call call_00_3d2b                                  ;; 00:11d6 $cd $2b $3d
    call call_00_108f                                  ;; 00:11d9 $cd $8f $10
    call call_00_1f3a                                  ;; 00:11dc $cd $3a $1f
    pop  HL                                            ;; 00:11df $e1
    pop  DE                                            ;; 00:11e0 $d1
    pop  BC                                            ;; 00:11e1 $c1
    pop  AF                                            ;; 00:11e2 $f1
    reti                                               ;; 00:11e3 $d9
    db   $f3, $f5, $c5, $d5, $e5, $cd, $80, $ff        ;; 00:11e4 ????????
    db   $fa, $24, $ca, $47, $fa, $22, $ca, $80        ;; 00:11ec ????????
    db   $ea, $22, $ca, $28, $06, $fe, $90, $28        ;; 00:11f4 ????????
    db   $02, $18, $05, $3e, $01, $ea, $25, $ca        ;; 00:11fc ????????
    db   $f0, $95, $a7, $28, $0c, $21, $95, $ff        ;; 00:1204 ????????
    db   $35, $21, $93, $ff, $34, $20, $02, $23        ;; 00:120c ????????
    db   $34, $cd, $2b, $3d, $cd, $3a, $1f, $18        ;; 00:1214 ????????
    db   $c2, $f5, $c5, $d5, $e5, $fa, $22, $ca        ;; 00:121c ????????
    db   $47, $fa, $23, $ca, $80, $ea, $23, $ca        ;; 00:1224 ????????
    db   $30, $05, $f0, $42, $3d, $e0, $42, $c3        ;; 00:122c ????????
    db   $df, $11                                      ;; 00:1234 ??

call_00_1236:
    ld   A, [wCD3D]                                    ;; 00:1236 $fa $3d $cd
    push AF                                            ;; 00:1239 $f5
    xor  A, A                                          ;; 00:123a $af
    ld   [wCD3D], A                                    ;; 00:123b $ea $3d $cd
    ld   A, [wCA29]                                    ;; 00:123e $fa $29 $ca
    and  A, $3f                                        ;; 00:1241 $e6 $3f
    ld   HL, $12ca                                     ;; 00:1243 $21 $ca $12
    push HL                                            ;; 00:1246 $e5
    call doJumptable                                   ;; 00:1247 $cd $3a $37
;@jumptable amount=63
    dw   call_00_13f1                                  ;; 00:124a pP $00
    dw   call_00_13f1                                  ;; 00:124c ?? $01
    dw   call_00_13ac                                  ;; 00:124e ?? $02
    dw   call_00_13ac                                  ;; 00:1250 ?? $03
    dw   call_00_14aa                                  ;; 00:1252 ?? $04
    dw   call_00_14aa                                  ;; 00:1254 ?? $05
    dw   call_00_12db                                  ;; 00:1256 ?? $06
    dw   call_00_12db                                  ;; 00:1258 ?? $07
    dw   call_00_14b2                                  ;; 00:125a ?? $08
    dw   call_00_14b2                                  ;; 00:125c ?? $09
    dw   call_00_13a8                                  ;; 00:125e ?? $0a
    dw   call_00_14a5                                  ;; 00:1260 ?? $0b
    dw   call_00_14a5                                  ;; 00:1262 ?? $0c
    dw   call_00_1384                                  ;; 00:1264 pP $0d
    dw   call_00_1389                                  ;; 00:1266 pP $0e
    dw   call_00_13a0                                  ;; 00:1268 pP $0f
    dw   call_00_14c0                                  ;; 00:126a pP $10
    dw   call_00_1969                                  ;; 00:126c pP $11
    dw   call_00_16b9                                  ;; 00:126e pP $12
    dw   call_00_15d3                                  ;; 00:1270 ?? $13
    dw   call_00_1992                                  ;; 00:1272 ?? $14
    dw   call_00_1992                                  ;; 00:1274 ?? $15
    dw   call_00_1993                                  ;; 00:1276 ?? $16
    dw   call_00_19ae                                  ;; 00:1278 ?? $17
    dw   call_00_1a02                                  ;; 00:127a pP $18
    dw   call_00_1992                                  ;; 00:127c ?? $19
    dw   call_00_1992                                  ;; 00:127e ?? $1a
    dw   call_00_19d0                                  ;; 00:1280 pP $1b
    dw   call_00_1a28                                  ;; 00:1282 pP $1c
    dw   call_00_1a2e                                  ;; 00:1284 pP $1d
    dw   call_00_12dc                                  ;; 00:1286 ?? $1e
    dw   call_00_137c                                  ;; 00:1288 ?? $1f
    dw   call_00_1a34                                  ;; 00:128a ?? $20
    dw   call_00_1a6d                                  ;; 00:128c ?? $21
    dw   call_00_1a84                                  ;; 00:128e pP $22
    dw   call_00_19b8                                  ;; 00:1290 ?? $23
    dw   call_00_1a7f                                  ;; 00:1292 ?? $24
    dw   call_00_1a95                                  ;; 00:1294 pP $25
    dw   call_00_1b0a                                  ;; 00:1296 pP $26
    dw   call_00_1b12                                  ;; 00:1298 pP $27
    dw   call_00_1b1e                                  ;; 00:129a pP $28
    dw   call_00_1bcf                                  ;; 00:129c ?? $29
    dw   call_00_1bd7                                  ;; 00:129e ?? $2a
    dw   call_00_1be4                                  ;; 00:12a0 ?? $2b
    dw   call_00_1bc1                                  ;; 00:12a2 ?? $2c
    dw   call_00_12db                                  ;; 00:12a4 ?? $2d
    dw   call_00_12db                                  ;; 00:12a6 ?? $2e
    dw   call_00_13a0                                  ;; 00:12a8 ?? $2f
    dw   call_00_12db                                  ;; 00:12aa ?? $30
    dw   call_00_12db                                  ;; 00:12ac ?? $31
    dw   call_00_12db                                  ;; 00:12ae ?? $32
    dw   call_00_12db                                  ;; 00:12b0 ?? $33
    dw   call_00_12db                                  ;; 00:12b2 ?? $34
    dw   call_00_12db                                  ;; 00:12b4 ?? $35
    dw   call_00_12db                                  ;; 00:12b6 ?? $36
    dw   call_00_12db                                  ;; 00:12b8 ?? $37
    dw   call_00_12db                                  ;; 00:12ba ?? $38
    dw   call_00_12db                                  ;; 00:12bc ?? $39
    dw   call_00_12db                                  ;; 00:12be ?? $3a
    dw   call_00_12db                                  ;; 00:12c0 ?? $3b
    dw   call_00_12db                                  ;; 00:12c2 ?? $3c
    dw   call_00_12db                                  ;; 00:12c4 ?? $3d
    dw   call_00_12db                                  ;; 00:12c6 ?? $3e
    dw   call_00_13a0                                  ;; 00:12c8 pP
    ld   A, [wC2F0]                                    ;; 00:12ca $fa $f0 $c2
    and  A, $c0                                        ;; 00:12cd $e6 $c0
    cp   A, $c0                                        ;; 00:12cf $fe $c0
    jr   NZ, .jr_00_12d7                               ;; 00:12d1 $20 $04
    xor  A, A                                          ;; 00:12d3 $af
    ld   [wC2F0], A                                    ;; 00:12d4 $ea $f0 $c2
.jr_00_12d7:
    pop  AF                                            ;; 00:12d7 $f1
    ld   [wCD3D], A                                    ;; 00:12d8 $ea $3d $cd

call_00_12db:
    ret                                                ;; 00:12db $c9

call_00_12dc:
    call call_00_137c                                  ;; 00:12dc $cd $7c $13
    ld   A, $01                                        ;; 00:12df $3e $01
    rst  pushActiveBankSafe                            ;; 00:12e1 $e7
    ld   A, [wCA28]                                    ;; 00:12e2 $fa $28 $ca
    cp   A, $02                                        ;; 00:12e5 $fe $02
    jr   Z, .jr_00_1306                                ;; 00:12e7 $28 $1d
    cp   A, $19                                        ;; 00:12e9 $fe $19
    jr   Z, .jr_00_130b                                ;; 00:12eb $28 $1e
    cp   A, $1a                                        ;; 00:12ed $fe $1a
    jr   Z, .jr_00_1310                                ;; 00:12ef $28 $1f
    cp   A, $1b                                        ;; 00:12f1 $fe $1b
    jr   Z, .jr_00_1315                                ;; 00:12f3 $28 $20
    cp   A, $1c                                        ;; 00:12f5 $fe $1c
    jr   Z, .jr_00_131a                                ;; 00:12f7 $28 $21
    cp   A, $1d                                        ;; 00:12f9 $fe $1d
    jr   Z, .jr_00_131f                                ;; 00:12fb $28 $22
    cp   A, $24                                        ;; 00:12fd $fe $24
    jr   Z, .jr_00_1324                                ;; 00:12ff $28 $23
.jr_00_1301:
    call call_00_0e34                                  ;; 00:1301 $cd $34 $0e
    rst  popActiveBankSafe                             ;; 00:1304 $ef
    ret                                                ;; 00:1305 $c9
.jr_00_1306:
    call $614f                                         ;; 00:1306 $cd $4f $61
    jr   .jr_00_1301                                   ;; 00:1309 $18 $f6
.jr_00_130b:
    call $6154                                         ;; 00:130b $cd $54 $61
    jr   .jr_00_1301                                   ;; 00:130e $18 $f1
.jr_00_1310:
    call $6159                                         ;; 00:1310 $cd $59 $61
    jr   .jr_00_1301                                   ;; 00:1313 $18 $ec
.jr_00_1315:
    call $6169                                         ;; 00:1315 $cd $69 $61
    jr   .jr_00_1301                                   ;; 00:1318 $18 $e7
.jr_00_131a:
    call $6145                                         ;; 00:131a $cd $45 $61
    jr   .jr_00_1301                                   ;; 00:131d $18 $e2
.jr_00_131f:
    call $6125                                         ;; 00:131f $cd $25 $61
    rst  popActiveBankSafe                             ;; 00:1322 $ef
    ret                                                ;; 00:1323 $c9
.jr_00_1324:
    call call_00_1329                                  ;; 00:1324 $cd $29 $13
    rst  popActiveBankSafe                             ;; 00:1327 $ef
    ret                                                ;; 00:1328 $c9

call_00_1329:
    ld   A, $30                                        ;; 00:1329 $3e $30
    call call_00_3a6d                                  ;; 00:132b $cd $6d $3a
    ld   DE, $04                                       ;; 00:132e $11 $04 $00
.jr_00_1331:
    push DE                                            ;; 00:1331 $d5
    ld   HL, $8400                                     ;; 00:1332 $21 $00 $84
    ld   DE, wC800                                     ;; 00:1335 $11 $00 $c8
    ld   BC, $100                                      ;; 00:1338 $01 $00 $01
    rst  rst_00_0018                                   ;; 00:133b $df
    db   $01                                           ;; 00:133c ?
    pop  DE                                            ;; 00:133d $d1
    ld   HL, $1372                                     ;; 00:133e $21 $72 $13
    add  HL, DE                                        ;; 00:1341 $19
    ld   B, [HL]                                       ;; 00:1342 $46
    ld   HL, $1377                                     ;; 00:1343 $21 $77 $13
    add  HL, DE                                        ;; 00:1346 $19
    ld   C, [HL]                                       ;; 00:1347 $4e
    push DE                                            ;; 00:1348 $d5
    ld   HL, wC800                                     ;; 00:1349 $21 $00 $c8
    ld   D, $40                                        ;; 00:134c $16 $40
.jr_00_134e:
    ld   A, [HL]                                       ;; 00:134e $7e
    and  A, B                                          ;; 00:134f $a0
    ld   [HL+], A                                      ;; 00:1350 $22
    ld   A, [HL]                                       ;; 00:1351 $7e
    and  A, B                                          ;; 00:1352 $a0
    ld   [HL+], A                                      ;; 00:1353 $22
    ld   A, [HL]                                       ;; 00:1354 $7e
    and  A, C                                          ;; 00:1355 $a1
    ld   [HL+], A                                      ;; 00:1356 $22
    ld   A, [HL]                                       ;; 00:1357 $7e
    and  A, C                                          ;; 00:1358 $a1
    ld   [HL+], A                                      ;; 00:1359 $22
    dec  D                                             ;; 00:135a $15
    jr   NZ, .jr_00_134e                               ;; 00:135b $20 $f1
    ld   DE, $8400                                     ;; 00:135d $11 $00 $84
    ld   HL, wC800                                     ;; 00:1360 $21 $00 $c8
    ld   BC, $100                                      ;; 00:1363 $01 $00 $01
    rst  rst_00_0018                                   ;; 00:1366 $df
    db   $01                                           ;; 00:1367 ?
    ld   A, $20                                        ;; 00:1368 $3e $20
    call call_00_3a6d                                  ;; 00:136a $cd $6d $3a
    pop  DE                                            ;; 00:136d $d1
    dec  E                                             ;; 00:136e $1d
    jr   NZ, .jr_00_1331                               ;; 00:136f $20 $c0
    ret                                                ;; 00:1371 $c9
    db   $00, $ff, $aa, $ff, $55, $00, $55, $ff        ;; 00:1372 ????????
    db   $aa, $ff                                      ;; 00:137a ??

call_00_137c:
    ld   A, $0b                                        ;; 00:137c $3e $0b
    rst  pushActiveBankSafe                            ;; 00:137e $e7
    call $78f5                                         ;; 00:137f $cd $f5 $78
    rst  popActiveBankSafe                             ;; 00:1382 $ef
    ret                                                ;; 00:1383 $c9

call_00_1384:
    ld   A, $01                                        ;; 00:1384 $3e $01
    ld   [wCA59], A                                    ;; 00:1386 $ea $59 $ca

call_00_1389:
    ld   A, $06                                        ;; 00:1389 $3e $06
    rst  pushActiveBankSafe                            ;; 00:138b $e7
    ld   A, [wCA28]                                    ;; 00:138c $fa $28 $ca
    dec  A                                             ;; 00:138f $3d
    ld   L, A                                          ;; 00:1390 $6f
    ld   H, $00                                        ;; 00:1391 $26 $00
    ld   DE, $03                                       ;; 00:1393 $11 $03 $00
    call call_00_1c7e                                  ;; 00:1396 $cd $7e $1c
    ld   HL, $6ba4                                     ;; 00:1399 $21 $a4 $6b
    add  HL, DE                                        ;; 00:139c $19
    jp   jp_00_1468                                    ;; 00:139d $c3 $68 $14

call_00_13a0:
    ld   A, $01                                        ;; 00:13a0 $3e $01
    rst  pushActiveBankSafe                            ;; 00:13a2 $e7
    call call_01_64b4                                  ;; 00:13a3 $cd $b4 $64
    rst  popActiveBankSafe                             ;; 00:13a6 $ef
    ret                                                ;; 00:13a7 $c9

call_00_13a8:
    xor  A, A                                          ;; 00:13a8 $af
    ld   [wC6E3], A                                    ;; 00:13a9 $ea $e3 $c6

call_00_13ac:
    ld   HL, wC7A0                                     ;; 00:13ac $21 $a0 $c7
    ld   A, [wC7C8]                                    ;; 00:13af $fa $c8 $c7
    rst  add_hl_a                                      ;; 00:13b2 $c7
    ld   A, [wC6E4]                                    ;; 00:13b3 $fa $e4 $c6
    swap A                                             ;; 00:13b6 $cb $37
    ld   B, A                                          ;; 00:13b8 $47
    ld   A, [wC6E5]                                    ;; 00:13b9 $fa $e5 $c6
    swap A                                             ;; 00:13bc $cb $37
    or   A, B                                          ;; 00:13be $b0
    ld   [HL+], A                                      ;; 00:13bf $22
    ld   A, [wC6E6]                                    ;; 00:13c0 $fa $e6 $c6
    swap A                                             ;; 00:13c3 $cb $37
    ld   B, A                                          ;; 00:13c5 $47
    ld   A, [wC6E7]                                    ;; 00:13c6 $fa $e7 $c6
    swap A                                             ;; 00:13c9 $cb $37
    or   A, B                                          ;; 00:13cb $b0
    ld   [HL], A                                       ;; 00:13cc $77
    ld   HL, wC7B0                                     ;; 00:13cd $21 $b0 $c7
    ld   A, [wC7C8]                                    ;; 00:13d0 $fa $c8 $c7
    rst  add_hl_a                                      ;; 00:13d3 $c7
    ld   A, [wCA04]                                    ;; 00:13d4 $fa $04 $ca
    ld   [HL+], A                                      ;; 00:13d7 $22
    ld   A, [wCA05]                                    ;; 00:13d8 $fa $05 $ca
    ld   [HL], A                                       ;; 00:13db $77
    ld   HL, wC7C0                                     ;; 00:13dc $21 $c0 $c7
    ld   A, [wC7C8]                                    ;; 00:13df $fa $c8 $c7
    srl  A                                             ;; 00:13e2 $cb $3f
    rst  add_hl_a                                      ;; 00:13e4 $c7
    ld   A, [wC6E8]                                    ;; 00:13e5 $fa $e8 $c6
    ld   [HL], A                                       ;; 00:13e8 $77
    ld   A, [wC7C8]                                    ;; 00:13e9 $fa $c8 $c7
    add  A, $02                                        ;; 00:13ec $c6 $02
    ld   [wC7C8], A                                    ;; 00:13ee $ea $c8 $c7

call_00_13f1:
    ld   A, [wC6E4]                                    ;; 00:13f1 $fa $e4 $c6
    add  A, $50                                        ;; 00:13f4 $c6 $50
    ld   [wC800], A                                    ;; 00:13f6 $ea $00 $c8
    ld   A, [wC6E5]                                    ;; 00:13f9 $fa $e5 $c6
    adc  A, $00                                        ;; 00:13fc $ce $00
    ld   HL, wCA04                                     ;; 00:13fe $21 $04 $ca
    and  A, [HL]                                       ;; 00:1401 $a6
    ld   [wC801], A                                    ;; 00:1402 $ea $01 $c8
    ld   A, [wC6E6]                                    ;; 00:1405 $fa $e6 $c6
    add  A, $50                                        ;; 00:1408 $c6 $50
    ld   [wC802], A                                    ;; 00:140a $ea $02 $c8
    ld   A, [wC6E7]                                    ;; 00:140d $fa $e7 $c6
    adc  A, $00                                        ;; 00:1410 $ce $00
    ld   HL, wCA05                                     ;; 00:1412 $21 $05 $ca
    and  A, [HL]                                       ;; 00:1415 $a6
    ld   [wC803], A                                    ;; 00:1416 $ea $03 $c8
    ld   A, $06                                        ;; 00:1419 $3e $06
    rst  pushActiveBankSafe                            ;; 00:141b $e7
    ld   A, [wC6E8]                                    ;; 00:141c $fa $e8 $c6
    ld   HL, $6308                                     ;; 00:141f $21 $08 $63
    call call_00_3741                                  ;; 00:1422 $cd $41 $37
.jr_00_1425:
    ld   A, [HL]                                       ;; 00:1425 $7e
    and  A, $f0                                        ;; 00:1426 $e6 $f0
    ld   C, A                                          ;; 00:1428 $4f
    ld   B, $00                                        ;; 00:1429 $06 $00
    sla  C                                             ;; 00:142b $cb $21
    rl   B                                             ;; 00:142d $cb $10
    sla  C                                             ;; 00:142f $cb $21
    rl   B                                             ;; 00:1431 $cb $10
    ld   A, [wC800]                                    ;; 00:1433 $fa $00 $c8
    and  A, $c0                                        ;; 00:1436 $e6 $c0
    cp   A, C                                          ;; 00:1438 $b9
    jr   NZ, .jr_00_1461                               ;; 00:1439 $20 $26
    ld   A, [wC801]                                    ;; 00:143b $fa $01 $c8
    cp   A, B                                          ;; 00:143e $b8
    jr   NZ, .jr_00_1461                               ;; 00:143f $20 $20
    ld   A, [HL]                                       ;; 00:1441 $7e
    and  A, $0f                                        ;; 00:1442 $e6 $0f
    swap A                                             ;; 00:1444 $cb $37
    ld   C, A                                          ;; 00:1446 $4f
    ld   B, $00                                        ;; 00:1447 $06 $00
    sla  C                                             ;; 00:1449 $cb $21
    rl   B                                             ;; 00:144b $cb $10
    sla  C                                             ;; 00:144d $cb $21
    rl   B                                             ;; 00:144f $cb $10
    ld   A, [wC802]                                    ;; 00:1451 $fa $02 $c8
    and  A, $c0                                        ;; 00:1454 $e6 $c0
    cp   A, C                                          ;; 00:1456 $b9
    jr   NZ, .jr_00_1461                               ;; 00:1457 $20 $08
    ld   A, [wC803]                                    ;; 00:1459 $fa $03 $c8
    cp   A, B                                          ;; 00:145c $b8
    jr   NZ, .jr_00_1461                               ;; 00:145d $20 $02
    jr   .jr_00_1467                                   ;; 00:145f $18 $06
.jr_00_1461:
    ld   DE, $04                                       ;; 00:1461 $11 $04 $00
    add  HL, DE                                        ;; 00:1464 $19
    jr   .jr_00_1425                                   ;; 00:1465 $18 $be
.jr_00_1467:
    inc  HL                                            ;; 00:1467 $23

jp_00_1468:
    call call_00_1b64                                  ;; 00:1468 $cd $64 $1b
    ld   A, [HL+]                                      ;; 00:146b $2a
    ld   [wC6E8], A                                    ;; 00:146c $ea $e8 $c6
    ld   B, $00                                        ;; 00:146f $06 $00
    ld   A, [HL+]                                      ;; 00:1471 $2a
    and  A, $80                                        ;; 00:1472 $e6 $80
    rlca                                               ;; 00:1474 $07
    rr   B                                             ;; 00:1475 $cb $18
    ld   A, [HL-]                                      ;; 00:1477 $3a
    and  A, $80                                        ;; 00:1478 $e6 $80
    rlca                                               ;; 00:147a $07
    rr   B                                             ;; 00:147b $cb $18
    ld   A, B                                          ;; 00:147d $78
    ld   [wC6EE], A                                    ;; 00:147e $ea $ee $c6
    ld   A, [HL]                                       ;; 00:1481 $7e
    swap A                                             ;; 00:1482 $cb $37
    and  A, $f0                                        ;; 00:1484 $e6 $f0
    ld   [wC6E4], A                                    ;; 00:1486 $ea $e4 $c6
    ld   A, [HL+]                                      ;; 00:1489 $2a
    swap A                                             ;; 00:148a $cb $37
    and  A, $07                                        ;; 00:148c $e6 $07
    ld   [wC6E5], A                                    ;; 00:148e $ea $e5 $c6
    ld   A, [HL]                                       ;; 00:1491 $7e
    swap A                                             ;; 00:1492 $cb $37
    and  A, $f0                                        ;; 00:1494 $e6 $f0
    ld   [wC6E6], A                                    ;; 00:1496 $ea $e6 $c6
    ld   A, [HL]                                       ;; 00:1499 $7e
    swap A                                             ;; 00:149a $cb $37
    and  A, $07                                        ;; 00:149c $e6 $07
    ld   [wC6E7], A                                    ;; 00:149e $ea $e7 $c6
    rst  popActiveBankSafe                             ;; 00:14a1 $ef
    jp   call_00_027d                                  ;; 00:14a2 $c3 $7d $02

call_00_14a5:
    ld   A, $02                                        ;; 00:14a5 $3e $02
    ld   [wC6E3], A                                    ;; 00:14a7 $ea $e3 $c6

call_00_14aa:
    ld   A, $01                                        ;; 00:14aa $3e $01
    rst  pushActiveBankSafe                            ;; 00:14ac $e7
    call $6578                                         ;; 00:14ad $cd $78 $65
    rst  popActiveBankSafe                             ;; 00:14b0 $ef
    ret                                                ;; 00:14b1 $c9

call_00_14b2:
    ld   A, $3f                                        ;; 00:14b2 $3e $3f
    ldh  [hSFX], A                                     ;; 00:14b4 $e0 $bc
    ld   A, $01                                        ;; 00:14b6 $3e $01
    rst  pushActiveBankSafe                            ;; 00:14b8 $e7
    call $661c                                         ;; 00:14b9 $cd $1c $66
    rst  popActiveBankSafe                             ;; 00:14bc $ef
    jp   call_00_13f1                                  ;; 00:14bd $c3 $f1 $13

call_00_14c0:
    ld   A, [wCA28]                                    ;; 00:14c0 $fa $28 $ca
    swap A                                             ;; 00:14c3 $cb $37
    and  A, $0f                                        ;; 00:14c5 $e6 $0f
    call doJumptable                                   ;; 00:14c7 $cd $3a $37
;@jumptable amount=16
    dw   call_00_1518                                  ;; 00:14ca ?? $00
    dw   call_00_14f8                                  ;; 00:14cc pP $01
    dw   call_00_1508                                  ;; 00:14ce pP $02
    dw   call_00_14ea                                  ;; 00:14d0 ?? $03
    dw   call_00_15de                                  ;; 00:14d2 ?? $04
    dw   call_00_1534                                  ;; 00:14d4 ?? $05
    dw   call_00_15b3                                  ;; 00:14d6 ?? $06
    dw   call_00_1524                                  ;; 00:14d8 ?? $07
    dw   call_00_15f7                                  ;; 00:14da ?? $08
    dw   call_00_14ea                                  ;; 00:14dc ?? $09
    dw   call_00_152c                                  ;; 00:14de ?? $0a
    dw   call_00_15a1                                  ;; 00:14e0 ?? $0b
    dw   call_00_14eb                                  ;; 00:14e2 ?? $0c
    dw   call_00_15e6                                  ;; 00:14e4 ?? $0d
    dw   call_00_15a7                                  ;; 00:14e6 ?? $0e
    dw   call_00_15ef                                  ;; 00:14e8 ?? $0f

call_00_14ea:
    ret                                                ;; 00:14ea $c9

call_00_14eb:
    ld   A, $01                                        ;; 00:14eb $3e $01
    ld   [wCA59], A                                    ;; 00:14ed $ea $59 $ca
    ld   A, $01                                        ;; 00:14f0 $3e $01
    rst  pushActiveBankSafe                            ;; 00:14f2 $e7
    call $4250                                         ;; 00:14f3 $cd $50 $42
    rst  popActiveBankSafe                             ;; 00:14f6 $ef
    ret                                                ;; 00:14f7 $c9

call_00_14f8:
    ld   A, [wCA28]                                    ;; 00:14f8 $fa $28 $ca
    and  A, $0f                                        ;; 00:14fb $e6 $0f
    dec  A                                             ;; 00:14fd $3d
    ld   HL, $151d                                     ;; 00:14fe $21 $1d $15
    rst  add_hl_a                                      ;; 00:1501 $c7
    ld   B, [HL]                                       ;; 00:1502 $46
    ld   A, $04                                        ;; 00:1503 $3e $04
    rst  rst_00_0018                                   ;; 00:1505 $df
    db   $4a                                           ;; 00:1506 .
    ret                                                ;; 00:1507 $c9

call_00_1508:
    ld   A, [wCA28]                                    ;; 00:1508 $fa $28 $ca
    and  A, $0f                                        ;; 00:150b $e6 $0f
    dec  A                                             ;; 00:150d $3d
    ld   HL, $1523                                     ;; 00:150e $21 $23 $15
    rst  add_hl_a                                      ;; 00:1511 $c7
    ld   B, [HL]                                       ;; 00:1512 $46
    ld   A, $03                                        ;; 00:1513 $3e $03
    rst  rst_00_0018                                   ;; 00:1515 $df
    db   $4a                                           ;; 00:1516 .
    ret                                                ;; 00:1517 $c9

call_00_1518:
    ld   A, $04                                        ;; 00:1518 $3e $04
    rst  rst_00_0018                                   ;; 00:151a $df
    db   $4b                                           ;; 00:151b ?
    ret                                                ;; 00:151c $c9
    db   $02, $08, $03, $09, $04, $05, $06             ;; 00:151d w?????.

call_00_1524:
    ld   A, $06                                        ;; 00:1524 $3e $06
    rst  pushActiveBankSafe                            ;; 00:1526 $e7
    call call_00_05bf                                  ;; 00:1527 $cd $bf $05
    rst  popActiveBankSafe                             ;; 00:152a $ef
    ret                                                ;; 00:152b $c9

call_00_152c:
    ld   A, $01                                        ;; 00:152c $3e $01
    rst  pushActiveBankSafe                            ;; 00:152e $e7
    call $664b                                         ;; 00:152f $cd $4b $66
    rst  popActiveBankSafe                             ;; 00:1532 $ef
    ret                                                ;; 00:1533 $c9

call_00_1534:
    ld   A, $01                                        ;; 00:1534 $3e $01
    ld   [wCA14], A                                    ;; 00:1536 $ea $14 $ca
    ld   B, $ff                                        ;; 00:1539 $06 $ff
    call call_00_1586                                  ;; 00:153b $cd $86 $15
    xor  A, A                                          ;; 00:153e $af
    ld   [wCA14], A                                    ;; 00:153f $ea $14 $ca
    ld   A, $01                                        ;; 00:1542 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1544 $e7
    call $6a23                                         ;; 00:1545 $cd $23 $6a
    rst  popActiveBankSafe                             ;; 00:1548 $ef
    ld   HL, wC6E4                                     ;; 00:1549 $21 $e4 $c6
    ld   DE, wC6E9                                     ;; 00:154c $11 $e9 $c6
    call call_00_1f87                                  ;; 00:154f $cd $87 $1f

call_00_1552:
    call call_00_3c03                                  ;; 00:1552 $cd $03 $3c
    ld   [HL], $ff                                     ;; 00:1555 $36 $ff
    call call_00_3c98                                  ;; 00:1557 $cd $98 $3c
    ld   [HL], $ff                                     ;; 00:155a $36 $ff
    call call_00_3c1d                                  ;; 00:155c $cd $1d $3c
    ld   [HL], $00                                     ;; 00:155f $36 $00
    call call_00_3c2e                                  ;; 00:1561 $cd $2e $3c
    ld   [HL], $10                                     ;; 00:1564 $36 $10
    call call_00_3c78                                  ;; 00:1566 $cd $78 $3c
    ld   [HL], $10                                     ;; 00:1569 $36 $10
    call call_00_3c70                                  ;; 00:156b $cd $70 $3c
    ld   [HL], $1a                                     ;; 00:156e $36 $1a
    call call_00_3c80                                  ;; 00:1570 $cd $80 $3c
    ld   [HL], $1a                                     ;; 00:1573 $36 $1a
    call call_00_3c90                                  ;; 00:1575 $cd $90 $3c
    ld   [HL], $44                                     ;; 00:1578 $36 $44
    ld   A, [wC6EE]                                    ;; 00:157a $fa $ee $c6
    ld   B, A                                          ;; 00:157d $47
    call call_00_3c48                                  ;; 00:157e $cd $48 $3c
    ld   [HL], B                                       ;; 00:1581 $70
    ld   A, B                                          ;; 00:1582 $78
    rst  rst_00_0018                                   ;; 00:1583 $df
    db   $9d                                           ;; 00:1584 ?
    ret                                                ;; 00:1585 $c9

call_00_1586:
    call call_00_01d7                                  ;; 00:1586 $cd $d7 $01
.jr_00_1589:
    call call_00_3c03                                  ;; 00:1589 $cd $03 $3c
    ld   A, [HL]                                       ;; 00:158c $7e
    cp   A, B                                          ;; 00:158d $b8
    jr   NZ, .jr_00_1597                               ;; 00:158e $20 $07
    ld   [HL], $00                                     ;; 00:1590 $36 $00
    call call_00_3c98                                  ;; 00:1592 $cd $98 $3c
    ld   [HL], $00                                     ;; 00:1595 $36 $00
.jr_00_1597:
    ldh  A, [hFF96]                                    ;; 00:1597 $f0 $96
    inc  A                                             ;; 00:1599 $3c
    ldh  [hFF96], A                                    ;; 00:159a $e0 $96
    cp   A, $10                                        ;; 00:159c $fe $10
    jr   NZ, .jr_00_1589                               ;; 00:159e $20 $e9
    ret                                                ;; 00:15a0 $c9

call_00_15a1:
    ld   A, $04                                        ;; 00:15a1 $3e $04
    call call_00_3cb2                                  ;; 00:15a3 $cd $b2 $3c
    ret  C                                             ;; 00:15a6 $d8

call_00_15a7:
    ld   HL, wC6E9                                     ;; 00:15a7 $21 $e9 $c6
    ld   DE, wC6E4                                     ;; 00:15aa $11 $e4 $c6
    call call_00_1f87                                  ;; 00:15ad $cd $87 $1f
    jp   call_00_027d                                  ;; 00:15b0 $c3 $7d $02

call_00_15b3:
    ld   A, $0c                                        ;; 00:15b3 $3e $0c
    call call_00_3ca6                                  ;; 00:15b5 $cd $a6 $3c
    ld   A, $0d                                        ;; 00:15b8 $3e $0d
    call call_00_3ca6                                  ;; 00:15ba $cd $a6 $3c
    ld   A, [wC6EE]                                    ;; 00:15bd $fa $ee $c6
    rlca                                               ;; 00:15c0 $07
    jr   NC, .jr_00_15c8                               ;; 00:15c1 $30 $05
    ld   A, $0c                                        ;; 00:15c3 $3e $0c
    call call_00_3ca0                                  ;; 00:15c5 $cd $a0 $3c
.jr_00_15c8:
    ld   A, [wC6EE]                                    ;; 00:15c8 $fa $ee $c6
    rlca                                               ;; 00:15cb $07
    rlca                                               ;; 00:15cc $07
    ret  NC                                            ;; 00:15cd $d0
    ld   A, $0d                                        ;; 00:15ce $3e $0d
    jp   call_00_3ca0                                  ;; 00:15d0 $c3 $a0 $3c

call_00_15d3:
    ld   A, [wCA28]                                    ;; 00:15d3 $fa $28 $ca
    ld   [wCE91], A                                    ;; 00:15d6 $ea $91 $ce
    rst  rst_00_0018                                   ;; 00:15d9 $df
    db   $0e                                           ;; 00:15da ?
    rst  rst_00_0018                                   ;; 00:15db $df
    db   $18                                           ;; 00:15dc ?
    ret                                                ;; 00:15dd $c9

call_00_15de:
    ld   A, $01                                        ;; 00:15de $3e $01
    rst  pushActiveBankSafe                            ;; 00:15e0 $e7
    call $6a74                                         ;; 00:15e1 $cd $74 $6a
    rst  popActiveBankSafe                             ;; 00:15e4 $ef
    ret                                                ;; 00:15e5 $c9

call_00_15e6:
    ld   DE, wC6E9                                     ;; 00:15e6 $11 $e9 $c6
    ld   HL, wC6E4                                     ;; 00:15e9 $21 $e4 $c6
    jp   call_00_1f87                                  ;; 00:15ec $c3 $87 $1f

call_00_15ef:
    ld   A, $06                                        ;; 00:15ef $3e $06
    rst  pushActiveBankSafe                            ;; 00:15f1 $e7
    call $7f69                                         ;; 00:15f2 $cd $69 $7f
    rst  popActiveBankSafe                             ;; 00:15f5 $ef
    ret                                                ;; 00:15f6 $c9

call_00_15f7:
    ld   A, [wCDC4]                                    ;; 00:15f7 $fa $c4 $cd
    push AF                                            ;; 00:15fa $f5
    ld   A, $01                                        ;; 00:15fb $3e $01
    ld   [wCDC4], A                                    ;; 00:15fd $ea $c4 $cd
    ld   A, $38                                        ;; 00:1600 $3e $38
    ldh  [hSFX], A                                     ;; 00:1602 $e0 $bc
    call call_00_39f3                                  ;; 00:1604 $cd $f3 $39
    ld   A, $10                                        ;; 00:1607 $3e $10
    call call_00_3a6d                                  ;; 00:1609 $cd $6d $3a
    call call_00_3a0c                                  ;; 00:160c $cd $0c $3a
    call call_00_1691                                  ;; 00:160f $cd $91 $16
    ld   B, $60                                        ;; 00:1612 $06 $60
    rst  rst_00_0018                                   ;; 00:1614 $df
    db   $03                                           ;; 00:1615 ?
    call call_00_16a4                                  ;; 00:1616 $cd $a4 $16
    ld   DE, wC50D                                     ;; 00:1619 $11 $0d $c5
    add  HL, DE                                        ;; 00:161c $19
    ld   A, [HL]                                       ;; 00:161d $7e
    and  A, $07                                        ;; 00:161e $e6 $07
    cp   A, $02                                        ;; 00:1620 $fe $02
    jr   Z, .jr_00_1682                                ;; 00:1622 $28 $5e
    ld   A, $02                                        ;; 00:1624 $3e $02
    ld   [wD881], A                                    ;; 00:1626 $ea $81 $d8
    call call_00_16a4                                  ;; 00:1629 $cd $a4 $16
    ld   DE, wC503                                     ;; 00:162c $11 $03 $c5
    add  HL, DE                                        ;; 00:162f $19
    ld   A, [HL]                                       ;; 00:1630 $7e
    ld   [wD87E], A                                    ;; 00:1631 $ea $7e $d8
    call call_00_16a4                                  ;; 00:1634 $cd $a4 $16
    ld   DE, wC50F                                     ;; 00:1637 $11 $0f $c5
    add  HL, DE                                        ;; 00:163a $19
    ld   A, [HL]                                       ;; 00:163b $7e
    ld   [wD87F], A                                    ;; 00:163c $ea $7f $d8
    rst  rst_00_0018                                   ;; 00:163f $df
    db   $38                                           ;; 00:1640 ?
    ld   A, $8f                                        ;; 00:1641 $3e $8f
    ldh  [rWY], A                                      ;; 00:1643 $e0 $4a
    call call_00_3a44                                  ;; 00:1645 $cd $44 $3a
    ld   A, $01                                        ;; 00:1648 $3e $01
    ld   [wCD37], A                                    ;; 00:164a $ea $37 $cd
    ld   A, $0c                                        ;; 00:164d $3e $0c
    rst  pushActiveBankSafe                            ;; 00:164f $e7
    ld   DE, $5fc8                                     ;; 00:1650 $11 $c8 $5f
    call $4000                                         ;; 00:1653 $cd $00 $40
    rst  popActiveBankSafe                             ;; 00:1656 $ef
    call call_00_1691                                  ;; 00:1657 $cd $91 $16
    push HL                                            ;; 00:165a $e5
    push DE                                            ;; 00:165b $d5
    pop  HL                                            ;; 00:165c $e1
    pop  DE                                            ;; 00:165d $d1
    ld   B, $59                                        ;; 00:165e $06 $59
    rst  rst_00_0018                                   ;; 00:1660 $df
    db   $03                                           ;; 00:1661 ?
    ld   A, $01                                        ;; 00:1662 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1664 $e7
    call call_00_0150                                  ;; 00:1665 $cd $50 $01
    call call_00_01d7                                  ;; 00:1668 $cd $d7 $01
    ld   A, $80                                        ;; 00:166b $3e $80
    ld   [wC6EE], A                                    ;; 00:166d $ea $ee $c6
    call $5272                                         ;; 00:1670 $cd $72 $52
    rst  popActiveBankSafe                             ;; 00:1673 $ef
    ld   A, $01                                        ;; 00:1674 $3e $01
    ld   [wCD3D], A                                    ;; 00:1676 $ea $3d $cd
    rst  rst_00_0018                                   ;; 00:1679 $df
    db   $2e                                           ;; 00:167a ?
    call call_00_3a4b                                  ;; 00:167b $cd $4b $3a
    ld   A, $50                                        ;; 00:167e $3e $50
    ldh  [rWY], A                                      ;; 00:1680 $e0 $4a
.jr_00_1682:
    xor  A, A                                          ;; 00:1682 $af
    ld   [wCD37], A                                    ;; 00:1683 $ea $37 $cd
    call call_00_174d                                  ;; 00:1686 $cd $4d $17
    call call_00_137c                                  ;; 00:1689 $cd $7c $13
    pop  AF                                            ;; 00:168c $f1
    ld   [wCDC4], A                                    ;; 00:168d $ea $c4 $cd
    ret                                                ;; 00:1690 $c9

call_00_1691:
    call call_00_16a4                                  ;; 00:1691 $cd $a4 $16
    ld   DE, wC500                                     ;; 00:1694 $11 $00 $c5
    add  HL, DE                                        ;; 00:1697 $19
    push HL                                            ;; 00:1698 $e5
    call call_00_16a7                                  ;; 00:1699 $cd $a7 $16
    ld   DE, wC500                                     ;; 00:169c $11 $00 $c5
    add  HL, DE                                        ;; 00:169f $19
    ld   D, H                                          ;; 00:16a0 $54
    ld   E, L                                          ;; 00:16a1 $5d
    pop  HL                                            ;; 00:16a2 $e1
    ret                                                ;; 00:16a3 $c9

call_00_16a4:
    xor  A, A                                          ;; 00:16a4 $af
    jr   jr_00_16a9                                    ;; 00:16a5 $18 $02

call_00_16a7:
    ld   A, $01                                        ;; 00:16a7 $3e $01

jr_00_16a9:
    ld   [wCD37], A                                    ;; 00:16a9 $ea $37 $cd
    ld   A, [wC6F3]                                    ;; 00:16ac $fa $f3 $c6
    and  A, $c0                                        ;; 00:16af $e6 $c0
    rlca                                               ;; 00:16b1 $07
    rlca                                               ;; 00:16b2 $07
    ld   [wC9D6], A                                    ;; 00:16b3 $ea $d6 $c9
    jp   call_00_1fcd                                  ;; 00:16b6 $c3 $cd $1f

call_00_16b9:
    ld   A, [wCA28]                                    ;; 00:16b9 $fa $28 $ca
    call doJumptable                                   ;; 00:16bc $cd $3a $37
;@jumptable amount=18
    dw   call_00_173f                                  ;; 00:16bf pP $00
    dw   call_00_1745                                  ;; 00:16c1 ?? $01
    dw   call_00_174c                                  ;; 00:16c3 ?? $02
    dw   call_00_1aea                                  ;; 00:16c5 pP $03
    dw   call_00_174d                                  ;; 00:16c7 ?? $04
    dw   call_00_17e2                                  ;; 00:16c9 ?? $05
    dw   call_00_182b                                  ;; 00:16cb ?? $06
    dw   call_00_18fb                                  ;; 00:16cd ?? $07
    dw   call_00_190d                                  ;; 00:16cf ?? $08
    dw   call_00_1950                                  ;; 00:16d1 ?? $09
    dw   call_00_1769                                  ;; 00:16d3 pP $0a
    dw   call_00_1711                                  ;; 00:16d5 pP $0b
    dw   call_00_1728                                  ;; 00:16d7 pP $0c
    dw   call_00_1709                                  ;; 00:16d9 ?? $0d
    dw   call_00_16f9                                  ;; 00:16db ?? $0e
    dw   call_00_1701                                  ;; 00:16dd ?? $0f
    dw   call_00_16eb                                  ;; 00:16df ?? $10
    dw   call_00_16e3                                  ;; 00:16e1 ?? $11

call_00_16e3:
    ld   A, $01                                        ;; 00:16e3 $3e $01
    rst  pushActiveBankSafe                            ;; 00:16e5 $e7
    call call_01_610d ;@bank 1                         ;; 00:16e6 $cd $0d $61
    rst  popActiveBankSafe                             ;; 00:16e9 $ef
    ret                                                ;; 00:16ea $c9

call_00_16eb:
    ld   A, $1b                                        ;; 00:16eb $3e $1b
    ld   [wC6F3], A                                    ;; 00:16ed $ea $f3 $c6
    ld   HL, wC50D                                     ;; 00:16f0 $21 $0d $c5
    ld   A, $02                                        ;; 00:16f3 $3e $02
    ld   [HL+], A                                      ;; 00:16f5 $22
    ld   [HL], $e0                                     ;; 00:16f6 $36 $e0
    ret                                                ;; 00:16f8 $c9

call_00_16f9:
    ld   A, $01                                        ;; 00:16f9 $3e $01
    rst  pushActiveBankSafe                            ;; 00:16fb $e7
    call call_00_0861                                  ;; 00:16fc $cd $61 $08
    rst  popActiveBankSafe                             ;; 00:16ff $ef
    ret                                                ;; 00:1700 $c9

call_00_1701:
    ld   A, $01                                        ;; 00:1701 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1703 $e7
    call $614a                                         ;; 00:1704 $cd $4a $61
    rst  popActiveBankSafe                             ;; 00:1707 $ef
    ret                                                ;; 00:1708 $c9

call_00_1709:
    ld   A, $01                                        ;; 00:1709 $3e $01
    rst  pushActiveBankSafe                            ;; 00:170b $e7
    call $4049                                         ;; 00:170c $cd $49 $40
    rst  popActiveBankSafe                             ;; 00:170f $ef
    ret                                                ;; 00:1710 $c9

call_00_1711:
    ld   A, $01                                        ;; 00:1711 $3e $01
    ld   [wCA6B], A                                    ;; 00:1713 $ea $6b $ca
    ld   A, $37                                        ;; 00:1716 $3e $37
    ld   [wCA28], A                                    ;; 00:1718 $ea $28 $ca
    ld   A, $0e                                        ;; 00:171b $3e $0e
    ld   [wCA29], A                                    ;; 00:171d $ea $29 $ca
    call call_00_1236                                  ;; 00:1720 $cd $36 $12
    xor  A, A                                          ;; 00:1723 $af
    ld   [wCA6B], A                                    ;; 00:1724 $ea $6b $ca
    ret                                                ;; 00:1727 $c9

call_00_1728:
    ld   A, $01                                        ;; 00:1728 $3e $01
    ld   [wCA6B], A                                    ;; 00:172a $ea $6b $ca
    ld   A, $02                                        ;; 00:172d $3e $02
    ld   [wCA28], A                                    ;; 00:172f $ea $28 $ca
    ld   A, $0d                                        ;; 00:1732 $3e $0d
    ld   [wCA29], A                                    ;; 00:1734 $ea $29 $ca
    call call_00_1236                                  ;; 00:1737 $cd $36 $12
    xor  A, A                                          ;; 00:173a $af
    ld   [wCA6B], A                                    ;; 00:173b $ea $6b $ca
    ret                                                ;; 00:173e $c9

call_00_173f:
    ld   A, $01                                        ;; 00:173f $3e $01
    ld   [wCA00], A                                    ;; 00:1741 $ea $00 $ca
    ret                                                ;; 00:1744 $c9

call_00_1745:
    xor  A, A                                          ;; 00:1745 $af
    ld   [wC6E3], A                                    ;; 00:1746 $ea $e3 $c6
    jp   call_00_08ad                                  ;; 00:1749 $c3 $ad $08

call_00_174c:
    ret                                                ;; 00:174c $c9

call_00_174d:
    call call_00_1b2d                                  ;; 00:174d $cd $2d $1b
    call call_00_1756                                  ;; 00:1750 $cd $56 $17
    jp   jp_00_1b50                                    ;; 00:1753 $c3 $50 $1b

call_00_1756:
    ld   A, [wCA15]                                    ;; 00:1756 $fa $15 $ca
    cp   A, $10                                        ;; 00:1759 $fe $10
    jr   C, .jr_00_1761                                ;; 00:175b $38 $04
    ld   A, $08                                        ;; 00:175d $3e $08
    jr   .jr_00_1763                                   ;; 00:175f $18 $02
.jr_00_1761:
    ld   A, $07                                        ;; 00:1761 $3e $07
.jr_00_1763:
    rst  pushActiveBankSafe                            ;; 00:1763 $e7
    call call_00_0f42                                  ;; 00:1764 $cd $42 $0f
    rst  popActiveBankSafe                             ;; 00:1767 $ef
    ret                                                ;; 00:1768 $c9

call_00_1769:
    ld   B, $20                                        ;; 00:1769 $06 $20
.jr_00_176b:
    push BC                                            ;; 00:176b $c5
    ld   A, $04                                        ;; 00:176c $3e $04
    ldh  [hFF96], A                                    ;; 00:176e $e0 $96
    call call_00_189b                                  ;; 00:1770 $cd $9b $18
    ld   A, $05                                        ;; 00:1773 $3e $05
    ldh  [hFF96], A                                    ;; 00:1775 $e0 $96
    call call_00_189b                                  ;; 00:1777 $cd $9b $18
    call call_00_18f5                                  ;; 00:177a $cd $f5 $18
    pop  BC                                            ;; 00:177d $c1
    dec  B                                             ;; 00:177e $05
    jr   NZ, .jr_00_176b                               ;; 00:177f $20 $ea
    ld   B, $10                                        ;; 00:1781 $06 $10
.jr_00_1783:
    push BC                                            ;; 00:1783 $c5
    ld   A, $04                                        ;; 00:1784 $3e $04
    ldh  [hFF96], A                                    ;; 00:1786 $e0 $96
    call call_00_18af                                  ;; 00:1788 $cd $af $18
    ld   A, $05                                        ;; 00:178b $3e $05
    ldh  [hFF96], A                                    ;; 00:178d $e0 $96
    call call_00_189b                                  ;; 00:178f $cd $9b $18
    call call_00_18f5                                  ;; 00:1792 $cd $f5 $18
    pop  BC                                            ;; 00:1795 $c1
    dec  B                                             ;; 00:1796 $05
    jr   NZ, .jr_00_1783                               ;; 00:1797 $20 $ea
    ld   B, $60                                        ;; 00:1799 $06 $60
.jr_00_179b:
    push BC                                            ;; 00:179b $c5
    ld   A, $04                                        ;; 00:179c $3e $04
    ldh  [hFF96], A                                    ;; 00:179e $e0 $96
    call call_00_18af                                  ;; 00:17a0 $cd $af $18
    ld   A, $05                                        ;; 00:17a3 $3e $05
    ldh  [hFF96], A                                    ;; 00:17a5 $e0 $96
    call call_00_18af                                  ;; 00:17a7 $cd $af $18
    call call_00_18f5                                  ;; 00:17aa $cd $f5 $18
    pop  BC                                            ;; 00:17ad $c1
    dec  B                                             ;; 00:17ae $05
    jr   NZ, .jr_00_179b                               ;; 00:17af $20 $ea
    ld   B, $10                                        ;; 00:17b1 $06 $10
.jr_00_17b3:
    push BC                                            ;; 00:17b3 $c5
    ld   A, $04                                        ;; 00:17b4 $3e $04
    ldh  [hFF96], A                                    ;; 00:17b6 $e0 $96
    call call_00_1888                                  ;; 00:17b8 $cd $88 $18
    ld   A, $05                                        ;; 00:17bb $3e $05
    ldh  [hFF96], A                                    ;; 00:17bd $e0 $96
    call call_00_18af                                  ;; 00:17bf $cd $af $18
    call call_00_18f5                                  ;; 00:17c2 $cd $f5 $18
    pop  BC                                            ;; 00:17c5 $c1
    dec  B                                             ;; 00:17c6 $05
    jr   NZ, .jr_00_17b3                               ;; 00:17c7 $20 $ea
    ld   B, $40                                        ;; 00:17c9 $06 $40
.jr_00_17cb:
    push BC                                            ;; 00:17cb $c5
    ld   A, $04                                        ;; 00:17cc $3e $04
    ldh  [hFF96], A                                    ;; 00:17ce $e0 $96
    call call_00_1888                                  ;; 00:17d0 $cd $88 $18
    ld   A, $05                                        ;; 00:17d3 $3e $05
    ldh  [hFF96], A                                    ;; 00:17d5 $e0 $96
    call call_00_1888                                  ;; 00:17d7 $cd $88 $18
    call call_00_18f5                                  ;; 00:17da $cd $f5 $18
    pop  BC                                            ;; 00:17dd $c1
    dec  B                                             ;; 00:17de $05
    jr   NZ, .jr_00_17cb                               ;; 00:17df $20 $ea
    ret                                                ;; 00:17e1 $c9

call_00_17e2:
    ld   B, $40                                        ;; 00:17e2 $06 $40
.jr_00_17e4:
    push BC                                            ;; 00:17e4 $c5
    ld   A, $04                                        ;; 00:17e5 $3e $04
    ldh  [hFF96], A                                    ;; 00:17e7 $e0 $96
    call call_00_1874                                  ;; 00:17e9 $cd $74 $18
    ld   A, $06                                        ;; 00:17ec $3e $06
    ldh  [hFF96], A                                    ;; 00:17ee $e0 $96
    call call_00_1874                                  ;; 00:17f0 $cd $74 $18
    call call_00_18f5                                  ;; 00:17f3 $cd $f5 $18
    pop  BC                                            ;; 00:17f6 $c1
    dec  B                                             ;; 00:17f7 $05
    jr   NZ, .jr_00_17e4                               ;; 00:17f8 $20 $ea
    ld   B, $10                                        ;; 00:17fa $06 $10
.jr_00_17fc:
    push BC                                            ;; 00:17fc $c5
    ld   A, $04                                        ;; 00:17fd $3e $04
    ldh  [hFF96], A                                    ;; 00:17ff $e0 $96
    call call_00_1888                                  ;; 00:1801 $cd $88 $18
    ld   A, $06                                        ;; 00:1804 $3e $06
    ldh  [hFF96], A                                    ;; 00:1806 $e0 $96
    call call_00_1874                                  ;; 00:1808 $cd $74 $18
    call call_00_18f5                                  ;; 00:180b $cd $f5 $18
    pop  BC                                            ;; 00:180e $c1
    dec  B                                             ;; 00:180f $05
    jr   NZ, .jr_00_17fc                               ;; 00:1810 $20 $ea
    ld   B, $40                                        ;; 00:1812 $06 $40
.jr_00_1814:
    push BC                                            ;; 00:1814 $c5
    ld   A, $04                                        ;; 00:1815 $3e $04
    ldh  [hFF96], A                                    ;; 00:1817 $e0 $96
    call call_00_1888                                  ;; 00:1819 $cd $88 $18
    ld   A, $06                                        ;; 00:181c $3e $06
    ldh  [hFF96], A                                    ;; 00:181e $e0 $96
    call call_00_1888                                  ;; 00:1820 $cd $88 $18
    call call_00_18f5                                  ;; 00:1823 $cd $f5 $18
    pop  BC                                            ;; 00:1826 $c1
    dec  B                                             ;; 00:1827 $05
    jr   NZ, .jr_00_1814                               ;; 00:1828 $20 $ea
    ret                                                ;; 00:182a $c9

call_00_182b:
    ld   B, $30                                        ;; 00:182b $06 $30
.jr_00_182d:
    push BC                                            ;; 00:182d $c5
    ld   A, $04                                        ;; 00:182e $3e $04
    ldh  [hFF96], A                                    ;; 00:1830 $e0 $96
    call call_00_189b                                  ;; 00:1832 $cd $9b $18
    ld   A, $05                                        ;; 00:1835 $3e $05
    ldh  [hFF96], A                                    ;; 00:1837 $e0 $96
    call call_00_189b                                  ;; 00:1839 $cd $9b $18
    call call_00_18f5                                  ;; 00:183c $cd $f5 $18
    pop  BC                                            ;; 00:183f $c1
    dec  B                                             ;; 00:1840 $05
    jr   NZ, .jr_00_182d                               ;; 00:1841 $20 $ea
    ld   B, $10                                        ;; 00:1843 $06 $10
.jr_00_1845:
    push BC                                            ;; 00:1845 $c5
    ld   A, $04                                        ;; 00:1846 $3e $04
    ldh  [hFF96], A                                    ;; 00:1848 $e0 $96
    call call_00_18af                                  ;; 00:184a $cd $af $18
    ld   A, $05                                        ;; 00:184d $3e $05
    ldh  [hFF96], A                                    ;; 00:184f $e0 $96
    call call_00_189b                                  ;; 00:1851 $cd $9b $18
    call call_00_18f5                                  ;; 00:1854 $cd $f5 $18
    pop  BC                                            ;; 00:1857 $c1
    dec  B                                             ;; 00:1858 $05
    jr   NZ, .jr_00_1845                               ;; 00:1859 $20 $ea
    ld   B, $30                                        ;; 00:185b $06 $30
.jr_00_185d:
    push BC                                            ;; 00:185d $c5
    ld   A, $04                                        ;; 00:185e $3e $04
    ldh  [hFF96], A                                    ;; 00:1860 $e0 $96
    call call_00_18af                                  ;; 00:1862 $cd $af $18
    ld   A, $05                                        ;; 00:1865 $3e $05
    ldh  [hFF96], A                                    ;; 00:1867 $e0 $96
    call call_00_18af                                  ;; 00:1869 $cd $af $18
    call call_00_18f5                                  ;; 00:186c $cd $f5 $18
    pop  BC                                            ;; 00:186f $c1
    dec  B                                             ;; 00:1870 $05
    jr   NZ, .jr_00_185d                               ;; 00:1871 $20 $ea
    ret                                                ;; 00:1873 $c9

call_00_1874:
    call call_00_3c48                                  ;; 00:1874 $cd $48 $3c
    ld   A, $40                                        ;; 00:1877 $3e $40
    ld   [HL], A                                       ;; 00:1879 $77
    rst  rst_00_0018                                   ;; 00:187a $df
    db   $9d                                           ;; 00:187b ?
    call call_00_3c3f                                  ;; 00:187c $cd $3f $3c
    call call_00_18c8                                  ;; 00:187f $cd $c8 $18
    call call_00_3c14                                  ;; 00:1882 $cd $14 $3c
    jp   call_00_18c8                                  ;; 00:1885 $c3 $c8 $18

call_00_1888:
    call call_00_3c48                                  ;; 00:1888 $cd $48 $3c
    xor  A, A                                          ;; 00:188b $af
    ld   [HL], A                                       ;; 00:188c $77
    rst  rst_00_0018                                   ;; 00:188d $df
    db   $9d                                           ;; 00:188e .
    call call_00_3c36                                  ;; 00:188f $cd $36 $3c
    call call_00_18db                                  ;; 00:1892 $cd $db $18
    call call_00_3c0b                                  ;; 00:1895 $cd $0b $3c
    jp   call_00_18db                                  ;; 00:1898 $c3 $db $18

call_00_189b:
    call call_00_3c48                                  ;; 00:189b $cd $48 $3c
    ld   A, $80                                        ;; 00:189e $3e $80
    ld   [HL], A                                       ;; 00:18a0 $77
    rst  rst_00_0018                                   ;; 00:18a1 $df
    db   $9d                                           ;; 00:18a2 .
    call call_00_3c36                                  ;; 00:18a3 $cd $36 $3c
    call call_00_18c3                                  ;; 00:18a6 $cd $c3 $18
    call call_00_3c0b                                  ;; 00:18a9 $cd $0b $3c
    jp   call_00_18c3                                  ;; 00:18ac $c3 $c3 $18

call_00_18af:
    call call_00_3c48                                  ;; 00:18af $cd $48 $3c
    ld   A, $c0                                        ;; 00:18b2 $3e $c0
    ld   [HL], A                                       ;; 00:18b4 $77
    rst  rst_00_0018                                   ;; 00:18b5 $df
    db   $9d                                           ;; 00:18b6 .
    call call_00_3c3f                                  ;; 00:18b7 $cd $3f $3c
    call call_00_18db                                  ;; 00:18ba $cd $db $18
    call call_00_3c14                                  ;; 00:18bd $cd $14 $3c
    jp   call_00_18db                                  ;; 00:18c0 $c3 $db $18

call_00_18c3:
    call call_00_18ef                                  ;; 00:18c3 $cd $ef $18
    jr   jr_00_18cb                                    ;; 00:18c6 $18 $03

call_00_18c8:
    call call_00_18e9                                  ;; 00:18c8 $cd $e9 $18

jr_00_18cb:
    ld   A, [DE]                                       ;; 00:18cb $1a
    add  A, $01                                        ;; 00:18cc $c6 $01
    ld   [DE], A                                       ;; 00:18ce $12
    inc  DE                                            ;; 00:18cf $13
    ld   A, [DE]                                       ;; 00:18d0 $1a
    adc  A, $00                                        ;; 00:18d1 $ce $00
    and  A, [HL]                                       ;; 00:18d3 $a6
    ld   [DE], A                                       ;; 00:18d4 $12
    ret                                                ;; 00:18d5 $c9
    db   $cd, $e9, $18, $18, $03                       ;; 00:18d6 ?????

call_00_18db:
    call call_00_18ef                                  ;; 00:18db $cd $ef $18

jp_00_18de:
    ld   A, [DE]                                       ;; 00:18de $1a
    sub  A, $01                                        ;; 00:18df $d6 $01
    ld   [DE], A                                       ;; 00:18e1 $12
    inc  DE                                            ;; 00:18e2 $13
    ld   A, [DE]                                       ;; 00:18e3 $1a
    sbc  A, $00                                        ;; 00:18e4 $de $00
    and  A, [HL]                                       ;; 00:18e6 $a6
    ld   [DE], A                                       ;; 00:18e7 $12
    ret                                                ;; 00:18e8 $c9

call_00_18e9:
    ld   D, H                                          ;; 00:18e9 $54
    ld   E, L                                          ;; 00:18ea $5d
    ld   HL, wCA05                                     ;; 00:18eb $21 $05 $ca
    ret                                                ;; 00:18ee $c9

call_00_18ef:
    ld   D, H                                          ;; 00:18ef $54
    ld   E, L                                          ;; 00:18f0 $5d
    ld   HL, wCA04                                     ;; 00:18f1 $21 $04 $ca
    ret                                                ;; 00:18f4 $c9

call_00_18f5:
    call call_00_01a0                                  ;; 00:18f5 $cd $a0 $01
    jp   call_00_3a6b                                  ;; 00:18f8 $c3 $6b $3a

call_00_18fb:
    ld   B, $40                                        ;; 00:18fb $06 $40
.jr_00_18fd:
    push BC                                            ;; 00:18fd $c5
    ld   A, $01                                        ;; 00:18fe $3e $01
    rst  pushActiveBankSafe                            ;; 00:1900 $e7
    call $4f66                                         ;; 00:1901 $cd $66 $4f
    rst  popActiveBankSafe                             ;; 00:1904 $ef
    call call_00_18f5                                  ;; 00:1905 $cd $f5 $18
    pop  BC                                            ;; 00:1908 $c1
    dec  B                                             ;; 00:1909 $05
    jr   NZ, .jr_00_18fd                               ;; 00:190a $20 $f1
    ret                                                ;; 00:190c $c9

call_00_190d:
    ld   A, $3f                                        ;; 00:190d $3e $3f
    ldh  [hSFX], A                                     ;; 00:190f $e0 $bc
    xor  A, A                                          ;; 00:1911 $af
    ld   [wCA6A], A                                    ;; 00:1912 $ea $6a $ca
    ld   B, $a0                                        ;; 00:1915 $06 $a0
.jr_00_1917:
    push BC                                            ;; 00:1917 $c5
    call call_00_01d7                                  ;; 00:1918 $cd $d7 $01
    ld   A, $01                                        ;; 00:191b $3e $01
    rst  pushActiveBankSafe                            ;; 00:191d $e7
    call $53ff                                         ;; 00:191e $cd $ff $53
    rst  popActiveBankSafe                             ;; 00:1921 $ef
    call call_00_1934                                  ;; 00:1922 $cd $34 $19
    ld   A, [wCA6A]                                    ;; 00:1925 $fa $6a $ca
    inc  A                                             ;; 00:1928 $3c
    ld   [wCA6A], A                                    ;; 00:1929 $ea $6a $ca
    call call_00_18f5                                  ;; 00:192c $cd $f5 $18
    pop  BC                                            ;; 00:192f $c1
    dec  B                                             ;; 00:1930 $05
    jr   NZ, .jr_00_1917                               ;; 00:1931 $20 $e4
    ret                                                ;; 00:1933 $c9

call_00_1934:
    call call_00_3c0b                                  ;; 00:1934 $cd $0b $3c
    ld   A, [wCA6A]                                    ;; 00:1937 $fa $6a $ca
    cp   A, $50                                        ;; 00:193a $fe $50
    jr   NC, .jr_00_1947                               ;; 00:193c $30 $09
    ld   A, [HL]                                       ;; 00:193e $7e
    sub  A, $02                                        ;; 00:193f $d6 $02
    ld   [HL+], A                                      ;; 00:1941 $22
    ld   A, [HL]                                       ;; 00:1942 $7e
    sbc  A, $00                                        ;; 00:1943 $de $00
    ld   [HL], A                                       ;; 00:1945 $77
    ret                                                ;; 00:1946 $c9
.jr_00_1947:
    ld   A, [HL]                                       ;; 00:1947 $7e
    add  A, $02                                        ;; 00:1948 $c6 $02
    ld   [HL+], A                                      ;; 00:194a $22
    ld   A, [HL]                                       ;; 00:194b $7e
    adc  A, $00                                        ;; 00:194c $ce $00
    ld   [HL], A                                       ;; 00:194e $77
    ret                                                ;; 00:194f $c9

call_00_1950:
    ld   A, $1f                                        ;; 00:1950 $3e $1f
    ldh  [hSFX], A                                     ;; 00:1952 $e0 $bc
    ld   B, $a0                                        ;; 00:1954 $06 $a0
.jr_00_1956:
    push BC                                            ;; 00:1956 $c5
    call call_00_01d7                                  ;; 00:1957 $cd $d7 $01
    ld   A, $01                                        ;; 00:195a $3e $01
    rst  pushActiveBankSafe                            ;; 00:195c $e7
    call call_01_53ff ;@bank 1                         ;; 00:195d $cd $ff $53
    rst  popActiveBankSafe                             ;; 00:1960 $ef
    call call_00_18f5                                  ;; 00:1961 $cd $f5 $18
    pop  BC                                            ;; 00:1964 $c1
    dec  B                                             ;; 00:1965 $05
    jr   NZ, .jr_00_1956                               ;; 00:1966 $20 $ee
    ret                                                ;; 00:1968 $c9

call_00_1969:
    ld   A, [wCA28]                                    ;; 00:1969 $fa $28 $ca
    call doJumptable                                   ;; 00:196c $cd $3a $37
;@jumptable amount=6
    dw   call_00_197b                                  ;; 00:196f ?? $00
    dw   call_00_197c                                  ;; 00:1971 ?? $01
    dw   call_00_1987                                  ;; 00:1973 pP $02
    dw   call_00_198d                                  ;; 00:1975 pP $03
    dw   call_00_197c                                  ;; 00:1977 ?? $04
    dw   call_00_197b                                  ;; 00:1979 ?? $05

call_00_197b:
    ret                                                ;; 00:197b $c9

call_00_197c:
    call call_00_39f3                                  ;; 00:197c $cd $f3 $39
    ld   A, $20                                        ;; 00:197f $3e $20
    call call_00_3a6d                                  ;; 00:1981 $cd $6d $3a
    jp   call_00_3a0c                                  ;; 00:1984 $c3 $0c $3a

call_00_1987:
    ld   A, $01                                        ;; 00:1987 $3e $01
    ld   [wC6F2], A                                    ;; 00:1989 $ea $f2 $c6
    ret                                                ;; 00:198c $c9

call_00_198d:
    xor  A, A                                          ;; 00:198d $af
    ld   [wC6F2], A                                    ;; 00:198e $ea $f2 $c6
    ret                                                ;; 00:1991 $c9

call_00_1992:
    ret                                                ;; 00:1992 $c9

call_00_1993:
    ld   A, $0a                                        ;; 00:1993 $3e $0a
    rst  pushActiveBankSafe                            ;; 00:1995 $e7
    ld   A, [wCA28]                                    ;; 00:1996 $fa $28 $ca
    dec  A                                             ;; 00:1999 $3d
    ld   HL, $4004                                     ;; 00:199a $21 $04 $40
    call call_00_3741                                  ;; 00:199d $cd $41 $37
    rst  popActiveBankSafe                             ;; 00:19a0 $ef
    ld   A, $08                                        ;; 00:19a1 $3e $08
    ld   DE, $101                                      ;; 00:19a3 $11 $01 $01
    ld   BC, $612                                      ;; 00:19a6 $01 $12 $06
    rst  rst_00_0018                                   ;; 00:19a9 $df
    db   $a0                                           ;; 00:19aa ?
    jp   call_00_35d2                                  ;; 00:19ab $c3 $d2 $35

call_00_19ae:
    ld   A, [wCA28]                                    ;; 00:19ae $fa $28 $ca
    dec  A                                             ;; 00:19b1 $3d
    ld   [wCA2F], A                                    ;; 00:19b2 $ea $2f $ca
    rst  rst_00_0018                                   ;; 00:19b5 $df
    db   $7b                                           ;; 00:19b6 ?
    ret                                                ;; 00:19b7 $c9

call_00_19b8:
    ld   A, $01                                        ;; 00:19b8 $3e $01
    rst  pushActiveBankSafe                            ;; 00:19ba $e7
    call call_01_7972 ;@bank 1                         ;; 00:19bb $cd $72 $79
    ld   HL, $19ce                                     ;; 00:19be $21 $ce $19
    push HL                                            ;; 00:19c1 $e5
    ld   A, [wCA57]                                    ;; 00:19c2 $fa $57 $ca
    call doJumptable                                   ;; 00:19c5 $cd $3a $37
;@jumptable amount=3 bank=1
    dw   call_00_19cf                                  ;; 00:19c8 ?? $00
    dw   call_01_63e6                                  ;; 00:19ca ?? $01
    dw   call_01_642e                                  ;; 00:19cc ?? $02
    db   $ef                                           ;; 00:19ce ?

call_00_19cf:
    ret                                                ;; 00:19cf $c9

call_00_19d0:
    nop                                                ;; 00:19d0 $00
    call call_00_3a24                                  ;; 00:19d1 $cd $24 $3a
    call call_00_3a6b                                  ;; 00:19d4 $cd $6b $3a
    ld   A, $01                                        ;; 00:19d7 $3e $01
    rst  pushActiveBankSafe                            ;; 00:19d9 $e7
    call call_00_10d7                                  ;; 00:19da $cd $d7 $10
    ld   A, [wCA28]                                    ;; 00:19dd $fa $28 $ca
    cp   A, $ff                                        ;; 00:19e0 $fe $ff
    jr   Z, .jr_00_19ee                                ;; 00:19e2 $28 $0a
    or   A, $80                                        ;; 00:19e4 $f6 $80
    ldh  [hFFCA], A                                    ;; 00:19e6 $e0 $ca
    ld   L, A                                          ;; 00:19e8 $6f
    call call_00_1126                                  ;; 00:19e9 $cd $26 $11
    jr   .jr_00_19f8                                   ;; 00:19ec $18 $0a
.jr_00_19ee:
    xor  A, A                                          ;; 00:19ee $af
    ld   [wCA2D], A                                    ;; 00:19ef $ea $2d $ca
    call call_00_10f5                                  ;; 00:19f2 $cd $f5 $10
    call call_00_1126                                  ;; 00:19f5 $cd $26 $11
.jr_00_19f8:
    ld   A, $31                                        ;; 00:19f8 $3e $31
    call call_00_3cb2                                  ;; 00:19fa $cd $b2 $3c
    call C, call_00_1151                               ;; 00:19fd $dc $51 $11
    rst  popActiveBankSafe                             ;; 00:1a00 $ef
    ret                                                ;; 00:1a01 $c9

call_00_1a02:
    ld   A, $03                                        ;; 00:1a02 $3e $03
    rst  pushActiveBankSafe                            ;; 00:1a04 $e7
    ld   A, [wCA28]                                    ;; 00:1a05 $fa $28 $ca
    dec  A                                             ;; 00:1a08 $3d
    ld   HL, $762a ;@bank 3                            ;; 00:1a09 $21 $2a $76
    rst  add_hl_a                                      ;; 00:1a0c $c7
    ld   A, [HL]                                       ;; 00:1a0d $7e
    ld   [wCE94], A                                    ;; 00:1a0e $ea $94 $ce
    rst  popActiveBankSafe                             ;; 00:1a11 $ef
    ld   A, $01                                        ;; 00:1a12 $3e $01
    ld   [wCD3D], A                                    ;; 00:1a14 $ea $3d $cd
    rst  rst_00_0018                                   ;; 00:1a17 $df
    db   $6a                                           ;; 00:1a18 .
    ld   A, $01                                        ;; 00:1a19 $3e $01
    call call_00_3cb2                                  ;; 00:1a1b $cd $b2 $3c
    ret  C                                             ;; 00:1a1e $d8
    ld   A, [wCA28]                                    ;; 00:1a1f $fa $28 $ca
    cp   A, $61                                        ;; 00:1a22 $fe $61
    ret  C                                             ;; 00:1a24 $d8
    rst  rst_00_0018                                   ;; 00:1a25 $df
    db   $78                                           ;; 00:1a26 .
    ret                                                ;; 00:1a27 $c9

call_00_1a28:
    ld   A, [wCA28]                                    ;; 00:1a28 $fa $28 $ca
    ldh  [hCurrentMusic], A                            ;; 00:1a2b $e0 $ba
    ret                                                ;; 00:1a2d $c9

call_00_1a2e:
    ld   A, [wCA28]                                    ;; 00:1a2e $fa $28 $ca
    ldh  [hSFX], A                                     ;; 00:1a31 $e0 $bc
    ret                                                ;; 00:1a33 $c9

call_00_1a34:
    ld   B, $00                                        ;; 00:1a34 $06 $00
.jr_00_1a36:
    ld   A, B                                          ;; 00:1a36 $78
    call call_00_1fcd                                  ;; 00:1a37 $cd $cd $1f
    ld   DE, wC510                                     ;; 00:1a3a $11 $10 $c5
    add  HL, DE                                        ;; 00:1a3d $19
    ld   A, [HL]                                       ;; 00:1a3e $7e
    sub  A, $02                                        ;; 00:1a3f $d6 $02
    ld   [HL+], A                                      ;; 00:1a41 $22
    ld   A, [HL]                                       ;; 00:1a42 $7e
    sbc  A, $00                                        ;; 00:1a43 $de $00
    ld   [HL-], A                                      ;; 00:1a45 $32
    jr   C, .jr_00_1a4f                                ;; 00:1a46 $38 $07
    and  A, A                                          ;; 00:1a48 $a7
    jr   NZ, .jr_00_1a54                               ;; 00:1a49 $20 $09
    ld   A, [HL]                                       ;; 00:1a4b $7e
    and  A, A                                          ;; 00:1a4c $a7
    jr   NZ, .jr_00_1a54                               ;; 00:1a4d $20 $05
.jr_00_1a4f:
    ld   A, $01                                        ;; 00:1a4f $3e $01
    ld   [HL+], A                                      ;; 00:1a51 $22
    ld   [HL], $00                                     ;; 00:1a52 $36 $00
.jr_00_1a54:
    inc  B                                             ;; 00:1a54 $04
    ld   A, $05                                        ;; 00:1a55 $3e $05
    cp   A, B                                          ;; 00:1a57 $b8
    jr   NZ, .jr_00_1a36                               ;; 00:1a58 $20 $dc
    ld   A, $07                                        ;; 00:1a5a $3e $07
    ldh  [hSFX], A                                     ;; 00:1a5c $e0 $bc
    ldh  A, [rBGP]                                     ;; 00:1a5e $f0 $47
    push AF                                            ;; 00:1a60 $f5
    xor  A, A                                          ;; 00:1a61 $af
    ldh  [rBGP], A                                     ;; 00:1a62 $e0 $47
    ld   A, $02                                        ;; 00:1a64 $3e $02
    call call_00_3a6d                                  ;; 00:1a66 $cd $6d $3a
    pop  AF                                            ;; 00:1a69 $f1
    ldh  [rBGP], A                                     ;; 00:1a6a $e0 $47
    ret                                                ;; 00:1a6c $c9

call_00_1a6d:
    xor  A, A                                          ;; 00:1a6d $af
    ld   [wCD36], A                                    ;; 00:1a6e $ea $36 $cd
.jr_00_1a71:
    rst  rst_00_0018                                   ;; 00:1a71 $df
    db   $7a                                           ;; 00:1a72 ?
    ld   A, [wCD36]                                    ;; 00:1a73 $fa $36 $cd
    inc  A                                             ;; 00:1a76 $3c
    ld   [wCD36], A                                    ;; 00:1a77 $ea $36 $cd
    cp   A, $05                                        ;; 00:1a7a $fe $05
    jr   C, .jr_00_1a71                                ;; 00:1a7c $38 $f3
    ret                                                ;; 00:1a7e $c9

call_00_1a7f:
    ld   A, $01                                        ;; 00:1a7f $3e $01
    ld   [wCA51], A                                    ;; 00:1a81 $ea $51 $ca

call_00_1a84:
    ld   A, $17                                        ;; 00:1a84 $3e $17
    ldh  [hSFX], A                                     ;; 00:1a86 $e0 $bc
    rst  rst_00_0018                                   ;; 00:1a88 $df
    db   $08                                           ;; 00:1a89 .
    call call_00_39f3                                  ;; 00:1a8a $cd $f3 $39
    ld   A, $10                                        ;; 00:1a8d $3e $10
    call call_00_3a6d                                  ;; 00:1a8f $cd $6d $3a
    jp   call_00_3a0c                                  ;; 00:1a92 $c3 $0c $3a

call_00_1a95:
    ld   A, [wCA58]                                    ;; 00:1a95 $fa $58 $ca
    inc  A                                             ;; 00:1a98 $3c
    ld   [wCA58], A                                    ;; 00:1a99 $ea $58 $ca
    and  A, $01                                        ;; 00:1a9c $e6 $01
    jr   NZ, .jr_00_1aa8                               ;; 00:1a9e $20 $08
    ld   A, [wC6EE]                                    ;; 00:1aa0 $fa $ee $c6
    and  A, A                                          ;; 00:1aa3 $a7
    jr   Z, call_00_1ade                               ;; 00:1aa4 $28 $38
    jr   call_00_1ac3                                  ;; 00:1aa6 $18 $1b
.jr_00_1aa8:
    ld   A, $0b                                        ;; 00:1aa8 $3e $0b
    rst  pushActiveBankSafe                            ;; 00:1aaa $e7
    call call_00_1aea                                  ;; 00:1aab $cd $ea $1a
    ld   A, [wC6EE]                                    ;; 00:1aae $fa $ee $c6
    and  A, A                                          ;; 00:1ab1 $a7
    jr   Z, jr_00_1acf                                 ;; 00:1ab2 $28 $1b
    ld   A, $04                                        ;; 00:1ab4 $3e $04
    ld   HL, data_0b_79e0 ;@bank 11                    ;; 00:1ab6 $21 $e0 $79
    call call_00_3741                                  ;; 00:1ab9 $cd $41 $37
    call call_0b_7926 ;@bank 11                        ;; 00:1abc $cd $26 $79
    rst  popActiveBankSafe                             ;; 00:1abf $ef
    call call_00_1ac3                                  ;; 00:1ac0 $cd $c3 $1a

call_00_1ac3:
    call $441d                                         ;; 00:1ac3 $cd $1d $44
.jr_00_1ac6:
    call $445f                                         ;; 00:1ac6 $cd $5f $44
    call $41af                                         ;; 00:1ac9 $cd $af $41
    jr   NZ, .jr_00_1ac6                               ;; 00:1acc $20 $f8
    ret                                                ;; 00:1ace $c9

jr_00_1acf:
    ld   A, $05                                        ;; 00:1acf $3e $05
    ld   HL, data_0b_79e0                              ;; 00:1ad1 $21 $e0 $79
    call call_00_3741                                  ;; 00:1ad4 $cd $41 $37
    call call_0b_7926                                  ;; 00:1ad7 $cd $26 $79
    rst  popActiveBankSafe                             ;; 00:1ada $ef
    call call_00_1ade                                  ;; 00:1adb $cd $de $1a

call_00_1ade:
    call call_01_44a8                                  ;; 00:1ade $cd $a8 $44
.jr_00_1ae1:
    call call_01_44e9                                  ;; 00:1ae1 $cd $e9 $44
    call call_01_41af                                  ;; 00:1ae4 $cd $af $41
    jr   NZ, .jr_00_1ae1                               ;; 00:1ae7 $20 $f8
    ret                                                ;; 00:1ae9 $c9

call_00_1aea:
    ld   A, $3e                                        ;; 00:1aea $3e $3e
    ldh  [hSFX], A                                     ;; 00:1aec $e0 $bc
    ld   B, $04                                        ;; 00:1aee $06 $04
.jr_00_1af0:
    call call_00_1af7                                  ;; 00:1af0 $cd $f7 $1a
    dec  B                                             ;; 00:1af3 $05
    jr   NZ, .jr_00_1af0                               ;; 00:1af4 $20 $fa
    ret                                                ;; 00:1af6 $c9

call_00_1af7:
    ldh  A, [rBGP]                                     ;; 00:1af7 $f0 $47
    push AF                                            ;; 00:1af9 $f5
    xor  A, A                                          ;; 00:1afa $af
    ldh  [rBGP], A                                     ;; 00:1afb $e0 $47
    ld   A, $04                                        ;; 00:1afd $3e $04
    call call_00_3a6d                                  ;; 00:1aff $cd $6d $3a
    pop  AF                                            ;; 00:1b02 $f1
    ldh  [rBGP], A                                     ;; 00:1b03 $e0 $47
    ld   A, $04                                        ;; 00:1b05 $3e $04
    jp   call_00_3a6d                                  ;; 00:1b07 $c3 $6d $3a

call_00_1b0a:
    ld   A, $01                                        ;; 00:1b0a $3e $01
    rst  pushActiveBankSafe                            ;; 00:1b0c $e7
    call call_01_66e9                                  ;; 00:1b0d $cd $e9 $66
    rst  popActiveBankSafe                             ;; 00:1b10 $ef
    ret                                                ;; 00:1b11 $c9

call_00_1b12:
    call call_00_1b28                                  ;; 00:1b12 $cd $28 $1b
    ld   A, $01                                        ;; 00:1b15 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1b17 $e7
    call call_01_67f5                                  ;; 00:1b18 $cd $f5 $67
    rst  popActiveBankSafe                             ;; 00:1b1b $ef
    jr   call_00_1b28                                  ;; 00:1b1c $18 $0a

call_00_1b1e:
    call call_00_1b28                                  ;; 00:1b1e $cd $28 $1b
    ld   A, $01                                        ;; 00:1b21 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1b23 $e7
    call call_01_691e                                  ;; 00:1b24 $cd $1e $69
    rst  popActiveBankSafe                             ;; 00:1b27 $ef

call_00_1b28:
    xor  A, A                                          ;; 00:1b28 $af
    ld   [wCA2C], A                                    ;; 00:1b29 $ea $2c $ca
    ret                                                ;; 00:1b2c $c9

call_00_1b2d:
    call call_00_3a6b                                  ;; 00:1b2d $cd $6b $3a
    di                                                 ;; 00:1b30 $f3
    ld   HL, wC0BC                                     ;; 00:1b31 $21 $bc $c0
    ld   DE, wCA5A                                     ;; 00:1b34 $11 $5a $ca
    call call_00_1f8d                                  ;; 00:1b37 $cd $8d $1f
    ld   HL, wC0B9                                     ;; 00:1b3a $21 $b9 $c0
    ld   DE, wCA5D                                     ;; 00:1b3d $11 $5d $ca
    call call_00_1f8d                                  ;; 00:1b40 $cd $8d $1f
    ld   HL, $11e3                                     ;; 00:1b43 $21 $e3 $11
    call call_00_3d5a                                  ;; 00:1b46 $cd $5a $3d
    ld   HL, $11a2                                     ;; 00:1b49 $21 $a2 $11
    call call_00_3d46                                  ;; 00:1b4c $cd $46 $3d
    reti                                               ;; 00:1b4f $d9

jp_00_1b50:
    di                                                 ;; 00:1b50 $f3
    ld   HL, wCA5A                                     ;; 00:1b51 $21 $5a $ca
    ld   DE, wC0BC                                     ;; 00:1b54 $11 $bc $c0
    call call_00_1f8d                                  ;; 00:1b57 $cd $8d $1f
    ld   HL, wCA5D                                     ;; 00:1b5a $21 $5d $ca
    ld   DE, wC0B9                                     ;; 00:1b5d $11 $b9 $c0
    call call_00_1f8d                                  ;; 00:1b60 $cd $8d $1f
    reti                                               ;; 00:1b63 $d9

call_00_1b64:
    ld   A, [wC6E8]                                    ;; 00:1b64 $fa $e8 $c6
    cp   A, $0a                                        ;; 00:1b67 $fe $0a
    ret  NC                                            ;; 00:1b69 $d0
    ld   [wC7CB], A                                    ;; 00:1b6a $ea $cb $c7
    ld   A, [wC6EE]                                    ;; 00:1b6d $fa $ee $c6
    add  A, $80                                        ;; 00:1b70 $c6 $80
    ld   [wC6F7], A                                    ;; 00:1b72 $ea $f7 $c6
    ld   A, [wC6E4]                                    ;; 00:1b75 $fa $e4 $c6
    swap A                                             ;; 00:1b78 $cb $37
    ld   B, A                                          ;; 00:1b7a $47
    ld   A, [wC6E5]                                    ;; 00:1b7b $fa $e5 $c6
    swap A                                             ;; 00:1b7e $cb $37
    or   A, B                                          ;; 00:1b80 $b0
    ld   [wC7C9], A                                    ;; 00:1b81 $ea $c9 $c7
    ld   A, [wC6E6]                                    ;; 00:1b84 $fa $e6 $c6
    swap A                                             ;; 00:1b87 $cb $37
    ld   B, A                                          ;; 00:1b89 $47
    ld   A, [wC6E7]                                    ;; 00:1b8a $fa $e7 $c6
    swap A                                             ;; 00:1b8d $cb $37
    or   A, B                                          ;; 00:1b8f $b0
    ld   [wC7CA], A                                    ;; 00:1b90 $ea $ca $c7
    ld   A, [wC6F7]                                    ;; 00:1b93 $fa $f7 $c6
    and  A, A                                          ;; 00:1b96 $a7
    jr   Z, .jr_00_1ba7                                ;; 00:1b97 $28 $0e
    cp   A, $40                                        ;; 00:1b99 $fe $40
    jr   Z, .jr_00_1bad                                ;; 00:1b9b $28 $10
    cp   A, $80                                        ;; 00:1b9d $fe $80
    jr   Z, .jr_00_1bb7                                ;; 00:1b9f $28 $16
    ld   A, [wC7CA]                                    ;; 00:1ba1 $fa $ca $c7
    dec  A                                             ;; 00:1ba4 $3d
    jr   .jr_00_1bb1                                   ;; 00:1ba5 $18 $0a
.jr_00_1ba7:
    ld   A, [wC7C9]                                    ;; 00:1ba7 $fa $c9 $c7
    dec  A                                             ;; 00:1baa $3d
    jr   .jr_00_1bbb                                   ;; 00:1bab $18 $0e
.jr_00_1bad:
    ld   A, [wC7CA]                                    ;; 00:1bad $fa $ca $c7
    inc  A                                             ;; 00:1bb0 $3c
.jr_00_1bb1:
    and  A, $3f                                        ;; 00:1bb1 $e6 $3f
    ld   [wC7CA], A                                    ;; 00:1bb3 $ea $ca $c7
    ret                                                ;; 00:1bb6 $c9
.jr_00_1bb7:
    ld   A, [wC7C9]                                    ;; 00:1bb7 $fa $c9 $c7
    inc  A                                             ;; 00:1bba $3c
.jr_00_1bbb:
    and  A, $3f                                        ;; 00:1bbb $e6 $3f
    ld   [wC7C9], A                                    ;; 00:1bbd $ea $c9 $c7
    ret                                                ;; 00:1bc0 $c9

call_00_1bc1:
    call call_00_1aea                                  ;; 00:1bc1 $cd $ea $1a
    ld   A, $01                                        ;; 00:1bc4 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1bc6 $e7
    call call_00_3a6b                                  ;; 00:1bc7 $cd $6b $3a
    call $5b4d                                         ;; 00:1bca $cd $4d $5b
    rst  popActiveBankSafe                             ;; 00:1bcd $ef
    ret                                                ;; 00:1bce $c9

call_00_1bcf:
    ld   A, $01                                        ;; 00:1bcf $3e $01
    rst  pushActiveBankSafe                            ;; 00:1bd1 $e7
    call $5a6b                                         ;; 00:1bd2 $cd $6b $5a
    rst  popActiveBankSafe                             ;; 00:1bd5 $ef
    ret                                                ;; 00:1bd6 $c9

call_00_1bd7:
    xor  A, A                                          ;; 00:1bd7 $af
    ld   HL, $7a7d                                     ;; 00:1bd8 $21 $7d $7a
    ld   BC, $612                                      ;; 00:1bdb $01 $12 $06
    ld   DE, $101                                      ;; 00:1bde $11 $01 $01
    rst  rst_00_0018                                   ;; 00:1be1 $df
    db   $a0                                           ;; 00:1be2 ?
    ret                                                ;; 00:1be3 $c9

call_00_1be4:
    ld   A, $1c                                        ;; 00:1be4 $3e $1c
    ldh  [hSFX], A                                     ;; 00:1be6 $e0 $bc
    ld   A, $01                                        ;; 00:1be8 $3e $01
    ld   [wC6F2], A                                    ;; 00:1bea $ea $f2 $c6
    ld   A, $08                                        ;; 00:1bed $3e $08
    call call_00_3a6d                                  ;; 00:1bef $cd $6d $3a
    ld   A, $0b                                        ;; 00:1bf2 $3e $0b
    rst  pushActiveBankSafe                            ;; 00:1bf4 $e7
    call call_00_1c51                                  ;; 00:1bf5 $cd $51 $1c
    rst  popActiveBankSafe                             ;; 00:1bf8 $ef
    ld   A, $01                                        ;; 00:1bf9 $3e $01
    rst  pushActiveBankSafe                            ;; 00:1bfb $e7
    call call_00_0e34                                  ;; 00:1bfc $cd $34 $0e
    rst  popActiveBankSafe                             ;; 00:1bff $ef
    xor  A, A                                          ;; 00:1c00 $af
    ld   [wC6F2], A                                    ;; 00:1c01 $ea $f2 $c6
    ld   [wCA52], A                                    ;; 00:1c04 $ea $52 $ca
    ld   [wCA6D], A                                    ;; 00:1c07 $ea $6d $ca
    ld   A, [wCA01]                                    ;; 00:1c0a $fa $01 $ca
    inc  A                                             ;; 00:1c0d $3c
    ld   [wCA01], A                                    ;; 00:1c0e $ea $01 $ca
    cp   A, $04                                        ;; 00:1c11 $fe $04
    ret  NZ                                            ;; 00:1c13 $c0
    ld   A, [wC6E8]                                    ;; 00:1c14 $fa $e8 $c6
    cp   A, $7c                                        ;; 00:1c17 $fe $7c
    jr   Z, .jr_00_1c26                                ;; 00:1c19 $28 $0b
    cp   A, $7d                                        ;; 00:1c1b $fe $7d
    jr   Z, .jr_00_1c2d                                ;; 00:1c1d $28 $0e
    ld   A, $e6                                        ;; 00:1c1f $3e $e6
    call call_00_3ca0                                  ;; 00:1c21 $cd $a0 $3c
    jr   .jr_00_1c32                                   ;; 00:1c24 $18 $0c
.jr_00_1c26:
    ld   A, $e4                                        ;; 00:1c26 $3e $e4
    call call_00_3ca0                                  ;; 00:1c28 $cd $a0 $3c
    jr   .jr_00_1c32                                   ;; 00:1c2b $18 $05
.jr_00_1c2d:
    ld   A, $e5                                        ;; 00:1c2d $3e $e5
    call call_00_3ca0                                  ;; 00:1c2f $cd $a0 $3c
.jr_00_1c32:
    ld   A, $e4                                        ;; 00:1c32 $3e $e4
    call call_00_3cb2                                  ;; 00:1c34 $cd $b2 $3c
    ret  NC                                            ;; 00:1c37 $d0
    ld   A, $e5                                        ;; 00:1c38 $3e $e5
    call call_00_3cb2                                  ;; 00:1c3a $cd $b2 $3c
    ret  NC                                            ;; 00:1c3d $d0
    ld   A, $e6                                        ;; 00:1c3e $3e $e6
    call call_00_3cb2                                  ;; 00:1c40 $cd $b2 $3c
    ret  NC                                            ;; 00:1c43 $d0
    xor  A, A                                          ;; 00:1c44 $af
    ld   HL, $7cf1                                     ;; 00:1c45 $21 $f1 $7c
    ld   BC, $612                                      ;; 00:1c48 $01 $12 $06
    ld   DE, $101                                      ;; 00:1c4b $11 $01 $01
    rst  rst_00_0018                                   ;; 00:1c4e $df
    db   $a0                                           ;; 00:1c4f ?
    ret                                                ;; 00:1c50 $c9

call_00_1c51:
    ld   A, $0b                                        ;; 00:1c51 $3e $0b
    rst  pushActiveBankSafe                            ;; 00:1c53 $e7
    ldh  A, [hFF96]                                    ;; 00:1c54 $f0 $96
    push AF                                            ;; 00:1c56 $f5
    ld   A, [wCA6D]                                    ;; 00:1c57 $fa $6d $ca
    ldh  [hFF96], A                                    ;; 00:1c5a $e0 $96
    call call_00_3c36                                  ;; 00:1c5c $cd $36 $3c
    ld   A, [HL+]                                      ;; 00:1c5f $2a
    swap A                                             ;; 00:1c60 $cb $37
    ld   B, A                                          ;; 00:1c62 $47
    ld   A, [HL]                                       ;; 00:1c63 $7e
    swap A                                             ;; 00:1c64 $cb $37
    or   A, B                                          ;; 00:1c66 $b0
    ld   B, A                                          ;; 00:1c67 $47
    call call_00_3c3f                                  ;; 00:1c68 $cd $3f $3c
    ld   A, [HL+]                                      ;; 00:1c6b $2a
    swap A                                             ;; 00:1c6c $cb $37
    ld   C, A                                          ;; 00:1c6e $4f
    ld   A, [HL]                                       ;; 00:1c6f $7e
    swap A                                             ;; 00:1c70 $cb $37
    or   A, C                                          ;; 00:1c72 $b1
    ld   C, A                                          ;; 00:1c73 $4f
    ld   HL, $7cc7                                     ;; 00:1c74 $21 $c7 $7c
    call $792d                                         ;; 00:1c77 $cd $2d $79
    pop  AF                                            ;; 00:1c7a $f1
    ldh  [hFF96], A                                    ;; 00:1c7b $e0 $96
    ret                                                ;; 00:1c7d $c9

call_00_1c7e:
    push AF                                            ;; 00:1c7e $f5
    push BC                                            ;; 00:1c7f $c5
    ld   C, L                                          ;; 00:1c80 $4d
    ld   B, H                                          ;; 00:1c81 $44
    ld   HL, $00                                       ;; 00:1c82 $21 $00 $00
    ld   A, $10                                        ;; 00:1c85 $3e $10
.jr_00_1c87:
    rr   D                                             ;; 00:1c87 $cb $1a
    rr   E                                             ;; 00:1c89 $cb $1b
    jr   NC, .jr_00_1c8e                               ;; 00:1c8b $30 $01
    add  HL, BC                                        ;; 00:1c8d $09
.jr_00_1c8e:
    rr   H                                             ;; 00:1c8e $cb $1c
    rr   L                                             ;; 00:1c90 $cb $1d
    dec  A                                             ;; 00:1c92 $3d
    jr   NZ, .jr_00_1c87                               ;; 00:1c93 $20 $f2
    rr   D                                             ;; 00:1c95 $cb $1a
    rr   E                                             ;; 00:1c97 $cb $1b
    pop  BC                                            ;; 00:1c99 $c1
    pop  AF                                            ;; 00:1c9a $f1
    ret                                                ;; 00:1c9b $c9

call_00_1c9c:
    di                                                 ;; 00:1c9c $f3
    push AF                                            ;; 00:1c9d $f5
    push BC                                            ;; 00:1c9e $c5
    ld   A, $31                                        ;; 00:1c9f $3e $31
    ld   [wC0C0], A                                    ;; 00:1ca1 $ea $c0 $c0
    ld   A, $c9                                        ;; 00:1ca4 $3e $c9
    ld   [wC0C3], A                                    ;; 00:1ca6 $ea $c3 $c0
    ld   C, L                                          ;; 00:1ca9 $4d
    ld   B, H                                          ;; 00:1caa $44
    ld   HL, $1cd2                                     ;; 00:1cab $21 $d2 $1c
    push HL                                            ;; 00:1cae $e5
    ld   [wC0C1], SP                                   ;; 00:1caf $08 $c1 $c0
    ld   A, E                                          ;; 00:1cb2 $7b
    cpl                                                ;; 00:1cb3 $2f
    ld   L, A                                          ;; 00:1cb4 $6f
    ld   A, D                                          ;; 00:1cb5 $7a
    cpl                                                ;; 00:1cb6 $2f
    ld   H, A                                          ;; 00:1cb7 $67
    inc  HL                                            ;; 00:1cb8 $23
    ld   SP, HL                                        ;; 00:1cb9 $f9
    ld   HL, $00                                       ;; 00:1cba $21 $00 $00
    ld   A, $10                                        ;; 00:1cbd $3e $10
.jr_00_1cbf:
    sla  C                                             ;; 00:1cbf $cb $21
    rl   B                                             ;; 00:1cc1 $cb $10
    rl   L                                             ;; 00:1cc3 $cb $15
    rl   H                                             ;; 00:1cc5 $cb $14
    add  HL, SP                                        ;; 00:1cc7 $39
    jr   C, .jr_00_1ccc                                ;; 00:1cc8 $38 $02
    add  HL, DE                                        ;; 00:1cca $19
    inc  C                                             ;; 00:1ccb $0c
.jr_00_1ccc:
    dec  A                                             ;; 00:1ccc $3d
    jr   NZ, .jr_00_1cbf                               ;; 00:1ccd $20 $f0
    jp   wC0C0                                         ;; 00:1ccf $c3 $c0 $c0
    push HL                                            ;; 00:1cd2 $e5
    ld   A, C                                          ;; 00:1cd3 $79
    cpl                                                ;; 00:1cd4 $2f
    ld   L, A                                          ;; 00:1cd5 $6f
    ld   A, B                                          ;; 00:1cd6 $78
    cpl                                                ;; 00:1cd7 $2f
    ld   H, A                                          ;; 00:1cd8 $67
    pop  DE                                            ;; 00:1cd9 $d1
    pop  BC                                            ;; 00:1cda $c1
    pop  AF                                            ;; 00:1cdb $f1
    reti                                               ;; 00:1cdc $d9

call_00_1cdd:
    ld_long_store hFF9F, A                             ;; 00:1cdd $ea $9f $ff
    push DE                                            ;; 00:1ce0 $d5
    push HL                                            ;; 00:1ce1 $e5
    ld   A, [DE]                                       ;; 00:1ce2 $1a
    add  A, [HL]                                       ;; 00:1ce3 $86
    ld   [DE], A                                       ;; 00:1ce4 $12
    inc  DE                                            ;; 00:1ce5 $13
    inc  HL                                            ;; 00:1ce6 $23
    ld   A, [DE]                                       ;; 00:1ce7 $1a
    adc  A, [HL]                                       ;; 00:1ce8 $8e
    ld   [DE], A                                       ;; 00:1ce9 $12
    inc  DE                                            ;; 00:1cea $13
    inc  HL                                            ;; 00:1ceb $23
    ld   A, [DE]                                       ;; 00:1cec $1a
    adc  A, [HL]                                       ;; 00:1ced $8e
    ld   [DE], A                                       ;; 00:1cee $12
    pop  HL                                            ;; 00:1cef $e1
    pop  DE                                            ;; 00:1cf0 $d1
    ld_long_load A, hFF9F                              ;; 00:1cf1 $fa $9f $ff
    ret                                                ;; 00:1cf4 $c9

call_00_1cf5:
    ld_long_store hFF9F, A                             ;; 00:1cf5 $ea $9f $ff
    push BC                                            ;; 00:1cf8 $c5
    push DE                                            ;; 00:1cf9 $d5
    push HL                                            ;; 00:1cfa $e5
    ld   A, [DE]                                       ;; 00:1cfb $1a
    sub  A, [HL]                                       ;; 00:1cfc $96
    ld   [DE], A                                       ;; 00:1cfd $12
    ld   C, A                                          ;; 00:1cfe $4f
    inc  DE                                            ;; 00:1cff $13
    inc  HL                                            ;; 00:1d00 $23
    ld   A, [DE]                                       ;; 00:1d01 $1a
    sbc  A, [HL]                                       ;; 00:1d02 $9e
    ld   [DE], A                                       ;; 00:1d03 $12
    ld   B, A                                          ;; 00:1d04 $47
    inc  DE                                            ;; 00:1d05 $13
    inc  HL                                            ;; 00:1d06 $23
    ld   A, [DE]                                       ;; 00:1d07 $1a
    sbc  A, [HL]                                       ;; 00:1d08 $9e
    ld   [DE], A                                       ;; 00:1d09 $12
    jr   jr_00_1d1e                                    ;; 00:1d0a $18 $12

call_00_1d0c:
    ld_long_store hFF9F, A                             ;; 00:1d0c $ea $9f $ff
    push BC                                            ;; 00:1d0f $c5
    push DE                                            ;; 00:1d10 $d5
    push HL                                            ;; 00:1d11 $e5
    ld   A, [DE]                                       ;; 00:1d12 $1a
    sub  A, [HL]                                       ;; 00:1d13 $96
    ld   C, A                                          ;; 00:1d14 $4f
    inc  DE                                            ;; 00:1d15 $13
    inc  HL                                            ;; 00:1d16 $23
    ld   A, [DE]                                       ;; 00:1d17 $1a
    sbc  A, [HL]                                       ;; 00:1d18 $9e
    ld   B, A                                          ;; 00:1d19 $47
    inc  DE                                            ;; 00:1d1a $13
    inc  HL                                            ;; 00:1d1b $23
    ld   A, [DE]                                       ;; 00:1d1c $1a
    sbc  A, [HL]                                       ;; 00:1d1d $9e

jr_00_1d1e:
    jr   C, jr_00_1d24                                 ;; 00:1d1e $38 $04
    or   A, C                                          ;; 00:1d20 $b1
    or   A, B                                          ;; 00:1d21 $b0
    jr   jr_00_1d27                                    ;; 00:1d22 $18 $03

jr_00_1d24:
    or   A, C                                          ;; 00:1d24 $b1
    or   A, B                                          ;; 00:1d25 $b0
    scf                                                ;; 00:1d26 $37

jr_00_1d27:
    pop  HL                                            ;; 00:1d27 $e1
    pop  DE                                            ;; 00:1d28 $d1
    pop  BC                                            ;; 00:1d29 $c1
    ld_long_load A, hFF9F                              ;; 00:1d2a $fa $9f $ff
    ret                                                ;; 00:1d2d $c9

call_00_1d2e:
    push DE                                            ;; 00:1d2e $d5
    push HL                                            ;; 00:1d2f $e5
    ld   A, D                                          ;; 00:1d30 $7a
    or   A, A                                          ;; 00:1d31 $b7
    jr   NZ, .jr_00_1d37                               ;; 00:1d32 $20 $03
    xor  A, A                                          ;; 00:1d34 $af
    jr   .jr_00_1d4f                                   ;; 00:1d35 $18 $18
.jr_00_1d37:
    call call_00_39d5                                  ;; 00:1d37 $cd $d5 $39
    or   A, A                                          ;; 00:1d3a $b7
    jr   Z, .jr_00_1d4f                                ;; 00:1d3b $28 $12
    push AF                                            ;; 00:1d3d $f5
    ld   A, D                                          ;; 00:1d3e $7a
    cp   A, $09                                        ;; 00:1d3f $fe $09
    jr   NC, .jr_00_1d48                               ;; 00:1d41 $30 $05
    pop  AF                                            ;; 00:1d43 $f1
    and  A, $07                                        ;; 00:1d44 $e6 $07
    jr   .jr_00_1d49                                   ;; 00:1d46 $18 $01
.jr_00_1d48:
    pop  AF                                            ;; 00:1d48 $f1
.jr_00_1d49:
    cp   A, D                                          ;; 00:1d49 $ba
    jr   C, .jr_00_1d4f                                ;; 00:1d4a $38 $03
    sub  A, D                                          ;; 00:1d4c $92
    jr   .jr_00_1d49                                   ;; 00:1d4d $18 $fa
.jr_00_1d4f:
    pop  HL                                            ;; 00:1d4f $e1
    pop  DE                                            ;; 00:1d50 $d1
    ret                                                ;; 00:1d51 $c9
    db   $3e, $0c, $e7, $cd, $63, $7f, $ef, $c9        ;; 00:1d52 ????????
    db   $3e, $0c, $e7, $cd, $9e, $7f, $ef, $c9        ;; 00:1d5a ????????

call_00_1d62:
    rst  rst_00_0018                                   ;; 00:1d62 $df
    db   $ad                                           ;; 00:1d63 .
    rst  rst_00_0018                                   ;; 00:1d64 $df
    db   $1e                                           ;; 00:1d65 .
    jp   call_00_1dfd                                  ;; 00:1d66 $c3 $fd $1d
    ld   A, $01                                        ;; 00:1d69 $3e $01
    ld   [wCE88], A                                    ;; 00:1d6b $ea $88 $ce
    rst  rst_00_0018                                   ;; 00:1d6e $df
    db   $1c                                           ;; 00:1d6f .
    ret                                                ;; 00:1d70 $c9
    db   $df, $1d, $c9, $df, $19, $c9                  ;; 00:1d71 ??????
    ld   A, $02                                        ;; 00:1d77 $3e $02
    ld   [wCE88], A                                    ;; 00:1d79 $ea $88 $ce
    rst  rst_00_0018                                   ;; 00:1d7c $df
    db   $1c                                           ;; 00:1d7d .
    ret                                                ;; 00:1d7e $c9

call_00_1d7f:
    ld   A, $03                                        ;; 00:1d7f $3e $03
    rst  pushActiveBankSafe                            ;; 00:1d81 $e7
    ld   HL, $5c00                                     ;; 00:1d82 $21 $00 $5c
    ld   DE, $6287                                     ;; 00:1d85 $11 $87 $62
    ld   BC, wD000                                     ;; 00:1d88 $01 $00 $d0
    call call_00_3d76                                  ;; 00:1d8b $cd $76 $3d
    rst  popActiveBankSafe                             ;; 00:1d8e $ef
    ret                                                ;; 00:1d8f $c9
    db   $3e, $06, $e7, $cd, $bf, $05, $ef, $c9        ;; 00:1d90 ????????

call_00_1d98:
    push HL                                            ;; 00:1d98 $e5
    ld   HL, wCD3D                                     ;; 00:1d99 $21 $3d $cd
    inc  [HL]                                          ;; 00:1d9c $34
    pop  HL                                            ;; 00:1d9d $e1

call_00_1d9e:
    di                                                 ;; 00:1d9e $f3
    push AF                                            ;; 00:1d9f $f5
    push HL                                            ;; 00:1da0 $e5
    ld   HL, wCDCE                                     ;; 00:1da1 $21 $ce $cd
    ld   A, [HL]                                       ;; 00:1da4 $7e
    inc  [HL]                                          ;; 00:1da5 $34
    or   A, A                                          ;; 00:1da6 $b7
    jp   NZ, jp_00_1e2e                                ;; 00:1da7 $c2 $2e $1e
    push BC                                            ;; 00:1daa $c5
    push DE                                            ;; 00:1dab $d5
    call call_00_1e38                                  ;; 00:1dac $cd $38 $1e
    ldh  A, [rIE]                                      ;; 00:1daf $f0 $ff
    ld   [wCDD0], A                                    ;; 00:1db1 $ea $d0 $cd
    ldh  A, [rSTAT]                                    ;; 00:1db4 $f0 $41
    ld   [wCDCF], A                                    ;; 00:1db6 $ea $cf $cd
    ldh  A, [rLYC]                                     ;; 00:1db9 $f0 $45
    ld   [wCDCA], A                                    ;; 00:1dbb $ea $ca $cd
    ld   HL, wC0BC                                     ;; 00:1dbe $21 $bc $c0
    ld   DE, wCDC7                                     ;; 00:1dc1 $11 $c7 $cd
    call call_00_1f8d                                  ;; 00:1dc4 $cd $8d $1f
    ld   HL, wC0B9                                     ;; 00:1dc7 $21 $b9 $c0
    ld   DE, wCDCB                                     ;; 00:1dca $11 $cb $cd
    call call_00_1f8d                                  ;; 00:1dcd $cd $8d $1f
    ld   HL, rIE                                       ;; 00:1dd0 $21 $ff $ff
    set  0, [HL]                                       ;; 00:1dd3 $cb $c6
    set  1, [HL]                                       ;; 00:1dd5 $cb $ce
    ld   A, $40                                        ;; 00:1dd7 $3e $40
    ldh  [rSTAT], A                                    ;; 00:1dd9 $e0 $41
    ld   A, $03                                        ;; 00:1ddb $3e $03
    ldh  [rLYC], A                                     ;; 00:1ddd $e0 $45
    ld   HL, $1e40                                     ;; 00:1ddf $21 $40 $1e
    ld   DE, wC0BC                                     ;; 00:1de2 $11 $bc $c0
    call call_00_1f8d                                  ;; 00:1de5 $cd $8d $1f
    ld   HL, $1e43                                     ;; 00:1de8 $21 $43 $1e
    ld   DE, wC0B9                                     ;; 00:1deb $11 $b9 $c0
    call call_00_1f8d                                  ;; 00:1dee $cd $8d $1f
    jr   jr_00_1e2c                                    ;; 00:1df1 $18 $39

call_00_1df3:
    call call_00_1dfd                                  ;; 00:1df3 $cd $fd $1d
    push HL                                            ;; 00:1df6 $e5
    ld   HL, wCD3D                                     ;; 00:1df7 $21 $3d $cd
    dec  [HL]                                          ;; 00:1dfa $35
    pop  HL                                            ;; 00:1dfb $e1
    ret                                                ;; 00:1dfc $c9

call_00_1dfd:
    di                                                 ;; 00:1dfd $f3
    push AF                                            ;; 00:1dfe $f5
    push HL                                            ;; 00:1dff $e5
    ld   HL, wCDCE                                     ;; 00:1e00 $21 $ce $cd
    dec  [HL]                                          ;; 00:1e03 $35
    jr   NZ, jp_00_1e2e                                ;; 00:1e04 $20 $28
    push BC                                            ;; 00:1e06 $c5
    push DE                                            ;; 00:1e07 $d5
    call call_00_1e38                                  ;; 00:1e08 $cd $38 $1e
    ld   A, [wCDD0]                                    ;; 00:1e0b $fa $d0 $cd
    ldh  [rIE], A                                      ;; 00:1e0e $e0 $ff
    ld   A, [wCDCF]                                    ;; 00:1e10 $fa $cf $cd
    ldh  [rSTAT], A                                    ;; 00:1e13 $e0 $41
    ld   A, [wCDCA]                                    ;; 00:1e15 $fa $ca $cd
    ldh  [rLYC], A                                     ;; 00:1e18 $e0 $45
    ld   HL, wCDC7                                     ;; 00:1e1a $21 $c7 $cd
    ld   DE, wC0BC                                     ;; 00:1e1d $11 $bc $c0
    call call_00_1f8d                                  ;; 00:1e20 $cd $8d $1f
    ld   HL, wCDCB                                     ;; 00:1e23 $21 $cb $cd
    ld   DE, wC0B9                                     ;; 00:1e26 $11 $b9 $c0
    call call_00_1f8d                                  ;; 00:1e29 $cd $8d $1f

jr_00_1e2c:
    pop  DE                                            ;; 00:1e2c $d1
    pop  BC                                            ;; 00:1e2d $c1

jp_00_1e2e:
    ldh  A, [rSTAT]                                    ;; 00:1e2e $f0 $41
    and  A, $03                                        ;; 00:1e30 $e6 $03
    dec  A                                             ;; 00:1e32 $3d
    jr   NZ, jp_00_1e2e                                ;; 00:1e33 $20 $f9
    pop  HL                                            ;; 00:1e35 $e1
    pop  AF                                            ;; 00:1e36 $f1
    reti                                               ;; 00:1e37 $d9

call_00_1e38:
    ld   A, [wCD3D]                                    ;; 00:1e38 $fa $3d $cd
    or   A, A                                          ;; 00:1e3b $b7
    jp   NZ, call_00_3549                              ;; 00:1e3c $c2 $49 $35
    ret                                                ;; 00:1e3f $c9
    db   $c3                                           ;; 00:1e40 .
    dw   data_00_1f27                                  ;; 00:1e41 pP
    db   $c3                                           ;; 00:1e43 .
    dw   data_00_1efa                                  ;; 00:1e44 pP

call_00_1e46:
    rst  rst_00_0018                                   ;; 00:1e46 $df
    db   $9b                                           ;; 00:1e47 .
    ret                                                ;; 00:1e48 $c9

call_00_1e49:
    ld   A, $09                                        ;; 00:1e49 $3e $09
    rst  pushActiveBankSafe                            ;; 00:1e4b $e7
    call call_09_4fef                                  ;; 00:1e4c $cd $ef $4f
    rst  popActiveBankSafe                             ;; 00:1e4f $ef
    ret                                                ;; 00:1e50 $c9

call_00_1e51:
    ldh  A, [hFF8A]                                    ;; 00:1e51 $f0 $8a
    and  A, $0b                                        ;; 00:1e53 $e6 $0b
    jr   Z, .jr_00_1e59                                ;; 00:1e55 $28 $02
    rst  rst_00_0018                                   ;; 00:1e57 $df
    db   $3e                                           ;; 00:1e58 .
.jr_00_1e59:
    pop  HL                                            ;; 00:1e59 $e1
    push HL                                            ;; 00:1e5a $e5
    ld   DE, $1e57                                     ;; 00:1e5b $11 $57 $1e
    push DE                                            ;; 00:1e5e $d5
.jr_00_1e5f:
    call call_00_358b                                  ;; 00:1e5f $cd $8b $35
    ldh  A, [hFF8B]                                    ;; 00:1e62 $f0 $8b
    ld   [wCDAF], A                                    ;; 00:1e64 $ea $af $cd
    ldh  A, [hFF8A]                                    ;; 00:1e67 $f0 $8a
    and  A, $fb                                        ;; 00:1e69 $e6 $fb
    jr   Z, .jr_00_1e5f                                ;; 00:1e6b $28 $f2
    call call_00_1ee7                                  ;; 00:1e6d $cd $e7 $1e
    cp   A, $04                                        ;; 00:1e70 $fe $04
    call C, call_00_1e7c                               ;; 00:1e72 $dc $7c $1e
    push HL                                            ;; 00:1e75 $e5
    jp   doJumptable                                   ;; 00:1e76 $c3 $3a $37

call_00_1e79:
    pop  HL                                            ;; 00:1e79 $e1
    pop  HL                                            ;; 00:1e7a $e1
    ret                                                ;; 00:1e7b $c9

call_00_1e7c:
    push AF                                            ;; 00:1e7c $f5
    ld   A, $3a                                        ;; 00:1e7d $3e $3a
    ldh  [hSFX], A                                     ;; 00:1e7f $e0 $bc
    pop  AF                                            ;; 00:1e81 $f1
    ret                                                ;; 00:1e82 $c9

call_00_1e83:
    push AF                                            ;; 00:1e83 $f5
    ld   A, $3b                                        ;; 00:1e84 $3e $3b
    ldh  [hSFX], A                                     ;; 00:1e86 $e0 $bc
    ld   A, $02                                        ;; 00:1e88 $3e $02
    call call_00_3a6d                                  ;; 00:1e8a $cd $6d $3a
    pop  AF                                            ;; 00:1e8d $f1
    ret                                                ;; 00:1e8e $c9

call_00_1e8f:
    ld   A, [HL]                                       ;; 00:1e8f $7e
    cp   A, $ff                                        ;; 00:1e90 $fe $ff
    jr   Z, .jr_00_1ea4                                ;; 00:1e92 $28 $10
    cp   A, $30                                        ;; 00:1e94 $fe $30
    jr   C, .jr_00_1eaa                                ;; 00:1e96 $38 $12
    sub  A, $30                                        ;; 00:1e98 $d6 $30
    call call_00_245f                                  ;; 00:1e9a $cd $5f $24
    ld   DE, $6ebb                                     ;; 00:1e9d $11 $bb $6e
    add  HL, DE                                        ;; 00:1ea0 $19
    ld   C, $08                                        ;; 00:1ea1 $0e $08
    ret                                                ;; 00:1ea3 $c9
.jr_00_1ea4:
    ld   HL, $3155                                     ;; 00:1ea4 $21 $55 $31
    ld   C, $08                                        ;; 00:1ea7 $0e $08
    ret                                                ;; 00:1ea9 $c9
.jr_00_1eaa:
    call call_00_2448                                  ;; 00:1eaa $cd $48 $24
    ld   DE, $6d9b                                     ;; 00:1ead $11 $9b $6d
    add  HL, DE                                        ;; 00:1eb0 $19
    ld   C, $06                                        ;; 00:1eb1 $0e $06
    ret                                                ;; 00:1eb3 $c9

jp_00_1eb4:
    ld   A, $09                                        ;; 00:1eb4 $3e $09
    rst  pushActiveBankSafe                            ;; 00:1eb6 $e7
    ld   B, [HL]                                       ;; 00:1eb7 $46
    rst  popActiveBankSafe                             ;; 00:1eb8 $ef
    ld   A, B                                          ;; 00:1eb9 $78
    ret                                                ;; 00:1eba $c9

call_00_1ebb:
    ld   A, $09                                        ;; 00:1ebb $3e $09
    rst  pushActiveBankSafe                            ;; 00:1ebd $e7
    ld   A, $4c                                        ;; 00:1ebe $3e $4c
.jr_00_1ec0:
    inc  HL                                            ;; 00:1ec0 $23
    cp   A, [HL]                                       ;; 00:1ec1 $be
    jr   NZ, .jr_00_1ec0                               ;; 00:1ec2 $20 $fc
    dec  B                                             ;; 00:1ec4 $05
    jr   NZ, .jr_00_1ec0                               ;; 00:1ec5 $20 $f9
    rst  popActiveBankSafe                             ;; 00:1ec7 $ef
    ret                                                ;; 00:1ec8 $c9

call_00_1ec9:
    ld   A, $09                                        ;; 00:1ec9 $3e $09
    rst  pushActiveBankSafe                            ;; 00:1ecb $e7
    ld   A, $4c                                        ;; 00:1ecc $3e $4c
.jr_00_1ece:
    dec  HL                                            ;; 00:1ece $2b
    cp   A, [HL]                                       ;; 00:1ecf $be
    jr   NZ, .jr_00_1ece                               ;; 00:1ed0 $20 $fc
    dec  B                                             ;; 00:1ed2 $05
    jr   NZ, .jr_00_1ece                               ;; 00:1ed3 $20 $f9
    rst  popActiveBankSafe                             ;; 00:1ed5 $ef
    ret                                                ;; 00:1ed6 $c9

jp_00_1ed7:
    ld   A, [wCD42]                                    ;; 00:1ed7 $fa $42 $cd
    or   A, A                                          ;; 00:1eda $b7
    ret  Z                                             ;; 00:1edb $c8
    ld   A, $0b                                        ;; 00:1edc $3e $0b
    call pushActiveBank                                ;; 00:1ede $cd $e1 $38
    call call_0b_7cdd                                  ;; 00:1ee1 $cd $dd $7c
    jp   popActiveBank                                 ;; 00:1ee4 $c3 $fc $38

call_00_1ee7:
    ld   C, $00                                        ;; 00:1ee7 $0e $00
.jr_00_1ee9:
    rra                                                ;; 00:1ee9 $1f
    jr   C, .jr_00_1eef                                ;; 00:1eea $38 $03
    inc  C                                             ;; 00:1eec $0c
    jr   .jr_00_1ee9                                   ;; 00:1eed $18 $fa
.jr_00_1eef:
    ld   A, C                                          ;; 00:1eef $79
    ret                                                ;; 00:1ef0 $c9

call_00_1ef1:
    ld   C, A                                          ;; 00:1ef1 $4f
    ld   A, $01                                        ;; 00:1ef2 $3e $01
    inc  C                                             ;; 00:1ef4 $0c
.jr_00_1ef5:
    dec  C                                             ;; 00:1ef5 $0d
    ret  Z                                             ;; 00:1ef6 $c8
    add  A, A                                          ;; 00:1ef7 $87
    jr   .jr_00_1ef5                                   ;; 00:1ef8 $18 $fb

data_00_1efa:
    push AF                                            ;; 00:1efa $f5
    push BC                                            ;; 00:1efb $c5
    push DE                                            ;; 00:1efc $d5
    push HL                                            ;; 00:1efd $e5
    call call_00_3e26                                  ;; 00:1efe $cd $26 $3e
    ld   A, [wCD39]                                    ;; 00:1f01 $fa $39 $cd
    or   A, A                                          ;; 00:1f04 $b7
    call Z, hFF80                                      ;; 00:1f05 $cc $80 $ff
    call call_00_36f1                                  ;; 00:1f08 $cd $f1 $36
    ld   HL, wCDAF                                     ;; 00:1f0b $21 $af $cd
    ldh  A, [hFF8B]                                    ;; 00:1f0e $f0 $8b
    or   A, [HL]                                       ;; 00:1f10 $b6
    ld   [HL], A                                       ;; 00:1f11 $77
    ld   HL, hFF93                                     ;; 00:1f12 $21 $93 $ff
    inc  [HL]                                          ;; 00:1f15 $34
    jr   NZ, .jr_00_1f1a                               ;; 00:1f16 $20 $02
    inc  HL                                            ;; 00:1f18 $23
    inc  [HL]                                          ;; 00:1f19 $34
.jr_00_1f1a:
    ld   HL, hFF95                                     ;; 00:1f1a $21 $95 $ff
    ld   A, [HL]                                       ;; 00:1f1d $7e
    and  A, A                                          ;; 00:1f1e $a7
    jr   Z, .jr_00_1f22                                ;; 00:1f1f $28 $01
    dec  [HL]                                          ;; 00:1f21 $35
.jr_00_1f22:
    pop  HL                                            ;; 00:1f22 $e1
    pop  DE                                            ;; 00:1f23 $d1
    pop  BC                                            ;; 00:1f24 $c1
    pop  AF                                            ;; 00:1f25 $f1
    reti                                               ;; 00:1f26 $d9

data_00_1f27:
    push AF                                            ;; 00:1f27 $f5
    push BC                                            ;; 00:1f28 $c5
    push DE                                            ;; 00:1f29 $d5
    push HL                                            ;; 00:1f2a $e5
    call call_00_1f3a                                  ;; 00:1f2b $cd $3a $1f
    ld   A, [wCD3D]                                    ;; 00:1f2e $fa $3d $cd
    or   A, A                                          ;; 00:1f31 $b7
    call NZ, call_00_3549                              ;; 00:1f32 $c4 $49 $35
    pop  HL                                            ;; 00:1f35 $e1
    pop  DE                                            ;; 00:1f36 $d1
    pop  BC                                            ;; 00:1f37 $c1
    pop  AF                                            ;; 00:1f38 $f1
    reti                                               ;; 00:1f39 $d9

call_00_1f3a:
    ld   A, $0f                                        ;; 00:1f3a $3e $0f
    call pushActiveBank                                ;; 00:1f3c $cd $e1 $38
    call runSoundEngineReal                            ;; 00:1f3f $cd $06 $40
    jp   popActiveBank                                 ;; 00:1f42 $c3 $fc $38

call_00_1f45:
    ld   [HL+], A                                      ;; 00:1f45 $22
    ld   [HL+], A                                      ;; 00:1f46 $22
    ld   [HL+], A                                      ;; 00:1f47 $22
    ld   [HL+], A                                      ;; 00:1f48 $22

call_00_1f49:
    ld   [HL+], A                                      ;; 00:1f49 $22
    ld   [HL+], A                                      ;; 00:1f4a $22
    ld   [HL+], A                                      ;; 00:1f4b $22

call_00_1f4c:
    ld   [HL+], A                                      ;; 00:1f4c $22
    ld   [HL+], A                                      ;; 00:1f4d $22
    ld   [HL+], A                                      ;; 00:1f4e $22
    ld   [HL+], A                                      ;; 00:1f4f $22
    ld   [HL+], A                                      ;; 00:1f50 $22
    ld   [HL+], A                                      ;; 00:1f51 $22
    ld   [HL+], A                                      ;; 00:1f52 $22

call_00_1f53:
    ld   [HL+], A                                      ;; 00:1f53 $22
    ld   [HL+], A                                      ;; 00:1f54 $22

call_00_1f55:
    ld   [HL+], A                                      ;; 00:1f55 $22
    ld   [HL+], A                                      ;; 00:1f56 $22
    ld   [HL+], A                                      ;; 00:1f57 $22
    ld   [HL+], A                                      ;; 00:1f58 $22
    ret                                                ;; 00:1f59 $c9

call_00_1f5a:
    ld   A, [HL+]                                      ;; 00:1f5a $2a
    ld   [DE], A                                       ;; 00:1f5b $12
    inc  DE                                            ;; 00:1f5c $13
    ld   A, [HL+]                                      ;; 00:1f5d $2a
    ld   [DE], A                                       ;; 00:1f5e $12
    inc  DE                                            ;; 00:1f5f $13

call_00_1f60:
    ld   A, [HL+]                                      ;; 00:1f60 $2a
    ld   [DE], A                                       ;; 00:1f61 $12
    inc  DE                                            ;; 00:1f62 $13
    ld   A, [HL+]                                      ;; 00:1f63 $2a
    ld   [DE], A                                       ;; 00:1f64 $12
    inc  DE                                            ;; 00:1f65 $13

call_00_1f66:
    ld   A, [HL+]                                      ;; 00:1f66 $2a
    ld   [DE], A                                       ;; 00:1f67 $12
    inc  DE                                            ;; 00:1f68 $13
    ld   A, [HL+]                                      ;; 00:1f69 $2a
    ld   [DE], A                                       ;; 00:1f6a $12
    inc  DE                                            ;; 00:1f6b $13

call_00_1f6c:
    ld   A, [HL+]                                      ;; 00:1f6c $2a
    ld   [DE], A                                       ;; 00:1f6d $12
    inc  DE                                            ;; 00:1f6e $13
    ld   A, [HL+]                                      ;; 00:1f6f $2a
    ld   [DE], A                                       ;; 00:1f70 $12
    inc  DE                                            ;; 00:1f71 $13
    ld   A, [HL+]                                      ;; 00:1f72 $2a
    ld   [DE], A                                       ;; 00:1f73 $12
    inc  DE                                            ;; 00:1f74 $13
    ld   A, [HL+]                                      ;; 00:1f75 $2a
    ld   [DE], A                                       ;; 00:1f76 $12
    inc  DE                                            ;; 00:1f77 $13

jp_00_1f78:
    ld   A, [HL+]                                      ;; 00:1f78 $2a
    ld   [DE], A                                       ;; 00:1f79 $12
    inc  DE                                            ;; 00:1f7a $13

call_00_1f7b:
    ld   A, [HL+]                                      ;; 00:1f7b $2a
    ld   [DE], A                                       ;; 00:1f7c $12
    inc  DE                                            ;; 00:1f7d $13

call_00_1f7e:
    ld   A, [HL+]                                      ;; 00:1f7e $2a
    ld   [DE], A                                       ;; 00:1f7f $12
    inc  DE                                            ;; 00:1f80 $13

call_00_1f81:
    ld   A, [HL+]                                      ;; 00:1f81 $2a
    ld   [DE], A                                       ;; 00:1f82 $12
    inc  DE                                            ;; 00:1f83 $13

call_00_1f84:
    ld   A, [HL+]                                      ;; 00:1f84 $2a
    ld   [DE], A                                       ;; 00:1f85 $12
    inc  DE                                            ;; 00:1f86 $13

call_00_1f87:
    ld   A, [HL+]                                      ;; 00:1f87 $2a
    ld   [DE], A                                       ;; 00:1f88 $12
    inc  DE                                            ;; 00:1f89 $13

call_00_1f8a:
    ld   A, [HL+]                                      ;; 00:1f8a $2a
    ld   [DE], A                                       ;; 00:1f8b $12
    inc  DE                                            ;; 00:1f8c $13

call_00_1f8d:
    ld   A, [HL+]                                      ;; 00:1f8d $2a
    ld   [DE], A                                       ;; 00:1f8e $12
    inc  DE                                            ;; 00:1f8f $13

call_00_1f90:
    ld   A, [HL+]                                      ;; 00:1f90 $2a
    ld   [DE], A                                       ;; 00:1f91 $12
    inc  DE                                            ;; 00:1f92 $13

call_00_1f93:
    ld   A, [HL+]                                      ;; 00:1f93 $2a
    ld   [DE], A                                       ;; 00:1f94 $12
    inc  DE                                            ;; 00:1f95 $13
    ret                                                ;; 00:1f96 $c9

call_00_1f97:
    ld   A, B                                          ;; 00:1f97 $78
    cp   A, $14                                        ;; 00:1f98 $fe $14
    jr   NC, .jr_00_1fa3                               ;; 00:1f9a $30 $07
.jr_00_1f9c:
    ld   A, [HL+]                                      ;; 00:1f9c $2a
    ld   [DE], A                                       ;; 00:1f9d $12
    inc  DE                                            ;; 00:1f9e $13
    dec  B                                             ;; 00:1f9f $05
    jr   NZ, .jr_00_1f9c                               ;; 00:1fa0 $20 $fa
    ret                                                ;; 00:1fa2 $c9
.jr_00_1fa3:
    call call_00_1f5a                                  ;; 00:1fa3 $cd $5a $1f
    ld   A, B                                          ;; 00:1fa6 $78
    sub  A, $14                                        ;; 00:1fa7 $d6 $14
    ret  Z                                             ;; 00:1fa9 $c8
    ld   B, A                                          ;; 00:1faa $47
    cp   A, $14                                        ;; 00:1fab $fe $14
    jr   NC, .jr_00_1fa3                               ;; 00:1fad $30 $f4
    jr   .jr_00_1f9c                                   ;; 00:1faf $18 $eb

call_00_1fb1:
    inc  B                                             ;; 00:1fb1 $04
    dec  B                                             ;; 00:1fb2 $05
    jr   Z, .jr_00_1fc1                                ;; 00:1fb3 $28 $0c
.jr_00_1fb5:
    call call_00_1f5a                                  ;; 00:1fb5 $cd $5a $1f
    ld   A, C                                          ;; 00:1fb8 $79
    sub  A, $14                                        ;; 00:1fb9 $d6 $14
    ld   C, A                                          ;; 00:1fbb $4f
    jr   NC, .jr_00_1fb5                               ;; 00:1fbc $30 $f7
    dec  B                                             ;; 00:1fbe $05
    jr   NZ, .jr_00_1fb5                               ;; 00:1fbf $20 $f4
.jr_00_1fc1:
    ld   B, C                                          ;; 00:1fc1 $41
    jr   call_00_1f97                                  ;; 00:1fc2 $18 $d3

call_00_1fc4:
    ld   A, [wCD36]                                    ;; 00:1fc4 $fa $36 $cd
    cp   A, $80                                        ;; 00:1fc7 $fe $80
    jr   C, call_00_1fcd                               ;; 00:1fc9 $38 $02
    sub  A, $7b                                        ;; 00:1fcb $d6 $7b

call_00_1fcd:
    add  A, A                                          ;; 00:1fcd $87
    ld   E, A                                          ;; 00:1fce $5f
    ld   D, $00                                        ;; 00:1fcf $16 $00
    ld   HL, $1fed                                     ;; 00:1fd1 $21 $ed $1f
    ld   A, [wCD37]                                    ;; 00:1fd4 $fa $37 $cd
    or   A, A                                          ;; 00:1fd7 $b7
    jr   NZ, .jr_00_1fdd                               ;; 00:1fd8 $20 $03
    ld   HL, $1fe3                                     ;; 00:1fda $21 $e3 $1f
.jr_00_1fdd:
    add  HL, DE                                        ;; 00:1fdd $19
    ld   A, [HL+]                                      ;; 00:1fde $2a
    ld   H, [HL]                                       ;; 00:1fdf $66
    ld   L, A                                          ;; 00:1fe0 $6f
    xor  A, A                                          ;; 00:1fe1 $af
    ret                                                ;; 00:1fe2 $c9
    dw   $0000                                         ;; 00:1fe3 wW
    dw   $0060                                         ;; 00:1fe5 wW
    dw   $00c0                                         ;; 00:1fe7 wW
    dw   $0120                                         ;; 00:1fe9 wW
    dw   $0180                                         ;; 00:1feb wW
    dw   $0b00                                         ;; 00:1fed wW
    dw   $0b80                                         ;; 00:1fef wW
    dw   $0c00                                         ;; 00:1ff1 wW
    dw   $0c80                                         ;; 00:1ff3 wW
    dw   $0d00                                         ;; 00:1ff5 wW
    dw   $0d80                                         ;; 00:1ff7 wW
    dw   $0e00                                         ;; 00:1ff9 wW
    dw   $0e80                                         ;; 00:1ffb wW
    dw   $0f00                                         ;; 00:1ffd wW
    db   $80, $0f                                      ;; 00:1fff w.
    dw   $1000                                         ;; 00:2001 wW
    dw   $1080                                         ;; 00:2003 wW
    dw   $1100                                         ;; 00:2005 wW
    dw   $1180                                         ;; 00:2007 wW

call_00_2009:
    push BC                                            ;; 00:2009 $c5
    push DE                                            ;; 00:200a $d5
    dec  A                                             ;; 00:200b $3d
    jr   Z, .jr_00_2062                                ;; 00:200c $28 $54
    dec  A                                             ;; 00:200e $3d
    jr   Z, .jr_00_2042                                ;; 00:200f $28 $31
    ld   A, [HL+]                                      ;; 00:2011 $2a
    ld   E, A                                          ;; 00:2012 $5f
    ld   A, [HL+]                                      ;; 00:2013 $2a
    ld   D, A                                          ;; 00:2014 $57
    ld   B, [HL]                                       ;; 00:2015 $46
    ld   HL, wCD32                                     ;; 00:2016 $21 $32 $cd
    ld   [HL], $2b                                     ;; 00:2019 $36 $2b
    inc  HL                                            ;; 00:201b $23
    ld   [HL], $cd                                     ;; 00:201c $36 $cd
    ld   A, $03                                        ;; 00:201e $3e $03
    ld   HL, $20c6                                     ;; 00:2020 $21 $c6 $20
.jr_00_2023:
    push AF                                            ;; 00:2023 $f5
    call call_00_208e                                  ;; 00:2024 $cd $8e $20
    push HL                                            ;; 00:2027 $e5
    ld   HL, wCD32                                     ;; 00:2028 $21 $32 $cd
    ld   A, [HL+]                                      ;; 00:202b $2a
    ld   H, [HL]                                       ;; 00:202c $66
    ld   L, A                                          ;; 00:202d $6f
    ld   A, C                                          ;; 00:202e $79
    ld   [HL+], A                                      ;; 00:202f $22
    ld   A, L                                          ;; 00:2030 $7d
    ld   [wCD32], A                                    ;; 00:2031 $ea $32 $cd
    ld   A, H                                          ;; 00:2034 $7c
    ld   [wCD33], A                                    ;; 00:2035 $ea $33 $cd
    pop  HL                                            ;; 00:2038 $e1
    pop  AF                                            ;; 00:2039 $f1
    dec  A                                             ;; 00:203a $3d
    jr   NZ, .jr_00_2023                               ;; 00:203b $20 $e6
    ld   HL, wCD2E                                     ;; 00:203d $21 $2e $cd
    jr   .jr_00_2053                                   ;; 00:2040 $18 $11
.jr_00_2042:
    ld   A, [HL+]                                      ;; 00:2042 $2a
    ld   E, A                                          ;; 00:2043 $5f
    ld   A, [HL]                                       ;; 00:2044 $7e
    ld   D, A                                          ;; 00:2045 $57
    ld   A, $b0                                        ;; 00:2046 $3e $b0
    ld   HL, wCD2B                                     ;; 00:2048 $21 $2b $cd
    ld   [HL+], A                                      ;; 00:204b $22
    ld   [HL+], A                                      ;; 00:204c $22
    ld   BC, $2710                                     ;; 00:204d $01 $10 $27
    call call_00_20aa                                  ;; 00:2050 $cd $aa $20
.jr_00_2053:
    ld   BC, $3e8                                      ;; 00:2053 $01 $e8 $03
    call call_00_20aa                                  ;; 00:2056 $cd $aa $20
    ld   BC, $64                                       ;; 00:2059 $01 $64 $00
    call call_00_20aa                                  ;; 00:205c $cd $aa $20
    ld   A, E                                          ;; 00:205f $7b
    jr   .jr_00_2072                                   ;; 00:2060 $18 $10
.jr_00_2062:
    ld   A, [HL]                                       ;; 00:2062 $7e
    push AF                                            ;; 00:2063 $f5
    ld   A, $b0                                        ;; 00:2064 $3e $b0
    ld   HL, wCD2B                                     ;; 00:2066 $21 $2b $cd
    call call_00_1f55                                  ;; 00:2069 $cd $55 $1f
    pop  AF                                            ;; 00:206c $f1
    ld   B, $64                                        ;; 00:206d $06 $64
    call call_00_20bd                                  ;; 00:206f $cd $bd $20
.jr_00_2072:
    ld   B, $0a                                        ;; 00:2072 $06 $0a
    call call_00_20bd                                  ;; 00:2074 $cd $bd $20
    add  A, $b0                                        ;; 00:2077 $c6 $b0
    ld   [HL], A                                       ;; 00:2079 $77
    ld   HL, wCD2B                                     ;; 00:207a $21 $2b $cd
    ld   B, $06                                        ;; 00:207d $06 $06
    ld   A, $b0                                        ;; 00:207f $3e $b0
    ld   C, $ff                                        ;; 00:2081 $0e $ff
.jr_00_2083:
    cp   A, [HL]                                       ;; 00:2083 $be
    jr   NZ, .jr_00_208b                               ;; 00:2084 $20 $05
    ld   [HL], C                                       ;; 00:2086 $71
    inc  HL                                            ;; 00:2087 $23
    dec  B                                             ;; 00:2088 $05
    jr   NZ, .jr_00_2083                               ;; 00:2089 $20 $f8
.jr_00_208b:
    pop  DE                                            ;; 00:208b $d1
    pop  BC                                            ;; 00:208c $c1
    ret                                                ;; 00:208d $c9

call_00_208e:
    ld   C, $af                                        ;; 00:208e $0e $af
.jr_00_2090:
    inc  C                                             ;; 00:2090 $0c
    ld   A, E                                          ;; 00:2091 $7b
    sub  A, [HL]                                       ;; 00:2092 $96
    ld   E, A                                          ;; 00:2093 $5f
    inc  HL                                            ;; 00:2094 $23
    ld   A, D                                          ;; 00:2095 $7a
    sbc  A, [HL]                                       ;; 00:2096 $9e
    ld   D, A                                          ;; 00:2097 $57
    inc  HL                                            ;; 00:2098 $23
    ld   A, B                                          ;; 00:2099 $78
    sbc  A, [HL]                                       ;; 00:209a $9e
    ld   B, A                                          ;; 00:209b $47
    dec  HL                                            ;; 00:209c $2b
    dec  HL                                            ;; 00:209d $2b
    jr   NC, .jr_00_2090                               ;; 00:209e $30 $f0
    ld   A, [HL+]                                      ;; 00:20a0 $2a
    add  A, E                                          ;; 00:20a1 $83
    ld   E, A                                          ;; 00:20a2 $5f
    ld   A, [HL+]                                      ;; 00:20a3 $2a
    adc  A, D                                          ;; 00:20a4 $8a
    ld   D, A                                          ;; 00:20a5 $57
    ld   A, [HL+]                                      ;; 00:20a6 $2a
    adc  A, B                                          ;; 00:20a7 $88
    ld   B, A                                          ;; 00:20a8 $47
    ret                                                ;; 00:20a9 $c9

call_00_20aa:
    ld   [HL], $af                                     ;; 00:20aa $36 $af
.jr_00_20ac:
    inc  [HL]                                          ;; 00:20ac $34
    ld   A, E                                          ;; 00:20ad $7b
    sub  A, C                                          ;; 00:20ae $91
    ld   E, A                                          ;; 00:20af $5f
    ld   A, D                                          ;; 00:20b0 $7a
    sbc  A, B                                          ;; 00:20b1 $98
    ld   D, A                                          ;; 00:20b2 $57
    jr   NC, .jr_00_20ac                               ;; 00:20b3 $30 $f7
    ld   A, E                                          ;; 00:20b5 $7b
    add  A, C                                          ;; 00:20b6 $81
    ld   E, A                                          ;; 00:20b7 $5f
    ld   A, D                                          ;; 00:20b8 $7a
    adc  A, B                                          ;; 00:20b9 $88
    ld   D, A                                          ;; 00:20ba $57
    inc  HL                                            ;; 00:20bb $23
    ret                                                ;; 00:20bc $c9

call_00_20bd:
    ld   [HL], $af                                     ;; 00:20bd $36 $af
.jr_00_20bf:
    inc  [HL]                                          ;; 00:20bf $34
    sub  A, B                                          ;; 00:20c0 $90
    jr   NC, .jr_00_20bf                               ;; 00:20c1 $30 $fc
    add  A, B                                          ;; 00:20c3 $80
    inc  HL                                            ;; 00:20c4 $23
    ret                                                ;; 00:20c5 $c9
    db   $40, $42, $0f, $a0, $86, $01, $10, $27        ;; 00:20c6 ........
    db   $00                                           ;; 00:20ce .

call_00_20cf:
    xor  A, A                                          ;; 00:20cf $af
    ld   HL, wC000                                     ;; 00:20d0 $21 $00 $c0
    ld   DE, $03                                       ;; 00:20d3 $11 $03 $00
    ld   B, $24                                        ;; 00:20d6 $06 $24
.jr_00_20d8:
    ld   [HL+], A                                      ;; 00:20d8 $22
    add  HL, DE                                        ;; 00:20d9 $19
    dec  B                                             ;; 00:20da $05
    jr   NZ, .jr_00_20d8                               ;; 00:20db $20 $fb
    ret                                                ;; 00:20dd $c9

call_00_20de:
    ld   A, [HL+]                                      ;; 00:20de $2a
    cp   A, $80                                        ;; 00:20df $fe $80
    jr   Z, .jr_00_20ec                                ;; 00:20e1 $28 $09
    cp   A, $ff                                        ;; 00:20e3 $fe $ff
    jr   NZ, .jr_00_20ef                               ;; 00:20e5 $20 $08
    ld   A, [wCD36]                                    ;; 00:20e7 $fa $36 $cd
    jr   .jr_00_20ef                                   ;; 00:20ea $18 $03
.jr_00_20ec:
    ld   A, [wCD4C]                                    ;; 00:20ec $fa $4c $cd
.jr_00_20ef:
    cp   A, $80                                        ;; 00:20ef $fe $80
    jr   NC, .jr_00_20fc                               ;; 00:20f1 $30 $09
    cp   A, $05                                        ;; 00:20f3 $fe $05
    ret  C                                             ;; 00:20f5 $d8
    cp   A, $09                                        ;; 00:20f6 $fe $09
    ret  NC                                            ;; 00:20f8 $d0
    sub  A, $05                                        ;; 00:20f9 $d6 $05
    ret                                                ;; 00:20fb $c9
.jr_00_20fc:
    sub  A, $7b                                        ;; 00:20fc $d6 $7b
    ret                                                ;; 00:20fe $c9

call_00_20ff:
    ld   A, C                                          ;; 00:20ff $79
.jr_00_2100:
    inc  B                                             ;; 00:2100 $04
.jr_00_2101:
    dec  B                                             ;; 00:2101 $05
    jr   NZ, .jr_00_2108                               ;; 00:2102 $20 $04
    cp   A, $05                                        ;; 00:2104 $fe $05
    jr   C, .jr_00_214d                                ;; 00:2106 $38 $45
.jr_00_2108:
    push BC                                            ;; 00:2108 $c5
    ld   C, $02                                        ;; 00:2109 $0e $02
.jr_00_210b:
    ldh  A, [rLY]                                      ;; 00:210b $f0 $44
    ld   B, A                                          ;; 00:210d $47
    ldh  A, [rLYC]                                     ;; 00:210e $f0 $45
    sub  A, B                                          ;; 00:2110 $90
    cp   A, $03                                        ;; 00:2111 $fe $03
    jr   C, .jr_00_210b                                ;; 00:2113 $38 $f6
.jr_00_2115:
    ldh  A, [rSTAT]                                    ;; 00:2115 $f0 $41
    and  A, $03                                        ;; 00:2117 $e6 $03
    jr   Z, .jr_00_2115                                ;; 00:2119 $28 $fa
.jr_00_211b:
    ldh  A, [rSTAT]                                    ;; 00:211b $f0 $41
    and  A, C                                          ;; 00:211d $a1
    jr   NZ, .jr_00_211b                               ;; 00:211e $20 $fb
    ld   A, [HL+]                                      ;; 00:2120 $2a
    ld   [DE], A                                       ;; 00:2121 $12
    inc  DE                                            ;; 00:2122 $13
    ld   A, [HL+]                                      ;; 00:2123 $2a
    ld   [DE], A                                       ;; 00:2124 $12
    inc  DE                                            ;; 00:2125 $13
    ld   A, [HL+]                                      ;; 00:2126 $2a
    ld   [DE], A                                       ;; 00:2127 $12
    inc  DE                                            ;; 00:2128 $13
    ld   A, [HL+]                                      ;; 00:2129 $2a
    ld   [DE], A                                       ;; 00:212a $12
    inc  DE                                            ;; 00:212b $13
    ld   A, [HL+]                                      ;; 00:212c $2a
    ld   [DE], A                                       ;; 00:212d $12
    ldh  A, [rSTAT]                                    ;; 00:212e $f0 $41
    inc  DE                                            ;; 00:2130 $13
    and  A, C                                          ;; 00:2131 $a1
    jr   NZ, .jr_00_213d                               ;; 00:2132 $20 $09
    pop  BC                                            ;; 00:2134 $c1
    ld   A, C                                          ;; 00:2135 $79
    sub  A, $05                                        ;; 00:2136 $d6 $05
    ld   C, A                                          ;; 00:2138 $4f
    jr   NC, .jr_00_2100                               ;; 00:2139 $30 $c5
    jr   .jr_00_2101                                   ;; 00:213b $18 $c4
.jr_00_213d:
    ld   A, L                                          ;; 00:213d $7d
    sub  A, $05                                        ;; 00:213e $d6 $05
    ld   L, A                                          ;; 00:2140 $6f
    jr   NC, .jr_00_2144                               ;; 00:2141 $30 $01
    dec  H                                             ;; 00:2143 $25
.jr_00_2144:
    ld   A, E                                          ;; 00:2144 $7b
    sub  A, $05                                        ;; 00:2145 $d6 $05
    ld   E, A                                          ;; 00:2147 $5f
    jr   NC, .jr_00_210b                               ;; 00:2148 $30 $c1
    dec  D                                             ;; 00:214a $15
    jr   .jr_00_210b                                   ;; 00:214b $18 $be
.jr_00_214d:
    or   A, A                                          ;; 00:214d $b7
    ret  Z                                             ;; 00:214e $c8
    sub  A, $02                                        ;; 00:214f $d6 $02
    jr   C, .jr_00_2156                                ;; 00:2151 $38 $03
    ld   B, A                                          ;; 00:2153 $47
    ld   C, $02                                        ;; 00:2154 $0e $02
.jr_00_2156:
    push BC                                            ;; 00:2156 $c5
.jr_00_2157:
    ldh  A, [rLY]                                      ;; 00:2157 $f0 $44
    ld   B, A                                          ;; 00:2159 $47
    ldh  A, [rLYC]                                     ;; 00:215a $f0 $45
    sub  A, B                                          ;; 00:215c $90
    cp   A, $03                                        ;; 00:215d $fe $03
    jr   C, .jr_00_2157                                ;; 00:215f $38 $f6
    ld   B, $02                                        ;; 00:2161 $06 $02
.jr_00_2163:
    ldh  A, [rSTAT]                                    ;; 00:2163 $f0 $41
    and  A, $03                                        ;; 00:2165 $e6 $03
    jr   Z, .jr_00_2163                                ;; 00:2167 $28 $fa
.jr_00_2169:
    ldh  A, [rSTAT]                                    ;; 00:2169 $f0 $41
    and  A, B                                          ;; 00:216b $a0
    jr   NZ, .jr_00_2169                               ;; 00:216c $20 $fb
.jr_00_216e:
    ld   A, [HL+]                                      ;; 00:216e $2a
    ld   [DE], A                                       ;; 00:216f $12
    inc  DE                                            ;; 00:2170 $13
    dec  C                                             ;; 00:2171 $0d
    jr   NZ, .jr_00_216e                               ;; 00:2172 $20 $fa
    ldh  A, [rSTAT]                                    ;; 00:2174 $f0 $41
    and  A, B                                          ;; 00:2176 $a0
    pop  BC                                            ;; 00:2177 $c1
    jr   NZ, .jr_00_2181                               ;; 00:2178 $20 $07
    or   A, B                                          ;; 00:217a $b0
    ret  Z                                             ;; 00:217b $c8
    ld   C, B                                          ;; 00:217c $48
    ld   B, $00                                        ;; 00:217d $06 $00
    jr   .jr_00_2156                                   ;; 00:217f $18 $d5
.jr_00_2181:
    ld   A, L                                          ;; 00:2181 $7d
    sub  A, C                                          ;; 00:2182 $91
    ld   L, A                                          ;; 00:2183 $6f
    jr   NC, .jr_00_2187                               ;; 00:2184 $30 $01
    dec  H                                             ;; 00:2186 $25
.jr_00_2187:
    ld   A, E                                          ;; 00:2187 $7b
    sub  A, C                                          ;; 00:2188 $91
    ld   E, A                                          ;; 00:2189 $5f
    jr   NC, .jr_00_2156                               ;; 00:218a $30 $ca
    dec  D                                             ;; 00:218c $15
    jr   .jr_00_2156                                   ;; 00:218d $18 $c7

call_00_218f:
    rst  rst_00_0018                                   ;; 00:218f $df
    db   $9f                                           ;; 00:2190 .
    ret                                                ;; 00:2191 $c9

call_00_2192:
    ld   A, [wCD37]                                    ;; 00:2192 $fa $37 $cd
    or   A, A                                          ;; 00:2195 $b7
    jr   Z, .jr_00_21a0                                ;; 00:2196 $28 $08
    ld   A, [wCBFF]                                    ;; 00:2198 $fa $ff $cb
    or   A, A                                          ;; 00:219b $b7
    ret  NZ                                            ;; 00:219c $c0
    call call_00_2247                                  ;; 00:219d $cd $47 $22
.jr_00_21a0:
    call call_00_2205                                  ;; 00:21a0 $cd $05 $22
    ldh  A, [hFF93]                                    ;; 00:21a3 $f0 $93
    ld   B, A                                          ;; 00:21a5 $47
    and  A, $0f                                        ;; 00:21a6 $e6 $0f
    ret  NZ                                            ;; 00:21a8 $c0

call_00_21a9:
    ld   A, [wCD3C]                                    ;; 00:21a9 $fa $3c $cd
    dec  A                                             ;; 00:21ac $3d
    jr   Z, .jr_00_21bf                                ;; 00:21ad $28 $10
    xor  A, A                                          ;; 00:21af $af
    ld   [wCD3F], A                                    ;; 00:21b0 $ea $3f $cd
    ld   HL, wCD40                                     ;; 00:21b3 $21 $40 $cd
    ld   A, $00                                        ;; 00:21b6 $3e $00
    ld   [HL+], A                                      ;; 00:21b8 $22
    ld   [HL], $c0                                     ;; 00:21b9 $36 $c0
    ld   C, $05                                        ;; 00:21bb $0e $05
    jr   .jr_00_21ce                                   ;; 00:21bd $18 $0f
.jr_00_21bf:
    ld   A, $14                                        ;; 00:21bf $3e $14
    ld   [wCD3F], A                                    ;; 00:21c1 $ea $3f $cd
    ld   HL, wCD40                                     ;; 00:21c4 $21 $40 $cd
    ld   A, $50                                        ;; 00:21c7 $3e $50
    ld   [HL+], A                                      ;; 00:21c9 $22
    ld   [HL], $c0                                     ;; 00:21ca $36 $c0
    ld   C, $03                                        ;; 00:21cc $0e $03
.jr_00_21ce:
    push BC                                            ;; 00:21ce $c5
    ld   HL, $21f5                                     ;; 00:21cf $21 $f5 $21
    push HL                                            ;; 00:21d2 $e5
    ld   A, [wCD40]                                    ;; 00:21d3 $fa $40 $cd
    cp   A, $50                                        ;; 00:21d6 $fe $50
    ld   A, $03                                        ;; 00:21d8 $3e $03
    jr   NC, .jr_00_21de                               ;; 00:21da $30 $02
    ld   A, $05                                        ;; 00:21dc $3e $05
.jr_00_21de:
    sub  A, C                                          ;; 00:21de $91
    call call_00_1fcd                                  ;; 00:21df $cd $cd $1f
    ld   DE, wC501                                     ;; 00:21e2 $11 $01 $c5
    add  HL, DE                                        ;; 00:21e5 $19
    ld   A, [HL+]                                      ;; 00:21e6 $2a
    or   A, [HL]                                       ;; 00:21e7 $b6
    and  A, $c0                                        ;; 00:21e8 $e6 $c0
    jp   NZ, jp_00_2315                                ;; 00:21ea $c2 $15 $23
    bit  4, B                                          ;; 00:21ed $cb $60
    jp   Z, jp_00_2315                                 ;; 00:21ef $ca $15 $23
    jp   jp_00_2322                                    ;; 00:21f2 $c3 $22 $23
    pop  BC                                            ;; 00:21f5 $c1
    dec  C                                             ;; 00:21f6 $0d
    ret  Z                                             ;; 00:21f7 $c8
    ld   HL, wCD3F                                     ;; 00:21f8 $21 $3f $cd
    ld   A, [HL]                                       ;; 00:21fb $7e
    add  A, $04                                        ;; 00:21fc $c6 $04
    ld   [HL+], A                                      ;; 00:21fe $22
    ld   A, [HL]                                       ;; 00:21ff $7e
    add  A, $10                                        ;; 00:2200 $c6 $10
    ld   [HL], A                                       ;; 00:2202 $77
    jr   .jr_00_21ce                                   ;; 00:2203 $18 $c9

call_00_2205:
    ld   A, [wCD15]                                    ;; 00:2205 $fa $15 $cd
    and  A, $80                                        ;; 00:2208 $e6 $80
    ret  Z                                             ;; 00:220a $c8
    ld   A, [wC080]                                    ;; 00:220b $fa $80 $c0
    cp   A, $08                                        ;; 00:220e $fe $08
    jr   NZ, .jr_00_2214                               ;; 00:2210 $20 $02
    ld   A, $50                                        ;; 00:2212 $3e $50
.jr_00_2214:
    cp   A, $68                                        ;; 00:2214 $fe $68
    jr   Z, .jr_00_2230                                ;; 00:2216 $28 $18
    jr   NC, .jr_00_2243                               ;; 00:2218 $30 $29
    add  A, $18                                        ;; 00:221a $c6 $18
.jr_00_221c:
    ld   [wC080], A                                    ;; 00:221c $ea $80 $c0
    ld   A, [wCD45]                                    ;; 00:221f $fa $45 $cd
    or   A, A                                          ;; 00:2222 $b7
    ret  Z                                             ;; 00:2223 $c8
    ld   A, [wC080]                                    ;; 00:2224 $fa $80 $c0
    cp   A, $50                                        ;; 00:2227 $fe $50
    ret  NZ                                            ;; 00:2229 $c0
    ld   A, $08                                        ;; 00:222a $3e $08
    ld   [wC080], A                                    ;; 00:222c $ea $80 $c0
    ret                                                ;; 00:222f $c9
.jr_00_2230:
    ld   A, $0b                                        ;; 00:2230 $3e $0b
    call pushActiveBank                                ;; 00:2232 $cd $e1 $38
    call $6d12                                         ;; 00:2235 $cd $12 $6d
    push AF                                            ;; 00:2238 $f5
    call popActiveBank                                 ;; 00:2239 $cd $fc $38
    pop  AF                                            ;; 00:223c $f1
    jr   Z, .jr_00_2243                                ;; 00:223d $28 $04
    ld   A, $88                                        ;; 00:223f $3e $88
    jr   .jr_00_221c                                   ;; 00:2241 $18 $d9
.jr_00_2243:
    ld   A, $20                                        ;; 00:2243 $3e $20
    jr   .jr_00_221c                                   ;; 00:2245 $18 $d5

call_00_2247:
    ld   A, $0b                                        ;; 00:2247 $3e $0b
    call pushActiveBank                                ;; 00:2249 $cd $e1 $38
    ld   A, [wCDEB]                                    ;; 00:224c $fa $eb $cd
    cp   A, $30                                        ;; 00:224f $fe $30
    jr   Z, .jr_00_22b8                                ;; 00:2251 $28 $65
    and  A, $0f                                        ;; 00:2253 $e6 $0f
    jr   Z, .jr_00_226d                                ;; 00:2255 $28 $16
    jr   .jr_00_2273                                   ;; 00:2257 $18 $1a
.jr_00_2259:
    ld   D, A                                          ;; 00:2259 $57
    ld   A, [wCD45]                                    ;; 00:225a $fa $45 $cd
    or   A, A                                          ;; 00:225d $b7
    jr   NZ, .jr_00_226a                               ;; 00:225e $20 $0a
    push DE                                            ;; 00:2260 $d5
    call call_0b_6894                                  ;; 00:2261 $cd $94 $68
    pop  AF                                            ;; 00:2264 $f1
    ld   D, $01                                        ;; 00:2265 $16 $01
    call call_0b_67ee                                  ;; 00:2267 $cd $ee $67
.jr_00_226a:
    jp   popActiveBank                                 ;; 00:226a $c3 $fc $38
.jr_00_226d:
    call call_0b_6894                                  ;; 00:226d $cd $94 $68
    jp   popActiveBank                                 ;; 00:2270 $c3 $fc $38
.jr_00_2273:
    cp   A, $02                                        ;; 00:2273 $fe $02
    jr   Z, .jr_00_228e                                ;; 00:2275 $28 $17
    ld   A, [wCD36]                                    ;; 00:2277 $fa $36 $cd
    and  A, $01                                        ;; 00:227a $e6 $01
    ld   A, [wCDEB]                                    ;; 00:227c $fa $eb $cd
    jr   Z, .jr_00_2285                                ;; 00:227f $28 $04
    cp   A, $11                                        ;; 00:2281 $fe $11
    jr   .jr_00_2287                                   ;; 00:2283 $18 $02
.jr_00_2285:
    cp   A, $21                                        ;; 00:2285 $fe $21
.jr_00_2287:
    jr   Z, .jr_00_226d                                ;; 00:2287 $28 $e4
    ld   A, [wCD36]                                    ;; 00:2289 $fa $36 $cd
    jr   .jr_00_2259                                   ;; 00:228c $18 $cb
.jr_00_228e:
    ldh  A, [hFF93]                                    ;; 00:228e $f0 $93
    and  A, $03                                        ;; 00:2290 $e6 $03
    jr   Z, .jr_00_226d                                ;; 00:2292 $28 $d9
    ld   HL, wCE1E                                     ;; 00:2294 $21 $1e $ce
    call $6d12                                         ;; 00:2297 $cd $12 $6d
    ld   D, $03                                        ;; 00:229a $16 $03
    ld   E, $04                                        ;; 00:229c $1e $04
    jr   Z, .jr_00_22a1                                ;; 00:229e $28 $01
    inc  E                                             ;; 00:22a0 $1c
.jr_00_22a1:
    rlc  [HL]                                          ;; 00:22a1 $cb $06
    ld   A, [HL]                                       ;; 00:22a3 $7e
    call call_00_1ee7                                  ;; 00:22a4 $cd $e7 $1e
    cp   A, E                                          ;; 00:22a7 $bb
    jr   NC, .jr_00_22a1                               ;; 00:22a8 $30 $f7
    push DE                                            ;; 00:22aa $d5
    call $67ee                                         ;; 00:22ab $cd $ee $67
    pop  DE                                            ;; 00:22ae $d1
    ld   HL, wCE1E                                     ;; 00:22af $21 $1e $ce
    dec  D                                             ;; 00:22b2 $15
    jr   NZ, .jr_00_22a1                               ;; 00:22b3 $20 $ec
    jp   popActiveBank                                 ;; 00:22b5 $c3 $fc $38
.jr_00_22b8:
    ld   A, [wCE1C]                                    ;; 00:22b8 $fa $1c $ce
    ld   C, A                                          ;; 00:22bb $4f
    and  A, $c0                                        ;; 00:22bc $e6 $c0
    ld   A, C                                          ;; 00:22be $79
    jr   Z, .jr_00_2259                                ;; 00:22bf $28 $98
    ldh  A, [hFF93]                                    ;; 00:22c1 $f0 $93
    and  A, $03                                        ;; 00:22c3 $e6 $03
    jr   Z, .jr_00_226d                                ;; 00:22c5 $28 $a6
    call $68c5                                         ;; 00:22c7 $cd $c5 $68
    ld   E, A                                          ;; 00:22ca $5f
    ld   HL, wCE1E                                     ;; 00:22cb $21 $1e $ce
    ld   D, $05                                        ;; 00:22ce $16 $05
.jr_00_22d0:
    ld   A, E                                          ;; 00:22d0 $7b
    rlc  [HL]                                          ;; 00:22d1 $cb $06
    and  A, [HL]                                       ;; 00:22d3 $a6
    jr   Z, .jr_00_22d0                                ;; 00:22d4 $28 $fa
    call call_00_1ee7                                  ;; 00:22d6 $cd $e7 $1e
    add  A, $05                                        ;; 00:22d9 $c6 $05
    push DE                                            ;; 00:22db $d5
    call $67ee                                         ;; 00:22dc $cd $ee $67
    pop  DE                                            ;; 00:22df $d1
    ld   HL, wCE1E                                     ;; 00:22e0 $21 $1e $ce
    dec  D                                             ;; 00:22e3 $15
    jr   NZ, .jr_00_22d0                               ;; 00:22e4 $20 $ea
    jp   popActiveBank                                 ;; 00:22e6 $c3 $fc $38

call_00_22e9:
    ld   A, [wCD3F]                                    ;; 00:22e9 $fa $3f $cd
    rrca                                               ;; 00:22ec $0f
    rrca                                               ;; 00:22ed $0f
    cp   A, $05                                        ;; 00:22ee $fe $05
    jr   C, .jr_00_22f4                                ;; 00:22f0 $38 $02
    sub  A, $05                                        ;; 00:22f2 $d6 $05
.jr_00_22f4:
    call call_00_1fcd                                  ;; 00:22f4 $cd $cd $1f
    ld   DE, wC50D                                     ;; 00:22f7 $11 $0d $c5
    add  HL, DE                                        ;; 00:22fa $19
    ld   A, $0b                                        ;; 00:22fb $3e $0b
    call pushActiveBank                                ;; 00:22fd $cd $e1 $38
    call call_0b_6dc7                                  ;; 00:2300 $cd $c7 $6d
    push AF                                            ;; 00:2303 $f5
    call popActiveBank                                 ;; 00:2304 $cd $fc $38
    pop  AF                                            ;; 00:2307 $f1
    rlca                                               ;; 00:2308 $07
    rlca                                               ;; 00:2309 $07
    and  A, $03                                        ;; 00:230a $e6 $03
    push AF                                            ;; 00:230c $f5
    ld   HL, wCD40                                     ;; 00:230d $21 $40 $cd
    ld   A, [HL+]                                      ;; 00:2310 $2a
    ld   H, [HL]                                       ;; 00:2311 $66
    ld   L, A                                          ;; 00:2312 $6f
    pop  AF                                            ;; 00:2313 $f1
    ret                                                ;; 00:2314 $c9

jp_00_2315:
    call call_00_22e9                                  ;; 00:2315 $cd $e9 $22
    jr   Z, jr_00_2331                                 ;; 00:2318 $28 $17
    dec  A                                             ;; 00:231a $3d
    jr   Z, jr_00_2345                                 ;; 00:231b $28 $28
    dec  A                                             ;; 00:231d $3d
    jr   Z, jr_00_236a                                 ;; 00:231e $28 $4a
    jr   jr_00_2331                                    ;; 00:2320 $18 $0f

jp_00_2322:
    call call_00_22e9                                  ;; 00:2322 $cd $e9 $22
    jr   Z, jr_00_237c                                 ;; 00:2325 $28 $55
    dec  A                                             ;; 00:2327 $3d
    jr   Z, jr_00_23a3                                 ;; 00:2328 $28 $79
    dec  A                                             ;; 00:232a $3d
    jp   Z, jp_00_23cb                                 ;; 00:232b $ca $cb $23
    jp   jp_00_23e7                                    ;; 00:232e $c3 $e7 $23

jr_00_2331:
    inc  L                                             ;; 00:2331 $2c
    ld   DE, $02                                       ;; 00:2332 $11 $02 $00
    ld   A, [wCD3F]                                    ;; 00:2335 $fa $3f $cd
    ld   B, $04                                        ;; 00:2338 $06 $04
.jr_00_233a:
    res  0, [HL]                                       ;; 00:233a $cb $86
    inc  HL                                            ;; 00:233c $23
    ld   [HL+], A                                      ;; 00:233d $22
    ld   [HL], D                                       ;; 00:233e $72
    inc  A                                             ;; 00:233f $3c
    add  HL, DE                                        ;; 00:2340 $19
    dec  B                                             ;; 00:2341 $05
    jr   NZ, .jr_00_233a                               ;; 00:2342 $20 $f6
    ret                                                ;; 00:2344 $c9

jr_00_2345:
    push HL                                            ;; 00:2345 $e5
    ld   DE, $04                                       ;; 00:2346 $11 $04 $00
    ld   B, E                                          ;; 00:2349 $43
.jr_00_234a:
    res  1, [HL]                                       ;; 00:234a $cb $8e
    add  HL, DE                                        ;; 00:234c $19
    dec  B                                             ;; 00:234d $05
    jr   NZ, .jr_00_234a                               ;; 00:234e $20 $fa
    pop  HL                                            ;; 00:2350 $e1
    ld   A, [wCD3F]                                    ;; 00:2351 $fa $3f $cd
    set  1, L                                          ;; 00:2354 $cb $cd
    dec  E                                             ;; 00:2356 $1d
    ld   C, D                                          ;; 00:2357 $4a
.jr_00_2358:
    ld   B, $02                                        ;; 00:2358 $06 $02
.jr_00_235a:
    ld   [HL+], A                                      ;; 00:235a $22
    ld   [HL], C                                       ;; 00:235b $71
    inc  A                                             ;; 00:235c $3c
    add  HL, DE                                        ;; 00:235d $19
    dec  B                                             ;; 00:235e $05
    jr   NZ, .jr_00_235a                               ;; 00:235f $20 $f9
    bit  5, C                                          ;; 00:2361 $cb $69
    ret  NZ                                            ;; 00:2363 $c0
    set  5, C                                          ;; 00:2364 $cb $e9
    sub  A, $02                                        ;; 00:2366 $d6 $02
    jr   .jr_00_2358                                   ;; 00:2368 $18 $ee

jr_00_236a:
    set  1, L                                          ;; 00:236a $cb $cd
    ld   DE, $03                                       ;; 00:236c $11 $03 $00
    ld   A, [wCD3F]                                    ;; 00:236f $fa $3f $cd
    ld   B, $04                                        ;; 00:2372 $06 $04
.jr_00_2374:
    ld   [HL+], A                                      ;; 00:2374 $22
    ld   [HL], D                                       ;; 00:2375 $72
    inc  A                                             ;; 00:2376 $3c
    add  HL, DE                                        ;; 00:2377 $19
    dec  B                                             ;; 00:2378 $05
    jr   NZ, .jr_00_2374                               ;; 00:2379 $20 $f9
    ret                                                ;; 00:237b $c9

jr_00_237c:
    inc  L                                             ;; 00:237c $2c
    ld   DE, $02                                       ;; 00:237d $11 $02 $00
    ld   A, [wCD3F]                                    ;; 00:2380 $fa $3f $cd
    set  0, [HL]                                       ;; 00:2383 $cb $c6
    inc  HL                                            ;; 00:2385 $23
    ld   [HL+], A                                      ;; 00:2386 $22
    ld   [HL], $00                                     ;; 00:2387 $36 $00
    add  HL, DE                                        ;; 00:2389 $19
    add  A, $03                                        ;; 00:238a $c6 $03
    set  0, [HL]                                       ;; 00:238c $cb $c6
    inc  HL                                            ;; 00:238e $23
    ld   [HL+], A                                      ;; 00:238f $22
    ld   [HL], $20                                     ;; 00:2390 $36 $20
    add  HL, DE                                        ;; 00:2392 $19
    dec  A                                             ;; 00:2393 $3d
    set  0, [HL]                                       ;; 00:2394 $cb $c6
    inc  HL                                            ;; 00:2396 $23
    ld   [HL+], A                                      ;; 00:2397 $22
    ld   [HL], $00                                     ;; 00:2398 $36 $00
    add  HL, DE                                        ;; 00:239a $19
    dec  A                                             ;; 00:239b $3d
    set  0, [HL]                                       ;; 00:239c $cb $c6
    inc  HL                                            ;; 00:239e $23
    ld   [HL+], A                                      ;; 00:239f $22
    ld   [HL], $20                                     ;; 00:23a0 $36 $20
    ret                                                ;; 00:23a2 $c9

jr_00_23a3:
    push HL                                            ;; 00:23a3 $e5
    ld   DE, $04                                       ;; 00:23a4 $11 $04 $00
    ld   B, E                                          ;; 00:23a7 $43
.jr_00_23a8:
    set  1, [HL]                                       ;; 00:23a8 $cb $ce
    add  HL, DE                                        ;; 00:23aa $19
    dec  B                                             ;; 00:23ab $05
    jr   NZ, .jr_00_23a8                               ;; 00:23ac $20 $fa
    pop  HL                                            ;; 00:23ae $e1
    ld   A, [wCD3F]                                    ;; 00:23af $fa $3f $cd
    add  A, $02                                        ;; 00:23b2 $c6 $02
    set  1, L                                          ;; 00:23b4 $cb $cd
    dec  E                                             ;; 00:23b6 $1d
    ld   C, $20                                        ;; 00:23b7 $0e $20
.jr_00_23b9:
    ld   B, $02                                        ;; 00:23b9 $06 $02
.jr_00_23bb:
    ld   [HL+], A                                      ;; 00:23bb $22
    ld   [HL], C                                       ;; 00:23bc $71
    inc  A                                             ;; 00:23bd $3c
    add  HL, DE                                        ;; 00:23be $19
    dec  B                                             ;; 00:23bf $05
    jr   NZ, .jr_00_23bb                               ;; 00:23c0 $20 $f9
    bit  5, C                                          ;; 00:23c2 $cb $69
    ret  Z                                             ;; 00:23c4 $c8
    res  5, C                                          ;; 00:23c5 $cb $a9
    sub  A, $02                                        ;; 00:23c7 $d6 $02
    jr   .jr_00_23b9                                   ;; 00:23c9 $18 $ee

jp_00_23cb:
    set  1, L                                          ;; 00:23cb $cb $cd
    ld   DE, $03                                       ;; 00:23cd $11 $03 $00
    ld   A, [wCD3F]                                    ;; 00:23d0 $fa $3f $cd
    ld   B, $20                                        ;; 00:23d3 $06 $20
    add  A, $02                                        ;; 00:23d5 $c6 $02
    ld   [HL+], A                                      ;; 00:23d7 $22
    ld   [HL], B                                       ;; 00:23d8 $70
    add  HL, DE                                        ;; 00:23d9 $19
    inc  A                                             ;; 00:23da $3c
    ld   [HL+], A                                      ;; 00:23db $22
    ld   [HL], B                                       ;; 00:23dc $70
    add  HL, DE                                        ;; 00:23dd $19
    sub  A, $03                                        ;; 00:23de $d6 $03
    ld   [HL+], A                                      ;; 00:23e0 $22
    ld   [HL], B                                       ;; 00:23e1 $70
    add  HL, DE                                        ;; 00:23e2 $19
    inc  A                                             ;; 00:23e3 $3c
    ld   [HL+], A                                      ;; 00:23e4 $22
    ld   [HL], B                                       ;; 00:23e5 $70
    ret                                                ;; 00:23e6 $c9

jp_00_23e7:
    inc  L                                             ;; 00:23e7 $2c
    ld   DE, $02                                       ;; 00:23e8 $11 $02 $00
    ld   A, [wCD3F]                                    ;; 00:23eb $fa $3f $cd
    ld   B, $20                                        ;; 00:23ee $06 $20
    add  A, $02                                        ;; 00:23f0 $c6 $02
    set  0, [HL]                                       ;; 00:23f2 $cb $c6
    inc  HL                                            ;; 00:23f4 $23
    ld   [HL+], A                                      ;; 00:23f5 $22
    ld   [HL], B                                       ;; 00:23f6 $70
    add  HL, DE                                        ;; 00:23f7 $19
    inc  A                                             ;; 00:23f8 $3c
    set  0, [HL]                                       ;; 00:23f9 $cb $c6
    inc  HL                                            ;; 00:23fb $23
    ld   [HL+], A                                      ;; 00:23fc $22
    ld   [HL], B                                       ;; 00:23fd $70
    add  HL, DE                                        ;; 00:23fe $19
    sub  A, $03                                        ;; 00:23ff $d6 $03
    set  0, [HL]                                       ;; 00:2401 $cb $c6
    inc  HL                                            ;; 00:2403 $23
    ld   [HL+], A                                      ;; 00:2404 $22
    ld   [HL], B                                       ;; 00:2405 $70
    add  HL, DE                                        ;; 00:2406 $19
    inc  A                                             ;; 00:2407 $3c
    set  0, [HL]                                       ;; 00:2408 $cb $c6
    inc  HL                                            ;; 00:240a $23
    ld   [HL+], A                                      ;; 00:240b $22
    ld   [HL], B                                       ;; 00:240c $70
    ret                                                ;; 00:240d $c9

call_00_240e:
    ld   A, $09                                        ;; 00:240e $3e $09
    rst  pushActiveBankSafe                            ;; 00:2410 $e7
    ld   HL, $78a0                                     ;; 00:2411 $21 $a0 $78
    ld   DE, wD000                                     ;; 00:2414 $11 $00 $d0
    ld   C, $36                                        ;; 00:2417 $0e $36
.jr_00_2419:
    ld   A, [HL+]                                      ;; 00:2419 $2a
    cp   A, $4e                                        ;; 00:241a $fe $4e
    jr   C, .jr_00_2425                                ;; 00:241c $38 $07
    ld   B, A                                          ;; 00:241e $47
    ld   A, $ff                                        ;; 00:241f $3e $ff
    ld   [DE], A                                       ;; 00:2421 $12
    inc  DE                                            ;; 00:2422 $13
    ld   A, B                                          ;; 00:2423 $78
    dec  C                                             ;; 00:2424 $0d
.jr_00_2425:
    ld   [DE], A                                       ;; 00:2425 $12
    inc  DE                                            ;; 00:2426 $13
    jr   NZ, .jr_00_2419                               ;; 00:2427 $20 $f0
    xor  A, A                                          ;; 00:2429 $af
    ld   [DE], A                                       ;; 00:242a $12
    rst  popActiveBankSafe                             ;; 00:242b $ef
    ret                                                ;; 00:242c $c9

call_00_242d:
    push DE                                            ;; 00:242d $d5
    ld   L, A                                          ;; 00:242e $6f
    ld   H, $00                                        ;; 00:242f $26 $00
    ld   E, L                                          ;; 00:2431 $5d
    ld   D, H                                          ;; 00:2432 $54
    add  HL, DE                                        ;; 00:2433 $19
    add  HL, DE                                        ;; 00:2434 $19
    pop  DE                                            ;; 00:2435 $d1
    ret                                                ;; 00:2436 $c9

call_00_2437:
    ld   L, A                                          ;; 00:2437 $6f
    ld   H, $00                                        ;; 00:2438 $26 $00
    add  HL, HL                                        ;; 00:243a $29
    add  HL, HL                                        ;; 00:243b $29
    ret                                                ;; 00:243c $c9

call_00_243d:
    push DE                                            ;; 00:243d $d5
    ld   L, A                                          ;; 00:243e $6f
    ld   H, $00                                        ;; 00:243f $26 $00
    ld   E, L                                          ;; 00:2441 $5d
    ld   D, H                                          ;; 00:2442 $54
    add  HL, HL                                        ;; 00:2443 $29
    add  HL, HL                                        ;; 00:2444 $29
    add  HL, DE                                        ;; 00:2445 $19
    pop  DE                                            ;; 00:2446 $d1
    ret                                                ;; 00:2447 $c9

call_00_2448:
    push DE                                            ;; 00:2448 $d5
    ld   L, A                                          ;; 00:2449 $6f
    ld   H, $00                                        ;; 00:244a $26 $00
    add  HL, HL                                        ;; 00:244c $29
    ld   E, L                                          ;; 00:244d $5d
    ld   D, H                                          ;; 00:244e $54
    add  HL, DE                                        ;; 00:244f $19
    add  HL, DE                                        ;; 00:2450 $19
    pop  DE                                            ;; 00:2451 $d1
    ret                                                ;; 00:2452 $c9

call_00_2453:
    push DE                                            ;; 00:2453 $d5
    ld   E, A                                          ;; 00:2454 $5f
    ld   D, $00                                        ;; 00:2455 $16 $00
    ld   L, E                                          ;; 00:2457 $6b
    ld   H, D                                          ;; 00:2458 $62
    add  HL, HL                                        ;; 00:2459 $29
    add  HL, DE                                        ;; 00:245a $19
    add  HL, HL                                        ;; 00:245b $29
    add  HL, DE                                        ;; 00:245c $19
    pop  DE                                            ;; 00:245d $d1
    ret                                                ;; 00:245e $c9

call_00_245f:
    ld   L, A                                          ;; 00:245f $6f
    ld   H, $00                                        ;; 00:2460 $26 $00
    add  HL, HL                                        ;; 00:2462 $29
    add  HL, HL                                        ;; 00:2463 $29
    add  HL, HL                                        ;; 00:2464 $29
    ret                                                ;; 00:2465 $c9

call_00_2466:
    add  A, E                                          ;; 00:2466 $83
    ld   E, A                                          ;; 00:2467 $5f
    ret  NC                                            ;; 00:2468 $d0
    inc  D                                             ;; 00:2469 $14
    ret                                                ;; 00:246a $c9

call_00_246b:
    ld   E, L                                          ;; 00:246b $5d
    ld   D, H                                          ;; 00:246c $54
    ld   HL, $00                                       ;; 00:246d $21 $00 $00
    ld   C, $08                                        ;; 00:2470 $0e $08
.jr_00_2472:
    rrca                                               ;; 00:2472 $0f
    jr   NC, .jr_00_2476                               ;; 00:2473 $30 $01
    add  HL, DE                                        ;; 00:2475 $19
.jr_00_2476:
    sla  E                                             ;; 00:2476 $cb $23
    rl   D                                             ;; 00:2478 $cb $12
    dec  C                                             ;; 00:247a $0d
    jr   NZ, .jr_00_2472                               ;; 00:247b $20 $f5
    ret                                                ;; 00:247d $c9
    db   $5d, $54, $21, $46, $cd, $73, $23, $72        ;; 00:247e ????????
    db   $23, $1e, $00, $73, $23, $73, $23, $22        ;; 00:2486 ????????
    db   $73, $cd, $c7, $24, $21, $46, $cd, $2a        ;; 00:248e ????????
    db   $66, $6f, $c9                                 ;; 00:2496 ???

call_00_2499:
    ld   HL, wCD46                                     ;; 00:2499 $21 $46 $cd
    xor  A, A                                          ;; 00:249c $af
    ld   E, [HL]                                       ;; 00:249d $5e
    ld   [HL+], A                                      ;; 00:249e $22
    ld   D, [HL]                                       ;; 00:249f $56
    ld   [HL], A                                       ;; 00:24a0 $77
    ld   BC, $1000                                     ;; 00:24a1 $01 $00 $10
.jr_00_24a4:
    ld   HL, wCD46                                     ;; 00:24a4 $21 $46 $cd
    sla  [HL]                                          ;; 00:24a7 $cb $26
    inc  HL                                            ;; 00:24a9 $23
    rl   [HL]                                          ;; 00:24aa $cb $16
    inc  HL                                            ;; 00:24ac $23
    rl   [HL]                                          ;; 00:24ad $cb $16
    inc  HL                                            ;; 00:24af $23
    rl   [HL]                                          ;; 00:24b0 $cb $16
    jr   NC, .jr_00_24c3                               ;; 00:24b2 $30 $0f
    ld   HL, wCD46                                     ;; 00:24b4 $21 $46 $cd
    ld   A, E                                          ;; 00:24b7 $7b
    add  A, [HL]                                       ;; 00:24b8 $86
    ld   [HL+], A                                      ;; 00:24b9 $22
    ld   A, D                                          ;; 00:24ba $7a
    adc  A, [HL]                                       ;; 00:24bb $8e
    ld   [HL+], A                                      ;; 00:24bc $22
    ld   A, C                                          ;; 00:24bd $79
    adc  A, [HL]                                       ;; 00:24be $8e
    ld   [HL+], A                                      ;; 00:24bf $22
    ld   A, C                                          ;; 00:24c0 $79
    adc  A, [HL]                                       ;; 00:24c1 $8e
    ld   [HL], A                                       ;; 00:24c2 $77
.jr_00_24c3:
    dec  B                                             ;; 00:24c3 $05
    jr   NZ, .jr_00_24a4                               ;; 00:24c4 $20 $de
    ret                                                ;; 00:24c6 $c9
    db   $21, $4a, $cd, $af, $5e, $22, $56, $77        ;; 00:24c7 ????????
    db   $06, $20, $21, $46, $cd, $cb, $26, $23        ;; 00:24cf ????????
    db   $cb, $16, $23, $cb, $16, $23, $cb, $16        ;; 00:24d7 ????????
    db   $23, $cb, $16, $23, $cb, $16, $38, $0a        ;; 00:24df ????????
    db   $3a, $ba, $38, $14, $20, $04, $7e, $bb        ;; 00:24e7 ????????
    db   $38, $0e, $21, $46, $cd, $cb, $c6, $21        ;; 00:24ef ????????
    db   $4a, $cd, $7e, $93, $22, $7e, $9a, $77        ;; 00:24f7 ????????
    db   $05, $20, $cf, $c9                            ;; 00:24ff ????

call_00_2503:
    ld   HL, wCDDC                                     ;; 00:2503 $21 $dc $cd
    ld   A, [HL+]                                      ;; 00:2506 $2a
    ld   H, [HL]                                       ;; 00:2507 $66
    ld   L, A                                          ;; 00:2508 $6f
    ld   D, [HL]                                       ;; 00:2509 $56
    push DE                                            ;; 00:250a $d5
    call call_00_2535                                  ;; 00:250b $cd $35 $25
    pop  DE                                            ;; 00:250e $d1
    ret  NZ                                            ;; 00:250f $c0
    ld   A, D                                          ;; 00:2510 $7a
    cp   A, $ff                                        ;; 00:2511 $fe $ff
    jr   Z, .jr_00_251f                                ;; 00:2513 $28 $0a
    ld   [wCE26], A                                    ;; 00:2515 $ea $26 $ce
    ld   A, $01                                        ;; 00:2518 $3e $01
    ld   [wCE25], A                                    ;; 00:251a $ea $25 $ce
    rst  rst_00_0018                                   ;; 00:251d $df
    db   $a8                                           ;; 00:251e ?
.jr_00_251f:
    ld   HL, wCDDC                                     ;; 00:251f $21 $dc $cd
    ld   A, [HL+]                                      ;; 00:2522 $2a
    ld   H, [HL]                                       ;; 00:2523 $66
    ld   L, A                                          ;; 00:2524 $6f
    ld   A, [HL]                                       ;; 00:2525 $7e
    cp   A, $ff                                        ;; 00:2526 $fe $ff
    jr   Z, .jr_00_2533                                ;; 00:2528 $28 $09
    ld   [wCE26], A                                    ;; 00:252a $ea $26 $ce
    xor  A, A                                          ;; 00:252d $af
    ld   [wCE25], A                                    ;; 00:252e $ea $25 $ce
    rst  rst_00_0018                                   ;; 00:2531 $df
    db   $a8                                           ;; 00:2532 ?
.jr_00_2533:
    xor  A, A                                          ;; 00:2533 $af
    ret                                                ;; 00:2534 $c9

call_00_2535:
    call call_00_2607                                  ;; 00:2535 $cd $07 $26
    jr   NZ, .jr_00_253e                               ;; 00:2538 $20 $04
    inc  A                                             ;; 00:253a $3c
    jp   Z, jp_00_26ae                                 ;; 00:253b $ca $ae $26
.jr_00_253e:
    call call_00_2682                                  ;; 00:253e $cd $82 $26
    ret  NZ                                            ;; 00:2541 $c0
    call call_00_263d                                  ;; 00:2542 $cd $3d $26
    ret  NZ                                            ;; 00:2545 $c0
    call call_00_25ed                                  ;; 00:2546 $cd $ed $25
    ret  NZ                                            ;; 00:2549 $c0
    call call_00_2551                                  ;; 00:254a $cd $51 $25
    rst  rst_00_0018                                   ;; 00:254d $df
    db   $18                                           ;; 00:254e ?
    xor  A, A                                          ;; 00:254f $af
    ret                                                ;; 00:2550 $c9

call_00_2551:
    ld   HL, wCDDC                                     ;; 00:2551 $21 $dc $cd
    ld   A, [HL+]                                      ;; 00:2554 $2a
    ld   H, [HL]                                       ;; 00:2555 $66
    ld   L, A                                          ;; 00:2556 $6f
    ld   A, [HL]                                       ;; 00:2557 $7e
    inc  A                                             ;; 00:2558 $3c
    jr   Z, .jr_00_258e                                ;; 00:2559 $28 $33
    ld   [HL], $ff                                     ;; 00:255b $36 $ff
    ld   HL, wCDE4                                     ;; 00:255d $21 $e4 $cd
    ld   A, [HL+]                                      ;; 00:2560 $2a
    ld   H, [HL]                                       ;; 00:2561 $66
    ld   L, A                                          ;; 00:2562 $6f
    ld   A, [wCDE0]                                    ;; 00:2563 $fa $e0 $cd
    cp   A, [HL]                                       ;; 00:2566 $be
    jr   NZ, .jr_00_2577                               ;; 00:2567 $20 $0e
    inc  HL                                            ;; 00:2569 $23
    ld   A, [wCDE1]                                    ;; 00:256a $fa $e1 $cd
    add  A, [HL]                                       ;; 00:256d $86
    cp   A, $0a                                        ;; 00:256e $fe $0a
    jr   C, .jr_00_2574                                ;; 00:2570 $38 $02
    ld   A, $09                                        ;; 00:2572 $3e $09
.jr_00_2574:
    ld   [HL], A                                       ;; 00:2574 $77
    jr   .jr_00_257c                                   ;; 00:2575 $18 $05
.jr_00_2577:
    ld   [HL+], A                                      ;; 00:2577 $22
    ld   A, [wCDE1]                                    ;; 00:2578 $fa $e1 $cd
    ld   [HL-], A                                      ;; 00:257b $32
.jr_00_257c:
    ld   A, [wCDE0]                                    ;; 00:257c $fa $e0 $cd
    cp   A, $78                                        ;; 00:257f $fe $78
    jr   NC, .jr_00_258e                               ;; 00:2581 $30 $0b
    call call_00_1fc4                                  ;; 00:2583 $cd $c4 $1f
    ld   DE, wC500                                     ;; 00:2586 $11 $00 $c5
    add  HL, DE                                        ;; 00:2589 $19
    ld   A, [HL]                                       ;; 00:258a $7e
    and  A, $f0                                        ;; 00:258b $e6 $f0
    ld   [HL], A                                       ;; 00:258d $77
.jr_00_258e:
    ld   A, [wCDE2]                                    ;; 00:258e $fa $e2 $cd
    inc  A                                             ;; 00:2591 $3c
    ret  Z                                             ;; 00:2592 $c8
    call call_00_26b1                                  ;; 00:2593 $cd $b1 $26
    jr   NZ, .jr_00_259e                               ;; 00:2596 $20 $06
    cp   A, $6e                                        ;; 00:2598 $fe $6e
    ret  C                                             ;; 00:259a $d8
    cp   A, $78                                        ;; 00:259b $fe $78
    ret  NC                                            ;; 00:259d $d0
.jr_00_259e:
    ld   HL, wCDDC                                     ;; 00:259e $21 $dc $cd
    ld   A, [HL+]                                      ;; 00:25a1 $2a
    ld   H, [HL]                                       ;; 00:25a2 $66
    ld   L, A                                          ;; 00:25a3 $6f
    ld   A, [wCDDE]                                    ;; 00:25a4 $fa $de $cd
    ld   E, A                                          ;; 00:25a7 $5f
    ld   A, [wCDDF]                                    ;; 00:25a8 $fa $df $cd
    ld   D, A                                          ;; 00:25ab $57
    ld   A, [DE]                                       ;; 00:25ac $1a
    ld   C, A                                          ;; 00:25ad $4f
    ld   A, [wCDE2]                                    ;; 00:25ae $fa $e2 $cd
    cp   A, C                                          ;; 00:25b1 $b9
    jr   Z, .jr_00_25c6                                ;; 00:25b2 $28 $12
    ld   [HL], A                                       ;; 00:25b4 $77
    cp   A, $78                                        ;; 00:25b5 $fe $78
    ret  NC                                            ;; 00:25b7 $d0
    ld   DE, hMusicNoteDurationChannel3Copy            ;; 00:25b8 $11 $c0 $ff
    add  HL, DE                                        ;; 00:25bb $19
    ld   A, [HL]                                       ;; 00:25bc $7e
    and  A, $f0                                        ;; 00:25bd $e6 $f0
    ld   B, A                                          ;; 00:25bf $47
    ld   A, [wCDE3]                                    ;; 00:25c0 $fa $e3 $cd
    or   A, B                                          ;; 00:25c3 $b0
    ld   [HL], A                                       ;; 00:25c4 $77
    ret                                                ;; 00:25c5 $c9
.jr_00_25c6:
    ld   [HL], C                                       ;; 00:25c6 $71
    ld   BC, hMusicNoteDurationChannel3Copy            ;; 00:25c7 $01 $c0 $ff
    add  HL, BC                                        ;; 00:25ca $09
    ld   A, [DE]                                       ;; 00:25cb $1a
    inc  DE                                            ;; 00:25cc $13
    cp   A, $6e                                        ;; 00:25cd $fe $6e
    jr   C, .jr_00_25df                                ;; 00:25cf $38 $0e
    cp   A, $78                                        ;; 00:25d1 $fe $78
    jr   NC, .jr_00_25df                               ;; 00:25d3 $30 $0a
    ld   A, [HL]                                       ;; 00:25d5 $7e
    and  A, $f0                                        ;; 00:25d6 $e6 $f0
    ld   C, A                                          ;; 00:25d8 $4f
    ld   A, [DE]                                       ;; 00:25d9 $1a
    or   A, C                                          ;; 00:25da $b1
    ld   [HL], A                                       ;; 00:25db $77
    xor  A, A                                          ;; 00:25dc $af
    ld   [DE], A                                       ;; 00:25dd $12
    ret                                                ;; 00:25de $c9
.jr_00_25df:
    cp   A, $78                                        ;; 00:25df $fe $78
    jr   NC, .jr_00_25e9                               ;; 00:25e1 $30 $06
    ld   A, [HL]                                       ;; 00:25e3 $7e
    and  A, $f0                                        ;; 00:25e4 $e6 $f0
    or   A, $01                                        ;; 00:25e6 $f6 $01
    ld   [HL], A                                       ;; 00:25e8 $77
.jr_00_25e9:
    ld   A, [DE]                                       ;; 00:25e9 $1a
    dec  A                                             ;; 00:25ea $3d
    ld   [DE], A                                       ;; 00:25eb $12
    ret                                                ;; 00:25ec $c9

call_00_25ed:
    ld   HL, wCDE4                                     ;; 00:25ed $21 $e4 $cd
    ld   A, [HL+]                                      ;; 00:25f0 $2a
    ld   H, [HL]                                       ;; 00:25f1 $66
    ld   L, A                                          ;; 00:25f2 $6f
    ld   A, [wCDE0]                                    ;; 00:25f3 $fa $e0 $cd
    cp   A, [HL]                                       ;; 00:25f6 $be
    jp   NZ, jp_00_26ac                                ;; 00:25f7 $c2 $ac $26
    inc  HL                                            ;; 00:25fa $23
    ld   A, [wCDE1]                                    ;; 00:25fb $fa $e1 $cd
    add  A, [HL]                                       ;; 00:25fe $86
    cp   A, $0a                                        ;; 00:25ff $fe $0a
    jp   C, jp_00_26ac                                 ;; 00:2601 $da $ac $26
    rst  rst_00_0018                                   ;; 00:2604 $df
    db   $68                                           ;; 00:2605 ?
    ret                                                ;; 00:2606 $c9

call_00_2607:
    ld   HL, wCDDC                                     ;; 00:2607 $21 $dc $cd
    ld   A, [HL+]                                      ;; 00:260a $2a
    ld   H, [HL]                                       ;; 00:260b $66
    ld   L, A                                          ;; 00:260c $6f
    ld   A, [HL]                                       ;; 00:260d $7e
    ld   [wCDE0], A                                    ;; 00:260e $ea $e0 $cd
    ld   [wCE91], A                                    ;; 00:2611 $ea $91 $ce
    ld   [wCE94], A                                    ;; 00:2614 $ea $94 $ce
    cp   A, $78                                        ;; 00:2617 $fe $78
    jr   NC, .jr_00_2627                               ;; 00:2619 $30 $0c
    ld   DE, hMusicNoteDurationChannel3Copy            ;; 00:261b $11 $c0 $ff
    add  HL, DE                                        ;; 00:261e $19
    ld   A, [HL]                                       ;; 00:261f $7e
    and  A, $0f                                        ;; 00:2620 $e6 $0f
    ld   [wCDE1], A                                    ;; 00:2622 $ea $e1 $cd
    jr   .jr_00_262c                                   ;; 00:2625 $18 $05
.jr_00_2627:
    ld   A, $01                                        ;; 00:2627 $3e $01
    ld   [wCDE1], A                                    ;; 00:2629 $ea $e1 $cd
.jr_00_262c:
    ld   HL, wCDDE                                     ;; 00:262c $21 $de $cd
    ld   A, [HL+]                                      ;; 00:262f $2a
    ld   H, [HL]                                       ;; 00:2630 $66
    ld   L, A                                          ;; 00:2631 $6f
    ld   A, [HL+]                                      ;; 00:2632 $2a
    ld   [wCDE2], A                                    ;; 00:2633 $ea $e2 $cd
    ld   A, [HL]                                       ;; 00:2636 $7e
    ld   [wCDE3], A                                    ;; 00:2637 $ea $e3 $cd
    jp   call_00_26b1                                  ;; 00:263a $c3 $b1 $26

call_00_263d:
    ld   A, [wCDE0]                                    ;; 00:263d $fa $e0 $cd
    inc  A                                             ;; 00:2640 $3c
    jr   Z, .jr_00_264f                                ;; 00:2641 $28 $0c
    rst  rst_00_0018                                   ;; 00:2643 $df
    db   $0e                                           ;; 00:2644 ?
    ld   A, [wCE91]                                    ;; 00:2645 $fa $91 $ce
    inc  A                                             ;; 00:2648 $3c
    jr   Z, .jr_00_264f                                ;; 00:2649 $28 $04
    inc  [HL]                                          ;; 00:264b $34
    dec  HL                                            ;; 00:264c $2b
    jr   .jr_00_2678                                   ;; 00:264d $18 $29
.jr_00_264f:
    ld   HL, wCDDE                                     ;; 00:264f $21 $de $cd
    ld   DE, wCDE4                                     ;; 00:2652 $11 $e4 $cd
    call call_00_1f90                                  ;; 00:2655 $cd $90 $1f
    call call_00_26b1                                  ;; 00:2658 $cd $b1 $26
    ret  Z                                             ;; 00:265b $c8
    inc  B                                             ;; 00:265c $04
    ret  Z                                             ;; 00:265d $c8
    cp   A, $ff                                        ;; 00:265e $fe $ff
    ret  Z                                             ;; 00:2660 $c8
    cp   A, $6e                                        ;; 00:2661 $fe $6e
    jr   C, .jr_00_2669                                ;; 00:2663 $38 $04
    cp   A, $78                                        ;; 00:2665 $fe $78
    jr   C, jp_00_26ac                                 ;; 00:2667 $38 $43
.jr_00_2669:
    ld   A, [wCDE3]                                    ;; 00:2669 $fa $e3 $cd
    dec  A                                             ;; 00:266c $3d
    ret  Z                                             ;; 00:266d $c8
    rst  rst_00_0018                                   ;; 00:266e $df
    db   $0f                                           ;; 00:266f ?
    ld   A, [wCE94]                                    ;; 00:2670 $fa $94 $ce
    cp   A, $fe                                        ;; 00:2673 $fe $fe
    ret  NC                                            ;; 00:2675 $d0
    xor  A, A                                          ;; 00:2676 $af
    ld   [HL-], A                                      ;; 00:2677 $32
.jr_00_2678:
    ld   A, L                                          ;; 00:2678 $7d
    ld   [wCDE4], A                                    ;; 00:2679 $ea $e4 $cd
    ld   A, H                                          ;; 00:267c $7c
    ld   [wCDE5], A                                    ;; 00:267d $ea $e5 $cd
    xor  A, A                                          ;; 00:2680 $af
    ret                                                ;; 00:2681 $c9

call_00_2682:
    call call_00_1fc4                                  ;; 00:2682 $cd $c4 $1f
    ld   DE, wC540                                     ;; 00:2685 $11 $40 $c5
    add  HL, DE                                        ;; 00:2688 $19
    ld   A, [wCDDC]                                    ;; 00:2689 $fa $dc $cd
    sub  A, L                                          ;; 00:268c $95
    cp   A, $07                                        ;; 00:268d $fe $07
    jr   NZ, .jr_00_2692                               ;; 00:268f $20 $01
    dec  A                                             ;; 00:2691 $3d
.jr_00_2692:
    ld   HL, $26a4                                     ;; 00:2692 $21 $a4 $26
    rst  add_hl_a                                      ;; 00:2695 $c7
    ld   A, [wCDE2]                                    ;; 00:2696 $fa $e2 $cd
    cp   A, $ff                                        ;; 00:2699 $fe $ff
    ret  Z                                             ;; 00:269b $c8
    cp   A, [HL]                                       ;; 00:269c $be
    ret  C                                             ;; 00:269d $d8
    inc  HL                                            ;; 00:269e $23
    cp   A, [HL]                                       ;; 00:269f $be
    jr   NC, jp_00_26ae                                ;; 00:26a0 $30 $0c
    xor  A, A                                          ;; 00:26a2 $af
    ret                                                ;; 00:26a3 $c9
    db   $30, $78, $84, $90, $a0, $aa, $b4, $c0        ;; 00:26a4 ????????

jp_00_26ac:
    xor  A, A                                          ;; 00:26ac $af
    ret                                                ;; 00:26ad $c9

jp_00_26ae:
    or   A, $01                                        ;; 00:26ae $f6 $01
    ret                                                ;; 00:26b0 $c9

call_00_26b1:
    ld   A, [wCDE0]                                    ;; 00:26b1 $fa $e0 $cd
    ld   B, A                                          ;; 00:26b4 $47
    ld   A, [wCDE2]                                    ;; 00:26b5 $fa $e2 $cd
    cp   A, B                                          ;; 00:26b8 $b8
    ret                                                ;; 00:26b9 $c9

call_00_26ba:
    push AF                                            ;; 00:26ba $f5
    ld   A, $09                                        ;; 00:26bb $3e $09
    rst  pushActiveBankSafe                            ;; 00:26bd $e7
    pop  AF                                            ;; 00:26be $f1
    ret                                                ;; 00:26bf $c9

call_00_26c0:
    push AF                                            ;; 00:26c0 $f5
    ld   A, $0e                                        ;; 00:26c1 $3e $0e
    rst  pushActiveBankSafe                            ;; 00:26c3 $e7
    pop  AF                                            ;; 00:26c4 $f1
    ret                                                ;; 00:26c5 $c9

data_00_26c6:
    dec  HL                                            ;; 00:26c6 $2b
    inc  DE                                            ;; 00:26c7 $13
    dec  B                                             ;; 00:26c8 $05
    ret                                                ;; 00:26c9 $c9
    db   $00                                           ;; 00:26ca ?

data_00_26cb:
    ret                                                ;; 00:26cb $c9

data_00_26cc:
    push HL                                            ;; 00:26cc $e5
    ld   A, [wCD3A]                                    ;; 00:26cd $fa $3a $cd
    or   A, A                                          ;; 00:26d0 $b7
    jr   Z, .jr_00_26dc                                ;; 00:26d1 $28 $09
    ld   HL, $3155                                     ;; 00:26d3 $21 $55 $31
    ld   C, B                                          ;; 00:26d6 $48
    call call_00_3114                                  ;; 00:26d7 $cd $14 $31
    jr   .jr_00_2743                                   ;; 00:26da $18 $67
.jr_00_26dc:
    ld   HL, wCD34                                     ;; 00:26dc $21 $34 $cd
    bit  4, [HL]                                       ;; 00:26df $cb $66
    jr   Z, .jr_00_26f4                                ;; 00:26e1 $28 $11
    res  4, [HL]                                       ;; 00:26e3 $cb $a6
    ld   HL, wC894                                     ;; 00:26e5 $21 $94 $c8
    ld   DE, wC880                                     ;; 00:26e8 $11 $80 $c8
    call call_00_1f60                                  ;; 00:26eb $cd $60 $1f
    xor  A, A                                          ;; 00:26ee $af
    ld   [wCD06], A                                    ;; 00:26ef $ea $06 $cd
    jr   .jr_00_2743                                   ;; 00:26f2 $18 $4f
.jr_00_26f4:
    ld   A, [wCD06]                                    ;; 00:26f4 $fa $06 $cd
    or   A, A                                          ;; 00:26f7 $b7
    jr   Z, .jr_00_2701                                ;; 00:26f8 $28 $07
    call call_00_331b                                  ;; 00:26fa $cd $1b $33
    bit  2, [HL]                                       ;; 00:26fd $cb $56
    jr   NZ, .jr_00_2743                               ;; 00:26ff $20 $42
.jr_00_2701:
    ld   HL, wCD04                                     ;; 00:2701 $21 $04 $cd
    ld   A, [HL+]                                      ;; 00:2704 $2a
    ld   H, [HL]                                       ;; 00:2705 $66
    and  A, $e0                                        ;; 00:2706 $e6 $e0
    ld   L, A                                          ;; 00:2708 $6f
    ld   A, [wCD02]                                    ;; 00:2709 $fa $02 $cd
    or   A, L                                          ;; 00:270c $b5
    add  A, $40                                        ;; 00:270d $c6 $40
    ld   L, A                                          ;; 00:270f $6f
    jr   NC, .jr_00_2713                               ;; 00:2710 $30 $01
    inc  H                                             ;; 00:2712 $24
.jr_00_2713:
    ld   C, L                                          ;; 00:2713 $4d
    ld   B, H                                          ;; 00:2714 $44
    add  HL, HL                                        ;; 00:2715 $29
    add  HL, HL                                        ;; 00:2716 $29
    add  HL, HL                                        ;; 00:2717 $29
    ld   A, H                                          ;; 00:2718 $7c
    and  A, $1f                                        ;; 00:2719 $e6 $1f
    ld   D, A                                          ;; 00:271b $57
    ld   A, [wCD03]                                    ;; 00:271c $fa $03 $cd
    ld   HL, wCD01                                     ;; 00:271f $21 $01 $cd
    add  A, [HL]                                       ;; 00:2722 $86
    add  A, $02                                        ;; 00:2723 $c6 $02
    cp   A, D                                          ;; 00:2725 $ba
    jr   NZ, .jr_00_2739                               ;; 00:2726 $20 $11
    ld   HL, hMusicNoteDurationChannel3Copy            ;; 00:2728 $21 $c0 $ff
    add  HL, BC                                        ;; 00:272b $09
    ld   A, L                                          ;; 00:272c $7d
    ld   [wCD04], A                                    ;; 00:272d $ea $04 $cd
    ld   A, H                                          ;; 00:2730 $7c
    ld   [wCD05], A                                    ;; 00:2731 $ea $05 $cd
    call call_00_342c                                  ;; 00:2734 $cd $2c $34
    jr   .jr_00_273f                                   ;; 00:2737 $18 $06
.jr_00_2739:
    ld   HL, wCD04                                     ;; 00:2739 $21 $04 $cd
    ld   [HL], C                                       ;; 00:273c $71
    inc  HL                                            ;; 00:273d $23
    ld   [HL], B                                       ;; 00:273e $70
.jr_00_273f:
    xor  A, A                                          ;; 00:273f $af
    ld   [wCD07], A                                    ;; 00:2740 $ea $07 $cd
.jr_00_2743:
    pop  HL                                            ;; 00:2743 $e1
    ret                                                ;; 00:2744 $c9

call_00_2745:
    push HL                                            ;; 00:2745 $e5
    call call_00_328f                                  ;; 00:2746 $cd $8f $32
    rst  rst_00_0018                                   ;; 00:2749 $df
    db   $a9                                           ;; 00:274a .
    pop  HL                                            ;; 00:274b $e1
    ret                                                ;; 00:274c $c9

data_00_274d:
    call call_00_275c                                  ;; 00:274d $cd $5c $27
    jp   jp_00_27ab                                    ;; 00:2750 $c3 $ab $27

data_00_2753:
    ld   A, [HL+]                                      ;; 00:2753 $2a
    push HL                                            ;; 00:2754 $e5
    ld   C, A                                          ;; 00:2755 $4f
    ld   HL, $3155                                     ;; 00:2756 $21 $55 $31
    jp   jp_00_310f                                    ;; 00:2759 $c3 $0f $31

call_00_275c:
    call call_00_331b                                  ;; 00:275c $cd $1b $33
.jr_00_275f:
    ldh  A, [hFF8B]                                    ;; 00:275f $f0 $8b
    and  A, $01                                        ;; 00:2761 $e6 $01
    jr   Z, .jr_00_275f                                ;; 00:2763 $28 $fa
    ret                                                ;; 00:2765 $c9

call_00_2766:
    ld   C, [HL]                                       ;; 00:2766 $4e
    call call_00_276d                                  ;; 00:2767 $cd $6d $27
    ld   A, [HL+]                                      ;; 00:276a $2a
    ret  NZ                                            ;; 00:276b $c0
    ld   C, A                                          ;; 00:276c $4f

call_00_276d:
    call call_00_358b                                  ;; 00:276d $cd $8b $35
    ldh  A, [hFF8B]                                    ;; 00:2770 $f0 $8b
    and  A, $01                                        ;; 00:2772 $e6 $01
    ret  NZ                                            ;; 00:2774 $c0
    dec  C                                             ;; 00:2775 $0d
    jr   NZ, call_00_276d                              ;; 00:2776 $20 $f5
    ret                                                ;; 00:2778 $c9

data_00_2779:
    ld   A, [HL+]                                      ;; 00:2779 $2a
    push HL                                            ;; 00:277a $e5
    cp   A, $02                                        ;; 00:277b $fe $02
    jr   C, .jr_00_2793                                ;; 00:277d $38 $14
    ld   HL, wC08E                                     ;; 00:277f $21 $8e $c0
    ld   A, [wCD19]                                    ;; 00:2782 $fa $19 $cd
    jr   Z, .jr_00_278d                                ;; 00:2785 $28 $06
    ld   [HL], $22                                     ;; 00:2787 $36 $22
    and  A, $fd                                        ;; 00:2789 $e6 $fd
    jr   .jr_00_27a6                                   ;; 00:278b $18 $19
.jr_00_278d:
    ld   [HL], $23                                     ;; 00:278d $36 $23
    or   A, $02                                        ;; 00:278f $f6 $02
    jr   .jr_00_27a6                                   ;; 00:2791 $18 $13
.jr_00_2793:
    ld   HL, wC08A                                     ;; 00:2793 $21 $8a $c0
    or   A, A                                          ;; 00:2796 $b7
    ld   A, [wCD19]                                    ;; 00:2797 $fa $19 $cd
    jr   Z, .jr_00_27a2                                ;; 00:279a $28 $06
    ld   [HL], $23                                     ;; 00:279c $36 $23
    and  A, $fe                                        ;; 00:279e $e6 $fe
    jr   .jr_00_27a6                                   ;; 00:27a0 $18 $04
.jr_00_27a2:
    ld   [HL], $22                                     ;; 00:27a2 $36 $22
    or   A, $01                                        ;; 00:27a4 $f6 $01
.jr_00_27a6:
    ld   [wCD19], A                                    ;; 00:27a6 $ea $19 $cd
    pop  HL                                            ;; 00:27a9 $e1
    ret                                                ;; 00:27aa $c9

jp_00_27ab:
    push HL                                            ;; 00:27ab $e5
    ld   HL, $27bd                                     ;; 00:27ac $21 $bd $27
    push HL                                            ;; 00:27af $e5
    ldh  A, [rLCDC]                                    ;; 00:27b0 $f0 $40
    bit  5, A                                          ;; 00:27b2 $cb $6f
    jp   NZ, call_00_35d2                              ;; 00:27b4 $c2 $d2 $35
    call call_00_2745                                  ;; 00:27b7 $cd $45 $27
    jp   call_00_35af                                  ;; 00:27ba $c3 $af $35
    pop  HL                                            ;; 00:27bd $e1
    ret                                                ;; 00:27be $c9
    db   $2a, $e5, $df, $bd, $e1, $c9                  ;; 00:27bf ??????

call_00_27c5:
    push HL                                            ;; 00:27c5 $e5
    ld   HL, wCD34                                     ;; 00:27c6 $21 $34 $cd
    set  1, [HL]                                       ;; 00:27c9 $cb $ce
    pop  HL                                            ;; 00:27cb $e1
    ret                                                ;; 00:27cc $c9

data_00_27cd:
    call call_00_20de                                  ;; 00:27cd $cd $de $20
    push HL                                            ;; 00:27d0 $e5
    push DE                                            ;; 00:27d1 $d5
    cp   A, $09                                        ;; 00:27d2 $fe $09
    jr   NC, .jr_00_27f9                               ;; 00:27d4 $30 $23
    call call_00_1fcd                                  ;; 00:27d6 $cd $cd $1f
    ld   DE, wC50D                                     ;; 00:27d9 $11 $0d $c5
    add  HL, DE                                        ;; 00:27dc $19
    ld   A, [HL+]                                      ;; 00:27dd $2a
    and  A, $07                                        ;; 00:27de $e6 $07
    cp   A, $02                                        ;; 00:27e0 $fe $02
    jr   Z, .jr_00_27ee                                ;; 00:27e2 $28 $0a
.jr_00_27e4:
    ld   A, [HL]                                       ;; 00:27e4 $7e
    call call_00_245f                                  ;; 00:27e5 $cd $5f $24
    ld   DE, $7533                                     ;; 00:27e8 $11 $33 $75
    add  HL, DE                                        ;; 00:27eb $19
    jr   .jr_00_27f1                                   ;; 00:27ec $18 $03
.jr_00_27ee:
    ld   HL, $3155                                     ;; 00:27ee $21 $55 $31
.jr_00_27f1:
    pop  DE                                            ;; 00:27f1 $d1
    ld   C, $08                                        ;; 00:27f2 $0e $08
    ld   A, $0e                                        ;; 00:27f4 $3e $0e
    jp   jp_00_3108                                    ;; 00:27f6 $c3 $08 $31
.jr_00_27f9:
    ld   HL, wCC55                                     ;; 00:27f9 $21 $55 $cc
    rst  add_hl_a                                      ;; 00:27fc $c7
    ld   A, [HL]                                       ;; 00:27fd $7e
    or   A, A                                          ;; 00:27fe $b7
    jr   Z, .jr_00_27ee                                ;; 00:27ff $28 $ed
    call call_00_1ee7                                  ;; 00:2801 $cd $e7 $1e
    add  A, $05                                        ;; 00:2804 $c6 $05
    call call_00_1fcd                                  ;; 00:2806 $cd $cd $1f
    ld   DE, wC50E                                     ;; 00:2809 $11 $0e $c5
    add  HL, DE                                        ;; 00:280c $19
    jr   .jr_00_27e4                                   ;; 00:280d $18 $d5

data_00_280f:
    ld   A, [HL+]                                      ;; 00:280f $2a
    call call_00_26c0                                  ;; 00:2810 $cd $c0 $26
    call call_00_2818                                  ;; 00:2813 $cd $18 $28
    rst  popActiveBankSafe                             ;; 00:2816 $ef
    ret                                                ;; 00:2817 $c9

call_00_2818:
    push HL                                            ;; 00:2818 $e5
    push DE                                            ;; 00:2819 $d5
    cp   A, $20                                        ;; 00:281a $fe $20
    jr   NC, .jr_00_2857                               ;; 00:281c $30 $39
    add  A, A                                          ;; 00:281e $87
    ld   HL, wC6FF                                     ;; 00:281f $21 $ff $c6
    rst  add_hl_a                                      ;; 00:2822 $c7
    ld   A, [HL]                                       ;; 00:2823 $7e
    inc  A                                             ;; 00:2824 $3c
    jr   Z, .jp_00_283a                                ;; 00:2825 $28 $13
    ld   A, [wCD22]                                    ;; 00:2827 $fa $22 $cd
    or   A, A                                          ;; 00:282a $b7
    jr   Z, .jp_00_283a                                ;; 00:282b $28 $0d
    inc  A                                             ;; 00:282d $3c
    ld   D, A                                          ;; 00:282e $57
    ld   A, [wCD21]                                    ;; 00:282f $fa $21 $cd
    ld   E, A                                          ;; 00:2832 $5f
    ld   A, [HL]                                       ;; 00:2833 $7e
    cp   A, E                                          ;; 00:2834 $bb
    jr   C, .jr_00_2886                                ;; 00:2835 $38 $4f
    cp   A, D                                          ;; 00:2837 $ba
    jr   NC, .jr_00_2886                               ;; 00:2838 $30 $4c
.jp_00_283a:
    call call_00_1e8f                                  ;; 00:283a $cd $8f $1e
    pop  DE                                            ;; 00:283d $d1
    ld   A, C                                          ;; 00:283e $79
    cp   A, $06                                        ;; 00:283f $fe $06
    jp   NZ, jp_00_310f                                ;; 00:2841 $c2 $0f $31
    ld   A, [wCD34]                                    ;; 00:2844 $fa $34 $cd
    and  A, $02                                        ;; 00:2847 $e6 $02
    jp   NZ, jp_00_310f                                ;; 00:2849 $c2 $0f $31
    call call_00_3114                                  ;; 00:284c $cd $14 $31
    ld   HL, $3155                                     ;; 00:284f $21 $55 $31
    ld   C, $02                                        ;; 00:2852 $0e $02
    jp   jp_00_310f                                    ;; 00:2854 $c3 $0f $31
.jr_00_2857:
    cp   A, $80                                        ;; 00:2857 $fe $80
    jr   NC, .jr_00_288d                               ;; 00:2859 $30 $32
    cp   A, $30                                        ;; 00:285b $fe $30
    jr   NC, .jr_00_28a8                               ;; 00:285d $30 $49
    push AF                                            ;; 00:285f $f5
    call call_00_1fc4                                  ;; 00:2860 $cd $c4 $1f
    ld   DE, wC540                                     ;; 00:2863 $11 $40 $c5
    add  HL, DE                                        ;; 00:2866 $19
    pop  AF                                            ;; 00:2867 $f1
    sub  A, $20                                        ;; 00:2868 $d6 $20
    ld   E, A                                          ;; 00:286a $5f
    ld   D, $00                                        ;; 00:286b $16 $00
    add  HL, DE                                        ;; 00:286d $19
    ld   A, [HL]                                       ;; 00:286e $7e
    inc  A                                             ;; 00:286f $3c
    jr   NZ, .jr_00_287c                               ;; 00:2870 $20 $0a
    ld   A, E                                          ;; 00:2872 $7b
    call call_00_2453                                  ;; 00:2873 $cd $53 $24
    ld   DE, $291d                                     ;; 00:2876 $11 $1d $29
    add  HL, DE                                        ;; 00:2879 $19
    jr   .jr_00_2880                                   ;; 00:287a $18 $04
.jr_00_287c:
    call call_00_1e8f                                  ;; 00:287c $cd $8f $1e
    inc  HL                                            ;; 00:287f $23
.jr_00_2880:
    ld   C, $07                                        ;; 00:2880 $0e $07
.jr_00_2882:
    pop  DE                                            ;; 00:2882 $d1
    jp   jp_00_310f                                    ;; 00:2883 $c3 $0f $31
.jr_00_2886:
    ld   HL, $2915                                     ;; 00:2886 $21 $15 $29
.jr_00_2889:
    ld   C, $08                                        ;; 00:2889 $0e $08
    jr   .jr_00_2882                                   ;; 00:288b $18 $f5
.jr_00_288d:
    call call_00_1fc4                                  ;; 00:288d $cd $c4 $1f
    ld   DE, wC562                                     ;; 00:2890 $11 $62 $c5
    add  HL, DE                                        ;; 00:2893 $19
    ld   A, [HL+]                                      ;; 00:2894 $2a
    inc  HL                                            ;; 00:2895 $23
    cp   A, $10                                        ;; 00:2896 $fe $10
    jr   NZ, .jp_00_283a                               ;; 00:2898 $20 $a0
    ld   A, [HL]                                       ;; 00:289a $7e
    call call_00_245f                                  ;; 00:289b $cd $5f $24
    ld   DE, $67f7                                     ;; 00:289e $11 $f7 $67
    add  HL, DE                                        ;; 00:28a1 $19
    rst  popActiveBankSafe                             ;; 00:28a2 $ef
    ld   A, $09                                        ;; 00:28a3 $3e $09
    rst  pushActiveBankSafe                            ;; 00:28a5 $e7
    jr   .jr_00_2889                                   ;; 00:28a6 $18 $e1
.jr_00_28a8:
    cp   A, $40                                        ;; 00:28a8 $fe $40
    jr   NC, .jr_00_28e1                               ;; 00:28aa $30 $35
    cp   A, $3f                                        ;; 00:28ac $fe $3f
    jr   Z, .jr_00_28c6                                ;; 00:28ae $28 $16
    cp   A, $36                                        ;; 00:28b0 $fe $36
    jr   NC, .jr_00_28cb                               ;; 00:28b2 $30 $17
    sub  A, $30                                        ;; 00:28b4 $d6 $30
    ld   HL, wCE2B                                     ;; 00:28b6 $21 $2b $ce
    rst  add_hl_a                                      ;; 00:28b9 $c7
.jr_00_28ba:
    ld   A, [HL]                                       ;; 00:28ba $7e
    inc  A                                             ;; 00:28bb $3c
    jr   Z, .jr_00_28c1                                ;; 00:28bc $28 $03
    jp   .jp_00_283a                                   ;; 00:28be $c3 $3a $28
.jr_00_28c1:
    ld   HL, $3155                                     ;; 00:28c1 $21 $55 $31
    jr   .jr_00_2889                                   ;; 00:28c4 $18 $c3
.jr_00_28c6:
    ld   HL, wCE94                                     ;; 00:28c6 $21 $94 $ce
    jr   .jr_00_28ba                                   ;; 00:28c9 $18 $ef
.jr_00_28cb:
    cp   A, $3a                                        ;; 00:28cb $fe $3a
    jr   NC, .jr_00_28d8                               ;; 00:28cd $30 $09
    sub  A, $36                                        ;; 00:28cf $d6 $36
    add  A, A                                          ;; 00:28d1 $87
    ld   HL, wCE31                                     ;; 00:28d2 $21 $31 $ce
    rst  add_hl_a                                      ;; 00:28d5 $c7
    jr   .jr_00_28ba                                   ;; 00:28d6 $18 $e2
.jr_00_28d8:
    sub  A, $3a                                        ;; 00:28d8 $d6 $3a
    ld   HL, wCE3C                                     ;; 00:28da $21 $3c $ce
    rst  add_hl_a                                      ;; 00:28dd $c7
    jp   .jp_00_283a                                   ;; 00:28de $c3 $3a $28
.jr_00_28e1:
    cp   A, $50                                        ;; 00:28e1 $fe $50
    jr   NC, .jr_00_28fb                               ;; 00:28e3 $30 $16
    push BC                                            ;; 00:28e5 $c5
    add  A, $98                                        ;; 00:28e6 $c6 $98
    push AF                                            ;; 00:28e8 $f5
    call call_00_2901                                  ;; 00:28e9 $cd $01 $29
    pop  BC                                            ;; 00:28ec $c1
    jr   NZ, .jr_00_28f3                               ;; 00:28ed $20 $04
    ld   A, $ff                                        ;; 00:28ef $3e $ff
    jr   .jr_00_28f4                                   ;; 00:28f1 $18 $01
.jr_00_28f3:
    ld   A, B                                          ;; 00:28f3 $78
.jr_00_28f4:
    ld   HL, wCE94                                     ;; 00:28f4 $21 $94 $ce
    ld   [HL], A                                       ;; 00:28f7 $77
    pop  BC                                            ;; 00:28f8 $c1
    jr   .jr_00_28ba                                   ;; 00:28f9 $18 $bf
.jr_00_28fb:
    ld   A, [wCE94]                                    ;; 00:28fb $fa $94 $ce
    jp   jp_00_2aec                                    ;; 00:28fe $c3 $ec $2a

call_00_2901:
    ld   HL, wC6F8                                     ;; 00:2901 $21 $f8 $c6
    sub  A, $d8                                        ;; 00:2904 $d6 $d8
    cp   A, $08                                        ;; 00:2906 $fe $08
    jr   C, .jr_00_290b                                ;; 00:2908 $38 $01
    inc  HL                                            ;; 00:290a $23
.jr_00_290b:
    and  A, $07                                        ;; 00:290b $e6 $07
    cpl                                                ;; 00:290d $2f
    add  A, $08                                        ;; 00:290e $c6 $08
    call call_00_1ef1                                  ;; 00:2910 $cd $f1 $1e
    and  A, [HL]                                       ;; 00:2913 $a6
    ret                                                ;; 00:2914 $c9
    db   $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2        ;; 00:2915 ........
    db   $90, $ea, $d8, $d4, $e3, $e2, $e1, $a1        ;; 00:291d ???????.
    db   $e6, $db, $dc, $d8, $df, $d7, $a2, $db        ;; 00:2925 ........
    db   $d8, $df, $e0, $ff, $ff, $a3, $d4, $e5        ;; 00:292d .....???
    db   $e0, $e2, $e5, $ff, $a4, $da, $df, $e2        ;; 00:2935 ????....
    db   $e9, $d8, $e6, $a5, $e6, $db, $e2, $d8        ;; 00:293d ........
    db   $e6, $ff, $a6, $e2, $e7, $db, $d8, $e5        ;; 00:2945 ........
    db   $e6, $a6, $e2, $e7, $db, $d8, $e5, $e6        ;; 00:294d ........

data_00_2955:
    call call_00_20de                                  ;; 00:2955 $cd $de $20
    push HL                                            ;; 00:2958 $e5
    push DE                                            ;; 00:2959 $d5
    cp   A, $10                                        ;; 00:295a $fe $10
    jr   NC, .jr_00_29a5                               ;; 00:295c $30 $47
    push AF                                            ;; 00:295e $f5
    call call_00_1fcd                                  ;; 00:295f $cd $cd $1f
    pop  AF                                            ;; 00:2962 $f1
    cp   A, $05                                        ;; 00:2963 $fe $05
    jr   NC, .jr_00_299b                               ;; 00:2965 $30 $34
    ld   DE, wC507                                     ;; 00:2967 $11 $07 $c5
    add  HL, DE                                        ;; 00:296a $19
    ld   DE, wCDA9                                     ;; 00:296b $11 $a9 $cd
    call call_00_1f84                                  ;; 00:296e $cd $84 $1f
    ld   C, $06                                        ;; 00:2971 $0e $06
    ld   E, C                                          ;; 00:2973 $59
    ld   A, [wCD34]                                    ;; 00:2974 $fa $34 $cd
    bit  1, A                                          ;; 00:2977 $cb $4f
    jr   Z, .jr_00_298b                                ;; 00:2979 $28 $10
    res  1, A                                          ;; 00:297b $cb $8f
    ld   [wCD34], A                                    ;; 00:297d $ea $34 $cd
    ld   HL, wCDAE                                     ;; 00:2980 $21 $ae $cd
.jr_00_2983:
    ld   A, [HL-]                                      ;; 00:2983 $3a
    cp   A, $ff                                        ;; 00:2984 $fe $ff
    jr   NZ, .jr_00_298b                               ;; 00:2986 $20 $03
    dec  C                                             ;; 00:2988 $0d
    jr   NZ, .jr_00_2983                               ;; 00:2989 $20 $f8
.jr_00_298b:
    ld   HL, wCDAF                                     ;; 00:298b $21 $af $cd
.jr_00_298e:
    dec  HL                                            ;; 00:298e $2b
    ld   A, [HL]                                       ;; 00:298f $7e
    cp   A, $4c                                        ;; 00:2990 $fe $4c
    jr   NZ, .jr_00_2996                               ;; 00:2992 $20 $02
    ld   [HL], $ff                                     ;; 00:2994 $36 $ff
.jr_00_2996:
    dec  E                                             ;; 00:2996 $1d
    jr   NZ, .jr_00_298e                               ;; 00:2997 $20 $f5
    jr   .jr_00_29a1                                   ;; 00:2999 $18 $06
.jr_00_299b:
    ld   DE, wC505                                     ;; 00:299b $11 $05 $c5
    add  HL, DE                                        ;; 00:299e $19
    ld   C, $08                                        ;; 00:299f $0e $08
.jr_00_29a1:
    pop  DE                                            ;; 00:29a1 $d1
    jp   jp_00_310f                                    ;; 00:29a2 $c3 $0f $31
.jr_00_29a5:
    cp   A, $20                                        ;; 00:29a5 $fe $20
    jr   NC, .jr_00_29c0                               ;; 00:29a7 $30 $17
    sub  A, $0c                                        ;; 00:29a9 $d6 $0c
    ld   HL, $60                                       ;; 00:29ab $21 $60 $00
    call call_00_246b                                  ;; 00:29ae $cd $6b $24
    ld   DE, $7a88                                     ;; 00:29b1 $11 $88 $7a
    add  HL, DE                                        ;; 00:29b4 $19
    call call_00_27c5                                  ;; 00:29b5 $cd $c5 $27
    ld   A, $07                                        ;; 00:29b8 $3e $07
    ld   C, $06                                        ;; 00:29ba $0e $06
.jr_00_29bc:
    pop  DE                                            ;; 00:29bc $d1
    jp   jp_00_3108                                    ;; 00:29bd $c3 $08 $31
.jr_00_29c0:
    ld   A, [wC68D]                                    ;; 00:29c0 $fa $8d $c6
    and  A, $78                                        ;; 00:29c3 $e6 $78
    rlca                                               ;; 00:29c5 $07
    swap A                                             ;; 00:29c6 $cb $37
    ld   HL, $29d7                                     ;; 00:29c8 $21 $d7 $29
    rst  add_hl_a                                      ;; 00:29cb $c7
    ld   A, [HL]                                       ;; 00:29cc $7e
    ld   HL, $78d7                                     ;; 00:29cd $21 $d7 $78
    rst  add_hl_a                                      ;; 00:29d0 $c7
    ld   A, $09                                        ;; 00:29d1 $3e $09
    ld   C, $07                                        ;; 00:29d3 $0e $07
    jr   .jr_00_29bc                                   ;; 00:29d5 $18 $e5
    db   $00, $0e, $00, $00, $00, $00, $07, $15        ;; 00:29d7 ww????ww
    db   $00, $00                                      ;; 00:29df ??

data_00_29e1:
    call call_00_20de                                  ;; 00:29e1 $cd $de $20
    push HL                                            ;; 00:29e4 $e5
    call call_00_29ef                                  ;; 00:29e5 $cd $ef $29
    ld   C, $04                                        ;; 00:29e8 $0e $04
    ld   A, $0e                                        ;; 00:29ea $3e $0e
    jp   jp_00_3108                                    ;; 00:29ec $c3 $08 $31

call_00_29ef:
    push DE                                            ;; 00:29ef $d5
    ld   E, A                                          ;; 00:29f0 $5f
    ld   A, [wCD37]                                    ;; 00:29f1 $fa $37 $cd
    or   A, A                                          ;; 00:29f4 $b7
    jr   NZ, .jr_00_2a1a                               ;; 00:29f5 $20 $23
    ld   A, E                                          ;; 00:29f7 $7b
    call call_00_1fcd                                  ;; 00:29f8 $cd $cd $1f
    ld   DE, wC501                                     ;; 00:29fb $11 $01 $c5
    add  HL, DE                                        ;; 00:29fe $19
    ld   E, $00                                        ;; 00:29ff $1e $00
    ld   A, [HL]                                       ;; 00:2a01 $7e
    and  A, $fc                                        ;; 00:2a02 $e6 $fc
    jr   Z, .jr_00_2a15                                ;; 00:2a04 $28 $0f
.jr_00_2a06:
    inc  E                                             ;; 00:2a06 $1c
    rla                                                ;; 00:2a07 $17
    jr   NC, .jr_00_2a06                               ;; 00:2a08 $30 $fc
.jr_00_2a0a:
    ld   A, E                                          ;; 00:2a0a $7b
    call call_00_2437                                  ;; 00:2a0b $cd $37 $24
    ld   A, E                                          ;; 00:2a0e $7b
    ld   DE, $6d73                                     ;; 00:2a0f $11 $73 $6d
    add  HL, DE                                        ;; 00:2a12 $19
.jr_00_2a13:
    pop  DE                                            ;; 00:2a13 $d1
    ret                                                ;; 00:2a14 $c9
.jr_00_2a15:
    ld   HL, $6d73                                     ;; 00:2a15 $21 $73 $6d
    jr   .jr_00_2a13                                   ;; 00:2a18 $18 $f9
.jr_00_2a1a:
    call call_00_1fc4                                  ;; 00:2a1a $cd $c4 $1f
    ld   DE, wC501                                     ;; 00:2a1d $11 $01 $c5
    add  HL, DE                                        ;; 00:2a20 $19
    ld   A, [HL+]                                      ;; 00:2a21 $2a
    and  A, $fc                                        ;; 00:2a22 $e6 $fc
    ld   E, A                                          ;; 00:2a24 $5f
    ld   A, [HL-]                                      ;; 00:2a25 $3a
    and  A, $e0                                        ;; 00:2a26 $e6 $e0
    or   A, E                                          ;; 00:2a28 $b3
    jr   Z, .jr_00_2a15                                ;; 00:2a29 $28 $ea
    ld   E, $00                                        ;; 00:2a2b $1e $00
    ld   A, [HL+]                                      ;; 00:2a2d $2a
    ld   D, $02                                        ;; 00:2a2e $16 $02
    call call_00_2a4b                                  ;; 00:2a30 $cd $4b $2a
    jr   C, .jr_00_2a0a                                ;; 00:2a33 $38 $d5
    ld   A, [HL-]                                      ;; 00:2a35 $3a
    ld   D, $03                                        ;; 00:2a36 $16 $03
    ld   E, $06                                        ;; 00:2a38 $1e $06
    call call_00_2a4b                                  ;; 00:2a3a $cd $4b $2a
    jr   C, .jr_00_2a0a                                ;; 00:2a3d $38 $cb
    ld   D, $04                                        ;; 00:2a3f $16 $04
    ld   E, $02                                        ;; 00:2a41 $1e $02
    ld   A, [HL]                                       ;; 00:2a43 $7e
    rla                                                ;; 00:2a44 $17
    rla                                                ;; 00:2a45 $17
    call call_00_2a4b                                  ;; 00:2a46 $cd $4b $2a
    jr   .jr_00_2a0a                                   ;; 00:2a49 $18 $bf

call_00_2a4b:
    inc  E                                             ;; 00:2a4b $1c
    rla                                                ;; 00:2a4c $17
    ret  C                                             ;; 00:2a4d $d8
    dec  D                                             ;; 00:2a4e $15
    jr   NZ, call_00_2a4b                              ;; 00:2a4f $20 $fa
    ret                                                ;; 00:2a51 $c9

data_00_2a52:
    push HL                                            ;; 00:2a52 $e5
    ld   HL, $2a64                                     ;; 00:2a53 $21 $64 $2a
    ld   C, $01                                        ;; 00:2a56 $0e $01
    call call_00_3114                                  ;; 00:2a58 $cd $14 $31
    pop  HL                                            ;; 00:2a5b $e1
    call call_00_20de                                  ;; 00:2a5c $cd $de $20
    ld   C, $03                                        ;; 00:2a5f $0e $03
    jp   jp_00_30e8                                    ;; 00:2a61 $c3 $e8 $30
    db   $c5                                           ;; 00:2a64 .

data_00_2a65:
    call call_00_20de                                  ;; 00:2a65 $cd $de $20
    push HL                                            ;; 00:2a68 $e5
    push DE                                            ;; 00:2a69 $d5
    call call_00_26ba                                  ;; 00:2a6a $cd $ba $26
    call call_09_48ee                                  ;; 00:2a6d $cd $ee $48
    rst  popActiveBankSafe                             ;; 00:2a70 $ef
    ld   DE, $6d4f                                     ;; 00:2a71 $11 $4f $6d
    add  HL, DE                                        ;; 00:2a74 $19
    pop  DE                                            ;; 00:2a75 $d1
    ld   A, $0e                                        ;; 00:2a76 $3e $0e
    jp   jp_00_3108                                    ;; 00:2a78 $c3 $08 $31

data_00_2a7b:
    call call_00_20de                                  ;; 00:2a7b $cd $de $20
    push HL                                            ;; 00:2a7e $e5
    cp   A, $04                                        ;; 00:2a7f $fe $04
    jr   Z, .jr_00_2ad0                                ;; 00:2a81 $28 $4d
    push AF                                            ;; 00:2a83 $f5
    ld   HL, $2ad8                                     ;; 00:2a84 $21 $d8 $2a
    ld   C, $04                                        ;; 00:2a87 $0e $04
    call call_00_3114                                  ;; 00:2a89 $cd $14 $31
    pop  AF                                            ;; 00:2a8c $f1
    push DE                                            ;; 00:2a8d $d5
    push BC                                            ;; 00:2a8e $c5
    push AF                                            ;; 00:2a8f $f5
    ld   L, A                                          ;; 00:2a90 $6f
    add  A, L                                          ;; 00:2a91 $85
    add  A, L                                          ;; 00:2a92 $85
    ld   HL, wCD9D                                     ;; 00:2a93 $21 $9d $cd
    rst  add_hl_a                                      ;; 00:2a96 $c7
    ld   DE, wCD28                                     ;; 00:2a97 $11 $28 $cd
    call call_00_1f8d                                  ;; 00:2a9a $cd $8d $1f
    pop  AF                                            ;; 00:2a9d $f1
    call call_00_1fcd                                  ;; 00:2a9e $cd $cd $1f
    ld   DE, wC504                                     ;; 00:2aa1 $11 $04 $c5
    add  HL, DE                                        ;; 00:2aa4 $19
    ld   DE, wCD28                                     ;; 00:2aa5 $11 $28 $cd
    ld   A, [DE]                                       ;; 00:2aa8 $1a
    sub  A, [HL]                                       ;; 00:2aa9 $96
    ld   [DE], A                                       ;; 00:2aaa $12
    inc  HL                                            ;; 00:2aab $23
    inc  DE                                            ;; 00:2aac $13
    ld   A, [DE]                                       ;; 00:2aad $1a
    sbc  A, [HL]                                       ;; 00:2aae $9e
    ld   [DE], A                                       ;; 00:2aaf $12
    inc  HL                                            ;; 00:2ab0 $23
    inc  DE                                            ;; 00:2ab1 $13
    ld   A, [DE]                                       ;; 00:2ab2 $1a
    sbc  A, [HL]                                       ;; 00:2ab3 $9e
    ld   [DE], A                                       ;; 00:2ab4 $12
    jr   NC, .jr_00_2abe                               ;; 00:2ab5 $30 $07
    ld   HL, wCD28                                     ;; 00:2ab7 $21 $28 $cd
    xor  A, A                                          ;; 00:2aba $af
    ld   [HL+], A                                      ;; 00:2abb $22
    ld   [HL+], A                                      ;; 00:2abc $22
    ld   [HL+], A                                      ;; 00:2abd $22
.jr_00_2abe:
    ld   HL, wCD28                                     ;; 00:2abe $21 $28 $cd
    ld   A, $03                                        ;; 00:2ac1 $3e $03
    call call_00_2009                                  ;; 00:2ac3 $cd $09 $20
    pop  BC                                            ;; 00:2ac6 $c1
    pop  DE                                            ;; 00:2ac7 $d1
    ld   HL, wCD2C                                     ;; 00:2ac8 $21 $2c $cd
    ld   C, $06                                        ;; 00:2acb $0e $06
    jp   jp_00_310f                                    ;; 00:2acd $c3 $0f $31
.jr_00_2ad0:
    ld   HL, $3155                                     ;; 00:2ad0 $21 $55 $31
    ld   C, $0a                                        ;; 00:2ad3 $0e $0a
    jp   jp_00_310f                                    ;; 00:2ad5 $c3 $0f $31
    db   $c7, $be, $d1, $cd                            ;; 00:2ad8 ....

data_00_2adc:
    ld   A, [HL+]                                      ;; 00:2adc $2a
    push HL                                            ;; 00:2add $e5
    push DE                                            ;; 00:2ade $d5
    ld   C, A                                          ;; 00:2adf $4f
    call call_00_1fc4                                  ;; 00:2ae0 $cd $c4 $1f
    ld   DE, wC548                                     ;; 00:2ae3 $11 $48 $c5
    add  HL, DE                                        ;; 00:2ae6 $19
    ld   E, C                                          ;; 00:2ae7 $59
    ld   D, $00                                        ;; 00:2ae8 $16 $00
    add  HL, DE                                        ;; 00:2aea $19
    ld   A, [HL]                                       ;; 00:2aeb $7e

jp_00_2aec:
    ld   HL, $3155                                     ;; 00:2aec $21 $55 $31
    cp   A, $ff                                        ;; 00:2aef $fe $ff
    jr   Z, .jr_00_2afa                                ;; 00:2af1 $28 $07
    call call_00_245f                                  ;; 00:2af3 $cd $5f $24
    ld   DE, $67f7                                     ;; 00:2af6 $11 $f7 $67
    add  HL, DE                                        ;; 00:2af9 $19
.jr_00_2afa:
    pop  DE                                            ;; 00:2afa $d1
    ld   C, $08                                        ;; 00:2afb $0e $08
    ld   A, $09                                        ;; 00:2afd $3e $09
    jp   jp_00_3108                                    ;; 00:2aff $c3 $08 $31
    db   $3e, $01, $ea, $c1, $cd, $c9                  ;; 00:2b02 ??????

data_00_2b08:
    call call_00_20de                                  ;; 00:2b08 $cd $de $20
    push HL                                            ;; 00:2b0b $e5
    cp   A, $04                                        ;; 00:2b0c $fe $04
    jr   Z, .jr_00_2b30                                ;; 00:2b0e $28 $20
    push AF                                            ;; 00:2b10 $f5
    ld   HL, $2b38                                     ;; 00:2b11 $21 $38 $2b
    ld   C, $03                                        ;; 00:2b14 $0e $03
    call call_00_3114                                  ;; 00:2b16 $cd $14 $31
    pop  AF                                            ;; 00:2b19 $f1
    push DE                                            ;; 00:2b1a $d5
    call call_00_1fcd                                  ;; 00:2b1b $cd $cd $1f
    ld   DE, wC504                                     ;; 00:2b1e $11 $04 $c5
    add  HL, DE                                        ;; 00:2b21 $19
    ld   A, $03                                        ;; 00:2b22 $3e $03
    call call_00_2009                                  ;; 00:2b24 $cd $09 $20
    ld   HL, wCD2B                                     ;; 00:2b27 $21 $2b $cd
    pop  DE                                            ;; 00:2b2a $d1
    ld   C, $07                                        ;; 00:2b2b $0e $07
    jp   jp_00_310f                                    ;; 00:2b2d $c3 $0f $31
.jr_00_2b30:
    ld   HL, $3155                                     ;; 00:2b30 $21 $55 $31
    ld   C, $0a                                        ;; 00:2b33 $0e $0a
    jp   jp_00_310f                                    ;; 00:2b35 $c3 $0f $31
    db   $be, $d1, $c9                                 ;; 00:2b38 ...

call_00_2b3b:
    ld   A, [HL+]                                      ;; 00:2b3b $2a
    ld   C, $01                                        ;; 00:2b3c $0e $01
.jr_00_2b3e:
    sub  A, $0a                                        ;; 00:2b3e $d6 $0a
    jr   C, .jr_00_2b45                                ;; 00:2b40 $38 $03
    inc  C                                             ;; 00:2b42 $0c
    jr   .jr_00_2b3e                                   ;; 00:2b43 $18 $f9
.jr_00_2b45:
    add  A, $0a                                        ;; 00:2b45 $c6 $0a
    cp   A, $09                                        ;; 00:2b47 $fe $09
    jr   NZ, .jr_00_2b4d                               ;; 00:2b49 $20 $02
    ld   A, $ff                                        ;; 00:2b4b $3e $ff
.jr_00_2b4d:
    push HL                                            ;; 00:2b4d $e5
    ld   HL, wCD28                                     ;; 00:2b4e $21 $28 $cd
    ld   [HL], A                                       ;; 00:2b51 $77
    push BC                                            ;; 00:2b52 $c5
    call call_00_20de                                  ;; 00:2b53 $cd $de $20
    pop  BC                                            ;; 00:2b56 $c1
    pop  HL                                            ;; 00:2b57 $e1
    dec  C                                             ;; 00:2b58 $0d
    jr   Z, call_00_2b69                               ;; 00:2b59 $28 $0e
    dec  C                                             ;; 00:2b5b $0d
    jr   Z, jr_00_2b6d                                 ;; 00:2b5c $28 $0f
    dec  C                                             ;; 00:2b5e $0d
    jr   Z, jr_00_2b71                                 ;; 00:2b5f $28 $10
    dec  C                                             ;; 00:2b61 $0d
    jr   Z, call_00_2b85                               ;; 00:2b62 $28 $21
    dec  C                                             ;; 00:2b64 $0d
    jr   Z, jr_00_2b89                                 ;; 00:2b65 $28 $22
    jr   jr_00_2b8d                                    ;; 00:2b67 $18 $24

call_00_2b69:
    ld   C, $10                                        ;; 00:2b69 $0e $10
    jr   jr_00_2b97                                    ;; 00:2b6b $18 $2a

jr_00_2b6d:
    ld   C, $12                                        ;; 00:2b6d $0e $12
    jr   jr_00_2b97                                    ;; 00:2b6f $18 $26

jr_00_2b71:
    push AF                                            ;; 00:2b71 $f5
    call call_00_2b69                                  ;; 00:2b72 $cd $69 $2b
    call call_00_2b7b                                  ;; 00:2b75 $cd $7b $2b
    pop  AF                                            ;; 00:2b78 $f1
    jr   jr_00_2b6d                                    ;; 00:2b79 $18 $f2

call_00_2b7b:
    push HL                                            ;; 00:2b7b $e5
    ld   HL, $2b84                                     ;; 00:2b7c $21 $84 $2b
    ld   C, $01                                        ;; 00:2b7f $0e $01
    jp   jp_00_310f                                    ;; 00:2b81 $c3 $0f $31
    db   $f1                                           ;; 00:2b84 .

call_00_2b85:
    ld   C, $14                                        ;; 00:2b85 $0e $14
    jr   jr_00_2b97                                    ;; 00:2b87 $18 $0e

jr_00_2b89:
    ld   C, $16                                        ;; 00:2b89 $0e $16
    jr   jr_00_2b97                                    ;; 00:2b8b $18 $0a

jr_00_2b8d:
    push AF                                            ;; 00:2b8d $f5
    call call_00_2b85                                  ;; 00:2b8e $cd $85 $2b
    call call_00_2b7b                                  ;; 00:2b91 $cd $7b $2b
    pop  AF                                            ;; 00:2b94 $f1
    jr   jr_00_2b89                                    ;; 00:2b95 $18 $f2

jr_00_2b97:
    push HL                                            ;; 00:2b97 $e5
    push DE                                            ;; 00:2b98 $d5
    call call_00_1fcd                                  ;; 00:2b99 $cd $cd $1f
    ld   E, C                                          ;; 00:2b9c $59
    ld   D, $c5                                        ;; 00:2b9d $16 $c5
    add  HL, DE                                        ;; 00:2b9f $19
    ld   A, [HL+]                                      ;; 00:2ba0 $2a
    ld   E, A                                          ;; 00:2ba1 $5f
    ld   A, [HL-]                                      ;; 00:2ba2 $3a
    cp   A, $03                                        ;; 00:2ba3 $fe $03
    jr   C, .jr_00_2bb1                                ;; 00:2ba5 $38 $0a
    jr   NZ, .jr_00_2bae                               ;; 00:2ba7 $20 $05
    ld   A, E                                          ;; 00:2ba9 $7b
    cp   A, $e7                                        ;; 00:2baa $fe $e7
    jr   C, .jr_00_2bb1                                ;; 00:2bac $38 $03
.jr_00_2bae:
    ld   HL, $2bbf                                     ;; 00:2bae $21 $bf $2b
.jr_00_2bb1:
    ld   A, $02                                        ;; 00:2bb1 $3e $02
    call call_00_2009                                  ;; 00:2bb3 $cd $09 $20
    ld   HL, wCD2F                                     ;; 00:2bb6 $21 $2f $cd
    pop  DE                                            ;; 00:2bb9 $d1
    ld   C, $03                                        ;; 00:2bba $0e $03
    jp   jp_00_310f                                    ;; 00:2bbc $c3 $0f $31
    db   $e7, $03                                      ;; 00:2bbf ??

data_00_2bc1:
    ld   A, [HL+]                                      ;; 00:2bc1 $2a
    push HL                                            ;; 00:2bc2 $e5
    ld   C, A                                          ;; 00:2bc3 $4f
    swap A                                             ;; 00:2bc4 $cb $37
    and  A, $0f                                        ;; 00:2bc6 $e6 $0f
    add  A, A                                          ;; 00:2bc8 $87
    add  A, A                                          ;; 00:2bc9 $87
    ld   HL, wCDEC                                     ;; 00:2bca $21 $ec $cd
    rst  add_hl_a                                      ;; 00:2bcd $c7
    ld   L, [HL]                                       ;; 00:2bce $6e
    ld   A, C                                          ;; 00:2bcf $79
    and  A, $0f                                        ;; 00:2bd0 $e6 $0f
    jr   NZ, .jr_00_2bfa                               ;; 00:2bd2 $20 $26
    ld   A, L                                          ;; 00:2bd4 $7d
    or   A, A                                          ;; 00:2bd5 $b7
    jr   NZ, .jr_00_2be6                               ;; 00:2bd6 $20 $0e
    ld   A, C                                          ;; 00:2bd8 $79
    swap A                                             ;; 00:2bd9 $cb $37
    and  A, $0f                                        ;; 00:2bdb $e6 $0f
    ld   HL, $2c1c                                     ;; 00:2bdd $21 $1c $2c
    rst  add_hl_a                                      ;; 00:2be0 $c7
    call call_00_2b3b                                  ;; 00:2be1 $cd $3b $2b
    pop  HL                                            ;; 00:2be4 $e1
    ret                                                ;; 00:2be5 $c9
.jr_00_2be6:
    ld   A, C                                          ;; 00:2be6 $79
    swap A                                             ;; 00:2be7 $cb $37
    and  A, $0f                                        ;; 00:2be9 $e6 $0f
    ld   HL, $2c17                                     ;; 00:2beb $21 $17 $2c
    rst  add_hl_a                                      ;; 00:2bee $c7
    call call_00_2b3b                                  ;; 00:2bef $cd $3b $2b
.jr_00_2bf2:
    ld   HL, $3155                                     ;; 00:2bf2 $21 $55 $31
.jr_00_2bf5:
    ld   C, $04                                        ;; 00:2bf5 $0e $04
    jp   jp_00_310f                                    ;; 00:2bf7 $c3 $0f $31
.jr_00_2bfa:
    ld   A, L                                          ;; 00:2bfa $7d
    or   A, A                                          ;; 00:2bfb $b7
    jr   NZ, .jr_00_2c0a                               ;; 00:2bfc $20 $0c
    ld   A, C                                          ;; 00:2bfe $79
    and  A, $0f                                        ;; 00:2bff $e6 $0f
    cp   A, $02                                        ;; 00:2c01 $fe $02
    jr   NZ, .jr_00_2bf2                               ;; 00:2c03 $20 $ed
    ld   HL, $2c21                                     ;; 00:2c05 $21 $21 $2c
    jr   .jr_00_2bf5                                   ;; 00:2c08 $18 $eb
.jr_00_2c0a:
    ld   A, C                                          ;; 00:2c0a $79
    swap A                                             ;; 00:2c0b $cb $37
    and  A, $0f                                        ;; 00:2c0d $e6 $0f
    add  A, A                                          ;; 00:2c0f $87
    add  A, A                                          ;; 00:2c10 $87
    ld   HL, wCDEC                                     ;; 00:2c11 $21 $ec $cd
    rst  add_hl_a                                      ;; 00:2c14 $c7
    jr   .jr_00_2bf5                                   ;; 00:2c15 $18 $de
    db   $05, $06, $07, $08, $04, $19, $1a, $1b        ;; 00:2c17 ...??...
    db   $1c, $18, $c0, $e2, $e2, $d7                  ;; 00:2c1f .?....

data_00_2c25:
    ld   A, [HL+]                                      ;; 00:2c25 $2a
    push HL                                            ;; 00:2c26 $e5
    push DE                                            ;; 00:2c27 $d5
    cp   A, $20                                        ;; 00:2c28 $fe $20
    jr   NC, .jr_00_2c79                               ;; 00:2c2a $30 $4d
    cp   A, $10                                        ;; 00:2c2c $fe $10
    jr   NC, .jr_00_2c45                               ;; 00:2c2e $30 $15
    push AF                                            ;; 00:2c30 $f5
    call call_00_1fc4                                  ;; 00:2c31 $cd $c4 $1f
    ld   DE, wC550                                     ;; 00:2c34 $11 $50 $c5
    add  HL, DE                                        ;; 00:2c37 $19
    ld   A, [HL]                                       ;; 00:2c38 $7e
    pop  DE                                            ;; 00:2c39 $d1
    inc  D                                             ;; 00:2c3a $14
.jr_00_2c3b:
    rlca                                               ;; 00:2c3b $07
    dec  D                                             ;; 00:2c3c $15
    jr   NZ, .jr_00_2c3b                               ;; 00:2c3d $20 $fc
    and  A, $01                                        ;; 00:2c3f $e6 $01
    jr   Z, .jr_00_2c67                                ;; 00:2c41 $28 $24
    jr   .jr_00_2c70                                   ;; 00:2c43 $18 $2b
.jr_00_2c45:
    and  A, $0f                                        ;; 00:2c45 $e6 $0f
    inc  A                                             ;; 00:2c47 $3c
    ld   C, A                                          ;; 00:2c48 $4f
    call call_00_1fc4                                  ;; 00:2c49 $cd $c4 $1f
    ld   DE, wC539                                     ;; 00:2c4c $11 $39 $c5
    add  HL, DE                                        ;; 00:2c4f $19
    call call_00_2c91                                  ;; 00:2c50 $cd $91 $2c
    jr   C, .jr_00_2c67                                ;; 00:2c53 $38 $12
    ld   DE, $1f                                       ;; 00:2c55 $11 $1f $00
    add  HL, DE                                        ;; 00:2c58 $19
    call call_00_2c91                                  ;; 00:2c59 $cd $91 $2c
    jr   C, .jr_00_2c70                                ;; 00:2c5c $38 $12
.jr_00_2c5e:
    pop  DE                                            ;; 00:2c5e $d1
    ld   HL, $3155                                     ;; 00:2c5f $21 $55 $31
    ld   C, $01                                        ;; 00:2c62 $0e $01
    jp   jp_00_310f                                    ;; 00:2c64 $c3 $0f $31
.jr_00_2c67:
    pop  DE                                            ;; 00:2c67 $d1
    ld   HL, $2c9a                                     ;; 00:2c68 $21 $9a $2c
    ld   C, $01                                        ;; 00:2c6b $0e $01
    jp   jp_00_310f                                    ;; 00:2c6d $c3 $0f $31
.jr_00_2c70:
    pop  DE                                            ;; 00:2c70 $d1
    ld   HL, $2c9b                                     ;; 00:2c71 $21 $9b $2c
    ld   C, $01                                        ;; 00:2c74 $0e $01
    jp   jp_00_310f                                    ;; 00:2c76 $c3 $0f $31
.jr_00_2c79:
    and  A, $0f                                        ;; 00:2c79 $e6 $0f
    inc  A                                             ;; 00:2c7b $3c
    ld   C, A                                          ;; 00:2c7c $4f
    call call_00_1fc4                                  ;; 00:2c7d $cd $c4 $1f
    ld   DE, wC53A                                     ;; 00:2c80 $11 $3a $c5
    add  HL, DE                                        ;; 00:2c83 $19
    ld   A, [HL+]                                      ;; 00:2c84 $2a
    rrca                                               ;; 00:2c85 $0f
    rrca                                               ;; 00:2c86 $0f
    and  A, $1f                                        ;; 00:2c87 $e6 $1f
    or   A, [HL]                                       ;; 00:2c89 $b6
    call call_00_2c92                                  ;; 00:2c8a $cd $92 $2c
    jr   C, .jr_00_2c67                                ;; 00:2c8d $38 $d8
    jr   .jr_00_2c5e                                   ;; 00:2c8f $18 $cd

call_00_2c91:
    ld   A, [HL]                                       ;; 00:2c91 $7e

call_00_2c92:
    push BC                                            ;; 00:2c92 $c5
.jr_00_2c93:
    rlca                                               ;; 00:2c93 $07
    dec  C                                             ;; 00:2c94 $0d
    jr   NZ, .jr_00_2c93                               ;; 00:2c95 $20 $fc
    pop  BC                                            ;; 00:2c97 $c1
    rrca                                               ;; 00:2c98 $0f
    ret                                                ;; 00:2c99 $c9
    db   $f5, $f6                                      ;; 00:2c9a .?

data_00_2c9c:
    ld   A, [HL+]                                      ;; 00:2c9c $2a
    push HL                                            ;; 00:2c9d $e5
    push DE                                            ;; 00:2c9e $d5
    ld   HL, wCE94                                     ;; 00:2c9f $21 $94 $ce
    ld   [HL], A                                       ;; 00:2ca2 $77
    call call_00_27c5                                  ;; 00:2ca3 $cd $c5 $27
    call call_00_26c0                                  ;; 00:2ca6 $cd $c0 $26
    call call_00_1e8f                                  ;; 00:2ca9 $cd $8f $1e
    pop  DE                                            ;; 00:2cac $d1
    call call_00_3114                                  ;; 00:2cad $cd $14 $31
    pop  HL                                            ;; 00:2cb0 $e1
    rst  popActiveBankSafe                             ;; 00:2cb1 $ef
    ret                                                ;; 00:2cb2 $c9

call_00_2cb3:
    ld   A, $00                                        ;; 00:2cb3 $3e $00
    call call_00_2d03                                  ;; 00:2cb5 $cd $03 $2d
    ld   C, $18                                        ;; 00:2cb8 $0e $18
    jp   jp_00_30e8                                    ;; 00:2cba $c3 $e8 $30

call_00_2cbd:
    ld   A, $07                                        ;; 00:2cbd $3e $07
    call call_00_2d03                                  ;; 00:2cbf $cd $03 $2d
    ld   C, $19                                        ;; 00:2cc2 $0e $19
    jp   jp_00_30e8                                    ;; 00:2cc4 $c3 $e8 $30

call_00_2cc7:
    ld   A, $0e                                        ;; 00:2cc7 $3e $0e
    call call_00_2d03                                  ;; 00:2cc9 $cd $03 $2d
    ld   C, $1a                                        ;; 00:2ccc $0e $1a
    jp   jp_00_30e8                                    ;; 00:2cce $c3 $e8 $30

call_00_2cd1:
    ld   A, $15                                        ;; 00:2cd1 $3e $15
    call call_00_2d03                                  ;; 00:2cd3 $cd $03 $2d
    ld   C, $1b                                        ;; 00:2cd6 $0e $1b
    jp   jp_00_30e8                                    ;; 00:2cd8 $c3 $e8 $30

call_00_2cdb:
    ld   A, $1c                                        ;; 00:2cdb $3e $1c
    call call_00_2d03                                  ;; 00:2cdd $cd $03 $2d
    ld   C, $57                                        ;; 00:2ce0 $0e $57
    jp   jp_00_30e8                                    ;; 00:2ce2 $c3 $e8 $30

call_00_2ce5:
    ld   A, $23                                        ;; 00:2ce5 $3e $23
    call call_00_2d03                                  ;; 00:2ce7 $cd $03 $2d
    ld   C, $3d                                        ;; 00:2cea $0e $3d
    jp   jp_00_30e8                                    ;; 00:2cec $c3 $e8 $30

call_00_2cef:
    ld   A, $2a                                        ;; 00:2cef $3e $2a
    call call_00_2d03                                  ;; 00:2cf1 $cd $03 $2d
    ld   C, $3e                                        ;; 00:2cf4 $0e $3e
    jp   jp_00_30e8                                    ;; 00:2cf6 $c3 $e8 $30

jp_00_2cf9:
    ld   A, $31                                        ;; 00:2cf9 $3e $31
    call call_00_2d03                                  ;; 00:2cfb $cd $03 $2d
    ld   C, $3f                                        ;; 00:2cfe $0e $3f
    jp   jp_00_30e8                                    ;; 00:2d00 $c3 $e8 $30

call_00_2d03:
    push HL                                            ;; 00:2d03 $e5
    ld   HL, $67bf                                     ;; 00:2d04 $21 $bf $67
    rst  add_hl_a                                      ;; 00:2d07 $c7
    ld   C, $07                                        ;; 00:2d08 $0e $07
    call call_00_3114                                  ;; 00:2d0a $cd $14 $31
    pop  HL                                            ;; 00:2d0d $e1
    jp   call_00_20de                                  ;; 00:2d0e $c3 $de $20

data_00_2d11:
    ld   A, [HL+]                                      ;; 00:2d11 $2a
    push HL                                            ;; 00:2d12 $e5
    push BC                                            ;; 00:2d13 $c5
    cp   A, $20                                        ;; 00:2d14 $fe $20
    jr   NC, .jr_00_2d5b                               ;; 00:2d16 $30 $43
    add  A, A                                          ;; 00:2d18 $87
    ld   HL, wC6FF                                     ;; 00:2d19 $21 $ff $c6
    rst  add_hl_a                                      ;; 00:2d1c $c7
    push DE                                            ;; 00:2d1d $d5
    ld   A, [HL]                                       ;; 00:2d1e $7e
    cp   A, $ff                                        ;; 00:2d1f $fe $ff
    jr   Z, .jr_00_2d3f                                ;; 00:2d21 $28 $1c
    ld   A, [wCD21]                                    ;; 00:2d23 $fa $21 $cd
    ld   E, A                                          ;; 00:2d26 $5f
    ld   A, [wCD22]                                    ;; 00:2d27 $fa $22 $cd
    inc  A                                             ;; 00:2d2a $3c
    ld   D, A                                          ;; 00:2d2b $57
    dec  A                                             ;; 00:2d2c $3d
    or   A, E                                          ;; 00:2d2d $b3
    jr   Z, .jr_00_2d3f                                ;; 00:2d2e $28 $0f
    ld   A, [HL]                                       ;; 00:2d30 $7e
    cp   A, E                                          ;; 00:2d31 $bb
    jr   C, .jr_00_2d37                                ;; 00:2d32 $38 $03
    cp   A, D                                          ;; 00:2d34 $ba
    jr   C, .jr_00_2d3f                                ;; 00:2d35 $38 $08
.jr_00_2d37:
    pop  DE                                            ;; 00:2d37 $d1
    ld   HL, $2dba                                     ;; 00:2d38 $21 $ba $2d
    ld   A, $01                                        ;; 00:2d3b $3e $01
    jr   .jr_00_2d56                                   ;; 00:2d3d $18 $17
.jr_00_2d3f:
    pop  DE                                            ;; 00:2d3f $d1
    ld   A, [HL+]                                      ;; 00:2d40 $2a
    ld   C, A                                          ;; 00:2d41 $4f
    inc  A                                             ;; 00:2d42 $3c
    jr   NZ, .jr_00_2d4c                               ;; 00:2d43 $20 $07
    ld   A, $01                                        ;; 00:2d45 $3e $01
    ld   HL, $3156                                     ;; 00:2d47 $21 $56 $31
    jr   .jr_00_2d56                                   ;; 00:2d4a $18 $0a
.jr_00_2d4c:
    ld   A, $01                                        ;; 00:2d4c $3e $01
    call call_00_2009                                  ;; 00:2d4e $cd $09 $20
    ld   HL, wCD31                                     ;; 00:2d51 $21 $31 $cd
    ld   A, $01                                        ;; 00:2d54 $3e $01
.jr_00_2d56:
    pop  BC                                            ;; 00:2d56 $c1
    ld   C, A                                          ;; 00:2d57 $4f
    jp   jp_00_310f                                    ;; 00:2d58 $c3 $0f $31
.jr_00_2d5b:
    cp   A, $30                                        ;; 00:2d5b $fe $30
    jr   NC, .jr_00_2d97                               ;; 00:2d5d $30 $38
    sub  A, $20                                        ;; 00:2d5f $d6 $20
    push DE                                            ;; 00:2d61 $d5
    push AF                                            ;; 00:2d62 $f5
    call call_00_1fc4                                  ;; 00:2d63 $cd $c4 $1f
    ld   DE, wC540                                     ;; 00:2d66 $11 $40 $c5
    add  HL, DE                                        ;; 00:2d69 $19
    pop  AF                                            ;; 00:2d6a $f1
    ld   E, A                                          ;; 00:2d6b $5f
    ld   D, $00                                        ;; 00:2d6c $16 $00
    add  HL, DE                                        ;; 00:2d6e $19
    ld   A, [HL]                                       ;; 00:2d6f $7e
    cp   A, $6e                                        ;; 00:2d70 $fe $6e
    jr   C, .jr_00_2d8d                                ;; 00:2d72 $38 $19
    cp   A, $78                                        ;; 00:2d74 $fe $78
    jr   NC, .jr_00_2d8d                               ;; 00:2d76 $30 $15
    ld   DE, hMusicNoteDurationChannel3Copy            ;; 00:2d78 $11 $c0 $ff
    add  HL, DE                                        ;; 00:2d7b $19
    ld   A, [HL]                                       ;; 00:2d7c $7e
    and  A, $0f                                        ;; 00:2d7d $e6 $0f
    ld   HL, wCD28                                     ;; 00:2d7f $21 $28 $cd
    ld   [HL], A                                       ;; 00:2d82 $77
    ld   A, $01                                        ;; 00:2d83 $3e $01
    call call_00_2009                                  ;; 00:2d85 $cd $09 $20
    ld   HL, wCD31                                     ;; 00:2d88 $21 $31 $cd
    jr   .jr_00_2d90                                   ;; 00:2d8b $18 $03
.jr_00_2d8d:
    ld   HL, $3155                                     ;; 00:2d8d $21 $55 $31
.jr_00_2d90:
    pop  DE                                            ;; 00:2d90 $d1
    pop  BC                                            ;; 00:2d91 $c1
    ld   C, $01                                        ;; 00:2d92 $0e $01
    jp   jp_00_310f                                    ;; 00:2d94 $c3 $0f $31
.jr_00_2d97:
    push DE                                            ;; 00:2d97 $d5
    add  A, $a2                                        ;; 00:2d98 $c6 $a2
    ld   [wCE91], A                                    ;; 00:2d9a $ea $91 $ce
    rst  rst_00_0018                                   ;; 00:2d9d $df
    db   $0e                                           ;; 00:2d9e ?
    ld   A, [wCE91]                                    ;; 00:2d9f $fa $91 $ce
    inc  A                                             ;; 00:2da2 $3c
    jr   Z, .jr_00_2da7                                ;; 00:2da3 $28 $02
    inc  [HL]                                          ;; 00:2da5 $34
    ld   A, [HL]                                       ;; 00:2da6 $7e
.jr_00_2da7:
    ld   HL, hFFA1                                     ;; 00:2da7 $21 $a1 $ff
    ld   [HL], A                                       ;; 00:2daa $77
    ld   A, $01                                        ;; 00:2dab $3e $01
    call call_00_2009                                  ;; 00:2dad $cd $09 $20
    ld   HL, wCD31                                     ;; 00:2db0 $21 $31 $cd
    pop  DE                                            ;; 00:2db3 $d1
    pop  BC                                            ;; 00:2db4 $c1
    ld   C, $01                                        ;; 00:2db5 $0e $01
    jp   jp_00_310f                                    ;; 00:2db7 $c3 $0f $31
    db   $f2                                           ;; 00:2dba .

data_00_2dbb:
    ld   A, [HL+]                                      ;; 00:2dbb $2a
    push HL                                            ;; 00:2dbc $e5
    ld   HL, wCE7C                                     ;; 00:2dbd $21 $7c $ce
    add  A, A                                          ;; 00:2dc0 $87
    add  A, A                                          ;; 00:2dc1 $87
    rst  add_hl_a                                      ;; 00:2dc2 $c7
    ld   A, $03                                        ;; 00:2dc3 $3e $03
    call call_00_2009                                  ;; 00:2dc5 $cd $09 $20
    ld   HL, wCD2B                                     ;; 00:2dc8 $21 $2b $cd
    ld   A, $ff                                        ;; 00:2dcb $3e $ff
    ld   C, $07                                        ;; 00:2dcd $0e $07
.jr_00_2dcf:
    cp   A, [HL]                                       ;; 00:2dcf $be
    jp   NZ, jp_00_310f                                ;; 00:2dd0 $c2 $0f $31
    inc  HL                                            ;; 00:2dd3 $23
    dec  C                                             ;; 00:2dd4 $0d
    jr   .jr_00_2dcf                                   ;; 00:2dd5 $18 $f8
    db   $2a, $e5, $21, $3c, $ce, $cb, $37, $c7        ;; 00:2dd7 ????????
    db   $e5, $af, $4f, $be, $28, $04, $23, $0c        ;; 00:2ddf ????????
    db   $18, $f9, $e1, $b1, $c4, $14, $31, $e1        ;; 00:2de7 ????????
    db   $c9                                           ;; 00:2def ?

data_00_2df0:
    ld   A, [HL+]                                      ;; 00:2df0 $2a
    or   A, A                                          ;; 00:2df1 $b7
    jr   NZ, .jr_00_2e04                               ;; 00:2df2 $20 $10
    push HL                                            ;; 00:2df4 $e5
    ld   HL, wC6E0                                     ;; 00:2df5 $21 $e0 $c6
    ld   A, $03                                        ;; 00:2df8 $3e $03
    call call_00_2009                                  ;; 00:2dfa $cd $09 $20
    ld   HL, wCD2C                                     ;; 00:2dfd $21 $2c $cd
    ld   C, $06                                        ;; 00:2e00 $0e $06
    jr   .jr_00_2e40                                   ;; 00:2e02 $18 $3c
.jr_00_2e04:
    cp   A, $05                                        ;; 00:2e04 $fe $05
    jr   NC, .jr_00_2e21                               ;; 00:2e06 $30 $19
    push HL                                            ;; 00:2e08 $e5
    ld   HL, wCE7C                                     ;; 00:2e09 $21 $7c $ce
    dec  A                                             ;; 00:2e0c $3d
    add  A, A                                          ;; 00:2e0d $87
    add  A, A                                          ;; 00:2e0e $87
    rst  add_hl_a                                      ;; 00:2e0f $c7
    ld   A, $03                                        ;; 00:2e10 $3e $03
    call call_00_2009                                  ;; 00:2e12 $cd $09 $20
    ld   HL, wCD34                                     ;; 00:2e15 $21 $34 $cd
    set  1, [HL]                                       ;; 00:2e18 $cb $ce
    ld   HL, wCD2C                                     ;; 00:2e1a $21 $2c $cd
    ld   C, $06                                        ;; 00:2e1d $0e $06
    jr   .jr_00_2e40                                   ;; 00:2e1f $18 $1f
.jr_00_2e21:
    cp   A, $16                                        ;; 00:2e21 $fe $16
    ret  NC                                            ;; 00:2e23 $d0
    push HL                                            ;; 00:2e24 $e5
    sub  A, $10                                        ;; 00:2e25 $d6 $10
    ld   HL, wCE2B                                     ;; 00:2e27 $21 $2b $ce
    rst  add_hl_a                                      ;; 00:2e2a $c7
    ld   A, [HL]                                       ;; 00:2e2b $7e
    cp   A, $ff                                        ;; 00:2e2c $fe $ff
    jr   Z, .jr_00_2e4b                                ;; 00:2e2e $28 $1b
    call call_00_2e54                                  ;; 00:2e30 $cd $54 $2e
    ld   HL, wCE7C                                     ;; 00:2e33 $21 $7c $ce
    ld   A, $02                                        ;; 00:2e36 $3e $02
    call call_00_2009                                  ;; 00:2e38 $cd $09 $20
    ld   HL, wCD2C                                     ;; 00:2e3b $21 $2c $cd
    ld   C, $06                                        ;; 00:2e3e $0e $06
.jr_00_2e40:
    call call_00_3114                                  ;; 00:2e40 $cd $14 $31
    ld   HL, $2e53                                     ;; 00:2e43 $21 $53 $2e
    ld   C, $01                                        ;; 00:2e46 $0e $01
    jp   jp_00_310f                                    ;; 00:2e48 $c3 $0f $31
.jr_00_2e4b:
    ld   HL, $3155                                     ;; 00:2e4b $21 $55 $31
    ld   C, $07                                        ;; 00:2e4e $0e $07
    jp   jp_00_310f                                    ;; 00:2e50 $c3 $0f $31
    db   $c0                                           ;; 00:2e53 .

call_00_2e54:
    push AF                                            ;; 00:2e54 $f5
    ld   A, $01                                        ;; 00:2e55 $3e $01
    rst  pushActiveBankSafe                            ;; 00:2e57 $e7
    ld   HL, wCE7C                                     ;; 00:2e58 $21 $7c $ce
    xor  A, A                                          ;; 00:2e5b $af
    ld   [HL+], A                                      ;; 00:2e5c $22
    ld   [HL+], A                                      ;; 00:2e5d $22
    ld   [HL+], A                                      ;; 00:2e5e $22
    pop  AF                                            ;; 00:2e5f $f1
    cp   A, $d2                                        ;; 00:2e60 $fe $d2
    jr   NC, .jr_00_2e74                               ;; 00:2e62 $30 $10
    ld   HL, $7e4f                                     ;; 00:2e64 $21 $4f $7e
    add  A, A                                          ;; 00:2e67 $87
    jr   NC, .jr_00_2e6b                               ;; 00:2e68 $30 $01
    inc  H                                             ;; 00:2e6a $24
.jr_00_2e6b:
    rst  add_hl_a                                      ;; 00:2e6b $c7
    ld   A, [HL+]                                      ;; 00:2e6c $2a
    ld   [wCE7C], A                                    ;; 00:2e6d $ea $7c $ce
    ld   A, [HL]                                       ;; 00:2e70 $7e
    ld   [wCE7D], A                                    ;; 00:2e71 $ea $7d $ce
.jr_00_2e74:
    rst  popActiveBankSafe                             ;; 00:2e74 $ef
    ret                                                ;; 00:2e75 $c9

data_00_2e76:
    push HL                                            ;; 00:2e76 $e5
    ld   A, [wCD3A]                                    ;; 00:2e77 $fa $3a $cd
    or   A, A                                          ;; 00:2e7a $b7
    jr   NZ, .jr_00_2e93                               ;; 00:2e7b $20 $16
    ld   A, [wCD27]                                    ;; 00:2e7d $fa $27 $cd
    push AF                                            ;; 00:2e80 $f5
    inc  A                                             ;; 00:2e81 $3c
    and  A, $03                                        ;; 00:2e82 $e6 $03
    ld   [wCD27], A                                    ;; 00:2e84 $ea $27 $cd
    pop  AF                                            ;; 00:2e87 $f1
.jr_00_2e88:
    dec  A                                             ;; 00:2e88 $3d
    jr   Z, .jr_00_2eac                                ;; 00:2e89 $28 $21
    dec  A                                             ;; 00:2e8b $3d
    jr   Z, .jr_00_2eb6                                ;; 00:2e8c $28 $28
    dec  A                                             ;; 00:2e8e $3d
    jr   Z, .jr_00_2ec1                                ;; 00:2e8f $28 $30
    jr   .jr_00_2ea2                                   ;; 00:2e91 $18 $0f
.jr_00_2e93:
    ld   A, [wCD27]                                    ;; 00:2e93 $fa $27 $cd
    push AF                                            ;; 00:2e96 $f5
    inc  A                                             ;; 00:2e97 $3c
    and  A, $07                                        ;; 00:2e98 $e6 $07
    ld   [wCD27], A                                    ;; 00:2e9a $ea $27 $cd
    pop  AF                                            ;; 00:2e9d $f1
    srl  A                                             ;; 00:2e9e $cb $3f
    jr   .jr_00_2e88                                   ;; 00:2ea0 $18 $e6
.jr_00_2ea2:
    call call_00_2cb3                                  ;; 00:2ea2 $cd $b3 $2c
    pop  HL                                            ;; 00:2ea5 $e1
    push HL                                            ;; 00:2ea6 $e5
    call call_00_2cdb                                  ;; 00:2ea7 $cd $db $2c
    jr   .jr_00_2ebe                                   ;; 00:2eaa $18 $12
.jr_00_2eac:
    call call_00_2cbd                                  ;; 00:2eac $cd $bd $2c
    pop  HL                                            ;; 00:2eaf $e1
    push HL                                            ;; 00:2eb0 $e5
    call call_00_2ce5                                  ;; 00:2eb1 $cd $e5 $2c
    jr   .jr_00_2ebe                                   ;; 00:2eb4 $18 $08
.jr_00_2eb6:
    call call_00_2cc7                                  ;; 00:2eb6 $cd $c7 $2c
    pop  HL                                            ;; 00:2eb9 $e1
    push HL                                            ;; 00:2eba $e5
    call call_00_2cef                                  ;; 00:2ebb $cd $ef $2c
.jr_00_2ebe:
    pop  HL                                            ;; 00:2ebe $e1
    dec  HL                                            ;; 00:2ebf $2b
    ret                                                ;; 00:2ec0 $c9
.jr_00_2ec1:
    call call_00_2cd1                                  ;; 00:2ec1 $cd $d1 $2c
    pop  HL                                            ;; 00:2ec4 $e1
    jp   jp_00_2cf9                                    ;; 00:2ec5 $c3 $f9 $2c

data_00_2ec8:
    ld   A, [HL+]                                      ;; 00:2ec8 $2a
    push HL                                            ;; 00:2ec9 $e5
    push BC                                            ;; 00:2eca $c5
    push DE                                            ;; 00:2ecb $d5
    cp   A, $ff                                        ;; 00:2ecc $fe $ff
    jr   Z, .jr_00_2ed2                                ;; 00:2ece $28 $02
    rst  rst_00_0018                                   ;; 00:2ed0 $df
    db   $0c                                           ;; 00:2ed1 .
.jr_00_2ed2:
    ld   A, [wCD20]                                    ;; 00:2ed2 $fa $20 $cd
    cp   A, $ff                                        ;; 00:2ed5 $fe $ff
    jr   Z, .jr_00_2ee2                                ;; 00:2ed7 $28 $09
    call call_00_2448                                  ;; 00:2ed9 $cd $48 $24
    ld   DE, $6d9b                                     ;; 00:2edc $11 $9b $6d
    add  HL, DE                                        ;; 00:2edf $19
    jr   .jr_00_2ee5                                   ;; 00:2ee0 $18 $03
.jr_00_2ee2:
    ld   HL, $3155                                     ;; 00:2ee2 $21 $55 $31
.jr_00_2ee5:
    pop  DE                                            ;; 00:2ee5 $d1
    pop  BC                                            ;; 00:2ee6 $c1
    ld   C, $06                                        ;; 00:2ee7 $0e $06
    ld   A, $0e                                        ;; 00:2ee9 $3e $0e
    jp   jp_00_3108                                    ;; 00:2eeb $c3 $08 $31

data_00_2eee:
    ld   A, [HL+]                                      ;; 00:2eee $2a
    jp   call_00_3ca0                                  ;; 00:2eef $c3 $a0 $3c

data_00_2ef2:
    ld   A, [HL+]                                      ;; 00:2ef2 $2a
    jp   call_00_3ca6                                  ;; 00:2ef3 $c3 $a6 $3c

call_00_2ef6:
    ld   A, $40                                        ;; 00:2ef6 $3e $40
    push AF                                            ;; 00:2ef8 $f5
    push BC                                            ;; 00:2ef9 $c5
    push DE                                            ;; 00:2efa $d5
    ld   E, A                                          ;; 00:2efb $5f
    ld   A, [HL+]                                      ;; 00:2efc $2a
    ld   [wCA28], A                                    ;; 00:2efd $ea $28 $ca
    ld   A, [HL+]                                      ;; 00:2f00 $2a
    cp   A, $40                                        ;; 00:2f01 $fe $40
    jr   NC, .jr_00_2f13                               ;; 00:2f03 $30 $0e
    ld   [wCA29], A                                    ;; 00:2f05 $ea $29 $ca
    push HL                                            ;; 00:2f08 $e5
    rst  rst_00_0018                                   ;; 00:2f09 $df
    db   $6c                                           ;; 00:2f0a .
    call call_00_1236                                  ;; 00:2f0b $cd $36 $12
.jr_00_2f0e:
    pop  HL                                            ;; 00:2f0e $e1
    pop  DE                                            ;; 00:2f0f $d1
    pop  BC                                            ;; 00:2f10 $c1
    pop  AF                                            ;; 00:2f11 $f1
    ret                                                ;; 00:2f12 $c9
.jr_00_2f13:
    push HL                                            ;; 00:2f13 $e5
    ld   H, A                                          ;; 00:2f14 $67
    ld   A, [wCA28]                                    ;; 00:2f15 $fa $28 $ca
    ld   L, A                                          ;; 00:2f18 $6f
    ld   A, E                                          ;; 00:2f19 $7b
    ld   DE, $101                                      ;; 00:2f1a $11 $01 $01
    ld   BC, $612                                      ;; 00:2f1d $01 $12 $06
    bit  7, H                                          ;; 00:2f20 $cb $7c
    jr   Z, .jr_00_2f30                                ;; 00:2f22 $28 $0c
    res  7, H                                          ;; 00:2f24 $cb $bc
    bit  6, H                                          ;; 00:2f26 $cb $74
    jr   NZ, .jr_00_2f34                               ;; 00:2f28 $20 $0a
    set  6, H                                          ;; 00:2f2a $cb $f4
    rst  rst_00_0018                                   ;; 00:2f2c $df
    db   $a0                                           ;; 00:2f2d .
    jr   .jr_00_2f0e                                   ;; 00:2f2e $18 $de
.jr_00_2f30:
    rst  rst_00_0018                                   ;; 00:2f30 $df
    db   $90                                           ;; 00:2f31 ?
    jr   .jr_00_2f0e                                   ;; 00:2f32 $18 $da
.jr_00_2f34:
    rst  rst_00_0018                                   ;; 00:2f34 $df
    db   $30                                           ;; 00:2f35 ?
    jr   .jr_00_2f0e                                   ;; 00:2f36 $18 $d6

data_00_2f38:
    ld   A, [HL+]                                      ;; 00:2f38 $2a

jr_00_2f39:
    call call_00_3cb2                                  ;; 00:2f39 $cd $b2 $3c
    jr   NC, .jr_00_2f44                               ;; 00:2f3c $30 $06
    call call_00_2ef6                                  ;; 00:2f3e $cd $f6 $2e
    inc  HL                                            ;; 00:2f41 $23
    inc  HL                                            ;; 00:2f42 $23
    ret                                                ;; 00:2f43 $c9
.jr_00_2f44:
    inc  HL                                            ;; 00:2f44 $23
    inc  HL                                            ;; 00:2f45 $23
    jp   call_00_2ef6                                  ;; 00:2f46 $c3 $f6 $2e

data_00_2f49:
    ld   A, [HL+]                                      ;; 00:2f49 $2a
    call call_00_3cb2                                  ;; 00:2f4a $cd $b2 $3c
    jr   NC, .jr_00_2f57                               ;; 00:2f4d $30 $08
    inc  HL                                            ;; 00:2f4f $23
    call call_00_2ef6                                  ;; 00:2f50 $cd $f6 $2e
    ld   A, $04                                        ;; 00:2f53 $3e $04
    rst  add_hl_a                                      ;; 00:2f55 $c7
    ret                                                ;; 00:2f56 $c9
.jr_00_2f57:
    ld   A, [HL+]                                      ;; 00:2f57 $2a
    inc  HL                                            ;; 00:2f58 $23
    inc  HL                                            ;; 00:2f59 $23
    jr   jr_00_2f39                                    ;; 00:2f5a $18 $dd
    db   $e5, $21, $98, $2f, $cd, $66, $27, $21        ;; 00:2f5c ????????
    db   $7b, $74, $11, $0b, $05, $01, $08, $02        ;; 00:2f64 ????????
    db   $3e, $24, $df, $90, $21, $9c, $c0, $3e        ;; 00:2f6c ????????
    db   $90, $22, $3e, $60, $22, $3e, $7e, $22        ;; 00:2f74 ????????
    db   $36, $00, $cd, $99, $2f, $f5, $af, $ea        ;; 00:2f7c ????????
    db   $9c, $c0, $cd, $8f, $32, $f1, $e1, $20        ;; 00:2f84 ????????
    db   $06, $cd, $f6, $2e, $23, $23, $c9, $23        ;; 00:2f8c ????????
    db   $23, $c3, $f6, $2e, $1e, $df, $05, $ab        ;; 00:2f94 ????????
    db   $2f, $b3, $2f, $83, $1e, $83, $1e, $b7        ;; 00:2f9c ????????
    db   $2f, $b7, $2f, $83, $1e, $83, $1e, $fa        ;; 00:2fa4 ????????
    db   $9d, $c0, $fe, $60, $c3, $79, $1e, $f6        ;; 00:2fac ????????
    db   $01, $18, $f9, $21, $9d, $c0, $7e, $ee        ;; 00:2fb4 ????????
    db   $e0, $77, $c9                                 ;; 00:2fbc ???

data_00_2fbf:
    push BC                                            ;; 00:2fbf $c5
    push DE                                            ;; 00:2fc0 $d5
    ld   A, [HL+]                                      ;; 00:2fc1 $2a
    ld   E, A                                          ;; 00:2fc2 $5f
    ld   A, [HL+]                                      ;; 00:2fc3 $2a
    ld   D, A                                          ;; 00:2fc4 $57
    call call_00_20de                                  ;; 00:2fc5 $cd $de $20
    push HL                                            ;; 00:2fc8 $e5
    or   A, A                                          ;; 00:2fc9 $b7
    jr   NZ, .jr_00_2fd4                               ;; 00:2fca $20 $08
    ld   A, [wCD35]                                    ;; 00:2fcc $fa $35 $cd
    or   A, A                                          ;; 00:2fcf $b7
    jr   Z, .jr_00_2fd4                                ;; 00:2fd0 $28 $02
    xor  A, A                                          ;; 00:2fd2 $af
    ld   D, A                                          ;; 00:2fd3 $57
.jr_00_2fd4:
    cp   A, $05                                        ;; 00:2fd4 $fe $05
    jr   C, .jr_00_2fda                                ;; 00:2fd6 $38 $02
    sub  A, $04                                        ;; 00:2fd8 $d6 $04
.jr_00_2fda:
    swap A                                             ;; 00:2fda $cb $37
    ld   L, A                                          ;; 00:2fdc $6f
    ld   H, $c0                                        ;; 00:2fdd $26 $c0
    ld   A, [wCD1C]                                    ;; 00:2fdf $fa $1c $cd
    or   A, A                                          ;; 00:2fe2 $b7
    jr   NZ, .jr_00_3054                               ;; 00:2fe3 $20 $6f
    ld   A, [wCDEB]                                    ;; 00:2fe5 $fa $eb $cd
    and  A, $f0                                        ;; 00:2fe8 $e6 $f0
    call NZ, call_00_3058                              ;; 00:2fea $c4 $58 $30
    ld   A, [HL+]                                      ;; 00:2fed $2a
    ld   B, A                                          ;; 00:2fee $47
    ld   A, [HL-]                                      ;; 00:2fef $3a
    and  A, $fe                                        ;; 00:2ff0 $e6 $fe
    cp   A, E                                          ;; 00:2ff2 $bb
    jr   NZ, .jr_00_2ffb                               ;; 00:2ff3 $20 $06
    ld   A, B                                          ;; 00:2ff5 $78
    and  A, $fd                                        ;; 00:2ff6 $e6 $fd
    cp   A, D                                          ;; 00:2ff8 $ba
    jr   Z, .jr_00_3054                                ;; 00:2ff9 $28 $59
.jr_00_2ffb:
    ld   A, L                                          ;; 00:2ffb $7d
    cp   A, $50                                        ;; 00:2ffc $fe $50
    jr   C, .jr_00_3038                                ;; 00:2ffe $38 $38
    ld   A, [wCD3C]                                    ;; 00:3000 $fa $3c $cd
    dec  A                                             ;; 00:3003 $3d
    jr   Z, .jr_00_3038                                ;; 00:3004 $28 $32
    ld   A, L                                          ;; 00:3006 $7d
    swap A                                             ;; 00:3007 $cb $37
    add  A, A                                          ;; 00:3009 $87
    add  A, A                                          ;; 00:300a $87
    ld   C, A                                          ;; 00:300b $4f
    ld   B, $00                                        ;; 00:300c $06 $00
    ld   [HL], D                                       ;; 00:300e $72
    inc  L                                             ;; 00:300f $2c
    ld   [HL], E                                       ;; 00:3010 $73
    inc  L                                             ;; 00:3011 $2c
    ld   [HL+], A                                      ;; 00:3012 $22
    ld   [HL], B                                       ;; 00:3013 $70
    inc  L                                             ;; 00:3014 $2c
    inc  C                                             ;; 00:3015 $0c
    ld   A, D                                          ;; 00:3016 $7a
    add  A, $08                                        ;; 00:3017 $c6 $08
    ld   [HL+], A                                      ;; 00:3019 $22
    ld   [HL], E                                       ;; 00:301a $73
    inc  L                                             ;; 00:301b $2c
    ld   [HL], C                                       ;; 00:301c $71
    inc  L                                             ;; 00:301d $2c
    ld   [HL], B                                       ;; 00:301e $70
    inc  L                                             ;; 00:301f $2c
    inc  C                                             ;; 00:3020 $0c
    ld   [HL], D                                       ;; 00:3021 $72
    inc  L                                             ;; 00:3022 $2c
    ld   A, E                                          ;; 00:3023 $7b
    add  A, $08                                        ;; 00:3024 $c6 $08
    ld   E, A                                          ;; 00:3026 $5f
    ld   [HL+], A                                      ;; 00:3027 $22
    ld   [HL], C                                       ;; 00:3028 $71
    inc  L                                             ;; 00:3029 $2c
    ld   [HL], B                                       ;; 00:302a $70
    inc  L                                             ;; 00:302b $2c
    inc  C                                             ;; 00:302c $0c
    ld   A, D                                          ;; 00:302d $7a
    add  A, $08                                        ;; 00:302e $c6 $08
    ld   [HL+], A                                      ;; 00:3030 $22
    ld   [HL], E                                       ;; 00:3031 $73
    inc  L                                             ;; 00:3032 $2c
    ld   [HL], C                                       ;; 00:3033 $71
    inc  L                                             ;; 00:3034 $2c
    ld   [HL], B                                       ;; 00:3035 $70
    jr   .jr_00_3054                                   ;; 00:3036 $18 $1c
.jr_00_3038:
    ld   BC, $03                                       ;; 00:3038 $01 $03 $00
    ld   [HL], D                                       ;; 00:303b $72
    inc  L                                             ;; 00:303c $2c
    ld   [HL], E                                       ;; 00:303d $73
    add  HL, BC                                        ;; 00:303e $09
    ld   A, D                                          ;; 00:303f $7a
    add  A, $08                                        ;; 00:3040 $c6 $08
    ld   [HL+], A                                      ;; 00:3042 $22
    ld   [HL], E                                       ;; 00:3043 $73
    add  HL, BC                                        ;; 00:3044 $09
    ld   [HL], D                                       ;; 00:3045 $72
    inc  L                                             ;; 00:3046 $2c
    ld   A, E                                          ;; 00:3047 $7b
    add  A, $08                                        ;; 00:3048 $c6 $08
    ld   [HL], A                                       ;; 00:304a $77
    add  HL, BC                                        ;; 00:304b $09
    ld   A, D                                          ;; 00:304c $7a
    add  A, $08                                        ;; 00:304d $c6 $08
    ld   [HL+], A                                      ;; 00:304f $22
    ld   A, E                                          ;; 00:3050 $7b
    add  A, $08                                        ;; 00:3051 $c6 $08
    ld   [HL], A                                       ;; 00:3053 $77
.jr_00_3054:
    pop  HL                                            ;; 00:3054 $e1
    pop  DE                                            ;; 00:3055 $d1
    pop  BC                                            ;; 00:3056 $c1
    ret                                                ;; 00:3057 $c9

call_00_3058:
    cp   A, $30                                        ;; 00:3058 $fe $30
    ret  Z                                             ;; 00:305a $c8
    cp   A, $10                                        ;; 00:305b $fe $10
    ld   A, E                                          ;; 00:305d $7b
    jr   NZ, .jr_00_3066                               ;; 00:305e $20 $06
    cp   A, $58                                        ;; 00:3060 $fe $58
    ret  C                                             ;; 00:3062 $d8
    ld   E, $f7                                        ;; 00:3063 $1e $f7
    ret                                                ;; 00:3065 $c9
.jr_00_3066:
    cp   A, $58                                        ;; 00:3066 $fe $58
    ret  NC                                            ;; 00:3068 $d0
    ld   E, $f7                                        ;; 00:3069 $1e $f7
    ret                                                ;; 00:306b $c9
    db   $e5, $cd, $c5, $27, $fa, $c0, $cd, $cd        ;; 00:306c ????????
    db   $e7, $1e, $4f, $87, $87, $6f, $87, $85        ;; 00:3074 ????????
    db   $91, $21, $b3, $72, $c7, $0e, $0b, $c3        ;; 00:307c ????????
    db   $0f, $31                                      ;; 00:3084 ??

data_00_3086:
    dec  HL                                            ;; 00:3086 $2b
    ld   A, [HL+]                                      ;; 00:3087 $2a
    ld   C, [HL]                                       ;; 00:3088 $4e
    rst  rst_00_0018                                   ;; 00:3089 $df
    db   $be                                           ;; 00:308a .
    ret                                                ;; 00:308b $c9

data_00_308c:
    push BC                                            ;; 00:308c $c5
    push DE                                            ;; 00:308d $d5
    dec  HL                                            ;; 00:308e $2b
    ld   A, [HL+]                                      ;; 00:308f $2a
    push HL                                            ;; 00:3090 $e5
    call call_00_30b8                                  ;; 00:3091 $cd $b8 $30
    ld   HL, $71c5                                     ;; 00:3094 $21 $c5 $71
    ld   A, $03                                        ;; 00:3097 $3e $03
    rst  pushActiveBankSafe                            ;; 00:3099 $e7
    ld   A, B                                          ;; 00:309a $78
    or   A, A                                          ;; 00:309b $b7
    jr   Z, .jr_00_30a3                                ;; 00:309c $28 $05
.jr_00_309e:
    ld   A, [HL+]                                      ;; 00:309e $2a
    rst  add_hl_a                                      ;; 00:309f $c7
    dec  B                                             ;; 00:30a0 $05
    jr   NZ, .jr_00_309e                               ;; 00:30a1 $20 $fb
.jr_00_30a3:
    ld   A, [HL+]                                      ;; 00:30a3 $2a
    ld   B, A                                          ;; 00:30a4 $47
    ld   DE, wCD4D                                     ;; 00:30a5 $11 $4d $cd
    rst  rst_00_0018                                   ;; 00:30a8 $df
    db   $03                                           ;; 00:30a9 .
    rst  popActiveBankSafe                             ;; 00:30aa $ef
    xor  A, A                                          ;; 00:30ab $af
    ld   [DE], A                                       ;; 00:30ac $12
    ld   HL, wCD4D                                     ;; 00:30ad $21 $4d $cd
    ld   A, $40                                        ;; 00:30b0 $3e $40
    rst  rst_00_0018                                   ;; 00:30b2 $df
    db   $00                                           ;; 00:30b3 .
    pop  HL                                            ;; 00:30b4 $e1
    pop  DE                                            ;; 00:30b5 $d1
    pop  BC                                            ;; 00:30b6 $c1
    ret                                                ;; 00:30b7 $c9

call_00_30b8:
    cp   A, $4e                                        ;; 00:30b8 $fe $4e
    jr   NC, .jr_00_30cc                               ;; 00:30ba $30 $10
    ld   HL, $30d1                                     ;; 00:30bc $21 $d1 $30
    ld   B, $3a                                        ;; 00:30bf $06 $3a
    ld   C, A                                          ;; 00:30c1 $4f
.jr_00_30c2:
    ld   A, [HL]                                       ;; 00:30c2 $7e
    cp   A, C                                          ;; 00:30c3 $b9
    ret  Z                                             ;; 00:30c4 $c8
    inc  B                                             ;; 00:30c5 $04
    inc  HL                                            ;; 00:30c6 $23
    or   A, A                                          ;; 00:30c7 $b7
    jr   NZ, .jr_00_30c2                               ;; 00:30c8 $20 $f8
    or   A, B                                          ;; 00:30ca $b0
    ret                                                ;; 00:30cb $c9
.jr_00_30cc:
    sub  A, $4e                                        ;; 00:30cc $d6 $4e
    ld   B, A                                          ;; 00:30ce $47
    xor  A, A                                          ;; 00:30cf $af
    ret                                                ;; 00:30d0 $c9
    db   $01, $02, $03, $04, $16, $17, $18, $19        ;; 00:30d1 ........
    db   $1a, $1b, $40, $41, $42, $44, $45, $46        ;; 00:30d9 ........
    db   $47, $48, $49, $4a, $0e, $0f, $00             ;; 00:30e1 ......?

jp_00_30e8:
    push HL                                            ;; 00:30e8 $e5
    push DE                                            ;; 00:30e9 $d5
    call call_00_1fcd                                  ;; 00:30ea $cd $cd $1f
    ld   E, C                                          ;; 00:30ed $59
    ld   D, $c5                                        ;; 00:30ee $16 $c5
    add  HL, DE                                        ;; 00:30f0 $19
    ld   A, $01                                        ;; 00:30f1 $3e $01
    call call_00_2009                                  ;; 00:30f3 $cd $09 $20
    pop  DE                                            ;; 00:30f6 $d1
    ld   HL, wCD2F                                     ;; 00:30f7 $21 $2f $cd
    ld   C, $02                                        ;; 00:30fa $0e $02
    ld   A, [HL+]                                      ;; 00:30fc $2a
    cp   A, $ff                                        ;; 00:30fd $fe $ff
    jr   Z, jp_00_310f                                 ;; 00:30ff $28 $0e
    ld   HL, $3106                                     ;; 00:3101 $21 $06 $31
    jr   jp_00_310f                                    ;; 00:3104 $18 $09
    db   $b9, $b9                                      ;; 00:3106 ??

jp_00_3108:
    rst  pushActiveBankSafe                            ;; 00:3108 $e7
    call call_00_3114                                  ;; 00:3109 $cd $14 $31
    rst  popActiveBankSafe                             ;; 00:310c $ef
    pop  HL                                            ;; 00:310d $e1
    ret                                                ;; 00:310e $c9

jp_00_310f:
    call call_00_3114                                  ;; 00:310f $cd $14 $31
    pop  HL                                            ;; 00:3112 $e1
    ret                                                ;; 00:3113 $c9

call_00_3114:
    inc  C                                             ;; 00:3114 $0c
    dec  C                                             ;; 00:3115 $0d
    ret  Z                                             ;; 00:3116 $c8
    ld   A, [wCD3A]                                    ;; 00:3117 $fa $3a $cd
    or   A, A                                          ;; 00:311a $b7
    jr   Z, .jr_00_3127                                ;; 00:311b $28 $0a
    push BC                                            ;; 00:311d $c5
    ld   B, C                                          ;; 00:311e $41
    call call_00_3168                                  ;; 00:311f $cd $68 $31
    pop  BC                                            ;; 00:3122 $c1
    ld   A, B                                          ;; 00:3123 $78
    sub  A, C                                          ;; 00:3124 $91
    ld   B, A                                          ;; 00:3125 $47
    ret                                                ;; 00:3126 $c9
.jr_00_3127:
    ld   B, C                                          ;; 00:3127 $41
    ld   E, L                                          ;; 00:3128 $5d
    ld   D, H                                          ;; 00:3129 $54
    ld   A, [wCD34]                                    ;; 00:312a $fa $34 $cd
    bit  1, A                                          ;; 00:312d $cb $4f
    jp   Z, call_00_3304                               ;; 00:312f $ca $04 $33
    sub  A, $02                                        ;; 00:3132 $d6 $02
    ld   [wCD34], A                                    ;; 00:3134 $ea $34 $cd
    ld   A, [HL]                                       ;; 00:3137 $7e
    cp   A, $ff                                        ;; 00:3138 $fe $ff
    jr   Z, .jr_00_314a                                ;; 00:313a $28 $0e
    ld   A, B                                          ;; 00:313c $78
    dec  A                                             ;; 00:313d $3d
    rst  add_hl_a                                      ;; 00:313e $c7
    ld   A, $ff                                        ;; 00:313f $3e $ff
.jr_00_3141:
    cp   A, [HL]                                       ;; 00:3141 $be
    jp   NZ, call_00_3304                              ;; 00:3142 $c2 $04 $33
    dec  HL                                            ;; 00:3145 $2b
    dec  B                                             ;; 00:3146 $05
    jr   NZ, .jr_00_3141                               ;; 00:3147 $20 $f8
    ret                                                ;; 00:3149 $c9
.jr_00_314a:
    ld   A, [DE]                                       ;; 00:314a $1a
    cp   A, $ff                                        ;; 00:314b $fe $ff
    jp   NZ, call_00_3304                              ;; 00:314d $c2 $04 $33
    inc  DE                                            ;; 00:3150 $13
    dec  B                                             ;; 00:3151 $05
    jr   NZ, .jr_00_314a                               ;; 00:3152 $20 $f6
    ret                                                ;; 00:3154 $c9
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 00:3155 ........
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 00:315d .???....
    db   $ff, $ff, $00                                 ;; 00:3165 ...

call_00_3168:
    ld   A, [wCD12]                                    ;; 00:3168 $fa $12 $cd
    bit  0, A                                          ;; 00:316b $cb $47
    jp   NZ, call_00_1f97                              ;; 00:316d $c2 $97 $1f
    ld   A, B                                          ;; 00:3170 $78
    jp   call_00_2466                                  ;; 00:3171 $c3 $66 $24
.data_00_3174:
    ret                                                ;; 00:3174 $c9
    dw   data_00_26c6                                  ;; 00:3175 pP
    dw   data_00_308c                                  ;; 00:3177 pP
    dw   data_00_308c                                  ;; 00:3179 pP
    db   $8c, $30                                      ;; 00:317b ??
    dw   data_00_308c                                  ;; 00:317d pP
    dw   data_00_26cb                                  ;; 00:317f pP
    dw   data_00_26cc                                  ;; 00:3181 pP
    dw   call_00_2745                                  ;; 00:3183 pP
    dw   data_00_274d                                  ;; 00:3185 pP
    dw   data_00_2753                                  ;; 00:3187 pP
    dw   data_00_3086                                  ;; 00:3189 pP
    dw   call_00_275c                                  ;; 00:318b pP
    dw   call_00_2766                                  ;; 00:318d pP
    dw   data_00_3086                                  ;; 00:318f pP
    dw   data_00_308c                                  ;; 00:3191 pP
    dw   data_00_308c                                  ;; 00:3193 pP
    db   $74, $31                                      ;; 00:3195 ??
    dw   data_00_2779                                  ;; 00:3197 pP
    dw   data_00_3086                                  ;; 00:3199 pP
    dw   data_00_3086                                  ;; 00:319b pP
    dw   jp_00_27ab                                    ;; 00:319d pP
    db   $bf, $27                                      ;; 00:319f ??
    dw   data_00_308c                                  ;; 00:31a1 pP
    dw   data_00_308c                                  ;; 00:31a3 pP
    dw   data_00_308c                                  ;; 00:31a5 pP
    dw   data_00_308c                                  ;; 00:31a7 pP
    dw   data_00_308c                                  ;; 00:31a9 pP
    dw   data_00_308c                                  ;; 00:31ab pP
    dw   call_00_27c5                                  ;; 00:31ad pP
    dw   data_00_27cd                                  ;; 00:31af pP
    dw   data_00_280f                                  ;; 00:31b1 pP
    dw   data_00_2955                                  ;; 00:31b3 pP
    dw   data_00_29e1                                  ;; 00:31b5 pP
    dw   data_00_2a52                                  ;; 00:31b7 pP
    dw   data_00_2a65                                  ;; 00:31b9 pP
    dw   data_00_2a7b                                  ;; 00:31bb pP
    dw   data_00_2b08                                  ;; 00:31bd pP
    dw   call_00_2b3b                                  ;; 00:31bf pP
    dw   data_00_2adc                                  ;; 00:31c1 pP
    db   $02, $2b                                      ;; 00:31c3 ??
    dw   data_00_2bc1                                  ;; 00:31c5 pP
    dw   data_00_2c25                                  ;; 00:31c7 pP
    dw   data_00_2c9c                                  ;; 00:31c9 pP
    dw   call_00_2cb3                                  ;; 00:31cb pP
    dw   call_00_2cbd                                  ;; 00:31cd pP
    dw   call_00_2cc7                                  ;; 00:31cf pP
    dw   call_00_2cd1                                  ;; 00:31d1 pP
    dw   data_00_2d11                                  ;; 00:31d3 pP
    dw   data_00_2dbb                                  ;; 00:31d5 pP
    db   $d7, $2d                                      ;; 00:31d7 ??
    dw   data_00_3086                                  ;; 00:31d9 pP
    dw   data_00_2df0                                  ;; 00:31db pP
    dw   data_00_2e76                                  ;; 00:31dd pP
    dw   data_00_2ec8                                  ;; 00:31df pP
    dw   data_00_2eee                                  ;; 00:31e1 pP
    dw   data_00_2ef2                                  ;; 00:31e3 pP
    dw   data_00_3086                                  ;; 00:31e5 pP
    dw   data_00_2f38                                  ;; 00:31e7 pP
    dw   data_00_2f49                                  ;; 00:31e9 pP
    dw   data_00_3086                                  ;; 00:31eb pP
    db   $5c, $2f                                      ;; 00:31ed ??
    dw   data_00_3086                                  ;; 00:31ef pP
    dw   call_00_2ef6                                  ;; 00:31f1 pP
    dw   data_00_3086                                  ;; 00:31f3 pP
    dw   data_00_308c                                  ;; 00:31f5 pP
    dw   data_00_308c                                  ;; 00:31f7 pP
    dw   data_00_308c                                  ;; 00:31f9 pP
    dw   data_00_2fbf                                  ;; 00:31fb pP
    dw   data_00_308c                                  ;; 00:31fd pP
    dw   data_00_308c                                  ;; 00:31ff pP
    dw   data_00_308c                                  ;; 00:3201 pP
    dw   data_00_308c                                  ;; 00:3203 pP
    dw   data_00_308c                                  ;; 00:3205 pP
    dw   data_00_308c                                  ;; 00:3207 pP
    db   $8c, $30, $8c, $30                            ;; 00:3209 ????
    dw   .data_00_3174                                 ;; 00:320d pP
    db   $6c, $30                                      ;; 00:320f ??

call_00_3211:
    call call_00_3232                                  ;; 00:3211 $cd $32 $32
.jr_00_3214:
    ld   A, [HL+]                                      ;; 00:3214 $2a
    or   A, A                                          ;; 00:3215 $b7
    jr   Z, .jr_00_322a                                ;; 00:3216 $28 $12
    cp   A, $10                                        ;; 00:3218 $fe $10
    jr   Z, .jr_00_322d                                ;; 00:321a $28 $11
    cp   A, $88                                        ;; 00:321c $fe $88
    call C, call_00_32cb                               ;; 00:321e $dc $cb $32
    call NC, call_00_32ea                              ;; 00:3221 $d4 $ea $32
    ld   A, [wCD08]                                    ;; 00:3224 $fa $08 $cd
    or   A, A                                          ;; 00:3227 $b7
    jr   Z, .jr_00_3214                                ;; 00:3228 $28 $ea
.jr_00_322a:
    jp   jp_00_32b0                                    ;; 00:322a $c3 $b0 $32
.jr_00_322d:
    call call_00_275c                                  ;; 00:322d $cd $5c $27
    jr   .jr_00_322a                                   ;; 00:3230 $18 $f8

call_00_3232:
    bit  3, A                                          ;; 00:3232 $cb $5f
    jr   Z, .jr_00_323c                                ;; 00:3234 $28 $06
    push AF                                            ;; 00:3236 $f5
    ld   A, $50                                        ;; 00:3237 $3e $50
    ldh  [rWY], A                                      ;; 00:3239 $e0 $4a
    pop  AF                                            ;; 00:323b $f1
.jr_00_323c:
    call call_00_1d98                                  ;; 00:323c $cd $98 $1d
    call call_00_3680                                  ;; 00:323f $cd $80 $36
    bit  6, A                                          ;; 00:3242 $cb $77
    jr   Z, .jr_00_324f                                ;; 00:3244 $28 $09
    ld   A, [wCD34]                                    ;; 00:3246 $fa $34 $cd
    or   A, $40                                        ;; 00:3249 $f6 $40
    ld   [wCD34], A                                    ;; 00:324b $ea $34 $cd
    ret                                                ;; 00:324e $c9
.jr_00_324f:
    ld   [wCD34], A                                    ;; 00:324f $ea $34 $cd
    ld   A, E                                          ;; 00:3252 $7b
    ld   [wCD02], A                                    ;; 00:3253 $ea $02 $cd
    ld   A, D                                          ;; 00:3256 $7a
    ld   [wCD03], A                                    ;; 00:3257 $ea $03 $cd
    ld   A, C                                          ;; 00:325a $79
    ld   [wCD00], A                                    ;; 00:325b $ea $00 $cd
    ld   A, B                                          ;; 00:325e $78
    ld   [wCD01], A                                    ;; 00:325f $ea $01 $cd
    ld   [wCD0A], A                                    ;; 00:3262 $ea $0a $cd
    call call_00_328f                                  ;; 00:3265 $cd $8f $32
    ld   A, [wCD34]                                    ;; 00:3268 $fa $34 $cd
    and  A, $28                                        ;; 00:326b $e6 $28
    jr   Z, .jr_00_3271                                ;; 00:326d $28 $02
    rst  rst_00_0018                                   ;; 00:326f $df
    db   $af                                           ;; 00:3270 .
.jr_00_3271:
    ld   A, [wCD01]                                    ;; 00:3271 $fa $01 $cd
    and  A, $fe                                        ;; 00:3274 $e6 $fe
    ld   [wCD01], A                                    ;; 00:3276 $ea $01 $cd
    ld   A, [wCD34]                                    ;; 00:3279 $fa $34 $cd
    and  A, $01                                        ;; 00:327c $e6 $01
    ret  Z                                             ;; 00:327e $c8
    ld   A, [wCD02]                                    ;; 00:327f $fa $02 $cd
    dec  A                                             ;; 00:3282 $3d
    ld   [wCD07], A                                    ;; 00:3283 $ea $07 $cd
    ld   A, $01                                        ;; 00:3286 $3e $01
    ld   [wCD02], A                                    ;; 00:3288 $ea $02 $cd
    ld   [wCD03], A                                    ;; 00:328b $ea $03 $cd
    ret                                                ;; 00:328e $c9

call_00_328f:
    call call_00_33f7                                  ;; 00:328f $cd $f7 $33
    xor  A, A                                          ;; 00:3292 $af
    ld   [wCD06], A                                    ;; 00:3293 $ea $06 $cd
    ld   [wCD08], A                                    ;; 00:3296 $ea $08 $cd
    ld   [wCD09], A                                    ;; 00:3299 $ea $09 $cd
    ld   [wCD07], A                                    ;; 00:329c $ea $07 $cd
    push HL                                            ;; 00:329f $e5
    ld   A, $ff                                        ;; 00:32a0 $3e $ff
    ld   HL, wC880                                     ;; 00:32a2 $21 $80 $c8
    call call_00_1f45                                  ;; 00:32a5 $cd $45 $1f
    ld   HL, wC894                                     ;; 00:32a8 $21 $94 $c8
    call call_00_1f45                                  ;; 00:32ab $cd $45 $1f
    pop  HL                                            ;; 00:32ae $e1
    ret                                                ;; 00:32af $c9

jp_00_32b0:
    ld   A, [wCD34]                                    ;; 00:32b0 $fa $34 $cd
    bit  6, A                                          ;; 00:32b3 $cb $77
    jr   NZ, .jr_00_32c5                               ;; 00:32b5 $20 $0e
    call call_00_331b                                  ;; 00:32b7 $cd $1b $33
    call call_00_3411                                  ;; 00:32ba $cd $11 $34
    ld   A, [wCD04]                                    ;; 00:32bd $fa $04 $cd
    ld   E, A                                          ;; 00:32c0 $5f
    ld   A, [wCD05]                                    ;; 00:32c1 $fa $05 $cd
    ld   D, A                                          ;; 00:32c4 $57
.jr_00_32c5:
    call call_00_36b1                                  ;; 00:32c5 $cd $b1 $36
    jp   call_00_1df3                                  ;; 00:32c8 $c3 $f3 $1d

call_00_32cb:
    push AF                                            ;; 00:32cb $f5
    ld   C, L                                          ;; 00:32cc $4d
    ld   B, H                                          ;; 00:32cd $44
    ld   HL, $32e8                                     ;; 00:32ce $21 $e8 $32
    push HL                                            ;; 00:32d1 $e5
    ld   HL, data_00_308c                              ;; 00:32d2 $21 $8c $30
    cp   A, $4e                                        ;; 00:32d5 $fe $4e
    jr   NC, .jr_00_32e4                               ;; 00:32d7 $30 $0b
    ld   L, A                                          ;; 00:32d9 $6f
    ld   H, $00                                        ;; 00:32da $26 $00
    add  HL, HL                                        ;; 00:32dc $29
    ld   DE, $3175                                     ;; 00:32dd $11 $75 $31
    add  HL, DE                                        ;; 00:32e0 $19
    ld   A, [HL+]                                      ;; 00:32e1 $2a
    ld   H, [HL]                                       ;; 00:32e2 $66
    ld   L, A                                          ;; 00:32e3 $6f
.jr_00_32e4:
    push HL                                            ;; 00:32e4 $e5
    ld   L, C                                          ;; 00:32e5 $69
    ld   H, B                                          ;; 00:32e6 $60
    ret                                                ;; 00:32e7 $c9
    pop  AF                                            ;; 00:32e8 $f1
    ret                                                ;; 00:32e9 $c9

call_00_32ea:
    dec  HL                                            ;; 00:32ea $2b
    ld   E, L                                          ;; 00:32eb $5d
    ld   D, H                                          ;; 00:32ec $54
    ld   B, $ff                                        ;; 00:32ed $06 $ff
.jr_00_32ef:
    ld   A, [HL+]                                      ;; 00:32ef $2a
    or   A, A                                          ;; 00:32f0 $b7
    jr   Z, .jr_00_32fa                                ;; 00:32f1 $28 $07
    cp   A, $88                                        ;; 00:32f3 $fe $88
    jr   C, .jr_00_32fa                                ;; 00:32f5 $38 $03
    dec  B                                             ;; 00:32f7 $05
    jr   NZ, .jr_00_32ef                               ;; 00:32f8 $20 $f5
.jr_00_32fa:
    dec  HL                                            ;; 00:32fa $2b
    ld   A, L                                          ;; 00:32fb $7d
    sub  A, E                                          ;; 00:32fc $93
    ld   B, A                                          ;; 00:32fd $47
    push HL                                            ;; 00:32fe $e5
    call call_00_3304                                  ;; 00:32ff $cd $04 $33
    pop  HL                                            ;; 00:3302 $e1
    ret                                                ;; 00:3303 $c9

call_00_3304:
    ld   A, [wCD06]                                    ;; 00:3304 $fa $06 $cd
    ld   HL, wC894                                     ;; 00:3307 $21 $94 $c8
    rst  add_hl_a                                      ;; 00:330a $c7
    add  A, B                                          ;; 00:330b $80
    ld   [wCD06], A                                    ;; 00:330c $ea $06 $cd
.jr_00_330f:
    ld   A, [DE]                                       ;; 00:330f $1a
    inc  DE                                            ;; 00:3310 $13
    ld   [HL+], A                                      ;; 00:3311 $22
    dec  B                                             ;; 00:3312 $05
    jr   NZ, .jr_00_330f                               ;; 00:3313 $20 $fa
    ld   A, [wCD34]                                    ;; 00:3315 $fa $34 $cd
    and  A, $04                                        ;; 00:3318 $e6 $04
    ret  NZ                                            ;; 00:331a $c0

call_00_331b:
    push AF                                            ;; 00:331b $f5
    push BC                                            ;; 00:331c $c5
    push DE                                            ;; 00:331d $d5
    push HL                                            ;; 00:331e $e5
    ld   A, [wCD34]                                    ;; 00:331f $fa $34 $cd
    and  A, $80                                        ;; 00:3322 $e6 $80
    jr   Z, .jr_00_3329                                ;; 00:3324 $28 $03
    ld   [wCD08], A                                    ;; 00:3326 $ea $08 $cd
.jr_00_3329:
    ld   A, [wCD06]                                    ;; 00:3329 $fa $06 $cd
    or   A, A                                          ;; 00:332c $b7
    jr   Z, .jr_00_3344                                ;; 00:332d $28 $15
    ld   HL, wCD04                                     ;; 00:332f $21 $04 $cd
    ld   A, [HL+]                                      ;; 00:3332 $2a
    ld   H, [HL]                                       ;; 00:3333 $66
    ld   L, A                                          ;; 00:3334 $6f
    ld   A, [wCD34]                                    ;; 00:3335 $fa $34 $cd
    and  A, $04                                        ;; 00:3338 $e6 $04
    call Z, call_00_338e                               ;; 00:333a $cc $8e $33
    call NZ, call_00_3357                              ;; 00:333d $c4 $57 $33
    xor  A, A                                          ;; 00:3340 $af
    ld   [wCD06], A                                    ;; 00:3341 $ea $06 $cd
.jr_00_3344:
    ld   A, $ff                                        ;; 00:3344 $3e $ff
    ld   HL, wC880                                     ;; 00:3346 $21 $80 $c8
    call call_00_1f45                                  ;; 00:3349 $cd $45 $1f
    ld   HL, wC894                                     ;; 00:334c $21 $94 $c8
    call call_00_1f45                                  ;; 00:334f $cd $45 $1f
    pop  HL                                            ;; 00:3352 $e1
    pop  DE                                            ;; 00:3353 $d1
    pop  BC                                            ;; 00:3354 $c1
    pop  AF                                            ;; 00:3355 $f1
    ret                                                ;; 00:3356 $c9

call_00_3357:
    ld   A, [wCD06]                                    ;; 00:3357 $fa $06 $cd
    ld   C, A                                          ;; 00:335a $4f
    ld   B, $00                                        ;; 00:335b $06 $00
    ld   E, L                                          ;; 00:335d $5d
    ld   D, H                                          ;; 00:335e $54
    ld   HL, wC880                                     ;; 00:335f $21 $80 $c8
    push DE                                            ;; 00:3362 $d5
    push BC                                            ;; 00:3363 $c5
    rst  rst_00_0018                                   ;; 00:3364 $df
    db   $01                                           ;; 00:3365 .
    pop  BC                                            ;; 00:3366 $c1
    pop  DE                                            ;; 00:3367 $d1
    ld   HL, $20                                       ;; 00:3368 $21 $20 $00
    add  HL, DE                                        ;; 00:336b $19
    ld   E, L                                          ;; 00:336c $5d
    ld   D, H                                          ;; 00:336d $54
    ld   HL, wC894                                     ;; 00:336e $21 $94 $c8
    rst  rst_00_0018                                   ;; 00:3371 $df
    db   $01                                           ;; 00:3372 .
    push DE                                            ;; 00:3373 $d5
    xor  A, A                                          ;; 00:3374 $af
    ld   [wCD07], A                                    ;; 00:3375 $ea $07 $cd
    ld   A, [wCD02]                                    ;; 00:3378 $fa $02 $cd
    ld   E, A                                          ;; 00:337b $5f
    ld   HL, wCD04                                     ;; 00:337c $21 $04 $cd
    ld   A, [HL]                                       ;; 00:337f $7e
    and  A, $e0                                        ;; 00:3380 $e6 $e0
    or   A, E                                          ;; 00:3382 $b3
    add  A, $40                                        ;; 00:3383 $c6 $40
    ld   [HL], A                                       ;; 00:3385 $77
    inc  HL                                            ;; 00:3386 $23
    jr   NC, .jr_00_338a                               ;; 00:3387 $30 $01
    inc  [HL]                                          ;; 00:3389 $34
.jr_00_338a:
    ld   H, [HL]                                       ;; 00:338a $66
    ld   L, A                                          ;; 00:338b $6f
    pop  DE                                            ;; 00:338c $d1
    ret                                                ;; 00:338d $c9

call_00_338e:
    push AF                                            ;; 00:338e $f5
    ld   DE, wC880                                     ;; 00:338f $11 $80 $c8
    ld   A, [wCD06]                                    ;; 00:3392 $fa $06 $cd
    ld   B, A                                          ;; 00:3395 $47
.jr_00_3396:
    ld   A, L                                          ;; 00:3396 $7d
    and  A, $1f                                        ;; 00:3397 $e6 $1f
    dec  A                                             ;; 00:3399 $3d
    jr   NZ, .jr_00_33c4                               ;; 00:339a $20 $28
    ld   A, [wCD03]                                    ;; 00:339c $fa $03 $cd
    ld   C, A                                          ;; 00:339f $4f
    ld   A, [wCD01]                                    ;; 00:33a0 $fa $01 $cd
    add  A, C                                          ;; 00:33a3 $81
    ld   C, A                                          ;; 00:33a4 $4f
    push HL                                            ;; 00:33a5 $e5
    add  HL, HL                                        ;; 00:33a6 $29
    add  HL, HL                                        ;; 00:33a7 $29
    add  HL, HL                                        ;; 00:33a8 $29
    ld   A, H                                          ;; 00:33a9 $7c
    pop  HL                                            ;; 00:33aa $e1
    and  A, $1f                                        ;; 00:33ab $e6 $1f
    cp   A, C                                          ;; 00:33ad $b9
    jr   NZ, .jr_00_33c4                               ;; 00:33ae $20 $14
    push BC                                            ;; 00:33b0 $c5
    call call_00_342c                                  ;; 00:33b1 $cd $2c $34
    pop  BC                                            ;; 00:33b4 $c1
    ld   A, L                                          ;; 00:33b5 $7d
    sub  A, $40                                        ;; 00:33b6 $d6 $40
    ld   L, A                                          ;; 00:33b8 $6f
    jr   NC, .jr_00_33bc                               ;; 00:33b9 $30 $01
    dec  H                                             ;; 00:33bb $25
.jr_00_33bc:
    ld   A, L                                          ;; 00:33bc $7d
    ld   [wCD04], A                                    ;; 00:33bd $ea $04 $cd
    ld   A, H                                          ;; 00:33c0 $7c
    ld   [wCD05], A                                    ;; 00:33c1 $ea $05 $cd
.jr_00_33c4:
    push HL                                            ;; 00:33c4 $e5
    ld   L, E                                          ;; 00:33c5 $6b
    ld   H, D                                          ;; 00:33c6 $62
    pop  DE                                            ;; 00:33c7 $d1
    push BC                                            ;; 00:33c8 $c5
    call call_00_3593                                  ;; 00:33c9 $cd $93 $35
    ld   BC, $01                                       ;; 00:33cc $01 $01 $00
    rst  rst_00_0018                                   ;; 00:33cf $df
    db   $01                                           ;; 00:33d0 .
    push HL                                            ;; 00:33d1 $e5
    push DE                                            ;; 00:33d2 $d5
    ld   BC, $13                                       ;; 00:33d3 $01 $13 $00
    add  HL, BC                                        ;; 00:33d6 $09
    ld   A, $1f                                        ;; 00:33d7 $3e $1f
    add  A, E                                          ;; 00:33d9 $83
    ld   E, A                                          ;; 00:33da $5f
    jr   NC, .jr_00_33de                               ;; 00:33db $30 $01
    inc  D                                             ;; 00:33dd $14
.jr_00_33de:
    ld   BC, $01                                       ;; 00:33de $01 $01 $00
    rst  rst_00_0018                                   ;; 00:33e1 $df
    db   $01                                           ;; 00:33e2 .
    ld   HL, wCD07                                     ;; 00:33e3 $21 $07 $cd
    inc  [HL]                                          ;; 00:33e6 $34
    pop  HL                                            ;; 00:33e7 $e1
    pop  DE                                            ;; 00:33e8 $d1
    pop  BC                                            ;; 00:33e9 $c1
    dec  B                                             ;; 00:33ea $05
    jr   NZ, .jr_00_3396                               ;; 00:33eb $20 $a9
    ld   A, L                                          ;; 00:33ed $7d
    ld   [wCD04], A                                    ;; 00:33ee $ea $04 $cd
    ld   A, H                                          ;; 00:33f1 $7c
    ld   [wCD05], A                                    ;; 00:33f2 $ea $05 $cd
    pop  AF                                            ;; 00:33f5 $f1
    ret                                                ;; 00:33f6 $c9

call_00_33f7:
    push HL                                            ;; 00:33f7 $e5
    ld   A, [wCD02]                                    ;; 00:33f8 $fa $02 $cd
    ld   E, A                                          ;; 00:33fb $5f
    ld   D, $9c                                        ;; 00:33fc $16 $9c
    ld   A, [wCD03]                                    ;; 00:33fe $fa $03 $cd
    call call_00_245f                                  ;; 00:3401 $cd $5f $24
    add  HL, HL                                        ;; 00:3404 $29
    add  HL, HL                                        ;; 00:3405 $29
    add  HL, DE                                        ;; 00:3406 $19
    ld   A, L                                          ;; 00:3407 $7d
    ld   [wCD04], A                                    ;; 00:3408 $ea $04 $cd
    ld   A, H                                          ;; 00:340b $7c
    ld   [wCD05], A                                    ;; 00:340c $ea $05 $cd
    pop  HL                                            ;; 00:340f $e1
    ret                                                ;; 00:3410 $c9

call_00_3411:
    push HL                                            ;; 00:3411 $e5
    ld   A, [wCD05]                                    ;; 00:3412 $fa $05 $cd
    ld   D, A                                          ;; 00:3415 $57
    ld   A, [wCD04]                                    ;; 00:3416 $fa $04 $cd
    ld   E, A                                          ;; 00:3419 $5f
    and  A, $1f                                        ;; 00:341a $e6 $1f
    ld   [wCD04], A                                    ;; 00:341c $ea $04 $cd
    ld   HL, $6400                                     ;; 00:341f $21 $00 $64
    add  HL, DE                                        ;; 00:3422 $19
    add  HL, HL                                        ;; 00:3423 $29
    add  HL, HL                                        ;; 00:3424 $29
    add  HL, HL                                        ;; 00:3425 $29
    ld   A, H                                          ;; 00:3426 $7c
    ld   [wCD05], A                                    ;; 00:3427 $ea $05 $cd
    pop  HL                                            ;; 00:342a $e1
    ret                                                ;; 00:342b $c9

call_00_342c:
    ld   A, [wCD37]                                    ;; 00:342c $fa $37 $cd
    or   A, A                                          ;; 00:342f $b7
    jr   NZ, .jr_00_344d                               ;; 00:3430 $20 $1b
    push HL                                            ;; 00:3432 $e5
    push DE                                            ;; 00:3433 $d5
    call call_00_3593                                  ;; 00:3434 $cd $93 $35
    ld   B, $04                                        ;; 00:3437 $06 $04
    ld   A, $01                                        ;; 00:3439 $3e $01
    call call_00_34b2                                  ;; 00:343b $cd $b2 $34
    ld   HL, $9ca1                                     ;; 00:343e $21 $a1 $9c
    call call_00_3468                                  ;; 00:3441 $cd $68 $34
    ld   HL, $9cc1                                     ;; 00:3444 $21 $c1 $9c
    call call_00_3468                                  ;; 00:3447 $cd $68 $34
    pop  DE                                            ;; 00:344a $d1
    pop  HL                                            ;; 00:344b $e1
    ret                                                ;; 00:344c $c9
.jr_00_344d:
    push HL                                            ;; 00:344d $e5
    push DE                                            ;; 00:344e $d5
    call call_00_3593                                  ;; 00:344f $cd $93 $35
    ld   B, $02                                        ;; 00:3452 $06 $02
    ld   A, $01                                        ;; 00:3454 $3e $01
    call call_00_34b2                                  ;; 00:3456 $cd $b2 $34
    ld   HL, $9c61                                     ;; 00:3459 $21 $61 $9c
    call call_00_3468                                  ;; 00:345c $cd $68 $34
    ld   HL, $9c81                                     ;; 00:345f $21 $81 $9c
    call call_00_3468                                  ;; 00:3462 $cd $68 $34
    pop  DE                                            ;; 00:3465 $d1
    pop  HL                                            ;; 00:3466 $e1
    ret                                                ;; 00:3467 $c9

call_00_3468:
    ld   A, $ff                                        ;; 00:3468 $3e $ff
    ld   BC, $12                                       ;; 00:346a $01 $12 $00
    rst  rst_00_0018                                   ;; 00:346d $df
    db   $9f                                           ;; 00:346e .
    ret                                                ;; 00:346f $c9

call_00_3470:
    ld   C, A                                          ;; 00:3470 $4f
    ld   A, [wCD19]                                    ;; 00:3471 $fa $19 $cd
    and  A, $02                                        ;; 00:3474 $e6 $02
    jp   Z, call_00_1e83                               ;; 00:3476 $ca $83 $1e
    ld   A, C                                          ;; 00:3479 $79
    push BC                                            ;; 00:347a $c5
    call call_00_34b2                                  ;; 00:347b $cd $b2 $34
    ld   HL, wCDE6                                     ;; 00:347e $21 $e6 $cd
    ld   A, [HL+]                                      ;; 00:3481 $2a
    ld   H, [HL]                                       ;; 00:3482 $66
    ld   L, A                                          ;; 00:3483 $6f
    ld   B, $01                                        ;; 00:3484 $06 $01
    call call_00_1ebb                                  ;; 00:3486 $cd $bb $1e
    ld   A, L                                          ;; 00:3489 $7d
    ld   [wCDE6], A                                    ;; 00:348a $ea $e6 $cd
    ld   A, H                                          ;; 00:348d $7c
    ld   [wCDE7], A                                    ;; 00:348e $ea $e7 $cd
    pop  BC                                            ;; 00:3491 $c1
    ld   A, B                                          ;; 00:3492 $78
    add  A, C                                          ;; 00:3493 $81
    ld   D, A                                          ;; 00:3494 $57
    srl  B                                             ;; 00:3495 $cb $38
    call call_00_1ebb                                  ;; 00:3497 $cd $bb $1e

jp_00_349a:
    ld   E, $84                                        ;; 00:349a $1e $84
    ld   A, $09                                        ;; 00:349c $3e $09
    rst  pushActiveBankSafe                            ;; 00:349e $e7
    inc  HL                                            ;; 00:349f $23
    ld   A, [HL]                                       ;; 00:34a0 $7e
    cp   A, $05                                        ;; 00:34a1 $fe $05
    jr   NZ, .jr_00_34a8                               ;; 00:34a3 $20 $03
    set  4, E                                          ;; 00:34a5 $cb $e3
    inc  HL                                            ;; 00:34a7 $23
.jr_00_34a8:
    rst  popActiveBankSafe                             ;; 00:34a8 $ef
    ld   A, E                                          ;; 00:34a9 $7b
    ld   E, $01                                        ;; 00:34aa $1e $01
    ld   BC, $212                                      ;; 00:34ac $01 $12 $02
    rst  rst_00_0018                                   ;; 00:34af $df
    db   $90                                           ;; 00:34b0 ?
    ret                                                ;; 00:34b1 $c9

call_00_34b2:
    push DE                                            ;; 00:34b2 $d5
    push HL                                            ;; 00:34b3 $e5
    swap A                                             ;; 00:34b4 $cb $37
    ld   L, A                                          ;; 00:34b6 $6f
    ld   A, $01                                        ;; 00:34b7 $3e $01
    ld   [wCD38], A                                    ;; 00:34b9 $ea $38 $cd
    ld   H, $00                                        ;; 00:34bc $26 $00
    add  HL, HL                                        ;; 00:34be $29
    ld   DE, $9c01                                     ;; 00:34bf $11 $01 $9c
    add  HL, DE                                        ;; 00:34c2 $19
    ld   E, L                                          ;; 00:34c3 $5d
    ld   D, H                                          ;; 00:34c4 $54
    ld   HL, $40                                       ;; 00:34c5 $21 $40 $00
    add  HL, DE                                        ;; 00:34c8 $19
.jr_00_34c9:
    push BC                                            ;; 00:34c9 $c5
    ld   BC, $14                                       ;; 00:34ca $01 $14 $00
    rst  rst_00_0018                                   ;; 00:34cd $df
    db   $01                                           ;; 00:34ce .
    ld   BC, $0c                                       ;; 00:34cf $01 $0c $00
    add  HL, BC                                        ;; 00:34d2 $09
    ld   A, E                                          ;; 00:34d3 $7b
    add  A, C                                          ;; 00:34d4 $81
    ld   E, A                                          ;; 00:34d5 $5f
    jr   NC, .jr_00_34d9                               ;; 00:34d6 $30 $01
    inc  D                                             ;; 00:34d8 $14
.jr_00_34d9:
    pop  BC                                            ;; 00:34d9 $c1
    dec  B                                             ;; 00:34da $05
    jr   NZ, .jr_00_34c9                               ;; 00:34db $20 $ec
    pop  HL                                            ;; 00:34dd $e1
    pop  DE                                            ;; 00:34de $d1
    ret                                                ;; 00:34df $c9

call_00_34e0:
    ld   C, A                                          ;; 00:34e0 $4f
    ld   A, [wCD19]                                    ;; 00:34e1 $fa $19 $cd
    and  A, $01                                        ;; 00:34e4 $e6 $01
    jp   Z, call_00_1e83                               ;; 00:34e6 $ca $83 $1e
    ld   A, C                                          ;; 00:34e9 $79
    push AF                                            ;; 00:34ea $f5
    call call_00_3505                                  ;; 00:34eb $cd $05 $35
    ld   HL, wCDE6                                     ;; 00:34ee $21 $e6 $cd
    ld   A, [HL+]                                      ;; 00:34f1 $2a
    ld   H, [HL]                                       ;; 00:34f2 $66
    ld   L, A                                          ;; 00:34f3 $6f
    ld   B, $01                                        ;; 00:34f4 $06 $01
    call call_00_1ec9                                  ;; 00:34f6 $cd $c9 $1e
    ld   A, L                                          ;; 00:34f9 $7d
    ld   [wCDE6], A                                    ;; 00:34fa $ea $e6 $cd
    ld   A, H                                          ;; 00:34fd $7c
    ld   [wCDE7], A                                    ;; 00:34fe $ea $e7 $cd
    pop  DE                                            ;; 00:3501 $d1
    jp   jp_00_349a                                    ;; 00:3502 $c3 $9a $34

call_00_3505:
    push DE                                            ;; 00:3505 $d5
    push HL                                            ;; 00:3506 $e5
    swap A                                             ;; 00:3507 $cb $37
    ld   L, A                                          ;; 00:3509 $6f
    ld   A, $01                                        ;; 00:350a $3e $01
    ld   [wCD38], A                                    ;; 00:350c $ea $38 $cd
    ld   H, $00                                        ;; 00:350f $26 $00
    add  HL, HL                                        ;; 00:3511 $29
    ld   DE, $9c01                                     ;; 00:3512 $11 $01 $9c
    add  HL, DE                                        ;; 00:3515 $19
    ld   A, B                                          ;; 00:3516 $78
    dec  A                                             ;; 00:3517 $3d
    add  A, A                                          ;; 00:3518 $87
    ld   D, A                                          ;; 00:3519 $57
    swap A                                             ;; 00:351a $cb $37
    and  A, $f0                                        ;; 00:351c $e6 $f0
    ld   E, A                                          ;; 00:351e $5f
    ld   A, D                                          ;; 00:351f $7a
    swap A                                             ;; 00:3520 $cb $37
    and  A, $0f                                        ;; 00:3522 $e6 $0f
    ld   D, A                                          ;; 00:3524 $57
    add  HL, DE                                        ;; 00:3525 $19
    ld   A, L                                          ;; 00:3526 $7d
    add  A, $40                                        ;; 00:3527 $c6 $40
    ld   E, A                                          ;; 00:3529 $5f
    ld   A, H                                          ;; 00:352a $7c
    adc  A, $00                                        ;; 00:352b $ce $00
    ld   D, A                                          ;; 00:352d $57
.jr_00_352e:
    push BC                                            ;; 00:352e $c5
    ld   BC, $14                                       ;; 00:352f $01 $14 $00
    rst  rst_00_0018                                   ;; 00:3532 $df
    db   $01                                           ;; 00:3533 ?
    pop  BC                                            ;; 00:3534 $c1
    ld   A, L                                          ;; 00:3535 $7d
    sub  A, $34                                        ;; 00:3536 $d6 $34
    ld   L, A                                          ;; 00:3538 $6f
    jr   NC, .jr_00_353c                               ;; 00:3539 $30 $01
    dec  H                                             ;; 00:353b $25
.jr_00_353c:
    ld   A, E                                          ;; 00:353c $7b
    sub  A, $34                                        ;; 00:353d $d6 $34
    ld   E, A                                          ;; 00:353f $5f
    jr   NC, .jr_00_3543                               ;; 00:3540 $30 $01
    dec  D                                             ;; 00:3542 $15
.jr_00_3543:
    dec  B                                             ;; 00:3543 $05
    jr   NZ, .jr_00_352e                               ;; 00:3544 $20 $e8
    pop  HL                                            ;; 00:3546 $e1
    pop  DE                                            ;; 00:3547 $d1
    ret                                                ;; 00:3548 $c9

call_00_3549:
    ld   HL, wCDC5                                     ;; 00:3549 $21 $c5 $cd
    inc  [HL]                                          ;; 00:354c $34
    ld   A, [HL]                                       ;; 00:354d $7e
    dec  A                                             ;; 00:354e $3d
    call Z, call_00_3557                               ;; 00:354f $cc $57 $35
    ld   HL, wCDC5                                     ;; 00:3552 $21 $c5 $cd
    dec  [HL]                                          ;; 00:3555 $35
    ret                                                ;; 00:3556 $c9

call_00_3557:
    ld   A, [wCDC4]                                    ;; 00:3557 $fa $c4 $cd
    or   A, A                                          ;; 00:355a $b7
    jr   NZ, .jr_00_3563                               ;; 00:355b $20 $06
    ldh  A, [rWY]                                      ;; 00:355d $f0 $4a
    cp   A, $50                                        ;; 00:355f $fe $50
    jr   NZ, .jr_00_356f                               ;; 00:3561 $20 $0c
.jr_00_3563:
    ld   A, $01                                        ;; 00:3563 $3e $01
    call pushActiveBank                                ;; 00:3565 $cd $e1 $38
    call call_00_3575                                  ;; 00:3568 $cd $75 $35
    di                                                 ;; 00:356b $f3
    jp   popActiveBank                                 ;; 00:356c $c3 $fc $38
.jr_00_356f:
    call call_00_2192                                  ;; 00:356f $cd $92 $21
    jp   jp_00_1ed7                                    ;; 00:3572 $c3 $d7 $1e

call_00_3575:
    call call_01_54a0                                  ;; 00:3575 $cd $a0 $54
    call call_00_01a0                                  ;; 00:3578 $cd $a0 $01
    call call_00_3d2b                                  ;; 00:357b $cd $2b $3d
    call call_00_108f                                  ;; 00:357e $cd $8f $10
    ldh  A, [rLCDC]                                    ;; 00:3581 $f0 $40
    bit  5, A                                          ;; 00:3583 $cb $6f
    ret  Z                                             ;; 00:3585 $c8
    ld   D, $60                                        ;; 00:3586 $16 $60
    jp   jp_00_3a32                                    ;; 00:3588 $c3 $32 $3a

call_00_358b:
    push AF                                            ;; 00:358b $f5
    ld   A, $01                                        ;; 00:358c $3e $01
    call call_00_3a6d                                  ;; 00:358e $cd $6d $3a
    pop  AF                                            ;; 00:3591 $f1
    ret                                                ;; 00:3592 $c9

call_00_3593:
    push AF                                            ;; 00:3593 $f5
    push DE                                            ;; 00:3594 $d5
    call call_00_358b                                  ;; 00:3595 $cd $8b $35
    ld   A, [wCED9]                                    ;; 00:3598 $fa $d9 $ce
    ld   E, A                                          ;; 00:359b $5f
.jr_00_359c:
    ldh  A, [hFF8A]                                    ;; 00:359c $f0 $8a
    bit  0, A                                          ;; 00:359e $cb $47
    jr   NZ, .jr_00_35ac                               ;; 00:35a0 $20 $0a
    call call_00_358b                                  ;; 00:35a2 $cd $8b $35
    bit  1, A                                          ;; 00:35a5 $cb $4f
    jr   NZ, .jr_00_359c                               ;; 00:35a7 $20 $f3
    dec  E                                             ;; 00:35a9 $1d
    jr   NZ, .jr_00_359c                               ;; 00:35aa $20 $f0
.jr_00_35ac:
    pop  DE                                            ;; 00:35ac $d1
    pop  AF                                            ;; 00:35ad $f1
    ret                                                ;; 00:35ae $c9

call_00_35af:
    ldh  A, [rLCDC]                                    ;; 00:35af $f0 $40
    bit  5, A                                          ;; 00:35b1 $cb $6f
    jr   Z, .jr_00_35b8                                ;; 00:35b3 $28 $03
    rst  rst_00_0018                                   ;; 00:35b5 $df
    db   $3a                                           ;; 00:35b6 ?
    ret                                                ;; 00:35b7 $c9
.jr_00_35b8:
    ld   A, $a5                                        ;; 00:35b8 $3e $a5
    ldh  [rWX], A                                      ;; 00:35ba $e0 $4b
    call call_00_35f0                                  ;; 00:35bc $cd $f0 $35
    ld   A, $6b                                        ;; 00:35bf $3e $6b
    ld   [wCDC6], A                                    ;; 00:35c1 $ea $c6 $cd
    ldh  [rLYC], A                                     ;; 00:35c4 $e0 $45
.jr_00_35c6:
    call call_00_361f                                  ;; 00:35c6 $cd $1f $36
    dec  [HL]                                          ;; 00:35c9 $35
    dec  [HL]                                          ;; 00:35ca $35
    ld   A, [HL]                                       ;; 00:35cb $7e
    cp   A, $51                                        ;; 00:35cc $fe $51
    jr   NC, .jr_00_35c6                               ;; 00:35ce $30 $f6
    jr   jr_00_3609                                    ;; 00:35d0 $18 $37

call_00_35d2:
    ldh  A, [rLCDC]                                    ;; 00:35d2 $f0 $40
    bit  5, A                                          ;; 00:35d4 $cb $6f
    ret  Z                                             ;; 00:35d6 $c8
    call call_00_35f0                                  ;; 00:35d7 $cd $f0 $35
    ld   A, $51                                        ;; 00:35da $3e $51
    ld   [wCDC6], A                                    ;; 00:35dc $ea $c6 $cd
    ldh  [rLYC], A                                     ;; 00:35df $e0 $45
.jr_00_35e1:
    call call_00_361f                                  ;; 00:35e1 $cd $1f $36
    inc  [HL]                                          ;; 00:35e4 $34
    inc  [HL]                                          ;; 00:35e5 $34
    ld   A, [HL]                                       ;; 00:35e6 $7e
    cp   A, $6b                                        ;; 00:35e7 $fe $6b
    jr   C, .jr_00_35e1                                ;; 00:35e9 $38 $f6
    call call_00_3a4b                                  ;; 00:35eb $cd $4b $3a
    jr   jr_00_3609                                    ;; 00:35ee $18 $19

call_00_35f0:
    call call_00_1d98                                  ;; 00:35f0 $cd $98 $1d
    di                                                 ;; 00:35f3 $f3
    ld   HL, wC0BD                                     ;; 00:35f4 $21 $bd $c0
    ld   A, $31                                        ;; 00:35f7 $3e $31
    ld   [HL+], A                                      ;; 00:35f9 $22
    ld   [HL], $36                                     ;; 00:35fa $36 $36
    ld   A, $50                                        ;; 00:35fc $3e $50
    ldh  [rWY], A                                      ;; 00:35fe $e0 $4a
    ldh  [rLYC], A                                     ;; 00:3600 $e0 $45
    ei                                                 ;; 00:3602 $fb
    ld   A, $01                                        ;; 00:3603 $3e $01
    rst  pushActiveBankSafe                            ;; 00:3605 $e7
    jp   call_00_3a44                                  ;; 00:3606 $c3 $44 $3a

jr_00_3609:
    di                                                 ;; 00:3609 $f3
    ld   A, $07                                        ;; 00:360a $3e $07
    ldh  [rWX], A                                      ;; 00:360c $e0 $4b
    ld   A, $03                                        ;; 00:360e $3e $03
    ldh  [rLYC], A                                     ;; 00:3610 $e0 $45
    ld   HL, wC0BD                                     ;; 00:3612 $21 $bd $c0
    ld   A, $27                                        ;; 00:3615 $3e $27
    ld   [HL+], A                                      ;; 00:3617 $22
    ld   [HL], $1f                                     ;; 00:3618 $36 $1f
    ei                                                 ;; 00:361a $fb
    rst  popActiveBankSafe                             ;; 00:361b $ef
    jp   call_00_1df3                                  ;; 00:361c $c3 $f3 $1d

call_00_361f:
    ldh  [rLYC], A                                     ;; 00:361f $e0 $45
    ld   A, $0f                                        ;; 00:3621 $3e $0f
    rst  pushActiveBankSafe                            ;; 00:3623 $e7
    call runSoundEngineReal                            ;; 00:3624 $cd $06 $40
    rst  popActiveBankSafe                             ;; 00:3627 $ef
    call call_00_3575                                  ;; 00:3628 $cd $75 $35
    ld   HL, wCDC6                                     ;; 00:362b $21 $c6 $cd
    jp   call_00_358b                                  ;; 00:362e $c3 $8b $35
    push AF                                            ;; 00:3631 $f5
    push DE                                            ;; 00:3632 $d5
    push HL                                            ;; 00:3633 $e5
    ld   HL, rBGP                                      ;; 00:3634 $21 $47 $ff
    call call_00_366e                                  ;; 00:3637 $cd $6e $36
    ld   [HL], $ff                                     ;; 00:363a $36 $ff
    call call_00_366e                                  ;; 00:363c $cd $6e $36
    inc  [HL]                                          ;; 00:363f $34
    call call_00_366e                                  ;; 00:3640 $cd $6e $36
    dec  [HL]                                          ;; 00:3643 $35
    call call_00_366e                                  ;; 00:3644 $cd $6e $36
    ld   A, [wCDB4]                                    ;; 00:3647 $fa $b4 $cd
    ld   [HL], A                                       ;; 00:364a $77
    ld   HL, rLYC                                      ;; 00:364b $21 $45 $ff
    ld   A, [HL]                                       ;; 00:364e $7e
    cp   A, $70                                        ;; 00:364f $fe $70
    jr   NC, .jr_00_365e                               ;; 00:3651 $30 $0b
    ld   A, $07                                        ;; 00:3653 $3e $07
    ldh  [rWX], A                                      ;; 00:3655 $e0 $4b
    ld   A, [HL]                                       ;; 00:3657 $7e
    cpl                                                ;; 00:3658 $2f
    add  A, $6f                                        ;; 00:3659 $c6 $6f
    add  A, A                                          ;; 00:365b $87
    jr   .jr_00_3668                                   ;; 00:365c $18 $0a
.jr_00_365e:
    ld   A, $a5                                        ;; 00:365e $3e $a5
    ldh  [rWX], A                                      ;; 00:3660 $e0 $4b
    ld   A, [HL]                                       ;; 00:3662 $7e
    sub  A, $6e                                        ;; 00:3663 $d6 $6e
    add  A, A                                          ;; 00:3665 $87
    cpl                                                ;; 00:3666 $2f
    inc  A                                             ;; 00:3667 $3c
.jr_00_3668:
    add  A, [HL]                                       ;; 00:3668 $86
    ld   [HL], A                                       ;; 00:3669 $77
    pop  HL                                            ;; 00:366a $e1
    pop  DE                                            ;; 00:366b $d1
    pop  AF                                            ;; 00:366c $f1
    reti                                               ;; 00:366d $d9

call_00_366e:
    ld   E, $01                                        ;; 00:366e $1e $01
.jr_00_3670:
    ldh  A, [rSTAT]                                    ;; 00:3670 $f0 $41
    and  A, $03                                        ;; 00:3672 $e6 $03
    jr   Z, .jr_00_3670                                ;; 00:3674 $28 $fa
.jr_00_3676:
    ldh  A, [rSTAT]                                    ;; 00:3676 $f0 $41
    and  A, $03                                        ;; 00:3678 $e6 $03
    jr   NZ, .jr_00_3676                               ;; 00:367a $20 $fa
    dec  E                                             ;; 00:367c $1d
    ret  Z                                             ;; 00:367d $c8
    jr   .jr_00_3670                                   ;; 00:367e $18 $f0

call_00_3680:
    push AF                                            ;; 00:3680 $f5
    push BC                                            ;; 00:3681 $c5
    push DE                                            ;; 00:3682 $d5
    push HL                                            ;; 00:3683 $e5
    ld   HL, wCD3B                                     ;; 00:3684 $21 $3b $cd
    ld   A, [HL]                                       ;; 00:3687 $7e
    inc  [HL]                                          ;; 00:3688 $34
    or   A, A                                          ;; 00:3689 $b7
    jr   Z, .jr_00_36ac                                ;; 00:368a $28 $20
    swap A                                             ;; 00:368c $cb $37
    srl  A                                             ;; 00:368e $cb $3f
    ld   HL, wCE90                                     ;; 00:3690 $21 $90 $ce
    rst  add_hl_a                                      ;; 00:3693 $c7
    ld   A, [wCD34]                                    ;; 00:3694 $fa $34 $cd
    ld   [HL+], A                                      ;; 00:3697 $22
    ld   E, L                                          ;; 00:3698 $5d
    ld   D, H                                          ;; 00:3699 $54
    ld   HL, wCD00                                     ;; 00:369a $21 $00 $cd
    call call_00_1f8a                                  ;; 00:369d $cd $8a $1f
    ld   L, E                                          ;; 00:36a0 $6b
    ld   H, D                                          ;; 00:36a1 $62
    ld   A, [wCD0A]                                    ;; 00:36a2 $fa $0a $cd
    ld   [HL+], A                                      ;; 00:36a5 $22
    ldh  A, [rWX]                                      ;; 00:36a6 $f0 $4b
    ld   [HL+], A                                      ;; 00:36a8 $22
    ldh  A, [rWY]                                      ;; 00:36a9 $f0 $4a
    ld   [HL+], A                                      ;; 00:36ab $22
.jr_00_36ac:
    pop  HL                                            ;; 00:36ac $e1
    pop  DE                                            ;; 00:36ad $d1
    pop  BC                                            ;; 00:36ae $c1
    pop  AF                                            ;; 00:36af $f1
    ret                                                ;; 00:36b0 $c9

call_00_36b1:
    push AF                                            ;; 00:36b1 $f5
    push BC                                            ;; 00:36b2 $c5
    push DE                                            ;; 00:36b3 $d5
    push HL                                            ;; 00:36b4 $e5
    ld   HL, wCD3B                                     ;; 00:36b5 $21 $3b $cd
    dec  [HL]                                          ;; 00:36b8 $35
    jr   Z, .jr_00_36ec                                ;; 00:36b9 $28 $31
    ld   A, [wCD34]                                    ;; 00:36bb $fa $34 $cd
    push AF                                            ;; 00:36be $f5
    ld   A, [HL]                                       ;; 00:36bf $7e
    swap A                                             ;; 00:36c0 $cb $37
    srl  A                                             ;; 00:36c2 $cb $3f
    ld   HL, wCE90                                     ;; 00:36c4 $21 $90 $ce
    rst  add_hl_a                                      ;; 00:36c7 $c7
    ld   A, [HL+]                                      ;; 00:36c8 $2a
    ld   [wCD34], A                                    ;; 00:36c9 $ea $34 $cd
    ld   DE, wCD00                                     ;; 00:36cc $11 $00 $cd
    call call_00_1f8a                                  ;; 00:36cf $cd $8a $1f
    ld   A, [HL+]                                      ;; 00:36d2 $2a
    ld   [wCD0A], A                                    ;; 00:36d3 $ea $0a $cd
    ld   A, [wCDC1]                                    ;; 00:36d6 $fa $c1 $cd
    or   A, A                                          ;; 00:36d9 $b7
    jr   NZ, .jr_00_36e2                               ;; 00:36da $20 $06
    ld   A, [HL+]                                      ;; 00:36dc $2a
    ldh  [rWX], A                                      ;; 00:36dd $e0 $4b
    ld   A, [HL+]                                      ;; 00:36df $2a
    ldh  [rWY], A                                      ;; 00:36e0 $e0 $4a
.jr_00_36e2:
    xor  A, A                                          ;; 00:36e2 $af
    ld   [wCDC1], A                                    ;; 00:36e3 $ea $c1 $cd
    pop  AF                                            ;; 00:36e6 $f1
    and  A, $40                                        ;; 00:36e7 $e6 $40
    call Z, call_00_328f                               ;; 00:36e9 $cc $8f $32
.jr_00_36ec:
    pop  HL                                            ;; 00:36ec $e1
    pop  DE                                            ;; 00:36ed $d1
    pop  BC                                            ;; 00:36ee $c1
    pop  AF                                            ;; 00:36ef $f1
    ret                                                ;; 00:36f0 $c9

call_00_36f1:
    ld   A, [wCDC2]                                    ;; 00:36f1 $fa $c2 $cd
    or   A, A                                          ;; 00:36f4 $b7
    ret  NZ                                            ;; 00:36f5 $c0
    ld   A, $20                                        ;; 00:36f6 $3e $20
    ldh  [rP1], A                                      ;; 00:36f8 $e0 $00
    ldh  A, [rP1]                                      ;; 00:36fa $f0 $00
    ldh  A, [rP1]                                      ;; 00:36fc $f0 $00
    cpl                                                ;; 00:36fe $2f
    and  A, $0f                                        ;; 00:36ff $e6 $0f
    swap A                                             ;; 00:3701 $cb $37
    ld   B, A                                          ;; 00:3703 $47
    ld   A, $10                                        ;; 00:3704 $3e $10
    ldh  [rP1], A                                      ;; 00:3706 $e0 $00
    ldh  A, [rP1]                                      ;; 00:3708 $f0 $00
    ldh  A, [rP1]                                      ;; 00:370a $f0 $00
    ldh  A, [rP1]                                      ;; 00:370c $f0 $00
    ldh  A, [rP1]                                      ;; 00:370e $f0 $00
    ldh  A, [rP1]                                      ;; 00:3710 $f0 $00
    ldh  A, [rP1]                                      ;; 00:3712 $f0 $00
    cpl                                                ;; 00:3714 $2f
    and  A, $0f                                        ;; 00:3715 $e6 $0f
    or   A, B                                          ;; 00:3717 $b0
    ld   C, A                                          ;; 00:3718 $4f
    ldh  A, [hFF8A]                                    ;; 00:3719 $f0 $8a
    xor  A, C                                          ;; 00:371b $a9
    and  A, C                                          ;; 00:371c $a1
    ldh  [hFF8B], A                                    ;; 00:371d $e0 $8b
    ld   A, C                                          ;; 00:371f $79
    ldh  [hFF8A], A                                    ;; 00:3720 $e0 $8a
    ld   A, $30                                        ;; 00:3722 $3e $30
    ldh  [rP1], A                                      ;; 00:3724 $e0 $00
    ret                                                ;; 00:3726 $c9

call_00_3727:
    ld   HL, $3730                                     ;; 00:3727 $21 $30 $37
    ld   DE, hFF80                                     ;; 00:372a $11 $80 $ff
    jp   jp_00_1f78                                    ;; 00:372d $c3 $78 $1f
    db   $3e, $c0, $e0, $46, $3e, $28, $3d, $20        ;; 00:3730 ........
    db   $fd, $c9                                      ;; 00:3738 ..

;@noreturn
doJumptable:
    pop  HL                                            ;; 00:373a $e1

;@noreturn
doJumptableHL:
    add  A, A                                          ;; 00:373b $87
    rst  add_hl_a                                      ;; 00:373c $c7
    ld   A, [HL+]                                      ;; 00:373d $2a
    ld   H, [HL]                                       ;; 00:373e $66
    ld   L, A                                          ;; 00:373f $6f
    jp   HL                                            ;; 00:3740 $e9

call_00_3741:
    rst  add_hl_a                                      ;; 00:3741 $c7
    rst  add_hl_a                                      ;; 00:3742 $c7
    ld   A, [HL+]                                      ;; 00:3743 $2a
    ld   H, [HL]                                       ;; 00:3744 $66
    ld   L, A                                          ;; 00:3745 $6f
    ret                                                ;; 00:3746 $c9
    db   $87, $c7, $c9                                 ;; 00:3747 ???

call_00_374a:
    ldh  A, [rLY]                                      ;; 00:374a $f0 $44
    cp   A, $91                                        ;; 00:374c $fe $91
    jr   NZ, call_00_374a                              ;; 00:374e $20 $fa
    ldh  A, [rLCDC]                                    ;; 00:3750 $f0 $40
    and  A, $7f                                        ;; 00:3752 $e6 $7f
    ldh  [rLCDC], A                                    ;; 00:3754 $e0 $40
    ret                                                ;; 00:3756 $c9

call_00_3757:
    ld   A, [HL+]                                      ;; 00:3757 $2a
    and  A, A                                          ;; 00:3758 $a7
    ret  Z                                             ;; 00:3759 $c8
    ld   D, A                                          ;; 00:375a $57
    ld   A, [HL+]                                      ;; 00:375b $2a
    ld   E, A                                          ;; 00:375c $5f
    ld   A, [HL]                                       ;; 00:375d $7e
    and  A, $3f                                        ;; 00:375e $e6 $3f
    ld   B, A                                          ;; 00:3760 $47
    ld   A, [HL+]                                      ;; 00:3761 $2a
    and  A, $80                                        ;; 00:3762 $e6 $80
    jr   NZ, .jr_00_3777                               ;; 00:3764 $20 $11
.jr_00_3766:
    ld   A, [HL+]                                      ;; 00:3766 $2a
    ld   [DE], A                                       ;; 00:3767 $12
    ld   A, E                                          ;; 00:3768 $7b
    and  A, $e0                                        ;; 00:3769 $e6 $e0
    ld   C, A                                          ;; 00:376b $4f
    ld   A, E                                          ;; 00:376c $7b
    inc  A                                             ;; 00:376d $3c
    and  A, $1f                                        ;; 00:376e $e6 $1f
    or   A, C                                          ;; 00:3770 $b1
    ld   E, A                                          ;; 00:3771 $5f
    dec  B                                             ;; 00:3772 $05
    jr   NZ, .jr_00_3766                               ;; 00:3773 $20 $f1
    jr   call_00_3757                                  ;; 00:3775 $18 $e0
.jr_00_3777:
    ld   A, [HL+]                                      ;; 00:3777 $2a
    ld   [DE], A                                       ;; 00:3778 $12
    ld   A, E                                          ;; 00:3779 $7b
    add  A, $20                                        ;; 00:377a $c6 $20
    ld   E, A                                          ;; 00:377c $5f
    ld   A, D                                          ;; 00:377d $7a
    adc  A, $00                                        ;; 00:377e $ce $00
    and  A, $03                                        ;; 00:3780 $e6 $03
    or   A, $98                                        ;; 00:3782 $f6 $98
    ld   D, A                                          ;; 00:3784 $57
    dec  B                                             ;; 00:3785 $05
    jr   NZ, .jr_00_3777                               ;; 00:3786 $20 $ef
    jr   call_00_3757                                  ;; 00:3788 $18 $cd

;@noreturn
jp_00_378a:
    di                                                 ;; 00:378a $f3
    ldh  [hFFA2], A                                    ;; 00:378b $e0 $a2
    ld   A, L                                          ;; 00:378d $7d
    ldh  [hFFA3], A                                    ;; 00:378e $e0 $a3
    ld   A, H                                          ;; 00:3790 $7c
    ldh  [hFFA4], A                                    ;; 00:3791 $e0 $a4
    push AF                                            ;; 00:3793 $f5
    pop  HL                                            ;; 00:3794 $e1
    ld   A, L                                          ;; 00:3795 $7d
    ldh  [hFFA1], A                                    ;; 00:3796 $e0 $a1
    pop  HL                                            ;; 00:3798 $e1
    ld   A, [HL+]                                      ;; 00:3799 $2a
    push HL                                            ;; 00:379a $e5
    bit  3, A                                          ;; 00:379b $cb $5f
    jr   NZ, .jr_00_37c0                               ;; 00:379d $20 $21
    ld   L, A                                          ;; 00:379f $6f
    swap A                                             ;; 00:37a0 $cb $37
    and  A, $0f                                        ;; 00:37a2 $e6 $0f
    jr   Z, .jr_00_37af                                ;; 00:37a4 $28 $09
    call pushActiveBank                                ;; 00:37a6 $cd $e1 $38
    ld   A, L                                          ;; 00:37a9 $7d
    ld   HL, $37fe ;@=ptr                              ;; 00:37aa $21 $fe $37
    push HL                                            ;; 00:37ad $e5
    ld   L, A                                          ;; 00:37ae $6f
.jr_00_37af:
    ld   A, L                                          ;; 00:37af $7d
    and  A, $07                                        ;; 00:37b0 $e6 $07
    add  A, A                                          ;; 00:37b2 $87
    ld   HL, jumptable_00_38c4 ;@=ptr                  ;; 00:37b3 $21 $c4 $38
    add  A, L                                          ;; 00:37b6 $85
    ld   L, A                                          ;; 00:37b7 $6f
    jr   NC, .jr_00_37bb                               ;; 00:37b8 $30 $01
    inc  H                                             ;; 00:37ba $24
.jr_00_37bb:
    ld   A, [HL+]                                      ;; 00:37bb $2a
    ld   H, [HL]                                       ;; 00:37bc $66
    ld   L, A                                          ;; 00:37bd $6f
    jr   .jr_00_37ef                                   ;; 00:37be $18 $2f
.jr_00_37c0:
    ld   HL, $37fe ;@=ptr                              ;; 00:37c0 $21 $fe $37
    push HL                                            ;; 00:37c3 $e5
    ld   L, A                                          ;; 00:37c4 $6f
    and  A, $07                                        ;; 00:37c5 $e6 $07
    add  A, A                                          ;; 00:37c7 $87
    ld   H, A                                          ;; 00:37c8 $67
    ld   A, L                                          ;; 00:37c9 $7d
    and  A, $f0                                        ;; 00:37ca $e6 $f0
    or   A, H                                          ;; 00:37cc $b4
    ld   HL, $3807 ;@=ptr                              ;; 00:37cd $21 $07 $38
    add  A, L                                          ;; 00:37d0 $85
    ld   L, A                                          ;; 00:37d1 $6f
    jr   NC, .jr_00_37d5                               ;; 00:37d2 $30 $01
    inc  H                                             ;; 00:37d4 $24
.jr_00_37d5:
    ld   A, [HL]                                       ;; 00:37d5 $7e
    push HL                                            ;; 00:37d6 $e5
    and  A, $c0                                        ;; 00:37d7 $e6 $c0
    rlca                                               ;; 00:37d9 $07
    rlca                                               ;; 00:37da $07
    ld   HL, $3802 ;@=ptr                              ;; 00:37db $21 $02 $38
    add  A, L                                          ;; 00:37de $85
    ld   L, A                                          ;; 00:37df $6f
    jr   NC, .jr_00_37e3                               ;; 00:37e0 $30 $01
    inc  H                                             ;; 00:37e2 $24
.jr_00_37e3:
    ld   A, [HL]                                       ;; 00:37e3 $7e
    call pushActiveBank                                ;; 00:37e4 $cd $e1 $38
    pop  HL                                            ;; 00:37e7 $e1
    ld   A, [HL-]                                      ;; 00:37e8 $3a
    ld   L, [HL]                                       ;; 00:37e9 $6e
    and  A, $3f                                        ;; 00:37ea $e6 $3f
    or   A, $40                                        ;; 00:37ec $f6 $40
    ld   H, A                                          ;; 00:37ee $67
.jr_00_37ef:
    push HL                                            ;; 00:37ef $e5
    ldh  A, [hFFA1]                                    ;; 00:37f0 $f0 $a1
    ld   L, A                                          ;; 00:37f2 $6f
    push HL                                            ;; 00:37f3 $e5
    pop  AF                                            ;; 00:37f4 $f1
    ldh  A, [hFFA4]                                    ;; 00:37f5 $f0 $a4
    ld   H, A                                          ;; 00:37f7 $67
    ldh  A, [hFFA3]                                    ;; 00:37f8 $f0 $a3
    ld   L, A                                          ;; 00:37fa $6f
    ldh  A, [hFFA2]                                    ;; 00:37fb $f0 $a2
    reti                                               ;; 00:37fd $d9
    push AF                                            ;; 00:37fe $f5
    rst  popActiveBankSafe                             ;; 00:37ff $ef
    pop  AF                                            ;; 00:3800 $f1
    ret                                                ;; 00:3801 $c9
    db   $01, $09, $0b, $0f, $01, $37, $23, $30        ;; 00:3802 ..W.p.p.
    db   $ef, $4f, $e8, $40, $ea, $51, $d3, $40        ;; 00:380a ??p.p.p.
    db   $6c, $b0, $37, $b0, $83, $a6, $d9, $ae        ;; 00:3812 ??p.p.??
    db   $1a, $b0, $49, $b3, $df, $9b, $40, $ae        ;; 00:381a p.??p.??
    db   $00, $80, $f0, $84, $02, $85, $00, $b4        ;; 00:3822 p.??????
    db   $7f, $5d, $64, $5d, $24, $fa, $28, $fa        ;; 00:382a p.p.????
    db   $2c, $fa, $b4, $fd, $fd, $3d, $04, $ad        ;; 00:3832 p.p.p.p.
    db   $0e, $ad, $9f, $fd, $12, $ad, $b2, $f8        ;; 00:383a ????p.p.
    db   $22, $ad, $64, $49, $8d, $fd, $97, $fd        ;; 00:3842 p.p.p.p.
    db   $e4, $ad, $33, $ae, $00, $40, $ce, $4e        ;; 00:384a p.p.p.??
    db   $df, $4e, $79, $3c, $49, $3e, $ca, $bd        ;; 00:3852 ????p.p.
    db   $ef, $fd, $47, $a9, $a1, $af, $66, $54        ;; 00:385a ????p.p.
    db   $ae, $ae, $c7, $ad, $b3, $ad, $21, $49        ;; 00:3862 ??p.????
    db   $63, $ad, $8f, $ff, $d4, $fd, $b0, $fc        ;; 00:386a p.??p.??
    db   $be, $fd, $c9, $fd, $74, $fc, $bf, $9d        ;; 00:3872 p.??p.p.
    db   $d1, $53, $d4, $2f, $2f, $ff, $f2, $fd        ;; 00:387a ????????
    db   $c8, $fb, $b6, $ae, $8b, $b2, $44, $fa        ;; 00:3882 ??p.??p.
    db   $64, $fb, $a7, $fb, $0d, $3e, $08, $3e        ;; 00:388a p.??????
    db   $32, $01, $d6, $00, $2e, $02, $4d, $02        ;; 00:3892 ????????
    db   $1b, $fa, $d4, $f9, $ae, $f9, $72, $12        ;; 00:389a ??p.p.p.
    db   $b5, $80, $2c, $f9, $24, $b1, $ba, $f8        ;; 00:38a2 ??p.??p.
    db   $a8, $84, $cd, $bc, $94, $80, $ee, $ac        ;; 00:38aa ??p.??p.
    db   $96, $ac, $87, $ac, $8d, $14, $7a, $14        ;; 00:38b2 ??p.??p.
    db   $76, $ac, $89, $be, $96, $be, $5e, $ac        ;; 00:38ba p.??????
    db   $35, $ac                                      ;; 00:38c2 p.

;@jumptable amount=8
jumptable_00_38c4:
    dw   call_00_3211                                  ;; 00:38c4 pP $00
    dw   call_00_20ff                                  ;; 00:38c6 pP $01
    dw   call_00_1f8a                                  ;; 00:38c8 pP $02
    dw   call_00_1f97                                  ;; 00:38ca pP $03
    dw   call_00_1fb1                                  ;; 00:38cc pP $04
    dw   call_00_1e51                                  ;; 00:38ce pP $05
    dw   call_00_3d6e                                  ;; 00:38d0 pP $06
    dw   call_00_3d73                                  ;; 00:38d2 pP $07

jp_00_38d4:
    rst  pushActiveBankSafe                            ;; 00:38d4 $e7
    ld   A, $c3                                        ;; 00:38d5 $3e $c3
    ld   [wC0B2], A                                    ;; 00:38d7 $ea $b2 $c0
    call wC0B2                                         ;; 00:38da $cd $b2 $c0
    push AF                                            ;; 00:38dd $f5
    rst  popActiveBankSafe                             ;; 00:38de $ef
    pop  AF                                            ;; 00:38df $f1
    ret                                                ;; 00:38e0 $c9

pushActiveBank:
    push HL                                            ;; 00:38e1 $e5
    ld   [$2000], A                                    ;; 00:38e2 $ea $00 $20
    push AF                                            ;; 00:38e5 $f5
    ld   HL, wBankStack                                ;; 00:38e6 $21 $a0 $c0
    ld   A, [wBankStackIndex]                          ;; 00:38e9 $fa $b0 $c0
    add  A, L                                          ;; 00:38ec $85
    ld   L, A                                          ;; 00:38ed $6f
    ld   A, [wCurrentBank]                             ;; 00:38ee $fa $b1 $c0
    ld   [HL], A                                       ;; 00:38f1 $77
    pop  AF                                            ;; 00:38f2 $f1
    ld   [wCurrentBank], A                             ;; 00:38f3 $ea $b1 $c0
    ld   HL, wBankStackIndex                           ;; 00:38f6 $21 $b0 $c0
    inc  [HL]                                          ;; 00:38f9 $34
    pop  HL                                            ;; 00:38fa $e1
    ret                                                ;; 00:38fb $c9

popActiveBank:
    push HL                                            ;; 00:38fc $e5
    ld   HL, wBankStackIndex                           ;; 00:38fd $21 $b0 $c0
    dec  [HL]                                          ;; 00:3900 $35
    ld   A, [HL]                                       ;; 00:3901 $7e
    ld   HL, wBankStack                                ;; 00:3902 $21 $a0 $c0
    add  A, L                                          ;; 00:3905 $85
    ld   L, A                                          ;; 00:3906 $6f
    ld   A, [HL]                                       ;; 00:3907 $7e
    ld   [$2000], A                                    ;; 00:3908 $ea $00 $20
    ld   [wCurrentBank], A                             ;; 00:390b $ea $b1 $c0
    pop  HL                                            ;; 00:390e $e1
    ret                                                ;; 00:390f $c9

call_00_3910:
    ld   [wCurrentBank], A                             ;; 00:3910 $ea $b1 $c0
    ld   [$2100], A                                    ;; 00:3913 $ea $00 $21
    xor  A, A                                          ;; 00:3916 $af
    ld   [wBankStackIndex], A                          ;; 00:3917 $ea $b0 $c0
    ret                                                ;; 00:391a $c9

call_00_391b:
    rst  pushActiveBankSafe                            ;; 00:391b $e7
    ld   A, [HL]                                       ;; 00:391c $7e
    push AF                                            ;; 00:391d $f5
    rst  popActiveBankSafe                             ;; 00:391e $ef
    pop  AF                                            ;; 00:391f $f1
    ret                                                ;; 00:3920 $c9

call_00_3921:
    ld   D, A                                          ;; 00:3921 $57
    ld   E, $14                                        ;; 00:3922 $1e $14
    inc  B                                             ;; 00:3924 $04
.jr_00_3925:
    dec  B                                             ;; 00:3925 $05
    jr   Z, .jr_00_3933                                ;; 00:3926 $28 $0b
.jr_00_3928:
    call call_00_1f45                                  ;; 00:3928 $cd $45 $1f
    ld   A, C                                          ;; 00:392b $79
    sub  A, E                                          ;; 00:392c $93
    ld   C, A                                          ;; 00:392d $4f
    ld   A, D                                          ;; 00:392e $7a
    jr   NC, .jr_00_3928                               ;; 00:392f $30 $f7
    jr   .jr_00_3925                                   ;; 00:3931 $18 $f2
.jr_00_3933:
    ld   B, C                                          ;; 00:3933 $41

call_00_3934:
    ld   D, A                                          ;; 00:3934 $57
    ld   E, $14                                        ;; 00:3935 $1e $14
    ld   A, B                                          ;; 00:3937 $78
.jr_00_3938:
    cp   A, E                                          ;; 00:3938 $bb
    jr   C, .jr_00_3944                                ;; 00:3939 $38 $09
    ld   A, D                                          ;; 00:393b $7a
    call call_00_1f45                                  ;; 00:393c $cd $45 $1f
    ld   A, B                                          ;; 00:393f $78
    sub  A, E                                          ;; 00:3940 $93
    ld   B, A                                          ;; 00:3941 $47
    jr   .jr_00_3938                                   ;; 00:3942 $18 $f4
.jr_00_3944:
    or   A, A                                          ;; 00:3944 $b7
    ret  Z                                             ;; 00:3945 $c8
    ld   A, D                                          ;; 00:3946 $7a
.jr_00_3947:
    ld   [HL+], A                                      ;; 00:3947 $22
    dec  B                                             ;; 00:3948 $05
    jr   NZ, .jr_00_3947                               ;; 00:3949 $20 $fc
    ret                                                ;; 00:394b $c9

call_00_394c:
    ld   A, L                                          ;; 00:394c $7d
    ld   [wC800], A                                    ;; 00:394d $ea $00 $c8
    ld   A, H                                          ;; 00:3950 $7c
    ld   HL, wC801                                     ;; 00:3951 $21 $01 $c8
    ld   [HL+], A                                      ;; 00:3954 $22
    ld   A, B                                          ;; 00:3955 $78
    ld   [HL+], A                                      ;; 00:3956 $22
    ld   A, C                                          ;; 00:3957 $79
    ld   [HL], A                                       ;; 00:3958 $77
    ld   HL, wC100                                     ;; 00:3959 $21 $00 $c1
    cp   A, B                                          ;; 00:395c $b8
    jr   C, .jr_00_398c                                ;; 00:395d $38 $2d
.jr_00_395f:
    ld   A, [wC803]                                    ;; 00:395f $fa $03 $c8
    ld   C, A                                          ;; 00:3962 $4f
    ld   A, [wC801]                                    ;; 00:3963 $fa $01 $c8
    ld   [HL+], A                                      ;; 00:3966 $22
    ld   A, [wC800]                                    ;; 00:3967 $fa $00 $c8
    ld   [HL+], A                                      ;; 00:396a $22
    ld   A, C                                          ;; 00:396b $79
    ld   [HL+], A                                      ;; 00:396c $22
.jr_00_396d:
    ld   A, [DE]                                       ;; 00:396d $1a
    ld   [HL+], A                                      ;; 00:396e $22
    inc  DE                                            ;; 00:396f $13
    dec  C                                             ;; 00:3970 $0d
    jr   NZ, .jr_00_396d                               ;; 00:3971 $20 $fa
    ld   A, [wC800]                                    ;; 00:3973 $fa $00 $c8
    add  A, $20                                        ;; 00:3976 $c6 $20
    ld   [wC800], A                                    ;; 00:3978 $ea $00 $c8
    ld   A, [wC801]                                    ;; 00:397b $fa $01 $c8
    adc  A, $00                                        ;; 00:397e $ce $00
    and  A, $03                                        ;; 00:3980 $e6 $03
    or   A, $98                                        ;; 00:3982 $f6 $98
    ld   [wC801], A                                    ;; 00:3984 $ea $01 $c8
    dec  B                                             ;; 00:3987 $05
    jr   NZ, .jr_00_395f                               ;; 00:3988 $20 $d5
    jr   .jr_00_39b5                                   ;; 00:398a $18 $29
.jr_00_398c:
    ld   A, [wC802]                                    ;; 00:398c $fa $02 $c8
    ld   B, A                                          ;; 00:398f $47
    ld   A, [wC801]                                    ;; 00:3990 $fa $01 $c8
    ld   [HL+], A                                      ;; 00:3993 $22
    ld   A, [wC800]                                    ;; 00:3994 $fa $00 $c8
    ld   [HL+], A                                      ;; 00:3997 $22
    ld   A, B                                          ;; 00:3998 $78
    or   A, $80                                        ;; 00:3999 $f6 $80
    ld   [HL+], A                                      ;; 00:399b $22
.jr_00_399c:
    ld   A, [DE]                                       ;; 00:399c $1a
    ld   [HL+], A                                      ;; 00:399d $22
    inc  DE                                            ;; 00:399e $13
    dec  B                                             ;; 00:399f $05
    jr   NZ, .jr_00_399c                               ;; 00:39a0 $20 $fa
    ld   A, [wC800]                                    ;; 00:39a2 $fa $00 $c8
    and  A, $e0                                        ;; 00:39a5 $e6 $e0
    ld   B, A                                          ;; 00:39a7 $47
    inc  A                                             ;; 00:39a8 $3c
    ld   A, [wC800]                                    ;; 00:39a9 $fa $00 $c8
    and  A, $1f                                        ;; 00:39ac $e6 $1f
    or   A, B                                          ;; 00:39ae $b0
    ld   [wC800], A                                    ;; 00:39af $ea $00 $c8
    dec  C                                             ;; 00:39b2 $0d
    jr   NZ, .jr_00_398c                               ;; 00:39b3 $20 $d7
.jr_00_39b5:
    xor  A, A                                          ;; 00:39b5 $af
    ld   [HL], A                                       ;; 00:39b6 $77
    ret                                                ;; 00:39b7 $c9

call_00_39b8:
    xor  A, A                                          ;; 00:39b8 $af
    ld   HL, hFF8A                                     ;; 00:39b9 $21 $8a $ff
    ld   B, $73                                        ;; 00:39bc $06 $73
    call call_00_3934                                  ;; 00:39be $cd $34 $39
    xor  A, A                                          ;; 00:39c1 $af
    ld   HL, wC000                                     ;; 00:39c2 $21 $00 $c0
    ld   BC, $f00                                      ;; 00:39c5 $01 $00 $0f
    call call_00_3921                                  ;; 00:39c8 $cd $21 $39
    xor  A, A                                          ;; 00:39cb $af
    ld   HL, wD000                                     ;; 00:39cc $21 $00 $d0
    ld   BC, $1000                                     ;; 00:39cf $01 $00 $10
    jp   call_00_3921                                  ;; 00:39d2 $c3 $21 $39

call_00_39d5:
    ld   HL, hFF90                                     ;; 00:39d5 $21 $90 $ff
    ldh  A, [hFF93]                                    ;; 00:39d8 $f0 $93
    add  A, [HL]                                       ;; 00:39da $86
    xor  A, $01                                        ;; 00:39db $ee $01
    rrca                                               ;; 00:39dd $0f
    add  A, [HL]                                       ;; 00:39de $86
    ld   [HL], A                                       ;; 00:39df $77
    ret                                                ;; 00:39e0 $c9

call_00_39e1:
    call call_00_39e7                                  ;; 00:39e1 $cd $e7 $39
    call call_00_39e7                                  ;; 00:39e4 $cd $e7 $39

call_00_39e7:
    ld   DE, rBGP                                      ;; 00:39e7 $11 $47 $ff
    call call_00_1f8d                                  ;; 00:39ea $cd $8d $1f
    add  HL, BC                                        ;; 00:39ed $09
    ld   A, $05                                        ;; 00:39ee $3e $05
    jp   call_00_3a6d                                  ;; 00:39f0 $c3 $6d $3a

call_00_39f3:
    push HL                                            ;; 00:39f3 $e5
    push DE                                            ;; 00:39f4 $d5
    push BC                                            ;; 00:39f5 $c5
    ldh  A, [rBGP]                                     ;; 00:39f6 $f0 $47
    ld   B, A                                          ;; 00:39f8 $47
    ldh  A, [rOBP0]                                    ;; 00:39f9 $f0 $48
    or   A, B                                          ;; 00:39fb $b0
    ld   B, A                                          ;; 00:39fc $47
    ldh  A, [rOBP1]                                    ;; 00:39fd $f0 $49
    or   A, B                                          ;; 00:39ff $b0
    jr   Z, jr_00_3a20                                 ;; 00:3a00 $28 $1e
    rst  rst_00_0018                                   ;; 00:3a02 $df
    db   $9c                                           ;; 00:3a03 .
    ld   HL, wCDB7                                     ;; 00:3a04 $21 $b7 $cd
    ld   BC, $00                                       ;; 00:3a07 $01 $00 $00
    jr   jr_00_3a17                                    ;; 00:3a0a $18 $0b

call_00_3a0c:
    push HL                                            ;; 00:3a0c $e5
    push DE                                            ;; 00:3a0d $d5
    push BC                                            ;; 00:3a0e $c5
    rst  rst_00_0018                                   ;; 00:3a0f $df
    db   $9c                                           ;; 00:3a10 .
    ld   HL, wCDBA                                     ;; 00:3a11 $21 $ba $cd
    ld   BC, hFFFA                                     ;; 00:3a14 $01 $fa $ff

jr_00_3a17:
    call call_00_1d98                                  ;; 00:3a17 $cd $98 $1d
    call call_00_39e1                                  ;; 00:3a1a $cd $e1 $39
    call call_00_1df3                                  ;; 00:3a1d $cd $f3 $1d

jr_00_3a20:
    pop  BC                                            ;; 00:3a20 $c1
    pop  DE                                            ;; 00:3a21 $d1
    pop  HL                                            ;; 00:3a22 $e1
    ret                                                ;; 00:3a23 $c9

call_00_3a24:
    ld   HL, wC000                                     ;; 00:3a24 $21 $00 $c0
    xor  A, A                                          ;; 00:3a27 $af
    ld   B, $27                                        ;; 00:3a28 $06 $27
.jr_00_3a2a:
    ld   [HL+], A                                      ;; 00:3a2a $22
    inc  HL                                            ;; 00:3a2b $23
    inc  HL                                            ;; 00:3a2c $23
    inc  HL                                            ;; 00:3a2d $23
    dec  B                                             ;; 00:3a2e $05
    jr   NZ, .jr_00_3a2a                               ;; 00:3a2f $20 $f9
    ret                                                ;; 00:3a31 $c9

jp_00_3a32:
    ld   HL, wC000                                     ;; 00:3a32 $21 $00 $c0
    ld   B, $27                                        ;; 00:3a35 $06 $27
.jr_00_3a37:
    ld   A, [HL]                                       ;; 00:3a37 $7e
    cp   A, D                                          ;; 00:3a38 $ba
    jr   C, .jr_00_3a3d                                ;; 00:3a39 $38 $02
    xor  A, A                                          ;; 00:3a3b $af
    ld   [HL], A                                       ;; 00:3a3c $77
.jr_00_3a3d:
    ld   A, $04                                        ;; 00:3a3d $3e $04
    rst  add_hl_a                                      ;; 00:3a3f $c7
    dec  B                                             ;; 00:3a40 $05
    jr   NZ, .jr_00_3a37                               ;; 00:3a41 $20 $f4
    ret                                                ;; 00:3a43 $c9

call_00_3a44:
    ldh  A, [rLCDC]                                    ;; 00:3a44 $f0 $40
    or   A, $20                                        ;; 00:3a46 $f6 $20
    ldh  [rLCDC], A                                    ;; 00:3a48 $e0 $40
    ret                                                ;; 00:3a4a $c9

call_00_3a4b:
    ldh  A, [rLCDC]                                    ;; 00:3a4b $f0 $40
    and  A, $df                                        ;; 00:3a4d $e6 $df
    ldh  [rLCDC], A                                    ;; 00:3a4f $e0 $40
    ret                                                ;; 00:3a51 $c9

call_00_3a52:
    ldh  A, [rLCDC]                                    ;; 00:3a52 $f0 $40
    or   A, $01                                        ;; 00:3a54 $f6 $01
    ldh  [rLCDC], A                                    ;; 00:3a56 $e0 $40
    ret                                                ;; 00:3a58 $c9

call_00_3a59:
    ldh  A, [rLCDC]                                    ;; 00:3a59 $f0 $40
    and  A, $fe                                        ;; 00:3a5b $e6 $fe
    ldh  [rLCDC], A                                    ;; 00:3a5d $e0 $40
    ret                                                ;; 00:3a5f $c9

call_00_3a60:
    push AF                                            ;; 00:3a60 $f5
    ld   A, $0f                                        ;; 00:3a61 $3e $0f
    rst  pushActiveBankSafe                            ;; 00:3a63 $e7
    di                                                 ;; 00:3a64 $f3
    call runSoundEngineReal                            ;; 00:3a65 $cd $06 $40
    rst  popActiveBankSafe                             ;; 00:3a68 $ef
    pop  AF                                            ;; 00:3a69 $f1
    ret                                                ;; 00:3a6a $c9

call_00_3a6b:
    ld   A, $01                                        ;; 00:3a6b $3e $01

call_00_3a6d:
    ldh  [hFF95], A                                    ;; 00:3a6d $e0 $95
    jr   .jr_00_3a74                                   ;; 00:3a6f $18 $03
.jr_00_3a71:
    short_halt                                         ;; 00:3a71 $76
    ldh  A, [hFF95]                                    ;; 00:3a72 $f0 $95
.jr_00_3a74:
    and  A, A                                          ;; 00:3a74 $a7
    jr   NZ, .jr_00_3a71                               ;; 00:3a75 $20 $fa
    ret                                                ;; 00:3a77 $c9

call_00_3a78:
    ldh  A, [rSTAT]                                    ;; 00:3a78 $f0 $41
    and  A, $03                                        ;; 00:3a7a $e6 $03
    jr   NZ, call_00_3a78                              ;; 00:3a7c $20 $fa
    ret                                                ;; 00:3a7e $c9

call_00_3a7f:
    call call_00_3c03                                  ;; 00:3a7f $cd $03 $3c
    ld   A, [HL]                                       ;; 00:3a82 $7e
    and  A, A                                          ;; 00:3a83 $a7
    ret  Z                                             ;; 00:3a84 $c8
    ldh  [hFFCB], A                                    ;; 00:3a85 $e0 $cb
    call call_00_3c0b                                  ;; 00:3a87 $cd $0b $3c
    ld   A, [HL+]                                      ;; 00:3a8a $2a
    ldh  [hFFCC], A                                    ;; 00:3a8b $e0 $cc
    ld   A, [HL]                                       ;; 00:3a8d $7e
    ldh  [hFFCD], A                                    ;; 00:3a8e $e0 $cd
    call call_00_3c14                                  ;; 00:3a90 $cd $14 $3c
    ld   A, [HL+]                                      ;; 00:3a93 $2a
    ldh  [hFFCE], A                                    ;; 00:3a94 $e0 $ce
    ld   A, [HL]                                       ;; 00:3a96 $7e
    ldh  [hFFCF], A                                    ;; 00:3a97 $e0 $cf
    call call_00_3c1d                                  ;; 00:3a99 $cd $1d $3c
    ld   A, [HL]                                       ;; 00:3a9c $7e
    ldh  [hFFD0], A                                    ;; 00:3a9d $e0 $d0
    call call_00_3c25                                  ;; 00:3a9f $cd $25 $3c
    ld   A, [HL+]                                      ;; 00:3aa2 $2a
    ldh  [hFFD1], A                                    ;; 00:3aa3 $e0 $d1
    ld   A, [HL]                                       ;; 00:3aa5 $7e
    and  A, A                                          ;; 00:3aa6 $a7
    ret  Z                                             ;; 00:3aa7 $c8
    ldh  [hFFD2], A                                    ;; 00:3aa8 $e0 $d2
    call call_00_3c2e                                  ;; 00:3aaa $cd $2e $3c
    ld   A, [HL]                                       ;; 00:3aad $7e
    ldh  [hFFD3], A                                    ;; 00:3aae $e0 $d3
    ld   A, [wCA04]                                    ;; 00:3ab0 $fa $04 $ca
    ld   B, A                                          ;; 00:3ab3 $47
    ld   A, [wCA05]                                    ;; 00:3ab4 $fa $05 $ca
    ld   C, A                                          ;; 00:3ab7 $4f
    ld   HL, hFF92                                     ;; 00:3ab8 $21 $92 $ff
    ldh  A, [hFFCC]                                    ;; 00:3abb $f0 $cc
    sub  A, [HL]                                       ;; 00:3abd $96
    cp   A, $e0                                        ;; 00:3abe $fe $e0
    ret  NC                                            ;; 00:3ac0 $d0
    ldh  A, [hFFCC]                                    ;; 00:3ac1 $f0 $cc
    sub  A, [HL]                                       ;; 00:3ac3 $96
    ldh  [hFFCC], A                                    ;; 00:3ac4 $e0 $cc
    ld   HL, wCA03                                     ;; 00:3ac6 $21 $03 $ca
    ldh  A, [hFFCD]                                    ;; 00:3ac9 $f0 $cd
    sbc  A, [HL]                                       ;; 00:3acb $9e
    and  A, B                                          ;; 00:3acc $a0
    ldh  [hFFCD], A                                    ;; 00:3acd $e0 $cd
    ret  NZ                                            ;; 00:3acf $c0
    ld   HL, hFF91                                     ;; 00:3ad0 $21 $91 $ff
    ldh  A, [hFFCE]                                    ;; 00:3ad3 $f0 $ce
    sub  A, [HL]                                       ;; 00:3ad5 $96
    cp   A, $e0                                        ;; 00:3ad6 $fe $e0
    ret  NC                                            ;; 00:3ad8 $d0
    ldh  A, [hFFCE]                                    ;; 00:3ad9 $f0 $ce
    sub  A, [HL]                                       ;; 00:3adb $96
    ldh  [hFFCE], A                                    ;; 00:3adc $e0 $ce
    ld   HL, wCA02                                     ;; 00:3ade $21 $02 $ca
    ldh  A, [hFFCF]                                    ;; 00:3ae1 $f0 $cf
    sbc  A, [HL]                                       ;; 00:3ae3 $9e
    and  A, C                                          ;; 00:3ae4 $a1
    ldh  [hFFCF], A                                    ;; 00:3ae5 $e0 $cf
    ret  NZ                                            ;; 00:3ae7 $c0
    ld   HL, hFFD0                                     ;; 00:3ae8 $21 $d0 $ff
    sla  [HL]                                          ;; 00:3aeb $cb $26
    ldh  A, [hFFD1]                                    ;; 00:3aed $f0 $d1
    add  A, [HL]                                       ;; 00:3aef $86
    ld   L, A                                          ;; 00:3af0 $6f
    ldh  A, [hFFD2]                                    ;; 00:3af1 $f0 $d2
    adc  A, $00                                        ;; 00:3af3 $ce $00
    ld   H, A                                          ;; 00:3af5 $67
    ld   A, [HL+]                                      ;; 00:3af6 $2a
    ld   H, [HL]                                       ;; 00:3af7 $66
    ld   L, A                                          ;; 00:3af8 $6f
    ld   A, [HL+]                                      ;; 00:3af9 $2a
    ld   C, A                                          ;; 00:3afa $4f
    and  A, A                                          ;; 00:3afb $a7
    ret  Z                                             ;; 00:3afc $c8
    ldh  A, [hFF97]                                    ;; 00:3afd $f0 $97
    ld   D, $c0                                        ;; 00:3aff $16 $c0
    ld   E, A                                          ;; 00:3b01 $5f
.jr_00_3b02:
    cp   A, $9c                                        ;; 00:3b02 $fe $9c
    ret  NC                                            ;; 00:3b04 $d0
    ldh  A, [hFFCC]                                    ;; 00:3b05 $f0 $cc
    add  A, [HL]                                       ;; 00:3b07 $86
    ld   [DE], A                                       ;; 00:3b08 $12
    inc  HL                                            ;; 00:3b09 $23
    inc  E                                             ;; 00:3b0a $1c
    ldh  A, [hFFCE]                                    ;; 00:3b0b $f0 $ce
    add  A, [HL]                                       ;; 00:3b0d $86
    ld   [DE], A                                       ;; 00:3b0e $12
    inc  HL                                            ;; 00:3b0f $23
    inc  E                                             ;; 00:3b10 $1c
    ld   A, [HL]                                       ;; 00:3b11 $7e
    cp   A, $6f                                        ;; 00:3b12 $fe $6f
    jr   Z, .jr_00_3b1a                                ;; 00:3b14 $28 $04
    cp   A, $8f                                        ;; 00:3b16 $fe $8f
    jr   NZ, .jr_00_3b1e                               ;; 00:3b18 $20 $04
.jr_00_3b1a:
    ld   A, $6f                                        ;; 00:3b1a $3e $6f
    jr   .jr_00_3b20                                   ;; 00:3b1c $18 $02
.jr_00_3b1e:
    and  A, $0f                                        ;; 00:3b1e $e6 $0f
.jr_00_3b20:
    push HL                                            ;; 00:3b20 $e5
    ld   HL, hFFD3                                     ;; 00:3b21 $21 $d3 $ff
    add  A, [HL]                                       ;; 00:3b24 $86
    pop  HL                                            ;; 00:3b25 $e1
    ld   [DE], A                                       ;; 00:3b26 $12
    inc  E                                             ;; 00:3b27 $1c
    ld   A, [HL+]                                      ;; 00:3b28 $2a
    cp   A, $6f                                        ;; 00:3b29 $fe $6f
    jr   Z, .jr_00_3b31                                ;; 00:3b2b $28 $04
    cp   A, $8f                                        ;; 00:3b2d $fe $8f
    jr   NZ, .jr_00_3b33                               ;; 00:3b2f $20 $02
.jr_00_3b31:
    sub  A, $6f                                        ;; 00:3b31 $d6 $6f
.jr_00_3b33:
    ld   [DE], A                                       ;; 00:3b33 $12
    inc  E                                             ;; 00:3b34 $1c
    ldh  A, [hFF97]                                    ;; 00:3b35 $f0 $97
    add  A, $04                                        ;; 00:3b37 $c6 $04
    ldh  [hFF97], A                                    ;; 00:3b39 $e0 $97
    dec  C                                             ;; 00:3b3b $0d
    jr   NZ, .jr_00_3b02                               ;; 00:3b3c $20 $c4
    ret                                                ;; 00:3b3e $c9

call_00_3b3f:
    call call_00_3c03                                  ;; 00:3b3f $cd $03 $3c
    ld   A, [HL]                                       ;; 00:3b42 $7e
    and  A, A                                          ;; 00:3b43 $a7
    ret  Z                                             ;; 00:3b44 $c8
    ldh  [hFFCB], A                                    ;; 00:3b45 $e0 $cb
    call call_00_3c0b                                  ;; 00:3b47 $cd $0b $3c
    ld   A, [HL+]                                      ;; 00:3b4a $2a
    ldh  [hFFCC], A                                    ;; 00:3b4b $e0 $cc
    ld   A, [HL]                                       ;; 00:3b4d $7e
    ldh  [hFFCD], A                                    ;; 00:3b4e $e0 $cd
    call call_00_3c14                                  ;; 00:3b50 $cd $14 $3c
    ld   A, [HL+]                                      ;; 00:3b53 $2a
    ldh  [hFFCE], A                                    ;; 00:3b54 $e0 $ce
    ld   A, [HL]                                       ;; 00:3b56 $7e
    ldh  [hFFCF], A                                    ;; 00:3b57 $e0 $cf
    call call_00_3c1d                                  ;; 00:3b59 $cd $1d $3c
    ld   A, [HL]                                       ;; 00:3b5c $7e
    ldh  [hFFD0], A                                    ;; 00:3b5d $e0 $d0
    call call_00_3c25                                  ;; 00:3b5f $cd $25 $3c
    ld   A, [HL+]                                      ;; 00:3b62 $2a
    ldh  [hFFD1], A                                    ;; 00:3b63 $e0 $d1
    ld   A, [HL]                                       ;; 00:3b65 $7e
    and  A, A                                          ;; 00:3b66 $a7
    ret  Z                                             ;; 00:3b67 $c8
    ldh  [hFFD2], A                                    ;; 00:3b68 $e0 $d2
    call call_00_3c2e                                  ;; 00:3b6a $cd $2e $3c
    ld   A, [HL]                                       ;; 00:3b6d $7e
    ldh  [hFFD3], A                                    ;; 00:3b6e $e0 $d3
    ld   A, [wCA04]                                    ;; 00:3b70 $fa $04 $ca
    ld   B, A                                          ;; 00:3b73 $47
    ld   A, [wCA05]                                    ;; 00:3b74 $fa $05 $ca
    ld   C, A                                          ;; 00:3b77 $4f
    ld   HL, hFF92                                     ;; 00:3b78 $21 $92 $ff
    ldh  A, [hFFCC]                                    ;; 00:3b7b $f0 $cc
    sub  A, [HL]                                       ;; 00:3b7d $96
    cp   A, $f8                                        ;; 00:3b7e $fe $f8
    ret  NC                                            ;; 00:3b80 $d0
    ldh  A, [hFFCC]                                    ;; 00:3b81 $f0 $cc
    sub  A, [HL]                                       ;; 00:3b83 $96
    ldh  [hFFCC], A                                    ;; 00:3b84 $e0 $cc
    ld   HL, wCA03                                     ;; 00:3b86 $21 $03 $ca
    ldh  A, [hFFCD]                                    ;; 00:3b89 $f0 $cd
    sbc  A, [HL]                                       ;; 00:3b8b $9e
    and  A, B                                          ;; 00:3b8c $a0
    ldh  [hFFCD], A                                    ;; 00:3b8d $e0 $cd
    ret  NZ                                            ;; 00:3b8f $c0
    ld   HL, hFF91                                     ;; 00:3b90 $21 $91 $ff
    ldh  A, [hFFCE]                                    ;; 00:3b93 $f0 $ce
    sub  A, [HL]                                       ;; 00:3b95 $96
    cp   A, $f8                                        ;; 00:3b96 $fe $f8
    ret  NC                                            ;; 00:3b98 $d0
    ldh  A, [hFFCE]                                    ;; 00:3b99 $f0 $ce
    sub  A, [HL]                                       ;; 00:3b9b $96
    ldh  [hFFCE], A                                    ;; 00:3b9c $e0 $ce
    ld   HL, wCA02                                     ;; 00:3b9e $21 $02 $ca
    ldh  A, [hFFCF]                                    ;; 00:3ba1 $f0 $cf
    sbc  A, [HL]                                       ;; 00:3ba3 $9e
    and  A, C                                          ;; 00:3ba4 $a1
    ldh  [hFFCF], A                                    ;; 00:3ba5 $e0 $cf
    ret  NZ                                            ;; 00:3ba7 $c0
    ldh  A, [hFFD1]                                    ;; 00:3ba8 $f0 $d1
    ld   L, A                                          ;; 00:3baa $6f
    ldh  A, [hFFD2]                                    ;; 00:3bab $f0 $d2
    ld   H, A                                          ;; 00:3bad $67
    ldh  A, [hFFD0]                                    ;; 00:3bae $f0 $d0
    and  A, $01                                        ;; 00:3bb0 $e6 $01
    call call_00_3741                                  ;; 00:3bb2 $cd $41 $37
    ld   D, H                                          ;; 00:3bb5 $54
    ld   E, L                                          ;; 00:3bb6 $5d
    ld   C, $04                                        ;; 00:3bb7 $0e $04
    ldh  A, [hFF97]                                    ;; 00:3bb9 $f0 $97
    ld   L, A                                          ;; 00:3bbb $6f
    ld   H, $c0                                        ;; 00:3bbc $26 $c0
    ldh  A, [hFF97]                                    ;; 00:3bbe $f0 $97
.jr_00_3bc0:
    cp   A, $9c                                        ;; 00:3bc0 $fe $9c
    ret  NC                                            ;; 00:3bc2 $d0
    ld   A, [DE]                                       ;; 00:3bc3 $1a
    swap A                                             ;; 00:3bc4 $cb $37
    and  A, $0f                                        ;; 00:3bc6 $e6 $0f
    ld   B, A                                          ;; 00:3bc8 $47
    ldh  A, [hFFCC]                                    ;; 00:3bc9 $f0 $cc
    add  A, B                                          ;; 00:3bcb $80
    ld   [HL+], A                                      ;; 00:3bcc $22
    ld   A, [DE]                                       ;; 00:3bcd $1a
    and  A, $0f                                        ;; 00:3bce $e6 $0f
    ld   B, A                                          ;; 00:3bd0 $47
    ldh  A, [hFFCE]                                    ;; 00:3bd1 $f0 $ce
    dec  A                                             ;; 00:3bd3 $3d
    add  A, B                                          ;; 00:3bd4 $80
    ld   [HL+], A                                      ;; 00:3bd5 $22
    inc  DE                                            ;; 00:3bd6 $13
    push HL                                            ;; 00:3bd7 $e5
    ld   A, [DE]                                       ;; 00:3bd8 $1a
    and  A, $0f                                        ;; 00:3bd9 $e6 $0f
    ld   HL, hFFD3                                     ;; 00:3bdb $21 $d3 $ff
    add  A, [HL]                                       ;; 00:3bde $86
    pop  HL                                            ;; 00:3bdf $e1
    ld   [HL+], A                                      ;; 00:3be0 $22
    ld   A, [DE]                                       ;; 00:3be1 $1a
    and  A, $20                                        ;; 00:3be2 $e6 $20
    ld   B, A                                          ;; 00:3be4 $47
    ld   A, C                                          ;; 00:3be5 $79
    rrca                                               ;; 00:3be6 $0f
    jr   NC, .jr_00_3bf2                               ;; 00:3be7 $30 $09
    ldh  A, [hFFD0]                                    ;; 00:3be9 $f0 $d0
    and  A, $02                                        ;; 00:3beb $e6 $02
    rrca                                               ;; 00:3bed $0f
    rrca                                               ;; 00:3bee $0f
    or   A, B                                          ;; 00:3bef $b0
    jr   .jr_00_3bfa                                   ;; 00:3bf0 $18 $08
.jr_00_3bf2:
    ldh  A, [hFFD0]                                    ;; 00:3bf2 $f0 $d0
    and  A, $04                                        ;; 00:3bf4 $e6 $04
    rrca                                               ;; 00:3bf6 $0f
    rrca                                               ;; 00:3bf7 $0f
    rrca                                               ;; 00:3bf8 $0f
    or   A, B                                          ;; 00:3bf9 $b0
.jr_00_3bfa:
    ld   [HL+], A                                      ;; 00:3bfa $22
    inc  DE                                            ;; 00:3bfb $13
    ld   A, L                                          ;; 00:3bfc $7d
    ldh  [hFF97], A                                    ;; 00:3bfd $e0 $97
    dec  C                                             ;; 00:3bff $0d
    jr   NZ, .jr_00_3bc0                               ;; 00:3c00 $20 $be
    ret                                                ;; 00:3c02 $c9

call_00_3c03:
    ldh  A, [hFF96]                                    ;; 00:3c03 $f0 $96
    ld   HL, wC200                                     ;; 00:3c05 $21 $00 $c2
    add  A, L                                          ;; 00:3c08 $85
    ld   L, A                                          ;; 00:3c09 $6f
    ret                                                ;; 00:3c0a $c9

call_00_3c0b:
    ldh  A, [hFF96]                                    ;; 00:3c0b $f0 $96
    add  A, A                                          ;; 00:3c0d $87
    ld   HL, wC210                                     ;; 00:3c0e $21 $10 $c2
    add  A, L                                          ;; 00:3c11 $85
    ld   L, A                                          ;; 00:3c12 $6f
    ret                                                ;; 00:3c13 $c9

call_00_3c14:
    ldh  A, [hFF96]                                    ;; 00:3c14 $f0 $96
    add  A, A                                          ;; 00:3c16 $87
    ld   HL, wC230                                     ;; 00:3c17 $21 $30 $c2
    add  A, L                                          ;; 00:3c1a $85
    ld   L, A                                          ;; 00:3c1b $6f
    ret                                                ;; 00:3c1c $c9

call_00_3c1d:
    ldh  A, [hFF96]                                    ;; 00:3c1d $f0 $96
    ld   HL, wC250                                     ;; 00:3c1f $21 $50 $c2
    add  A, L                                          ;; 00:3c22 $85
    ld   L, A                                          ;; 00:3c23 $6f
    ret                                                ;; 00:3c24 $c9

call_00_3c25:
    ldh  A, [hFF96]                                    ;; 00:3c25 $f0 $96
    add  A, A                                          ;; 00:3c27 $87
    ld   HL, wC260                                     ;; 00:3c28 $21 $60 $c2
    add  A, L                                          ;; 00:3c2b $85
    ld   L, A                                          ;; 00:3c2c $6f
    ret                                                ;; 00:3c2d $c9

call_00_3c2e:
    ldh  A, [hFF96]                                    ;; 00:3c2e $f0 $96
    ld   HL, wC280                                     ;; 00:3c30 $21 $80 $c2
    add  A, L                                          ;; 00:3c33 $85
    ld   L, A                                          ;; 00:3c34 $6f
    ret                                                ;; 00:3c35 $c9

call_00_3c36:
    ldh  A, [hFF96]                                    ;; 00:3c36 $f0 $96
    add  A, A                                          ;; 00:3c38 $87
    ld   HL, wC290                                     ;; 00:3c39 $21 $90 $c2
    add  A, L                                          ;; 00:3c3c $85
    ld   L, A                                          ;; 00:3c3d $6f
    ret                                                ;; 00:3c3e $c9

call_00_3c3f:
    ldh  A, [hFF96]                                    ;; 00:3c3f $f0 $96
    add  A, A                                          ;; 00:3c41 $87
    ld   HL, wC2B0                                     ;; 00:3c42 $21 $b0 $c2
    add  A, L                                          ;; 00:3c45 $85
    ld   L, A                                          ;; 00:3c46 $6f
    ret                                                ;; 00:3c47 $c9

call_00_3c48:
    ldh  A, [hFF96]                                    ;; 00:3c48 $f0 $96
    ld   HL, wC2D0                                     ;; 00:3c4a $21 $d0 $c2
    add  A, L                                          ;; 00:3c4d $85
    ld   L, A                                          ;; 00:3c4e $6f
    ret                                                ;; 00:3c4f $c9

call_00_3c50:
    ldh  A, [hFF96]                                    ;; 00:3c50 $f0 $96
    ld   HL, wC2E0                                     ;; 00:3c52 $21 $e0 $c2
    add  A, L                                          ;; 00:3c55 $85
    ld   L, A                                          ;; 00:3c56 $6f
    ret                                                ;; 00:3c57 $c9

call_00_3c58:
    ldh  A, [hFF96]                                    ;; 00:3c58 $f0 $96
    ld   HL, wC2F0                                     ;; 00:3c5a $21 $f0 $c2
    add  A, L                                          ;; 00:3c5d $85
    ld   L, A                                          ;; 00:3c5e $6f
    ret                                                ;; 00:3c5f $c9

call_00_3c60:
    ldh  A, [hFF96]                                    ;; 00:3c60 $f0 $96
    ld   HL, wC300                                     ;; 00:3c62 $21 $00 $c3
    add  A, L                                          ;; 00:3c65 $85
    ld   L, A                                          ;; 00:3c66 $6f
    ret                                                ;; 00:3c67 $c9

call_00_3c68:
    ldh  A, [hFF96]                                    ;; 00:3c68 $f0 $96
    ld   HL, wC310                                     ;; 00:3c6a $21 $10 $c3
    add  A, L                                          ;; 00:3c6d $85
    ld   L, A                                          ;; 00:3c6e $6f
    ret                                                ;; 00:3c6f $c9

call_00_3c70:
    ldh  A, [hFF96]                                    ;; 00:3c70 $f0 $96
    ld   HL, wC320                                     ;; 00:3c72 $21 $20 $c3
    add  A, L                                          ;; 00:3c75 $85
    ld   L, A                                          ;; 00:3c76 $6f
    ret                                                ;; 00:3c77 $c9

call_00_3c78:
    ldh  A, [hFF96]                                    ;; 00:3c78 $f0 $96
    ld   HL, wC330                                     ;; 00:3c7a $21 $30 $c3
    add  A, L                                          ;; 00:3c7d $85
    ld   L, A                                          ;; 00:3c7e $6f
    ret                                                ;; 00:3c7f $c9

call_00_3c80:
    ldh  A, [hFF96]                                    ;; 00:3c80 $f0 $96
    ld   HL, wC340                                     ;; 00:3c82 $21 $40 $c3
    add  A, L                                          ;; 00:3c85 $85
    ld   L, A                                          ;; 00:3c86 $6f
    ret                                                ;; 00:3c87 $c9

call_00_3c88:
    ldh  A, [hFF96]                                    ;; 00:3c88 $f0 $96
    ld   HL, wC350                                     ;; 00:3c8a $21 $50 $c3
    add  A, L                                          ;; 00:3c8d $85
    ld   L, A                                          ;; 00:3c8e $6f
    ret                                                ;; 00:3c8f $c9

call_00_3c90:
    ldh  A, [hFF96]                                    ;; 00:3c90 $f0 $96
    ld   HL, wC360                                     ;; 00:3c92 $21 $60 $c3
    add  A, L                                          ;; 00:3c95 $85
    ld   L, A                                          ;; 00:3c96 $6f
    ret                                                ;; 00:3c97 $c9

call_00_3c98:
    ldh  A, [hFF96]                                    ;; 00:3c98 $f0 $96
    ld   HL, wC370                                     ;; 00:3c9a $21 $70 $c3
    add  A, L                                          ;; 00:3c9d $85
    ld   L, A                                          ;; 00:3c9e $6f
    ret                                                ;; 00:3c9f $c9

call_00_3ca0:
    push HL                                            ;; 00:3ca0 $e5
    ld   HL, wC760                                     ;; 00:3ca1 $21 $60 $c7
    jr   jr_00_3cd0                                    ;; 00:3ca4 $18 $2a

call_00_3ca6:
    push HL                                            ;; 00:3ca6 $e5
    ld   HL, wC760                                     ;; 00:3ca7 $21 $60 $c7
    jr   jr_00_3cd8                                    ;; 00:3caa $18 $2c
    db   $e5, $21, $60, $c7, $18, $2e                  ;; 00:3cac ??????

call_00_3cb2:
    push HL                                            ;; 00:3cb2 $e5
    ld   HL, wC760                                     ;; 00:3cb3 $21 $60 $c7
    jr   jr_00_3cf3                                    ;; 00:3cb6 $18 $3b

call_00_3cb8:
    push HL                                            ;; 00:3cb8 $e5
    ld   HL, wC780                                     ;; 00:3cb9 $21 $80 $c7
    jr   jr_00_3cd0                                    ;; 00:3cbc $18 $12
    db   $e5, $21, $80, $c7, $18, $14, $e5, $21        ;; 00:3cbe ????????
    db   $80, $c7, $18, $16                            ;; 00:3cc6 ????

call_00_3cca:
    push HL                                            ;; 00:3cca $e5
    ld   HL, wC780                                     ;; 00:3ccb $21 $80 $c7
    jr   jr_00_3cf3                                    ;; 00:3cce $18 $23

jr_00_3cd0:
    push BC                                            ;; 00:3cd0 $c5
    ld   B, $01                                        ;; 00:3cd1 $06 $01
    call call_00_3d0d                                  ;; 00:3cd3 $cd $0d $3d
    jr   jr_00_3cf7                                    ;; 00:3cd6 $18 $1f

jr_00_3cd8:
    push BC                                            ;; 00:3cd8 $c5
    ld   B, $00                                        ;; 00:3cd9 $06 $00
    call call_00_3d0d                                  ;; 00:3cdb $cd $0d $3d
    jr   jr_00_3cf7                                    ;; 00:3cde $18 $17
    db   $c5, $e5, $f5, $cd, $fa, $3c, $3e, $00        ;; 00:3ce0 ????????
    db   $17, $ee, $01, $47, $f1, $e1, $cd, $0d        ;; 00:3ce8 ????????
    db   $3d, $18, $04                                 ;; 00:3cf0 ???

jr_00_3cf3:
    push BC                                            ;; 00:3cf3 $c5
    call call_00_3cfa                                  ;; 00:3cf4 $cd $fa $3c

jr_00_3cf7:
    pop  BC                                            ;; 00:3cf7 $c1
    pop  HL                                            ;; 00:3cf8 $e1
    ret                                                ;; 00:3cf9 $c9

call_00_3cfa:
    ld   B, A                                          ;; 00:3cfa $47
    srl  A                                             ;; 00:3cfb $cb $3f
    srl  A                                             ;; 00:3cfd $cb $3f
    srl  A                                             ;; 00:3cff $cb $3f
    rst  add_hl_a                                      ;; 00:3d01 $c7
    ld   A, B                                          ;; 00:3d02 $78
    and  A, $07                                        ;; 00:3d03 $e6 $07
    inc  A                                             ;; 00:3d05 $3c
    ld   B, A                                          ;; 00:3d06 $47
    ld   A, [HL]                                       ;; 00:3d07 $7e
.jr_00_3d08:
    rlca                                               ;; 00:3d08 $07
    dec  B                                             ;; 00:3d09 $05
    jr   NZ, .jr_00_3d08                               ;; 00:3d0a $20 $fc
    ret                                                ;; 00:3d0c $c9

call_00_3d0d:
    ld   C, A                                          ;; 00:3d0d $4f
    srl  A                                             ;; 00:3d0e $cb $3f
    srl  A                                             ;; 00:3d10 $cb $3f
    srl  A                                             ;; 00:3d12 $cb $3f
    rst  add_hl_a                                      ;; 00:3d14 $c7
    ld   A, C                                          ;; 00:3d15 $79
    and  A, $07                                        ;; 00:3d16 $e6 $07
    inc  A                                             ;; 00:3d18 $3c
    ld   C, A                                          ;; 00:3d19 $4f
    push BC                                            ;; 00:3d1a $c5
    ld   B, A                                          ;; 00:3d1b $47
    ld   A, [HL]                                       ;; 00:3d1c $7e
.jr_00_3d1d:
    rlca                                               ;; 00:3d1d $07
    dec  B                                             ;; 00:3d1e $05
    jr   NZ, .jr_00_3d1d                               ;; 00:3d1f $20 $fc
    pop  BC                                            ;; 00:3d21 $c1
    and  A, $fe                                        ;; 00:3d22 $e6 $fe
    or   A, B                                          ;; 00:3d24 $b0
.jr_00_3d25:
    rrca                                               ;; 00:3d25 $0f
    dec  C                                             ;; 00:3d26 $0d
    jr   NZ, .jr_00_3d25                               ;; 00:3d27 $20 $fc
    ld   [HL], A                                       ;; 00:3d29 $77
    ret                                                ;; 00:3d2a $c9

call_00_3d2b:
    ldh  A, [hFF91]                                    ;; 00:3d2b $f0 $91
    add  A, $08                                        ;; 00:3d2d $c6 $08
    ldh  [rSCX], A                                     ;; 00:3d2f $e0 $43
    ldh  A, [hFF92]                                    ;; 00:3d31 $f0 $92
    add  A, $10                                        ;; 00:3d33 $c6 $10
    ldh  [rSCY], A                                     ;; 00:3d35 $e0 $42
    ret                                                ;; 00:3d37 $c9

call_00_3d38:
    ldh  A, [rIE]                                      ;; 00:3d38 $f0 $ff
    or   A, $02                                        ;; 00:3d3a $f6 $02
    ldh  [rIE], A                                      ;; 00:3d3c $e0 $ff
    ret                                                ;; 00:3d3e $c9
    db   $f0, $ff, $e6, $fd, $e0, $ff, $c9             ;; 00:3d3f ???????

call_00_3d46:
    ld   A, L                                          ;; 00:3d46 $7d
    ld   [wC0BA], A                                    ;; 00:3d47 $ea $ba $c0
    ld   A, H                                          ;; 00:3d4a $7c
    ld   [wC0BB], A                                    ;; 00:3d4b $ea $bb $c0

call_00_3d4e:
    ld   A, $c3                                        ;; 00:3d4e $3e $c3
    ld   [wC0B9], A                                    ;; 00:3d50 $ea $b9 $c0
    ret                                                ;; 00:3d53 $c9

call_00_3d54:
    ld   A, $c9                                        ;; 00:3d54 $3e $c9
    ld   [wC0B9], A                                    ;; 00:3d56 $ea $b9 $c0
    ret                                                ;; 00:3d59 $c9

call_00_3d5a:
    ld   A, L                                          ;; 00:3d5a $7d
    ld   [wC0BD], A                                    ;; 00:3d5b $ea $bd $c0
    ld   A, H                                          ;; 00:3d5e $7c
    ld   [wC0BE], A                                    ;; 00:3d5f $ea $be $c0

call_00_3d62:
    ld   A, $c3                                        ;; 00:3d62 $3e $c3
    ld   [wC0BC], A                                    ;; 00:3d64 $ea $bc $c0
    ret                                                ;; 00:3d67 $c9

call_00_3d68:
    ld   A, $c9                                        ;; 00:3d68 $3e $c9
    ld   [wC0BC], A                                    ;; 00:3d6a $ea $bc $c0
    ret                                                ;; 00:3d6d $c9

call_00_3d6e:
    ld   BC, wD000                                     ;; 00:3d6e $01 $00 $d0
    jr   call_00_3d76                                  ;; 00:3d71 $18 $03

call_00_3d73:
    ld   BC, wD400                                     ;; 00:3d73 $01 $00 $d4

call_00_3d76:
    ld   A, [wCD3D]                                    ;; 00:3d76 $fa $3d $cd
    push AF                                            ;; 00:3d79 $f5
    xor  A, A                                          ;; 00:3d7a $af
    ld   [wCD3D], A                                    ;; 00:3d7b $ea $3d $cd
    ld   A, E                                          ;; 00:3d7e $7b
    ld   [wC842], A                                    ;; 00:3d7f $ea $42 $c8
    ld   A, D                                          ;; 00:3d82 $7a
    ld   [wC843], A                                    ;; 00:3d83 $ea $43 $c8
    ld   A, C                                          ;; 00:3d86 $79
    ld   [wC844], A                                    ;; 00:3d87 $ea $44 $c8
    ld   A, B                                          ;; 00:3d8a $78
    ld   [wC845], A                                    ;; 00:3d8b $ea $45 $c8
    ld   A, [HL+]                                      ;; 00:3d8e $2a
    inc  A                                             ;; 00:3d8f $3c
    ld   B, A                                          ;; 00:3d90 $47
    ld   A, $04                                        ;; 00:3d91 $3e $04
.jr_00_3d93:
    sla  A                                             ;; 00:3d93 $cb $27
    dec  B                                             ;; 00:3d95 $05
    jr   NZ, .jr_00_3d93                               ;; 00:3d96 $20 $fb
    ld   [wC840], A                                    ;; 00:3d98 $ea $40 $c8
.jr_00_3d9b:
    ld   A, [HL+]                                      ;; 00:3d9b $2a
    ld   [wC841], A                                    ;; 00:3d9c $ea $41 $c8
    ld   C, L                                          ;; 00:3d9f $4d
    ld   B, H                                          ;; 00:3da0 $44
    ld   A, [wC840]                                    ;; 00:3da1 $fa $40 $c8
    srl  A                                             ;; 00:3da4 $cb $3f
    srl  A                                             ;; 00:3da6 $cb $3f
    srl  A                                             ;; 00:3da8 $cb $3f
    ld   E, A                                          ;; 00:3daa $5f
    ld   D, $00                                        ;; 00:3dab $16 $00
    add  HL, DE                                        ;; 00:3dad $19
    ld   DE, wC800                                     ;; 00:3dae $11 $00 $c8
    call call_00_3dec                                  ;; 00:3db1 $cd $ec $3d
    push HL                                            ;; 00:3db4 $e5
    push DE                                            ;; 00:3db5 $d5
    push BC                                            ;; 00:3db6 $c5
    ld   A, [wC844]                                    ;; 00:3db7 $fa $44 $c8
    ld   E, A                                          ;; 00:3dba $5f
    ld   A, [wC845]                                    ;; 00:3dbb $fa $45 $c8
    ld   D, A                                          ;; 00:3dbe $57
    ld   HL, wC800                                     ;; 00:3dbf $21 $00 $c8
    ld   A, [wC840]                                    ;; 00:3dc2 $fa $40 $c8
    ld   B, A                                          ;; 00:3dc5 $47
.jr_00_3dc6:
    ld   A, [HL+]                                      ;; 00:3dc6 $2a
    ld   [DE], A                                       ;; 00:3dc7 $12
    inc  DE                                            ;; 00:3dc8 $13
    dec  B                                             ;; 00:3dc9 $05
    jr   NZ, .jr_00_3dc6                               ;; 00:3dca $20 $fa
    ld   A, E                                          ;; 00:3dcc $7b
    ld   [wC844], A                                    ;; 00:3dcd $ea $44 $c8
    ld   A, D                                          ;; 00:3dd0 $7a
    ld   [wC845], A                                    ;; 00:3dd1 $ea $45 $c8
    pop  BC                                            ;; 00:3dd4 $c1
    pop  DE                                            ;; 00:3dd5 $d1
    pop  HL                                            ;; 00:3dd6 $e1
    push HL                                            ;; 00:3dd7 $e5
    push DE                                            ;; 00:3dd8 $d5
    ld   D, H                                          ;; 00:3dd9 $54
    ld   E, L                                          ;; 00:3dda $5d
    ld   HL, wC842                                     ;; 00:3ddb $21 $42 $c8
    ld   A, E                                          ;; 00:3dde $7b
    sub  A, [HL]                                       ;; 00:3ddf $96
    inc  HL                                            ;; 00:3de0 $23
    ld   A, D                                          ;; 00:3de1 $7a
    sbc  A, [HL]                                       ;; 00:3de2 $9e
    pop  DE                                            ;; 00:3de3 $d1
    pop  HL                                            ;; 00:3de4 $e1
    jr   C, .jr_00_3d9b                                ;; 00:3de5 $38 $b4
    pop  AF                                            ;; 00:3de7 $f1
    ld   [wCD3D], A                                    ;; 00:3de8 $ea $3d $cd
    ret                                                ;; 00:3deb $c9

call_00_3dec:
    ld   A, [wC840]                                    ;; 00:3dec $fa $40 $c8
    cp   A, $08                                        ;; 00:3def $fe $08
    jr   Z, call_00_3e07                               ;; 00:3df1 $28 $14
    cp   A, $10                                        ;; 00:3df3 $fe $10
    jr   Z, call_00_3e03                               ;; 00:3df5 $28 $0c
    cp   A, $20                                        ;; 00:3df7 $fe $20
    jr   Z, call_00_3dff                               ;; 00:3df9 $28 $04
    call call_00_3dff                                  ;; 00:3dfb $cd $ff $3d
    inc  BC                                            ;; 00:3dfe $03

call_00_3dff:
    call call_00_3e03                                  ;; 00:3dff $cd $03 $3e
    inc  BC                                            ;; 00:3e02 $03

call_00_3e03:
    call call_00_3e07                                  ;; 00:3e03 $cd $07 $3e
    inc  BC                                            ;; 00:3e06 $03

call_00_3e07:
    ld   A, [BC]                                       ;; 00:3e07 $0a
    ld   [wC846], A                                    ;; 00:3e08 $ea $46 $c8
    push BC                                            ;; 00:3e0b $c5
    ld   B, $08                                        ;; 00:3e0c $06 $08
.jr_00_3e0e:
    ld   A, [wC846]                                    ;; 00:3e0e $fa $46 $c8
    sla  A                                             ;; 00:3e11 $cb $27
    ld   [wC846], A                                    ;; 00:3e13 $ea $46 $c8
    jr   C, .jr_00_3e1e                                ;; 00:3e16 $38 $06
    ld   A, [wC841]                                    ;; 00:3e18 $fa $41 $c8
    ld   [DE], A                                       ;; 00:3e1b $12
    jr   .jr_00_3e20                                   ;; 00:3e1c $18 $02
.jr_00_3e1e:
    ld   A, [HL+]                                      ;; 00:3e1e $2a
    ld   [DE], A                                       ;; 00:3e1f $12
.jr_00_3e20:
    inc  DE                                            ;; 00:3e20 $13
    dec  B                                             ;; 00:3e21 $05
    jr   NZ, .jr_00_3e0e                               ;; 00:3e22 $20 $ea
    pop  BC                                            ;; 00:3e24 $c1
    ret                                                ;; 00:3e25 $c9

call_00_3e26:
    ld   A, [wCBFF]                                    ;; 00:3e26 $fa $ff $cb
    and  A, A                                          ;; 00:3e29 $a7
    ret  Z                                             ;; 00:3e2a $c8
    ld   HL, wDC80                                     ;; 00:3e2b $21 $80 $dc
    ld   A, [HL]                                       ;; 00:3e2e $7e
    inc  A                                             ;; 00:3e2f $3c
    and  A, $0f                                        ;; 00:3e30 $e6 $0f
    ld   [HL+], A                                      ;; 00:3e32 $22
    jr   NZ, .jr_00_3e57                               ;; 00:3e33 $20 $22
    ld   A, [HL+]                                      ;; 00:3e35 $2a
    ld   C, A                                          ;; 00:3e36 $4f
    ld   B, [HL]                                       ;; 00:3e37 $46
    ld   HL, wDC85                                     ;; 00:3e38 $21 $85 $dc
.jr_00_3e3b:
    srl  C                                             ;; 00:3e3b $cb $39
    jr   C, .jr_00_3e65                                ;; 00:3e3d $38 $26
    ld   D, H                                          ;; 00:3e3f $54
    ld   E, L                                          ;; 00:3e40 $5d
    push BC                                            ;; 00:3e41 $c5
    ld   BC, $04                                       ;; 00:3e42 $01 $04 $00
    add  HL, BC                                        ;; 00:3e45 $09
    ld   C, [HL]                                       ;; 00:3e46 $4e
    ld   A, [DE]                                       ;; 00:3e47 $1a
    ld   [HL+], A                                      ;; 00:3e48 $22
    ld   A, C                                          ;; 00:3e49 $79
    ld   [DE], A                                       ;; 00:3e4a $12
    inc  DE                                            ;; 00:3e4b $13
    ld   A, [HL]                                       ;; 00:3e4c $7e
    xor  A, $20                                        ;; 00:3e4d $ee $20
    ld   [HL+], A                                      ;; 00:3e4f $22
    ld   [DE], A                                       ;; 00:3e50 $12
    inc  HL                                            ;; 00:3e51 $23
    inc  HL                                            ;; 00:3e52 $23
    pop  BC                                            ;; 00:3e53 $c1
.jr_00_3e54:
    dec  B                                             ;; 00:3e54 $05
    jr   NZ, .jr_00_3e3b                               ;; 00:3e55 $20 $e4
.jr_00_3e57:
    ld   HL, wDC82                                     ;; 00:3e57 $21 $82 $dc
    ld   A, [HL+]                                      ;; 00:3e5a $2a
    add  A, A                                          ;; 00:3e5b $87
    add  A, A                                          ;; 00:3e5c $87
    add  A, A                                          ;; 00:3e5d $87
    ld   B, A                                          ;; 00:3e5e $47
    ld   DE, wC078                                     ;; 00:3e5f $11 $78 $c0
    jp   call_00_1f97                                  ;; 00:3e62 $c3 $97 $1f
.jr_00_3e65:
    ld   DE, $08                                       ;; 00:3e65 $11 $08 $00
    add  HL, DE                                        ;; 00:3e68 $19
    jr   .jr_00_3e54                                   ;; 00:3e69 $18 $e9
