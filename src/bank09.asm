;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank09", ROMX[$4000], BANK[$09]
    call call_09_40ad                                  ;; 09:4000 $cd $ad $40
    ld   HL, SP+0                                      ;; 09:4003 $f8 $00
    ld   A, L                                          ;; 09:4005 $7d
    ld   [wCD43], A                                    ;; 09:4006 $ea $43 $cd
    ld   A, H                                          ;; 09:4009 $7c
    ld   [wCD44], A                                    ;; 09:400a $ea $44 $cd
    rst  rst_00_0018                                   ;; 09:400d $df
    db   $05                                           ;; 09:400e .
;@jumptable
    dw   call_09_401f                                  ;; 09:400f pP $00
    dw   call_09_408d                                  ;; 09:4011 pP $01
    dw   call_00_1e83                                  ;; 09:4013 ?? $02
    dw   call_00_1e83                                  ;; 09:4015 ?? $03
    dw   call_09_4056                                  ;; 09:4017 ?? $04
    dw   call_09_4042                                  ;; 09:4019 ?? $05
    dw   call_09_4062                                  ;; 09:401b ?? $06
    dw   call_09_4074                                  ;; 09:401d pP $07

call_09_401f:
    call call_09_4085                                  ;; 09:401f $cd $85 $40
    xor  A, A                                          ;; 09:4022 $af
    ld   [wCD36], A                                    ;; 09:4023 $ea $36 $cd
    ld   HL, call_09_427e                              ;; 09:4026 $21 $7e $42
    push HL                                            ;; 09:4029 $e5
    ld   HL, call_00_358b                              ;; 09:402a $21 $8b $35
    push HL                                            ;; 09:402d $e5
    ld   A, [wCD15]                                    ;; 09:402e $fa $15 $cd
    call doJumptable                                   ;; 09:4031 $cd $3a $37
;@jumptable amount=7
    dw   call_09_4350                                  ;; 09:4034 pP $00
    dw   call_09_435e                                  ;; 09:4036 pP $01
    dw   call_09_4a4a                                  ;; 09:4038 pP $02
    dw   call_09_4377                                  ;; 09:403a pP $03
    dw   call_09_439f                                  ;; 09:403c pP $04
    dw   call_09_43b1                                  ;; 09:403e pP $05
    dw   call_09_43f0                                  ;; 09:4040 pP $06

call_09_4042:
    ld   HL, wCD16                                     ;; 09:4042 $21 $16 $cd
    ld   A, [HL]                                       ;; 09:4045 $7e
    cp   A, $03                                        ;; 09:4046 $fe $03
    jp   Z, call_00_1e83                               ;; 09:4048 $ca $83 $1e
    or   A, A                                          ;; 09:404b $b7
    ld   A, $0c                                        ;; 09:404c $3e $0c
    jr   Z, jr_09_4052                                 ;; 09:404e $28 $02
    ld   A, $03                                        ;; 09:4050 $3e $03

jr_09_4052:
    ld   [HL], A                                       ;; 09:4052 $77
    jp   call_09_427e                                  ;; 09:4053 $c3 $7e $42

call_09_4056:
    call call_09_4085                                  ;; 09:4056 $cd $85 $40
    cp   A, $0c                                        ;; 09:4059 $fe $0c
    ld   A, $0c                                        ;; 09:405b $3e $0c
    jr   NZ, jr_09_4052                                ;; 09:405d $20 $f3
    xor  A, A                                          ;; 09:405f $af
    jr   jr_09_4052                                    ;; 09:4060 $18 $f0

call_09_4062:
    call call_09_4085                                  ;; 09:4062 $cd $85 $40
    ld   HL, wCD15                                     ;; 09:4065 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:4068 $7e
    or   A, A                                          ;; 09:4069 $b7
    jr   Z, .jr_09_406f                                ;; 09:406a $28 $03
    dec  [HL]                                          ;; 09:406c $35
    jr   jr_09_4071                                    ;; 09:406d $18 $02
.jr_09_406f:
    ld   [HL], $06                                     ;; 09:406f $36 $06

jr_09_4071:
    jp   call_09_4264                                  ;; 09:4071 $c3 $64 $42

call_09_4074:
    call call_09_4085                                  ;; 09:4074 $cd $85 $40
    ld   HL, wCD15                                     ;; 09:4077 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:407a $7e
    sub  A, $06                                        ;; 09:407b $d6 $06
    jr   Z, .jr_09_4082                                ;; 09:407d $28 $03
    inc  [HL]                                          ;; 09:407f $34
    jr   jr_09_4071                                    ;; 09:4080 $18 $ef
.jr_09_4082:
    ld   [HL], A                                       ;; 09:4082 $77
    jr   jr_09_4071                                    ;; 09:4083 $18 $ec

call_09_4085:
    ld   HL, wCD16                                     ;; 09:4085 $21 $16 $cd
    ld   A, [HL]                                       ;; 09:4088 $7e
    or   A, A                                          ;; 09:4089 $b7
    ret  NZ                                            ;; 09:408a $c0
    pop  AF                                            ;; 09:408b $f1
    ret                                                ;; 09:408c $c9

call_09_408d:
    pop  HL                                            ;; 09:408d $e1
    pop  HL                                            ;; 09:408e $e1

jp_09_408f:
    rst  rst_00_0018                                   ;; 09:408f $df
    db   $09                                           ;; 09:4090 .
    ld   HL, wCA16                                     ;; 09:4091 $21 $16 $ca
    ld   A, [HL]                                       ;; 09:4094 $7e
    inc  A                                             ;; 09:4095 $3c
    cp   A, $31                                        ;; 09:4096 $fe $31
    ret  C                                             ;; 09:4098 $d8
    ld   [HL], $ff                                     ;; 09:4099 $36 $ff
    ld   HL, wCDE6                                     ;; 09:409b $21 $e6 $cd
    ld   A, [HL+]                                      ;; 09:409e $2a
    ld   H, [HL]                                       ;; 09:409f $66
    ld   L, A                                          ;; 09:40a0 $6f
    ld   A, [wCD34]                                    ;; 09:40a1 $fa $34 $cd
    ld   DE, $101                                      ;; 09:40a4 $11 $01 $01
    ld   BC, $612                                      ;; 09:40a7 $01 $12 $06
    rst  rst_00_0018                                   ;; 09:40aa $df
    db   $a0                                           ;; 09:40ab ?
    ret                                                ;; 09:40ac $c9

call_09_40ad:
    rst  rst_00_0018                                   ;; 09:40ad $df
    db   $0d                                           ;; 09:40ae .
    rst  rst_00_0018                                   ;; 09:40af $df
    db   $18                                           ;; 09:40b0 .
    xor  A, A                                          ;; 09:40b1 $af
    ld   [wCD15], A                                    ;; 09:40b2 $ea $15 $cd
    inc  A                                             ;; 09:40b5 $3c
    ld   [wCD42], A                                    ;; 09:40b6 $ea $42 $cd
    ld   A, $0c                                        ;; 09:40b9 $3e $0c
    ld   [wCD16], A                                    ;; 09:40bb $ea $16 $cd
    call call_09_457d                                  ;; 09:40be $cd $7d $45
    ld   A, $ff                                        ;; 09:40c1 $3e $ff
    ld   [wCA16], A                                    ;; 09:40c3 $ea $16 $ca
    call call_09_427e                                  ;; 09:40c6 $cd $7e $42
    ldh  A, [hFFBA]                                    ;; 09:40c9 $f0 $ba
    ld   [wC7CC], A                                    ;; 09:40cb $ea $cc $c7
    rst  rst_00_0018                                   ;; 09:40ce $df
    db   $b9                                           ;; 09:40cf .
    jp   call_00_3a0c                                  ;; 09:40d0 $c3 $0c $3a
    call call_00_39f3                                  ;; 09:40d3 $cd $f3 $39
    call call_00_1d98                                  ;; 09:40d6 $cd $98 $1d
    rst  rst_00_0018                                   ;; 09:40d9 $df
    db   $39                                           ;; 09:40da .
    rst  rst_00_0018                                   ;; 09:40db $df
    db   $0b                                           ;; 09:40dc .
    ld   A, $08                                        ;; 09:40dd $3e $08
    ld   [wC089], A                                    ;; 09:40df $ea $89 $c0
    ld   [wC08D], A                                    ;; 09:40e2 $ea $8d $c0
    rst  rst_00_0018                                   ;; 09:40e5 $df
    db   $ab                                           ;; 09:40e6 .
    ret                                                ;; 09:40e7 $c9
    xor  A, A                                          ;; 09:40e8 $af
    rst  rst_00_0018                                   ;; 09:40e9 $df
    db   $59                                           ;; 09:40ea .
    di                                                 ;; 09:40eb $f3
    ld   HL, wC000                                     ;; 09:40ec $21 $00 $c0
    ld   BC, $2400                                     ;; 09:40ef $01 $00 $24
    xor  A, A                                          ;; 09:40f2 $af
.jr_09_40f3:
    ld   [HL+], A                                      ;; 09:40f3 $22
    ld   [HL+], A                                      ;; 09:40f4 $22
    ld   [HL], C                                       ;; 09:40f5 $71
    inc  HL                                            ;; 09:40f6 $23
    inc  C                                             ;; 09:40f7 $0c
    ld   [HL+], A                                      ;; 09:40f8 $22
    dec  B                                             ;; 09:40f9 $05
    jr   NZ, .jr_09_40f3                               ;; 09:40fa $20 $f7
    ld   B, $04                                        ;; 09:40fc $06 $04
    ld   DE, $03                                       ;; 09:40fe $11 $03 $00
.jr_09_4101:
    ld   [HL+], A                                      ;; 09:4101 $22
    add  HL, DE                                        ;; 09:4102 $19
    dec  B                                             ;; 09:4103 $05
    jr   NZ, .jr_09_4101                               ;; 09:4104 $20 $fb
    ld   A, [wCD37]                                    ;; 09:4106 $fa $37 $cd
    or   A, A                                          ;; 09:4109 $b7
    jr   Z, call_09_4127                               ;; 09:410a $28 $1b
    ld   HL, data_09_412f                              ;; 09:410c $21 $2f $41
    ld   DE, wC090                                     ;; 09:410f $11 $90 $c0
    call call_00_1f66                                  ;; 09:4112 $cd $66 $1f
    ld   HL, data_09_412f                              ;; 09:4115 $21 $2f $41
    ld   DE, wC050                                     ;; 09:4118 $11 $50 $c0
    call call_00_1f66                                  ;; 09:411b $cd $66 $1f
    ld   HL, wC050                                     ;; 09:411e $21 $50 $c0
    call call_00_1f66                                  ;; 09:4121 $cd $66 $1f
    call call_00_1f66                                  ;; 09:4124 $cd $66 $1f

call_09_4127:
    di                                                 ;; 09:4127 $f3
    ldh  A, [hFF93]                                    ;; 09:4128 $f0 $93
    ld   B, A                                          ;; 09:412a $47
    call call_00_21a9                                  ;; 09:412b $cd $a9 $21
    reti                                               ;; 09:412e $d9

data_09_412f:
    db   $00, $00, $24, $00, $00, $00, $24, $40        ;; 09:412f ........
    db   $00, $00, $24, $20, $00, $00, $24, $60        ;; 09:4137 ........

call_09_413f:
    rst  rst_00_0018                                   ;; 09:413f $df
    db   $49                                           ;; 09:4140 .
    ld   A, [wCD36]                                    ;; 09:4141 $fa $36 $cd
    ld   [wCD15], A                                    ;; 09:4144 $ea $15 $cd
    swap A                                             ;; 09:4147 $cb $37
    ld   B, A                                          ;; 09:4149 $47
    srl  A                                             ;; 09:414a $cb $3f
    add  A, B                                          ;; 09:414c $80
    add  A, $20                                        ;; 09:414d $c6 $20
    cp   A, $80                                        ;; 09:414f $fe $80
    jr   NZ, .jr_09_4155                               ;; 09:4151 $20 $02
    ld   A, $88                                        ;; 09:4153 $3e $88
.jr_09_4155:
    ld   HL, wC080                                     ;; 09:4155 $21 $80 $c0
    ld   [HL+], A                                      ;; 09:4158 $22
    ld   [HL], $10                                     ;; 09:4159 $36 $10
    ld   A, $fe                                        ;; 09:415b $3e $fe
    ld   [wCD36], A                                    ;; 09:415d $ea $36 $cd

call_09_4160:
    ld   A, $20                                        ;; 09:4160 $3e $20
    ld   [wCE28], A                                    ;; 09:4162 $ea $28 $ce

call_09_4165:
    ld   HL, wCD1D                                     ;; 09:4165 $21 $1d $cd
    ld   A, [wCD15]                                    ;; 09:4168 $fa $15 $cd
    ld   [HL+], A                                      ;; 09:416b $22
    ld   A, [wC080]                                    ;; 09:416c $fa $80 $c0
    ld   [HL+], A                                      ;; 09:416f $22
    ld   A, [wC081]                                    ;; 09:4170 $fa $81 $c0
    ld   [HL], A                                       ;; 09:4173 $77
    ld   A, [wCE28]                                    ;; 09:4174 $fa $28 $ce
    and  A, $60                                        ;; 09:4177 $e6 $60
    jr   Z, .jr_09_41b7                                ;; 09:4179 $28 $3c
    ld   HL, wCD16                                     ;; 09:417b $21 $16 $cd
    ld   A, [HL]                                       ;; 09:417e $7e
    push AF                                            ;; 09:417f $f5
    ld   [HL], $00                                     ;; 09:4180 $36 $00
    call call_09_425d                                  ;; 09:4182 $cd $5d $42
    ld   HL, wCD36                                     ;; 09:4185 $21 $36 $cd
    ld   A, [HL]                                       ;; 09:4188 $7e
    cp   A, $fe                                        ;; 09:4189 $fe $fe
    jr   Z, .jr_09_41a5                                ;; 09:418b $28 $18
    ld   [HL], $fe                                     ;; 09:418d $36 $fe
    ld   HL, wC080                                     ;; 09:418f $21 $80 $c0
    ld   A, $20                                        ;; 09:4192 $3e $20
    ld   [HL+], A                                      ;; 09:4194 $22
    ld   [HL], $10                                     ;; 09:4195 $36 $10
    ld   A, [wCE28]                                    ;; 09:4197 $fa $28 $ce
    and  A, $60                                        ;; 09:419a $e6 $60
    bit  5, A                                          ;; 09:419c $cb $6f
    jr   Z, .jr_09_41a1                                ;; 09:419e $28 $01
    xor  A, A                                          ;; 09:41a0 $af
.jr_09_41a1:
    add  A, A                                          ;; 09:41a1 $87
    ld   [wCD15], A                                    ;; 09:41a2 $ea $15 $cd
.jr_09_41a5:
    rst  rst_00_0018                                   ;; 09:41a5 $df
    db   $05                                           ;; 09:41a6 .
    dw   call_09_41bd                                  ;; 09:41a7 pP $00
    dw   call_09_41c8                                  ;; 09:41a9 pP $01
    dw   call_00_1e83                                  ;; 09:41ab ?? $02
    dw   call_00_1e83                                  ;; 09:41ad ?? $03
    dw   call_09_422a                                  ;; 09:41af ?? $04
    dw   call_09_422a                                  ;; 09:41b1 ?? $05
    dw   call_09_41d7                                  ;; 09:41b3 pP $06
    dw   call_09_4201                                  ;; 09:41b5 pP $07
.jr_09_41b7:
    ld   A, $ff                                        ;; 09:41b7 $3e $ff
    ld   [wCD36], A                                    ;; 09:41b9 $ea $36 $cd
    ret                                                ;; 09:41bc $c9

call_09_41bd:
    ld   A, [wCD15]                                    ;; 09:41bd $fa $15 $cd
    bit  7, A                                          ;; 09:41c0 $cb $7f
    jr   Z, jr_09_41ca                                 ;; 09:41c2 $28 $06
    ld   A, $80                                        ;; 09:41c4 $3e $80
    jr   jr_09_41ca                                    ;; 09:41c6 $18 $02

call_09_41c8:
    ld   A, $ff                                        ;; 09:41c8 $3e $ff

jr_09_41ca:
    pop  HL                                            ;; 09:41ca $e1
    pop  HL                                            ;; 09:41cb $e1
    ld   [wCD36], A                                    ;; 09:41cc $ea $36 $cd
    pop  AF                                            ;; 09:41cf $f1
    ld   [wCD16], A                                    ;; 09:41d0 $ea $16 $cd
    ld   A, [wCD36]                                    ;; 09:41d3 $fa $36 $cd
    ret                                                ;; 09:41d6 $c9

call_09_41d7:
    ld   A, [wCE28]                                    ;; 09:41d7 $fa $28 $ce
    and  A, $20                                        ;; 09:41da $e6 $20
    jp   Z, call_00_1e83                               ;; 09:41dc $ca $83 $1e
    ld   A, [wCD15]                                    ;; 09:41df $fa $15 $cd
    and  A, $7f                                        ;; 09:41e2 $e6 $7f
    jr   Z, .jr_09_41ef                                ;; 09:41e4 $28 $09
    dec  A                                             ;; 09:41e6 $3d
    jr   NZ, jr_09_41f9                                ;; 09:41e7 $20 $10
    ld   A, [wCD35]                                    ;; 09:41e9 $fa $35 $cd
    or   A, A                                          ;; 09:41ec $b7
    jr   Z, jr_09_41f9                                 ;; 09:41ed $28 $0a
.jr_09_41ef:
    rst  rst_00_0018                                   ;; 09:41ef $df
    db   $3c                                           ;; 09:41f0 ?
    ld   A, $04                                        ;; 09:41f1 $3e $04
    ld   [wCD15], A                                    ;; 09:41f3 $ea $15 $cd
    jr   NZ, jr_09_4223                                ;; 09:41f6 $20 $2b
    dec  A                                             ;; 09:41f8 $3d

jr_09_41f9:
    ld   [wCD15], A                                    ;; 09:41f9 $ea $15 $cd

jr_09_41fc:
    call call_09_4252                                  ;; 09:41fc $cd $52 $42
    jr   call_09_425d                                  ;; 09:41ff $18 $5c

call_09_4201:
    ld   A, [wCE28]                                    ;; 09:4201 $fa $28 $ce
    and  A, $20                                        ;; 09:4204 $e6 $20
    jp   Z, call_00_1e83                               ;; 09:4206 $ca $83 $1e
    ld   A, [wCD15]                                    ;; 09:4209 $fa $15 $cd
    and  A, $7f                                        ;; 09:420c $e6 $7f
    cp   A, $04                                        ;; 09:420e $fe $04
    jr   Z, .jr_09_421e                                ;; 09:4210 $28 $0c
    inc  A                                             ;; 09:4212 $3c
    ld   [wCD15], A                                    ;; 09:4213 $ea $15 $cd
    cp   A, $04                                        ;; 09:4216 $fe $04
    jr   C, jr_09_41fc                                 ;; 09:4218 $38 $e2
    rst  rst_00_0018                                   ;; 09:421a $df
    db   $3c                                           ;; 09:421b ?
    jr   NZ, jr_09_4223                                ;; 09:421c $20 $05
.jr_09_421e:
    ld   A, [wCD35]                                    ;; 09:421e $fa $35 $cd
    jr   jr_09_41f9                                    ;; 09:4221 $18 $d6

jr_09_4223:
    ld   A, $88                                        ;; 09:4223 $3e $88
    ld   [wC080], A                                    ;; 09:4225 $ea $80 $c0
    jr   call_09_425d                                  ;; 09:4228 $18 $33

call_09_422a:
    ld   A, [wCE28]                                    ;; 09:422a $fa $28 $ce
    and  A, $60                                        ;; 09:422d $e6 $60
    cp   A, $60                                        ;; 09:422f $fe $60
    jp   NZ, call_00_1e83                              ;; 09:4231 $c2 $83 $1e
    ld   A, [wCD15]                                    ;; 09:4234 $fa $15 $cd
    xor  A, $80                                        ;; 09:4237 $ee $80
    ld   [wCD15], A                                    ;; 09:4239 $ea $15 $cd
    bit  7, A                                          ;; 09:423c $cb $7f
    ret  NZ                                            ;; 09:423e $c0
    cp   A, $04                                        ;; 09:423f $fe $04
    jr   NC, .jr_09_424c                               ;; 09:4241 $30 $09
    swap A                                             ;; 09:4243 $cb $37
    ld   L, A                                          ;; 09:4245 $6f
    rrca                                               ;; 09:4246 $0f
    add  A, L                                          ;; 09:4247 $85
    add  A, $20                                        ;; 09:4248 $c6 $20
    jr   .jr_09_424e                                   ;; 09:424a $18 $02
.jr_09_424c:
    ld   A, $88                                        ;; 09:424c $3e $88
.jr_09_424e:
    ld   [wC080], A                                    ;; 09:424e $ea $80 $c0
    ret                                                ;; 09:4251 $c9

call_09_4252:
    swap A                                             ;; 09:4252 $cb $37
    ld   L, A                                          ;; 09:4254 $6f
    rrca                                               ;; 09:4255 $0f
    add  A, L                                          ;; 09:4256 $85
    add  A, $20                                        ;; 09:4257 $c6 $20
    ld   [wC080], A                                    ;; 09:4259 $ea $80 $c0
    ret                                                ;; 09:425c $c9

call_09_425d:
    ld   A, $01                                        ;; 09:425d $3e $01
    ld   [wCD39], A                                    ;; 09:425f $ea $39 $cd
    jr   call_09_427e                                  ;; 09:4262 $18 $1a

call_09_4264:
    ld   A, [wCD15]                                    ;; 09:4264 $fa $15 $cd
    swap A                                             ;; 09:4267 $cb $37
    add  A, $20                                        ;; 09:4269 $c6 $20
    ld   [wC080], A                                    ;; 09:426b $ea $80 $c0
    ld   A, [wCD16]                                    ;; 09:426e $fa $16 $cd
    or   A, A                                          ;; 09:4271 $b7
    jr   Z, .jr_09_427a                                ;; 09:4272 $28 $06
    swap A                                             ;; 09:4274 $cb $37
    srl  A                                             ;; 09:4276 $cb $3f
    add  A, $08                                        ;; 09:4278 $c6 $08
.jr_09_427a:
    ld   [wC081], A                                    ;; 09:427a $ea $81 $c0
    ret                                                ;; 09:427d $c9

call_09_427e:
    ld   A, $01                                        ;; 09:427e $3e $01
    ld   [wCD39], A                                    ;; 09:4280 $ea $39 $cd
    call call_09_457d                                  ;; 09:4283 $cd $7d $45
    ld   A, [wCD36]                                    ;; 09:4286 $fa $36 $cd
    cp   A, $fe                                        ;; 09:4289 $fe $fe
    jr   Z, .jr_09_42a6                                ;; 09:428b $28 $19
    ld   A, [wCD16]                                    ;; 09:428d $fa $16 $cd
    cp   A, $03                                        ;; 09:4290 $fe $03
    jr   NZ, .jr_09_429e                               ;; 09:4292 $20 $0a
    call call_00_20cf                                  ;; 09:4294 $cd $cf $20
    ld   A, $01                                        ;; 09:4297 $3e $01
    ld   [wCD1C], A                                    ;; 09:4299 $ea $1c $cd
    jr   .jr_09_42a3                                   ;; 09:429c $18 $05
.jr_09_429e:
    call call_09_490e                                  ;; 09:429e $cd $0e $49
    rst  rst_00_0018                                   ;; 09:42a1 $df
    db   $3d                                           ;; 09:42a2 .
.jr_09_42a3:
    call call_09_4264                                  ;; 09:42a3 $cd $64 $42
.jr_09_42a6:
    ld   HL, .data_09_4317                             ;; 09:42a6 $21 $17 $43
    ld   DE, wC8B0                                     ;; 09:42a9 $11 $b0 $c8
    rst  rst_00_0018                                   ;; 09:42ac $df
    db   $3c                                           ;; 09:42ad .
    jr   NZ, .jr_09_42ba                               ;; 09:42ae $20 $0a
    call call_00_1f81                                  ;; 09:42b0 $cd $81 $1f
    xor  A, A                                          ;; 09:42b3 $af
    ld   [DE], A                                       ;; 09:42b4 $12
    inc  DE                                            ;; 09:42b5 $13
    ld   [DE], A                                       ;; 09:42b6 $12
    inc  DE                                            ;; 09:42b7 $13
    jr   .jr_09_42df                                   ;; 09:42b8 $18 $25
.jr_09_42ba:
    ld   A, [wCD36]                                    ;; 09:42ba $fa $36 $cd
    cp   A, $fe                                        ;; 09:42bd $fe $fe
    jr   NZ, .jr_09_42cd                               ;; 09:42bf $20 $0c
    ld   A, [wCD15]                                    ;; 09:42c1 $fa $15 $cd
    cp   A, $04                                        ;; 09:42c4 $fe $04
    jr   NZ, .jr_09_42cd                               ;; 09:42c6 $20 $05
    call call_00_1f66                                  ;; 09:42c8 $cd $66 $1f
    jr   .jr_09_42df                                   ;; 09:42cb $18 $12
.jr_09_42cd:
    ld   HL, .data_09_431e                             ;; 09:42cd $21 $1e $43
    call call_00_1f81                                  ;; 09:42d0 $cd $81 $1f
    ld   HL, .data_09_4317                             ;; 09:42d3 $21 $17 $43
    call call_00_1f81                                  ;; 09:42d6 $cd $81 $1f
    ld   HL, .data_09_4325                             ;; 09:42d9 $21 $25 $43
    call call_00_1f90                                  ;; 09:42dc $cd $90 $1f
.jr_09_42df:
    ld   A, [wCD35]                                    ;; 09:42df $fa $35 $cd
    or   A, A                                          ;; 09:42e2 $b7
    jr   NZ, .jr_09_430d                               ;; 09:42e3 $20 $28
    ld   A, [wCD16]                                    ;; 09:42e5 $fa $16 $cd
    or   A, A                                          ;; 09:42e8 $b7
    jr   Z, .jr_09_42fa                                ;; 09:42e9 $28 $0f
    ld   HL, .data_09_4327                             ;; 09:42eb $21 $27 $43
    dec  DE                                            ;; 09:42ee $1b
    dec  DE                                            ;; 09:42ef $1b
    cp   A, $03                                        ;; 09:42f0 $fe $03
    jr   Z, .jr_09_42f7                                ;; 09:42f2 $28 $03
    ld   HL, .data_09_4337                             ;; 09:42f4 $21 $37 $43
.jr_09_42f7:
    call call_00_1f66                                  ;; 09:42f7 $cd $66 $1f
.jr_09_42fa:
    call call_09_4fef                                  ;; 09:42fa $cd $ef $4f
    xor  A, A                                          ;; 09:42fd $af
    ld   [wCD1C], A                                    ;; 09:42fe $ea $1c $cd
    ld   A, [wCD3C]                                    ;; 09:4301 $fa $3c $cd
    or   A, A                                          ;; 09:4304 $b7
    ret  Z                                             ;; 09:4305 $c8
    xor  A, A                                          ;; 09:4306 $af
    ld   [wCD3C], A                                    ;; 09:4307 $ea $3c $cd
    rst  rst_00_0018                                   ;; 09:430a $df
    db   $59                                           ;; 09:430b .
    ret                                                ;; 09:430c $c9
.jr_09_430d:
    ld   HL, .data_09_4347                             ;; 09:430d $21 $47 $43
    dec  DE                                            ;; 09:4310 $1b
    dec  DE                                            ;; 09:4311 $1b
    call call_00_1f7b                                  ;; 09:4312 $cd $7b $1f
    jr   .jr_09_42fa                                   ;; 09:4315 $18 $e3
.data_09_4317:
    db   $01, $01, $12, $0c, $5f, $6c, $00             ;; 09:4317 .......
.data_09_431e:
    db   $01, $0e, $12, $03, $b8, $6c, $00             ;; 09:431e .......
.data_09_4325:
    db   $00, $00                                      ;; 09:4325 ..
.data_09_4327:
    db   $03, $10, $07, $01, $fd, $6c, $01, $03        ;; 09:4327 ????????
    db   $01, $07, $0e, $cf, $6c, $00, $00, $00        ;; 09:432f ????????
.data_09_4337:
    db   $0c, $10, $07, $01, $fd, $6c, $01, $0c        ;; 09:4337 ........
    db   $01, $07, $0e, $cf, $6c, $00, $00, $00        ;; 09:433f .......w
.data_09_4347:
    db   $01, $01, $12, $02, $35, $71, $00, $00        ;; 09:4347 ........
    db   $00                                           ;; 09:434f .

call_09_4350:
    rst  rst_00_0018                                   ;; 09:4350 $df
    db   $49                                           ;; 09:4351 .
    ld   HL, data_09_6d00                              ;; 09:4352 $21 $00 $6d
    xor  A, A                                          ;; 09:4355 $af
    call call_09_484b                                  ;; 09:4356 $cd $4b $48
    xor  A, A                                          ;; 09:4359 $af
    ld   [wCD15], A                                    ;; 09:435a $ea $15 $cd
    ret                                                ;; 09:435d $c9

call_09_435e:
    call call_09_413f                                  ;; 09:435e $cd $3f $41
    cp   A, $ff                                        ;; 09:4361 $fe $ff
    jr   Z, .jr_09_4371                                ;; 09:4363 $28 $0c
    rst  rst_00_0018                                   ;; 09:4365 $df
    db   $49                                           ;; 09:4366 .
    ld   HL, data_09_6e99                              ;; 09:4367 $21 $99 $6e
    ld   A, $01                                        ;; 09:436a $3e $01
    call call_09_484b                                  ;; 09:436c $cd $4b $48
    jr   call_09_435e                                  ;; 09:436f $18 $ed
.jr_09_4371:
    ld   A, $01                                        ;; 09:4371 $3e $01
    ld   [wCD15], A                                    ;; 09:4373 $ea $15 $cd
    ret                                                ;; 09:4376 $c9

call_09_4377:
    call call_09_413f                                  ;; 09:4377 $cd $3f $41
    cp   A, $ff                                        ;; 09:437a $fe $ff
    jr   Z, .jr_09_4390                                ;; 09:437c $28 $12
    rst  rst_00_0018                                   ;; 09:437e $df
    db   $49                                           ;; 09:437f .
    ld   HL, .data_09_4396                             ;; 09:4380 $21 $96 $43
    ld   DE, wC8B0                                     ;; 09:4383 $11 $b0 $c8
    call call_00_1f7b                                  ;; 09:4386 $cd $7b $1f
    call call_09_4fef                                  ;; 09:4389 $cd $ef $4f
    rst  rst_00_0018                                   ;; 09:438c $df
    db   $2e                                           ;; 09:438d .
    jr   call_09_4377                                  ;; 09:438e $18 $e7
.jr_09_4390:
    ld   A, $03                                        ;; 09:4390 $3e $03
    ld   [wCD15], A                                    ;; 09:4392 $ea $15 $cd
    ret                                                ;; 09:4395 $c9
.data_09_4396:
    db   $01, $01, $12, $10, $67, $6f, $00, $00        ;; 09:4396 ........
    db   $00                                           ;; 09:439e .

call_09_439f:
    call call_09_413f                                  ;; 09:439f $cd $3f $41
    cp   A, $ff                                        ;; 09:43a2 $fe $ff
    jr   Z, .jr_09_43ab                                ;; 09:43a4 $28 $05
    call call_09_465a                                  ;; 09:43a6 $cd $5a $46
    jr   call_09_439f                                  ;; 09:43a9 $18 $f4
.jr_09_43ab:
    ld   A, $04                                        ;; 09:43ab $3e $04
    ld   [wCD15], A                                    ;; 09:43ad $ea $15 $cd
    ret                                                ;; 09:43b0 $c9

call_09_43b1:
    ld   A, $01                                        ;; 09:43b1 $3e $01
    ld   [wCD35], A                                    ;; 09:43b3 $ea $35 $cd
    ld   [wCD15], A                                    ;; 09:43b6 $ea $15 $cd
    ld   A, $fe                                        ;; 09:43b9 $3e $fe
    ld   [wCD36], A                                    ;; 09:43bb $ea $36 $cd
    ld   HL, wC080                                     ;; 09:43be $21 $80 $c0
    ld   A, $38                                        ;; 09:43c1 $3e $38
    ld   [HL+], A                                      ;; 09:43c3 $22
    ld   [HL], $10                                     ;; 09:43c4 $36 $10
.jr_09_43c6:
    call call_09_4160                                  ;; 09:43c6 $cd $60 $41
    cp   A, $ff                                        ;; 09:43c9 $fe $ff
    jr   Z, .jr_09_43e6                                ;; 09:43cb $28 $19
    call call_00_29ef                                  ;; 09:43cd $cd $ef $29
    jr   Z, .jr_09_43d6                                ;; 09:43d0 $28 $04
    cp   A, $03                                        ;; 09:43d2 $fe $03
    jr   C, .jr_09_43dc                                ;; 09:43d4 $38 $06
.jr_09_43d6:
    rst  rst_00_0018                                   ;; 09:43d6 $df
    db   $2f                                           ;; 09:43d7 ?
    ld   A, [HL]                                       ;; 09:43d8 $7e
    xor  A, $80                                        ;; 09:43d9 $ee $80
    ld   [HL], A                                       ;; 09:43db $77
.jr_09_43dc:
    call call_09_4593                                  ;; 09:43dc $cd $93 $45
    ld   A, $fe                                        ;; 09:43df $3e $fe
    ld   [wCD36], A                                    ;; 09:43e1 $ea $36 $cd
    jr   .jr_09_43c6                                   ;; 09:43e4 $18 $e0
.jr_09_43e6:
    xor  A, A                                          ;; 09:43e6 $af
    ld   [wCD35], A                                    ;; 09:43e7 $ea $35 $cd
    ld   A, $05                                        ;; 09:43ea $3e $05
    ld   [wCD15], A                                    ;; 09:43ec $ea $15 $cd
    ret                                                ;; 09:43ef $c9

call_09_43f0:
    ld   A, $01                                        ;; 09:43f0 $3e $01
    ld   [wCD3C], A                                    ;; 09:43f2 $ea $3c $cd
    ld   A, $03                                        ;; 09:43f5 $3e $03
    call call_09_4de8                                  ;; 09:43f7 $cd $e8 $4d
    rst  rst_00_0018                                   ;; 09:43fa $df
    db   $49                                           ;; 09:43fb .
    call call_09_4494                                  ;; 09:43fc $cd $94 $44
    jr   NZ, .jr_09_440e                               ;; 09:43ff $20 $0d
    call call_09_4ece                                  ;; 09:4401 $cd $ce $4e
    ld   HL, sBFFA                                     ;; 09:4404 $21 $fa $bf
    xor  A, A                                          ;; 09:4407 $af
    call call_00_1f53                                  ;; 09:4408 $cd $53 $1f
    call call_09_4edf                                  ;; 09:440b $cd $df $4e
.jr_09_440e:
    ld   HL, wC080                                     ;; 09:440e $21 $80 $c0
    ld   A, $48                                        ;; 09:4411 $3e $48
    ld   [HL+], A                                      ;; 09:4413 $22
    ld   [HL], $10                                     ;; 09:4414 $36 $10
    xor  A, A                                          ;; 09:4416 $af
    ld   [wCD15], A                                    ;; 09:4417 $ea $15 $cd
    call call_09_44e2                                  ;; 09:441a $cd $e2 $44
    rst  rst_00_0018                                   ;; 09:441d $df
    db   $05                                           ;; 09:441e .
    dw   call_09_4437                                  ;; 09:441f pP $00
    dw   call_09_445e                                  ;; 09:4421 ?? $01
    dw   call_00_1e83                                  ;; 09:4423 ?? $02
    dw   call_00_1e83                                  ;; 09:4425 ?? $03
    dw   call_00_1e83                                  ;; 09:4427 ?? $04
    dw   call_00_1e83                                  ;; 09:4429 ?? $05
    dw   call_09_4465                                  ;; 09:442b ?? $06
    dw   call_09_4484                                  ;; 09:442d ?? $07

jr_09_442f:
    ld   A, $06                                        ;; 09:442f $3e $06
    ld   [wCD15], A                                    ;; 09:4431 $ea $15 $cd
    jp   call_00_1e79                                  ;; 09:4434 $c3 $79 $1e

call_09_4437:
    ld   A, [wCD15]                                    ;; 09:4437 $fa $15 $cd
    call call_00_1fcd                                  ;; 09:443a $cd $cd $1f
    ld   DE, wC503                                     ;; 09:443d $11 $03 $c5
    add  HL, DE                                        ;; 09:4440 $19
    ld   A, [HL]                                       ;; 09:4441 $7e
    inc  A                                             ;; 09:4442 $3c
    jr   Z, .jr_09_4451                                ;; 09:4443 $28 $0c
    ld   A, $01                                        ;; 09:4445 $3e $01
    call call_09_44e2                                  ;; 09:4447 $cd $e2 $44
    rst  rst_00_0018                                   ;; 09:444a $df
    db   $2e                                           ;; 09:444b ?
    and  A, $01                                        ;; 09:444c $e6 $01
    jp   Z, call_09_44e2                               ;; 09:444e $ca $e2 $44
.jr_09_4451:
    ld   A, $03                                        ;; 09:4451 $3e $03
    call call_09_4e0c                                  ;; 09:4453 $cd $0c $4e
    ld   A, [wCD15]                                    ;; 09:4456 $fa $15 $cd
    call call_09_4de8                                  ;; 09:4459 $cd $e8 $4d
    jr   jr_09_442f                                    ;; 09:445c $18 $d1

call_09_445e:
    ld   A, $03                                        ;; 09:445e $3e $03
    call call_09_4e0c                                  ;; 09:4460 $cd $0c $4e
    jr   jr_09_442f                                    ;; 09:4463 $18 $ca

call_09_4465:
    ld   A, [wCD15]                                    ;; 09:4465 $fa $15 $cd
    or   A, A                                          ;; 09:4468 $b7
    jr   Z, .jr_09_446e                                ;; 09:4469 $28 $03
    dec  A                                             ;; 09:446b $3d
    jr   jr_09_4473                                    ;; 09:446c $18 $05
.jr_09_446e:
    call call_09_495e                                  ;; 09:446e $cd $5e $49
    ld   A, $02                                        ;; 09:4471 $3e $02

jr_09_4473:
    ld   [wCD15], A                                    ;; 09:4473 $ea $15 $cd
    swap A                                             ;; 09:4476 $cb $37
    add  A, A                                          ;; 09:4478 $87
    add  A, $48                                        ;; 09:4479 $c6 $48
    ld   [wC080], A                                    ;; 09:447b $ea $80 $c0
    ld   A, [wCD26]                                    ;; 09:447e $fa $26 $cd
    jp   call_09_44e2                                  ;; 09:4481 $c3 $e2 $44

call_09_4484:
    ld   A, [wCD15]                                    ;; 09:4484 $fa $15 $cd
    cp   A, $02                                        ;; 09:4487 $fe $02
    jr   Z, .jr_09_448e                                ;; 09:4489 $28 $03
    inc  A                                             ;; 09:448b $3c
    jr   jr_09_4473                                    ;; 09:448c $18 $e5
.jr_09_448e:
    call call_09_495e                                  ;; 09:448e $cd $5e $49
    xor  A, A                                          ;; 09:4491 $af
    jr   jr_09_4473                                    ;; 09:4492 $18 $df

call_09_4494:
    ld   B, $03                                        ;; 09:4494 $06 $03
.jr_09_4496:
    push BC                                            ;; 09:4496 $c5
    ld   A, $03                                        ;; 09:4497 $3e $03
    sub  A, B                                          ;; 09:4499 $90
    push AF                                            ;; 09:449a $f5
    call call_00_1fcd                                  ;; 09:449b $cd $cd $1f
    pop  AF                                            ;; 09:449e $f1
    ld   DE, wC500                                     ;; 09:449f $11 $00 $c5
    add  HL, DE                                        ;; 09:44a2 $19
    ld   E, L                                          ;; 09:44a3 $5d
    ld   D, H                                          ;; 09:44a4 $54
    push HL                                            ;; 09:44a5 $e5
    call call_09_4e24                                  ;; 09:44a6 $cd $24 $4e
    pop  HL                                            ;; 09:44a9 $e1
    jr   Z, .jr_09_44b4                                ;; 09:44aa $28 $08
    ld   DE, $03                                       ;; 09:44ac $11 $03 $00
    add  HL, DE                                        ;; 09:44af $19
    ld   [HL], $ff                                     ;; 09:44b0 $36 $ff
    jr   .jr_09_44ce                                   ;; 09:44b2 $18 $1a
.jr_09_44b4:
    ld   DE, $0d                                       ;; 09:44b4 $11 $0d $00
    add  HL, DE                                        ;; 09:44b7 $19
    pop  DE                                            ;; 09:44b8 $d1
    push DE                                            ;; 09:44b9 $d5
    push HL                                            ;; 09:44ba $e5
    ld   A, $03                                        ;; 09:44bb $3e $03
    sub  A, D                                          ;; 09:44bd $92
    swap A                                             ;; 09:44be $cb $37
    call call_00_2437                                  ;; 09:44c0 $cd $37 $24
    ld   DE, $8140                                     ;; 09:44c3 $11 $40 $81
    add  HL, DE                                        ;; 09:44c6 $19
    ld   E, L                                          ;; 09:44c7 $5d
    ld   D, H                                          ;; 09:44c8 $54
    ld   A, $01                                        ;; 09:44c9 $3e $01
    pop  HL                                            ;; 09:44cb $e1
    rst  rst_00_0018                                   ;; 09:44cc $df
    db   $59                                           ;; 09:44cd ?
.jr_09_44ce:
    pop  BC                                            ;; 09:44ce $c1
    dec  B                                             ;; 09:44cf $05
    jr   NZ, .jr_09_4496                               ;; 09:44d0 $20 $c4
    call call_09_4127                                  ;; 09:44d2 $cd $27 $41
    ld   HL, wC503                                     ;; 09:44d5 $21 $03 $c5
    ld   DE, $60                                       ;; 09:44d8 $11 $60 $00
    ld   A, [HL]                                       ;; 09:44db $7e
    add  HL, DE                                        ;; 09:44dc $19
    and  A, [HL]                                       ;; 09:44dd $a6
    add  HL, DE                                        ;; 09:44de $19
    and  A, [HL]                                       ;; 09:44df $a6
    inc  A                                             ;; 09:44e0 $3c
    ret                                                ;; 09:44e1 $c9

call_09_44e2:
    push AF                                            ;; 09:44e2 $f5
    ld   DE, wC8B0                                     ;; 09:44e3 $11 $b0 $c8
    ld   HL, .data_09_4557                             ;; 09:44e6 $21 $57 $45
    call call_00_1f81                                  ;; 09:44e9 $cd $81 $1f
    pop  AF                                            ;; 09:44ec $f1
    add  A, A                                          ;; 09:44ed $87
    ld   HL, .data_09_4551                             ;; 09:44ee $21 $51 $45
    rst  add_hl_a                                      ;; 09:44f1 $c7
    ld   A, [HL+]                                      ;; 09:44f2 $2a
    ld   [wC8B4], A                                    ;; 09:44f3 $ea $b4 $c8
    ld   A, [HL]                                       ;; 09:44f6 $7e
    ld   [wC8B5], A                                    ;; 09:44f7 $ea $b5 $c8
    ld   HL, wCD25                                     ;; 09:44fa $21 $25 $cd
    ld   A, [HL]                                       ;; 09:44fd $7e
    or   A, A                                          ;; 09:44fe $b7
    jr   Z, .jr_09_4516                                ;; 09:44ff $28 $15
    dec  [HL]                                          ;; 09:4501 $35
    ld   HL, .data_09_4565                             ;; 09:4502 $21 $65 $45
    call call_00_1f81                                  ;; 09:4505 $cd $81 $1f
    ld   HL, .data_09_455e                             ;; 09:4508 $21 $5e $45
    call call_00_1f81                                  ;; 09:450b $cd $81 $1f
    ld   HL, .data_09_456c                             ;; 09:450e $21 $6c $45
    call call_00_1f81                                  ;; 09:4511 $cd $81 $1f
    jr   .jr_09_454a                                   ;; 09:4514 $18 $34
.jr_09_4516:
    ld   A, [wCD15]                                    ;; 09:4516 $fa $15 $cd
    cp   A, $01                                        ;; 09:4519 $fe $01
    jr   C, .jr_09_4521                                ;; 09:451b $38 $04
    jr   Z, .jr_09_4535                                ;; 09:451d $28 $16
    jr   .jr_09_4543                                   ;; 09:451f $18 $22
.jr_09_4521:
    ld   HL, .data_09_456c                             ;; 09:4521 $21 $6c $45
    call call_00_1f81                                  ;; 09:4524 $cd $81 $1f
    ld   HL, .data_09_4565                             ;; 09:4527 $21 $65 $45
    call call_00_1f81                                  ;; 09:452a $cd $81 $1f
    ld   HL, .data_09_455e                             ;; 09:452d $21 $5e $45
    call call_00_1f81                                  ;; 09:4530 $cd $81 $1f
    jr   .jr_09_454a                                   ;; 09:4533 $18 $15
.jr_09_4535:
    ld   HL, .data_09_456c                             ;; 09:4535 $21 $6c $45
    call call_00_1f81                                  ;; 09:4538 $cd $81 $1f
    ld   HL, .data_09_455e                             ;; 09:453b $21 $5e $45
    call call_00_1f6c                                  ;; 09:453e $cd $6c $1f
    jr   .jr_09_454a                                   ;; 09:4541 $18 $07
.jr_09_4543:
    ld   HL, .data_09_455e                             ;; 09:4543 $21 $5e $45
    ld   B, $15                                        ;; 09:4546 $06 $15
    rst  rst_00_0018                                   ;; 09:4548 $df
    db   $03                                           ;; 09:4549 ?
.jr_09_454a:
    xor  A, A                                          ;; 09:454a $af
    ld   [DE], A                                       ;; 09:454b $12
    inc  DE                                            ;; 09:454c $13
    ld   [DE], A                                       ;; 09:454d $12
    jp   call_09_4fef                                  ;; 09:454e $c3 $ef $4f
.data_09_4551:
    db   $09, $6e, $74, $6e, $f6, $71                  ;; 09:4551 ..????
.data_09_4557:
    db   $01, $01, $12, $03, $09, $6e, $01             ;; 09:4557 .......
.data_09_455e:
    db   $01, $06, $12, $03, $2f, $6e, $00             ;; 09:455e ......w
.data_09_4565:
    db   $01, $0a, $12, $03, $46, $6e, $00             ;; 09:4565 .......
.data_09_456c:
    db   $01, $0e, $12, $03, $5d, $6e, $00             ;; 09:456c .......

call_09_4573:
    ld   A, [wCD36]                                    ;; 09:4573 $fa $36 $cd
    add  A, A                                          ;; 09:4576 $87
    add  A, A                                          ;; 09:4577 $87
    ld   HL, wCDEC                                     ;; 09:4578 $21 $ec $cd
    rst  add_hl_a                                      ;; 09:457b $c7
    ret                                                ;; 09:457c $c9

call_09_457d:
    ld   A, [wCD36]                                    ;; 09:457d $fa $36 $cd
    push AF                                            ;; 09:4580 $f5
    ld   A, $05                                        ;; 09:4581 $3e $05
.jr_09_4583:
    dec  A                                             ;; 09:4583 $3d
    ld   [wCD36], A                                    ;; 09:4584 $ea $36 $cd
    push AF                                            ;; 09:4587 $f5
    call call_09_4593                                  ;; 09:4588 $cd $93 $45
    pop  AF                                            ;; 09:458b $f1
    jr   NZ, .jr_09_4583                               ;; 09:458c $20 $f5
    pop  AF                                            ;; 09:458e $f1
    ld   [wCD36], A                                    ;; 09:458f $ea $36 $cd
    ret                                                ;; 09:4592 $c9

call_09_4593:
    ld   A, [wCD36]                                    ;; 09:4593 $fa $36 $cd
    call call_00_29ef                                  ;; 09:4596 $cd $ef $29
    or   A, A                                          ;; 09:4599 $b7
    jr   Z, .jr_09_45a0                                ;; 09:459a $28 $04
    cp   A, $03                                        ;; 09:459c $fe $03
    jr   C, .jr_09_45ad                                ;; 09:459e $38 $0d
.jr_09_45a0:
    rst  rst_00_0018                                   ;; 09:45a0 $df
    db   $2f                                           ;; 09:45a1 .
    jr   NZ, .jr_09_45b7                               ;; 09:45a2 $20 $13
    ld   A, [wCD36]                                    ;; 09:45a4 $fa $36 $cd
    call call_00_29ef                                  ;; 09:45a7 $cd $ef $29
    or   A, A                                          ;; 09:45aa $b7
    jr   Z, .jr_09_45c2                                ;; 09:45ab $28 $15
.jr_09_45ad:
    push HL                                            ;; 09:45ad $e5
    call call_09_4573                                  ;; 09:45ae $cd $73 $45
    ld   E, L                                          ;; 09:45b1 $5d
    ld   D, H                                          ;; 09:45b2 $54
    pop  HL                                            ;; 09:45b3 $e1
    rst  rst_00_0018                                   ;; 09:45b4 $df
    db   $e2                                           ;; 09:45b5 ?
    ret                                                ;; 09:45b6 $c9
.jr_09_45b7:
    call call_09_4573                                  ;; 09:45b7 $cd $73 $45
    ld   E, L                                          ;; 09:45ba $5d
    ld   D, H                                          ;; 09:45bb $54
    ld   HL, data_09_6e04                              ;; 09:45bc $21 $04 $6e
    rst  rst_00_0018                                   ;; 09:45bf $df
    db   $02                                           ;; 09:45c0 ?
    ret                                                ;; 09:45c1 $c9
.jr_09_45c2:
    call call_09_4573                                  ;; 09:45c2 $cd $73 $45
    ld   [HL], $00                                     ;; 09:45c5 $36 $00
    ret                                                ;; 09:45c7 $c9

call_09_45c8:
    rst  rst_00_0018                                   ;; 09:45c8 $df
    db   $3d                                           ;; 09:45c9 .
    ld   [wCD19], A                                    ;; 09:45ca $ea $19 $cd
    ld   HL, .data_09_45d9                             ;; 09:45cd $21 $d9 $45
    ld   DE, wC8B0                                     ;; 09:45d0 $11 $b0 $c8
    call call_00_1f66                                  ;; 09:45d3 $cd $66 $1f
    jp   call_09_4fef                                  ;; 09:45d6 $c3 $ef $4f
.data_09_45d9:
    db   $01, $01, $12, $06, $ec, $6f, $01, $01        ;; 09:45d9 ........
    db   $09, $12, $08, $0a, $70, $00, $00, $00        ;; 09:45e1 ........

jp_09_45e9:
    ld   A, $03                                        ;; 09:45e9 $3e $03
    ld   [wCD19], A                                    ;; 09:45eb $ea $19 $cd
    ld   A, [wCD18]                                    ;; 09:45ee $fa $18 $cd
    add  A, A                                          ;; 09:45f1 $87
    ld   E, A                                          ;; 09:45f2 $5f
    ld   A, [wC085]                                    ;; 09:45f3 $fa $85 $c0
    cp   A, $10                                        ;; 09:45f6 $fe $10
    jr   Z, .jr_09_45fb                                ;; 09:45f8 $28 $01
    inc  E                                             ;; 09:45fa $1c
.jr_09_45fb:
    ld   A, E                                          ;; 09:45fb $7b
    add  A, A                                          ;; 09:45fc $87
    ld   HL, data_09_464a                              ;; 09:45fd $21 $4a $46
    rst  add_hl_a                                      ;; 09:4600 $c7
    ld   A, [HL+]                                      ;; 09:4601 $2a
    ld   [wCD21], A                                    ;; 09:4602 $ea $21 $cd
    ld   A, [HL]                                       ;; 09:4605 $7e
    ld   [wCD22], A                                    ;; 09:4606 $ea $22 $cd
    ld   HL, data_09_463a                              ;; 09:4609 $21 $3a $46
    ld   DE, wC8B0                                     ;; 09:460c $11 $b0 $c8
    call call_00_1f66                                  ;; 09:460f $cd $66 $1f
    ld   HL, wCDE6                                     ;; 09:4612 $21 $e6 $cd
    ld   A, $33                                        ;; 09:4615 $3e $33
    ld   [HL+], A                                      ;; 09:4617 $22
    ld   [HL], $70                                     ;; 09:4618 $36 $70

jp_09_461a:
    ld   HL, wCDE6                                     ;; 09:461a $21 $e6 $cd
    ld   DE, wC8BB                                     ;; 09:461d $11 $bb $c8
    call call_00_1f90                                  ;; 09:4620 $cd $90 $1f
    ld   A, [wCD15]                                    ;; 09:4623 $fa $15 $cd
    swap A                                             ;; 09:4626 $cb $37
    add  A, $60                                        ;; 09:4628 $c6 $60
    ld   [wC080], A                                    ;; 09:462a $ea $80 $c0
    ld   A, $70                                        ;; 09:462d $3e $70
    ld   [wC088], A                                    ;; 09:462f $ea $88 $c0
    ld   A, $78                                        ;; 09:4632 $3e $78
    ld   [wC08C], A                                    ;; 09:4634 $ea $8c $c0
    jp   call_09_4fef                                  ;; 09:4637 $c3 $ef $4f

data_09_463a:
    db   $01, $01, $12, $06, $ec, $6f, $01, $01        ;; 09:463a ........
    db   $09, $12, $08, $33, $70, $00, $00, $00        ;; 09:4642 ........

data_09_464a:
    db   $30, $77, $78, $83, $84, $8f, $90, $9f        ;; 09:464a ??????..
    db   $a0, $a9, $aa, $b3, $b4, $bf, $b4, $bf        ;; 09:4652 ????????

call_09_465a:
    xor  A, A                                          ;; 09:465a $af
    ld   [wCD15], A                                    ;; 09:465b $ea $15 $cd
    rst  rst_00_0018                                   ;; 09:465e $df
    db   $49                                           ;; 09:465f .
    ld   HL, wC080                                     ;; 09:4660 $21 $80 $c0
    ld   A, $60                                        ;; 09:4663 $3e $60
    ld   [HL+], A                                      ;; 09:4665 $22
    ld   [HL], $10                                     ;; 09:4666 $36 $10
    call call_09_45c8                                  ;; 09:4668 $cd $c8 $45
    rst  rst_00_0018                                   ;; 09:466b $df
    db   $05                                           ;; 09:466c .
    dw   call_09_467d                                  ;; 09:466d pP $00
    dw   call_09_4704                                  ;; 09:466f pP $01
    dw   call_00_1e83                                  ;; 09:4671 ?? $02
    dw   call_00_1e83                                  ;; 09:4673 ?? $03
    dw   call_09_4724                                  ;; 09:4675 pP $04
    dw   call_09_4724                                  ;; 09:4677 ?? $05
    dw   call_09_4731                                  ;; 09:4679 ?? $06
    dw   call_09_4762                                  ;; 09:467b pP $07

call_09_467d:
    ld   A, [wCD17]                                    ;; 09:467d $fa $17 $cd
    or   A, A                                          ;; 09:4680 $b7
    jr   Z, .jr_09_46bb                                ;; 09:4681 $28 $38
    ld   A, [wCD1A]                                    ;; 09:4683 $fa $1a $cd
    ld   L, A                                          ;; 09:4686 $6f
    ld   A, [wCD15]                                    ;; 09:4687 $fa $15 $cd
    add  A, L                                          ;; 09:468a $85
    add  A, A                                          ;; 09:468b $87
    ld   HL, wC6FF                                     ;; 09:468c $21 $ff $c6
    rst  add_hl_a                                      ;; 09:468f $c7
    ld   A, L                                          ;; 09:4690 $7d
    ld   [wCDDE], A                                    ;; 09:4691 $ea $de $cd
    ld   A, H                                          ;; 09:4694 $7c
    ld   [wCDDF], A                                    ;; 09:4695 $ea $df $cd
    call call_00_2503                                  ;; 09:4698 $cd $03 $25
    call NZ, call_00_1e83                              ;; 09:469b $c4 $83 $1e
    jp   NZ, jp_09_461a                                ;; 09:469e $c2 $1a $46
    xor  A, A                                          ;; 09:46a1 $af
    ld   [wCD17], A                                    ;; 09:46a2 $ea $17 $cd
    ld   A, [wC085]                                    ;; 09:46a5 $fa $85 $c0
    ld   [wC081], A                                    ;; 09:46a8 $ea $81 $c0
    ld   A, [wCD18]                                    ;; 09:46ab $fa $18 $cd
    ld   [wCD15], A                                    ;; 09:46ae $ea $15 $cd
    swap A                                             ;; 09:46b1 $cb $37
    add  A, $60                                        ;; 09:46b3 $c6 $60
    ld   [wC080], A                                    ;; 09:46b5 $ea $80 $c0
    jp   call_09_45c8                                  ;; 09:46b8 $c3 $c8 $45
.jr_09_46bb:
    call call_00_1fc4                                  ;; 09:46bb $cd $c4 $1f
    ld   DE, wC540                                     ;; 09:46be $11 $40 $c5
    add  HL, DE                                        ;; 09:46c1 $19
    ld   A, [wC081]                                    ;; 09:46c2 $fa $81 $c0
    ld   [wC085], A                                    ;; 09:46c5 $ea $85 $c0
    ld   D, A                                          ;; 09:46c8 $57
    ld   A, [wCD15]                                    ;; 09:46c9 $fa $15 $cd
    ld   [wCD18], A                                    ;; 09:46cc $ea $18 $cd
    add  A, A                                          ;; 09:46cf $87
    ld   E, A                                          ;; 09:46d0 $5f
    ld   A, D                                          ;; 09:46d1 $7a
    cp   A, $10                                        ;; 09:46d2 $fe $10
    jr   Z, .jr_09_46d7                                ;; 09:46d4 $28 $01
    inc  E                                             ;; 09:46d6 $1c
.jr_09_46d7:
    ld   D, $00                                        ;; 09:46d7 $16 $00
    add  HL, DE                                        ;; 09:46d9 $19
    ld   A, L                                          ;; 09:46da $7d
    ld   [wCDDC], A                                    ;; 09:46db $ea $dc $cd
    ld   A, H                                          ;; 09:46de $7c
    ld   [wCDDD], A                                    ;; 09:46df $ea $dd $cd
    ld   A, [wCD36]                                    ;; 09:46e2 $fa $36 $cd
    cp   A, $04                                        ;; 09:46e5 $fe $04
    jr   C, .jr_09_46ee                                ;; 09:46e7 $38 $05
    ld   A, [HL]                                       ;; 09:46e9 $7e
    inc  A                                             ;; 09:46ea $3c
    jp   NZ, call_00_1e83                              ;; 09:46eb $c2 $83 $1e
.jr_09_46ee:
    xor  A, A                                          ;; 09:46ee $af
    ld   [wCD1A], A                                    ;; 09:46ef $ea $1a $cd
    ld   [wCD15], A                                    ;; 09:46f2 $ea $15 $cd
    inc  A                                             ;; 09:46f5 $3c
    ld   [wCD17], A                                    ;; 09:46f6 $ea $17 $cd
    ld   HL, wC080                                     ;; 09:46f9 $21 $80 $c0
    ld   A, $60                                        ;; 09:46fc $3e $60
    ld   [HL+], A                                      ;; 09:46fe $22
    ld   [HL], $10                                     ;; 09:46ff $36 $10
    jp   jp_09_45e9                                    ;; 09:4701 $c3 $e9 $45

call_09_4704:
    ld   HL, wCD17                                     ;; 09:4704 $21 $17 $cd
    ld   A, [HL]                                       ;; 09:4707 $7e
    or   A, A                                          ;; 09:4708 $b7
    jp   Z, jp_09_4795                                 ;; 09:4709 $ca $95 $47
    ld   [HL], $00                                     ;; 09:470c $36 $00
    ld   A, [wC085]                                    ;; 09:470e $fa $85 $c0
    ld   [wC081], A                                    ;; 09:4711 $ea $81 $c0
    ld   A, [wCD18]                                    ;; 09:4714 $fa $18 $cd
    ld   [wCD15], A                                    ;; 09:4717 $ea $15 $cd
    swap A                                             ;; 09:471a $cb $37
    add  A, $60                                        ;; 09:471c $c6 $60
    ld   [wC080], A                                    ;; 09:471e $ea $80 $c0
    jp   call_09_45c8                                  ;; 09:4721 $c3 $c8 $45

call_09_4724:
    ld   A, [wCD17]                                    ;; 09:4724 $fa $17 $cd
    or   A, A                                          ;; 09:4727 $b7
    ret  NZ                                            ;; 09:4728 $c0
    ld   HL, wC081                                     ;; 09:4729 $21 $81 $c0
    ld   A, [HL]                                       ;; 09:472c $7e
    xor  A, $48                                        ;; 09:472d $ee $48
    ld   [HL], A                                       ;; 09:472f $77
    ret                                                ;; 09:4730 $c9

call_09_4731:
    ld   HL, wCD15                                     ;; 09:4731 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:4734 $7e
    or   A, A                                          ;; 09:4735 $b7
    jr   Z, .jr_09_4741                                ;; 09:4736 $28 $09
    dec  [HL]                                          ;; 09:4738 $35
    ld   HL, wC080                                     ;; 09:4739 $21 $80 $c0
    ld   A, [HL]                                       ;; 09:473c $7e
    sub  A, $10                                        ;; 09:473d $d6 $10
    ld   [HL], A                                       ;; 09:473f $77
    ret                                                ;; 09:4740 $c9
.jr_09_4741:
    ld   A, [wCD17]                                    ;; 09:4741 $fa $17 $cd
    or   A, A                                          ;; 09:4744 $b7
    jr   NZ, .jr_09_474f                               ;; 09:4745 $20 $08
    ld   [HL], $03                                     ;; 09:4747 $36 $03
    ld   A, $90                                        ;; 09:4749 $3e $90
    ld   [wC080], A                                    ;; 09:474b $ea $80 $c0
    ret                                                ;; 09:474e $c9
.jr_09_474f:
    ld   A, [wCD19]                                    ;; 09:474f $fa $19 $cd
    rrca                                               ;; 09:4752 $0f
    jp   NC, call_00_1e83                              ;; 09:4753 $d2 $83 $1e
    ld   A, $09                                        ;; 09:4756 $3e $09
    ld   B, $06                                        ;; 09:4758 $06 $06
    call call_00_34e0                                  ;; 09:475a $cd $e0 $34
    ld   HL, wCD1A                                     ;; 09:475d $21 $1a $cd
    dec  [HL]                                          ;; 09:4760 $35
    ret                                                ;; 09:4761 $c9

call_09_4762:
    ld   HL, wCD15                                     ;; 09:4762 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:4765 $7e
    cp   A, $03                                        ;; 09:4766 $fe $03
    jr   Z, .jr_09_4773                                ;; 09:4768 $28 $09
    inc  [HL]                                          ;; 09:476a $34
    ld   HL, wC080                                     ;; 09:476b $21 $80 $c0
    ld   A, [HL]                                       ;; 09:476e $7e
    add  A, $10                                        ;; 09:476f $c6 $10
    ld   [HL], A                                       ;; 09:4771 $77
    ret                                                ;; 09:4772 $c9
.jr_09_4773:
    ld   A, [wCD17]                                    ;; 09:4773 $fa $17 $cd
    or   A, A                                          ;; 09:4776 $b7
    jr   NZ, .jr_09_4781                               ;; 09:4777 $20 $08
    ld   [HL], $00                                     ;; 09:4779 $36 $00
    ld   A, $60                                        ;; 09:477b $3e $60
    ld   [wC080], A                                    ;; 09:477d $ea $80 $c0
    ret                                                ;; 09:4780 $c9
.jr_09_4781:
    ld   A, [wCD19]                                    ;; 09:4781 $fa $19 $cd
    and  A, $02                                        ;; 09:4784 $e6 $02
    jp   Z, call_00_1e83                               ;; 09:4786 $ca $83 $1e
    ld   A, $09                                        ;; 09:4789 $3e $09
    ld   B, $06                                        ;; 09:478b $06 $06
    call call_00_3470                                  ;; 09:478d $cd $70 $34
    ld   HL, wCD1A                                     ;; 09:4790 $21 $1a $cd
    inc  [HL]                                          ;; 09:4793 $34
    ret                                                ;; 09:4794 $c9

jp_09_4795:
    xor  A, A                                          ;; 09:4795 $af
    ld   [wCD21], A                                    ;; 09:4796 $ea $21 $cd
    ld   [wCD22], A                                    ;; 09:4799 $ea $22 $cd
    jp   call_00_1e79                                  ;; 09:479c $c3 $79 $1e

call_09_479f:
    ld   [wCD1B], A                                    ;; 09:479f $ea $1b $cd
    ld   A, L                                          ;; 09:47a2 $7d
    ld   [wCDE6], A                                    ;; 09:47a3 $ea $e6 $cd
    ld   A, H                                          ;; 09:47a6 $7c
    ld   [wCDE7], A                                    ;; 09:47a7 $ea $e7 $cd
    xor  A, A                                          ;; 09:47aa $af
    ld   [wCD15], A                                    ;; 09:47ab $ea $15 $cd
    ld   [wCD1A], A                                    ;; 09:47ae $ea $1a $cd
    ld   [wCD17], A                                    ;; 09:47b1 $ea $17 $cd
    ld   A, $03                                        ;; 09:47b4 $3e $03
    ld   [wCD19], A                                    ;; 09:47b6 $ea $19 $cd
    call call_09_4951                                  ;; 09:47b9 $cd $51 $49
    ld   HL, wC080                                     ;; 09:47bc $21 $80 $c0
    ld   A, $20                                        ;; 09:47bf $3e $20
    ld   [HL+], A                                      ;; 09:47c1 $22
    ld   [HL], $18                                     ;; 09:47c2 $36 $18
    ld   HL, .data_09_47d9                             ;; 09:47c4 $21 $d9 $47
    ld   DE, wC8B0                                     ;; 09:47c7 $11 $b0 $c8
    call call_00_1f7b                                  ;; 09:47ca $cd $7b $1f
    ld   HL, wCDE6                                     ;; 09:47cd $21 $e6 $cd
    ld   DE, wC8B4                                     ;; 09:47d0 $11 $b4 $c8
    call call_00_1f90                                  ;; 09:47d3 $cd $90 $1f
    jp   call_09_4fef                                  ;; 09:47d6 $c3 $ef $4f
.data_09_47d9:
    db   $01, $01, $12, $10, $00, $00, $00, $00        ;; 09:47d9 ........
    db   $00                                           ;; 09:47e1 .

jp_09_47e2:
    ld   A, $01                                        ;; 09:47e2 $3e $01
    ld   B, $0e                                        ;; 09:47e4 $06 $0e
    call call_00_34e0                                  ;; 09:47e6 $cd $e0 $34
    ld   HL, wCD1A                                     ;; 09:47e9 $21 $1a $cd
    dec  [HL]                                          ;; 09:47ec $35
    ld   A, [wCD17]                                    ;; 09:47ed $fa $17 $cd
    or   A, A                                          ;; 09:47f0 $b7
    ret  Z                                             ;; 09:47f1 $c8
    ld   A, [wC085]                                    ;; 09:47f2 $fa $85 $c0
    cp   A, $80                                        ;; 09:47f5 $fe $80
    ret  Z                                             ;; 09:47f7 $c8
    ld   HL, wCD18                                     ;; 09:47f8 $21 $18 $cd
    inc  [HL]                                          ;; 09:47fb $34
    ld   A, [HL]                                       ;; 09:47fc $7e
    ld   HL, wC084                                     ;; 09:47fd $21 $84 $c0
    or   A, A                                          ;; 09:4800 $b7
    jr   Z, .jr_09_480a                                ;; 09:4801 $28 $07
    cp   A, $08                                        ;; 09:4803 $fe $08
    jr   C, .jr_09_480d                                ;; 09:4805 $38 $06
    ld   [HL], $00                                     ;; 09:4807 $36 $00
    ret                                                ;; 09:4809 $c9
.jr_09_480a:
    ld   [HL], $24                                     ;; 09:480a $36 $24
    ret                                                ;; 09:480c $c9
.jr_09_480d:
    ld   A, [HL]                                       ;; 09:480d $7e
    add  A, $10                                        ;; 09:480e $c6 $10
    ld   [HL], A                                       ;; 09:4810 $77
    ret                                                ;; 09:4811 $c9

jp_09_4812:
    ld   B, $0e                                        ;; 09:4812 $06 $0e
    ld   A, $01                                        ;; 09:4814 $3e $01
    call call_00_3470                                  ;; 09:4816 $cd $70 $34
    ld   HL, wCD1A                                     ;; 09:4819 $21 $1a $cd
    inc  [HL]                                          ;; 09:481c $34
    ld   A, [wCD17]                                    ;; 09:481d $fa $17 $cd
    or   A, A                                          ;; 09:4820 $b7
    ret  Z                                             ;; 09:4821 $c8
    ld   A, [wC085]                                    ;; 09:4822 $fa $85 $c0
    cp   A, $80                                        ;; 09:4825 $fe $80
    ret  Z                                             ;; 09:4827 $c8
    ld   HL, wCD18                                     ;; 09:4828 $21 $18 $cd
    dec  [HL]                                          ;; 09:482b $35
    ld   A, [HL]                                       ;; 09:482c $7e
    ld   HL, wC084                                     ;; 09:482d $21 $84 $c0
    cp   A, $07                                        ;; 09:4830 $fe $07
    jr   Z, .jr_09_4839                                ;; 09:4832 $28 $05
    jr   C, .jr_09_483c                                ;; 09:4834 $38 $06
    ld   [HL], $00                                     ;; 09:4836 $36 $00
    ret                                                ;; 09:4838 $c9
.jr_09_4839:
    ld   [HL], $94                                     ;; 09:4839 $36 $94
    ret                                                ;; 09:483b $c9
.jr_09_483c:
    ld   A, [HL]                                       ;; 09:483c $7e
    sub  A, $10                                        ;; 09:483d $d6 $10
    ld   [HL], A                                       ;; 09:483f $77
    ret                                                ;; 09:4840 $c9

jp_09_4841:
    ld   A, [wCD1B]                                    ;; 09:4841 $fa $1b $cd
    or   A, A                                          ;; 09:4844 $b7
    jp   Z, jp_09_4b34                                 ;; 09:4845 $ca $34 $4b
    jp   jp_09_4cc4                                    ;; 09:4848 $c3 $c4 $4c

call_09_484b:
    call call_09_479f                                  ;; 09:484b $cd $9f $47
    rst  rst_00_0018                                   ;; 09:484e $df
    db   $05                                           ;; 09:484f .
    dw   call_09_4860                                  ;; 09:4850 ?? $00
    dw   call_09_4884                                  ;; 09:4852 pP $01
    dw   call_00_1e83                                  ;; 09:4854 ?? $02
    dw   call_00_1e83                                  ;; 09:4856 ?? $03
    dw   call_09_4892                                  ;; 09:4858 ?? $04
    dw   call_09_4892                                  ;; 09:485a ?? $05
    dw   call_09_48a9                                  ;; 09:485c ?? $06
    dw   call_09_48ca                                  ;; 09:485e ?? $07

call_09_4860:
    ld   HL, wCD17                                     ;; 09:4860 $21 $17 $cd
    ld   A, [HL]                                       ;; 09:4863 $7e
    or   A, A                                          ;; 09:4864 $b7
    jr   Z, .jr_09_486f                                ;; 09:4865 $28 $08
    xor  A, A                                          ;; 09:4867 $af
    ld   [HL], A                                       ;; 09:4868 $77
    ld   [wC084], A                                    ;; 09:4869 $ea $84 $c0
    jp   jp_09_4841                                    ;; 09:486c $c3 $41 $48
.jr_09_486f:
    inc  [HL]                                          ;; 09:486f $34
    ld   HL, wC080                                     ;; 09:4870 $21 $80 $c0
    ld   A, [HL+]                                      ;; 09:4873 $2a
    add  A, $04                                        ;; 09:4874 $c6 $04
    ld   [wC084], A                                    ;; 09:4876 $ea $84 $c0
    ld   A, [HL]                                       ;; 09:4879 $7e
    ld   [wC085], A                                    ;; 09:487a $ea $85 $c0
    ld   A, [wCD15]                                    ;; 09:487d $fa $15 $cd
    ld   [wCD18], A                                    ;; 09:4880 $ea $18 $cd
    ret                                                ;; 09:4883 $c9

call_09_4884:
    ld   HL, wCD17                                     ;; 09:4884 $21 $17 $cd
    ld   A, [HL]                                       ;; 09:4887 $7e
    or   A, A                                          ;; 09:4888 $b7
    jp   Z, call_00_1e79                               ;; 09:4889 $ca $79 $1e
    xor  A, A                                          ;; 09:488c $af
    ld   [HL], A                                       ;; 09:488d $77
    ld   [wC084], A                                    ;; 09:488e $ea $84 $c0
    ret                                                ;; 09:4891 $c9

call_09_4892:
    ld   HL, wC081                                     ;; 09:4892 $21 $81 $c0
    ld   A, [HL]                                       ;; 09:4895 $7e
    xor  A, $98                                        ;; 09:4896 $ee $98
    ld   [HL-], A                                      ;; 09:4898 $32
    cp   A, $80                                        ;; 09:4899 $fe $80
    jr   Z, .jr_09_48a2                                ;; 09:489b $28 $05
    ld   A, [wCDD4]                                    ;; 09:489d $fa $d4 $cd
    ld   [HL], A                                       ;; 09:48a0 $77
    ret                                                ;; 09:48a1 $c9
.jr_09_48a2:
    ld   A, [HL]                                       ;; 09:48a2 $7e
    ld   [wCDD4], A                                    ;; 09:48a3 $ea $d4 $cd
    ld   [HL], $50                                     ;; 09:48a6 $36 $50
    ret                                                ;; 09:48a8 $c9

call_09_48a9:
    ld   A, [wC081]                                    ;; 09:48a9 $fa $81 $c0
    cp   A, $80                                        ;; 09:48ac $fe $80
    jr   Z, call_09_4892                               ;; 09:48ae $28 $e2
    ld   HL, wCD15                                     ;; 09:48b0 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:48b3 $7e
    or   A, A                                          ;; 09:48b4 $b7
    jr   Z, .jr_09_48c0                                ;; 09:48b5 $28 $09
    dec  [HL]                                          ;; 09:48b7 $35
    ld   HL, wC080                                     ;; 09:48b8 $21 $80 $c0
    ld   A, [HL]                                       ;; 09:48bb $7e
    sub  A, $10                                        ;; 09:48bc $d6 $10
    ld   [HL], A                                       ;; 09:48be $77
    ret                                                ;; 09:48bf $c9
.jr_09_48c0:
    ld   A, [wCD19]                                    ;; 09:48c0 $fa $19 $cd
    rrca                                               ;; 09:48c3 $0f
    jp   NC, call_00_1e83                              ;; 09:48c4 $d2 $83 $1e
    jp   jp_09_47e2                                    ;; 09:48c7 $c3 $e2 $47

call_09_48ca:
    ld   A, [wC081]                                    ;; 09:48ca $fa $81 $c0
    cp   A, $80                                        ;; 09:48cd $fe $80
    jr   Z, call_09_4892                               ;; 09:48cf $28 $c1
    ld   HL, wCD15                                     ;; 09:48d1 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:48d4 $7e
    cp   A, $07                                        ;; 09:48d5 $fe $07
    jr   Z, .jr_09_48e3                                ;; 09:48d7 $28 $0a
    inc  A                                             ;; 09:48d9 $3c
    ld   [HL], A                                       ;; 09:48da $77
    ld   HL, wC080                                     ;; 09:48db $21 $80 $c0
    ld   A, [HL]                                       ;; 09:48de $7e
    add  A, $10                                        ;; 09:48df $c6 $10
    ld   [HL], A                                       ;; 09:48e1 $77
    ret                                                ;; 09:48e2 $c9
.jr_09_48e3:
    ld   A, [wCD19]                                    ;; 09:48e3 $fa $19 $cd
    and  A, $02                                        ;; 09:48e6 $e6 $02
    jp   Z, call_00_1e83                               ;; 09:48e8 $ca $83 $1e
    jp   jp_09_4812                                    ;; 09:48eb $c3 $12 $48

call_09_48ee:
    call call_00_1fcd                                  ;; 09:48ee $cd $cd $1f
    ld   DE, wC50D                                     ;; 09:48f1 $11 $0d $c5
    add  HL, DE                                        ;; 09:48f4 $19
    ld   A, [HL]                                       ;; 09:48f5 $7e
    and  A, $07                                        ;; 09:48f6 $e6 $07
    cp   A, $02                                        ;; 09:48f8 $fe $02
    jr   Z, .jr_09_4901                                ;; 09:48fa $28 $05
    jr   C, .jr_09_4908                                ;; 09:48fc $38 $0a
    dec  A                                             ;; 09:48fe $3d
    jr   .jr_09_4908                                   ;; 09:48ff $18 $07
.jr_09_4901:
    ld   A, $04                                        ;; 09:4901 $3e $04
    bit  7, [HL]                                       ;; 09:4903 $cb $7e
    jr   Z, .jr_09_4908                                ;; 09:4905 $28 $01
    inc  A                                             ;; 09:4907 $3c
.jr_09_4908:
    call call_00_2448                                  ;; 09:4908 $cd $48 $24
    ld   C, $06                                        ;; 09:490b $0e $06
    ret                                                ;; 09:490d $c9

call_09_490e:
    push HL                                            ;; 09:490e $e5
    push DE                                            ;; 09:490f $d5
    xor  A, A                                          ;; 09:4910 $af
    ld   HL, wC050                                     ;; 09:4911 $21 $50 $c0
    ld   DE, $04                                       ;; 09:4914 $11 $04 $00
    ld   B, $0c                                        ;; 09:4917 $06 $0c
.jr_09_4919:
    ld   [HL], A                                       ;; 09:4919 $77
    add  HL, DE                                        ;; 09:491a $19
    dec  B                                             ;; 09:491b $05
    jr   NZ, .jr_09_4919                               ;; 09:491c $20 $fb
    pop  DE                                            ;; 09:491e $d1
    pop  HL                                            ;; 09:491f $e1
    ret                                                ;; 09:4920 $c9
    db   $cd, $83, $1e, $fa, $80, $c0, $f5, $fe        ;; 09:4921 ????????
    db   $48, $38, $0b, $fe, $98, $30, $07, $af        ;; 09:4929 ????????
    db   $ea, $80, $c0, $cd, $0e, $49, $21, $ae        ;; 09:4931 ????????
    db   $6f, $01, $10, $08, $3e, $24, $df, $00        ;; 09:4939 ????????
    db   $df, $2e, $47, $3e, $01, $ea, $39, $cd        ;; 09:4941 ????????
    db   $f1, $ea, $80, $c0, $78, $e6, $02, $c9        ;; 09:4949 ????????

call_09_4951:
    push AF                                            ;; 09:4951 $f5
    ld   A, $50                                        ;; 09:4952 $3e $50
    ld   [wC088], A                                    ;; 09:4954 $ea $88 $c0
    ld   A, $58                                        ;; 09:4957 $3e $58
    ld   [wC08C], A                                    ;; 09:4959 $ea $8c $c0
    pop  AF                                            ;; 09:495c $f1
    ret                                                ;; 09:495d $c9

call_09_495e:
    ld   A, $01                                        ;; 09:495e $3e $01
    ld   [wCD25], A                                    ;; 09:4960 $ea $25 $cd
    ret                                                ;; 09:4963 $c9
    call call_09_4494                                  ;; 09:4964 $cd $94 $44
    jr   NZ, .jr_09_496b                               ;; 09:4967 $20 $02
    dec  A                                             ;; 09:4969 $3d
    ret                                                ;; 09:496a $c9
.jr_09_496b:
    ld   A, $01                                        ;; 09:496b $3e $01
    ld   [wCD3C], A                                    ;; 09:496d $ea $3c $cd
    ld   [wCD39], A                                    ;; 09:4970 $ea $39 $cd
    ld   HL, wC080                                     ;; 09:4973 $21 $80 $c0
    ld   A, $48                                        ;; 09:4976 $3e $48
    ld   [HL+], A                                      ;; 09:4978 $22
    ld   [HL], $10                                     ;; 09:4979 $36 $10
    xor  A, A                                          ;; 09:497b $af
    ld   [wCD15], A                                    ;; 09:497c $ea $15 $cd
    ld   A, $02                                        ;; 09:497f $3e $02
    ld   [wCD26], A                                    ;; 09:4981 $ea $26 $cd
    call call_09_44e2                                  ;; 09:4984 $cd $e2 $44
    call call_00_3a0c                                  ;; 09:4987 $cd $0c $3a
    rst  rst_00_0018                                   ;; 09:498a $df
    db   $05                                           ;; 09:498b ?
    dw   call_09_499c                                  ;; 09:498c ?? $00
    dw   call_00_1e83                                  ;; 09:498e ?? $01
    dw   call_00_1e83                                  ;; 09:4990 ?? $02
    dw   call_00_1e83                                  ;; 09:4992 ?? $03
    dw   call_00_1e83                                  ;; 09:4994 ?? $04
    dw   call_00_1e83                                  ;; 09:4996 ?? $05
    dw   call_09_4465                                  ;; 09:4998 ?? $06
    dw   call_09_4484                                  ;; 09:499a ?? $07

call_09_499c:
    ld   A, [wCD15]                                    ;; 09:499c $fa $15 $cd
    ld   B, A                                          ;; 09:499f $47
    call call_00_1fcd                                  ;; 09:49a0 $cd $cd $1f
    ld   DE, wC503                                     ;; 09:49a3 $11 $03 $c5
    add  HL, DE                                        ;; 09:49a6 $19
    ld   A, [HL]                                       ;; 09:49a7 $7e
    inc  A                                             ;; 09:49a8 $3c
    jp   Z, call_00_1e83                               ;; 09:49a9 $ca $83 $1e
    ld   A, B                                          ;; 09:49ac $78
    call call_09_4e0c                                  ;; 09:49ad $cd $0c $4e
    call call_00_39f3                                  ;; 09:49b0 $cd $f3 $39
    xor  A, A                                          ;; 09:49b3 $af
    ld   [wCD3C], A                                    ;; 09:49b4 $ea $3c $cd
    ld   [wCD26], A                                    ;; 09:49b7 $ea $26 $cd
    call call_00_20cf                                  ;; 09:49ba $cd $cf $20
    jp   call_00_1e79                                  ;; 09:49bd $c3 $79 $1e

call_09_49c0:
    ld   A, [wCE27]                                    ;; 09:49c0 $fa $27 $ce
    push AF                                            ;; 09:49c3 $f5
    rst  rst_00_0018                                   ;; 09:49c4 $df
    db   $2a                                           ;; 09:49c5 ?
    pop  AF                                            ;; 09:49c6 $f1
    ld   [wCE27], A                                    ;; 09:49c7 $ea $27 $ce
    ld   A, [wCE28]                                    ;; 09:49ca $fa $28 $ce
    and  A, $60                                        ;; 09:49cd $e6 $60
    ld   A, $81                                        ;; 09:49cf $3e $81
    jr   Z, .jr_09_4a24                                ;; 09:49d1 $28 $51
    ld   A, [wCE25]                                    ;; 09:49d3 $fa $25 $ce
    or   A, A                                          ;; 09:49d6 $b7
    jr   NZ, .jr_09_49f4                               ;; 09:49d7 $20 $1b
    ld   A, [wCE27]                                    ;; 09:49d9 $fa $27 $ce
    or   A, A                                          ;; 09:49dc $b7
    jr   NZ, .jr_09_49f4                               ;; 09:49dd $20 $15
    ld   A, [wCE26]                                    ;; 09:49df $fa $26 $ce
    cp   A, $30                                        ;; 09:49e2 $fe $30
    jr   NC, .jr_09_49f4                               ;; 09:49e4 $30 $0e
    call call_09_4d79                                  ;; 09:49e6 $cd $79 $4d
    ld   A, $80                                        ;; 09:49e9 $3e $80
    jr   NZ, .jr_09_4a27                               ;; 09:49eb $20 $3a
    call call_09_4a2c                                  ;; 09:49ed $cd $2c $4a
    ld   A, $80                                        ;; 09:49f0 $3e $80
    jr   NZ, .jr_09_4a27                               ;; 09:49f2 $20 $33
.jr_09_49f4:
    ld   A, [wCD36]                                    ;; 09:49f4 $fa $36 $cd
    ld   [wCE1C], A                                    ;; 09:49f7 $ea $1c $ce
    call call_09_4165                                  ;; 09:49fa $cd $65 $41
    inc  A                                             ;; 09:49fd $3c
    ld   A, $82                                        ;; 09:49fe $3e $82
    jr   Z, .jr_09_4a27                                ;; 09:4a00 $28 $25
    call call_09_521a                                  ;; 09:4a02 $cd $1a $52
.jr_09_4a05:
    ld   A, [wCDEA]                                    ;; 09:4a05 $fa $ea $cd
    dec  A                                             ;; 09:4a08 $3d
    cp   A, $81                                        ;; 09:4a09 $fe $81
    ret  C                                             ;; 09:4a0b $d8
    ld   A, [wCE1C]                                    ;; 09:4a0c $fa $1c $ce
    ld   [wCD36], A                                    ;; 09:4a0f $ea $36 $cd
    rst  rst_00_0018                                   ;; 09:4a12 $df
    db   $49                                           ;; 09:4a13 ?
    ld   HL, wCD1D                                     ;; 09:4a14 $21 $1d $cd
    ld   A, [HL+]                                      ;; 09:4a17 $2a
    ld   [wCD15], A                                    ;; 09:4a18 $ea $15 $cd
    ld   A, [HL+]                                      ;; 09:4a1b $2a
    ld   [wC080], A                                    ;; 09:4a1c $ea $80 $c0
    ld   A, [HL]                                       ;; 09:4a1f $7e
    ld   [wC081], A                                    ;; 09:4a20 $ea $81 $c0
    ret                                                ;; 09:4a23 $c9
.jr_09_4a24:
    call call_00_1e83                                  ;; 09:4a24 $cd $83 $1e
.jr_09_4a27:
    ld   [wCDEA], A                                    ;; 09:4a27 $ea $ea $cd
    jr   .jr_09_4a05                                   ;; 09:4a2a $18 $d9

call_09_4a2c:
    call call_00_1fc4                                  ;; 09:4a2c $cd $c4 $1f
    ld   DE, wC515                                     ;; 09:4a2f $11 $15 $c5
    add  HL, DE                                        ;; 09:4a32 $19
    ld   A, [wCE29]                                    ;; 09:4a33 $fa $29 $ce
    ld   E, A                                          ;; 09:4a36 $5f
    inc  [HL]                                          ;; 09:4a37 $34
    dec  [HL]                                          ;; 09:4a38 $35
    dec  HL                                            ;; 09:4a39 $2b
    jr   NZ, .jr_09_4a48                               ;; 09:4a3a $20 $0c
    ld   A, [HL]                                       ;; 09:4a3c $7e
    cp   A, E                                          ;; 09:4a3d $bb
    jr   NC, .jr_09_4a48                               ;; 09:4a3e $30 $08
    ld   HL, data_09_71e5                              ;; 09:4a40 $21 $e5 $71
    rst  rst_00_0018                                   ;; 09:4a43 $df
    db   $8c                                           ;; 09:4a44 ?
    or   A, $01                                        ;; 09:4a45 $f6 $01
    ret                                                ;; 09:4a47 $c9
.jr_09_4a48:
    xor  A, A                                          ;; 09:4a48 $af
    ret                                                ;; 09:4a49 $c9

call_09_4a4a:
    call call_09_413f                                  ;; 09:4a4a $cd $3f $41
    inc  A                                             ;; 09:4a4d $3c
    jr   Z, jr_09_4a7f                                 ;; 09:4a4e $28 $2f
    ld   HL, wCDE6                                     ;; 09:4a50 $21 $e6 $cd
    ld   A, $43                                        ;; 09:4a53 $3e $43
    ld   [HL+], A                                      ;; 09:4a55 $22
    ld   [HL], $71                                     ;; 09:4a56 $36 $71
    xor  A, A                                          ;; 09:4a58 $af
    ld   [wCD15], A                                    ;; 09:4a59 $ea $15 $cd
    rst  rst_00_0018                                   ;; 09:4a5c $df
    db   $49                                           ;; 09:4a5d .
    ld   HL, wC080                                     ;; 09:4a5e $21 $80 $c0
    ld   A, $20                                        ;; 09:4a61 $3e $20
    ld   [HL+], A                                      ;; 09:4a63 $22
    ld   [HL], $10                                     ;; 09:4a64 $36 $10
    call call_09_4af6                                  ;; 09:4a66 $cd $f6 $4a
    rst  rst_00_0018                                   ;; 09:4a69 $df
    db   $05                                           ;; 09:4a6a .
    dw   call_09_4a85                                  ;; 09:4a6b ?? $00
    dw   call_09_4a7b                                  ;; 09:4a6d pP $01
    dw   call_00_1e83                                  ;; 09:4a6f ?? $02
    dw   call_00_1e83                                  ;; 09:4a71 ?? $03
    dw   call_09_4ab0                                  ;; 09:4a73 ?? $04
    dw   call_09_4ab0                                  ;; 09:4a75 ?? $05
    dw   call_09_4ab8                                  ;; 09:4a77 ?? $06
    dw   call_09_4adf                                  ;; 09:4a79 pP $07

call_09_4a7b:
    pop  HL                                            ;; 09:4a7b $e1
    pop  HL                                            ;; 09:4a7c $e1
    jr   call_09_4a4a                                  ;; 09:4a7d $18 $cb

jr_09_4a7f:
    ld   A, $02                                        ;; 09:4a7f $3e $02
    ld   [wCD15], A                                    ;; 09:4a81 $ea $15 $cd
    ret                                                ;; 09:4a84 $c9

call_09_4a85:
    call call_00_1fc4                                  ;; 09:4a85 $cd $c4 $1f
    ld   DE, wC548                                     ;; 09:4a88 $11 $48 $c5
    add  HL, DE                                        ;; 09:4a8b $19
    ld   A, [wCD15]                                    ;; 09:4a8c $fa $15 $cd
    add  A, A                                          ;; 09:4a8f $87
    ld   E, A                                          ;; 09:4a90 $5f
    ld   A, [wC081]                                    ;; 09:4a91 $fa $81 $c0
    cp   A, $10                                        ;; 09:4a94 $fe $10
    jr   Z, .jr_09_4a99                                ;; 09:4a96 $28 $01
    inc  E                                             ;; 09:4a98 $1c
.jr_09_4a99:
    ld   D, $00                                        ;; 09:4a99 $16 $00
    add  HL, DE                                        ;; 09:4a9b $19
    ld   A, [HL]                                       ;; 09:4a9c $7e
    ld   [wCE26], A                                    ;; 09:4a9d $ea $26 $ce
    ld   A, $01                                        ;; 09:4aa0 $3e $01
    ld   [wCE25], A                                    ;; 09:4aa2 $ea $25 $ce
    call call_09_52f9                                  ;; 09:4aa5 $cd $f9 $52
    call NZ, call_00_1e83                              ;; 09:4aa8 $c4 $83 $1e
    call Z, call_09_49c0                               ;; 09:4aab $cc $c0 $49
    jr   call_09_4af6                                  ;; 09:4aae $18 $46

call_09_4ab0:
    ld   HL, wC081                                     ;; 09:4ab0 $21 $81 $c0
    ld   A, [HL]                                       ;; 09:4ab3 $7e
    xor  A, $48                                        ;; 09:4ab4 $ee $48
    ld   [HL], A                                       ;; 09:4ab6 $77
    ret                                                ;; 09:4ab7 $c9

call_09_4ab8:
    ld   HL, wCD15                                     ;; 09:4ab8 $21 $15 $cd
    ld   A, [HL]                                       ;; 09:4abb $7e
    or   A, A                                          ;; 09:4abc $b7
    jp   Z, call_00_1e83                               ;; 09:4abd $ca $83 $1e
    dec  [HL]                                          ;; 09:4ac0 $35
    ld   HL, wCDE6                                     ;; 09:4ac1 $21 $e6 $cd
    ld   A, [HL+]                                      ;; 09:4ac4 $2a
    ld   H, [HL]                                       ;; 09:4ac5 $66
    ld   L, A                                          ;; 09:4ac6 $6f
    ld   B, $01                                        ;; 09:4ac7 $06 $01
    call call_00_1ec9                                  ;; 09:4ac9 $cd $c9 $1e

jr_09_4acc:
    ld   A, L                                          ;; 09:4acc $7d
    ld   [wCDE6], A                                    ;; 09:4acd $ea $e6 $cd
    ld   A, H                                          ;; 09:4ad0 $7c
    ld   [wCDE7], A                                    ;; 09:4ad1 $ea $e7 $cd
    ld   DE, $101                                      ;; 09:4ad4 $11 $01 $01
    ld   BC, $212                                      ;; 09:4ad7 $01 $12 $02
    ld   A, $84                                        ;; 09:4ada $3e $84
    rst  rst_00_0018                                   ;; 09:4adc $df
    db   $00                                           ;; 09:4add .
    ret                                                ;; 09:4ade $c9

call_09_4adf:
    ld   HL, wCD15                                     ;; 09:4adf $21 $15 $cd
    ld   A, [HL]                                       ;; 09:4ae2 $7e
    cp   A, $03                                        ;; 09:4ae3 $fe $03
    jp   Z, call_00_1e83                               ;; 09:4ae5 $ca $83 $1e
    inc  [HL]                                          ;; 09:4ae8 $34
    ld   HL, wCDE6                                     ;; 09:4ae9 $21 $e6 $cd
    ld   A, [HL+]                                      ;; 09:4aec $2a
    ld   H, [HL]                                       ;; 09:4aed $66
    ld   L, A                                          ;; 09:4aee $6f
    ld   B, $01                                        ;; 09:4aef $06 $01
    call call_00_1ebb                                  ;; 09:4af1 $cd $bb $1e
    jr   jr_09_4acc                                    ;; 09:4af4 $18 $d6

call_09_4af6:
    ld   A, $03                                        ;; 09:4af6 $3e $03
    ld   [wCD19], A                                    ;; 09:4af8 $ea $19 $cd
    ld   HL, .data_09_4b1d                             ;; 09:4afb $21 $1d $4b
    ld   DE, wC8B0                                     ;; 09:4afe $11 $b0 $c8
    ld   B, $17                                        ;; 09:4b01 $06 $17
    rst  rst_00_0018                                   ;; 09:4b03 $df
    db   $03                                           ;; 09:4b04 .
    ld   HL, wCDE6                                     ;; 09:4b05 $21 $e6 $cd
    ld   A, [HL+]                                      ;; 09:4b08 $2a
    ld   [wC8BB], A                                    ;; 09:4b09 $ea $bb $c8
    ld   A, [HL]                                       ;; 09:4b0c $7e
    ld   [wC8BC], A                                    ;; 09:4b0d $ea $bc $c8
    ld   A, $18                                        ;; 09:4b10 $3e $18
    ld   [wC088], A                                    ;; 09:4b12 $ea $88 $c0
    ld   A, $20                                        ;; 09:4b15 $3e $20
    ld   [wC08C], A                                    ;; 09:4b17 $ea $8c $c0
    jp   call_09_4fef                                  ;; 09:4b1a $c3 $ef $4f
.data_09_4b1d:
    db   $01, $04, $12, $04, $6b, $71, $00, $01        ;; 09:4b1d ........
    db   $01, $12, $02, $43, $71, $00, $01, $09        ;; 09:4b25 ........
    db   $12, $08, $94, $71, $00, $00, $00             ;; 09:4b2d .......

jp_09_4b34:
    ld   B, $ff                                        ;; 09:4b34 $06 $ff
    ld   A, [wC085]                                    ;; 09:4b36 $fa $85 $c0
    cp   A, $80                                        ;; 09:4b39 $fe $80
    jr   Z, .jr_09_4b46                                ;; 09:4b3b $28 $09
    ld   A, [wCD1A]                                    ;; 09:4b3d $fa $1a $cd
    ld   B, A                                          ;; 09:4b40 $47
    ld   A, [wCD18]                                    ;; 09:4b41 $fa $18 $cd
    add  A, B                                          ;; 09:4b44 $80
    ld   B, A                                          ;; 09:4b45 $47
.jr_09_4b46:
    ld   C, $ff                                        ;; 09:4b46 $0e $ff
    ld   A, [wC081]                                    ;; 09:4b48 $fa $81 $c0
    cp   A, $80                                        ;; 09:4b4b $fe $80
    jr   Z, .jr_09_4b58                                ;; 09:4b4d $28 $09
    ld   A, [wCD1A]                                    ;; 09:4b4f $fa $1a $cd
    ld   C, A                                          ;; 09:4b52 $4f
    ld   A, [wCD15]                                    ;; 09:4b53 $fa $15 $cd
    add  A, C                                          ;; 09:4b56 $81
    ld   C, A                                          ;; 09:4b57 $4f
.jr_09_4b58:
    bit  7, B                                          ;; 09:4b58 $cb $78
    jr   NZ, .jr_09_4b88                               ;; 09:4b5a $20 $2c
    bit  7, C                                          ;; 09:4b5c $cb $79
    jr   NZ, .jr_09_4b8e                               ;; 09:4b5e $20 $2e
    ld   A, B                                          ;; 09:4b60 $78
    cp   A, C                                          ;; 09:4b61 $b9
    jr   Z, .jr_09_4b7e                                ;; 09:4b62 $28 $1a
    add  A, A                                          ;; 09:4b64 $87
    ld   HL, wC6FF                                     ;; 09:4b65 $21 $ff $c6
    rst  add_hl_a                                      ;; 09:4b68 $c7
    push HL                                            ;; 09:4b69 $e5
    ld   A, [HL+]                                      ;; 09:4b6a $2a
    ld   E, A                                          ;; 09:4b6b $5f
    ld   D, [HL]                                       ;; 09:4b6c $56
    ld   A, C                                          ;; 09:4b6d $79
    add  A, A                                          ;; 09:4b6e $87
    ld   HL, wC6FF                                     ;; 09:4b6f $21 $ff $c6
    rst  add_hl_a                                      ;; 09:4b72 $c7
    pop  BC                                            ;; 09:4b73 $c1
    ld   A, [HL]                                       ;; 09:4b74 $7e
    ld   [BC], A                                       ;; 09:4b75 $02
    ld   [HL], E                                       ;; 09:4b76 $73
    inc  HL                                            ;; 09:4b77 $23
    inc  BC                                            ;; 09:4b78 $03
    ld   A, [HL]                                       ;; 09:4b79 $7e
    ld   [BC], A                                       ;; 09:4b7a $02
    ld   [HL], D                                       ;; 09:4b7b $72
    jr   .jr_09_4ba7                                   ;; 09:4b7c $18 $29
.jr_09_4b7e:
    call call_09_4bc8                                  ;; 09:4b7e $cd $c8 $4b
    ld   A, $ff                                        ;; 09:4b81 $3e $ff
    ld   [wCA16], A                                    ;; 09:4b83 $ea $16 $ca
    jr   .jr_09_4ba7                                   ;; 09:4b86 $18 $1f
.jr_09_4b88:
    bit  7, C                                          ;; 09:4b88 $cb $79
    ret  NZ                                            ;; 09:4b8a $c0
    ld   A, C                                          ;; 09:4b8b $79
    jr   .jr_09_4b8f                                   ;; 09:4b8c $18 $01
.jr_09_4b8e:
    ld   A, B                                          ;; 09:4b8e $78
.jr_09_4b8f:
    add  A, A                                          ;; 09:4b8f $87
    ld   HL, wC6FF                                     ;; 09:4b90 $21 $ff $c6
    rst  add_hl_a                                      ;; 09:4b93 $c7
    ld   A, [HL]                                       ;; 09:4b94 $7e
    cp   A, $d8                                        ;; 09:4b95 $fe $d8
    jp   NC, call_00_1e83                              ;; 09:4b97 $d2 $83 $1e
    cp   A, $38                                        ;; 09:4b9a $fe $38
    jr   C, .jr_09_4ba3                                ;; 09:4b9c $38 $05
    cp   A, $3d                                        ;; 09:4b9e $fe $3d
    jp   C, call_00_1e83                               ;; 09:4ba0 $da $83 $1e
.jr_09_4ba3:
    ld   A, $ff                                        ;; 09:4ba3 $3e $ff
    ld   [HL+], A                                      ;; 09:4ba5 $22
    ld   [HL], A                                       ;; 09:4ba6 $77
.jr_09_4ba7:
    ld   HL, wCDE6                                     ;; 09:4ba7 $21 $e6 $cd
    ld   DE, wC8B4                                     ;; 09:4baa $11 $b4 $c8
    call call_00_1f90                                  ;; 09:4bad $cd $90 $1f
    jp   call_09_4fef                                  ;; 09:4bb0 $c3 $ef $4f

call_09_4bb3:
    dec  [HL]                                          ;; 09:4bb3 $35
    ret  NZ                                            ;; 09:4bb4 $c0
    dec  [HL]                                          ;; 09:4bb5 $35
    dec  HL                                            ;; 09:4bb6 $2b
    ld   [HL], $ff                                     ;; 09:4bb7 $36 $ff
    ret                                                ;; 09:4bb9 $c9

jr_09_4bba:
    ld   A, $19                                        ;; 09:4bba $3e $19
    ldh  [hFFBC], A                                    ;; 09:4bbc $e0 $bc
    call call_09_4bb3                                  ;; 09:4bbe $cd $b3 $4b
    rst  rst_00_0018                                   ;; 09:4bc1 $df
    db   $08                                           ;; 09:4bc2 ?
    ret                                                ;; 09:4bc3 $c9

jr_09_4bc4:
    rst  rst_00_0018                                   ;; 09:4bc4 $df
    db   $7e                                           ;; 09:4bc5 ?
    jr   jr_09_4c35                                    ;; 09:4bc6 $18 $6d

call_09_4bc8:
    add  A, A                                          ;; 09:4bc8 $87
    ld   HL, wC6FF                                     ;; 09:4bc9 $21 $ff $c6
    rst  add_hl_a                                      ;; 09:4bcc $c7
    ld   A, [HL+]                                      ;; 09:4bcd $2a
    ld   [wCE26], A                                    ;; 09:4bce $ea $26 $ce
    push HL                                            ;; 09:4bd1 $e5
    call call_09_4db4                                  ;; 09:4bd2 $cd $b4 $4d
    pop  HL                                            ;; 09:4bd5 $e1
    jr   NZ, jr_09_4c35                                ;; 09:4bd6 $20 $5d
    ld   A, [wCE26]                                    ;; 09:4bd8 $fa $26 $ce
    cp   A, $e6                                        ;; 09:4bdb $fe $e6
    jr   Z, jr_09_4bc4                                 ;; 09:4bdd $28 $e5
    cp   A, $d2                                        ;; 09:4bdf $fe $d2
    jp   NC, call_00_1e83                              ;; 09:4be1 $d2 $83 $1e
    cp   A, $30                                        ;; 09:4be4 $fe $30
    jr   C, jr_09_4c4c                                 ;; 09:4be6 $38 $64
    cp   A, $cb                                        ;; 09:4be8 $fe $cb
    jr   Z, jr_09_4bba                                 ;; 09:4bea $28 $ce
    xor  A, A                                          ;; 09:4bec $af
    ld   [wCE25], A                                    ;; 09:4bed $ea $25 $ce
    inc  A                                             ;; 09:4bf0 $3c
    ld   [wCE27], A                                    ;; 09:4bf1 $ea $27 $ce
    push HL                                            ;; 09:4bf4 $e5
    ld   HL, wC683                                     ;; 09:4bf5 $21 $83 $c6
    ld   A, [HL]                                       ;; 09:4bf8 $7e
    push AF                                            ;; 09:4bf9 $f5
    ld   A, [wCE26]                                    ;; 09:4bfa $fa $26 $ce
    cp   A, $cd                                        ;; 09:4bfd $fe $cd
    jr   C, .jr_09_4c07                                ;; 09:4bff $38 $06
    cp   A, $d1                                        ;; 09:4c01 $fe $d1
    jr   NC, .jr_09_4c07                               ;; 09:4c03 $30 $02
    ld   [HL], $ff                                     ;; 09:4c05 $36 $ff
.jr_09_4c07:
    call call_09_49c0                                  ;; 09:4c07 $cd $c0 $49
    pop  AF                                            ;; 09:4c0a $f1
    ld   [wC683], A                                    ;; 09:4c0b $ea $83 $c6
    pop  HL                                            ;; 09:4c0e $e1
    ld   A, [wCE26]                                    ;; 09:4c0f $fa $26 $ce
    cp   A, $c0                                        ;; 09:4c12 $fe $c0
    jr   C, jp_09_4c1d                                 ;; 09:4c14 $38 $07
    ld   A, [wCDEA]                                    ;; 09:4c16 $fa $ea $cd
    or   A, A                                          ;; 09:4c19 $b7
    call Z, call_09_4bb3                               ;; 09:4c1a $cc $b3 $4b

jp_09_4c1d:
    ld   A, [wCDEA]                                    ;; 09:4c1d $fa $ea $cd
    dec  A                                             ;; 09:4c20 $3d
    cp   A, $81                                        ;; 09:4c21 $fe $81
    ret  C                                             ;; 09:4c23 $d8

jp_09_4c24:
    rst  rst_00_0018                                   ;; 09:4c24 $df
    db   $49                                           ;; 09:4c25 ?
    ld   HL, wCD1D                                     ;; 09:4c26 $21 $1d $cd
    ld   A, [HL+]                                      ;; 09:4c29 $2a
    ld   [wCD15], A                                    ;; 09:4c2a $ea $15 $cd
    ld   A, [HL+]                                      ;; 09:4c2d $2a
    ld   [wC080], A                                    ;; 09:4c2e $ea $80 $c0
    ld   A, [HL]                                       ;; 09:4c31 $7e
    ld   [wC081], A                                    ;; 09:4c32 $ea $81 $c0

jr_09_4c35:
    call call_09_4951                                  ;; 09:4c35 $cd $51 $49
    ld   HL, .data_09_4c48                             ;; 09:4c38 $21 $48 $4c
    ld   DE, wC8B0                                     ;; 09:4c3b $11 $b0 $c8
    rst  rst_00_0018                                   ;; 09:4c3e $df
    db   $02                                           ;; 09:4c3f ?
    xor  A, A                                          ;; 09:4c40 $af
    ld   HL, wC8B6                                     ;; 09:4c41 $21 $b6 $c8
    ld   [HL+], A                                      ;; 09:4c44 $22
    ld   [HL+], A                                      ;; 09:4c45 $22
    ld   [HL+], A                                      ;; 09:4c46 $22
    ret                                                ;; 09:4c47 $c9
.data_09_4c48:
    db   $01, $01, $12, $10                            ;; 09:4c48 ????

jr_09_4c4c:
    ld   [wCD20], A                                    ;; 09:4c4c $ea $20 $cd
    push HL                                            ;; 09:4c4f $e5
    ld   HL, wC683                                     ;; 09:4c50 $21 $83 $c6
    ld   A, [HL]                                       ;; 09:4c53 $7e
    push AF                                            ;; 09:4c54 $f5
    ld   [HL], $ff                                     ;; 09:4c55 $36 $ff
    call call_09_4160                                  ;; 09:4c57 $cd $60 $41
    pop  AF                                            ;; 09:4c5a $f1
    ld   [wC683], A                                    ;; 09:4c5b $ea $83 $c6
    ld   A, [wCD36]                                    ;; 09:4c5e $fa $36 $cd
    cp   A, $ff                                        ;; 09:4c61 $fe $ff
    jp   Z, .jp_09_4cc0                                ;; 09:4c63 $ca $c0 $4c
    call call_00_1fcd                                  ;; 09:4c66 $cd $cd $1f
    ld   DE, wC551                                     ;; 09:4c69 $11 $51 $c5
    add  HL, DE                                        ;; 09:4c6c $19
    ld   A, [wCD20]                                    ;; 09:4c6d $fa $20 $cd
    rrca                                               ;; 09:4c70 $0f
    rrca                                               ;; 09:4c71 $0f
    rrca                                               ;; 09:4c72 $0f
    and  A, $1f                                        ;; 09:4c73 $e6 $1f
    xor  A, $01                                        ;; 09:4c75 $ee $01
    rst  add_hl_a                                      ;; 09:4c77 $c7
    ld   A, [wCD20]                                    ;; 09:4c78 $fa $20 $cd
    and  A, $07                                        ;; 09:4c7b $e6 $07
    call call_00_1ef1                                  ;; 09:4c7d $cd $f1 $1e
    ld   C, A                                          ;; 09:4c80 $4f
    and  A, [HL]                                       ;; 09:4c81 $a6
    jr   NZ, .jr_09_4cbb                               ;; 09:4c82 $20 $37
    push HL                                            ;; 09:4c84 $e5
    call call_00_1fcd                                  ;; 09:4c85 $cd $cd $1f
    ld   DE, wC551                                     ;; 09:4c88 $11 $51 $c5
    add  HL, DE                                        ;; 09:4c8b $19
    ld   B, $00                                        ;; 09:4c8c $06 $00
    ld   E, $06                                        ;; 09:4c8e $1e $06
.jr_09_4c90:
    ld   D, $08                                        ;; 09:4c90 $16 $08
    ld   A, [HL+]                                      ;; 09:4c92 $2a
.jr_09_4c93:
    rlca                                               ;; 09:4c93 $07
    jr   NC, .jr_09_4c97                               ;; 09:4c94 $30 $01
    inc  B                                             ;; 09:4c96 $04
.jr_09_4c97:
    dec  D                                             ;; 09:4c97 $15
    jr   NZ, .jr_09_4c93                               ;; 09:4c98 $20 $f9
    dec  E                                             ;; 09:4c9a $1d
    jr   NZ, .jr_09_4c90                               ;; 09:4c9b $20 $f3
    pop  HL                                            ;; 09:4c9d $e1
    ld   A, B                                          ;; 09:4c9e $78
    cp   A, $18                                        ;; 09:4c9f $fe $18
    jr   NC, .jr_09_4cb6                               ;; 09:4ca1 $30 $13
    ld   A, C                                          ;; 09:4ca3 $79
    or   A, [HL]                                       ;; 09:4ca4 $b6
    ld   [HL], A                                       ;; 09:4ca5 $77
    pop  HL                                            ;; 09:4ca6 $e1
    dec  [HL]                                          ;; 09:4ca7 $35
    jr   NZ, .jr_09_4cae                               ;; 09:4ca8 $20 $04
    dec  [HL]                                          ;; 09:4caa $35
    dec  HL                                            ;; 09:4cab $2b
    ld   [HL], $ff                                     ;; 09:4cac $36 $ff
.jr_09_4cae:
    ld   HL, data_09_6fdd                              ;; 09:4cae $21 $dd $6f
    rst  rst_00_0018                                   ;; 09:4cb1 $df
    db   $8d                                           ;; 09:4cb2 ?
    jp   jp_09_4c24                                    ;; 09:4cb3 $c3 $24 $4c
.jr_09_4cb6:
    ld   HL, data_09_6f9c                              ;; 09:4cb6 $21 $9c $6f
    jr   .jr_09_4cbe                                   ;; 09:4cb9 $18 $03
.jr_09_4cbb:
    ld   HL, data_09_6f8b                              ;; 09:4cbb $21 $8b $6f
.jr_09_4cbe:
    rst  rst_00_0018                                   ;; 09:4cbe $df
    db   $8c                                           ;; 09:4cbf ?
.jp_09_4cc0:
    pop  HL                                            ;; 09:4cc0 $e1
    jp   jp_09_4c24                                    ;; 09:4cc1 $c3 $24 $4c

jp_09_4cc4:
    ld   B, $ff                                        ;; 09:4cc4 $06 $ff
    ld   A, [wC085]                                    ;; 09:4cc6 $fa $85 $c0
    cp   A, $80                                        ;; 09:4cc9 $fe $80
    jr   Z, .jr_09_4cd6                                ;; 09:4ccb $28 $09
    ld   A, [wCD1A]                                    ;; 09:4ccd $fa $1a $cd
    ld   B, A                                          ;; 09:4cd0 $47
    ld   A, [wCD18]                                    ;; 09:4cd1 $fa $18 $cd
    add  A, B                                          ;; 09:4cd4 $80
    ld   B, A                                          ;; 09:4cd5 $47
.jr_09_4cd6:
    ld   C, $ff                                        ;; 09:4cd6 $0e $ff
    ld   A, [wC081]                                    ;; 09:4cd8 $fa $81 $c0
    cp   A, $80                                        ;; 09:4cdb $fe $80
    jr   Z, .jr_09_4ce8                                ;; 09:4cdd $28 $09
    ld   A, [wCD1A]                                    ;; 09:4cdf $fa $1a $cd
    ld   C, A                                          ;; 09:4ce2 $4f
    ld   A, [wCD15]                                    ;; 09:4ce3 $fa $15 $cd
    add  A, C                                          ;; 09:4ce6 $81
    ld   C, A                                          ;; 09:4ce7 $4f
.jr_09_4ce8:
    bit  7, B                                          ;; 09:4ce8 $cb $78
    jr   NZ, .jr_09_4cff                               ;; 09:4cea $20 $13
    bit  7, C                                          ;; 09:4cec $cb $79
    jr   NZ, .jr_09_4d05                               ;; 09:4cee $20 $15
    ld   A, B                                          ;; 09:4cf0 $78
    cp   A, C                                          ;; 09:4cf1 $b9
    ret  NZ                                            ;; 09:4cf2 $c0
    rst  rst_00_0018                                   ;; 09:4cf3 $df
    db   $0c                                           ;; 09:4cf4 ?
    call call_09_4d60                                  ;; 09:4cf5 $cd $60 $4d
    ld   A, $ff                                        ;; 09:4cf8 $3e $ff
    ld   [wCA16], A                                    ;; 09:4cfa $ea $16 $ca
    jr   .jr_09_4d11                                   ;; 09:4cfd $18 $12
.jr_09_4cff:
    bit  7, C                                          ;; 09:4cff $cb $79
    ret  NZ                                            ;; 09:4d01 $c0
    ld   A, C                                          ;; 09:4d02 $79
    jr   .jr_09_4d06                                   ;; 09:4d03 $18 $01
.jr_09_4d05:
    ld   A, B                                          ;; 09:4d05 $78
.jr_09_4d06:
    rst  rst_00_0018                                   ;; 09:4d06 $df
    db   $0c                                           ;; 09:4d07 ?
    ld   A, [wCD20]                                    ;; 09:4d08 $fa $20 $cd
    cp   A, $ff                                        ;; 09:4d0b $fe $ff
    ret  Z                                             ;; 09:4d0d $c8
    call call_09_4d1d                                  ;; 09:4d0e $cd $1d $4d
.jr_09_4d11:
    ld   HL, wCDE6                                     ;; 09:4d11 $21 $e6 $cd
    ld   DE, wC8B4                                     ;; 09:4d14 $11 $b4 $c8
    call call_00_1f90                                  ;; 09:4d17 $cd $90 $1f
    jp   call_09_4fef                                  ;; 09:4d1a $c3 $ef $4f

call_09_4d1d:
    ld   A, [wCD36]                                    ;; 09:4d1d $fa $36 $cd
    cp   A, $04                                        ;; 09:4d20 $fe $04
    jp   Z, call_00_1e83                               ;; 09:4d22 $ca $83 $1e
    ld   A, [wCD20]                                    ;; 09:4d25 $fa $20 $cd
    ld   [wCE94], A                                    ;; 09:4d28 $ea $94 $ce
    rst  rst_00_0018                                   ;; 09:4d2b $df
    db   $0f                                           ;; 09:4d2c ?
    ld   A, B                                          ;; 09:4d2d $78
    or   A, A                                          ;; 09:4d2e $b7
    jr   Z, .jr_09_4d55                                ;; 09:4d2f $28 $24
    ld   A, [wCE94]                                    ;; 09:4d31 $fa $94 $ce
    inc  A                                             ;; 09:4d34 $3c
    jr   Z, .jr_09_4d5b                                ;; 09:4d35 $28 $24
.jr_09_4d37:
    call call_00_1fc4                                  ;; 09:4d37 $cd $c4 $1f
    ld   DE, wC551                                     ;; 09:4d3a $11 $51 $c5
    add  HL, DE                                        ;; 09:4d3d $19
    ld   A, [wCD20]                                    ;; 09:4d3e $fa $20 $cd
    rrca                                               ;; 09:4d41 $0f
    rrca                                               ;; 09:4d42 $0f
    rrca                                               ;; 09:4d43 $0f
    and  A, $1f                                        ;; 09:4d44 $e6 $1f
    xor  A, $01                                        ;; 09:4d46 $ee $01
    rst  add_hl_a                                      ;; 09:4d48 $c7
    ld   A, [wCD20]                                    ;; 09:4d49 $fa $20 $cd
    and  A, $07                                        ;; 09:4d4c $e6 $07
    call call_00_1ef1                                  ;; 09:4d4e $cd $f1 $1e
    cpl                                                ;; 09:4d51 $2f
    and  A, [HL]                                       ;; 09:4d52 $a6
    ld   [HL], A                                       ;; 09:4d53 $77
    ret                                                ;; 09:4d54 $c9
.jr_09_4d55:
    ld   HL, data_09_6f55                              ;; 09:4d55 $21 $55 $6f
    rst  rst_00_0018                                   ;; 09:4d58 $df
    db   $8c                                           ;; 09:4d59 ?
    ret                                                ;; 09:4d5a $c9
.jr_09_4d5b:
    rst  rst_00_0018                                   ;; 09:4d5b $df
    db   $68                                           ;; 09:4d5c ?
    jr   Z, .jr_09_4d37                                ;; 09:4d5d $28 $d8
    ret                                                ;; 09:4d5f $c9

call_09_4d60:
    call call_09_52f9                                  ;; 09:4d60 $cd $f9 $52
    jp   NZ, call_00_1e83                              ;; 09:4d63 $c2 $83 $1e
    ld   A, [wCD20]                                    ;; 09:4d66 $fa $20 $cd
    ld   [wCE26], A                                    ;; 09:4d69 $ea $26 $ce
    xor  A, A                                          ;; 09:4d6c $af
    ld   [wCE25], A                                    ;; 09:4d6d $ea $25 $ce
    ld   [wCE27], A                                    ;; 09:4d70 $ea $27 $ce
    call call_09_49c0                                  ;; 09:4d73 $cd $c0 $49
    jp   jp_09_4c1d                                    ;; 09:4d76 $c3 $1d $4c

call_09_4d79:
    ld   HL, .data_09_4da2                             ;; 09:4d79 $21 $a2 $4d
    call call_09_4dd6                                  ;; 09:4d7c $cd $d6 $4d
    ret  Z                                             ;; 09:4d7f $c8
    ld   A, L                                          ;; 09:4d80 $7d
    ld   HL, .data_09_4d94                             ;; 09:4d81 $21 $94 $4d
    push HL                                            ;; 09:4d84 $e5
    sub  A, $a3                                        ;; 09:4d85 $d6 $a3
    call doJumptable                                   ;; 09:4d87 $cd $3a $37
    db   $a8, $4d, $ab, $4d, $ae, $4d, $b1, $4d        ;; 09:4d8a ????????
    db   $b1, $4d                                      ;; 09:4d92 ??
.data_09_4d94:
    db   $20, $38, $cd, $2c, $4a, $c0, $7e, $93        ;; 09:4d94 ????????
    db   $22, $30, $20, $35, $18, $1d                  ;; 09:4d9c ??????
.data_09_4da2:
    db   $21, $20, $25, $1b, $2c, $00, $df, $8f        ;; 09:4da2 ????????
    db   $c9, $df, $8e, $c9, $df, $99, $c9, $df        ;; 09:4daa ????????
    db   $98, $c9                                      ;; 09:4db2 ??

call_09_4db4:
    ld   HL, .data_09_4dc9                             ;; 09:4db4 $21 $c9 $4d
    call call_09_4dd6                                  ;; 09:4db7 $cd $d6 $4d
    ret  Z                                             ;; 09:4dba $c8
    rst  rst_00_0018                                   ;; 09:4dbb $df
    db   $6d                                           ;; 09:4dbc ?
    jr   NZ, .jr_09_4dce                               ;; 09:4dbd $20 $0f
    ld   HL, wCD43                                     ;; 09:4dbf $21 $43 $cd
    ld   A, [HL+]                                      ;; 09:4dc2 $2a
    ld   H, [HL]                                       ;; 09:4dc3 $66
    ld   L, A                                          ;; 09:4dc4 $6f
    ld   SP, HL                                        ;; 09:4dc5 $f9
    jp   jp_09_408f                                    ;; 09:4dc6 $c3 $8f $40
.data_09_4dc9:
    db   $e8, $e9, $e7, $f5, $00                       ;; 09:4dc9 ?????
.jr_09_4dce:
    ld   HL, data_09_7301                              ;; 09:4dce $21 $01 $73
    rst  rst_00_0018                                   ;; 09:4dd1 $df
    db   $8c                                           ;; 09:4dd2 ?
    or   A, $01                                        ;; 09:4dd3 $f6 $01
    ret                                                ;; 09:4dd5 $c9

call_09_4dd6:
    ld   A, [wCE26]                                    ;; 09:4dd6 $fa $26 $ce
    ld   D, A                                          ;; 09:4dd9 $57
.jr_09_4dda:
    ld   A, [HL+]                                      ;; 09:4dda $2a
    or   A, A                                          ;; 09:4ddb $b7
    ret  Z                                             ;; 09:4ddc $c8
    cp   A, D                                          ;; 09:4ddd $ba
    jr   NZ, .jr_09_4dda                               ;; 09:4dde $20 $fa
    ld   [wCA16], A                                    ;; 09:4de0 $ea $16 $ca
    or   A, A                                          ;; 09:4de3 $b7
    ret                                                ;; 09:4de4 $c9

data_09_4de5:
    db   $c6, $62, $83                                 ;; 09:4de5 ...

call_09_4de8:
    call call_09_4ec1                                  ;; 09:4de8 $cd $c1 $4e
    ld   B, $02                                        ;; 09:4deb $06 $02
.jr_09_4ded:
    push BC                                            ;; 09:4ded $c5
    call call_09_4dfa                                  ;; 09:4dee $cd $fa $4d
    pop  BC                                            ;; 09:4df1 $c1
    ld   DE, $b60                                      ;; 09:4df2 $11 $60 $0b
    add  HL, DE                                        ;; 09:4df5 $19
    dec  B                                             ;; 09:4df6 $05
    jr   NZ, .jr_09_4ded                               ;; 09:4df7 $20 $f4
    ret                                                ;; 09:4df9 $c9

call_09_4dfa:
    push HL                                            ;; 09:4dfa $e5
    ld   E, L                                          ;; 09:4dfb $5d
    ld   D, H                                          ;; 09:4dfc $54
    call call_09_4f18                                  ;; 09:4dfd $cd $18 $4f
    pop  HL                                            ;; 09:4e00 $e1
    push HL                                            ;; 09:4e01 $e5
    ld   DE, wC500                                     ;; 09:4e02 $11 $00 $c5
    call call_09_4f58                                  ;; 09:4e05 $cd $58 $4f
    pop  HL                                            ;; 09:4e08 $e1
    jr   NZ, call_09_4dfa                              ;; 09:4e09 $20 $ef
    ret                                                ;; 09:4e0b $c9

call_09_4e0c:
    push AF                                            ;; 09:4e0c $f5
    call call_09_4e4e                                  ;; 09:4e0d $cd $4e $4e
    pop  BC                                            ;; 09:4e10 $c1
    ld   A, B                                          ;; 09:4e11 $78
    jr   NZ, call_09_4e0c                              ;; 09:4e12 $20 $f8
.jr_09_4e14:
    push HL                                            ;; 09:4e14 $e5
    call call_09_4f39                                  ;; 09:4e15 $cd $39 $4f
    pop  HL                                            ;; 09:4e18 $e1
    push HL                                            ;; 09:4e19 $e5
    ld   DE, wC500                                     ;; 09:4e1a $11 $00 $c5
    call call_09_4f58                                  ;; 09:4e1d $cd $58 $4f
    pop  HL                                            ;; 09:4e20 $e1
    jr   NZ, .jr_09_4e14                               ;; 09:4e21 $20 $f1
    ret                                                ;; 09:4e23 $c9

call_09_4e24:
    push DE                                            ;; 09:4e24 $d5
    call call_09_4e4e                                  ;; 09:4e25 $cd $4e $4e
    pop  DE                                            ;; 09:4e28 $d1
    ret  NZ                                            ;; 09:4e29 $c0
.jr_09_4e2a:
    push HL                                            ;; 09:4e2a $e5
    push DE                                            ;; 09:4e2b $d5
    call call_09_4f4b                                  ;; 09:4e2c $cd $4b $4f
    pop  DE                                            ;; 09:4e2f $d1
    pop  HL                                            ;; 09:4e30 $e1
    push HL                                            ;; 09:4e31 $e5
    push DE                                            ;; 09:4e32 $d5
    call call_09_4fbb                                  ;; 09:4e33 $cd $bb $4f
    pop  DE                                            ;; 09:4e36 $d1
    pop  HL                                            ;; 09:4e37 $e1
    jr   NZ, .jr_09_4e2a                               ;; 09:4e38 $20 $f0
    ret                                                ;; 09:4e3a $c9

call_09_4e3b:
    push AF                                            ;; 09:4e3b $f5
    push HL                                            ;; 09:4e3c $e5
    call call_09_4ece                                  ;; 09:4e3d $cd $ce $4e
    ld   HL, sBFFA                                     ;; 09:4e40 $21 $fa $bf
    inc  [HL]                                          ;; 09:4e43 $34
    inc  L                                             ;; 09:4e44 $2c
    inc  [HL]                                          ;; 09:4e45 $34
    inc  L                                             ;; 09:4e46 $2c
    inc  [HL]                                          ;; 09:4e47 $34
    call call_09_4edf                                  ;; 09:4e48 $cd $df $4e
    pop  HL                                            ;; 09:4e4b $e1
    pop  AF                                            ;; 09:4e4c $f1
    ret                                                ;; 09:4e4d $c9

call_09_4e4e:
    call call_09_4ec1                                  ;; 09:4e4e $cd $c1 $4e
    call call_09_4e91                                  ;; 09:4e51 $cd $91 $4e
    ld   DE, $b60                                      ;; 09:4e54 $11 $60 $0b
    jr   Z, .jr_09_4e66                                ;; 09:4e57 $28 $0d
    add  HL, DE                                        ;; 09:4e59 $19
    call call_09_4e91                                  ;; 09:4e5a $cd $91 $4e
    ret  NZ                                            ;; 09:4e5d $c0
    call call_09_4e3b                                  ;; 09:4e5e $cd $3b $4e
    ld   DE, $f4a0                                     ;; 09:4e61 $11 $a0 $f4
    jr   .jr_09_4e72                                   ;; 09:4e64 $18 $0c
.jr_09_4e66:
    push HL                                            ;; 09:4e66 $e5
    add  HL, DE                                        ;; 09:4e67 $19
    call call_09_4e91                                  ;; 09:4e68 $cd $91 $4e
    call NZ, call_09_4e3b                              ;; 09:4e6b $c4 $3b $4e
    ld   DE, $b60                                      ;; 09:4e6e $11 $60 $0b
    pop  HL                                            ;; 09:4e71 $e1
.jr_09_4e72:
    push HL                                            ;; 09:4e72 $e5
    add  HL, DE                                        ;; 09:4e73 $19
    ld   E, L                                          ;; 09:4e74 $5d
    ld   D, H                                          ;; 09:4e75 $54
    pop  HL                                            ;; 09:4e76 $e1
.jr_09_4e77:
    push HL                                            ;; 09:4e77 $e5
    push DE                                            ;; 09:4e78 $d5
    ld   BC, $2d8                                      ;; 09:4e79 $01 $d8 $02
    call call_09_4ece                                  ;; 09:4e7c $cd $ce $4e
    call call_00_1fb1                                  ;; 09:4e7f $cd $b1 $1f
    call call_09_4edf                                  ;; 09:4e82 $cd $df $4e
    pop  DE                                            ;; 09:4e85 $d1
    pop  HL                                            ;; 09:4e86 $e1
    push HL                                            ;; 09:4e87 $e5
    push DE                                            ;; 09:4e88 $d5
    call call_09_4f58                                  ;; 09:4e89 $cd $58 $4f
    pop  DE                                            ;; 09:4e8c $d1
    pop  HL                                            ;; 09:4e8d $e1
    jr   NZ, .jr_09_4e77                               ;; 09:4e8e $20 $e7
    ret                                                ;; 09:4e90 $c9

call_09_4e91:
    push HL                                            ;; 09:4e91 $e5
    ld   DE, data_09_4de5                              ;; 09:4e92 $11 $e5 $4d
    ld   BC, $03                                       ;; 09:4e95 $01 $03 $00
    call call_09_4ece                                  ;; 09:4e98 $cd $ce $4e
    call call_09_4fe2                                  ;; 09:4e9b $cd $e2 $4f
    call call_09_4edf                                  ;; 09:4e9e $cd $df $4e
    pop  HL                                            ;; 09:4ea1 $e1
    ret  NZ                                            ;; 09:4ea2 $c0
    push HL                                            ;; 09:4ea3 $e5
    ld   A, $06                                        ;; 09:4ea4 $3e $06
    rst  add_hl_a                                      ;; 09:4ea6 $c7
    push HL                                            ;; 09:4ea7 $e5
    call call_09_4eec                                  ;; 09:4ea8 $cd $ec $4e
    pop  HL                                            ;; 09:4eab $e1
    ld   DE, hFFFD                                     ;; 09:4eac $11 $fd $ff
    add  HL, DE                                        ;; 09:4eaf $19
    ld   DE, wC880                                     ;; 09:4eb0 $11 $80 $c8
    ld   BC, $03                                       ;; 09:4eb3 $01 $03 $00
    call call_09_4ece                                  ;; 09:4eb6 $cd $ce $4e
    call call_09_4fe2                                  ;; 09:4eb9 $cd $e2 $4f
    call call_09_4edf                                  ;; 09:4ebc $cd $df $4e
    pop  HL                                            ;; 09:4ebf $e1
    ret                                                ;; 09:4ec0 $c9

call_09_4ec1:
    ld   HL, sA000                                     ;; 09:4ec1 $21 $00 $a0
    or   A, A                                          ;; 09:4ec4 $b7
    ret  Z                                             ;; 09:4ec5 $c8
    ld   DE, $2d8                                      ;; 09:4ec6 $11 $d8 $02
.jr_09_4ec9:
    add  HL, DE                                        ;; 09:4ec9 $19
    dec  A                                             ;; 09:4eca $3d
    jr   NZ, .jr_09_4ec9                               ;; 09:4ecb $20 $fc
    ret                                                ;; 09:4ecd $c9

call_09_4ece:
    push AF                                            ;; 09:4ece $f5
    ld   A, $01                                        ;; 09:4ecf $3e $01
    ld   [$6000], A                                    ;; 09:4ed1 $ea $00 $60
    xor  A, A                                          ;; 09:4ed4 $af
    ld   [$4000], A                                    ;; 09:4ed5 $ea $00 $40
    ld   A, $0a                                        ;; 09:4ed8 $3e $0a
    ld   [$0000], A                                    ;; 09:4eda $ea $00 $00
    pop  AF                                            ;; 09:4edd $f1
    ret                                                ;; 09:4ede $c9

call_09_4edf:
    push AF                                            ;; 09:4edf $f5
    ld   A, $01                                        ;; 09:4ee0 $3e $01
    ld   [$6000], A                                    ;; 09:4ee2 $ea $00 $60
    ld   A, $00                                        ;; 09:4ee5 $3e $00
    ld   [$0000], A                                    ;; 09:4ee7 $ea $00 $00
    pop  AF                                            ;; 09:4eea $f1
    ret                                                ;; 09:4eeb $c9

call_09_4eec:
    ld   A, H                                          ;; 09:4eec $7c
    cp   A, $c5                                        ;; 09:4eed $fe $c5
    jr   Z, call_09_4efa                               ;; 09:4eef $28 $09
    call call_09_4ece                                  ;; 09:4ef1 $cd $ce $4e
    call call_09_4efa                                  ;; 09:4ef4 $cd $fa $4e
    jp   call_09_4edf                                  ;; 09:4ef7 $c3 $df $4e

call_09_4efa:
    push DE                                            ;; 09:4efa $d5
    xor  A, A                                          ;; 09:4efb $af
    ld   D, A                                          ;; 09:4efc $57
    ld   E, A                                          ;; 09:4efd $5f
    ld   BC, $3d2                                      ;; 09:4efe $01 $d2 $03
.jr_09_4f01:
    add  A, [HL]                                       ;; 09:4f01 $86
    jr   NC, .jr_09_4f08                               ;; 09:4f02 $30 $04
    inc  E                                             ;; 09:4f04 $1c
    jr   NZ, .jr_09_4f08                               ;; 09:4f05 $20 $01
    inc  D                                             ;; 09:4f07 $14
.jr_09_4f08:
    inc  HL                                            ;; 09:4f08 $23
    dec  C                                             ;; 09:4f09 $0d
    jr   NZ, .jr_09_4f01                               ;; 09:4f0a $20 $f5
    dec  B                                             ;; 09:4f0c $05
    jr   NZ, .jr_09_4f01                               ;; 09:4f0d $20 $f2
    ld   HL, wC880                                     ;; 09:4f0f $21 $80 $c8
    ld   [HL+], A                                      ;; 09:4f12 $22
    ld   A, E                                          ;; 09:4f13 $7b
    ld   [HL+], A                                      ;; 09:4f14 $22
    ld   [HL], D                                       ;; 09:4f15 $72
    pop  DE                                            ;; 09:4f16 $d1
    ret                                                ;; 09:4f17 $c9

call_09_4f18:
    call call_09_4ece                                  ;; 09:4f18 $cd $ce $4e
    ld   HL, data_09_4de5                              ;; 09:4f1b $21 $e5 $4d
    call call_00_1f8d                                  ;; 09:4f1e $cd $8d $1f
    ld   HL, wC500                                     ;; 09:4f21 $21 $00 $c5
    call call_09_4eec                                  ;; 09:4f24 $cd $ec $4e
    ld   HL, wC880                                     ;; 09:4f27 $21 $80 $c8
    call call_00_1f8d                                  ;; 09:4f2a $cd $8d $1f
    ld   HL, wC500                                     ;; 09:4f2d $21 $00 $c5
    ld   BC, $2d2                                      ;; 09:4f30 $01 $d2 $02
    call call_00_1fb1                                  ;; 09:4f33 $cd $b1 $1f
    jp   call_09_4edf                                  ;; 09:4f36 $c3 $df $4e

call_09_4f39:
    ld   A, $06                                        ;; 09:4f39 $3e $06
    rst  add_hl_a                                      ;; 09:4f3b $c7
    call call_09_4ece                                  ;; 09:4f3c $cd $ce $4e
    ld   DE, wC500                                     ;; 09:4f3f $11 $00 $c5
    ld   BC, $2d2                                      ;; 09:4f42 $01 $d2 $02
    call call_00_1fb1                                  ;; 09:4f45 $cd $b1 $1f
    jp   call_09_4edf                                  ;; 09:4f48 $c3 $df $4e

call_09_4f4b:
    ld   A, $06                                        ;; 09:4f4b $3e $06
    rst  add_hl_a                                      ;; 09:4f4d $c7
    call call_09_4ece                                  ;; 09:4f4e $cd $ce $4e
    ld   B, $60                                        ;; 09:4f51 $06 $60
    rst  rst_00_0018                                   ;; 09:4f53 $df
    db   $03                                           ;; 09:4f54 ?
    jp   call_09_4edf                                  ;; 09:4f55 $c3 $df $4e

call_09_4f58:
    ld   BC, $201                                      ;; 09:4f58 $01 $01 $02
.jr_09_4f5b:
    push HL                                            ;; 09:4f5b $e5
    push DE                                            ;; 09:4f5c $d5
    push BC                                            ;; 09:4f5d $c5
    call call_09_4f70                                  ;; 09:4f5e $cd $70 $4f
    pop  BC                                            ;; 09:4f61 $c1
    pop  DE                                            ;; 09:4f62 $d1
    pop  HL                                            ;; 09:4f63 $e1
    jr   Z, .jr_09_4f6c                                ;; 09:4f64 $28 $06
    dec  B                                             ;; 09:4f66 $05
    jr   NZ, .jr_09_4f5b                               ;; 09:4f67 $20 $f2
    or   A, $01                                        ;; 09:4f69 $f6 $01
    ret                                                ;; 09:4f6b $c9
.jr_09_4f6c:
    dec  C                                             ;; 09:4f6c $0d
    jr   NZ, .jr_09_4f5b                               ;; 09:4f6d $20 $ec
    ret                                                ;; 09:4f6f $c9

call_09_4f70:
    ld   A, $c5                                        ;; 09:4f70 $3e $c5
    cp   A, D                                          ;; 09:4f72 $ba
    jr   Z, .jr_09_4f88                                ;; 09:4f73 $28 $13
    push HL                                            ;; 09:4f75 $e5
    ld   L, E                                          ;; 09:4f76 $6b
    ld   H, D                                          ;; 09:4f77 $62
    pop  DE                                            ;; 09:4f78 $d1
    cp   A, D                                          ;; 09:4f79 $ba
    jr   Z, .jr_09_4f88                                ;; 09:4f7a $28 $0c
    call call_09_4ece                                  ;; 09:4f7c $cd $ce $4e
    ld   BC, $2d8                                      ;; 09:4f7f $01 $d8 $02
    call call_09_4fe2                                  ;; 09:4f82 $cd $e2 $4f
    jp   call_09_4edf                                  ;; 09:4f85 $c3 $df $4e
.jr_09_4f88:
    call call_09_4ece                                  ;; 09:4f88 $cd $ce $4e
    ld   DE, data_09_4de5                              ;; 09:4f8b $11 $e5 $4d
    ld   BC, $03                                       ;; 09:4f8e $01 $03 $00
    call call_09_4fe2                                  ;; 09:4f91 $cd $e2 $4f
    call call_09_4edf                                  ;; 09:4f94 $cd $df $4e
    ret  NZ                                            ;; 09:4f97 $c0
    push HL                                            ;; 09:4f98 $e5
    ld   HL, wC500                                     ;; 09:4f99 $21 $00 $c5
    call call_09_4eec                                  ;; 09:4f9c $cd $ec $4e
    pop  HL                                            ;; 09:4f9f $e1
    ld   DE, wC880                                     ;; 09:4fa0 $11 $80 $c8
    ld   BC, $03                                       ;; 09:4fa3 $01 $03 $00
    call call_09_4ece                                  ;; 09:4fa6 $cd $ce $4e
    call call_09_4fe2                                  ;; 09:4fa9 $cd $e2 $4f
    jp   NZ, call_09_4edf                              ;; 09:4fac $c2 $df $4e
    ld   DE, wC500                                     ;; 09:4faf $11 $00 $c5
    ld   BC, $2d2                                      ;; 09:4fb2 $01 $d2 $02
    call call_09_4fe2                                  ;; 09:4fb5 $cd $e2 $4f
    jp   call_09_4edf                                  ;; 09:4fb8 $c3 $df $4e

call_09_4fbb:
    ld   BC, $201                                      ;; 09:4fbb $01 $01 $02
.jr_09_4fbe:
    push HL                                            ;; 09:4fbe $e5
    push DE                                            ;; 09:4fbf $d5
    push BC                                            ;; 09:4fc0 $c5
    call call_09_4fd3                                  ;; 09:4fc1 $cd $d3 $4f
    pop  BC                                            ;; 09:4fc4 $c1
    pop  DE                                            ;; 09:4fc5 $d1
    pop  HL                                            ;; 09:4fc6 $e1
    jr   Z, .jr_09_4fcf                                ;; 09:4fc7 $28 $06
    dec  B                                             ;; 09:4fc9 $05
    jr   NZ, .jr_09_4fbe                               ;; 09:4fca $20 $f2
    or   A, $01                                        ;; 09:4fcc $f6 $01
    ret                                                ;; 09:4fce $c9
.jr_09_4fcf:
    dec  C                                             ;; 09:4fcf $0d
    jr   NZ, .jr_09_4fbe                               ;; 09:4fd0 $20 $ec
    ret                                                ;; 09:4fd2 $c9

call_09_4fd3:
    ld   A, $06                                        ;; 09:4fd3 $3e $06
    rst  add_hl_a                                      ;; 09:4fd5 $c7
    ld   BC, $60                                       ;; 09:4fd6 $01 $60 $00
    call call_09_4ece                                  ;; 09:4fd9 $cd $ce $4e
    call call_09_4fe2                                  ;; 09:4fdc $cd $e2 $4f
    jp   call_09_4edf                                  ;; 09:4fdf $c3 $df $4e

call_09_4fe2:
    inc  B                                             ;; 09:4fe2 $04
.jr_09_4fe3:
    ld   A, [DE]                                       ;; 09:4fe3 $1a
    cp   A, [HL]                                       ;; 09:4fe4 $be
    ret  NZ                                            ;; 09:4fe5 $c0
    inc  DE                                            ;; 09:4fe6 $13
    inc  HL                                            ;; 09:4fe7 $23
    dec  C                                             ;; 09:4fe8 $0d
    jr   NZ, .jr_09_4fe3                               ;; 09:4fe9 $20 $f8
    dec  B                                             ;; 09:4feb $05
    jr   NZ, .jr_09_4fe3                               ;; 09:4fec $20 $f5
    ret                                                ;; 09:4fee $c9

call_09_4fef:
    ld   HL, wC8B0                                     ;; 09:4fef $21 $b0 $c8
    ld   DE, wC8CE                                     ;; 09:4ff2 $11 $ce $c8
    ld   B, $1e                                        ;; 09:4ff5 $06 $1e
    rst  rst_00_0018                                   ;; 09:4ff7 $df
    db   $03                                           ;; 09:4ff8 .
    xor  A, A                                          ;; 09:4ff9 $af
    ld   [wCD0B], A                                    ;; 09:4ffa $ea $0b $cd
    ld   A, $01                                        ;; 09:4ffd $3e $01
    ld   [wCD3A], A                                    ;; 09:4fff $ea $3a $cd
    ld   A, $22                                        ;; 09:5002 $3e $22
    ld   [wC08A], A                                    ;; 09:5004 $ea $8a $c0
    ld   A, $23                                        ;; 09:5007 $3e $23
    ld   [wC08E], A                                    ;; 09:5009 $ea $8e $c0
    ld   A, $01                                        ;; 09:500c $3e $01
    ld   [wCD39], A                                    ;; 09:500e $ea $39 $cd
    call call_09_5045                                  ;; 09:5011 $cd $45 $50
    xor  A, A                                          ;; 09:5014 $af
    ld   [wCD39], A                                    ;; 09:5015 $ea $39 $cd
    call call_09_5020                                  ;; 09:5018 $cd $20 $50
    xor  A, A                                          ;; 09:501b $af
    ld   [wCD3A], A                                    ;; 09:501c $ea $3a $cd
    ret                                                ;; 09:501f $c9

call_09_5020:
    ld   DE, $9c00                                     ;; 09:5020 $11 $00 $9c
    ld   HL, $9e40                                     ;; 09:5023 $21 $40 $9e
    ld   B, $12                                        ;; 09:5026 $06 $12
    ld   A, [wCD37]                                    ;; 09:5028 $fa $37 $cd
    or   A, A                                          ;; 09:502b $b7
    jr   Z, .jr_09_5030                                ;; 09:502c $28 $02
    ld   B, $0a                                        ;; 09:502e $06 $0a
.jr_09_5030:
    call call_00_358b                                  ;; 09:5030 $cd $8b $35
.jr_09_5033:
    push BC                                            ;; 09:5033 $c5
    ld   BC, $14                                       ;; 09:5034 $01 $14 $00
    rst  rst_00_0018                                   ;; 09:5037 $df
    db   $01                                           ;; 09:5038 .
    pop  BC                                            ;; 09:5039 $c1
    ld   A, E                                          ;; 09:503a $7b
    add  A, $0c                                        ;; 09:503b $c6 $0c
    ld   E, A                                          ;; 09:503d $5f
    jr   NC, .jr_09_5041                               ;; 09:503e $30 $01
    inc  D                                             ;; 09:5040 $14
.jr_09_5041:
    dec  B                                             ;; 09:5041 $05
    jr   NZ, .jr_09_5033                               ;; 09:5042 $20 $ef
    ret                                                ;; 09:5044 $c9

call_09_5045:
    ld   C, $12                                        ;; 09:5045 $0e $12
    ld   A, [wCD37]                                    ;; 09:5047 $fa $37 $cd
    or   A, A                                          ;; 09:504a $b7
    jr   Z, .jr_09_504f                                ;; 09:504b $28 $02
    ld   C, $0a                                        ;; 09:504d $0e $0a
.jr_09_504f:
    ld   HL, wC8CE                                     ;; 09:504f $21 $ce $c8
    push BC                                            ;; 09:5052 $c5
.jr_09_5053:
    ld   A, [HL+]                                      ;; 09:5053 $2a
    or   A, [HL]                                       ;; 09:5054 $b6
    dec  HL                                            ;; 09:5055 $2b
    jr   Z, .jr_09_5064                                ;; 09:5056 $28 $0c
    ld   DE, wC880                                     ;; 09:5058 $11 $80 $c8
    call call_09_5070                                  ;; 09:505b $cd $70 $50
    ld   DE, $07                                       ;; 09:505e $11 $07 $00
    add  HL, DE                                        ;; 09:5061 $19
    jr   .jr_09_5053                                   ;; 09:5062 $18 $ef
.jr_09_5064:
    call call_09_51cc                                  ;; 09:5064 $cd $cc $51
    ld   HL, wCD0B                                     ;; 09:5067 $21 $0b $cd
    inc  [HL]                                          ;; 09:506a $34
    pop  BC                                            ;; 09:506b $c1
    dec  C                                             ;; 09:506c $0d
    jr   NZ, .jr_09_504f                               ;; 09:506d $20 $e0
    ret                                                ;; 09:506f $c9

call_09_5070:
    push HL                                            ;; 09:5070 $e5
    push DE                                            ;; 09:5071 $d5
    ld   DE, wCD0C                                     ;; 09:5072 $11 $0c $cd
    call call_00_1f81                                  ;; 09:5075 $cd $81 $1f
    pop  DE                                            ;; 09:5078 $d1
    ld   A, [wCD0C]                                    ;; 09:5079 $fa $0c $cd
    dec  A                                             ;; 09:507c $3d
    ld   L, A                                          ;; 09:507d $6f
    ld   H, $00                                        ;; 09:507e $26 $00
    add  HL, DE                                        ;; 09:5080 $19
    ld   E, L                                          ;; 09:5081 $5d
    ld   D, H                                          ;; 09:5082 $54
    ld   A, [wCD0D]                                    ;; 09:5083 $fa $0d $cd
    ld   C, A                                          ;; 09:5086 $4f
    ld   A, [wCD0B]                                    ;; 09:5087 $fa $0b $cd
    dec  C                                             ;; 09:508a $0d
    cp   A, C                                          ;; 09:508b $b9
    jp   Z, .jp_09_512b                                ;; 09:508c $ca $2b $51
    jp   C, .jp_09_511f                                ;; 09:508f $da $1f $51
    ld   B, A                                          ;; 09:5092 $47
    ld   A, [wCD0F]                                    ;; 09:5093 $fa $0f $cd
    add  A, C                                          ;; 09:5096 $81
    inc  A                                             ;; 09:5097 $3c
    cp   A, B                                          ;; 09:5098 $b8
    jp   Z, .jp_09_5137                                ;; 09:5099 $ca $37 $51
    jr   C, .jr_09_50ed                                ;; 09:509c $38 $4f
    inc  HL                                            ;; 09:509e $23
    ld   B, $ff                                        ;; 09:509f $06 $ff
    call call_09_51bd                                  ;; 09:50a1 $cd $bd $51
    ld   A, [wCD3C]                                    ;; 09:50a4 $fa $3c $cd
    dec  A                                             ;; 09:50a7 $3d
    jr   NZ, .jr_09_50cf                               ;; 09:50a8 $20 $25
    ld   A, [wCD10]                                    ;; 09:50aa $fa $10 $cd
    cp   A, $2f                                        ;; 09:50ad $fe $2f
    jr   Z, .jr_09_50c3                                ;; 09:50af $28 $12
    cp   A, $46                                        ;; 09:50b1 $fe $46
    jr   Z, .jr_09_50be                                ;; 09:50b3 $28 $09
    cp   A, $5d                                        ;; 09:50b5 $fe $5d
    jr   NZ, .jr_09_50cf                               ;; 09:50b7 $20 $16
    ld   A, [wC5C3]                                    ;; 09:50b9 $fa $c3 $c5
    jr   .jr_09_50c6                                   ;; 09:50bc $18 $08
.jr_09_50be:
    ld   A, [wC563]                                    ;; 09:50be $fa $63 $c5
    jr   .jr_09_50c6                                   ;; 09:50c1 $18 $03
.jr_09_50c3:
    ld   A, [wC503]                                    ;; 09:50c3 $fa $03 $c5
.jr_09_50c6:
    inc  A                                             ;; 09:50c6 $3c
    jr   NZ, .jr_09_50cf                               ;; 09:50c7 $20 $06
    ld   A, $fb                                        ;; 09:50c9 $3e $fb
    ld   [HL], A                                       ;; 09:50cb $77
    ld   [DE], A                                       ;; 09:50cc $12
    jr   .jp_09_511f                                   ;; 09:50cd $18 $50
.jr_09_50cf:
    ld   L, E                                          ;; 09:50cf $6b
    ld   H, D                                          ;; 09:50d0 $62
    ld   A, [wCD12]                                    ;; 09:50d1 $fa $12 $cd
    bit  0, A                                          ;; 09:50d4 $cb $47
    jp   Z, .jp_09_5143                                ;; 09:50d6 $ca $43 $51
    call call_09_5169                                  ;; 09:50d9 $cd $69 $51
    ld   A, [HL]                                       ;; 09:50dc $7e
    cp   A, $05                                        ;; 09:50dd $fe $05
    jr   Z, .jp_09_5143                                ;; 09:50df $28 $62
    cp   A, $4c                                        ;; 09:50e1 $fe $4c
    jr   NZ, .jp_09_511f                               ;; 09:50e3 $20 $3a
    inc  HL                                            ;; 09:50e5 $23
    ld   A, [HL]                                       ;; 09:50e6 $7e
    cp   A, $05                                        ;; 09:50e7 $fe $05
    jr   Z, .jp_09_5143                                ;; 09:50e9 $28 $58
    jr   .jp_09_511f                                   ;; 09:50eb $18 $32
.jr_09_50ed:
    pop  DE                                            ;; 09:50ed $d1
    push DE                                            ;; 09:50ee $d5
    ld   A, E                                          ;; 09:50ef $7b
    cp   A, $ce                                        ;; 09:50f0 $fe $ce
    jr   NZ, .jp_09_511f                               ;; 09:50f2 $20 $2b
    ld   A, D                                          ;; 09:50f4 $7a
    cp   A, $c8                                        ;; 09:50f5 $fe $c8
    jr   NZ, .jp_09_511f                               ;; 09:50f7 $20 $26
    ld   A, [wCD37]                                    ;; 09:50f9 $fa $37 $cd
    or   A, A                                          ;; 09:50fc $b7
    jr   Z, .jr_09_5106                                ;; 09:50fd $28 $07
    ld   A, $ff                                        ;; 09:50ff $3e $ff
    call call_00_1f45                                  ;; 09:5101 $cd $45 $1f
    jr   .jp_09_511f                                   ;; 09:5104 $18 $19
.jr_09_5106:
    ld   B, $0a                                        ;; 09:5106 $06 $0a
    ld   A, [wCD12]                                    ;; 09:5108 $fa $12 $cd
    xor  A, $01                                        ;; 09:510b $ee $01
    ld   [wCD12], A                                    ;; 09:510d $ea $12 $cd
    bit  0, A                                          ;; 09:5110 $cb $47
    ld   A, $04                                        ;; 09:5112 $3e $04
    jr   NZ, .jr_09_5118                               ;; 09:5114 $20 $02
    add  A, $02                                        ;; 09:5116 $c6 $02
.jr_09_5118:
    ld   [HL+], A                                      ;; 09:5118 $22
    inc  A                                             ;; 09:5119 $3c
    ld   [HL+], A                                      ;; 09:511a $22
    dec  A                                             ;; 09:511b $3d
    dec  B                                             ;; 09:511c $05
    jr   NZ, .jr_09_5118                               ;; 09:511d $20 $f9
.jp_09_511f:
    pop  DE                                            ;; 09:511f $d1
    ld   C, E                                          ;; 09:5120 $4b
    ld   B, D                                          ;; 09:5121 $42
    ld   HL, wCD0C                                     ;; 09:5122 $21 $0c $cd
    call call_00_1f81                                  ;; 09:5125 $cd $81 $1f
    ld   L, C                                          ;; 09:5128 $69
    ld   H, B                                          ;; 09:5129 $60
    ret                                                ;; 09:512a $c9
.jp_09_512b:
    ld   [HL], $f7                                     ;; 09:512b $36 $f7
    inc  HL                                            ;; 09:512d $23
    ld   B, $fc                                        ;; 09:512e $06 $fc
    call call_09_51bd                                  ;; 09:5130 $cd $bd $51
    ld   [HL], $f9                                     ;; 09:5133 $36 $f9
    jr   .jp_09_511f                                   ;; 09:5135 $18 $e8
.jp_09_5137:
    ld   [HL], $f8                                     ;; 09:5137 $36 $f8
    inc  HL                                            ;; 09:5139 $23
    ld   B, $fc                                        ;; 09:513a $06 $fc
    call call_09_51bd                                  ;; 09:513c $cd $bd $51
    ld   [HL], $fa                                     ;; 09:513f $36 $fa
    jr   .jp_09_511f                                   ;; 09:5141 $18 $dc
.jp_09_5143:
    ld   A, $fb                                        ;; 09:5143 $3e $fb
    ld   [DE], A                                       ;; 09:5145 $12
    inc  DE                                            ;; 09:5146 $13
    ld   HL, wCD10                                     ;; 09:5147 $21 $10 $cd
    ld   A, [HL+]                                      ;; 09:514a $2a
    ld   H, [HL]                                       ;; 09:514b $66
    ld   L, A                                          ;; 09:514c $6f
    ld   A, [wCD0E]                                    ;; 09:514d $fa $0e $cd
    ld   B, A                                          ;; 09:5150 $47
.jr_09_5151:
    ld   A, [HL+]                                      ;; 09:5151 $2a
    cp   A, $88                                        ;; 09:5152 $fe $88
    call C, call_09_519c                               ;; 09:5154 $dc $9c $51
    inc  DE                                            ;; 09:5157 $13
    dec  B                                             ;; 09:5158 $05
    jr   NZ, .jr_09_5151                               ;; 09:5159 $20 $f6
    ld   A, $fb                                        ;; 09:515b $3e $fb
    ld   [DE], A                                       ;; 09:515d $12
    ld   A, [wCD12]                                    ;; 09:515e $fa $12 $cd
    or   A, $01                                        ;; 09:5161 $f6 $01
    ld   [wCD12], A                                    ;; 09:5163 $ea $12 $cd
    jp   .jp_09_511f                                   ;; 09:5166 $c3 $1f $51

call_09_5169:
    push DE                                            ;; 09:5169 $d5
    ld   A, $fb                                        ;; 09:516a $3e $fb
    ld   [DE], A                                       ;; 09:516c $12
    inc  DE                                            ;; 09:516d $13
    ld   HL, wCD10                                     ;; 09:516e $21 $10 $cd
    ld   A, [HL+]                                      ;; 09:5171 $2a
    ld   H, [HL]                                       ;; 09:5172 $66
    ld   L, A                                          ;; 09:5173 $6f
    ld   A, [wCD0E]                                    ;; 09:5174 $fa $0e $cd
    ld   B, A                                          ;; 09:5177 $47
.jr_09_5178:
    ld   A, [HL+]                                      ;; 09:5178 $2a
    cp   A, $88                                        ;; 09:5179 $fe $88
    jr   C, .jr_09_5180                                ;; 09:517b $38 $03
    ld   [DE], A                                       ;; 09:517d $12
    jr   .jr_09_5183                                   ;; 09:517e $18 $03
.jr_09_5180:
    call call_09_519c                                  ;; 09:5180 $cd $9c $51
.jr_09_5183:
    inc  DE                                            ;; 09:5183 $13
    dec  B                                             ;; 09:5184 $05
    jr   NZ, .jr_09_5178                               ;; 09:5185 $20 $f1
    ld   A, $fb                                        ;; 09:5187 $3e $fb
    ld   [DE], A                                       ;; 09:5189 $12
    ld   A, [wCD12]                                    ;; 09:518a $fa $12 $cd
    res  0, A                                          ;; 09:518d $cb $87
    ld   [wCD12], A                                    ;; 09:518f $ea $12 $cd
    ld   A, L                                          ;; 09:5192 $7d
    ld   [wCD10], A                                    ;; 09:5193 $ea $10 $cd
    ld   A, H                                          ;; 09:5196 $7c
    ld   [wCD11], A                                    ;; 09:5197 $ea $11 $cd
    pop  DE                                            ;; 09:519a $d1
    ret                                                ;; 09:519b $c9

call_09_519c:
    ld   C, A                                          ;; 09:519c $4f
    ld   A, L                                          ;; 09:519d $7d
    ld   [wCD13], A                                    ;; 09:519e $ea $13 $cd
    ld   A, H                                          ;; 09:51a1 $7c
    ld   [wCD14], A                                    ;; 09:51a2 $ea $14 $cd
    ld   A, C                                          ;; 09:51a5 $79
    ld   HL, .data_09_51ba                             ;; 09:51a6 $21 $ba $51
    push HL                                            ;; 09:51a9 $e5
    add  A, A                                          ;; 09:51aa $87
    ld   HL, $3175                                     ;; 09:51ab $21 $75 $31
    rst  add_hl_a                                      ;; 09:51ae $c7
    ld   A, [HL+]                                      ;; 09:51af $2a
    ld   H, [HL]                                       ;; 09:51b0 $66
    ld   L, A                                          ;; 09:51b1 $6f
    push HL                                            ;; 09:51b2 $e5
    ld   HL, wCD13                                     ;; 09:51b3 $21 $13 $cd
    ld   A, [HL+]                                      ;; 09:51b6 $2a
    ld   H, [HL]                                       ;; 09:51b7 $66
    ld   L, A                                          ;; 09:51b8 $6f
    ret                                                ;; 09:51b9 $c9
.data_09_51ba:
    dec  DE                                            ;; 09:51ba $1b
    inc  B                                             ;; 09:51bb $04
    ret                                                ;; 09:51bc $c9

call_09_51bd:
    ld   A, [wCD0E]                                    ;; 09:51bd $fa $0e $cd
    cpl                                                ;; 09:51c0 $2f
    add  A, $5a                                        ;; 09:51c1 $c6 $5a
    ld   C, A                                          ;; 09:51c3 $4f
    ld   A, B                                          ;; 09:51c4 $78
    ld   B, $1f                                        ;; 09:51c5 $06 $1f
    jr   C, .jr_09_51ca                                ;; 09:51c7 $38 $01
    dec  B                                             ;; 09:51c9 $05
.jr_09_51ca:
    push BC                                            ;; 09:51ca $c5
    ret                                                ;; 09:51cb $c9

call_09_51cc:
    push HL                                            ;; 09:51cc $e5
    ld   A, [wCD0B]                                    ;; 09:51cd $fa $0b $cd
    ld   L, A                                          ;; 09:51d0 $6f
    ld   H, $00                                        ;; 09:51d1 $26 $00
    ld   E, L                                          ;; 09:51d3 $5d
    ld   D, H                                          ;; 09:51d4 $54
    add  HL, HL                                        ;; 09:51d5 $29
    add  HL, HL                                        ;; 09:51d6 $29
    add  HL, DE                                        ;; 09:51d7 $19
    add  HL, HL                                        ;; 09:51d8 $29
    add  HL, HL                                        ;; 09:51d9 $29
    ld   DE, $9e40                                     ;; 09:51da $11 $40 $9e
    add  HL, DE                                        ;; 09:51dd $19
    ld   E, L                                          ;; 09:51de $5d
    ld   D, H                                          ;; 09:51df $54
    ld   HL, wC880                                     ;; 09:51e0 $21 $80 $c8
    ld   BC, $14                                       ;; 09:51e3 $01 $14 $00
    rst  rst_00_0018                                   ;; 09:51e6 $df
    db   $01                                           ;; 09:51e7 .
    pop  HL                                            ;; 09:51e8 $e1
    ret                                                ;; 09:51e9 $c9
    push AF                                            ;; 09:51ea $f5
    call call_00_1fc4                                  ;; 09:51eb $cd $c4 $1f
    ld   DE, wC551                                     ;; 09:51ee $11 $51 $c5
    add  HL, DE                                        ;; 09:51f1 $19
    pop  AF                                            ;; 09:51f2 $f1
    inc  A                                             ;; 09:51f3 $3c
    ld   E, A                                          ;; 09:51f4 $5f
    ld   C, $06                                        ;; 09:51f5 $0e $06
.jr_09_51f7:
    ld   B, $08                                        ;; 09:51f7 $06 $08
    ld   A, [HL+]                                      ;; 09:51f9 $2a
.jr_09_51fa:
    rlca                                               ;; 09:51fa $07
    jr   NC, .jr_09_5200                               ;; 09:51fb $30 $03
    dec  E                                             ;; 09:51fd $1d
    jr   Z, .jr_09_520c                                ;; 09:51fe $28 $0c
.jr_09_5200:
    dec  B                                             ;; 09:5200 $05
    jr   NZ, .jr_09_51fa                               ;; 09:5201 $20 $f7
    dec  C                                             ;; 09:5203 $0d
    jr   NZ, .jr_09_51f7                               ;; 09:5204 $20 $f1
    ld   A, $ff                                        ;; 09:5206 $3e $ff
    ld   [wCD20], A                                    ;; 09:5208 $ea $20 $cd
    ret                                                ;; 09:520b $c9
.jr_09_520c:
    ld   A, $06                                        ;; 09:520c $3e $06
    sub  A, C                                          ;; 09:520e $91
    xor  A, $01                                        ;; 09:520f $ee $01
    add  A, A                                          ;; 09:5211 $87
    add  A, A                                          ;; 09:5212 $87
    add  A, A                                          ;; 09:5213 $87
    add  A, B                                          ;; 09:5214 $80
    dec  A                                             ;; 09:5215 $3d
    ld   [wCD20], A                                    ;; 09:5216 $ea $20 $cd
    ret                                                ;; 09:5219 $c9

call_09_521a:
    ld   A, [wCE25]                                    ;; 09:521a $fa $25 $ce
    or   A, A                                          ;; 09:521d $b7
    jr   NZ, .jp_09_523f                               ;; 09:521e $20 $1f
    ld   A, [wCE26]                                    ;; 09:5220 $fa $26 $ce
    cp   A, $30                                        ;; 09:5223 $fe $30
    jp   C, .jp_09_52b7                                ;; 09:5225 $da $b7 $52
    cp   A, $c0                                        ;; 09:5228 $fe $c0
    jr   NC, .jp_09_523f                               ;; 09:522a $30 $13
    cp   A, $78                                        ;; 09:522c $fe $78
    jr   C, .jr_09_5235                                ;; 09:522e $38 $05
    ld   A, [wCEDE]                                    ;; 09:5230 $fa $de $ce
    jr   .jr_09_5238                                   ;; 09:5233 $18 $03
.jr_09_5235:
    ld   A, [wCEE0]                                    ;; 09:5235 $fa $e0 $ce
.jr_09_5238:
    ld   [wCE26], A                                    ;; 09:5238 $ea $26 $ce
    xor  A, A                                          ;; 09:523b $af
    ld   [wCE27], A                                    ;; 09:523c $ea $27 $ce
.jp_09_523f:
    rst  rst_00_0018                                   ;; 09:523f $df
    db   $2a                                           ;; 09:5240 ?
    ld   A, [wCEDD]                                    ;; 09:5241 $fa $dd $ce
    and  A, $3f                                        ;; 09:5244 $e6 $3f
    cp   A, $27                                        ;; 09:5246 $fe $27
    jr   NC, .jr_09_52af                               ;; 09:5248 $30 $65
    cp   A, $22                                        ;; 09:524a $fe $22
    jr   NC, .jr_09_5295                               ;; 09:524c $30 $47
    cp   A, $18                                        ;; 09:524e $fe $18
    jr   C, .jr_09_52af                                ;; 09:5250 $38 $5d
    cp   A, $1d                                        ;; 09:5252 $fe $1d
    jr   NC, .jr_09_52af                               ;; 09:5254 $30 $59
    ld   A, [wCD36]                                    ;; 09:5256 $fa $36 $cd
    bit  7, A                                          ;; 09:5259 $cb $7f
    jr   Z, .jr_09_5295                                ;; 09:525b $28 $38
    ld   HL, wC503                                     ;; 09:525d $21 $03 $c5
    ld   BC, $05                                       ;; 09:5260 $01 $05 $00
.jr_09_5263:
    ld   A, [HL]                                       ;; 09:5263 $7e
    ld   DE, hFFFE                                     ;; 09:5264 $11 $fe $ff
    add  HL, DE                                        ;; 09:5267 $19
    inc  A                                             ;; 09:5268 $3c
    jr   Z, .jr_09_5271                                ;; 09:5269 $28 $06
    ld   A, [HL]                                       ;; 09:526b $7e
    and  A, $40                                        ;; 09:526c $e6 $40
    jr   NZ, .jr_09_5271                               ;; 09:526e $20 $01
    inc  B                                             ;; 09:5270 $04
.jr_09_5271:
    ld   DE, $62                                       ;; 09:5271 $11 $62 $00
    add  HL, DE                                        ;; 09:5274 $19
    dec  C                                             ;; 09:5275 $0d
    jr   NZ, .jr_09_5263                               ;; 09:5276 $20 $eb
    ld   A, B                                          ;; 09:5278 $78
    ld   [wCDEA], A                                    ;; 09:5279 $ea $ea $cd
    rst  rst_00_0018                                   ;; 09:527c $df
    db   $3c                                           ;; 09:527d ?
    ld   B, $04                                        ;; 09:527e $06 $04
    jr   Z, .jr_09_5283                                ;; 09:5280 $28 $01
    inc  B                                             ;; 09:5282 $04
.jr_09_5283:
    xor  A, A                                          ;; 09:5283 $af
.jr_09_5284:
    ld   [wCD36], A                                    ;; 09:5284 $ea $36 $cd
    push BC                                            ;; 09:5287 $c5
    call call_09_52cf                                  ;; 09:5288 $cd $cf $52
    pop  BC                                            ;; 09:528b $c1
    ld   A, [wCD36]                                    ;; 09:528c $fa $36 $cd
    inc  A                                             ;; 09:528f $3c
    dec  B                                             ;; 09:5290 $05
    jr   NZ, .jr_09_5284                               ;; 09:5291 $20 $f1
    jr   .jr_09_529d                                   ;; 09:5293 $18 $08
.jr_09_5295:
    ld   A, $01                                        ;; 09:5295 $3e $01
    ld   [wCDEA], A                                    ;; 09:5297 $ea $ea $cd
    call call_09_52cf                                  ;; 09:529a $cd $cf $52
.jr_09_529d:
    xor  A, A                                          ;; 09:529d $af
    ld   [wCDEA], A                                    ;; 09:529e $ea $ea $cd
    ld   [wCD15], A                                    ;; 09:52a1 $ea $15 $cd
    ld   [wC080], A                                    ;; 09:52a4 $ea $80 $c0
    ld   A, $02                                        ;; 09:52a7 $3e $02
    ld   [wCD3C], A                                    ;; 09:52a9 $ea $3c $cd
    jp   call_00_358b                                  ;; 09:52ac $c3 $8b $35
.jr_09_52af:
    ld   A, $83                                        ;; 09:52af $3e $83
    ld   [wCDEA], A                                    ;; 09:52b1 $ea $ea $cd
    jp   call_00_1e83                                  ;; 09:52b4 $c3 $83 $1e
.jp_09_52b7:
    ld   A, [wCE1C]                                    ;; 09:52b7 $fa $1c $ce
    call call_00_1fcd                                  ;; 09:52ba $cd $cd $1f
    ld   DE, wC514                                     ;; 09:52bd $11 $14 $c5
    add  HL, DE                                        ;; 09:52c0 $19
    ld   A, [wCE29]                                    ;; 09:52c1 $fa $29 $ce
    ld   E, A                                          ;; 09:52c4 $5f
    ld   A, [HL]                                       ;; 09:52c5 $7e
    sub  A, E                                          ;; 09:52c6 $93
    ld   [HL+], A                                      ;; 09:52c7 $22
    jp   NC, .jp_09_523f                               ;; 09:52c8 $d2 $3f $52
    dec  [HL]                                          ;; 09:52cb $35
    jp   .jp_09_523f                                   ;; 09:52cc $c3 $3f $52

call_09_52cf:
    ld   A, [wCEDD]                                    ;; 09:52cf $fa $dd $ce
    and  A, $3f                                        ;; 09:52d2 $e6 $3f
    sub  A, $18                                        ;; 09:52d4 $d6 $18
    cp   A, $05                                        ;; 09:52d6 $fe $05
    jr   C, .jr_09_52dc                                ;; 09:52d8 $38 $02
    sub  A, $05                                        ;; 09:52da $d6 $05
.jr_09_52dc:
    add  A, A                                          ;; 09:52dc $87
    ld   HL, .data_09_52e5                             ;; 09:52dd $21 $e5 $52
    rst  add_hl_a                                      ;; 09:52e0 $c7
    ld   A, [HL+]                                      ;; 09:52e1 $2a
    ld   H, [HL]                                       ;; 09:52e2 $66
    ld   L, A                                          ;; 09:52e3 $6f
    jp   HL                                            ;; 09:52e4 $e9
.data_09_52e5:
    db   $95, $53, $b9, $53, $83, $1e, $d1, $53        ;; 09:52e5 ????????
    db   $df, $53, $03, $53, $08, $53, $0d, $53        ;; 09:52ed ????????
    db   $38, $53, $83, $53                            ;; 09:52f5 ????

call_09_52f9:
    call call_00_1fc4                                  ;; 09:52f9 $cd $c4 $1f
    ld   DE, wC501                                     ;; 09:52fc $11 $01 $c5
    add  HL, DE                                        ;; 09:52ff $19
    bit  6, [HL]                                       ;; 09:5300 $cb $76
    ret                                                ;; 09:5302 $c9
    db   $11, $25, $00, $18, $08, $11, $26, $00        ;; 09:5303 ????????
    db   $18, $03, $11, $27, $00, $d5, $cd, $c4        ;; 09:530b ????????
    db   $1f, $11, $0d, $c5, $19, $4e, $d1, $19        ;; 09:5313 ????????
    db   $cd, $6d, $53, $78, $86, $77, $fe, $64        ;; 09:531b ????????
    db   $38, $07, $36, $63, $96, $2f, $3c, $80        ;; 09:5323 ????????
    db   $47, $79, $e6, $07, $c0, $11, $e6, $ff        ;; 09:532b ????????
    db   $19, $78, $86, $77, $c9, $cd, $c4, $1f        ;; 09:5333 ????????
    db   $11, $30, $c5, $19, $cd, $6d, $53, $cd        ;; 09:533b ????????
    db   $50, $53, $11, $dd, $ff, $19, $7e, $e6        ;; 09:5343 ????????
    db   $07, $c0, $c3, $5a, $1d, $78, $86, $22        ;; 09:534b ????????
    db   $3e, $00, $8e, $32, $fe, $03, $7e, $d8        ;; 09:5353 ????????
    db   $20, $03, $fe, $e8, $d8, $d6, $e7, $2f        ;; 09:535b ????????
    db   $3c, $80, $47, $3e, $e7, $22, $3e, $03        ;; 09:5363 ????????
    db   $32, $c9, $3e, $17, $e0, $bc, $fa, $dc        ;; 09:536b ????????
    db   $ce, $cb, $3f, $47, $f0, $93, $b8, $38        ;; 09:5373 ????????
    db   $04, $cb, $3f, $18, $f9, $80, $47, $c9        ;; 09:537b ????????
    db   $3e, $17, $e0, $bc, $cd, $c4, $1f, $11        ;; 09:5383 ????????
    db   $14, $c5, $19, $5d, $54, $23, $23, $c3        ;; 09:538b ????????
    db   $90, $1f, $fa, $26, $ce, $fe, $ca, $20        ;; 09:5393 ????????
    db   $12, $cd, $c4, $1f, $11, $17, $c5, $19        ;; 09:539b ????????
    db   $3a, $5e, $2b, $32, $73, $cd, $d1, $53        ;; 09:53a3 ????????
    db   $c3, $2c, $54, $cd, $f9, $52, $c0, $3e        ;; 09:53ab ????????
    db   $17, $e0, $bc, $c3, $2c, $54, $3e, $18        ;; 09:53b3 ????????
    db   $e0, $bc, $af, $ea, $84, $c8, $df, $29        ;; 09:53bb ????????
    db   $cd, $c4, $1f, $11, $01, $c5, $19, $fa        ;; 09:53c3 ????????
    db   $84, $c8, $2f, $a6, $77, $c9, $3e, $18        ;; 09:53cb ????????
    db   $e0, $bc, $cd, $c4, $1f, $11, $01, $c5        ;; 09:53d3 ????????
    db   $19, $36, $00, $c9, $cd, $f9, $52, $c0        ;; 09:53db ????????
    db   $3e, $17, $e0, $bc, $fa, $25, $ce, $b7        ;; 09:53e3 ????????
    db   $20, $07, $fa, $26, $ce, $fe, $30, $38        ;; 09:53eb ????????
    db   $38, $cd, $c4, $1f, $11, $10, $c5, $19        ;; 09:53f3 ????????
    db   $2a, $5f, $2a, $57, $d5, $2a, $66, $6f        ;; 09:53fb ????????
    db   $e5, $fa, $dc, $ce, $21, $0a, $00, $cd        ;; 09:5403 ????????
    db   $6b, $24, $c1, $d1, $19, $5d, $54, $69        ;; 09:540b ????????
    db   $60, $7d, $93, $6f, $7c, $9a, $67, $38        ;; 09:5413 ????????
    db   $03, $d5, $18, $01, $c5, $cd, $c4, $1f        ;; 09:541b ????????
    db   $11, $10, $c5, $19, $d1, $7b, $22, $72        ;; 09:5423 ????????
    db   $c9, $cd, $c4, $1f, $11, $10, $c5, $19        ;; 09:542b ????????
    db   $2a, $5f, $2a, $57, $d5, $2a, $66, $6f        ;; 09:5433 ????????
    db   $e5, $fa, $dc, $ce, $cd, $6b, $24, $3e        ;; 09:543b ????????
    db   $0a, $cd, $7e, $24, $c1, $d1, $19, $5d        ;; 09:5443 ????????
    db   $54, $69, $60, $7d, $93, $6f, $7c, $9a        ;; 09:544b ????????
    db   $67, $38, $03, $d5, $18, $01, $c5, $cd        ;; 09:5453 ????????
    db   $c4, $1f, $11, $10, $c5, $19, $d1, $7b        ;; 09:545b ????????
    db   $22, $72, $c9                                 ;; 09:5463 ???
    ld   HL, wC99B                                     ;; 09:5466 $21 $9b $c9
    ld   A, [HL+]                                      ;; 09:5469 $2a
    inc  HL                                            ;; 09:546a $23
    ld   C, [HL]                                       ;; 09:546b $4e
    swap A                                             ;; 09:546c $cb $37
    and  A, $0f                                        ;; 09:546e $e6 $0f
    ld   B, A                                          ;; 09:5470 $47
    add  A, A                                          ;; 09:5471 $87
    add  A, B                                          ;; 09:5472 $80
    ld   HL, .data_09_5479                             ;; 09:5473 $21 $79 $54
    rst  add_hl_a                                      ;; 09:5476 $c7
    jp   HL                                            ;; 09:5477 $e9
.jp_09_5478:
    ret                                                ;; 09:5478 $c9
.data_09_5479:
    jp   .jp_09_5488                                   ;; 09:5479 $c3 $88 $54
    jp   .jp_09_5501                                   ;; 09:547c $c3 $01 $55
    jp   .jp_09_54c7                                   ;; 09:547f $c3 $c7 $54
    db   $c3, $e4, $54, $c3, $ab, $54                  ;; 09:5482 ??????
.jp_09_5488:
    ld   HL, data_09_55c4                              ;; 09:5488 $21 $c4 $55
    ld   A, $d0                                        ;; 09:548b $3e $d0
    add  A, C                                          ;; 09:548d $81
    rst  add_hl_a                                      ;; 09:548e $c7
    add  A, A                                          ;; 09:548f $87
    rst  add_hl_a                                      ;; 09:5490 $c7
    rst  add_hl_a                                      ;; 09:5491 $c7
    rst  add_hl_a                                      ;; 09:5492 $c7
    call call_09_551e                                  ;; 09:5493 $cd $1e $55
    call call_09_5557                                  ;; 09:5496 $cd $57 $55
    call call_09_555c                                  ;; 09:5499 $cd $5c $55
    call call_09_5575                                  ;; 09:549c $cd $75 $55
    call call_09_557a                                  ;; 09:549f $cd $7a $55
    call call_09_558d                                  ;; 09:54a2 $cd $8d $55
    call call_09_5592                                  ;; 09:54a5 $cd $92 $55
    jp   .jp_09_5478                                   ;; 09:54a8 $c3 $78 $54
    db   $21, $fc, $5b, $3e, $88, $81, $c7, $87        ;; 09:54ab ????????
    db   $c7, $c7, $cd, $1e, $55, $cd, $b5, $55        ;; 09:54b3 ????????
    db   $cd, $a6, $55, $cd, $8d, $55, $cd, $92        ;; 09:54bb ????????
    db   $55, $c3, $78, $54                            ;; 09:54c3 ????
.jp_09_54c7:
    ld   HL, data_09_5a50                              ;; 09:54c7 $21 $50 $5a
    ld   A, C                                          ;; 09:54ca $79
    add  A, A                                          ;; 09:54cb $87
    rst  add_hl_a                                      ;; 09:54cc $c7
    rst  add_hl_a                                      ;; 09:54cd $c7
    rst  add_hl_a                                      ;; 09:54ce $c7
    call call_09_551e                                  ;; 09:54cf $cd $1e $55
    call call_09_5557                                  ;; 09:54d2 $cd $57 $55
    call call_09_555c                                  ;; 09:54d5 $cd $5c $55
    call call_09_5575                                  ;; 09:54d8 $cd $75 $55
    call call_09_557a                                  ;; 09:54db $cd $7a $55
    call call_09_55a1                                  ;; 09:54de $cd $a1 $55
    jp   .jp_09_5478                                   ;; 09:54e1 $c3 $78 $54
    db   $21, $70, $5b, $3e, $40, $81, $4f, $87        ;; 09:54e4 ????????
    db   $87, $81, $c7, $cd, $1e, $55, $cd, $57        ;; 09:54ec ????????
    db   $55, $cd, $5c, $55, $cd, $75, $55, $cd        ;; 09:54f4 ????????
    db   $7a, $55, $c3, $78, $54                       ;; 09:54fc ?????
.jp_09_5501:
    ld   HL, data_09_57bc                              ;; 09:5501 $21 $bc $57
    ld   A, C                                          ;; 09:5504 $79
    add  A, A                                          ;; 09:5505 $87
    rst  add_hl_a                                      ;; 09:5506 $c7
    rst  add_hl_a                                      ;; 09:5507 $c7
    rst  add_hl_a                                      ;; 09:5508 $c7
    call call_09_551e                                  ;; 09:5509 $cd $1e $55
    call call_09_5557                                  ;; 09:550c $cd $57 $55
    call call_09_555c                                  ;; 09:550f $cd $5c $55
    call call_09_5575                                  ;; 09:5512 $cd $75 $55
    call call_09_557a                                  ;; 09:5515 $cd $7a $55
    call call_09_55a1                                  ;; 09:5518 $cd $a1 $55
    jp   .jp_09_5478                                   ;; 09:551b $c3 $78 $54

call_09_551e:
    ld   A, [HL]                                       ;; 09:551e $7e
    swap A                                             ;; 09:551f $cb $37
    and  A, $0f                                        ;; 09:5521 $e6 $0f
    push HL                                            ;; 09:5523 $e5
    ld   HL, data_09_7104                              ;; 09:5524 $21 $04 $71
    rst  add_hl_a                                      ;; 09:5527 $c7
    ld   A, $0b                                        ;; 09:5528 $3e $0b
    call call_00_391b                                  ;; 09:552a $cd $1b $39
    pop  HL                                            ;; 09:552d $e1
    ld   [wC9AD], A                                    ;; 09:552e $ea $ad $c9
    ld   A, [HL+]                                      ;; 09:5531 $2a
    and  A, $0f                                        ;; 09:5532 $e6 $0f
    ld   [wC9AF], A                                    ;; 09:5534 $ea $af $c9
    ld   [wC9B2], A                                    ;; 09:5537 $ea $b2 $c9
    push HL                                            ;; 09:553a $e5
    ld   HL, data_09_7114                              ;; 09:553b $21 $14 $71
    rst  add_hl_a                                      ;; 09:553e $c7
    ld   A, $0b                                        ;; 09:553f $3e $0b
    call call_00_391b                                  ;; 09:5541 $cd $1b $39
    ld   [wC9AE], A                                    ;; 09:5544 $ea $ae $c9
    ld   HL, wC9AF                                     ;; 09:5547 $21 $af $c9
    ld   A, [HL]                                       ;; 09:554a $7e
    ld   [HL], $00                                     ;; 09:554b $36 $00
    dec  A                                             ;; 09:554d $3d
    cp   A, $02                                        ;; 09:554e $fe $02
    jr   NC, .jr_09_5555                               ;; 09:5550 $30 $03
    dec  HL                                            ;; 09:5552 $2b
    ld   A, [HL+]                                      ;; 09:5553 $2a
    ld   [HL], A                                       ;; 09:5554 $77
.jr_09_5555:
    pop  HL                                            ;; 09:5555 $e1
    ret                                                ;; 09:5556 $c9

call_09_5557:
    ld   A, [HL+]                                      ;; 09:5557 $2a
    ld   [wC9B6], A                                    ;; 09:5558 $ea $b6 $c9
    ret                                                ;; 09:555b $c9

call_09_555c:
    ld   A, [HL]                                       ;; 09:555c $7e
    rlca                                               ;; 09:555d $07
    rlca                                               ;; 09:555e $07
    and  A, $03                                        ;; 09:555f $e6 $03
    ld   [wC9B3], A                                    ;; 09:5561 $ea $b3 $c9
    ld   A, [HL+]                                      ;; 09:5564 $2a
    and  A, $3f                                        ;; 09:5565 $e6 $3f
    ld   [wC9BC], A                                    ;; 09:5567 $ea $bc $c9
    cp   A, $0a                                        ;; 09:556a $fe $0a
    ret  C                                             ;; 09:556c $d8
    cp   A, $0d                                        ;; 09:556d $fe $0d
    ret  NC                                            ;; 09:556f $d0
    xor  A, A                                          ;; 09:5570 $af
    ld   [wC9AF], A                                    ;; 09:5571 $ea $af $c9
    ret                                                ;; 09:5574 $c9

call_09_5575:
    ld   A, [HL+]                                      ;; 09:5575 $2a
    ld   [wC9BD], A                                    ;; 09:5576 $ea $bd $c9
    ret                                                ;; 09:5579 $c9

call_09_557a:
    ld   A, [HL]                                       ;; 09:557a $7e
    swap A                                             ;; 09:557b $cb $37
    srl  A                                             ;; 09:557d $cb $3f
    srl  A                                             ;; 09:557f $cb $3f
    and  A, $03                                        ;; 09:5581 $e6 $03
    ld   [wC9BB], A                                    ;; 09:5583 $ea $bb $c9
    ld   A, [HL+]                                      ;; 09:5586 $2a
    and  A, $3f                                        ;; 09:5587 $e6 $3f
    ld   [wC9BE], A                                    ;; 09:5589 $ea $be $c9
    ret                                                ;; 09:558c $c9

call_09_558d:
    ld   A, [HL+]                                      ;; 09:558d $2a
    ld   [wC9BA], A                                    ;; 09:558e $ea $ba $c9
    ret                                                ;; 09:5591 $c9

call_09_5592:
    ld   A, [HL]                                       ;; 09:5592 $7e
    swap A                                             ;; 09:5593 $cb $37
    and  A, $0f                                        ;; 09:5595 $e6 $0f
    ld   [wC9B0], A                                    ;; 09:5597 $ea $b0 $c9
    ld   A, [HL+]                                      ;; 09:559a $2a
    and  A, $0f                                        ;; 09:559b $e6 $0f
    ld   [wC9B1], A                                    ;; 09:559d $ea $b1 $c9
    ret                                                ;; 09:55a0 $c9

call_09_55a1:
    ld   A, [HL+]                                      ;; 09:55a1 $2a
    ld   [wC9B9], A                                    ;; 09:55a2 $ea $b9 $c9
    ret                                                ;; 09:55a5 $c9
    db   $7e, $cb, $37, $e6, $0f, $ea, $b4, $c9        ;; 09:55a6 ????????
    db   $2a, $e6, $0f, $ea, $b5, $c9, $c9, $7e        ;; 09:55ae ????????
    db   $cb, $37, $e6, $0f, $ea, $b7, $c9, $2a        ;; 09:55b6 ????????
    db   $e6, $0f, $ea, $b8, $c9, $c9                  ;; 09:55be ??????

data_09_55c4:
    db   $90, $0a, $85, $81, $01, $ff, $01, $90        ;; 09:55c4 .......?
    db   $0f, $85, $81, $01, $ff, $02, $90, $19        ;; 09:55cc ????????
    db   $85, $83, $01, $ff, $04, $90, $23, $85        ;; 09:55d4 ????????
    db   $81, $01, $ff, $05, $90, $32, $85, $81        ;; 09:55dc ????????
    db   $01, $ff, $07, $90, $37, $86, $81, $01        ;; 09:55e4 ????????
    db   $ff, $29, $90, $be, $c5, $81, $01, $ff        ;; 09:55ec ????????
    db   $fe, $80, $46, $55, $82, $01, $ff, $0b        ;; 09:55f4 ????????
    db   $01, $4b, $89, $83, $2d, $ff, $0d, $01        ;; 09:55fc ????????
    db   $aa, $c9, $81, $2d, $ff, $0f, $01, $5a        ;; 09:5604 ????????
    db   $89, $81, $2d, $ff, $0b, $01, $78, $89        ;; 09:560c ????????
    db   $83, $2d, $ff, $0e, $01, $64, $09, $83        ;; 09:5614 ????????
    db   $2d, $ff, $0e, $90, $41, $85, $81, $01        ;; 09:561c ????????
    db   $ff, $09, $60, $46, $85, $81, $01, $ff        ;; 09:5624 ????????
    db   $0a, $70, $5a, $85, $81, $01, $ff, $0c        ;; 09:562c ????????
    db   $40, $32, $85, $84, $02, $10, $18, $90        ;; 09:5634 ????????
    db   $11, $86, $84, $02, $ff, $23, $90, $17        ;; 09:563c ????????
    db   $85, $86, $03, $ff, $03, $90, $30, $85        ;; 09:5644 ????????
    db   $86, $03, $ff, $07, $90, $64, $85, $87        ;; 09:564c ????????
    db   $04, $ff, $8c, $90, $2d, $85, $87, $04        ;; 09:5654 ????????
    db   $ff, $06, $90, $14, $85, $87, $04, $ff        ;; 09:565c ????????
    db   $03, $07, $96, $05, $87, $04, $15, $9d        ;; 09:5664 ????????
    db   $05, $2d, $85, $88, $02, $13, $27, $05        ;; 09:566c ????????
    db   $8c, $05, $88, $02, $13, $3d, $02, $64        ;; 09:5674 ????????
    db   $85, $87, $10, $ff, $0b, $90, $07, $85        ;; 09:567c ?????...
    db   $87, $10, $ff, $01, $90, $a0, $85, $8b        ;; 09:5684 ....????
    db   $1e, $ff, $0d, $70, $82, $45, $8b, $1e        ;; 09:568c ????????
    db   $ff, $0c, $50, $16, $85, $8c, $03, $14        ;; 09:5694 ????????
    db   $06, $90, $1e, $85, $8d, $03, $02, $07        ;; 09:569c ????????
    db   $90, $0a, $85, $8d, $03, $ff, $03, $90        ;; 09:56a4 ???????.
    db   $06, $85, $8d, $03, $ff, $02, $90, $0f        ;; 09:56ac ......??
    db   $85, $8d, $03, $12, $05, $90, $3c, $86        ;; 09:56b4 ????????
    db   $8d, $03, $16, $1c, $90, $3c, $86, $8d        ;; 09:56bc ????????
    db   $03, $19, $3b, $90, $8c, $c5, $8d, $03        ;; 09:56c4 ????????
    db   $07, $7f, $92, $1b, $4a, $a1, $06, $ff        ;; 09:56cc ????????
    db   $03, $90, $2e, $85, $a2, $07, $ff, $06        ;; 09:56d4 ????????
    db   $90, $d4, $5d, $a3, $08, $ff, $06, $90        ;; 09:56dc ????????
    db   $6e, $5d, $a4, $09, $ff, $0d, $90, $28        ;; 09:56e4 ????????
    db   $8f, $a5, $05, $ff, $07, $90, $dc, $0f        ;; 09:56ec ????????
    db   $a6, $05, $ff, $0f, $05, $1e, $91, $8e        ;; 09:56f4 ????????
    db   $0a, $ff, $0b, $90, $28, $10, $8f, $0a        ;; 09:56fc ????????
    db   $ff, $0b, $90, $28, $90, $90, $0b, $ff        ;; 09:5704 ????????
    db   $08, $90, $5a, $90, $91, $0c, $ff, $0c        ;; 09:570c ????????
    db   $90, $3c, $90, $91, $0c, $ff, $1a, $30        ;; 09:5714 ????????
    db   $1e, $91, $95, $0d, $ff, $07, $90, $05        ;; 09:571c ????????
    db   $82, $97, $07, $ff, $03, $90, $06, $82        ;; 09:5724 ????????
    db   $99, $0e, $ff, $05, $90, $07, $82, $99        ;; 09:572c ????????
    db   $0e, $ff, $06, $90, $08, $82, $97, $07        ;; 09:5734 ????????
    db   $ff, $09, $90, $09, $82, $97, $1c, $ff        ;; 09:573c ????????
    db   $0a, $90, $0a, $42, $9b, $10, $ff, $0b        ;; 09:5744 ????????
    db   $90, $0b, $42, $9b, $10, $ff, $0c, $90        ;; 09:574c ????????
    db   $0c, $02, $9c, $1c, $ff, $0e, $90, $07        ;; 09:5754 ????????
    db   $8f, $92, $11, $ff, $01, $90, $19, $8f        ;; 09:575c ????????
    db   $92, $11, $ff, $05, $20, $64, $8f, $93        ;; 09:5764 ????????
    db   $11, $ff, $0c, $80, $aa, $8f, $94, $11        ;; 09:576c ????????
    db   $ff, $0e, $07, $3c, $91, $a7, $12, $ff        ;; 09:5774 ????????
    db   $0b, $04, $3c, $91, $cd, $14, $ff, $0b        ;; 09:577c ????????
    db   $90, $fa, $d1, $a8, $16, $ff, $0f, $90        ;; 09:5784 ????????
    db   $28, $91, $9d, $14, $ff, $06, $90, $1e        ;; 09:578c ????????
    db   $91, $9e, $14, $ff, $05, $30, $0a, $91        ;; 09:5794 ????????
    db   $9f, $14, $ff, $03, $90, $46, $91, $a0        ;; 09:579c ????????
    db   $30, $ff, $0b, $90, $64, $91, $a0, $30        ;; 09:57a4 ????????
    db   $ff, $0f, $90, $50, $91, $90, $0b, $ff        ;; 09:57ac ????????
    db   $0c, $90, $5a, $91, $91, $0c, $ff, $0e        ;; 09:57b4 ????????

data_09_57bc:
    db   $00, $0f, $87, $88, $02, $81, $00, $17        ;; 09:57bc ????????
    db   $47, $a9, $1e, $81, $00, $11, $07, $ab        ;; 09:57c4 ????????
    db   $08, $81, $00, $19, $87, $ac, $1e, $81        ;; 09:57cc ????????
    db   $00, $14, $47, $8f, $1e, $81, $00, $1e        ;; 09:57d4 ????????
    db   $47, $ab, $08, $81, $00, $14, $87, $9a        ;; 09:57dc ????????
    db   $08, $81, $00, $14, $87, $ab, $08, $81        ;; 09:57e4 ????????
    db   $00, $1e, $47, $ad, $2a, $81, $30, $19        ;; 09:57ec ????????
    db   $47, $ae, $0d, $81, $50, $14, $47, $91        ;; 09:57f4 ????????
    db   $0c, $81, $00, $1e, $88, $91, $12, $81        ;; 09:57fc ????????
    db   $00, $06, $88, $97, $30, $81, $00, $0f        ;; 09:5804 ????????
    db   $88, $af, $09, $81, $00, $14, $08, $b0        ;; 09:580c ????????
    db   $05, $81, $00, $0a, $88, $b0, $09, $81        ;; 09:5814 ????????
    db   $00, $10, $48, $b1, $0c, $81, $00, $0a        ;; 09:581c ????????
    db   $88, $91, $0c, $81, $00, $05, $83, $96        ;; 09:5824 ????????
    db   $07, $81, $00, $06, $43, $98, $0e, $81        ;; 09:582c ??......
    db   $00, $07, $03, $97, $07, $81, $00, $05        ;; 09:5834 .???????
    db   $83, $96, $1e, $81, $00, $06, $43, $b4        ;; 09:583c ????????
    db   $10, $81, $00, $07, $43, $b5, $1c, $81        ;; 09:5844 ????????
    db   $00, $07, $43, $9a, $1c, $81, $00, $08        ;; 09:584c ????????
    db   $03, $9a, $10, $81, $00, $08, $03, $9a        ;; 09:5854 ????....
    db   $0f, $81, $07, $03, $83, $b2, $12, $81        ;; 09:585c ...?????
    db   $07, $05, $43, $a9, $02, $81, $09, $06        ;; 09:5864 ????????
    db   $43, $b6, $1d, $81, $01, $06, $43, $b7        ;; 09:586c ????????
    db   $25, $81, $09, $04, $83, $89, $31, $81        ;; 09:5874 ????????
    db   $08, $04, $83, $85, $06, $81, $00, $06        ;; 09:587c ????????
    db   $84, $9b, $10, $81, $00, $06, $84, $99        ;; 09:5884 ????????
    db   $0f, $81, $20, $07, $44, $9b, $0f, $81        ;; 09:588c ????????
    db   $40, $06, $84, $b3, $26, $83, $01, $0b        ;; 09:5894 ????????
    db   $04, $9c, $15, $81, $03, $04, $04, $b8        ;; 09:589c ????????
    db   $2e, $83, $02, $0a, $8c, $b9, $06, $81        ;; 09:58a4 ????????
    db   $02, $0a, $8c, $ba, $06, $81, $02, $0a        ;; 09:58ac ????????
    db   $8c, $bb, $2e, $81, $02, $28, $4b, $aa        ;; 09:58b4 ????????
    db   $06, $81, $03, $1e, $4b, $bc, $2e, $81        ;; 09:58bc ????????
    db   $04, $14, $4b, $bd, $2e, $81, $06, $0a        ;; 09:58c4 ????????
    db   $4b, $be, $2e, $81, $00, $a0, $47, $be        ;; 09:58cc ????????
    db   $2e, $83, $02, $28, $8b, $bf, $2f, $81        ;; 09:58d4 ????????
    db   $06, $0a, $4b, $c0, $2f, $81, $10, $1e        ;; 09:58dc ????????
    db   $47, $c1, $22, $84, $40, $12, $87, $c2        ;; 09:58e4 ????????
    db   $11, $81, $40, $19, $87, $c3, $26, $83        ;; 09:58ec ????????
    db   $40, $2d, $47, $c4, $2a, $84, $30, $23        ;; 09:58f4 ????????
    db   $87, $e2, $0d, $83, $30, $14, $87, $c5        ;; 09:58fc ????????
    db   $8d, $81, $30, $41, $47, $ec, $0d, $84        ;; 09:5904 ????????
    db   $20, $2d, $47, $c6, $1f, $83, $20, $37        ;; 09:590c ????????
    db   $47, $c4, $1f, $84, $50, $41, $87, $e3        ;; 09:5914 ????????
    db   $29, $81, $00, $01, $cd, $ae, $30, $81        ;; 09:591c ????????
    db   $00, $08, $e2, $0e, $31, $81, $80, $14        ;; 09:5924 ????????
    db   $55, $ad, $2a, $83, $00, $00, $9b, $ef        ;; 09:592c ????????
    db   $2a, $84, $00, $0a, $88, $b0, $15, $81        ;; 09:5934 ????????
    db   $05, $01, $04, $b8, $28, $84, $80, $14        ;; 09:593c ????????
    db   $55, $e7, $2a, $81, $80, $0a, $55, $ad        ;; 09:5944 ????????
    db   $2a, $81, $80, $0a, $55, $e7, $2a, $81        ;; 09:594c ????????
    db   $80, $14, $55, $e7, $2a, $81, $00, $03        ;; 09:5954 ????????
    db   $dc, $de, $17, $28, $00, $05, $dc, $de        ;; 09:595c ????????
    db   $17, $28, $01, $00, $58, $c8, $23, $81        ;; 09:5964 ????????
    db   $01, $00, $58, $c9, $23, $81, $01, $00        ;; 09:596c ????????
    db   $98, $ca, $23, $81, $01, $00, $98, $cb        ;; 09:5974 ????????
    db   $23, $81, $02, $00, $59, $df, $63, $81        ;; 09:597c ????????
    db   $02, $00, $59, $df, $20, $81, $02, $00        ;; 09:5984 ????????
    db   $59, $df, $12, $81, $02, $00, $99, $df        ;; 09:598c ????????
    db   $0c, $81, $03, $00, $59, $cc, $20, $81        ;; 09:5994 ????????
    db   $03, $00, $59, $cc, $20, $81, $04, $00        ;; 09:599c ????????
    db   $99, $ce, $20, $81, $04, $00, $99, $cf        ;; 09:59a4 ????????
    db   $12, $83, $04, $00, $99, $cd, $20, $84        ;; 09:59ac ????????
    db   $05, $00, $99, $d0, $28, $81, $05, $00        ;; 09:59b4 ????????
    db   $99, $d1, $28, $81, $05, $00, $99, $d2        ;; 09:59bc ????????
    db   $68, $81, $06, $00, $99, $d3, $28, $81        ;; 09:59c4 ????????
    db   $06, $00, $99, $d4, $15, $83, $07, $00        ;; 09:59cc ????????
    db   $9a, $d5, $67, $81, $07, $00, $9a, $8a        ;; 09:59d4 ????????
    db   $02, $81, $07, $00, $9a, $d6, $27, $81        ;; 09:59dc ????????
    db   $07, $00, $9a, $d7, $31, $81, $08, $00        ;; 09:59e4 ????????
    db   $9a, $d8, $27, $81, $08, $00, $9a, $d9        ;; 09:59ec ????????
    db   $27, $81, $08, $00, $9a, $d9, $27, $81        ;; 09:59f4 ????????
    db   $08, $00, $9a, $d7, $31, $81, $09, $00        ;; 09:59fc ????????
    db   $9a, $da, $21, $81, $09, $00, $9a, $db        ;; 09:5a04 ????????
    db   $21, $81, $09, $00, $9a, $da, $21, $81        ;; 09:5a0c ????????
    db   $00, $e5, $5d, $e3, $29, $81, $00, $25        ;; 09:5a14 ????????
    db   $5d, $e7, $25, $81, $00, $65, $5d, $dc        ;; 09:5a1c ????????
    db   $12, $83, $00, $95, $5d, $c6, $22, $83        ;; 09:5a24 ????????
    db   $00, $aa, $5d, $dd, $02, $81, $00, $7a        ;; 09:5a2c ????????
    db   $9d, $89, $02, $81, $00, $ff, $a0, $80        ;; 09:5a34 ????????
    db   $2c, $88, $00, $0a, $21, $e7, $32, $81        ;; 09:5a3c ????????
    db   $00, $19, $07, $9c, $87, $81, $04, $19        ;; 09:5a44 ????????
    db   $07, $9c, $84, $81                            ;; 09:5a4c ????

data_09_5a50:
    db   $70, $03, $dc, $ad, $17, $29, $90, $60        ;; 09:5a50 ????????
    db   $9d, $80, $18, $08, $20, $1a, $93, $c7        ;; 09:5a58 ????????
    db   $1f, $81, $04, $00, $59, $ce, $20, $89        ;; 09:5a60 ????????
    db   $70, $06, $dc, $ad, $17, $29, $09, $00        ;; 09:5a68 ????????
    db   $5a, $db, $21, $89, $10, $1e, $54, $c1        ;; 09:5a70 ????????
    db   $22, $84, $02, $00, $19, $df, $23, $a9        ;; 09:5a78 ????????
    db   $70, $0a, $dc, $ad, $17, $29, $00, $20        ;; 09:5a80 ????????
    db   $9d, $80, $18, $08, $20, $82, $53, $c7        ;; 09:5a88 ????????
    db   $1f, $83, $02, $00, $9b, $80, $18, $28        ;; 09:5a90 ????????
    db   $01, $03, $58, $ad, $19, $09, $00, $00        ;; 09:5a98 ????????
    db   $52, $80, $24, $08, $10, $d2, $14, $c1        ;; 09:5aa0 ????????
    db   $16, $83, $00, $aa, $14, $e0, $25, $84        ;; 09:5aa8 ????????
    db   $40, $12, $93, $e1, $26, $81, $08, $00        ;; 09:5ab0 .......?
    db   $5a, $a7, $27, $89, $30, $1a, $93, $e2        ;; 09:5ab8 ????....
    db   $0d, $81, $05, $0f, $59, $d0, $28, $89        ;; 09:5ac0 ...?????
    db   $50, $2a, $93, $e3, $29, $81, $07, $00        ;; 09:5ac8 ????????
    db   $5a, $d6, $27, $89, $40, $40, $93, $e1        ;; 09:5ad0 ????????
    db   $26, $83, $03, $6e, $59, $cc, $20, $81        ;; 09:5ad8 ????????
    db   $30, $52, $93, $e2, $0d, $83, $00, $00        ;; 09:5ae0 ????????
    db   $97, $e4, $24, $89, $50, $82, $53, $e3        ;; 09:5ae8 ????????
    db   $29, $83, $00, $00, $56, $e5, $1a, $c1        ;; 09:5af0 ????????
    db   $00, $96, $54, $e6, $2a, $83, $80, $00        ;; 09:5af8 ????????
    db   $55, $e7, $2a, $81, $00, $b4, $14, $e8        ;; 09:5b00 ????????
    db   $16, $84, $01, $00, $18, $e9, $23, $81        ;; 09:5b08 ????????
    db   $00, $00, $6c, $80, $2b, $60, $00, $00        ;; 09:5b10 ????????
    db   $6b, $80, $2b, $60, $06, $00, $59, $d3        ;; 09:5b18 ????????
    db   $28, $89, $70, $03, $dc, $ad, $17, $53        ;; 09:5b20 ????????
    db   $40, $3c, $94, $c4, $1f, $84, $00, $00        ;; 09:5b28 ????????
    db   $6a, $80, $2c, $60, $70, $06, $dc, $ad        ;; 09:5b30 ????????
    db   $17, $53, $20, $4b, $94, $eb, $1f, $84        ;; 09:5b38 ????????
    db   $30, $64, $94, $ec, $0d, $84, $02, $00        ;; 09:5b40 ????????
    db   $9b, $f0, $2a, $a9, $10, $82, $54, $ee        ;; 09:5b48 ????????
    db   $22, $84, $01, $06, $58, $c5, $23, $89        ;; 09:5b50 ????????
    db   $00, $00, $56, $e5, $1a, $e3, $50, $a0        ;; 09:5b58 ????????
    db   $54, $ec, $29, $84, $01, $0a, $18, $ad        ;; 09:5b60 ????????
    db   $19, $09, $00, $c8, $14, $ec, $16, $84        ;; 09:5b68 ????????

data_09_5b70:
    db   $00, $04, $dc, $80, $17, $00, $0a, $dc        ;; 09:5b70 ????????
    db   $80, $17, $00, $19, $dc, $80, $17, $02        ;; 09:5b78 ????????
    db   $00, $d9, $80, $18, $03, $00, $d9, $80        ;; 09:5b80 ????????
    db   $18, $04, $00, $d9, $80, $18, $05, $00        ;; 09:5b88 ????????
    db   $d9, $80, $18, $07, $00, $da, $80, $18        ;; 09:5b90 ????????
    db   $08, $00, $da, $80, $18, $09, $00, $da        ;; 09:5b98 ????????
    db   $80, $18, $01, $0a, $d8, $80, $19, $00        ;; 09:5ba0 ????????
    db   $00, $e6, $80, $19, $00, $00, $d6, $80        ;; 09:5ba8 ????????
    db   $1a, $00, $28, $65, $80, $17, $00, $04        ;; 09:5bb0 ????????
    db   $62, $80, $17, $00, $04, $63, $80, $17        ;; 09:5bb8 ????????
    db   $00, $04, $64, $80, $17, $00, $00, $26        ;; 09:5bc0 ????????
    db   $80, $17, $00, $00, $00, $80, $00, $00        ;; 09:5bc8 ????????
    db   $00, $00, $80, $00, $00, $00, $00, $80        ;; 09:5bd0 ????????
    db   $00, $00, $00, $00, $80, $00, $00, $00        ;; 09:5bd8 ????????
    db   $00, $80, $00, $00, $00, $00, $80, $00        ;; 09:5be0 ????????
    db   $00, $19, $4e, $ea, $1b, $00, $32, $8e        ;; 09:5be8 ????????
    db   $ec, $29, $00, $4b, $8e, $eb, $1f, $00        ;; 09:5bf0 ????????
    db   $64, $8e, $ed, $13                            ;; 09:5bf8 ????

data_09_5bfc:
    db   $00, $22, $22, $ff, $03, $00, $24, $43        ;; 09:5bfc ????????
    db   $ff, $04, $00, $34, $54, $ff, $05, $00        ;; 09:5c04 ????????
    db   $7f, $ff, $ff, $2f, $00, $58, $99, $ff        ;; 09:5c0c ????????
    db   $09, $00, $47, $78, $ff, $07, $40, $37        ;; 09:5c14 ??????..
    db   $68, $ff, $06, $30, $48, $79, $ff, $08        ;; 09:5c1c .....???
    db   $50, $5a, $ab, $ff, $0a, $03, $6b, $cd        ;; 09:5c24 ????????
    db   $ff, $0c, $02, $6c, $ec, $ff, $0d, $a2        ;; 09:5c2c ????????
    db   $7d, $ed, $ff, $2f, $00, $22, $21, $ff        ;; 09:5c34 ????????
    db   $03, $00, $33, $32, $ff, $04, $00, $43        ;; 09:5c3c ????????
    db   $53, $ff, $05, $00, $11, $11, $ff, $01        ;; 09:5c44 ????????
    db   $00, $78, $99, $ff, $09, $00, $66, $67        ;; 09:5c4c ????????
    db   $ff, $07, $00, $68, $78, $ff, $2a, $00        ;; 09:5c54 ????????
    db   $56, $ff, $11, $06, $50, $8a, $ab, $ff        ;; 09:5c5c ????????
    db   $0b, $03, $8b, $cd, $ff, $0d, $02, $9c        ;; 09:5c64 ????????
    db   $dc, $ff, $0f, $00, $9f, $bf, $ff, $1f        ;; 09:5c6c ????????
    db   $00, $22, $22, $ff, $01, $00, $32, $33        ;; 09:5c74 ????????
    db   $ff, $03, $00, $43, $45, $ff, $04, $00        ;; 09:5c7c ????????
    db   $54, $67, $ff, $05, $00, $76, $78, $ff        ;; 09:5c84 ????????
    db   $2a, $07, $89, $89, $ff, $05, $00, $98        ;; 09:5c8c ????????
    db   $98, $ff, $2d, $00, $a9, $ba, $ff, $8a        ;; 09:5c94 ????????
    db   $09, $56, $67, $ff, $04, $00, $66, $67        ;; 09:5c9c ????????
    db   $ff, $07, $50, $ba, $bc, $ff, $0b, $03        ;; 09:5ca4 ????????
    db   $cc, $dd, $ff, $0c, $00, $bd, $be, $ff        ;; 09:5cac ????????
    db   $1a, $02, $dd, $ec, $ff, $0d, $00, $fc        ;; 09:5cb4 ????????
    db   $fc, $ff, $ae, $00, $cf, $cf, $ff, $4f        ;; 09:5cbc ????????
    db   $00, $11, $11, $ff, $01, $00, $65, $75        ;; 09:5cc4 ????????
    db   $ff, $0a, $00, $32, $33, $ff, $04, $00        ;; 09:5ccc ????????
    db   $43, $43, $ff, $05, $00, $21, $21, $ff        ;; 09:5cd4 ????????
    db   $03, $00, $54, $54, $ff, $07, $50, $77        ;; 09:5cdc ????????
    db   $86, $ff, $0c, $03, $89, $99, $ff, $0e        ;; 09:5ce4 ????????
    db   $02, $9b, $aa, $ff, $0f, $00, $9f, $9f        ;; 09:5cec ????????
    db   $ff, $8f, $00, $11, $11, $ff, $01, $00        ;; 09:5cf4 ????????
    db   $33, $32, $ff, $05, $00, $44, $54, $ff        ;; 09:5cfc ????????
    db   $07, $00, $22, $22, $ff, $03, $00, $9a        ;; 09:5d04 ????????
    db   $ab, $ff, $2f, $00, $67, $77, $ff, $19        ;; 09:5d0c ????????
    db   $00, $56, $67, $ff, $2a, $50, $78, $88        ;; 09:5d14 ????????
    db   $ff, $0b, $03, $89, $9a, $ff, $0d, $00        ;; 09:5d1c ????????
    db   $9f, $9f, $ff, $2f, $02, $1c, $1d, $ff        ;; 09:5d24 ????????
    db   $0d, $0a, $2f, $2f, $ff, $1f, $03, $1e        ;; 09:5d2c ????????
    db   $1e, $ff, $0e, $01, $2e, $2e, $1f, $0f        ;; 09:5d34 ????????
    db   $00, $13, $12, $ff, $02, $06, $17, $16        ;; 09:5d3c ????????
    db   $ff, $05, $08, $13, $14, $ff, $03, $05        ;; 09:5d44 ????????
    db   $18, $18, $ff, $07, $07, $1a, $19, $ff        ;; 09:5d4c ????????
    db   $08, $04, $19, $1a, $ff, $0b, $30, $1a        ;; 09:5d54 ????????
    db   $1a, $16, $0a, $40, $1c, $1d, $18, $0c        ;; 09:5d5c ????????
    xor  A, A                                          ;; 09:5d64 $af
    ld   [wCE25], A                                    ;; 09:5d65 $ea $25 $ce
    ld   [wCE27], A                                    ;; 09:5d68 $ea $27 $ce
    call call_00_1fc4                                  ;; 09:5d6b $cd $c4 $1f
    ld   DE, wC540                                     ;; 09:5d6e $11 $40 $c5
    add  HL, DE                                        ;; 09:5d71 $19
    ld   A, [HL]                                       ;; 09:5d72 $7e
    ld   [wCE26], A                                    ;; 09:5d73 $ea $26 $ce
    inc  A                                             ;; 09:5d76 $3c
    jr   NZ, .jr_09_5d7f                               ;; 09:5d77 $20 $06
    ld   A, $81                                        ;; 09:5d79 $3e $81
    ld   [wCE28], A                                    ;; 09:5d7b $ea $28 $ce
    ret                                                ;; 09:5d7e $c9
.jr_09_5d7f:
    call call_09_5d87                                  ;; 09:5d7f $cd $87 $5d
    xor  A, A                                          ;; 09:5d82 $af
    ld   [wCE27], A                                    ;; 09:5d83 $ea $27 $ce
    ret                                                ;; 09:5d86 $c9

call_09_5d87:
    xor  A, A                                          ;; 09:5d87 $af
    ld   [wCE28], A                                    ;; 09:5d88 $ea $28 $ce
    ld   [wCE29], A                                    ;; 09:5d8b $ea $29 $ce
    ld   A, [wCE26]                                    ;; 09:5d8e $fa $26 $ce
    inc  A                                             ;; 09:5d91 $3c
    ret  Z                                             ;; 09:5d92 $c8
    ld   A, [wCE25]                                    ;; 09:5d93 $fa $25 $ce
    or   A, A                                          ;; 09:5d96 $b7
    jr   NZ, .jr_09_5dc4                               ;; 09:5d97 $20 $2b
    ld   A, [wCE26]                                    ;; 09:5d99 $fa $26 $ce
    cp   A, $30                                        ;; 09:5d9c $fe $30
    jp   C, .jp_09_5e3d                                ;; 09:5d9e $da $3d $5e
    cp   A, $78                                        ;; 09:5da1 $fe $78
    jp   C, .jp_09_5dd4                                ;; 09:5da3 $da $d4 $5d
    cp   A, $c0                                        ;; 09:5da6 $fe $c0
    jp   C, .jp_09_5e1f                                ;; 09:5da8 $da $1f $5e
    ld   B, A                                          ;; 09:5dab $47
    ld   A, [wCD37]                                    ;; 09:5dac $fa $37 $cd
    or   A, A                                          ;; 09:5daf $b7
    ld   A, B                                          ;; 09:5db0 $78
    jr   Z, .jr_09_5dbe                                ;; 09:5db1 $28 $0b
    cp   A, $d1                                        ;; 09:5db3 $fe $d1
    jp   Z, .jp_09_5e61                                ;; 09:5db5 $ca $61 $5e
    cp   A, $cb                                        ;; 09:5db8 $fe $cb
    jp   C, .jp_09_5e61                                ;; 09:5dba $da $61 $5e
    ret                                                ;; 09:5dbd $c9
.jr_09_5dbe:
    cp   A, $d8                                        ;; 09:5dbe $fe $d8
    jp   C, .jp_09_5e61                                ;; 09:5dc0 $da $61 $5e
    ret                                                ;; 09:5dc3 $c9
.jr_09_5dc4:
    ld   A, [wCE26]                                    ;; 09:5dc4 $fa $26 $ce
    cp   A, $6e                                        ;; 09:5dc7 $fe $6e
    ret  NC                                            ;; 09:5dc9 $d0
    call call_09_5e6a                                  ;; 09:5dca $cd $6a $5e
    ld   A, [wCEE0]                                    ;; 09:5dcd $fa $e0 $ce
    ld   [wCE28], A                                    ;; 09:5dd0 $ea $28 $ce
    ret                                                ;; 09:5dd3 $c9
.jp_09_5dd4:
    call call_09_5e7a                                  ;; 09:5dd4 $cd $7a $5e
    ld   A, [wCE27]                                    ;; 09:5dd7 $fa $27 $ce
    or   A, A                                          ;; 09:5dda $b7
    jr   NZ, .jr_09_5e04                               ;; 09:5ddb $20 $27
    ld   A, [wCE26]                                    ;; 09:5ddd $fa $26 $ce
    cp   A, $5e                                        ;; 09:5de0 $fe $5e
    jr   C, .jr_09_5df2                                ;; 09:5de2 $38 $0e
    cp   A, $62                                        ;; 09:5de4 $fe $62
    jr   C, .jr_09_5df8                                ;; 09:5de6 $38 $10
    cp   A, $6e                                        ;; 09:5de8 $fe $6e
    jr   C, .jr_09_5df2                                ;; 09:5dea $38 $06
    cp   A, $71                                        ;; 09:5dec $fe $71
    jr   C, .jr_09_5dfe                                ;; 09:5dee $38 $0e
    jr   .jr_09_5df8                                   ;; 09:5df0 $18 $06
.jr_09_5df2:
    ld   A, $81                                        ;; 09:5df2 $3e $81
    ld   [wCE28], A                                    ;; 09:5df4 $ea $28 $ce
    ret                                                ;; 09:5df7 $c9
.jr_09_5df8:
    ld   A, $83                                        ;; 09:5df8 $3e $83
    ld   [wCE28], A                                    ;; 09:5dfa $ea $28 $ce
    ret                                                ;; 09:5dfd $c9
.jr_09_5dfe:
    ld   A, $84                                        ;; 09:5dfe $3e $84
    ld   [wCE28], A                                    ;; 09:5e00 $ea $28 $ce
    ret                                                ;; 09:5e03 $c9
.jr_09_5e04:
    ld   A, [wCE26]                                    ;; 09:5e04 $fa $26 $ce
    push AF                                            ;; 09:5e07 $f5
    ld   A, [wCEE0]                                    ;; 09:5e08 $fa $e0 $ce
    ld   [wCE26], A                                    ;; 09:5e0b $ea $26 $ce
    xor  A, A                                          ;; 09:5e0e $af
    ld   [wCE27], A                                    ;; 09:5e0f $ea $27 $ce
    rst  rst_00_0018                                   ;; 09:5e12 $df
    db   $2a                                           ;; 09:5e13 ?
    xor  A, A                                          ;; 09:5e14 $af
    ld   [wCE29], A                                    ;; 09:5e15 $ea $29 $ce
    pop  AF                                            ;; 09:5e18 $f1
    ld   [wCE26], A                                    ;; 09:5e19 $ea $26 $ce
    jp   call_09_5e7a                                  ;; 09:5e1c $c3 $7a $5e
.jp_09_5e1f:
    ld   A, [wCE26]                                    ;; 09:5e1f $fa $26 $ce
    push AF                                            ;; 09:5e22 $f5
    call call_09_5e87                                  ;; 09:5e23 $cd $87 $5e
    ld   A, [wCEDE]                                    ;; 09:5e26 $fa $de $ce
    ld   [wCE26], A                                    ;; 09:5e29 $ea $26 $ce
    xor  A, A                                          ;; 09:5e2c $af
    ld   [wCE27], A                                    ;; 09:5e2d $ea $27 $ce
    rst  rst_00_0018                                   ;; 09:5e30 $df
    db   $2a                                           ;; 09:5e31 .
    xor  A, A                                          ;; 09:5e32 $af
    ld   [wCE29], A                                    ;; 09:5e33 $ea $29 $ce
    pop  AF                                            ;; 09:5e36 $f1
    ld   [wCE26], A                                    ;; 09:5e37 $ea $26 $ce
    jp   call_09_5e87                                  ;; 09:5e3a $c3 $87 $5e
.jp_09_5e3d:
    call call_09_5e94                                  ;; 09:5e3d $cd $94 $5e
    ld   A, [wCE27]                                    ;; 09:5e40 $fa $27 $ce
    or   A, A                                          ;; 09:5e43 $b7
    ret  NZ                                            ;; 09:5e44 $c0
    ld   A, [wCEE0]                                    ;; 09:5e45 $fa $e0 $ce
    ld   [wCE28], A                                    ;; 09:5e48 $ea $28 $ce
    ld   A, [wCE26]                                    ;; 09:5e4b $fa $26 $ce
    ld   B, A                                          ;; 09:5e4e $47
    rrca                                               ;; 09:5e4f $0f
    and  A, $07                                        ;; 09:5e50 $e6 $07
    add  A, A                                          ;; 09:5e52 $87
    add  A, $04                                        ;; 09:5e53 $c6 $04
    bit  5, B                                          ;; 09:5e55 $cb $68
    jr   Z, .jr_09_5e5c                                ;; 09:5e57 $28 $03
    add  A, A                                          ;; 09:5e59 $87
    sub  A, $08                                        ;; 09:5e5a $d6 $08
.jr_09_5e5c:
    add  A, A                                          ;; 09:5e5c $87
    ld   [wCE29], A                                    ;; 09:5e5d $ea $29 $ce
    ret                                                ;; 09:5e60 $c9
.jp_09_5e61:
    call call_09_5e9f                                  ;; 09:5e61 $cd $9f $5e
    ld   A, $28                                        ;; 09:5e64 $3e $28
    ld   [wCE28], A                                    ;; 09:5e66 $ea $28 $ce
    ret                                                ;; 09:5e69 $c9

call_09_5e6a:
    ld   A, [wCE26]                                    ;; 09:5e6a $fa $26 $ce
    call call_00_2448                                  ;; 09:5e6d $cd $48 $24
    ld   DE, data_09_57bc                              ;; 09:5e70 $11 $bc $57

jr_09_5e73:
    add  HL, DE                                        ;; 09:5e73 $19
    ld   DE, wCEDB                                     ;; 09:5e74 $11 $db $ce
    jp   call_00_1f81                                  ;; 09:5e77 $c3 $81 $1f

call_09_5e7a:
    ld   A, [wCE26]                                    ;; 09:5e7a $fa $26 $ce
    sub  A, $30                                        ;; 09:5e7d $d6 $30
    call call_00_2453                                  ;; 09:5e7f $cd $53 $24
    ld   DE, data_09_55c4                              ;; 09:5e82 $11 $c4 $55
    jr   jr_09_5e73                                    ;; 09:5e85 $18 $ec

call_09_5e87:
    ld   A, [wCE26]                                    ;; 09:5e87 $fa $26 $ce
    sub  A, $78                                        ;; 09:5e8a $d6 $78
    call call_00_243d                                  ;; 09:5e8c $cd $3d $24
    ld   DE, data_09_5bfc                              ;; 09:5e8f $11 $fc $5b
    jr   jr_09_5e73                                    ;; 09:5e92 $18 $df

call_09_5e94:
    ld   A, [wCE26]                                    ;; 09:5e94 $fa $26 $ce
    call call_00_2448                                  ;; 09:5e97 $cd $48 $24
    ld   DE, data_09_5a50                              ;; 09:5e9a $11 $50 $5a
    jr   jr_09_5e73                                    ;; 09:5e9d $18 $d4

call_09_5e9f:
    ld   A, [wCE26]                                    ;; 09:5e9f $fa $26 $ce
    sub  A, $c0                                        ;; 09:5ea2 $d6 $c0
    call call_00_243d                                  ;; 09:5ea4 $cd $3d $24
    ld   DE, data_09_5b70                              ;; 09:5ea7 $11 $70 $5b
    jr   jr_09_5e73                                    ;; 09:5eaa $18 $c7
    db   $00, $38, $00, $3e, $3b, $0d, $14, $7d        ;; 09:5eac ?.w.....
    db   $50, $85, $ff, $d0, $6f, $52, $4f, $be        ;; 09:5eb4 ........
    db   $e1, $e7, $75, $ec, $ff, $d4, $e3, $e3        ;; 09:5ebc ........
    db   $d8, $5d, $87, $4f, $56, $5a, $d9, $df        ;; 09:5ec4 ........
    db   $e2, $e2, $d7, $44, $63, $6b, $4f, $ea        ;; 09:5ecc ........
    db   $5b, $df, $d7, $79, $e3, $65, $7b, $e1        ;; 09:5ed4 ........
    db   $e7, $ac, $4f, $e3, $6a, $57, $56, $5a        ;; 09:5edc ........
    db   $d9, $e8, $e7, $e8, $65, $73, $06, $7d        ;; 09:5ee4 ........
    db   $50, $ea, $6f, $52, $ff, $d5, $e5, $53        ;; 09:5eec ........
    db   $da, $db, $e7, $4f, $e0, $16, $e6, $60        ;; 09:5ef4 ........
    db   $ea, $db, $dc, $d6, $db, $06, $db, $e8        ;; 09:5efc ........
    db   $e1, $e7, $44, $e3, $d8, $e2, $e3, $1a        ;; 09:5f04 ........
    db   $ff, $d7, $d4, $ec, $06, $56, $5a, $e1        ;; 09:5f0c ........
    db   $80, $61, $bc, $75, $dc, $d8, $e6, $06        ;; 09:5f14 ........
    db   $d9, $d8, $5e, $ff, $59, $50, $d5, $62        ;; 09:5f1c ........
    db   $59, $d8, $ac, $4f, $ff, $ff, $d6, $e2        ;; 09:5f24 ........
    db   $e9, $52, $44, $d5, $ec, $4f, $ff, $ff        ;; 09:5f2c ........
    db   $68, $7b, $d4, $af, $af, $73, $4f, $ff        ;; 09:5f34 ........
    db   $c1, $7e, $d8, $e9, $52, $60, $7f, $d9        ;; 09:5f3c ........
    db   $d8, $ea, $4f, $ff, $ff, $55, $d7, $dc        ;; 09:5f44 ........
    db   $e9, $dc, $d7, $e8, $d4, $df, $e6, $4f        ;; 09:5f4c ........
    db   $ff, $e3, $65, $e3, $5d, $50, $1b, $d4        ;; 09:5f54 ........
    db   $4f, $dd, $53, $e5, $e1, $d8, $62, $63        ;; 09:5f5c ........
    db   $6f, $ff, $e0, $d4, $ec, $4f, $ff, $d7        ;; 09:5f64 ........
    db   $d8, $e7, $52, $e0, $55, $50, $63, $46        ;; 09:5f6c ........
    db   $d9, $6f, $50, $19, $68, $ea, $5b, $df        ;; 09:5f74 ........
    db   $d7, $06, $06, $06, $06, $f2, $f2, $f2        ;; 09:5f7c ........
    db   $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2        ;; 09:5f84 ........
    db   $f2, $f2, $f2, $f2, $f2, $f2, $f2, $06        ;; 09:5f8c ........
    db   $bb, $d8, $db, $e2, $df, $d7, $f0, $ff        ;; 09:5f94 ........
    db   $68, $7b, $d4, $1a, $d7, $4f, $d6, $75        ;; 09:5f9c ........
    db   $62, $bd, $01, $e5, $e0, $61, $c1, $52        ;; 09:5fa4 ........
    db   $46, $63, $65, $50, $69, $e1, $da, $ff        ;; 09:5fac ........
    db   $e3, $d8, $e2, $e3, $1a, $4f, $ff, $ff        ;; 09:5fb4 ........
    db   $7b, $e1, $57, $d5, $74, $de, $ff, $6a        ;; 09:5fbc ........
    db   $06, $d6, $db, $dc, $df, $d7, $65, $e1        ;; 09:5fc4 ........
    db   $ff, $78, $6c, $ff, $ff, $e5, $e8, $55        ;; 09:5fcc ........
    db   $54, $19, $63, $46, $d9, $e8, $e7, $e8        ;; 09:5fd4 ........
    db   $65, $60, $5d, $50, $df, $dc, $e9, $72        ;; 09:5fdc ........
    db   $4f, $04, $75, $db, $ff, $68, $6d, $73        ;; 09:5fe4 ........
    db   $c1, $50, $01, $54, $65, $5d, $44, $63        ;; 09:5fec ........
    db   $d8, $e0, $06, $6e, $da, $d8, $63, $52        ;; 09:5ff4 ........
    db   $04, $75, $db, $ff, $db, $6b, $06, $7e        ;; 09:5ffc ........
    db   $e1, $ff, $da, $e5, $56, $d7, $d7, $d4        ;; 09:6004 ........
    db   $e8, $da, $db, $e7, $52, $73, $0c, $2c        ;; 09:600c ........
    db   $00, $3f, $01, $3e, $00, $22, $0a, $21        ;; 09:6014 ........
    db   $0d, $01, $14, $1f, $10, $4e, $c0, $e8        ;; 09:601c ........
    db   $d8, $e6, $54, $63, $6f, $ff, $e0, $80        ;; 09:6024 ........
    db   $4f, $d5, $50, $68, $df, $6a, $57, $e7        ;; 09:602c ........
    db   $dc, $02, $4f, $ea, $50, $d4, $5e, $ff        ;; 09:6034 ........
    db   $e8, $7b, $ff, $6c, $cc, $dc, $e0, $e8        ;; 09:603c ........
    db   $df, $6f, $5b, $61, $c2, $ad, $5e, $4f        ;; 09:6044 ........
    db   $e6, $d4, $62, $da, $e2, $e2, $d7, $d5        ;; 09:604c ........
    db   $ec, $50, $e5, $80, $4f, $e1, $7e, $67        ;; 09:6054 ........
    db   $64, $c8, $c4, $ae, $ae, $ae, $cc, $d8        ;; 09:605c ........
    db   $50, $69, $fe, $08, $32, $23, $3b, $13        ;; 09:6064 ........
    db   $32, $33, $3b, $13, $32, $23, $3b, $33        ;; 09:606c ........
    db   $32, $43, $32, $22, $3b, $12, $32, $12        ;; 09:6074 ........
    db   $3b, $12, $32, $22, $3b, $32, $32, $42        ;; 09:607c ........
    db   $32, $20, $3b, $10, $32, $00, $0c, $1e        ;; 09:6084 ........
    db   $32, $20, $3b, $60, $32, $30, $14, $64        ;; 09:608c ........
    db   $1c, $1f, $03, $83, $1c, $1f, $03, $4e        ;; 09:6094 ........
    db   $1c, $1f, $00, $f3, $ff, $d2, $53, $ad        ;; 09:609c ..w.....
    db   $65, $4f, $65, $d4, $5e, $62, $1a, $d4        ;; 09:60a4 ........
    db   $e9, $72, $66, $64, $d2, $d8, $d4, $db        ;; 09:60ac ........
    db   $60, $d5, $e8, $57, $c2, $ad, $5e, $4f        ;; 09:60b4 ........
    db   $d5, $50, $d5, $74, $de, $67, $1c, $1f        ;; 09:60bc ........
    db   $03, $4e, $ae, $17, $64, $bd, $59, $ad        ;; 09:60c4 ........
    db   $57, $ea, $5b, $e5, $ec, $45, $d2, $53        ;; 09:60cc ........
    db   $ad, $5e, $ff, $7b, $50, $02, $ff, $e2        ;; 09:60d4 ........
    db   $d9, $d9, $4f, $6e, $e0, $5b, $e5, $7e        ;; 09:60dc ........
    db   $60, $e5, $80, $66, $1c, $1f, $03, $4e        ;; 09:60e4 ........
    db   $ae, $17, $64, $c2, $ad, $0f, $da, $e2        ;; 09:60ec ........
    db   $57, $58, $da, $e2, $4f, $e1, $7e, $fe        ;; 09:60f4 ........
    db   $08, $32, $20, $3b, $20, $32, $30, $32        ;; 09:60fc ........
    db   $27, $3b, $27, $32, $17, $0c, $25, $32        ;; 09:6104 ........
    db   $27, $3b, $27, $32, $47, $3b, $10, $32        ;; 09:610c ........
    db   $20, $0c, $25, $3b, $20, $32, $40, $14        ;; 09:6114 ........
    db   $ff, $ef, $82, $e0, $6b, $54, $69, $ae        ;; 09:611c ........
    db   $ae, $fe, $08, $0c, $25, $14, $4f, $ff        ;; 09:6124 ........
    db   $f2, $f2, $ff, $c7, $d8, $eb, $57, $d7        ;; 09:612c ........
    db   $d4, $62, $f2, $f2, $0b, $12, $14, $3e        ;; 09:6134 ........
    db   $02, $0d, $14, $64, $d0, $d8, $ad, $65        ;; 09:613c ........
    db   $ff, $d4, $5e, $ff, $65, $d4, $d7, $ec        ;; 09:6144 ........
    db   $4f, $e1, $7e, $67, $6d, $4e, $c0, $e2        ;; 09:614c ........
    db   $e2, $d7, $67, $64, $d0, $40, $d8, $79        ;; 09:6154 ........
    db   $1c, $1f, $03, $66, $6d, $4e, $49, $da        ;; 09:615c ........
    db   $e8, $d8, $e6, $54, $75, $79, $6e, $e2        ;; 09:6164 ........
    db   $4f, $01, $e5, $5a, $59, $ff, $40, $ff        ;; 09:616c ........
    db   $6e, $4f, $7b, $50, $47, $e2, $d9, $d9        ;; 09:6174 ........
    db   $67, $64, $82, $e0, $6b, $54, $40, $17        ;; 09:617c ........
    db   $6d, $4e, $c5, $d8, $57, $02, $ff, $e7        ;; 09:6184 ........
    db   $d8, $5e, $ff, $69, $4f, $d4, $d5, $53        ;; 09:618c ........
    db   $57, $1f, $15, $60, $6c, $e0, $56, $04        ;; 09:6194 ........
    db   $db, $5c, $7b, $e1, $57, $69, $4f, $d5        ;; 09:619c ........
    db   $74, $de, $ff, $58, $02, $fe, $08, $38        ;; 09:61a4 ........
    db   $00, $38, $0b, $3e, $02, $11, $14, $1f        ;; 09:61ac w.......
    db   $12, $4e, $1f, $15, $f3, $ff, $d0, $40        ;; 09:61b4 ........
    db   $50, $5d, $7c, $68, $de, $dc, $d7, $54        ;; 09:61bc ........
    db   $da, $e2, $72, $66, $1f, $15, $4e, $cd        ;; 09:61c4 ........
    db   $5c, $68, $e3, $6a, $e7, $67, $1f, $12        ;; 09:61cc ........
    db   $4e, $c9, $6a, $e7, $f3, $f4, $ff, $ca        ;; 09:61d4 ........
    db   $e8, $74, $52, $79, $ff, $13, $22, $4f        ;; 09:61dc ........
    db   $cd, $dc, $02, $e0, $74, $db, $55, $50        ;; 09:61e4 ........
    db   $6b, $e1, $ad, $e7, $13, $16, $4f, $d9        ;; 09:61ec ........
    db   $55, $6b, $db, $44, $ec, $d8, $e7, $83        ;; 09:61f4 ........
    db   $1f, $15, $4e, $13, $2f, $c2, $ad, $0f        ;; 09:61fc ........
    db   $e1, $5c, $d6, $db, $e2, $dc, $d6, $d8        ;; 09:6204 ........
    db   $f3, $f3, $4f, $bc, $01, $e1, $da, $72        ;; 09:620c ........
    db   $ff, $68, $e3, $6a, $e7, $13, $30, $4f        ;; 09:6214 ........
    db   $18, $68, $59, $df, $62, $ea, $d4, $ec        ;; 09:621c ........
    db   $4f, $58, $e6, $d4, $0f, $68, $ea, $5b        ;; 09:6224 ........
    db   $df, $d7, $4f, $13, $22, $78, $e6, $55        ;; 09:622c ........
    db   $de, $72, $67, $1f, $12, $4e, $d2, $53        ;; 09:6234 ........
    db   $ad, $65, $ff, $e0, $d4, $d7, $83, $08        ;; 09:623c ........
    db   $13, $29, $3e, $03, $11, $12, $14, $38        ;; 09:6244 ........
    db   $0c, $14, $6d, $4e, $1f, $15, $79, $e3        ;; 09:624c ........
    db   $df, $56, $4f, $ea, $59, $ad, $57, $ea        ;; 09:6254 ........
    db   $5b, $de, $ff, $dc, $d9, $ff, $6c, $d9        ;; 09:625c ........
    db   $e8, $e7, $e8, $65, $79, $d4, $df, $65        ;; 09:6264 ........
    db   $d4, $d7, $ec, $4f, $d7, $d8, $42, $e5        ;; 09:626c ........
    db   $e2, $ec, $87, $61, $cc, $e7, $dc, $5e        ;; 09:6274 ........
    db   $4f, $ea, $6b, $db, $ff, $58, $da, $e2        ;; 09:627c ........
    db   $66, $64, $d2, $d8, $e6, $60, $ea, $50        ;; 09:6284 ........
    db   $b3, $ff, $d7, $d8, $d6, $dc, $d7, $87        ;; 09:628c ........
    db   $4f, $63, $6f, $04, $50, $d6, $56, $ad        ;; 09:6294 ........
    db   $e7, $4f, $d6, $df, $e2, $7b, $ff, $53        ;; 09:629c ........
    db   $e5, $ff, $d8, $ec, $d8, $54, $6e, $4f        ;; 09:62a4 ........
    db   $53, $e5, $ff, $7e, $e1, $ff, $d9, $e8        ;; 09:62ac ........
    db   $e7, $e8, $65, $67, $0b, $6d, $4e, $d0        ;; 09:62b4 ........
    db   $d8, $5e, $ff, $e6, $d4, $dc, $d7, $f3        ;; 09:62bc ........
    db   $ff, $7d, $70, $4f, $7b, $50, $63, $6b        ;; 09:62c4 ........
    db   $61, $bc, $76, $d8, $5f, $08, $32, $12        ;; 09:62cc ........
    db   $3d, $12, $32, $42, $32, $33, $3d, $13        ;; 09:62d4 ........
    db   $32, $43, $0c, $18, $32, $16, $3b, $16        ;; 09:62dc ........
    db   $32, $26, $3d, $36, $32, $46, $32, $10        ;; 09:62e4 ........
    db   $3b, $10, $32, $20, $3d, $10, $32, $40        ;; 09:62ec ........
    db   $0d, $36, $3b, $28, $32, $28, $3b, $48        ;; 09:62f4 ........
    db   $3b, $30, $32, $20, $3b, $20, $14, $1f        ;; 09:62fc ........
    db   $13, $4e, $bd, $59, $ad, $57, $da, $e2        ;; 09:6304 ........
    db   $5f, $08, $32, $30, $3b, $66, $32, $26        ;; 09:630c ........
    db   $3b, $57, $14, $64, $1f, $13, $f3, $32        ;; 09:6314 ........
    db   $00, $ff, $1f, $12, $83, $1f, $12, $4e        ;; 09:631c ........
    db   $c6, $16, $54, $5d, $7c, $da, $e2, $72        ;; 09:6324 ........
    db   $ff, $58, $da, $d8, $57, $69, $4f, $53        ;; 09:632c ........
    db   $e7, $e6, $dc, $d7, $d8, $67, $64, $c2        ;; 09:6334 ........
    db   $e7, $79, $c8, $c4, $61, $d0, $d8, $ad        ;; 09:633c ........
    db   $65, $4f, $da, $e2, $72, $ff, $58, $e0        ;; 09:6344 ........
    db   $0e, $75, $4f, $e6, $d4, $d9, $50, $e6        ;; 09:634c ........
    db   $5c, $47, $d6, $56, $4f, $e3, $df, $d4        ;; 09:6354 ........
    db   $62, $53, $e7, $e6, $dc, $d7, $d8, $f3        ;; 09:635c ........
    db   $4f, $bb, $50, $da, $e2, $e2, $d7, $61        ;; 09:6364 ........
    db   $d0, $d8, $ad, $5e, $4f, $7b, $50, $47        ;; 09:636c ........
    db   $df, $6f, $52, $67, $32, $30, $1f, $13        ;; 09:6374 ........
    db   $4e, $cb, $d8, $d4, $5e, $ec, $66, $64        ;; 09:637c ........
    db   $49, $e3, $e5, $76, $6b, $d8, $5f, $08        ;; 09:6384 ........
    db   $32, $18, $3b, $18, $32, $08, $3b, $28        ;; 09:638c ........
    db   $32, $38, $32, $10, $14, $6d, $4e, $cb        ;; 09:6394 ........
    db   $d8, $d4, $d7, $ec, $66, $64, $d2, $d8        ;; 09:639c ........
    db   $e6, $f3, $ff, $c5, $d8, $e7, $79, $da        ;; 09:63a4 ........
    db   $e2, $fe, $08, $32, $28, $32, $20, $3b        ;; 09:63ac ........
    db   $58, $32, $48, $3b, $f0, $38, $00, $0d        ;; 09:63b4 ......w.
    db   $35, $38, $0a, $32, $44, $32, $45, $0d        ;; 09:63bc ........
    db   $03, $3b, $42, $3b, $40, $32, $34, $3b        ;; 09:63c4 ........
    db   $14, $32, $24, $3b, $14, $32, $23, $3b        ;; 09:63cc ........
    db   $13, $14, $1f, $10, $4e, $6d, $f3, $ff        ;; 09:63d4 ........
    db   $d0, $d4, $75, $67, $6d, $4e, $1f, $10        ;; 09:63dc ........
    db   $60, $1c, $1f, $03, $ac, $4f, $49, $6e        ;; 09:63e4 ........
    db   $df, $5a, $47, $e1, $e2, $57, $6e, $4f        ;; 09:63ec ........
    db   $1a, $d4, $0f, $68, $d6, $75, $ec, $67        ;; 09:63f4 ........
    db   $1f, $10, $4e, $49, $de, $e1, $7e, $60        ;; 09:63fc ........
    db   $d5, $e8, $57, $ea, $d8, $ad, $65, $4f        ;; 09:6404 ........
    db   $ea, $5b, $e5, $dc, $87, $61, $d0, $50        ;; 09:640c ........
    db   $d4, $5e, $4f, $da, $65, $ea, $ff, $e8        ;; 09:6414 ........
    db   $e3, $ff, $6e, $da, $d8, $63, $52, $f3        ;; 09:641c ........
    db   $4f, $ba, $e1, $5a, $1c, $1f, $03, $ad        ;; 09:6424 ........
    db   $e6, $17, $32, $13, $1c, $1f, $03, $4e        ;; 09:642c ........
    db   $cc, $6e, $e3, $f3, $ff, $6d, $ff, $de        ;; 09:6434 ........
    db   $e1, $7e, $e6, $4f, $ea, $01, $57, $db        ;; 09:643c ........
    db   $d8, $79, $d7, $e2, $72, $67, $32, $34        ;; 09:6444 ........
    db   $1f, $10, $4e, $bb, $e8, $e7, $83, $6d        ;; 09:644c ........
    db   $4e, $ae, $17, $32, $24, $1f, $10, $4e        ;; 09:6454 ........
    db   $82, $da, $e8, $5d, $5a, $6c, $d6, $75        ;; 09:645c ........
    db   $ec, $f3, $ff, $ba, $57, $1a, $6a, $e7        ;; 09:6464 ........
    db   $4f, $1a, $57, $40, $ff, $da, $e2, $67        ;; 09:646c ........
    db   $6d, $4e, $c1, $e0, $e0, $60, $d4, $df        ;; 09:6474 ........
    db   $e5, $80, $61, $d2, $53, $4f, $e6, $db        ;; 09:647c ........
    db   $53, $df, $5a, $d5, $e2, $63, $ff, $da        ;; 09:6484 ........
    db   $e2, $67, $1f, $10, $4e, $77, $ea, $59        ;; 09:648c ........
    db   $ad, $57, $65, $da, $65, $e7, $4f, $63        ;; 09:6494 ........
    db   $6b, $83, $08, $32, $23, $3b, $13, $32        ;; 09:649c ........
    db   $13, $32, $32, $14, $1c, $1f, $03, $4e        ;; 09:64a4 ........
    db   $7d, $56, $de, $ff, $69, $60, $6d, $67        ;; 09:64ac ........
    db   $08, $32, $23, $3b, $13, $32, $13, $3d        ;; 09:64b4 ........
    db   $13, $32, $43, $32, $14, $3b, $14, $32        ;; 09:64bc ........
    db   $24, $3b, $24, $32, $34, $3d, $14, $32        ;; 09:64c4 ........
    db   $44, $14, $13, $3c, $1c, $1f, $03, $ff        ;; 09:64cc ........
    db   $dd, $e2, $55, $87, $73, $13, $3c, $1f        ;; 09:64d4 ........
    db   $10, $ff, $dd, $e2, $55, $87, $73, $0a        ;; 09:64dc ........
    db   $11, $36, $10, $37, $18, $32, $22, $06        ;; 09:64e4 ........
    db   $6d, $4e, $cb, $d8, $d4, $d7, $ec, $f4        ;; 09:64ec ........
    db   $ff, $c5, $d8, $e7, $79, $da, $e2, $4f        ;; 09:64f4 ........
    db   $d5, $74, $de, $ff, $63, $52, $d8, $fe        ;; 09:64fc ........
    db   $0b, $32, $02, $3b, $52, $32, $22, $3b        ;; 09:6504 ........
    db   $50, $32, $02, $3d, $12, $32, $42, $3d        ;; 09:650c ........
    db   $20, $32, $40, $0d, $04, $12, $00, $32        ;; 09:6514 ........
    db   $30, $3b, $10, $0c, $0f, $32, $10, $3b        ;; 09:651c ........
    db   $20, $0c, $0f, $32, $30, $3b, $10, $32        ;; 09:6524 ........
    db   $20, $0c, $0f, $14, $64, $d0, $01, $57        ;; 09:652c ........
    db   $63, $d8, $17, $12, $08, $32, $00, $6d        ;; 09:6534 ........
    db   $4e, $c2, $e7, $79, $68, $7a, $60, $d4        ;; 09:653c ........
    db   $4f, $d9, $80, $52, $ff, $63, $6f, $ff        ;; 09:6544 ........
    db   $d6, $56, $4f, $e7, $e5, $d4, $e9, $d8        ;; 09:654c ........
    db   $df, $ff, $63, $e5, $53, $da, $db, $4f        ;; 09:6554 ........
    db   $e7, $dc, $02, $67, $0b, $64, $7d, $70        ;; 09:655c ........
    db   $60, $ea, $d8, $ad, $65, $ff, $e2, $d9        ;; 09:6564 ........
    db   $d9, $4f, $58, $68, $d9, $e8, $e7, $e8        ;; 09:656c ........
    db   $65, $66, $6d, $4e, $c7, $e2, $60, $75        ;; 09:6574 ........
    db   $79, $e8, $7b, $1a, $e6, $e6, $4f, $e1        ;; 09:657c ........
    db   $7e, $61, $cd, $0e, $63, $18, $6e, $4f        ;; 09:6584 ........
    db   $bc, $e5, $59, $e2, $54, $48, $be, $df        ;; 09:658c ........
    db   $56, $45, $c1, $50, $de, $e1, $7e, $54        ;; 09:6594 ........
    db   $7f, $df, $e2, $e7, $4f, $d4, $d5, $53        ;; 09:659c ........
    db   $57, $7a, $67, $06, $0b, $3e, $81, $18        ;; 09:65a4 ........
    db   $06, $64, $d0, $01, $e7, $79, $63, $6b        ;; 09:65ac ........
    db   $66, $6d, $4e, $1f, $15, $ff, $01, $5a        ;; 09:65b4 ........
    db   $75, $45, $c6, $80, $ff, $d5, $50, $d4        ;; 09:65bc ........
    db   $4f, $e0, $6b, $e6, $72, $ff, $ce, $e1        ;; 09:65c4 ........
    db   $75, $45, $c5, $d8, $57, $bc, $e5, $59        ;; 09:65cc ........
    db   $e2, $54, $7b, $7c, $75, $67, $64, $cb        ;; 09:65d4 ........
    db   $80, $83, $1f, $10, $4e, $c1, $d8, $ec        ;; 09:65dc ........
    db   $60, $68, $e2, $d6, $d8, $56, $ad, $e6        ;; 09:65e4 ........
    db   $4f, $d5, $d8, $e7, $ea, $d8, $70, $ff        ;; 09:65ec ........
    db   $40, $50, $56, $d7, $4f, $be, $df, $56        ;; 09:65f4 ........
    db   $67, $6d, $4e, $bf, $55, $5a, $2a, $21        ;; 09:65fc .......w
    db   $ff, $55, $4f, $c7, $5b, $63, $ff, $cd        ;; 09:6604 ........
    db   $7e, $52, $61, $d2, $53, $4f, $d6, $56        ;; 09:660c ........
    db   $ff, $d9, $df, $62, $63, $70, $73, $0b        ;; 09:6614 ........
    db   $ff, $c6, $16, $54, $df, $e8, $e5, $de        ;; 09:661c ........
    db   $4f, $63, $52, $d8, $60, $e6, $5c, $d5        ;; 09:6624 ........
    db   $7c, $d6, $5d, $d8, $d9, $e8, $df, $67        ;; 09:662c ........
    db   $64, $c8, $c4, $5f, $08, $32, $02, $3d        ;; 09:6634 ........
    db   $12, $32, $72, $38, $03, $3d, $32, $32        ;; 09:663c ........
    db   $42, $37, $40, $36, $41, $00, $39, $7d        ;; 09:6644 ......??
    db   $57, $a8, $2d, $a8, $0b, $27, $00, $84        ;; 09:664c ????????
    db   $4e, $d0, $db, $5c, $18, $75, $f4, $ff        ;; 09:6654 ????????
    db   $1f, $12, $66, $64, $ce, $e0, $60, $e1        ;; 09:665c ????????
    db   $e2, $ae, $17, $84, $4e, $7d, $70, $ff        ;; 09:6664 ????????
    db   $da, $d8, $57, $53, $e7, $fe, $10, $3e        ;; 09:666c ????????
    db   $02, $11, $13, $22, $0c, $1e, $3e, $03        ;; 09:6674 ????????
    db   $11, $13, $37, $00, $c1, $7e, $79, $68        ;; 09:667c ????????
    db   $bf, $df, $e8, $e6, $db, $d8, $eb, $06        ;; 09:6684 ????????
    db   $ea, $5b, $de, $72, $f4, $0b, $3e, $25        ;; 09:668c ????????
    db   $17, $27, $00, $6d, $4e, $c8, $db, $ff        ;; 09:6694 ????????
    db   $ec, $d8, $e6, $60, $d9, $dc, $d9, $e7        ;; 09:669c ????????
    db   $d8, $70, $4f, $ec, $d8, $5d, $54, $41        ;; 09:66a4 ????????
    db   $5c, $ea, $db, $70, $ff, $c2, $4f, $ea        ;; 09:66ac ????????
    db   $6a, $ff, $4a, $72, $ff, $d9, $5b, $4f        ;; 09:66b4 ????????
    db   $7f, $e3, $df, $74, $50, $58, $d5, $e8        ;; 09:66bc ????????
    db   $dc, $df, $d7, $4f, $7f, $6e, $ea, $e1        ;; 09:66c4 ????????
    db   $60, $49, $02, $57, $d4, $4f, $da, $e5        ;; 09:66cc ????????
    db   $53, $e3, $ff, $d6, $e2, $5e, $d8, $d6        ;; 09:66d4 ????????
    db   $e7, $72, $4f, $ce, $e1, $75, $e6, $61        ;; 09:66dc ????????
    db   $7d, $6f, $ff, $02, $56, $e6, $4f, $63        ;; 09:66e4 ????????
    db   $52, $50, $5d, $50, $e2, $63, $52, $e6        ;; 09:66ec ????????
    db   $4f, $db, $e8, $e1, $e7, $72, $ff, $ce        ;; 09:66f4 ????????
    db   $e1, $75, $54, $6e, $e2, $4f, $e6, $5c        ;; 09:66fc ????????
    db   $d5, $50, $d6, $5d, $d8, $d9, $e8, $df        ;; 09:6704 ????????
    db   $fe, $36, $48, $00, $6d, $4e, $bf, $55        ;; 09:670c ????????
    db   $5a, $2a, $21, $ff, $55, $4f, $c7, $5b        ;; 09:6714 ????????
    db   $63, $ff, $cd, $7e, $52, $ff, $6e, $4f        ;; 09:671c ????????
    db   $da, $5c, $58, $be, $df, $56, $fe, $10        ;; 09:6724 ????????
    db   $6d, $4e, $bd, $59, $ad, $57, $ea, $5b        ;; 09:672c ????????
    db   $e5, $ec, $61, $c7, $7e, $4f, $47, $e0        ;; 09:6734 ????????
    db   $e8, $42, $ff, $db, $e8, $e5, $e5, $ec        ;; 09:673c ????????
    db   $fe, $00, $6d, $4e, $1f, $11, $79, $e0        ;; 09:6744 ????????
    db   $41, $dc, $d6, $04, $dc, $5e, $4f, $e6        ;; 09:674c ????????
    db   $d4, $0f, $68, $d6, $75, $ec, $4f, $e6        ;; 09:6754 ????????
    db   $76, $87, $d4, $ec, $fe, $00, $1f, $10        ;; 09:675c ????????
    db   $4e, $ce, $7b, $ff, $68, $e6, $dc, $e0        ;; 09:6764 ????????
    db   $e8, $df, $6f, $5b, $4f, $d5, $d8, $db        ;; 09:676c ????????
    db   $55, $5a, $68, $db, $d8, $5d, $63, $4f        ;; 09:6774 ????????
    db   $1b, $d5, $6f, $e7, $1a, $4f, $e3, $e5        ;; 09:677c ????????
    db   $74, $e7, $dc, $d6, $d8, $fe, $00, $1f        ;; 09:6784 ????????
    db   $10, $4e, $82, $e3, $e5, $e2, $e7, $d8        ;; 09:678c ????????
    db   $d6, $57, $6c, $d6, $75, $ec, $61, $bd        ;; 09:6794 ????????
    db   $59, $ad, $e7, $4f, $ea, $5b, $e5, $62        ;; 09:679c ????????
    db   $d4, $d5, $53, $57, $75, $fe, $00, $3a        ;; 09:67a4 ????????
    db   $e0, $56, $44, $ae, $7a, $9d, $b5, $67        ;; 09:67ac ????????
    db   $00, $3a, $3b, $49, $5b, $9d, $1c, $9d        ;; 09:67b4 ????????
    db   $36, $9c, $00, $ba, $e7, $e7, $d4, $d6        ;; 09:67bc ???.....
    db   $de, $ff, $bd, $d8, $d9, $d8, $e1, $d6        ;; 09:67c4 ........
    db   $d8, $ba, $da, $dc, $df, $dc, $e7, $ec        ;; 09:67cc ........
    db   $c6, $d4, $da, $dc, $d6, $ff, $ff, $c1        ;; 09:67d4 ........
    db   $dc, $e7, $ff, $ff, $ff, $ff, $be, $e9        ;; 09:67dc ........
    db   $d4, $d7, $d8, $ff, $ff, $c6, $af, $bd        ;; 09:67e4 ........
    db   $d8, $d9, $af, $ff, $c6, $af, $be, $e9        ;; 09:67ec ........
    db   $d4, $d7, $d8, $c7, $d4, $dc, $df, $ff        ;; 09:67f4 ...?????
    db   $ff, $ff, $ff, $cd, $e8, $e6, $de, $ff        ;; 09:67fc ????????
    db   $ff, $ff, $ff, $cd, $e2, $e1, $da, $e8        ;; 09:6804 ????????
    db   $d8, $ff, $ff, $c1, $e2, $e5, $e1, $ff        ;; 09:680c ????????
    db   $ff, $ff, $ff, $bb, $d8, $d4, $de, $ff        ;; 09:6814 ????????
    db   $ff, $ff, $ff, $cd, $d4, $dc, $df, $ff        ;; 09:681c ????????
    db   $ff, $ff, $ff, $bf, $dc, $e1, $ff, $ff        ;; 09:6824 ????????
    db   $ff, $ff, $ff, $cd, $d8, $e1, $e7, $d4        ;; 09:682c ????????
    db   $d6, $df, $d8, $ba, $d6, $dc, $d7, $ff        ;; 09:6834 ????????
    db   $ff, $ff, $ff, $cc, $e8, $e1, $d5, $e8        ;; 09:683c ????????
    db   $e5, $e6, $e7, $bd, $f2, $bb, $d8, $d4        ;; 09:6844 ????????
    db   $e0, $ff, $ff, $c9, $f2, $bb, $df, $d4        ;; 09:684c ????????
    db   $e6, $e7, $ff, $cb, $e2, $d6, $de, $d8        ;; 09:6854 ????????
    db   $e7, $ff, $ff, $bd, $e5, $dc, $df, $df        ;; 09:685c ????????
    db   $ff, $ff, $ff, $cc, $df, $dc, $d6, $d8        ;; 09:6864 ????????
    db   $e5, $ff, $ff, $cc, $e3, $dc, $e1, $bc        ;; 09:686c ????????
    db   $e8, $e7, $ff, $c5, $d4, $e6, $d8, $e5        ;; 09:6874 ????????
    db   $ff, $ff, $ff, $bb, $d8, $d4, $e0, $ff        ;; 09:687c ????????
    db   $ff, $ff, $ff, $c9, $e8, $e1, $d6, $db        ;; 09:6884 ????????
    db   $ff, $ff, $ff, $c4, $dc, $d6, $de, $ff        ;; 09:688c ???....?
    db   $ff, $ff, $ff, $ce, $e3, $e3, $d8, $e5        ;; 09:6894 ????????
    db   $ff, $ff, $ff, $cc, $e7, $d4, $d5, $ff        ;; 09:689c ????????
    db   $ff, $ff, $ff, $c1, $d8, $d4, $d7, $d5        ;; 09:68a4 ????????
    db   $e8, $e7, $ff, $d0, $dc, $e1, $d7, $ce        ;; 09:68ac ????????
    db   $e3, $ff, $ff, $bc, $e5, $d4, $e6, $db        ;; 09:68b4 ????????
    db   $ff, $ff, $ff, $bb, $d4, $e6, $db, $ff        ;; 09:68bc ????????
    db   $ff, $ff, $ff, $bd, $dc, $e9, $d8, $ff        ;; 09:68c4 ???....?
    db   $ff, $ff, $ff, $bb, $e5, $d8, $d4, $e7        ;; 09:68cc ????????
    db   $db, $ff, $ff, $bb, $dc, $e7, $d8, $ff        ;; 09:68d4 ????????
    db   $ff, $ff, $ff, $cc, $e1, $d8, $d8, $e5        ;; 09:68dc ????????
    db   $ff, $ff, $ff, $bd, $dc, $e6, $e3, $d8        ;; 09:68e4 ????????
    db   $df, $ff, $ff, $cc, $d6, $e5, $d8, $d4        ;; 09:68ec ????????
    db   $e0, $ff, $ff, $c4, $e1, $dc, $d9, $d8        ;; 09:68f4 ????????
    db   $ff, $ff, $ff, $bd, $d4, $e6, $db, $ff        ;; 09:68fc ????????
    db   $ff, $ff, $ff, $c5, $e2, $ea, $c4, $dc        ;; 09:6904 ????????
    db   $d6, $de, $ff, $bd, $e5, $e2, $e3, $ff        ;; 09:690c ????????
    db   $ff, $ff, $ff, $bf, $e5, $d8, $d8, $ed        ;; 09:6914 ????????
    db   $d8, $ff, $ff, $bd, $d4, $e1, $d6, $d8        ;; 09:691c ????????
    db   $ff, $ff, $ff, $cd, $e5, $e2, $e0, $e3        ;; 09:6924 ????????
    db   $ff, $ff, $ff, $d0, $f2, $ba, $e7, $e7        ;; 09:692c ????????
    db   $d4, $d6, $de, $b2, $f2, $cc, $ea, $e2        ;; 09:6934 ????????
    db   $e5, $d7, $e6, $b2, $d1, $f2, $c4, $dc        ;; 09:693c ????????
    db   $d6, $de, $ff, $b2, $f2, $cd, $e8, $e6        ;; 09:6944 ????????
    db   $de, $e6, $ff, $b3, $f2, $c1, $d8, $d4        ;; 09:694c ????????
    db   $d7, $e6, $ff, $b4, $f2, $c1, $d8, $d4        ;; 09:6954 ????????
    db   $d7, $e6, $ff, $b6, $f2, $ba, $e5, $e0        ;; 09:695c ????????
    db   $e6, $ff, $ff, $b8, $f2, $c5, $d8, $da        ;; 09:6964 ????????
    db   $e6, $ff, $ff, $cd, $ea, $dc, $d6, $d8        ;; 09:696c ????????
    db   $ff, $ff, $ff, $b6, $e7, $dc, $e0, $d8        ;; 09:6974 ????????
    db   $e6, $ff, $ff, $ca, $e8, $d4, $de, $d8        ;; 09:697c ????????
    db   $ff, $ff, $ff, $cc, $e4, $e8, $dc, $e5        ;; 09:6984 ????????
    db   $e7, $ff, $ff, $bf, $e5, $e2, $e6, $e7        ;; 09:698c ????????
    db   $ff, $ff, $ff, $d0, $db, $dc, $e5, $df        ;; 09:6994 ????????
    db   $ff, $ff, $ff, $bf, $df, $d4, $e0, $d8        ;; 09:699c ????????
    db   $ff, $ff, $ff, $bb, $e8, $e5, $e1, $dc        ;; 09:69a4 ????????
    db   $e1, $da, $ff, $c0, $df, $e2, $ea, $ff        ;; 09:69ac ????????
    db   $ff, $ff, $ff, $cc, $e7, $e2, $e5, $e0        ;; 09:69b4 ????????
    db   $ff, $ff, $ff, $bc, $ec, $d6, $df, $e2        ;; 09:69bc ????????
    db   $e1, $d8, $ff, $cd, $db, $e8, $e1, $d7        ;; 09:69c4 ????????
    db   $d8, $e5, $ff, $be, $eb, $e3, $df, $e2        ;; 09:69cc ????????
    db   $d7, $d8, $ff, $bb, $d4, $e5, $e5, $dc        ;; 09:69d4 ????????
    db   $d8, $e5, $ff, $cc, $ea, $d4, $df, $df        ;; 09:69dc ????????
    db   $e2, $ea, $ff, $bd, $de, $f2, $cf, $dc        ;; 09:69e4 ????????
    db   $e5, $e8, $e6, $bd, $de, $f2, $bf, $e2        ;; 09:69ec ????????
    db   $e5, $d6, $d8, $bf, $df, $e8, $dc, $d7        ;; 09:69f4 ????????
    db   $ff, $ff, $ff, $cd, $e2, $e8, $d6, $db        ;; 09:69fc ????????
    db   $ff, $ff, $ff, $bd, $dc, $e6, $e6, $e2        ;; 09:6a04 ????????
    db   $df, $e9, $ff, $ba, $d5, $e6, $e2, $e5        ;; 09:6a0c ????????
    db   $d5, $ff, $ff, $bd, $e5, $d4, $dc, $e1        ;; 09:6a14 ????????
    db   $ff, $ff, $ff, $cb, $d8, $e0, $d8, $d7        ;; 09:6a1c ????????
    db   $ec, $ff, $ff, $cb, $d8, $e0, $d8, $d7        ;; 09:6a24 ????????
    db   $ec, $ff, $ff, $d1, $c9, $e2, $ea, $d7        ;; 09:6a2c ????????
    db   $d8, $e5, $ff, $d1, $f2, $c0, $d4, $ed        ;; 09:6a34 ????????
    db   $d8, $ff, $ff, $d1, $f2, $bf, $df, $d4        ;; 09:6a3c ????????
    db   $e6, $db, $ff, $d1, $f2, $c1, $d8, $d4        ;; 09:6a44 ????????
    db   $e7, $ff, $ff, $cc, $e7, $e2, $e1, $cc        ;; 09:6a4c ????????
    db   $de, $dc, $e1, $cc, $e7, $e2, $e1, $c0        ;; 09:6a54 ????????
    db   $d4, $ed, $d8, $cc, $e7, $e2, $e1, $d8        ;; 09:6a5c ????????
    db   $c0, $d4, $e6, $c9, $d8, $e7, $e5, $dc        ;; 09:6a64 ????????
    db   $d9, $ec, $ff, $c6, $e8, $e7, $d8, $ff        ;; 09:6a6c ????????
    db   $ff, $ff, $ff, $cc, $dc, $df, $d8, $e1        ;; 09:6a74 ????????
    db   $d6, $d8, $ff, $bb, $df, $dc, $e1, $d7        ;; 09:6a7c ????????
    db   $ff, $ff, $ff, $c2, $e1, $de, $ff, $ff        ;; 09:6a84 ????????
    db   $ff, $ff, $ff, $bf, $df, $d4, $e6, $db        ;; 09:6a8c ????????
    db   $ff, $ff, $ff, $c9, $e2, $dc, $e6, $e2        ;; 09:6a94 ????????
    db   $e1, $ff, $ff, $c9, $e2, $dc, $e6, $e2        ;; 09:6a9c ????????
    db   $e1, $ff, $ff, $c9, $f2, $cc, $de, $dc        ;; 09:6aa4 ????????
    db   $e1, $ff, $ff, $c0, $d4, $ed, $d8, $ff        ;; 09:6aac ????????
    db   $ff, $ff, $ff, $bc, $e8, $e5, $e6, $cc        ;; 09:6ab4 ????????
    db   $e2, $e1, $da, $c9, $d4, $e5, $d4, $cc        ;; 09:6abc ????????
    db   $de, $dc, $e1, $c9, $d4, $e5, $d4, $c7        ;; 09:6ac4 ????????
    db   $d4, $dc, $df, $c0, $d4, $ed, $d8, $ff        ;; 09:6acc ????????
    db   $ff, $ff, $ff, $c9, $d4, $e5, $d4, $df        ;; 09:6ad4 ????????
    db   $ec, $ed, $d8, $c5, $e8, $df, $df, $d4        ;; 09:6adc ????????
    db   $d5, $ec, $ff, $cc, $df, $d8, $d8, $e3        ;; 09:6ae4 ????????
    db   $c0, $d4, $e6, $c1, $ec, $e3, $e1, $e2        ;; 09:6aec ????????
    db   $e6, $dc, $e6, $cc, $df, $d8, $d8, $e3        ;; 09:6af4 ????????
    db   $ff, $ff, $ff, $bd, $d8, $d6, $e2, $ec        ;; 09:6afc ????????
    db   $ff, $ff, $ff, $cb, $dc, $d7, $d7, $df        ;; 09:6b04 ????????
    db   $d8, $ff, $ff, $bc, $db, $d4, $e5, $e0        ;; 09:6b0c ????????
    db   $ff, $ff, $ff, $c9, $e6, $ec, $d6, $db        ;; 09:6b14 ????????
    db   $ff, $ff, $ff, $c7, $e8, $e0, $d5, $ff        ;; 09:6b1c ????????
    db   $ff, $ff, $ff, $cc, $e7, $d8, $e1, $d6        ;; 09:6b24 ????????
    db   $db, $ff, $ff, $cc, $d4, $e1, $d7, $ff        ;; 09:6b2c ????????
    db   $ff, $ff, $ff, $bb, $df, $dc, $e7, $ed        ;; 09:6b34 ????????
    db   $ff, $ff, $ff, $cc, $e2, $d9, $e7, $d8        ;; 09:6b3c ????????
    db   $e1, $ff, $ff, $c6, $e8, $df, $e7, $dc        ;; 09:6b44 ????????
    db   $e3, $df, $ec, $cc, $e7, $d8, $d4, $df        ;; 09:6b4c ????????
    db   $ff, $ff, $ff, $ba, $e9, $d8, $e1, $da        ;; 09:6b54 ????????
    db   $d8, $ff, $ff, $bc, $e2, $e8, $e1, $e7        ;; 09:6b5c ????????
    db   $d8, $e5, $ff, $cb, $d8, $e3, $d4, $dc        ;; 09:6b64 ????????
    db   $e5, $ff, $ff, $cc, $d8, $df, $d9, $dc        ;; 09:6b6c ????????
    db   $eb, $ff, $ff, $f5, $ba, $df, $df, $ff        ;; 09:6b74 ????????
    db   $ff, $ff, $ff, $f5, $bf, $d4, $e7, $d4        ;; 09:6b7c ????????
    db   $df, $ff, $ff, $f5, $cc, $e7, $e2, $e1        ;; 09:6b84 ????????
    db   $d8, $ff, $ff, $f5, $c6, $e8, $e7, $d8        ;; 09:6b8c ????????
    db   $ff, $ff, $ff, $f5, $bb, $df, $dc, $e1        ;; 09:6b94 ????????
    db   $d7, $ff, $ff, $f5, $c9, $e2, $dc, $e6        ;; 09:6b9c ????????
    db   $e2, $e1, $ff, $f5, $bc, $e8, $e5, $e6        ;; 09:6ba4 ????????
    db   $d8, $ff, $ff, $f5, $c9, $d4, $e5, $d4        ;; 09:6bac ????????
    db   $ff, $ff, $ff, $f5, $cc, $df, $d8, $d8        ;; 09:6bb4 ????????
    db   $e3, $ff, $ff, $f5, $bc, $e2, $e1, $d9        ;; 09:6bbc ????????
    db   $e8, $e6, $d8, $f5, $bd, $d4, $e0, $d4        ;; 09:6bc4 ????????
    db   $da, $d8, $ff, $f5, $bc, $db, $d4, $e1        ;; 09:6bcc ????????
    db   $da, $d8, $ff, $f5, $ca, $e8, $d4, $de        ;; 09:6bd4 ????????
    db   $d8, $ff, $ff, $f5, $c2, $d6, $d8, $ff        ;; 09:6bdc ????????
    db   $ff, $ff, $ff, $f5, $bf, $dc, $e5, $d8        ;; 09:6be4 ????????
    db   $ff, $ff, $ff, $f5, $cd, $e2, $e5, $e1        ;; 09:6bec ????????
    db   $d4, $d7, $e2, $f5, $cd, $db, $e8, $e1        ;; 09:6bf4 ????????
    db   $d7, $d8, $e5, $ff, $ff, $ff, $ff, $ff        ;; 09:6bfc ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 09:6c04 ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 09:6c0c ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 09:6c14 ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 09:6c1c ????????
    db   $ff, $ff, $ff, $f6, $ca, $e8, $d4, $de        ;; 09:6c24 ????????
    db   $d8, $ff, $ff, $f6, $c2, $d6, $d8, $ff        ;; 09:6c2c ????????
    db   $ff, $ff, $ff, $f6, $bf, $dc, $e5, $d8        ;; 09:6c34 ????????
    db   $ff, $ff, $ff, $f6, $cd, $e2, $e5, $e1        ;; 09:6c3c ????????
    db   $d4, $d7, $e2, $f6, $cd, $db, $e8, $e1        ;; 09:6c44 ????????
    db   $d7, $d8, $e5, $ff, $ff, $ff, $ff, $ff        ;; 09:6c4c ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 09:6c54 ????????
    db   $ff, $ff, $ff, $43, $18, $20, $00, $09        ;; 09:6c5c ???.....
    db   $03, $1f, $00, $ff, $28, $02, $ff, $21        ;; 09:6c64 ..w.....
    db   $00, $05, $09, $03, $25, $14, $ff, $25        ;; 09:6c6c w.......
    db   $32, $43, $18, $38, $01, $09, $03, $1f        ;; 09:6c74 ........
    db   $01, $ff, $28, $12, $ff, $21, $01, $05        ;; 09:6c7c ........
    db   $09, $03, $25, $15, $ff, $25, $33, $43        ;; 09:6c84 ........
    db   $18, $50, $02, $09, $03, $1f, $02, $ff        ;; 09:6c8c ........
    db   $28, $22, $ff, $21, $02, $05, $09, $03        ;; 09:6c94 ........
    db   $25, $16, $ff, $25, $34, $43, $18, $68        ;; 09:6c9c ........
    db   $03, $09, $03, $1f, $03, $ff, $28, $32        ;; 09:6ca4 ........
    db   $ff, $21, $03, $05, $09, $03, $25, $17        ;; 09:6cac ........
    db   $ff, $25, $35, $00, $43, $18, $88, $04        ;; 09:6cb4 ........
    db   $09, $03, $1f, $04, $ff, $28, $42, $ff        ;; 09:6cbc ........
    db   $21, $04, $05, $09, $03, $25, $18, $ff        ;; 09:6cc4 ........
    db   $25, $36, $00, $ff, $c2, $e7, $d8, $e0        ;; 09:6ccc ........
    db   $06, $ff, $c6, $d4, $da, $dc, $d6, $06        ;; 09:6cd4 ........
    db   $ff, $cd, $d4, $df, $d8, $e1, $e7, $ff        ;; 09:6cdc ........
    db   $cc, $e7, $d4, $e7, $e8, $e6, $ff, $be        ;; 09:6ce4 ........
    db   $e4, $e8, $dc, $e3, $06, $ff, $ba, $e8        ;; 09:6cec ........
    db   $e7, $e2, $06, $ff, $cc, $d4, $e9, $d8        ;; 09:6cf4 ........
    db   $00, $33, $00, $00                            ;; 09:6cfc w...

data_09_6d00:
    db   $4c, $43, $90, $50, $0a, $11, $01, $ff        ;; 09:6d00 ........
    db   $ff, $ff, $1e, $00, $ff, $2f, $00, $06        ;; 09:6d08 ...w..w.
    db   $4c, $ff, $ff, $ff, $1e, $01, $ff, $2f        ;; 09:6d10 ........
    db   $01, $06, $4c, $ff, $ff, $ff, $1e, $02        ;; 09:6d18 ........
    db   $ff, $2f, $02, $06, $4c, $ff, $ff, $ff        ;; 09:6d20 ........
    db   $1e, $03, $ff, $2f, $03, $06, $4c, $ff        ;; 09:6d28 ........
    db   $ff, $ff, $1e, $04, $ff, $2f, $04, $06        ;; 09:6d30 ........
    db   $4c, $ff, $ff, $ff, $1e, $05, $ff, $2f        ;; 09:6d38 ........
    db   $05, $06, $4c, $ff, $ff, $ff, $1e, $06        ;; 09:6d40 ........
    db   $ff, $2f, $06, $06, $4c, $ff, $ff, $ff        ;; 09:6d48 ........
    db   $1e, $07, $ff, $2f, $07, $06, $4c, $43        ;; 09:6d50 ........
    db   $90, $50, $0a, $11, $00, $ff, $ff, $ff        ;; 09:6d58 ????????
    db   $1e, $08, $ff, $2f, $08, $06, $4c, $ff        ;; 09:6d60 ????????
    db   $ff, $ff, $1e, $09, $ff, $2f, $09, $06        ;; 09:6d68 ????????
    db   $4c, $ff, $ff, $ff, $1e, $0a, $ff, $2f        ;; 09:6d70 ????????
    db   $0a, $06, $4c, $ff, $ff, $ff, $1e, $0b        ;; 09:6d78 ????????
    db   $ff, $2f, $0b, $06, $4c, $ff, $ff, $ff        ;; 09:6d80 ????????
    db   $1e, $0c, $ff, $2f, $0c, $06, $4c, $ff        ;; 09:6d88 ????????
    db   $ff, $ff, $1e, $0d, $ff, $2f, $0d, $06        ;; 09:6d90 ????????
    db   $4c, $ff, $ff, $ff, $1e, $0e, $ff, $2f        ;; 09:6d98 ????????
    db   $0e, $06, $4c, $11, $02, $ff, $ff, $ff        ;; 09:6da0 ????????
    db   $1e, $0f, $ff, $2f, $0f, $06, $4c, $43        ;; 09:6da8 ????????
    db   $90, $50, $0a, $ff, $ff, $ff, $1e, $10        ;; 09:6db0 ????????
    db   $ff, $2f, $10, $06, $4c, $ff, $ff, $ff        ;; 09:6db8 ????????
    db   $1e, $11, $ff, $2f, $11, $06, $4c, $ff        ;; 09:6dc0 ????????
    db   $ff, $ff, $1e, $12, $ff, $2f, $12, $06        ;; 09:6dc8 ????????
    db   $4c, $ff, $ff, $ff, $1e, $13, $ff, $2f        ;; 09:6dd0 ????????
    db   $13, $06, $4c, $ff, $ff, $ff, $1e, $14        ;; 09:6dd8 ????????
    db   $ff, $2f, $14, $06, $4c, $ff, $ff, $ff        ;; 09:6de0 ????????
    db   $1e, $15, $ff, $2f, $15, $06, $4c, $ff        ;; 09:6de8 ????????
    db   $ff, $ff, $1e, $16, $ff, $2f, $16, $06        ;; 09:6df0 ????????
    db   $4c, $11, $03, $ff, $ff, $ff, $1e, $17        ;; 09:6df8 ????????
    db   $ff, $2f, $17, $00                            ;; 09:6e00 ????

data_09_6e04:
    db   $ba, $e8, $e7, $e2, $00, $05, $c9, $df        ;; 09:6e04 ?????...
    db   $d8, $d4, $e6, $d8, $ff, $e6, $d8, $df        ;; 09:6e0c ........
    db   $d8, $d6, $e7, $ff, $d9, $dc, $df, $d8        ;; 09:6e14 ........
    db   $ff, $e7, $e2, $ff, $e6, $d4, $e9, $d8        ;; 09:6e1c ........
    db   $ff, $e7, $db, $d8, $ff, $d7, $d4, $e7        ;; 09:6e24 ........
    db   $d4, $af, $00, $43, $18, $48, $09, $09        ;; 09:6e2c ...?????
    db   $03, $1f, $00, $ff, $20, $00, $ff, $21        ;; 09:6e34 ????????
    db   $00, $05, $09, $03, $25, $14, $ff, $25        ;; 09:6e3c ????????
    db   $32, $00, $43, $18, $68, $0a, $09, $03        ;; 09:6e44 ????????
    db   $1f, $01, $ff, $20, $01, $ff, $21, $01        ;; 09:6e4c ????????
    db   $05, $09, $03, $25, $15, $ff, $25, $33        ;; 09:6e54 ????????
    db   $00, $43, $18, $88, $0b, $09, $03, $1f        ;; 09:6e5c ????????
    db   $02, $ff, $20, $02, $ff, $21, $02, $05        ;; 09:6e64 ????????
    db   $09, $03, $25, $16, $ff, $25, $34, $00        ;; 09:6e6c ????????
    db   $05, $c9, $e5, $d8, $e9, $dc, $e2, $e8        ;; 09:6e74 ????????
    db   $e6, $ff, $d7, $d4, $e7, $d4, $ff, $d9        ;; 09:6e7c ????????
    db   $dc, $df, $d8, $ff, $ea, $dc, $df, $df        ;; 09:6e84 ????????
    db   $ff, $d5, $d8, $ff, $d7, $d8, $df, $d8        ;; 09:6e8c ????????
    db   $e7, $d8, $d7, $af, $00                       ;; 09:6e94 ?????

data_09_6e99:
    db   $4c, $43, $90, $50, $0b, $11, $01, $ff        ;; 09:6e99 ........
    db   $ff, $ff, $35, $00, $06, $4c, $ff, $ff        ;; 09:6ea1 ........
    db   $ff, $35, $01, $06, $4c, $ff, $ff, $ff        ;; 09:6ea9 ........
    db   $35, $02, $06, $4c, $ff, $ff, $ff, $35        ;; 09:6eb1 ........
    db   $03, $06, $4c, $ff, $ff, $ff, $35, $04        ;; 09:6eb9 ........
    db   $06, $4c, $ff, $ff, $ff, $35, $05, $06        ;; 09:6ec1 ........
    db   $4c, $ff, $ff, $ff, $35, $06, $06, $4c        ;; 09:6ec9 ........
    db   $ff, $ff, $ff, $35, $07, $06, $4c, $43        ;; 09:6ed1 ........
    db   $90, $50, $0b, $11, $00, $ff, $ff, $ff        ;; 09:6ed9 ????????
    db   $35, $08, $06, $4c, $ff, $ff, $ff, $35        ;; 09:6ee1 ????????
    db   $09, $06, $4c, $ff, $ff, $ff, $35, $0a        ;; 09:6ee9 ????????
    db   $06, $4c, $ff, $ff, $ff, $35, $0b, $06        ;; 09:6ef1 ????????
    db   $4c, $ff, $ff, $ff, $35, $0c, $06, $4c        ;; 09:6ef9 ????????
    db   $ff, $ff, $ff, $35, $0d, $06, $4c, $ff        ;; 09:6f01 ????????
    db   $ff, $ff, $35, $0e, $06, $4c, $11, $02        ;; 09:6f09 ????????
    db   $ff, $ff, $ff, $35, $0f, $06, $4c, $43        ;; 09:6f11 ????????
    db   $90, $50, $0b, $ff, $ff, $ff, $35, $10        ;; 09:6f19 ????????
    db   $06, $4c, $ff, $ff, $ff, $35, $11, $06        ;; 09:6f21 ????????
    db   $4c, $ff, $ff, $ff, $35, $12, $06, $4c        ;; 09:6f29 ????????
    db   $ff, $ff, $ff, $35, $13, $06, $4c, $ff        ;; 09:6f31 ????????
    db   $ff, $ff, $35, $14, $06, $4c, $ff, $ff        ;; 09:6f39 ????????
    db   $ff, $35, $15, $06, $4c, $ff, $ff, $ff        ;; 09:6f41 ????????
    db   $35, $16, $06, $4c, $11, $03, $ff, $ff        ;; 09:6f49 ????????
    db   $ff, $35, $17, $00                            ;; 09:6f51 ????

data_09_6f55:
    db   $d2, $e2, $e8, $e5, $ff, $d5, $d4, $da        ;; 09:6f55 ????????
    db   $ff, $dc, $e6, $ff, $d9, $e8, $df, $df        ;; 09:6f5d ????????
    db   $f3, $00, $43, $10, $18, $ff, $ff, $ff        ;; 09:6f65 ??......
    db   $1f, $ff, $ff, $20, $ff, $ff, $ff, $21        ;; 09:6f6d ........
    db   $ff, $22, $ff, $09, $02, $23, $ff, $1d        ;; 09:6f75 ........
    db   $ff, $24, $ff, $c1, $ae, $25, $1d, $c6        ;; 09:6f7d ........
    db   $ae, $25, $3b, $34, $ff, $00                  ;; 09:6f85 ......

data_09_6f8b:
    db   $ff, $ff, $d2, $e2, $e8, $ff, $db, $d4        ;; 09:6f8b ????????
    db   $e9, $d8, $ff, $e7, $db, $d4, $e7, $f3        ;; 09:6f93 ????????
    db   $00                                           ;; 09:6f9b ?

data_09_6f9c:
    db   $ff, $cd, $db, $d4, $e7, $ad, $e6, $ff        ;; 09:6f9c ????????
    db   $e7, $e2, $e2, $ff, $e0, $d4, $e1, $ec        ;; 09:6fa4 ????????
    db   $f3, $00, $d2, $e2, $e8, $ff, $db, $d4        ;; 09:6fac ????????
    db   $e9, $d8, $ff, $e7, $e2, $e2, $06, $e0        ;; 09:6fb4 ????????
    db   $d4, $e1, $ec, $af, $06, $cd, $db, $d8        ;; 09:6fbc ????????
    db   $ff, $e5, $d8, $e6, $e7, $ff, $ea, $dc        ;; 09:6fc4 ????????
    db   $df, $df, $ff, $d5, $d8, $06, $d7, $dc        ;; 09:6fcc ????????
    db   $e6, $d6, $d4, $e5, $d7, $d8, $d7, $af        ;; 09:6fd4 ????????
    db   $00                                           ;; 09:6fdc ?

data_09_6fdd:
    db   $ff, $ff, $c5, $d8, $d4, $e5, $e1, $d8        ;; 09:6fdd ????????
    db   $d7, $ff, $1c, $35, $ff, $af, $00, $05        ;; 09:6fe5 ???????.
    db   $43, $10, $18, $ff, $09, $09, $c1, $ae        ;; 09:6fed ........
    db   $25, $1d, $05, $ff, $ff, $1f, $ff, $ff        ;; 09:6ff5 ........
    db   $c6, $ae, $25, $3b, $2b, $ff, $2c, $ff        ;; 09:6ffd ........
    db   $2d, $ff, $2e, $ff, $00, $ff, $29, $00        ;; 09:7005 ........
    db   $1e, $20, $ff, $29, $01, $1e, $21, $ff        ;; 09:700d ........
    db   $29, $02, $1e, $22, $ff, $29, $03, $1e        ;; 09:7015 ........
    db   $23, $ff, $29, $04, $1e, $24, $ff, $29        ;; 09:701d ........
    db   $05, $1e, $25, $ff, $29, $06, $1e, $26        ;; 09:7025 ........
    db   $ff, $29, $07, $1e, $27, $00, $4c, $11        ;; 09:702d ........
    db   $01, $ff, $ff, $ff, $1e, $00, $ff, $2f        ;; 09:7035 .....w..
    db   $00, $06, $4c, $ff, $ff, $ff, $1e, $01        ;; 09:703d w.......
    db   $ff, $2f, $01, $06, $4c, $ff, $ff, $ff        ;; 09:7045 ........
    db   $1e, $02, $ff, $2f, $02, $06, $4c, $ff        ;; 09:704d ........
    db   $ff, $ff, $1e, $03, $ff, $2f, $03, $06        ;; 09:7055 ........
    db   $4c, $11, $00, $ff, $ff, $ff, $1e, $04        ;; 09:705d ..??????
    db   $ff, $2f, $04, $06, $4c, $ff, $ff, $ff        ;; 09:7065 ????????
    db   $1e, $05, $ff, $2f, $05, $06, $4c, $ff        ;; 09:706d ????????
    db   $ff, $ff, $1e, $06, $ff, $2f, $06, $06        ;; 09:7075 ????????
    db   $4c, $ff, $ff, $ff, $1e, $07, $ff, $2f        ;; 09:707d ????????
    db   $07, $06, $4c, $ff, $ff, $ff, $1e, $08        ;; 09:7085 ????????
    db   $ff, $2f, $08, $06, $4c, $ff, $ff, $ff        ;; 09:708d ????????
    db   $1e, $09, $ff, $2f, $09, $06, $4c, $ff        ;; 09:7095 ????????
    db   $ff, $ff, $1e, $0a, $ff, $2f, $0a, $06        ;; 09:709d ????????
    db   $4c, $ff, $ff, $ff, $1e, $0b, $ff, $2f        ;; 09:70a5 ????????
    db   $0b, $06, $4c, $ff, $ff, $ff, $1e, $0c        ;; 09:70ad ????????
    db   $ff, $2f, $0c, $06, $4c, $ff, $ff, $ff        ;; 09:70b5 ????????
    db   $1e, $0d, $ff, $2f, $0d, $06, $4c, $ff        ;; 09:70bd ????????
    db   $ff, $ff, $1e, $0e, $ff, $2f, $0e, $06        ;; 09:70c5 ????????
    db   $4c, $ff, $ff, $ff, $1e, $0f, $ff, $2f        ;; 09:70cd ????????
    db   $0f, $06, $4c, $ff, $ff, $ff, $1e, $10        ;; 09:70d5 ????????
    db   $ff, $2f, $10, $06, $4c, $ff, $ff, $ff        ;; 09:70dd ????????
    db   $1e, $11, $ff, $2f, $11, $06, $4c, $ff        ;; 09:70e5 ????????
    db   $ff, $ff, $1e, $12, $ff, $2f, $12, $06        ;; 09:70ed ????????
    db   $4c, $11, $02, $ff, $ff, $ff, $1e, $13        ;; 09:70f5 ????????
    db   $ff, $2f, $13, $06, $4c, $ff, $ff             ;; 09:70fd ???????

data_09_7104:
    db   $ff, $1e, $14, $ff, $2f, $14, $06, $4c        ;; 09:7104 ????????
    db   $ff, $ff, $ff, $1e, $15, $ff, $2f, $15        ;; 09:710c ????????

data_09_7114:
    db   $06, $4c, $ff, $ff, $ff, $1e, $16, $ff        ;; 09:7114 ????????
    db   $2f, $16, $06, $4c, $11, $03, $ff, $ff        ;; 09:711c ????????
    db   $ff, $1e, $17, $ff, $2f, $17, $00, $e1        ;; 09:7124 ????????
    db   $d8, $e6, $e7, $ff, $e2, $e9, $d8, $e5        ;; 09:712c ????????
    db   $10, $09, $03, $ba, $e8, $e7, $e2, $ff        ;; 09:7134 ?.......
    db   $bb, $d4, $e7, $e7, $df, $d8, $00, $4c        ;; 09:713c ......w.
    db   $11, $01, $ff, $26, $00, $ff, $26, $01        ;; 09:7144 ....w..w
    db   $06, $4c, $11, $00, $ff, $26, $02, $ff        ;; 09:714c ......w.
    db   $26, $03, $06, $4c, $11, $02, $ff, $26        ;; 09:7154 .w......
    db   $04, $ff, $26, $05, $06, $4c, $11, $03        ;; 09:715c w..w....
    db   $ff, $26, $06, $ff, $26, $07, $00, $ff        ;; 09:7164 ..w..w..
    db   $ca, $e8, $d4, $de, $d8, $ae, $ae, $29        ;; 09:716c ........
    db   $10, $ff, $bf, $dc, $e5, $d8, $ae, $ae        ;; 09:7174 ........
    db   $ae, $29, $12, $ff, $c2, $d6, $d8, $ae        ;; 09:717c ........
    db   $ae, $ae, $ae, $29, $13, $ff, $cd, $e2        ;; 09:7184 ........
    db   $e5, $e1, $d4, $d7, $e2, $29, $11, $00        ;; 09:718c ........
    db   $ff, $c6, $e8, $e7, $d8, $ae, $ae, $ae        ;; 09:7194 ........
    db   $29, $24, $ff, $bc, $e2, $e1, $d9, $e8        ;; 09:719c ........
    db   $e6, $d8, $29, $22, $ff, $bb, $df, $dc        ;; 09:71a4 ........
    db   $e1, $d7, $ae, $ae, $29, $25, $ff, $cc        ;; 09:71ac ........
    db   $df, $d8, $d8, $e3, $ae, $ae, $29, $21        ;; 09:71b4 ........
    db   $ff, $c9, $e2, $dc, $e6, $e2, $e1, $ae        ;; 09:71bc ........
    db   $29, $26, $ff, $c9, $d4, $e5, $d4, $ae        ;; 09:71c4 ........
    db   $ae, $ae, $29, $20, $ff, $bc, $e8, $e5        ;; 09:71cc ........
    db   $e6, $d8, $ae, $ae, $29, $27, $ff, $cc        ;; 09:71d4 ........
    db   $e7, $e2, $e1, $d8, $ae, $ae, $29, $23        ;; 09:71dc ........
    db   $00                                           ;; 09:71e4 .

data_09_71e5:
    db   $ff, $ff, $c7, $e2, $e7, $ff, $d8, $e1        ;; 09:71e5 ????????
    db   $e2, $e8, $da, $db, $ff, $c6, $c9, $f3        ;; 09:71ed ????????
    db   $00, $05, $09, $04, $d0, $db, $dc, $d6        ;; 09:71f5 ????????
    db   $db, $ff, $d7, $d4, $e7, $d4, $06, $ff        ;; 09:71fd ????????
    db   $ff, $ea, $dc, $df, $df, $ff, $ec, $e2        ;; 09:7205 ????????
    db   $e8, $ff, $e3, $df, $d4, $ec, $f4, $00        ;; 09:720d ????????
    db   $c7, $d8, $ea, $ff, $c0, $d4, $e0, $d8        ;; 09:7215 ........
    db   $06, $bc, $e2, $e1, $e7, $dc, $e1, $e8        ;; 09:721d ........
    db   $d8, $00, $ff, $fd, $b1, $b9, $b9, $b3        ;; 09:7225 ........
    db   $ff, $cc, $ca, $ce, $ba, $cb, $be, $ff        ;; 09:722d ........
    db   $bc, $c8, $af, $06, $c5, $dc, $d6, $d8        ;; 09:7235 ........
    db   $e1, $e6, $d8, $d7, $ff, $d5, $ec, $ff        ;; 09:723d ........
    db   $c7, $dc, $e1, $e7, $d8, $e1, $d7, $e2        ;; 09:7245 ........
    db   $00, $07, $cb, $d8, $d6, $d8, $dc, $e9        ;; 09:724d ........
    db   $d8, $d7, $ff, $1c, $1e, $3f, $af, $06        ;; 09:7255 ........
    db   $37, $01, $10, $07, $bc, $e2, $e8, $df        ;; 09:725d ...?????
    db   $d7, $e1, $ad, $e7, $ff, $d6, $d4, $e5        ;; 09:7265 ????????
    db   $e5, $ec, $af, $06, $c5, $d8, $d9, $e7        ;; 09:726d ????????
    db   $ff, $1c, $1e, $3f, $af, $06, $36, $01        ;; 09:7275 ????????
    db   $10, $d0, $e2, $ea, $f3, $0c, $0f, $00        ;; 09:727d ????????
    db   $d2, $e2, $e8, $ff, $d4, $e5, $d8, $ff        ;; 09:7285 ????????
    db   $e1, $e2, $ea, $ff, $dc, $e1, $06, $4d        ;; 09:728d ????????
    db   $af, $06, $00, $ce, $e1, $dc, $e7, $e6        ;; 09:7295 ????????
    db   $ff, $df, $d8, $d9, $e7, $ae, $30, $00        ;; 09:729d ????????
    db   $00, $ce, $e1, $dc, $e7, $e6, $ff, $df        ;; 09:72a5 ????????
    db   $d8, $d9, $e7, $ae, $b0, $00, $c9, $e5        ;; 09:72ad ????????
    db   $d8, $e6, $d8, $e1, $e7, $ff, $ff, $ff        ;; 09:72b5 ????????
    db   $ff, $c9, $d4, $e6, $e7, $ff, $ff, $ff        ;; 09:72bd ????????
    db   $ff, $ff, $ff, $ff, $bf, $e8, $e7, $e8        ;; 09:72c5 ????????
    db   $e5, $d8, $ff, $ff, $ff, $ff, $ff, $c9        ;; 09:72cd ????????
    db   $e8, $e5, $d8, $df, $d4, $e1, $d7, $ff        ;; 09:72d5 ????????
    db   $ff, $ff, $bf, $df, $e2, $d4, $e7, $df        ;; 09:72dd ????????
    db   $d4, $e1, $d7, $ff, $ff, $ce, $e3, $e3        ;; 09:72e5 ????????
    db   $d8, $e5, $ea, $e2, $e5, $df, $d7, $ff        ;; 09:72ed ????????
    db   $ce, $e1, $d7, $d8, $e5, $ea, $e2, $e5        ;; 09:72f5 ????????
    db   $df, $d7, $ff, $00                            ;; 09:72fd ????

data_09_7301:
    db   $bc, $d4, $e1, $ad, $e7, $ff, $e8, $e6        ;; 09:7301 ????????
    db   $d8, $ff, $dc, $e7, $ff, $db, $d8, $e5        ;; 09:7309 ????????
    db   $d8, $f3, $00, $cd, $e2, $ff, $4d, $f3        ;; 09:7311 ????????
    db   $00, $07, $d2, $e2, $e8, $ff, $d6, $d4        ;; 09:7319 ????????
    db   $e1, $ad, $e7, $ff, $d6, $d4, $e5, $e5        ;; 09:7321 ????????
    db   $ec, $06, $d4, $e1, $ec, $ff, $e0, $e2        ;; 09:7329 ????????
    db   $e5, $d8, $ff, $1c, $1e, $3f, $af, $36        ;; 09:7331 ????????
    db   $01, $10, $43, $10, $58, $00, $ff, $ff        ;; 09:7339 ??......
    db   $28, $00, $43, $58, $58, $01, $ff, $ff        ;; 09:7341 ........
    db   $28, $10, $05, $ff, $ff, $25, $1e, $28        ;; 09:7349 ........
    db   $01, $ff, $ff, $25, $1f, $28, $11, $43        ;; 09:7351 ........
    db   $10, $70, $02, $ff, $ff, $28, $20, $43        ;; 09:7359 ........
    db   $58, $70, $03, $ff, $ff, $28, $30, $05        ;; 09:7361 ........
    db   $ff, $ff, $25, $20, $28, $21, $ff, $ff        ;; 09:7369 ........
    db   $25, $21, $28, $31, $00, $43, $10, $88        ;; 09:7371 .....???
    db   $04, $ff, $ff, $28, $40, $06, $05, $ff        ;; 09:7379 ????????
    db   $ff, $25, $22, $28, $41, $00, $1d, $09        ;; 09:7381 ??????.w
    db   $1d, $0a, $1d, $0b, $00, $ff, $bf, $dc        ;; 09:7389 .w.ww...
    db   $da, $db, $e7, $06, $ff, $cb, $e8, $e1        ;; 09:7391 ........
    db   $06, $ff, $ba, $e8, $e7, $e2, $00, $ff        ;; 09:7399 ......w.
    db   $d0, $d8, $d4, $e3, $e2, $e1, $06, $ff        ;; 09:73a1 ........
    db   $cd, $d4, $df, $d8, $e1, $e7, $06, $ff        ;; 09:73a9 ........
    db   $c6, $d4, $da, $dc, $d6, $06, $ff, $c2        ;; 09:73b1 ........
    db   $e7, $d8, $e0, $00, $ff, $c9, $d4, $e5        ;; 09:73b9 ...w????
    db   $e5, $ec, $06, $ff, $c0, $e8, $d4, $e5        ;; 09:73c1 ????????
    db   $d7, $00, $4c, $11, $01, $ff, $ff, $ff        ;; 09:73c9 ??......
    db   $35, $00, $06, $4c, $ff, $ff, $ff, $35        ;; 09:73d1 ........
    db   $01, $06, $4c, $ff, $ff, $ff, $35, $02        ;; 09:73d9 ........
    db   $06, $4c, $ff, $ff, $ff, $35, $03, $06        ;; 09:73e1 ........
    db   $4c, $11, $00, $ff, $ff, $ff, $35, $04        ;; 09:73e9 ..??????
    db   $06, $4c, $ff, $ff, $ff, $35, $05, $06        ;; 09:73f1 ????????
    db   $4c, $ff, $ff, $ff, $35, $06, $06, $4c        ;; 09:73f9 ????????
    db   $ff, $ff, $ff, $35, $07, $06, $4c, $ff        ;; 09:7401 ????????
    db   $ff, $ff, $35, $08, $06, $4c, $ff, $ff        ;; 09:7409 ????????
    db   $ff, $35, $09, $06, $4c, $ff, $ff, $ff        ;; 09:7411 ????????
    db   $35, $0a, $06, $4c, $ff, $ff, $ff, $35        ;; 09:7419 ????????
    db   $0b, $06, $4c, $ff, $ff, $ff, $35, $0c        ;; 09:7421 ????????
    db   $06, $4c, $ff, $ff, $ff, $35, $0d, $06        ;; 09:7429 ????????
    db   $4c, $ff, $ff, $ff, $35, $0e, $06, $4c        ;; 09:7431 ????????
    db   $ff, $ff, $ff, $35, $0f, $06, $4c, $ff        ;; 09:7439 ????????
    db   $ff, $ff, $35, $10, $06, $4c, $ff, $ff        ;; 09:7441 ????????
    db   $ff, $35, $11, $06, $4c, $ff, $ff, $ff        ;; 09:7449 ????????
    db   $35, $12, $06, $4c, $11, $02, $ff, $ff        ;; 09:7451 ????????
    db   $ff, $35, $13, $06, $4c, $ff, $ff, $ff        ;; 09:7459 ????????
    db   $35, $14, $06, $4c, $ff, $ff, $ff, $35        ;; 09:7461 ????????
    db   $15, $06, $4c, $ff, $ff, $ff, $35, $16        ;; 09:7469 ????????
    db   $06, $4c, $11, $03, $ff, $ff, $ff, $35        ;; 09:7471 ????????
    db   $17, $00, $ff, $d2, $d8, $e6, $ff, $c7        ;; 09:7479 ????????
    db   $e2, $00, $ff, $1e, $20, $2f, $20, $ff        ;; 09:7481 ????????
    db   $1e, $21, $2f, $21, $00, $ff, $26, $00        ;; 09:7489 ?????..w
    db   $ff, $26, $01, $ff, $26, $02, $ff, $26        ;; 09:7491 ..w..w..
    db   $03, $ff, $26, $04, $ff, $26, $05, $ff        ;; 09:7499 w..w..w.
    db   $26, $06, $ff, $26, $07, $00, $ba, $e8        ;; 09:74a1 .w..w.??
    db   $e7, $e2, $cb, $e8, $e1, $ff, $d0, $d8        ;; 09:74a9 ??????..
    db   $d4, $e3, $cd, $d4, $df, $d8, $c2, $e7        ;; 09:74b1 ..??????
    db   $d8, $e0, $c9, $d4, $e5, $e5, $c0, $e8        ;; 09:74b9 ????????
    db   $d4, $e5, $00, $be, $d4, $e7, $f4, $06        ;; 09:74c1 ????????
    db   $ff, $d2, $d8, $e6, $ff, $c7, $e2, $00        ;; 09:74c9 ????????
    db   $c2, $e1, $e6, $e7, $d4, $df, $df, $f4        ;; 09:74d1 ????????
    db   $06, $ff, $d2, $d8, $e6, $ff, $c7, $e2        ;; 09:74d9 ????????
    db   $00, $1c, $1f, $ff, $ff, $dc, $e6, $ff        ;; 09:74e1 ????????
    db   $da, $e8, $d4, $e5, $d7, $d8, $d7, $af        ;; 09:74e9 ????????
    db   $00, $ba, $e8, $e7, $e2, $ff, $cc, $d8        ;; 09:74f1 ????????
    db   $e7, $00, $bf, $dc, $da, $db, $e7, $ff        ;; 09:74f9 ????????
    db   $d4, $da, $d4, $dc, $e1, $f4, $ff, $d2        ;; 09:7501 ????????
    db   $d8, $e6, $06, $ff, $ff, $ff, $ff, $ff        ;; 09:7509 ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 09:7511 ????????
    db   $c7, $e2, $00, $ff, $c1, $e2, $ea, $d7        ;; 09:7519 ????????
    db   $ec, $f3, $00, $ff, $33, $01, $f1, $e1        ;; 09:7521 ????????
    db   $dc, $da, $db, $e7, $af, $00, $09, $04        ;; 09:7529 ????????
    db   $cd, $db, $d4, $e1, $de, $ff, $ec, $e2        ;; 09:7531 ????????
    db   $e8, $f3, $00, $ff, $c7, $e2, $e7, $ff        ;; 09:7539 ????????
    db   $d8, $e1, $e2, $e8, $da, $db, $ff, $c0        ;; 09:7541 ????????
    db   $c9, $f3, $00, $ff, $cc, $e7, $d4, $ec        ;; 09:7549 ????????
    db   $ff, $be, $eb, $dc, $e7, $00, $ff, $be        ;; 09:7551 ????????
    db   $eb, $dc, $e7, $ff, $bb, $e8, $ec, $ff        ;; 09:7559 ????????
    db   $cc, $d8, $df, $df, $00, $ff, $be, $eb        ;; 09:7561 ????????
    db   $dc, $e7, $ff, $bb, $e8, $ec, $ff, $cc        ;; 09:7569 ????????
    db   $d8, $df, $df, $ff, $c6, $dc, $eb, $00        ;; 09:7571 ????????
    db   $ff, $c6, $d4, $ec, $ff, $c2, $ff, $db        ;; 09:7579 ????????
    db   $d8, $df, $e3, $ff, $ec, $e2, $e8, $f4        ;; 09:7581 ????????
    db   $00, $ff, $c8, $de, $d4, $ec, $f3, $ff        ;; 09:7589 ????????
    db   $d0, $db, $dc, $d6, $db, $ff, $e2, $e1        ;; 09:7591 ????????
    db   $d8, $f4, $00, $ff, $d2, $e2, $e8, $e5        ;; 09:7599 ????????
    db   $ff, $d5, $d4, $da, $ff, $dc, $e6, $ff        ;; 09:75a1 ????????
    db   $d9, $e8, $df, $df, $f3, $00, $ff, $d0        ;; 09:75a9 ????????
    db   $db, $dc, $d6, $db, $ff, $e2, $e1, $d8        ;; 09:75b1 ????????
    db   $f4, $00, $ff, $33, $01, $f3, $00, $ff        ;; 09:75b9 ????????
    db   $1c, $1e, $3f, $f4, $00, $ff, $d2, $d8        ;; 09:75c1 ????????
    db   $e6, $ff, $c7, $e2, $00, $ff, $c7, $e2        ;; 09:75c9 ????????
    db   $ff, $e7, $db, $d4, $e1, $de, $e6, $f3        ;; 09:75d1 ????????
    db   $00, $ff, $1c, $1e, $3f, $ff, $ea, $dc        ;; 09:75d9 ????????
    db   $df, $df, $ff, $d5, $d8, $00, $ff, $8a        ;; 09:75e1 ????????
    db   $c5, $dc, $da, $db, $e7, $ff, $d4, $e1        ;; 09:75e9 ????????
    db   $d7, $ff, $8a, $bd, $d4, $e5, $de, $00        ;; 09:75f1 ????????
    db   $ff, $ea, $dc, $df, $df, $ff, $e0, $d4        ;; 09:75f9 ????????
    db   $de, $d8, $ae, $00, $1c, $30, $02, $ff        ;; 09:7601 ????????
    db   $8a, $c5, $dc, $da, $db, $e7, $ff, $d4        ;; 09:7609 ????????
    db   $e1, $d7, $00, $1c, $30, $03, $ff, $8a        ;; 09:7611 ????????
    db   $bd, $d4, $e5, $de, $af, $ff, $c8, $de        ;; 09:7619 ????????
    db   $d4, $ec, $f4, $00, $c7, $d8, $d8, $d7        ;; 09:7621 ????????
    db   $ff, $e0, $e2, $e5, $d8, $f3, $00, $ff        ;; 09:7629 ????????
    db   $1c, $1e, $3a, $00, $ff, $d0, $db, $dc        ;; 09:7631 ????????
    db   $d6, $db, $ff, $d7, $e2, $ff, $ec, $e2        ;; 09:7639 ????????
    db   $e8, $00, $ff, $ea, $d4, $e1, $e7, $ff        ;; 09:7641 ????????
    db   $e7, $e2, $ff, $e0, $dc, $eb, $f4, $00        ;; 09:7649 ????????
    db   $09, $07, $00, $ff, $cd, $db, $d4, $e7        ;; 09:7651 ????????
    db   $ff, $d6, $e2, $e0, $d5, $dc, $e1, $d4        ;; 09:7659 ????????
    db   $e7, $dc, $e2, $e1, $00, $ff, $dc, $e6        ;; 09:7661 ????????
    db   $ff, $e1, $e2, $ff, $da, $e2, $e2, $d7        ;; 09:7669 ????????
    db   $af, $00, $ff, $1c, $1e, $3a, $f4, $00        ;; 09:7671 ????????
    db   $2f, $30, $06, $2f, $31, $06, $2f, $32        ;; 09:7679 ????????
    db   $06, $2f, $33, $00, $43, $10, $58, $00        ;; 09:7681 ????????
    db   $ff, $ff, $25, $14, $43, $58, $58, $01        ;; 09:7689 ????????
    db   $ff, $ff, $25, $15, $05, $ff, $ff, $25        ;; 09:7691 ????????
    db   $32, $ff, $ff, $25, $33, $43, $10, $70        ;; 09:7699 ????????
    db   $02, $ff, $ff, $25, $16, $43, $58, $70        ;; 09:76a1 ????????
    db   $03, $ff, $ff, $25, $17, $05, $ff, $ff        ;; 09:76a9 ????????
    db   $25, $34, $ff, $ff, $25, $35, $43, $10        ;; 09:76b1 ????????
    db   $88, $04, $ff, $ff, $25, $18, $06, $05        ;; 09:76b9 ????????
    db   $ff, $ff, $25, $36, $00, $ff, $33, $00        ;; 09:76c1 ????????
    db   $00, $43, $10, $58, $00, $ff, $ff, $25        ;; 09:76c9 ????????
    db   $14, $43, $58, $58, $01, $ff, $ff, $25        ;; 09:76d1 ????????
    db   $15, $05, $ff, $ff, $25, $32, $ff, $ff        ;; 09:76d9 ????????
    db   $25, $33, $43, $10, $70, $02, $ff, $ff        ;; 09:76e1 ????????
    db   $25, $16, $43, $58, $70, $03, $ff, $ff        ;; 09:76e9 ????????
    db   $25, $17, $05, $ff, $ff, $25, $34, $ff        ;; 09:76f1 ????????
    db   $ff, $25, $35, $00, $4c, $11, $01, $ff        ;; 09:76f9 ????????
    db   $ff, $1e, $30, $33, $10, $06, $4c, $11        ;; 09:7701 ????????
    db   $02, $ff, $ff, $1e, $31, $33, $11, $06        ;; 09:7709 ????????
    db   $4c, $ff, $ff, $1e, $32, $33, $12, $06        ;; 09:7711 ????????
    db   $4c, $ff, $ff, $1e, $33, $33, $13, $06        ;; 09:7719 ????????
    db   $4c, $11, $00, $ff, $ff, $1e, $34, $33        ;; 09:7721 ????????
    db   $14, $06, $4c, $11, $03, $ff, $ff, $1e        ;; 09:7729 ????????
    db   $35, $33, $15, $00, $33, $00, $00, $43        ;; 09:7731 ????????
    db   $50, $88, $04, $43, $10, $88, $00, $43        ;; 09:7739 ????????
    db   $20, $88, $01, $43, $30, $88, $02, $43        ;; 09:7741 ????????
    db   $40, $88, $03, $00, $09, $03, $1e, $36        ;; 09:7749 ????????
    db   $06, $09, $03, $1e, $37, $06, $09, $03        ;; 09:7751 ????????
    db   $1e, $38, $06, $09, $03, $1e, $39, $00        ;; 09:7759 ????????
    db   $bf, $dc, $e5, $e6, $e7, $06, $06, $cc        ;; 09:7761 ????????
    db   $d8, $d6, $e2, $e1, $d7, $00, $ff, $8a        ;; 09:7769 ????????
    db   $be, $d4, $e5, $e7, $db, $06, $ff, $8a        ;; 09:7771 ????????
    db   $d0, $d4, $e7, $d8, $e5, $06, $ff, $8a        ;; 09:7779 ????????
    db   $bf, $dc, $e5, $d8, $06, $ff, $8a, $ba        ;; 09:7781 ????????
    db   $dc, $e5, $00, $ff, $d0, $dc, $df, $df        ;; 09:7789 ????????
    db   $ff, $e0, $d4, $de, $d8, $ae, $00, $ff        ;; 09:7791 ????????
    db   $ff, $cd, $d4, $df, $e2, $e1, $ff, $bc        ;; 09:7799 ????????
    db   $e2, $d6, $de, $e3, $dc, $e7, $06, $09        ;; 09:77a1 ????????
    db   $03, $ef, $c7, $e2, $ea, $ff, $ea, $db        ;; 09:77a9 ????????
    db   $d4, $e7, $f4, $ee, $00, $ff, $bd, $d8        ;; 09:77b1 ????????
    db   $e3, $d4, $e5, $e7, $ff, $be, $e1, $da        ;; 09:77b9 ????????
    db   $dc, $e1, $d8, $ff, $d0, $d4, $e5, $e3        ;; 09:77c1 ????????
    db   $06, $ff, $d0, $d8, $d4, $e3, $e2, $e1        ;; 09:77c9 ????????
    db   $ff, $c8, $e3, $e7, $dc, $e2, $e1, $00        ;; 09:77d1 ????????
    db   $09, $06, $be, $c7, $c0, $c2, $c7, $be        ;; 09:77d9 ????????
    db   $00, $ef, $c7, $e2, $ff, $c9, $e5, $e2        ;; 09:77e1 ????????
    db   $e3, $d8, $e5, $ff, $ce, $e1, $dc, $e7        ;; 09:77e9 ????????
    db   $e6, $ee, $00, $09, $04, $ef, $c1, $e2        ;; 09:77f1 ????????
    db   $ea, $ff, $d9, $d4, $e6, $e7, $f4, $ee        ;; 09:77f9 ????????
    db   $00, $ff, $1e, $46, $ff, $1e, $47, $ff        ;; 09:7801 ????????
    db   $1e, $48, $00, $09, $07, $d0, $ba, $cb        ;; 09:7809 ????????
    db   $c9, $00, $09, $03, $ef, $ce, $e6, $d8        ;; 09:7811 ????????
    db   $ff, $ea, $db, $dc, $d6, $db, $f4, $ee        ;; 09:7819 ????????
    db   $00, $ff, $1e, $49, $ff, $1e, $4a, $ff        ;; 09:7821 ????????
    db   $1e, $4b, $00, $cc, $d8, $e7, $ff, $d6        ;; 09:7829 ????????
    db   $e2, $e0, $e3, $df, $d8, $e7, $d8, $d7        ;; 09:7831 ????????
    db   $f3, $00, $09, $06, $d0, $be, $ba, $c9        ;; 09:7839 ????????
    db   $c8, $c7, $00, $ff, $ff, $ef, $cc, $d8        ;; 09:7841 ????????
    db   $e7, $ff, $e7, $e2, $ff, $ea, $db, $dc        ;; 09:7849 ????????
    db   $d6, $db, $f4, $ee, $00, $ff, $1e, $40        ;; 09:7851 ????????
    db   $ff, $1e, $41, $ff, $1e, $42, $ff, $1e        ;; 09:7859 ????????
    db   $43, $ff, $1e, $4c, $00, $09, $06, $c8        ;; 09:7861 ????????
    db   $c9, $cd, $c2, $c8, $c7, $00, $ef, $cd        ;; 09:7869 ????????
    db   $db, $d8, $e6, $d8, $ff, $d4, $e5, $d8        ;; 09:7871 ????????
    db   $ff, $e8, $e6, $d4, $d5, $df, $d8, $fe        ;; 09:7879 ????????
    db   $00, $ff, $1e, $44, $ff, $1e, $45, $00        ;; 09:7881 ????????
    db   $ba, $e7, $e7, $d4, $d6, $db, $d8, $d7        ;; 09:7889 ????????
    db   $ff, $1c, $1e, $3f, $06, $e7, $e2, $ff        ;; 09:7891 ????????
    db   $cd, $d4, $df, $e2, $e1, $af, $00, $ba        ;; 09:7899 ???????.
    db   $bb, $bc, $bd, $be, $bf, $c0, $c1, $c2        ;; 09:78a1 ........
    db   $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca        ;; 09:78a9 ........
    db   $cb, $cc, $cd, $ce, $cf, $d0, $d1, $d2        ;; 09:78b1 ........
    db   $d3, $ff, $d4, $d5, $d6, $d7, $d8, $d9        ;; 09:78b9 ........
    db   $da, $db, $dc, $dd, $de, $df, $e0, $e1        ;; 09:78c1 ........
    db   $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9        ;; 09:78c9 ........
    db   $ea, $eb, $ec, $ed, $af, $00, $c1, $d8        ;; 09:78d1 .....?..
    db   $e5, $e2, $ff, $ff, $ff, $c1, $d8, $e5        ;; 09:78d9 ........
    db   $e2, $dc, $e1, $d8, $bb, $e2, $ec, $ff        ;; 09:78e1 ........
    db   $ff, $ff, $ff, $c0, $dc, $e5, $df, $ff        ;; 09:78e9 ........
    db   $ff, $ff, $43, $10, $1a, $04, $00, $1f        ;; 09:78f1 ......w.
    db   $20, $ff, $1f, $04, $00, $c4, $79, $c6        ;; 09:78f9 .....???
    db   $79, $d3, $79, $e3, $79, $f3, $79, $05        ;; 09:7901 ????????
    db   $7a, $16, $7a, $1f, $7a, $29, $7a, $35        ;; 09:7909 ?????...
    db   $7a, $42, $7a, $4d, $7a, $5d, $7a, $5e        ;; 09:7911 .???????
    db   $7a, $63, $7a, $74, $7a, $81, $7a, $86        ;; 09:7919 ????????
    db   $7a, $94, $7a, $a3, $7a, $a8, $7a, $b2        ;; 09:7921 ????????
    db   $7a, $b6, $7a, $ba, $7a, $c4, $7a, $ce        ;; 09:7929 ????????
    db   $7a, $d8, $7a, $e1, $7a, $e7, $7a, $ec        ;; 09:7931 ???????.
    db   $7a, $f5, $7a, $fc, $7a, $0a, $7b, $15        ;; 09:7939 .???????
    db   $7b, $21, $7b, $2f, $7b, $38, $7b, $44        ;; 09:7941 ????????
    db   $7b, $4e, $7b, $5d, $7b, $67, $7b, $71        ;; 09:7949 ????????
    db   $7b, $82, $7b, $8e, $7b, $a2, $7b, $ae        ;; 09:7951 ????????
    db   $7b, $b5, $7b, $bd, $7b, $c7, $7b, $d2        ;; 09:7959 ????????
    db   $7b, $e6, $7b, $f1, $7b, $fc, $7b, $0e        ;; 09:7961 ?????...
    db   $7c, $13, $7c, $25, $7c, $2f, $7c, $36        ;; 09:7969 .???????
    db   $7c, $49, $7c, $4f, $7c, $5a, $7c, $65        ;; 09:7971 ?..??..?
    db   $7c, $6f, $7c, $7a, $7c, $8d, $7c, $94        ;; 09:7979 ????????
    db   $7c, $9f, $7c, $b2, $7c, $b8, $7c, $bf        ;; 09:7981 ???..???
    db   $7c, $c4, $7c, $c9, $7c, $d1, $7c, $d8        ;; 09:7989 ?..?????
    db   $7c, $df, $7c, $f2, $7c, $08, $7d, $1a        ;; 09:7991 ????????
    db   $7d, $2e, $7d, $3c, $7d, $50, $7d, $57        ;; 09:7999 ?..?????
    db   $7d, $5c, $7d, $6d, $7d, $7f, $7d, $8e        ;; 09:79a1 ????????
    db   $7d, $9f, $7d, $aa, $7d, $b4, $7d, $c0        ;; 09:79a9 ????????
    db   $7d, $ca, $7d, $db, $7d, $ee, $7d, $fe        ;; 09:79b1 ????????
    db   $7d, $26, $7e, $3e, $7e, $66, $7e, $8b        ;; 09:79b9 ????????
    db   $7e, $92, $7e, $06, $00, $cc, $e7, $e5        ;; 09:79c1 ????????
    db   $dc, $de, $50, $d9, $dc, $e5, $42, $f3        ;; 09:79c9 ????????
    db   $06, $00, $ce, $e1, $d8, $eb, $e3, $d8        ;; 09:79d1 ????????
    db   $d6, $e7, $44, $6f, $e7, $74, $de, $f3        ;; 09:79d9 ????????
    db   $06, $00, $7a, $4e, $bd, $d8, $e7, $d8        ;; 09:79e1 ????????
    db   $d6, $e7, $44, $6c, $70, $d8, $e0, $ec        ;; 09:79e9 ????????
    db   $67, $00, $7a, $ff, $6f, $e7, $74, $de        ;; 09:79f1 ????????
    db   $e6, $06, $ea, $75, $db, $ff, $1c, $1e        ;; 09:79f9 ????????
    db   $3f, $f3, $06, $00, $7d, $50, $70, $d8        ;; 09:7a01 ????????
    db   $e0, $62, $d5, $e2, $5d, $d7, $87, $06        ;; 09:7a09 ????????
    db   $68, $7a, $f3, $06, $00, $cb, $56, $ff        ;; 09:7a11 ????????
    db   $d4, $ea, $d4, $ec, $73, $10, $bc, $56        ;; 09:7a19 ????????
    db   $ad, $57, $e5, $e8, $e1, $f3, $06, $00        ;; 09:7a21 ????????
    db   $30, $00, $ff, $be, $d1, $c9, $ff, $e8        ;; 09:7a29 .w......
    db   $e3, $f3, $06, $00, $cb, $d8, $d6, $d8        ;; 09:7a31 ........
    db   $dc, $e9, $44, $30, $00, $c0, $c9, $73        ;; 09:7a39 ....w...
    db   $00, $cb, $d8, $d6, $d8, $dc, $e9, $44        ;; 09:7a41 .???????
    db   $31, $00, $73, $00, $1c, $1f, $ff, $79        ;; 09:7a49 ????????
    db   $c1, $c9, $06, $65, $d6, $e2, $e9, $52        ;; 09:7a51 ????????
    db   $87, $f3, $06, $00, $00, $1c, $1f, $ff        ;; 09:7a59 ????????
    db   $06, $00, $1c, $1f, $ff, $ff, $e7, $e8        ;; 09:7a61 ????????
    db   $e5, $e1, $44, $55, $6e, $06, $1c, $22        ;; 09:7a69 ????????
    db   $ff, $ff, $00, $e7, $e8, $e5, $e1, $44        ;; 09:7a71 ????????
    db   $55, $6e, $06, $1c, $22, $ff, $73, $00        ;; 09:7a79 ????????
    db   $1c, $1d, $ff, $73, $00, $1c, $1f, $ff        ;; 09:7a81 ????????
    db   $79, $1a, $e9, $d8, $df, $ff, $e8, $e3        ;; 09:7a89 ????????
    db   $f3, $06, $00, $1c, $1f, $ff, $ff, $e8        ;; 09:7a91 ????????
    db   $7b, $d7, $06, $1c, $1e, $80, $ff, $6e        ;; 09:7a99 ????????
    db   $06, $00, $1c, $1f, $80, $73, $00, $1c        ;; 09:7aa1 ????????
    db   $1f, $80, $79, $e3, $5d, $e7, $ec, $73        ;; 09:7aa9 ????????
    db   $00, $1c, $1f, $ff, $00, $1c, $1f, $80        ;; 09:7ab1 ????????
    db   $00, $ad, $e6, $06, $ba, $e7, $e7, $74        ;; 09:7ab9 ????????
    db   $de, $ff, $00, $ad, $e6, $06, $bd, $d8        ;; 09:7ac1 ????????
    db   $d9, $70, $7b, $ff, $00, $ad, $e6, $06        ;; 09:7ac9 ????????
    db   $ba, $da, $dc, $df, $75, $62, $00, $ad        ;; 09:7ad1 ????????
    db   $e6, $06, $c6, $41, $dc, $d6, $ff, $00        ;; 09:7ad9 ????????
    db   $d7, $7e, $e1, $f3, $06, $00, $e8, $e3        ;; 09:7ae1 ????????
    db   $f3, $06, $00, $1c, $1f, $ff, $ff, $d9        ;; 09:7ae9 ???.....
    db   $d8, $5e, $73, $00, $65, $e9, $dc, $e9        ;; 09:7af1 ....????
    db   $87, $73, $00, $04, $6a, $06, $e7, $e8        ;; 09:7af9 ????????
    db   $e5, $e1, $44, $58, $42, $59, $d8, $73        ;; 09:7b01 ????????
    db   $00, $04, $6a, $06, $e6, $e2, $d9, $e7        ;; 09:7b09 ????????
    db   $70, $87, $73, $00, $ff, $df, $e2, $42        ;; 09:7b11 ????????
    db   $06, $e9, $e2, $dc, $d6, $d8, $73, $00        ;; 09:7b19 ????????
    db   $ff, $65, $da, $d4, $55, $87, $06, $e9        ;; 09:7b21 ????????
    db   $e2, $dc, $d6, $d8, $73, $00, $ff, $df        ;; 09:7b29 ????????
    db   $e2, $42, $06, $e6, $80, $73, $00, $ff        ;; 09:7b31 ????????
    db   $65, $d6, $e2, $e9, $52, $87, $06, $e6        ;; 09:7b39 ????????
    db   $80, $73, $00, $04, $6a, $06, $e3, $e2        ;; 09:7b41 ????????
    db   $6b, $59, $87, $73, $00, $04, $6a, $06        ;; 09:7b49 ????????
    db   $e1, $d8, $e8, $e7, $e5, $d4, $df, $dc        ;; 09:7b51 ????????
    db   $ed, $87, $73, $00, $04, $6a, $06, $d6        ;; 09:7b59 ????????
    db   $e8, $e5, $7b, $d7, $73, $00, $ff, $6b        ;; 09:7b61 ????????
    db   $06, $d6, $e8, $e5, $7b, $d7, $73, $00        ;; 09:7b69 ????????
    db   $04, $6a, $06, $65, $1a, $6a, $44, $d9        ;; 09:7b71 ????????
    db   $e5, $76, $06, $d6, $e8, $e5, $7b, $73        ;; 09:7b79 ????????
    db   $00, $04, $6a, $06, $e3, $5d, $d4, $df        ;; 09:7b81 ????????
    db   $ec, $ed, $87, $73, $00, $04, $6a, $06        ;; 09:7b89 ????????
    db   $65, $1a, $6a, $44, $d9, $e5, $76, $06        ;; 09:7b91 ????????
    db   $e3, $5d, $d4, $df, $ec, $e6, $6b, $73        ;; 09:7b99 ????????
    db   $00, $ff, $6b, $06, $e3, $5d, $d4, $df        ;; 09:7ba1 ????????
    db   $dc, $ed, $87, $73, $00, $ff, $e6, $1a        ;; 09:7ba9 ????????
    db   $e3, $e7, $73, $00, $04, $e2, $de, $50        ;; 09:7bb1 ????????
    db   $e8, $e3, $73, $00, $ff, $6b, $06, $e6        ;; 09:7bb9 ????????
    db   $1a, $d8, $e3, $72, $73, $00, $04, $6a        ;; 09:7bc1 ????????
    db   $06, $d6, $59, $d9, $e8, $7b, $d7, $73        ;; 09:7bc9 ????????
    db   $00, $ff, $65, $da, $d4, $55, $87, $06        ;; 09:7bd1 ????????
    db   $d6, $59, $e6, $d6, $dc, $53, $e6, $e1        ;; 09:7bd9 ????????
    db   $d8, $e6, $e6, $73, $00, $ff, $6b, $06        ;; 09:7be1 ????????
    db   $d6, $59, $d9, $e8, $7b, $d7, $73, $00        ;; 09:7be9 ????????
    db   $1c, $1f, $ff, $ff, $e6, $e0, $6a, $db        ;; 09:7bf1 ????????
    db   $87, $06, $00, $1c, $1f, $ff, $ff, $e8        ;; 09:7bf9 ???.....
    db   $7b, $d7, $06, $1c, $1e, $80, $ff, $41        ;; 09:7c01 ........
    db   $d4, $55, $42, $06, $00, $1c, $1f, $80        ;; 09:7c09 ........
    db   $73, $00, $1c, $1f, $80, $73, $c2, $57        ;; 09:7c11 ..??????
    db   $db, $75, $ff, $30, $00, $ff, $e7, $dc        ;; 09:7c19 ????????
    db   $02, $e6, $73, $00, $1c, $1f, $80, $ff        ;; 09:7c21 ????????
    db   $da, $e5, $53, $e3, $73, $00, $68, $70        ;; 09:7c29 ????????
    db   $d8, $e0, $ec, $73, $00, $1c, $1f, $ff        ;; 09:7c31 ????????
    db   $ff, $d7, $dc, $d7, $e1, $ad, $e7, $06        ;; 09:7c39 ????????
    db   $d7, $5c, $56, $ec, $63, $72, $73, $00        ;; 09:7c41 ????????
    db   $1c, $1f, $80, $ff, $18, $00, $ea, $d8        ;; 09:7c49 ......??
    db   $d4, $de, $06, $41, $d4, $55, $42, $ff        ;; 09:7c51 ????????
    db   $00, $42, $e5, $59, $da, $06, $41, $d4        ;; 09:7c59 ?.......
    db   $55, $42, $ff, $00, $c1, $75, $ff, $f6        ;; 09:7c61 ....????
    db   $ff, $30, $00, $f3, $06, $00, $ba, $ff        ;; 09:7c69 ????????
    db   $e0, $80, $62, $d5, $df, $7e, $f3, $06        ;; 09:7c71 ????????
    db   $00, $1c, $1f, $ff, $ff, $d6, $56, $e1        ;; 09:7c79 ????????
    db   $e2, $e7, $06, $e8, $7b, $ff, $e0, $41        ;; 09:7c81 ????????
    db   $dc, $d6, $73, $00, $c6, $6b, $7b, $d7        ;; 09:7c89 ????????
    db   $f3, $06, $00, $bd, $d8, $d9, $d8, $6f        ;; 09:7c91 ????????
    db   $44, $1c, $1f, $80, $73, $00, $1c, $1f        ;; 09:7c99 ????????
    db   $00, $79, $e3, $5d, $e7, $ec, $06, $ea        ;; 09:7ca1 ????????
    db   $6a, $ff, $d5, $d8, $6f, $ae, $ae, $06        ;; 09:7ca9 ????????
    db   $00, $06, $d0, $59, $f3, $06, $10, $ca        ;; 09:7cb1 ?......?
    db   $e8, $d4, $de, $d8, $73, $00, $c2, $d6        ;; 09:7cb9 ????????
    db   $d8, $73, $00, $bf, $dc, $65, $73, $00        ;; 09:7cc1 ???.....
    db   $cd, $5b, $e1, $d4, $d7, $e2, $73, $00        ;; 09:7cc9 ????????
    db   $7d, $e8, $e1, $d7, $52, $73, $00, $bd        ;; 09:7cd1 ????????
    db   $d4, $e0, $41, $d8, $73, $00, $bc, $56        ;; 09:7cd9 ????????
    db   $ad, $57, $d4, $d5, $e6, $5b, $d5, $ff        ;; 09:7ce1 ????????
    db   $c1, $c9, $06, $78, $1c, $1f, $80, $73        ;; 09:7ce9 ????????
    db   $00, $1c, $1f, $80, $ff, $01, $54, $e0        ;; 09:7cf1 ????????
    db   $5b, $46, $e3, $7e, $52, $ff, $58, $d4        ;; 09:7cf9 ????????
    db   $d5, $e6, $5b, $d5, $f3, $06, $00, $1c        ;; 09:7d01 ????????
    db   $1f, $80, $ff, $65, $e3, $e8, $df, $7b        ;; 09:7d09 ????????
    db   $d7, $06, $68, $6f, $e7, $74, $de, $73        ;; 09:7d11 ????????
    db   $00, $1c, $1f, $80, $ff, $d6, $53, $e1        ;; 09:7d19 ????????
    db   $e7, $52, $87, $06, $ea, $75, $db, $ff        ;; 09:7d21 ????????
    db   $1c, $1e, $50, $73, $00, $1c, $1f, $ff        ;; 09:7d29 ?????...
    db   $ff, $6b, $06, $d7, $d8, $d9, $70, $d7        ;; 09:7d31 ........
    db   $72, $73, $00, $1c, $1f, $ff, $ff, $6b        ;; 09:7d39 ...?????
    db   $06, $ea, $d4, $75, $72, $ff, $1b, $63        ;; 09:7d41 ????????
    db   $46, $6f, $e7, $74, $de, $73, $00, $68        ;; 09:7d49 ????????
    db   $e3, $5d, $e7, $ec, $73, $00, $1c, $1f        ;; 09:7d51 ????????
    db   $80, $73, $00, $1c, $1f, $ff, $ff, $7b        ;; 09:7d59 ????????
    db   $df, $d9, $dc, $eb, $87, $06, $30, $00        ;; 09:7d61 ????????
    db   $c1, $c9, $73, $00, $1c, $1f, $ff, $ff        ;; 09:7d69 ????????
    db   $6b, $06, $7b, $df, $d9, $f2, $65, $e3        ;; 09:7d71 ????????
    db   $d4, $dc, $e5, $72, $73, $00, $1c, $1f        ;; 09:7d79 ????????
    db   $ff, $06, $e0, $e8, $df, $e7, $dc, $e3        ;; 09:7d81 ????????
    db   $df, $dc, $87, $73, $00, $1c, $1f, $ff        ;; 09:7d89 ????????
    db   $ff, $18, $e7, $e5, $ec, $72, $06, $58        ;; 09:7d91 ????????
    db   $42, $d8, $d4, $df, $73, $00, $30, $00        ;; 09:7d99 ????????
    db   $c0, $c9, $ff, $42, $e2, $1a, $e1, $73        ;; 09:7da1 ????????
    db   $00, $cc, $6e, $1a, $ff, $30, $00, $c0        ;; 09:7da9 ????????
    db   $c9, $73, $00, $c7, $e2, $63, $72, $ff        ;; 09:7db1 ????????
    db   $01, $e3, $e3, $70, $87, $73, $00, $c7        ;; 09:7db9 ????????
    db   $5c, $d8, $d9, $d9, $d8, $d6, $e7, $73        ;; 09:7dc1 ????????
    db   $00, $bf, $53, $e1, $5a, $1c, $22, $80        ;; 09:7dc9 ????????
    db   $06, $1c, $1f, $80, $79, $02, $6f, $f3        ;; 09:7dd1 ????????
    db   $06, $00, $bf, $53, $e1, $5a, $1c, $22        ;; 09:7dd9 ????????
    db   $80, $06, $1c, $1f, $80, $79, $e3, $5d        ;; 09:7de1 ????????
    db   $e7, $e6, $f3, $06, $00, $64, $d0, $50        ;; 09:7de9 ????????
    db   $01, $0f, $58, $ea, $d4, $de, $7c, $40        ;; 09:7df1 ????????
    db   $ff, $e8, $e3, $83, $00, $07, $cc, $e2        ;; 09:7df9 ????????
    db   $df, $4e, $c6, $5b, $d8, $f3, $ff, $77        ;; 09:7e01 ????????
    db   $e0, $e8, $42, $4f, $c0, $d8, $57, $e5        ;; 09:7e09 ????????
    db   $dc, $5a, $19, $db, $dc, $e0, $4f, $d5        ;; 09:7e11 ????????
    db   $d8, $d9, $5b, $50, $db, $50, $ea, $d4        ;; 09:7e19 ????????
    db   $de, $d8, $e6, $83, $00, $07, $cc, $e2        ;; 09:7e21 ????????
    db   $df, $4e, $c1, $e8, $e5, $e5, $ec, $f3        ;; 09:7e29 ????????
    db   $4f, $c1, $d8, $79, $ea, $d4, $de, $72        ;; 09:7e31 ????????
    db   $ff, $e8, $e3, $83, $00, $07, $d1, $41        ;; 09:7e39 ????????
    db   $5b, $4e, $c7, $7e, $ff, $63, $6f, $ff        ;; 09:7e41 ????????
    db   $cc, $e2, $df, $ff, $6b, $4f, $da, $59        ;; 09:7e49 ????????
    db   $d8, $60, $49, $ea, $dc, $5e, $4f, $e5        ;; 09:7e51 ????????
    db   $e8, $1a, $ff, $63, $6b, $4f, $ea, $5b        ;; 09:7e59 ????????
    db   $df, $d7, $f3, $83, $00, $07, $ef, $c8        ;; 09:7e61 ????????
    db   $db, $60, $e1, $e2, $ae, $ae, $ae, $67        ;; 09:7e69 ????????
    db   $13, $33, $ef, $d0, $01, $e7, $79, $63        ;; 09:7e71 ????????
    db   $6f, $4f, $e1, $e2, $6b, $d8, $f4, $06        ;; 09:7e79 ????????
    db   $0c, $3c, $ff, $c2, $e7, $79, $68, $7a        ;; 09:7e81 ????????
    db   $83, $00, $68, $e3, $5d, $e7, $ec, $73        ;; 09:7e89 ????????
    db   $00, $68, $e3, $5d, $e7, $ec, $73             ;; 09:7e91 ???????
