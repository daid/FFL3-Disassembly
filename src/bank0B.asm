;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank0b", ROMX[$4000], BANK[$0b]
    ld   A, [wCC5C]                                    ;; 0b:4000 $fa $5c $cc
    swap A                                             ;; 0b:4003 $cb $37
    and  A, $03                                        ;; 0b:4005 $e6 $03
    inc  A                                             ;; 0b:4007 $3c
    ldh  [hFFBA], A                                    ;; 0b:4008 $e0 $ba
    call call_0b_405a                                  ;; 0b:400a $cd $5a $40
    call call_0b_4444                                  ;; 0b:400d $cd $44 $44
    rst  rst_00_0018                                   ;; 0b:4010 $df
    db   $6e                                           ;; 0b:4011 .
    call call_00_1dfd                                  ;; 0b:4012 $cd $fd $1d
    ld   A, [wD203]                                    ;; 0b:4015 $fa $03 $d2
    inc  A                                             ;; 0b:4018 $3c
    jr   Z, jr_0b_401d                                 ;; 0b:4019 $28 $02
    ld   A, $01                                        ;; 0b:401b $3e $01

jr_0b_401d:
    add  A, $04                                        ;; 0b:401d $c6 $04
    ld   [wDDFF], A                                    ;; 0b:401f $ea $ff $dd
    ld   A, $01                                        ;; 0b:4022 $3e $01
    ld   [wC0B3], A                                    ;; 0b:4024 $ea $b3 $c0
    ld   A, $60                                        ;; 0b:4027 $3e $60
    ld   [wC0B4], A                                    ;; 0b:4029 $ea $b4 $c0
    ld   A, $0c                                        ;; 0b:402c $3e $0c
    rst  rst_00_0030                                   ;; 0b:402e $f7
    ld   A, $15                                        ;; 0b:402f $3e $15
    call call_0b_4049                                  ;; 0b:4031 $cd $49 $40
    call call_0b_780a                                  ;; 0b:4034 $cd $0a $78
    ld   DE, data_0b_4a2d                              ;; 0b:4037 $11 $2d $4a
    ld   A, $00                                        ;; 0b:403a $3e $00
    ld   [wC0B3], A                                    ;; 0b:403c $ea $b3 $c0
    ld   A, $40                                        ;; 0b:403f $3e $40
    ld   [wC0B4], A                                    ;; 0b:4041 $ea $b4 $c0
    ld   A, $0c                                        ;; 0b:4044 $3e $0c
    rst  rst_00_0030                                   ;; 0b:4046 $f7

call_0b_4047:
    ld   A, $16                                        ;; 0b:4047 $3e $16

call_0b_4049:
    ld   [wDE00], A                                    ;; 0b:4049 $ea $00 $de
    ld   A, $94                                        ;; 0b:404c $3e $94
    ld   [wC0B3], A                                    ;; 0b:404e $ea $b3 $c0
    ld   A, $43                                        ;; 0b:4051 $3e $43
    ld   [wC0B4], A                                    ;; 0b:4053 $ea $b4 $c0
    ld   A, $02                                        ;; 0b:4056 $3e $02
    rst  rst_00_0030                                   ;; 0b:4058 $f7
    ret                                                ;; 0b:4059 $c9

call_0b_405a:
    ld   A, $ff                                        ;; 0b:405a $3e $ff
    ld   HL, $9800                                     ;; 0b:405c $21 $00 $98
    ld   BC, $400                                      ;; 0b:405f $01 $00 $04
    call call_00_218f                                  ;; 0b:4062 $cd $8f $21
    call call_00_1d9e                                  ;; 0b:4065 $cd $9e $1d
    call call_0b_5a18                                  ;; 0b:4068 $cd $18 $5a
    call call_0b_40bf                                  ;; 0b:406b $cd $bf $40
    ld   HL, wD800                                     ;; 0b:406e $21 $00 $d8
    ld   DE, $9000                                     ;; 0b:4071 $11 $00 $90
    ld   BC, $7c0                                      ;; 0b:4074 $01 $c0 $07
    call call_00_20ff                                  ;; 0b:4077 $cd $ff $20
    ld   A, $ff                                        ;; 0b:407a $3e $ff
    ld   HL, wD000                                     ;; 0b:407c $21 $00 $d0
    ld   BC, $400                                      ;; 0b:407f $01 $00 $04
    call call_00_3921                                  ;; 0b:4082 $cd $21 $39
    call call_0b_4205                                  ;; 0b:4085 $cd $05 $42
    ld   HL, wD000                                     ;; 0b:4088 $21 $00 $d0
    ld   DE, $9800                                     ;; 0b:408b $11 $00 $98
    ld   BC, $400                                      ;; 0b:408e $01 $00 $04
    rst  rst_00_0018                                   ;; 0b:4091 $df
    db   $01                                           ;; 0b:4092 .
    ret                                                ;; 0b:4093 $c9
    db   $6f, $26, $00, $11, $05, $00, $cd, $7e        ;; 0b:4094 ????????
    db   $1c, $21, $8b, $75, $19, $11, $59, $cc        ;; 0b:409c ????????
    db   $cd, $87, $1f, $3e, $80, $e0, $ca, $3e        ;; 0b:40a4 ????????
    db   $40, $e0, $42, $cd, $5a, $40, $c3, $0a        ;; 0b:40ac ????????
    db   $78, $3e, $01, $ea, $5c, $cc, $3e, $12        ;; 0b:40b4 ????????
    db   $c3, $49, $40                                 ;; 0b:40bc ???

call_0b_40bf:
    ld   A, $61                                        ;; 0b:40bf $3e $61
    ld   [wCC20], A                                    ;; 0b:40c1 $ea $20 $cc
    ld   A, $cc                                        ;; 0b:40c4 $3e $cc
    ld   [wCC21], A                                    ;; 0b:40c6 $ea $21 $cc
    xor  A, A                                          ;; 0b:40c9 $af
    ld   [wCC69], A                                    ;; 0b:40ca $ea $69 $cc
    ld   [wCC2C], A                                    ;; 0b:40cd $ea $2c $cc
    ld   A, $d8                                        ;; 0b:40d0 $3e $d8
    ld   [wCC2D], A                                    ;; 0b:40d2 $ea $2d $cc
    ld   A, [wCC59]                                    ;; 0b:40d5 $fa $59 $cc
    call call_0b_417d                                  ;; 0b:40d8 $cd $7d $41
    ld   A, [wCC36]                                    ;; 0b:40db $fa $36 $cc
    ld   B, A                                          ;; 0b:40de $47
    call call_0b_4153                                  ;; 0b:40df $cd $53 $41
    ld   A, [wCC5A]                                    ;; 0b:40e2 $fa $5a $cc
    call call_0b_417d                                  ;; 0b:40e5 $cd $7d $41
    ld   A, [wCC37]                                    ;; 0b:40e8 $fa $37 $cc
    ld   B, A                                          ;; 0b:40eb $47
    call call_0b_4153                                  ;; 0b:40ec $cd $53 $41
    ld   A, [wCC5B]                                    ;; 0b:40ef $fa $5b $cc
    call call_0b_417d                                  ;; 0b:40f2 $cd $7d $41
    ld   A, [wCC38]                                    ;; 0b:40f5 $fa $38 $cc
    ld   B, A                                          ;; 0b:40f8 $47
    call call_0b_4153                                  ;; 0b:40f9 $cd $53 $41
    ret                                                ;; 0b:40fc $c9

jp_0b_40fd:
    ld   A, [wCC2B]                                    ;; 0b:40fd $fa $2b $cc
    ld   E, A                                          ;; 0b:4100 $5f
    ld   [wCC2E], A                                    ;; 0b:4101 $ea $2e $cc
    ld   A, $08                                        ;; 0b:4104 $3e $08
    ld   [wCC2F], A                                    ;; 0b:4106 $ea $2f $cc
    ld   L, A                                          ;; 0b:4109 $6f
    xor  A, A                                          ;; 0b:410a $af
    ld   D, A                                          ;; 0b:410b $57
    ld   H, A                                          ;; 0b:410c $67
    call call_00_1c7e                                  ;; 0b:410d $cd $7e $1c
    ld   A, [wCC2A]                                    ;; 0b:4110 $fa $2a $cc
    ld   L, A                                          ;; 0b:4113 $6f
    xor  A, A                                          ;; 0b:4114 $af
    ld   H, A                                          ;; 0b:4115 $67
    call call_00_1c7e                                  ;; 0b:4116 $cd $7e $1c
    ld   HL, wD000                                     ;; 0b:4119 $21 $00 $d0
    add  HL, DE                                        ;; 0b:411c $19
    ld   B, H                                          ;; 0b:411d $44
    ld   C, L                                          ;; 0b:411e $4d
    ld   HL, wD400                                     ;; 0b:411f $21 $00 $d4
    add  HL, DE                                        ;; 0b:4122 $19
    ld   D, H                                          ;; 0b:4123 $54
    ld   E, L                                          ;; 0b:4124 $5d
    ld   HL, wCC2C                                     ;; 0b:4125 $21 $2c $cc
    ld   A, [HL+]                                      ;; 0b:4128 $2a
    ld   H, [HL]                                       ;; 0b:4129 $66
    ld   L, A                                          ;; 0b:412a $6f
.jr_0b_412b:
    ld   A, [BC]                                       ;; 0b:412b $0a
    inc  BC                                            ;; 0b:412c $03
    ld   [HL+], A                                      ;; 0b:412d $22
    ld   A, [DE]                                       ;; 0b:412e $1a
    inc  DE                                            ;; 0b:412f $13
    ld   [HL+], A                                      ;; 0b:4130 $22
    ld   A, [wCC2F]                                    ;; 0b:4131 $fa $2f $cc
    dec  A                                             ;; 0b:4134 $3d
    ld   [wCC2F], A                                    ;; 0b:4135 $ea $2f $cc
    or   A, A                                          ;; 0b:4138 $b7
    jr   NZ, .jr_0b_412b                               ;; 0b:4139 $20 $f0
    ld   A, $08                                        ;; 0b:413b $3e $08
    ld   [wCC2F], A                                    ;; 0b:413d $ea $2f $cc
    ld   A, [wCC2E]                                    ;; 0b:4140 $fa $2e $cc
    dec  A                                             ;; 0b:4143 $3d
    ld   [wCC2E], A                                    ;; 0b:4144 $ea $2e $cc
    or   A, A                                          ;; 0b:4147 $b7
    jr   NZ, .jr_0b_412b                               ;; 0b:4148 $20 $e1
    ld   BC, wCC2C                                     ;; 0b:414a $01 $2c $cc
    ld   A, L                                          ;; 0b:414d $7d
    ld   [BC], A                                       ;; 0b:414e $02
    inc  BC                                            ;; 0b:414f $03
    ld   A, H                                          ;; 0b:4150 $7c
    ld   [BC], A                                       ;; 0b:4151 $02
    ret                                                ;; 0b:4152 $c9

call_0b_4153:
    or   A, B                                          ;; 0b:4153 $b0
    ret  Z                                             ;; 0b:4154 $c8
    ld   A, [wCC22]                                    ;; 0b:4155 $fa $22 $cc
    ld   HL, data_0b_43c4                              ;; 0b:4158 $21 $c4 $43
    rst  add_hl_a                                      ;; 0b:415b $c7
    ld   A, [HL]                                       ;; 0b:415c $7e
    ld   [wCC2B], A                                    ;; 0b:415d $ea $2b $cc
    ld   C, A                                          ;; 0b:4160 $4f
    ld   HL, wCC20                                     ;; 0b:4161 $21 $20 $cc
    ld   A, [HL+]                                      ;; 0b:4164 $2a
    ld   H, [HL]                                       ;; 0b:4165 $66
    ld   L, A                                          ;; 0b:4166 $6f
    ld   A, [wCC69]                                    ;; 0b:4167 $fa $69 $cc
.jr_0b_416a:
    ld   [HL+], A                                      ;; 0b:416a $22
    dec  B                                             ;; 0b:416b $05
    jr   NZ, .jr_0b_416a                               ;; 0b:416c $20 $fc
    add  A, C                                          ;; 0b:416e $81
    ld   [wCC69], A                                    ;; 0b:416f $ea $69 $cc
    ld   A, L                                          ;; 0b:4172 $7d
    ld   [wCC20], A                                    ;; 0b:4173 $ea $20 $cc
    ld   A, H                                          ;; 0b:4176 $7c
    ld   [wCC21], A                                    ;; 0b:4177 $ea $21 $cc
    jp   jp_0b_40fd                                    ;; 0b:417a $c3 $fd $40

call_0b_417d:
    cp   A, $ff                                        ;; 0b:417d $fe $ff
    jr   NZ, .jr_0b_4182                               ;; 0b:417f $20 $01
    ret                                                ;; 0b:4181 $c9
.jr_0b_4182:
    ld   HL, data_0b_4301                              ;; 0b:4182 $21 $01 $43
    rst  add_hl_a                                      ;; 0b:4185 $c7
    ld   A, [HL]                                       ;; 0b:4186 $7e
    ld   C, A                                          ;; 0b:4187 $4f
    and  A, $07                                        ;; 0b:4188 $e6 $07
    ld   [wCC2A], A                                    ;; 0b:418a $ea $2a $cc
    ld   A, C                                          ;; 0b:418d $79
    rra                                                ;; 0b:418e $1f
    rra                                                ;; 0b:418f $1f
    rra                                                ;; 0b:4190 $1f
    and  A, $1f                                        ;; 0b:4191 $e6 $1f
    ld   HL, data_0b_43cc                              ;; 0b:4193 $21 $cc $43
    rst  add_hl_a                                      ;; 0b:4196 $c7
    ld   A, [HL]                                       ;; 0b:4197 $7e
    ld   B, A                                          ;; 0b:4198 $47
    and  A, $0f                                        ;; 0b:4199 $e6 $0f
    ld   [wCC22], A                                    ;; 0b:419b $ea $22 $cc
    ld   A, B                                          ;; 0b:419e $78
    swap A                                             ;; 0b:419f $cb $37
    and  A, $0f                                        ;; 0b:41a1 $e6 $0f
    ld   [wCC23], A                                    ;; 0b:41a3 $ea $23 $cc
    ld   A, C                                          ;; 0b:41a6 $79
    rra                                                ;; 0b:41a7 $1f
    rra                                                ;; 0b:41a8 $1f
    rra                                                ;; 0b:41a9 $1f
    and  A, $1f                                        ;; 0b:41aa $e6 $1f
    add  A, A                                          ;; 0b:41ac $87
    add  A, A                                          ;; 0b:41ad $87
    ld   HL, data_0b_43e4                              ;; 0b:41ae $21 $e4 $43
    rst  add_hl_a                                      ;; 0b:41b1 $c7
    ld   DE, wCC24                                     ;; 0b:41b2 $11 $24 $cc
    call call_00_1f84                                  ;; 0b:41b5 $cd $84 $1f
    ld   HL, wCC26                                     ;; 0b:41b8 $21 $26 $cc
    ld   E, [HL]                                       ;; 0b:41bb $5e
    inc  HL                                            ;; 0b:41bc $23
    ld   D, [HL]                                       ;; 0b:41bd $56
    ld   HL, wCC24                                     ;; 0b:41be $21 $24 $cc
    ld   A, [HL+]                                      ;; 0b:41c1 $2a
    ld   H, [HL]                                       ;; 0b:41c2 $66
    ld   L, A                                          ;; 0b:41c3 $6f
    call call_0b_41d5                                  ;; 0b:41c4 $cd $d5 $41
    ld   HL, wCC28                                     ;; 0b:41c7 $21 $28 $cc
    ld   E, [HL]                                       ;; 0b:41ca $5e
    inc  HL                                            ;; 0b:41cb $23
    ld   D, [HL]                                       ;; 0b:41cc $56
    ld   HL, wCC26                                     ;; 0b:41cd $21 $26 $cc
    ld   A, [HL+]                                      ;; 0b:41d0 $2a
    ld   H, [HL]                                       ;; 0b:41d1 $66
    ld   L, A                                          ;; 0b:41d2 $6f
    jr   jr_0b_41e4                                    ;; 0b:41d3 $18 $0f

call_0b_41d5:
    ld   A, [wCC23]                                    ;; 0b:41d5 $fa $23 $cc
    cp   A, $0f                                        ;; 0b:41d8 $fe $0f
    jr   Z, jr_0b_41f3                                 ;; 0b:41da $28 $17
    cp   A, $0d                                        ;; 0b:41dc $fe $0d
    jr   Z, jr_0b_41f9                                 ;; 0b:41de $28 $19
    cp   A, $0e                                        ;; 0b:41e0 $fe $0e
    jr   Z, jr_0b_41ff                                 ;; 0b:41e2 $28 $1b

jr_0b_41e4:
    ld   A, [wCC23]                                    ;; 0b:41e4 $fa $23 $cc
    cp   A, $0f                                        ;; 0b:41e7 $fe $0f
    jr   Z, jr_0b_41f6                                 ;; 0b:41e9 $28 $0b
    cp   A, $0d                                        ;; 0b:41eb $fe $0d
    jr   Z, jr_0b_41fc                                 ;; 0b:41ed $28 $0d
    cp   A, $0e                                        ;; 0b:41ef $fe $0e
    jr   Z, jr_0b_4202                                 ;; 0b:41f1 $28 $0f

jr_0b_41f3:
    rst  rst_00_0018                                   ;; 0b:41f3 $df
    db   $f6                                           ;; 0b:41f4 ?
    ret                                                ;; 0b:41f5 $c9

jr_0b_41f6:
    rst  rst_00_0018                                   ;; 0b:41f6 $df
    db   $f7                                           ;; 0b:41f7 ?
    ret                                                ;; 0b:41f8 $c9

jr_0b_41f9:
    rst  rst_00_0018                                   ;; 0b:41f9 $df
    db   $d6                                           ;; 0b:41fa .
    ret                                                ;; 0b:41fb $c9

jr_0b_41fc:
    rst  rst_00_0018                                   ;; 0b:41fc $df
    db   $d7                                           ;; 0b:41fd .
    ret                                                ;; 0b:41fe $c9

jr_0b_41ff:
    rst  rst_00_0018                                   ;; 0b:41ff $df
    db   $e6                                           ;; 0b:4200 ?
    ret                                                ;; 0b:4201 $c9

jr_0b_4202:
    rst  rst_00_0018                                   ;; 0b:4202 $df
    db   $e7                                           ;; 0b:4203 ?
    ret                                                ;; 0b:4204 $c9

call_0b_4205:
    xor  A, A                                          ;; 0b:4205 $af
    ld   HL, wCC36                                     ;; 0b:4206 $21 $36 $cc
    add  A, [HL]                                       ;; 0b:4209 $86
    inc  HL                                            ;; 0b:420a $23
    add  A, [HL]                                       ;; 0b:420b $86
    inc  HL                                            ;; 0b:420c $23
    add  A, [HL]                                       ;; 0b:420d $86
    ld   [wCC6B], A                                    ;; 0b:420e $ea $6b $cc
.jr_0b_4211:
    call call_0b_421c                                  ;; 0b:4211 $cd $1c $42
    ld   HL, wCC6B                                     ;; 0b:4214 $21 $6b $cc
    dec  [HL]                                          ;; 0b:4217 $35
    ld   A, [HL]                                       ;; 0b:4218 $7e
    jr   NZ, .jr_0b_4211                               ;; 0b:4219 $20 $f6
    ret                                                ;; 0b:421b $c9

call_0b_421c:
    dec  A                                             ;; 0b:421c $3d
    ld   HL, wCC41                                     ;; 0b:421d $21 $41 $cc
    rst  add_hl_a                                      ;; 0b:4220 $c7
    rst  add_hl_a                                      ;; 0b:4221 $c7
    call call_0b_42e5                                  ;; 0b:4222 $cd $e5 $42
    ld   HL, wCC61                                     ;; 0b:4225 $21 $61 $cc
    rst  add_hl_a                                      ;; 0b:4228 $c7
    ld   B, [HL]                                       ;; 0b:4229 $46
    ld   HL, wCC51                                     ;; 0b:422a $21 $51 $cc
    rst  add_hl_a                                      ;; 0b:422d $c7
    ld   A, B                                          ;; 0b:422e $78
    ld   [wCC6F], A                                    ;; 0b:422f $ea $6f $cc
    ld   A, [HL]                                       ;; 0b:4232 $7e
    cp   A, $77                                        ;; 0b:4233 $fe $77
    jp   Z, .jp_0b_4240                                ;; 0b:4235 $ca $40 $42
    cp   A, $f7                                        ;; 0b:4238 $fe $f7
    jp   Z, .jp_0b_4277                                ;; 0b:423a $ca $77 $42
    jp   jp_0b_42b6                                    ;; 0b:423d $c3 $b6 $42
.jp_0b_4240:
    ld   A, $08                                        ;; 0b:4240 $3e $08
    ld   [wCC6C], A                                    ;; 0b:4242 $ea $6c $cc
    ld   C, A                                          ;; 0b:4245 $4f
    ld   B, $07                                        ;; 0b:4246 $06 $07
    ld   DE, $18                                       ;; 0b:4248 $11 $18 $00
    ld   HL, wCC6D                                     ;; 0b:424b $21 $6d $cc
    ld   A, [HL+]                                      ;; 0b:424e $2a
    ld   H, [HL]                                       ;; 0b:424f $66
    ld   L, A                                          ;; 0b:4250 $6f
    ld   A, [wCC6F]                                    ;; 0b:4251 $fa $6f $cc
    ld   [HL], $ff                                     ;; 0b:4254 $36 $ff
    inc  HL                                            ;; 0b:4256 $23
    ld   [HL+], A                                      ;; 0b:4257 $22
    inc  A                                             ;; 0b:4258 $3c
    ld   [HL+], A                                      ;; 0b:4259 $22
    inc  A                                             ;; 0b:425a $3c
    ld   [HL+], A                                      ;; 0b:425b $22
    inc  A                                             ;; 0b:425c $3c
    ld   [HL+], A                                      ;; 0b:425d $22
    inc  A                                             ;; 0b:425e $3c
    ld   [HL+], A                                      ;; 0b:425f $22
    inc  A                                             ;; 0b:4260 $3c
    ld   [HL+], A                                      ;; 0b:4261 $22
    inc  A                                             ;; 0b:4262 $3c
    ld   [HL], $ff                                     ;; 0b:4263 $36 $ff
    inc  HL                                            ;; 0b:4265 $23
    add  HL, DE                                        ;; 0b:4266 $19
.jr_0b_4267:
    ld   [HL+], A                                      ;; 0b:4267 $22
    inc  A                                             ;; 0b:4268 $3c
    dec  C                                             ;; 0b:4269 $0d
    jr   NZ, .jr_0b_4267                               ;; 0b:426a $20 $fb
    push AF                                            ;; 0b:426c $f5
    ld   A, [wCC6C]                                    ;; 0b:426d $fa $6c $cc
    ld   C, A                                          ;; 0b:4270 $4f
    pop  AF                                            ;; 0b:4271 $f1
    add  HL, DE                                        ;; 0b:4272 $19
    dec  B                                             ;; 0b:4273 $05
    jr   NZ, .jr_0b_4267                               ;; 0b:4274 $20 $f1
    ret                                                ;; 0b:4276 $c9
.jp_0b_4277:
    ld   A, $10                                        ;; 0b:4277 $3e $10
    ld   [wCC6C], A                                    ;; 0b:4279 $ea $6c $cc
    ld   C, A                                          ;; 0b:427c $4f
    ld   B, $06                                        ;; 0b:427d $06 $06
    ld   DE, $10                                       ;; 0b:427f $11 $10 $00
    ld   HL, wCC6D                                     ;; 0b:4282 $21 $6d $cc
    ld   A, [HL+]                                      ;; 0b:4285 $2a
    ld   H, [HL]                                       ;; 0b:4286 $66
    ld   L, A                                          ;; 0b:4287 $6f
    ld   A, [wCC6F]                                    ;; 0b:4288 $fa $6f $cc
    call call_0b_42a2                                  ;; 0b:428b $cd $a2 $42
    add  HL, DE                                        ;; 0b:428e $19
.jr_0b_428f:
    ld   [HL+], A                                      ;; 0b:428f $22
    inc  A                                             ;; 0b:4290 $3c
    dec  C                                             ;; 0b:4291 $0d
    jr   NZ, .jr_0b_428f                               ;; 0b:4292 $20 $fb
    push AF                                            ;; 0b:4294 $f5
    ld   A, [wCC6C]                                    ;; 0b:4295 $fa $6c $cc
    ld   C, A                                          ;; 0b:4298 $4f
    pop  AF                                            ;; 0b:4299 $f1
    add  HL, DE                                        ;; 0b:429a $19
    dec  B                                             ;; 0b:429b $05
    jr   NZ, .jr_0b_428f                               ;; 0b:429c $20 $f1
    call call_0b_42a2                                  ;; 0b:429e $cd $a2 $42
    ret                                                ;; 0b:42a1 $c9

call_0b_42a2:
    ld   [HL], $ff                                     ;; 0b:42a2 $36 $ff
    inc  HL                                            ;; 0b:42a4 $23
    dec  C                                             ;; 0b:42a5 $0d
    dec  C                                             ;; 0b:42a6 $0d
.jr_0b_42a7:
    ld   [HL+], A                                      ;; 0b:42a7 $22
    inc  A                                             ;; 0b:42a8 $3c
    dec  C                                             ;; 0b:42a9 $0d
    jr   NZ, .jr_0b_42a7                               ;; 0b:42aa $20 $fb
    push AF                                            ;; 0b:42ac $f5
    ld   A, [wCC6C]                                    ;; 0b:42ad $fa $6c $cc
    ld   C, A                                          ;; 0b:42b0 $4f
    pop  AF                                            ;; 0b:42b1 $f1
    ld   [HL], $ff                                     ;; 0b:42b2 $36 $ff
    inc  HL                                            ;; 0b:42b4 $23
    ret                                                ;; 0b:42b5 $c9

jp_0b_42b6:
    ld   B, A                                          ;; 0b:42b6 $47
    swap A                                             ;; 0b:42b7 $cb $37
    and  A, $0f                                        ;; 0b:42b9 $e6 $0f
    inc  A                                             ;; 0b:42bb $3c
    ld   [wCC6C], A                                    ;; 0b:42bc $ea $6c $cc
    ld   C, A                                          ;; 0b:42bf $4f
    ld   E, A                                          ;; 0b:42c0 $5f
    ld   A, $20                                        ;; 0b:42c1 $3e $20
    sub  A, E                                          ;; 0b:42c3 $93
    ld   E, A                                          ;; 0b:42c4 $5f
    ld   D, $00                                        ;; 0b:42c5 $16 $00
    ld   A, B                                          ;; 0b:42c7 $78
    and  A, $0f                                        ;; 0b:42c8 $e6 $0f
    inc  A                                             ;; 0b:42ca $3c
    ld   B, A                                          ;; 0b:42cb $47
    ld   HL, wCC6D                                     ;; 0b:42cc $21 $6d $cc
    ld   A, [HL+]                                      ;; 0b:42cf $2a
    ld   H, [HL]                                       ;; 0b:42d0 $66
    ld   L, A                                          ;; 0b:42d1 $6f
    ld   A, [wCC6F]                                    ;; 0b:42d2 $fa $6f $cc
.jr_0b_42d5:
    ld   [HL+], A                                      ;; 0b:42d5 $22
    inc  A                                             ;; 0b:42d6 $3c
    dec  C                                             ;; 0b:42d7 $0d
    jr   NZ, .jr_0b_42d5                               ;; 0b:42d8 $20 $fb
    push AF                                            ;; 0b:42da $f5
    ld   A, [wCC6C]                                    ;; 0b:42db $fa $6c $cc
    ld   C, A                                          ;; 0b:42de $4f
    pop  AF                                            ;; 0b:42df $f1
    add  HL, DE                                        ;; 0b:42e0 $19
    dec  B                                             ;; 0b:42e1 $05
    jr   NZ, .jr_0b_42d5                               ;; 0b:42e2 $20 $f1
    ret                                                ;; 0b:42e4 $c9

call_0b_42e5:
    push AF                                            ;; 0b:42e5 $f5
    ld   A, [HL+]                                      ;; 0b:42e6 $2a
    ld   B, A                                          ;; 0b:42e7 $47
    ld   L, [HL]                                       ;; 0b:42e8 $6e
    xor  A, A                                          ;; 0b:42e9 $af
    ld   H, A                                          ;; 0b:42ea $67
    ld   D, A                                          ;; 0b:42eb $57
    ld   E, $20                                        ;; 0b:42ec $1e $20
    call call_00_1c7e                                  ;; 0b:42ee $cd $7e $1c
    ld   HL, wD000                                     ;; 0b:42f1 $21 $00 $d0
    add  HL, DE                                        ;; 0b:42f4 $19
    ld   A, B                                          ;; 0b:42f5 $78
    rst  add_hl_a                                      ;; 0b:42f6 $c7
    ld   A, L                                          ;; 0b:42f7 $7d
    ld   [wCC6D], A                                    ;; 0b:42f8 $ea $6d $cc
    ld   A, H                                          ;; 0b:42fb $7c
    ld   [wCC6E], A                                    ;; 0b:42fc $ea $6e $cc
    pop  AF                                            ;; 0b:42ff $f1
    ret                                                ;; 0b:4300 $c9

data_0b_4301:
    db   $60, $60, $61, $61, $62, $62, $62, $70        ;; 0b:4301 ????????
    db   $70, $70, $71, $71, $71, $72, $72, $72        ;; 0b:4309 ????????
    db   $63, $63, $64, $64, $10, $10, $65, $65        ;; 0b:4311 ????????
    db   $66, $66, $66, $73, $73, $73, $08, $08        ;; 0b:4319 ????????
    db   $08, $67, $67, $67, $20, $20, $00, $00        ;; 0b:4321 ????????
    db   $01, $01, $09, $09, $02, $02, $03, $03        ;; 0b:4329 ????????
    db   $21, $21, $21, $28, $28, $28, $29, $29        ;; 0b:4331 ????????
    db   $29, $30, $30, $30, $11, $11, $11, $11        ;; 0b:4339 ????????
    db   $11, $04, $04, $04, $04, $04, $12, $12        ;; 0b:4341 ??????.?
    db   $12, $12, $12, $05, $05, $05, $05, $05        ;; 0b:4349 ???.????
    db   $13, $13, $13, $13, $13, $06, $06, $06        ;; 0b:4351 ????????
    db   $06, $06, $18, $18, $18, $18, $18, $0a        ;; 0b:4359 ????????
    db   $0a, $0a, $0a, $0a, $19, $19, $19, $19        ;; 0b:4361 ????????
    db   $19, $31, $31, $31, $31, $31, $38, $38        ;; 0b:4369 ????????
    db   $39, $39, $38, $38, $39, $39, $38, $39        ;; 0b:4371 ????????
    db   $1a, $1a, $1a, $1a, $1a, $07, $07, $07        ;; 0b:4379 ????????
    db   $07, $07, $68, $68, $68, $68, $68, $69        ;; 0b:4381 ????????
    db   $69, $69, $69, $69, $6a, $6a, $6a, $6a        ;; 0b:4389 ????????
    db   $6a, $80, $80, $80, $80, $80, $6b, $6b        ;; 0b:4391 ????????
    db   $6b, $6b, $6b, $6c, $6c, $6c, $6c, $6c        ;; 0b:4399 ????????
    db   $1b, $1b, $1b, $1b, $1b, $78, $78, $78        ;; 0b:43a1 ????????
    db   $78, $78, $79, $79, $79, $79, $79, $81        ;; 0b:43a9 ????????
    db   $81, $81, $81, $81, $7a, $b0, $88, $50        ;; 0b:43b1 ????????
    db   $89, $40, $41, $48, $b1, $a8, $a9, $90        ;; 0b:43b9 ????????
    db   $91, $49, $98                                 ;; 0b:43c1 ???

data_0b_43c4:
    db   $10, $20, $20, $30, $3e, $7c, $00, $00        ;; 0b:43c4 .?.?????

data_0b_43cc:
    db   $d0, $d1, $d2, $d2, $d3, $d3, $d3, $d3        ;; 0b:43cc .?.?????
    db   $d3, $d3, $d5, $00, $e0, $e0, $e1, $e2        ;; 0b:43d4 ????????
    db   $e3, $e3, $e4, $e5, $00, $f4, $f4, $00        ;; 0b:43dc ????????

data_0b_43e4:
    db   $00, $40, $43, $43, $34, $47, $46, $49        ;; 0b:43e4 ......??
    db   $f8, $4b, $f1, $4e, $b1, $52, $1b, $56        ;; 0b:43ec ......??
    db   $ef, $59, $c4, $5b, $8d, $5e, $3d, $61        ;; 0b:43f4 ????????
    db   $39, $64, $ec, $66, $d4, $69, $7c, $6c        ;; 0b:43fc ????????
    db   $51, $6f, $0e, $72, $12, $75, $a0, $77        ;; 0b:4404 ????????
    db   $83, $7a, $25, $7d, $f1, $7f, $00, $00        ;; 0b:440c ????????
    db   $00, $40, $54, $43, $2e, $47, $0c, $49        ;; 0b:4414 ????????
    db   $75, $4b, $80, $4e, $23, $52, $bb, $54        ;; 0b:441c ????????
    db   $af, $57, $dd, $59, $75, $5c, $4f, $5e        ;; 0b:4424 ????????
    db   $88, $60, $b1, $63, $35, $67, $35, $67        ;; 0b:442c ????????
    db   $4f, $6d, $00, $00, $af, $6b, $cd, $6e        ;; 0b:4434 ????????
    db   $49, $72, $32, $75, $b2, $78, $00, $00        ;; 0b:443c ????????

call_0b_4444:
    ld   A, $ff                                        ;; 0b:4444 $3e $ff
    ld   HL, wD000                                     ;; 0b:4446 $21 $00 $d0
    ld   BC, $680                                      ;; 0b:4449 $01 $80 $06
    call call_00_3921                                  ;; 0b:444c $cd $21 $39
    ld   HL, wC500                                     ;; 0b:444f $21 $00 $c5
    ld   DE, wD000                                     ;; 0b:4452 $11 $00 $d0
    ld   C, $05                                        ;; 0b:4455 $0e $05
.jr_0b_4457:
    push HL                                            ;; 0b:4457 $e5
    inc  HL                                            ;; 0b:4458 $23
    inc  HL                                            ;; 0b:4459 $23
    inc  HL                                            ;; 0b:445a $23
    ld   A, [HL]                                       ;; 0b:445b $7e
    pop  HL                                            ;; 0b:445c $e1
    inc  A                                             ;; 0b:445d $3c
    jr   NZ, .jr_0b_446c                               ;; 0b:445e $20 $0c
    ld   A, $60                                        ;; 0b:4460 $3e $60
    rst  add_hl_a                                      ;; 0b:4462 $c7
    ld   A, $80                                        ;; 0b:4463 $3e $80
    add  A, E                                          ;; 0b:4465 $83
    ld   E, A                                          ;; 0b:4466 $5f
    jr   NC, .jr_0b_446a                               ;; 0b:4467 $30 $01
    inc  D                                             ;; 0b:4469 $14
.jr_0b_446a:
    jr   .jr_0b_4477                                   ;; 0b:446a $18 $0b
.jr_0b_446c:
    ld   B, $60                                        ;; 0b:446c $06 $60
    rst  rst_00_0018                                   ;; 0b:446e $df
    db   $03                                           ;; 0b:446f .
    ld   A, $20                                        ;; 0b:4470 $3e $20
    add  A, E                                          ;; 0b:4472 $83
    ld   E, A                                          ;; 0b:4473 $5f
    jr   NC, .jr_0b_4477                               ;; 0b:4474 $30 $01
    inc  D                                             ;; 0b:4476 $14
.jr_0b_4477:
    dec  C                                             ;; 0b:4477 $0d
    jr   NZ, .jr_0b_4457                               ;; 0b:4478 $20 $dd
    ld   HL, wC518                                     ;; 0b:447a $21 $18 $c5
    ld   DE, wD070                                     ;; 0b:447d $11 $70 $d0
    ld   C, $05                                        ;; 0b:4480 $0e $05
.jr_0b_4482:
    ld   A, [HL]                                       ;; 0b:4482 $7e
    inc  A                                             ;; 0b:4483 $3c
    jr   Z, .jr_0b_448c                                ;; 0b:4484 $28 $06
    push HL                                            ;; 0b:4486 $e5
    push DE                                            ;; 0b:4487 $d5
    rst  rst_00_0018                                   ;; 0b:4488 $df
    db   $02                                           ;; 0b:4489 .
    pop  DE                                            ;; 0b:448a $d1
    pop  HL                                            ;; 0b:448b $e1
.jr_0b_448c:
    ld   A, $60                                        ;; 0b:448c $3e $60
    rst  add_hl_a                                      ;; 0b:448e $c7
    ld   A, $80                                        ;; 0b:448f $3e $80
    add  A, E                                          ;; 0b:4491 $83
    ld   E, A                                          ;; 0b:4492 $5f
    jr   NC, .jr_0b_4496                               ;; 0b:4493 $30 $01
    inc  D                                             ;; 0b:4495 $14
.jr_0b_4496:
    dec  C                                             ;; 0b:4496 $0d
    jr   NZ, .jr_0b_4482                               ;; 0b:4497 $20 $e9
    ld   HL, wD06A                                     ;; 0b:4499 $21 $6a $d0
    ld   C, $05                                        ;; 0b:449c $0e $05
.jr_0b_449e:
    xor  A, A                                          ;; 0b:449e $af
    call call_00_1f53                                  ;; 0b:449f $cd $53 $1f
    ld   A, $7a                                        ;; 0b:44a2 $3e $7a
    rst  add_hl_a                                      ;; 0b:44a4 $c7
    dec  C                                             ;; 0b:44a5 $0d
    jr   NZ, .jr_0b_449e                               ;; 0b:44a6 $20 $f6
    ld   A, [wCC59]                                    ;; 0b:44a8 $fa $59 $cc
    ld   [wCC70], A                                    ;; 0b:44ab $ea $70 $cc
    call call_0b_4526                                  ;; 0b:44ae $cd $26 $45
    call call_0b_45cb                                  ;; 0b:44b1 $cd $cb $45
    ld   DE, wD280                                     ;; 0b:44b4 $11 $80 $d2
    ld   A, [wCC36]                                    ;; 0b:44b7 $fa $36 $cc
    call call_0b_468b                                  ;; 0b:44ba $cd $8b $46
    ld   A, [wCC37]                                    ;; 0b:44bd $fa $37 $cc
    or   A, A                                          ;; 0b:44c0 $b7
    jr   Z, .jr_0b_44d5                                ;; 0b:44c1 $28 $12
    ld   A, [wCC5A]                                    ;; 0b:44c3 $fa $5a $cc
    ld   [wCC70], A                                    ;; 0b:44c6 $ea $70 $cc
    call call_0b_4526                                  ;; 0b:44c9 $cd $26 $45
    call call_0b_45cb                                  ;; 0b:44cc $cd $cb $45
    ld   A, [wCC37]                                    ;; 0b:44cf $fa $37 $cc
    call call_0b_4685                                  ;; 0b:44d2 $cd $85 $46
.jr_0b_44d5:
    ld   A, [wCC38]                                    ;; 0b:44d5 $fa $38 $cc
    or   A, A                                          ;; 0b:44d8 $b7
    jr   Z, .jr_0b_44ed                                ;; 0b:44d9 $28 $12
    ld   A, [wCC5B]                                    ;; 0b:44db $fa $5b $cc
    ld   [wCC70], A                                    ;; 0b:44de $ea $70 $cc
    call call_0b_4526                                  ;; 0b:44e1 $cd $26 $45
    call call_0b_45cb                                  ;; 0b:44e4 $cd $cb $45
    ld   A, [wCC38]                                    ;; 0b:44e7 $fa $38 $cc
    call call_0b_4685                                  ;; 0b:44ea $cd $85 $46
.jr_0b_44ed:
    jp   jp_0b_708b                                    ;; 0b:44ed $c3 $8b $70
    db   $fa, $1b, $c9, $ea, $70, $cc, $cd, $1c        ;; 0b:44f0 ????????
    db   $45, $cd, $3a, $45, $cd, $cb, $45, $c3        ;; 0b:44f8 ????????
    db   $6b, $46, $fa, $1b, $c9, $ea, $70, $cc        ;; 0b:4500 ????????
    db   $cd, $1c, $45, $c3, $3a, $45, $21, $c2        ;; 0b:4508 ????????
    db   $c9, $5e, $23, $56, $06, $50, $21, $80        ;; 0b:4510 ????????
    db   $d6, $df, $03, $c9                            ;; 0b:4518 ????

call_0b_451c:
    ld   A, $ff                                        ;; 0b:451c $3e $ff
    ld   HL, wD690                                     ;; 0b:451e $21 $90 $d6
    ld   B, $70                                        ;; 0b:4521 $06 $70
    jp   call_00_3934                                  ;; 0b:4523 $c3 $34 $39

call_0b_4526:
    call call_0b_451c                                  ;; 0b:4526 $cd $1c $45
    ld   DE, data_0b_7533                              ;; 0b:4529 $11 $33 $75
    ld   A, [wCC70]                                    ;; 0b:452c $fa $70 $cc
    call call_00_245f                                  ;; 0b:452f $cd $5f $24
    add  HL, DE                                        ;; 0b:4532 $19
    ld   DE, wD685                                     ;; 0b:4533 $11 $85 $d6
    rst  rst_00_0018                                   ;; 0b:4536 $df
    db   $e2                                           ;; 0b:4537 .
    rst  rst_00_0018                                   ;; 0b:4538 $df
    db   $e2                                           ;; 0b:4539 .
    ld   A, [wCC70]                                    ;; 0b:453a $fa $70 $cc
    ld   [wD68E], A                                    ;; 0b:453d $ea $8e $d6
    ld   E, A                                          ;; 0b:4540 $5f
    ld   L, $0c                                        ;; 0b:4541 $2e $0c
    xor  A, A                                          ;; 0b:4543 $af
    ld   D, A                                          ;; 0b:4544 $57
    ld   H, A                                          ;; 0b:4545 $67
    call call_00_1c7e                                  ;; 0b:4546 $cd $7e $1c
    ld   HL, data_0b_4a19                              ;; 0b:4549 $21 $19 $4a
    add  HL, DE                                        ;; 0b:454c $19
    ld   A, [HL+]                                      ;; 0b:454d $2a
    and  A, $07                                        ;; 0b:454e $e6 $07
    ld   [wD68D], A                                    ;; 0b:4550 $ea $8d $d6
    ld   DE, wD690                                     ;; 0b:4553 $11 $90 $d6
    ld   A, [HL+]                                      ;; 0b:4556 $2a
    ld   [DE], A                                       ;; 0b:4557 $12
    inc  DE                                            ;; 0b:4558 $13
    ld   A, [HL+]                                      ;; 0b:4559 $2a
    ld   [wCC73], A                                    ;; 0b:455a $ea $73 $cc
    and  A, $0f                                        ;; 0b:455d $e6 $0f
    ld   [DE], A                                       ;; 0b:455f $12
    call call_0b_45ab                                  ;; 0b:4560 $cd $ab $45
    ld   DE, wD694                                     ;; 0b:4563 $11 $94 $d6
    ld   A, [HL+]                                      ;; 0b:4566 $2a
    ld   [DE], A                                       ;; 0b:4567 $12
    inc  DE                                            ;; 0b:4568 $13
    ld   A, [HL+]                                      ;; 0b:4569 $2a
    ld   [wCC74], A                                    ;; 0b:456a $ea $74 $cc
    and  A, $0f                                        ;; 0b:456d $e6 $0f
    ld   [DE], A                                       ;; 0b:456f $12
    call call_0b_45ab                                  ;; 0b:4570 $cd $ab $45
    push HL                                            ;; 0b:4573 $e5
    ld   DE, wD698                                     ;; 0b:4574 $11 $98 $d6
    rst  rst_00_0018                                   ;; 0b:4577 $df
    db   $02                                           ;; 0b:4578 .
    pop  HL                                            ;; 0b:4579 $e1
    ld   DE, wD6F0                                     ;; 0b:457a $11 $f0 $d6
    rst  rst_00_0018                                   ;; 0b:457d $df
    db   $02                                           ;; 0b:457e .
    ld   DE, wD6BD                                     ;; 0b:457f $11 $bd $d6
    call call_00_1f8d                                  ;; 0b:4582 $cd $8d $1f
    ld   DE, wD6D9                                     ;; 0b:4585 $11 $d9 $d6
    ld   HL, data_0b_469d                              ;; 0b:4588 $21 $9d $46
    ld   A, [wCC73]                                    ;; 0b:458b $fa $73 $cc
    and  A, $f0                                        ;; 0b:458e $e6 $f0
    srl  A                                             ;; 0b:4590 $cb $3f
    srl  A                                             ;; 0b:4592 $cb $3f
    rst  add_hl_a                                      ;; 0b:4594 $c7
    rst  rst_00_0018                                   ;; 0b:4595 $df
    db   $02                                           ;; 0b:4596 .
    ld   DE, wD6DD                                     ;; 0b:4597 $11 $dd $d6
    ld   HL, data_0b_46dd                              ;; 0b:459a $21 $dd $46
    ld   A, [wCC74]                                    ;; 0b:459d $fa $74 $cc
    swap A                                             ;; 0b:45a0 $cb $37
    and  A, $0f                                        ;; 0b:45a2 $e6 $0f
    ld   B, A                                          ;; 0b:45a4 $47
    add  A, A                                          ;; 0b:45a5 $87
    add  A, B                                          ;; 0b:45a6 $80
    rst  add_hl_a                                      ;; 0b:45a7 $c7
    jp   call_00_1f8d                                  ;; 0b:45a8 $c3 $8d $1f

call_0b_45ab:
    push HL                                            ;; 0b:45ab $e5
    dec  DE                                            ;; 0b:45ac $1b
    ld   A, [DE]                                       ;; 0b:45ad $1a
    ld   L, A                                          ;; 0b:45ae $6f
    inc  DE                                            ;; 0b:45af $13
    ld   A, [DE]                                       ;; 0b:45b0 $1a
    ld   H, A                                          ;; 0b:45b1 $67
    ld   A, [wD68E]                                    ;; 0b:45b2 $fa $8e $d6
    cp   A, $bb                                        ;; 0b:45b5 $fe $bb
    jr   C, .jr_0b_45c3                                ;; 0b:45b7 $38 $0a
    add  HL, HL                                        ;; 0b:45b9 $29
    add  HL, HL                                        ;; 0b:45ba $29
    add  HL, HL                                        ;; 0b:45bb $29
    add  HL, HL                                        ;; 0b:45bc $29
    dec  DE                                            ;; 0b:45bd $1b
    ld   A, L                                          ;; 0b:45be $7d
    ld   [DE], A                                       ;; 0b:45bf $12
    inc  DE                                            ;; 0b:45c0 $13
    ld   A, H                                          ;; 0b:45c1 $7c
    ld   [DE], A                                       ;; 0b:45c2 $12
.jr_0b_45c3:
    inc  DE                                            ;; 0b:45c3 $13
    ld   A, L                                          ;; 0b:45c4 $7d
    ld   [DE], A                                       ;; 0b:45c5 $12
    inc  DE                                            ;; 0b:45c6 $13
    ld   A, H                                          ;; 0b:45c7 $7c
    ld   [DE], A                                       ;; 0b:45c8 $12
    pop  HL                                            ;; 0b:45c9 $e1
    ret                                                ;; 0b:45ca $c9

call_0b_45cb:
    ld   A, $0f                                        ;; 0b:45cb $3e $0f
    ld   HL, wD680                                     ;; 0b:45cd $21 $80 $d6
    ld   [HL+], A                                      ;; 0b:45d0 $22
    xor  A, A                                          ;; 0b:45d1 $af
    ld   [HL+], A                                      ;; 0b:45d2 $22
    ld   [HL], A                                       ;; 0b:45d3 $77
    ld   HL, wD6D1                                     ;; 0b:45d4 $21 $d1 $d6
    call call_00_1f53                                  ;; 0b:45d7 $cd $53 $1f
    xor  A, A                                          ;; 0b:45da $af
    ld   HL, wD6EA                                     ;; 0b:45db $21 $ea $d6
    call call_00_1f53                                  ;; 0b:45de $cd $53 $1f
    ld   A, [wCC70]                                    ;; 0b:45e1 $fa $70 $cc
    ld   E, A                                          ;; 0b:45e4 $5f
    ld   L, $09                                        ;; 0b:45e5 $2e $09
    xor  A, A                                          ;; 0b:45e7 $af
    ld   D, A                                          ;; 0b:45e8 $57
    ld   H, A                                          ;; 0b:45e9 $67
    call call_00_1c7e                                  ;; 0b:45ea $cd $7e $1c
    ld   HL, data_0b_533d                              ;; 0b:45ed $21 $3d $53
    add  HL, DE                                        ;; 0b:45f0 $19
    ld   DE, wD6C8                                     ;; 0b:45f1 $11 $c8 $d6
    ld   A, [HL+]                                      ;; 0b:45f4 $2a
    ld   B, A                                          ;; 0b:45f5 $47
    ld   C, $08                                        ;; 0b:45f6 $0e $08
.jr_0b_45f8:
    ld   A, [HL]                                       ;; 0b:45f8 $7e
    cp   A, $ff                                        ;; 0b:45f9 $fe $ff
    jr   NZ, .jr_0b_4601                               ;; 0b:45fb $20 $04
    rl   B                                             ;; 0b:45fd $cb $10
    jr   .jr_0b_4625                                   ;; 0b:45ff $18 $24
.jr_0b_4601:
    rl   B                                             ;; 0b:4601 $cb $10
    jr   C, .jr_0b_4622                                ;; 0b:4603 $38 $1d
    ld   A, [HL+]                                      ;; 0b:4605 $2a
    cp   A, $30                                        ;; 0b:4606 $fe $30
    jr   C, .jr_0b_460f                                ;; 0b:4608 $38 $05
    ld   [wD6C0], A                                    ;; 0b:460a $ea $c0 $d6
    jr   .jr_0b_4625                                   ;; 0b:460d $18 $16
.jr_0b_460f:
    ld   [wCE94], A                                    ;; 0b:460f $ea $94 $ce
    ld   A, $0d                                        ;; 0b:4612 $3e $0d
    ld   [wCD36], A                                    ;; 0b:4614 $ea $36 $cd
    push BC                                            ;; 0b:4617 $c5
    push DE                                            ;; 0b:4618 $d5
    push HL                                            ;; 0b:4619 $e5
    call call_0b_6e74                                  ;; 0b:461a $cd $74 $6e
    pop  HL                                            ;; 0b:461d $e1
    pop  DE                                            ;; 0b:461e $d1
    pop  BC                                            ;; 0b:461f $c1
    jr   .jr_0b_4625                                   ;; 0b:4620 $18 $03
.jr_0b_4622:
    call call_00_1f93                                  ;; 0b:4622 $cd $93 $1f
.jr_0b_4625:
    dec  C                                             ;; 0b:4625 $0d
    jr   NZ, .jr_0b_45f8                               ;; 0b:4626 $20 $d0
    ld   A, $0d                                        ;; 0b:4628 $3e $0d
    ld   [wCD36], A                                    ;; 0b:462a $ea $36 $cd
    call call_0b_7349                                  ;; 0b:462d $cd $49 $73
    call call_0b_728b                                  ;; 0b:4630 $cd $8b $72
    ld   A, [wCC70]                                    ;; 0b:4633 $fa $70 $cc
    ld   E, A                                          ;; 0b:4636 $5f
    ld   L, $04                                        ;; 0b:4637 $2e $04
    xor  A, A                                          ;; 0b:4639 $af
    ld   D, A                                          ;; 0b:463a $57
    ld   H, A                                          ;; 0b:463b $67
    call call_00_1c7e                                  ;; 0b:463c $cd $7e $1c
    ld   HL, data_0b_470d                              ;; 0b:463f $21 $0d $47
    add  HL, DE                                        ;; 0b:4642 $19
    ld   A, [HL+]                                      ;; 0b:4643 $2a
    ld   B, A                                          ;; 0b:4644 $47
    and  A, $3f                                        ;; 0b:4645 $e6 $3f
    ld   [wD683], A                                    ;; 0b:4647 $ea $83 $d6
    ld   C, A                                          ;; 0b:464a $4f
    ld   A, B                                          ;; 0b:464b $78
    swap A                                             ;; 0b:464c $cb $37
    srl  A                                             ;; 0b:464e $cb $3f
    srl  A                                             ;; 0b:4650 $cb $3f
    and  A, $03                                        ;; 0b:4652 $e6 $03
    ld   [wD68F], A                                    ;; 0b:4654 $ea $8f $d6
    ld   [wD6E8], A                                    ;; 0b:4657 $ea $e8 $d6
    ld   A, [wD69A]                                    ;; 0b:465a $fa $9a $d6
    add  A, C                                          ;; 0b:465d $81
    srl  A                                             ;; 0b:465e $cb $3f
    add  A, $4b                                        ;; 0b:4660 $c6 $4b
    ld   [wD6D7], A                                    ;; 0b:4662 $ea $d7 $d6
    ld   DE, wD6E5                                     ;; 0b:4665 $11 $e5 $d6
    jp   call_00_1f8d                                  ;; 0b:4668 $c3 $8d $1f
    db   $21, $c8, $d6, $06, $08, $54, $5d, $2a        ;; 0b:466b ????????
    db   $fe, $6a, $20, $0a, $c5, $e5, $05, $df        ;; 0b:4673 ????????
    db   $03, $3e, $ff, $12, $e1, $c1, $05, $20        ;; 0b:467b ????????
    db   $ec, $c9                                      ;; 0b:4683 ??

call_0b_4685:
    ld   HL, wCC71                                     ;; 0b:4685 $21 $71 $cc
    ld   E, [HL]                                       ;; 0b:4688 $5e
    inc  HL                                            ;; 0b:4689 $23
    ld   D, [HL]                                       ;; 0b:468a $56

call_0b_468b:
    ld   C, A                                          ;; 0b:468b $4f
.jr_0b_468c:
    ld   B, $80                                        ;; 0b:468c $06 $80
    ld   HL, wD680                                     ;; 0b:468e $21 $80 $d6
    rst  rst_00_0018                                   ;; 0b:4691 $df
    db   $03                                           ;; 0b:4692 .
    dec  C                                             ;; 0b:4693 $0d
    jr   NZ, .jr_0b_468c                               ;; 0b:4694 $20 $f6
    ld   HL, wCC71                                     ;; 0b:4696 $21 $71 $cc
    ld   [HL], E                                       ;; 0b:4699 $73
    inc  HL                                            ;; 0b:469a $23
    ld   [HL], D                                       ;; 0b:469b $72
    ret                                                ;; 0b:469c $c9

data_0b_469d:
    db   $32, $1e, $0f, $05, $32, $0f, $1e, $05        ;; 0b:469d ????????
    db   $1e, $32, $0f, $05, $0f, $32, $1e, $05        ;; 0b:46a5 ????????
    db   $1e, $0f, $32, $05, $0f, $1e, $32, $05        ;; 0b:46ad ????????
    db   $0f, $1e, $9e, $05, $00, $23, $bc, $05        ;; 0b:46b5 ????????
    db   $00, $4b, $19, $85, $00, $41, $1e, $05        ;; 0b:46bd ????????
    db   $00, $1e, $41, $05, $00, $46, $19, $05        ;; 0b:46c5 ????....
    db   $00, $3c, $23, $05, $00, $23, $3c, $05        ;; 0b:46cd ....????
    db   $00, $19, $46, $05, $00, $3c, $a3, $05        ;; 0b:46d5 ????????

data_0b_46dd:
    db   $5a, $05, $05, $41, $1e, $05, $41, $05        ;; 0b:46dd ????????
    db   $1e, $5a, $85, $05, $41, $9e, $05, $41        ;; 0b:46e5 ????????
    db   $85, $1e, $5a, $05, $85, $41, $1e, $85        ;; 0b:46ed ????????
    db   $41, $05, $9e, $00, $00, $00, $00, $00        ;; 0b:46f5 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 0b:46fd ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 0b:4705 ?????...

data_0b_470d:
    db   $05, $1e, $20, $ff, $0b, $35, $3a, $ff        ;; 0b:470d ????????
    db   $45, $1e, $20, $ff, $4b, $35, $3a, $ff        ;; 0b:4715 ????????
    db   $81, $0f, $0e, $ff, $87, $25, $28, $ff        ;; 0b:471d ????????
    db   $8d, $44, $4a, $ff, $c1, $10, $0e, $ff        ;; 0b:4725 ????????
    db   $c7, $26, $28, $ff, $cd, $43, $4a, $ff        ;; 0b:472d ????????
    db   $02, $15, $12, $ff, $08, $28, $2c, $ff        ;; 0b:4735 ????????
    db   $0e, $4c, $53, $ff, $42, $15, $12, $ff        ;; 0b:473d ????????
    db   $48, $29, $2c, $ff, $4e, $4d, $53, $ff        ;; 0b:4745 ????????
    db   $84, $1c, $1a, $ff, $8a, $2f, $36, $ff        ;; 0b:474d ????????
    db   $c4, $1c, $1a, $ff, $ca, $30, $36, $ff        ;; 0b:4755 ????????
    db   $14, $76, $86, $ff, $1a, $a3, $b7, $ff        ;; 0b:475d ????????
    db   $54, $74, $86, $ff, $5a, $a5, $b7, $ff        ;; 0b:4765 ????????
    db   $90, $59, $61, $ff, $96, $82, $98, $ff        ;; 0b:476d ????????
    db   $9c, $b8, $cb, $ff, $d0, $5b, $61, $ff        ;; 0b:4775 ????????
    db   $d6, $85, $98, $ff, $dc, $bb, $cb, $ff        ;; 0b:477d ????????
    db   $03, $19, $17, $ff, $0f, $52, $5c, $ff        ;; 0b:4785 ????????
    db   $1b, $ac, $bd, $ff, $43, $18, $17, $ff        ;; 0b:478d ????????
    db   $4f, $50, $5c, $ff, $5b, $ac, $bd, $ff        ;; 0b:4795 ????????
    db   $93, $76, $7b, $ff, $99, $a3, $b1, $ff        ;; 0b:479d ????????
    db   $d3, $70, $7b, $ff, $d9, $99, $b1, $ff        ;; 0b:47a5 ????????
    db   $09, $2a, $2f, $ff, $15, $7b, $8c, $ff        ;; 0b:47ad ????????
    db   $49, $2b, $2f, $ff, $55, $7c, $8c, $ff        ;; 0b:47b5 ????????
    db   $8c, $3b, $49, $ff, $98, $91, $b4, $ff        ;; 0b:47bd ????????
    db   $cc, $3c, $42, $ff, $d8, $91, $a4, $ff        ;; 0b:47c5 ????????
    db   $11, $63, $6b, $ff, $17, $8b, $9e, $ff        ;; 0b:47cd ????????
    db   $1d, $c6, $d8, $ff, $51, $64, $6b, $ff        ;; 0b:47d5 ????????
    db   $57, $8c, $9e, $ff, $5d, $c6, $d8, $ff        ;; 0b:47dd ????????
    db   $86, $23, $24, $ff, $92, $68, $76, $ff        ;; 0b:47e5 ????????
    db   $9e, $d7, $fd, $ff, $c6, $22, $24, $ff        ;; 0b:47ed ????????
    db   $d2, $6a, $76, $ff, $de, $c4, $e5, $ff        ;; 0b:47f5 ????????
    db   $02, $14, $12, $6a, $05, $20, $20, $78        ;; 0b:47fd ????????
    db   $08, $28, $2c, $6b, $0b, $37, $3a, $7a        ;; 0b:4805 ????????
    db   $0e, $4b, $53, $7d, $42, $15, $18, $a0        ;; 0b:480d ????????
    db   $45, $1f, $2a, $a4, $48, $26, $3a, $a2        ;; 0b:4815 ????????
    db   $4b, $35, $4e, $a5, $4e, $49, $6e, $a1        ;; 0b:481d ????????
    db   $81, $0f, $0e, $51, $84, $1d, $1a, $50        ;; 0b:4825 ....????
    db   $87, $25, $28, $52, $8a, $31, $36, $4f        ;; 0b:482d ????????
    db   $8d, $45, $4a, $ca, $c1, $0e, $0e, $c0        ;; 0b:4835 ????....
    db   $c4, $1b, $1a, $00, $c7, $23, $28, $c1        ;; 0b:483d ????????
    db   $ca, $2e, $36, $04, $cd, $43, $4a, $c2        ;; 0b:4845 ????????
    db   $11, $5f, $6b, $ff, $14, $77, $86, $ff        ;; 0b:484d ????????
    db   $17, $8a, $9e, $ff, $1a, $a9, $b7, $ff        ;; 0b:4855 ????????
    db   $1d, $bd, $d2, $ff, $51, $60, $6b, $c7        ;; 0b:485d ????????
    db   $54, $75, $86, $c8, $57, $88, $9e, $c9        ;; 0b:4865 ????????
    db   $5a, $a3, $b7, $ca, $5d, $be, $d2, $ca        ;; 0b:486d ????????
    db   $90, $59, $61, $c3, $93, $71, $7b, $c3        ;; 0b:4875 ????????
    db   $96, $83, $98, $c3, $99, $9c, $b1, $d1        ;; 0b:487d ????????
    db   $9c, $b6, $cb, $d1, $d0, $57, $61, $ff        ;; 0b:4885 ????????
    db   $d3, $6f, $7b, $ff, $d6, $83, $98, $ff        ;; 0b:488d ????????
    db   $d9, $9c, $b1, $ff, $dc, $b6, $cb, $ff        ;; 0b:4895 ????????
    db   $03, $18, $17                                 ;; 0b:489d ???

data_0b_48a0:
    db   $31, $09, $2c, $2f, $33, $0f, $52, $5c        ;; 0b:48a0 ????????
    db   $35, $15, $7c, $8c, $3d, $1b, $ae, $bd        ;; 0b:48a8 ????????
    db   $c2, $43, $19, $17, $03, $49, $2c, $2f        ;; 0b:48b0 ????????
    db   $05, $4f, $52, $5c, $07, $55, $7c, $8c        ;; 0b:48b8 ????????
    db   $06, $5b, $ae, $bd, $09, $86, $20, $24        ;; 0b:48c0 ????????
    db   $13, $8c, $3d, $42, $15, $c6, $21, $24        ;; 0b:48c8 ????????
    db   $12, $cc, $3e, $42, $14, $92, $67, $76        ;; 0b:48d0 ????????
    db   $19, $98, $92, $a4, $d1, $d2, $67, $76        ;; 0b:48d8 ????????
    db   $18, $d8, $92, $a4, $d1, $5e, $c2, $d5        ;; 0b:48e0 ????????
    db   $ca, $de, $c2, $d5, $ca, $41, $0f, $12        ;; 0b:48e8 ????????
    db   $aa, $44, $1d, $23, $ad, $47, $26, $34        ;; 0b:48f0 ????????
    db   $ab, $4a, $32, $48, $ac, $4d, $45, $4a        ;; 0b:48f8 ????????
    db   $b0, $c2, $15, $13, $87, $c5, $1f, $22        ;; 0b:4900 ????????
    db   $84, $c8, $27, $2d, $85, $cb, $37, $3d        ;; 0b:4908 ????????
    db   $89, $ce, $4a, $57, $8a, $50, $58, $61        ;; 0b:4910 ????????
    db   $bd, $53, $6f, $7b, $bc, $56, $81, $98        ;; 0b:4918 ????????
    db   $bf, $59, $99, $b1, $b4, $5c, $b5, $cb        ;; 0b:4920 ????????
    db   $b6, $d1, $5f, $71, $ff, $d4, $76, $8d        ;; 0b:4928 ????????
    db   $ff, $d7, $89, $a6, $ff, $da, $a4, $c0        ;; 0b:4930 ????????
    db   $ff, $dd, $bc, $db, $ff, $c3, $18, $16        ;; 0b:4938 ????????
    db   $56, $c9, $2c, $2d, $c2, $cf, $51, $57        ;; 0b:4940 ????????
    db   $58, $d5, $7b, $84, $c2, $db, $ac, $b4        ;; 0b:4948 ????????
    db   $59, $46, $21, $24, $46, $4c, $3d, $42        ;; 0b:4950 ????????
    db   $45, $52, $68, $76, $40, $58, $95, $a4        ;; 0b:4958 ????????
    db   $44, $de, $c3, $d5, $47, $41, $0f, $0e        ;; 0b:4960 ????????
    db   $b8, $44, $1b, $1a, $ba, $47, $25, $28        ;; 0b:4968 ????????
    db   $b9, $4a, $30, $36, $bb, $4d, $44, $4a        ;; 0b:4970 ????????
    db   $48, $c2, $16, $12, $c0, $c5, $20, $20        ;; 0b:4978 ????????
    db   $c1, $c8, $2a, $2c, $c1, $cb, $37, $3a        ;; 0b:4980 ????????
    db   $6e, $ce, $4b, $53, $5a, $50, $5a, $61        ;; 0b:4988 ????????
    db   $ff, $53, $71, $7b, $ff, $56, $84, $98        ;; 0b:4990 ????????
    db   $ff, $59, $9b, $b1, $ff, $5c, $b6, $cb        ;; 0b:4998 ????????
    db   $ff, $d1, $61, $6b, $60, $d4, $78, $86        ;; 0b:49a0 ????????
    db   $5e, $d7, $8a, $9e, $61, $da, $a6, $b7        ;; 0b:49a8 ????????
    db   $5c, $dd, $bd, $d2, $5f, $c3, $1c, $10        ;; 0b:49b0 ????????
    db   $c0, $c9, $2f, $21, $c1, $cf, $55, $41        ;; 0b:49b8 ????????
    db   $c1, $d5, $7e, $62, $c2, $db, $b4, $84        ;; 0b:49c0 ????????
    db   $c2, $46, $25, $27, $92, $4c, $3f, $46        ;; 0b:49c8 ????????
    db   $93, $52, $6e, $81, $96, $58, $97, $ac        ;; 0b:49d0 ????????
    db   $97, $de, $d4, $dc, $c2, $11, $01, $14        ;; 0b:49d8 ????????
    db   $ff, $1c, $01, $8c, $d1, $0c, $0d, $00        ;; 0b:49e0 ????????
    db   $ff, $1e, $68, $e6, $ff, $12, $1a, $a0        ;; 0b:49e8 ????????
    db   $ff, $0f, $10, $96, $ff, $14, $2b, $aa        ;; 0b:49f0 ????????
    db   $ff, $19, $3d, $b9, $ff, $1a, $3e, $be        ;; 0b:49f8 ????????
    db   $ff, $1c, $42, $c8, $ff, $1e, $48, $d2        ;; 0b:4a00 ????????
    db   $ff, $23, $82, $fa, $ff, $26, $c8, $fa        ;; 0b:4a08 ????????
    db   $ff, $01, $00, $00, $ff, $2a, $fa, $00        ;; 0b:4a10 ????????
    db   $ff                                           ;; 0b:4a18 ?

data_0b_4a19:
    db   $04, $7a, $b0, $56, $f0, $10, $0d, $0f        ;; 0b:4a19 ????????
    db   $0a, $0a, $08, $07, $04, $18, $b1, $e2        ;; 0b:4a21 ????????
    db   $f0, $22, $1d, $1e                            ;; 0b:4a29 ????

data_0b_4a2d:
    db   $19, $19, $16, $15, $04, $7a, $b0, $62        ;; 0b:4a2d ????????
    db   $f0, $12, $0d, $0c, $0c, $0a, $0d, $0a        ;; 0b:4a35 ????????
    db   $04, $18, $b1, $e0, $f0, $25, $1c, $1b        ;; 0b:4a3d ????????
    db   $1b, $17, $1a, $17, $04, $2e, $b0, $32        ;; 0b:4a45 ????????
    db   $f0, $07, $05, $04, $06, $02, $06, $04        ;; 0b:4a4d ????????
    db   $04, $aa, $b0, $bb, $f0, $14, $10, $0e        ;; 0b:4a55 ????????
    db   $14, $0c, $14, $0e, $04, $56, $b1, $76        ;; 0b:4a5d ????????
    db   $f1, $25, $1f, $1a, $25, $18, $25, $1a        ;; 0b:4a65 ????????
    db   $04, $30, $b0, $2c, $f0, $04, $04, $06        ;; 0b:4a6d ????????
    db   $03, $05, $03, $04, $04, $aa, $b0, $99        ;; 0b:4a75 ????????
    db   $f0, $14, $0c, $13, $0b, $13, $0b, $0d        ;; 0b:4a7d ????????
    db   $04, $59, $b1, $37, $f1, $27, $19, $26        ;; 0b:4a85 ????????
    db   $18, $24, $18, $1b, $04, $44, $b0, $33        ;; 0b:4a8d ????????
    db   $f0, $08, $07, $04, $04, $04, $07, $03        ;; 0b:4a95 ????????
    db   $04, $b6, $b0, $89, $f0, $14, $0f, $08        ;; 0b:4a9d ????????
    db   $08, $08, $0f, $07, $04, $72, $b1, $16        ;; 0b:4aa5 ????????
    db   $f1, $27, $1f, $14, $14, $14, $1f, $12        ;; 0b:4aad ????????
    db   $04, $44, $80, $30, $f0, $08, $0a, $02        ;; 0b:4ab5 ????????
    db   $06, $06, $06, $02, $04, $b6, $80, $80        ;; 0b:4abd ????????
    db   $f0, $15, $19, $0b, $0d, $11, $0e, $0b        ;; 0b:4ac5 ????????
    db   $04, $72, $81, $03, $f1, $2a, $2d, $15        ;; 0b:4acd ????????
    db   $1c, $1b, $1a, $15, $04, $69, $b0, $88        ;; 0b:4ad5 ????????
    db   $f0, $14, $08, $0b, $0e, $08, $0e, $0e        ;; 0b:4add ????????
    db   $04, $fa, $b0, $45, $f1, $23, $10, $17        ;; 0b:4ae5 ????????
    db   $1e, $14, $1e, $1e, $04, $69, $b0, $8d        ;; 0b:4aed ????????
    db   $f0, $0f, $08, $06, $0b, $08, $09, $05        ;; 0b:4af5 ????????
    db   $04, $01, $71, $5a, $11, $1e, $16, $0e        ;; 0b:4afd ????????
    db   $20, $0e, $20, $0e, $04, $49, $b2, $d4        ;; 0b:4b05 ????????
    db   $f1, $3f, $35, $3a, $3f, $32, $30, $39        ;; 0b:4b0d ????????
    db   $04, $20, $b3, $80, $f2, $55, $4b, $4e        ;; 0b:4b15 ????????
    db   $55, $49, $46, $46, $04, $44, $b2, $0a        ;; 0b:4b1d ????????
    db   $f2, $38, $3c, $3c, $37, $2c, $37, $3c        ;; 0b:4b25 ????????
    db   $04, $20, $b3, $d0, $f2, $4e, $56, $56        ;; 0b:4b2d ????????
    db   $4a, $3e, $48, $4c, $04, $c2, $b1, $7f        ;; 0b:4b35 ????????
    db   $f1, $2d, $28, $2d, $33, $28, $2a, $2d        ;; 0b:4b3d ????????
    db   $04, $99, $b2, $36, $f2, $42, $3e, $42        ;; 0b:4b45 ????????
    db   $4a, $3e, $40, $42, $04, $5b, $b3, $db        ;; 0b:4b4d ????????
    db   $f2, $55, $42, $4d, $5a, $46, $4a, $4d        ;; 0b:4b55 ????????
    db   $04, $c7, $b1, $6c, $f1, $2f, $2d, $2f        ;; 0b:4b5d ????????
    db   $2b, $2f, $2d, $25, $04, $9e, $b2, $18        ;; 0b:4b65 ????????
    db   $f2, $49, $43, $45, $3d, $45, $43, $3b        ;; 0b:4b6d ????????
    db   $04, $5b, $b3, $b0, $f2, $5b, $56, $59        ;; 0b:4b75 ????????
    db   $4e, $59, $56, $4c, $04, $5e, $b0, $42        ;; 0b:4b7d ????????
    db   $f0, $0e, $08, $09, $06, $07, $06, $06        ;; 0b:4b85 ????????
    db   $04, $a5, $b1, $27, $f1, $2d, $28, $2a        ;; 0b:4b8d ????????
    db   $24, $26, $24, $24, $04, $46, $c3, $4b        ;; 0b:4b95 ????????
    db   $12, $56, $50, $53, $4d, $4f, $4d, $4d        ;; 0b:4b9d ????????
    db   $04, $5e, $b0, $70, $f0, $0d, $08, $0a        ;; 0b:4ba5 ????????
    db   $08, $08, $07, $06, $04, $a5, $b1, $f6        ;; 0b:4bad ????????
    db   $f1, $2f, $28, $2e, $28, $28, $26, $24        ;; 0b:4bb5 ????????
    db   $04, $46, $b3, $9f, $f2, $58, $50, $56        ;; 0b:4bbd ????????
    db   $50, $50, $4e, $4d, $04, $23, $b2, $c7        ;; 0b:4bc5 ????????
    db   $f2, $3c, $39, $3c, $41, $36, $3e, $3a        ;; 0b:4bcd ????????
    db   $04, $09, $c3, $84, $03, $52, $4c, $52        ;; 0b:4bd5 ????????
    db   $4f, $49, $4d, $46, $04, $26, $b2, $cb        ;; 0b:4bdd ????????
    db   $f2, $36, $3e, $3a, $36, $3e, $38, $38        ;; 0b:4be5 ????????
    db   $04, $09, $b3, $84, $f3, $4b, $50, $46        ;; 0b:4bed ????????
    db   $44, $50, $46, $46, $04, $df, $b0, $be        ;; 0b:4bf5 ????????
    db   $f0, $19, $13, $17, $11, $14, $0f, $10        ;; 0b:4bfd ????????
    db   $04, $74, $b2, $16, $f2, $41, $3d, $41        ;; 0b:4c05 ????????
    db   $3a, $3c, $38, $39, $04, $e6, $f0, $a1        ;; 0b:4c0d ????????
    db   $10, $1c, $14, $19, $14, $14, $14, $0f        ;; 0b:4c15 ????????
    db   $04, $76, $f2, $b9, $11, $41, $3f, $44        ;; 0b:4c1d ????????
    db   $3f, $3f, $3f, $3a, $04, $39, $b1, $b6        ;; 0b:4c25 ????????
    db   $01, $23, $1b, $1b, $21, $1b, $26, $24        ;; 0b:4c2d ????????
    db   $04, $e4, $e2, $98, $03, $4e, $46, $46        ;; 0b:4c35 ????????
    db   $4f, $46, $52, $51, $04, $39, $b1, $87        ;; 0b:4c3d ????????
    db   $f1, $21, $1f, $1c, $22, $1b, $1e, $1e        ;; 0b:4c45 ????????
    db   $04, $e4, $b2, $9d, $f3, $4d, $4e, $49        ;; 0b:4c4d ????????
    db   $50, $45, $47, $47, $04, $e5, $b1, $15        ;; 0b:4c55 ????????
    db   $f2, $33, $30, $34, $2d, $2d, $2a, $28        ;; 0b:4c5d ????????
    db   $04, $cb, $b2, $12, $f3, $4a, $48, $4b        ;; 0b:4c65 ????????
    db   $44, $44, $40, $3e, $04, $84, $c3, $66        ;; 0b:4c6d ????????
    db   $03, $5e, $5a, $5f, $59, $59, $51, $4e        ;; 0b:4c75 ????????
    db   $04, $e5, $b1, $54, $f1, $32, $2d, $32        ;; 0b:4c7d ????????
    db   $2b, $2d, $28, $26, $04, $d0, $b2, $f8        ;; 0b:4c85 ????????
    db   $f1, $4a, $44, $47, $41, $44, $3d, $39        ;; 0b:4c8d ????????
    db   $04, $84, $b3, $76, $12, $5f, $5a, $5f        ;; 0b:4c95 ????????
    db   $58, $54, $4b, $44, $04, $8a, $b0, $8a        ;; 0b:4c9d ????????
    db   $f0, $13, $0e, $0e, $19, $10, $19, $10        ;; 0b:4ca5 ????????
    db   $04, $08, $c2, $08, $02, $3c, $37, $37        ;; 0b:4cad ????????
    db   $3e, $37, $37, $37, $04, $d4, $f3, $d4        ;; 0b:4cb5 ????????
    db   $03, $5b, $55, $55, $5f, $5a, $5f, $55        ;; 0b:4cbd ????????
    db   $04, $8a, $b0, $97, $f0, $10, $0f, $14        ;; 0b:4cc5 ????????
    db   $14, $0e, $10, $14, $04, $10, $b2, $44        ;; 0b:4ccd ????????
    db   $f2, $37, $33, $3a, $3a, $2f, $36, $3a        ;; 0b:4cd5 ????????
    db   $04, $d4, $b3, $c0, $03, $55, $5a, $5b        ;; 0b:4cdd ????????
    db   $55, $44, $51, $5a, $03, $36, $c0, $28        ;; 0b:4ce5 ????????
    db   $f0, $08, $05, $05, $03, $09, $03, $03        ;; 0b:4ced ????????
    db   $03, $72, $00, $55, $f0, $12, $0c, $0c        ;; 0b:4cf5 ????????
    db   $07, $12, $07, $07, $03, $b4, $00, $87        ;; 0b:4cfd ????????
    db   $f0, $1a, $10, $10, $0b, $18, $0b, $0b        ;; 0b:4d05 ????????
    db   $03, $18, $01, $d2, $f0, $27, $1b, $1b        ;; 0b:4d0d ????????
    db   $16, $23, $16, $16, $03, $72, $01, $15        ;; 0b:4d15 ????????
    db   $f1, $2d, $23, $23, $1f, $2d, $1f, $1f        ;; 0b:4d1d ????????
    db   $03, $3a, $b0, $45, $f0, $09, $04, $05        ;; 0b:4d25 ????????
    db   $03, $06, $05, $03, $03, $72, $b0, $7d        ;; 0b:4d2d ????????
    db   $f0, $11, $06, $09, $03, $0c, $05, $03        ;; 0b:4d35 ????????
    db   $03, $b4, $00, $c3, $f0, $14, $0a, $0e        ;; 0b:4d3d ????????
    db   $06, $12, $08, $06, $03, $0e, $01, $27        ;; 0b:4d45 ????????
    db   $f1, $1e, $12, $17, $0d, $1c, $10, $0d        ;; 0b:4d4d ????????
    db   $03, $6e, $01, $92, $f1, $28, $1c, $21        ;; 0b:4d55 ????????
    db   $17, $26, $1c, $17, $03, $2d, $b0, $36        ;; 0b:4d5d ????.w..
    db   $f0, $08, $04, $03, $08, $02, $06, $06        ;; 0b:4d65 ........
    db   $03, $61, $b0, $74, $f0, $0e, $0a, $08        ;; 0b:4d6d ????????
    db   $0e, $07, $0c, $0c, $03, $a0, $f0, $c0        ;; 0b:4d75 ????????
    db   $10, $15, $10, $0c, $15, $0a, $13, $13        ;; 0b:4d7d ????????
    db   $03, $f2, $f0, $22, $41, $1e, $18, $16        ;; 0b:4d85 ????????
    db   $1d, $15, $1c, $1c, $03, $4b, $f1, $8d        ;; 0b:4d8d ????????
    db   $41, $28, $22, $1f, $27, $1e, $26, $26        ;; 0b:4d95 ????????
    db   $03, $2d, $c0, $31, $f0, $03, $03, $07        ;; 0b:4d9d .w......
    db   $09, $02, $09, $05, $03, $61, $c0, $6a        ;; 0b:4da5 ....????
    db   $10, $07, $07, $0c, $12, $05, $12, $0a        ;; 0b:4dad ????????
    db   $03, $98, $c0, $a7, $10, $0c, $0c, $14        ;; 0b:4db5 ????????
    db   $1a, $09, $1a, $0f, $03, $f2, $c0, $0a        ;; 0b:4dbd ????????
    db   $41, $11, $14, $20, $26, $11, $26, $18        ;; 0b:4dc5 ????????
    db   $03, $4b, $c1, $6c, $41, $19, $1c, $33        ;; 0b:4dcd ????????
    db   $2e, $19, $33, $21, $03, $dd, $b1, $f4        ;; 0b:4dd5 ????????
    db   $f1, $34, $2a, $2f, $2f, $2a, $24, $2f        ;; 0b:4ddd ????????
    db   $03, $3e, $b2, $5a, $12, $3f, $33, $3a        ;; 0b:4de5 ????????
    db   $3a, $33, $2f, $3a, $03, $bc, $b2, $df        ;; 0b:4ded ????????
    db   $12, $4c, $3f, $45, $45, $3f, $3c, $45        ;; 0b:4df5 ????????
    db   $03, $0f, $b3, $36, $13, $51, $43, $4c        ;; 0b:4dfd ????????
    db   $4c, $43, $41, $4c, $03, $70, $b3, $9c        ;; 0b:4e05 ????????
    db   $13, $58, $49, $50, $50, $49, $46, $50        ;; 0b:4e0d ????????
    db   $03, $dd, $b1, $c6, $f1, $33, $34, $2f        ;; 0b:4e15 ????????
    db   $2f, $28, $33, $33, $03, $3e, $b2, $22        ;; 0b:4e1d ????????
    db   $f2, $3d, $3e, $37, $36, $2f, $3a, $3a        ;; 0b:4e25 ????????
    db   $03, $bc, $b2, $99, $f2, $4a, $4d, $43        ;; 0b:4e2d ????????
    db   $4d, $3c, $47, $47, $03, $0f, $b3, $e8        ;; 0b:4e35 ????????
    db   $f2, $50, $53, $47, $46, $40, $4b, $4b        ;; 0b:4e3d ????????
    db   $03, $70, $b3, $44, $f3, $59, $5c, $4f        ;; 0b:4e45 ????????
    db   $4e, $47, $52, $52, $03, $c2, $d1, $05        ;; 0b:4e4d ????????
    db   $12, $26, $26, $26, $2e, $20, $2e, $26        ;; 0b:4e55 ????????
    db   $03, $1c, $d2, $6d, $12, $32, $32, $32        ;; 0b:4e5d ????????
    db   $3a, $33, $41, $39, $03, $8d, $d2, $ee        ;; 0b:4e65 ????????
    db   $12, $41, $41, $41, $49, $42, $4e, $44        ;; 0b:4e6d ????????
    db   $03, $ee, $d2, $5e, $13, $4b, $4b, $4b        ;; 0b:4e75 ????????
    db   $57, $45, $57, $4b, $03, $54, $d3, $6b        ;; 0b:4e7d ????????
    db   $13, $58, $4d, $4d, $5b, $47, $5b, $4d        ;; 0b:4e85 ????????
    db   $03, $c2, $b1, $7f, $f1, $2d, $25, $2f        ;; 0b:4e8d ????????
    db   $25, $2d, $2d, $1e, $03, $1c, $b2, $cb        ;; 0b:4e95 ????????
    db   $f1, $36, $30, $39, $30, $36, $36, $2c        ;; 0b:4e9d ????????
    db   $03, $93, $b2, $31, $f2, $41, $3b, $45        ;; 0b:4ea5 ????????
    db   $41, $41, $41, $35, $03, $ee, $b2, $7e        ;; 0b:4ead ????????
    db   $f2, $4b, $43, $50, $43, $4b, $4b, $3f        ;; 0b:4eb5 ????????
    db   $03, $54, $b3, $d5, $f2, $55, $4d, $5b        ;; 0b:4ebd ????????
    db   $4d, $55, $55, $4a, $03, $50, $b0, $40        ;; 0b:4ec5 ????????
    db   $f0, $0c, $0c, $08, $03, $0c, $03, $0a        ;; 0b:4ecd ????????
    db   $03, $d2, $b0, $a8, $f0, $18, $18, $10        ;; 0b:4ed5 ????????
    db   $0c, $18, $0c, $16, $03, $9a, $b1, $48        ;; 0b:4edd ????????
    db   $f1, $2c, $2c, $24, $1e, $2c, $1e, $2a        ;; 0b:4ee5 ????????
    db   $03, $6a, $02, $ef, $f1, $4b, $42, $38        ;; 0b:4eed ????????
    db   $35, $42, $35, $40, $03, $40, $03, $9a        ;; 0b:4ef5 ????????
    db   $f2, $59, $57, $4d, $47, $57, $47, $55        ;; 0b:4efd ????????
    db   $03, $54, $b0, $48, $f0, $0c, $09, $05        ;; 0b:4f05 ????????
    db   $0a, $05, $0a, $0a, $03, $d2, $b0, $bd        ;; 0b:4f0d ????????
    db   $f0, $19, $15, $0f, $18, $0f, $18, $18        ;; 0b:4f15 ????????
    db   $03, $9a, $b1, $71, $f1, $2d, $29, $21        ;; 0b:4f1d ????????
    db   $2d, $21, $2d, $2d, $03, $6e, $92, $30        ;; 0b:4f25 ????????
    db   $02, $3c, $41, $37, $48, $37, $48, $48        ;; 0b:4f2d ????????
    db   $03, $40, $93, $ed, $02, $50, $53, $49        ;; 0b:4f35 ????????
    db   $5b, $49, $5b, $5b, $03, $87, $b0, $94        ;; 0b:4f3d ????????
    db   $f0, $15, $11, $15, $0a, $15, $0a, $11        ;; 0b:4f45 ????????
    db   $03, $36, $b1, $55, $f1, $2d, $24, $2d        ;; 0b:4f4d ????????
    db   $1e, $2d, $1e, $24, $03, $87, $b0, $a2        ;; 0b:4f55 ????????
    db   $00, $12, $0c, $12, $11, $0c, $11, $12        ;; 0b:4f5d ????????
    db   $03, $36, $b1, $74, $f1, $24, $1e, $24        ;; 0b:4f65 ????????
    db   $27, $1e, $27, $29, $03, $03, $22, $36        ;; 0b:4f6d ????????
    db   $f2, $35, $35, $37, $37, $37, $35, $37        ;; 0b:4f75 ????????
    db   $03, $e4, $22, $2e, $f3, $48, $48, $4c        ;; 0b:4f7d ????????
    db   $4c, $4c, $48, $4c, $03, $08, $c2, $70        ;; 0b:4f85 ????????
    db   $02, $38, $36, $38, $34, $38, $34, $38        ;; 0b:4f8d ????????
    db   $03, $e4, $12, $78, $03, $4d, $49, $4d        ;; 0b:4f95 ????????
    db   $47, $4d, $47, $4d, $03, $b6, $f3, $c0        ;; 0b:4f9d ????????
    db   $03, $5b, $5b, $58, $58, $58, $5b, $58        ;; 0b:4fa5 ????????
    db   $03, $b6, $43, $d4, $13, $5a, $58, $5b        ;; 0b:4fad ????????
    db   $5b, $5b, $5b, $58, $01, $32, $b0, $28        ;; 0b:4fb5 ????????
    db   $f0, $06, $04, $03, $04, $06, $04, $03        ;; 0b:4fbd ????????
    db   $01, $69, $b0, $54, $10, $0e, $09, $0b        ;; 0b:4fc5 ????????
    db   $07, $0d, $09, $08, $01, $af, $b0, $8c        ;; 0b:4fcd ????????
    db   $10, $17, $0f, $12, $0d, $16, $10, $0f        ;; 0b:4fd5 ????????
    db   $01, $04, $b1, $d0, $10, $20, $16, $1a        ;; 0b:4fdd ????????
    db   $13, $1d, $16, $15, $01, $5f, $b1, $19        ;; 0b:4fe5 ????????
    db   $11, $29, $1f, $25, $1c, $27, $1f, $1e        ;; 0b:4fed ????????
    db   $01, $48, $90, $36, $f0, $09, $08, $08        ;; 0b:4ff5 ????????
    db   $06, $06, $09, $06, $01, $7b, $00, $5d        ;; 0b:4ffd ????????
    db   $f0, $0f, $0b, $0b, $09, $09, $0f, $09        ;; 0b:5005 ????????
    db   $01, $c3, $00, $93, $f0, $17, $12, $12        ;; 0b:500d ????????
    db   $10, $10, $17, $10, $01, $24, $01, $db        ;; 0b:5015 ????????
    db   $f0, $20, $1b, $1b, $19, $19, $20, $19        ;; 0b:501d ????????
    db   $01, $7c, $01, $1d, $f1, $2a, $24, $24        ;; 0b:5025 ????????
    db   $22, $22, $2a, $22, $01, $d1, $01, $46        ;; 0b:502d ????????
    db   $f1, $2f, $2d, $2f, $2b, $2f, $29, $2b        ;; 0b:5035 ????????
    db   $01, $2c, $02, $86, $f1, $39, $37, $39        ;; 0b:503d ????????
    db   $34, $39, $32, $36, $01, $a8, $02, $dc        ;; 0b:5045 ????????
    db   $21, $47, $43, $47, $3d, $47, $3a, $3d        ;; 0b:504d ????????
    db   $01, $0c, $03, $40, $22, $4f, $4a, $4f        ;; 0b:5055 ????????
    db   $42, $4f, $3f, $42, $01, $66, $03, $61        ;; 0b:505d ????????
    db   $22, $58, $53, $58, $4a, $58, $47, $4a        ;; 0b:5065 ????????
    db   $01, $ea, $b1, $88, $f1, $33, $2d, $33        ;; 0b:506d ????????
    db   $35, $2a, $35, $33, $01, $51, $b2, $db        ;; 0b:5075 ????????
    db   $f1, $3e, $3a, $3e, $42, $33, $42, $3e        ;; 0b:507d ????????
    db   $01, $da, $b2, $48, $f2, $41, $3d, $41        ;; 0b:5085 ????????
    db   $47, $36, $47, $41, $01, $29, $b3, $88        ;; 0b:508d ????????
    db   $f2, $46, $41, $46, $4e, $3b, $4e, $46        ;; 0b:5095 ????????
    db   $01, $98, $b3, $e0, $f2, $4f, $4a, $4f        ;; 0b:509d ????????
    db   $58, $44, $58, $4f, $01, $5f, $90, $4c        ;; 0b:50a5 ????????
    db   $f0, $09, $08, $0b, $0a, $05, $08, $0e        ;; 0b:50ad ????????
    db   $01, $f0, $00, $c0, $f0, $18, $14, $1e        ;; 0b:50b5 ????????
    db   $18, $11, $14, $1e, $01, $ae, $01, $58        ;; 0b:50bd ????????
    db   $f1, $2b, $26, $33, $2b, $23, $26, $33        ;; 0b:50c5 ????????
    db   $01, $7b, $02, $fc, $11, $3f, $3e, $4b        ;; 0b:50cd ????????
    db   $43, $39, $3e, $4b, $01, $51, $23, $a8        ;; 0b:50d5 ????????
    db   $12, $54, $4f, $5e, $55, $4a, $4f, $5e        ;; 0b:50dd ????????
    db   $01, $91, $b0, $83, $f0, $11, $0f, $0a        ;; 0b:50e5 ????????
    db   $0f, $0f, $0e, $0a, $01, $40, $b1, $20        ;; 0b:50ed ????????
    db   $f1, $24, $1e, $19, $1e, $1e, $1d, $19        ;; 0b:50f5 ????????
    db   $01, $03, $b2, $d0, $f1, $38, $33, $3a        ;; 0b:50fd ????????
    db   $3c, $3c, $3a, $36, $01, $e4, $92, $9a        ;; 0b:5105 ????????
    db   $02, $50, $42, $4c, $50, $50, $4e, $48        ;; 0b:510d ????????
    db   $01, $b6, $23, $57, $03, $5d, $54, $58        ;; 0b:5115 ????????
    db   $5d, $5d, $5a, $54, $00, $34, $b0, $00        ;; 0b:511d ????????
    db   $f0, $07, $04, $07, $00, $05, $02, $07        ;; 0b:5125 ????????
    db   $00, $6e, $b0, $00, $f0, $10, $0c, $0e        ;; 0b:512d ????????
    db   $00, $0c, $09, $0e, $00, $af, $b0, $00        ;; 0b:5135 ????????
    db   $f0, $16, $12, $14, $00, $12, $0f, $14        ;; 0b:513d ????????
    db   $00, $04, $b1, $00, $f0, $1c, $1a, $1d        ;; 0b:5145 ????????
    db   $00, $1a, $17, $1d, $00, $6b, $b1, $00        ;; 0b:514d ????????
    db   $f0, $27, $24, $27, $00, $24, $21, $27        ;; 0b:5155 ????????
    db   $00, $4c, $b0, $00, $f0, $08, $0b, $08        ;; 0b:515d ????????
    db   $00, $08, $09, $04, $00, $7d, $b0, $00        ;; 0b:5165 ????????
    db   $f0, $0e, $11, $0d, $00, $0c, $0e, $08        ;; 0b:516d ????????
    db   $00, $c6, $b0, $00, $f0, $15, $19, $14        ;; 0b:5175 ????????
    db   $00, $11, $14, $0d, $00, $24, $b1, $00        ;; 0b:517d ????????
    db   $f0, $1f, $22, $1e, $00, $1b, $1e, $17        ;; 0b:5185 ????????
    db   $00, $86, $b1, $00, $f0, $29, $2d, $28        ;; 0b:518d ????????
    db   $00, $25, $28, $22, $00, $d1, $b1, $00        ;; 0b:5195 ????????
    db   $f0, $2f, $27, $2f, $00, $1e, $2f, $27        ;; 0b:519d ????????
    db   $00, $32, $b2, $00, $f0, $3a, $34, $3a        ;; 0b:51a5 ????????
    db   $00, $26, $35, $2f, $00, $ad, $b2, $00        ;; 0b:51ad ????????
    db   $f0, $46, $3b, $4b, $00, $32, $4b, $3b        ;; 0b:51b5 ????????
    db   $00, $0c, $b3, $00, $f0, $51, $40, $51        ;; 0b:51bd ????????
    db   $00, $37, $51, $40, $00, $70, $b3, $00        ;; 0b:51c5 ????????
    db   $f0, $5b, $48, $5b, $00, $3f, $5b, $48        ;; 0b:51cd ????????
    db   $00, $f4, $b1, $00, $f0, $35, $33, $2d        ;; 0b:51d5 ????????
    db   $00, $34, $2d, $28, $00, $60, $b2, $00        ;; 0b:51dd ????????
    db   $f0, $41, $3f, $3b, $00, $40, $3b, $36        ;; 0b:51e5 ????????
    db   $00, $d5, $b2, $00, $f0, $4b, $48, $43        ;; 0b:51ed ????????
    db   $00, $4a, $43, $3e, $00, $34, $b3, $00        ;; 0b:51f5 ????????
    db   $f0, $52, $4f, $48, $00, $52, $48, $43        ;; 0b:51fd ????????
    db   $00, $98, $b3, $00, $f0, $5c, $58, $50        ;; 0b:5205 ????????
    db   $00, $5c, $50, $4b, $00, $5f, $b0, $00        ;; 0b:520d ????????
    db   $f0, $0e, $0c, $03, $00, $0c, $0a, $03        ;; 0b:5215 ????????
    db   $00, $f0, $b0, $00, $f0, $1c, $1a, $0f        ;; 0b:521d ????????
    db   $00, $1a, $16, $0f, $00, $b8, $b1, $00        ;; 0b:5225 ????????
    db   $f0, $31, $2f, $1c, $00, $2f, $23, $1c        ;; 0b:522d ????????
    db   $00, $80, $22, $00, $f0, $49, $47, $2e        ;; 0b:5235 ????????
    db   $00, $47, $35, $2e, $00, $51, $23, $00        ;; 0b:523d ????????
    db   $f0, $5a, $59, $3c, $00, $59, $43, $3c        ;; 0b:5245 ????????
    db   $00, $91, $b0, $00, $f0, $12, $11, $11        ;; 0b:524d ????????
    db   $00, $0e, $11, $11, $00, $43, $b1, $00        ;; 0b:5255 ????????
    db   $f0, $24, $23, $23, $00, $1e, $23, $23        ;; 0b:525d ????????
    db   $00, $12, $b2, $00, $f0, $39, $3c, $33        ;; 0b:5265 ????????
    db   $00, $3c, $33, $33, $00, $e4, $b2, $00        ;; 0b:526d ????????
    db   $f0, $4e, $50, $44, $00, $50, $44, $44        ;; 0b:5275 ????????
    db   $00, $d4, $b3, $00, $f0, $60, $54, $5b        ;; 0b:527d ????????
    db   $00, $62, $5b, $54, $04, $cc, $b1, $cc        ;; 0b:5285 ????????
    db   $f1, $0a, $1e, $2d, $14, $23, $28, $2d        ;; 0b:528d ????????
    db   $04, $c4, $b9, $b0, $f4, $64, $64, $32        ;; 0b:5295 ????????
    db   $1e, $64, $64, $6e, $02, $90, $a1, $c2        ;; 0b:529d ????????
    db   $01, $0f, $28, $1b, $25, $12, $96, $1e        ;; 0b:52a5 ????????
    db   $04, $a0, $bf, $f4, $f1, $c8, $96, $46        ;; 0b:52ad ????????
    db   $0a, $12, $c8, $14, $04, $ac, $ad, $ac        ;; 0b:52b5 ????????
    db   $0d, $28, $23, $24, $37, $1c, $32, $1e        ;; 0b:52bd ????????
    db   $04, $b8, $bb, $c4, $f9, $2d, $19, $0f        ;; 0b:52c5 ????????
    db   $12, $0f, $1e, $14, $04, $a0, $ff, $b8        ;; 0b:52cd ????????
    db   $0b, $2d, $37, $23, $3e, $14, $32, $14        ;; 0b:52d5 ????????
    db   $04, $77, $71, $77, $11, $1e, $28, $37        ;; 0b:52dd ????????
    db   $91, $28, $46, $32, $04, $f4, $91, $e8        ;; 0b:52e5 ????????
    db   $13, $8c, $28, $41, $dc, $2d, $64, $32        ;; 0b:52ed ????????
    db   $04, $71, $f2, $ee, $02, $46, $3c, $50        ;; 0b:52f5 ????????
    db   $6e, $41, $82, $37, $04, $e8, $f3, $71        ;; 0b:52fd ????????
    db   $02, $6e, $46, $3e, $46, $96, $5a, $3c        ;; 0b:5305 ????????
    db   $04, $d6, $d6, $d6, $06, $14, $96, $5a        ;; 0b:530d ????????
    db   $64, $2d, $5a, $3c, $04, $4d, $f8, $4d        ;; 0b:5315 ????????
    db   $08, $1e, $e6, $78, $c8, $63, $c8, $7d        ;; 0b:531d ????????
    db   $04, $a6, $3e, $a6, $fe, $01, $01, $01        ;; 0b:5325 ????????
    db   $01, $01, $01, $01, $04, $b8, $db, $b8        ;; 0b:532d ????????
    db   $0b, $64, $fa, $64, $fa, $82, $fa, $7d        ;; 0b:5335 ????????

data_0b_533d:
    db   $c0, $12, $55, $ff, $ff, $ff, $ff, $ff        ;; 0b:533d ????????
    db   $ff, $f8, $12, $19, $55, $5e, $77, $ff        ;; 0b:5345 ????????
    db   $ff, $ff, $f0, $01, $54, $75, $87, $ff        ;; 0b:534d ????????
    db   $ff, $ff, $ff, $fc, $01, $17, $08, $54        ;; 0b:5355 ????????
    db   $75, $87, $ff, $ff, $e0, $00, $7e, $87        ;; 0b:535d ????????
    db   $ff, $ff, $ff, $ff, $ff, $fc, $00, $02        ;; 0b:5365 ????????
    db   $35, $76, $7e, $87, $ff, $ff, $fe, $01        ;; 0b:536d ????????
    db   $16, $35, $36, $76, $7e, $89, $ff, $c0        ;; 0b:5375 ????????
    db   $04, $88, $ff, $ff, $ff, $ff, $ff, $ff        ;; 0b:537d ????????
    db   $f8, $04, $00, $51, $7c, $88, $ff, $ff        ;; 0b:5385 ????????
    db   $ff, $fc, $04, $15, $55, $1a, $7c, $88        ;; 0b:538d ????????
    db   $ff, $ff, $e0, $05, $7d, $88, $ff, $ff        ;; 0b:5395 ????????
    db   $ff, $ff, $ff, $f8, $05, $01, $17, $7d        ;; 0b:539d ????????
    db   $88, $ff, $ff, $ff, $fc, $05, $18, $67        ;; 0b:53a5 ????????
    db   $31, $7d, $88, $ff, $ff, $c0, $01, $87        ;; 0b:53ad ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $f0, $01        ;; 0b:53b5 ????????
    db   $00, $19, $87, $ff, $ff, $ff, $ff, $fc        ;; 0b:53bd ????????
    db   $01, $19, $35, $4d, $75, $87, $ff, $ff        ;; 0b:53c5 ????????
    db   $f8, $35, $6a, $7e, $78, $87, $ff, $ff        ;; 0b:53cd ????????
    db   $ff, $fc, $35, $6a, $36, $7e, $78, $87        ;; 0b:53d5 ????????
    db   $ff, $ff, $e0, $0a, $5b, $86, $ff, $ff        ;; 0b:53dd ????????
    db   $ff, $ff, $ff, $f0, $0a, $4c, $5b, $86        ;; 0b:53e5 ????????
    db   $11, $ff, $ff, $ff, $fe, $13, $00, $66        ;; 0b:53ed ????????
    db   $55, $56, $75, $8c, $ff, $ff, $13, $68        ;; 0b:53f5 ????????
    db   $41, $66, $4d, $31, $75, $8c, $fe, $07        ;; 0b:53fd ????????
    db   $01, $52, $42, $17, $7e, $89, $ff, $fe        ;; 0b:5405 ????????
    db   $01, $52, $2d, $42, $17, $54, $7e, $ff        ;; 0b:540d ????????
    db   $fc, $09, $36, $3b, $6f, $76, $87, $ff        ;; 0b:5415 ????????
    db   $ff, $fe, $37, $50, $31, $3b, $36, $76        ;; 0b:541d ????????
    db   $87, $ff, $ff, $37, $50, $31, $3b, $09        ;; 0b:5425 ????????
    db   $36, $6f, $70, $fc, $04, $5a, $1a, $51        ;; 0b:542d ????????
    db   $79, $7c, $ff, $ff, $fe, $04, $5a, $1a        ;; 0b:5435 ????????
    db   $51, $38, $79, $7c, $ff, $ff, $04, $5a        ;; 0b:543d ????????
    db   $1a, $51, $39, $77, $79, $7c, $e0, $01        ;; 0b:5445 ????????
    db   $00, $86, $ff, $ff, $ff, $ff, $ff, $f8        ;; 0b:544d ????????
    db   $2b, $1c, $19, $57, $86, $ff, $ff, $ff        ;; 0b:5455 ????????
    db   $fe, $00, $2b, $1c, $19, $57, $4b, $86        ;; 0b:545d ????????
    db   $04, $f0, $06, $05, $32, $88, $ff, $ff        ;; 0b:5465 ????????
    db   $ff, $ff, $fc, $06, $2a, $33, $64, $77        ;; 0b:546d ????????
    db   $88, $ff, $ff, $ff, $06, $2a, $34, $05        ;; 0b:5475 ????????
    db   $64, $41, $80, $7f, $ff, $00, $01, $4d        ;; 0b:547d ????????
    db   $05, $47, $88, $8b, $8c, $fe, $01, $05        ;; 0b:5485 ????????
    db   $4d, $47, $65, $8b, $8c, $06, $f8, $57        ;; 0b:548d ????????
    db   $38, $64, $7f, $76, $ff, $ff, $ff, $fe        ;; 0b:5495 ????????
    db   $57, $38, $4f, $34, $6c, $7f, $76, $ff        ;; 0b:549d ????????
    db   $f0, $05, $27, $54, $75, $ff, $ff, $ff        ;; 0b:54a5 ????????
    db   $ff, $fc, $05, $27, $54, $41, $67, $75        ;; 0b:54ad ????????
    db   $ff, $ff, $e0, $06, $02, $87, $01, $ff        ;; 0b:54b5 ????????
    db   $ff, $ff, $ff, $f8, $06, $02, $32, $19        ;; 0b:54bd ????????
    db   $87, $01, $ff, $ff, $e0, $35, $1d, $64        ;; 0b:54c5 ????????
    db   $4f, $7b, $ff, $ff, $ff, $f8, $1d, $57        ;; 0b:54cd ????????
    db   $4f, $5d, $7b, $18, $ff, $ff, $fe, $33        ;; 0b:54d5 ????????
    db   $6a, $64, $18, $71, $88, $8c, $ff, $ff        ;; 0b:54dd ????????
    db   $33, $6a, $18, $65, $58, $64, $71, $8c        ;; 0b:54e5 ????????
    db   $fc, $01, $17, $18, $5b, $75, $86, $ff        ;; 0b:54ed ????????
    db   $ff, $ff, $08, $2c, $17, $5b, $4d, $48        ;; 0b:54f5 ????????
    db   $75, $86, $fe, $2c, $17, $4d, $64, $6f        ;; 0b:54fd ????????
    db   $72, $80, $18, $fe, $07, $52, $01, $17        ;; 0b:5505 ????????
    db   $32, $7a, $8a, $ff, $ff, $01, $52, $17        ;; 0b:550d ????????
    db   $2e, $33, $54, $7a, $8a, $fc, $01, $52        ;; 0b:5515 ????????
    db   $17, $2e, $34, $7a, $1d, $ff, $fc, $01        ;; 0b:551d ????????
    db   $00, $31, $7e, $78, $8b, $ff, $ff, $fc        ;; 0b:5525 ????????
    db   $01, $35, $05, $18, $7e, $8b, $14, $ff        ;; 0b:552d ????????
    db   $f8, $00, $01, $18, $7c, $8b, $1a, $06        ;; 0b:5535 ????????
    db   $1e, $f8, $28, $43, $05, $7c, $80, $ff        ;; 0b:553d ????????
    db   $ff, $ff, $fe, $28, $05, $1a, $39, $7c        ;; 0b:5545 ????????
    db   $7e, $72, $ff, $fc, $28, $05, $1a, $48        ;; 0b:554d ????????
    db   $72, $7b, $0d, $1c, $80, $13, $ff, $ff        ;; 0b:5555 ????????
    db   $ff, $ff, $ff, $ff, $ff, $80, $13, $6a        ;; 0b:555d ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $c0, $13        ;; 0b:5565 ????????
    db   $18, $6a, $ff, $ff, $ff, $ff, $ff, $e0        ;; 0b:556d ????????
    db   $13, $18, $5f, $6a, $ff, $ff, $ff, $ff        ;; 0b:5575 ????????
    db   $f0, $29, $18, $19, $5f, $6b, $ff, $ff        ;; 0b:557d ????????
    db   $ff, $c0, $15, $7d, $ff, $ff, $ff, $ff        ;; 0b:5585 ????????
    db   $ff, $ff, $e0, $15, $1b, $7d, $ff, $ff        ;; 0b:558d ????????
    db   $ff, $ff, $ff, $e0, $15, $1b, $7d, $4b        ;; 0b:5595 ????????
    db   $ff, $ff, $ff, $ff, $f0, $16, $6b, $1b        ;; 0b:559d ????????
    db   $7d, $45, $ff, $ff, $ff, $f8, $16, $6b        ;; 0b:55a5 ????????
    db   $19, $1b, $7d, $5a, $ff, $ff, $c0, $13        ;; 0b:55ad ??????.w
    db   $7e, $ff, $ff, $ff, $ff, $ff, $ff, $f0        ;; 0b:55b5 ..??????
    db   $13, $1f, $77, $7e, $ff, $ff, $ff, $ff        ;; 0b:55bd ????????
    db   $f8, $13, $1f, $63, $77, $7e, $11, $ff        ;; 0b:55c5 ????????
    db   $ff, $e0, $1f, $63, $77, $12, $11, $13        ;; 0b:55cd ????????
    db   $ff, $ff, $e0, $1f, $63, $77, $12, $10        ;; 0b:55d5 ????????
    db   $11, $13, $ff, $80, $1a, $ff, $ff, $ff        ;; 0b:55dd ???.w.??
    db   $ff, $ff, $ff, $ff, $c0, $1a, $7c, $00        ;; 0b:55e5 ????????
    db   $ff, $ff, $ff, $ff, $ff, $e0, $1a, $61        ;; 0b:55ed ????????
    db   $7c, $00, $ff, $ff, $ff, $ff, $e0, $1a        ;; 0b:55f5 ????????
    db   $61, $7c, $10, $00, $ff, $ff, $ff, $f0        ;; 0b:55fd ????????
    db   $00, $1a, $61, $7c, $10, $00, $ff, $ff        ;; 0b:5605 ????????
    db   $fc, $05, $17, $54, $66, $4c, $72, $ff        ;; 0b:560d ????????
    db   $ff, $fc, $05, $17, $54, $66, $4c, $72        ;; 0b:5615 ????????
    db   $10, $ff, $fc, $05, $17, $54, $66, $4c        ;; 0b:561d ????????
    db   $72, $10, $12, $fc, $05, $17, $54, $66        ;; 0b:5625 ????????
    db   $4c, $72, $14, $13, $fc, $05, $17, $54        ;; 0b:562d ????????
    db   $66, $4c, $72, $14, $17, $fc, $06, $05        ;; 0b:5635 ????????
    db   $18, $32, $65, $8a, $ff, $ff, $fc, $06        ;; 0b:563d ????????
    db   $05, $18, $32, $65, $8a, $ff, $ff, $fe        ;; 0b:5645 ????????
    db   $06, $05, $18, $38, $65, $45, $8a, $ff        ;; 0b:564d ????????
    db   $fe, $06, $05, $18, $34, $65, $45, $8a        ;; 0b:5655 ????????
    db   $ff, $ff, $06, $05, $18, $34, $39, $65        ;; 0b:565d ????????
    db   $45, $8a, $c0, $04, $80, $12, $11, $00        ;; 0b:5665 ????????
    db   $ff, $ff, $ff, $c0, $04, $80, $12, $11        ;; 0b:566d ????????
    db   $13, $00, $ff, $ff, $c0, $80, $73, $12        ;; 0b:5675 ????????
    db   $11, $14, $00, $ff, $ff, $c0, $80, $73        ;; 0b:567d ????????
    db   $12, $11, $14, $17, $00, $ff, $c0, $80        ;; 0b:5685 ????????
    db   $73, $16, $11, $14, $17, $06, $08, $f8        ;; 0b:568d ????????
    db   $00, $01, $66, $5d, $7c, $ff, $ff, $ff        ;; 0b:5695 ????????
    db   $fc, $00, $01, $1a, $66, $5d, $7c, $ff        ;; 0b:569d ????????
    db   $ff, $fc, $00, $01, $1a, $55, $66, $7c        ;; 0b:56a5 ????????
    db   $ff, $ff, $fe, $00, $01, $1a, $55, $66        ;; 0b:56ad ????????
    db   $4f, $7c, $ff, $ff, $00, $01, $1a, $62        ;; 0b:56b5 ????????
    db   $55, $66, $4f, $7c, $c0, $28, $88, $ff        ;; 0b:56bd ????????
    db   $ff, $ff, $ff, $ff, $ff, $e0, $28, $05        ;; 0b:56c5 ????????
    db   $7d, $ff, $ff, $ff, $ff, $ff, $e0, $28        ;; 0b:56cd ????????
    db   $68, $7d, $ff, $ff, $ff, $ff, $ff, $f8        ;; 0b:56d5 ????????
    db   $68, $43, $5f, $7d, $7a, $3d, $ff, $ff        ;; 0b:56dd ????????
    db   $fc, $68, $43, $5f, $6c, $7d, $7a, $37        ;; 0b:56e5 ????????
    db   $ff, $c0, $16, $88, $ff, $ff, $ff, $ff        ;; 0b:56ed ????????
    db   $ff, $ff, $f0, $16, $33, $7f, $88, $ff        ;; 0b:56f5 ????????
    db   $ff, $ff, $ff                                 ;; 0b:56fd ???

data_0b_5700:
    db   $fc, $16, $33, $58, $56, $7f, $88, $ff        ;; 0b:5700 ????????
    db   $ff, $fc, $16, $33, $58, $4c, $56, $7f        ;; 0b:5708 ????????
    db   $14, $ff, $fc, $16, $34, $58, $4c, $56        ;; 0b:5710 ????????
    db   $7f, $1a, $04, $f0, $14, $5e, $7d, $89        ;; 0b:5718 ????????
    db   $ff, $ff, $ff, $ff, $f8, $14, $55, $5e        ;; 0b:5720 ????????
    db   $7d, $89, $ff, $ff, $ff, $e0, $03, $50        ;; 0b:5728 ????????
    db   $77, $10, $ff, $ff, $ff, $ff, $f0, $03        ;; 0b:5730 ????????
    db   $50, $3a, $77, $ff, $ff, $ff, $ff, $fc        ;; 0b:5738 ????????

data_0b_5740:
    db   $14, $1d, $55, $50, $7d, $89, $4e, $ff        ;; 0b:5740 ????????
    db   $fc, $14, $1d, $58, $50, $3a, $70, $4f        ;; 0b:5748 ????????
    db   $ff, $f8, $03, $50, $66, $7c, $73, $14        ;; 0b:5750 ????????
    db   $ff, $ff, $f0, $03, $80, $7c, $73, $1a        ;; 0b:5758 ????????
    db   $17, $1d, $52, $fe, $31, $65, $1d, $58        ;; 0b:5760 ????????
    db   $4b, $6f, $70, $1f, $e0, $27, $80, $73        ;; 0b:5768 ????????
    db   $1a, $06, $17, $1d, $52, $80, $12, $ff        ;; 0b:5770 ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $c0, $12        ;; 0b:5778 ????????

data_0b_5780:
    db   $6b, $03, $ff, $ff, $ff, $ff, $ff, $c0        ;; 0b:5780 ????????
    db   $14, $6b, $05, $01, $ff, $ff, $ff, $ff        ;; 0b:5788 ????????

data_0b_5790:
    db   $c0, $6b, $14, $57, $05, $01, $ff, $ff        ;; 0b:5790 ????????
    db   $ff, $60, $6b, $14, $57, $06, $05, $01        ;; 0b:5798 ????????

data_0b_57a0:
    db   $ff, $ff, $c0, $13, $78, $ff, $ff, $ff        ;; 0b:57a0 ????????
    db   $ff, $ff, $ff, $c0, $13, $78, $41, $ff        ;; 0b:57a8 ????????

data_0b_57b0:
    db   $ff, $ff, $ff, $ff, $e0, $13, $5f, $78        ;; 0b:57b0 ????????
    db   $41, $ff, $ff, $ff, $ff, $e0, $27, $20        ;; 0b:57b8 ????????
    db   $78, $41, $ff, $ff, $ff, $ff, $f0, $27        ;; 0b:57c0 ????????
    db   $5f, $20, $78, $41, $ff, $ff, $ff, $f0        ;; 0b:57c8 ????????
    db   $12, $14, $74, $88, $61, $62, $ff, $ff        ;; 0b:57d0 ????????
    db   $f0, $12, $14, $74, $86, $5e, $62, $ff        ;; 0b:57d8 ????????
    db   $ff, $f0, $12, $14, $74, $86, $01, $00        ;; 0b:57e0 ????????
    db   $5e, $62, $f0, $12, $14, $74, $86, $01        ;; 0b:57e8 ????????
    db   $00, $5e, $63, $f0, $12, $14, $74, $86        ;; 0b:57f0 ????????
    db   $01, $00, $5e, $64, $f8, $15, $0b, $1e        ;; 0b:57f8 ????????
    db   $58, $79, $ff, $ff, $ff, $fc, $15, $0b        ;; 0b:5800 ????????
    db   $1e, $58, $31, $79, $ff, $ff, $fe, $15        ;; 0b:5808 ????????
    db   $0b, $1e, $58, $31, $6d, $79, $ff, $fe        ;; 0b:5810 ????????
    db   $15, $0b, $1e, $58, $31, $50, $79, $ff        ;; 0b:5818 ????????
    db   $ff, $15, $0b, $1e, $58, $31, $50, $45        ;; 0b:5820 ????????
    db   $71, $c0, $00, $74, $ff, $ff, $ff, $ff        ;; 0b:5828 ????????
    db   $ff, $ff, $e0, $61, $46, $74, $56, $ff        ;; 0b:5830 ????????
    db   $ff, $ff, $ff, $f0, $61, $46, $59, $74        ;; 0b:5838 ????????
    db   $56, $ff, $ff, $ff, $f0, $61, $46, $59        ;; 0b:5840 ????????
    db   $74, $56, $0b, $ff, $ff, $f8, $18, $68        ;; 0b:5848 ????????
    db   $61, $46, $74, $58, $07, $0b, $f0, $14        ;; 0b:5850 ????????
    db   $15, $62, $86, $ff, $ff, $ff, $ff, $fc        ;; 0b:5858 ????????
    db   $14, $0b, $15, $51, $62, $86, $ff, $ff        ;; 0b:5860 ????????
    db   $fe, $14, $0b, $15, $51, $62, $6d, $81        ;; 0b:5868 ????????
    db   $ff, $fe, $0b, $41, $29, $51, $62, $6d        ;; 0b:5870 ????????
    db   $81, $16, $fc, $0b, $41, $29, $47, $6f        ;; 0b:5878 ????????
    db   $81, $35, $17, $80, $21, $ff, $ff, $ff        ;; 0b:5880 ????????
    db   $ff, $ff, $ff, $ff, $e0, $21, $60, $7e        ;; 0b:5888 ????????
    db   $ff, $ff, $ff, $ff, $ff, $f0, $21, $11        ;; 0b:5890 ????????
    db   $60, $7e, $ff, $ff, $ff, $ff, $f8, $11        ;; 0b:5898 ????????
    db   $21, $60, $53, $7e, $ff, $ff, $ff, $fc        ;; 0b:58a0 ????????
    db   $11, $21, $60, $53, $6f, $7e, $ff, $ff        ;; 0b:58a8 ????????
    db   $c0, $0f, $87, $ff, $ff, $ff, $ff, $ff        ;; 0b:58b0 ????????
    db   $ff, $e0, $0f, $10, $87, $ff, $ff, $ff        ;; 0b:58b8 ????????
    db   $ff, $ff, $f0, $0f, $10, $6e, $87, $ff        ;; 0b:58c0 ????????
    db   $ff, $ff, $ff, $f8, $0f, $10, $0e, $6e        ;; 0b:58c8 ????????
    db   $87, $ff, $ff, $ff, $fc, $0f, $10, $0e        ;; 0b:58d0 ????????
    db   $5c, $6e, $87, $ff, $ff, $fc, $11, $23        ;; 0b:58d8 ????????
    db   $53, $6e, $74, $81, $ff, $ff, $fe, $11        ;; 0b:58e0 ????????
    db   $23, $53, $6d, $6e, $74, $81, $ff, $fe        ;; 0b:58e8 ????????
    db   $11, $23, $53, $44, $6e, $74, $81, $ff        ;; 0b:58f0 ????????
    db   $ff, $44, $11, $23, $10, $49, $6e, $74        ;; 0b:58f8 ????????
    db   $81, $ff, $44, $11, $23, $10, $49, $6d        ;; 0b:5900 ????????
    db   $6e, $81, $f8, $2f, $21, $6f, $7d, $86        ;; 0b:5908 ????????
    db   $ff, $ff, $ff, $f8, $2f, $21, $6f, $7d        ;; 0b:5910 ????????
    db   $86, $ff, $ff, $ff, $f8, $2f, $21, $6f        ;; 0b:5918 ????????
    db   $7d, $86, $ff, $ff, $ff, $fc, $2f, $21        ;; 0b:5920 ????????
    db   $3b, $6f, $7d, $86, $ff, $ff, $fc, $30        ;; 0b:5928 ????????
    db   $21, $3b, $6f, $7d, $86, $ff, $ff, $c0        ;; 0b:5930 ????????
    db   $0c, $76, $ff, $ff, $ff, $ff, $ff, $ff        ;; 0b:5938 ????????
    db   $f0, $0c, $21, $76, $8a, $ff, $ff, $ff        ;; 0b:5940 ????????
    db   $ff, $fc, $0c, $21, $5c, $7a, $76, $8a        ;; 0b:5948 ????????
    db   $ff, $ff, $fc, $26, $21, $4e, $24, $7a        ;; 0b:5950 ????????
    db   $76, $5e, $ff, $fc, $26, $21, $4e, $24        ;; 0b:5958 ????????
    db   $7a, $76, $5f, $ff, $f0, $23, $22, $0d        ;; 0b:5960 ????????
    db   $7c, $ff, $ff, $ff, $ff, $fc, $23, $22        ;; 0b:5968 ????????
    db   $0d, $11, $44, $7c, $ff, $ff, $fc, $23        ;; 0b:5970 ????????
    db   $69, $10, $24, $5c, $77, $ff, $ff, $fe        ;; 0b:5978 ????????
    db   $23, $69, $10, $24, $5c, $25, $77, $ff        ;; 0b:5980 ????????
    db   $ff, $10, $69, $23, $25, $44, $6f, $6d        ;; 0b:5988 ????????
    db   $7b, $f8, $00, $0b, $64, $38, $70, $ff        ;; 0b:5990 ????????
    db   $ff, $ff, $ff, $12, $29, $64, $5f, $6c        ;; 0b:5998 ????????
    db   $70, $78, $72, $f0, $73, $77, $78, $7b        ;; 0b:59a0 ????????
    db   $12, $14, $10, $11, $ff, $18, $1c, $19        ;; 0b:59a8 ????????
    db   $67, $42, $70, $7a, $7b, $f8, $12, $14        ;; 0b:59b0 ????????
    db   $5b, $7e, $70, $12, $ff, $ff, $f8, $0a        ;; 0b:59b8 ????????
    db   $17, $66, $1c, $70, $ff, $ff, $ff, $f8        ;; 0b:59c0 ????????
    db   $16, $18, $4c, $7c, $70, $06, $ff, $ff        ;; 0b:59c8 ????????
    db   $e0, $39, $5d, $83, $16, $02, $ff, $ff        ;; 0b:59d0 ????????
    db   $ff, $f0, $2a, $13, $62, $84, $24, $1a        ;; 0b:59d8 ????????
    db   $07, $ff, $f0, $17, $40, $1d, $70, $28        ;; 0b:59e0 ????????
    db   $ff, $ff, $ff, $f8, $00, $3d, $02, $5b        ;; 0b:59e8 ????????
    db   $82, $2a, $ff, $ff, $f0, $08, $4d, $50        ;; 0b:59f0 ????????
    db   $85, $0f, $ff, $ff, $ff, $f8, $05, $11        ;; 0b:59f8 ????????
    db   $3e, $70, $7b, $0e, $1e, $ff, $f8, $64        ;; 0b:5a00 ????????
    db   $38, $1d, $58, $70, $4d, $ff, $ff, $e0        ;; 0b:5a08 ????????
    db   $3c, $70, $73, $2f, $0e, $2d, $ff, $ff        ;; 0b:5a10 ????????

call_0b_5a18:
    ld   A, [wCEDA]                                    ;; 0b:5a18 $fa $da $ce
    inc  A                                             ;; 0b:5a1b $3c
    jp   Z, .jp_0b_5b76                                ;; 0b:5a1c $ca $76 $5b
    ld   HL, wCC30                                     ;; 0b:5a1f $21 $30 $cc
    ld   B, $29                                        ;; 0b:5a22 $06 $29
    xor  A, A                                          ;; 0b:5a24 $af
    call call_00_3934                                  ;; 0b:5a25 $cd $34 $39
    ld   HL, wCC59                                     ;; 0b:5a28 $21 $59 $cc
    ld   DE, wCC30                                     ;; 0b:5a2b $11 $30 $cc
    ld   B, $03                                        ;; 0b:5a2e $06 $03
.jr_0b_5a30:
    ld   A, [HL+]                                      ;; 0b:5a30 $2a
    cp   A, $ff                                        ;; 0b:5a31 $fe $ff
    jr   Z, .jr_0b_5a4b                                ;; 0b:5a33 $28 $16
    push HL                                            ;; 0b:5a35 $e5
    ld   HL, data_0b_4301                              ;; 0b:5a36 $21 $01 $43
    rst  add_hl_a                                      ;; 0b:5a39 $c7
    ld   A, [HL]                                       ;; 0b:5a3a $7e
    and  A, $f8                                        ;; 0b:5a3b $e6 $f8
    srl  A                                             ;; 0b:5a3d $cb $3f
    srl  A                                             ;; 0b:5a3f $cb $3f
    srl  A                                             ;; 0b:5a41 $cb $3f
    ld   HL, data_0b_43cc                              ;; 0b:5a43 $21 $cc $43
    rst  add_hl_a                                      ;; 0b:5a46 $c7
    ld   A, [HL]                                       ;; 0b:5a47 $7e
    and  A, $0f                                        ;; 0b:5a48 $e6 $0f
    pop  HL                                            ;; 0b:5a4a $e1
.jr_0b_5a4b:
    inc  A                                             ;; 0b:5a4b $3c
    ld   [DE], A                                       ;; 0b:5a4c $12
    inc  DE                                            ;; 0b:5a4d $13
    dec  B                                             ;; 0b:5a4e $05
    jr   NZ, .jr_0b_5a30                               ;; 0b:5a4f $20 $df
    ld   DE, wCC30                                     ;; 0b:5a51 $11 $30 $cc
    ld   HL, wCC3B                                     ;; 0b:5a54 $21 $3b $cc
    ld   B, $03                                        ;; 0b:5a57 $06 $03
.jr_0b_5a59:
    ld   A, [DE]                                       ;; 0b:5a59 $1a
    inc  DE                                            ;; 0b:5a5a $13
    push HL                                            ;; 0b:5a5b $e5
    ld   HL, data_0b_5bd8                              ;; 0b:5a5c $21 $d8 $5b
    rst  add_hl_a                                      ;; 0b:5a5f $c7
    ld   A, [HL]                                       ;; 0b:5a60 $7e
    pop  HL                                            ;; 0b:5a61 $e1
    ld   C, A                                          ;; 0b:5a62 $4f
    swap A                                             ;; 0b:5a63 $cb $37
    and  A, $0f                                        ;; 0b:5a65 $e6 $0f
    inc  A                                             ;; 0b:5a67 $3c
    ld   [HL+], A                                      ;; 0b:5a68 $22
    ld   A, C                                          ;; 0b:5a69 $79
    and  A, $0f                                        ;; 0b:5a6a $e6 $0f
    inc  A                                             ;; 0b:5a6c $3c
    ld   [HL+], A                                      ;; 0b:5a6d $22
    dec  B                                             ;; 0b:5a6e $05
    jr   NZ, .jr_0b_5a59                               ;; 0b:5a6f $20 $e8
    ldh  A, [hFFCA]                                    ;; 0b:5a71 $f0 $ca
    sla  A                                             ;; 0b:5a73 $cb $27
    ld   A, [wCC5D]                                    ;; 0b:5a75 $fa $5d $cc
    jr   NC, .jr_0b_5a9a                               ;; 0b:5a78 $30 $20
    and  A, $3f                                        ;; 0b:5a7a $e6 $3f
    ld   B, A                                          ;; 0b:5a7c $47
    ld   DE, wCC59                                     ;; 0b:5a7d $11 $59 $cc
    ld   HL, wCC33                                     ;; 0b:5a80 $21 $33 $cc
    ld   C, $03                                        ;; 0b:5a83 $0e $03
.jr_0b_5a85:
    ld   A, [DE]                                       ;; 0b:5a85 $1a
    inc  DE                                            ;; 0b:5a86 $13
    inc  A                                             ;; 0b:5a87 $3c
    jr   Z, .jr_0b_5a90                                ;; 0b:5a88 $28 $06
    ld   A, B                                          ;; 0b:5a8a $78
    swap A                                             ;; 0b:5a8b $cb $37
    and  A, $03                                        ;; 0b:5a8d $e6 $03
    inc  A                                             ;; 0b:5a8f $3c
.jr_0b_5a90:
    ld   [HL+], A                                      ;; 0b:5a90 $22
    sla  B                                             ;; 0b:5a91 $cb $20
    sla  B                                             ;; 0b:5a93 $cb $20
    dec  C                                             ;; 0b:5a95 $0d
    jr   NZ, .jr_0b_5a85                               ;; 0b:5a96 $20 $ed
    jr   .jr_0b_5b0b                                   ;; 0b:5a98 $18 $71
.jr_0b_5a9a:
    and  A, $c0                                        ;; 0b:5a9a $e6 $c0
    swap A                                             ;; 0b:5a9c $cb $37
    srl  A                                             ;; 0b:5a9e $cb $3f
    srl  A                                             ;; 0b:5aa0 $cb $3f
    inc  A                                             ;; 0b:5aa2 $3c
    ld   D, A                                          ;; 0b:5aa3 $57
    call call_00_1d2e                                  ;; 0b:5aa4 $cd $2e $1d
    inc  A                                             ;; 0b:5aa7 $3c
    ld   [wCC33], A                                    ;; 0b:5aa8 $ea $33 $cc
    ld   E, A                                          ;; 0b:5aab $5f
    ld   A, [wCC3B]                                    ;; 0b:5aac $fa $3b $cc
    ld   L, A                                          ;; 0b:5aaf $6f
    xor  A, A                                          ;; 0b:5ab0 $af
    ld   H, A                                          ;; 0b:5ab1 $67
    ld   D, A                                          ;; 0b:5ab2 $57
    call call_00_1c7e                                  ;; 0b:5ab3 $cd $7e $1c
    ld   A, $14                                        ;; 0b:5ab6 $3e $14
    sub  A, E                                          ;; 0b:5ab8 $93
    ld   L, A                                          ;; 0b:5ab9 $6f
    ld   A, [wCC3D]                                    ;; 0b:5aba $fa $3d $cc
    ld   E, A                                          ;; 0b:5abd $5f
    ld   A, [wCC30]                                    ;; 0b:5abe $fa $30 $cc
    cp   A, $02                                        ;; 0b:5ac1 $fe $02
    jr   Z, .jr_0b_5ad5                                ;; 0b:5ac3 $28 $10
    cp   A, $04                                        ;; 0b:5ac5 $fe $04
    jr   NC, .jr_0b_5ad5                               ;; 0b:5ac7 $30 $0c
    ld   A, [wCC31]                                    ;; 0b:5ac9 $fa $31 $cc
    dec  A                                             ;; 0b:5acc $3d
    jr   Z, .jr_0b_5ad3                                ;; 0b:5acd $28 $04
    cp   A, $02                                        ;; 0b:5acf $fe $02
    jr   NZ, .jr_0b_5ad5                               ;; 0b:5ad1 $20 $02
.jr_0b_5ad3:
    dec  L                                             ;; 0b:5ad3 $2d
    dec  L                                             ;; 0b:5ad4 $2d
.jr_0b_5ad5:
    xor  A, A                                          ;; 0b:5ad5 $af
    ld   H, A                                          ;; 0b:5ad6 $67
    ld   D, A                                          ;; 0b:5ad7 $57
    call call_00_1c9c                                  ;; 0b:5ad8 $cd $9c $1c
    ld   A, L                                          ;; 0b:5adb $7d
    ld   [wCC3A], A                                    ;; 0b:5adc $ea $3a $cc
    ld   HL, wCC34                                     ;; 0b:5adf $21 $34 $cc
    ld   A, [wCC5A]                                    ;; 0b:5ae2 $fa $5a $cc
    inc  A                                             ;; 0b:5ae5 $3c
    jr   Z, .jr_0b_5b09                                ;; 0b:5ae6 $28 $21
    ld   A, [wCC3A]                                    ;; 0b:5ae8 $fa $3a $cc
    and  A, A                                          ;; 0b:5aeb $a7
    jr   Z, .jr_0b_5b09                                ;; 0b:5aec $28 $1b
    inc  A                                             ;; 0b:5aee $3c
    ld   D, A                                          ;; 0b:5aef $57
    call call_00_1d2e                                  ;; 0b:5af0 $cd $2e $1d
    and  A, A                                          ;; 0b:5af3 $a7
    jr   Z, .jr_0b_5b09                                ;; 0b:5af4 $28 $13
    ld   B, A                                          ;; 0b:5af6 $47
    ld   D, A                                          ;; 0b:5af7 $57
    call call_00_1d2e                                  ;; 0b:5af8 $cd $2e $1d
    inc  A                                             ;; 0b:5afb $3c
    ld   C, A                                          ;; 0b:5afc $4f
    ld   [HL+], A                                      ;; 0b:5afd $22
    ld   A, [wCC5B]                                    ;; 0b:5afe $fa $5b $cc
    inc  A                                             ;; 0b:5b01 $3c
    jr   Z, .jr_0b_5b0a                                ;; 0b:5b02 $28 $06
    ld   A, B                                          ;; 0b:5b04 $78
    sub  A, C                                          ;; 0b:5b05 $91
    ld   [HL+], A                                      ;; 0b:5b06 $22
    jr   .jr_0b_5b0b                                   ;; 0b:5b07 $18 $02
.jr_0b_5b09:
    ld   [HL+], A                                      ;; 0b:5b09 $22
.jr_0b_5b0a:
    ld   [HL+], A                                      ;; 0b:5b0a $22
.jr_0b_5b0b:
    dec  HL                                            ;; 0b:5b0b $2b
    ld   A, [HL-]                                      ;; 0b:5b0c $3a
    add  A, [HL]                                       ;; 0b:5b0d $86
    ld   C, A                                          ;; 0b:5b0e $4f
    dec  HL                                            ;; 0b:5b0f $2b
    ld   A, [HL]                                       ;; 0b:5b10 $7e
    ld   HL, wCC39                                     ;; 0b:5b11 $21 $39 $cc
    ld   [HL+], A                                      ;; 0b:5b14 $22
    ld   [HL], C                                       ;; 0b:5b15 $71
    ld   HL, wCC3B                                     ;; 0b:5b16 $21 $3b $cc
    ld   DE, wCC33                                     ;; 0b:5b19 $11 $33 $cc
    ld   BC, $300                                      ;; 0b:5b1c $01 $00 $03
.jr_0b_5b1f:
    ld   A, [HL+]                                      ;; 0b:5b1f $2a
    inc  HL                                            ;; 0b:5b20 $23
    push HL                                            ;; 0b:5b21 $e5
    ld   L, A                                          ;; 0b:5b22 $6f
    ld   A, [DE]                                       ;; 0b:5b23 $1a
    inc  DE                                            ;; 0b:5b24 $13
    push DE                                            ;; 0b:5b25 $d5
    ld   E, A                                          ;; 0b:5b26 $5f
    xor  A, A                                          ;; 0b:5b27 $af
    ld   H, A                                          ;; 0b:5b28 $67
    ld   D, A                                          ;; 0b:5b29 $57
    call call_00_1c7e                                  ;; 0b:5b2a $cd $7e $1c
    ld   A, E                                          ;; 0b:5b2d $7b
    pop  DE                                            ;; 0b:5b2e $d1
    pop  HL                                            ;; 0b:5b2f $e1
    add  A, C                                          ;; 0b:5b30 $81
    ld   C, A                                          ;; 0b:5b31 $4f
    dec  B                                             ;; 0b:5b32 $05
    jr   NZ, .jr_0b_5b1f                               ;; 0b:5b33 $20 $ea
    ld   A, $14                                        ;; 0b:5b35 $3e $14
    sub  A, C                                          ;; 0b:5b37 $91
    srl  A                                             ;; 0b:5b38 $cb $3f
    ld   C, A                                          ;; 0b:5b3a $4f
    ld   HL, wCC41                                     ;; 0b:5b3b $21 $41 $cc
    xor  A, A                                          ;; 0b:5b3e $af
    call call_0b_5b98                                  ;; 0b:5b3f $cd $98 $5b
    ld   A, [wCC3B]                                    ;; 0b:5b42 $fa $3b $cc
    call call_0b_5bb3                                  ;; 0b:5b45 $cd $b3 $5b
    ld   A, $01                                        ;; 0b:5b48 $3e $01
    call call_0b_5b98                                  ;; 0b:5b4a $cd $98 $5b
    ld   A, [wCC3D]                                    ;; 0b:5b4d $fa $3d $cc
    call call_0b_5bb3                                  ;; 0b:5b50 $cd $b3 $5b
    ld   A, $02                                        ;; 0b:5b53 $3e $02
    call call_0b_5b98                                  ;; 0b:5b55 $cd $98 $5b
    ld   A, [wCC3F]                                    ;; 0b:5b58 $fa $3f $cc
    call call_0b_5bb3                                  ;; 0b:5b5b $cd $b3 $5b
    ld   HL, wCC51                                     ;; 0b:5b5e $21 $51 $cc
    ld   DE, wCC30                                     ;; 0b:5b61 $11 $30 $cc
    ld   A, [wCC36]                                    ;; 0b:5b64 $fa $36 $cc
    call call_0b_5bc8                                  ;; 0b:5b67 $cd $c8 $5b
    ld   A, [wCC37]                                    ;; 0b:5b6a $fa $37 $cc
    call call_0b_5bc8                                  ;; 0b:5b6d $cd $c8 $5b
    ld   A, [wCC38]                                    ;; 0b:5b70 $fa $38 $cc
    call call_0b_5bc8                                  ;; 0b:5b73 $cd $c8 $5b
.jp_0b_5b76:
    ld   HL, wCC5E                                     ;; 0b:5b76 $21 $5e $cc
    ld   DE, wCC36                                     ;; 0b:5b79 $11 $36 $cc
    ld   BC, $ff                                       ;; 0b:5b7c $01 $ff $00
    ld   A, $03                                        ;; 0b:5b7f $3e $03
.jr_0b_5b81:
    push AF                                            ;; 0b:5b81 $f5
    ld   A, [DE]                                       ;; 0b:5b82 $1a
    inc  DE                                            ;; 0b:5b83 $13
    inc  A                                             ;; 0b:5b84 $3c
.jr_0b_5b85:
    dec  A                                             ;; 0b:5b85 $3d
    jr   Z, .jr_0b_5b8c                                ;; 0b:5b86 $28 $04
    sla  C                                             ;; 0b:5b88 $cb $21
    jr   .jr_0b_5b85                                   ;; 0b:5b8a $18 $f9
.jr_0b_5b8c:
    ld   A, C                                          ;; 0b:5b8c $79
    cpl                                                ;; 0b:5b8d $2f
    push AF                                            ;; 0b:5b8e $f5
    xor  A, B                                          ;; 0b:5b8f $a8
    ld   [HL+], A                                      ;; 0b:5b90 $22
    pop  AF                                            ;; 0b:5b91 $f1
    ld   B, A                                          ;; 0b:5b92 $47
    pop  AF                                            ;; 0b:5b93 $f1
    dec  A                                             ;; 0b:5b94 $3d
    jr   NZ, .jr_0b_5b81                               ;; 0b:5b95 $20 $ea
    ret                                                ;; 0b:5b97 $c9

call_0b_5b98:
    push HL                                            ;; 0b:5b98 $e5
    ld   HL, wCC30                                     ;; 0b:5b99 $21 $30 $cc
    rst  add_hl_a                                      ;; 0b:5b9c $c7
    ld   E, $00                                        ;; 0b:5b9d $1e $00
    ld   A, [HL+]                                      ;; 0b:5b9f $2a
    cp   A, $03                                        ;; 0b:5ba0 $fe $03
    jr   NC, .jr_0b_5ba5                               ;; 0b:5ba2 $30 $01
    inc  E                                             ;; 0b:5ba4 $1c
.jr_0b_5ba5:
    inc  HL                                            ;; 0b:5ba5 $23
    inc  HL                                            ;; 0b:5ba6 $23
    ld   A, [HL+]                                      ;; 0b:5ba7 $2a
    ld   B, A                                          ;; 0b:5ba8 $47
    dec  E                                             ;; 0b:5ba9 $1d
    jr   NZ, .jr_0b_5bad                               ;; 0b:5baa $20 $01
    add  A, A                                          ;; 0b:5bac $87
.jr_0b_5bad:
    inc  E                                             ;; 0b:5bad $1c
    inc  HL                                            ;; 0b:5bae $23
    inc  HL                                            ;; 0b:5baf $23
    ld   [HL], A                                       ;; 0b:5bb0 $77
    pop  HL                                            ;; 0b:5bb1 $e1
    ret                                                ;; 0b:5bb2 $c9

call_0b_5bb3:
    ld   D, A                                          ;; 0b:5bb3 $57
    inc  B                                             ;; 0b:5bb4 $04
.jr_0b_5bb5:
    dec  B                                             ;; 0b:5bb5 $05
    ret  Z                                             ;; 0b:5bb6 $c8
    ld   A, C                                          ;; 0b:5bb7 $79
    ld   [HL+], A                                      ;; 0b:5bb8 $22
    xor  A, A                                          ;; 0b:5bb9 $af
    ld   [HL+], A                                      ;; 0b:5bba $22
    add  A, E                                          ;; 0b:5bbb $83
    jr   Z, .jr_0b_5bc3                                ;; 0b:5bbc $28 $05
    ld   A, C                                          ;; 0b:5bbe $79
    ld   [HL+], A                                      ;; 0b:5bbf $22
    ld   A, $04                                        ;; 0b:5bc0 $3e $04
    ld   [HL+], A                                      ;; 0b:5bc2 $22
.jr_0b_5bc3:
    ld   A, D                                          ;; 0b:5bc3 $7a
    add  A, C                                          ;; 0b:5bc4 $81
    ld   C, A                                          ;; 0b:5bc5 $4f
    jr   .jr_0b_5bb5                                   ;; 0b:5bc6 $18 $ed

call_0b_5bc8:
    ld   B, A                                          ;; 0b:5bc8 $47
    ld   A, [DE]                                       ;; 0b:5bc9 $1a
    inc  DE                                            ;; 0b:5bca $13
    push HL                                            ;; 0b:5bcb $e5
    ld   HL, data_0b_5bd8                              ;; 0b:5bcc $21 $d8 $5b
    rst  add_hl_a                                      ;; 0b:5bcf $c7
    ld   A, [HL]                                       ;; 0b:5bd0 $7e
    pop  HL                                            ;; 0b:5bd1 $e1
    inc  B                                             ;; 0b:5bd2 $04
.jr_0b_5bd3:
    dec  B                                             ;; 0b:5bd3 $05
    ret  Z                                             ;; 0b:5bd4 $c8
    ld   [HL+], A                                      ;; 0b:5bd5 $22
    jr   .jr_0b_5bd3                                   ;; 0b:5bd6 $18 $fb

data_0b_5bd8:
    db   $ff, $33, $73, $37, $57, $77, $f7             ;; 0b:5bd8 ..?.???
    ld   A, [wCE88]                                    ;; 0b:5bdf $fa $88 $ce
    push AF                                            ;; 0b:5be2 $f5
    call call_0b_5d50                                  ;; 0b:5be3 $cd $50 $5d
    pop  AF                                            ;; 0b:5be6 $f1
    cp   A, $02                                        ;; 0b:5be7 $fe $02
    jp   Z, jp_0b_5cdf                                 ;; 0b:5be9 $ca $df $5c
    or   A, A                                          ;; 0b:5bec $b7
    jr   Z, .jr_0b_5c2b                                ;; 0b:5bed $28 $3c
    ld   A, $40                                        ;; 0b:5bef $3e $40
    ldh  [rWY], A                                      ;; 0b:5bf1 $e0 $4a
.jr_0b_5bf3:
    ld   A, $00                                        ;; 0b:5bf3 $3e $00
    rst  rst_00_0018                                   ;; 0b:5bf5 $df
    db   $79                                           ;; 0b:5bf6 .
    ld   A, [wC080]                                    ;; 0b:5bf7 $fa $80 $c0
    cp   A, $70                                        ;; 0b:5bfa $fe $70
    jr   C, .jr_0b_5c10                                ;; 0b:5bfc $38 $12
    jr   Z, .jr_0b_5c06                                ;; 0b:5bfe $28 $06
    ld   A, $03                                        ;; 0b:5c00 $3e $03
    rst  rst_00_0018                                   ;; 0b:5c02 $df
    db   $79                                           ;; 0b:5c03 ?
    jr   .jr_0b_5bf3                                   ;; 0b:5c04 $18 $ed
.jr_0b_5c06:
    xor  A, A                                          ;; 0b:5c06 $af
    ldh  [hFFBC], A                                    ;; 0b:5c07 $e0 $bc
    ld   HL, wD061                                     ;; 0b:5c09 $21 $61 $d0
    set  7, [HL]                                       ;; 0b:5c0c $cb $fe
    jr   .jr_0b_5c2b                                   ;; 0b:5c0e $18 $1b
.jr_0b_5c10:
    xor  A, A                                          ;; 0b:5c10 $af
    ld   [wCD36], A                                    ;; 0b:5c11 $ea $36 $cd
.jp_0b_5c14:
    call call_0b_5c5a                                  ;; 0b:5c14 $cd $5a $5c
    call call_0b_5de1                                  ;; 0b:5c17 $cd $e1 $5d
    jr   Z, .jr_0b_5c3a                                ;; 0b:5c1a $28 $1e
    ld   HL, wCD36                                     ;; 0b:5c1c $21 $36 $cd
    inc  [HL]                                          ;; 0b:5c1f $34
    ld   A, [HL]                                       ;; 0b:5c20 $7e
    cp   A, $04                                        ;; 0b:5c21 $fe $04
    jr   C, .jp_0b_5c14                                ;; 0b:5c23 $38 $ef
    jr   NZ, .jr_0b_5c2b                               ;; 0b:5c25 $20 $04
    rst  rst_00_0018                                   ;; 0b:5c27 $df
    db   $3c                                           ;; 0b:5c28 .
    jr   NZ, .jp_0b_5c14                               ;; 0b:5c29 $20 $e9
.jr_0b_5c2b:
    call call_0b_5e7b                                  ;; 0b:5c2b $cd $7b $5e
    call call_00_20cf                                  ;; 0b:5c2e $cd $cf $20
    ld   A, $8f                                        ;; 0b:5c31 $3e $8f
    ldh  [rWY], A                                      ;; 0b:5c33 $e0 $4a
    rst  rst_00_0018                                   ;; 0b:5c35 $df
    db   $38                                           ;; 0b:5c36 .
    jp   call_00_1df3                                  ;; 0b:5c37 $c3 $f3 $1d
.jr_0b_5c3a:
    ld   A, [wCD36]                                    ;; 0b:5c3a $fa $36 $cd
    or   A, A                                          ;; 0b:5c3d $b7
    jr   Z, .jr_0b_5bf3                                ;; 0b:5c3e $28 $b3
    dec  A                                             ;; 0b:5c40 $3d
    ld   [wCD36], A                                    ;; 0b:5c41 $ea $36 $cd
    rst  rst_00_0018                                   ;; 0b:5c44 $df
    db   $2f                                           ;; 0b:5c45 ?
    jr   NZ, .jr_0b_5c3a                               ;; 0b:5c46 $20 $f2
    call call_00_29ef                                  ;; 0b:5c48 $cd $ef $29
    or   A, A                                          ;; 0b:5c4b $b7
    jp   Z, .jp_0b_5c14                                ;; 0b:5c4c $ca $14 $5c
    cp   A, $03                                        ;; 0b:5c4f $fe $03
    jr   C, .jr_0b_5c3a                                ;; 0b:5c51 $38 $e7
    cp   A, $07                                        ;; 0b:5c53 $fe $07
    jr   NC, .jr_0b_5c3a                               ;; 0b:5c55 $30 $e3
    jp   .jp_0b_5c14                                   ;; 0b:5c57 $c3 $14 $5c

call_0b_5c5a:
    call call_00_29ef                                  ;; 0b:5c5a $cd $ef $29
    or   A, A                                          ;; 0b:5c5d $b7
    jr   Z, .jr_0b_5c6e                                ;; 0b:5c5e $28 $0e
    cp   A, $03                                        ;; 0b:5c60 $fe $03
    jr   C, .jr_0b_5c68                                ;; 0b:5c62 $38 $04
    cp   A, $07                                        ;; 0b:5c64 $fe $07
    jr   C, .jr_0b_5c6e                                ;; 0b:5c66 $38 $06
.jr_0b_5c68:
    ld   A, $fe                                        ;; 0b:5c68 $3e $fe
    ld   [wCDEA], A                                    ;; 0b:5c6a $ea $ea $cd
    ret                                                ;; 0b:5c6d $c9
.jr_0b_5c6e:
    rst  rst_00_0018                                   ;; 0b:5c6e $df
    db   $2f                                           ;; 0b:5c6f .
    jr   Z, .jr_0b_5c78                                ;; 0b:5c70 $28 $06
    ld   A, $03                                        ;; 0b:5c72 $3e $03
    ld   [wCDEA], A                                    ;; 0b:5c74 $ea $ea $cd
    ret                                                ;; 0b:5c77 $c9
.jr_0b_5c78:
    call call_0b_5cd9                                  ;; 0b:5c78 $cd $d9 $5c
    bit  0, [HL]                                       ;; 0b:5c7b $cb $46
    jr   NZ, .jr_0b_5ca1                               ;; 0b:5c7d $20 $22
.jr_0b_5c7f:
    call call_0b_5cc7                                  ;; 0b:5c7f $cd $c7 $5c
    call call_0b_5cd9                                  ;; 0b:5c82 $cd $d9 $5c
    res  0, [HL]                                       ;; 0b:5c85 $cb $86
    ld   A, $01                                        ;; 0b:5c87 $3e $01
    rst  rst_00_0018                                   ;; 0b:5c89 $df
    db   $79                                           ;; 0b:5c8a .
    jr   Z, call_0b_5cc7                               ;; 0b:5c8b $28 $3a
    cp   A, $04                                        ;; 0b:5c8d $fe $04
    jr   Z, .jr_0b_5ca1                                ;; 0b:5c8f $28 $10
    ld   HL, .data_0b_5c9d                             ;; 0b:5c91 $21 $9d $5c
    rst  add_hl_a                                      ;; 0b:5c94 $c7
    ld   A, [HL]                                       ;; 0b:5c95 $7e
    call call_0b_5dbf                                  ;; 0b:5c96 $cd $bf $5d
    jr   Z, .jr_0b_5c7f                                ;; 0b:5c99 $28 $e4
    jr   .jr_0b_5cc2                                   ;; 0b:5c9b $18 $25
.data_0b_5c9d:
    db   $07, $04, $05, $06                            ;; 0b:5c9d ....
.jr_0b_5ca1:
    call call_0b_5cc7                                  ;; 0b:5ca1 $cd $c7 $5c
    call call_0b_5cd9                                  ;; 0b:5ca4 $cd $d9 $5c
    set  0, [HL]                                       ;; 0b:5ca7 $cb $c6
    ld   A, $02                                        ;; 0b:5ca9 $3e $02
    rst  rst_00_0018                                   ;; 0b:5cab $df
    db   $79                                           ;; 0b:5cac ?
    jr   Z, call_0b_5cc7                               ;; 0b:5cad $28 $18
    cp   A, $04                                        ;; 0b:5caf $fe $04
    jr   Z, .jr_0b_5c7f                                ;; 0b:5cb1 $28 $cc
    or   A, A                                          ;; 0b:5cb3 $b7
    jr   Z, .jr_0b_5cbe                                ;; 0b:5cb4 $28 $08
    ld   A, $08                                        ;; 0b:5cb6 $3e $08
    rst  rst_00_0018                                   ;; 0b:5cb8 $df
    db   $79                                           ;; 0b:5cb9 ?
    jr   Z, .jr_0b_5ca1                                ;; 0b:5cba $28 $e5
    jr   .jr_0b_5cc2                                   ;; 0b:5cbc $18 $04
.jr_0b_5cbe:
    ld   A, $09                                        ;; 0b:5cbe $3e $09
    rst  rst_00_0018                                   ;; 0b:5cc0 $df
    db   $79                                           ;; 0b:5cc1 ?
.jr_0b_5cc2:
    ld   A, $01                                        ;; 0b:5cc2 $3e $01
    jp   call_0b_65e8                                  ;; 0b:5cc4 $c3 $e8 $65

call_0b_5cc7:
    ld   A, [wCD36]                                    ;; 0b:5cc7 $fa $36 $cd
    and  A, $01                                        ;; 0b:5cca $e6 $01
    xor  A, $01                                        ;; 0b:5ccc $ee $01
    inc  A                                             ;; 0b:5cce $3c
    ld   [wCDD7], A                                    ;; 0b:5ccf $ea $d7 $cd
    xor  A, A                                          ;; 0b:5cd2 $af
    call call_0b_65e8                                  ;; 0b:5cd3 $cd $e8 $65
    jp   jp_0b_5e93                                    ;; 0b:5cd6 $c3 $93 $5e

call_0b_5cd9:
    ld   DE, wCE00                                     ;; 0b:5cd9 $11 $00 $ce
    jp   call_0b_6072                                  ;; 0b:5cdc $c3 $72 $60

jp_0b_5cdf:
    ld   A, [wCEDA]                                    ;; 0b:5cdf $fa $da $ce
    inc  A                                             ;; 0b:5ce2 $3c
    jr   NZ, .jr_0b_5cfa                               ;; 0b:5ce3 $20 $15
    ld   A, [wCC59]                                    ;; 0b:5ce5 $fa $59 $cc
    cp   A, $c2                                        ;; 0b:5ce8 $fe $c2
    jr   Z, .jr_0b_5cf2                                ;; 0b:5cea $28 $06
    rst  rst_00_0018                                   ;; 0b:5cec $df
    db   $6b                                           ;; 0b:5ced ?
    rst  rst_00_0018                                   ;; 0b:5cee $df
    db   $6f                                           ;; 0b:5cef ?
    jr   .jr_0b_5cff                                   ;; 0b:5cf0 $18 $0d
.jr_0b_5cf2:
    ld   A, $78                                        ;; 0b:5cf2 $3e $78
    call call_00_3a6d                                  ;; 0b:5cf4 $cd $6d $3a
    jp   jp_00_0200                                    ;; 0b:5cf7 $c3 $00 $02
.jr_0b_5cfa:
    call call_00_39f3                                  ;; 0b:5cfa $cd $f3 $39
    rst  rst_00_0018                                   ;; 0b:5cfd $df
    db   $ba                                           ;; 0b:5cfe .
.jr_0b_5cff:
    ld   HL, wC501                                     ;; 0b:5cff $21 $01 $c5
    ld   B, $05                                        ;; 0b:5d02 $06 $05
.jr_0b_5d04:
    push HL                                            ;; 0b:5d04 $e5
    bit  7, [HL]                                       ;; 0b:5d05 $cb $7e
    jr   NZ, .jr_0b_5d13                               ;; 0b:5d07 $20 $0a
    ld   DE, $10                                       ;; 0b:5d09 $11 $10 $00
    add  HL, DE                                        ;; 0b:5d0c $19
    ld   A, [HL-]                                      ;; 0b:5d0d $3a
    or   A, [HL]                                       ;; 0b:5d0e $b6
    jr   Z, .jr_0b_5d17                                ;; 0b:5d0f $28 $06
    jr   .jr_0b_5d1c                                   ;; 0b:5d11 $18 $09
.jr_0b_5d13:
    ld   DE, $0f                                       ;; 0b:5d13 $11 $0f $00
    add  HL, DE                                        ;; 0b:5d16 $19
.jr_0b_5d17:
    ld   A, $01                                        ;; 0b:5d17 $3e $01
    ld   [HL+], A                                      ;; 0b:5d19 $22
    ld   [HL], $00                                     ;; 0b:5d1a $36 $00
.jr_0b_5d1c:
    pop  HL                                            ;; 0b:5d1c $e1
    ld   A, [HL]                                       ;; 0b:5d1d $7e
    and  A, $40                                        ;; 0b:5d1e $e6 $40
    ld   [HL], A                                       ;; 0b:5d20 $77
    ld   DE, $60                                       ;; 0b:5d21 $11 $60 $00
    add  HL, DE                                        ;; 0b:5d24 $19
    dec  B                                             ;; 0b:5d25 $05
    jr   NZ, .jr_0b_5d04                               ;; 0b:5d26 $20 $dc
    call call_00_20cf                                  ;; 0b:5d28 $cd $cf $20
    call call_00_3a4b                                  ;; 0b:5d2b $cd $4b $3a
    ld   A, $50                                        ;; 0b:5d2e $3e $50
    ldh  [rWY], A                                      ;; 0b:5d30 $e0 $4a
    xor  A, A                                          ;; 0b:5d32 $af
    ld   [wCD37], A                                    ;; 0b:5d33 $ea $37 $cd
    ld   A, [wCC59]                                    ;; 0b:5d36 $fa $59 $cc
    cp   A, $c2                                        ;; 0b:5d39 $fe $c2
    jr   NZ, .jr_0b_5d4d                               ;; 0b:5d3b $20 $10
    ld   [wCDC2], A                                    ;; 0b:5d3d $ea $c2 $cd
    xor  A, A                                          ;; 0b:5d40 $af
    ldh  [hFF8A], A                                    ;; 0b:5d41 $e0 $8a
    ldh  [hFF8B], A                                    ;; 0b:5d43 $e0 $8b
    ld   [wC6E3], A                                    ;; 0b:5d45 $ea $e3 $c6
    ld   A, $0d                                        ;; 0b:5d48 $3e $0d
    ld   [wCED9], A                                    ;; 0b:5d4a $ea $d9 $ce
.jr_0b_5d4d:
    jp   call_00_1df3                                  ;; 0b:5d4d $c3 $f3 $1d

call_0b_5d50:
    push AF                                            ;; 0b:5d50 $f5
    call call_00_1d98                                  ;; 0b:5d51 $cd $98 $1d
    ld   HL, wCE02                                     ;; 0b:5d54 $21 $02 $ce
    ld   DE, $03                                       ;; 0b:5d57 $11 $03 $00
    ld   A, $ff                                        ;; 0b:5d5a $3e $ff
    ld   B, $05                                        ;; 0b:5d5c $06 $05
.jr_0b_5d5e:
    ld   [HL+], A                                      ;; 0b:5d5e $22
    ld   [HL], A                                       ;; 0b:5d5f $77
    add  HL, DE                                        ;; 0b:5d60 $19
    dec  B                                             ;; 0b:5d61 $05
    jr   NZ, .jr_0b_5d5e                               ;; 0b:5d62 $20 $fa
    pop  AF                                            ;; 0b:5d64 $f1
    or   A, A                                          ;; 0b:5d65 $b7
    jr   Z, .jr_0b_5d9b                                ;; 0b:5d66 $28 $33
    ld   HL, wCDC3                                     ;; 0b:5d68 $21 $c3 $cd
    inc  [HL]                                          ;; 0b:5d6b $34
    jr   Z, .jr_0b_5d96                                ;; 0b:5d6c $28 $28
    dec  [HL]                                          ;; 0b:5d6e $35
    ld   HL, .data_0b_5dad                             ;; 0b:5d6f $21 $ad $5d
    ldh  A, [rWY]                                      ;; 0b:5d72 $f0 $4a
    cp   A, $58                                        ;; 0b:5d74 $fe $58
    jr   Z, .jr_0b_5d7c                                ;; 0b:5d76 $28 $04
    cp   A, $40                                        ;; 0b:5d78 $fe $40
    jr   NZ, .jr_0b_5d7f                               ;; 0b:5d7a $20 $03
.jr_0b_5d7c:
    call call_00_2766                                  ;; 0b:5d7c $cd $66 $27
.jr_0b_5d7f:
    call call_0b_4047                                  ;; 0b:5d7f $cd $47 $40
    rst  rst_00_0018                                   ;; 0b:5d82 $df
    db   $38                                           ;; 0b:5d83 .
    ld   HL, rLCDC                                     ;; 0b:5d84 $21 $40 $ff
    res  2, [HL]                                       ;; 0b:5d87 $cb $96
    rst  rst_00_0018                                   ;; 0b:5d89 $df
    db   $0b                                           ;; 0b:5d8a .
    call call_0b_5dae                                  ;; 0b:5d8b $cd $ae $5d
    ld   A, $08                                        ;; 0b:5d8e $3e $08
    ld   [wC089], A                                    ;; 0b:5d90 $ea $89 $c0
    ld   [wC08D], A                                    ;; 0b:5d93 $ea $8d $c0
.jr_0b_5d96:
    rst  rst_00_0018                                   ;; 0b:5d96 $df
    db   $18                                           ;; 0b:5d97 .
    jp   jp_0b_6906                                    ;; 0b:5d98 $c3 $06 $69
.jr_0b_5d9b:
    call call_0b_6ed1                                  ;; 0b:5d9b $cd $d1 $6e
    ld   [wCD37], A                                    ;; 0b:5d9e $ea $37 $cd
    ld   [wC081], A                                    ;; 0b:5da1 $ea $81 $c0
    rst  rst_00_0018                                   ;; 0b:5da4 $df
    db   $38                                           ;; 0b:5da5 .
    ld   A, $07                                        ;; 0b:5da6 $3e $07
    ldh  [rWX], A                                      ;; 0b:5da8 $e0 $4b
    jp   call_00_3a44                                  ;; 0b:5daa $c3 $44 $3a
.data_0b_5dad:
    db   $3c                                           ;; 0b:5dad .

call_0b_5dae:
    ld   B, $05                                        ;; 0b:5dae $06 $05
.jr_0b_5db0:
    ld   A, B                                          ;; 0b:5db0 $78
    dec  A                                             ;; 0b:5db1 $3d
    ld   [wCD36], A                                    ;; 0b:5db2 $ea $36 $cd
    push BC                                            ;; 0b:5db5 $c5
    xor  A, A                                          ;; 0b:5db6 $af
    call call_0b_65e8                                  ;; 0b:5db7 $cd $e8 $65
    pop  BC                                            ;; 0b:5dba $c1
    dec  B                                             ;; 0b:5dbb $05
    jr   NZ, .jr_0b_5db0                               ;; 0b:5dbc $20 $f2
    ret                                                ;; 0b:5dbe $c9

call_0b_5dbf:
    ld   [wCDE9], A                                    ;; 0b:5dbf $ea $e9 $cd
    ld   HL, .data_0b_5ddd                             ;; 0b:5dc2 $21 $dd $5d
    push HL                                            ;; 0b:5dc5 $e5
    call doJumptable                                   ;; 0b:5dc6 $cd $3a $37
;@jumptable amount=10
    dw   call_0b_5de7                                  ;; 0b:5dc9 pP $00
    dw   call_0b_5ed7                                  ;; 0b:5dcb pP $01
    dw   call_0b_5ee6                                  ;; 0b:5dcd ?? $02
    dw   call_0b_5f2f                                  ;; 0b:5dcf ?? $03
    dw   call_0b_5f5e                                  ;; 0b:5dd1 pP $04
    dw   call_0b_5fb8                                  ;; 0b:5dd3 pP $05
    dw   call_0b_5fb8                                  ;; 0b:5dd5 pP $06
    dw   call_0b_65c9                                  ;; 0b:5dd7 pP $07
    dw   call_0b_64be                                  ;; 0b:5dd9 ?? $08
    dw   call_0b_64b4                                  ;; 0b:5ddb ?? $09
.data_0b_5ddd:
    xor  A, A                                          ;; 0b:5ddd $af
    ld   [wCDEB], A                                    ;; 0b:5dde $ea $eb $cd

call_0b_5de1:
    ld   A, [wCDEA]                                    ;; 0b:5de1 $fa $ea $cd
    cp   A, $ff                                        ;; 0b:5de4 $fe $ff
    ret                                                ;; 0b:5de6 $c9

call_0b_5de7:
    ld   A, $01                                        ;; 0b:5de7 $3e $01
    ld   [wCD1C], A                                    ;; 0b:5de9 $ea $1c $cd
    ld   DE, wC8B0                                     ;; 0b:5dec $11 $b0 $c8
    ld   HL, data_0b_5e35                              ;; 0b:5def $21 $35 $5e
    call call_00_1f66                                  ;; 0b:5df2 $cd $66 $1f
    rst  rst_00_0018                                   ;; 0b:5df5 $df
    db   $49                                           ;; 0b:5df6 .
    ld   HL, wC080                                     ;; 0b:5df7 $21 $80 $c0
    ld   A, $60                                        ;; 0b:5dfa $3e $60
    ld   [HL+], A                                      ;; 0b:5dfc $22
    ld   [HL], A                                       ;; 0b:5dfd $77
    call call_00_1e49                                  ;; 0b:5dfe $cd $49 $1e
    xor  A, A                                          ;; 0b:5e01 $af
    ld   [wCD1C], A                                    ;; 0b:5e02 $ea $1c $cd
    rst  rst_00_0018                                   ;; 0b:5e05 $df
    db   $05                                           ;; 0b:5e06 .
    dw   call_00_1e79                                  ;; 0b:5e07 pP $00
    dw   call_00_1e83                                  ;; 0b:5e09 ?? $01
    dw   call_00_1e83                                  ;; 0b:5e0b ?? $02
    dw   call_00_1e83                                  ;; 0b:5e0d ?? $03
    dw   call_00_1e83                                  ;; 0b:5e0f ?? $04
    dw   call_00_1e83                                  ;; 0b:5e11 ?? $05
    dw   call_0b_5e17                                  ;; 0b:5e13 ?? $06
    dw   call_0b_5e26                                  ;; 0b:5e15 ?? $07

call_0b_5e17:
    ld   HL, wC080                                     ;; 0b:5e17 $21 $80 $c0
    ld   A, [HL]                                       ;; 0b:5e1a $7e
    cp   A, $60                                        ;; 0b:5e1b $fe $60
    jr   Z, jr_0b_5e23                                 ;; 0b:5e1d $28 $04
    sub  A, $10                                        ;; 0b:5e1f $d6 $10

jr_0b_5e21:
    ld   [HL], A                                       ;; 0b:5e21 $77
    ret                                                ;; 0b:5e22 $c9

jr_0b_5e23:
    ld   [HL], $80                                     ;; 0b:5e23 $36 $80
    ret                                                ;; 0b:5e25 $c9

call_0b_5e26:
    ld   HL, wC080                                     ;; 0b:5e26 $21 $80 $c0
    ld   A, [HL]                                       ;; 0b:5e29 $7e
    cp   A, $80                                        ;; 0b:5e2a $fe $80
    jr   Z, .jr_0b_5e32                                ;; 0b:5e2c $28 $04
    add  A, $10                                        ;; 0b:5e2e $c6 $10
    jr   jr_0b_5e21                                    ;; 0b:5e30 $18 $ef
.jr_0b_5e32:
    ld   [HL], $60                                     ;; 0b:5e32 $36 $60
    ret                                                ;; 0b:5e34 $c9

data_0b_5e35:
    db   $01, $01, $08, $08, $87, $73, $00, $0b        ;; 0b:5e35 ........
    db   $01, $08, $08, $8e, $73, $00, $00, $00        ;; 0b:5e3d ........

call_0b_5e45:
    ld   HL, .data_0b_5e6b                             ;; 0b:5e45 $21 $6b $5e
    ld   DE, wC8B0                                     ;; 0b:5e48 $11 $b0 $c8
    rst  rst_00_0018                                   ;; 0b:5e4b $df
    db   $3c                                           ;; 0b:5e4c .
    jr   NZ, .jr_0b_5e58                               ;; 0b:5e4d $20 $09
.jr_0b_5e4f:
    call call_00_1f81                                  ;; 0b:5e4f $cd $81 $1f
    ld   HL, .data_0b_5e79                             ;; 0b:5e52 $21 $79 $5e
    jp   call_00_1f90                                  ;; 0b:5e55 $c3 $90 $1f
.jr_0b_5e58:
    ld   A, [wCD36]                                    ;; 0b:5e58 $fa $36 $cd
    cp   A, $04                                        ;; 0b:5e5b $fe $04
    jp   Z, call_00_1f66                               ;; 0b:5e5d $ca $66 $1f
    ld   HL, .data_0b_5e72                             ;; 0b:5e60 $21 $72 $5e
    call call_00_1f81                                  ;; 0b:5e63 $cd $81 $1f
    ld   HL, .data_0b_5e6b                             ;; 0b:5e66 $21 $6b $5e
    jr   .jr_0b_5e4f                                   ;; 0b:5e69 $18 $e4
.data_0b_5e6b:
    db   $01, $01, $12, $05, $3b, $73, $01             ;; 0b:5e6b .......
.data_0b_5e72:
    db   $01, $07, $12, $02, $76, $73, $01             ;; 0b:5e72 ???????
.data_0b_5e79:
    db   $00, $00                                      ;; 0b:5e79 ..

call_0b_5e7b:
    xor  A, A                                          ;; 0b:5e7b $af
    ld   HL, wCD36                                     ;; 0b:5e7c $21 $36 $cd
.jr_0b_5e7f:
    ld   [HL], A                                       ;; 0b:5e7f $77
    push HL                                            ;; 0b:5e80 $e5
    ld   DE, wCE03                                     ;; 0b:5e81 $11 $03 $ce
    call call_0b_6072                                  ;; 0b:5e84 $cd $72 $60
    ld   A, [HL]                                       ;; 0b:5e87 $7e
    call call_0b_5ea8                                  ;; 0b:5e88 $cd $a8 $5e
    pop  HL                                            ;; 0b:5e8b $e1
    ld   A, [HL]                                       ;; 0b:5e8c $7e
    cp   A, $04                                        ;; 0b:5e8d $fe $04
    ret  Z                                             ;; 0b:5e8f $c8
    inc  A                                             ;; 0b:5e90 $3c
    jr   .jr_0b_5e7f                                   ;; 0b:5e91 $18 $ec

jp_0b_5e93:
    call call_0b_5cd9                                  ;; 0b:5e93 $cd $d9 $5c
    ld   A, [HL]                                       ;; 0b:5e96 $7e
    cp   A, $11                                        ;; 0b:5e97 $fe $11
    jr   Z, jr_0b_5ebb                                 ;; 0b:5e99 $28 $20
    cp   A, $01                                        ;; 0b:5e9b $fe $01
    jr   Z, jr_0b_5ecd                                 ;; 0b:5e9d $28 $2e
    ld   DE, wCE03                                     ;; 0b:5e9f $11 $03 $ce
    call call_0b_6072                                  ;; 0b:5ea2 $cd $72 $60
    ld   A, [HL]                                       ;; 0b:5ea5 $7e
    ld   [HL], $ff                                     ;; 0b:5ea6 $36 $ff

call_0b_5ea8:
    cp   A, $c0                                        ;; 0b:5ea8 $fe $c0
    ret  C                                             ;; 0b:5eaa $d8
    cp   A, $ff                                        ;; 0b:5eab $fe $ff
    ret  Z                                             ;; 0b:5ead $c8
    ld   [wCE94], A                                    ;; 0b:5eae $ea $94 $ce
    dec  HL                                            ;; 0b:5eb1 $2b
    dec  HL                                            ;; 0b:5eb2 $2b
    dec  HL                                            ;; 0b:5eb3 $2b
    ld   A, [HL]                                       ;; 0b:5eb4 $7e
    cp   A, $30                                        ;; 0b:5eb5 $fe $30
    ret  NZ                                            ;; 0b:5eb7 $c0
    rst  rst_00_0018                                   ;; 0b:5eb8 $df
    db   $0f                                           ;; 0b:5eb9 ?
    ret                                                ;; 0b:5eba $c9

jr_0b_5ebb:
    inc  HL                                            ;; 0b:5ebb $23
    inc  HL                                            ;; 0b:5ebc $23
    ld   A, [HL]                                       ;; 0b:5ebd $7e
    cp   A, $ff                                        ;; 0b:5ebe $fe $ff
    ret  Z                                             ;; 0b:5ec0 $c8
    ld   [HL], $ff                                     ;; 0b:5ec1 $36 $ff
    call call_00_1fcd                                  ;; 0b:5ec3 $cd $cd $1f
    ld   DE, wC561                                     ;; 0b:5ec6 $11 $61 $c5
    add  HL, DE                                        ;; 0b:5ec9 $19
    res  4, [HL]                                       ;; 0b:5eca $cb $a6
    ret                                                ;; 0b:5ecc $c9

jr_0b_5ecd:
    call call_00_1fc4                                  ;; 0b:5ecd $cd $c4 $1f
    ld   DE, wC561                                     ;; 0b:5ed0 $11 $61 $c5
    add  HL, DE                                        ;; 0b:5ed3 $19
    res  5, [HL]                                       ;; 0b:5ed4 $cb $ae
    ret                                                ;; 0b:5ed6 $c9

call_0b_5ed7:
    ld   A, $03                                        ;; 0b:5ed7 $3e $03
    ld   [wCDD1], A                                    ;; 0b:5ed9 $ea $d1 $cd
    ld   HL, wCDDA                                     ;; 0b:5edc $21 $da $cd
    ld   A, $a0                                        ;; 0b:5edf $3e $a0
    ld   [HL+], A                                      ;; 0b:5ee1 $22
    ld   [HL], $73                                     ;; 0b:5ee2 $36 $73
    jr   jr_0b_5ef3                                    ;; 0b:5ee4 $18 $0d

call_0b_5ee6:
    ld   A, $01                                        ;; 0b:5ee6 $3e $01
    ld   [wCDD1], A                                    ;; 0b:5ee8 $ea $d1 $cd
    ld   HL, wCDDA                                     ;; 0b:5eeb $21 $da $cd
    ld   A, $bd                                        ;; 0b:5eee $3e $bd
    ld   [HL+], A                                      ;; 0b:5ef0 $22
    ld   [HL], $73                                     ;; 0b:5ef1 $36 $73

jr_0b_5ef3:
    call call_0b_5cd9                                  ;; 0b:5ef3 $cd $d9 $5c
    ld   A, [HL]                                       ;; 0b:5ef6 $7e
    swap A                                             ;; 0b:5ef7 $cb $37
    and  A, $0f                                        ;; 0b:5ef9 $e6 $0f
    ld   [wCDD3], A                                    ;; 0b:5efb $ea $d3 $cd
    call call_0b_5f18                                  ;; 0b:5efe $cd $18 $5f
    call call_0b_5cd9                                  ;; 0b:5f01 $cd $d9 $5c
    ld   A, [HL]                                       ;; 0b:5f04 $7e
    and  A, $f0                                        ;; 0b:5f05 $e6 $f0
    ld   B, A                                          ;; 0b:5f07 $47
    ld   A, [wCDD3]                                    ;; 0b:5f08 $fa $d3 $cd
    swap A                                             ;; 0b:5f0b $cb $37
    cp   A, B                                          ;; 0b:5f0d $b8
    ret  Z                                             ;; 0b:5f0e $c8
    ld   B, A                                          ;; 0b:5f0f $47
    ld   A, [HL]                                       ;; 0b:5f10 $7e
    and  A, $0f                                        ;; 0b:5f11 $e6 $0f
    or   A, B                                          ;; 0b:5f13 $b0
    ld   [HL+], A                                      ;; 0b:5f14 $22
    ld   [HL], $00                                     ;; 0b:5f15 $36 $00
    ret                                                ;; 0b:5f17 $c9

call_0b_5f18:
    ld   A, [wCDEB]                                    ;; 0b:5f18 $fa $eb $cd
    and  A, $f0                                        ;; 0b:5f1b $e6 $f0
    or   A, $01                                        ;; 0b:5f1d $f6 $01
    ld   [wCDEB], A                                    ;; 0b:5f1f $ea $eb $cd
    call call_0b_6383                                  ;; 0b:5f22 $cd $83 $63
    call call_0b_607a                                  ;; 0b:5f25 $cd $7a $60
    ld   A, [wCDD8]                                    ;; 0b:5f28 $fa $d8 $cd
    ld   [wCDEA], A                                    ;; 0b:5f2b $ea $ea $cd
    ret                                                ;; 0b:5f2e $c9

call_0b_5f2f:
    xor  A, A                                          ;; 0b:5f2f $af
    ld   [wC080], A                                    ;; 0b:5f30 $ea $80 $c0
    ld   A, $08                                        ;; 0b:5f33 $3e $08
    ld   [wCE1D], A                                    ;; 0b:5f35 $ea $1d $ce
    ld   A, $01                                        ;; 0b:5f38 $3e $01
    ld   [wCE1C], A                                    ;; 0b:5f3a $ea $1c $ce
    ld   [wCD35], A                                    ;; 0b:5f3d $ea $35 $cd
.jr_0b_5f40:
    call call_0b_6718                                  ;; 0b:5f40 $cd $18 $67
    ld   A, [wCE1C]                                    ;; 0b:5f43 $fa $1c $ce
    cp   A, $ff                                        ;; 0b:5f46 $fe $ff
    jr   Z, .jr_0b_5f59                                ;; 0b:5f48 $28 $0f
    ld   [wCD36], A                                    ;; 0b:5f4a $ea $36 $cd
    rst  rst_00_0018                                   ;; 0b:5f4d $df
    db   $2f                                           ;; 0b:5f4e ?
    ld   A, [HL]                                       ;; 0b:5f4f $7e
    xor  A, $80                                        ;; 0b:5f50 $ee $80
    ld   [HL], A                                       ;; 0b:5f52 $77
    xor  A, A                                          ;; 0b:5f53 $af
    call call_0b_65e8                                  ;; 0b:5f54 $cd $e8 $65
    jr   .jr_0b_5f40                                   ;; 0b:5f57 $18 $e7
.jr_0b_5f59:
    xor  A, A                                          ;; 0b:5f59 $af
    ld   [wCD35], A                                    ;; 0b:5f5a $ea $35 $cd
    ret                                                ;; 0b:5f5d $c9

call_0b_5f5e:
    ld   A, $01                                        ;; 0b:5f5e $3e $01
    ld   [wCDD2], A                                    ;; 0b:5f60 $ea $d2 $cd
    ld   DE, wCE01                                     ;; 0b:5f63 $11 $01 $ce
    call call_0b_6072                                  ;; 0b:5f66 $cd $72 $60
    ld   A, [HL]                                       ;; 0b:5f69 $7e
    sra  A                                             ;; 0b:5f6a $cb $2f
    sra  A                                             ;; 0b:5f6c $cb $2f
    ld   [wCDD3], A                                    ;; 0b:5f6e $ea $d3 $cd
    ld   A, [HL]                                       ;; 0b:5f71 $7e
    and  A, $03                                        ;; 0b:5f72 $e6 $03
    ld   [wCDD4], A                                    ;; 0b:5f74 $ea $d4 $cd
    ld   A, $03                                        ;; 0b:5f77 $3e $03
    ld   [wCDD1], A                                    ;; 0b:5f79 $ea $d1 $cd
.jr_0b_5f7c:
    call call_0b_66d2                                  ;; 0b:5f7c $cd $d2 $66
    call call_0b_63d5                                  ;; 0b:5f7f $cd $d5 $63
    call call_0b_6136                                  ;; 0b:5f82 $cd $36 $61
    ld   A, [wCDD8]                                    ;; 0b:5f85 $fa $d8 $cd
    ld   [wCDEA], A                                    ;; 0b:5f88 $ea $ea $cd
    cp   A, $ff                                        ;; 0b:5f8b $fe $ff
    jr   Z, .jr_0b_5fa6                                ;; 0b:5f8d $28 $17
    ld   B, A                                          ;; 0b:5f8f $47
    call call_00_1fc4                                  ;; 0b:5f90 $cd $c4 $1f
    ld   DE, wC548                                     ;; 0b:5f93 $11 $48 $c5
    add  HL, DE                                        ;; 0b:5f96 $19
    ld   A, B                                          ;; 0b:5f97 $78
    rst  add_hl_a                                      ;; 0b:5f98 $c7
    ld   A, [HL]                                       ;; 0b:5f99 $7e
    cp   A, $ff                                        ;; 0b:5f9a $fe $ff
    call Z, call_00_1e83                               ;; 0b:5f9c $cc $83 $1e
    jr   Z, .jr_0b_5f7c                                ;; 0b:5f9f $28 $db
    call call_0b_6557                                  ;; 0b:5fa1 $cd $57 $65
    jr   NZ, .jr_0b_5f7c                               ;; 0b:5fa4 $20 $d6
.jr_0b_5fa6:
    ld   DE, wCE01                                     ;; 0b:5fa6 $11 $01 $ce
    call call_0b_6072                                  ;; 0b:5fa9 $cd $72 $60
    ld   A, [wCDD3]                                    ;; 0b:5fac $fa $d3 $cd
    add  A, A                                          ;; 0b:5faf $87
    add  A, A                                          ;; 0b:5fb0 $87
    ld   B, A                                          ;; 0b:5fb1 $47
    ld   A, [wCDD4]                                    ;; 0b:5fb2 $fa $d4 $cd
    add  A, B                                          ;; 0b:5fb5 $80
    ld   [HL], A                                       ;; 0b:5fb6 $77
    ret                                                ;; 0b:5fb7 $c9

call_0b_5fb8:
    xor  A, A                                          ;; 0b:5fb8 $af
    ld   [wCDD2], A                                    ;; 0b:5fb9 $ea $d2 $cd
    ld   A, $03                                        ;; 0b:5fbc $3e $03
    ld   [wCDD1], A                                    ;; 0b:5fbe $ea $d1 $cd
    ld   HL, data_0b_7033                              ;; 0b:5fc1 $21 $33 $70
    ld   A, [wCDE9]                                    ;; 0b:5fc4 $fa $e9 $cd
    cp   A, $06                                        ;; 0b:5fc7 $fe $06
    jr   Z, .jr_0b_5fce                                ;; 0b:5fc9 $28 $03
    ld   HL, data_0b_73cb                              ;; 0b:5fcb $21 $cb $73
.jr_0b_5fce:
    ld   A, L                                          ;; 0b:5fce $7d
    ld   [wCDE6], A                                    ;; 0b:5fcf $ea $e6 $cd
    ld   A, H                                          ;; 0b:5fd2 $7c
    ld   [wCDE7], A                                    ;; 0b:5fd3 $ea $e7 $cd
    ld   DE, wCE01                                     ;; 0b:5fd6 $11 $01 $ce
    call call_0b_6072                                  ;; 0b:5fd9 $cd $72 $60
    ld   A, [HL]                                       ;; 0b:5fdc $7e
    cp   A, $fe                                        ;; 0b:5fdd $fe $fe
    jr   NC, .jr_0b_5fed                               ;; 0b:5fdf $30 $0c
    ld   [wCDD3], A                                    ;; 0b:5fe1 $ea $d3 $cd
    xor  A, A                                          ;; 0b:5fe4 $af
    ld   [wCDD4], A                                    ;; 0b:5fe5 $ea $d4 $cd
    call call_0b_63ee                                  ;; 0b:5fe8 $cd $ee $63
    jr   .jr_0b_5ffe                                   ;; 0b:5feb $18 $11
.jr_0b_5fed:
    cpl                                                ;; 0b:5fed $2f
    ld   [wCDD4], A                                    ;; 0b:5fee $ea $d4 $cd
    ld   A, $ff                                        ;; 0b:5ff1 $3e $ff
    ld   [wCDD3], A                                    ;; 0b:5ff3 $ea $d3 $cd
    ld   A, $01                                        ;; 0b:5ff6 $3e $01
    ld   [wCDD2], A                                    ;; 0b:5ff8 $ea $d2 $cd
    call call_0b_62e4                                  ;; 0b:5ffb $cd $e4 $62
.jr_0b_5ffe:
    call call_0b_6136                                  ;; 0b:5ffe $cd $36 $61
    ld   A, [wCDD8]                                    ;; 0b:6001 $fa $d8 $cd
    ld   [wCDEA], A                                    ;; 0b:6004 $ea $ea $cd
    cp   A, $ff                                        ;; 0b:6007 $fe $ff
    jr   Z, .jr_0b_6049                                ;; 0b:6009 $28 $3e
    ld   B, A                                          ;; 0b:600b $47
    ld   A, [wCDE9]                                    ;; 0b:600c $fa $e9 $cd
    cp   A, $06                                        ;; 0b:600f $fe $06
    ld   A, B                                          ;; 0b:6011 $78
    jr   NZ, .jr_0b_603a                               ;; 0b:6012 $20 $26
    ld   HL, wC700                                     ;; 0b:6014 $21 $00 $c7
    add  A, A                                          ;; 0b:6017 $87
    rst  add_hl_a                                      ;; 0b:6018 $c7
    ld   A, [HL-]                                      ;; 0b:6019 $3a
    or   A, A                                          ;; 0b:601a $b7
    jr   Z, .jr_0b_6035                                ;; 0b:601b $28 $18
    ld   A, [HL+]                                      ;; 0b:601d $2a
    cp   A, $ff                                        ;; 0b:601e $fe $ff
    jr   Z, .jr_0b_6035                                ;; 0b:6020 $28 $13
    cp   A, $30                                        ;; 0b:6022 $fe $30
    jr   C, .jr_0b_6035                                ;; 0b:6024 $38 $0f
    cp   A, $d1                                        ;; 0b:6026 $fe $d1
    jr   Z, .jr_0b_602e                                ;; 0b:6028 $28 $04
    cp   A, $cb                                        ;; 0b:602a $fe $cb
    jr   NC, .jr_0b_6035                               ;; 0b:602c $30 $07
.jr_0b_602e:
    call call_0b_6527                                  ;; 0b:602e $cd $27 $65
    jr   NZ, .jr_0b_6053                               ;; 0b:6031 $20 $20
    jr   .jr_0b_6049                                   ;; 0b:6033 $18 $14
.jr_0b_6035:
    call call_00_1e83                                  ;; 0b:6035 $cd $83 $1e
    jr   .jr_0b_5ffe                                   ;; 0b:6038 $18 $c4
.jr_0b_603a:
    call call_0b_6583                                  ;; 0b:603a $cd $83 $65
    cp   A, $ff                                        ;; 0b:603d $fe $ff
    call Z, call_00_1e83                               ;; 0b:603f $cc $83 $1e
    jr   Z, .jr_0b_5ffe                                ;; 0b:6042 $28 $ba
    call call_0b_6589                                  ;; 0b:6044 $cd $89 $65
    jr   NZ, .jr_0b_6053                               ;; 0b:6047 $20 $0a
.jr_0b_6049:
    call call_0b_6058                                  ;; 0b:6049 $cd $58 $60
    rst  rst_00_0018                                   ;; 0b:604c $df
    db   $3d                                           ;; 0b:604d .
    xor  A, A                                          ;; 0b:604e $af
    ld   [wCDE8], A                                    ;; 0b:604f $ea $e8 $cd
    ret                                                ;; 0b:6052 $c9
.jr_0b_6053:
    call call_0b_6420                                  ;; 0b:6053 $cd $20 $64
    jr   .jr_0b_5ffe                                   ;; 0b:6056 $18 $a6

call_0b_6058:
    ld   DE, wCE01                                     ;; 0b:6058 $11 $01 $ce
    call call_0b_6072                                  ;; 0b:605b $cd $72 $60
    ld   A, [wCDD3]                                    ;; 0b:605e $fa $d3 $cd
    cp   A, $ff                                        ;; 0b:6061 $fe $ff
    jr   Z, .jr_0b_606c                                ;; 0b:6063 $28 $07
    ld   [HL], A                                       ;; 0b:6065 $77
    ld   A, [wCDE8]                                    ;; 0b:6066 $fa $e8 $cd
    add  A, [HL]                                       ;; 0b:6069 $86
    ld   [HL], A                                       ;; 0b:606a $77
    ret                                                ;; 0b:606b $c9
.jr_0b_606c:
    ld   A, [wCDD4]                                    ;; 0b:606c $fa $d4 $cd
    cpl                                                ;; 0b:606f $2f
    ld   [HL], A                                       ;; 0b:6070 $77
    ret                                                ;; 0b:6071 $c9

call_0b_6072:
    ld   A, [wCD36]                                    ;; 0b:6072 $fa $36 $cd
    call call_00_2437                                  ;; 0b:6075 $cd $37 $24
    add  HL, DE                                        ;; 0b:6078 $19
    ret                                                ;; 0b:6079 $c9

call_0b_607a:
    ld   A, [wCDD3]                                    ;; 0b:607a $fa $d3 $cd
    call call_0b_6705                                  ;; 0b:607d $cd $05 $67
    call call_0b_6120                                  ;; 0b:6080 $cd $20 $61
    rst  rst_00_0018                                   ;; 0b:6083 $df
    db   $05                                           ;; 0b:6084 .
    dw   call_0b_60ad                                  ;; 0b:6085 pP $00
    dw   call_0b_60cf                                  ;; 0b:6087 pP $01
    dw   call_00_1e83                                  ;; 0b:6089 ?? $02
    dw   call_0b_6095                                  ;; 0b:608b ?? $03
    dw   call_0b_60e5                                  ;; 0b:608d ?? $04
    dw   call_0b_60d3                                  ;; 0b:608f ?? $05
    dw   call_0b_60f0                                  ;; 0b:6091 pP $06
    dw   call_0b_6109                                  ;; 0b:6093 pP $07

call_0b_6095:
    ld   A, [wCDE9]                                    ;; 0b:6095 $fa $e9 $cd
    cp   A, $01                                        ;; 0b:6098 $fe $01
    jr   Z, .jr_0b_60a1                                ;; 0b:609a $28 $05
    cp   A, $02                                        ;; 0b:609c $fe $02
    jp   NZ, call_00_1e83                              ;; 0b:609e $c2 $83 $1e
.jr_0b_60a1:
    call call_0b_5cd9                                  ;; 0b:60a1 $cd $d9 $5c
    xor  A, A                                          ;; 0b:60a4 $af
    ld   [HL], A                                       ;; 0b:60a5 $77
    ld   [wCDD3], A                                    ;; 0b:60a6 $ea $d3 $cd
    ld   A, $04                                        ;; 0b:60a9 $3e $04
    jr   jr_0b_60c9                                    ;; 0b:60ab $18 $1c

call_0b_60ad:
    ld   A, [wCDD7]                                    ;; 0b:60ad $fa $d7 $cd
    or   A, A                                          ;; 0b:60b0 $b7
    jp   Z, call_00_1e83                               ;; 0b:60b1 $ca $83 $1e
    ld   A, [wCDDA]                                    ;; 0b:60b4 $fa $da $cd
    cp   A, $a0                                        ;; 0b:60b7 $fe $a0
    jr   NZ, .jr_0b_60c6                               ;; 0b:60b9 $20 $0b
    ld   A, [wCDD3]                                    ;; 0b:60bb $fa $d3 $cd
    or   A, A                                          ;; 0b:60be $b7
    jr   NZ, jr_0b_60c9                                ;; 0b:60bf $20 $08
    rst  rst_00_0018                                   ;; 0b:60c1 $df
    db   $48                                           ;; 0b:60c2 .
    jp   NZ, call_00_1e83                              ;; 0b:60c3 $c2 $83 $1e
.jr_0b_60c6:
    ld   A, [wCDD3]                                    ;; 0b:60c6 $fa $d3 $cd

jr_0b_60c9:
    ld   [wCDD8], A                                    ;; 0b:60c9 $ea $d8 $cd
    jp   call_00_1e79                                  ;; 0b:60cc $c3 $79 $1e

call_0b_60cf:
    ld   A, $ff                                        ;; 0b:60cf $3e $ff
    jr   jr_0b_60c9                                    ;; 0b:60d1 $18 $f6

call_0b_60d3:
    ld   A, [wCDD7]                                    ;; 0b:60d3 $fa $d7 $cd
    sub  A, $01                                        ;; 0b:60d6 $d6 $01
    jr   NC, jr_0b_60dc                                ;; 0b:60d8 $30 $02
    ld   A, $02                                        ;; 0b:60da $3e $02

jr_0b_60dc:
    ld   [wCDD7], A                                    ;; 0b:60dc $ea $d7 $cd
    call call_0b_6120                                  ;; 0b:60df $cd $20 $61
    jp   call_0b_6383                                  ;; 0b:60e2 $c3 $83 $63

call_0b_60e5:
    ld   A, [wCDD7]                                    ;; 0b:60e5 $fa $d7 $cd
    inc  A                                             ;; 0b:60e8 $3c
    cp   A, $03                                        ;; 0b:60e9 $fe $03
    jr   NZ, jr_0b_60dc                                ;; 0b:60eb $20 $ef
    xor  A, A                                          ;; 0b:60ed $af
    jr   jr_0b_60dc                                    ;; 0b:60ee $18 $ec

call_0b_60f0:
    ld   A, [wCDD7]                                    ;; 0b:60f0 $fa $d7 $cd
    or   A, A                                          ;; 0b:60f3 $b7
    jp   Z, call_00_1e83                               ;; 0b:60f4 $ca $83 $1e
    ld   A, [wCDD3]                                    ;; 0b:60f7 $fa $d3 $cd
    or   A, A                                          ;; 0b:60fa $b7
    jr   Z, .jr_0b_6100                                ;; 0b:60fb $28 $03
    dec  A                                             ;; 0b:60fd $3d
    jr   jr_0b_6103                                    ;; 0b:60fe $18 $03
.jr_0b_6100:
    ld   A, [wCDD1]                                    ;; 0b:6100 $fa $d1 $cd

jr_0b_6103:
    ld   [wCDD3], A                                    ;; 0b:6103 $ea $d3 $cd
    jp   call_0b_6705                                  ;; 0b:6106 $c3 $05 $67

call_0b_6109:
    ld   A, [wCDD7]                                    ;; 0b:6109 $fa $d7 $cd
    or   A, A                                          ;; 0b:610c $b7
    jp   Z, call_00_1e83                               ;; 0b:610d $ca $83 $1e
    ld   A, [wCDD1]                                    ;; 0b:6110 $fa $d1 $cd
    ld   B, A                                          ;; 0b:6113 $47
    ld   A, [wCDD3]                                    ;; 0b:6114 $fa $d3 $cd
    cp   A, B                                          ;; 0b:6117 $b8
    jr   Z, .jr_0b_611d                                ;; 0b:6118 $28 $03
    inc  A                                             ;; 0b:611a $3c
    jr   jr_0b_6103                                    ;; 0b:611b $18 $e6
.jr_0b_611d:
    xor  A, A                                          ;; 0b:611d $af
    jr   jr_0b_6103                                    ;; 0b:611e $18 $e3

call_0b_6120:
    ld   A, [wCDD7]                                    ;; 0b:6120 $fa $d7 $cd
    dec  A                                             ;; 0b:6123 $3d
    jr   Z, .jr_0b_612e                                ;; 0b:6124 $28 $08
    dec  A                                             ;; 0b:6126 $3d
    jr   Z, .jr_0b_6132                                ;; 0b:6127 $28 $09
    xor  A, A                                          ;; 0b:6129 $af
.jr_0b_612a:
    ld   [wC081], A                                    ;; 0b:612a $ea $81 $c0
    ret                                                ;; 0b:612d $c9
.jr_0b_612e:
    ld   A, $10                                        ;; 0b:612e $3e $10
    jr   .jr_0b_612a                                   ;; 0b:6130 $18 $f8
.jr_0b_6132:
    ld   A, $60                                        ;; 0b:6132 $3e $60
    jr   .jr_0b_612a                                   ;; 0b:6134 $18 $f4

call_0b_6136:
    ld   A, [wCDD3]                                    ;; 0b:6136 $fa $d3 $cd
    call call_0b_6705                                  ;; 0b:6139 $cd $05 $67
    call call_0b_6296                                  ;; 0b:613c $cd $96 $62
    rst  rst_00_0018                                   ;; 0b:613f $df
    db   $05                                           ;; 0b:6140 .
    dw   call_0b_6154                                  ;; 0b:6141 pP $00
    dw   call_0b_61b9                                  ;; 0b:6143 pP $01
    dw   call_00_1e83                                  ;; 0b:6145 ?? $02
    dw   call_00_1e83                                  ;; 0b:6147 ?? $03
    dw   call_0b_61e4                                  ;; 0b:6149 ?? $04
    dw   call_0b_61d2                                  ;; 0b:614b ?? $05
    dw   call_0b_61f4                                  ;; 0b:614d ?? $06
    dw   call_0b_622b                                  ;; 0b:614f pP $07

jr_0b_6151:
    jp   call_00_1e79                                  ;; 0b:6151 $c3 $79 $1e

call_0b_6154:
    ld   A, [wCDE9]                                    ;; 0b:6154 $fa $e9 $cd
    cp   A, $06                                        ;; 0b:6157 $fe $06
    jr   NZ, .jr_0b_6198                               ;; 0b:6159 $20 $3d
    ld   A, [wCDD9]                                    ;; 0b:615b $fa $d9 $cd
    xor  A, $01                                        ;; 0b:615e $ee $01
    ld   [wCDD9], A                                    ;; 0b:6160 $ea $d9 $cd
    jr   Z, .jr_0b_6180                                ;; 0b:6163 $28 $1b
    ld   A, [wCDD3]                                    ;; 0b:6165 $fa $d3 $cd
    ld   [wCDD5], A                                    ;; 0b:6168 $ea $d5 $cd
    ld   A, [wCDD4]                                    ;; 0b:616b $fa $d4 $cd
    ld   [wCDD6], A                                    ;; 0b:616e $ea $d6 $cd
    ld   A, [wC080]                                    ;; 0b:6171 $fa $80 $c0
    add  A, $04                                        ;; 0b:6174 $c6 $04
    ld   [wC084], A                                    ;; 0b:6176 $ea $84 $c0
    ld   A, [wC081]                                    ;; 0b:6179 $fa $81 $c0
    ld   [wC085], A                                    ;; 0b:617c $ea $85 $c0
    ret                                                ;; 0b:617f $c9
.jr_0b_6180:
    xor  A, A                                          ;; 0b:6180 $af
    ld   [wC084], A                                    ;; 0b:6181 $ea $84 $c0
    ld   A, [wCDD5]                                    ;; 0b:6184 $fa $d5 $cd
    ld   B, A                                          ;; 0b:6187 $47
    ld   A, [wCDD3]                                    ;; 0b:6188 $fa $d3 $cd
    cp   A, B                                          ;; 0b:618b $b8
    jr   NZ, jr_0b_61a8                                ;; 0b:618c $20 $1a
    ld   A, [wCDD6]                                    ;; 0b:618e $fa $d6 $cd
    ld   B, A                                          ;; 0b:6191 $47
    ld   A, [wCDD4]                                    ;; 0b:6192 $fa $d4 $cd
    cp   A, B                                          ;; 0b:6195 $b8
    jr   NZ, jr_0b_61a8                                ;; 0b:6196 $20 $10
.jr_0b_6198:
    ld   A, [wCDD3]                                    ;; 0b:6198 $fa $d3 $cd
    cp   A, $ff                                        ;; 0b:619b $fe $ff
    jp   Z, call_00_1e83                               ;; 0b:619d $ca $83 $1e
    call call_0b_636d                                  ;; 0b:61a0 $cd $6d $63

jr_0b_61a3:
    ld   [wCDD8], A                                    ;; 0b:61a3 $ea $d8 $cd
    jr   jr_0b_6151                                    ;; 0b:61a6 $18 $a9

jr_0b_61a8:
    call call_0b_6305                                  ;; 0b:61a8 $cd $05 $63
    call NZ, call_00_1e83                              ;; 0b:61ab $c4 $83 $1e
    ld   A, [wCDD3]                                    ;; 0b:61ae $fa $d3 $cd
    cp   A, $ff                                        ;; 0b:61b1 $fe $ff
    jp   NZ, jp_0b_6273                                ;; 0b:61b3 $c2 $73 $62
    jp   call_0b_62e4                                  ;; 0b:61b6 $c3 $e4 $62

call_0b_61b9:
    ld   A, [wCDE9]                                    ;; 0b:61b9 $fa $e9 $cd
    cp   A, $06                                        ;; 0b:61bc $fe $06
    jr   NZ, .jr_0b_61c6                               ;; 0b:61be $20 $06
    ld   A, [wCDD9]                                    ;; 0b:61c0 $fa $d9 $cd
    or   A, A                                          ;; 0b:61c3 $b7
    jr   NZ, .jr_0b_61ca                               ;; 0b:61c4 $20 $04
.jr_0b_61c6:
    ld   A, $ff                                        ;; 0b:61c6 $3e $ff
    jr   jr_0b_61a3                                    ;; 0b:61c8 $18 $d9
.jr_0b_61ca:
    xor  A, A                                          ;; 0b:61ca $af
    ld   [wCDD9], A                                    ;; 0b:61cb $ea $d9 $cd
    ld   [wC084], A                                    ;; 0b:61ce $ea $84 $c0
    ret                                                ;; 0b:61d1 $c9

call_0b_61d2:
    ld   A, [wCDD4]                                    ;; 0b:61d2 $fa $d4 $cd
    or   A, A                                          ;; 0b:61d5 $b7
    jr   Z, jr_0b_61df                                 ;; 0b:61d6 $28 $07
    dec  A                                             ;; 0b:61d8 $3d

jr_0b_61d9:
    ld   [wCDD4], A                                    ;; 0b:61d9 $ea $d4 $cd
    jp   call_0b_6296                                  ;; 0b:61dc $c3 $96 $62

jr_0b_61df:
    ld   A, [wCDD2]                                    ;; 0b:61df $fa $d2 $cd
    jr   jr_0b_61d9                                    ;; 0b:61e2 $18 $f5

call_0b_61e4:
    ld   A, [wCDD2]                                    ;; 0b:61e4 $fa $d2 $cd
    ld   B, A                                          ;; 0b:61e7 $47
    ld   A, [wCDD4]                                    ;; 0b:61e8 $fa $d4 $cd
    cp   A, B                                          ;; 0b:61eb $b8
    jr   Z, .jr_0b_61f1                                ;; 0b:61ec $28 $03
    inc  A                                             ;; 0b:61ee $3c
    jr   jr_0b_61d9                                    ;; 0b:61ef $18 $e8
.jr_0b_61f1:
    xor  A, A                                          ;; 0b:61f1 $af
    jr   jr_0b_61d9                                    ;; 0b:61f2 $18 $e5

call_0b_61f4:
    ld   A, [wCDD3]                                    ;; 0b:61f4 $fa $d3 $cd
    or   A, A                                          ;; 0b:61f7 $b7
    jr   Z, .jr_0b_6206                                ;; 0b:61f8 $28 $0c
    cp   A, $ff                                        ;; 0b:61fa $fe $ff
    jp   Z, call_00_1e83                               ;; 0b:61fc $ca $83 $1e
    dec  A                                             ;; 0b:61ff $3d
.jr_0b_6200:
    ld   [wCDD3], A                                    ;; 0b:6200 $ea $d3 $cd
    jp   call_0b_6705                                  ;; 0b:6203 $c3 $05 $67
.jr_0b_6206:
    ld   A, [wCD19]                                    ;; 0b:6206 $fa $19 $cd
    or   A, A                                          ;; 0b:6209 $b7
    jr   Z, .jr_0b_6226                                ;; 0b:620a $28 $1a
    and  A, $01                                        ;; 0b:620c $e6 $01
    jr   NZ, .jr_0b_6223                               ;; 0b:620e $20 $13
    ld   A, [wCDE9]                                    ;; 0b:6210 $fa $e9 $cd
    cp   A, $06                                        ;; 0b:6213 $fe $06
    jp   NZ, call_00_1e83                              ;; 0b:6215 $c2 $83 $1e
    ld   A, $01                                        ;; 0b:6218 $3e $01
    ld   [wCDD2], A                                    ;; 0b:621a $ea $d2 $cd
    call call_0b_6296                                  ;; 0b:621d $cd $96 $62
    jp   jp_0b_62c0                                    ;; 0b:6220 $c3 $c0 $62
.jr_0b_6223:
    jp   jp_0b_6481                                    ;; 0b:6223 $c3 $81 $64
.jr_0b_6226:
    ld   A, [wCDD1]                                    ;; 0b:6226 $fa $d1 $cd
    jr   .jr_0b_6200                                   ;; 0b:6229 $18 $d5

call_0b_622b:
    ld   A, [wCDD3]                                    ;; 0b:622b $fa $d3 $cd
    cp   A, $ff                                        ;; 0b:622e $fe $ff
    jr   Z, .jr_0b_624b                                ;; 0b:6230 $28 $19
    cp   A, $03                                        ;; 0b:6232 $fe $03
    jr   Z, .jr_0b_623d                                ;; 0b:6234 $28 $07
    inc  A                                             ;; 0b:6236 $3c
.jr_0b_6237:
    ld   [wCDD3], A                                    ;; 0b:6237 $ea $d3 $cd
    jp   call_0b_6705                                  ;; 0b:623a $c3 $05 $67
.jr_0b_623d:
    ld   A, [wCD19]                                    ;; 0b:623d $fa $19 $cd
    or   A, A                                          ;; 0b:6240 $b7
    jr   Z, .jr_0b_6237                                ;; 0b:6241 $28 $f4
    and  A, $02                                        ;; 0b:6243 $e6 $02
    jp   Z, call_00_1e83                               ;; 0b:6245 $ca $83 $1e
    jp   jp_0b_644e                                    ;; 0b:6248 $c3 $4e $64
.jr_0b_624b:
    inc  A                                             ;; 0b:624b $3c
    ld   [wCDD3], A                                    ;; 0b:624c $ea $d3 $cd
    ld   [wCDD2], A                                    ;; 0b:624f $ea $d2 $cd
    call call_0b_6296                                  ;; 0b:6252 $cd $96 $62
    ld   A, [wCDD9]                                    ;; 0b:6255 $fa $d9 $cd
    or   A, A                                          ;; 0b:6258 $b7
    jr   Z, jp_0b_6273                                 ;; 0b:6259 $28 $18
    ld   A, [wCDD5]                                    ;; 0b:625b $fa $d5 $cd
    cp   A, $ff                                        ;; 0b:625e $fe $ff
    jr   Z, .jr_0b_626f                                ;; 0b:6260 $28 $0d
    cp   A, $04                                        ;; 0b:6262 $fe $04
    jr   NC, jp_0b_6273                                ;; 0b:6264 $30 $0d
    swap A                                             ;; 0b:6266 $cb $37
    add  A, $64                                        ;; 0b:6268 $c6 $64
    ld   [wC084], A                                    ;; 0b:626a $ea $84 $c0
    jr   jp_0b_6273                                    ;; 0b:626d $18 $04
.jr_0b_626f:
    xor  A, A                                          ;; 0b:626f $af
    ld   [wC084], A                                    ;; 0b:6270 $ea $84 $c0

jp_0b_6273:
    ld   HL, data_0b_6445                              ;; 0b:6273 $21 $45 $64
    ld   DE, wC8B0                                     ;; 0b:6276 $11 $b0 $c8
    call call_00_1f7b                                  ;; 0b:6279 $cd $7b $1f
    ld   A, [wCDE6]                                    ;; 0b:627c $fa $e6 $cd
    ld   [wC8B4], A                                    ;; 0b:627f $ea $b4 $c8
    ld   A, [wCDE7]                                    ;; 0b:6282 $fa $e7 $cd
    ld   [wC8B5], A                                    ;; 0b:6285 $ea $b5 $c8
    call call_00_1e49                                  ;; 0b:6288 $cd $49 $1e
    ld   A, $70                                        ;; 0b:628b $3e $70
    ld   [wC088], A                                    ;; 0b:628d $ea $88 $c0
    ld   A, $78                                        ;; 0b:6290 $3e $78
    ld   [wC08C], A                                    ;; 0b:6292 $ea $8c $c0
    ret                                                ;; 0b:6295 $c9

call_0b_6296:
    ld   A, [wCDD2]                                    ;; 0b:6296 $fa $d2 $cd
    dec  A                                             ;; 0b:6299 $3d
    jr   NZ, jr_0b_62b7                                ;; 0b:629a $20 $1b
    ld   A, [wCDD4]                                    ;; 0b:629c $fa $d4 $cd
    call call_0b_62af                                  ;; 0b:629f $cd $af $62
    ld   [wC081], A                                    ;; 0b:62a2 $ea $81 $c0
    ld   A, [wCDD6]                                    ;; 0b:62a5 $fa $d6 $cd
    call call_0b_62af                                  ;; 0b:62a8 $cd $af $62
    ld   [wC085], A                                    ;; 0b:62ab $ea $85 $c0
    ret                                                ;; 0b:62ae $c9

call_0b_62af:
    or   A, A                                          ;; 0b:62af $b7
    jr   Z, .jr_0b_62b4                                ;; 0b:62b0 $28 $02
    ld   A, $48                                        ;; 0b:62b2 $3e $48
.jr_0b_62b4:
    add  A, $10                                        ;; 0b:62b4 $c6 $10
    ret                                                ;; 0b:62b6 $c9

jr_0b_62b7:
    ld   A, $18                                        ;; 0b:62b7 $3e $18
    ld   [wC081], A                                    ;; 0b:62b9 $ea $81 $c0
    ld   [wC085], A                                    ;; 0b:62bc $ea $85 $c0
    ret                                                ;; 0b:62bf $c9

jp_0b_62c0:
    ld   A, [wCDD9]                                    ;; 0b:62c0 $fa $d9 $cd
    or   A, A                                          ;; 0b:62c3 $b7
    jr   Z, .jr_0b_62df                                ;; 0b:62c4 $28 $19
    ld   A, [wCDD5]                                    ;; 0b:62c6 $fa $d5 $cd
    cp   A, $02                                        ;; 0b:62c9 $fe $02
    jr   C, .jr_0b_62d4                                ;; 0b:62cb $38 $07
    cp   A, $ff                                        ;; 0b:62cd $fe $ff
    jr   Z, .jr_0b_62da                                ;; 0b:62cf $28 $09
    xor  A, A                                          ;; 0b:62d1 $af
    jr   .jr_0b_62dc                                   ;; 0b:62d2 $18 $08
.jr_0b_62d4:
    swap A                                             ;; 0b:62d4 $cb $37
    add  A, $84                                        ;; 0b:62d6 $c6 $84
    jr   .jr_0b_62dc                                   ;; 0b:62d8 $18 $02
.jr_0b_62da:
    ld   A, $64                                        ;; 0b:62da $3e $64
.jr_0b_62dc:
    ld   [wC084], A                                    ;; 0b:62dc $ea $84 $c0
.jr_0b_62df:
    ld   A, $ff                                        ;; 0b:62df $3e $ff
    ld   [wCDD3], A                                    ;; 0b:62e1 $ea $d3 $cd

call_0b_62e4:
    rst  rst_00_0018                                   ;; 0b:62e4 $df
    db   $3d                                           ;; 0b:62e5 ?
    call call_0b_66d2                                  ;; 0b:62e6 $cd $d2 $66
    ld   HL, .data_0b_62f5                             ;; 0b:62e9 $21 $f5 $62
    ld   DE, wC8B0                                     ;; 0b:62ec $11 $b0 $c8
    call call_00_1f66                                  ;; 0b:62ef $cd $66 $1f
    jp   call_00_1e49                                  ;; 0b:62f2 $c3 $49 $1e
.data_0b_62f5:
    db   $01, $01, $12, $02, $83, $74, $00, $01        ;; 0b:62f5 ????????
    db   $05, $12, $04, $33, $70, $00, $00, $00        ;; 0b:62fd ????????

call_0b_6305:
    ld   A, [wCDD3]                                    ;; 0b:6305 $fa $d3 $cd
    cp   A, $ff                                        ;; 0b:6308 $fe $ff
    jr   Z, .jr_0b_6325                                ;; 0b:630a $28 $19
    ld   A, [wCDD5]                                    ;; 0b:630c $fa $d5 $cd
    ld   B, A                                          ;; 0b:630f $47
    ld   A, [wCDE8]                                    ;; 0b:6310 $fa $e8 $cd
    add  A, B                                          ;; 0b:6313 $80
    cp   A, $ff                                        ;; 0b:6314 $fe $ff
    jp   NZ, call_00_1e83                              ;; 0b:6316 $c2 $83 $1e
    ld   A, [wCDD6]                                    ;; 0b:6319 $fa $d6 $cd
    call call_0b_634f                                  ;; 0b:631c $cd $4f $63
    ret  NZ                                            ;; 0b:631f $c0
    ld   A, [wCDD3]                                    ;; 0b:6320 $fa $d3 $cd
    jr   .jr_0b_633a                                   ;; 0b:6323 $18 $15
.jr_0b_6325:
    ld   A, [wCDD5]                                    ;; 0b:6325 $fa $d5 $cd
    ld   B, A                                          ;; 0b:6328 $47
    ld   A, [wCDE8]                                    ;; 0b:6329 $fa $e8 $cd
    add  A, B                                          ;; 0b:632c $80
    cp   A, $ff                                        ;; 0b:632d $fe $ff
    ret  Z                                             ;; 0b:632f $c8
    ld   A, [wCDD4]                                    ;; 0b:6330 $fa $d4 $cd
    call call_0b_634f                                  ;; 0b:6333 $cd $4f $63
    ret  NZ                                            ;; 0b:6336 $c0
    ld   A, [wCDD5]                                    ;; 0b:6337 $fa $d5 $cd
.jr_0b_633a:
    ld   C, A                                          ;; 0b:633a $4f
    ld   A, [wCDE8]                                    ;; 0b:633b $fa $e8 $cd
    add  A, C                                          ;; 0b:633e $81
    add  A, A                                          ;; 0b:633f $87
    ld   HL, wC6FF                                     ;; 0b:6340 $21 $ff $c6
    rst  add_hl_a                                      ;; 0b:6343 $c7
    ld   A, L                                          ;; 0b:6344 $7d
    ld   [wCDDE], A                                    ;; 0b:6345 $ea $de $cd
    ld   A, H                                          ;; 0b:6348 $7c
    ld   [wCDDF], A                                    ;; 0b:6349 $ea $df $cd
    jp   call_00_2503                                  ;; 0b:634c $c3 $03 $25

call_0b_634f:
    push AF                                            ;; 0b:634f $f5
    call call_00_1fc4                                  ;; 0b:6350 $cd $c4 $1f
    ld   DE, wC540                                     ;; 0b:6353 $11 $40 $c5
    add  HL, DE                                        ;; 0b:6356 $19
    pop  AF                                            ;; 0b:6357 $f1
    rst  add_hl_a                                      ;; 0b:6358 $c7
    ld   A, L                                          ;; 0b:6359 $7d
    ld   [wCDDC], A                                    ;; 0b:635a $ea $dc $cd
    ld   A, H                                          ;; 0b:635d $7c
    ld   [wCDDD], A                                    ;; 0b:635e $ea $dd $cd
    ld   A, [wCD36]                                    ;; 0b:6361 $fa $36 $cd
    cp   A, $04                                        ;; 0b:6364 $fe $04
    jr   C, .jr_0b_636b                                ;; 0b:6366 $38 $03
    ld   A, [HL]                                       ;; 0b:6368 $7e
    inc  A                                             ;; 0b:6369 $3c
    ret                                                ;; 0b:636a $c9
.jr_0b_636b:
    xor  A, A                                          ;; 0b:636b $af
    ret                                                ;; 0b:636c $c9

call_0b_636d:
    ld   A, [wCDD2]                                    ;; 0b:636d $fa $d2 $cd
    ld   B, A                                          ;; 0b:6370 $47
    ld   A, [wCDD3]                                    ;; 0b:6371 $fa $d3 $cd
    ld   C, A                                          ;; 0b:6374 $4f
    ld   A, [wCDE8]                                    ;; 0b:6375 $fa $e8 $cd
    add  A, C                                          ;; 0b:6378 $81
    inc  B                                             ;; 0b:6379 $04
    dec  B                                             ;; 0b:637a $05
    ret  Z                                             ;; 0b:637b $c8
    add  A, A                                          ;; 0b:637c $87
    ld   B, A                                          ;; 0b:637d $47
    ld   A, [wCDD4]                                    ;; 0b:637e $fa $d4 $cd
    add  A, B                                          ;; 0b:6381 $80
    ret                                                ;; 0b:6382 $c9

call_0b_6383:
    call call_0b_5e45                                  ;; 0b:6383 $cd $45 $5e
    ld   C, $02                                        ;; 0b:6386 $0e $02
    ld   A, [wCDD7]                                    ;; 0b:6388 $fa $d7 $cd
    dec  A                                             ;; 0b:638b $3d
    jr   Z, .jr_0b_6393                                ;; 0b:638c $28 $05
    dec  C                                             ;; 0b:638e $0d
    dec  A                                             ;; 0b:638f $3d
    jr   Z, .jr_0b_6393                                ;; 0b:6390 $28 $01
    dec  C                                             ;; 0b:6392 $0d
.jr_0b_6393:
    swap C                                             ;; 0b:6393 $cb $31
    ld   A, [wCDEB]                                    ;; 0b:6395 $fa $eb $cd
    and  A, $0f                                        ;; 0b:6398 $e6 $0f
    or   A, C                                          ;; 0b:639a $b1
    ld   [wCDEB], A                                    ;; 0b:639b $ea $eb $cd
    dec  DE                                            ;; 0b:639e $1b
    dec  DE                                            ;; 0b:639f $1b
    ld   HL, .data_0b_63cc                             ;; 0b:63a0 $21 $cc $63
    call call_00_1f7b                                  ;; 0b:63a3 $cd $7b $1f
    ld   HL, hFFFB                                     ;; 0b:63a6 $21 $fb $ff
    add  HL, DE                                        ;; 0b:63a9 $19
    ld   A, [wCDDA]                                    ;; 0b:63aa $fa $da $cd
    ld   [HL+], A                                      ;; 0b:63ad $22
    ld   A, [wCDDB]                                    ;; 0b:63ae $fa $db $cd
    ld   [HL], A                                       ;; 0b:63b1 $77
    ld   HL, hFFF7                                     ;; 0b:63b2 $21 $f7 $ff
    add  HL, DE                                        ;; 0b:63b5 $19
    ld   A, [wCDD7]                                    ;; 0b:63b6 $fa $d7 $cd
    or   A, A                                          ;; 0b:63b9 $b7
    jr   Z, .jr_0b_63c6                                ;; 0b:63ba $28 $0a
    dec  A                                             ;; 0b:63bc $3d
    ld   A, $0b                                        ;; 0b:63bd $3e $0b
    jr   NZ, .jr_0b_63c3                               ;; 0b:63bf $20 $02
    ld   A, $01                                        ;; 0b:63c1 $3e $01
.jr_0b_63c3:
    ld   [HL], A                                       ;; 0b:63c3 $77
    jr   .jr_0b_63c9                                   ;; 0b:63c4 $18 $03
.jr_0b_63c6:
    xor  A, A                                          ;; 0b:63c6 $af
    ld   [HL+], A                                      ;; 0b:63c7 $22
    ld   [HL], A                                       ;; 0b:63c8 $77
.jr_0b_63c9:
    jp   call_00_1e49                                  ;; 0b:63c9 $c3 $49 $1e
.data_0b_63cc:
    db   $00, $01, $08, $08, $00, $00, $00, $00        ;; 0b:63cc ........
    db   $00                                           ;; 0b:63d4 .

call_0b_63d5:
    xor  A, A                                          ;; 0b:63d5 $af
    ld   [wCD19], A                                    ;; 0b:63d6 $ea $19 $cd
    ld   HL, .data_0b_63e5                             ;; 0b:63d9 $21 $e5 $63
    ld   DE, wC8B0                                     ;; 0b:63dc $11 $b0 $c8
    call call_00_1f7b                                  ;; 0b:63df $cd $7b $1f
    jp   call_00_1e49                                  ;; 0b:63e2 $c3 $49 $1e
.data_0b_63e5:
    db   $01, $01, $12, $08, $8e, $74, $00, $00        ;; 0b:63e5 ........
    db   $00                                           ;; 0b:63ed .

call_0b_63ee:
    ld   A, $03                                        ;; 0b:63ee $3e $03
    ld   [wCD19], A                                    ;; 0b:63f0 $ea $19 $cd
    ld   C, $00                                        ;; 0b:63f3 $0e $00
    ld   A, [wCDD3]                                    ;; 0b:63f5 $fa $d3 $cd
    cp   A, $3f                                        ;; 0b:63f8 $fe $3f
    jp   NC, jp_0b_62c0                                ;; 0b:63fa $d2 $c0 $62
    cp   A, $04                                        ;; 0b:63fd $fe $04
    jr   C, .jr_0b_641c                                ;; 0b:63ff $38 $1b
    sub  A, $03                                        ;; 0b:6401 $d6 $03
    ld   B, A                                          ;; 0b:6403 $47
    add  A, C                                          ;; 0b:6404 $81
    ld   C, A                                          ;; 0b:6405 $4f
    ld   HL, wCDE6                                     ;; 0b:6406 $21 $e6 $cd
    ld   A, [HL+]                                      ;; 0b:6409 $2a
    ld   H, [HL]                                       ;; 0b:640a $66
    ld   L, A                                          ;; 0b:640b $6f
    call call_00_1ebb                                  ;; 0b:640c $cd $bb $1e
    ld   A, L                                          ;; 0b:640f $7d
    ld   [wCDE6], A                                    ;; 0b:6410 $ea $e6 $cd
    ld   A, H                                          ;; 0b:6413 $7c
    ld   [wCDE7], A                                    ;; 0b:6414 $ea $e7 $cd
    ld   A, $03                                        ;; 0b:6417 $3e $03
    ld   [wCDD3], A                                    ;; 0b:6419 $ea $d3 $cd
.jr_0b_641c:
    ld   A, C                                          ;; 0b:641c $79
    ld   [wCDE8], A                                    ;; 0b:641d $ea $e8 $cd

call_0b_6420:
    call call_0b_66d2                                  ;; 0b:6420 $cd $d2 $66
    ld   HL, data_0b_6445                              ;; 0b:6423 $21 $45 $64
    ld   DE, wC8B0                                     ;; 0b:6426 $11 $b0 $c8
    call call_00_1f7b                                  ;; 0b:6429 $cd $7b $1f
    ld   A, [wCDE6]                                    ;; 0b:642c $fa $e6 $cd
    ld   [wC8B4], A                                    ;; 0b:642f $ea $b4 $c8
    ld   A, [wCDE7]                                    ;; 0b:6432 $fa $e7 $cd
    ld   [wC8B5], A                                    ;; 0b:6435 $ea $b5 $c8
    ld   A, $70                                        ;; 0b:6438 $3e $70
    ld   [wC088], A                                    ;; 0b:643a $ea $88 $c0
    ld   A, $78                                        ;; 0b:643d $3e $78
    ld   [wC08C], A                                    ;; 0b:643f $ea $8c $c0
    jp   call_00_1e49                                  ;; 0b:6442 $c3 $49 $1e

data_0b_6445:
    db   $01, $01, $12, $08, $00, $00, $00, $00        ;; 0b:6445 ........
    db   $00                                           ;; 0b:644d .

jp_0b_644e:
    ld   A, [wCDE9]                                    ;; 0b:644e $fa $e9 $cd
    cp   A, $06                                        ;; 0b:6451 $fe $06
    jr   NZ, .jr_0b_6475                               ;; 0b:6453 $20 $20
    ld   A, [wCDD9]                                    ;; 0b:6455 $fa $d9 $cd
    or   A, A                                          ;; 0b:6458 $b7
    jr   Z, .jr_0b_6475                                ;; 0b:6459 $28 $1a
    ld   HL, wCDD5                                     ;; 0b:645b $21 $d5 $cd
    dec  [HL]                                          ;; 0b:645e $35
    ld   A, [HL]                                       ;; 0b:645f $7e
    cp   A, $ff                                        ;; 0b:6460 $fe $ff
    jr   Z, .jr_0b_6471                                ;; 0b:6462 $28 $0d
    cp   A, $04                                        ;; 0b:6464 $fe $04
    jr   NC, .jr_0b_6475                               ;; 0b:6466 $30 $0d
    swap A                                             ;; 0b:6468 $cb $37
    add  A, $64                                        ;; 0b:646a $c6 $64
    ld   [wC084], A                                    ;; 0b:646c $ea $84 $c0
    jr   .jr_0b_6475                                   ;; 0b:646f $18 $04
.jr_0b_6471:
    xor  A, A                                          ;; 0b:6471 $af
    ld   [wC084], A                                    ;; 0b:6472 $ea $84 $c0
.jr_0b_6475:
    ld   B, $06                                        ;; 0b:6475 $06 $06
    ld   A, $01                                        ;; 0b:6477 $3e $01
    call call_00_3470                                  ;; 0b:6479 $cd $70 $34
    ld   HL, wCDE8                                     ;; 0b:647c $21 $e8 $cd
    inc  [HL]                                          ;; 0b:647f $34
    ret                                                ;; 0b:6480 $c9

jp_0b_6481:
    ld   A, [wCDE9]                                    ;; 0b:6481 $fa $e9 $cd
    cp   A, $06                                        ;; 0b:6484 $fe $06
    jr   NZ, .jr_0b_64a8                               ;; 0b:6486 $20 $20
    ld   A, [wCDD9]                                    ;; 0b:6488 $fa $d9 $cd
    or   A, A                                          ;; 0b:648b $b7
    jr   Z, .jr_0b_64a8                                ;; 0b:648c $28 $1a
    ld   HL, wCDD5                                     ;; 0b:648e $21 $d5 $cd
    inc  [HL]                                          ;; 0b:6491 $34
    ld   A, [HL]                                       ;; 0b:6492 $7e
    cp   A, $04                                        ;; 0b:6493 $fe $04
    jr   Z, .jr_0b_64a4                                ;; 0b:6495 $28 $0d
    cp   A, $04                                        ;; 0b:6497 $fe $04
    jr   NC, .jr_0b_64a8                               ;; 0b:6499 $30 $0d
    swap A                                             ;; 0b:649b $cb $37
    add  A, $64                                        ;; 0b:649d $c6 $64
    ld   [wC084], A                                    ;; 0b:649f $ea $84 $c0
    jr   .jr_0b_64a8                                   ;; 0b:64a2 $18 $04
.jr_0b_64a4:
    xor  A, A                                          ;; 0b:64a4 $af
    ld   [wC084], A                                    ;; 0b:64a5 $ea $84 $c0
.jr_0b_64a8:
    ld   A, $01                                        ;; 0b:64a8 $3e $01
    ld   B, $06                                        ;; 0b:64aa $06 $06
    call call_00_34e0                                  ;; 0b:64ac $cd $e0 $34
    ld   HL, wCDE8                                     ;; 0b:64af $21 $e8 $cd
    dec  [HL]                                          ;; 0b:64b2 $35
    ret                                                ;; 0b:64b3 $c9

call_0b_64b4:
    call call_00_1fc4                                  ;; 0b:64b4 $cd $c4 $1f
    ld   DE, wC561                                     ;; 0b:64b7 $11 $61 $c5
    add  HL, DE                                        ;; 0b:64ba $19
    set  5, [HL]                                       ;; 0b:64bb $cb $ee
    ret                                                ;; 0b:64bd $c9

call_0b_64be:
    ld   A, $08                                        ;; 0b:64be $3e $08
    ld   [wCE1D], A                                    ;; 0b:64c0 $ea $1d $ce
    xor  A, A                                          ;; 0b:64c3 $af
.jr_0b_64c4:
    ld   [wCE1C], A                                    ;; 0b:64c4 $ea $1c $ce
.jr_0b_64c7:
    call call_0b_6718                                  ;; 0b:64c7 $cd $18 $67
    call call_0b_66e1                                  ;; 0b:64ca $cd $e1 $66
    ld   [wCDEA], A                                    ;; 0b:64cd $ea $ea $cd
    cp   A, $ff                                        ;; 0b:64d0 $fe $ff
    ret  Z                                             ;; 0b:64d2 $c8
    ld   B, A                                          ;; 0b:64d3 $47
    ld   A, [wCD36]                                    ;; 0b:64d4 $fa $36 $cd
    cp   A, B                                          ;; 0b:64d7 $b8
    jr   Z, .jr_0b_6504                                ;; 0b:64d8 $28 $2a
    ld   A, B                                          ;; 0b:64da $78
    call call_00_1fcd                                  ;; 0b:64db $cd $cd $1f
    ld   DE, wC501                                     ;; 0b:64de $11 $01 $c5
    add  HL, DE                                        ;; 0b:64e1 $19
    ld   A, [HL]                                       ;; 0b:64e2 $7e
    and  A, $c0                                        ;; 0b:64e3 $e6 $c0
    jr   NZ, .jr_0b_6504                               ;; 0b:64e5 $20 $1d
    push BC                                            ;; 0b:64e7 $c5
    ld   DE, $60                                       ;; 0b:64e8 $11 $60 $00
    add  HL, DE                                        ;; 0b:64eb $19
    bit  4, [HL]                                       ;; 0b:64ec $cb $66
    jr   NZ, .jr_0b_650c                               ;; 0b:64ee $20 $1c
    ld   A, [HL]                                       ;; 0b:64f0 $7e
    and  A, $e0                                        ;; 0b:64f1 $e6 $e0
    or   A, $10                                        ;; 0b:64f3 $f6 $10
    ld   E, A                                          ;; 0b:64f5 $5f
    ld   A, [wCD36]                                    ;; 0b:64f6 $fa $36 $cd
    or   A, E                                          ;; 0b:64f9 $b3
    ld   [HL], A                                       ;; 0b:64fa $77
    ld   DE, wCE02                                     ;; 0b:64fb $11 $02 $ce
    call call_0b_6072                                  ;; 0b:64fe $cd $72 $60
    pop  AF                                            ;; 0b:6501 $f1
    ld   [HL], A                                       ;; 0b:6502 $77
    ret                                                ;; 0b:6503 $c9
.jr_0b_6504:
    call call_00_1e83                                  ;; 0b:6504 $cd $83 $1e
    ld   A, [wCDEA]                                    ;; 0b:6507 $fa $ea $cd
    jr   .jr_0b_64c4                                   ;; 0b:650a $18 $b8
.jr_0b_650c:
    pop  HL                                            ;; 0b:650c $e1
    ld   A, [wCD36]                                    ;; 0b:650d $fa $36 $cd
    push AF                                            ;; 0b:6510 $f5
    ld   A, H                                          ;; 0b:6511 $7c
    ld   [wCD36], A                                    ;; 0b:6512 $ea $36 $cd
    ld   HL, data_0b_74e2                              ;; 0b:6515 $21 $e2 $74
    call call_0b_6661                                  ;; 0b:6518 $cd $61 $66
    pop  AF                                            ;; 0b:651b $f1
    ld   [wCD36], A                                    ;; 0b:651c $ea $36 $cd
    ld   A, [wCDEA]                                    ;; 0b:651f $fa $ea $cd
    ld   [wCE1C], A                                    ;; 0b:6522 $ea $1c $ce
    jr   .jr_0b_64c7                                   ;; 0b:6525 $18 $a0

call_0b_6527:
    ld   HL, wC6FF                                     ;; 0b:6527 $21 $ff $c6
    ld   A, [wCDEA]                                    ;; 0b:652a $fa $ea $cd
    add  A, A                                          ;; 0b:652d $87
    rst  add_hl_a                                      ;; 0b:652e $c7
    push HL                                            ;; 0b:652f $e5
    ld   A, [HL]                                       ;; 0b:6530 $7e
    ld   [wCE26], A                                    ;; 0b:6531 $ea $26 $ce
    xor  A, A                                          ;; 0b:6534 $af
    ld   [wCE25], A                                    ;; 0b:6535 $ea $25 $ce
    inc  A                                             ;; 0b:6538 $3c
    ld   [wCE27], A                                    ;; 0b:6539 $ea $27 $ce
    call call_0b_66ec                                  ;; 0b:653c $cd $ec $66
    pop  HL                                            ;; 0b:653f $e1
    ret  NC                                            ;; 0b:6540 $d0
    ld   C, A                                          ;; 0b:6541 $4f
    ld   A, [HL+]                                      ;; 0b:6542 $2a
    ld   [wCDEA], A                                    ;; 0b:6543 $ea $ea $cd
    push AF                                            ;; 0b:6546 $f5
    cp   A, $c0                                        ;; 0b:6547 $fe $c0
    jr   C, .jr_0b_654c                                ;; 0b:6549 $38 $01
    dec  [HL]                                          ;; 0b:654b $35
.jr_0b_654c:
    ld   DE, wCE03                                     ;; 0b:654c $11 $03 $ce
    call call_0b_6072                                  ;; 0b:654f $cd $72 $60
    pop  AF                                            ;; 0b:6552 $f1
    ld   [HL-], A                                      ;; 0b:6553 $32
    ld   [HL], C                                       ;; 0b:6554 $71
    xor  A, A                                          ;; 0b:6555 $af
    ret                                                ;; 0b:6556 $c9

call_0b_6557:
    call call_00_1fc4                                  ;; 0b:6557 $cd $c4 $1f
    ld   DE, wC548                                     ;; 0b:655a $11 $48 $c5
    add  HL, DE                                        ;; 0b:655d $19
    ld   A, [wCDEA]                                    ;; 0b:655e $fa $ea $cd
    rst  add_hl_a                                      ;; 0b:6561 $c7
    push HL                                            ;; 0b:6562 $e5
    ld   A, [HL]                                       ;; 0b:6563 $7e
    ld   [wCE26], A                                    ;; 0b:6564 $ea $26 $ce
    ld   A, $01                                        ;; 0b:6567 $3e $01
    ld   [wCE25], A                                    ;; 0b:6569 $ea $25 $ce
    call call_0b_66ec                                  ;; 0b:656c $cd $ec $66
    pop  HL                                            ;; 0b:656f $e1
    ret  NC                                            ;; 0b:6570 $d0
    push AF                                            ;; 0b:6571 $f5
    ld   A, [HL]                                       ;; 0b:6572 $7e
    ld   [wCDEA], A                                    ;; 0b:6573 $ea $ea $cd
    ld   C, A                                          ;; 0b:6576 $4f
    ld   DE, wCE03                                     ;; 0b:6577 $11 $03 $ce
    call call_0b_6072                                  ;; 0b:657a $cd $72 $60
    ld   [HL], C                                       ;; 0b:657d $71
    pop  AF                                            ;; 0b:657e $f1
    dec  L                                             ;; 0b:657f $2d
    ld   [HL], A                                       ;; 0b:6580 $77
    xor  A, A                                          ;; 0b:6581 $af
    ret                                                ;; 0b:6582 $c9

call_0b_6583:
    rst  rst_00_0018                                   ;; 0b:6583 $df
    db   $0c                                           ;; 0b:6584 .
    ld   A, [wCD20]                                    ;; 0b:6585 $fa $20 $cd
    ret                                                ;; 0b:6588 $c9

call_0b_6589:
    ld   A, [wCDEA]                                    ;; 0b:6589 $fa $ea $cd
    call call_0b_6583                                  ;; 0b:658c $cd $83 $65
    ld   C, A                                          ;; 0b:658f $4f
    push BC                                            ;; 0b:6590 $c5
    ld   [wCE26], A                                    ;; 0b:6591 $ea $26 $ce
    xor  A, A                                          ;; 0b:6594 $af
    ld   [wCE25], A                                    ;; 0b:6595 $ea $25 $ce
    rst  rst_00_0018                                   ;; 0b:6598 $df
    db   $2a                                           ;; 0b:6599 .
    call call_00_1fc4                                  ;; 0b:659a $cd $c4 $1f
    ld   DE, wC515                                     ;; 0b:659d $11 $15 $c5
    add  HL, DE                                        ;; 0b:65a0 $19
    inc  [HL]                                          ;; 0b:65a1 $34
    dec  [HL]                                          ;; 0b:65a2 $35
    jr   NZ, .jr_0b_65b4                               ;; 0b:65a3 $20 $0f
    dec  HL                                            ;; 0b:65a5 $2b
    ld   A, [wCE29]                                    ;; 0b:65a6 $fa $29 $ce
    ld   C, A                                          ;; 0b:65a9 $4f
    ld   A, [HL]                                       ;; 0b:65aa $7e
    cp   A, C                                          ;; 0b:65ab $b9
    pop  BC                                            ;; 0b:65ac $c1
    ld   HL, data_0b_71e5                              ;; 0b:65ad $21 $e5 $71
    jp   C, call_0b_6661                               ;; 0b:65b0 $da $61 $66
    push BC                                            ;; 0b:65b3 $c5
.jr_0b_65b4:
    call call_0b_66ee                                  ;; 0b:65b4 $cd $ee $66
    pop  BC                                            ;; 0b:65b7 $c1
    ret  NC                                            ;; 0b:65b8 $d0
    push AF                                            ;; 0b:65b9 $f5
    ld   DE, wCE02                                     ;; 0b:65ba $11 $02 $ce
    call call_0b_6072                                  ;; 0b:65bd $cd $72 $60
    pop  AF                                            ;; 0b:65c0 $f1
    ld   [HL+], A                                      ;; 0b:65c1 $22
    ld   A, C                                          ;; 0b:65c2 $79
    ld   [wCDEA], A                                    ;; 0b:65c3 $ea $ea $cd
    ld   [HL], A                                       ;; 0b:65c6 $77
    xor  A, A                                          ;; 0b:65c7 $af
    ret                                                ;; 0b:65c8 $c9

call_0b_65c9:
    rst  rst_00_0018                                   ;; 0b:65c9 $df
    db   $2b                                           ;; 0b:65ca .
    call call_0b_66ee                                  ;; 0b:65cb $cd $ee $66
    ld   [wCDEA], A                                    ;; 0b:65ce $ea $ea $cd
    cp   A, $ff                                        ;; 0b:65d1 $fe $ff
    ret  Z                                             ;; 0b:65d3 $c8
    push AF                                            ;; 0b:65d4 $f5
    ld   DE, wCE02                                     ;; 0b:65d5 $11 $02 $ce
    call call_0b_6072                                  ;; 0b:65d8 $cd $72 $60
    pop  AF                                            ;; 0b:65db $f1
    ld   [HL], A                                       ;; 0b:65dc $77
    ret                                                ;; 0b:65dd $c9

call_0b_65de:
    ld   A, [wCD36]                                    ;; 0b:65de $fa $36 $cd
    add  A, A                                          ;; 0b:65e1 $87
    add  A, A                                          ;; 0b:65e2 $87
    ld   HL, wCDEC                                     ;; 0b:65e3 $21 $ec $cd
    rst  add_hl_a                                      ;; 0b:65e6 $c7
    ret                                                ;; 0b:65e7 $c9

call_0b_65e8:
    or   A, A                                          ;; 0b:65e8 $b7
    jr   NZ, .jr_0b_661e                               ;; 0b:65e9 $20 $33
    call call_00_29ef                                  ;; 0b:65eb $cd $ef $29
    or   A, A                                          ;; 0b:65ee $b7
    jr   Z, .jr_0b_65f9                                ;; 0b:65ef $28 $08
    cp   A, $03                                        ;; 0b:65f1 $fe $03
    jr   C, .jr_0b_6603                                ;; 0b:65f3 $38 $0e
    cp   A, $07                                        ;; 0b:65f5 $fe $07
    jr   NC, .jr_0b_6603                               ;; 0b:65f7 $30 $0a
.jr_0b_65f9:
    rst  rst_00_0018                                   ;; 0b:65f9 $df
    db   $2f                                           ;; 0b:65fa .
    jr   NZ, .jr_0b_660d                               ;; 0b:65fb $20 $10
    call call_00_29ef                                  ;; 0b:65fd $cd $ef $29
    or   A, A                                          ;; 0b:6600 $b7
    jr   Z, .jr_0b_6618                                ;; 0b:6601 $28 $15
.jr_0b_6603:
    push HL                                            ;; 0b:6603 $e5
    call call_0b_65de                                  ;; 0b:6604 $cd $de $65
    ld   E, L                                          ;; 0b:6607 $5d
    ld   D, H                                          ;; 0b:6608 $54
    pop  HL                                            ;; 0b:6609 $e1
    rst  rst_00_0018                                   ;; 0b:660a $df
    db   $e2                                           ;; 0b:660b .
    ret                                                ;; 0b:660c $c9
.jr_0b_660d:
    call call_0b_65de                                  ;; 0b:660d $cd $de $65
    ld   E, L                                          ;; 0b:6610 $5d
    ld   D, H                                          ;; 0b:6611 $54
    ld   HL, data_0b_74a7                              ;; 0b:6612 $21 $a7 $74
    rst  rst_00_0018                                   ;; 0b:6615 $df
    db   $92                                           ;; 0b:6616 ?
    ret                                                ;; 0b:6617 $c9
.jr_0b_6618:
    call call_0b_65de                                  ;; 0b:6618 $cd $de $65
    ld   [HL], $00                                     ;; 0b:661b $36 $00
    ret                                                ;; 0b:661d $c9
.jr_0b_661e:
    call call_0b_5cd9                                  ;; 0b:661e $cd $d9 $5c
    ld   A, [HL]                                       ;; 0b:6621 $7e
    and  A, $0f                                        ;; 0b:6622 $e6 $0f
    or   A, A                                          ;; 0b:6624 $b7
    jr   Z, .jr_0b_6637                                ;; 0b:6625 $28 $10
    dec  A                                             ;; 0b:6627 $3d
    jr   Z, .jr_0b_662e                                ;; 0b:6628 $28 $04
    ld   A, $01                                        ;; 0b:662a $3e $01
    jr   .jr_0b_6645                                   ;; 0b:662c $18 $17
.jr_0b_662e:
    ld   A, [HL]                                       ;; 0b:662e $7e
    swap A                                             ;; 0b:662f $cb $37
    and  A, $0f                                        ;; 0b:6631 $e6 $0f
    add  A, $05                                        ;; 0b:6633 $c6 $05
    jr   .jr_0b_6645                                   ;; 0b:6635 $18 $0e
.jr_0b_6637:
    ld   A, [HL+]                                      ;; 0b:6637 $2a
    swap A                                             ;; 0b:6638 $cb $37
    and  A, $0f                                        ;; 0b:663a $e6 $0f
    cp   A, $02                                        ;; 0b:663c $fe $02
    jr   Z, .jr_0b_6656                                ;; 0b:663e $28 $16
    jr   C, .jr_0b_6643                                ;; 0b:6640 $38 $01
    dec  A                                             ;; 0b:6642 $3d
.jr_0b_6643:
    add  A, $02                                        ;; 0b:6643 $c6 $02
.jr_0b_6645:
    call call_00_2437                                  ;; 0b:6645 $cd $37 $24
    ld   DE, data_0b_74a7                              ;; 0b:6648 $11 $a7 $74
    add  HL, DE                                        ;; 0b:664b $19
    push HL                                            ;; 0b:664c $e5
    call call_0b_65de                                  ;; 0b:664d $cd $de $65
    ld   E, L                                          ;; 0b:6650 $5d
    ld   D, H                                          ;; 0b:6651 $54
    pop  HL                                            ;; 0b:6652 $e1
    rst  rst_00_0018                                   ;; 0b:6653 $df
    db   $92                                           ;; 0b:6654 .
    ret                                                ;; 0b:6655 $c9
.jr_0b_6656:
    call call_0b_65de                                  ;; 0b:6656 $cd $de $65
    ld   E, L                                          ;; 0b:6659 $5d
    ld   D, H                                          ;; 0b:665a $54
    ld   HL, call_0b_73b1                              ;; 0b:665b $21 $b1 $73
    rst  rst_00_0018                                   ;; 0b:665e $df
    db   $92                                           ;; 0b:665f .
    ret                                                ;; 0b:6660 $c9

call_0b_6661:
    push AF                                            ;; 0b:6661 $f5
    ld   A, $01                                        ;; 0b:6662 $3e $01
    ld   [wCD45], A                                    ;; 0b:6664 $ea $45 $cd
    call call_00_1e83                                  ;; 0b:6667 $cd $83 $1e
    push HL                                            ;; 0b:666a $e5
    ld   DE, data_0b_6888                              ;; 0b:666b $11 $88 $68
    rst  rst_00_0018                                   ;; 0b:666e $df
    db   $3b                                           ;; 0b:666f ?
    pop  HL                                            ;; 0b:6670 $e1
    ld   DE, $401                                      ;; 0b:6671 $11 $01 $04
    ld   BC, $212                                      ;; 0b:6674 $01 $12 $02
    ld   A, $24                                        ;; 0b:6677 $3e $24
    rst  rst_00_0018                                   ;; 0b:6679 $df
    db   $90                                           ;; 0b:667a ?
    rst  rst_00_0018                                   ;; 0b:667b $df
    db   $2e                                           ;; 0b:667c ?
    xor  A, A                                          ;; 0b:667d $af
    ld   [wCD45], A                                    ;; 0b:667e $ea $45 $cd
    pop  AF                                            ;; 0b:6681 $f1
    ret                                                ;; 0b:6682 $c9
    ld   A, [wCD36]                                    ;; 0b:6683 $fa $36 $cd
    push AF                                            ;; 0b:6686 $f5
    xor  A, A                                          ;; 0b:6687 $af
    ld   [wCD36], A                                    ;; 0b:6688 $ea $36 $cd
.jr_0b_668b:
    call call_00_1fc4                                  ;; 0b:668b $cd $c4 $1f
    ld   DE, wC540                                     ;; 0b:668e $11 $40 $c5
    add  HL, DE                                        ;; 0b:6691 $19
    push HL                                            ;; 0b:6692 $e5
    ld   DE, hFFC0                                     ;; 0b:6693 $11 $c0 $ff
    add  HL, DE                                        ;; 0b:6696 $19
    ld   A, [HL]                                       ;; 0b:6697 $7e
    pop  HL                                            ;; 0b:6698 $e1
    and  A, $0f                                        ;; 0b:6699 $e6 $0f
    jr   NZ, .jr_0b_66b0                               ;; 0b:669b $20 $13
    ld   A, [HL]                                       ;; 0b:669d $7e
    cp   A, $ff                                        ;; 0b:669e $fe $ff
    jr   Z, .jr_0b_66b0                                ;; 0b:66a0 $28 $0e
    push BC                                            ;; 0b:66a2 $c5
    ld   [HL], $ff                                     ;; 0b:66a3 $36 $ff
    ld   [wCE26], A                                    ;; 0b:66a5 $ea $26 $ce
    ld   A, $01                                        ;; 0b:66a8 $3e $01
    ld   [wCE25], A                                    ;; 0b:66aa $ea $25 $ce
    rst  rst_00_0018                                   ;; 0b:66ad $df
    db   $a8                                           ;; 0b:66ae ?
    pop  BC                                            ;; 0b:66af $c1
.jr_0b_66b0:
    ld   HL, wCD36                                     ;; 0b:66b0 $21 $36 $cd
    inc  [HL]                                          ;; 0b:66b3 $34
    ld   A, [HL]                                       ;; 0b:66b4 $7e
    cp   A, $05                                        ;; 0b:66b5 $fe $05
    jr   C, .jr_0b_668b                                ;; 0b:66b7 $38 $d2
    pop  AF                                            ;; 0b:66b9 $f1
    ld   [HL], A                                       ;; 0b:66ba $77
    ld   HL, wC700                                     ;; 0b:66bb $21 $00 $c7
    ld   DE, $02                                       ;; 0b:66be $11 $02 $00
    ld   B, $18                                        ;; 0b:66c1 $06 $18
    xor  A, A                                          ;; 0b:66c3 $af
.jr_0b_66c4:
    cp   A, [HL]                                       ;; 0b:66c4 $be
    call Z, call_0b_66cd                               ;; 0b:66c5 $cc $cd $66
    add  HL, DE                                        ;; 0b:66c8 $19
    dec  B                                             ;; 0b:66c9 $05
    jr   NZ, .jr_0b_66c4                               ;; 0b:66ca $20 $f8
    ret                                                ;; 0b:66cc $c9

call_0b_66cd:
    dec  A                                             ;; 0b:66cd $3d
    ld   [HL-], A                                      ;; 0b:66ce $32
    ld   [HL+], A                                      ;; 0b:66cf $22
    xor  A, A                                          ;; 0b:66d0 $af
    ret                                                ;; 0b:66d1 $c9

call_0b_66d2:
    ld   HL, wC000                                     ;; 0b:66d2 $21 $00 $c0
    ld   DE, $04                                       ;; 0b:66d5 $11 $04 $00
    ld   B, $14                                        ;; 0b:66d8 $06 $14
    xor  A, A                                          ;; 0b:66da $af
.jr_0b_66db:
    ld   [HL], A                                       ;; 0b:66db $77
    add  HL, DE                                        ;; 0b:66dc $19
    dec  B                                             ;; 0b:66dd $05
    jr   NZ, .jr_0b_66db                               ;; 0b:66de $20 $fb
    ret                                                ;; 0b:66e0 $c9

call_0b_66e1:
    ld   A, [wCE1C]                                    ;; 0b:66e1 $fa $1c $ce
    push AF                                            ;; 0b:66e4 $f5
    ld   A, $ff                                        ;; 0b:66e5 $3e $ff
    ld   [wCE1C], A                                    ;; 0b:66e7 $ea $1c $ce
    pop  AF                                            ;; 0b:66ea $f1
    ret                                                ;; 0b:66eb $c9

call_0b_66ec:
    rst  rst_00_0018                                   ;; 0b:66ec $df
    db   $2a                                           ;; 0b:66ed ?

call_0b_66ee:
    ld   A, [wCE28]                                    ;; 0b:66ee $fa $28 $ce
    ld   [wCE1D], A                                    ;; 0b:66f1 $ea $1d $ce
    sub  A, $01                                        ;; 0b:66f4 $d6 $01
    ccf                                                ;; 0b:66f6 $3f
    jp   NC, call_00_1e83                              ;; 0b:66f7 $d2 $83 $1e
    call call_0b_670d                                  ;; 0b:66fa $cd $0d $67
    call call_0b_66e1                                  ;; 0b:66fd $cd $e1 $66
    cp   A, $fe                                        ;; 0b:6700 $fe $fe
    jp   call_00_1e7c                                  ;; 0b:6702 $c3 $7c $1e

call_0b_6705:
    swap A                                             ;; 0b:6705 $cb $37
    add  A, $60                                        ;; 0b:6707 $c6 $60
    ld   [wC080], A                                    ;; 0b:6709 $ea $80 $c0
    ret                                                ;; 0b:670c $c9

call_0b_670d:
    ld   A, [wCE1D]                                    ;; 0b:670d $fa $1d $ce
    and  A, $80                                        ;; 0b:6710 $e6 $80
    call NZ, call_0b_6bdc                              ;; 0b:6712 $c4 $dc $6b
    ld   [wCE1C], A                                    ;; 0b:6715 $ea $1c $ce

call_0b_6718:
    ld   A, [wCE1D]                                    ;; 0b:6718 $fa $1d $ce
    bit  7, A                                          ;; 0b:671b $cb $7f
    jr   NZ, .jr_0b_6734                               ;; 0b:671d $20 $15
    bit  3, A                                          ;; 0b:671f $cb $5f
    jr   NZ, .jr_0b_6741                               ;; 0b:6721 $20 $1e
    bit  4, A                                          ;; 0b:6723 $cb $67
    jr   Z, .jr_0b_672e                                ;; 0b:6725 $28 $07
    ld   A, $80                                        ;; 0b:6727 $3e $80
    ld   [wCE1C], A                                    ;; 0b:6729 $ea $1c $ce
    jr   .jr_0b_6741                                   ;; 0b:672c $18 $13
.jr_0b_672e:
    ld   A, $ff                                        ;; 0b:672e $3e $ff
    ld   [wCE1C], A                                    ;; 0b:6730 $ea $1c $ce
    ret                                                ;; 0b:6733 $c9
.jr_0b_6734:
    bit  0, A                                          ;; 0b:6734 $cb $47
    jr   NZ, .jr_0b_6741                               ;; 0b:6736 $20 $09
    bit  2, A                                          ;; 0b:6738 $cb $57
    jr   Z, .jr_0b_672e                                ;; 0b:673a $28 $f2
    ld   A, $81                                        ;; 0b:673c $3e $81
    ld   [wCE1C], A                                    ;; 0b:673e $ea $1c $ce
.jr_0b_6741:
    ld   A, [wCDEB]                                    ;; 0b:6741 $fa $eb $cd
    ld   L, A                                          ;; 0b:6744 $6f
    ld   A, [wCD36]                                    ;; 0b:6745 $fa $36 $cd
    ld   H, A                                          ;; 0b:6748 $67
    push HL                                            ;; 0b:6749 $e5
    ld   A, [wC080]                                    ;; 0b:674a $fa $80 $c0
    push AF                                            ;; 0b:674d $f5
    xor  A, A                                          ;; 0b:674e $af
    ld   [wC080], A                                    ;; 0b:674f $ea $80 $c0
    ld   A, $01                                        ;; 0b:6752 $3e $01
    ld   [wCE1E], A                                    ;; 0b:6754 $ea $1e $ce
    ld   A, $01                                        ;; 0b:6757 $3e $01
    ld   [wCD39], A                                    ;; 0b:6759 $ea $39 $cd
    rst  rst_00_0018                                   ;; 0b:675c $df
    db   $3d                                           ;; 0b:675d .
    call call_0b_6868                                  ;; 0b:675e $cd $68 $68
    call call_0b_67bf                                  ;; 0b:6761 $cd $bf $67
    call call_00_1e49                                  ;; 0b:6764 $cd $49 $1e
    call call_0b_695c                                  ;; 0b:6767 $cd $5c $69
    rst  rst_00_0018                                   ;; 0b:676a $df
    db   $05                                           ;; 0b:676b .
    dw   call_0b_679f                                  ;; 0b:676c pP $00
    dw   call_0b_67b8                                  ;; 0b:676e pP $01
    dw   call_00_1e83                                  ;; 0b:6770 ?? $02
    dw   call_00_1e83                                  ;; 0b:6772 ?? $03
    dw   call_0b_677c                                  ;; 0b:6774 pP $04
    dw   call_0b_6780                                  ;; 0b:6776 ?? $05
    dw   call_0b_6784                                  ;; 0b:6778 ?? $06
    dw   call_0b_6787                                  ;; 0b:677a pP $07

call_0b_677c:
    ld   A, $03                                        ;; 0b:677c $3e $03
    jr   jr_0b_6789                                    ;; 0b:677e $18 $09

call_0b_6780:
    ld   A, $02                                        ;; 0b:6780 $3e $02
    jr   jr_0b_6789                                    ;; 0b:6782 $18 $05

call_0b_6784:
    xor  A, A                                          ;; 0b:6784 $af
    jr   jr_0b_6789                                    ;; 0b:6785 $18 $02

call_0b_6787:
    ld   A, $01                                        ;; 0b:6787 $3e $01

jr_0b_6789:
    call call_0b_698d                                  ;; 0b:6789 $cd $8d $69
    call call_0b_6868                                  ;; 0b:678c $cd $68 $68
    ld   HL, wCE24                                     ;; 0b:678f $21 $24 $ce
    ld   A, [HL]                                       ;; 0b:6792 $7e
    dec  A                                             ;; 0b:6793 $3d
    ret  NZ                                            ;; 0b:6794 $c0
    ld   [HL], A                                       ;; 0b:6795 $77
    call call_0b_67bf                                  ;; 0b:6796 $cd $bf $67
    call call_00_1e49                                  ;; 0b:6799 $cd $49 $1e
    jp   call_0b_695c                                  ;; 0b:679c $c3 $5c $69

call_0b_679f:
    pop  HL                                            ;; 0b:679f $e1
    pop  HL                                            ;; 0b:67a0 $e1
    xor  A, A                                          ;; 0b:67a1 $af
    ld   [wCE1E], A                                    ;; 0b:67a2 $ea $1e $ce
    call call_0b_6965                                  ;; 0b:67a5 $cd $65 $69
    pop  AF                                            ;; 0b:67a8 $f1
    ld   [wC080], A                                    ;; 0b:67a9 $ea $80 $c0
    pop  HL                                            ;; 0b:67ac $e1
    ld   A, L                                          ;; 0b:67ad $7d
    ld   [wCDEB], A                                    ;; 0b:67ae $ea $eb $cd
    ld   A, H                                          ;; 0b:67b1 $7c
    ld   [wCD36], A                                    ;; 0b:67b2 $ea $36 $cd
    jp   call_00_358b                                  ;; 0b:67b5 $c3 $8b $35

call_0b_67b8:
    ld   A, $ff                                        ;; 0b:67b8 $3e $ff
    ld   [wCE1C], A                                    ;; 0b:67ba $ea $1c $ce
    jr   call_0b_679f                                  ;; 0b:67bd $18 $e0

call_0b_67bf:
    call call_0b_5e45                                  ;; 0b:67bf $cd $45 $5e
    ld   A, [wCD35]                                    ;; 0b:67c2 $fa $35 $cd
    or   A, A                                          ;; 0b:67c5 $b7
    ret  Z                                             ;; 0b:67c6 $c8
    ld   HL, .data_0b_67cf                             ;; 0b:67c7 $21 $cf $67
    dec  DE                                            ;; 0b:67ca $1b
    dec  DE                                            ;; 0b:67cb $1b
    jp   call_00_1f7b                                  ;; 0b:67cc $c3 $7b $1f
.data_0b_67cf:
    db   $01, $01, $08, $02, $f2, $74, $00, $00        ;; 0b:67cf ????????
    db   $00                                           ;; 0b:67d7 ?

call_0b_67d8:
    sub  A, $05                                        ;; 0b:67d8 $d6 $05
    add  A, A                                          ;; 0b:67da $87
    ld   HL, wCC41                                     ;; 0b:67db $21 $41 $cc
    rst  add_hl_a                                      ;; 0b:67de $c7
    ld   A, [HL+]                                      ;; 0b:67df $2a
    swap A                                             ;; 0b:67e0 $cb $37
    rrca                                               ;; 0b:67e2 $0f
    add  A, $08                                        ;; 0b:67e3 $c6 $08
    ld   C, A                                          ;; 0b:67e5 $4f
    ld   A, [HL]                                       ;; 0b:67e6 $7e
    swap A                                             ;; 0b:67e7 $cb $37
    rrca                                               ;; 0b:67e9 $0f
    add  A, $10                                        ;; 0b:67ea $c6 $10
    ld   B, A                                          ;; 0b:67ec $47
    ret                                                ;; 0b:67ed $c9

call_0b_67ee:
    push DE                                            ;; 0b:67ee $d5
    cp   A, $05                                        ;; 0b:67ef $fe $05
    jr   NC, .jr_0b_6830                               ;; 0b:67f1 $30 $3d
    add  A, A                                          ;; 0b:67f3 $87
    ld   HL, .data_0b_6826                             ;; 0b:67f4 $21 $26 $68
    rst  add_hl_a                                      ;; 0b:67f7 $c7
    ld   DE, wC040                                     ;; 0b:67f8 $11 $40 $c0
    pop  AF                                            ;; 0b:67fb $f1
    swap A                                             ;; 0b:67fc $cb $37
    add  A, E                                          ;; 0b:67fe $83
    ld   E, A                                          ;; 0b:67ff $5f
    ld   A, [HL+]                                      ;; 0b:6800 $2a
    ld   [DE], A                                       ;; 0b:6801 $12
    inc  DE                                            ;; 0b:6802 $13
    ld   A, [HL-]                                      ;; 0b:6803 $3a
    ld   [DE], A                                       ;; 0b:6804 $12
    inc  DE                                            ;; 0b:6805 $13
    inc  DE                                            ;; 0b:6806 $13
    inc  DE                                            ;; 0b:6807 $13
    ld   A, [HL+]                                      ;; 0b:6808 $2a
    add  A, $18                                        ;; 0b:6809 $c6 $18
    ld   [DE], A                                       ;; 0b:680b $12
    inc  DE                                            ;; 0b:680c $13
    ld   A, [HL-]                                      ;; 0b:680d $3a
    ld   [DE], A                                       ;; 0b:680e $12
    inc  DE                                            ;; 0b:680f $13
    inc  DE                                            ;; 0b:6810 $13
    inc  DE                                            ;; 0b:6811 $13
    ld   A, [HL+]                                      ;; 0b:6812 $2a
    ld   [DE], A                                       ;; 0b:6813 $12
    inc  DE                                            ;; 0b:6814 $13
    ld   A, [HL-]                                      ;; 0b:6815 $3a
    add  A, $08                                        ;; 0b:6816 $c6 $08
    ld   [DE], A                                       ;; 0b:6818 $12
    inc  DE                                            ;; 0b:6819 $13
    inc  DE                                            ;; 0b:681a $13
    inc  DE                                            ;; 0b:681b $13
    ld   A, [HL+]                                      ;; 0b:681c $2a
    add  A, $18                                        ;; 0b:681d $c6 $18
    ld   [DE], A                                       ;; 0b:681f $12
    inc  DE                                            ;; 0b:6820 $13
    ld   A, [HL-]                                      ;; 0b:6821 $3a
    add  A, $08                                        ;; 0b:6822 $c6 $08
    ld   [DE], A                                       ;; 0b:6824 $12
    ret                                                ;; 0b:6825 $c9
.data_0b_6826:
    db   $50, $10, $50, $58, $68, $10, $68, $58        ;; 0b:6826 ........
    db   $80, $10                                      ;; 0b:682e ??
.jr_0b_6830:
    push AF                                            ;; 0b:6830 $f5
    call call_0b_67d8                                  ;; 0b:6831 $cd $d8 $67
    pop  AF                                            ;; 0b:6834 $f1
    ld   HL, wCC4C                                     ;; 0b:6835 $21 $4c $cc
    rst  add_hl_a                                      ;; 0b:6838 $c7
    ld   A, [HL]                                       ;; 0b:6839 $7e
    and  A, $0f                                        ;; 0b:683a $e6 $0f
    swap A                                             ;; 0b:683c $cb $37
    rrca                                               ;; 0b:683e $0f
    ld   D, A                                          ;; 0b:683f $57
    ld   A, [HL]                                       ;; 0b:6840 $7e
    and  A, $f0                                        ;; 0b:6841 $e6 $f0
    rrca                                               ;; 0b:6843 $0f
    ld   E, A                                          ;; 0b:6844 $5f
    ld   HL, wC040                                     ;; 0b:6845 $21 $40 $c0
    pop  AF                                            ;; 0b:6848 $f1
    swap A                                             ;; 0b:6849 $cb $37
    add  A, L                                          ;; 0b:684b $85
    ld   L, A                                          ;; 0b:684c $6f
    ld   A, B                                          ;; 0b:684d $78
    ld   [HL+], A                                      ;; 0b:684e $22
    ld   A, C                                          ;; 0b:684f $79
    ld   [HL+], A                                      ;; 0b:6850 $22
    inc  HL                                            ;; 0b:6851 $23
    inc  HL                                            ;; 0b:6852 $23
    ld   A, B                                          ;; 0b:6853 $78
    add  A, D                                          ;; 0b:6854 $82
    ld   [HL+], A                                      ;; 0b:6855 $22
    ld   A, C                                          ;; 0b:6856 $79
    ld   [HL+], A                                      ;; 0b:6857 $22
    inc  HL                                            ;; 0b:6858 $23
    inc  HL                                            ;; 0b:6859 $23
    ld   A, B                                          ;; 0b:685a $78
    ld   [HL+], A                                      ;; 0b:685b $22
    ld   A, C                                          ;; 0b:685c $79
    add  A, E                                          ;; 0b:685d $83
    ld   [HL+], A                                      ;; 0b:685e $22
    inc  HL                                            ;; 0b:685f $23
    inc  HL                                            ;; 0b:6860 $23
    ld   A, B                                          ;; 0b:6861 $78
    add  A, D                                          ;; 0b:6862 $82
    ld   [HL+], A                                      ;; 0b:6863 $22
    ld   A, C                                          ;; 0b:6864 $79
    add  A, E                                          ;; 0b:6865 $83
    ld   [HL], A                                       ;; 0b:6866 $77
    ret                                                ;; 0b:6867 $c9

call_0b_6868:
    ld   A, [wCE1C]                                    ;; 0b:6868 $fa $1c $ce
    ld   C, A                                          ;; 0b:686b $4f
    and  A, $c0                                        ;; 0b:686c $e6 $c0
    ld   A, C                                          ;; 0b:686e $79
    jr   NZ, .jr_0b_6884                               ;; 0b:686f $20 $13
    cp   A, $05                                        ;; 0b:6871 $fe $05
    jr   NC, .jr_0b_687e                               ;; 0b:6873 $30 $09
    ld   [wCD36], A                                    ;; 0b:6875 $ea $36 $cd
    ld   A, $01                                        ;; 0b:6878 $3e $01
    ld   [wCDEB], A                                    ;; 0b:687a $ea $eb $cd
    ret                                                ;; 0b:687d $c9
.jr_0b_687e:
    ld   A, $30                                        ;; 0b:687e $3e $30
    ld   [wCDEB], A                                    ;; 0b:6880 $ea $eb $cd
    ret                                                ;; 0b:6883 $c9
.jr_0b_6884:
    and  A, $03                                        ;; 0b:6884 $e6 $03
    jr   NZ, jr_0b_688e                                ;; 0b:6886 $20 $06

data_0b_6888:
    ld   A, $02                                        ;; 0b:6888 $3e $02
    ld   [wCDEB], A                                    ;; 0b:688a $ea $eb $cd
    ret                                                ;; 0b:688d $c9

jr_0b_688e:
    ld   A, $30                                        ;; 0b:688e $3e $30
    ld   [wCDEB], A                                    ;; 0b:6890 $ea $eb $cd
    ret                                                ;; 0b:6893 $c9

call_0b_6894:
    push HL                                            ;; 0b:6894 $e5
    push DE                                            ;; 0b:6895 $d5
    xor  A, A                                          ;; 0b:6896 $af
    ld   DE, $04                                       ;; 0b:6897 $11 $04 $00
    ld   HL, wC050                                     ;; 0b:689a $21 $50 $c0
    call call_0b_68bc                                  ;; 0b:689d $cd $bc $68
    call call_0b_68bc                                  ;; 0b:68a0 $cd $bc $68
    call call_0b_68bc                                  ;; 0b:68a3 $cd $bc $68
    ld   A, [wCE1E]                                    ;; 0b:68a6 $fa $1e $ce
    or   A, A                                          ;; 0b:68a9 $b7
    jr   Z, .jr_0b_68b2                                ;; 0b:68aa $28 $06
    xor  A, A                                          ;; 0b:68ac $af
    call call_0b_68bc                                  ;; 0b:68ad $cd $bc $68
    jr   .jr_0b_68b6                                   ;; 0b:68b0 $18 $04
.jr_0b_68b2:
    add  HL, DE                                        ;; 0b:68b2 $19
    add  HL, DE                                        ;; 0b:68b3 $19
    add  HL, DE                                        ;; 0b:68b4 $19
    add  HL, DE                                        ;; 0b:68b5 $19
.jr_0b_68b6:
    call call_0b_68bc                                  ;; 0b:68b6 $cd $bc $68
    pop  DE                                            ;; 0b:68b9 $d1
    pop  HL                                            ;; 0b:68ba $e1
    ret                                                ;; 0b:68bb $c9

call_0b_68bc:
    ld   [HL], A                                       ;; 0b:68bc $77
    add  HL, DE                                        ;; 0b:68bd $19
    ld   [HL], A                                       ;; 0b:68be $77
    add  HL, DE                                        ;; 0b:68bf $19
    ld   [HL], A                                       ;; 0b:68c0 $77
    add  HL, DE                                        ;; 0b:68c1 $19
    ld   [HL], A                                       ;; 0b:68c2 $77
    add  HL, DE                                        ;; 0b:68c3 $19
    ret                                                ;; 0b:68c4 $c9
    db   $fa, $1c, $ce                                 ;; 0b:68c5 ???

call_0b_68c8:
    bit  7, A                                          ;; 0b:68c8 $cb $7f
    jr   NZ, .jr_0b_68f3                               ;; 0b:68ca $20 $27
    bit  6, A                                          ;; 0b:68cc $cb $77
    jr   NZ, .jr_0b_68fa                               ;; 0b:68ce $20 $2a
    cp   A, $05                                        ;; 0b:68d0 $fe $05
    jr   NC, .jr_0b_68e8                               ;; 0b:68d2 $30 $14
    call call_00_1fcd                                  ;; 0b:68d4 $cd $cd $1f
    ld   DE, wC503                                     ;; 0b:68d7 $11 $03 $c5
    add  HL, DE                                        ;; 0b:68da $19
    ld   A, [HL]                                       ;; 0b:68db $7e
    inc  A                                             ;; 0b:68dc $3c
    ret  Z                                             ;; 0b:68dd $c8
    ld   DE, hFFFE                                     ;; 0b:68de $11 $fe $ff
    add  HL, DE                                        ;; 0b:68e1 $19
    ld   A, [HL]                                       ;; 0b:68e2 $7e
    and  A, $80                                        ;; 0b:68e3 $e6 $80
    xor  A, $80                                        ;; 0b:68e5 $ee $80
    ret                                                ;; 0b:68e7 $c9
.jr_0b_68e8:
    sub  A, $05                                        ;; 0b:68e8 $d6 $05
    call call_00_1ef1                                  ;; 0b:68ea $cd $f1 $1e
    ld   C, A                                          ;; 0b:68ed $4f
    call call_0b_6c2d                                  ;; 0b:68ee $cd $2d $6c
    and  A, C                                          ;; 0b:68f1 $a1
    ret                                                ;; 0b:68f2 $c9
.jr_0b_68f3:
    and  A, $01                                        ;; 0b:68f3 $e6 $01
    jr   Z, .jr_0b_6904                                ;; 0b:68f5 $28 $0d
    jp   call_0b_6c2d                                  ;; 0b:68f7 $c3 $2d $6c
.jr_0b_68fa:
    and  A, $03                                        ;; 0b:68fa $e6 $03
    jr   Z, .jr_0b_6904                                ;; 0b:68fc $28 $06
    ld   HL, wCC5D                                     ;; 0b:68fe $21 $5d $cc
    rst  add_hl_a                                      ;; 0b:6901 $c7
    ld   A, [HL]                                       ;; 0b:6902 $7e
    ret                                                ;; 0b:6903 $c9
.jr_0b_6904:
    inc  A                                             ;; 0b:6904 $3c
    ret                                                ;; 0b:6905 $c9

jp_0b_6906:
    call call_0b_6c2d                                  ;; 0b:6906 $cd $2d $6c
    ld   C, A                                          ;; 0b:6909 $4f
    xor  A, A                                          ;; 0b:690a $af
    ld   B, $08                                        ;; 0b:690b $06 $08
.jr_0b_690d:
    rlc  C                                             ;; 0b:690d $cb $01
    adc  A, $00                                        ;; 0b:690f $ce $00
    dec  B                                             ;; 0b:6911 $05
    jr   NZ, .jr_0b_690d                               ;; 0b:6912 $20 $f9
    ld   [wCD3E], A                                    ;; 0b:6914 $ea $3e $cd
    ret                                                ;; 0b:6917 $c9

call_0b_6918:
    ld   E, $08                                        ;; 0b:6918 $1e $08
    push BC                                            ;; 0b:691a $c5
.jr_0b_691b:
    push DE                                            ;; 0b:691b $d5
    ld   A, E                                          ;; 0b:691c $7b
    add  A, $04                                        ;; 0b:691d $c6 $04
    call call_0b_67d8                                  ;; 0b:691f $cd $d8 $67
    pop  DE                                            ;; 0b:6922 $d1
    pop  HL                                            ;; 0b:6923 $e1
    ld   A, L                                          ;; 0b:6924 $7d
    cp   A, C                                          ;; 0b:6925 $b9
    jr   NZ, .jr_0b_692c                               ;; 0b:6926 $20 $04
    ld   A, H                                          ;; 0b:6928 $7c
    cp   A, B                                          ;; 0b:6929 $b8
    jr   Z, .jr_0b_6934                                ;; 0b:692a $28 $08
.jr_0b_692c:
    push HL                                            ;; 0b:692c $e5
    dec  E                                             ;; 0b:692d $1d
    jr   NZ, .jr_0b_691b                               ;; 0b:692e $20 $eb
    pop  HL                                            ;; 0b:6930 $e1
    ld   A, $ff                                        ;; 0b:6931 $3e $ff
    ret                                                ;; 0b:6933 $c9
.jr_0b_6934:
    ld   A, E                                          ;; 0b:6934 $7b
    add  A, $04                                        ;; 0b:6935 $c6 $04
    ld   E, A                                          ;; 0b:6937 $5f
    push HL                                            ;; 0b:6938 $e5
    push DE                                            ;; 0b:6939 $d5
    call call_0b_68c8                                  ;; 0b:693a $cd $c8 $68
    pop  DE                                            ;; 0b:693d $d1
    pop  HL                                            ;; 0b:693e $e1
    or   A, A                                          ;; 0b:693f $b7
    ld   A, E                                          ;; 0b:6940 $7b
    ret  NZ                                            ;; 0b:6941 $c0
    sub  A, $04                                        ;; 0b:6942 $d6 $04
    ld   E, A                                          ;; 0b:6944 $5f
    jr   .jr_0b_692c                                   ;; 0b:6945 $18 $e5

call_0b_6947:
    sub  A, $05                                        ;; 0b:6947 $d6 $05
    call call_00_1ef1                                  ;; 0b:6949 $cd $f1 $1e
    ld   B, A                                          ;; 0b:694c $47
    ld   C, $00                                        ;; 0b:694d $0e $00
    ld   HL, wCC5E                                     ;; 0b:694f $21 $5e $cc
.jr_0b_6952:
    and  A, [HL]                                       ;; 0b:6952 $a6
    jr   NZ, .jr_0b_695a                               ;; 0b:6953 $20 $05
    inc  HL                                            ;; 0b:6955 $23
    ld   A, B                                          ;; 0b:6956 $78
    inc  C                                             ;; 0b:6957 $0c
    jr   .jr_0b_6952                                   ;; 0b:6958 $18 $f8
.jr_0b_695a:
    ld   A, C                                          ;; 0b:695a $79
    ret                                                ;; 0b:695b $c9

call_0b_695c:
    ld   HL, wC050                                     ;; 0b:695c $21 $50 $c0
    ld   DE, wC080                                     ;; 0b:695f $11 $80 $c0
    jp   call_00_1f66                                  ;; 0b:6962 $c3 $66 $1f

call_0b_6965:
    ld   HL, .data_0b_696e                             ;; 0b:6965 $21 $6e $69
    ld   DE, wC080                                     ;; 0b:6968 $11 $80 $c0
    jp   call_00_1f66                                  ;; 0b:696b $c3 $66 $1f
.data_0b_696e:
    db   $00, $00, $20, $00, $00, $00, $21, $00        ;; 0b:696e ........
    db   $00, $08, $22, $00, $00, $08, $23, $00        ;; 0b:6976 ........

jp_0b_697e:
    ld   A, [wCE1D]                                    ;; 0b:697e $fa $1d $ce
    and  A, $01                                        ;; 0b:6981 $e6 $01
    jp   Z, call_00_1e83                               ;; 0b:6983 $ca $83 $1e
    call call_0b_6be6                                  ;; 0b:6986 $cd $e6 $6b
    ld   [wCE1C], A                                    ;; 0b:6989 $ea $1c $ce
    ret                                                ;; 0b:698c $c9

call_0b_698d:
    ld   B, A                                          ;; 0b:698d $47
    ld   A, [wCE20]                                    ;; 0b:698e $fa $20 $ce
    ld   [wCE21], A                                    ;; 0b:6991 $ea $21 $ce
    ld   A, B                                          ;; 0b:6994 $78
    ld   [wCE20], A                                    ;; 0b:6995 $ea $20 $ce
    ld   A, [wCE1C]                                    ;; 0b:6998 $fa $1c $ce
    bit  7, A                                          ;; 0b:699b $cb $7f
    jp   NZ, jp_0b_6b00                                ;; 0b:699d $c2 $00 $6b
    bit  6, A                                          ;; 0b:69a0 $cb $77
    jp   NZ, jp_0b_6bad                                ;; 0b:69a2 $c2 $ad $6b
    cp   A, $05                                        ;; 0b:69a5 $fe $05
    jp   NC, .jp_0b_6a21                               ;; 0b:69a7 $d2 $21 $6a
    ld   A, [wCE20]                                    ;; 0b:69aa $fa $20 $ce
    dec  A                                             ;; 0b:69ad $3d
    jr   Z, .jr_0b_69d1                                ;; 0b:69ae $28 $21
    dec  A                                             ;; 0b:69b0 $3d
    jr   Z, .jr_0b_69ff                                ;; 0b:69b1 $28 $4c
    dec  A                                             ;; 0b:69b3 $3d
    jr   Z, .jr_0b_6a13                                ;; 0b:69b4 $28 $5d
    ld   A, [wCE1C]                                    ;; 0b:69b6 $fa $1c $ce
    ld   B, A                                          ;; 0b:69b9 $47
    cp   A, $04                                        ;; 0b:69ba $fe $04
    call Z, call_0b_6afa                               ;; 0b:69bc $cc $fa $6a
    ld   A, B                                          ;; 0b:69bf $78
    cp   A, $02                                        ;; 0b:69c0 $fe $02
    jr   C, .jr_0b_69cf                                ;; 0b:69c2 $38 $0b
    sub  A, $02                                        ;; 0b:69c4 $d6 $02
    jr   NZ, .jr_0b_69cb                               ;; 0b:69c6 $20 $03
    ld   A, [wCD35]                                    ;; 0b:69c8 $fa $35 $cd
.jr_0b_69cb:
    ld   [wCE1C], A                                    ;; 0b:69cb $ea $1c $ce
    ret                                                ;; 0b:69ce $c9
.jr_0b_69cf:
    jr   jp_0b_697e                                    ;; 0b:69cf $18 $ad
.jr_0b_69d1:
    ld   A, [wCE1C]                                    ;; 0b:69d1 $fa $1c $ce
    cp   A, $04                                        ;; 0b:69d4 $fe $04
    jr   Z, .jr_0b_69eb                                ;; 0b:69d6 $28 $13
    add  A, $02                                        ;; 0b:69d8 $c6 $02
    cp   A, $04                                        ;; 0b:69da $fe $04
    jr   C, .jr_0b_69e7                                ;; 0b:69dc $38 $09
    rst  rst_00_0018                                   ;; 0b:69de $df
    db   $3c                                           ;; 0b:69df ?
    jr   Z, .jr_0b_69eb                                ;; 0b:69e0 $28 $09
    call call_0b_6afa                                  ;; 0b:69e2 $cd $fa $6a
    ld   A, $04                                        ;; 0b:69e5 $3e $04
.jr_0b_69e7:
    ld   [wCE1C], A                                    ;; 0b:69e7 $ea $1c $ce
    ret                                                ;; 0b:69ea $c9
.jr_0b_69eb:
    ld   A, [wCE1D]                                    ;; 0b:69eb $fa $1d $ce
    and  A, $10                                        ;; 0b:69ee $e6 $10
    jp   Z, call_00_1e83                               ;; 0b:69f0 $ca $83 $1e
    ld   A, [wCE1C]                                    ;; 0b:69f3 $fa $1c $ce
    ld   [wCE1F], A                                    ;; 0b:69f6 $ea $1f $ce
    ld   A, $80                                        ;; 0b:69f9 $3e $80
    ld   [wCE1C], A                                    ;; 0b:69fb $ea $1c $ce
    ret                                                ;; 0b:69fe $c9
.jr_0b_69ff:
    ld   A, [wCE1C]                                    ;; 0b:69ff $fa $1c $ce
    bit  0, A                                          ;; 0b:6a02 $cb $47
    jr   Z, .jr_0b_69eb                                ;; 0b:6a04 $28 $e5
    dec  A                                             ;; 0b:6a06 $3d
    jr   NZ, .jr_0b_69e7                               ;; 0b:6a07 $20 $de
    ld   A, [wCD35]                                    ;; 0b:6a09 $fa $35 $cd
    or   A, A                                          ;; 0b:6a0c $b7
    jr   Z, .jr_0b_69e7                                ;; 0b:6a0d $28 $d8
    ld   A, $02                                        ;; 0b:6a0f $3e $02
    jr   .jr_0b_69e7                                   ;; 0b:6a11 $18 $d4
.jr_0b_6a13:
    ld   A, [wCE1C]                                    ;; 0b:6a13 $fa $1c $ce
    bit  0, A                                          ;; 0b:6a16 $cb $47
    jr   NZ, .jr_0b_69eb                               ;; 0b:6a18 $20 $d1
    cp   A, $04                                        ;; 0b:6a1a $fe $04
    jr   Z, .jr_0b_69eb                                ;; 0b:6a1c $28 $cd
    inc  A                                             ;; 0b:6a1e $3c
    jr   .jr_0b_69e7                                   ;; 0b:6a1f $18 $c6
.jp_0b_6a21:
    ld   A, [wCE20]                                    ;; 0b:6a21 $fa $20 $ce
    dec  A                                             ;; 0b:6a24 $3d
    jr   Z, .jr_0b_6a5d                                ;; 0b:6a25 $28 $36
    dec  A                                             ;; 0b:6a27 $3d
    jr   Z, .jr_0b_6a87                                ;; 0b:6a28 $28 $5d
    dec  A                                             ;; 0b:6a2a $3d
    jp   Z, jp_0b_6ad2                                 ;; 0b:6a2b $ca $d2 $6a
    ld   A, [wCE1C]                                    ;; 0b:6a2e $fa $1c $ce
    call call_0b_67d8                                  ;; 0b:6a31 $cd $d8 $67
    ld   A, B                                          ;; 0b:6a34 $78
    sub  A, $20                                        ;; 0b:6a35 $d6 $20
    jr   C, .jr_0b_6a45                                ;; 0b:6a37 $38 $0c
    ld   B, A                                          ;; 0b:6a39 $47
    call call_0b_6918                                  ;; 0b:6a3a $cd $18 $69
    cp   A, $ff                                        ;; 0b:6a3d $fe $ff
    jr   Z, .jr_0b_6a45                                ;; 0b:6a3f $28 $04
    ld   [wCE1C], A                                    ;; 0b:6a41 $ea $1c $ce
    ret                                                ;; 0b:6a44 $c9
.jr_0b_6a45:
    ld   A, [wCE1D]                                    ;; 0b:6a45 $fa $1d $ce
    and  A, $02                                        ;; 0b:6a48 $e6 $02
    jp   Z, call_00_1e83                               ;; 0b:6a4a $ca $83 $1e
    ld   A, [wCE1C]                                    ;; 0b:6a4d $fa $1c $ce
    ld   [wCE1F], A                                    ;; 0b:6a50 $ea $1f $ce
    call call_0b_6947                                  ;; 0b:6a53 $cd $47 $69
    inc  A                                             ;; 0b:6a56 $3c
    or   A, $40                                        ;; 0b:6a57 $f6 $40
    ld   [wCE1C], A                                    ;; 0b:6a59 $ea $1c $ce
    ret                                                ;; 0b:6a5c $c9
.jr_0b_6a5d:
    ld   A, [wCE1C]                                    ;; 0b:6a5d $fa $1c $ce
    call call_0b_67d8                                  ;; 0b:6a60 $cd $d8 $67
    ld   A, B                                          ;; 0b:6a63 $78
    add  A, $20                                        ;; 0b:6a64 $c6 $20
    ld   B, A                                          ;; 0b:6a66 $47
    call call_0b_6918                                  ;; 0b:6a67 $cd $18 $69
    cp   A, $ff                                        ;; 0b:6a6a $fe $ff
    jr   Z, .jr_0b_6a72                                ;; 0b:6a6c $28 $04
    ld   [wCE1C], A                                    ;; 0b:6a6e $ea $1c $ce
    ret                                                ;; 0b:6a71 $c9
.jr_0b_6a72:
    ld   A, [wCE1D]                                    ;; 0b:6a72 $fa $1d $ce
    and  A, $18                                        ;; 0b:6a75 $e6 $18
    jp   Z, call_00_1e83                               ;; 0b:6a77 $ca $83 $1e
    cp   A, $10                                        ;; 0b:6a7a $fe $10
    jr   Z, .jr_0b_6a81                                ;; 0b:6a7c $28 $03
    xor  A, A                                          ;; 0b:6a7e $af
    jr   .jr_0b_6a83                                   ;; 0b:6a7f $18 $02
.jr_0b_6a81:
    ld   A, $80                                        ;; 0b:6a81 $3e $80
.jr_0b_6a83:
    ld   [wCE1C], A                                    ;; 0b:6a83 $ea $1c $ce
    ret                                                ;; 0b:6a86 $c9
.jr_0b_6a87:
    ld   A, [wCE1C]                                    ;; 0b:6a87 $fa $1c $ce
    call call_0b_67d8                                  ;; 0b:6a8a $cd $d8 $67
.jr_0b_6a8d:
    ld   A, C                                          ;; 0b:6a8d $79
    sub  A, $08                                        ;; 0b:6a8e $d6 $08
    jr   C, jr_0b_6ab1                                 ;; 0b:6a90 $38 $1f
    ld   C, A                                          ;; 0b:6a92 $4f
    push BC                                            ;; 0b:6a93 $c5
    call call_0b_6918                                  ;; 0b:6a94 $cd $18 $69
    pop  BC                                            ;; 0b:6a97 $c1
    cp   A, $ff                                        ;; 0b:6a98 $fe $ff
    jr   NZ, jr_0b_6aad                                ;; 0b:6a9a $20 $11
    call call_0b_6ac5                                  ;; 0b:6a9c $cd $c5 $6a
    push BC                                            ;; 0b:6a9f $c5
    call call_0b_6918                                  ;; 0b:6aa0 $cd $18 $69
    pop  BC                                            ;; 0b:6aa3 $c1
    cp   A, $ff                                        ;; 0b:6aa4 $fe $ff
    jr   NZ, jr_0b_6aad                                ;; 0b:6aa6 $20 $05
    call call_0b_6ac5                                  ;; 0b:6aa8 $cd $c5 $6a
    jr   .jr_0b_6a8d                                   ;; 0b:6aab $18 $e0

jr_0b_6aad:
    ld   [wCE1C], A                                    ;; 0b:6aad $ea $1c $ce
    ret                                                ;; 0b:6ab0 $c9

jr_0b_6ab1:
    ld   A, [wCE1D]                                    ;; 0b:6ab1 $fa $1d $ce
    and  A, $04                                        ;; 0b:6ab4 $e6 $04
    jp   Z, call_00_1e83                               ;; 0b:6ab6 $ca $83 $1e
    ld   A, [wCE1C]                                    ;; 0b:6ab9 $fa $1c $ce
    ld   [wCE1F], A                                    ;; 0b:6abc $ea $1f $ce
    ld   A, $81                                        ;; 0b:6abf $3e $81
    ld   [wCE1C], A                                    ;; 0b:6ac1 $ea $1c $ce
    ret                                                ;; 0b:6ac4 $c9

call_0b_6ac5:
    ld   A, B                                          ;; 0b:6ac5 $78
    cp   A, $20                                        ;; 0b:6ac6 $fe $20
    jr   C, .jr_0b_6ace                                ;; 0b:6ac8 $38 $04
    sub  A, $20                                        ;; 0b:6aca $d6 $20
    jr   .jr_0b_6ad0                                   ;; 0b:6acc $18 $02
.jr_0b_6ace:
    add  A, $20                                        ;; 0b:6ace $c6 $20
.jr_0b_6ad0:
    ld   B, A                                          ;; 0b:6ad0 $47
    ret                                                ;; 0b:6ad1 $c9

jp_0b_6ad2:
    ld   A, [wCE1C]                                    ;; 0b:6ad2 $fa $1c $ce
    call call_0b_67d8                                  ;; 0b:6ad5 $cd $d8 $67
.jr_0b_6ad8:
    ld   A, C                                          ;; 0b:6ad8 $79
    add  A, $08                                        ;; 0b:6ad9 $c6 $08
    cp   A, $98                                        ;; 0b:6adb $fe $98
    jr   NC, jr_0b_6ab1                                ;; 0b:6add $30 $d2
    ld   C, A                                          ;; 0b:6adf $4f
    push BC                                            ;; 0b:6ae0 $c5
    call call_0b_6918                                  ;; 0b:6ae1 $cd $18 $69
    pop  BC                                            ;; 0b:6ae4 $c1
    cp   A, $ff                                        ;; 0b:6ae5 $fe $ff
    jr   NZ, jr_0b_6aad                                ;; 0b:6ae7 $20 $c4
    call call_0b_6ac5                                  ;; 0b:6ae9 $cd $c5 $6a
    push BC                                            ;; 0b:6aec $c5
    call call_0b_6918                                  ;; 0b:6aed $cd $18 $69
    pop  BC                                            ;; 0b:6af0 $c1
    cp   A, $ff                                        ;; 0b:6af1 $fe $ff
    jr   NZ, jr_0b_6aad                                ;; 0b:6af3 $20 $b8
    call call_0b_6ac5                                  ;; 0b:6af5 $cd $c5 $6a
    jr   .jr_0b_6ad8                                   ;; 0b:6af8 $18 $de

call_0b_6afa:
    ld   A, $01                                        ;; 0b:6afa $3e $01
    ld   [wCE24], A                                    ;; 0b:6afc $ea $24 $ce
    ret                                                ;; 0b:6aff $c9

jp_0b_6b00:
    and  A, $01                                        ;; 0b:6b00 $e6 $01
    jr   NZ, .jr_0b_6b72                               ;; 0b:6b02 $20 $6e
    ld   A, [wCE1D]                                    ;; 0b:6b04 $fa $1d $ce
    and  A, $0f                                        ;; 0b:6b07 $e6 $0f
    jp   Z, call_00_1e83                               ;; 0b:6b09 $ca $83 $1e
    and  A, $08                                        ;; 0b:6b0c $e6 $08
    jr   NZ, .jr_0b_6b1a                               ;; 0b:6b0e $20 $0a
    ld   A, [wCE20]                                    ;; 0b:6b10 $fa $20 $ce
    or   A, A                                          ;; 0b:6b13 $b7
    jp   NZ, call_00_1e83                              ;; 0b:6b14 $c2 $83 $1e
    jp   jp_0b_697e                                    ;; 0b:6b17 $c3 $7e $69
.jr_0b_6b1a:
    ld   A, [wCE20]                                    ;; 0b:6b1a $fa $20 $ce
    dec  A                                             ;; 0b:6b1d $3d
    jr   Z, .jr_0b_6b34                                ;; 0b:6b1e $28 $14
    dec  A                                             ;; 0b:6b20 $3d
    jr   Z, .jr_0b_6b44                                ;; 0b:6b21 $28 $21
    dec  A                                             ;; 0b:6b23 $3d
    jr   Z, .jr_0b_6b5b                                ;; 0b:6b24 $28 $35
    ld   A, [wCE1F]                                    ;; 0b:6b26 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6b29 $ea $1c $ce
    ld   A, [wCE21]                                    ;; 0b:6b2c $fa $21 $ce
    dec  A                                             ;; 0b:6b2f $3d
    ret  Z                                             ;; 0b:6b30 $c8
    jp   jp_0b_6bd6                                    ;; 0b:6b31 $c3 $d6 $6b
.jr_0b_6b34:
    ld   A, [wCE21]                                    ;; 0b:6b34 $fa $21 $ce
    dec  A                                             ;; 0b:6b37 $3d
    jp   Z, call_00_1e83                               ;; 0b:6b38 $ca $83 $1e
    ld   A, [wCE1F]                                    ;; 0b:6b3b $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6b3e $ea $1c $ce
    jp   jp_0b_6bd6                                    ;; 0b:6b41 $c3 $d6 $6b
.jr_0b_6b44:
    ld   A, [wCE21]                                    ;; 0b:6b44 $fa $21 $ce
    cp   A, $02                                        ;; 0b:6b47 $fe $02
    jp   Z, call_00_1e83                               ;; 0b:6b49 $ca $83 $1e
    ld   A, [wCE1F]                                    ;; 0b:6b4c $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6b4f $ea $1c $ce
    ld   A, [wCE21]                                    ;; 0b:6b52 $fa $21 $ce
    cp   A, $03                                        ;; 0b:6b55 $fe $03
    ret  Z                                             ;; 0b:6b57 $c8
    jp   jp_0b_6bd6                                    ;; 0b:6b58 $c3 $d6 $6b
.jr_0b_6b5b:
    ld   A, [wCE21]                                    ;; 0b:6b5b $fa $21 $ce
    cp   A, $03                                        ;; 0b:6b5e $fe $03
    jp   Z, call_00_1e83                               ;; 0b:6b60 $ca $83 $1e
    ld   A, [wCE1F]                                    ;; 0b:6b63 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6b66 $ea $1c $ce
    ld   A, [wCE21]                                    ;; 0b:6b69 $fa $21 $ce
    cp   A, $02                                        ;; 0b:6b6c $fe $02
    ret  Z                                             ;; 0b:6b6e $c8
    jp   jp_0b_6bd6                                    ;; 0b:6b6f $c3 $d6 $6b
.jr_0b_6b72:
    ld   A, [wCE1D]                                    ;; 0b:6b72 $fa $1d $ce
    and  A, $01                                        ;; 0b:6b75 $e6 $01
    jp   Z, call_00_1e83                               ;; 0b:6b77 $ca $83 $1e
    ld   A, [wCE20]                                    ;; 0b:6b7a $fa $20 $ce
    dec  A                                             ;; 0b:6b7d $3d
    jr   Z, .jr_0b_6b86                                ;; 0b:6b7e $28 $06
    dec  A                                             ;; 0b:6b80 $3d
    jr   Z, .jr_0b_6b8f                                ;; 0b:6b81 $28 $0c
    dec  A                                             ;; 0b:6b83 $3d
    jr   Z, .jr_0b_6b9e                                ;; 0b:6b84 $28 $18
.jr_0b_6b86:
    ld   A, [wCE1F]                                    ;; 0b:6b86 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6b89 $ea $1c $ce
    jp   jp_0b_6bd6                                    ;; 0b:6b8c $c3 $d6 $6b
.jr_0b_6b8f:
    ld   A, [wCE21]                                    ;; 0b:6b8f $fa $21 $ce
    cp   A, $02                                        ;; 0b:6b92 $fe $02
    jp   Z, call_00_1e83                               ;; 0b:6b94 $ca $83 $1e
    ld   A, [wCE1F]                                    ;; 0b:6b97 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6b9a $ea $1c $ce
    ret                                                ;; 0b:6b9d $c9
.jr_0b_6b9e:
    ld   A, [wCE21]                                    ;; 0b:6b9e $fa $21 $ce
    cp   A, $03                                        ;; 0b:6ba1 $fe $03
    jp   Z, call_00_1e83                               ;; 0b:6ba3 $ca $83 $1e
    ld   A, [wCE1F]                                    ;; 0b:6ba6 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6ba9 $ea $1c $ce
    ret                                                ;; 0b:6bac $c9

jp_0b_6bad:
    and  A, $03                                        ;; 0b:6bad $e6 $03
    jp   Z, jp_0b_6b00                                 ;; 0b:6baf $ca $00 $6b
    ld   A, [wCE1D]                                    ;; 0b:6bb2 $fa $1d $ce
    and  A, $01                                        ;; 0b:6bb5 $e6 $01
    jp   Z, call_00_1e83                               ;; 0b:6bb7 $ca $83 $1e
    ld   A, [wCE20]                                    ;; 0b:6bba $fa $20 $ce
    dec  A                                             ;; 0b:6bbd $3d
    jr   Z, .jr_0b_6bc9                                ;; 0b:6bbe $28 $09
    dec  A                                             ;; 0b:6bc0 $3d
    jr   Z, .jr_0b_6bd0                                ;; 0b:6bc1 $28 $0d
    dec  A                                             ;; 0b:6bc3 $3d
    jr   Z, .jr_0b_6bd0                                ;; 0b:6bc4 $28 $0a
    jp   call_00_1e83                                  ;; 0b:6bc6 $c3 $83 $1e
.jr_0b_6bc9:
    ld   A, [wCE1F]                                    ;; 0b:6bc9 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6bcc $ea $1c $ce
    ret                                                ;; 0b:6bcf $c9
.jr_0b_6bd0:
    ld   A, [wCE1F]                                    ;; 0b:6bd0 $fa $1f $ce
    ld   [wCE1C], A                                    ;; 0b:6bd3 $ea $1c $ce

jp_0b_6bd6:
    ld   A, [wCE20]                                    ;; 0b:6bd6 $fa $20 $ce
    jp   call_0b_698d                                  ;; 0b:6bd9 $c3 $8d $69

call_0b_6bdc:
    ld   HL, wCD4D                                     ;; 0b:6bdc $21 $4d $cd
    ld   A, $ff                                        ;; 0b:6bdf $3e $ff
    ld   [HL+], A                                      ;; 0b:6be1 $22
    ld   A, $d2                                        ;; 0b:6be2 $3e $d2
    jr   jr_0b_6bed                                    ;; 0b:6be4 $18 $07

call_0b_6be6:
    ld   HL, wCD4D                                     ;; 0b:6be6 $21 $4d $cd
    xor  A, A                                          ;; 0b:6be9 $af
    ld   [HL+], A                                      ;; 0b:6bea $22
    ld   A, $da                                        ;; 0b:6beb $3e $da

jr_0b_6bed:
    ld   [HL+], A                                      ;; 0b:6bed $22
    ld   A, $24                                        ;; 0b:6bee $3e $24
    ld   [HL+], A                                      ;; 0b:6bf0 $22
    ld   A, $6c                                        ;; 0b:6bf1 $3e $6c
    ld   [HL+], A                                      ;; 0b:6bf3 $22
    ld   A, $c3                                        ;; 0b:6bf4 $3e $c3
    ld   [HL+], A                                      ;; 0b:6bf6 $22
    ld   A, $1e                                        ;; 0b:6bf7 $3e $1e
    ld   [HL+], A                                      ;; 0b:6bf9 $22
    ld   [HL], $6c                                     ;; 0b:6bfa $36 $6c
    xor  A, A                                          ;; 0b:6bfc $af
    push AF                                            ;; 0b:6bfd $f5
    call call_0b_6c2d                                  ;; 0b:6bfe $cd $2d $6c
    ld   C, A                                          ;; 0b:6c01 $4f
    ld   B, $08                                        ;; 0b:6c02 $06 $08
    ld   E, $ff                                        ;; 0b:6c04 $1e $ff
    ld   A, [wCD4D]                                    ;; 0b:6c06 $fa $4d $cd
    ld   D, A                                          ;; 0b:6c09 $57
    ld   HL, wCC41                                     ;; 0b:6c0a $21 $41 $cc
.jr_0b_6c0d:
    ld   A, [HL+]                                      ;; 0b:6c0d $2a
    rrc  C                                             ;; 0b:6c0e $cb $09
    jr   NC, .jr_0b_6c24                               ;; 0b:6c10 $30 $12
    cp   A, E                                          ;; 0b:6c12 $bb
    jr   Z, .jr_0b_6c19                                ;; 0b:6c13 $28 $04
    jr   C, .jr_0b_6c1e                                ;; 0b:6c15 $38 $07
    jr   .jr_0b_6c24                                   ;; 0b:6c17 $18 $0b
.jr_0b_6c19:
    ld   A, [HL]                                       ;; 0b:6c19 $7e
    cp   A, D                                          ;; 0b:6c1a $ba
    jp   wCD4E                                         ;; 0b:6c1b $c3 $4e $cd
.jr_0b_6c1e:
    ld   A, [HL-]                                      ;; 0b:6c1e $3a
    ld   D, A                                          ;; 0b:6c1f $57
    ld   A, [HL+]                                      ;; 0b:6c20 $2a
    ld   E, A                                          ;; 0b:6c21 $5f
    pop  AF                                            ;; 0b:6c22 $f1
    push BC                                            ;; 0b:6c23 $c5
.jr_0b_6c24:
    inc  HL                                            ;; 0b:6c24 $23
    dec  B                                             ;; 0b:6c25 $05
    jr   NZ, .jr_0b_6c0d                               ;; 0b:6c26 $20 $e5
    pop  BC                                            ;; 0b:6c28 $c1
    ld   A, $0d                                        ;; 0b:6c29 $3e $0d
    sub  A, B                                          ;; 0b:6c2b $90
    ret                                                ;; 0b:6c2c $c9

call_0b_6c2d:
    ld   HL, wCC5E                                     ;; 0b:6c2d $21 $5e $cc
    ld   A, [HL+]                                      ;; 0b:6c30 $2a
    or   A, [HL]                                       ;; 0b:6c31 $b6
    inc  HL                                            ;; 0b:6c32 $23
    or   A, [HL]                                       ;; 0b:6c33 $b6
    ret                                                ;; 0b:6c34 $c9
    inc  HL                                            ;; 0b:6c35 $23
    push HL                                            ;; 0b:6c36 $e5
    ld   HL, .data_0b_6c4a                             ;; 0b:6c37 $21 $4a $6c
.jr_0b_6c3a:
    inc  HL                                            ;; 0b:6c3a $23
    inc  HL                                            ;; 0b:6c3b $23
    cp   A, [HL]                                       ;; 0b:6c3c $be
    jr   NZ, .jr_0b_6c3a                               ;; 0b:6c3d $20 $fb
    inc  HL                                            ;; 0b:6c3f $23
    ld   A, [HL]                                       ;; 0b:6c40 $7e
    push HL                                            ;; 0b:6c41 $e5
    ld   HL, SP+1                                      ;; 0b:6c42 $f8 $01
    ld   [HL-], A                                      ;; 0b:6c44 $32
    ld   [HL], C                                       ;; 0b:6c45 $71
    call call_00_2ef6                                  ;; 0b:6c46 $cd $f6 $2e
    pop  HL                                            ;; 0b:6c49 $e1
.data_0b_6c4a:
    pop  HL                                            ;; 0b:6c4a $e1
    ret                                                ;; 0b:6c4b $c9
    db   $32, $26, $3d, $28, $3b, $27, $13, $1d        ;; 0b:6c4c ?.?.?.?.
    db   $12, $1c, $3f, $1b, $0a, $10, $0d, $0e        ;; 0b:6c54 ?.?.?.?.
    db   $38, $12, $b7, $20, $03, $df, $08, $c9        ;; 0b:6c5c ?.??????
    db   $c5, $06, $05, $21, $01, $c5, $7e, $e6        ;; 0b:6c64 ????????
    db   $03, $77, $3e, $60, $c7, $05, $20, $f6        ;; 0b:6c6c ????????
    db   $c1, $c9                                      ;; 0b:6c74 ??
    push HL                                            ;; 0b:6c76 $e5
    push BC                                            ;; 0b:6c77 $c5
    push AF                                            ;; 0b:6c78 $f5
    ld   HL, $9800                                     ;; 0b:6c79 $21 $00 $98
    ld   BC, $800                                      ;; 0b:6c7c $01 $00 $08
    ld   A, $ff                                        ;; 0b:6c7f $3e $ff
    rst  rst_00_0018                                   ;; 0b:6c81 $df
    db   $9f                                           ;; 0b:6c82 .
    pop  AF                                            ;; 0b:6c83 $f1
    pop  BC                                            ;; 0b:6c84 $c1
    pop  HL                                            ;; 0b:6c85 $e1
    ret                                                ;; 0b:6c86 $c9
    push HL                                            ;; 0b:6c87 $e5
    rst  rst_00_0018                                   ;; 0b:6c88 $df
    db   $a9                                           ;; 0b:6c89 .
    ld   A, [wCD34]                                    ;; 0b:6c8a $fa $34 $cd
    and  A, $08                                        ;; 0b:6c8d $e6 $08
    jr   Z, .jr_0b_6c94                                ;; 0b:6c8f $28 $03
    call call_00_35af                                  ;; 0b:6c91 $cd $af $35
.jr_0b_6c94:
    pop  HL                                            ;; 0b:6c94 $e1
    ret                                                ;; 0b:6c95 $c9
    db   $21, $cf, $6c, $2a, $b7, $c8, $e5, $df        ;; 0b:6c96 ????????
    db   $ac, $e1, $cd, $af, $6c, $cd, $c5, $6c        ;; 0b:6c9e ????????
    db   $cd, $af, $6c, $e5, $df, $9e, $e1, $18        ;; 0b:6ca6 ????????
    db   $ea, $2a, $46, $23, $e5, $6f, $60, $11        ;; 0b:6cae ????????
    db   $01, $01, $01, $12, $06, $3e, $24, $df        ;; 0b:6cb6 ????????
    db   $e0, $3e, $f4, $cd, $6d, $3a, $e1, $fa        ;; 0b:6cbe ????????
    db   $c2, $cd, $3d, $c8, $cd, $93, $35, $18        ;; 0b:6cc6 ????????
    db   $f9, $73, $4b, $7b, $56, $7b, $74, $74        ;; 0b:6cce ????????
    db   $7b, $8d, $7b, $75, $bf, $7b, $e9, $7b        ;; 0b:6cd6 ????????
    db   $76, $1c, $7c, $47, $7c, $77, $7b, $7c        ;; 0b:6cde ????????
    db   $cc, $7c, $78, $ff, $7c, $2d, $7d, $00        ;; 0b:6ce6 ????????
    call call_00_1d9e                                  ;; 0b:6cee $cd $9e $1d
    xor  A, A                                          ;; 0b:6cf1 $af
    ld   [wCE88], A                                    ;; 0b:6cf2 $ea $88 $ce
    rst  rst_00_0018                                   ;; 0b:6cf5 $df
    db   $1c                                           ;; 0b:6cf6 .
    rst  rst_00_0018                                   ;; 0b:6cf7 $df
    db   $ba                                           ;; 0b:6cf8 .
    call call_00_3a24                                  ;; 0b:6cf9 $cd $24 $3a
    xor  A, A                                          ;; 0b:6cfc $af
    ldh  [rSCX], A                                     ;; 0b:6cfd $e0 $43
    ld   A, $40                                        ;; 0b:6cff $3e $40
    ldh  [rSCY], A                                     ;; 0b:6d01 $e0 $42
    ret                                                ;; 0b:6d03 $c9
    xor  A, A                                          ;; 0b:6d04 $af
    ldh  [rWY], A                                      ;; 0b:6d05 $e0 $4a
    ld   A, $07                                        ;; 0b:6d07 $3e $07
    ldh  [rWX], A                                      ;; 0b:6d09 $e0 $4b
    jp   call_00_3a44                                  ;; 0b:6d0b $c3 $44 $3a
    db   $3e, $50, $18, $f3                            ;; 0b:6d0e ????
    ld   A, [wCD37]                                    ;; 0b:6d12 $fa $37 $cd
    or   A, A                                          ;; 0b:6d15 $b7
    jr   Z, .jr_0b_6d1d                                ;; 0b:6d16 $28 $05
    ld   A, [wD203]                                    ;; 0b:6d18 $fa $03 $d2
    jr   .jr_0b_6d20                                   ;; 0b:6d1b $18 $03
.jr_0b_6d1d:
    ld   A, [wC683]                                    ;; 0b:6d1d $fa $83 $c6
.jr_0b_6d20:
    inc  A                                             ;; 0b:6d20 $3c
    ret                                                ;; 0b:6d21 $c9
    push DE                                            ;; 0b:6d22 $d5
    ld   B, $0f                                        ;; 0b:6d23 $06 $0f
    ld   A, [wCDAF]                                    ;; 0b:6d25 $fa $af $cd
    ld   E, A                                          ;; 0b:6d28 $5f
    and  A, $f0                                        ;; 0b:6d29 $e6 $f0
    jr   NZ, .jr_0b_6d36                               ;; 0b:6d2b $20 $09
    ld   B, $08                                        ;; 0b:6d2d $06 $08
    ldh  A, [hFF8A]                                    ;; 0b:6d2f $f0 $8a
    ld   D, A                                          ;; 0b:6d31 $57
    and  A, $f0                                        ;; 0b:6d32 $e6 $f0
    jr   Z, .jr_0b_6d42                                ;; 0b:6d34 $28 $0c
.jr_0b_6d36:
    pop  DE                                            ;; 0b:6d36 $d1
    ld   A, [wCD38]                                    ;; 0b:6d37 $fa $38 $cd
    or   A, A                                          ;; 0b:6d3a $b7
    jr   Z, .jr_0b_6d4b                                ;; 0b:6d3b $28 $0e
    dec  B                                             ;; 0b:6d3d $05
    jr   Z, .jr_0b_6d5e                                ;; 0b:6d3e $28 $1e
    jr   .jr_0b_6d4b                                   ;; 0b:6d40 $18 $09
.jr_0b_6d42:
    ld   A, E                                          ;; 0b:6d42 $7b
    or   A, D                                          ;; 0b:6d43 $b2
    pop  DE                                            ;; 0b:6d44 $d1
    and  A, $0b                                        ;; 0b:6d45 $e6 $0b
    jr   Z, .jr_0b_6d5e                                ;; 0b:6d47 $28 $15
    ld   B, $1e                                        ;; 0b:6d49 $06 $1e
.jr_0b_6d4b:
    ldh  A, [hFF8A]                                    ;; 0b:6d4b $f0 $8a
    and  A, $04                                        ;; 0b:6d4d $e6 $04
    jr   Z, .jr_0b_6d53                                ;; 0b:6d4f $28 $02
    ld   B, $01                                        ;; 0b:6d51 $06 $01
.jr_0b_6d53:
    call call_00_358b                                  ;; 0b:6d53 $cd $8b $35
    ldh  A, [hFF8B]                                    ;; 0b:6d56 $f0 $8b
    or   A, A                                          ;; 0b:6d58 $b7
    jr   NZ, .jr_0b_6d5e                               ;; 0b:6d59 $20 $03
    dec  B                                             ;; 0b:6d5b $05
    jr   NZ, .jr_0b_6d53                               ;; 0b:6d5c $20 $f5
.jr_0b_6d5e:
    xor  A, A                                          ;; 0b:6d5e $af
    ld   [wCD38], A                                    ;; 0b:6d5f $ea $38 $cd
    ret                                                ;; 0b:6d62 $c9
    ld   A, [wCE94]                                    ;; 0b:6d63 $fa $94 $ce
    push AF                                            ;; 0b:6d66 $f5
    rst  rst_00_0018                                   ;; 0b:6d67 $df
    db   $0f                                           ;; 0b:6d68 .
    pop  DE                                            ;; 0b:6d69 $d1
    ld   A, [HL]                                       ;; 0b:6d6a $7e
    ld   HL, wCE7C                                     ;; 0b:6d6b $21 $7c $ce
    ld   [HL+], A                                      ;; 0b:6d6e $22
    xor  A, A                                          ;; 0b:6d6f $af
    ld   [HL+], A                                      ;; 0b:6d70 $22
    ld   [HL+], A                                      ;; 0b:6d71 $22
    ld   HL, wCE94                                     ;; 0b:6d72 $21 $94 $ce
    ld   A, [HL]                                       ;; 0b:6d75 $7e
    cp   A, D                                          ;; 0b:6d76 $ba
    jr   Z, .jr_0b_6d88                                ;; 0b:6d77 $28 $0f
    ld   [HL], D                                       ;; 0b:6d79 $72
    ld   HL, $731a                                     ;; 0b:6d7a $21 $1a $73
    ld   A, $3b                                        ;; 0b:6d7d $3e $3b
    inc  B                                             ;; 0b:6d7f $04
    dec  B                                             ;; 0b:6d80 $05
    jr   NZ, .jr_0b_6d99                               ;; 0b:6d81 $20 $16
    ld   HL, data_0b_7260                              ;; 0b:6d83 $21 $60 $72
    jr   .jr_0b_6d99                                   ;; 0b:6d86 $18 $11
.jr_0b_6d88:
    ld   HL, data_0b_724e                              ;; 0b:6d88 $21 $4e $72
    cp   A, $d8                                        ;; 0b:6d8b $fe $d8
    jr   C, .jr_0b_6d97                                ;; 0b:6d8d $38 $08
    cp   A, $ea                                        ;; 0b:6d8f $fe $ea
    jr   NC, .jr_0b_6d97                               ;; 0b:6d91 $30 $04
    ld   A, $3d                                        ;; 0b:6d93 $3e $3d
    jr   .jr_0b_6d99                                   ;; 0b:6d95 $18 $02
.jr_0b_6d97:
    ld   A, $35                                        ;; 0b:6d97 $3e $35
.jr_0b_6d99:
    ldh  [hFFBC], A                                    ;; 0b:6d99 $e0 $bc
    ldh  A, [rLCDC]                                    ;; 0b:6d9b $f0 $40
    bit  5, A                                          ;; 0b:6d9d $cb $6f
    push AF                                            ;; 0b:6d9f $f5
    ld   A, $40                                        ;; 0b:6da0 $3e $40
    jr   NZ, .jr_0b_6da6                               ;; 0b:6da2 $20 $02
    ld   A, $08                                        ;; 0b:6da4 $3e $08
.jr_0b_6da6:
    ld   BC, $612                                      ;; 0b:6da6 $01 $12 $06
    ld   DE, $101                                      ;; 0b:6da9 $11 $01 $01
    rst  rst_00_0018                                   ;; 0b:6dac $df
    db   $90                                           ;; 0b:6dad .
    pop  AF                                            ;; 0b:6dae $f1
    jp   Z, call_00_35d2                               ;; 0b:6daf $ca $d2 $35
    ret                                                ;; 0b:6db2 $c9
    db   $e5, $d5, $c5, $11, $02, $01, $fa, $37        ;; 0b:6db3 ????????
    db   $cd, $b7, $20, $02, $16, $08, $df, $69        ;; 0b:6dbb ????????
    db   $c1, $d1, $e1, $c9                            ;; 0b:6dc3 ????

call_0b_6dc7:
    ld   A, [HL+]                                      ;; 0b:6dc7 $2a
    ld   B, A                                          ;; 0b:6dc8 $47
    ld   C, [HL]                                       ;; 0b:6dc9 $4e
    and  A, $07                                        ;; 0b:6dca $e6 $07
    cp   A, $02                                        ;; 0b:6dcc $fe $02
    ld   A, C                                          ;; 0b:6dce $79
    jr   NZ, .jr_0b_6dd8                               ;; 0b:6dcf $20 $07
    ld   A, B                                          ;; 0b:6dd1 $78
    swap A                                             ;; 0b:6dd2 $cb $37
    rlca                                               ;; 0b:6dd4 $07
    and  A, $0f                                        ;; 0b:6dd5 $e6 $0f
    add  A, C                                          ;; 0b:6dd7 $81
.jr_0b_6dd8:
    ld   HL, data_0b_748f                              ;; 0b:6dd8 $21 $8f $74
    rst  add_hl_a                                      ;; 0b:6ddb $c7
    ld   A, [HL]                                       ;; 0b:6ddc $7e
    ret                                                ;; 0b:6ddd $c9

call_0b_6dde:
    ld   HL, data_0b_7573                              ;; 0b:6dde $21 $73 $75
    rst  add_hl_a                                      ;; 0b:6de1 $c7
    ld   A, [HL]                                       ;; 0b:6de2 $7e
    ret                                                ;; 0b:6de3 $c9
    push AF                                            ;; 0b:6de4 $f5
    call call_00_2437                                  ;; 0b:6de5 $cd $37 $24
    ld   DE, wCE00                                     ;; 0b:6de8 $11 $00 $ce
    add  HL, DE                                        ;; 0b:6deb $19
    xor  A, A                                          ;; 0b:6dec $af
    call call_00_1f55                                  ;; 0b:6ded $cd $55 $1f
    pop  AF                                            ;; 0b:6df0 $f1
    cp   A, $03                                        ;; 0b:6df1 $fe $03
    jr   Z, .jr_0b_6e15                                ;; 0b:6df3 $28 $20
.jr_0b_6df5:
    push BC                                            ;; 0b:6df5 $c5
    ld   HL, $60                                       ;; 0b:6df6 $21 $60 $00
    call call_00_246b                                  ;; 0b:6df9 $cd $6b $24
    ld   DE, wC500                                     ;; 0b:6dfc $11 $00 $c5
    add  HL, DE                                        ;; 0b:6dff $19
    pop  AF                                            ;; 0b:6e00 $f1
    push HL                                            ;; 0b:6e01 $e5
    call call_0b_6dde                                  ;; 0b:6e02 $cd $de $6d
    ld   HL, $60                                       ;; 0b:6e05 $21 $60 $00
    call call_00_246b                                  ;; 0b:6e08 $cd $6b $24
    ld   DE, data_0b_7a81                              ;; 0b:6e0b $11 $81 $7a
    add  HL, DE                                        ;; 0b:6e0e $19
    pop  DE                                            ;; 0b:6e0f $d1
    ld   B, $60                                        ;; 0b:6e10 $06 $60
    rst  rst_00_0018                                   ;; 0b:6e12 $df
    db   $73                                           ;; 0b:6e13 .
    ret                                                ;; 0b:6e14 $c9
.jr_0b_6e15:
    ld   C, A                                          ;; 0b:6e15 $4f
    ld   A, B                                          ;; 0b:6e16 $78
    cp   A, $06                                        ;; 0b:6e17 $fe $06
    ld   A, C                                          ;; 0b:6e19 $79
    jr   NZ, .jr_0b_6df5                               ;; 0b:6e1a $20 $d9
    ld   HL, wC680                                     ;; 0b:6e1c $21 $80 $c6
    ld   DE, wC620                                     ;; 0b:6e1f $11 $20 $c6
    ld   B, $60                                        ;; 0b:6e22 $06 $60
    rst  rst_00_0018                                   ;; 0b:6e24 $df
    db   $03                                           ;; 0b:6e25 .
    ld   HL, data_0b_7ba4                              ;; 0b:6e26 $21 $a4 $7b
    ld   DE, wC623                                     ;; 0b:6e29 $11 $23 $c6
    ld   B, $01                                        ;; 0b:6e2c $06 $01
    rst  rst_00_0018                                   ;; 0b:6e2e $df
    db   $73                                           ;; 0b:6e2f .
    jp   call_00_1e46                                  ;; 0b:6e30 $c3 $46 $1e
    ld   HL, $60                                       ;; 0b:6e33 $21 $60 $00
    call call_00_246b                                  ;; 0b:6e36 $cd $6b $24
    ld   DE, wC503                                     ;; 0b:6e39 $11 $03 $c5
    add  HL, DE                                        ;; 0b:6e3c $19
    ld   [HL], $ff                                     ;; 0b:6e3d $36 $ff
    ret                                                ;; 0b:6e3f $c9
    db   $df, $2c, $cd, $47, $40, $cd, $cf, $20        ;; 0b:6e40 ????????
    db   $cd, $d1, $6e, $3e, $40, $e0, $4a, $cd        ;; 0b:6e48 ????????
    db   $65, $6e, $21, $ca, $26, $11, $01, $01        ;; 0b:6e50 ????????
    db   $01, $12, $08, $3e, $24, $df, $90, $3e        ;; 0b:6e58 ????????
    db   $02, $ea, $37, $cd, $c9, $21, $00, $c0        ;; 0b:6e60 ????????
    db   $11, $04, $00, $06, $28, $af, $77, $19        ;; 0b:6e68 ????????
    db   $05, $20, $fb, $c9                            ;; 0b:6e70 ????

call_0b_6e74:
    call call_00_1fc4                                  ;; 0b:6e74 $cd $c4 $1f
    ld   DE, wC551                                     ;; 0b:6e77 $11 $51 $c5
    add  HL, DE                                        ;; 0b:6e7a $19
    ld   A, [wCE94]                                    ;; 0b:6e7b $fa $94 $ce
.jr_0b_6e7e:
    sub  A, $10                                        ;; 0b:6e7e $d6 $10
    jr   C, .jr_0b_6e86                                ;; 0b:6e80 $38 $04
    inc  HL                                            ;; 0b:6e82 $23
    inc  HL                                            ;; 0b:6e83 $23
    jr   .jr_0b_6e7e                                   ;; 0b:6e84 $18 $f8
.jr_0b_6e86:
    add  A, $10                                        ;; 0b:6e86 $c6 $10
    ld   D, [HL]                                       ;; 0b:6e88 $56
    inc  HL                                            ;; 0b:6e89 $23
    ld   E, [HL]                                       ;; 0b:6e8a $5e
    ld   B, A                                          ;; 0b:6e8b $47
    or   A, A                                          ;; 0b:6e8c $b7
    jr   Z, .jr_0b_6e9a                                ;; 0b:6e8d $28 $0b
.jr_0b_6e8f:
    srl  D                                             ;; 0b:6e8f $cb $3a
    rr   E                                             ;; 0b:6e91 $cb $1b
    jr   NC, .jr_0b_6e97                               ;; 0b:6e93 $30 $02
    set  7, D                                          ;; 0b:6e95 $cb $fa
.jr_0b_6e97:
    dec  A                                             ;; 0b:6e97 $3d
    jr   NZ, .jr_0b_6e8f                               ;; 0b:6e98 $20 $f5
.jr_0b_6e9a:
    set  0, E                                          ;; 0b:6e9a $cb $c3
    ld   A, $10                                        ;; 0b:6e9c $3e $10
    sub  A, B                                          ;; 0b:6e9e $90
.jr_0b_6e9f:
    srl  D                                             ;; 0b:6e9f $cb $3a
    rr   E                                             ;; 0b:6ea1 $cb $1b
    jr   NC, .jr_0b_6ea7                               ;; 0b:6ea3 $30 $02
    set  7, D                                          ;; 0b:6ea5 $cb $fa
.jr_0b_6ea7:
    dec  A                                             ;; 0b:6ea7 $3d
    jr   NZ, .jr_0b_6e9f                               ;; 0b:6ea8 $20 $f5
    ld   [HL], E                                       ;; 0b:6eaa $73
    dec  HL                                            ;; 0b:6eab $2b
    ld   [HL], D                                       ;; 0b:6eac $72
    ret                                                ;; 0b:6ead $c9
    db   $fa, $84, $ce, $3d, $21, $5e, $cc, $c7        ;; 0b:6eae ????????
    ld   C, [HL]                                       ;; 0b:6eb6 $4e
    ld   A, $ff                                        ;; 0b:6eb7 $3e $ff
.jr_0b_6eb9:
    inc  A                                             ;; 0b:6eb9 $3c
    rrc  C                                             ;; 0b:6eba $cb $09
    jr   NC, .jr_0b_6eb9                               ;; 0b:6ebc $30 $fb
    add  A, $05                                        ;; 0b:6ebe $c6 $05
    ld   [wCE8F], A                                    ;; 0b:6ec0 $ea $8f $ce
    ld   C, [HL]                                       ;; 0b:6ec3 $4e
    ld   A, $08                                        ;; 0b:6ec4 $3e $08
.jr_0b_6ec6:
    dec  A                                             ;; 0b:6ec6 $3d
    rlc  C                                             ;; 0b:6ec7 $cb $01
    jr   NC, .jr_0b_6ec6                               ;; 0b:6ec9 $30 $fb
    add  A, $05                                        ;; 0b:6ecb $c6 $05
    ld   [wCE90], A                                    ;; 0b:6ecd $ea $90 $ce
    ret                                                ;; 0b:6ed0 $c9

call_0b_6ed1:
    ld   HL, wCE95                                     ;; 0b:6ed1 $21 $95 $ce
    ld   A, $01                                        ;; 0b:6ed4 $3e $01
    ld   [HL+], A                                      ;; 0b:6ed6 $22
    ld   [HL], A                                       ;; 0b:6ed7 $77
    ret                                                ;; 0b:6ed8 $c9
    db   $fa, $36, $cd, $f5, $cd, $98, $1d, $21        ;; 0b:6ed9 ????????
    db   $40, $ff, $cb, $96, $df, $0b, $cd, $ae        ;; 0b:6ee1 ????????
    db   $5d, $3e, $08, $ea, $1d, $ce, $f1, $ea        ;; 0b:6ee9 ????????
    db   $36, $cd, $21, $03, $d2, $7e, $f5, $36        ;; 0b:6ef1 ????????
    db   $ff, $cd, $67, $6f, $df, $05, $17, $6f        ;; 0b:6ef9 ????????
    db   $3d, $6f, $83, $1e, $83, $1e, $0f, $6f        ;; 0b:6f01 ????????
    db   $0f, $6f, $83, $1e, $83, $1e, $21, $81        ;; 0b:6f09 ????????
    db   $c0, $7e, $ee, $e0, $77, $c9, $fa, $81        ;; 0b:6f11 ????????
    db   $c0, $fe, $60, $20, $1f, $cd, $18, $67        ;; 0b:6f19 ????????
    db   $fa, $1c, $ce, $fe, $ff, $28, $3c, $cd        ;; 0b:6f21 ????????
    db   $cd, $1f, $11, $01, $c5, $19, $2a, $b6        ;; 0b:6f29 ????????
    db   $e6, $c0, $fa, $1c, $ce, $c4, $83, $1e        ;; 0b:6f31 ????????
    db   $20, $e3, $18, $05, $3e, $ff, $ea, $c3        ;; 0b:6f39 ????????
    db   $cd, $e1, $e1, $ea, $36, $cd, $3c, $28        ;; 0b:6f41 ????????
    db   $13, $cd, $cf, $20, $21, $ca, $26, $11        ;; 0b:6f49 ????????
    db   $01, $01, $01, $12, $08, $3e, $24, $df        ;; 0b:6f51 ????????
    db   $90, $cd, $d1, $6e, $f1, $ea, $03, $d2        ;; 0b:6f59 ????????
    db   $c3, $f3, $1d, $cd, $8d, $6f, $af, $ea        ;; 0b:6f61 ????????
    db   $1c, $ce, $fa, $36, $cd, $fe, $78, $38        ;; 0b:6f69 ????????
    db   $05, $21, $d1, $74, $18, $03, $21, $c4        ;; 0b:6f71 ????????
    db   $74, $11, $0b, $05, $01, $08, $04, $3e        ;; 0b:6f79 ????????
    db   $24, $df, $90, $21, $80, $c0, $3e, $90        ;; 0b:6f81 ????????
    db   $22, $36, $60, $c9, $cd, $d2, $66, $21        ;; 0b:6f89 ????????
    db   $8d, $ce, $2a, $66, $6f, $11, $01, $01        ;; 0b:6f91 ????????
    db   $01, $12, $08, $3e, $24, $df, $90, $c9        ;; 0b:6f99 ????????
    ld   A, [wC9BF]                                    ;; 0b:6fa1 $fa $bf $c9
    dec  A                                             ;; 0b:6fa4 $3d
    cp   A, $02                                        ;; 0b:6fa5 $fe $02
    jr   C, .jr_0b_6fb6                                ;; 0b:6fa7 $38 $0d
    jr   NZ, .jr_0b_6fb3                               ;; 0b:6fa9 $20 $08
    ld   A, [wC981]                                    ;; 0b:6fab $fa $81 $c9
    cp   A, $02                                        ;; 0b:6fae $fe $02
    call Z, call_0b_6ff5                               ;; 0b:6fb0 $cc $f5 $6f
.jr_0b_6fb3:
    xor  A, A                                          ;; 0b:6fb3 $af
    jr   .jr_0b_6fb8                                   ;; 0b:6fb4 $18 $02
.jr_0b_6fb6:
    ld   A, $04                                        ;; 0b:6fb6 $3e $04
.jr_0b_6fb8:
    ld   [wCE97], A                                    ;; 0b:6fb8 $ea $97 $ce
    ld   HL, wCE95                                     ;; 0b:6fbb $21 $95 $ce
    push HL                                            ;; 0b:6fbe $e5
    ld   A, [HL+]                                      ;; 0b:6fbf $2a
    ld   E, A                                          ;; 0b:6fc0 $5f
    ld   D, [HL]                                       ;; 0b:6fc1 $56
    ld   A, [wCD37]                                    ;; 0b:6fc2 $fa $37 $cd
    dec  A                                             ;; 0b:6fc5 $3d
    jr   NZ, jr_0b_700e                                ;; 0b:6fc6 $20 $46
    ldh  A, [rWY]                                      ;; 0b:6fc8 $f0 $4a
    cp   A, $58                                        ;; 0b:6fca $fe $58
    ld   A, $01                                        ;; 0b:6fcc $3e $01
    jr   Z, jr_0b_6fd9                                 ;; 0b:6fce $28 $09
    ld   A, $58                                        ;; 0b:6fd0 $3e $58

jr_0b_6fd2:
    ldh  [rWY], A                                      ;; 0b:6fd2 $e0 $4a
    ld   A, $21                                        ;; 0b:6fd4 $3e $21
    ld   DE, $101                                      ;; 0b:6fd6 $11 $01 $01

jr_0b_6fd9:
    push AF                                            ;; 0b:6fd9 $f5
    ld   HL, wCE8D                                     ;; 0b:6fda $21 $8d $ce
    ld   A, [HL+]                                      ;; 0b:6fdd $2a
    ld   H, [HL]                                       ;; 0b:6fde $66
    ld   L, A                                          ;; 0b:6fdf $6f
    ld   A, [wCE97]                                    ;; 0b:6fe0 $fa $97 $ce
    ld   B, A                                          ;; 0b:6fe3 $47
    pop  AF                                            ;; 0b:6fe4 $f1
    or   A, B                                          ;; 0b:6fe5 $b0
    ld   BC, $512                                      ;; 0b:6fe6 $01 $12 $05
    rst  rst_00_0018                                   ;; 0b:6fe9 $df
    db   $90                                           ;; 0b:6fea .
    pop  HL                                            ;; 0b:6feb $e1
    ld   A, E                                          ;; 0b:6fec $7b
    ld   [HL+], A                                      ;; 0b:6fed $22
    ld   [HL], D                                       ;; 0b:6fee $72
    ld   A, [wC9BF]                                    ;; 0b:6fef $fa $bf $c9
    cp   A, $02                                        ;; 0b:6ff2 $fe $02
    ret  NZ                                            ;; 0b:6ff4 $c0

call_0b_6ff5:
    ld   HL, wCD0A                                     ;; 0b:6ff5 $21 $0a $cd
    ld   A, [HL]                                       ;; 0b:6ff8 $7e
    ld   [HL], $05                                     ;; 0b:6ff9 $36 $05
    push AF                                            ;; 0b:6ffb $f5
    push HL                                            ;; 0b:6ffc $e5
    ld   HL, .data_0b_700d                             ;; 0b:6ffd $21 $0d $70
    call call_00_2766                                  ;; 0b:7000 $cd $66 $27
    call call_00_2745                                  ;; 0b:7003 $cd $45 $27
    call call_0b_6ed1                                  ;; 0b:7006 $cd $d1 $6e
    pop  HL                                            ;; 0b:7009 $e1
    pop  AF                                            ;; 0b:700a $f1
    ld   [HL], A                                       ;; 0b:700b $77
    ret                                                ;; 0b:700c $c9
.data_0b_700d:
    db   $3c                                           ;; 0b:700d ?

jr_0b_700e:
    ldh  A, [rWY]                                      ;; 0b:700e $f0 $4a
    cp   A, $40                                        ;; 0b:7010 $fe $40
    ld   A, $01                                        ;; 0b:7012 $3e $01
    jr   Z, jr_0b_6fd9                                 ;; 0b:7014 $28 $c3
    ld   A, $40                                        ;; 0b:7016 $3e $40
    jr   jr_0b_6fd2                                    ;; 0b:7018 $18 $b8
    ld   HL, wCE8C                                     ;; 0b:701a $21 $8c $ce
    ld   A, [HL]                                       ;; 0b:701d $7e
    inc  A                                             ;; 0b:701e $3c
    ret  Z                                             ;; 0b:701f $c8
    call call_00_1e8f                                  ;; 0b:7020 $cd $8f $1e
    ld   DE, wCE3C                                     ;; 0b:7023 $11 $3c $ce
    ld   B, C                                          ;; 0b:7026 $41
    rst  rst_00_0018                                   ;; 0b:7027 $df
    db   $e3                                           ;; 0b:7028 .
    ld   L, E                                          ;; 0b:7029 $6b
    ld   H, D                                          ;; 0b:702a $62
    ld   B, $ff                                        ;; 0b:702b $06 $ff
    ld   [HL], B                                       ;; 0b:702d $70
.jr_0b_702e:
    ld   A, [HL-]                                      ;; 0b:702e $3a
    cp   A, B                                          ;; 0b:702f $b8
    jr   Z, .jr_0b_702e                                ;; 0b:7030 $28 $fc
    inc  HL                                            ;; 0b:7032 $23

data_0b_7033:
    inc  HL                                            ;; 0b:7033 $23
    ld   [HL], $00                                     ;; 0b:7034 $36 $00
    ret                                                ;; 0b:7036 $c9
    ld   HL, wC6FF                                     ;; 0b:7037 $21 $ff $c6
    ld   DE, $02                                       ;; 0b:703a $11 $02 $00
    ld   B, $18                                        ;; 0b:703d $06 $18
    ld   A, [wCE94]                                    ;; 0b:703f $fa $94 $ce
.jr_0b_7042:
    cp   A, [HL]                                       ;; 0b:7042 $be
    jr   Z, .jr_0b_705d                                ;; 0b:7043 $28 $18
    add  HL, DE                                        ;; 0b:7045 $19
    dec  B                                             ;; 0b:7046 $05
    jr   NZ, .jr_0b_7042                               ;; 0b:7047 $20 $f9
    ld   HL, wC6FF                                     ;; 0b:7049 $21 $ff $c6
    ld   B, $18                                        ;; 0b:704c $06 $18
    ld   A, $ff                                        ;; 0b:704e $3e $ff
.jr_0b_7050:
    cp   A, [HL]                                       ;; 0b:7050 $be
    jr   Z, .jr_0b_7065                                ;; 0b:7051 $28 $12
    add  HL, DE                                        ;; 0b:7053 $19
    dec  B                                             ;; 0b:7054 $05
    jr   NZ, .jr_0b_7050                               ;; 0b:7055 $20 $f9
.jr_0b_7057:
    ld   A, $ff                                        ;; 0b:7057 $3e $ff
    ld   [wCE94], A                                    ;; 0b:7059 $ea $94 $ce
    ret                                                ;; 0b:705c $c9
.jr_0b_705d:
    inc  HL                                            ;; 0b:705d $23
    ld   A, [HL]                                       ;; 0b:705e $7e
    cp   A, $09                                        ;; 0b:705f $fe $09
    jr   NC, .jr_0b_7057                               ;; 0b:7061 $30 $f4
    inc  [HL]                                          ;; 0b:7063 $34
    ret                                                ;; 0b:7064 $c9
.jr_0b_7065:
    ld   A, [wCE94]                                    ;; 0b:7065 $fa $94 $ce
    ld   [HL+], A                                      ;; 0b:7068 $22
    ld   [HL], $01                                     ;; 0b:7069 $36 $01
    ret                                                ;; 0b:706b $c9
    db   $fa, $91, $ce, $21, $ff, $c6, $11, $02        ;; 0b:706c ????????
    db   $00, $06, $18, $be, $28, $0a, $19, $05        ;; 0b:7074 ????????
    db   $20, $f9, $3e, $ff, $ea, $91, $ce, $c9        ;; 0b:707c ????????
    db   $23, $7e, $b7, $28, $f5, $35, $c9             ;; 0b:7084 ???????

jp_0b_708b:
    xor  A, A                                          ;; 0b:708b $af
    call call_00_1fcd                                  ;; 0b:708c $cd $cd $1f
.jr_0b_708f:
    ld   [wCD36], A                                    ;; 0b:708f $ea $36 $cd
    push HL                                            ;; 0b:7092 $e5
    call call_0b_70a4                                  ;; 0b:7093 $cd $a4 $70
    pop  HL                                            ;; 0b:7096 $e1
    ld   A, [wCD36]                                    ;; 0b:7097 $fa $36 $cd
    cp   A, $0c                                        ;; 0b:709a $fe $0c
    ret  Z                                             ;; 0b:709c $c8
    ld   DE, $80                                       ;; 0b:709d $11 $80 $00
    add  HL, DE                                        ;; 0b:70a0 $19
    inc  A                                             ;; 0b:70a1 $3c
    jr   .jr_0b_708f                                   ;; 0b:70a2 $18 $eb

call_0b_70a4:
    ld   DE, wC551                                     ;; 0b:70a4 $11 $51 $c5
    add  HL, DE                                        ;; 0b:70a7 $19
    ld   C, $00                                        ;; 0b:70a8 $0e $00
    call call_0b_70b4                                  ;; 0b:70aa $cd $b4 $70
    inc  HL                                            ;; 0b:70ad $23
    inc  HL                                            ;; 0b:70ae $23
    call call_0b_70b4                                  ;; 0b:70af $cd $b4 $70
    inc  HL                                            ;; 0b:70b2 $23
    inc  HL                                            ;; 0b:70b3 $23

call_0b_70b4:
    inc  HL                                            ;; 0b:70b4 $23
    call call_0b_70b9                                  ;; 0b:70b5 $cd $b9 $70
    dec  HL                                            ;; 0b:70b8 $2b

call_0b_70b9:
    ld   E, $08                                        ;; 0b:70b9 $1e $08
.jr_0b_70bb:
    rrc  [HL]                                          ;; 0b:70bb $cb $0e
    jr   NC, .jr_0b_70cc                               ;; 0b:70bd $30 $0d
    push HL                                            ;; 0b:70bf $e5
    push DE                                            ;; 0b:70c0 $d5
    push BC                                            ;; 0b:70c1 $c5
    ld   A, C                                          ;; 0b:70c2 $79
    ld   [wCD20], A                                    ;; 0b:70c3 $ea $20 $cd
    call call_0b_70d1                                  ;; 0b:70c6 $cd $d1 $70
    pop  BC                                            ;; 0b:70c9 $c1
    pop  DE                                            ;; 0b:70ca $d1
    pop  HL                                            ;; 0b:70cb $e1
.jr_0b_70cc:
    inc  C                                             ;; 0b:70cc $0c
    dec  E                                             ;; 0b:70cd $1d
    jr   NZ, .jr_0b_70bb                               ;; 0b:70ce $20 $eb
    ret                                                ;; 0b:70d0 $c9

call_0b_70d1:
    call call_0b_70de                                  ;; 0b:70d1 $cd $de $70
    or   A, [HL]                                       ;; 0b:70d4 $b6
    ld   [HL], A                                       ;; 0b:70d5 $77
    ld   A, E                                          ;; 0b:70d6 $7b
    or   A, A                                          ;; 0b:70d7 $b7
    ret  NZ                                            ;; 0b:70d8 $c0
    ld   A, [HL]                                       ;; 0b:70d9 $7e
    and  A, $1f                                        ;; 0b:70da $e6 $1f
    ld   [HL], A                                       ;; 0b:70dc $77
    ret                                                ;; 0b:70dd $c9

call_0b_70de:
    ld   A, [wCD20]                                    ;; 0b:70de $fa $20 $cd
    ld   HL, data_0b_7543                              ;; 0b:70e1 $21 $43 $75
    rst  add_hl_a                                      ;; 0b:70e4 $c7
    ld   A, [HL]                                       ;; 0b:70e5 $7e
    srl  A                                             ;; 0b:70e6 $cb $3f
    srl  A                                             ;; 0b:70e8 $cb $3f
    srl  A                                             ;; 0b:70ea $cb $3f
    ld   E, A                                          ;; 0b:70ec $5f
    ld   D, $00                                        ;; 0b:70ed $16 $00
    ld   A, [HL]                                       ;; 0b:70ef $7e
    push AF                                            ;; 0b:70f0 $f5
    push DE                                            ;; 0b:70f1 $d5
    call call_00_1fc4                                  ;; 0b:70f2 $cd $c4 $1f
    ld   DE, wC56A                                     ;; 0b:70f5 $11 $6a $c5
    add  HL, DE                                        ;; 0b:70f8 $19
    pop  DE                                            ;; 0b:70f9 $d1
    pop  AF                                            ;; 0b:70fa $f1
    add  HL, DE                                        ;; 0b:70fb $19
    and  A, $07                                        ;; 0b:70fc $e6 $07
    cpl                                                ;; 0b:70fe $2f
    add  A, $08                                        ;; 0b:70ff $c6 $08
    jp   call_00_1ef1                                  ;; 0b:7101 $c3 $f1 $1e

data_0b_7104:
    db   $00, $80, $40, $20, $10, $50, $08, $04        ;; 0b:7104 .??..???
    db   $02, $01, $f0, $00, $00, $00, $00, $00        ;; 0b:710c ?.??????

data_0b_7114:
    db   $00, $80, $40, $20, $10, $08, $04, $80        ;; 0b:7114 .???????
    db   $40, $20, $fc, $dc, $ec, $f4, $f8, $00        ;; 0b:711c ????????
    db   $cd, $a2, $73, $21, $80, $c8, $af, $cd        ;; 0b:7124 ????????
    db   $50, $1f, $cd, $93, $73, $e6, $0f, $ea        ;; 0b:712c ????????
    db   $80, $c8, $cd, $3d, $24, $7d, $87, $ea        ;; 0b:7134 ????????
    db   $88, $c8, $fa, $26, $ce, $fe, $78, $da        ;; 0b:713c ????????
    db   $61, $71, $fa, $dc, $ce, $e6, $f0, $cb        ;; 0b:7144 ????????
    db   $37, $ea, $81, $c8, $fa, $db, $ce, $e6        ;; 0b:714c ????????
    db   $f0, $cb, $37, $21, $04, $71, $c7, $7e        ;; 0b:7154 ????????
    db   $ea, $83, $c8, $df, $29, $3e, $1c, $cd        ;; 0b:715c ????????
    db   $f4, $73, $cd, $93, $73, $4f, $3e, $05        ;; 0b:7164 ????????
    db   $cd, $e6, $73, $57, $06, $04, $cb, $01        ;; 0b:716c ????????
    db   $30, $03, $7a, $86, $77, $23, $05, $20        ;; 0b:7174 ????????
    db   $f5, $3e, $2c, $cd, $f4, $73, $cd, $83        ;; 0b:717c ????????
    db   $73, $fa, $80, $c8, $cd, $e6, $73, $86        ;; 0b:7184 ????????
    db   $77, $3e, $3c, $cd, $f4, $73, $fa, $81        ;; 0b:718c ????????
    db   $c8, $cd, $e6, $73, $86, $77, $cd, $d3        ;; 0b:7194 ????????
    db   $72, $cd, $c4, $1f, $fa, $26, $ce, $fe        ;; 0b:719c ????????
    db   $a0, $38, $05, $11, $2a, $c5, $18, $03        ;; 0b:71a4 ????????
    db   $11, $28, $c5, $19, $fa, $88, $c8, $cd        ;; 0b:71ac ????????
    db   $e6, $73, $86, $22, $78, $8e, $77, $3e        ;; 0b:71b4 ????????
    db   $0d, $cd, $f4, $73, $7e, $e6, $07, $fe        ;; 0b:71bc ????????
    db   $04, $ca, $6e, $72, $cd, $22, $74, $3e        ;; 0b:71c4 ????????
    db   $18, $cd, $f4, $73, $cd, $93, $73, $4f        ;; 0b:71cc ????????
    db   $3e, $05, $cd, $e6, $73, $57, $06, $04        ;; 0b:71d4 ????????
    db   $cb, $01, $30, $04, $7a, $cd, $68, $74        ;; 0b:71dc ????????
    db   $23                                           ;; 0b:71e4 ?

data_0b_71e5:
    db   $05, $20, $f4, $3e, $19, $cd, $f4, $73        ;; 0b:71e5 ????????
    db   $fa, $81, $c8, $cd, $e6, $73, $cd, $68        ;; 0b:71ed ????????
    db   $74, $cd, $c0, $72, $fa, $26, $ce, $f5        ;; 0b:71f5 ????????
    db   $cd, $49, $73, $f1, $cd, $62, $74, $3e        ;; 0b:71fd ????????
    db   $0d, $cd, $f4, $73, $7e, $e6, $07, $fe        ;; 0b:7205 ????????
    db   $01, $c2, $6e, $72, $3e, $18, $cd, $f4        ;; 0b:720d ????????
    db   $73, $cd, $83, $73, $fa, $80, $c8, $cd        ;; 0b:7215 ????????
    db   $e6, $73, $cd, $68, $74, $cd, $c4, $1f        ;; 0b:721d ????????
    db   $fa, $26, $ce, $fe, $a0, $30, $05, $11        ;; 0b:7225 ????????
    db   $12, $c5, $18, $03, $11, $16, $c5, $19        ;; 0b:722d ????????
    db   $11, $4a, $cd, $cd, $90, $1f, $2b, $2b        ;; 0b:7235 ????????
    db   $cd, $45, $72, $cd, $51, $72, $18, $29        ;; 0b:723d ????????
    db   $fa, $88, $c8, $cd, $e6, $73, $86, $22        ;; 0b:7245 ????????
    db   $78                                           ;; 0b:724d ?

data_0b_724e:
    db   $8e, $32, $c9, $2b, $2b, $11, $46, $cd        ;; 0b:724e ????????
    db   $e5, $df, $02, $cd, $99, $24, $cd, $c7        ;; 0b:7256 ????????
    db   $24, $21                                      ;; 0b:725e ??

data_0b_7260:
    db   $46, $cd, $d1, $46, $cd, $90, $1f, $b0        ;; 0b:7260 ????????
    db   $c0, $1b, $1b, $3c, $12, $c9, $3e, $03        ;; 0b:7268 ????????
    db   $cd, $f4, $73, $7e, $11, $17, $00, $19        ;; 0b:7270 ????????
    db   $86, $1f, $cb, $3f, $c6, $4b, $fe, $64        ;; 0b:7278 ????????
    db   $38, $02, $3e, $63, $11, $3d, $00, $19        ;; 0b:7280 ????????
    db   $77, $18, $25                                 ;; 0b:7288 ???

call_0b_728b:
    call call_0b_72e1                                  ;; 0b:728b $cd $e1 $72
    call call_0b_7305                                  ;; 0b:728e $cd $05 $73
    ld   A, $0d                                        ;; 0b:7291 $3e $0d
    call call_0b_73f4                                  ;; 0b:7293 $cd $f4 $73
    ld   A, [HL]                                       ;; 0b:7296 $7e
    and  A, $07                                        ;; 0b:7297 $e6 $07
    cp   A, $04                                        ;; 0b:7299 $fe $04
    jr   Z, .jr_0b_72a3                                ;; 0b:729b $28 $06
    call call_0b_7422                                  ;; 0b:729d $cd $22 $74
    call call_0b_72c0                                  ;; 0b:72a0 $cd $c0 $72
.jr_0b_72a3:
    ld   A, $3a                                        ;; 0b:72a3 $3e $3a
    call call_0b_73f4                                  ;; 0b:72a5 $cd $f4 $73
    ld   A, [HL]                                       ;; 0b:72a8 $7e
    ld   DE, hFFC7                                     ;; 0b:72a9 $11 $c7 $ff
    add  HL, DE                                        ;; 0b:72ac $19
    cpl                                                ;; 0b:72ad $2f
    and  A, [HL]                                       ;; 0b:72ae $a6
    ld   [HL], A                                       ;; 0b:72af $77
    ld   A, $39                                        ;; 0b:72b0 $3e $39
    call call_0b_73f4                                  ;; 0b:72b2 $cd $f4 $73
    ld   A, [HL]                                       ;; 0b:72b5 $7e
    cpl                                                ;; 0b:72b6 $2f
    or   A, $0f                                        ;; 0b:72b7 $f6 $0f
    ld   DE, $1f                                       ;; 0b:72b9 $11 $1f $00
    add  HL, DE                                        ;; 0b:72bc $19
    and  A, [HL]                                       ;; 0b:72bd $a6
    ld   [HL], A                                       ;; 0b:72be $77
    ret                                                ;; 0b:72bf $c9

call_0b_72c0:
    ld   A, $36                                        ;; 0b:72c0 $3e $36
    call call_0b_73f4                                  ;; 0b:72c2 $cd $f4 $73
    ld   HL, $03                                       ;; 0b:72c5 $21 $03 $00
    add  HL, DE                                        ;; 0b:72c8 $19
    ld   B, $03                                        ;; 0b:72c9 $06 $03
.jr_0b_72cb:
    ld   A, [DE]                                       ;; 0b:72cb $1a
    or   A, [HL]                                       ;; 0b:72cc $b6
    ld   [HL+], A                                      ;; 0b:72cd $22
    inc  DE                                            ;; 0b:72ce $13
    dec  B                                             ;; 0b:72cf $05
    jr   NZ, .jr_0b_72cb                               ;; 0b:72d0 $20 $f9
    ret                                                ;; 0b:72d2 $c9
    db   $fa, $26, $ce, $f5, $cd, $e1, $72, $cd        ;; 0b:72d3 ????????
    db   $05, $73, $f1, $c3, $62, $74                  ;; 0b:72db ??????

call_0b_72e1:
    ld   A, $36                                        ;; 0b:72e1 $3e $36
    call call_0b_73f4                                  ;; 0b:72e3 $cd $f4 $73
    xor  A, A                                          ;; 0b:72e6 $af
    ld   [HL+], A                                      ;; 0b:72e7 $22
    ld   [HL+], A                                      ;; 0b:72e8 $22
    ld   [HL+], A                                      ;; 0b:72e9 $22
    ld   HL, $0b                                       ;; 0b:72ea $21 $0b $00
    add  HL, DE                                        ;; 0b:72ed $19
    ld   B, $07                                        ;; 0b:72ee $06 $07
.jr_0b_72f0:
    ld   A, [HL+]                                      ;; 0b:72f0 $2a
    cp   A, $ff                                        ;; 0b:72f1 $fe $ff
    jr   Z, .jr_0b_7301                                ;; 0b:72f3 $28 $0c
    ld   [wCE26], A                                    ;; 0b:72f5 $ea $26 $ce
    push HL                                            ;; 0b:72f8 $e5
    push DE                                            ;; 0b:72f9 $d5
    push BC                                            ;; 0b:72fa $c5
    call call_0b_7333                                  ;; 0b:72fb $cd $33 $73
    pop  BC                                            ;; 0b:72fe $c1
    pop  DE                                            ;; 0b:72ff $d1
    pop  HL                                            ;; 0b:7300 $e1
.jr_0b_7301:
    dec  B                                             ;; 0b:7301 $05
    jr   NZ, .jr_0b_72f0                               ;; 0b:7302 $20 $ec
    ret                                                ;; 0b:7304 $c9

call_0b_7305:
    ld   A, $39                                        ;; 0b:7305 $3e $39
    call call_0b_73f4                                  ;; 0b:7307 $cd $f4 $73
    xor  A, A                                          ;; 0b:730a $af
    ld   [HL+], A                                      ;; 0b:730b $22
    ld   [HL+], A                                      ;; 0b:730c $22
    ld   [HL+], A                                      ;; 0b:730d $22
    ld   HL, $0f                                       ;; 0b:730e $21 $0f $00
    add  HL, DE                                        ;; 0b:7311 $19
    ld   B, $08                                        ;; 0b:7312 $06 $08
.jr_0b_7314:
    ld   A, [HL+]                                      ;; 0b:7314 $2a
    cp   A, $70                                        ;; 0b:7315 $fe $70
    jr   C, .jr_0b_7329                                ;; 0b:7317 $38 $10
    cp   A, $86                                        ;; 0b:7319 $fe $86
    jr   NC, .jr_0b_7329                               ;; 0b:731b $30 $0c
    ld   [wCE26], A                                    ;; 0b:731d $ea $26 $ce
    push HL                                            ;; 0b:7320 $e5
    push DE                                            ;; 0b:7321 $d5
    push BC                                            ;; 0b:7322 $c5
    call call_0b_732d                                  ;; 0b:7323 $cd $2d $73
    pop  BC                                            ;; 0b:7326 $c1
    pop  DE                                            ;; 0b:7327 $d1
    pop  HL                                            ;; 0b:7328 $e1
.jr_0b_7329:
    dec  B                                             ;; 0b:7329 $05
    jr   NZ, .jr_0b_7314                               ;; 0b:732a $20 $e8
    ret                                                ;; 0b:732c $c9

call_0b_732d:
    push DE                                            ;; 0b:732d $d5
    call call_0b_73b1                                  ;; 0b:732e $cd $b1 $73
    jr   jr_0b_7337                                    ;; 0b:7331 $18 $04

call_0b_7333:
    push DE                                            ;; 0b:7333 $d5
    call call_0b_73a2                                  ;; 0b:7334 $cd $a2 $73

jr_0b_7337:
    ld   A, [wCEDB]                                    ;; 0b:7337 $fa $db $ce
    and  A, $f0                                        ;; 0b:733a $e6 $f0
    swap A                                             ;; 0b:733c $cb $37
    ld   HL, data_0b_7104                              ;; 0b:733e $21 $04 $71
    rst  add_hl_a                                      ;; 0b:7341 $c7
    ld   A, [HL]                                       ;; 0b:7342 $7e
    pop  HL                                            ;; 0b:7343 $e1
    or   A, [HL]                                       ;; 0b:7344 $b6
    ld   [HL+], A                                      ;; 0b:7345 $22
    jp   jp_0b_7403                                    ;; 0b:7346 $c3 $03 $74

call_0b_7349:
    ld   A, $58                                        ;; 0b:7349 $3e $58
    call call_0b_73f4                                  ;; 0b:734b $cd $f4 $73
    ld   [HL], $00                                     ;; 0b:734e $36 $00
    ld   HL, hFFF0                                     ;; 0b:7350 $21 $f0 $ff
    add  HL, DE                                        ;; 0b:7353 $19
    ld   B, $08                                        ;; 0b:7354 $06 $08
.jr_0b_7356:
    ld   A, [HL+]                                      ;; 0b:7356 $2a
    cp   A, $86                                        ;; 0b:7357 $fe $86
    jr   C, .jr_0b_736b                                ;; 0b:7359 $38 $10
    cp   A, $90                                        ;; 0b:735b $fe $90
    jr   NC, .jr_0b_736b                               ;; 0b:735d $30 $0c
    ld   [wCE26], A                                    ;; 0b:735f $ea $26 $ce
    push HL                                            ;; 0b:7362 $e5
    push DE                                            ;; 0b:7363 $d5
    push BC                                            ;; 0b:7364 $c5
    call call_0b_736f                                  ;; 0b:7365 $cd $6f $73
    pop  BC                                            ;; 0b:7368 $c1
    pop  DE                                            ;; 0b:7369 $d1
    pop  HL                                            ;; 0b:736a $e1
.jr_0b_736b:
    dec  B                                             ;; 0b:736b $05
    jr   NZ, .jr_0b_7356                               ;; 0b:736c $20 $e8
    ret                                                ;; 0b:736e $c9

call_0b_736f:
    push DE                                            ;; 0b:736f $d5
    call call_0b_73b1                                  ;; 0b:7370 $cd $b1 $73
    ld   A, [wCEDB]                                    ;; 0b:7373 $fa $db $ce
    and  A, $f0                                        ;; 0b:7376 $e6 $f0
    swap A                                             ;; 0b:7378 $cb $37
    ld   HL, data_0b_7104                              ;; 0b:737a $21 $04 $71
    rst  add_hl_a                                      ;; 0b:737d $c7
    ld   A, [HL]                                       ;; 0b:737e $7e
    pop  HL                                            ;; 0b:737f $e1
    or   A, [HL]                                       ;; 0b:7380 $b6
    ld   [HL], A                                       ;; 0b:7381 $77
    ret                                                ;; 0b:7382 $c9
    db   $fa, $26, $ce, $fe, $84, $d8, $23, $fe        ;; 0b:7383 ????????
    db   $a0, $d8, $23, $fe, $b4, $d8, $23, $c9        ;; 0b:738b ????????
    db   $fa, $26, $ce, $fe, $78, $30, $04, $fa        ;; 0b:7393 ????????
    db   $e1, $ce, $c9, $fa, $df, $ce, $c9             ;; 0b:739b ???????

call_0b_73a2:
    ld   A, [wCE25]                                    ;; 0b:73a2 $fa $25 $ce
    push AF                                            ;; 0b:73a5 $f5
    xor  A, A                                          ;; 0b:73a6 $af

jr_0b_73a7:
    ld   [wCE25], A                                    ;; 0b:73a7 $ea $25 $ce
    rst  rst_00_0018                                   ;; 0b:73aa $df
    db   $2a                                           ;; 0b:73ab .
    pop  AF                                            ;; 0b:73ac $f1
    ld   [wCE25], A                                    ;; 0b:73ad $ea $25 $ce
    ret                                                ;; 0b:73b0 $c9

call_0b_73b1:
    ld   A, [wCE26]                                    ;; 0b:73b1 $fa $26 $ce
    sub  A, $70                                        ;; 0b:73b4 $d6 $70
    jr   NC, .jr_0b_73c0                               ;; 0b:73b6 $30 $08
    ld   A, [wCE25]                                    ;; 0b:73b8 $fa $25 $ce
    push AF                                            ;; 0b:73bb $f5
    ld   A, $01                                        ;; 0b:73bc $3e $01
    jr   jr_0b_73a7                                    ;; 0b:73be $18 $e7
.jr_0b_73c0:
    ld   HL, .data_0b_73c9                             ;; 0b:73c0 $21 $c9 $73
    rst  add_hl_a                                      ;; 0b:73c3 $c7
    ld   A, [HL]                                       ;; 0b:73c4 $7e
    ld   [wCEDB], A                                    ;; 0b:73c5 $ea $db $ce
    ret                                                ;; 0b:73c8 $c9
.data_0b_73c9:
    db   $0a, $01                                      ;; 0b:73c9 ??

data_0b_73cb:
    db   $02, $03, $04, $05, $06, $07, $08, $09        ;; 0b:73cb ????????
    db   $90, $a0, $10, $40, $30, $20, $50, $80        ;; 0b:73d3 ????.???
    db   $0b, $0c, $0d, $0e, $10, $40, $30, $20        ;; 0b:73db ????????
    db   $50, $60, $70, $47, $fa, $25, $ce, $b7        ;; 0b:73e3 ????????
    db   $78, $06, $00, $c8, $2f, $3c, $c8, $05        ;; 0b:73eb ????????
    db   $c9                                           ;; 0b:73f3 ?

call_0b_73f4:
    push AF                                            ;; 0b:73f4 $f5
    call call_00_1fc4                                  ;; 0b:73f5 $cd $c4 $1f
    pop  AF                                            ;; 0b:73f8 $f1
    ld   E, A                                          ;; 0b:73f9 $5f
    ld   D, $c5                                        ;; 0b:73fa $16 $c5
    add  HL, DE                                        ;; 0b:73fc $19
    ld   E, L                                          ;; 0b:73fd $5d
    ld   D, H                                          ;; 0b:73fe $54
    ret                                                ;; 0b:73ff $c9
    db   $21, $84, $c8                                 ;; 0b:7400 ???

jp_0b_7403:
    push HL                                            ;; 0b:7403 $e5
    ld   A, [wCEDB]                                    ;; 0b:7404 $fa $db $ce
    and  A, $0f                                        ;; 0b:7407 $e6 $0f
    ld   HL, data_0b_7114                              ;; 0b:7409 $21 $14 $71
    rst  add_hl_a                                      ;; 0b:740c $c7
    cp   A, $0a                                        ;; 0b:740d $fe $0a
    jr   NC, .jr_0b_741a                               ;; 0b:740f $30 $09
    cp   A, $07                                        ;; 0b:7411 $fe $07
    ld   A, [HL]                                       ;; 0b:7413 $7e
    pop  HL                                            ;; 0b:7414 $e1
    jr   C, .jr_0b_741f                                ;; 0b:7415 $38 $08
    inc  HL                                            ;; 0b:7417 $23
    jr   .jr_0b_741f                                   ;; 0b:7418 $18 $05
.jr_0b_741a:
    ld   A, [HL]                                       ;; 0b:741a $7e
    pop  HL                                            ;; 0b:741b $e1
    ld   [HL+], A                                      ;; 0b:741c $22
    ld   A, $e0                                        ;; 0b:741d $3e $e0
.jr_0b_741f:
    or   A, [HL]                                       ;; 0b:741f $b6
    ld   [HL], A                                       ;; 0b:7420 $77
    ret                                                ;; 0b:7421 $c9

call_0b_7422:
    ld   A, $3d                                        ;; 0b:7422 $3e $3d
    call call_0b_73f4                                  ;; 0b:7424 $cd $f4 $73
    xor  A, A                                          ;; 0b:7427 $af
    ld   [HL+], A                                      ;; 0b:7428 $22
    ld   [HL+], A                                      ;; 0b:7429 $22
    ld   [HL+], A                                      ;; 0b:742a $22
    ld   A, [wCE26]                                    ;; 0b:742b $fa $26 $ce
    push AF                                            ;; 0b:742e $f5
    ld   A, $41                                        ;; 0b:742f $3e $41
    call call_0b_73f4                                  ;; 0b:7431 $cd $f4 $73
    ld   B, $07                                        ;; 0b:7434 $06 $07
.jr_0b_7436:
    ld   A, [HL+]                                      ;; 0b:7436 $2a
    cp   A, $ff                                        ;; 0b:7437 $fe $ff
    jr   Z, .jr_0b_745e                                ;; 0b:7439 $28 $23
    push HL                                            ;; 0b:743b $e5
    push BC                                            ;; 0b:743c $c5
    call call_0b_7462                                  ;; 0b:743d $cd $62 $74
    ld   A, $3d                                        ;; 0b:7440 $3e $3d
    call call_0b_73f4                                  ;; 0b:7442 $cd $f4 $73
    ld   A, [wCEDD]                                    ;; 0b:7445 $fa $dd $ce
    and  A, $f0                                        ;; 0b:7448 $e6 $f0
    swap A                                             ;; 0b:744a $cb $37
    add  A, [HL]                                       ;; 0b:744c $86
    ld   [HL+], A                                      ;; 0b:744d $22
    ld   A, [wCEDC]                                    ;; 0b:744e $fa $dc $ce
    and  A, $0f                                        ;; 0b:7451 $e6 $0f
    add  A, [HL]                                       ;; 0b:7453 $86
    ld   [HL+], A                                      ;; 0b:7454 $22
    ld   A, [wCEDD]                                    ;; 0b:7455 $fa $dd $ce
    and  A, $0f                                        ;; 0b:7458 $e6 $0f
    add  A, [HL]                                       ;; 0b:745a $86
    ld   [HL], A                                       ;; 0b:745b $77
    pop  BC                                            ;; 0b:745c $c1
    pop  HL                                            ;; 0b:745d $e1
.jr_0b_745e:
    dec  B                                             ;; 0b:745e $05
    jr   NZ, .jr_0b_7436                               ;; 0b:745f $20 $d5
    pop  AF                                            ;; 0b:7461 $f1

call_0b_7462:
    ld   [wCE26], A                                    ;; 0b:7462 $ea $26 $ce
    jp   call_0b_73a2                                  ;; 0b:7465 $c3 $a2 $73
    db   $e5, $f5, $cd, $7f, $74, $fa, $37, $cd        ;; 0b:7468 ????????
    db   $b7, $28, $09, $3e, $58, $c7, $f1, $cd        ;; 0b:7470 ????????
    db   $7f, $74, $e1, $c9, $f1, $e1, $c9, $cb        ;; 0b:7478 ????????
    db   $7f, $20, $06, $86, $77, $d0, $36, $ff        ;; 0b:7480 ????????
    db   $c9, $86, $77, $d8, $36, $00, $c9             ;; 0b:7488 ???????

data_0b_748f:
    db   $80, $80, $c1, $c1, $c2, $c2, $c2, $c3        ;; 0b:748f .???????
    db   $c3, $c3, $84, $84, $84, $c5, $c5, $c5        ;; 0b:7497 ????????
    db   $86, $86, $c7, $c7, $c8, $c8, $89, $89        ;; 0b:749f ????????

data_0b_74a7:
    db   $4a, $4a, $4a, $4b, $4b, $4b, $cc, $cc        ;; 0b:74a7 ????????
    db   $cc, $4d, $4d, $4d, $8e, $8e, $8f, $8f        ;; 0b:74af ????????
    db   $90, $90, $91, $91, $52, $52, $53, $53        ;; 0b:74b7 ????????
    db   $94, $94, $94, $95, $95, $95, $16, $16        ;; 0b:74bf ????????
    db   $16, $97, $97, $97, $18, $18, $18, $18        ;; 0b:74c7 ????????
    db   $18, $19, $19, $19, $19, $19, $9a, $9a        ;; 0b:74cf ????????
    db   $9a, $9a, $9a, $1b, $1b, $1b, $1b, $1b        ;; 0b:74d7 ????????
    db   $1c, $1c, $1c                                 ;; 0b:74df ???

data_0b_74e2:
    db   $1c, $1c, $dd, $dd, $dd, $dd, $dd, $1e        ;; 0b:74e2 ????????
    db   $1e, $1e, $1e, $1e, $1f, $1f, $1f, $1f        ;; 0b:74ea ????????
    db   $1f, $20, $20, $20, $20, $20, $a1, $a1        ;; 0b:74f2 ????????
    db   $a1, $a1, $a1, $22, $22, $23, $23, $22        ;; 0b:74fa ????????
    db   $22, $23, $23, $22, $23, $e4, $e4, $e4        ;; 0b:7502 ????????
    db   $e4, $e4, $e5, $e5, $e5, $e5, $e5, $a6        ;; 0b:750a ????????
    db   $a6, $a6, $a6, $a6, $a7, $a7, $a7, $a7        ;; 0b:7512 ????????
    db   $a7, $e8, $e8, $e8, $e8, $e8, $29, $29        ;; 0b:751a ????????
    db   $29, $29, $29, $aa, $aa, $aa, $aa, $aa        ;; 0b:7522 ????????
    db   $ab, $ab, $ab, $ab, $ab, $6c, $6c, $6c        ;; 0b:752a ????????
    db   $6c                                           ;; 0b:7532 ?

data_0b_7533:
    db   $6c, $ad, $ad, $ad, $ad, $ad, $ee, $ee        ;; 0b:7533 ????????
    db   $ee, $ee, $ee, $ef, $ef, $ef, $ef, $ef        ;; 0b:753b ????????

data_0b_7543:
    db   $17, $07, $1f, $0c, $18, $0d, $25, $11        ;; 0b:7543 ........
    db   $19, $0b, $20, $04, $15, $06, $26, $2c        ;; 0b:754b ........
    db   $1c, $0f, $22, $0e, $28, $10, $1d, $05        ;; 0b:7553 ........
    db   $23, $0a, $29, $08, $2b, $2f, $2d, $13        ;; 0b:755b ........
    db   $01, $02, $03, $1a, $1e, $00, $1b, $21        ;; 0b:7563 ........
    db   $24, $12, $27, $14, $09, $2a, $16, $2e        ;; 0b:756b ........

data_0b_7573:
    db   $00, $01, $04, $06, $08, $09, $03, $02        ;; 0b:7573 ??.?????
    db   $05, $07, $00, $00, $30, $34, $33, $38        ;; 0b:757b ????...?
    db   $38, $37, $31, $32, $35, $36, $b9, $3a        ;; 0b:7583 ??..????
    db   $78, $04, $ff, $00, $50, $46, $4b, $ff        ;; 0b:758b ???.?ww.
    db   $40, $50, $07, $4b, $ff, $00, $50, $78        ;; 0b:7593 ..??????
    db   $3c, $46, $00, $50, $3c, $04, $4b, $00        ;; 0b:759b ????????
    db   $80, $0d, $41, $ff, $00, $44, $0a, $7d        ;; 0b:75a3 ????????
    db   $ff, $00, $44, $9b, $41, $96, $00, $00        ;; 0b:75ab ????????
    db   $64, $7d, $41, $00, $50, $1e, $8c, $41        ;; 0b:75b3 ????????
    db   $00, $40, $0e, $21, $ff, $00, $00, $aa        ;; 0b:75bb ????????
    db   $4c, $ff, $00, $40, $69, $12, $ff, $00        ;; 0b:75c3 ????????
    db   $40, $47, $00, $ff, $00, $50, $08, $4c        ;; 0b:75cb ????????
    db   $ff, $00, $00, $79, $02, $7e, $00, $50        ;; 0b:75d3 ????????
    db   $05, $42, $97, $00, $40, $3d, $7a, $10        ;; 0b:75db ????????
    db   $00, $40, $70, $48, $9c, $00, $50, $4d        ;; 0b:75e3 ????????
    db   $39, $91, $00, $00, $98, $6e, $af, $00        ;; 0b:75eb ????????
    db   $00, $36, $0b, $ff, $00, $40, $b4, $ff        ;; 0b:75f3 ????????
    db   $ff, $40, $c0, $6a, $2a, $ff, $00, $50        ;; 0b:75fb ????????
    db   $65, $43, $ff, $00, $90, $28, $3e, $ff        ;; 0b:7603 ????????
    db   $00, $80, $ab, $9d, $43, $00, $40, $4e        ;; 0b:760b ????????
    db   $11, $7f, $00, $40, $7b, $13, $99, $00        ;; 0b:7613 ????????
    db   $80, $11, $8d, $ff, $00, $40, $01, $8d        ;; 0b:761b ????????
    db   $ff, $00, $40, $03, $7b, $44, $00, $40        ;; 0b:7623 ????????
    db   $4e, $13, $7f, $00, $40, $2e, $65, $ff        ;; 0b:762b ????????
    db   $00, $50, $80, $49, $13, $00, $40, $2c        ;; 0b:7633 ????????
    db   $3f, $9d, $00, $40, $92, $9e, $80, $00        ;; 0b:763b ????????
    db   $40, $71, $4e, $2c, $00, $40, $6f, $71        ;; 0b:7643 ????????
    db   $ff, $00, $50, $b0, $06, $ff, $00, $94        ;; 0b:764b ????????
    db   $4a, $9a, $ff, $00, $50, $09, $4f, $ff        ;; 0b:7653 ????????
    db   $00, $40, $7c, $40, $45, $00, $40, $0f        ;; 0b:765b ????????
    db   $45, $4f, $00, $40, $0f, $22, $9f, $00        ;; 0b:7663 ????????
    db   $44, $81, $09, $0c, $00, $00, $6b, $45        ;; 0b:766b ????????
    db   $9a, $00, $00, $1f, $9f, $81, $00, $00        ;; 0b:7673 ????????
    db   $66, $ac, $a0, $00, $80, $5a, $a0, $50        ;; 0b:767b ????????
    db   $00, $80, $5f, $18, $ff, $00, $40, $1b        ;; 0b:7683 ????????
    db   $82, $ff, $00, $40, $50, $18, $ff, $00        ;; 0b:768b ????????
    db   $80, $30, $8e, $ff, $00, $40, $33, $55        ;; 0b:7693 ????????
    db   $a0, $00, $40, $a5, $a0, $82, $00, $40        ;; 0b:769b ????????
    db   $18, $33, $72, $00, $00, $93, $a5, $50        ;; 0b:76a3 ????????
    db   $00, $40, $87, $74, $37, $00, $00, $82        ;; 0b:76ab ????????
    db   $b1, $3a, $00, $00, $a1, $26, $ff, $00        ;; 0b:76b3 ????????
    db   $90, $24, $83, $ff, $00, $40, $51, $56        ;; 0b:76bb ????????
    db   $ff, $00, $80, $2b, $16, $ff, $00, $00        ;; 0b:76c3 ????????
    db   $60, $14, $a1, $00, $40, $26, $5b, $14        ;; 0b:76cb ????????
    db   $00, $80, $14, $88, $56, $00, $40, $a6        ;; 0b:76d3 ????????
    db   $83, $a1, $00, $80, $6c, $26, $83, $00        ;; 0b:76db ????????
    db   $80, $a6, $29, $51, $00, $00, $6c, $26        ;; 0b:76e3 ????????
    db   $51, $00, $40, $ad, $67, $88, $00, $40        ;; 0b:76eb ????????
    db   $29, $67, $8f, $00, $48, $5c, $19, $29        ;; 0b:76f3 ????????
    db   $00, $80, $61, $8f, $19, $00, $40, $1c        ;; 0b:76fb ????????
    db   $84, $29, $00, $44, $19, $a2, $19, $00        ;; 0b:7703 ????????
    db   $40, $34, $a2, $5c, $00, $40, $34, $8f        ;; 0b:770b ????????
    db   $29, $00, $40, $84, $57, $19, $00, $40        ;; 0b:7713 ????????
    db   $31, $52, $a7, $00, $44, $31, $a7, $89        ;; 0b:771b ????????
    db   $00, $40, $62, $89, $57, $00, $00, $89        ;; 0b:7723 ????????
    db   $94, $75, $00, $00, $2d, $73, $94, $00        ;; 0b:772b ????????
    db   $00, $2f, $75, $73, $00, $00, $b2, $2d        ;; 0b:7733 ????????
    db   $89, $00, $00, $73, $2f, $2d, $00, $40        ;; 0b:773b ????????
    db   $25, $2d, $2f, $00, $40, $b7, $ff, $ff        ;; 0b:7743 ????????
    db   $41, $00, $b5, $ff, $ff, $81, $00, $5d        ;; 0b:774b ????????
    db   $a3, $ff, $00, $94, $a3, $85, $ff, $00        ;; 0b:7753 ????????
    db   $90, $27, $85, $ff, $00, $80, $53, $a3        ;; 0b:775b ????????
    db   $ff, $00, $94, $15, $58, $17, $00, $80        ;; 0b:7763 ????????
    db   $a8, $27, $58, $00, $80, $8a, $17, $a3        ;; 0b:776b ????????
    db   $00, $40, $20, $15, $a8, $00, $00, $20        ;; 0b:7773 ????????
    db   $85, $8a, $00, $40, $23, $68, $23, $00        ;; 0b:777b ????????
    db   $00, $90, $6d, $ff, $00, $40, $ae, $68        ;; 0b:7783 ????????
    db   $5e, $00, $50, $90, $1d, $63, $00, $00        ;; 0b:778b ????????
    db   $1a, $5e, $1a, $00, $40, $63, $90, $a4        ;; 0b:7793 ????????
    db   $00, $00, $54, $ae, $86, $00, $40, $32        ;; 0b:779b ????????
    db   $ae, $5e, $00, $04, $35, $1a, $a4, $00        ;; 0b:77a3 ????????
    db   $40, $77, $59, $54, $00, $40, $95, $a9        ;; 0b:77ab ????????
    db   $59, $00, $40, $b3, $1a, $59, $00, $40        ;; 0b:77b3 ????????
    db   $76, $59, $8b, $00, $40, $3b, $8b, $59        ;; 0b:77bb ????????
    db   $00, $40, $38, $86, $8b, $00, $50, $48        ;; 0b:77c3 ????????
    db   $b9, $48, $50, $00, $65, $b8, $65, $50        ;; 0b:77cb ????????
    db   $00, $ba, $ff, $ff, $51, $00, $51, $bb        ;; 0b:77d3 ????????
    db   $51, $50, $00, $bc, $ff, $ff, $d1, $00        ;; 0b:77db ????????
    db   $bd, $ff, $ff, $51, $00, $be, $ff, $ff        ;; 0b:77e3 ????????
    db   $51, $00, $14, $ff, $ff, $40, $20, $bf        ;; 0b:77eb ????????
    db   $ff, $ff, $d1, $00, $c0, $ff, $ff, $51        ;; 0b:77f3 ????????
    db   $00, $c1, $ff, $ff, $62, $00, $c2, $ff        ;; 0b:77fb ????????
    db   $ff, $e3, $00, $b6, $ff, $ff, $50             ;; 0b:7803 ???????

call_0b_780a:
    call call_0b_782b                                  ;; 0b:780a $cd $2b $78
    ld   A, $20                                        ;; 0b:780d $3e $20
    ld   [wDE0F], A                                    ;; 0b:780f $ea $0f $de
.jr_0b_7812:
    call call_0b_785c                                  ;; 0b:7812 $cd $5c $78
    call call_0b_783b                                  ;; 0b:7815 $cd $3b $78
    call call_0b_7886                                  ;; 0b:7818 $cd $86 $78
    call call_0b_783b                                  ;; 0b:781b $cd $3b $78
    call call_0b_7886                                  ;; 0b:781e $cd $86 $78
    call call_0b_783b                                  ;; 0b:7821 $cd $3b $78
    ld   HL, wDE0F                                     ;; 0b:7824 $21 $0f $de
    dec  [HL]                                          ;; 0b:7827 $35
    jr   NZ, .jr_0b_7812                               ;; 0b:7828 $20 $e8
    ret                                                ;; 0b:782a $c9

call_0b_782b:
    ld   DE, $40                                       ;; 0b:782b $11 $40 $00
    ld   HL, wDE40                                     ;; 0b:782e $21 $40 $de
    ld   B, $40                                        ;; 0b:7831 $06 $40
.jr_0b_7833:
    ld   A, E                                          ;; 0b:7833 $7b
    ld   [HL+], A                                      ;; 0b:7834 $22
    ld   A, D                                          ;; 0b:7835 $7a
    ld   [HL+], A                                      ;; 0b:7836 $22
    dec  B                                             ;; 0b:7837 $05
    jr   NZ, .jr_0b_7833                               ;; 0b:7838 $20 $f9
    ret                                                ;; 0b:783a $c9

call_0b_783b:
    xor  A, A                                          ;; 0b:783b $af
    ld   HL, wDEC0                                     ;; 0b:783c $21 $c0 $de
    ld   [HL+], A                                      ;; 0b:783f $22
    ld   [HL], A                                       ;; 0b:7840 $77
    ld   HL, wDE40                                     ;; 0b:7841 $21 $40 $de
    ld   DE, $41                                       ;; 0b:7844 $11 $41 $00
    call call_00_3a6b                                  ;; 0b:7847 $cd $6b $3a
    di                                                 ;; 0b:784a $f3
.jr_0b_784b:
    ldh  A, [rLY]                                      ;; 0b:784b $f0 $44
    cp   A, D                                          ;; 0b:784d $ba
    jr   NZ, .jr_0b_784b                               ;; 0b:784e $20 $fb
    ld   A, [HL+]                                      ;; 0b:7850 $2a
    ldh  [rSCY], A                                     ;; 0b:7851 $e0 $42
    ld   A, [HL+]                                      ;; 0b:7853 $2a
    ldh  [rSCX], A                                     ;; 0b:7854 $e0 $43
    inc  D                                             ;; 0b:7856 $14
    dec  E                                             ;; 0b:7857 $1d
    jr   NZ, .jr_0b_784b                               ;; 0b:7858 $20 $f1
    ei                                                 ;; 0b:785a $fb
    ret                                                ;; 0b:785b $c9

call_0b_785c:
    ld   A, [wDE0F]                                    ;; 0b:785c $fa $0f $de
    dec  A                                             ;; 0b:785f $3d
    ld   [wDE40], A                                    ;; 0b:7860 $ea $40 $de
    cpl                                                ;; 0b:7863 $2f
    inc  A                                             ;; 0b:7864 $3c
    ld   [wDEBE], A                                    ;; 0b:7865 $ea $be $de
    ld   A, [wDE0F]                                    ;; 0b:7868 $fa $0f $de
    sub  A, $20                                        ;; 0b:786b $d6 $20
    cpl                                                ;; 0b:786d $2f
    inc  A                                             ;; 0b:786e $3c

jr_0b_786f:
    ld   HL, data_0b_78d5                              ;; 0b:786f $21 $d5 $78
    rst  add_hl_a                                      ;; 0b:7872 $c7
    ld   BC, wDE41                                     ;; 0b:7873 $01 $41 $de
    ld   DE, wDEBF                                     ;; 0b:7876 $11 $bf $de
.jr_0b_7879:
    ld   A, [HL+]                                      ;; 0b:7879 $2a
    ld   [DE], A                                       ;; 0b:787a $12
    dec  DE                                            ;; 0b:787b $1b
    dec  DE                                            ;; 0b:787c $1b
    cpl                                                ;; 0b:787d $2f
    inc  A                                             ;; 0b:787e $3c
    ld   [BC], A                                       ;; 0b:787f $02
    inc  BC                                            ;; 0b:7880 $03
    inc  BC                                            ;; 0b:7881 $03
    and  A, A                                          ;; 0b:7882 $a7
    jr   NZ, .jr_0b_7879                               ;; 0b:7883 $20 $f4
    ret                                                ;; 0b:7885 $c9

call_0b_7886:
    ld   A, [wDE40]                                    ;; 0b:7886 $fa $40 $de
    and  A, A                                          ;; 0b:7889 $a7
    ret  Z                                             ;; 0b:788a $c8
    ld   HL, wDE7E                                     ;; 0b:788b $21 $7e $de
    ld   BC, $1f40                                     ;; 0b:788e $01 $40 $1f
.jr_0b_7891:
    ld   A, [HL]                                       ;; 0b:7891 $7e
    and  A, A                                          ;; 0b:7892 $a7
    jr   Z, .jr_0b_78cd                                ;; 0b:7893 $28 $38
    dec  HL                                            ;; 0b:7895 $2b
    dec  HL                                            ;; 0b:7896 $2b
    ld   A, [HL+]                                      ;; 0b:7897 $2a
    inc  HL                                            ;; 0b:7898 $23
    cp   A, C                                          ;; 0b:7899 $b9
    jr   Z, .jr_0b_789d                                ;; 0b:789a $28 $01
    dec  A                                             ;; 0b:789c $3d
.jr_0b_789d:
    ld   [HL-], A                                      ;; 0b:789d $32
    dec  HL                                            ;; 0b:789e $2b
.jr_0b_789f:
    dec  B                                             ;; 0b:789f $05
    jr   NZ, .jr_0b_7891                               ;; 0b:78a0 $20 $ef
    ld   [HL], C                                       ;; 0b:78a2 $71
    ld   HL, wDE80                                     ;; 0b:78a3 $21 $80 $de
    ld   B, $1f                                        ;; 0b:78a6 $06 $1f
.jr_0b_78a8:
    ld   A, [HL]                                       ;; 0b:78a8 $7e
    and  A, A                                          ;; 0b:78a9 $a7
    jr   Z, .jr_0b_78d1                                ;; 0b:78aa $28 $25
    inc  HL                                            ;; 0b:78ac $23
    inc  HL                                            ;; 0b:78ad $23
    ld   A, [HL-]                                      ;; 0b:78ae $3a
    dec  HL                                            ;; 0b:78af $2b
    cp   A, C                                          ;; 0b:78b0 $b9
    jr   Z, .jr_0b_78b4                                ;; 0b:78b1 $28 $01
    inc  A                                             ;; 0b:78b3 $3c
.jr_0b_78b4:
    ld   [HL+], A                                      ;; 0b:78b4 $22
    inc  HL                                            ;; 0b:78b5 $23
.jr_0b_78b6:
    dec  B                                             ;; 0b:78b6 $05
    jr   NZ, .jr_0b_78a8                               ;; 0b:78b7 $20 $ef
    ld   [HL], C                                       ;; 0b:78b9 $71
    ld   HL, wDE40                                     ;; 0b:78ba $21 $40 $de
    ld   B, $20                                        ;; 0b:78bd $06 $20
.jr_0b_78bf:
    ld   A, [HL+]                                      ;; 0b:78bf $2a
    inc  HL                                            ;; 0b:78c0 $23
    and  A, A                                          ;; 0b:78c1 $a7
    jr   Z, .jr_0b_78c7                                ;; 0b:78c2 $28 $03
    dec  B                                             ;; 0b:78c4 $05
    jr   NZ, .jr_0b_78bf                               ;; 0b:78c5 $20 $f8
.jr_0b_78c7:
    ld   A, B                                          ;; 0b:78c7 $78
    cp   A, $20                                        ;; 0b:78c8 $fe $20
    jr   C, jr_0b_786f                                 ;; 0b:78ca $38 $a3
    ret                                                ;; 0b:78cc $c9
.jr_0b_78cd:
    ld   [HL-], A                                      ;; 0b:78cd $32
    ld   [HL-], A                                      ;; 0b:78ce $32
    jr   .jr_0b_789f                                   ;; 0b:78cf $18 $ce
.jr_0b_78d1:
    ld   [HL+], A                                      ;; 0b:78d1 $22
    ld   [HL+], A                                      ;; 0b:78d2 $22
    jr   .jr_0b_78b6                                   ;; 0b:78d3 $18 $e1

data_0b_78d5:
    db   $0b, $0e, $12, $16, $1a, $1e, $20, $21        ;; 0b:78d5 ........
    db   $22, $23, $24, $24, $24, $24, $23, $22        ;; 0b:78dd ........
    db   $21, $20, $1e, $1a, $16, $12, $0e, $0b        ;; 0b:78e5 ........
    db   $09, $07, $05, $04, $03, $02, $01, $00        ;; 0b:78ed ........

call_0b_78f5:
    ld   A, [wC6E8]                                    ;; 0b:78f5 $fa $e8 $c6
    ld   D, A                                          ;; 0b:78f8 $57
    ld   E, $00                                        ;; 0b:78f9 $1e $00
    ld   HL, data_0b_7982                              ;; 0b:78fb $21 $82 $79
.jr_0b_78fe:
    ld   A, [HL+]                                      ;; 0b:78fe $2a
    cp   A, D                                          ;; 0b:78ff $ba
    jr   NZ, .jr_0b_791f                               ;; 0b:7900 $20 $1d
    push HL                                            ;; 0b:7902 $e5
    push DE                                            ;; 0b:7903 $d5
    ld   HL, data_0b_79b1                              ;; 0b:7904 $21 $b1 $79
    ld   A, E                                          ;; 0b:7907 $7b
    rst  add_hl_a                                      ;; 0b:7908 $c7
    ld   A, [HL]                                       ;; 0b:7909 $7e
    cp   A, $ff                                        ;; 0b:790a $fe $ff
    jr   Z, .jr_0b_7913                                ;; 0b:790c $28 $05
    call call_00_3cb2                                  ;; 0b:790e $cd $b2 $3c
    jr   NC, .jr_0b_791d                               ;; 0b:7911 $30 $0a
.jr_0b_7913:
    ld   A, E                                          ;; 0b:7913 $7b
    ld   HL, data_0b_79e0                              ;; 0b:7914 $21 $e0 $79
    call call_00_3741                                  ;; 0b:7917 $cd $41 $37
    call call_0b_7926                                  ;; 0b:791a $cd $26 $79
.jr_0b_791d:
    pop  DE                                            ;; 0b:791d $d1
    pop  HL                                            ;; 0b:791e $e1
.jr_0b_791f:
    inc  E                                             ;; 0b:791f $1c
    ld   A, $2f                                        ;; 0b:7920 $3e $2f
    cp   A, E                                          ;; 0b:7922 $bb
    jr   NZ, .jr_0b_78fe                               ;; 0b:7923 $20 $d9
    ret                                                ;; 0b:7925 $c9

call_0b_7926:
    ld   A, $0b                                        ;; 0b:7926 $3e $0b
    rst  pushActiveBankSafe                            ;; 0b:7928 $e7
    ld   A, [HL+]                                      ;; 0b:7929 $2a
    ld   C, A                                          ;; 0b:792a $4f
    ld   A, [HL+]                                      ;; 0b:792b $2a
    ld   B, A                                          ;; 0b:792c $47
    ld   DE, wD000                                     ;; 0b:792d $11 $00 $d0
    ld   A, E                                          ;; 0b:7930 $7b
    add  A, C                                          ;; 0b:7931 $81
    ld   E, A                                          ;; 0b:7932 $5f
    xor  A, A                                          ;; 0b:7933 $af
    cp   A, B                                          ;; 0b:7934 $b8
    jr   Z, .jr_0b_794e                                ;; 0b:7935 $28 $17
    push HL                                            ;; 0b:7937 $e5
    ld   HL, wCA07                                     ;; 0b:7938 $21 $07 $ca
.jr_0b_793b:
    ld   A, E                                          ;; 0b:793b $7b
    add  A, [HL]                                       ;; 0b:793c $86
    ld   E, A                                          ;; 0b:793d $5f
    ld   A, D                                          ;; 0b:793e $7a
    adc  A, $00                                        ;; 0b:793f $ce $00
    ld   D, A                                          ;; 0b:7941 $57
    dec  B                                             ;; 0b:7942 $05
    jr   NZ, .jr_0b_793b                               ;; 0b:7943 $20 $f6
    ld   A, E                                          ;; 0b:7945 $7b
    ld   [wC801], A                                    ;; 0b:7946 $ea $01 $c8
    ld   A, D                                          ;; 0b:7949 $7a
    ld   [wC802], A                                    ;; 0b:794a $ea $02 $c8
    pop  HL                                            ;; 0b:794d $e1
.jr_0b_794e:
    ld   A, [HL]                                       ;; 0b:794e $7e
    and  A, A                                          ;; 0b:794f $a7
    jr   Z, .jr_0b_7980                                ;; 0b:7950 $28 $2e
    and  A, $f0                                        ;; 0b:7952 $e6 $f0
    swap A                                             ;; 0b:7954 $cb $37
    ld   [wC800], A                                    ;; 0b:7956 $ea $00 $c8
    ld   A, [HL+]                                      ;; 0b:7959 $2a
    and  A, $0f                                        ;; 0b:795a $e6 $0f
    ld   B, A                                          ;; 0b:795c $47
.jr_0b_795d:
    ld   A, [wC800]                                    ;; 0b:795d $fa $00 $c8
    ld   C, A                                          ;; 0b:7960 $4f
.jr_0b_7961:
    ld   A, [HL+]                                      ;; 0b:7961 $2a
    ld   [DE], A                                       ;; 0b:7962 $12
    inc  DE                                            ;; 0b:7963 $13
    dec  C                                             ;; 0b:7964 $0d
    jr   NZ, .jr_0b_7961                               ;; 0b:7965 $20 $fa
    push HL                                            ;; 0b:7967 $e5
    ld   HL, wCA07                                     ;; 0b:7968 $21 $07 $ca
    ld   A, [wC801]                                    ;; 0b:796b $fa $01 $c8
    add  A, [HL]                                       ;; 0b:796e $86
    ld   E, A                                          ;; 0b:796f $5f
    ld   [wC801], A                                    ;; 0b:7970 $ea $01 $c8
    ld   A, [wC802]                                    ;; 0b:7973 $fa $02 $c8
    adc  A, $00                                        ;; 0b:7976 $ce $00
    ld   [wC802], A                                    ;; 0b:7978 $ea $02 $c8
    ld   D, A                                          ;; 0b:797b $57
    pop  HL                                            ;; 0b:797c $e1
    dec  B                                             ;; 0b:797d $05
    jr   NZ, .jr_0b_795d                               ;; 0b:797e $20 $dd
.jr_0b_7980:
    rst  popActiveBankSafe                             ;; 0b:7980 $ef
    ret                                                ;; 0b:7981 $c9

data_0b_7982:
    db   $03, $05, $06, $08, $0b, $0b, $10, $10        ;; 0b:7982 ........
    db   $10, $10, $10, $10, $11, $11, $11, $11        ;; 0b:798a ........
    db   $34, $34, $3a, $48, $66, $86, $b2, $b4        ;; 0b:7992 ........
    db   $b9, $11, $3a, $76, $75, $74, $73, $8f        ;; 0b:799a ........
    db   $8f, $8f, $8f, $8f, $87, $66, $66, $7f        ;; 0b:79a2 ........
    db   $84, $84, $84, $03, $04, $05, $a4             ;; 0b:79aa .......

data_0b_79b1:
    db   $e0, $e1, $ff, $ff, $ff, $ff, $20, $21        ;; 0b:79b1 ?.??....
    db   $22, $23, $37, $36, $38, $39, $3a, $30        ;; 0b:79b9 ....????
    db   $ff, $ff, $ff, $e3, $e2, $e7, $e8, $e9        ;; 0b:79c1 ????????
    db   $ea, $30, $ff, $ff, $ff, $ff, $ff, $ff        ;; 0b:79c9 ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $eb        ;; 0b:79d1 ????????
    db   $e4, $e5, $e6, $ef, $ef, $ef, $ff             ;; 0b:79d9 ?????.?

data_0b_79e0:
    db   $3e, $7a, $43, $7a, $52, $7a, $59, $7a        ;; 0b:79e0 ????????
    db   $5e, $7a, $6f, $7a, $80, $7a, $84, $7a        ;; 0b:79e8 ....????
    db   $88, $7a, $8c, $7a, $90, $7a, $95, $7a        ;; 0b:79f0 ????????
    db   $c3, $7a, $b0, $7a, $d6, $7a, $e9, $7a        ;; 0b:79f8 ????????
    db   $fa, $7a, $09, $7b, $18, $7b, $36, $7b        ;; 0b:7a00 ????????
    db   $3b, $7b, $40, $7b, $4f, $7b, $5e, $7b        ;; 0b:7a08 ????????
    db   $e5, $7b, $66, $7c, $27, $7b, $77, $7c        ;; 0b:7a10 ????????
    db   $7b, $7c, $7f, $7c, $83, $7c, $87, $7c        ;; 0b:7a18 ????????
    db   $8b, $7c, $8f, $7c, $93, $7c, $97, $7c        ;; 0b:7a20 ????????
    db   $9b, $7c, $9f, $7c, $a3, $7c, $a7, $7c        ;; 0b:7a28 ????????
    db   $ab, $7c, $b0, $7c, $b5, $7c, $ba, $7c        ;; 0b:7a30 ????????
    db   $ba, $7c, $ba, $7c, $c0, $7c, $12, $2c        ;; 0b:7a38 ????????
    db   $21, $35, $36, $1d, $1d, $43, $16, $16        ;; 0b:7a40 ????????
    db   $16, $16, $16, $16, $16, $16, $16, $16        ;; 0b:7a48 ????????
    db   $16, $16, $12, $2c, $22, $29, $2a, $2b        ;; 0b:7a50 ????????
    db   $2c, $38, $10, $12, $15, $14, $07, $0a        ;; 0b:7a58 ??????..
    db   $1e, $09, $28, $28, $28, $28, $28, $28        ;; 0b:7a60 ........
    db   $0b, $21, $21, $20, $20, $2a, $19, $07        ;; 0b:7a68 ........
    db   $0a, $1e, $36, $35, $35, $35, $35, $35        ;; 0b:7a70 ........
    db   $35, $34, $33, $33, $32, $32, $31, $30        ;; 0b:7a78 ........
    db   $18                                           ;; 0b:7a80 ?

data_0b_7a81:
    db   $10, $11, $0b, $16, $10, $11, $0d, $14        ;; 0b:7a81 ????????
    db   $10, $11, $0c, $12, $10, $11, $0a, $18        ;; 0b:7a89 ????????
    db   $07, $12, $79, $4f, $06, $0b, $64, $10        ;; 0b:7a91 ????????
    db   $17, $10, $17, $10, $12, $20, $1a, $20        ;; 0b:7a99 ????????
    db   $1c, $20, $12, $11, $1a, $11, $1c, $11        ;; 0b:7aa1 ????????
    db   $23, $21, $1a, $21, $1c, $21, $0e, $0a        ;; 0b:7aa9 ????????
    db   $0c, $44, $00, $01, $02, $03, $10, $34        ;; 0b:7ab1 ????????
    db   $37, $10, $20, $11, $12, $38, $30, $31        ;; 0b:7ab9 ????????
    db   $31, $33, $0e, $0c, $44, $04, $05, $06        ;; 0b:7ac1 ????????
    db   $03, $14, $15, $16, $17, $24, $25, $26        ;; 0b:7ac9 ????????
    db   $07, $34, $35, $36, $37, $12, $0c, $44        ;; 0b:7ad1 ????????
    db   $00, $01, $02, $03, $10, $08, $37, $10        ;; 0b:7ad9 ????????
    db   $08, $11, $12, $38, $34, $31, $31, $37        ;; 0b:7ae1 ????????
    db   $08, $0a, $27, $0c, $0d, $1c, $1d, $2c        ;; 0b:7ae9 ????????
    db   $2d, $1c, $1d, $2c, $2d, $1c, $1d, $2c        ;; 0b:7af1 ????????
    db   $2d, $2f, $10, $43, $05, $05, $05, $20        ;; 0b:7af9 ????????
    db   $15, $15, $15, $21, $2d, $08, $2d, $22        ;; 0b:7b01 ????????
    db   $35, $06, $43, $20, $05, $20, $20, $05        ;; 0b:7b09 ????????
    db   $2d, $05, $20, $2d, $22, $2d, $22, $2f        ;; 0b:7b11 ????????
    db   $10, $43, $05, $05, $05, $20, $15, $15        ;; 0b:7b19 ????????
    db   $15, $21, $2d, $08, $2d, $22, $35, $06        ;; 0b:7b21 ????????
    db   $43, $05, $05, $05, $20, $15, $15, $15        ;; 0b:7b29 ????????
    db   $21, $2d, $08, $2d, $22, $3d, $23, $12        ;; 0b:7b31 ????????
    db   $20, $21, $22, $0e, $12, $20, $21, $2a        ;; 0b:7b39 ????????
    db   $06, $34, $21, $2e, $21, $2e, $25, $2e        ;; 0b:7b41 ????????
    db   $25, $25, $25, $2b, $2c, $2d, $09, $2e        ;; 0b:7b49 ????????
    db   $34, $21, $21, $21, $22, $22, $22, $22        ;; 0b:7b51 ????????
    db   $22, $22, $23, $23, $23, $09, $16, $bc        ;; 0b:7b59 ????????
    db   $1e, $33, $33, $33, $33, $33, $33, $33        ;; 0b:7b61 ????????
    db   $33, $28, $1e, $1e, $34, $34, $34, $34        ;; 0b:7b69 ????????
    db   $34, $34, $34, $34, $18, $1e, $1e, $08        ;; 0b:7b71 ????????
    db   $29, $29, $29, $29, $29, $29, $29, $09        ;; 0b:7b79 ????????
    db   $1e, $1e, $28, $09, $09, $09, $09, $09        ;; 0b:7b81 ????????
    db   $09, $09, $09, $1e, $33, $28, $09, $09        ;; 0b:7b89 ????????
    db   $09, $09, $09, $09, $09, $15, $1b, $34        ;; 0b:7b91 ????????
    db   $18, $09, $09, $09, $09, $09, $09, $09        ;; 0b:7b99 ????????
    db   $15, $1b, $08                                 ;; 0b:7ba1 ???

data_0b_7ba4:
    db   $09, $09, $09, $09, $09, $09, $09, $09        ;; 0b:7ba4 ????????
    db   $15, $1b, $28, $09, $09, $09, $09, $09        ;; 0b:7bac ????????
    db   $09, $09, $09, $15, $1b, $28, $09, $09        ;; 0b:7bb4 ????????
    db   $09, $09, $09, $09, $09, $14, $15, $1b        ;; 0b:7bbc ????????
    db   $18, $09, $24, $24, $24, $24, $24, $24        ;; 0b:7bc4 ????????
    db   $24, $25, $1b, $09, $09, $1b, $1b, $1b        ;; 0b:7bcc ????????
    db   $1b, $1b, $1b, $1b, $1b, $1b, $09, $09        ;; 0b:7bd4 ????????
    db   $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b        ;; 0b:7bdc ????????
    db   $1b, $2a, $12, $e9, $10, $04, $04, $10        ;; 0b:7be4 ????????
    db   $04, $10, $04, $10, $04, $10, $10, $04        ;; 0b:7bec ????????
    db   $04, $10, $04, $10, $04, $10, $04, $10        ;; 0b:7bf4 ????????
    db   $04, $10, $04, $10, $04, $04, $10, $04        ;; 0b:7bfc ????????
    db   $05, $04, $04, $04, $10, $04, $04, $04        ;; 0b:7c04 ????????
    db   $04, $04, $04, $10, $04, $04, $06, $04        ;; 0b:7c0c ????????
    db   $04, $10, $04, $04, $10, $10, $04, $04        ;; 0b:7c14 ????????
    db   $10, $04, $10, $10, $10, $04, $10, $10        ;; 0b:7c1c ????????
    db   $04, $04, $10, $10, $04, $10, $04, $04        ;; 0b:7c24 ????????
    db   $10, $04, $04, $10, $04, $04, $10, $04        ;; 0b:7c2c ????????
    db   $04, $04, $04, $04, $04, $04, $04, $04        ;; 0b:7c34 ????????
    db   $10, $10, $04, $04, $04, $10, $04, $10        ;; 0b:7c3c ????????
    db   $04, $04, $04, $04, $10, $10, $05, $04        ;; 0b:7c44 ????????
    db   $10, $04, $10, $04, $10, $04, $10, $04        ;; 0b:7c4c ????????
    db   $04, $10, $04, $04, $05, $04, $10, $10        ;; 0b:7c54 ????????
    db   $04, $04, $04, $10, $04, $04, $10, $04        ;; 0b:7c5c ????????
    db   $10, $04, $16, $0a, $27, $0c, $0d, $1c        ;; 0b:7c64 ????????
    db   $1d, $2c, $2d, $1c, $1d, $2c, $2d, $1c        ;; 0b:7c6c ????????
    db   $1d, $2c, $2d, $2b, $18, $11, $6b, $2b        ;; 0b:7c74 ????????
    db   $18, $11, $6e, $2b, $18, $11, $6d, $2b        ;; 0b:7c7c ????????
    db   $18, $11, $6c, $22, $02, $11, $36, $24        ;; 0b:7c84 ????????
    db   $02, $11, $37, $2b, $02, $11, $38, $2d        ;; 0b:7c8c ????????
    db   $02, $11, $39, $2f, $02, $11, $3a, $37        ;; 0b:7c94 ????????
    db   $20, $11, $2a, $1f, $12, $11, $24, $22        ;; 0b:7c9c ????????
    db   $10, $11, $22, $21, $13, $11, $2f, $20        ;; 0b:7ca4 ????????
    db   $06, $12, $74, $73, $2e, $11, $12, $74        ;; 0b:7cac ????????
    db   $73, $33, $10, $12, $74, $73, $3a, $07        ;; 0b:7cb4 ????????
    db   $13, $13, $13, $13, $35, $3c, $22, $0f        ;; 0b:7cbc ????????
    db   $0f, $2d, $2d, $15, $0a, $03, $03, $03        ;; 0b:7cc4 ????????
    db   $03                                           ;; 0b:7ccc ?
    ld   HL, data_0b_48a0                              ;; 0b:7ccd $21 $a0 $48
    ld   DE, $9080                                     ;; 0b:7cd0 $11 $80 $90
    ld   BC, $60                                       ;; 0b:7cd3 $01 $60 $00
    di                                                 ;; 0b:7cd6 $f3
    rst  rst_00_0018                                   ;; 0b:7cd7 $df
    db   $31                                           ;; 0b:7cd8 .
    call call_0b_7d60                                  ;; 0b:7cd9 $cd $60 $7d
    reti                                               ;; 0b:7cdc $d9

call_0b_7cdd:
    ldh  A, [hFF93]                                    ;; 0b:7cdd $f0 $93
    and  A, $07                                        ;; 0b:7cdf $e6 $07
    jp   Z, call_0b_7d60                               ;; 0b:7ce1 $ca $60 $7d
    cp   A, $02                                        ;; 0b:7ce4 $fe $02
    jr   C, jr_0b_7d49                                 ;; 0b:7ce6 $38 $61
    ret  NZ                                            ;; 0b:7ce8 $c0
    ldh  A, [hFF93]                                    ;; 0b:7ce9 $f0 $93
    and  A, $f0                                        ;; 0b:7ceb $e6 $f0
    ret  NZ                                            ;; 0b:7ced $c0
    ldh  A, [hFF93]                                    ;; 0b:7cee $f0 $93
    and  A, $08                                        ;; 0b:7cf0 $e6 $08
    jr   NZ, .jr_0b_7d05                               ;; 0b:7cf2 $20 $11
    ld   HL, $9040                                     ;; 0b:7cf4 $21 $40 $90
    ld   DE, data_0b_7daa                              ;; 0b:7cf7 $11 $aa $7d
    call call_0b_7d16                                  ;; 0b:7cfa $cd $16 $7d
    ld   HL, $9060                                     ;; 0b:7cfd $21 $60 $90
    ld   DE, data_0b_7dba                              ;; 0b:7d00 $11 $ba $7d
    jr   call_0b_7d16                                  ;; 0b:7d03 $18 $11
.jr_0b_7d05:
    ld   HL, $9050                                     ;; 0b:7d05 $21 $50 $90
    ld   DE, data_0b_7db2                              ;; 0b:7d08 $11 $b2 $7d
    call call_0b_7d16                                  ;; 0b:7d0b $cd $16 $7d
    ld   HL, $9070                                     ;; 0b:7d0e $21 $70 $90
    ld   DE, data_0b_7dc2                              ;; 0b:7d11 $11 $c2 $7d
    jr   call_0b_7d16                                  ;; 0b:7d14 $18 $00

call_0b_7d16:
    ld   B, $08                                        ;; 0b:7d16 $06 $08
    call call_0b_7d9d                                  ;; 0b:7d18 $cd $9d $7d
.jr_0b_7d1b:
    ld   A, [DE]                                       ;; 0b:7d1b $1a
    ld   C, A                                          ;; 0b:7d1c $4f
    push DE                                            ;; 0b:7d1d $d5
    ld   A, [HL+]                                      ;; 0b:7d1e $2a
    ld   E, A                                          ;; 0b:7d1f $5f
    ld   A, [HL-]                                      ;; 0b:7d20 $3a
    ld   D, A                                          ;; 0b:7d21 $57
    push HL                                            ;; 0b:7d22 $e5
    ld   L, C                                          ;; 0b:7d23 $69
    ld   C, $08                                        ;; 0b:7d24 $0e $08
.jr_0b_7d26:
    xor  A, A                                          ;; 0b:7d26 $af
    rlc  E                                             ;; 0b:7d27 $cb $03
    rla                                                ;; 0b:7d29 $17
    rlc  D                                             ;; 0b:7d2a $cb $02
    rla                                                ;; 0b:7d2c $17
    rlc  L                                             ;; 0b:7d2d $cb $05
    jr   C, .jr_0b_7d37                                ;; 0b:7d2f $38 $06
    xor  A, $03                                        ;; 0b:7d31 $ee $03
    jr   NZ, .jr_0b_7d37                               ;; 0b:7d33 $20 $02
    res  0, D                                          ;; 0b:7d35 $cb $82
.jr_0b_7d37:
    dec  C                                             ;; 0b:7d37 $0d
    jr   NZ, .jr_0b_7d26                               ;; 0b:7d38 $20 $ec
    pop  HL                                            ;; 0b:7d3a $e1
    call call_0b_7d9d                                  ;; 0b:7d3b $cd $9d $7d
    ld   A, E                                          ;; 0b:7d3e $7b
    ld   [HL+], A                                      ;; 0b:7d3f $22
    ld   A, D                                          ;; 0b:7d40 $7a
    ld   [HL+], A                                      ;; 0b:7d41 $22
    pop  DE                                            ;; 0b:7d42 $d1
    inc  DE                                            ;; 0b:7d43 $13
    dec  B                                             ;; 0b:7d44 $05
    jr   NZ, .jr_0b_7d1b                               ;; 0b:7d45 $20 $d4
    ret                                                ;; 0b:7d47 $c9
    db   $c9                                           ;; 0b:7d48 ?

jr_0b_7d49:
    ld   HL, $90c0                                     ;; 0b:7d49 $21 $c0 $90
    ld   B, $10                                        ;; 0b:7d4c $06 $10
.jr_0b_7d4e:
    call call_0b_7d9d                                  ;; 0b:7d4e $cd $9d $7d
    ld   A, [HL]                                       ;; 0b:7d51 $7e
    set  4, L                                          ;; 0b:7d52 $cb $e5
    rla                                                ;; 0b:7d54 $17
    rl   [HL]                                          ;; 0b:7d55 $cb $16
    res  4, L                                          ;; 0b:7d57 $cb $a5
    rl   [HL]                                          ;; 0b:7d59 $cb $16
    inc  L                                             ;; 0b:7d5b $2c
    dec  B                                             ;; 0b:7d5c $05
    jr   NZ, .jr_0b_7d4e                               ;; 0b:7d5d $20 $ef
    ret                                                ;; 0b:7d5f $c9

call_0b_7d60:
    ld   HL, $90d0                                     ;; 0b:7d60 $21 $d0 $90
    ld   DE, $90e0                                     ;; 0b:7d63 $11 $e0 $90
    ld   BC, $10                                       ;; 0b:7d66 $01 $10 $00
    rst  rst_00_0018                                   ;; 0b:7d69 $df
    db   $01                                           ;; 0b:7d6a .
    ld   HL, $90c0                                     ;; 0b:7d6b $21 $c0 $90
    ld   BC, $10                                       ;; 0b:7d6e $01 $10 $00
    rst  rst_00_0018                                   ;; 0b:7d71 $df
    db   $01                                           ;; 0b:7d72 .
    ld   HL, $90c0                                     ;; 0b:7d73 $21 $c0 $90
    ld   DE, data_0b_7daa                              ;; 0b:7d76 $11 $aa $7d
    ld   B, $20                                        ;; 0b:7d79 $06 $20
.jr_0b_7d7b:
    ld   A, [DE]                                       ;; 0b:7d7b $1a
    inc  DE                                            ;; 0b:7d7c $13
    ld   C, A                                          ;; 0b:7d7d $4f
    call call_0b_7d9d                                  ;; 0b:7d7e $cd $9d $7d
    ld   A, [HL]                                       ;; 0b:7d81 $7e
    and  A, C                                          ;; 0b:7d82 $a1
    res  6, L                                          ;; 0b:7d83 $cb $b5
    or   A, [HL]                                       ;; 0b:7d85 $b6
    set  6, L                                          ;; 0b:7d86 $cb $f5
    res  7, L                                          ;; 0b:7d88 $cb $bd
    ld   [HL+], A                                      ;; 0b:7d8a $22
    set  7, L                                          ;; 0b:7d8b $cb $fd
    ld   A, [HL]                                       ;; 0b:7d8d $7e
    and  A, C                                          ;; 0b:7d8e $a1
    res  6, L                                          ;; 0b:7d8f $cb $b5
    or   A, [HL]                                       ;; 0b:7d91 $b6
    set  6, L                                          ;; 0b:7d92 $cb $f5
    res  7, L                                          ;; 0b:7d94 $cb $bd
    ld   [HL+], A                                      ;; 0b:7d96 $22
    set  7, L                                          ;; 0b:7d97 $cb $fd
    dec  B                                             ;; 0b:7d99 $05
    jr   NZ, .jr_0b_7d7b                               ;; 0b:7d9a $20 $df
    ret                                                ;; 0b:7d9c $c9

call_0b_7d9d:
    ldh  A, [rSTAT]                                    ;; 0b:7d9d $f0 $41
    and  A, $03                                        ;; 0b:7d9f $e6 $03
    jr   Z, call_0b_7d9d                               ;; 0b:7da1 $28 $fa
.jr_0b_7da3:
    ldh  A, [rSTAT]                                    ;; 0b:7da3 $f0 $41
    and  A, $03                                        ;; 0b:7da5 $e6 $03
    jr   NZ, .jr_0b_7da3                               ;; 0b:7da7 $20 $fa
    ret                                                ;; 0b:7da9 $c9

data_0b_7daa:
    db   $ff, $fc, $f0, $e0, $c0, $c0, $c0, $e0        ;; 0b:7daa ........

data_0b_7db2:
    db   $ff, $1f, $07, $03, $01, $01, $01, $03        ;; 0b:7db2 ........

data_0b_7dba:
    db   $e0, $f0, $f0, $f8, $fc, $fe, $ff, $ff        ;; 0b:7dba ........

data_0b_7dc2:
    db   $03, $07, $07, $0f, $1f, $3f, $7f, $ff        ;; 0b:7dc2 ........
    or   A, A                                          ;; 0b:7dca $b7
    jp   NZ, call_0b_7e17                              ;; 0b:7dcb $c2 $17 $7e
    ld   B, $05                                        ;; 0b:7dce $06 $05
    ld   DE, $8000                                     ;; 0b:7dd0 $11 $00 $80
.jr_0b_7dd3:
    push DE                                            ;; 0b:7dd3 $d5
    ld   A, $05                                        ;; 0b:7dd4 $3e $05
    sub  A, B                                          ;; 0b:7dd6 $90
    call call_00_1fcd                                  ;; 0b:7dd7 $cd $cd $1f
    ld   DE, wC50D                                     ;; 0b:7dda $11 $0d $c5
    add  HL, DE                                        ;; 0b:7ddd $19
    pop  DE                                            ;; 0b:7dde $d1
    push BC                                            ;; 0b:7ddf $c5
    call call_0b_7e17                                  ;; 0b:7de0 $cd $17 $7e
    pop  BC                                            ;; 0b:7de3 $c1
    dec  B                                             ;; 0b:7de4 $05
    jr   NZ, .jr_0b_7dd3                               ;; 0b:7de5 $20 $ec
    ld   HL, $40                                       ;; 0b:7de7 $21 $40 $00
    add  HL, DE                                        ;; 0b:7dea $19
    ld   E, L                                          ;; 0b:7deb $5d
    ld   D, H                                          ;; 0b:7dec $54
    ld   HL, data_0b_5700                              ;; 0b:7ded $21 $00 $57
    call call_0b_7e7d                                  ;; 0b:7df0 $cd $7d $7e
    ld   HL, data_0b_5740                              ;; 0b:7df3 $21 $40 $57
    call call_0b_7e7d                                  ;; 0b:7df6 $cd $7d $7e
    ld   HL, data_0b_5780                              ;; 0b:7df9 $21 $80 $57
    call call_0b_7e83                                  ;; 0b:7dfc $cd $83 $7e
    ld   HL, data_0b_5780                              ;; 0b:7dff $21 $80 $57
    call call_0b_7e83                                  ;; 0b:7e02 $cd $83 $7e
    ld   HL, data_0b_5790                              ;; 0b:7e05 $21 $90 $57
    call call_0b_7e83                                  ;; 0b:7e08 $cd $83 $7e
    ld   HL, data_0b_57a0                              ;; 0b:7e0b $21 $a0 $57
    call call_0b_7e83                                  ;; 0b:7e0e $cd $83 $7e
    ld   HL, data_0b_57b0                              ;; 0b:7e11 $21 $b0 $57
    jp   call_0b_7e83                                  ;; 0b:7e14 $c3 $83 $7e

call_0b_7e17:
    ld   [wCD4D], A                                    ;; 0b:7e17 $ea $4d $cd
    push DE                                            ;; 0b:7e1a $d5
    push HL                                            ;; 0b:7e1b $e5
    ld   DE, hFFF4                                     ;; 0b:7e1c $11 $f4 $ff
    add  HL, DE                                        ;; 0b:7e1f $19
    ld   A, [HL+]                                      ;; 0b:7e20 $2a
    and  A, $fc                                        ;; 0b:7e21 $e6 $fc
    ld   E, A                                          ;; 0b:7e23 $5f
    ld   A, [HL]                                       ;; 0b:7e24 $7e
    and  A, $e0                                        ;; 0b:7e25 $e6 $e0
    or   A, E                                          ;; 0b:7e27 $b3
    jr   Z, .jr_0b_7e2c                                ;; 0b:7e28 $28 $02
    ld   A, $40                                        ;; 0b:7e2a $3e $40
.jr_0b_7e2c:
    pop  HL                                            ;; 0b:7e2c $e1
    push AF                                            ;; 0b:7e2d $f5
    ld   E, A                                          ;; 0b:7e2e $5f
    ld   A, [wCD4D]                                    ;; 0b:7e2f $fa $4d $cd
    cp   A, $02                                        ;; 0b:7e32 $fe $02
    jr   NZ, .jr_0b_7e38                               ;; 0b:7e34 $20 $02
    ld   E, $40                                        ;; 0b:7e36 $1e $40
.jr_0b_7e38:
    pop  AF                                            ;; 0b:7e38 $f1
    ld   A, E                                          ;; 0b:7e39 $7b
    push AF                                            ;; 0b:7e3a $f5
    rst  rst_00_0018                                   ;; 0b:7e3b $df
    db   $5f                                           ;; 0b:7e3c .
    and  A, $3f                                        ;; 0b:7e3d $e6 $3f
    or   A, $40                                        ;; 0b:7e3f $f6 $40
    ld   H, A                                          ;; 0b:7e41 $67
    pop  AF                                            ;; 0b:7e42 $f1
    ld   L, A                                          ;; 0b:7e43 $6f
    ld   BC, $40                                       ;; 0b:7e44 $01 $40 $00
    pop  DE                                            ;; 0b:7e47 $d1
    push AF                                            ;; 0b:7e48 $f5
    push DE                                            ;; 0b:7e49 $d5
    rst  rst_00_0018                                   ;; 0b:7e4a $df
    db   $41                                           ;; 0b:7e4b .
    pop  HL                                            ;; 0b:7e4c $e1
    pop  AF                                            ;; 0b:7e4d $f1
    ret  Z                                             ;; 0b:7e4e $c8
    ld   DE, wC880                                     ;; 0b:7e4f $11 $80 $c8
    ld   BC, $40                                       ;; 0b:7e52 $01 $40 $00
    push BC                                            ;; 0b:7e55 $c5
    push DE                                            ;; 0b:7e56 $d5
    push HL                                            ;; 0b:7e57 $e5
    rst  rst_00_0018                                   ;; 0b:7e58 $df
    db   $01                                           ;; 0b:7e59 .
    ld   HL, wC880                                     ;; 0b:7e5a $21 $80 $c8
    ld   C, $20                                        ;; 0b:7e5d $0e $20
.jr_0b_7e5f:
    ld   A, [HL+]                                      ;; 0b:7e5f $2a
    ld   E, A                                          ;; 0b:7e60 $5f
    ld   A, [HL-]                                      ;; 0b:7e61 $3a
    ld   D, A                                          ;; 0b:7e62 $57
    ld   B, $08                                        ;; 0b:7e63 $06 $08
.jr_0b_7e65:
    sla  E                                             ;; 0b:7e65 $cb $23
    sla  D                                             ;; 0b:7e67 $cb $22
    jr   NC, .jr_0b_7e6d                               ;; 0b:7e69 $30 $02
    set  0, D                                          ;; 0b:7e6b $cb $c2
.jr_0b_7e6d:
    dec  B                                             ;; 0b:7e6d $05
    jr   NZ, .jr_0b_7e65                               ;; 0b:7e6e $20 $f5
    ld   A, E                                          ;; 0b:7e70 $7b
    ld   [HL+], A                                      ;; 0b:7e71 $22
    ld   A, D                                          ;; 0b:7e72 $7a
    ld   [HL+], A                                      ;; 0b:7e73 $22
    dec  C                                             ;; 0b:7e74 $0d
    jr   NZ, .jr_0b_7e5f                               ;; 0b:7e75 $20 $e8
    pop  DE                                            ;; 0b:7e77 $d1
    pop  HL                                            ;; 0b:7e78 $e1
    pop  BC                                            ;; 0b:7e79 $c1
    rst  rst_00_0018                                   ;; 0b:7e7a $df
    db   $01                                           ;; 0b:7e7b .
    ret                                                ;; 0b:7e7c $c9

call_0b_7e7d:
    ld   BC, $40                                       ;; 0b:7e7d $01 $40 $00
    rst  rst_00_0018                                   ;; 0b:7e80 $df
    db   $31                                           ;; 0b:7e81 .
    ret                                                ;; 0b:7e82 $c9

call_0b_7e83:
    ld   BC, $10                                       ;; 0b:7e83 $01 $10 $00
    rst  rst_00_0018                                   ;; 0b:7e86 $df
    db   $31                                           ;; 0b:7e87 .
    ret                                                ;; 0b:7e88 $c9
    db   $cd, $a9, $7e, $4f, $fa, $6e, $c9, $3d        ;; 0b:7e89 ????????
    db   $e6, $fe, $87, $18, $0c, $cd, $a9, $7e        ;; 0b:7e91 ????????
    db   $cb, $3f, $4f, $fa, $6e, $c9, $3d, $e6        ;; 0b:7e99 ????????
    db   $fe, $81, $c7, $7e, $ea, $88, $d8, $c9        ;; 0b:7ea1 ????????
    db   $21, $7b, $c9, $2a, $66, $6f, $fa, $95        ;; 0b:7ea9 ????????
    db   $c9, $c9, $0a, $0d, $04, $07, $1e, $21        ;; 0b:7eb1 ????????
    db   $10, $12, $00, $02, $36, $39, $0b, $0e        ;; 0b:7eb9 ????????
    db   $05, $08, $28, $2a, $11, $13, $01, $03        ;; 0b:7ec1 ????????
    db   $2c, $2e, $0c, $0f, $06, $09, $1f, $22        ;; 0b:7ec9 ????????
    db   $18, $1b, $30, $33, $37, $3a, $14, $16        ;; 0b:7ed1 ????????
    db   $24, $26, $29, $2b, $19, $1c, $31, $34        ;; 0b:7ed9 ????????
    db   $2d, $2f, $15, $17, $25, $27, $20, $23        ;; 0b:7ee1 ????????
    db   $1a, $1d, $32, $35, $35, $32, $38, $38        ;; 0b:7ee9 ????????
    db   $3b, $3b, $3c, $41, $46, $4b, $64, $69        ;; 0b:7ef1 ????????
    db   $47, $4c, $3d, $42, $6e, $70, $3e, $43        ;; 0b:7ef9 ????????
    db   $48, $4d, $65, $6a, $49, $4e, $3f, $44        ;; 0b:7f01 ????????
    db   $6f, $71, $40, $45, $4a, $4f, $66, $6b        ;; 0b:7f09 ????????
    db   $5a, $5f, $50, $55, $72, $74, $51, $56        ;; 0b:7f11 ????????
    db   $5b, $60, $67, $6c, $5c, $61, $52, $57        ;; 0b:7f19 ????????
    db   $73, $75, $53, $58, $5d, $62, $68, $6d        ;; 0b:7f21 ????????
    db   $5e, $63, $54, $54, $59, $54, $76, $77        ;; 0b:7f29 ????????
    db   $76, $77, $78, $7d, $79, $8c, $91, $7e        ;; 0b:7f31 ????????
    db   $7a, $7f, $7b, $8d, $92, $80, $7c, $81        ;; 0b:7f39 ????????
    db   $82, $8e, $93, $87, $83, $88, $84, $8f        ;; 0b:7f41 ????????
    db   $94, $89, $85, $8a, $86, $90, $8b, $8b        ;; 0b:7f49 ????????
    db   $95, $95, $96, $9b, $97, $aa, $af, $9c        ;; 0b:7f51 ????????
    db   $98, $9d, $99, $ab, $b0, $9e, $9a, $9f        ;; 0b:7f59 ????????
    db   $a0, $ac, $b1, $a5, $a1, $a6, $a2, $ad        ;; 0b:7f61 ????????
    db   $b2, $a7, $a3, $a8, $a4, $ae, $a9, $a9        ;; 0b:7f69 ????????
    db   $b3, $b3                                      ;; 0b:7f71 ??
