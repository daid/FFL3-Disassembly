;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank02", ROMX[$4000], BANK[$02]
    ld   A, [wC9BD]                                    ;; 02:4000 $fa $bd $c9
    bit  7, A                                          ;; 02:4003 $cb $7f
    jp   Z, call_02_4397                               ;; 02:4005 $ca $97 $43
    and  A, $7f                                        ;; 02:4008 $e6 $7f
    ld   [wDE00], A                                    ;; 02:400a $ea $00 $de
    ld   A, [wC9D8]                                    ;; 02:400d $fa $d8 $c9
    ld   [wDE01], A                                    ;; 02:4010 $ea $01 $de
    cp   A, $05                                        ;; 02:4013 $fe $05
    jr   C, jr_02_403d                                 ;; 02:4015 $38 $26
    ld   DE, data_02_4101                              ;; 02:4017 $11 $01 $41
    call call_02_4023                                  ;; 02:401a $cd $23 $40
    call call_02_41b1                                  ;; 02:401d $cd $b1 $41
    ld   DE, data_02_4105                              ;; 02:4020 $11 $05 $41

call_02_4023:
    ld   A, [wC9E6]                                    ;; 02:4023 $fa $e6 $c9
    inc  A                                             ;; 02:4026 $3c
    ret  Z                                             ;; 02:4027 $c8
    ld   B, $04                                        ;; 02:4028 $06 $04
.jr_02_402a:
    ld   A, [wC9D6]                                    ;; 02:402a $fa $d6 $c9
    cp   A, $05                                        ;; 02:402d $fe $05
    ret  NC                                            ;; 02:402f $d0
    call call_02_40f0                                  ;; 02:4030 $cd $f0 $40
    ld   A, $02                                        ;; 02:4033 $3e $02
    call call_00_3a6d                                  ;; 02:4035 $cd $6d $3a
    inc  DE                                            ;; 02:4038 $13
    dec  B                                             ;; 02:4039 $05
    jr   NZ, .jr_02_402a                               ;; 02:403a $20 $ee
    ret                                                ;; 02:403c $c9

jr_02_403d:
    ld   [wDE10], A                                    ;; 02:403d $ea $10 $de
    ld   A, [wCBFF]                                    ;; 02:4040 $fa $ff $cb
    and  A, A                                          ;; 02:4043 $a7
    ret  Z                                             ;; 02:4044 $c8
    ld   A, [wDE00]                                    ;; 02:4045 $fa $00 $de
    and  A, A                                          ;; 02:4048 $a7
    ret  Z                                             ;; 02:4049 $c8
    ld   A, [wC99C]                                    ;; 02:404a $fa $9c $c9
    ld   B, A                                          ;; 02:404d $47
    and  A, $80                                        ;; 02:404e $e6 $80
    jr   Z, .jr_02_407e                                ;; 02:4050 $28 $2c
    ld   DE, $c0                                       ;; 02:4052 $11 $c0 $00
    call call_02_4171                                  ;; 02:4055 $cd $71 $41
    ld   C, A                                          ;; 02:4058 $4f
    ld   A, [wDC82]                                    ;; 02:4059 $fa $82 $dc
    ld   B, A                                          ;; 02:405c $47
    ld   DE, data_02_40fa                              ;; 02:405d $11 $fa $40
    ld   A, $07                                        ;; 02:4060 $3e $07
    ld   [wDE0F], A                                    ;; 02:4062 $ea $0f $de
.jr_02_4065:
    push BC                                            ;; 02:4065 $c5
    xor  A, A                                          ;; 02:4066 $af
.jr_02_4067:
    push AF                                            ;; 02:4067 $f5
    srl  C                                             ;; 02:4068 $cb $39
    call NC, call_02_40f0                              ;; 02:406a $d4 $f0 $40
    pop  AF                                            ;; 02:406d $f1
    inc  A                                             ;; 02:406e $3c
    dec  B                                             ;; 02:406f $05
    jr   NZ, .jr_02_4067                               ;; 02:4070 $20 $f5
    call call_02_40d6                                  ;; 02:4072 $cd $d6 $40
    inc  DE                                            ;; 02:4075 $13
    pop  BC                                            ;; 02:4076 $c1
    ld   HL, wDE0F                                     ;; 02:4077 $21 $0f $de
    dec  [HL]                                          ;; 02:407a $35
    jr   NZ, .jr_02_4065                               ;; 02:407b $20 $e8
    ret                                                ;; 02:407d $c9
.jr_02_407e:
    ld   A, [wC9F7]                                    ;; 02:407e $fa $f7 $c9
    cp   A, $05                                        ;; 02:4081 $fe $05
    push AF                                            ;; 02:4083 $f5
    jr   NC, .jr_02_4090                               ;; 02:4084 $30 $0a
    bit  6, B                                          ;; 02:4086 $cb $70
    jr   NZ, .jr_02_4090                               ;; 02:4088 $20 $06
    ld   [wDE10], A                                    ;; 02:408a $ea $10 $de
    call call_02_40a7                                  ;; 02:408d $cd $a7 $40
.jr_02_4090:
    ld   DE, data_02_40fa                              ;; 02:4090 $11 $fa $40
    ld   B, $07                                        ;; 02:4093 $06 $07
.jr_02_4095:
    ld   A, [wDE01]                                    ;; 02:4095 $fa $01 $de
    call call_02_40f0                                  ;; 02:4098 $cd $f0 $40
    call call_02_40d6                                  ;; 02:409b $cd $d6 $40
    inc  DE                                            ;; 02:409e $13
    dec  B                                             ;; 02:409f $05
    jr   NZ, .jr_02_4095                               ;; 02:40a0 $20 $f3
    pop  AF                                            ;; 02:40a2 $f1
    call C, call_02_4110                               ;; 02:40a3 $dc $10 $41
    ret                                                ;; 02:40a6 $c9

call_02_40a7:
    ld   C, $10                                        ;; 02:40a7 $0e $10
    ld   A, [wDE10]                                    ;; 02:40a9 $fa $10 $de
    ld   E, A                                          ;; 02:40ac $5f
    ld   A, [wDE01]                                    ;; 02:40ad $fa $01 $de
    ld   D, A                                          ;; 02:40b0 $57
    cp   A, E                                          ;; 02:40b1 $bb
    jr   NC, .jr_02_40b6                               ;; 02:40b2 $30 $02
    ld   C, $f0                                        ;; 02:40b4 $0e $f0
.jr_02_40b6:
    call call_02_40e8                                  ;; 02:40b6 $cd $e8 $40
    inc  HL                                            ;; 02:40b9 $23
    ld   A, [HL]                                       ;; 02:40ba $7e
    ld   B, A                                          ;; 02:40bb $47
    push BC                                            ;; 02:40bc $c5
    sub  A, C                                          ;; 02:40bd $91
    ld   C, A                                          ;; 02:40be $4f
    ld   A, E                                          ;; 02:40bf $7b
    call call_02_40db                                  ;; 02:40c0 $cd $db $40
    call call_02_40d6                                  ;; 02:40c3 $cd $d6 $40
    pop  BC                                            ;; 02:40c6 $c1
    ld   A, C                                          ;; 02:40c7 $79
    add  A, B                                          ;; 02:40c8 $80
    ld   C, A                                          ;; 02:40c9 $4f
    ld   A, D                                          ;; 02:40ca $7a
    call call_02_40db                                  ;; 02:40cb $cd $db $40
    ld   C, B                                          ;; 02:40ce $48
    ld   A, E                                          ;; 02:40cf $7b
    call call_02_40db                                  ;; 02:40d0 $cd $db $40
    call call_02_40d6                                  ;; 02:40d3 $cd $d6 $40

call_02_40d6:
    ld   A, $03                                        ;; 02:40d6 $3e $03
    jp   call_00_3a6d                                  ;; 02:40d8 $c3 $6d $3a

call_02_40db:
    call call_02_40e8                                  ;; 02:40db $cd $e8 $40
    inc  HL                                            ;; 02:40de $23
    ld   A, C                                          ;; 02:40df $79
    ld   [HL+], A                                      ;; 02:40e0 $22
    inc  HL                                            ;; 02:40e1 $23
    inc  HL                                            ;; 02:40e2 $23
    inc  HL                                            ;; 02:40e3 $23
    add  A, $08                                        ;; 02:40e4 $c6 $08
    ld   [HL], A                                       ;; 02:40e6 $77
    ret                                                ;; 02:40e7 $c9

call_02_40e8:
    ld   HL, wDC83                                     ;; 02:40e8 $21 $83 $dc
    add  A, A                                          ;; 02:40eb $87
    add  A, A                                          ;; 02:40ec $87
    add  A, A                                          ;; 02:40ed $87
    rst  add_hl_a                                      ;; 02:40ee $c7
    ret                                                ;; 02:40ef $c9

call_02_40f0:
    call call_02_40e8                                  ;; 02:40f0 $cd $e8 $40
    ld   A, [DE]                                       ;; 02:40f3 $1a
    ld   [HL+], A                                      ;; 02:40f4 $22
    inc  HL                                            ;; 02:40f5 $23
    inc  HL                                            ;; 02:40f6 $23
    inc  HL                                            ;; 02:40f7 $23
    ld   [HL], A                                       ;; 02:40f8 $77
    ret                                                ;; 02:40f9 $c9

data_02_40fa:
    db   $58, $5b, $58, $5a, $58, $59, $58             ;; 02:40fa .......

data_02_4101:
    db   $57, $56, $55, $54                            ;; 02:4101 ....

data_02_4105:
    db   $55, $56, $57, $58                            ;; 02:4105 ....

data_02_4109:
    call call_00_3a6b                                  ;; 02:4109 $cd $6b $3a
    ld   A, $e7                                        ;; 02:410c $3e $e7
    ldh  [rLCDC], A                                    ;; 02:410e $e0 $40

call_02_4110:
    ld   A, [wDDFF]                                    ;; 02:4110 $fa $ff $dd
    ld   B, A                                          ;; 02:4113 $47
    and  A, $01                                        ;; 02:4114 $e6 $01
    add  A, A                                          ;; 02:4116 $87
    add  A, A                                          ;; 02:4117 $87
    ld   HL, .data_02_4139                             ;; 02:4118 $21 $39 $41
    rst  add_hl_a                                      ;; 02:411b $c7
    ld   E, L                                          ;; 02:411c $5d
    ld   D, H                                          ;; 02:411d $54
    ld   HL, wDC80                                     ;; 02:411e $21 $80 $dc
    xor  A, A                                          ;; 02:4121 $af
    ld   [HL+], A                                      ;; 02:4122 $22
    ld   [HL+], A                                      ;; 02:4123 $22
    ld   A, B                                          ;; 02:4124 $78
    ld   [HL+], A                                      ;; 02:4125 $22
    ld   C, $36                                        ;; 02:4126 $0e $36
.jr_02_4128:
    call call_02_4154                                  ;; 02:4128 $cd $54 $41
    dec  B                                             ;; 02:412b $05
    jr   NZ, .jr_02_4128                               ;; 02:412c $20 $fa
    call call_02_4167                                  ;; 02:412e $cd $67 $41
    ld   A, $01                                        ;; 02:4131 $3e $01
    ld   [wCBFF], A                                    ;; 02:4133 $ea $ff $cb
    jp   call_00_3a6b                                  ;; 02:4136 $c3 $6b $3a
.data_02_4139:
    db   $14, $3c, $64, $8c, $10, $30, $50, $70        ;; 02:4139 ....????
    db   $90                                           ;; 02:4141 ?

data_02_4142:
    ld   HL, wDC83                                     ;; 02:4142 $21 $83 $dc
    ld   B, $28                                        ;; 02:4145 $06 $28
    xor  A, A                                          ;; 02:4147 $af
.jr_02_4148:
    ld   [HL+], A                                      ;; 02:4148 $22
    dec  B                                             ;; 02:4149 $05
    jr   NZ, .jr_02_4148                               ;; 02:414a $20 $fc
    call call_00_3a6b                                  ;; 02:414c $cd $6b $3a
    xor  A, A                                          ;; 02:414f $af
    ld   [wCBFF], A                                    ;; 02:4150 $ea $ff $cb
    ret                                                ;; 02:4153 $c9

call_02_4154:
    ld   A, [DE]                                       ;; 02:4154 $1a
    call call_02_415c                                  ;; 02:4155 $cd $5c $41
    ld   A, [DE]                                       ;; 02:4158 $1a
    inc  DE                                            ;; 02:4159 $13
    add  A, $08                                        ;; 02:415a $c6 $08

call_02_415c:
    ld   [HL], $58                                     ;; 02:415c $36 $58
    inc  HL                                            ;; 02:415e $23
    ld   [HL+], A                                      ;; 02:415f $22
    ld   A, C                                          ;; 02:4160 $79
    inc  C                                             ;; 02:4161 $0c
    add  A, A                                          ;; 02:4162 $87
    ld   [HL+], A                                      ;; 02:4163 $22
    xor  A, A                                          ;; 02:4164 $af
    ld   [HL+], A                                      ;; 02:4165 $22
    ret                                                ;; 02:4166 $c9

call_02_4167:
    call call_02_416e                                  ;; 02:4167 $cd $6e $41
    ld   [wDC81], A                                    ;; 02:416a $ea $81 $dc
    ret                                                ;; 02:416d $c9

call_02_416e:
    ld   DE, wC0C0                                     ;; 02:416e $11 $c0 $c0

call_02_4171:
    ld   HL, wD001                                     ;; 02:4171 $21 $01 $d0
    ld   BC, $500                                      ;; 02:4174 $01 $00 $05
.jr_02_4177:
    ld   A, E                                          ;; 02:4177 $7b
    and  A, [HL]                                       ;; 02:4178 $a6
    jr   NZ, .jr_02_4180                               ;; 02:4179 $20 $05
    inc  HL                                            ;; 02:417b $23
    ld   A, [HL-]                                      ;; 02:417c $3a
    and  A, D                                          ;; 02:417d $a2
    jr   Z, .jr_02_4181                                ;; 02:417e $28 $01
.jr_02_4180:
    inc  A                                             ;; 02:4180 $3c
.jr_02_4181:
    rra                                                ;; 02:4181 $1f
    rr   C                                             ;; 02:4182 $cb $19
    ld   A, $80                                        ;; 02:4184 $3e $80
    rst  add_hl_a                                      ;; 02:4186 $c7
    dec  B                                             ;; 02:4187 $05
    jr   NZ, .jr_02_4177                               ;; 02:4188 $20 $ed
    ld   A, C                                          ;; 02:418a $79
    rra                                                ;; 02:418b $1f
    rra                                                ;; 02:418c $1f
    rra                                                ;; 02:418d $1f
    ret                                                ;; 02:418e $c9

call_02_418f:
    ld   HL, data_02_78d6                              ;; 02:418f $21 $d6 $78

call_02_4192:
    ld   A, $40                                        ;; 02:4192 $3e $40
    ld   [wC0B3], A                                    ;; 02:4194 $ea $b3 $c0
    ld   A, $37                                        ;; 02:4197 $3e $37
    ld   [wC0B4], A                                    ;; 02:4199 $ea $b4 $c0
    ld   A, $03                                        ;; 02:419c $3e $03
    rst  rst_00_0030                                   ;; 02:419e $f7
    ret                                                ;; 02:419f $c9
    db   $21, $bf, $7d, $3e, $40, $ea, $b3, $c0        ;; 02:41a0 ????????
    db   $3e, $37, $ea, $b4, $c0, $3e, $0e, $f7        ;; 02:41a8 ????????
    db   $c9                                           ;; 02:41b0 ?

call_02_41b1:
    ld   A, [wDE00]                                    ;; 02:41b1 $fa $00 $de
    ld   HL, data_02_651c                              ;; 02:41b4 $21 $1c $65
    rst  add_hl_a                                      ;; 02:41b7 $c7
    ld   L, [HL]                                       ;; 02:41b8 $6e
    ld   H, $00                                        ;; 02:41b9 $26 $00
    add  HL, HL                                        ;; 02:41bb $29
    ld   BC, data_02_658c                              ;; 02:41bc $01 $8c $65
    add  HL, HL                                        ;; 02:41bf $29
    add  HL, HL                                        ;; 02:41c0 $29
    add  HL, HL                                        ;; 02:41c1 $29
    add  HL, HL                                        ;; 02:41c2 $29
    add  HL, BC                                        ;; 02:41c3 $09
    ld   DE, $8000                                     ;; 02:41c4 $11 $00 $80
    ld   BC, $200                                      ;; 02:41c7 $01 $00 $02
    call call_00_20ff                                  ;; 02:41ca $cd $ff $20
    ld   HL, data_02_79c8                              ;; 02:41cd $21 $c8 $79
    call call_02_4192                                  ;; 02:41d0 $cd $92 $41
    xor  A, A                                          ;; 02:41d3 $af
    ld   [wDE02], A                                    ;; 02:41d4 $ea $02 $de
    ld   A, [wDE00]                                    ;; 02:41d7 $fa $00 $de
    add  A, A                                          ;; 02:41da $87
    ld   HL, data_02_53ee                              ;; 02:41db $21 $ee $53
    rst  add_hl_a                                      ;; 02:41de $c7
    ld   A, [HL+]                                      ;; 02:41df $2a
    ld   H, [HL]                                       ;; 02:41e0 $66
    ld   L, A                                          ;; 02:41e1 $6f
    push HL                                            ;; 02:41e2 $e5
.jr_02_41e3:
    pop  HL                                            ;; 02:41e3 $e1
    ld   A, [HL+]                                      ;; 02:41e4 $2a
    push HL                                            ;; 02:41e5 $e5
    cp   A, $ff                                        ;; 02:41e6 $fe $ff
    jr   Z, .jr_02_4201                                ;; 02:41e8 $28 $17
    bit  7, A                                          ;; 02:41ea $cb $7f
    jr   NZ, .jr_02_4205                               ;; 02:41ec $20 $17
    bit  6, A                                          ;; 02:41ee $cb $77
    jr   NZ, .jr_02_420b                               ;; 02:41f0 $20 $19
    pop  HL                                            ;; 02:41f2 $e1
    ld   E, [HL]                                       ;; 02:41f3 $5e
    inc  HL                                            ;; 02:41f4 $23
    push HL                                            ;; 02:41f5 $e5
    call call_02_4210                                  ;; 02:41f6 $cd $10 $42
    ld   A, [wDE03]                                    ;; 02:41f9 $fa $03 $de
    call call_00_3a6d                                  ;; 02:41fc $cd $6d $3a
    jr   .jr_02_41e3                                   ;; 02:41ff $18 $e2
.jr_02_4201:
    pop  HL                                            ;; 02:4201 $e1
    jp   jp_02_45ae                                    ;; 02:4202 $c3 $ae $45
.jr_02_4205:
    add  A, A                                          ;; 02:4205 $87
    ld   [wDE02], A                                    ;; 02:4206 $ea $02 $de
    jr   .jr_02_41e3                                   ;; 02:4209 $18 $d8
.jr_02_420b:
    call call_02_4397                                  ;; 02:420b $cd $97 $43
    jr   .jr_02_41e3                                   ;; 02:420e $18 $d3

call_02_4210:
    ld   HL, wDE03                                     ;; 02:4210 $21 $03 $de
    ld   C, A                                          ;; 02:4213 $4f
    and  A, $07                                        ;; 02:4214 $e6 $07
    inc  A                                             ;; 02:4216 $3c
    add  A, A                                          ;; 02:4217 $87
    add  A, A                                          ;; 02:4218 $87
    ld   [HL+], A                                      ;; 02:4219 $22
    ld   A, C                                          ;; 02:421a $79
    sla  A                                             ;; 02:421b $cb $27
    and  A, $70                                        ;; 02:421d $e6 $70
    ld   [HL], A                                       ;; 02:421f $77
    call call_02_42c0                                  ;; 02:4220 $cd $c0 $42
    ld   HL, wDE05                                     ;; 02:4223 $21 $05 $de
    ld   A, C                                          ;; 02:4226 $79
    add  A, A                                          ;; 02:4227 $87
    add  A, A                                          ;; 02:4228 $87
    add  A, A                                          ;; 02:4229 $87
    ld   [HL+], A                                      ;; 02:422a $22
    ld   A, B                                          ;; 02:422b $78
    add  A, A                                          ;; 02:422c $87
    add  A, A                                          ;; 02:422d $87
    add  A, A                                          ;; 02:422e $87
    ld   [HL], A                                       ;; 02:422f $77
    ld   L, E                                          ;; 02:4230 $6b
    ld   H, $00                                        ;; 02:4231 $26 $00
    ld   BC, data_02_5a95                              ;; 02:4233 $01 $95 $5a
    add  HL, HL                                        ;; 02:4236 $29
    add  HL, BC                                        ;; 02:4237 $09
    ld   A, [HL+]                                      ;; 02:4238 $2a
    ld   H, [HL]                                       ;; 02:4239 $66
    ld   L, A                                          ;; 02:423a $6f
    ld   DE, wDE40                                     ;; 02:423b $11 $40 $de
    ld   B, $1e                                        ;; 02:423e $06 $1e
.jr_02_4240:
    ld   A, [HL+]                                      ;; 02:4240 $2a
    bit  7, A                                          ;; 02:4241 $cb $7f
    jr   Z, .jr_02_425d                                ;; 02:4243 $28 $18
    push AF                                            ;; 02:4245 $f5
    and  A, $1f                                        ;; 02:4246 $e6 $1f
    ld   C, A                                          ;; 02:4248 $4f
    pop  AF                                            ;; 02:4249 $f1
    bit  6, A                                          ;; 02:424a $cb $77
    jr   Z, .jr_02_4252                                ;; 02:424c $28 $04
    ld   A, $1f                                        ;; 02:424e $3e $1f
    jr   .jr_02_4253                                   ;; 02:4250 $18 $01
.jr_02_4252:
    ld   A, [HL+]                                      ;; 02:4252 $2a
.jr_02_4253:
    ld   [DE], A                                       ;; 02:4253 $12
    inc  DE                                            ;; 02:4254 $13
    dec  B                                             ;; 02:4255 $05
    jr   Z, .jr_02_4262                                ;; 02:4256 $28 $0a
    dec  C                                             ;; 02:4258 $0d
    jr   NZ, .jr_02_4253                               ;; 02:4259 $20 $f8
    jr   .jr_02_4240                                   ;; 02:425b $18 $e3
.jr_02_425d:
    ld   [DE], A                                       ;; 02:425d $12
    inc  DE                                            ;; 02:425e $13
    dec  B                                             ;; 02:425f $05
    jr   NZ, .jr_02_4240                               ;; 02:4260 $20 $de
.jr_02_4262:
    ld   A, [wDE04]                                    ;; 02:4262 $fa $04 $de
    bit  6, A                                          ;; 02:4265 $cb $77
    call NZ, call_02_430b                              ;; 02:4267 $c4 $0b $43
    bit  5, A                                          ;; 02:426a $cb $6f
    call NZ, call_02_433b                              ;; 02:426c $c4 $3b $43
    call call_02_4fc5                                  ;; 02:426f $cd $c5 $4f
    ld   DE, wDE40                                     ;; 02:4272 $11 $40 $de
    ld   HL, wC000                                     ;; 02:4275 $21 $00 $c0
    ld   BC, $506                                      ;; 02:4278 $01 $06 $05
    ld   A, [wDE06]                                    ;; 02:427b $fa $06 $de
    jr   .jr_02_4285                                   ;; 02:427e $18 $05
.jr_02_4280:
    ld   A, [wDE08]                                    ;; 02:4280 $fa $08 $de
    add  A, $08                                        ;; 02:4283 $c6 $08
.jr_02_4285:
    ld   [wDE08], A                                    ;; 02:4285 $ea $08 $de
    ld   A, [wDE05]                                    ;; 02:4288 $fa $05 $de
    ld   [wDE07], A                                    ;; 02:428b $ea $07 $de
    push BC                                            ;; 02:428e $c5
.jr_02_428f:
    ld   B, $1f                                        ;; 02:428f $06 $1f
    ld   A, [DE]                                       ;; 02:4291 $1a
    and  A, B                                          ;; 02:4292 $a0
    cp   A, B                                          ;; 02:4293 $b8
    jr   Z, .jr_02_42af                                ;; 02:4294 $28 $19
    ld   B, A                                          ;; 02:4296 $47
    ld   A, [wDE08]                                    ;; 02:4297 $fa $08 $de
    ld   [HL+], A                                      ;; 02:429a $22
    ld   A, [wDE07]                                    ;; 02:429b $fa $07 $de
    ld   [HL+], A                                      ;; 02:429e $22
    ld   A, [wDE02]                                    ;; 02:429f $fa $02 $de
    add  A, B                                          ;; 02:42a2 $80
    ld   [HL+], A                                      ;; 02:42a3 $22
    ld   A, [DE]                                       ;; 02:42a4 $1a
    and  A, $60                                        ;; 02:42a5 $e6 $60
    ld   B, A                                          ;; 02:42a7 $47
    ld   A, [wDE04]                                    ;; 02:42a8 $fa $04 $de
    and  A, $10                                        ;; 02:42ab $e6 $10
    or   A, B                                          ;; 02:42ad $b0
    ld   [HL+], A                                      ;; 02:42ae $22
.jr_02_42af:
    inc  DE                                            ;; 02:42af $13
    ld   A, [wDE07]                                    ;; 02:42b0 $fa $07 $de
    add  A, $08                                        ;; 02:42b3 $c6 $08
    ld   [wDE07], A                                    ;; 02:42b5 $ea $07 $de
    dec  C                                             ;; 02:42b8 $0d
    jr   NZ, .jr_02_428f                               ;; 02:42b9 $20 $d4
    pop  BC                                            ;; 02:42bb $c1
    dec  B                                             ;; 02:42bc $05
    jr   NZ, .jr_02_4280                               ;; 02:42bd $20 $c1
    ret                                                ;; 02:42bf $c9

call_02_42c0:
    ld   A, [wDE01]                                    ;; 02:42c0 $fa $01 $de
    cp   A, $05                                        ;; 02:42c3 $fe $05
    jr   C, .jr_02_42ed                                ;; 02:42c5 $38 $26
    sub  A, $05                                        ;; 02:42c7 $d6 $05
    ld   HL, wCC51                                     ;; 02:42c9 $21 $51 $cc
    rst  add_hl_a                                      ;; 02:42cc $c7
    ld   D, A                                          ;; 02:42cd $57
    ld   A, [HL]                                       ;; 02:42ce $7e
    and  A, $0f                                        ;; 02:42cf $e6 $0f
    dec  A                                             ;; 02:42d1 $3d
    srl  A                                             ;; 02:42d2 $cb $3f
    ld   B, A                                          ;; 02:42d4 $47
    ld   A, [HL]                                       ;; 02:42d5 $7e
    swap A                                             ;; 02:42d6 $cb $37
    and  A, $0f                                        ;; 02:42d8 $e6 $0f
    dec  A                                             ;; 02:42da $3d
    srl  A                                             ;; 02:42db $cb $3f
    dec  A                                             ;; 02:42dd $3d
    ld   C, A                                          ;; 02:42de $4f
    ld   A, D                                          ;; 02:42df $7a
    add  A, A                                          ;; 02:42e0 $87
    ld   HL, wCC41                                     ;; 02:42e1 $21 $41 $cc
    rst  add_hl_a                                      ;; 02:42e4 $c7
    ld   A, [HL+]                                      ;; 02:42e5 $2a
    add  A, C                                          ;; 02:42e6 $81
    ld   C, A                                          ;; 02:42e7 $4f
    ld   A, [HL]                                       ;; 02:42e8 $7e
    add  A, B                                          ;; 02:42e9 $80
    ld   B, A                                          ;; 02:42ea $47
    xor  A, A                                          ;; 02:42eb $af
    ret                                                ;; 02:42ec $c9
.jr_02_42ed:
    ld   B, A                                          ;; 02:42ed $47
    ld   A, [wDDFF]                                    ;; 02:42ee $fa $ff $dd
    dec  A                                             ;; 02:42f1 $3d
    and  A, $04                                        ;; 02:42f2 $e6 $04
    xor  A, $04                                        ;; 02:42f4 $ee $04
    push AF                                            ;; 02:42f6 $f5
    srl  A                                             ;; 02:42f7 $cb $3f
    srl  A                                             ;; 02:42f9 $cb $3f
    add  A, $04                                        ;; 02:42fb $c6 $04
    ld   C, A                                          ;; 02:42fd $4f
    xor  A, A                                          ;; 02:42fe $af
    inc  B                                             ;; 02:42ff $04
.jr_02_4300:
    dec  B                                             ;; 02:4300 $05
    jr   Z, .jr_02_4306                                ;; 02:4301 $28 $03
    add  A, C                                          ;; 02:4303 $81
    jr   .jr_02_4300                                   ;; 02:4304 $18 $fa
.jr_02_4306:
    ld   C, A                                          ;; 02:4306 $4f
    ld   B, $07                                        ;; 02:4307 $06 $07
    pop  AF                                            ;; 02:4309 $f1
    ret                                                ;; 02:430a $c9

call_02_430b:
    push AF                                            ;; 02:430b $f5
    ld   HL, wDE40                                     ;; 02:430c $21 $40 $de
    ld   DE, wDE58                                     ;; 02:430f $11 $58 $de
    ld   B, $02                                        ;; 02:4312 $06 $02
.jr_02_4314:
    ld   C, $06                                        ;; 02:4314 $0e $06
.jr_02_4316:
    push BC                                            ;; 02:4316 $c5
    ld   C, $40                                        ;; 02:4317 $0e $40
    ld   B, [HL]                                       ;; 02:4319 $46
    ld   A, [DE]                                       ;; 02:431a $1a
    xor  A, C                                          ;; 02:431b $a9
    ld   [HL+], A                                      ;; 02:431c $22
    ld   A, B                                          ;; 02:431d $78
    xor  A, C                                          ;; 02:431e $a9
    ld   [DE], A                                       ;; 02:431f $12
    inc  DE                                            ;; 02:4320 $13
    pop  BC                                            ;; 02:4321 $c1
    dec  C                                             ;; 02:4322 $0d
    jr   NZ, .jr_02_4316                               ;; 02:4323 $20 $f1
    ld   A, E                                          ;; 02:4325 $7b
    sub  A, $0c                                        ;; 02:4326 $d6 $0c
    ld   E, A                                          ;; 02:4328 $5f
    jr   NC, .jr_02_432c                               ;; 02:4329 $30 $01
    dec  D                                             ;; 02:432b $15
.jr_02_432c:
    dec  B                                             ;; 02:432c $05
    jr   NZ, .jr_02_4314                               ;; 02:432d $20 $e5
    ld   C, $40                                        ;; 02:432f $0e $40
    ld   B, $06                                        ;; 02:4331 $06 $06
.jr_02_4333:
    ld   A, [HL]                                       ;; 02:4333 $7e
    xor  A, C                                          ;; 02:4334 $a9
    ld   [HL+], A                                      ;; 02:4335 $22
    dec  B                                             ;; 02:4336 $05
    jr   NZ, .jr_02_4333                               ;; 02:4337 $20 $fa
    pop  AF                                            ;; 02:4339 $f1
    ret                                                ;; 02:433a $c9

call_02_433b:
    push AF                                            ;; 02:433b $f5
    ld   HL, wDE40                                     ;; 02:433c $21 $40 $de
    ld   DE, wDE45                                     ;; 02:433f $11 $45 $de
    ld   B, $05                                        ;; 02:4342 $06 $05
.jr_02_4344:
    ld   C, $03                                        ;; 02:4344 $0e $03
.jr_02_4346:
    push BC                                            ;; 02:4346 $c5
    ld   C, $20                                        ;; 02:4347 $0e $20
    ld   B, [HL]                                       ;; 02:4349 $46
    ld   A, [DE]                                       ;; 02:434a $1a
    xor  A, C                                          ;; 02:434b $a9
    ld   [HL+], A                                      ;; 02:434c $22
    ld   A, B                                          ;; 02:434d $78
    xor  A, C                                          ;; 02:434e $a9
    ld   [DE], A                                       ;; 02:434f $12
    dec  DE                                            ;; 02:4350 $1b
    pop  BC                                            ;; 02:4351 $c1
    dec  C                                             ;; 02:4352 $0d
    jr   NZ, .jr_02_4346                               ;; 02:4353 $20 $f1
    ld   A, E                                          ;; 02:4355 $7b
    add  A, $09                                        ;; 02:4356 $c6 $09
    ld   E, A                                          ;; 02:4358 $5f
    jr   NC, .jr_02_435c                               ;; 02:4359 $30 $01
    inc  D                                             ;; 02:435b $14
.jr_02_435c:
    inc  HL                                            ;; 02:435c $23
    inc  HL                                            ;; 02:435d $23
    inc  HL                                            ;; 02:435e $23
    dec  B                                             ;; 02:435f $05
    jr   NZ, .jr_02_4344                               ;; 02:4360 $20 $e2
    pop  AF                                            ;; 02:4362 $f1
    ret                                                ;; 02:4363 $c9

data_02_4364:
    db   $b1, $43, $ea, $43, $f8, $43, $9f, $43        ;; 02:4364 ????????
    db   $c8, $43, $b8, $44, $37, $44, $3e, $46        ;; 02:436c ????????
    db   $97, $46, $8a, $45, $c6, $47, $c6, $48        ;; 02:4374 ????????
    db   $c9, $45, $c0, $45, $a9, $4b, $cd, $4b        ;; 02:437c ????????
    dw   data_02_4d65                                  ;; 02:4384 pP
    dw   data_02_4d45                                  ;; 02:4386 pP
    dw   data_02_4f20                                  ;; 02:4388 pP
    db   $3e, $4f, $a0, $41                            ;; 02:438a ????
    dw   data_02_4109                                  ;; 02:438e pP
    dw   data_02_4142                                  ;; 02:4390 pP
    dw   call_02_4167                                  ;; 02:4392 pP
    ld   A, [wDE00]                                    ;; 02:4394 $fa $00 $de

call_02_4397:
    and  A, $3f                                        ;; 02:4397 $e6 $3f
    ld   HL, data_02_4364                              ;; 02:4399 $21 $64 $43
    jp   doJumptableHL                                 ;; 02:439c $c3 $3b $37
    db   $01, $43, $02, $cd, $b2, $43, $0d, $cd        ;; 02:439f ????????
    db   $b2, $43, $0c, $05, $20, $f5, $af, $e2        ;; 02:43a7 ????????
    db   $0d, $e2, $c9, $21, $c0, $43, $16, $08        ;; 02:43af ????????
    db   $cd, $6b, $3a, $2a, $e2, $15, $20, $f8        ;; 02:43b7 ????????
    db   $c9, $02, $04, $08, $10, $f0, $f8, $fc        ;; 02:43bf ????????
    db   $fe, $01, $40, $02, $f0, $44, $fe, $91        ;; 02:43c7 ????????
    db   $38, $fa, $f2, $cb, $bf, $e2, $e0, $04        ;; 02:43cf ????????
    db   $f0, $04, $cb, $57, $28, $fa, $f2, $cb        ;; 02:43d7 ????????
    db   $ff, $e2, $3e, $05, $cd, $6d, $3a, $05        ;; 02:43df ????????
    db   $20, $e2, $c9, $cd, $08, $44, $cd, $c5        ;; 02:43e7 ????????
    db   $4f, $cd, $6b, $3a, $3e, $40, $e0, $42        ;; 02:43ef ????????
    db   $c9, $cd, $ea, $43, $3e, $0f, $cd, $6d        ;; 02:43f7 ????????
    db   $3a, $af, $e0, $42, $21, $33, $44, $18        ;; 02:43ff ????????
    db   $03, $21, $30, $44, $16, $03, $23, $1e        ;; 02:4407 ????????
    db   $07, $cd, $1a, $44, $1d, $20, $fa, $15        ;; 02:440f ????????
    db   $20, $f4, $c9, $01, $44, $40, $cd, $6b        ;; 02:4417 ????????
    db   $3a, $7e, $e0, $47, $e0, $48, $f2, $b8        ;; 02:441f ????????
    db   $20, $fc, $3e, $d2, $e0, $47, $e0, $48        ;; 02:4427 ????????
    db   $c9, $d2, $81, $40, $00, $40, $81, $d2        ;; 02:442f ????????
    db   $cd, $98, $44, $3e, $40, $21, $7a, $44        ;; 02:4437 ????????
    db   $cd, $47, $44, $3e, $60, $21, $74, $44        ;; 02:443f ????????
    db   $ea, $0f, $de, $44, $7d, $21, $07, $de        ;; 02:4447 ????????
    db   $22, $70, $cd, $66, $44, $cd, $5e, $44        ;; 02:444f ????????
    db   $21, $0f, $de, $35, $20, $f4, $c9, $21        ;; 02:4457 ????????
    db   $07, $de, $2a, $66, $6f, $79, $e9, $21        ;; 02:445f ????????
    db   $40, $de, $4e, $06, $3f, $23, $3a, $22        ;; 02:4467 ????????
    db   $23, $05, $20, $fa, $c9, $cb, $27, $18        ;; 02:446f ????????
    db   $02, $cb, $3f, $ea, $7f, $de, $0e, $43        ;; 02:4477 ????????
    db   $21, $40, $de, $11, $41, $00, $cd, $6b        ;; 02:447f ????????
    db   $3a, $f3, $f0, $44, $ba, $20, $fb, $2a        ;; 02:4487 ????????
    db   $e2, $14, $1d, $20, $f5, $af, $e2, $fb        ;; 02:448f ????????
    db   $c9, $21, $40, $de, $01, $04, $08, $c5        ;; 02:4497 ????????
    db   $11, $b0, $44, $1a, $13, $22, $2f, $3c        ;; 02:449f ????????
    db   $22, $05, $20, $f7, $c1, $0d, $20, $ef        ;; 02:44a7 ????????
    db   $c9, $00, $02, $03, $04, $04, $04, $03        ;; 02:44af ????????
    db   $02, $3e, $03, $cd, $7c, $4e, $3e, $0e        ;; 02:44b7 ????????
    db   $ea, $ff, $de, $ea, $0f, $de, $cd, $d8        ;; 02:44bf ????????
    db   $44, $cd, $b9, $4e, $cd, $00, $45, $cd        ;; 02:44c7 ????????
    db   $b9, $4e, $21, $0f, $de, $35, $20, $ee        ;; 02:44cf ????????
    db   $c9, $cd, $68, $45, $c0, $21, $00, $df        ;; 02:44d7 ????????
    db   $af, $22, $3e, $0a, $22, $3e, $3c, $22        ;; 02:44df ????????
    db   $3e, $46, $22, $16, $0a, $cd, $f8, $44        ;; 02:44e7 ????????
    db   $16, $16, $cd, $f8, $44, $af, $22, $22        ;; 02:44ef ????????
    db   $c9, $cd, $2e, $1d, $87, $87, $87, $22        ;; 02:44f7 ????????
    db   $c9, $21, $00, $df, $1e, $1e, $7e, $3c        ;; 02:44ff ????????
    db   $28, $19, $cd, $27, $45, $38, $0f, $fe        ;; 02:4507 ????????
    db   $08, $3e, $00, $ce, $00, $cb, $27, $22        ;; 02:450f ????????
    db   $af, $22, $1d, $20, $e9, $c9, $60, $69        ;; 02:4517 ????????
    db   $3e, $ff, $77, $3e, $08, $c7, $18, $f2        ;; 02:451f ????????
    db   $e5, $23, $23, $23, $23, $7e, $4f, $fe        ;; 02:4527 ????????
    db   $28, $30, $0b, $3e, $28, $91, $cb, $3f        ;; 02:452f ????????
    db   $cb, $3f, $57, $81, $18, $09, $d6, $28        ;; 02:4537 ????????
    db   $cb, $3f, $cb, $3f, $57, $79, $92, $22        ;; 02:453f ????????
    db   $7e, $4f, $fe, $54, $30, $0b, $3e, $54        ;; 02:4547 ????????
    db   $91, $cb, $3f, $cb, $3f, $47, $81, $18        ;; 02:454f ????????
    db   $09, $d6, $54, $cb, $3f, $cb, $3f, $47        ;; 02:4557 ????????
    db   $79, $90, $22, $78, $c1, $82, $fe, $04        ;; 02:455f ????????
    db   $c9, $11, $00, $df, $06, $1d, $1a, $3c        ;; 02:4567 ????????
    db   $c8, $21, $08, $df, $7e, $3c, $28, $08        ;; 02:456f ????????
    db   $05, $28, $0e, $3e, $08, $c7, $18, $f4        ;; 02:4577 ????????
    db   $06, $08, $1a, $13, $22, $05, $20, $fa        ;; 02:457f ????????
    db   $c9, $05, $c9, $3e, $01, $cd, $7c, $4e        ;; 02:4587 ????????
    db   $3e, $10, $ea, $ff, $de, $ea, $0f, $de        ;; 02:458f ????????
    db   $21, $b4, $45, $11, $b7, $45, $cd, $49        ;; 02:4597 ????????
    db   $47, $cd, $b3, $4e, $21, $0f, $de, $35        ;; 02:459f ????????
    db   $20, $ee, $cd, $b9, $4e, $20, $fb             ;; 02:45a7 ???????

jp_02_45ae:
    call call_02_4fc5                                  ;; 02:45ae $cd $c5 $4f
    jp   call_00_3a6b                                  ;; 02:45b1 $c3 $6b $3a
    db   $13, $03, $fe, $04, $20, $00, $01, $01        ;; 02:45b4 ????????
    db   $41, $02, $02, $03, $3e, $06, $cd, $7c        ;; 02:45bc ????????
    db   $4e, $3e, $08, $18, $13, $21, $e0, $82        ;; 02:45c4 ????????
    db   $11, $00, $80, $01, $00, $01, $cd, $ff        ;; 02:45cc ????????
    db   $20, $3e, $03, $cd, $7c, $4e, $3e, $18        ;; 02:45d4 ????????
    db   $ea, $0f, $de, $11, $19, $46, $cd, $37        ;; 02:45dc ????????
    db   $47, $cd, $b9, $4e, $11, $2a, $46, $cd        ;; 02:45e4 ????????
    db   $37, $47, $21, $0f, $de, $35, $20, $eb        ;; 02:45ec ????????
    db   $cd, $b9, $4e, $18, $b5, $20, $10, $10        ;; 02:45f4 ????????
    db   $58, $30, $20, $18, $88, $28, $30, $20        ;; 02:45fc ????????
    db   $78, $10, $40, $30, $68, $18, $50, $28        ;; 02:4604 ????????
    db   $18, $20, $60, $28, $48, $10, $70, $30        ;; 02:460c ????????
    db   $38, $18, $80, $28, $28, $08, $00, $00        ;; 02:4614 ????????
    db   $40, $40, $01, $01, $41, $41, $02, $02        ;; 02:461c ????????
    db   $42, $42, $03, $03, $43, $43, $08, $00        ;; 02:4624 ????????
    db   $04, $40, $44, $01, $05, $41, $45, $02        ;; 02:462c ????????
    db   $06, $42, $46, $03, $07, $43, $47, $01        ;; 02:4634 ????????
    db   $00, $00, $3e, $02, $cd, $7c, $4e, $3e        ;; 02:463c ????????
    db   $10, $ea, $0f, $de, $cd, $01, $47, $cd        ;; 02:4644 ????????
    db   $b9, $4e, $cd, $16, $47, $cd, $b9, $4e        ;; 02:464c ????????
    db   $21, $0f, $de, $35, $20, $ee, $c3, $ae        ;; 02:4654 ????????
    db   $45, $10, $20, $30, $40, $50, $60, $70        ;; 02:465c ????????
    db   $80, $80, $70, $60, $50, $40, $30, $20        ;; 02:4664 ????????
    db   $10, $0a, $40, $02, $80, $03, $41, $04        ;; 02:466c ????????
    db   $81, $05, $02, $00, $42, $06, $82, $07        ;; 02:4674 ????????
    db   $03, $01, $43, $08, $83, $09, $0a, $00        ;; 02:467c ????????
    db   $21, $40, $28, $80, $29, $01, $20, $41        ;; 02:4684 ????????
    db   $26, $81, $27, $42, $24, $82, $25, $43        ;; 02:468c ????????
    db   $22, $83, $23, $3e, $01, $cd, $7c, $4e        ;; 02:4694 ????????
    db   $cd, $af, $46, $cd, $b9, $4e, $20, $fb        ;; 02:469c ????????
    db   $21, $fc, $de, $35, $7e, $3c, $20, $f0        ;; 02:46a4 ????????
    db   $c3, $ae, $45, $21, $c0, $46, $11, $bb        ;; 02:46ac ????????
    db   $46, $01, $28, $50, $c3, $57, $47, $02        ;; 02:46b4 ????????
    db   $00, $00, $01, $20, $20, $00, $00, $f4        ;; 02:46bc ????????
    db   $f8, $f8, $f8, $fc, $f8, $fe, $f8, $02        ;; 02:46c4 ????????
    db   $f8, $04, $f8, $08, $f8, $0c, $f8, $0c        ;; 02:46cc ????????
    db   $08, $08, $08, $04, $08, $02, $08, $fe        ;; 02:46d4 ????????
    db   $08, $fc, $08, $f8, $08, $f4, $08, $f4        ;; 02:46dc ????????
    db   $08, $f8, $08, $fc, $08, $fe, $08, $02        ;; 02:46e4 ????????
    db   $08, $04, $08, $08, $08, $0c, $08, $0c        ;; 02:46ec ????????
    db   $f8, $08, $f8, $04, $f8, $02, $f8, $fe        ;; 02:46f4 ????????
    db   $f8, $fc, $f8, $f8, $f8, $fa, $0f, $de        ;; 02:46fc ????????
    db   $3d, $f5, $11, $6d, $46, $0e, $08, $cd        ;; 02:4704 ????????
    db   $2b, $47, $f1, $c6, $08, $11, $82, $46        ;; 02:470c ????????
    db   $18, $13, $fa, $0f, $de, $3d, $f5, $11        ;; 02:4714 ????????
    db   $82, $46, $0e, $08, $cd, $2b, $47, $f1        ;; 02:471c ????????
    db   $c6, $08, $11, $6d, $46, $0e, $28, $e6        ;; 02:4724 ????????
    db   $0f, $21, $5d, $46, $c7, $46, $21, $3b        ;; 02:472c ????????
    db   $46, $18, $20, $21, $f9, $45, $fa, $0f        ;; 02:4734 ????????
    db   $de, $e6, $0f, $87, $c7, $2a, $46, $4f        ;; 02:473c ????????
    db   $21, $3b, $46, $18, $0e, $e5, $fa, $0f        ;; 02:4744 ????????
    db   $de, $e6, $0f, $21, $b6, $47, $c7, $46        ;; 02:474c ????????
    db   $0e, $00, $e1, $1a, $13, $cd, $9c, $47        ;; 02:4754 ????????
    db   $d0, $ea, $0e, $de, $7d, $ea, $0c, $de        ;; 02:475c ????????
    db   $7c, $ea, $0d, $de, $21, $13, $de, $1a        ;; 02:4764 ????????
    db   $cb, $37, $cb, $2f, $e6, $07, $87, $87        ;; 02:476c ????????
    db   $87, $81, $22, $1a, $13, $e6, $1f, $87        ;; 02:4774 ????????
    db   $87, $87, $80, $22, $1a, $e6, $0f, $87        ;; 02:477c ????????
    db   $22, $1a, $13, $e6, $f0, $22, $c5, $21        ;; 02:4784 ????????
    db   $0c, $de, $2a, $46, $4f, $cd, $8c, $4e        ;; 02:478c ????????
    db   $c1, $21, $0e, $de, $35, $20, $cd, $c9        ;; 02:4794 ????????
    db   $c5, $f5, $e5, $21, $00, $df, $01, $1e        ;; 02:479c ????????
    db   $1e, $7e, $3c, $28, $01, $0d, $3e, $08        ;; 02:47a4 ????????
    db   $c7, $05, $20, $f5, $e1, $f1, $0c, $b9        ;; 02:47ac ????????
    db   $c1, $c9, $50, $80, $90, $60, $38, $88        ;; 02:47b4 ????????
    db   $b0, $40, $68, $28, $a0, $48, $78, $a8        ;; 02:47bc ????????
    db   $30, $58, $3e, $00, $cd, $7c, $4e, $3e        ;; 02:47c4 ????????
    db   $18, $ea, $0f, $de, $cd, $6b, $3a, $cd        ;; 02:47cc ????????
    db   $12, $48, $cd, $12, $48, $cd, $69, $48        ;; 02:47d4 ????????
    db   $cd, $12, $48, $cd, $59, $48, $21, $0f        ;; 02:47dc ????????
    db   $de, $35, $20, $e8, $c9, $0e, $43, $21        ;; 02:47e4 ????????
    db   $40, $de, $11, $41, $00, $cd, $6b, $3a        ;; 02:47ec ????????
    db   $f3, $f0, $44, $ba, $20, $fb, $2a, $e2        ;; 02:47f4 ????????
    db   $cd, $0b, $48, $2a, $e2, $14, $1d, $20        ;; 02:47fc ????????
    db   $f0, $af, $e2, $fb, $c9, $00, $00, $00        ;; 02:4804 ????????
    db   $3e, $04, $3d, $20, $fd, $c9, $16, $0c        ;; 02:480c ????????
    db   $cd, $2e, $1d, $87, $87, $c6, $1c, $4f        ;; 02:4814 ????????
    db   $16, $15, $cd, $2e, $1d, $c6, $20, $47        ;; 02:481c ????????
    db   $21, $30, $48, $11, $2d, $48, $c3, $57        ;; 02:4824 ????????
    db   $47, $01, $00, $00, $14, $fc, $fc, $fc        ;; 02:482c ????????
    db   $fe, $02, $02, $01, $04, $01, $06, $00        ;; 02:4834 ????????
    db   $08, $ff, $08, $ff, $08, $fe, $08, $fe        ;; 02:483c ????????
    db   $08, $fe, $08, $fc, $08, $fc, $08, $fc        ;; 02:4844 ????????
    db   $08, $fc, $06, $fc, $04, $fc, $02, $fe        ;; 02:484c ????????
    db   $fe, $ff, $fc, $ff, $fa, $cd, $6b, $3a        ;; 02:4854 ????????
    db   $0e, $42, $3e, $40, $e2, $47, $f0, $44        ;; 02:485c ????????
    db   $b8, $20, $fb, $af, $e2, $cd, $72, $48        ;; 02:4864 ????????
    db   $cd, $e9, $47, $c3, $d5, $4e, $11, $bf        ;; 02:486c ????????
    db   $de, $fa, $0f, $de, $4f, $06, $40, $21        ;; 02:4874 ????????
    db   $8e, $48, $79, $0c, $e6, $0f, $87, $c7        ;; 02:487c ????????
    db   $2a, $12, $1b, $7e, $12, $1b, $05, $20        ;; 02:4884 ????????
    db   $ee, $c9, $40, $00, $20, $ff, $10, $fe        ;; 02:488c ????????
    db   $08, $fc, $04, $f8, $02, $f0, $01, $e0        ;; 02:4894 ????????
    db   $00, $c0, $00, $c0, $01, $e0, $02, $f0        ;; 02:489c ????????
    db   $04, $f8, $08, $fc, $10, $fe, $20, $ff        ;; 02:48a4 ????????
    db   $40, $00, $21, $00, $9c, $11, $60, $9d        ;; 02:48ac ????????
    db   $01, $40, $01, $cd, $ff, $20, $21, $00        ;; 02:48b4 ????????
    db   $9c, $01, $40, $01, $3e, $ff, $cd, $8f        ;; 02:48bc ????????
    db   $21, $c9, $3e, $fc, $cd, $34, $49, $3e        ;; 02:48c4 ????????
    db   $00, $cd, $7c, $4e, $3e, $01, $ea, $ff        ;; 02:48cc ????????
    db   $de, $3e, $d2, $ea, $12, $de, $cd, $ae        ;; 02:48d4 ????????
    db   $48, $3e, $40, $ea, $0f, $de, $cd, $dd        ;; 02:48dc ????????
    db   $49, $cd, $7f, $49, $cd, $d5, $4e, $cd        ;; 02:48e4 ????????
    db   $7f, $49, $21, $0f, $de, $35, $20, $ee        ;; 02:48ec ????????
    db   $3e, $1f, $77, $cd, $3d, $49, $21, $0f        ;; 02:48f4 ????????
    db   $de, $35, $20, $f7, $cd, $ae, $45, $3e        ;; 02:48fc ????????
    db   $c7, $e0, $40, $21, $60, $9d, $11, $00        ;; 02:4904 ????????
    db   $9c, $01, $40, $01, $cd, $ff, $20, $cd        ;; 02:490c ????????
    db   $6b, $3a, $3e, $e7, $e0, $40, $3e, $58        ;; 02:4914 ????????
    db   $e0, $4a, $3e, $07, $e0, $4b, $af, $e0        ;; 02:491c ????????
    db   $42, $e0, $43, $21, $60, $9d, $01, $40        ;; 02:4924 ????????
    db   $01, $3e, $ff, $cd, $8f, $21, $3e, $ff        ;; 02:492c ????????
    db   $21, $e0, $9b, $01, $14, $00, $c3, $8f        ;; 02:4934 ????????
    db   $21, $fa, $0f, $de, $4f, $cb, $27, $cb        ;; 02:493c ????????
    db   $37, $e6, $03, $47, $f5, $21, $33, $44        ;; 02:4944 ????????
    db   $c7, $7e, $ea, $12, $de, $3e, $20, $91        ;; 02:494c ????????
    db   $21, $47, $4b, $c7, $11, $40, $01, $cd        ;; 02:4954 ????????
    db   $8c, $49, $f1, $21, $30, $44, $c7, $46        ;; 02:495c ????????
    db   $cd, $6b, $3a, $f3, $af, $e0, $4a, $e0        ;; 02:4964 ????????
    db   $42, $e0, $43, $3e, $a5, $e0, $4b, $78        ;; 02:496c ????????
    db   $e0, $47, $01, $44, $44, $f2, $b8, $20        ;; 02:4974 ????????
    db   $fc, $18, $48, $fa, $0f, $de, $57, $3e        ;; 02:497c ????????
    db   $41, $92, $5f, $21, $47, $4b, $06, $03        ;; 02:4984 ????????
    db   $e5, $21, $10, $de, $34, $7e, $e6, $03        ;; 02:498c ????????
    db   $82, $57, $e1, $cd, $6b, $3a, $f3, $af        ;; 02:4994 ????????
    db   $e0, $4a, $e0, $42, $78, $e0, $47, $fa        ;; 02:499c ????????
    db   $12, $de, $e0, $48, $01, $44, $03, $f2        ;; 02:49a4 ????????
    db   $ba, $20, $fc, $0e, $41, $f2, $a0, $20        ;; 02:49ac ????????
    db   $fc, $7e, $c6, $a5, $e0, $4b, $3e, $f9        ;; 02:49b4 ????????
    db   $92, $e0, $42, $2a, $3d, $e0, $43, $14        ;; 02:49bc ????????
    db   $1d, $20, $e1, $01, $41, $03, $f2, $a0        ;; 02:49c4 ????????
    db   $20, $fc, $3e, $07, $e0, $4b, $af, $e0        ;; 02:49cc ????????
    db   $42, $3e, $d2, $e0, $47, $e0, $48, $fb        ;; 02:49d4 ????????
    db   $c9, $21, $fd, $49, $fa, $0f, $de, $47        ;; 02:49dc ????????
    db   $3e, $40, $90, $cb, $2f, $cb, $2f, $cb        ;; 02:49e4 ????????
    db   $2f, $e6, $07, $87, $c7, $2a, $56, $5f        ;; 02:49ec ????????
    db   $21, $a6, $4b, $01, $0c, $08, $c3, $57        ;; 02:49f4 ????????
    db   $47, $0d, $4a, $1e, $4a, $33, $4a, $4c        ;; 02:49fc ????????
    db   $4a, $6d, $4a, $98, $4a, $cd, $4a, $0a        ;; 02:4a04 ????????
    db   $4b, $08, $e6, $24, $e7, $23, $e8, $03        ;; 02:4a0c ????????
    db   $e9, $23, $ea, $03, $eb, $23, $ec, $03        ;; 02:4a14 ????????
    db   $ed, $04, $0a, $e5, $24, $e6, $23, $e7        ;; 02:4a1c ????????
    db   $03, $e8, $23, $e9, $22, $ea, $02, $eb        ;; 02:4a24 ????????
    db   $03, $ec, $23, $ed, $03, $ee, $04, $0c        ;; 02:4a2c ????????
    db   $a9, $05, $aa, $65, $e4, $24, $e5, $23        ;; 02:4a34 ????????
    db   $e6, $22, $e7, $02, $e8, $03, $eb, $23        ;; 02:4a3c ????????
    db   $ec, $22, $ed, $02, $ee, $03, $ef, $04        ;; 02:4a44 ????????
    db   $10, $6a, $07, $8b, $06, $a4, $05, $a5        ;; 02:4a4c ????????
    db   $65, $a9, $05, $aa, $08, $e3, $23, $e4        ;; 02:4a54 ????????
    db   $22, $e5, $02, $e6, $03, $e7, $04, $ec        ;; 02:4a5c ????????
    db   $24, $ed, $23, $ee, $22, $ef, $02, $f0        ;; 02:4a64 ????????
    db   $03, $15, $4b, $07, $65, $07, $6c, $06        ;; 02:4a6c ????????
    db   $86, $06, $8a, $0a, $8b, $08, $a4, $05        ;; 02:4a74 ????????
    db   $a5, $08, $a9, $09, $ad, $05, $ae, $65        ;; 02:4a7c ????????
    db   $e2, $00, $e3, $01, $e4, $02, $e5, $03        ;; 02:4a84 ????????
    db   $e6, $04, $ed, $24, $ee, $23, $ef, $22        ;; 02:4a8c ????????
    db   $f0, $21, $f1, $20, $1a, $2c, $07, $46        ;; 02:4a94 ????????
    db   $07, $4b, $07, $4d, $06, $67, $06, $6c        ;; 02:4a9c ????????
    db   $08, $6e, $07, $85, $0a, $86, $08, $8a        ;; 02:4aa4 ????????
    db   $0a, $8b, $08, $8f, $06, $a4, $09, $a9        ;; 02:4aac ????????
    db   $09, $ad, $05, $ae, $08, $e1, $00, $e2        ;; 02:4ab4 ????????
    db   $20, $e3, $22, $e4, $02, $e5, $03, $ee        ;; 02:4abc ????????
    db   $23, $ef, $22, $f0, $02, $f1, $00, $f2        ;; 02:4ac4 ????????
    db   $20, $1e, $0d, $07, $27, $07, $2c, $07        ;; 02:4acc ????????
    db   $2e, $06, $46, $07, $48, $06, $4b, $07        ;; 02:4ad4 ????????
    db   $4d, $08, $4f, $07, $67, $08, $6c, $08        ;; 02:4adc ????????
    db   $70, $06, $85, $0a, $86, $08, $8a, $05        ;; 02:4ae4 ????????
    db   $8b, $08, $8e, $0a, $8f, $08, $a4, $09        ;; 02:4aec ????????
    db   $ad, $09, $e0, $00, $e1, $01, $e2, $02        ;; 02:4af4 ????????
    db   $e3, $03, $e4, $04, $ef, $24, $f0, $23        ;; 02:4afc ????????
    db   $f1, $22, $f2, $21, $f3, $20, $1e, $08        ;; 02:4b04 ????????
    db   $07, $0d, $07, $0f, $06, $27, $07, $29        ;; 02:4b0c ????????
    db   $08, $2c, $07, $2e, $08, $30, $07, $46        ;; 02:4b14 ????????
    db   $07, $48, $08, $4d, $08, $4f, $07, $51        ;; 02:4b1c ????????
    db   $06, $67, $08, $6b, $0a, $6c, $08, $70        ;; 02:4b24 ????????
    db   $08, $85, $05, $86, $08, $8a, $09, $8e        ;; 02:4b2c ????????
    db   $05, $8f, $08, $e0, $21, $e1, $01, $e2        ;; 02:4b34 ????????
    db   $02, $e3, $03, $f0, $23, $f1, $22, $f2        ;; 02:4b3c ????????
    db   $21, $f3, $01, $ba, $c2, $c5, $c8, $cb        ;; 02:4b44 ????????
    db   $ce, $d0, $d3, $d5, $d7, $d9, $db, $dc        ;; 02:4b4c ????????
    db   $de, $df, $e0, $e2, $e3, $e4, $e6, $e7        ;; 02:4b54 ????????
    db   $e8, $ea, $eb, $ec, $ed, $ee, $ef, $f0        ;; 02:4b5c ????????
    db   $f1, $f2, $f3, $f4, $f5, $f5, $f6, $f7        ;; 02:4b64 ????????
    db   $f7, $f8, $f9, $f9, $fa, $fb, $fb, $fc        ;; 02:4b6c ????????
    db   $fc, $fd, $fd, $fe, $fe, $fe, $fe, $ff        ;; 02:4b74 ????????
    db   $ff, $ff, $ff, $00, $00, $00, $00, $00        ;; 02:4b7c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:4b84 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:4b8c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:4b94 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:4b9c ????????
    db   $00, $00, $00, $00, $00, $1e, $30, $cd        ;; 02:4ba4 ????????
    db   $6b, $3a, $21, $c9, $4b, $7b, $e6, $0c        ;; 02:4bac ????????
    db   $1f, $1f, $c7, $7e, $e0, $47, $01, $44        ;; 02:4bb4 ????????
    db   $40, $f2, $b8, $20, $fc, $3e, $d2, $e0        ;; 02:4bbc ????????
    db   $47, $1d, $20, $e3, $c9, $92, $d2, $12        ;; 02:4bc4 ????????
    db   $52, $21, $05, $4c, $01, $f1, $4b, $3e        ;; 02:4bcc ????????
    db   $0a, $ea, $0f, $de, $cd, $e2, $4b, $fa        ;; 02:4bd4 ????????
    db   $0f, $de, $3d, $20, $f4, $c9, $0a, $03        ;; 02:4bdc ????????
    db   $5f, $0a, $03, $57, $c5, $01, $20, $00        ;; 02:4be4 ????????
    db   $cd, $ff, $20, $c1, $c9, $a0, $92, $50        ;; 02:4bec ????????
    db   $93, $70, $92, $20, $93, $b0, $90, $a0        ;; 02:4bf4 ????????
    db   $91, $e0, $93, $b0, $94, $00, $93, $a0        ;; 02:4bfc ????????
    db   $93, $0f, $b0, $3c, $c3, $63, $9f, $0f        ;; 02:4c04 ????????
    db   $bd, $5d, $37, $bb, $7f, $bf, $6f, $f7        ;; 02:4c0c ????????
    db   $7f, $0e, $f7, $74, $8f, $e8, $f3, $fc        ;; 02:4c14 ????????
    db   $7e, $7c, $d5, $de, $ff, $f6, $fb, $fe        ;; 02:4c1c ????????
    db   $ff, $ef, $5f, $7f, $ff, $6f, $df, $7f        ;; 02:4c24 ????????
    db   $ff, $75, $ff, $7f, $f5, $1f, $ff, $e7        ;; 02:4c2c ????????
    db   $f8, $f7, $fa, $ff, $fe, $ed, $fe, $bd        ;; 02:4c34 ????????
    db   $f6, $7a, $dd, $e4, $78, $b8, $c4, $d0        ;; 02:4c3c ????????
    db   $34, $42, $45, $02, $35, $00, $33, $3c        ;; 02:4c44 ????????
    db   $81, $39, $fe, $7f, $d7, $7f, $fd, $ff        ;; 02:4c4c ????????
    db   $df, $a0, $dc, $a0, $dc, $00, $60, $00        ;; 02:4c54 ????????
    db   $f0, $f0, $0c, $9c, $e3, $f5, $7a, $fa        ;; 02:4c5c ????????
    db   $dd, $3f, $ff, $df, $2f, $cf, $2b, $33        ;; 02:4c64 ????????
    db   $ca, $0e, $f1, $ff, $ff, $00, $7e, $00        ;; 02:4c6c ????????
    db   $ff, $fc, $f7, $fe, $ff, $fe, $fb, $fe        ;; 02:4c74 ????????
    db   $bf, $7c, $ef, $e0, $1c, $c0, $b8, $20        ;; 02:4c7c ????????
    db   $d9, $86, $49, $28, $ab, $39, $3b, $87        ;; 02:4c84 ????????
    db   $8e, $ce, $db, $9b, $bf, $3f, $7f, $3d        ;; 02:4c8c ????????
    db   $2f, $dd, $3e, $f8, $07, $ec, $f3, $fb        ;; 02:4c94 ????????
    db   $bc, $bd, $ee, $de, $fb, $f6, $ff, $ff        ;; 02:4c9c ????????
    db   $fd, $bf, $5b, $07, $fe, $01, $07, $70        ;; 02:4ca4 ????????
    db   $8b, $88, $75, $04, $99, $74, $79, $7c        ;; 02:4cac ????????
    db   $7b, $aa, $ff, $ff, $af, $fe, $fe, $19        ;; 02:4cb4 ????????
    db   $fa, $27, $e8, $4c, $d3, $58, $e7, $b0        ;; 02:4cbc ????????
    db   $8e, $e0, $18, $c0, $3e, $00, $ff, $cf        ;; 02:4cc4 ????????
    db   $30, $7f, $ff, $7f, $d5, $ff, $ff, $ff        ;; 02:4ccc ????????
    db   $bf, $01, $0e, $00, $7f, $87, $7f, $c0        ;; 02:4cd4 ????????
    db   $30, $30, $c8, $f8, $ff, $fe, $5e, $ff        ;; 02:4cdc ????????
    db   $f7, $ef, $ff, $7b, $df, $7d, $f7, $3f        ;; 02:4ce4 ????????
    db   $3d, $ff, $ff, $1b, $1b, $04, $44, $00        ;; 02:4cec ????????
    db   $e0, $ff, $fd, $fa, $fe, $ee, $fe, $5c        ;; 02:4cf4 ????????
    db   $f4, $fc, $5c, $f8, $fa, $f0, $f3, $00        ;; 02:4cfc ????????
    db   $00, $20, $23, $11, $13, $4a, $4b, $73        ;; 02:4d04 ????????
    db   $73, $05, $07, $06, $c5, $07, $ff, $06        ;; 02:4d0c ????????
    db   $65, $d3, $ef, $f8, $e7, $b1, $ee, $f1        ;; 02:4d14 ????????
    db   $e2, $a8, $f7, $e8, $f7, $db, $f7, $fa        ;; 02:4d1c ????????
    db   $f6, $7f, $7f, $de, $dd, $27, $27, $23        ;; 02:4d24 ????????
    db   $22, $23, $23, $a1, $a1, $e0, $64, $e0        ;; 02:4d2c ????????
    db   $66, $d4, $fd, $f4, $f5, $ec, $fd, $7c        ;; 02:4d34 ????????
    db   $fd, $aa, $fb, $da, $7a, $f9, $d9, $70        ;; 02:4d3c ????????
    db   $78                                           ;; 02:4d44 ?

data_02_4d45:
    ld   HL, wDE40                                     ;; 02:4d45 $21 $40 $de
    ld   A, $80                                        ;; 02:4d48 $3e $80
    ld   B, $1a                                        ;; 02:4d4a $06 $1a
.jr_02_4d4c:
    ld   [HL+], A                                      ;; 02:4d4c $22
    dec  B                                             ;; 02:4d4d $05
    jr   NZ, .jr_02_4d4c                               ;; 02:4d4e $20 $fc
    ld   HL, wDE40                                     ;; 02:4d50 $21 $40 $de
    ld   A, [wC9F7]                                    ;; 02:4d53 $fa $f7 $c9
    cp   A, $ff                                        ;; 02:4d56 $fe $ff
    jr   NZ, .jr_02_4d5d                               ;; 02:4d58 $20 $03
    ld   A, [wC9D8]                                    ;; 02:4d5a $fa $d8 $c9
.jr_02_4d5d:
    add  A, A                                          ;; 02:4d5d $87
    rst  add_hl_a                                      ;; 02:4d5e $c7
    ld   A, $88                                        ;; 02:4d5f $3e $88
    ld   [HL+], A                                      ;; 02:4d61 $22
    ld   [HL], A                                       ;; 02:4d62 $77
    jr   jr_02_4d70                                    ;; 02:4d63 $18 $0b

data_02_4d65:
    ld   HL, wD822                                     ;; 02:4d65 $21 $22 $d8
    ld   DE, wDE40                                     ;; 02:4d68 $11 $40 $de
    ld   B, $1a                                        ;; 02:4d6b $06 $1a
    call call_00_1f97                                  ;; 02:4d6d $cd $97 $1f

jr_02_4d70:
    call call_02_418f                                  ;; 02:4d70 $cd $8f $41
    ld   A, $01                                        ;; 02:4d73 $3e $01
    call call_02_4e7c                                  ;; 02:4d75 $cd $7c $4e
    ld   A, [wD873]                                    ;; 02:4d78 $fa $73 $d8
    cp   A, $05                                        ;; 02:4d7b $fe $05
    jr   C, jr_02_4d87                                 ;; 02:4d7d $38 $08
    call call_02_4d8a                                  ;; 02:4d7f $cd $8a $4d

call_02_4d82:
    ld   BC, $500                                      ;; 02:4d82 $01 $00 $05
    jr   jr_02_4d8d                                    ;; 02:4d85 $18 $06

jr_02_4d87:
    call call_02_4d82                                  ;; 02:4d87 $cd $82 $4d

call_02_4d8a:
    ld   BC, $d05                                      ;; 02:4d8a $01 $05 $0d

jr_02_4d8d:
    ld   HL, wDE09                                     ;; 02:4d8d $21 $09 $de
    ld   A, C                                          ;; 02:4d90 $79
    ld   [HL+], A                                      ;; 02:4d91 $22
    ld   [HL], B                                       ;; 02:4d92 $70
    xor  A, A                                          ;; 02:4d93 $af
    ld   [wDE0B], A                                    ;; 02:4d94 $ea $0b $de
.jr_02_4d97:
    call call_02_4dae                                  ;; 02:4d97 $cd $ae $4d
    ld   A, [wDE0B]                                    ;; 02:4d9a $fa $0b $de
    and  A, A                                          ;; 02:4d9d $a7
    ret  Z                                             ;; 02:4d9e $c8
    call call_02_4eb0                                  ;; 02:4d9f $cd $b0 $4e
    call call_02_4eb0                                  ;; 02:4da2 $cd $b0 $4e
    call call_02_4eb0                                  ;; 02:4da5 $cd $b0 $4e
    call call_02_4eb0                                  ;; 02:4da8 $cd $b0 $4e
    jr   NZ, .jr_02_4d97                               ;; 02:4dab $20 $ea
    ret                                                ;; 02:4dad $c9

call_02_4dae:
    ld   HL, wDE09                                     ;; 02:4dae $21 $09 $de
    ld   A, [HL+]                                      ;; 02:4db1 $2a
    ld   B, [HL]                                       ;; 02:4db2 $46
    cp   A, B                                          ;; 02:4db3 $b8
    ret  NC                                            ;; 02:4db4 $d0
    ld   C, A                                          ;; 02:4db5 $4f
    ld   HL, wDE40                                     ;; 02:4db6 $21 $40 $de
    add  A, A                                          ;; 02:4db9 $87
    rst  add_hl_a                                      ;; 02:4dba $c7
.jr_02_4dbb:
    inc  C                                             ;; 02:4dbb $0c
    ld   A, [HL+]                                      ;; 02:4dbc $2a
    ld   E, A                                          ;; 02:4dbd $5f
    ld   A, [HL+]                                      ;; 02:4dbe $2a
    ld   D, A                                          ;; 02:4dbf $57
    cp   A, $80                                        ;; 02:4dc0 $fe $80
    jr   NZ, .jr_02_4dc9                               ;; 02:4dc2 $20 $05
    ld   A, C                                          ;; 02:4dc4 $79
    cp   A, B                                          ;; 02:4dc5 $b8
    ret  NC                                            ;; 02:4dc6 $d0
    jr   .jr_02_4dbb                                   ;; 02:4dc7 $18 $f2
.jr_02_4dc9:
    ld   A, C                                          ;; 02:4dc9 $79
    ld   [wDE09], A                                    ;; 02:4dca $ea $09 $de
    ld   HL, wDE0B                                     ;; 02:4dcd $21 $0b $de
    inc  [HL]                                          ;; 02:4dd0 $34
    bit  7, D                                          ;; 02:4dd1 $cb $7a
    jr   Z, .jr_02_4def                                ;; 02:4dd3 $28 $1a
    ld   A, D                                          ;; 02:4dd5 $7a
    cp   A, $88                                        ;; 02:4dd6 $fe $88
    jr   NZ, .jr_02_4de8                               ;; 02:4dd8 $20 $0e
    ld   HL, wCD31                                     ;; 02:4dda $21 $31 $cd
    ld   A, $0c                                        ;; 02:4ddd $3e $0c
    ld   [HL-], A                                      ;; 02:4ddf $32
    dec  A                                             ;; 02:4de0 $3d
    ld   [HL-], A                                      ;; 02:4de1 $32
    dec  A                                             ;; 02:4de2 $3d
    ld   [HL-], A                                      ;; 02:4de3 $32
    ld   [HL], $ff                                     ;; 02:4de4 $36 $ff
    jr   .jr_02_4dfb                                   ;; 02:4de6 $18 $13
.jr_02_4de8:
    ld   A, D                                          ;; 02:4de8 $7a
    cpl                                                ;; 02:4de9 $2f
    ld   D, A                                          ;; 02:4dea $57
    ld   A, E                                          ;; 02:4deb $7b
    cpl                                                ;; 02:4dec $2f
    ld   E, A                                          ;; 02:4ded $5f
    inc  DE                                            ;; 02:4dee $13
.jr_02_4def:
    ld   HL, wDE0C                                     ;; 02:4def $21 $0c $de
    ld   A, E                                          ;; 02:4df2 $7b
    ld   [HL+], A                                      ;; 02:4df3 $22
    ld   A, D                                          ;; 02:4df4 $7a
    ld   [HL-], A                                      ;; 02:4df5 $32
    ld   A, $02                                        ;; 02:4df6 $3e $02
    call call_00_2009                                  ;; 02:4df8 $cd $09 $20
.jr_02_4dfb:
    call call_02_4e20                                  ;; 02:4dfb $cd $20 $4e
    ld   DE, wCD31                                     ;; 02:4dfe $11 $31 $cd
.jr_02_4e01:
    ld   HL, wDE13                                     ;; 02:4e01 $21 $13 $de
    ld   A, B                                          ;; 02:4e04 $78
    ld   [HL+], A                                      ;; 02:4e05 $22
    ld   A, C                                          ;; 02:4e06 $79
    ld   [HL+], A                                      ;; 02:4e07 $22
    sub  A, $08                                        ;; 02:4e08 $d6 $08
    ld   C, A                                          ;; 02:4e0a $4f
    ld   A, [DE]                                       ;; 02:4e0b $1a
    dec  DE                                            ;; 02:4e0c $1b
    cp   A, $ff                                        ;; 02:4e0d $fe $ff
    ret  Z                                             ;; 02:4e0f $c8
    and  A, $0f                                        ;; 02:4e10 $e6 $0f
    add  A, A                                          ;; 02:4e12 $87
    ld   [HL+], A                                      ;; 02:4e13 $22
    ld   [HL], $00                                     ;; 02:4e14 $36 $00
    push BC                                            ;; 02:4e16 $c5
    ld   BC, data_02_4e4b                              ;; 02:4e17 $01 $4b $4e
    call call_02_4e8c                                  ;; 02:4e1a $cd $8c $4e
    pop  BC                                            ;; 02:4e1d $c1
    jr   .jr_02_4e01                                   ;; 02:4e1e $18 $e1

call_02_4e20:
    ld   A, [wDE09]                                    ;; 02:4e20 $fa $09 $de
    dec  A                                             ;; 02:4e23 $3d
    ld   [wDE01], A                                    ;; 02:4e24 $ea $01 $de
    call call_02_42c0                                  ;; 02:4e27 $cd $c0 $42
    push AF                                            ;; 02:4e2a $f5
    ld   A, C                                          ;; 02:4e2b $79
    add  A, $04                                        ;; 02:4e2c $c6 $04
    add  A, A                                          ;; 02:4e2e $87
    add  A, A                                          ;; 02:4e2f $87
    add  A, A                                          ;; 02:4e30 $87
    ld   C, A                                          ;; 02:4e31 $4f
    pop  AF                                            ;; 02:4e32 $f1
    add  A, C                                          ;; 02:4e33 $81
    ld   C, A                                          ;; 02:4e34 $4f
    inc  B                                             ;; 02:4e35 $04
    inc  B                                             ;; 02:4e36 $04
    ld   A, B                                          ;; 02:4e37 $78
    add  A, A                                          ;; 02:4e38 $87
    add  A, A                                          ;; 02:4e39 $87
    add  A, A                                          ;; 02:4e3a $87
    ld   B, A                                          ;; 02:4e3b $47
    ld   D, $ff                                        ;; 02:4e3c $16 $ff
    ld   HL, wCD2F                                     ;; 02:4e3e $21 $2f $cd
.jr_02_4e41:
    ld   A, [HL+]                                      ;; 02:4e41 $2a
    cp   A, D                                          ;; 02:4e42 $ba
    ret  NZ                                            ;; 02:4e43 $c0
    dec  C                                             ;; 02:4e44 $0d
    dec  C                                             ;; 02:4e45 $0d
    dec  C                                             ;; 02:4e46 $0d
    dec  C                                             ;; 02:4e47 $0d
    jr   .jr_02_4e41                                   ;; 02:4e48 $18 $f7
    db   $c9                                           ;; 02:4e4a ?

data_02_4e4b:
    db   $18, $00, $00, $fc, $00, $fe, $00, $00        ;; 02:4e4b ........
    db   $00, $01, $00, $01, $00, $02, $00, $02        ;; 02:4e53 ........
    db   $00, $ff, $00, $01, $00, $ff, $00, $01        ;; 02:4e5b ........
    db   $00, $ff, $00, $01, $00, $00, $00, $00        ;; 02:4e63 ........
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:4e6b ........
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:4e73 ........
    db   $00                                           ;; 02:4e7b .

call_02_4e7c:
    ld   HL, wDEFC                                     ;; 02:4e7c $21 $fc $de
    ld   [HL+], A                                      ;; 02:4e7f $22
    xor  A, A                                          ;; 02:4e80 $af
    ld   [HL+], A                                      ;; 02:4e81 $22
    ld   [HL+], A                                      ;; 02:4e82 $22
    ld   [HL+], A                                      ;; 02:4e83 $22
    dec  A                                             ;; 02:4e84 $3d
    ld   B, $f0                                        ;; 02:4e85 $06 $f0
.jr_02_4e87:
    ld   [HL+], A                                      ;; 02:4e87 $22
    dec  B                                             ;; 02:4e88 $05
    jr   NZ, .jr_02_4e87                               ;; 02:4e89 $20 $fc
    ret                                                ;; 02:4e8b $c9

call_02_4e8c:
    push DE                                            ;; 02:4e8c $d5
    ld   DE, wDE13                                     ;; 02:4e8d $11 $13 $de
    ld   HL, wDF00                                     ;; 02:4e90 $21 $00 $df
    jr   .jr_02_4e98                                   ;; 02:4e93 $18 $03
.jr_02_4e95:
    ld   A, $08                                        ;; 02:4e95 $3e $08
    rst  add_hl_a                                      ;; 02:4e97 $c7
.jr_02_4e98:
    ld   A, [HL]                                       ;; 02:4e98 $7e
    inc  A                                             ;; 02:4e99 $3c
    jr   NZ, .jr_02_4e95                               ;; 02:4e9a $20 $f9
    ld   [HL+], A                                      ;; 02:4e9c $22
    push BC                                            ;; 02:4e9d $c5
    ld   A, [BC]                                       ;; 02:4e9e $0a
    inc  BC                                            ;; 02:4e9f $03
    ld   [HL+], A                                      ;; 02:4ea0 $22
    ld   A, C                                          ;; 02:4ea1 $79
    ld   [HL+], A                                      ;; 02:4ea2 $22
    ld   A, B                                          ;; 02:4ea3 $78
    ld   [HL+], A                                      ;; 02:4ea4 $22
    ld   B, $04                                        ;; 02:4ea5 $06 $04
.jr_02_4ea7:
    ld   A, [DE]                                       ;; 02:4ea7 $1a
    inc  DE                                            ;; 02:4ea8 $13
    ld   [HL+], A                                      ;; 02:4ea9 $22
    dec  B                                             ;; 02:4eaa $05
    jr   NZ, .jr_02_4ea7                               ;; 02:4eab $20 $fa
    pop  BC                                            ;; 02:4ead $c1
    pop  DE                                            ;; 02:4eae $d1
    ret                                                ;; 02:4eaf $c9

call_02_4eb0:
    call call_02_4eb9                                  ;; 02:4eb0 $cd $b9 $4e
    call call_02_4eb9                                  ;; 02:4eb3 $cd $b9 $4e
    call call_02_4eb9                                  ;; 02:4eb6 $cd $b9 $4e

call_02_4eb9:
    call call_02_4ed2                                  ;; 02:4eb9 $cd $d2 $4e
    ld   HL, wDEFD                                     ;; 02:4ebc $21 $fd $de
    ld   A, B                                          ;; 02:4ebf $78
    ld   [HL-], A                                      ;; 02:4ec0 $32
    ld   A, [HL+]                                      ;; 02:4ec1 $2a
    call call_00_3a6d                                  ;; 02:4ec2 $cd $6d $3a
    ld   A, [HL+]                                      ;; 02:4ec5 $2a
    and  A, A                                          ;; 02:4ec6 $a7
    jr   Z, .jr_02_4ecd                                ;; 02:4ec7 $28 $04
    ld   A, $fe                                        ;; 02:4ec9 $3e $fe
    jr   .jr_02_4ed0                                   ;; 02:4ecb $18 $03
.jr_02_4ecd:
    ld   A, [HL]                                       ;; 02:4ecd $7e
    inc  A                                             ;; 02:4ece $3c
    ret  Z                                             ;; 02:4ecf $c8
.jr_02_4ed0:
    ld   [HL], A                                       ;; 02:4ed0 $77
    ret                                                ;; 02:4ed1 $c9

call_02_4ed2:
    call call_00_3a6b                                  ;; 02:4ed2 $cd $6b $3a
    call call_02_4fc5                                  ;; 02:4ed5 $cd $c5 $4f
    ld   HL, wDF00                                     ;; 02:4ed8 $21 $00 $df
    ld   DE, wC000                                     ;; 02:4edb $11 $00 $c0
    ld   C, $1e                                        ;; 02:4ede $0e $1e
    ld   B, C                                          ;; 02:4ee0 $41
.jr_02_4ee1:
    ld   A, [HL+]                                      ;; 02:4ee1 $2a
    inc  A                                             ;; 02:4ee2 $3c
    jr   Z, .jr_02_4f1a                                ;; 02:4ee3 $28 $35
    cp   A, [HL]                                       ;; 02:4ee5 $be
    dec  HL                                            ;; 02:4ee6 $2b
    jr   C, .jr_02_4eec                                ;; 02:4ee7 $38 $03
    ld   A, $ff                                        ;; 02:4ee9 $3e $ff
    dec  B                                             ;; 02:4eeb $05
.jr_02_4eec:
    ld   [HL+], A                                      ;; 02:4eec $22
    inc  HL                                            ;; 02:4eed $23
    push BC                                            ;; 02:4eee $c5
    ld   A, [HL+]                                      ;; 02:4eef $2a
    ld   C, A                                          ;; 02:4ef0 $4f
    ld   A, [HL+]                                      ;; 02:4ef1 $2a
    ld   B, A                                          ;; 02:4ef2 $47
    ld   A, [BC]                                       ;; 02:4ef3 $0a
    inc  BC                                            ;; 02:4ef4 $03
    add  A, [HL]                                       ;; 02:4ef5 $86
    ld   [HL+], A                                      ;; 02:4ef6 $22
    ld   [DE], A                                       ;; 02:4ef7 $12
    inc  DE                                            ;; 02:4ef8 $13
    ld   A, [BC]                                       ;; 02:4ef9 $0a
    inc  BC                                            ;; 02:4efa $03
    add  A, [HL]                                       ;; 02:4efb $86
    ld   [HL-], A                                      ;; 02:4efc $32
    ld   [DE], A                                       ;; 02:4efd $12
    inc  DE                                            ;; 02:4efe $13
    ld   A, [wDEFF]                                    ;; 02:4eff $fa $ff $de
    and  A, A                                          ;; 02:4f02 $a7
    jr   Z, .jr_02_4f07                                ;; 02:4f03 $28 $02
    dec  BC                                            ;; 02:4f05 $0b
    dec  BC                                            ;; 02:4f06 $0b
.jr_02_4f07:
    dec  HL                                            ;; 02:4f07 $2b
    ld   A, B                                          ;; 02:4f08 $78
    ld   [HL-], A                                      ;; 02:4f09 $32
    ld   A, C                                          ;; 02:4f0a $79
    ld   [HL+], A                                      ;; 02:4f0b $22
    inc  HL                                            ;; 02:4f0c $23
    inc  HL                                            ;; 02:4f0d $23
    inc  HL                                            ;; 02:4f0e $23
    ld   A, [HL+]                                      ;; 02:4f0f $2a
    ld   [DE], A                                       ;; 02:4f10 $12
    inc  DE                                            ;; 02:4f11 $13
    ld   A, [HL+]                                      ;; 02:4f12 $2a
    ld   [DE], A                                       ;; 02:4f13 $12
    inc  DE                                            ;; 02:4f14 $13
    pop  BC                                            ;; 02:4f15 $c1
.jr_02_4f16:
    dec  C                                             ;; 02:4f16 $0d
    jr   NZ, .jr_02_4ee1                               ;; 02:4f17 $20 $c8
    ret                                                ;; 02:4f19 $c9
.jr_02_4f1a:
    dec  B                                             ;; 02:4f1a $05
    ld   A, $07                                        ;; 02:4f1b $3e $07
    rst  add_hl_a                                      ;; 02:4f1d $c7
    jr   .jr_02_4f16                                   ;; 02:4f1e $18 $f6

data_02_4f20:
    ld   A, [wC9D6]                                    ;; 02:4f20 $fa $d6 $c9
    cp   A, $05                                        ;; 02:4f23 $fe $05
    ret  C                                             ;; 02:4f25 $d8
    sub  A, $05                                        ;; 02:4f26 $d6 $05
    ld   [wDE01], A                                    ;; 02:4f28 $ea $01 $de
    call call_02_529f                                  ;; 02:4f2b $cd $9f $52
    ld   A, [wCC5C]                                    ;; 02:4f2e $fa $5c $cc
    and  A, $03                                        ;; 02:4f31 $e6 $03
    call doJumptable                                   ;; 02:4f33 $cd $3a $37
    dw   .data_02_4fa4                                 ;; 02:4f36 pP
    db   $55, $50, $ed, $50, $67, $51, $21, $fe        ;; 02:4f38 ????????
    db   $52, $cd, $17, $50, $fa, $85, $c9, $d6        ;; 02:4f40 ????????
    db   $05, $cd, $9f, $52, $cd, $d0, $4f, $21        ;; 02:4f48 ????????
    db   $17, $de, $11, $1b, $de, $cd, $8a, $1f        ;; 02:4f50 ????????
    db   $fa, $d6, $c9, $d6, $05, $cd, $9f, $52        ;; 02:4f58 ????????
    db   $cd, $7b, $4f, $3e, $07, $ea, $0f, $de        ;; 02:4f60 ????????
    db   $21, $7e, $53, $cd, $0c, $50, $3e, $03        ;; 02:4f68 ????????
    db   $cd, $6d, $3a, $21, $0f, $de, $35, $20        ;; 02:4f70 ????????
    db   $ef, $18, $4a, $21, $1b, $de, $2a, $4f        ;; 02:4f78 ????????
    db   $2a, $47, $cd, $dd, $52, $e5, $21, $19        ;; 02:4f80 ????????
    db   $de, $cd, $dd, $52, $d1, $c5, $06, $00        ;; 02:4f88 ????????
    db   $e5, $d5, $cd, $ff, $20, $d1, $21, $20        ;; 02:4f90 ????????
    db   $00, $7d, $19, $5d, $54, $e1, $c7, $c1        ;; 02:4f98 ????????
    db   $05, $20, $ea, $c9                            ;; 02:4fa0 ????
.data_02_4fa4:
    ld   HL, $8000                                     ;; 02:4fa4 $21 $00 $80
    ld   BC, $20                                       ;; 02:4fa7 $01 $20 $00
    xor  A, A                                          ;; 02:4faa $af
    call call_00_218f                                  ;; 02:4fab $cd $8f $21
    call call_02_4fd0                                  ;; 02:4fae $cd $d0 $4f
    ld   A, $08                                        ;; 02:4fb1 $3e $08
    ld   [wDE0F], A                                    ;; 02:4fb3 $ea $0f $de
.jr_02_4fb6:
    call call_02_5009                                  ;; 02:4fb6 $cd $09 $50
    call call_02_502f                                  ;; 02:4fb9 $cd $2f $50
    ld   HL, wDE0F                                     ;; 02:4fbc $21 $0f $de
    dec  [HL]                                          ;; 02:4fbf $35
    jr   NZ, .jr_02_4fb6                               ;; 02:4fc0 $20 $f4
    call call_02_52c1                                  ;; 02:4fc2 $cd $c1 $52

call_02_4fc5:
    ld   HL, wC000                                     ;; 02:4fc5 $21 $00 $c0
    ld   B, $78                                        ;; 02:4fc8 $06 $78
    xor  A, A                                          ;; 02:4fca $af
.jr_02_4fcb:
    ld   [HL+], A                                      ;; 02:4fcb $22
    dec  B                                             ;; 02:4fcc $05
    jr   NZ, .jr_02_4fcb                               ;; 02:4fcd $20 $fc
    ret                                                ;; 02:4fcf $c9

call_02_4fd0:
    ld   HL, wDE17                                     ;; 02:4fd0 $21 $17 $de
    ld   A, [HL+]                                      ;; 02:4fd3 $2a
    ld   B, A                                          ;; 02:4fd4 $47
    ld   A, [HL+]                                      ;; 02:4fd5 $2a
    sra  A                                             ;; 02:4fd6 $cb $2f
    ld   C, A                                          ;; 02:4fd8 $4f
    ld   A, [HL+]                                      ;; 02:4fd9 $2a
    inc  A                                             ;; 02:4fda $3c
    add  A, A                                          ;; 02:4fdb $87
    add  A, A                                          ;; 02:4fdc $87
    add  A, A                                          ;; 02:4fdd $87
    ld   D, A                                          ;; 02:4fde $57
    ld   A, [HL+]                                      ;; 02:4fdf $2a
    add  A, $02                                        ;; 02:4fe0 $c6 $02
    add  A, A                                          ;; 02:4fe2 $87
    add  A, A                                          ;; 02:4fe3 $87
    add  A, A                                          ;; 02:4fe4 $87
    ld   E, A                                          ;; 02:4fe5 $5f
    ld   HL, wC000                                     ;; 02:4fe6 $21 $00 $c0
.jr_02_4fe9:
    push BC                                            ;; 02:4fe9 $c5
    push DE                                            ;; 02:4fea $d5
.jr_02_4feb:
    ld   A, E                                          ;; 02:4feb $7b
    ld   [HL+], A                                      ;; 02:4fec $22
    ld   A, D                                          ;; 02:4fed $7a
    ld   [HL+], A                                      ;; 02:4fee $22
    add  A, $08                                        ;; 02:4fef $c6 $08
    ld   D, A                                          ;; 02:4ff1 $57
    xor  A, A                                          ;; 02:4ff2 $af
    ld   [HL+], A                                      ;; 02:4ff3 $22
    ld   A, C                                          ;; 02:4ff4 $79
    cpl                                                ;; 02:4ff5 $2f
    and  A, $01                                        ;; 02:4ff6 $e6 $01
    rra                                                ;; 02:4ff8 $1f
    rra                                                ;; 02:4ff9 $1f
    rra                                                ;; 02:4ffa $1f
    ld   [HL+], A                                      ;; 02:4ffb $22
    dec  B                                             ;; 02:4ffc $05
    jr   NZ, .jr_02_4feb                               ;; 02:4ffd $20 $ec
    pop  DE                                            ;; 02:4fff $d1
    ld   A, E                                          ;; 02:5000 $7b
    add  A, $10                                        ;; 02:5001 $c6 $10
    ld   E, A                                          ;; 02:5003 $5f
    pop  BC                                            ;; 02:5004 $c1
    dec  C                                             ;; 02:5005 $0d
    jr   NZ, .jr_02_4fe9                               ;; 02:5006 $20 $e1
    ret                                                ;; 02:5008 $c9

call_02_5009:
    ld   HL, data_02_52fe                              ;; 02:5009 $21 $fe $52
    call call_00_3a6b                                  ;; 02:500c $cd $6b $3a
    ld   A, [wDE0F]                                    ;; 02:500f $fa $0f $de
    dec  A                                             ;; 02:5012 $3d
    and  A, $07                                        ;; 02:5013 $e6 $07
    swap A                                             ;; 02:5015 $cb $37
    rst  add_hl_a                                      ;; 02:5017 $c7
    push HL                                            ;; 02:5018 $e5
    ld   DE, wDE40                                     ;; 02:5019 $11 $40 $de
    call call_00_1f66                                  ;; 02:501c $cd $66 $1f
    pop  HL                                            ;; 02:501f $e1

jr_02_5020:
    call call_00_1f66                                  ;; 02:5020 $cd $66 $1f
    ld   HL, wDE40                                     ;; 02:5023 $21 $40 $de
    ld   DE, $8000                                     ;; 02:5026 $11 $00 $80
    ld   BC, $20                                       ;; 02:5029 $01 $20 $00
    jp   call_00_20ff                                  ;; 02:502c $c3 $ff $20

call_02_502f:
    ld   A, $03                                        ;; 02:502f $3e $03
    ld   [wDE10], A                                    ;; 02:5031 $ea $10 $de
.jr_02_5034:
    call call_02_503e                                  ;; 02:5034 $cd $3e $50
    ld   HL, wDE10                                     ;; 02:5037 $21 $10 $de
    dec  [HL]                                          ;; 02:503a $35
    jr   NZ, .jr_02_5034                               ;; 02:503b $20 $f7
    ret                                                ;; 02:503d $c9

call_02_503e:
    call call_00_3a6b                                  ;; 02:503e $cd $6b $3a
    ld   HL, wDE52                                     ;; 02:5041 $21 $52 $de
    ld   DE, wDE40                                     ;; 02:5044 $11 $40 $de
    call call_00_1f6c                                  ;; 02:5047 $cd $6c $1f
    ld   HL, wDE50                                     ;; 02:504a $21 $50 $de
    call call_00_1f90                                  ;; 02:504d $cd $90 $1f
    ld   HL, wDE40                                     ;; 02:5050 $21 $40 $de
    jr   jr_02_5020                                    ;; 02:5053 $18 $cb
    db   $af, $cd, $6d, $50, $3e, $08, $ea, $0f        ;; 02:5055 ????????
    db   $de, $cd, $77, $50, $cd, $a0, $50, $21        ;; 02:505d ????????
    db   $0f, $de, $35, $20, $f4, $c3, $b6, $51        ;; 02:5065 ????????
    db   $21, $40, $de, $06, $40, $22, $05, $20        ;; 02:506d ????????
    db   $fc, $c9, $cd, $e8, $50, $fa, $0f, $de        ;; 02:5075 ????????
    db   $3d, $21, $98, $50, $c7, $4e, $21, $40        ;; 02:507d ????????
    db   $de, $11, $57, $de, $06, $08, $af, $cb        ;; 02:5085 ????????
    db   $19, $1f, $1f, $22, $12, $1b, $05, $20        ;; 02:508d ????????
    db   $f5, $18, $2c, $ff, $ef, $bb, $6b, $aa        ;; 02:5095 ????????
    db   $29, $84, $08, $cd, $a6, $50, $cd, $a6        ;; 02:509d ????????
    db   $50, $cd, $e8, $50, $21, $49, $de, $11        ;; 02:50a5 ????????
    db   $40, $de, $cd, $81, $1f, $fa, $48, $de        ;; 02:50ad ????????
    db   $12, $11, $50, $de, $fa, $5f, $de, $12        ;; 02:50b5 ????????
    db   $13, $21, $58, $de, $cd, $81, $1f, $21        ;; 02:50bd ????????
    db   $40, $de, $11, $48, $de, $cd, $7e, $1f        ;; 02:50c5 ????????
    db   $21, $40, $de, $11, $60, $de, $cd, $66        ;; 02:50cd ????????
    db   $1f, $21, $50, $de, $11, $58, $de, $cd        ;; 02:50d5 ????????
    db   $7e, $1f, $21, $50, $de, $11, $70, $de        ;; 02:50dd ????????
    db   $c3, $66, $1f, $0e, $42, $c3, $7f, $44        ;; 02:50e5 ????????
    db   $21, $74, $7e, $cd, $92, $41, $cd, $6b        ;; 02:50ed ????????
    db   $3a, $3e, $40, $e0, $42, $3e, $d8, $e0        ;; 02:50f5 ????????
    db   $49, $21, $63, $7d, $cd, $a3, $41, $16        ;; 02:50fd ????????
    db   $7f, $cd, $6b, $3a, $7a, $1f, $e6, $03        ;; 02:5105 ????????
    db   $21, $cc, $51, $c7, $a7, $20, $04, $3e        ;; 02:510d ????????
    db   $1c, $e0, $bc, $7e, $e0, $42, $7a, $cb        ;; 02:5115 ????????
    db   $42, $28, $02, $2f, $3c, $e0, $43, $21        ;; 02:511d ????????
    db   $30, $44, $7a, $1f, $cb, $37, $e6, $03        ;; 02:5125 ????????
    db   $c7, $7e, $e0, $47, $01, $44, $48, $f2        ;; 02:512d ????????
    db   $b8, $20, $fc, $cd, $c4, $51, $3e, $d2        ;; 02:5135 ????????
    db   $e0, $47, $15, $20, $c4, $3e, $1c, $e0        ;; 02:513d ????????
    db   $bc, $cd, $c5, $4f, $3e, $30, $ea, $11        ;; 02:5145 ????????
    db   $de, $0e, $01, $21, $ca, $51, $cd, $e0        ;; 02:514d ????????
    db   $51, $21, $11, $de, $35, $20, $f2, $21        ;; 02:5155 ????????
    db   $00, $d3, $01, $00, $03, $3e, $ff, $c3        ;; 02:515d ????????
    db   $21, $39, $01, $05, $00, $c5, $3e, $30        ;; 02:5165 ????????
    db   $e0, $bc, $79, $21, $ca, $51, $c7, $3e        ;; 02:516d ????????
    db   $02, $cd, $6d, $3a, $7e, $80, $e0, $42        ;; 02:5175 ????????
    db   $0d, $20, $ef, $c1, $05, $fe, $f8, $20        ;; 02:517d ????????
    db   $e4, $3e, $0c, $ea, $11, $de, $21, $d1        ;; 02:5185 ????????
    db   $51, $cd, $de, $51, $21, $11, $de, $35        ;; 02:518d ????????
    db   $20, $f4, $3e, $20, $ea, $0f, $de, $cd        ;; 02:5195 ????????
    db   $fd, $51, $21, $0f, $de, $35, $20, $f7        ;; 02:519d ????????
    db   $3e, $04, $ea, $11, $de, $21, $33, $44        ;; 02:51a5 ????????
    db   $cd, $de, $51, $21, $11, $de, $35, $20        ;; 02:51ad ????????
    db   $f4, $21, $00, $98, $01, $00, $01, $3e        ;; 02:51b5 ????????
    db   $ff, $cd, $8f, $21, $cd, $6b, $3a, $af        ;; 02:51bd ????????
    db   $e0, $43, $e0, $42, $c9, $00, $00, $fe        ;; 02:51c5 ????????
    db   $02, $fc, $04, $00, $d2, $e3, $f3, $e3        ;; 02:51cd ????????
    db   $d2, $81, $40, $81, $d2, $e3, $f3, $e3        ;; 02:51d5 ????????
    db   $d2, $0e, $08, $fa, $11, $de, $3d, $c7        ;; 02:51dd ????????
    db   $46, $c5, $cd, $6b, $3a, $78, $e0, $47        ;; 02:51e5 ????????
    db   $01, $44, $5a, $f2, $b8, $20, $fc, $3e        ;; 02:51ed ????????
    db   $d2, $e0, $47, $c1, $0d, $20, $ea, $c9        ;; 02:51f5 ????????
    db   $fa, $0f, $de, $fe, $06, $38, $08, $e6        ;; 02:51fd ????????
    db   $01, $20, $04, $3e, $36, $e0, $bc, $cd        ;; 02:5205 ????????
    db   $6b, $3a, $3e, $5a, $ea, $11, $de, $11        ;; 02:520d ????????
    db   $00, $90, $d5, $62, $6b, $11, $80, $de        ;; 02:5215 ????????
    db   $01, $10, $00, $cd, $ff, $20, $fa, $0f        ;; 02:521d ????????
    db   $de, $fe, $2e, $30, $04, $cb, $47, $20        ;; 02:5225 ????????
    db   $05, $af, $12, $13, $18, $09, $d5, $16        ;; 02:522d ????????
    db   $ff, $cd, $2e, $1d, $d1, $12, $13, $d5        ;; 02:5235 ????????
    db   $16, $ff, $cd, $2e, $1d, $d1, $12, $13        ;; 02:523d ????????
    db   $21, $80, $de, $cd, $6c, $1f, $21, $80        ;; 02:5245 ????????
    db   $de, $06, $08, $2a, $2f, $b6, $23, $12        ;; 02:524d ????????
    db   $13, $05, $20, $f7, $06, $08, $21, $90        ;; 02:5255 ????????
    db   $de, $11, $a0, $de, $1a, $13, $4f, $7e        ;; 02:525d ????????
    db   $2f, $a1, $2f, $22, $7e, $a1, $22, $05        ;; 02:5265 ????????
    db   $20, $f2, $fa, $10, $de, $a7, $20, $14        ;; 02:526d ????????
    db   $01, $44, $48, $f2, $b8, $38, $0d, $f0        ;; 02:5275 ????????
    db   $42, $fe, $f8, $28, $02, $3e, $f9, $3d        ;; 02:527d ????????
    db   $e0, $42, $18, $04, $af, $ea, $10, $de        ;; 02:5285 ????????
    db   $21, $90, $de, $d1, $01, $10, $00, $cd        ;; 02:528d ????????
    db   $ff, $20, $21, $11, $de, $35, $c2, $17        ;; 02:5295 ????????
    db   $52, $c9                                      ;; 02:529d ??

call_02_529f:
    ld   B, A                                          ;; 02:529f $47
    ld   HL, wCC51                                     ;; 02:52a0 $21 $51 $cc
    rst  add_hl_a                                      ;; 02:52a3 $c7
    ld   DE, wDE17                                     ;; 02:52a4 $11 $17 $de
    ld   A, [HL]                                       ;; 02:52a7 $7e
    swap A                                             ;; 02:52a8 $cb $37
    and  A, $0f                                        ;; 02:52aa $e6 $0f
    inc  A                                             ;; 02:52ac $3c
    ld   [DE], A                                       ;; 02:52ad $12
    inc  DE                                            ;; 02:52ae $13
    ld   A, [HL]                                       ;; 02:52af $7e
    and  A, $0f                                        ;; 02:52b0 $e6 $0f
    inc  A                                             ;; 02:52b2 $3c
    ld   [DE], A                                       ;; 02:52b3 $12
    inc  DE                                            ;; 02:52b4 $13
    ld   A, B                                          ;; 02:52b5 $78
    ld   HL, wCC41                                     ;; 02:52b6 $21 $41 $cc
    add  A, A                                          ;; 02:52b9 $87
    rst  add_hl_a                                      ;; 02:52ba $c7
    ld   A, [HL+]                                      ;; 02:52bb $2a
    ld   [DE], A                                       ;; 02:52bc $12
    inc  DE                                            ;; 02:52bd $13
    ld   A, [HL]                                       ;; 02:52be $7e
    ld   [DE], A                                       ;; 02:52bf $12
    ret                                                ;; 02:52c0 $c9

call_02_52c1:
    ld   HL, wDE17                                     ;; 02:52c1 $21 $17 $de
    ld   A, [HL+]                                      ;; 02:52c4 $2a
    ld   C, A                                          ;; 02:52c5 $4f
    ld   A, [HL+]                                      ;; 02:52c6 $2a
    ld   B, A                                          ;; 02:52c7 $47
    call call_02_52dd                                  ;; 02:52c8 $cd $dd $52
.jr_02_52cb:
    push BC                                            ;; 02:52cb $c5
    push HL                                            ;; 02:52cc $e5
    ld   B, $00                                        ;; 02:52cd $06 $00
    ld   A, $ff                                        ;; 02:52cf $3e $ff
    call call_00_218f                                  ;; 02:52d1 $cd $8f $21
    pop  HL                                            ;; 02:52d4 $e1
    ld   A, $20                                        ;; 02:52d5 $3e $20
    rst  add_hl_a                                      ;; 02:52d7 $c7
    pop  BC                                            ;; 02:52d8 $c1
    dec  B                                             ;; 02:52d9 $05
    jr   NZ, .jr_02_52cb                               ;; 02:52da $20 $ef
    ret                                                ;; 02:52dc $c9

call_02_52dd:
    push BC                                            ;; 02:52dd $c5
    push DE                                            ;; 02:52de $d5
    ld   A, [HL+]                                      ;; 02:52df $2a
    ld   B, [HL]                                       ;; 02:52e0 $46
    ld   HL, $9800                                     ;; 02:52e1 $21 $00 $98
    rst  add_hl_a                                      ;; 02:52e4 $c7
    inc  B                                             ;; 02:52e5 $04
    ld   DE, $20                                       ;; 02:52e6 $11 $20 $00
.jr_02_52e9:
    dec  B                                             ;; 02:52e9 $05
    jr   Z, .jr_02_52ef                                ;; 02:52ea $28 $03
    add  HL, DE                                        ;; 02:52ec $19
    jr   .jr_02_52e9                                   ;; 02:52ed $18 $fa
.jr_02_52ef:
    pop  DE                                            ;; 02:52ef $d1
    pop  BC                                            ;; 02:52f0 $c1
    ret                                                ;; 02:52f1 $c9
    db   $21, $00, $98, $11, $00, $df, $01, $00        ;; 02:52f2 ????????
    db   $01, $c3, $ff, $20                            ;; 02:52fa ????

data_02_52fe:
    dw   `11111111                                     ;; 02:52fe $ff $00
    dw   `11111111                                     ;; 02:5300 $ff $00
    dw   `11111111                                     ;; 02:5302 $ff $00
    dw   `11111111                                     ;; 02:5304 $ff $00
    dw   `11111111                                     ;; 02:5306 $ff $00
    dw   `11111111                                     ;; 02:5308 $ff $00
    dw   `11111111                                     ;; 02:530a $ff $00
    dw   `11111111                                     ;; 02:530c $ff $00

    dw   `11111111                                     ;; 02:530e $ff $00
    dw   `11111111                                     ;; 02:5310 $ff $00
    dw   `11111111                                     ;; 02:5312 $ff $00
    dw   `00000000                                     ;; 02:5314 $00 $00
    dw   `11111111                                     ;; 02:5316 $ff $00
    dw   `11111111                                     ;; 02:5318 $ff $00
    dw   `11111111                                     ;; 02:531a $ff $00
    dw   `11111111                                     ;; 02:531c $ff $00

    dw   `11111111                                     ;; 02:531e $ff $00
    dw   `00000000                                     ;; 02:5320 $00 $00
    dw   `11111111                                     ;; 02:5322 $ff $00
    dw   `11111111                                     ;; 02:5324 $ff $00
    dw   `11111111                                     ;; 02:5326 $ff $00
    dw   `00000000                                     ;; 02:5328 $00 $00
    dw   `11111111                                     ;; 02:532a $ff $00
    dw   `11111111                                     ;; 02:532c $ff $00

    dw   `00000000                                     ;; 02:532e $00 $00
    dw   `11111111                                     ;; 02:5330 $ff $00
    dw   `11111111                                     ;; 02:5332 $ff $00
    dw   `00000000                                     ;; 02:5334 $00 $00
    dw   `11111111                                     ;; 02:5336 $ff $00
    dw   `00000000                                     ;; 02:5338 $00 $00
    dw   `11111111                                     ;; 02:533a $ff $00
    dw   `11111111                                     ;; 02:533c $ff $00

    dw   `11111111                                     ;; 02:533e $ff $00
    dw   `00000000                                     ;; 02:5340 $00 $00
    dw   `11111111                                     ;; 02:5342 $ff $00
    dw   `00000000                                     ;; 02:5344 $00 $00
    dw   `11111111                                     ;; 02:5346 $ff $00
    dw   `00000000                                     ;; 02:5348 $00 $00
    dw   `11111111                                     ;; 02:534a $ff $00
    dw   `00000000                                     ;; 02:534c $00 $00

    dw   `00000000                                     ;; 02:534e $00 $00
    dw   `00000000                                     ;; 02:5350 $00 $00
    dw   `11111111                                     ;; 02:5352 $ff $00
    dw   `00000000                                     ;; 02:5354 $00 $00
    dw   `11111111                                     ;; 02:5356 $ff $00
    dw   `00000000                                     ;; 02:5358 $00 $00
    dw   `00000000                                     ;; 02:535a $00 $00
    dw   `11111111                                     ;; 02:535c $ff $00

    dw   `00000000                                     ;; 02:535e $00 $00
    dw   `11111111                                     ;; 02:5360 $ff $00
    dw   `00000000                                     ;; 02:5362 $00 $00
    dw   `00000000                                     ;; 02:5364 $00 $00
    dw   `00000000                                     ;; 02:5366 $00 $00
    dw   `11111111                                     ;; 02:5368 $ff $00
    dw   `00000000                                     ;; 02:536a $00 $00
    dw   `00000000                                     ;; 02:536c $00 $00

    dw   `00000000                                     ;; 02:536e $00 $00
    dw   `00000000                                     ;; 02:5370 $00 $00
    dw   `00000000                                     ;; 02:5372 $00 $00
    dw   `11111111                                     ;; 02:5374 $ff $00
    dw   `00000000                                     ;; 02:5376 $00 $00
    dw   `00000000                                     ;; 02:5378 $00 $00
    dw   `00000000                                     ;; 02:537a $00 $00
    dw   `00000000                                     ;; 02:537c $00 $00

    db   $00, $00, $02, $00, $20, $00, $00, $00        ;; 02:537e ????????
    db   $00, $00, $10, $00, $00, $00, $81, $00        ;; 02:5386 ????????
    db   $40, $00, $11, $00, $02, $00, $40, $00        ;; 02:538e ????????
    db   $10, $00, $04, $00, $20, $00, $01, $00        ;; 02:5396 ????????
    db   $02, $00, $20, $00, $00, $00, $8a, $00        ;; 02:539e ????????
    db   $21, $00, $04, $00, $52, $00, $24, $00        ;; 02:53a6 ????????
    db   $68, $00, $25, $00, $90, $00, $55, $00        ;; 02:53ae ????????
    db   $68, $00, $93, $00, $4c, $00, $b3, $00        ;; 02:53b6 ????????
    db   $6b, $00, $55, $00, $0a, $00, $dc, $00        ;; 02:53be ????????
    db   $73, $00, $ce, $00, $36, $00, $55, $00        ;; 02:53c6 ????????
    db   $bb, $00, $ef, $00, $f7, $00, $dd, $00        ;; 02:53ce ????????
    db   $b7, $00, $fe, $00, $b7, $00, $dd, $00        ;; 02:53d6 ????????
    db   $f7, $00, $ff, $00, $ff, $00, $dd, $00        ;; 02:53de ????????
    db   $ff, $00, $77, $00, $df, $00, $ff, $00        ;; 02:53e6 ????????

data_02_53ee:
    db   $ce, $54, $cf, $54, $da, $54, $f0, $54        ;; 02:53ee ??..????
    db   $fe, $54, $07, $55, $18, $55, $23, $55        ;; 02:53f6 ??????..
    db   $2d, $55, $38, $55, $4f, $55, $63, $55        ;; 02:53fe ????????
    db   $0e, $5a, $6d, $55, $77, $55, $86, $55        ;; 02:5406 ??..????
    db   $8c, $55, $a5, $55, $b7, $55, $c1, $55        ;; 02:540e ????????
    db   $d5, $55, $ed, $55, $fa, $55, $00, $56        ;; 02:5416 ????????
    db   $0c, $56, $12, $56, $1e, $56, $26, $56        ;; 02:541e ????????
    db   $30, $56, $42, $56, $55, $56, $6a, $56        ;; 02:5426 ????????
    db   $7d, $56, $96, $56, $9d, $56, $a5, $56        ;; 02:542e ????????
    db   $b9, $56, $c4, $56, $d4, $56, $e1, $56        ;; 02:5436 ????????
    db   $e3, $56, $e6, $56, $ed, $56, $fa, $56        ;; 02:543e ????????
    db   $02, $57, $09, $57, $12, $57, $28, $57        ;; 02:5446 ????????
    db   $40, $57, $57, $57, $77, $57, $82, $57        ;; 02:544e ????????
    db   $92, $57, $98, $57, $a5, $57, $b0, $57        ;; 02:5456 ????????
    db   $bb, $57, $cc, $57, $dd, $57, $f2, $57        ;; 02:545e ????????
    db   $fe, $57, $04, $58, $0e, $58, $1e, $58        ;; 02:5466 ????????
    db   $37, $58, $5a, $58, $5c, $58, $6d, $58        ;; 02:546e ????????
    db   $79, $58, $7b, $58, $86, $58, $9f, $58        ;; 02:5476 ????????
    db   $b8, $58, $c9, $58, $d8, $58, $dc, $58        ;; 02:547e ????????
    db   $e0, $58, $eb, $58, $f3, $58, $06, $59        ;; 02:5486 ????????
    db   $0d, $59, $18, $59, $29, $59, $38, $59        ;; 02:548e ????????
    db   $43, $59, $5a, $59, $67, $59, $71, $59        ;; 02:5496 ????????
    db   $82, $59, $93, $59, $a6, $59, $b9, $59        ;; 02:549e ????????
    db   $d0, $59, $dd, $59, $e9, $59, $ea, $59        ;; 02:54a6 ????????
    db   $f5, $59, $f7, $59, $fd, $59, $17, $5a        ;; 02:54ae ??....??
    db   $2f, $5a, $3a, $5a, $47, $5a, $66, $5a        ;; 02:54b6 ????????
    db   $74, $5a, $76, $5a, $81, $5a, $84, $5a        ;; 02:54be ????????
    db   $86, $5a, $88, $5a, $8c, $5a, $8e, $5a        ;; 02:54c6 ????????
    db   $ff, $01, $43, $00, $44, $00, $45, $01        ;; 02:54ce ?.w.w.w.
    db   $46, $01, $47, $ff, $01, $43, $00, $44        ;; 02:54d6 w.w.????
    db   $00, $45, $01, $46, $aa, $00, $1c, $00        ;; 02:54de ????????
    db   $1d, $00, $1c, $00, $1d, $00, $1c, $00        ;; 02:54e6 ????????
    db   $1d, $ff, $01, $48, $00, $49, $00, $4a        ;; 02:54ee ????????
    db   $01, $4b, $00, $4c, $90, $01, $0f, $ff        ;; 02:54f6 ????????
    db   $01, $4d, $00, $4e, $01, $4f, $02, $50        ;; 02:54fe ????????
    db   $ff, $01, $4d, $00, $4e, $01, $4f, $02        ;; 02:5506 ????????
    db   $50, $11, $4d, $10, $4e, $11, $4f, $12        ;; 02:550e ????????
    db   $50, $ff, $01, $51, $00, $52, $00, $53        ;; 02:5516 ????????
    db   $01, $54, $00, $55, $ff, $01, $56, $01        ;; 02:551e ?????.w.
    db   $57, $b2, $00, $7e, $30, $7e, $ff, $00        ;; 02:5526 w..w.w.?
    db   $58, $00, $59, $00, $1e, $00, $58, $00        ;; 02:552e ????????
    db   $59, $ff, $00, $58, $00, $59, $00, $1e        ;; 02:5536 ????????
    db   $10, $58, $10, $59, $00, $1e, $00, $58        ;; 02:553e ????????
    db   $00, $59, $00, $1e, $10, $58, $10, $59        ;; 02:5546 ????????
    db   $ff, $00, $58, $00, $59, $00, $1e, $00        ;; 02:554e ????????
    db   $58, $00, $59, $00, $1e, $93, $00, $11        ;; 02:5556 ????????
    db   $00, $1e, $00, $12, $ff, $01, $5a, $01        ;; 02:555e ????????
    db   $5b, $b2, $00, $7e, $30, $7e, $ff, $01        ;; 02:5566 ???????.
    db   $5c, $01, $5d, $b2, $00, $7e, $30, $7e        ;; 02:556e w.w..w.w
    db   $ff, $b2, $00, $06, $00, $07, $00, $08        ;; 02:5576 .???????
    db   $00, $09, $01, $0a, $80, $02, $24, $ff        ;; 02:557e ????????
    db   $b2, $01, $04, $02, $05, $ff, $b2, $00        ;; 02:5586 ????????
    db   $06, $00, $07, $00, $08, $00, $09, $01        ;; 02:558e ????????
    db   $0a, $80, $00, $1f, $00, $20, $00, $21        ;; 02:5596 ????????
    db   $00, $22, $00, $1f, $00, $20, $ff, $00        ;; 02:559e ????????
    db   $0b, $00, $0c, $00, $0d, $00, $0e, $00        ;; 02:55a6 ????????
    db   $1e, $90, $00, $0f, $00, $1e, $00, $0f        ;; 02:55ae ????????
    db   $ff, $01, $86, $01, $87, $b2, $01, $04        ;; 02:55b6 ????????
    db   $02, $05, $ff, $01, $86, $01, $87, $b2        ;; 02:55be ????????
    db   $01, $04, $01, $05, $80, $11, $86, $11        ;; 02:55c6 ????????
    db   $87, $b2, $11, $04, $11, $05, $ff, $01        ;; 02:55ce ????????
    db   $86, $01, $87, $00, $1e, $11, $86, $11        ;; 02:55d6 ????????
    db   $87, $aa, $00, $1c, $00, $1d, $00, $1c        ;; 02:55de ????????
    db   $00, $1d, $00, $1c, $00, $1d, $ff, $10        ;; 02:55e6 ????????
    db   $23, $00, $23, $10, $23, $00, $23, $10        ;; 02:55ee ????????
    db   $23, $00, $23, $ff, $01, $76, $b2, $01        ;; 02:55f6 ????????
    db   $7e, $ff, $01, $76, $11, $76, $b2, $00        ;; 02:55fe ????????
    db   $7f, $00, $80, $00, $81, $ff, $01, $7d        ;; 02:5606 ????????
    db   $b2, $01, $7e, $ff, $01, $7d, $11, $7d        ;; 02:560e ????????
    db   $b2, $00, $7f, $00, $80, $00, $81, $ff        ;; 02:5616 ????????
    db   $b2, $00, $7f, $00, $80, $00, $81, $ff        ;; 02:561e ????????
    db   $b2, $00, $82, $00, $83, $00, $84, $00        ;; 02:5626 ????????
    db   $85, $ff, $b2, $00, $82, $00, $83, $00        ;; 02:562e ????????
    db   $84, $00, $85, $00, $82, $00, $83, $00        ;; 02:5636 ????????
    db   $84, $00, $85, $ff, $01, $f7, $01, $f8        ;; 02:563e ????????
    db   $01, $f9, $00, $ee, $00, $ef, $00, $f0        ;; 02:5646 ????????
    db   $00, $f1, $00, $f2, $00, $f3, $ff, $01        ;; 02:564e ????????
    db   $fa, $01, $fb, $01, $fc, $01, $fd, $00        ;; 02:5656 ????????
    db   $ee, $00, $ef, $00, $f0, $00, $f1, $00        ;; 02:565e ????????
    db   $f2, $00, $f3, $ff, $01, $f4, $01, $f5        ;; 02:5666 ????????
    db   $01, $f6, $00, $ee, $00, $ef, $00, $f0        ;; 02:566e ????????
    db   $00, $f1, $00, $f2, $00, $f3, $ff, $01        ;; 02:5676 ????????
    db   $88, $01, $89, $01, $8a, $97, $00, $13        ;; 02:567e ????????
    db   $00, $14, $80, $00, $ee, $00, $ef, $00        ;; 02:5686 ????????
    db   $f0, $00, $f1, $00, $f2, $00, $f3, $ff        ;; 02:568e ????????
    db   $01, $47, $00, $1e, $11, $47, $ff, $01        ;; 02:5696 ????????
    db   $61, $01, $62, $b2, $01, $7f, $ff, $00        ;; 02:569e ????????
    db   $63, $00, $64, $10, $63, $10, $64, $a0        ;; 02:56a6 ????????
    db   $00, $17, $00, $18, $00, $19, $00, $1e        ;; 02:56ae ????????
    db   $00, $19, $ff, $01, $65, $01, $66, $00        ;; 02:56b6 ????????
    db   $67, $00, $68, $02, $69, $ff, $00, $6a        ;; 02:56be ????????
    db   $00, $6b, $00, $6c, $00, $6d, $00, $6e        ;; 02:56c6 ????????
    db   $00, $6f, $b2, $00, $7e, $ff, $01, $70        ;; 02:56ce ????????
    db   $01, $71, $01, $72, $01, $73, $01, $74        ;; 02:56d6 ????????
    db   $02, $75, $ff, $4d, $ff, $44, $4b, $ff        ;; 02:56de ????????
    db   $01, $5e, $01, $5f, $01, $60, $ff, $01        ;; 02:56e6 ????????
    db   $5e, $01, $5f, $01, $60, $01, $5e, $01        ;; 02:56ee ????????
    db   $5f, $01, $60, $ff, $01, $63, $01, $64        ;; 02:56f6 ????????
    db   $b2, $00, $7e, $ff, $01, $92, $01, $93        ;; 02:56fe ????????
    db   $01, $94, $ff, $01, $3f, $01, $40, $02        ;; 02:5706 ????????
    db   $41, $03, $42, $ff, $00, $ee, $00, $ef        ;; 02:570e ????????
    db   $00, $f0, $00, $f1, $00, $f2, $00, $f3        ;; 02:5716 ????????
    db   $00, $1e, $90, $00, $0f, $00, $1e, $00        ;; 02:571e ????????
    db   $0f, $ff, $00, $95, $00, $96, $00, $97        ;; 02:5726 ????????
    db   $00, $95, $00, $96, $00, $97, $00, $95        ;; 02:572e ????????
    db   $00, $96, $00, $97, $b2, $00, $04, $01        ;; 02:5736 ????????
    db   $05, $ff, $00, $98, $00, $99, $00, $9a        ;; 02:573e ????????
    db   $00, $9b, $00, $9c, $00, $9d, $00, $9e        ;; 02:5746 ????????
    db   $00, $9f, $00, $a0, $00, $a1, $02, $a2        ;; 02:574e ????????
    db   $ff, $00, $a3, $00, $a4, $00, $a5, $00        ;; 02:5756 ????????
    db   $a6, $00, $a7, $00, $a8, $00, $a9, $00        ;; 02:575e ????????
    db   $aa, $00, $ab, $00, $ac, $00, $ad, $00        ;; 02:5766 ????????
    db   $1e, $90, $00, $0f, $00, $1e, $00, $0f        ;; 02:576e ????????
    db   $ff, $01, $ae, $01, $af, $01, $b0, $01        ;; 02:5776 ????????
    db   $b1, $01, $b2, $ff, $01, $ae, $01, $af        ;; 02:577e ????????
    db   $01, $b0, $01, $b1, $01, $b2, $9f, $01        ;; 02:5786 ????????
    db   $1a, $02, $1b, $ff, $01, $b3, $b2, $00        ;; 02:578e ????????
    db   $7e, $ff, $00, $b5, $00, $b6, $00, $b7        ;; 02:5796 ????????
    db   $00, $b8, $00, $b9, $00, $ba, $ff, $01        ;; 02:579e ????????
    db   $d5, $01, $1e, $01, $d5, $01, $1e, $02        ;; 02:57a6 ????????
    db   $d5, $ff, $01, $d6, $01, $1e, $01, $d6        ;; 02:57ae ????????
    db   $01, $1e, $02, $d6, $ff, $01, $77, $01        ;; 02:57b6 ????????
    db   $78, $01, $79, $01, $7a, $01, $7b, $01        ;; 02:57be ????????
    db   $7c, $01, $78, $01, $79, $ff, $01, $4d        ;; 02:57c6 ????????
    db   $00, $4e, $00, $4f, $01, $50, $10, $4d        ;; 02:57ce ????????
    db   $10, $4e, $10, $4f, $11, $50, $ff, $01        ;; 02:57d6 ????????
    db   $43, $00, $44, $00, $45, $00, $46, $00        ;; 02:57de ????????
    db   $47, $10, $43, $10, $44, $10, $45, $10        ;; 02:57e6 ????????
    db   $46, $11, $47, $ff, $01, $7d, $b2, $00        ;; 02:57ee ????????
    db   $7e, $80, $01, $7d, $b2, $00, $7e, $ff        ;; 02:57f6 ????????
    db   $01, $b4, $b2, $00, $82, $ff, $01, $b3        ;; 02:57fe ????????
    db   $01, $b4, $b2, $00, $82, $10, $82, $ff        ;; 02:5806 ????????
    db   $01, $bb, $01, $bc, $01, $bb, $01, $bc        ;; 02:580e ????????
    db   $b2, $00, $82, $00, $83, $00, $84, $ff        ;; 02:5816 ????????
    db   $01, $8b, $01, $8c, $01, $8d, $97, $00        ;; 02:581e ????????
    db   $13, $00, $14, $80, $00, $ee, $00, $ef        ;; 02:5826 ????????
    db   $00, $f0, $00, $f1, $00, $f2, $00, $f3        ;; 02:582e ????????
    db   $ff, $01, $8e, $01, $8f, $01, $90, $01        ;; 02:5836 ????????
    db   $91, $01, $8e, $01, $8f, $01, $90, $01        ;; 02:583e ????????
    db   $91, $97, $01, $13, $01, $14, $80, $00        ;; 02:5846 ????????
    db   $ee, $00, $ef, $00, $f0, $00, $f1, $00        ;; 02:584e ????????
    db   $f2, $00, $f3, $ff, $43, $ff, $00, $bd        ;; 02:5856 ????????
    db   $00, $be, $00, $bd, $00, $be, $00, $bd        ;; 02:585e ????????
    db   $00, $be, $00, $bd, $00, $be, $ff, $9f        ;; 02:5866 ????????
    db   $00, $15, $10, $15, $01, $16, $01, $1a        ;; 02:586e ????????
    db   $02, $1b, $ff, $4a, $ff, $01, $bf, $01        ;; 02:5876 ????????
    db   $c0, $01, $c1, $01, $c2, $01, $c3, $ff        ;; 02:587e ????????
    db   $00, $37, $00, $38, $00, $39, $00, $3a        ;; 02:5886 ????????
    db   $00, $37, $00, $38, $00, $39, $00, $3a        ;; 02:588e ????????
    db   $00, $37, $00, $38, $00, $39, $00, $3a        ;; 02:5896 ????????
    db   $ff, $00, $3b, $00, $3c, $00, $3d, $00        ;; 02:589e ????????
    db   $3e, $00, $3b, $00, $3c, $00, $3d, $00        ;; 02:58a6 ????????
    db   $3e, $00, $3b, $00, $3c, $00, $3d, $00        ;; 02:58ae ????????
    db   $3e, $ff, $9f, $00, $15, $10, $15, $00        ;; 02:58b6 ????????
    db   $16, $10, $16, $80, $10, $d6, $00, $1e        ;; 02:58be ????????
    db   $11, $d6, $ff, $11, $d6, $00, $1e, $11        ;; 02:58c6 ????????
    db   $d6, $00, $1e, $11, $d6, $00, $1e, $12        ;; 02:58ce ????????
    db   $d6, $ff, $44, $12, $d6, $ff, $42, $12        ;; 02:58d6 ????????
    db   $d6, $ff, $00, $25, $00, $1e, $01, $25        ;; 02:58de ????????
    db   $00, $1e, $02, $25, $ff, $44, $00, $1e        ;; 02:58e6 ????????
    db   $44, $00, $1e, $44, $ff, $44, $90, $00        ;; 02:58ee ????????
    db   $00, $00, $01, $00, $02, $00, $03, $00        ;; 02:58f6 ????????
    db   $00, $00, $01, $00, $02, $00, $03, $ff        ;; 02:58fe ????????
    db   $01, $c9, $01, $ca, $03, $cb, $ff, $01        ;; 02:5906 ????????
    db   $24, $00, $1e, $01, $24, $00, $1e, $02        ;; 02:590e ????????
    db   $24, $ff, $9f, $00, $15, $10, $15, $00        ;; 02:5916 ????????
    db   $16, $10, $16, $80, $01, $24, $00, $1e        ;; 02:591e ????????
    db   $02, $24, $ff, $b2, $00, $7f, $00, $80        ;; 02:5926 ????????
    db   $00, $81, $80, $01, $24, $00, $1e, $02        ;; 02:592e ????????
    db   $24, $ff, $01, $d5, $00, $1e, $01, $d5        ;; 02:5936 ????????
    db   $00, $1e, $02, $d5, $ff, $01, $cc, $01        ;; 02:593e ????????
    db   $cd, $01, $ce, $01, $cf, $01, $d0, $01        ;; 02:5946 ????????
    db   $d1, $01, $d2, $01, $d3, $02, $d5, $00        ;; 02:594e ????????
    db   $1e, $02, $d5, $ff, $b2, $00, $7f, $00        ;; 02:5956 ????????
    db   $80, $93, $00, $11, $00, $1e, $00, $12        ;; 02:595e ????????
    db   $ff, $01, $d5, $93, $00, $11, $00, $1e        ;; 02:5966 ????????
    db   $00, $12, $ff, $01, $da, $01, $db, $01        ;; 02:596e ????????
    db   $da, $01, $db, $01, $da, $01, $db, $01        ;; 02:5976 ????????
    db   $da, $01, $db, $ff, $01, $cc, $01, $cd        ;; 02:597e ????????
    db   $01, $ce, $01, $cf, $01, $d0, $01, $d1        ;; 02:5986 ????????
    db   $01, $d2, $01, $d3, $ff, $9f, $00, $15        ;; 02:598e ????????
    db   $10, $15, $00, $16, $10, $16, $80, $00        ;; 02:5996 ????????
    db   $1f, $00, $20, $00, $21, $00, $22, $ff        ;; 02:599e ????????
    db   $01, $dc, $01, $dd, $01, $de, $01, $df        ;; 02:59a6 ????????
    db   $01, $e0, $01, $e1, $01, $e2, $01, $e3        ;; 02:59ae ????????
    db   $01, $e4, $ff, $01, $e5, $00, $e6, $00        ;; 02:59b6 ????????
    db   $e7, $00, $e8, $00, $e9, $00, $ea, $01        ;; 02:59be ????????
    db   $eb, $00, $1e, $01, $eb, $00, $1e, $02        ;; 02:59c6 ????????
    db   $eb, $ff, $01, $ec, $01, $ed, $01, $ec        ;; 02:59ce ????????
    db   $01, $ed, $01, $ec, $01, $ed, $ff, $01        ;; 02:59d6 ????????
    db   $5e, $01, $5f, $a0, $00, $17, $00, $18        ;; 02:59de ????????
    db   $01, $19, $ff, $ff, $00, $c4, $00, $c5        ;; 02:59e6 ????????
    db   $00, $c6, $01, $c7, $02, $c8, $ff, $42        ;; 02:59ee ????????
    db   $ff, $9f, $01, $1a, $02, $1b, $ff, $00        ;; 02:59f6 ?..w.w..
    db   $23, $10, $23, $00, $23, $10, $23, $00        ;; 02:59fe w.w.w.w.
    db   $23, $10, $23, $00, $23, $10, $23, $ff        ;; 02:5a06 w.w.w.w.
    db   $01, $5c, $01, $5d, $b2, $00, $7e, $30        ;; 02:5a0e ????????
    db   $7e, $a0, $00, $17, $00, $18, $00, $19        ;; 02:5a16 ????????
    db   $00, $1e, $01, $19, $10, $1e, $10, $17        ;; 02:5a1e ????????
    db   $10, $18, $11, $19, $10, $1e, $12, $19        ;; 02:5a26 ????????
    db   $ff, $00, $26, $00, $27, $00, $28, $00        ;; 02:5a2e ????????
    db   $27, $00, $26, $ff, $03, $29, $02, $2a        ;; 02:5a36 ????????
    db   $01, $2b, $00, $2c, $01, $2d, $01, $2e        ;; 02:5a3e ????????
    db   $ff, $00, $2f, $00, $30, $00, $2f, $00        ;; 02:5a46 ????????
    db   $30, $00, $31, $00, $32, $00, $31, $00        ;; 02:5a4e ????????
    db   $32, $00, $2f, $00, $30, $00, $2f, $00        ;; 02:5a56 ????????
    db   $30, $00, $31, $00, $32, $00, $31, $ff        ;; 02:5a5e ????????
    db   $aa, $00, $1c, $00, $1d, $00, $1c, $00        ;; 02:5a66 ????????
    db   $1d, $00, $1c, $00, $1d, $ff, $4c, $ff        ;; 02:5a6e ????????
    db   $01, $d6, $00, $1e, $01, $d6, $00, $1e        ;; 02:5a76 ????????
    db   $02, $d6, $ff, $45, $42, $ff, $46, $ff        ;; 02:5a7e ????????
    db   $47, $ff, $48, $44, $44, $ff, $49, $ff        ;; 02:5a86 ????????
    db   $01, $d7, $01, $d8, $01, $d9, $ff             ;; 02:5a8e ???????

data_02_5a95:
    db   $91, $5c, $9a, $5c, $a7, $5c, $b7, $5c        ;; 02:5a95 ????????
    db   $c3, $5c, $c6, $5c, $ca, $5c, $ce, $5c        ;; 02:5a9d ????????
    db   $d5, $5c, $df, $5c, $ec, $5c, $f8, $5c        ;; 02:5aa5 ????????
    db   $fb, $5c, $fe, $5c, $04, $5d, $0a, $5d        ;; 02:5aad ????????
    db   $14, $5d, $18, $5d, $2a, $5d, $39, $5d        ;; 02:5ab5 ????????
    db   $43, $5d, $4e, $5d, $5d, $5d, $69, $5d        ;; 02:5abd ????????
    db   $6c, $5d, $71, $5d, $7d, $5d, $81, $5d        ;; 02:5ac5 ????....
    db   $8b, $5d, $95, $5d, $a0, $5d, $a1, $5d        ;; 02:5acd ????????
    db   $b2, $5d, $c2, $5d, $d2, $5d, $e2, $5d        ;; 02:5ad5 ??????..
    db   $f0, $5d, $fa, $5d, $fe, $5d, $03, $5e        ;; 02:5add ????????
    db   $09, $5e, $0d, $5e, $12, $5e, $1b, $5e        ;; 02:5ae5 ????????
    db   $27, $5e, $36, $5e, $c6, $5c, $41, $5e        ;; 02:5aed ????????
    db   $4a, $5e, $53, $5e, $5e, $5e, $69, $5e        ;; 02:5af5 ????????
    db   $70, $5e, $73, $5e, $77, $5e, $82, $5e        ;; 02:5afd ????????
    db   $91, $5e, $a0, $5e, $af, $5e, $c3, $5e        ;; 02:5b05 ????????
    db   $d6, $5e, $e5, $5e, $f8, $5e, $0c, $5f        ;; 02:5b0d ????????
    db   $13, $5f, $1e, $5f, $34, $5f, $4c, $5f        ;; 02:5b15 ??????..
    db   $54, $5f, $5a, $5f, $60, $5f, $67, $5f        ;; 02:5b1d ........
    db   $6d, $5f, $78, $5f, $82, $5f, $8c, $5f        ;; 02:5b25 ????????
    db   $97, $5f, $9e, $5f, $a1, $5f, $a4, $5f        ;; 02:5b2d ????????
    db   $a7, $5f, $ae, $5f, $b5, $5f, $bb, $5f        ;; 02:5b35 ????????
    db   $c4, $5f, $cb, $5f, $d2, $5f, $d7, $5f        ;; 02:5b3d ????....
    db   $df, $5f, $e7, $5f, $ef, $5f, $fb, $5f        ;; 02:5b45 ????????
    db   $06, $60, $12, $60, $1e, $60, $29, $60        ;; 02:5b4d ....????
    db   $33, $60, $3a, $60, $42, $60, $4a, $60        ;; 02:5b55 ????????
    db   $54, $60, $5b, $60, $62, $60, $69, $60        ;; 02:5b5d ????????
    db   $72, $60, $7c, $60, $82, $60, $85, $60        ;; 02:5b65 ????????
    db   $88, $60, $8c, $60, $8f, $60, $92, $60        ;; 02:5b6d ????????
    db   $96, $60, $9a, $60, $a0, $60, $a8, $60        ;; 02:5b75 ????????
    db   $b2, $60, $be, $60, $c8, $60, $c8, $60        ;; 02:5b7d ????????
    db   $cc, $60, $d3, $60, $d9, $60, $df, $60        ;; 02:5b85 ????????
    db   $e6, $60, $c3, $5c, $c3, $5c, $ed, $60        ;; 02:5b8d ????..??
    db   $f5, $60, $fe, $60, $08, $61, $15, $61        ;; 02:5b95 ????????
    db   $20, $61, $2c, $61, $82, $60, $c3, $5c        ;; 02:5b9d ????????
    db   $37, $61, $3a, $61, $40, $61, $49, $61        ;; 02:5ba5 ????????
    db   $4c, $61, $54, $61, $37, $61, $62, $61        ;; 02:5bad ????????
    db   $6c, $61, $7d, $61, $91, $61, $96, $61        ;; 02:5bb5 ????????
    db   $9a, $61, $c3, $5c, $9f, $61, $a2, $61        ;; 02:5bbd ????????
    db   $a5, $61, $a9, $61, $ad, $61, $b0, $61        ;; 02:5bc5 ????????
    db   $b3, $61, $b6, $61, $b3, $61, $b9, $61        ;; 02:5bcd ????????
    db   $bc, $61, $c0, $61, $c4, $61, $ca, $61        ;; 02:5bd5 ????????
    db   $cd, $61, $d0, $61, $d6, $61, $dc, $61        ;; 02:5bdd ????????
    db   $e5, $61, $ee, $61, $f7, $61, $fe, $61        ;; 02:5be5 ????????
    db   $05, $62, $09, $62, $0d, $62, $18, $62        ;; 02:5bed ????????
    db   $23, $62, $30, $62, $3f, $62, $c3, $5c        ;; 02:5bf5 ????????
    db   $48, $62, $50, $62, $56, $62, $5c, $62        ;; 02:5bfd ????????
    db   $67, $62, $71, $62, $80, $62, $90, $62        ;; 02:5c05 ????????
    db   $a4, $62, $b8, $62, $c3, $62, $ce, $62        ;; 02:5c0d ????????
    db   $d1, $62, $d8, $62, $e5, $62, $f1, $62        ;; 02:5c15 ????????
    db   $fa, $62, $06, $63, $10, $63, $21, $63        ;; 02:5c1d ????????
    db   $2c, $63, $36, $63, $3a, $63, $41, $63        ;; 02:5c25 ????????
    db   $4a, $63, $53, $63, $5d, $63, $64, $63        ;; 02:5c2d ????????
    db   $6b, $63, $73, $63, $7c, $63, $85, $63        ;; 02:5c35 ????????
    db   $8b, $63, $8e, $63, $98, $63, $a2, $63        ;; 02:5c3d ????????
    db   $b2, $63, $c2, $63, $d2, $63, $d9, $63        ;; 02:5c45 ????????
    db   $e0, $63, $e4, $63, $ea, $63, $f4, $63        ;; 02:5c4d ????????
    db   $01, $64, $0f, $64, $1c, $64, $26, $64        ;; 02:5c55 ????????
    db   $2d, $64, $32, $64, $36, $64, $3d, $64        ;; 02:5c5d ????????
    db   $47, $64, $53, $64, $61, $64, $71, $64        ;; 02:5c65 ????????
    db   $83, $64, $89, $64, $90, $64, $a1, $64        ;; 02:5c6d ????????
    db   $b1, $64, $c1, $64, $d1, $64, $e1, $64        ;; 02:5c75 ????????
    db   $ef, $64, $f7, $64, $fe, $64, $05, $65        ;; 02:5c7d ????????
    db   $08, $65, $0b, $65, $0e, $65, $11, $65        ;; 02:5c85 ????????
    db   $14, $65, $18, $65, $1f, $00, $20, $cd        ;; 02:5c8d ????????
    db   $00, $20, $c7, $00, $20, $c9, $00, $20        ;; 02:5c95 ????????
    db   $1f, $00, $20, $c8, $00, $20, $c2, $00        ;; 02:5c9d ????????
    db   $20, $c2, $1f, $00, $20, $c7, $00, $20        ;; 02:5ca5 ????????
    db   $c2, $00, $20, $c2, $00, $20, $c7, $00        ;; 02:5cad ????????
    db   $20, $1f, $c3, $00, $20, $1f, $00, $20        ;; 02:5cb5 ????????
    db   $c8, $00, $20, $c8, $00, $20, $ce, $00        ;; 02:5cbd ??????..
    db   $02, $ce, $04, $64, $ce, $1f, $00, $02        ;; 02:5cc5 ..??????
    db   $db, $1f, $04, $64, $c6, $00, $02, $d3        ;; 02:5ccd ????????
    db   $1f, $04, $64, $c6, $04, $64, $c9, $00        ;; 02:5cd5 ????????
    db   $02, $c8, $1f, $04, $64, $c6, $04, $64        ;; 02:5cdd ????????
    db   $c9, $04, $64, $c2, $00, $02, $c4, $1f        ;; 02:5ce5 ????????
    db   $04, $64, $c6, $04, $64, $c9, $04, $64        ;; 02:5ced ????????
    db   $c2, $04, $64, $da, $02, $04, $da, $00        ;; 02:5cf5 ????????
    db   $60, $ce, $02, $04, $ca, $00, $60, $ce        ;; 02:5cfd ????????
    db   $00, $60, $ca, $00, $60, $c7, $02, $04        ;; 02:5d05 ????????
    db   $24, $22, $c8, $42, $44, $64, $62, $ce        ;; 02:5d0d ????????
    db   $00, $20, $ce, $22, $20, $c2, $00, $02        ;; 02:5d15 ????????
    db   $c2, $44, $46, $c2, $26, $24, $c2, $04        ;; 02:5d1d ????????
    db   $06, $c2, $40, $42, $c8, $c2, $00, $02        ;; 02:5d25 ????????
    db   $c6, $00, $02, $00, $02, $04, $06, $c6        ;; 02:5d2d ????????
    db   $04, $06, $04, $06, $c7, $00, $02, $04        ;; 02:5d35 ????????
    db   $06, $c8, $40, $42, $44, $46, $c7, $08        ;; 02:5d3d ????????
    db   $0a, $0c, $0e, $c8, $48, $4a, $4c, $4e        ;; 02:5d45 ????????
    db   $c7, $00, $c4, $00, $1f, $00, $c2, $00        ;; 02:5d4d ????????
    db   $c8, $40, $c2, $60, $1f, $40, $c4, $60        ;; 02:5d55 ????????
    db   $c7, $60, $c2, $40, $c3, $20, $40, $c3        ;; 02:5d5d ????????
    db   $20, $c2, $00, $c7, $c5, $00, $d8, $c5        ;; 02:5d65 ????????
    db   $00, $c4, $02, $d3, $c5, $00, $c2, $08        ;; 02:5d6d ????????
    db   $04, $02, $c9, $0a, $06, $c2, $0e, $0c        ;; 02:5d75 ????????
    db   $ce, $20, $40, $ce, $c7, $12, $14, $34        ;; 02:5d7d ........
    db   $32, $c8, $52, $54, $74, $72, $c7, $00        ;; 02:5d85 .......?
    db   $02, $66, $64, $c8, $04, $06, $62, $60        ;; 02:5d8d ????????
    db   $c7, $08, $0a, $6e, $6c, $c8, $0c, $0e        ;; 02:5d95 ????????
    db   $6a, $68, $c7, $de, $00, $60, $1f, $18        ;; 02:5d9d ????????
    db   $1a, $c7, $14, $16, $c2, $00, $20, $c7        ;; 02:5da5 ????????
    db   $18, $1a, $1f, $14, $16, $18, $1a, $1f        ;; 02:5dad ????????
    db   $14, $16, $c9, $00, $20, $18, $1a, $c7        ;; 02:5db5 ????????
    db   $14, $16, $00, $20, $1f, $14, $16, $1f        ;; 02:5dbd ????????
    db   $00, $20, $c9, $18, $1a, $14, $16, $00        ;; 02:5dc5 ????????
    db   $20, $c7, $18, $1a, $1f, $00, $20, $1f        ;; 02:5dcd ????????
    db   $18, $1a, $c9, $14, $16, $00, $20, $18        ;; 02:5dd5 ????????
    db   $1a, $c7, $14, $16, $1f, $c3, $00, $02        ;; 02:5ddd ?????...
    db   $c8, $04, $08, $0c, $10, $c8, $06, $0a        ;; 02:5de5 ........
    db   $0e, $12, $1f, $c7, $00, $02, $22, $20        ;; 02:5ded ...?????
    db   $c8, $40, $04, $24, $60, $ce, $00, $60        ;; 02:5df5 ????????
    db   $ce, $86, $00, $d2, $86, $00, $c6, $86        ;; 02:5dfd ????????
    db   $02, $c6, $86, $02, $cc, $86, $04, $cc        ;; 02:5e05 ????????
    db   $04, $64, $d3, $04, $64, $c8, $04, $64        ;; 02:5e0d ????????
    db   $c6, $04, $64, $c7, $04, $64, $c3, $04        ;; 02:5e15 ????????
    db   $64, $c7, $04, $64, $c6, $04, $64, $c6        ;; 02:5e1d ????????
    db   $04, $64, $1f, $04, $64, $1f, $04, $64        ;; 02:5e25 ????????
    db   $c9, $04, $64, $1f, $04, $64, $c6, $04        ;; 02:5e2d ????????
    db   $64, $c7, $00, $02, $22, $20, $c8, $40        ;; 02:5e35 ????????
    db   $42, $62, $60, $c7, $1f, $00, $c9, $20        ;; 02:5e3d ????????
    db   $c9, $40, $c2, $00, $c5, $1f, $60, $c9        ;; 02:5e45 ????????
    db   $00, $c9, $20, $c2, $40, $c5, $c2, $60        ;; 02:5e4d ????????
    db   $c7, $20, $1f, $20, $c7, $60, $c7, $00        ;; 02:5e55 ????????
    db   $1f, $c2, $40, $c7, $40, $1f, $60, $c7        ;; 02:5e5d ????????
    db   $00, $c7, $40, $1f, $c8, $02, $06, $c3        ;; 02:5e65 ????????
    db   $00, $c6, $04, $ce, $00, $20, $ce, $02        ;; 02:5e6d ????????
    db   $22, $ce, $c7, $04, $06, $26, $24, $c8        ;; 02:5e75 ????????
    db   $44, $46, $66, $64, $c7, $16, $18, $1a        ;; 02:5e7d ????????
    db   $1c, $16, $18, $c6, $16, $18, $1a, $1c        ;; 02:5e85 ????????
    db   $16, $18, $c6, $16, $18, $1a, $1c, $16        ;; 02:5e8d ????????
    db   $18, $1a, $c6, $18, $1a, $1c, $16, $18        ;; 02:5e95 ????????
    db   $1a, $c6, $18, $1a, $1c, $16, $18, $1a        ;; 02:5e9d ????????
    db   $1c, $c6, $1a, $1c, $16, $18, $1a, $1c        ;; 02:5ea5 ????????
    db   $c6, $1a, $1c, $16, $18, $1a, $1c, $16        ;; 02:5ead ????????
    db   $c6, $1c, $16, $18, $1a, $1c, $16, $c6        ;; 02:5eb5 ????????
    db   $1c, $16, $18, $1a, $1c, $16, $16, $02        ;; 02:5ebd ????????
    db   $22, $1c, $16, $18, $c6, $16, $18, $1a        ;; 02:5ec5 ????????
    db   $1c, $04, $06, $c6, $16, $18, $1a, $1c        ;; 02:5ecd ????????
    db   $16, $18, $04, $06, $16, $18, $1a, $c6        ;; 02:5ed5 ????????
    db   $18, $1a, $02, $22, $18, $1a, $c6, $18        ;; 02:5edd ????????
    db   $1a, $1c, $16, $18, $1a, $1c, $c6, $1a        ;; 02:5ee5 ????????
    db   $1c, $04, $06, $1a, $1c, $c6, $02, $22        ;; 02:5eed ????????
    db   $16, $18, $1a, $1c, $16, $18, $1a, $1c        ;; 02:5ef5 ????????
    db   $16, $c6, $1c, $16, $18, $1a, $02, $22        ;; 02:5efd ????????
    db   $c6, $04, $06, $18, $1a, $1c, $16, $c8        ;; 02:5f05 ????????
    db   $82, $00, $ca, $82, $60, $c8, $c7, $00        ;; 02:5f0d ????????
    db   $82, $02, $00, $c8, $60, $82, $62, $60        ;; 02:5f15 ????????
    db   $c7, $c2, $82, $02, $c2, $00, $02, $c2        ;; 02:5f1d ????????
    db   $02, $00, $c2, $82, $08, $c2, $60, $62        ;; 02:5f25 ????????
    db   $c2, $62, $60, $c2, $82, $62, $c2, $1f        ;; 02:5f2d ????????
    db   $02, $82, $06, $02, $1f, $02, $c4, $02        ;; 02:5f35 ????????
    db   $1f, $08, $82, $0a, $08, $1f, $62, $c4        ;; 02:5f3d ????????
    db   $62, $1f, $62, $82, $66, $62, $1f, $d0        ;; 02:5f45 ???????.
    db   $22, $20, $c3, $26, $c6, $24, $1f, $c9        ;; 02:5f4d ........
    db   $2a, $28, $ca, $2e, $2c, $c8, $08, $0a        ;; 02:5f55 ........
    db   $ca, $0c, $0e, $cd, $00, $02, $c6, $06        ;; 02:5f5d ........
    db   $c4, $04, $ce, $1a, $1c, $1e, $c2, $18        ;; 02:5f65 ........
    db   $ca, $2c, $30, $c3, $2c, $c4, $34, $1f        ;; 02:5f6d .???????
    db   $2e, $c4, $32, $c4, $36, $c4, $3a, $c6        ;; 02:5f75 ????????
    db   $38, $c3, $3e, $3c, $c8, $1f, $16, $c6        ;; 02:5f7d ????????
    db   $1a, $c4, $18, $c6, $1c, $1e, $c8, $c6        ;; 02:5f85 ????????
    db   $10, $0c, $c6, $0c, $c4, $0e, $1f, $14        ;; 02:5f8d ????????
    db   $c4, $12, $cd, $02, $04, $06, $c2, $00        ;; 02:5f95 ????????
    db   $cb, $ca, $06, $08, $cf, $06, $08, $d9        ;; 02:5f9d ????????
    db   $06, $08, $c9, $00, $02, $c9, $62, $04        ;; 02:5fa5 ????????
    db   $c8, $c4, $22, $20, $c9, $40, $42, $cd        ;; 02:5fad ????????
    db   $c8, $22, $20, $ca, $62, $60, $c8, $04        ;; 02:5fb5 ????????
    db   $06, $c2, $00, $02, $cb, $62, $60, $cf        ;; 02:5fbd ????????
    db   $04, $06, $c2, $04, $06, $c9, $c7, $04        ;; 02:5fc5 ????????
    db   $06, $cb, $04, $06, $c8, $c4, $04, $06        ;; 02:5fcd ?????...
    db   $cb, $10, $cd, $00, $02, $14, $c6, $12        ;; 02:5fd5 ........
    db   $c4, $16, $c9, $02, $c4, $00, $1f, $06        ;; 02:5fdd ...?????
    db   $c4, $04, $ce, $02, $c4, $00, $1f, $06        ;; 02:5fe5 ????????
    db   $c4, $04, $c8, $1a, $02, $c6, $02, $c4        ;; 02:5fed ????????
    db   $04, $1f, $00, $c4, $04, $1f, $1a, $02        ;; 02:5ff5 ????????
    db   $c6, $02, $c4, $04, $1f, $00, $c4, $04        ;; 02:5ffd ????????
    db   $c9, $c2, $16, $18, $c6, $02, $c4, $04        ;; 02:6005 ?.......
    db   $1f, $00, $c4, $04, $c7, $c6, $16, $18        ;; 02:600d ........
    db   $c6, $02, $c4, $04, $1f, $00, $c4, $04        ;; 02:6015 ........
    db   $c3, $1f, $82, $20, $82, $00, $d4, $82        ;; 02:601d .???????
    db   $60, $82, $40, $1f, $c7, $82, $20, $82        ;; 02:6025 ????????
    db   $00, $c8, $82, $60, $82, $40, $cc, $02        ;; 02:602d ????????
    db   $62, $c2, $02, $62, $cc, $c4, $06, $08        ;; 02:6035 ????????
    db   $c9, $04, $0a, $0c, $cc, $c7, $28, $26        ;; 02:603d ????????
    db   $ca, $2c, $2a, $24, $c8, $c4, $02, $00        ;; 02:6045 ????????
    db   $c3, $04, $c4, $06, $cb, $08, $0a, $cc        ;; 02:604d ????????
    db   $60, $22, $c6, $24, $c6, $26, $c9, $04        ;; 02:6055 ????????
    db   $c6, $06, $c6, $08, $c6, $c3, $02, $c6        ;; 02:605d ????????
    db   $06, $c6, $08, $cc, $c3, $00, $c4, $02        ;; 02:6065 ????????
    db   $c6, $06, $c6, $08, $c7, $c3, $00, $c4        ;; 02:606d ????????
    db   $00, $c4, $02, $c6, $06, $c6, $08, $c3        ;; 02:6075 ????????
    db   $00, $c4, $00, $c4, $00, $dc, $00, $02        ;; 02:607d ????????
    db   $d5, $22, $20, $ce, $62, $60, $ce, $cd        ;; 02:6085 ????????
    db   $40, $42, $d3, $00, $02, $d4, $22, $20        ;; 02:608d ????????
    db   $c8, $c2, $00, $02, $da, $c2, $2e, $c7        ;; 02:6095 ????????
    db   $00, $02, $d2, $c2, $2e, $c7, $0e, $c2        ;; 02:609d ????????
    db   $00, $02, $cf, $c2, $2e, $c7, $0e, $c2        ;; 02:60a5 ????????
    db   $2e, $c6, $00, $02, $c8, $c2, $2e, $c7        ;; 02:60ad ????????
    db   $0e, $c2, $2e, $c7, $0e, $c3, $00, $02        ;; 02:60b5 ????????
    db   $c3, $c2, $2e, $c7, $0e, $c2, $2e, $c7        ;; 02:60bd ????????
    db   $0e, $c4, $2e, $cf, $00, $02, $cd, $c7        ;; 02:60c5 ????????
    db   $22, $20, $c6, $10, $12, $cd, $c7, $10        ;; 02:60cd ????????
    db   $12, $c7, $00, $02, $d0, $10, $12, $22        ;; 02:60d5 ????????
    db   $20, $ca, $c9, $00, $02, $c7, $10, $12        ;; 02:60dd ????????
    db   $ca, $c9, $10, $12, $c2, $22, $20, $cf        ;; 02:60e5 ????????
    db   $00, $02, $ce, $00, $02, $c2, $00, $02        ;; 02:60ed ????????
    db   $c8, $00, $02, $cb, $00, $02, $1f, $00        ;; 02:60f5 ????????
    db   $02, $c4, $00, $02, $1f, $00, $02, $d2        ;; 02:60fd ????????
    db   $00, $02, $1f, $c4, $00, $02, $c2, $00        ;; 02:6105 ????????
    db   $02, $c9, $00, $02, $c6, $00, $02, $1f        ;; 02:610d ????????
    db   $c2, $00, $02, $cc, $00, $02, $00, $02        ;; 02:6115 ????????
    db   $00, $02, $c8, $c3, $00, $02, $c2, $00        ;; 02:611d ????????
    db   $02, $c6, $00, $02, $c8, $00, $02, $c6        ;; 02:6125 ????????
    db   $00, $02, $00, $02, $ca, $00, $02, $c6        ;; 02:612d ????????
    db   $00, $02, $da, $00, $20, $ce, $00, $20        ;; 02:6135 ????????
    db   $ca, $02, $22, $c2, $00, $20, $ca, $02        ;; 02:613d ????????
    db   $22, $ca, $02, $22, $d9, $00, $20, $cd        ;; 02:6145 ????????
    db   $00, $20, $ca, $02, $22, $00, $20, $1f        ;; 02:614d ????????
    db   $00, $20, $ca, $02, $22, $00, $20, $c8        ;; 02:6155 ????????
    db   $02, $22, $02, $22, $1f, $ce, $00, $20        ;; 02:615d ????????
    db   $c8, $00, $20, $02, $22, $00, $20, $c2        ;; 02:6165 ????????
    db   $00, $20, $c8, $00, $20, $02, $22, $00        ;; 02:616d ????????
    db   $20, $c6, $02, $22, $02, $22, $02, $22        ;; 02:6175 ????????
    db   $00, $20, $02, $22, $00, $20, $c6, $02        ;; 02:617d ????????
    db   $22, $02, $22, $02, $22, $c6, $02, $22        ;; 02:6185 ????????
    db   $02, $22, $02, $22, $d9, $60, $c2, $40        ;; 02:618d ????????
    db   $1f, $cd, $60, $c2, $40, $cd, $02, $62        ;; 02:6195 ????????
    db   $02, $62, $ce, $04, $06, $ce, $08, $0a        ;; 02:619d ????????
    db   $db, $0a, $0c, $1f, $db, $0e, $10, $1f        ;; 02:61a5 ????????
    db   $d4, $0a, $0c, $d4, $0e, $10, $d3, $0a        ;; 02:61ad ????????
    db   $0c, $d3, $0e, $10, $d3, $0e, $10, $ce        ;; 02:61b5 ????????
    db   $0a, $0c, $ce, $c4, $0e, $10, $d8, $c9        ;; 02:61bd ????????
    db   $00, $02, $c9, $62, $04, $da, $00, $20        ;; 02:61c5 ????????
    db   $da, $02, $22, $ce, $00, $20, $ca, $04        ;; 02:61cd ????????
    db   $24, $ce, $02, $22, $ca, $02, $22, $c2        ;; 02:61d5 ????????
    db   $00, $20, $ca, $04, $24, $ca, $04, $24        ;; 02:61dd ????????
    db   $c2, $02, $22, $ca, $02, $22, $ca, $02        ;; 02:61e5 ????????
    db   $22, $c2, $04, $24, $ca, $04, $24, $ca        ;; 02:61ed ????????
    db   $06, $26, $c2, $02, $22, $ca, $02, $22        ;; 02:61f5 ????????
    db   $ce, $c2, $04, $24, $ca, $06, $26, $ce        ;; 02:61fd ????????
    db   $c2, $02, $22, $da, $c2, $06, $26, $da        ;; 02:6205 ????????
    db   $c7, $08, $0a, $2a, $28, $c8, $48, $4a        ;; 02:620d ????????
    db   $6a, $68, $c7, $08, $0a, $c2, $2a, $28        ;; 02:6215 ????????
    db   $d2, $48, $4a, $c2, $6a, $68, $c7, $00        ;; 02:621d ????????
    db   $02, $c7, $00, $02, $c2, $04, $06, $c2        ;; 02:6225 ????????
    db   $44, $46, $c4, $c3, $04, $06, $1f, $04        ;; 02:622d ????????
    db   $06, $cc, $00, $02, $c2, $00, $02, $c2        ;; 02:6235 ????????
    db   $04, $06, $c2, $00, $02, $c2, $00, $02        ;; 02:623d ????????
    db   $d4, $00, $02, $c7, $22, $20, $c7, $00        ;; 02:6245 ????????
    db   $02, $22, $20, $d9, $00, $02, $04, $06        ;; 02:624d ????????
    db   $1f, $d9, $08, $0a, $0c, $0e, $1f, $cd        ;; 02:6255 ????????
    db   $00, $02, $04, $06, $c8, $08, $0a, $0c        ;; 02:625d ????????
    db   $0e, $1f, $cd, $08, $0a, $0c, $0e, $c8        ;; 02:6265 ????????
    db   $08, $0a, $0c, $0e, $1f, $00, $02, $04        ;; 02:626d ????????
    db   $06, $c8, $08, $0a, $0c, $0e, $c8, $08        ;; 02:6275 ????????
    db   $0a, $0c, $0e, $1f, $08, $0a, $0c, $0e        ;; 02:627d ????????
    db   $c8, $08, $0a, $0c, $0e, $c8, $08, $0a        ;; 02:6285 ????????
    db   $0c, $0e, $1f, $00, $02, $04, $70, $6e        ;; 02:628d ????????
    db   $6c, $c6, $06, $08, $0a, $6a, $68, $66        ;; 02:6295 ????????
    db   $c6, $0c, $0e, $10, $64, $62, $60, $4c        ;; 02:629d ????????
    db   $4e, $50, $24, $22, $20, $c6, $46, $48        ;; 02:62a5 ????????
    db   $4a, $2a, $28, $26, $c6, $40, $42, $44        ;; 02:62ad ????????
    db   $30, $2e, $2c, $c7, $44, $46, $22, $20        ;; 02:62b5 ????????
    db   $c8, $40, $42, $26, $24, $c7, $c7, $00        ;; 02:62bd ????????
    db   $02, $66, $64, $c8, $04, $06, $62, $60        ;; 02:62c5 ????????
    db   $c7, $d3, $00, $20, $cd, $02, $04, $cc        ;; 02:62cd ????????
    db   $00, $20, $1f, $c7, $06, $08, $1f, $00        ;; 02:62d5 ????????
    db   $20, $c6, $00, $20, $1f, $02, $04, $c7        ;; 02:62dd ????????
    db   $c4, $02, $04, $c6, $02, $04, $1f, $06        ;; 02:62e5 ????????
    db   $08, $c9, $00, $20, $c4, $06, $08, $06        ;; 02:62ed ????????
    db   $08, $cc, $02, $04, $c8, $c7, $1e, $7e        ;; 02:62f5 ????????
    db   $1f, $1a, $1c, $c8, $1a, $1c, $c6, $5e        ;; 02:62fd ????????
    db   $3e, $1f, $1e, $7e, $cc, $1a, $1c, $c7        ;; 02:6305 ????????
    db   $1e, $7e, $c4, $1a, $1c, $c2, $1a, $1c        ;; 02:630d ????????
    db   $c2, $1e, $7e, $c6, $1e, $7e, $1e, $7e        ;; 02:6315 ????????
    db   $c6, $1a, $1c, $1f, $00, $02, $c2, $22        ;; 02:631d ????????
    db   $20, $d2, $40, $42, $c2, $62, $60, $c7        ;; 02:6325 ????????
    db   $00, $02, $22, $20, $c8, $40, $42, $62        ;; 02:632d ????????
    db   $60, $c7, $00, $60, $d5, $c7, $00, $60        ;; 02:6335 ????????
    db   $c6, $00, $60, $cd, $c7, $00, $60, $c6        ;; 02:633d ????????
    db   $00, $60, $c8, $00, $60, $c4, $4a, $c7        ;; 02:6345 ????????
    db   $0a, $1f, $4a, $cd, $0a, $1f, $c7, $0a        ;; 02:634d ????????
    db   $c3, $4a, $c9, $4a, $1f, $82, $0a, $c5        ;; 02:6355 ????????
    db   $c2, $0a, $d0, $0a, $c8, $4a, $1f, $4a        ;; 02:635d ????????
    db   $c2, $0a, $d0, $0a, $c8, $4a, $c7, $4a        ;; 02:6365 ????????
    db   $c2, $0a, $c7, $4a, $c8, $0a, $c8, $4a        ;; 02:636d ????????
    db   $c8, $0a, $c7, $4a, $c2, $0a, $1f, $c6        ;; 02:6375 ????????
    db   $0a, $c2, $4a, $ca, $4a, $c2, $0a, $c6        ;; 02:637d ????????
    db   $c4, $4a, $c8, $0a, $1f, $4a, $ce, $0a        ;; 02:6385 ????????
    db   $cf, $c8, $02, $22, $c3, $00, $c2, $20        ;; 02:638d ????????
    db   $c3, $04, $24, $c8, $06, $26, $c3, $00        ;; 02:6395 ????????
    db   $c2, $20, $c3, $08, $28, $c9, $0e, $6e        ;; 02:639d ????????
    db   $c2, $02, $22, $c3, $00, $c2, $20, $c3        ;; 02:63a5 ????????
    db   $04, $24, $1f, $0e, $6e, $0e, $6e, $c6        ;; 02:63ad ????????
    db   $02, $22, $c3, $00, $c2, $20, $c3, $04        ;; 02:63b5 ????????
    db   $24, $c2, $0e, $6e, $c4, $c3, $02, $22        ;; 02:63bd ????????
    db   $c3, $00, $c2, $20, $0e, $6e, $1f, $04        ;; 02:63c5 ????????
    db   $24, $ca, $0e, $6e, $1f, $cc, $40, $00        ;; 02:63cd ????????
    db   $40, $00, $40, $00, $cc, $00, $40, $00        ;; 02:63d5 ????????
    db   $40, $00, $40, $d6, $20, $c2, $00, $d0        ;; 02:63dd ????????
    db   $00, $c2, $20, $c7, $00, $ca, $20, $c2        ;; 02:63e5 ????????
    db   $00, $c7, $20, $c2, $20, $c4, $00, $c4        ;; 02:63ed ????????
    db   $00, $c2, $20, $c7, $00, $c2, $00, $c4        ;; 02:63f5 ????????
    db   $20, $c2, $20, $c3, $1f, $00, $c7, $20        ;; 02:63fd ????????
    db   $c2, $20, $c4, $00, $c2, $00, $c4, $20        ;; 02:6405 ????????
    db   $1f, $20, $c3, $00, $c2, $00, $c4, $20        ;; 02:640d ????????
    db   $c2, $20, $c4, $00, $1f, $00, $c8, $20        ;; 02:6415 ????????
    db   $c4, $00, $c2, $00, $c4, $20, $1f, $20        ;; 02:641d ????????
    db   $ce, $c2, $20, $c4, $00, $1f, $00, $d4        ;; 02:6425 ????????
    db   $1f, $20, $1f, $20, $da, $c3, $00, $02        ;; 02:642d ????????
    db   $d9, $c3, $00, $02, $cb, $00, $02, $cc        ;; 02:6435 ????????
    db   $c3, $00, $02, $cb, $00, $02, $c9, $00        ;; 02:643d ????????
    db   $02, $1f, $c3, $00, $02, $cb, $00, $02        ;; 02:6445 ????????
    db   $c7, $00, $02, $00, $02, $1f, $c3, $00        ;; 02:644d ????????
    db   $02, $c7, $00, $02, $c2, $00, $02, $c7        ;; 02:6455 ????????
    db   $00, $02, $00, $02, $1f, $00, $02, $00        ;; 02:645d ????????
    db   $02, $c7, $00, $02, $c2, $00, $02, $c7        ;; 02:6465 ????????
    db   $00, $02, $00, $02, $1f, $00, $02, $00        ;; 02:646d ????????
    db   $02, $c7, $00, $02, $00, $02, $00, $02        ;; 02:6475 ????????
    db   $c7, $00, $02, $00, $02, $1f, $c8, $00        ;; 02:647d ????????
    db   $02, $ca, $04, $06, $c8, $22, $20, $ca        ;; 02:6485 ????????
    db   $26, $24, $c8, $1f, $12, $32, $1f, $16        ;; 02:648d ????????
    db   $18, $c9, $14, $34, $1f, $14, $34, $c6        ;; 02:6495 ????????
    db   $16, $18, $12, $32, $1f, $14, $34, $12        ;; 02:649d ????????
    db   $32, $ca, $38, $36, $1f, $16, $18, $c6        ;; 02:64a5 ????????
    db   $12, $32, $14, $34, $1f, $16, $18, $14        ;; 02:64ad ????????
    db   $34, $c7, $12, $32, $c2, $12, $32, $c8        ;; 02:64b5 ????????
    db   $14, $34, $38, $36, $12, $32, $1f, $38        ;; 02:64bd ????????
    db   $36, $c7, $14, $34, $12, $32, $14, $34        ;; 02:64c5 ????????
    db   $c8, $16, $18, $c2, $14, $34, $1f, $12        ;; 02:64cd ????????
    db   $32, $c7, $16, $58, $14, $34, $38, $36        ;; 02:64d5 ????????
    db   $c7, $12, $32, $c3, $16, $18, $1f, $14        ;; 02:64dd ????????
    db   $34, $c8, $16, $18, $c6, $12, $32, $1f        ;; 02:64e5 ????????
    db   $14, $34, $c3, $04, $06, $68, $ca, $08        ;; 02:64ed ????????
    db   $0a, $cc, $c8, $04, $06, $68, $ca, $08        ;; 02:64f5 ????????
    db   $0a, $cd, $04, $06, $68, $ca, $08, $0a        ;; 02:64fd ????????
    db   $d6, $0c, $0e, $cf, $0c, $0e, $cd, $0c        ;; 02:6505 ????????
    db   $0e, $dc, $10, $70, $d5, $10, $70, $ce        ;; 02:650d ????????
    db   $10, $70, $ce, $cd, $10, $70, $cf             ;; 02:6515 ???????

data_02_651c:
    db   $19, $19, $19, $25, $92, $92, $06, $21        ;; 02:651c ?w?????w
    db   $40, $40, $40, $2a, $2a, $2a, $51, $00        ;; 02:6524 ?????w??
    db   $4d, $b7, $71, $71, $71, $a3, $00, $00        ;; 02:652c ????????
    db   $02, $02, $00, $00, $00, $79, $79, $79        ;; 02:6534 ????????
    db   $79, $19, $08, $44, $6b, $4e, $08, $c9        ;; 02:653c ????????
    db   $be, $3e, $3e, $44, $3e, $13, $79, $b1        ;; 02:6544 ????????
    db   $92, $73, $57, $57, $04, $9b, $38, $38        ;; 02:654c ????????
    db   $00, $92, $19, $02, $04, $04, $62, $79        ;; 02:6554 ????????
    db   $79, $00, $ba, $00, $12, $54, $82, $82        ;; 02:655c ????????
    db   $38, $38, $38, $00, $70, $00, $00, $50        ;; 02:6564 ????????
    db   $51, $51, $51, $38, $38, $00, $38, $91        ;; 02:656c ????????
    db   $38, $4d, $4c, $4a, $86, $3e, $0f, $77        ;; 02:6574 ????????
    db   $00, $00, $a3, $00, $ae, $8a, $61, $00        ;; 02:657c ?ww?????
    db   $00, $38, $10, $00, $a3, $83, $5d, $38        ;; 02:6584 ????????

data_02_658c:
    dw   `00011111                                     ;; 02:658c $1f $00
    dw   `01133333                                     ;; 02:658e $7f $1f
    dw   `01333323                                     ;; 02:6590 $7d $3f
    dw   `01333333                                     ;; 02:6592 $7f $3f
    dw   `11332333                                     ;; 02:6594 $f7 $3f
    dw   `13233233                                     ;; 02:6596 $db $7f
    dw   `13322333                                     ;; 02:6598 $e7 $7f
    dw   `13333333                                     ;; 02:659a $ff $7f

    dw   `13333333                                     ;; 02:659c $ff $7f
    dw   `11333333                                     ;; 02:659e $ff $3f
    dw   `01133332                                     ;; 02:65a0 $7e $1f
    dw   `00111123                                     ;; 02:65a2 $3d $03
    dw   `00000113                                     ;; 02:65a4 $07 $01
    dw   `00000013                                     ;; 02:65a6 $03 $01
    dw   `00000011                                     ;; 02:65a8 $03 $00
    dw   `00000001                                     ;; 02:65aa $01 $00

    dw   `11000000                                     ;; 02:65ac $c0 $00
    dw   `31110000                                     ;; 02:65ae $f0 $80
    dw   `33311000                                     ;; 02:65b0 $f8 $e0
    dw   `22331100                                     ;; 02:65b2 $3c $f0
    dw   `32233100                                     ;; 02:65b4 $9c $f8
    dw   `33223100                                     ;; 02:65b6 $cc $f8
    dw   `33323100                                     ;; 02:65b8 $ec $f8
    dw   `33333100                                     ;; 02:65ba $fc $f8

    dw   `33333100                                     ;; 02:65bc $fc $f8
    dw   `32222100                                     ;; 02:65be $84 $f8
    dw   `23333310                                     ;; 02:65c0 $7e $fc
    dw   `33333310                                     ;; 02:65c2 $fe $fc
    dw   `33222310                                     ;; 02:65c4 $c6 $fc
    dw   `32233110                                     ;; 02:65c6 $9e $f8
    dw   `33331100                                     ;; 02:65c8 $fc $f0
    dw   `11111000                                     ;; 02:65ca $f8 $00

    dw   `00011111                                     ;; 02:65cc $1f $00
    dw   `00133133                                     ;; 02:65ce $3f $1b
    dw   `00133133                                     ;; 02:65d0 $3f $1b
    dw   `00133132                                     ;; 02:65d2 $3e $1b
    dw   `00111311                                     ;; 02:65d4 $3f $04
    dw   `00013333                                     ;; 02:65d6 $1f $0f
    dw   `00013333                                     ;; 02:65d8 $1f $0f
    dw   `00001333                                     ;; 02:65da $0f $07

    dw   `00001333                                     ;; 02:65dc $0f $07
    dw   `00001333                                     ;; 02:65de $0f $07
    dw   `00011333                                     ;; 02:65e0 $1f $07
    dw   `00013333                                     ;; 02:65e2 $1f $0f
    dw   `00013333                                     ;; 02:65e4 $1f $0f
    dw   `00013333                                     ;; 02:65e6 $1f $0f
    dw   `00011333                                     ;; 02:65e8 $1f $07
    dw   `00001111                                     ;; 02:65ea $0f $00

    dw   `10000000                                     ;; 02:65ec $80 $00
    dw   `11100000                                     ;; 02:65ee $e0 $00
    dw   `23111000                                     ;; 02:65f0 $78 $c0
    dw   `33231100                                     ;; 02:65f2 $dc $f0
    dw   `22331100                                     ;; 02:65f4 $3c $f0
    dw   `31323100                                     ;; 02:65f6 $ec $b8
    dw   `33133100                                     ;; 02:65f8 $fc $d8
    dw   `33311000                                     ;; 02:65fa $f8 $e0

    dw   `33311000                                     ;; 02:65fc $f8 $e0
    dw   `33310000                                     ;; 02:65fe $f0 $e0
    dw   `33310000                                     ;; 02:6600 $f0 $e0
    dw   `33110000                                     ;; 02:6602 $f0 $c0
    dw   `33100000                                     ;; 02:6604 $e0 $c0
    dw   `31100000                                     ;; 02:6606 $e0 $80
    dw   `11000000                                     ;; 02:6608 $c0 $00
    dw   `10000000                                     ;; 02:660a $80 $00

    dw   `00111333                                     ;; 02:660c $3f $07
    dw   `01133111                                     ;; 02:660e $7f $18
    dw   `11311122                                     ;; 02:6610 $fc $23
    dw   `13111222                                     ;; 02:6612 $f8 $47
    dw   `31112222                                     ;; 02:6614 $f0 $8f
    dw   `31122223                                     ;; 02:6616 $e1 $9f
    dw   `31133223                                     ;; 02:6618 $f9 $9f
    dw   `31331222                                     ;; 02:661a $f8 $b7

    dw   `33331222                                     ;; 02:661c $f8 $f7
    dw   `33311222                                     ;; 02:661e $f8 $e7
    dw   `13212222                                     ;; 02:6620 $d0 $6f
    dw   `13232332                                     ;; 02:6622 $d6 $7f
    dw   `13333322                                     ;; 02:6624 $fc $7f
    dw   `11133222                                     ;; 02:6626 $f8 $1f
    dw   `00111322                                     ;; 02:6628 $3c $07
    dw   `00011133                                     ;; 02:662a $1f $03

    dw   `33311000                                     ;; 02:662c $f8 $e0
    dw   `22231100                                     ;; 02:662e $1c $f0
    dw   `22223110                                     ;; 02:6630 $0e $f8
    dw   `22222311                                     ;; 02:6632 $07 $fc
    dw   `33222231                                     ;; 02:6634 $c3 $fe
    dw   `22322231                                     ;; 02:6636 $23 $fe
    dw   `32322231                                     ;; 02:6638 $a3 $fe
    dw   `32322231                                     ;; 02:663a $a3 $fe

    dw   `32322331                                     ;; 02:663c $a7 $fe
    dw   `23323311                                     ;; 02:663e $6f $fc
    dw   `22233310                                     ;; 02:6640 $1e $fc
    dw   `22333110                                     ;; 02:6642 $3e $f8
    dw   `22333100                                     ;; 02:6644 $3c $f8
    dw   `23331100                                     ;; 02:6646 $7c $f0
    dw   `33311000                                     ;; 02:6648 $f8 $e0
    dw   `33110000                                     ;; 02:664a $f0 $c0

    dw   `11333110                                     ;; 02:664c $fe $38
    dw   `13212310                                     ;; 02:664e $d6 $6c
    dw   `13212311                                     ;; 02:6650 $d7 $6c
    dw   `11321231                                     ;; 02:6652 $eb $36
    dw   `01321231                                     ;; 02:6654 $6b $36
    dw   `01132123                                     ;; 02:6656 $75 $1b
    dw   `00132123                                     ;; 02:6658 $35 $1b
    dw   `00113212                                     ;; 02:665a $3a $0d

    dw   `00013212                                     ;; 02:665c $1a $0d
    dw   `00011321                                     ;; 02:665e $1d $06
    dw   `00001321                                     ;; 02:6660 $0d $06
    dw   `00001132                                     ;; 02:6662 $0e $03
    dw   `00000132                                     ;; 02:6664 $06 $03
    dw   `00000013                                     ;; 02:6666 $03 $01
    dw   `00000001                                     ;; 02:6668 $01 $00
    dw   `00000000                                     ;; 02:666a $00 $00

    dw   `00000000                                     ;; 02:666c $00 $00
    dw   `00000000                                     ;; 02:666e $00 $00
    dw   `00000000                                     ;; 02:6670 $00 $00
    dw   `00000000                                     ;; 02:6672 $00 $00
    dw   `10000000                                     ;; 02:6674 $80 $00
    dw   `10000000                                     ;; 02:6676 $80 $00
    dw   `11000000                                     ;; 02:6678 $c0 $00
    dw   `31000000                                     ;; 02:667a $c0 $80

    dw   `31100000                                     ;; 02:667c $e0 $80
    dw   `23100000                                     ;; 02:667e $60 $c0
    dw   `23110000                                     ;; 02:6680 $70 $c0
    dw   `12310000                                     ;; 02:6682 $b0 $60
    dw   `23211000                                     ;; 02:6684 $58 $e0
    dw   `33131000                                     ;; 02:6686 $f8 $d0
    dw   `13321100                                     ;; 02:6688 $ec $70
    dw   `01313110                                     ;; 02:668a $7e $28

    dw   `00000000                                     ;; 02:668c $00 $00
    dw   `00000000                                     ;; 02:668e $00 $00
    dw   `03333000                                     ;; 02:6690 $78 $78

    db   $3f                                           ;; 02:6692 .
    db   %00100111                                     ;; 02:6693 $27

    dw   `00031111                                     ;; 02:6694 $1f $10
    dw   `00003111                                     ;; 02:6696 $0f $08
    dw   `00003111                                     ;; 02:6698 $0f $08
    dw   `00031111                                     ;; 02:669a $1f $10
    dw   `03311111                                     ;; 02:669c $7f $60
    dw   `31111111                                     ;; 02:669e $ff $80
    dw   `03311111                                     ;; 02:66a0 $7f $60
    dw   `00031111                                     ;; 02:66a2 $1f $10

    dw   `00031111                                     ;; 02:66a4 $1f $10
    dw   `00031333                                     ;; 02:66a6 $1f $17
    dw   `00313000                                     ;; 02:66a8 $38 $28
    dw   `00330000                                     ;; 02:66aa $30 $30
    dw   `00330000                                     ;; 02:66ac $30 $30
    dw   `03130000                                     ;; 02:66ae $70 $50
    dw   `31130000                                     ;; 02:66b0 $f0 $90
    dw   `11130000                                     ;; 02:66b2 $f0 $10

    dw   `11113333                                     ;; 02:66b4 $ff $0f
    dw   `11111113                                     ;; 02:66b6 $ff $01
    dw   `11111130                                     ;; 02:66b8 $fe $02
    dw   `11111300                                     ;; 02:66ba $fc $04
    dw   `11111300                                     ;; 02:66bc $fc $04
    dw   `11111130                                     ;; 02:66be $fe $02
    dw   `11111113                                     ;; 02:66c0 $ff $01
    dw   `11111333                                     ;; 02:66c2 $ff $07

    dw   `11113000                                     ;; 02:66c4 $f8 $08
    dw   `31130000                                     ;; 02:66c6 $f0 $90
    dw   `03130000                                     ;; 02:66c8 $70 $50
    dw   `00300000                                     ;; 02:66ca $20 $20
    dw   `00000001                                     ;; 02:66cc $01 $00
    dw   `00000001                                     ;; 02:66ce $01 $00
    dw   `00000001                                     ;; 02:66d0 $01 $00
    dw   `00000011                                     ;; 02:66d2 $03 $00

    dw   `00000013                                     ;; 02:66d4 $03 $01
    dw   `00000013                                     ;; 02:66d6 $03 $01
    dw   `00000113                                     ;; 02:66d8 $07 $01
    dw   `00000131                                     ;; 02:66da $07 $02
    dw   `00000132                                     ;; 02:66dc $06 $03
    dw   `00011132                                     ;; 02:66de $1e $03
    dw   `01113333                                     ;; 02:66e0 $7f $0f
    dw   `01333333                                     ;; 02:66e2 $7f $3f

    dw   `01333111                                     ;; 02:66e4 $7f $38
    dw   `01111100                                     ;; 02:66e6 $7c $00
    dw   `00000000                                     ;; 02:66e8 $00 $00
    dw   `00000000                                     ;; 02:66ea $00 $00
    dw   `00000000                                     ;; 02:66ec $00 $00
    dw   `00000000                                     ;; 02:66ee $00 $00
    dw   `00000000                                     ;; 02:66f0 $00 $00
    dw   `00000000                                     ;; 02:66f2 $00 $00

    dw   `00000000                                     ;; 02:66f4 $00 $00
    dw   `00000000                                     ;; 02:66f6 $00 $00
    dw   `00000000                                     ;; 02:66f8 $00 $00
    dw   `00000000                                     ;; 02:66fa $00 $00
    dw   `00000000                                     ;; 02:66fc $00 $00
    dw   `00000000                                     ;; 02:66fe $00 $00
    dw   `01111100                                     ;; 02:6700 $7c $00
    dw   `01333111                                     ;; 02:6702 $7f $38

    dw   `11311331                                     ;; 02:6704 $ff $26
    dw   `13111223                                     ;; 02:6706 $f9 $47
    dw   `13111221                                     ;; 02:6708 $f9 $46
    dw   `13112211                                     ;; 02:670a $f3 $4c
    dw   `00000000                                     ;; 02:670c $00 $00
    dw   `00000000                                     ;; 02:670e $00 $00
    dw   `00000000                                     ;; 02:6710 $00 $00
    dw   `00000000                                     ;; 02:6712 $00 $00

    dw   `00000000                                     ;; 02:6714 $00 $00
    dw   `00000000                                     ;; 02:6716 $00 $00
    dw   `00000000                                     ;; 02:6718 $00 $00
    dw   `00000000                                     ;; 02:671a $00 $00
    dw   `00000000                                     ;; 02:671c $00 $00
    dw   `00000000                                     ;; 02:671e $00 $00
    dw   `00000000                                     ;; 02:6720 $00 $00
    dw   `00000000                                     ;; 02:6722 $00 $00

    dw   `11000000                                     ;; 02:6724 $c0 $00
    dw   `31100000                                     ;; 02:6726 $e0 $80
    dw   `13110000                                     ;; 02:6728 $f0 $40
    dw   `12311000                                     ;; 02:672a $b8 $60
    dw   `31122211                                     ;; 02:672c $e3 $9c
    dw   `31122112                                     ;; 02:672e $e6 $99
    dw   `31221122                                     ;; 02:6730 $cc $b3
    dw   `31211221                                     ;; 02:6732 $d9 $a6

    dw   `12212211                                     ;; 02:6734 $93 $6c
    dw   `12122112                                     ;; 02:6736 $a6 $59
    dw   `21211221                                     ;; 02:6738 $59 $a6
    dw   `12112111                                     ;; 02:673a $b7 $48
    dw   `21221122                                     ;; 02:673c $4c $b3
    dw   `12112221                                     ;; 02:673e $b1 $4e
    dw   `22222222                                     ;; 02:6740 $00 $ff
    dw   `33322111                                     ;; 02:6742 $e7 $f8

    dw   `11133332                                     ;; 02:6744 $fe $1f
    dw   `00111113                                     ;; 02:6746 $3f $01
    dw   `00000011                                     ;; 02:6748 $03 $00
    dw   `00000000                                     ;; 02:674a $00 $00
    dw   `22231000                                     ;; 02:674c $18 $f0
    dw   `22131100                                     ;; 02:674e $3c $d0
    dw   `21113100                                     ;; 02:6750 $7c $88
    dw   `11223110                                     ;; 02:6752 $ce $38

    dw   `22221310                                     ;; 02:6754 $0e $f4
    dw   `22111311                                     ;; 02:6756 $3f $c4
    dw   `11122311                                     ;; 02:6758 $e7 $1c
    dw   `22222231                                     ;; 02:675a $03 $fe
    dw   `22111131                                     ;; 02:675c $3f $c2
    dw   `11112231                                     ;; 02:675e $f3 $0e
    dw   `22222231                                     ;; 02:6760 $03 $fe
    dw   `11111131                                     ;; 02:6762 $ff $02

    dw   `22111131                                     ;; 02:6764 $3f $c2
    dw   `33322231                                     ;; 02:6766 $e3 $fe
    dw   `11133331                                     ;; 02:6768 $ff $1e
    dw   `01111111                                     ;; 02:676a $7f $00
    dw   `00001110                                     ;; 02:676c $0e $00
    dw   `00001310                                     ;; 02:676e $0e $04
    dw   `00011310                                     ;; 02:6770 $1e $04
    dw   `10013310                                     ;; 02:6772 $9e $0c

    dw   `11123310                                     ;; 02:6774 $ee $1c
    dw   `13233310                                     ;; 02:6776 $de $7c
    dw   `13333210                                     ;; 02:6778 $fa $7c
    dw   `12313310                                     ;; 02:677a $be $6c
    dw   `11313321                                     ;; 02:677c $fd $2e
    dw   `11333331                                     ;; 02:677e $ff $3e
    dw   `11331332                                     ;; 02:6780 $fe $37
    dw   `13311123                                     ;; 02:6782 $fd $63

    dw   `13210011                                     ;; 02:6784 $d3 $60
    dw   `13100000                                     ;; 02:6786 $e0 $40
    dw   `11100000                                     ;; 02:6788 $e0 $00
    dw   `11000000                                     ;; 02:678a $c0 $00

    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:678c ????????
    db   $3c, $3c, $42, $7e, $99, $e7, $bd, $c3        ;; 02:6794 ????????
    db   $bd, $c3, $99, $e7, $42, $7e, $3c, $3c        ;; 02:679c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:67a4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:67ac ????????
    db   $00, $00, $18, $18, $24, $3c, $5a, $66        ;; 02:67b4 ????????
    db   $5a, $66, $24, $3c, $18, $18, $00, $00        ;; 02:67bc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:67c4 ????????
    db   $06, $06, $0f, $09, $0f, $09, $66, $66        ;; 02:67cc ????????
    db   $f0, $90, $f0, $90, $60, $60, $00, $00        ;; 02:67d4 ????????
    db   $0c, $0c, $1e, $12, $1e, $12, $0c, $0c        ;; 02:67dc ????????
    db   $60, $60, $f0, $90, $f0, $90, $60, $60        ;; 02:67e4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:67ec ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:67f4 ????????
    db   $44, $00, $11, $00, $44, $00, $11, $00        ;; 02:67fc ????????
    db   $44, $00, $11, $00, $44, $00, $11, $00        ;; 02:6804 ????????
    db   $44, $00, $11, $00, $44, $00, $11, $00        ;; 02:680c ????????
    db   $44, $00, $11, $00, $44, $00, $11, $00        ;; 02:6814 ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:681c ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:6824 ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:682c ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:6834 ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:683c ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:6844 ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:684c ????????
    db   $55, $00, $aa, $00, $55, $00, $aa, $00        ;; 02:6854 ????????
    db   $bb, $00, $ee, $00, $bb, $00, $ee, $00        ;; 02:685c ????????
    db   $bb, $00, $ee, $00, $bb, $00, $ee, $00        ;; 02:6864 ????????
    db   $bb, $00, $ee, $00, $bb, $00, $ee, $00        ;; 02:686c ????????
    db   $bb, $00, $ee, $00, $bb, $00, $ee, $00        ;; 02:6874 ????????
    db   $bb, $00, $ee, $00, $bb, $00, $ee, $00        ;; 02:687c ????????
    db   $bb, $00, $ee, $00, $bb, $00, $ee, $00        ;; 02:6884 ????????
    db   $ff, $00, $ff, $00, $ff, $00, $ff, $00        ;; 02:688c ????????
    db   $ff, $00, $ff, $00, $ff, $00, $ff, $00        ;; 02:6894 ????????
    db   $ff, $00, $ff, $00, $ff, $00, $ff, $00        ;; 02:689c ????????
    db   $ff, $00, $ff, $00, $ff, $00, $ff, $00        ;; 02:68a4 ????????
    dw   `33331111                                     ;; 02:68ac $ff $f0
    dw   `31113111                                     ;; 02:68ae $ff $88
    dw   `31111311                                     ;; 02:68b0 $ff $84
    dw   `31211131                                     ;; 02:68b2 $df $a2
    dw   `13121113                                     ;; 02:68b4 $ef $51
    dw   `11322111                                     ;; 02:68b6 $e7 $38
    dw   `11132211                                     ;; 02:68b8 $f3 $1c
    dw   `11113221                                     ;; 02:68ba $f9 $0e

    dw   `11111322                                     ;; 02:68bc $fc $07
    dw   `00111132                                     ;; 02:68be $3e $03
    dw   `00111113                                     ;; 02:68c0 $3f $01
    dw   `00001111                                     ;; 02:68c2 $0f $00
    dw   `00001111                                     ;; 02:68c4 $0f $00
    dw   `00000011                                     ;; 02:68c6 $03 $00
    dw   `00000011                                     ;; 02:68c8 $03 $00
    dw   `00000000                                     ;; 02:68ca $00 $00

    dw   `10000000                                     ;; 02:68cc $80 $00
    dw   `10000000                                     ;; 02:68ce $80 $00
    dw   `11100000                                     ;; 02:68d0 $e0 $00
    dw   `11100000                                     ;; 02:68d2 $e0 $00
    dw   `11111000                                     ;; 02:68d4 $f8 $00
    dw   `31111000                                     ;; 02:68d6 $f8 $80
    dw   `13111110                                     ;; 02:68d8 $fe $40
    dw   `11311110                                     ;; 02:68da $fe $20

    dw   `11131111                                     ;; 02:68dc $ff $10
    dw   `21113111                                     ;; 02:68de $7f $88
    dw   `22111311                                     ;; 02:68e0 $3f $c4
    dw   `32211131                                     ;; 02:68e2 $9f $e2
    dw   `13221113                                     ;; 02:68e4 $cf $71
    dw   `11322111                                     ;; 02:68e6 $e7 $38
    dw   `11132211                                     ;; 02:68e8 $f3 $1c
    dw   `11113221                                     ;; 02:68ea $f9 $0e

    dw   `11111323                                     ;; 02:68ec $fd $07
    dw   `01111332                                     ;; 02:68ee $7e $07
    dw   `00113322                                     ;; 02:68f0 $3c $0f
    dw   `00013223                                     ;; 02:68f2 $19 $0f
    dw   `00013233                                     ;; 02:68f4 $1b $0f
    dw   `00013231                                     ;; 02:68f6 $1b $0e
    dw   `00013331                                     ;; 02:68f8 $1f $0e
    dw   `00011110                                     ;; 02:68fa $1e $00

    dw   `00000000                                     ;; 02:68fc $00 $00
    dw   `00000000                                     ;; 02:68fe $00 $00
    dw   `00000000                                     ;; 02:6900 $00 $00
    dw   `00000000                                     ;; 02:6902 $00 $00
    dw   `00000000                                     ;; 02:6904 $00 $00
    dw   `00000000                                     ;; 02:6906 $00 $00
    dw   `00000000                                     ;; 02:6908 $00 $00
    dw   `00000000                                     ;; 02:690a $00 $00

    dw   `10000000                                     ;; 02:690c $80 $00
    dw   `11000000                                     ;; 02:690e $c0 $00
    dw   `11100000                                     ;; 02:6910 $e0 $00
    dw   `11111111                                     ;; 02:6912 $ff $00
    dw   `11333331                                     ;; 02:6914 $ff $3e
    dw   `33322231                                     ;; 02:6916 $e3 $fe
    dw   `13223311                                     ;; 02:6918 $cf $7c
    dw   `32233110                                     ;; 02:691a $9e $f8

    dw   `22331100                                     ;; 02:691c $3c $f0
    dw   `23333110                                     ;; 02:691e $7e $f8
    dw   `33323311                                     ;; 02:6920 $ef $fc
    dw   `33222331                                     ;; 02:6922 $c7 $fe
    dw   `13322231                                     ;; 02:6924 $e3 $7e
    dw   `11332231                                     ;; 02:6926 $f3 $3e
    dw   `01133331                                     ;; 02:6928 $7f $1e
    dw   `00111111                                     ;; 02:692a $3f $00

    dw   `00000000                                     ;; 02:692c $00 $00
    dw   `00000000                                     ;; 02:692e $00 $00
    dw   `00000000                                     ;; 02:6930 $00 $00
    dw   `11000000                                     ;; 02:6932 $c0 $00
    dw   `11110000                                     ;; 02:6934 $f0 $00
    dw   `33311000                                     ;; 02:6936 $f8 $e0
    dw   `32131100                                     ;; 02:6938 $bc $d0
    dw   `32113110                                     ;; 02:693a $be $c8

    dw   `32113110                                     ;; 02:693c $be $c8
    dw   `32211311                                     ;; 02:693e $9f $e4
    dw   `13211311                                     ;; 02:6940 $df $64
    dw   `13221131                                     ;; 02:6942 $cf $72
    dw   `11321131                                     ;; 02:6944 $ef $32
    dw   `11322113                                     ;; 02:6946 $e7 $39
    dw   `01132113                                     ;; 02:6948 $77 $19
    dw   `01132211                                     ;; 02:694a $73 $1c

    dw   `00000000                                     ;; 02:694c $00 $00
    dw   `00000000                                     ;; 02:694e $00 $00
    dw   `00000000                                     ;; 02:6950 $00 $00
    dw   `00000000                                     ;; 02:6952 $00 $00
    dw   `00000000                                     ;; 02:6954 $00 $00
    dw   `00000000                                     ;; 02:6956 $00 $00
    dw   `00000000                                     ;; 02:6958 $00 $00
    dw   `00000000                                     ;; 02:695a $00 $00

    dw   `00000000                                     ;; 02:695c $00 $00
    dw   `00000000                                     ;; 02:695e $00 $00
    dw   `00000000                                     ;; 02:6960 $00 $00
    dw   `10000000                                     ;; 02:6962 $80 $00
    dw   `10000000                                     ;; 02:6964 $80 $00
    dw   `11000000                                     ;; 02:6966 $c0 $00
    dw   `11000000                                     ;; 02:6968 $c0 $00
    dw   `31100000                                     ;; 02:696a $e0 $80

    dw   `00113211                                     ;; 02:696c $3b $0c
    dw   `00113221                                     ;; 02:696e $39 $0e
    dw   `00011321                                     ;; 02:6970 $1d $06
    dw   `00011322                                     ;; 02:6972 $1c $07
    dw   `00001132                                     ;; 02:6974 $0e $03
    dw   `00001132                                     ;; 02:6976 $0e $03
    dw   `00000113                                     ;; 02:6978 $07 $01
    dw   `00001133                                     ;; 02:697a $0f $03

    dw   `00001332                                     ;; 02:697c $0e $07
    dw   `00001322                                     ;; 02:697e $0c $07
    dw   `00001323                                     ;; 02:6980 $0d $07
    dw   `00001323                                     ;; 02:6982 $0d $07
    dw   `00001331                                     ;; 02:6984 $0f $06
    dw   `00001110                                     ;; 02:6986 $0e $00
    dw   `00000000                                     ;; 02:6988 $00 $00
    dw   `00000000                                     ;; 02:698a $00 $00

    dw   `31100000                                     ;; 02:698c $e0 $80
    dw   `13110000                                     ;; 02:698e $f0 $40
    dw   `13110000                                     ;; 02:6990 $f0 $40
    dw   `11311000                                     ;; 02:6992 $f8 $20
    dw   `11321111                                     ;; 02:6994 $ef $30
    dw   `21233331                                     ;; 02:6996 $5f $be
    dw   `23322223                                     ;; 02:6998 $61 $ff
    dw   `32223333                                     ;; 02:699a $8f $ff

    dw   `22333111                                     ;; 02:699c $3f $f8
    dw   `33333310                                     ;; 02:699e $fe $fc
    dw   `33332311                                     ;; 02:69a0 $f7 $fc
    dw   `13222231                                     ;; 02:69a2 $c3 $7e
    dw   `11322231                                     ;; 02:69a4 $e3 $3e
    dw   `01322231                                     ;; 02:69a6 $63 $3e
    dw   `01133311                                     ;; 02:69a8 $7f $1c
    dw   `00111111                                     ;; 02:69aa $3f $00

    dw   `00000001                                     ;; 02:69ac $01 $00
    dw   `00000013                                     ;; 02:69ae $03 $01
    dw   `00000113                                     ;; 02:69b0 $07 $01

    db   $1f                                           ;; 02:69b2 .
    db   %00000001                                     ;; 02:69b3 $01

    dw   `11111333                                     ;; 02:69b4 $ff $07
    dw   `13333333                                     ;; 02:69b6 $ff $7f
    dw   `13123333                                     ;; 02:69b8 $ef $5f
    dw   `13123333                                     ;; 02:69ba $ef $5f
    dw   `13112333                                     ;; 02:69bc $f7 $4f
    dw   `11311233                                     ;; 02:69be $fb $27
    dw   `11321123                                     ;; 02:69c0 $ed $33
    dw   `01132112                                     ;; 02:69c2 $76 $19

    dw   `01113211                                     ;; 02:69c4 $7b $0c
    dw   `00111331                                     ;; 02:69c6 $3f $06
    dw   `00001113                                     ;; 02:69c8 $0f $01
    dw   `00000111                                     ;; 02:69ca $07 $00
    dw   `33133311                                     ;; 02:69cc $ff $dc
    dw   `11333331                                     ;; 02:69ce $ff $3e
    dw   `23323333                                     ;; 02:69d0 $6f $ff
    dw   `33212333                                     ;; 02:69d2 $d7 $ef

    dw   `33321233                                     ;; 02:69d4 $eb $f7
    dw   `33332331                                     ;; 02:69d6 $f7 $fe
    dw   `33333313                                     ;; 02:69d8 $ff $fd
    dw   `33333211                                     ;; 02:69da $fb $fc
    dw   `33333321                                     ;; 02:69dc $fd $fe
    dw   `33331132                                     ;; 02:69de $fe $f3
    dw   `33331113                                     ;; 02:69e0 $ff $f1
    dw   `33311011                                     ;; 02:69e2 $fb $e0

    dw   `22311001                                     ;; 02:69e4 $39 $e0
    dw   `11310000                                     ;; 02:69e6 $f0 $20
    dw   `33310000                                     ;; 02:69e8 $f0 $e0
    dw   `11110000                                     ;; 02:69ea $f0 $00
    dw   `00011111                                     ;; 02:69ec $1f $00
    dw   `00113331                                     ;; 02:69ee $3f $0e
    dw   `01131231                                     ;; 02:69f0 $7b $16
    dw   `11312333                                     ;; 02:69f2 $f7 $2f

    dw   `11312333                                     ;; 02:69f4 $f7 $2f
    dw   `13122333                                     ;; 02:69f6 $e7 $5f
    dw   `13123333                                     ;; 02:69f8 $ef $5f
    dw   `13123333                                     ;; 02:69fa $ef $5f
    dw   `13123333                                     ;; 02:69fc $ef $5f
    dw   `13123333                                     ;; 02:69fe $ef $5f
    dw   `13122333                                     ;; 02:6a00 $e7 $5f
    dw   `11312333                                     ;; 02:6a02 $f7 $2f

    dw   `11312333                                     ;; 02:6a04 $f7 $2f
    dw   `01131231                                     ;; 02:6a06 $7b $16
    dw   `00113331                                     ;; 02:6a08 $3f $0e
    dw   `00011111                                     ;; 02:6a0a $1f $00
    dw   `00000000                                     ;; 02:6a0c $00 $00
    dw   `10000000                                     ;; 02:6a0e $80 $00
    dw   `11111000                                     ;; 02:6a10 $f8 $00
    dw   `11331100                                     ;; 02:6a12 $fc $30

    dw   `33213111                                     ;; 02:6a14 $df $e8
    dw   `33332331                                     ;; 02:6a16 $f7 $fe
    dw   `33321331                                     ;; 02:6a18 $ef $f6
    dw   `33321331                                     ;; 02:6a1a $ef $f6
    dw   `33321331                                     ;; 02:6a1c $ef $f6
    dw   `33321331                                     ;; 02:6a1e $ef $f6
    dw   `33332331                                     ;; 02:6a20 $f7 $fe
    dw   `33213111                                     ;; 02:6a22 $df $e8

    dw   `13213110                                     ;; 02:6a24 $de $68
    dw   `13213100                                     ;; 02:6a26 $dc $68
    dw   `13213100                                     ;; 02:6a28 $dc $68
    dw   `13213100                                     ;; 02:6a2a $dc $68
    dw   `00000003                                     ;; 02:6a2c $01 $01
    dw   `00000033                                     ;; 02:6a2e $03 $03
    dw   `00000331                                     ;; 02:6a30 $07 $06
    dw   `00003331                                     ;; 02:6a32 $0f $0e

    dw   `00003311                                     ;; 02:6a34 $0f $0c
    dw   `00033111                                     ;; 02:6a36 $1f $18
    dw   `00031113                                     ;; 02:6a38 $1f $11
    dw   `00331133                                     ;; 02:6a3a $3f $33
    dw   `00311330                                     ;; 02:6a3c $3e $26
    dw   `03113300                                     ;; 02:6a3e $7c $4c
    dw   `03113000                                     ;; 02:6a40 $78 $48
    dw   `33130000                                     ;; 02:6a42 $f0 $d0

    dw   `31330000                                     ;; 02:6a44 $f0 $b0
    dw   `31300000                                     ;; 02:6a46 $e0 $a0
    dw   `33000000                                     ;; 02:6a48 $c0 $c0
    dw   `33000000                                     ;; 02:6a4a $c0 $c0
    dw   `00000000                                     ;; 02:6a4c $00 $00
    dw   `00000000                                     ;; 02:6a4e $00 $00
    dw   `00000003                                     ;; 02:6a50 $01 $01
    dw   `00000333                                     ;; 02:6a52 $07 $07

    dw   `00003331                                     ;; 02:6a54 $0f $0e
    dw   `00333111                                     ;; 02:6a56 $3f $38
    dw   `03331111                                     ;; 02:6a58 $7f $70
    dw   `33111133                                     ;; 02:6a5a $ff $c3
    dw   `31111333                                     ;; 02:6a5c $ff $87
    dw   `11113300                                     ;; 02:6a5e $fc $0c
    dw   `11133000                                     ;; 02:6a60 $f8 $18
    dw   `11330000                                     ;; 02:6a62 $f0 $30

    dw   `13300000                                     ;; 02:6a64 $e0 $60
    dw   `33300000                                     ;; 02:6a66 $e0 $e0
    dw   `30000000                                     ;; 02:6a68 $80 $80
    dw   `00000000                                     ;; 02:6a6a $00 $00
    dw   `00003333                                     ;; 02:6a6c $0f $0f
    dw   `03333331                                     ;; 02:6a6e $7f $7e
    dw   `33331111                                     ;; 02:6a70 $ff $f0
    dw   `31111133                                     ;; 02:6a72 $ff $83

    dw   `11113330                                     ;; 02:6a74 $fe $0e
    dw   `13333000                                     ;; 02:6a76 $f8 $78
    dw   `33300000                                     ;; 02:6a78 $e0 $e0
    dw   `30000000                                     ;; 02:6a7a $80 $80
    dw   `00000000                                     ;; 02:6a7c $00 $00
    dw   `00000000                                     ;; 02:6a7e $00 $00
    dw   `00000000                                     ;; 02:6a80 $00 $00
    dw   `00000000                                     ;; 02:6a82 $00 $00

    dw   `00000000                                     ;; 02:6a84 $00 $00
    dw   `00000000                                     ;; 02:6a86 $00 $00
    dw   `00000000                                     ;; 02:6a88 $00 $00
    dw   `00000000                                     ;; 02:6a8a $00 $00
    dw   `33333300                                     ;; 02:6a8c $fc $fc
    dw   `11133333                                     ;; 02:6a8e $ff $1f
    dw   `33330000                                     ;; 02:6a90 $f0 $f0
    dw   `30000000                                     ;; 02:6a92 $80 $80

    dw   `00000000                                     ;; 02:6a94 $00 $00
    dw   `00000000                                     ;; 02:6a96 $00 $00
    dw   `00000000                                     ;; 02:6a98 $00 $00
    dw   `00000000                                     ;; 02:6a9a $00 $00
    dw   `00000000                                     ;; 02:6a9c $00 $00
    dw   `00000000                                     ;; 02:6a9e $00 $00
    dw   `00000000                                     ;; 02:6aa0 $00 $00
    dw   `00000000                                     ;; 02:6aa2 $00 $00

    dw   `00000000                                     ;; 02:6aa4 $00 $00
    dw   `00000000                                     ;; 02:6aa6 $00 $00
    dw   `00000000                                     ;; 02:6aa8 $00 $00
    dw   `00000000                                     ;; 02:6aaa $00 $00
    dw   `13213100                                     ;; 02:6aac $dc $68
    dw   `13213100                                     ;; 02:6aae $dc $68
    dw   `13213100                                     ;; 02:6ab0 $dc $68

    db   $dc                                           ;; 02:6ab2 .
    db   %01101000                                     ;; 02:6ab3 $68

    dw   `13213100                                     ;; 02:6ab4 $dc $68
    dw   `13213100                                     ;; 02:6ab6 $dc $68
    dw   `13213100                                     ;; 02:6ab8 $dc $68
    dw   `13213100                                     ;; 02:6aba $dc $68
    dw   `13213100                                     ;; 02:6abc $dc $68
    dw   `13213100                                     ;; 02:6abe $dc $68
    dw   `13213100                                     ;; 02:6ac0 $dc $68
    dw   `13213100                                     ;; 02:6ac2 $dc $68

    dw   `11331100                                     ;; 02:6ac4 $fc $30
    dw   `01111000                                     ;; 02:6ac6 $78 $00
    dw   `00000000                                     ;; 02:6ac8 $00 $00
    dw   `00000000                                     ;; 02:6aca $00 $00
    dw   `00000000                                     ;; 02:6acc $00 $00
    dw   `00000000                                     ;; 02:6ace $00 $00
    dw   `00000000                                     ;; 02:6ad0 $00 $00
    dw   `00000000                                     ;; 02:6ad2 $00 $00

    dw   `00000000                                     ;; 02:6ad4 $00 $00
    dw   `10000000                                     ;; 02:6ad6 $80 $00
    dw   `11000000                                     ;; 02:6ad8 $c0 $00
    dw   `31100000                                     ;; 02:6ada $e0 $80
    dw   `13110000                                     ;; 02:6adc $f0 $40
    dw   `11311000                                     ;; 02:6ade $f8 $20
    dw   `21131000                                     ;; 02:6ae0 $78 $90
    dw   `32131000                                     ;; 02:6ae2 $b8 $d0

    dw   `13311000                                     ;; 02:6ae4 $f8 $60
    dw   `11110000                                     ;; 02:6ae6 $f0 $00
    dw   `00000000                                     ;; 02:6ae8 $00 $00
    dw   `00000000                                     ;; 02:6aea $00 $00
    dw   `00000000                                     ;; 02:6aec $00 $00
    dw   `00000000                                     ;; 02:6aee $00 $00
    dw   `00000000                                     ;; 02:6af0 $00 $00
    dw   `00000000                                     ;; 02:6af2 $00 $00

    dw   `00000000                                     ;; 02:6af4 $00 $00
    dw   `10000000                                     ;; 02:6af6 $80 $00
    dw   `11000000                                     ;; 02:6af8 $c0 $00
    dw   `31100000                                     ;; 02:6afa $e0 $80
    dw   `13110000                                     ;; 02:6afc $f0 $40
    dw   `11311000                                     ;; 02:6afe $f8 $20
    dw   `21131100                                     ;; 02:6b00 $7c $90
    dw   `32113110                                     ;; 02:6b02 $be $c8

    dw   `13211311                                     ;; 02:6b04 $df $64
    dw   `11321131                                     ;; 02:6b06 $ef $32
    dw   `01132113                                     ;; 02:6b08 $77 $19
    dw   `00113211                                     ;; 02:6b0a $3b $0c
    dw   `00011321                                     ;; 02:6b0c $1d $06
    dw   `00001132                                     ;; 02:6b0e $0e $03
    dw   `00000113                                     ;; 02:6b10 $07 $01
    dw   `00000011                                     ;; 02:6b12 $03 $00

    dw   `00000001                                     ;; 02:6b14 $01 $00
    dw   `00000000                                     ;; 02:6b16 $00 $00
    dw   `00000000                                     ;; 02:6b18 $00 $00
    dw   `00000000                                     ;; 02:6b1a $00 $00
    dw   `00000000                                     ;; 02:6b1c $00 $00
    dw   `00000000                                     ;; 02:6b1e $00 $00
    dw   `00000000                                     ;; 02:6b20 $00 $00
    dw   `00000000                                     ;; 02:6b22 $00 $00

    dw   `00000000                                     ;; 02:6b24 $00 $00
    dw   `00000000                                     ;; 02:6b26 $00 $00
    dw   `00000000                                     ;; 02:6b28 $00 $00
    dw   `00000000                                     ;; 02:6b2a $00 $00
    dw   `11110000                                     ;; 02:6b2c $f0 $00
    dw   `13311000                                     ;; 02:6b2e $f8 $60
    dw   `13231100                                     ;; 02:6b30 $dc $70
    dw   `13213110                                     ;; 02:6b32 $de $68

    dw   `11321311                                     ;; 02:6b34 $ef $34
    dw   `11322131                                     ;; 02:6b36 $e7 $3a
    dw   `01132113                                     ;; 02:6b38 $77 $19
    dw   `00113211                                     ;; 02:6b3a $3b $0c
    dw   `00011321                                     ;; 02:6b3c $1d $06
    dw   `00001132                                     ;; 02:6b3e $0e $03
    dw   `00000113                                     ;; 02:6b40 $07 $01
    dw   `00000011                                     ;; 02:6b42 $03 $00

    dw   `00000001                                     ;; 02:6b44 $01 $00
    dw   `00000000                                     ;; 02:6b46 $00 $00
    dw   `00000000                                     ;; 02:6b48 $00 $00
    dw   `00000000                                     ;; 02:6b4a $00 $00
    dw   `00011323                                     ;; 02:6b4c $1d $07
    dw   `00001131                                     ;; 02:6b4e $0f $02
    dw   `00001323                                     ;; 02:6b50 $0d $07
    dw   `00001331                                     ;; 02:6b52 $0f $06

    dw   `00001111                                     ;; 02:6b54 $0f $00
    dw   `00000000                                     ;; 02:6b56 $00 $00
    dw   `00000000                                     ;; 02:6b58 $00 $00
    dw   `00000000                                     ;; 02:6b5a $00 $00
    dw   `00000000                                     ;; 02:6b5c $00 $00
    dw   `00000000                                     ;; 02:6b5e $00 $00
    dw   `00000000                                     ;; 02:6b60 $00 $00
    dw   `00000000                                     ;; 02:6b62 $00 $00

    dw   `00000000                                     ;; 02:6b64 $00 $00
    dw   `00000000                                     ;; 02:6b66 $00 $00
    dw   `00000000                                     ;; 02:6b68 $00 $00
    dw   `00000000                                     ;; 02:6b6a $00 $00
    dw   `00000000                                     ;; 02:6b6c $00 $00
    dw   `00000000                                     ;; 02:6b6e $00 $00
    dw   `00000000                                     ;; 02:6b70 $00 $00
    dw   `00000000                                     ;; 02:6b72 $00 $00

    dw   `00000000                                     ;; 02:6b74 $00 $00
    dw   `11110000                                     ;; 02:6b76 $f0 $00
    dw   `13310000                                     ;; 02:6b78 $f0 $60
    dw   `32310000                                     ;; 02:6b7a $b0 $e0
    dw   `13110000                                     ;; 02:6b7c $f0 $40
    dw   `33311000                                     ;; 02:6b7e $f8 $e0
    dw   `31331100                                     ;; 02:6b80 $fc $b0
    dw   `33333110                                     ;; 02:6b82 $fe $f8

    dw   `13313311                                     ;; 02:6b84 $ff $6c
    dw   `11333331                                     ;; 02:6b86 $ff $3e
    dw   `01133131                                     ;; 02:6b88 $7f $1a
    dw   `00113331                                     ;; 02:6b8a $3f $0e
    dw   `11111000                                     ;; 02:6b8c $f8 $00
    dw   `13311000                                     ;; 02:6b8e $f8 $60
    dw   `13231000                                     ;; 02:6b90 $d8 $70
    dw   `13231100                                     ;; 02:6b92 $dc $70

    dw   `13213100                                     ;; 02:6b94 $dc $68
    dw   `13213110                                     ;; 02:6b96 $de $68
    dw   `13211310                                     ;; 02:6b98 $de $64
    dw   `11321311                                     ;; 02:6b9a $ef $34
    dw   `01321131                                     ;; 02:6b9c $6f $32
    dw   `01132131                                     ;; 02:6b9e $77 $1a
    dw   `00132113                                     ;; 02:6ba0 $37 $19
    dw   `00113213                                     ;; 02:6ba2 $3b $0d

    dw   `00013211                                     ;; 02:6ba4 $1b $0c
    dw   `00011321                                     ;; 02:6ba6 $1d $06
    dw   `00001321                                     ;; 02:6ba8 $0d $06
    dw   `00001132                                     ;; 02:6baa $0e $03
    dw   `00000132                                     ;; 02:6bac $06 $03
    dw   `00000113                                     ;; 02:6bae $07 $01
    dw   `00000013                                     ;; 02:6bb0 $03 $01
    dw   `00000011                                     ;; 02:6bb2 $03 $00

    dw   `00000001                                     ;; 02:6bb4 $01 $00
    dw   `00000001                                     ;; 02:6bb6 $01 $00
    dw   `00000000                                     ;; 02:6bb8 $00 $00
    dw   `00000000                                     ;; 02:6bba $00 $00
    dw   `00000000                                     ;; 02:6bbc $00 $00
    dw   `00000000                                     ;; 02:6bbe $00 $00
    dw   `00000000                                     ;; 02:6bc0 $00 $00
    dw   `00000000                                     ;; 02:6bc2 $00 $00

    dw   `00000000                                     ;; 02:6bc4 $00 $00
    dw   `00000000                                     ;; 02:6bc6 $00 $00
    dw   `00000000                                     ;; 02:6bc8 $00 $00
    dw   `00000000                                     ;; 02:6bca $00 $00
    dw   `00000000                                     ;; 02:6bcc $00 $00
    dw   `10000000                                     ;; 02:6bce $80 $00
    dw   `10000000                                     ;; 02:6bd0 $80 $00

    db   $c0                                           ;; 02:6bd2 .
    db   %00000000                                     ;; 02:6bd3 $00

    dw   `31000000                                     ;; 02:6bd4 $c0 $80
    dw   `31100000                                     ;; 02:6bd6 $e0 $80
    dw   `13100000                                     ;; 02:6bd8 $e0 $40
    dw   `13110000                                     ;; 02:6bda $f0 $40
    dw   `11310000                                     ;; 02:6bdc $f0 $20
    dw   `21311000                                     ;; 02:6bde $78 $a0
    dw   `21131000                                     ;; 02:6be0 $78 $90
    dw   `32131100                                     ;; 02:6be2 $bc $d0

    dw   `32113100                                     ;; 02:6be4 $bc $c8
    dw   `13213110                                     ;; 02:6be6 $de $68
    dw   `13211310                                     ;; 02:6be8 $de $64
    dw   `11321311                                     ;; 02:6bea $ef $34
    dw   `01321131                                     ;; 02:6bec $6f $32
    dw   `01132131                                     ;; 02:6bee $77 $1a
    dw   `00132113                                     ;; 02:6bf0 $37 $19
    dw   `00113213                                     ;; 02:6bf2 $3b $0d

    dw   `00013211                                     ;; 02:6bf4 $1b $0c
    dw   `00011321                                     ;; 02:6bf6 $1d $06
    dw   `00001321                                     ;; 02:6bf8 $0d $06
    dw   `00011133                                     ;; 02:6bfa $1f $03
    dw   `00013321                                     ;; 02:6bfc $1d $0e
    dw   `00013233                                     ;; 02:6bfe $1b $0f
    dw   `00011332                                     ;; 02:6c00 $1e $07
    dw   `00001111                                     ;; 02:6c02 $0f $00

    dw   `00000001                                     ;; 02:6c04 $01 $00
    dw   `00000001                                     ;; 02:6c06 $01 $00
    dw   `00000000                                     ;; 02:6c08 $00 $00
    dw   `00000000                                     ;; 02:6c0a $00 $00
    dw   `00000000                                     ;; 02:6c0c $00 $00
    dw   `10000000                                     ;; 02:6c0e $80 $00
    dw   `10000000                                     ;; 02:6c10 $80 $00
    dw   `11000000                                     ;; 02:6c12 $c0 $00

    dw   `31110000                                     ;; 02:6c14 $f0 $80
    dw   `23311000                                     ;; 02:6c16 $78 $e0
    dw   `33231000                                     ;; 02:6c18 $d8 $f0
    dw   `12311000                                     ;; 02:6c1a $b8 $60
    dw   `33110000                                     ;; 02:6c1c $f0 $c0
    dw   `33310000                                     ;; 02:6c1e $f0 $e0
    dw   `31311000                                     ;; 02:6c20 $f8 $a0
    dw   `33331000                                     ;; 02:6c22 $f8 $f0

    dw   `33131100                                     ;; 02:6c24 $fc $d0
    dw   `13333100                                     ;; 02:6c26 $fc $78
    dw   `13313100                                     ;; 02:6c28 $fc $68
    dw   `11333100                                     ;; 02:6c2a $fc $38
    dw   `00000000                                     ;; 02:6c2c $00 $00
    dw   `01111111                                     ;; 02:6c2e $7f $00
    dw   `11333333                                     ;; 02:6c30 $ff $3f
    dw   `13211112                                     ;; 02:6c32 $de $61

    dw   `13112211                                     ;; 02:6c34 $f3 $4c
    dw   `13122331                                     ;; 02:6c36 $e7 $5e
    dw   `13123321                                     ;; 02:6c38 $ed $5e
    dw   `13112332                                     ;; 02:6c3a $f6 $4f
    dw   `13211113                                     ;; 02:6c3c $df $61
    dw   `11322211                                     ;; 02:6c3e $e3 $3c
    dw   `01133322                                     ;; 02:6c40 $7c $1f
    dw   `00111133                                     ;; 02:6c42 $3f $03

    dw   `00000011                                     ;; 02:6c44 $03 $00
    dw   `00000000                                     ;; 02:6c46 $00 $00
    dw   `00000000                                     ;; 02:6c48 $00 $00
    dw   `00000000                                     ;; 02:6c4a $00 $00
    dw   `00000000                                     ;; 02:6c4c $00 $00
    dw   `10000000                                     ;; 02:6c4e $80 $00
    dw   `11000000                                     ;; 02:6c50 $c0 $00
    dw   `31100000                                     ;; 02:6c52 $e0 $80

    dw   `23100000                                     ;; 02:6c54 $60 $c0
    dw   `13100000                                     ;; 02:6c56 $e0 $40
    dw   `23100000                                     ;; 02:6c58 $60 $c0
    dw   `23100000                                     ;; 02:6c5a $60 $c0
    dw   `33110000                                     ;; 02:6c5c $f0 $c0
    dw   `12311000                                     ;; 02:6c5e $b8 $60
    dw   `11131100                                     ;; 02:6c60 $fc $10
    dw   `22113110                                     ;; 02:6c62 $3e $c8

    dw   `33211311                                     ;; 02:6c64 $df $e4
    dw   `11321131                                     ;; 02:6c66 $ef $32
    dw   `01132113                                     ;; 02:6c68 $77 $19
    dw   `00113211                                     ;; 02:6c6a $3b $0c
    dw   `11111100                                     ;; 02:6c6c $fc $00
    dw   `33321110                                     ;; 02:6c6e $ee $f0
    dw   `31133211                                     ;; 02:6c70 $fb $9c
    dw   `32111331                                     ;; 02:6c72 $bf $c6

    dw   `23211133                                     ;; 02:6c74 $5f $e3
    dw   `13223223                                     ;; 02:6c76 $c9 $7f
    dw   `12323113                                     ;; 02:6c78 $af $79
    dw   `11323233                                     ;; 02:6c7a $eb $3f
    dw   `01133333                                     ;; 02:6c7c $7f $1f
    dw   `00111332                                     ;; 02:6c7e $3e $07
    dw   `01133133                                     ;; 02:6c80 $7f $1b
    dw   `11311131                                     ;; 02:6c82 $ff $22

    dw   `13111311                                     ;; 02:6c84 $ff $44
    dw   `13313111                                     ;; 02:6c86 $ff $68
    dw   `13313331                                     ;; 02:6c88 $ff $6e
    dw   `11111331                                     ;; 02:6c8a $ff $06
    dw   `00000001                                     ;; 02:6c8c $01 $00
    dw   `00000111                                     ;; 02:6c8e $07 $00
    dw   `00011133                                     ;; 02:6c90 $1f $03
    dw   `00113333                                     ;; 02:6c92 $3f $0f

    dw   `01133333                                     ;; 02:6c94 $7f $1f
    dw   `01333333                                     ;; 02:6c96 $7f $3f
    dw   `01333333                                     ;; 02:6c98 $7f $3f
    dw   `11333333                                     ;; 02:6c9a $ff $3f
    dw   `13333333                                     ;; 02:6c9c $ff $7f
    dw   `13333333                                     ;; 02:6c9e $ff $7f
    dw   `13333333                                     ;; 02:6ca0 $ff $7f
    dw   `13331333                                     ;; 02:6ca2 $ff $77

    dw   `13131313                                     ;; 02:6ca4 $ff $55
    dw   `13131311                                     ;; 02:6ca6 $ff $54
    dw   `13111311                                     ;; 02:6ca8 $ff $44
    dw   `11101111                                     ;; 02:6caa $ef $00
    dw   `00011100                                     ;; 02:6cac $1c $00
    dw   `00113110                                     ;; 02:6cae $3e $08
    dw   `00113311                                     ;; 02:6cb0 $3f $0c
    dw   `01133331                                     ;; 02:6cb2 $7f $1e

    dw   `01133333                                     ;; 02:6cb4 $7f $1f
    dw   `11333333                                     ;; 02:6cb6 $ff $3f
    dw   `11333333                                     ;; 02:6cb8 $ff $3f
    dw   `13333333                                     ;; 02:6cba $ff $7f
    dw   `13333333                                     ;; 02:6cbc $ff $7f
    dw   `33333333                                     ;; 02:6cbe $ff $ff
    dw   `33333333                                     ;; 02:6cc0 $ff $ff
    dw   `32223333                                     ;; 02:6cc2 $8f $ff

    dw   `33222333                                     ;; 02:6cc4 $c7 $ff
    dw   `33321233                                     ;; 02:6cc6 $eb $f7
    dw   `33322233                                     ;; 02:6cc8 $e3 $ff
    dw   `33332223                                     ;; 02:6cca $f1 $ff

    db   $fd, $ff, $bf, $ff, $ef, $df, $f7, $ef        ;; 02:6ccc ????????
    db   $e4, $fb, $f4, $fb, $fa, $fd, $fe, $7f        ;; 02:6cd4 ????????
    db   $ff, $7f, $ff, $3f, $ff, $3f, $7f, $2f        ;; 02:6cdc ????????
    db   $7f, $0b, $3f, $0b, $1f, $0b, $1f, $01        ;; 02:6ce4 ????????
    db   $00, $00, $07, $00, $1f, $03, $3f, $0f        ;; 02:6cec ????????
    db   $7f, $1e, $7f, $38, $ff, $30, $ff, $60        ;; 02:6cf4 ????????
    db   $ff, $60, $ff, $c6, $ff, $ce, $ff, $ce        ;; 02:6cfc ????????
    db   $ff, $ce, $ff, $cc, $ff, $e0, $ff, $f0        ;; 02:6d04 ????????
    db   $ff, $fa, $ff, $fa, $ff, $ff, $ff, $ff        ;; 02:6d0c ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f        ;; 02:6d14 ????????
    db   $ff, $7f, $ff, $3f, $7f, $3f, $7f, $2f        ;; 02:6d1c ????????
    db   $3f, $0b, $1f, $0b, $1f, $0b, $0f, $01        ;; 02:6d24 ????????
    db   $00, $00, $e0, $00, $fe, $40, $ff, $7c        ;; 02:6d2c ????????
    db   $ff, $26, $7f, $32, $7f, $12, $3f, $18        ;; 02:6d34 ????????
    db   $3e, $08, $3e, $0c, $3e, $1c, $5e, $3c        ;; 02:6d3c ????????
    db   $7a, $3c, $7e, $38, $7c, $30, $78, $00        ;; 02:6d44 ????????
    db   $78, $78, $b4, $cc, $7c, $84, $7a, $86        ;; 02:6d4c ????????
    db   $ba, $c6, $5e, $62, $3d, $23, $2d, $33        ;; 02:6d54 ????????
    db   $1d, $13, $17, $19, $17, $19, $0f, $09        ;; 02:6d5c ????????
    db   $0d, $0b, $0d, $0b, $0e, $0a, $0c, $0c        ;; 02:6d64 ????????
    db   $0e, $0e, $1f, $1b, $7f, $79, $7f, $49        ;; 02:6d6c ????????
    db   $7f, $44, $7b, $64, $df, $f0, $ff, $80        ;; 02:6d74 ????????
    db   $f7, $98, $7f, $60, $ff, $c0, $ff, $88        ;; 02:6d7c ????????
    db   $ff, $f2, $7f, $64, $3f, $3c, $07, $07        ;; 02:6d84 ????????
    db   $00, $00, $03, $03, $06, $07, $0a, $0f        ;; 02:6d8c ????????
    db   $09, $0e, $1b, $1d, $17, $18, $3f, $33        ;; 02:6d94 ????????
    db   $2f, $37, $7f, $6f, $7e, $4f, $7d, $5e        ;; 02:6d9c ????????
    db   $7f, $7d, $1f, $19, $1b, $17, $1f, $1f        ;; 02:6da4 ????????
    db   $00, $00, $00, $00, $00, $00, $1c, $1c        ;; 02:6dac ????????
    db   $3c, $34, $6e, $76, $5e, $66, $de, $ee        ;; 02:6db4 ????????
    db   $9c, $ec, $3f, $df, $36, $cf, $f9, $1e        ;; 02:6dbc ????????
    db   $fb, $7d, $d7, $f8, $cf, $f3, $cf, $f7        ;; 02:6dc4 ????????
    db   $9d, $e3, $bf, $cf, $7e, $bf, $fe, $7f        ;; 02:6dcc ????????
    db   $eb, $fc, $ef, $f3, $f6, $ee, $fe, $c6        ;; 02:6dd4 ????????
    db   $dc, $bc, $e0, $e0, $00, $00, $00, $00        ;; 02:6ddc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6de4 ????????
    db   $f0, $f0, $b8, $d8, $70, $b0, $e0, $60        ;; 02:6dec ????????
    db   $cf, $cf, $7b, $fd, $e7, $fb, $de, $e6        ;; 02:6df4 ????????
    db   $de, $ee, $38, $c8, $78, $98, $f0, $70        ;; 02:6dfc ????????
    db   $c0, $c0, $80, $80, $00, $00, $00, $00        ;; 02:6e04 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6e0c ????????
    db   $00, $00, $00, $00, $e0, $00, $f8, $e0        ;; 02:6e14 ????????
    db   $fc, $f8, $fe, $0c, $0e, $04, $1e, $0c        ;; 02:6e1c ????????
    db   $3f, $1e, $3f, $1e, $1e, $0c, $0c, $00        ;; 02:6e24 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6e2c ????????
    db   $00, $00, $00, $00, $03, $00, $1f, $03        ;; 02:6e34 ????????
    db   $7f, $1f, $ff, $7c, $fc, $e0, $e0, $80        ;; 02:6e3c ????????
    db   $80, $00, $00, $00, $00, $00, $00, $00        ;; 02:6e44 ????????
    db   $00, $00, $01, $00, $07, $01, $0f, $07        ;; 02:6e4c ????????
    db   $1f, $0e, $3e, $1c, $7c, $38, $f8, $70        ;; 02:6e54 ????????
    db   $f0, $e0, $e0, $c0, $c0, $80, $80, $00        ;; 02:6e5c ????????
    db   $80, $00, $00, $00, $00, $00, $00, $00        ;; 02:6e64 ????????
    db   $01, $00, $03, $01, $07, $03, $07, $03        ;; 02:6e6c ????????
    db   $0f, $07, $0f, $06, $1f, $0e, $1e, $0c        ;; 02:6e74 ????????
    db   $3e, $1c, $3c, $18, $3c, $18, $7c, $38        ;; 02:6e7c ????????
    db   $78, $30, $78, $30, $78, $30, $78, $30        ;; 02:6e84 ????????
    db   $7c, $38, $3e, $1c, $3f, $1e, $1f, $0f        ;; 02:6e8c ????????
    db   $0f, $07, $07, $03, $03, $01, $01, $00        ;; 02:6e94 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6e9c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6ea4 ????????
    db   $00, $00, $00, $00, $00, $00, $80, $00        ;; 02:6eac ????????
    db   $c0, $80, $f0, $c0, $f8, $f0, $fc, $f8        ;; 02:6eb4 ????????
    db   $fe, $3c, $3e, $1c, $1f, $0e, $1f, $0e        ;; 02:6ebc ????????
    db   $1f, $0e, $1f, $0e, $3f, $1e, $7e, $3c        ;; 02:6ec4 ????????
    db   $0f, $00, $1f, $07, $3f, $0f, $3f, $1f        ;; 02:6ecc ????????
    db   $3f, $1e, $3e, $1c, $3f, $1c, $3f, $00        ;; 02:6ed4 ????????
    db   $03, $01, $03, $01, $03, $01, $03, $00        ;; 02:6edc ????????
    db   $03, $01, $03, $01, $03, $01, $03, $00        ;; 02:6ee4 ????????
    db   $f0, $00, $f8, $e0, $fc, $f0, $fc, $f8        ;; 02:6eec ????????
    db   $fc, $78, $fc, $38, $fc, $78, $f4, $f8        ;; 02:6ef4 ????????
    db   $e8, $f0, $d0, $e0, $e0, $c0, $e0, $00        ;; 02:6efc ????????
    db   $e0, $c0, $e0, $c0, $e0, $c0, $e0, $00        ;; 02:6f04 ????????
    db   $00, $00, $00, $00, $00, $00, $78, $00        ;; 02:6f0c ????????
    db   $7c, $30, $cf, $78, $dd, $6e, $df, $62        ;; 02:6f14 ????????
    db   $e3, $5e, $df, $7c, $fe, $60, $f0, $40        ;; 02:6f1c ????????
    db   $e0, $00, $40, $00, $00, $00, $00, $00        ;; 02:6f24 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6f2c ????????
    db   $03, $03, $04, $07, $09, $0e, $0b, $0c        ;; 02:6f34 ????????
    db   $0b, $0c, $09, $0e, $04, $07, $03, $03        ;; 02:6f3c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6f44 ????????
    db   $1f, $00, $7f, $1f, $f1, $7e, $ff, $0f        ;; 02:6f4c ????????
    db   $0f, $00, $00, $00, $00, $00, $00, $00        ;; 02:6f54 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6f5c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:6f64 ????????
    db   $f0, $00, $fc, $f0, $ee, $1c, $1b, $e6        ;; 02:6f6c ????????
    db   $c7, $fa, $e7, $3a, $3b, $16, $3e, $14        ;; 02:6f74 ????????
    db   $66, $3c, $6c, $38, $d8, $70, $f0, $60        ;; 02:6f7c ????????
    db   $e0, $00, $00, $00, $00, $00, $00, $00        ;; 02:6f84 ????????
    db   $38, $38, $3c, $3c, $1e, $1e, $0f, $0f        ;; 02:6f8c ????????
    db   $6f, $6f, $7f, $7f, $3f, $3f, $1f, $1f        ;; 02:6f94 ????????
    db   $7f, $7f, $ff, $ff, $ff, $ff, $3f, $3f        ;; 02:6f9c ????????
    db   $3f, $3f, $7f, $7f, $77, $77, $06, $06        ;; 02:6fa4 ????????
    db   $07, $00, $0f, $02, $1d, $07, $3a, $0d        ;; 02:6fac ????????
    db   $7a, $1d, $e7, $38, $df, $60, $e7, $38        ;; 02:6fb4 ????????
    db   $7d, $1e, $3e, $03, $07, $01, $33, $01        ;; 02:6fbc ????????
    db   $1f, $01, $0f, $01, $07, $01, $ff, $01        ;; 02:6fc4 ????????
    db   $01, $00, $a1, $00, $f3, $00, $df, $80        ;; 02:6fcc ????????
    db   $ff, $80, $ff, $8f, $77, $f8, $df, $60        ;; 02:6fd4 ????????
    db   $ff, $40, $bf, $c0, $f5, $8e, $7f, $8e        ;; 02:6fdc ????????
    db   $ef, $1e, $df, $3e, $ff, $3e, $fd, $3e        ;; 02:6fe4 ????????
    db   $db, $3c, $ff, $00, $7d, $83, $bb, $c7        ;; 02:6fec ????????
    db   $ff, $c0, $5f, $e0, $ef, $30, $df, $32        ;; 02:6ff4 ????????
    db   $bf, $72, $7f, $cd, $ff, $80, $df, $80        ;; 02:6ffc ????????
    db   $db, $80, $f3, $00, $a1, $00, $01, $00        ;; 02:7004 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:700c ????????
    db   $03, $00, $07, $01, $0f, $06, $0f, $05        ;; 02:7014 ????????
    db   $0f, $07, $0f, $06, $0f, $03, $03, $00        ;; 02:701c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7024 ????????
    db   $1f, $00, $3f, $0f, $7f, $18, $ff, $37        ;; 02:702c ????????
    db   $ff, $5e, $ff, $77, $7f, $3f, $7f, $19        ;; 02:7034 ????????
    db   $7f, $1f, $ff, $3e, $ff, $3c, $ff, $6c        ;; 02:703c ????????
    db   $7f, $3f, $3f, $0f, $0f, $01, $01, $00        ;; 02:7044 ????????
    db   $fc, $00, $fe, $f0, $ff, $68, $ff, $e4        ;; 02:704c ????????
    db   $ff, $64, $ff, $d2, $ff, $f2, $ff, $b2        ;; 02:7054 ????????
    db   $ff, $da, $ff, $3c, $fe, $38, $fe, $e8        ;; 02:705c ????????
    db   $fe, $b4, $fc, $c8, $f8, $f0, $f0, $00        ;; 02:7064 ????????
    db   $0e, $00, $3e, $06, $7e, $38, $fc, $70        ;; 02:706c ????????
    db   $f0, $40, $e0, $e0, $e0, $40, $e0, $00        ;; 02:7074 ????????
    db   $80, $00, $e0, $00, $f0, $40, $f8, $20        ;; 02:707c ????????
    db   $fc, $60, $fe, $34, $7f, $1c, $3f, $02        ;; 02:7084 ????????
    db   $38, $00, $7e, $18, $3f, $04, $0f, $06        ;; 02:708c ????????
    db   $0f, $02, $07, $02, $03, $00, $01, $00        ;; 02:7094 ????????
    db   $0f, $00, $0f, $05, $1f, $07, $3f, $0b        ;; 02:709c ????????
    db   $7f, $1e, $fe, $4c, $7c, $3c, $f8, $00        ;; 02:70a4 ????????
    db   $3e, $3e, $7f, $43, $e3, $9d, $cd, $b2        ;; 02:70ac ????????
    db   $df, $a0, $ef, $d0, $7c, $63, $39, $36        ;; 02:70b4 ????????
    db   $33, $2c, $7b, $64, $6d, $52, $6f, $50        ;; 02:70bc ????????
    db   $66, $59, $71, $6e, $3f, $31, $1f, $1f        ;; 02:70c4 ????????
    db   $38, $38, $7c, $44, $ce, $b2, $86, $7a        ;; 02:70cc ????????
    db   $e6, $1a, $f6, $0a, $9c, $64, $68, $98        ;; 02:70d4 ????????
    db   $7c, $84, $ce, $32, $be, $42, $fe, $02        ;; 02:70dc ????????
    db   $ee, $92, $fc, $c4, $38, $38, $00, $00        ;; 02:70e4 ????????
    db   $1f, $1f, $3f, $30, $79, $46, $77, $48        ;; 02:70ec ????????
    db   $6f, $50, $67, $58, $31, $2e, $2b, $34        ;; 02:70f4 ????????
    db   $77, $48, $ef, $90, $cf, $b0, $c6, $b9        ;; 02:70fc ????????
    db   $e1, $9e, $73, $4c, $3f, $21, $1f, $1f        ;; 02:7104 ????????
    db   $00, $00, $80, $80, $b8, $b8, $fc, $44        ;; 02:710c ????????
    db   $e6, $1a, $bb, $45, $fb, $05, $f7, $0b        ;; 02:7114 ????????
    db   $ee, $12, $fc, $0c, $f8, $18, $f8, $88        ;; 02:711c ????????
    db   $fc, $c4, $be, $a2, $1f, $19, $07, $07        ;; 02:7124 ????????
    db   $07, $00, $1e, $03, $3e, $0f, $7f, $1f        ;; 02:712c ????????
    db   $78, $3f, $f3, $3f, $f7, $7f, $de, $77        ;; 02:7134 ????????
    db   $ec, $77, $f6, $7d, $df, $7c, $e9, $37        ;; 02:713c ????????
    db   $74, $3b, $7e, $0f, $3f, $07, $0f, $00        ;; 02:7144 ????????
    db   $00, $00, $00, $00, $01, $00, $02, $01        ;; 02:714c ????????
    db   $0d, $03, $34, $0f, $61, $1e, $d5, $3a        ;; 02:7154 ????????
    db   $68, $f7, $cb, $f7, $ee, $ff, $dd, $ff        ;; 02:715c ????????
    db   $fa, $fd, $9d, $fe, $b4, $ff, $c9, $ff        ;; 02:7164 ????????
    db   $bb, $fe, $63, $fe, $17, $fc, $ef, $fc        ;; 02:716c ????????
    db   $5e, $b8, $fc, $70, $fc, $c0, $f0, $00        ;; 02:7174 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:717c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7184 ????????
    db   $70, $00, $a1, $40, $47, $80, $4d, $82        ;; 02:718c ????????
    db   $bf, $04, $d6, $28, $ac, $70, $d8, $60        ;; 02:7194 ????????
    db   $b0, $c0, $60, $80, $58, $80, $70, $80        ;; 02:719c ????????
    db   $e0, $40, $20, $c0, $40, $80, $80, $00        ;; 02:71a4 ????????
    db   $00, $00, $3e, $00, $7e, $1c, $66, $3c        ;; 02:71ac ????????
    db   $f6, $2c, $de, $6c, $ce, $78, $fc, $70        ;; 02:71b4 ????????
    db   $f8, $00, $00, $00, $3e, $00, $3a, $1c        ;; 02:71bc ????????
    db   $37, $1c, $2b, $1e, $3f, $06, $0f, $00        ;; 02:71c4 ????????
    db   $01, $01, $02, $03, $05, $06, $05, $06        ;; 02:71cc ????????
    db   $02, $03, $01, $01, $00, $00, $00, $00        ;; 02:71d4 ????????
    db   $00, $00, $00, $00, $38, $38, $54, $6c        ;; 02:71dc ????????
    db   $b4, $cc, $e8, $98, $e8, $98, $f8, $88        ;; 02:71e4 ????????
    db   $e0, $e0, $18, $f8, $f6, $0e, $fd, $03        ;; 02:71ec ????????
    db   $fe, $01, $ff, $e0, $1f, $18, $07, $04        ;; 02:71f4 ????????
    db   $03, $02, $02, $03, $01, $01, $01, $01        ;; 02:71fc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7204 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:720c ????????
    db   $80, $80, $40, $c0, $c0, $40, $e0, $20        ;; 02:7214 ????????
    db   $e0, $20, $d0, $30, $f0, $10, $68, $98        ;; 02:721c ????????
    db   $f8, $88, $b4, $cc, $7c, $44, $5a, $66        ;; 02:7224 ????????
    db   $f4, $8c, $7a, $46, $7d, $43, $3f, $20        ;; 02:722c ????????
    db   $1f, $10, $0f, $0c, $03, $03, $00, $00        ;; 02:7234 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:723c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7244 ????????
    db   $00, $00, $00, $00, $80, $80, $7c, $fc        ;; 02:724c ????????
    db   $e3, $1f, $ff, $00, $bf, $c0, $79, $7e        ;; 02:7254 ????????
    db   $07, $07, $01, $01, $03, $03, $07, $04        ;; 02:725c ????????
    db   $0f, $08, $1f, $10, $3f, $21, $7d, $43        ;; 02:7264 ????????
    db   $3e, $22, $2d, $33, $1f, $11, $1e, $11        ;; 02:726c ????????
    db   $d7, $d8, $37, $f8, $ff, $00, $ff, $00        ;; 02:7274 ????????
    db   $3f, $c0, $ff, $e0, $ff, $00, $f7, $38        ;; 02:727c ????????
    db   $df, $60, $bf, $c3, $74, $8c, $e8, $18        ;; 02:7284 ????????
    db   $71, $71, $ee, $9f, $f1, $8e, $7f, $40        ;; 02:728c ????????
    db   $3e, $31, $0f, $0f, $00, $00, $00, $00        ;; 02:7294 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:729c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:72a4 ????????
    db   $fb, $87, $f4, $0c, $e8, $18, $b0, $70        ;; 02:72ac ????????
    db   $c0, $c0, $00, $00, $00, $00, $00, $00        ;; 02:72b4 ????????
    db   $03, $03, $04, $07, $05, $06, $03, $02        ;; 02:72bc ????????
    db   $01, $01, $00, $00, $00, $00, $00, $00        ;; 02:72c4 ????????
    db   $68, $98, $f8, $88, $bc, $c4, $5e, $62        ;; 02:72cc ????????
    db   $2f, $31, $17, $19, $17, $19, $1f, $11        ;; 02:72d4 ????????
    db   $ae, $b2, $5e, $e2, $fc, $04, $e8, $18        ;; 02:72dc ????????
    db   $f0, $f0, $00, $00, $00, $00, $00, $00        ;; 02:72e4 ????????
    db   $70, $30, $76, $32, $3e, $18, $1b, $09        ;; 02:72ec ????????
    db   $1f, $0d, $3f, $17, $ff, $db, $ff, $eb        ;; 02:72f4 ????????
    db   $ff, $6f, $fe, $3e, $fc, $7c, $f8, $b8        ;; 02:72fc ????????
    db   $f0, $b0, $e0, $e0, $c0, $c0, $80, $80        ;; 02:7304 ????????
    db   $70, $30, $76, $32, $3e, $18, $1b, $09        ;; 02:730c ????????
    db   $1f, $0d, $3f, $17, $ff, $db, $ff, $eb        ;; 02:7314 ????????
    db   $ff, $6f, $ff, $3e, $fc, $7f, $fc, $bb        ;; 02:731c ????????
    db   $fa, $b5, $fd, $fe, $c6, $c5, $87, $87        ;; 02:7324 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:732c ????????
    db   $00, $00, $00, $00, $07, $07, $1f, $1d        ;; 02:7334 ????????
    db   $18, $17, $37, $38, $34, $2b, $34, $3b        ;; 02:733c ????????
    db   $1a, $15, $1d, $1e, $06, $05, $07, $07        ;; 02:7344 ????????
    db   $c0, $40, $70, $f0, $b0, $50, $5c, $bc        ;; 02:734c ????????
    db   $2c, $d4, $17, $ef, $8b, $75, $45, $bb        ;; 02:7354 ????????
    db   $a2, $5d, $d1, $ee, $68, $57, $74, $7b        ;; 02:735c ????????
    db   $1a, $15, $1d, $1e, $06, $05, $07, $07        ;; 02:7364 ????????
    db   $c0, $40, $70, $f0, $b0, $50, $58, $b8        ;; 02:736c ????????
    db   $28, $d0, $1c, $ec, $92, $7e, $79, $bf        ;; 02:7374 ????????
    db   $fd, $7f, $2d, $3f, $5f, $7f, $ae, $ee        ;; 02:737c ????????
    db   $c0, $c0, $00, $00, $00, $00, $00, $00        ;; 02:7384 ????????
    db   $1c, $00, $2a, $1c, $5d, $36, $be, $63        ;; 02:738c ????????
    db   $ff, $41, $bf, $60, $5f, $30, $2f, $18        ;; 02:7394 ????????
    db   $2f, $1c, $5b, $36, $bd, $63, $7f, $c1        ;; 02:739c ????????
    db   $be, $63, $5d, $36, $2a, $1c, $14, $08        ;; 02:73a4 ????????
    db   $f8, $e0, $d8, $b0, $bc, $d0, $fe, $68        ;; 02:73ac ????????
    db   $ff, $14, $3f, $0b, $1f, $05, $0f, $06        ;; 02:73b4 ????????
    db   $0d, $07, $0c, $07, $0c, $07, $0e, $03        ;; 02:73bc ????????
    db   $07, $01, $03, $00, $01, $00, $00, $00        ;; 02:73c4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:73cc ????????
    db   $f0, $00, $f8, $e0, $1c, $f0, $8e, $f8        ;; 02:73d4 ????????
    db   $c7, $7c, $ff, $a2, $71, $df, $7f, $ae        ;; 02:73dc ????????
    db   $5f, $b4, $df, $ba, $df, $76, $ff, $20        ;; 02:73e4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:73ec ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:73f4 ????????
    db   $00, $00, $07, $07, $0b, $0c, $1e, $11        ;; 02:73fc ????????
    db   $3b, $27, $54, $6c, $78, $48, $68, $58        ;; 02:7404 ????????
    db   $00, $00, $07, $07, $0b, $0c, $1e, $11        ;; 02:740c ????????
    db   $3b, $27, $54, $6c, $78, $48, $68, $58        ;; 02:7414 ????????
    db   $68, $58, $78, $48, $54, $6c, $3b, $27        ;; 02:741c ????????
    db   $1e, $11, $0b, $0c, $07, $07, $00, $00        ;; 02:7424 ????????
    db   $68, $58, $78, $48, $54, $6c, $3b, $27        ;; 02:742c ????????
    db   $1e, $11, $0b, $0c, $07, $07, $00, $00        ;; 02:7434 ????????
    db   $00, $00, $07, $07, $0b, $0c, $1e, $11        ;; 02:743c ????????
    db   $3b, $27, $54, $6c, $78, $48, $68, $58        ;; 02:7444 ????????
    db   $68, $58, $78, $48, $54, $6c, $3b, $27        ;; 02:744c ????????
    db   $1e, $11, $0b, $0c, $07, $07, $00, $00        ;; 02:7454 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:745c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7464 ????????
    db   $00, $00, $1f, $00, $3f, $0f, $78, $1f        ;; 02:746c ????????
    db   $72, $3d, $e6, $39, $ec, $73, $c8, $77        ;; 02:7474 ????????
    db   $f1, $7f, $fa, $3f, $70, $3f, $69, $37        ;; 02:747c ????????
    db   $f4, $6f, $d6, $6f, $f3, $6f, $ea, $37        ;; 02:7484 ????????
    db   $3f, $00, $ff, $1f, $e7, $78, $df, $e2        ;; 02:748c ????????
    db   $f6, $9d, $9f, $fb, $76, $fd, $f9, $fe        ;; 02:7494 ????????
    db   $33, $fc, $67, $f8, $e6, $f9, $80, $ff        ;; 02:749c ????????
    db   $50, $bf, $52, $bf, $2e, $df, $85, $fe        ;; 02:74a4 ????????
    db   $03, $00, $07, $01, $0f, $02, $0d, $06        ;; 02:74ac ????????
    db   $1d, $06, $19, $0e, $39, $0e, $39, $1e        ;; 02:74b4 ????????
    db   $6b, $3f, $7d, $2e, $db, $6f, $ef, $5f        ;; 02:74bc ????????
    db   $df, $7e, $fd, $66, $ff, $42, $e3, $00        ;; 02:74c4 ????????
    db   $03, $00, $03, $00, $01, $00, $01, $00        ;; 02:74cc ????????
    db   $03, $00, $03, $00, $01, $00, $01, $00        ;; 02:74d4 ????????
    db   $03, $00, $03, $00, $01, $00, $01, $00        ;; 02:74dc ????????
    db   $03, $00, $03, $00, $01, $00, $01, $00        ;; 02:74e4 ????????
    db   $3f, $00, $7f, $0f, $70, $1f, $65, $3b        ;; 02:74ec ????????
    db   $6b, $36, $6f, $36, $7f, $1d, $1e, $03        ;; 02:74f4 ????????
    db   $0e, $03, $07, $01, $03, $00, $01, $00        ;; 02:74fc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7504 ????????
    db   $f0, $00, $f0, $c0, $e0, $80, $c0, $00        ;; 02:750c ????????
    db   $80, $00, $c0, $00, $e0, $80, $70, $c0        ;; 02:7514 ????????
    db   $b8, $60, $5f, $b0, $af, $de, $d3, $6f        ;; 02:751c ????????
    db   $ec, $33, $6e, $31, $77, $38, $73, $1c        ;; 02:7524 ????????
    db   $39, $1e, $3c, $0f, $1e, $07, $0f, $03        ;; 02:752c ????????
    db   $07, $01, $03, $00, $01, $00, $00, $00        ;; 02:7534 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:753c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7544 ????????
    db   $ef, $1c, $df, $3c, $bb, $66, $63, $de        ;; 02:754c ????????
    db   $e7, $de, $cf, $fc, $fe, $38, $fc, $00        ;; 02:7554 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:755c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7564 ????????
    db   $7f, $00, $df, $2e, $bf, $5b, $d7, $39        ;; 02:756c ????????
    db   $ab, $55, $d6, $2b, $7f, $07, $3a, $0d        ;; 02:7574 ????????
    db   $7c, $1f, $f2, $3f, $f3, $7f, $de, $7f        ;; 02:757c ????????
    db   $c9, $7f, $f9, $3f, $7f, $07, $0f, $00        ;; 02:7584 ????????
    db   $7c, $00, $fe, $38, $d6, $6c, $a6, $dc        ;; 02:758c ????????
    db   $c7, $fc, $ab, $7e, $17, $fa, $bb, $f6        ;; 02:7594 ????????
    db   $5f, $ec, $ee, $d8, $7c, $b0, $b8, $60        ;; 02:759c ????????
    db   $70, $c0, $e0, $80, $c0, $00, $80, $00        ;; 02:75a4 ????????
    db   $3f, $00, $5f, $3f, $be, $7d, $f7, $6f        ;; 02:75ac ????????
    db   $eb, $77, $f6, $7f, $fe, $5d, $db, $7d        ;; 02:75b4 ????????
    db   $fb, $3f, $6e, $37, $77, $1f, $3f, $0d        ;; 02:75bc ????????
    db   $3d, $07, $0f, $03, $4f, $00, $11, $00        ;; 02:75c4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:75cc ????????
    db   $03, $00, $07, $03, $0e, $07, $0c, $07        ;; 02:75d4 ????????
    db   $0c, $07, $0e, $07, $07, $03, $03, $00        ;; 02:75dc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:75e4 ????????
    db   $03, $00, $0f, $03, $1f, $0f, $3c, $1f        ;; 02:75ec ????????
    db   $78, $3f, $73, $3c, $e7, $78, $e7, $78        ;; 02:75f4 ????????
    db   $e7, $78, $e7, $78, $73, $3c, $78, $3f        ;; 02:75fc ????????
    db   $3c, $1f, $1f, $0f, $0f, $03, $03, $00        ;; 02:7604 ????????
    db   $07, $00, $1f, $07, $3f, $1e, $7e, $38        ;; 02:760c ????????
    db   $7c, $30, $f8, $70, $f0, $60, $f0, $60        ;; 02:7614 ????????
    db   $f0, $60, $f0, $60, $f8, $70, $7c, $30        ;; 02:761c ????????
    db   $7e, $38, $3f, $1e, $1f, $07, $07, $00        ;; 02:7624 ????????
    db   $e0, $00, $f8, $e0, $fc, $38, $3e, $0c        ;; 02:762c ????????
    db   $0e, $04, $07, $02, $03, $00, $00, $00        ;; 02:7634 ????????
    db   $00, $00, $03, $00, $07, $02, $0e, $04        ;; 02:763c ????????
    db   $3e, $0c, $fc, $38, $f8, $e0, $e0, $00        ;; 02:7644 ????????
    db   $03, $00, $1e, $01, $23, $1c, $40, $3f        ;; 02:764c ????????
    db   $40, $3f, $80, $7f, $9f, $60, $a0, $5f        ;; 02:7654 ????????
    db   $a0, $5f, $80, $7f, $c0, $3f, $40, $3f        ;; 02:765c ????????
    db   $40, $3f, $20, $1f, $1d, $02, $06, $01        ;; 02:7664 ????????
    db   $e0, $00, $18, $e0, $04, $f8, $84, $78        ;; 02:766c ????????
    db   $42, $bc, $42, $bc, $26, $d8, $86, $78        ;; 02:7674 ????????
    db   $49, $b6, $09, $f6, $11, $ee, $01, $fe        ;; 02:767c ????????
    db   $02, $fc, $46, $b8, $86, $78, $0a, $f4        ;; 02:7684 ????????
    db   $02, $01, $02, $01, $01, $00, $02, $01        ;; 02:768c ????????
    db   $02, $01, $04, $03, $05, $02, $06, $01        ;; 02:7694 ????????
    db   $06, $01, $04, $03, $02, $01, $01, $00        ;; 02:769c ????????
    db   $01, $00, $01, $00, $00, $00, $00, $00        ;; 02:76a4 ????????
    db   $34, $c8, $c4, $38, $08, $f0, $10, $e0        ;; 02:76ac ????????
    db   $60, $80, $a0, $40, $40, $80, $40, $80        ;; 02:76b4 ????????
    db   $80, $00, $80, $00, $80, $00, $80, $00        ;; 02:76bc ????????
    db   $80, $00, $00, $00, $00, $00, $00, $00        ;; 02:76c4 ????????
    db   $01, $01, $00, $00, $14, $14, $01, $01        ;; 02:76cc ????????
    db   $0e, $0e, $23, $23, $95, $95, $0f, $0f        ;; 02:76d4 ????????
    db   $2f, $2f, $37, $37, $9f, $9f, $2f, $2f        ;; 02:76dc ????????
    db   $7f, $7f, $5f, $5f, $3f, $3f, $bf, $bf        ;; 02:76e4 ????????
    db   $04, $04, $2a, $2a, $df, $df, $af, $af        ;; 02:76ec ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 02:76f4 ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 02:76fc ????????
    db   $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff        ;; 02:7704 ????????
    db   $02, $02, $15, $15, $5f, $5f, $af, $af        ;; 02:770c ????????
    db   $1f, $1f, $7f, $7f, $3f, $3f, $bf, $bf        ;; 02:7714 ????????
    db   $7f, $7f, $bf, $bf, $7f, $7f, $3f, $3f        ;; 02:771c ????????
    db   $5f, $5f, $2f, $2f, $0b, $0b, $15, $15        ;; 02:7724 ????????
    db   $06, $f9, $9c, $62, $70, $8c, $40, $b0        ;; 02:772c ????????
    db   $00, $c0, $00, $00, $00, $00, $00, $00        ;; 02:7734 ????????
    db   $00, $01, $00, $07, $03, $1c, $0c, $73        ;; 02:773c ????????
    db   $38, $c6, $60, $9d, $c0, $37, $23, $dc        ;; 02:7744 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:774c ????????
    db   $00, $01, $00, $0f, $07, $18, $08, $77        ;; 02:7754 ????????
    db   $30, $cf, $c7, $38, $08, $f7, $30, $cf        ;; 02:775c ????????
    db   $03, $7c, $1c, $e3, $e0, $1c, $00, $f0        ;; 02:7764 ????????
    db   $00, $01, $00, $07, $03, $04, $01, $1e        ;; 02:776c ????????
    db   $0e, $f1, $f0, $0f, $01, $fe, $0e, $f1        ;; 02:7774 ????????
    db   $f0, $0f, $07, $f8, $00, $af, $00, $e0        ;; 02:777c ????????
    db   $80, $60, $00, $c0, $00, $00, $00, $00        ;; 02:7784 ????????
    db   $18, $e6, $e0, $1a, $04, $fb, $ff, $00        ;; 02:778c ????????
    db   $06, $f9, $78, $87, $80, $7c, $00, $c0        ;; 02:7794 ????????
    db   $c0, $20, $00, $e0, $00, $00, $00, $00        ;; 02:779c ????????
    db   $00, $00, $00, $03, $01, $1e, $0e, $71        ;; 02:77a4 ????????
    db   $00, $00, $3c, $3c, $5a, $66, $a5, $db        ;; 02:77ac ????????
    db   $db, $bd, $66, $a5, $a5, $66, $c3, $42        ;; 02:77b4 ????????
    db   $42, $c3, $81, $81, $81, $81, $00, $00        ;; 02:77bc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:77c4 ????????
    db   $00, $00, $00, $00, $01, $00, $03, $00        ;; 02:77cc ????????
    db   $03, $01, $03, $01, $43, $01, $e7, $01        ;; 02:77d4 ????????
    db   $e7, $43, $ff, $43, $ff, $6f, $ff, $6f        ;; 02:77dc ????????
    db   $7f, $3f, $7f, $3f, $ff, $3e, $ff, $7c        ;; 02:77e4 ????????
    db   $0f, $00, $0f, $04, $1e, $04, $9e, $0c        ;; 02:77ec ????????
    db   $bc, $08, $fc, $18, $fc, $38, $fc, $b0        ;; 02:77f4 ????????
    db   $f8, $e0, $f0, $e0, $f0, $e0, $f8, $e0        ;; 02:77fc ????????
    db   $fe, $f0, $f8, $00, $80, $00, $00, $00        ;; 02:7804 ????????
    db   $fe, $7c, $fe, $fc, $ff, $fc, $ff, $fe        ;; 02:780c ????????
    db   $ff, $f6, $ff, $f2, $ff, $e0, $f2, $e0        ;; 02:7814 ????????
    db   $f2, $e0, $f0, $e0, $f0, $e0, $f0, $c0        ;; 02:781c ????????
    db   $f0, $40, $e0, $40, $e0, $00, $40, $00        ;; 02:7824 ????????
    db   $e6, $00, $fe, $c0, $fd, $a0, $df, $b8        ;; 02:782c ????????
    db   $cf, $b4, $e7, $da, $e3, $5d, $f1, $2e        ;; 02:7834 ????????
    db   $7c, $13, $3d, $0e, $1d, $03, $0f, $00        ;; 02:783c ????????
    db   $01, $00, $01, $00, $03, $00, $01, $00        ;; 02:7844 ????????
    db   $30, $00, $60, $00, $fc, $00, $de, $0c        ;; 02:784c ????????
    db   $db, $0e, $ff, $0a, $f7, $8a, $ff, $76        ;; 02:7854 ????????
    db   $79, $97, $ef, $31, $f1, $ef, $ef, $5f        ;; 02:785c ????????
    db   $df, $70, $fc, $b0, $f8, $e0, $f0, $00        ;; 02:7864 ????????
    db   $07, $00, $1f, $03, $3f, $0c, $70, $1f        ;; 02:786c ????????
    db   $6c, $3f, $f7, $2f, $f3, $4f, $f3, $4e        ;; 02:7874 ????????
    db   $e7, $5e, $e7, $5f, $ec, $3f, $68, $3f        ;; 02:787c ????????
    db   $73, $1c, $3f, $0c, $1f, $03, $07, $00        ;; 02:7884 ????????
    db   $e0, $00, $f8, $c0, $fc, $30, $ce, $38        ;; 02:788c ????????
    db   $16, $fc, $37, $fc, $e7, $fa, $e7, $7a        ;; 02:7894 ????????
    db   $cf, $72, $cf, $f2, $e7, $fc, $36, $fc        ;; 02:789c ????????
    db   $0e, $f8, $fc, $30, $f8, $c0, $e0, $00        ;; 02:78a4 ????????
    db   $07, $00, $1f, $03, $3c, $0f, $7d, $13        ;; 02:78ac ????????
    db   $79, $27, $f1, $2f, $e3, $5f, $ef, $5e        ;; 02:78b4 ????????
    db   $df, $7e, $c3, $7f, $f1, $2f, $79, $27        ;; 02:78bc ????????
    db   $7c, $13, $3f, $0c, $1f, $03, $07, $00        ;; 02:78c4 ????????
    db   $e0, $00, $f8, $c0, $fc, $30, $3e, $c8        ;; 02:78cc ????????
    db   $9e, $e4                                      ;; 02:78d4 ??

data_02_78d6:
    db   $8f, $f4, $c3, $fe, $fb, $7e, $f7, $7a        ;; 02:78d6 ????????
    db   $c7, $fa, $8f, $f4, $9e, $e4, $be, $c8        ;; 02:78de ????????
    db   $3c, $f0, $f8, $c0, $e0, $00, $00, $00        ;; 02:78e6 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:78ee ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:78f6 ????????
    db   $00, $00, $03, $00, $1f, $03, $3f, $1f        ;; 02:78fe ????????
    db   $7f, $3f, $ff, $7c, $fc, $78, $00, $00        ;; 02:7906 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:790e ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7916 ????????
    db   $00, $00, $ff, $00, $ff, $ff, $ff, $ff        ;; 02:791e ????????
    db   $ff, $ff, $ff, $00, $00, $00, $00, $00        ;; 02:7926 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:792e ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7936 ????????
    db   $ff, $00, $ff, $ff, $ff, $ff, $ff, $ff        ;; 02:793e ????????
    db   $ff, $00, $00, $00, $00, $00, $00, $00        ;; 02:7946 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:794e ????????
    db   $00, $00, $00, $00, $00, $00, $7f, $3e        ;; 02:7956 ????????
    db   $ff, $7e, $fe, $fc, $fc, $f8, $f8, $c0        ;; 02:795e ????????
    db   $c0, $00, $00, $00, $00, $00, $fc, $78        ;; 02:7966 ????????
    db   $ff, $7c, $7f, $3f, $37, $17, $1f, $03        ;; 02:796e ????????
    db   $03, $00, $00, $00, $00, $00, $00, $00        ;; 02:7976 ????????
    db   $00, $00, $03, $00, $1f, $03, $3f, $1f        ;; 02:797e ????????
    db   $7f, $3f, $ff, $7c, $fc, $78, $00, $00        ;; 02:7986 ????????
    db   $ff, $00, $ff, $ff, $ff, $ff, $ff, $ff        ;; 02:798e ????????
    db   $ff, $00, $00, $00, $00, $00, $00, $00        ;; 02:7996 ????????
    db   $00, $00, $ff, $00, $ff, $ff, $ff, $ff        ;; 02:799e ????????
    db   $ff, $ff, $ff, $00, $00, $00, $00, $00        ;; 02:79a6 ????????
    db   $00, $00, $ff, $00, $ff, $ff, $ff, $ff        ;; 02:79ae ????????
    db   $ff, $ff, $ff, $00, $00, $00, $00, $00        ;; 02:79b6 ????????
    db   $ff, $00, $ff, $ff, $ff, $ff, $ff, $ff        ;; 02:79be ????????
    db   $ff, $00                                      ;; 02:79c6 ??

data_02_79c8:
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:79c8 ????????
    db   $c0, $00, $f8, $c0, $fc, $f8, $fe, $fc        ;; 02:79d0 ????????
    db   $ff, $7e, $7f, $3e, $7f, $3e, $ff, $7e        ;; 02:79d8 ????????
    db   $fe, $fc, $fc, $f8, $f8, $c0, $c0, $00        ;; 02:79e0 ????????
    db   $00, $00, $00, $00                            ;; 02:79e8 ????
    dw   `00000000                                     ;; 02:79ec $00 $00
    dw   `00000000                                     ;; 02:79ee $00 $00
    dw   `00000000                                     ;; 02:79f0 $00 $00
    dw   `00000000                                     ;; 02:79f2 $00 $00
    dw   `02000000                                     ;; 02:79f4 $00 $40
    dw   `02200000                                     ;; 02:79f6 $00 $60
    dw   `02320000                                     ;; 02:79f8 $20 $70
    dw   `02232000                                     ;; 02:79fa $10 $78

    dw   `02232000                                     ;; 02:79fc $10 $78
    dw   `02332000                                     ;; 02:79fe $30 $78
    dw   `22333200                                     ;; 02:7a00 $38 $fc
    dw   `22033320                                     ;; 02:7a02 $1c $de
    dw   `22033320                                     ;; 02:7a04 $1c $de
    dw   `22333322                                     ;; 02:7a06 $3c $ff
    dw   `23303332                                     ;; 02:7a08 $6e $ef
    dw   `23000332                                     ;; 02:7a0a $46 $c7

    dw   `00000000                                     ;; 02:7a0c $00 $00
    dw   `00000000                                     ;; 02:7a0e $00 $00
    dw   `00000000                                     ;; 02:7a10 $00 $00
    dw   `00000000                                     ;; 02:7a12 $00 $00
    dw   `00000000                                     ;; 02:7a14 $00 $00
    dw   `00000000                                     ;; 02:7a16 $00 $00
    dw   `00000000                                     ;; 02:7a18 $00 $00
    dw   `00000000                                     ;; 02:7a1a $00 $00

    dw   `00000000                                     ;; 02:7a1c $00 $00
    dw   `00000000                                     ;; 02:7a1e $00 $00
    dw   `22200000                                     ;; 02:7a20 $00 $e0
    dw   `23200000                                     ;; 02:7a22 $40 $e0
    dw   `23220000                                     ;; 02:7a24 $40 $f0
    dw   `22322000                                     ;; 02:7a26 $20 $f8
    dw   `22332000                                     ;; 02:7a28 $30 $f8
    dw   `22332000                                     ;; 02:7a2a $30 $f8

    dw   `00000000                                     ;; 02:7a2c $00 $00
    dw   `00000000                                     ;; 02:7a2e $00 $00
    dw   `00000000                                     ;; 02:7a30 $00 $00
    dw   `00000000                                     ;; 02:7a32 $00 $00
    dw   `00000000                                     ;; 02:7a34 $00 $00
    dw   `00000000                                     ;; 02:7a36 $00 $00
    dw   `00000000                                     ;; 02:7a38 $00 $00
    dw   `00000000                                     ;; 02:7a3a $00 $00

    dw   `00000000                                     ;; 02:7a3c $00 $00
    dw   `00000002                                     ;; 02:7a3e $00 $01
    dw   `00000022                                     ;; 02:7a40 $00 $03
    dw   `00002203                                     ;; 02:7a42 $01 $0d
    dw   `00002323                                     ;; 02:7a44 $05 $0f
    dw   `00002323                                     ;; 02:7a46 $05 $0f
    dw   `00002332                                     ;; 02:7a48 $06 $0f
    dw   `00002303                                     ;; 02:7a4a $05 $0d

    dw   `00222303                                     ;; 02:7a4c $05 $3d
    dw   `00232200                                     ;; 02:7a4e $10 $3c
    dw   `00233220                                     ;; 02:7a50 $18 $3e
    dw   `00233333                                     ;; 02:7a52 $1f $3f
    dw   `00230323                                     ;; 02:7a54 $15 $37
    dw   `00020332                                     ;; 02:7a56 $06 $17
    dw   `00022032                                     ;; 02:7a58 $02 $1b
    dw   `00002003                                     ;; 02:7a5a $01 $09

    dw   `00002303                                     ;; 02:7a5c $05 $0d
    dw   `00002233                                     ;; 02:7a5e $03 $0f
    dw   `00002223                                     ;; 02:7a60 $01 $0f
    dw   `00222333                                     ;; 02:7a62 $07 $3f
    dw   `02233300                                     ;; 02:7a64 $1c $7c
    dw   `00222333                                     ;; 02:7a66 $07 $3f
    dw   `00002223                                     ;; 02:7a68 $01 $0f
    dw   `00000022                                     ;; 02:7a6a $00 $03

    dw   `00000002                                     ;; 02:7a6c $00 $01
    dw   `00002222                                     ;; 02:7a6e $00 $0f
    dw   `00022322                                     ;; 02:7a70 $04 $1f
    dw   `00023323                                     ;; 02:7a72 $0d $1f
    dw   `00233322                                     ;; 02:7a74 $1c $3f
    dw   `00233333                                     ;; 02:7a76 $1f $3f
    dw   `00233333                                     ;; 02:7a78 $1f $3f
    dw   `02233233                                     ;; 02:7a7a $1b $7f

    dw   `02332233                                     ;; 02:7a7c $33 $7f
    dw   `02332332                                     ;; 02:7a7e $36 $7f
    dw   `22332332                                     ;; 02:7a80 $36 $ff
    dw   `22332332                                     ;; 02:7a82 $36 $ff
    dw   `33332232                                     ;; 02:7a84 $f2 $ff
    dw   `33332232                                     ;; 02:7a86 $f2 $ff
    dw   `30332222                                     ;; 02:7a88 $b0 $bf
    dw   `30322202                                     ;; 02:7a8a $a0 $bd

    dw   `20320202                                     ;; 02:7a8c $20 $b5
    dw   `23320220                                     ;; 02:7a8e $60 $f6
    dw   `32332321                                     ;; 02:7a90 $b5 $fe
    dw   `32323222                                     ;; 02:7a92 $a8 $ff
    dw   `32322022                                     ;; 02:7a94 $a0 $fb
    dw   `23232212                                     ;; 02:7a96 $52 $fd
    dw   `20211221                                     ;; 02:7a98 $19 $a6
    dw   `20221221                                     ;; 02:7a9a $09 $b6

    dw   `22011121                                     ;; 02:7a9c $1d $c2
    dw   `32212111                                     ;; 02:7a9e $97 $e8
    dw   `33221012                                     ;; 02:7aa0 $ca $f1
    dw   `22332110                                     ;; 02:7aa2 $36 $f8
    dw   `02222211                                     ;; 02:7aa4 $03 $7c
    dw   `33332222                                     ;; 02:7aa6 $f0 $ff
    dw   `33333332                                     ;; 02:7aa8 $fe $ff
    dw   `22222333                                     ;; 02:7aaa $07 $ff

    dw   `23232333                                     ;; 02:7aac $57 $ff
    dw   `33332333                                     ;; 02:7aae $f7 $ff
    dw   `32333333                                     ;; 02:7ab0 $bf $ff
    dw   `23333332                                     ;; 02:7ab2 $7e $ff
    dw   `33033332                                     ;; 02:7ab4 $de $df
    dw   `33303333                                     ;; 02:7ab6 $ef $ef
    dw   `03303233                                     ;; 02:7ab8 $6b $6f
    dw   `33003223                                     ;; 02:7aba $c9 $cf

    dw   `33000323                                     ;; 02:7abc $c5 $c7
    dw   `33200320                                     ;; 02:7abe $c4 $e6
    dw   `33230220                                     ;; 02:7ac0 $d0 $f6
    dw   `33230230                                     ;; 02:7ac2 $d2 $f6
    dw   `33223203                                     ;; 02:7ac4 $c9 $fd
    dw   `32223233                                     ;; 02:7ac6 $8b $ff
    dw   `32222232                                     ;; 02:7ac8 $82 $ff
    dw   `32223221                                     ;; 02:7aca $89 $fe

    dw   `23212211                                     ;; 02:7acc $53 $ec
    dw   `22211210                                     ;; 02:7ace $1a $e4
    dw   `12211110                                     ;; 02:7ad0 $9e $60
    dw   `12011100                                     ;; 02:7ad2 $9c $40
    dw   `12011102                                     ;; 02:7ad4 $9c $41
    dw   `11011211                                     ;; 02:7ad6 $db $04
    dw   `21111212                                     ;; 02:7ad8 $7a $85
    dw   `21111113                                     ;; 02:7ada $7f $81

    dw   `10112112                                     ;; 02:7adc $b6 $09
    dw   `11101121                                     ;; 02:7ade $ed $02
    dw   `01111121                                     ;; 02:7ae0 $7d $02
    dw   `01111111                                     ;; 02:7ae2 $7f $00
    dw   `00111122                                     ;; 02:7ae4 $3c $03
    dw   `11222222                                     ;; 02:7ae6 $c0 $3f
    dw   `12233333                                     ;; 02:7ae8 $9f $7f
    dw   `33333222                                     ;; 02:7aea $f8 $ff

    dw   `22332000                                     ;; 02:7aec $30 $f8
    dw   `23332000                                     ;; 02:7aee $70 $f8
    dw   `33332000                                     ;; 02:7af0 $f0 $f8

    db   $f0                                           ;; 02:7af2 .
    db   %11111100                                     ;; 02:7af3 $fc

    dw   `33233200                                     ;; 02:7af4 $d8 $fc
    dw   `23233200                                     ;; 02:7af6 $58 $fc
    dw   `33333200                                     ;; 02:7af8 $f8 $fc
    dw   `33332200                                     ;; 02:7afa $f0 $fc
    dw   `33332000                                     ;; 02:7afc $f0 $f8
    dw   `33222022                                     ;; 02:7afe $c0 $fb
    dw   `33220222                                     ;; 02:7b00 $c0 $f7
    dw   `33332232                                     ;; 02:7b02 $f2 $ff

    dw   `22332332                                     ;; 02:7b04 $36 $ff
    dw   `22333332                                     ;; 02:7b06 $3e $ff
    dw   `23323322                                     ;; 02:7b08 $6c $ff
    dw   `23323322                                     ;; 02:7b0a $6c $ff
    dw   `23223223                                     ;; 02:7b0c $49 $ff
    dw   `21233333                                     ;; 02:7b0e $5f $bf
    dw   `11233233                                     ;; 02:7b10 $db $3f
    dw   `12232232                                     ;; 02:7b12 $92 $7f

    dw   `12222332                                     ;; 02:7b14 $86 $7f
    dw   `32212322                                     ;; 02:7b16 $94 $ef
    dw   `22212320                                     ;; 02:7b18 $14 $ee
    dw   `22113320                                     ;; 02:7b1a $3c $ce
    dw   `11123222                                     ;; 02:7b1c $e8 $1f
    dw   `11233232                                     ;; 02:7b1e $da $3f
    dw   `12333322                                     ;; 02:7b20 $bc $7f
    dw   `22233320                                     ;; 02:7b22 $1c $fe

    dw   `23333200                                     ;; 02:7b24 $78 $fc
    dw   `33332200                                     ;; 02:7b26 $f0 $fc
    dw   `33222000                                     ;; 02:7b28 $c0 $f8
    dw   `22200000                                     ;; 02:7b2a $00 $e0
    dw   `00000000                                     ;; 02:7b2c $00 $00
    dw   `00000000                                     ;; 02:7b2e $00 $00
    dw   `00000000                                     ;; 02:7b30 $00 $00
    dw   `00000000                                     ;; 02:7b32 $00 $00

    dw   `00000000                                     ;; 02:7b34 $00 $00
    dw   `00000000                                     ;; 02:7b36 $00 $00
    dw   `22222222                                     ;; 02:7b38 $00 $ff
    dw   `11111111                                     ;; 02:7b3a $ff $00
    dw   `22222222                                     ;; 02:7b3c $00 $ff
    dw   `00000000                                     ;; 02:7b3e $00 $00
    dw   `00000000                                     ;; 02:7b40 $00 $00
    dw   `00000000                                     ;; 02:7b42 $00 $00

    dw   `00000000                                     ;; 02:7b44 $00 $00
    dw   `00000000                                     ;; 02:7b46 $00 $00
    dw   `00000000                                     ;; 02:7b48 $00 $00
    dw   `00000000                                     ;; 02:7b4a $00 $00
    dw   `11111111                                     ;; 02:7b4c $ff $00
    dw   `00000000                                     ;; 02:7b4e $00 $00
    dw   `11111111                                     ;; 02:7b50 $ff $00
    dw   `00000000                                     ;; 02:7b52 $00 $00

    dw   `11111111                                     ;; 02:7b54 $ff $00
    dw   `00000000                                     ;; 02:7b56 $00 $00
    dw   `11111111                                     ;; 02:7b58 $ff $00
    dw   `00000000                                     ;; 02:7b5a $00 $00
    dw   `11111111                                     ;; 02:7b5c $ff $00
    dw   `00000000                                     ;; 02:7b5e $00 $00
    dw   `11111111                                     ;; 02:7b60 $ff $00
    dw   `00000000                                     ;; 02:7b62 $00 $00

    dw   `11111111                                     ;; 02:7b64 $ff $00
    dw   `00000000                                     ;; 02:7b66 $00 $00
    dw   `11111111                                     ;; 02:7b68 $ff $00
    dw   `00000000                                     ;; 02:7b6a $00 $00
    dw   `00000000                                     ;; 02:7b6c $00 $00
    dw   `11111111                                     ;; 02:7b6e $ff $00
    dw   `00000000                                     ;; 02:7b70 $00 $00
    dw   `11111111                                     ;; 02:7b72 $ff $00

    dw   `00000000                                     ;; 02:7b74 $00 $00
    dw   `11111111                                     ;; 02:7b76 $ff $00
    dw   `00000000                                     ;; 02:7b78 $00 $00
    dw   `11111111                                     ;; 02:7b7a $ff $00
    dw   `00000000                                     ;; 02:7b7c $00 $00
    dw   `11111111                                     ;; 02:7b7e $ff $00
    dw   `00000000                                     ;; 02:7b80 $00 $00
    dw   `11111111                                     ;; 02:7b82 $ff $00

    dw   `00000000                                     ;; 02:7b84 $00 $00
    dw   `11111111                                     ;; 02:7b86 $ff $00
    dw   `00000000                                     ;; 02:7b88 $00 $00
    dw   `11111111                                     ;; 02:7b8a $ff $00
    dw   `11111111                                     ;; 02:7b8c $ff $00
    dw   `11111111                                     ;; 02:7b8e $ff $00
    dw   `11111111                                     ;; 02:7b90 $ff $00
    dw   `11111111                                     ;; 02:7b92 $ff $00

    dw   `11111111                                     ;; 02:7b94 $ff $00
    dw   `11111111                                     ;; 02:7b96 $ff $00
    dw   `11111111                                     ;; 02:7b98 $ff $00
    dw   `11111111                                     ;; 02:7b9a $ff $00
    dw   `11111111                                     ;; 02:7b9c $ff $00
    dw   `11111111                                     ;; 02:7b9e $ff $00
    dw   `11111111                                     ;; 02:7ba0 $ff $00
    dw   `11111111                                     ;; 02:7ba2 $ff $00

    dw   `11111111                                     ;; 02:7ba4 $ff $00
    dw   `11111111                                     ;; 02:7ba6 $ff $00
    dw   `11111111                                     ;; 02:7ba8 $ff $00
    dw   `11111111                                     ;; 02:7baa $ff $00
    dw   `00000011                                     ;; 02:7bac $03 $00
    dw   `00000013                                     ;; 02:7bae $03 $01
    dw   `00000113                                     ;; 02:7bb0 $07 $01
    dw   `00000131                                     ;; 02:7bb2 $07 $02

    dw   `00001131                                     ;; 02:7bb4 $0f $02
    dw   `00001311                                     ;; 02:7bb6 $0f $04
    dw   `00011311                                     ;; 02:7bb8 $1f $04
    dw   `00013113                                     ;; 02:7bba $1f $09
    dw   `00113133                                     ;; 02:7bbc $3f $0b
    dw   `00131331                                     ;; 02:7bbe $3f $16
    dw   `01133311                                     ;; 02:7bc0 $7f $1c
    dw   `01333111                                     ;; 02:7bc2 $7f $38

    dw   `11331111                                     ;; 02:7bc4 $ff $30
    dw   `13311113                                     ;; 02:7bc6 $ff $61
    dw   `13333333                                     ;; 02:7bc8 $ff $7f
    dw   `11111111                                     ;; 02:7bca $ff $00
    dw   `10000000                                     ;; 02:7bcc $80 $00
    dw   `10000000                                     ;; 02:7bce $80 $00
    dw   `11000000                                     ;; 02:7bd0 $c0 $00
    dw   `31000000                                     ;; 02:7bd2 $c0 $80

    dw   `31100000                                     ;; 02:7bd4 $e0 $80
    dw   `13100000                                     ;; 02:7bd6 $e0 $40
    dw   `33110000                                     ;; 02:7bd8 $f0 $c0
    dw   `31310000                                     ;; 02:7bda $f0 $a0
    dw   `11311000                                     ;; 02:7bdc $f8 $20
    dw   `11131000                                     ;; 02:7bde $f8 $10
    dw   `11331100                                     ;; 02:7be0 $fc $30
    dw   `13313100                                     ;; 02:7be2 $fc $68

    dw   `33113110                                     ;; 02:7be4 $fe $c8
    dw   `31111310                                     ;; 02:7be6 $fe $84
    dw   `33333310                                     ;; 02:7be8 $fe $fc
    dw   `11111110                                     ;; 02:7bea $fe $00

    db   $03, $00, $03, $01, $07, $01, $07, $02        ;; 02:7bec ????????
    db   $0f, $02, $0f, $05, $1f, $07, $1f, $0e        ;; 02:7bf4 ????????
    db   $3f, $0c, $3f, $18, $7f, $10, $7f, $21        ;; 02:7bfc ????????
    db   $ff, $23, $ff, $46, $ff, $7f, $ff, $00        ;; 02:7c04 ????????
    db   $80, $00, $80, $00, $c0, $00, $c0, $80        ;; 02:7c0c ????????
    db   $e0, $80, $e0, $c0, $f0, $40, $f0, $20        ;; 02:7c14 ????????
    db   $f8, $20, $f8, $70, $fc, $d0, $fc, $88        ;; 02:7c1c ????????
    db   $fe, $08, $fe, $1c, $fe, $fc, $fe, $00        ;; 02:7c24 ????????
    db   $03, $00, $03, $01, $07, $01, $07, $03        ;; 02:7c2c ????????
    db   $0f, $03, $0f, $06, $1f, $04, $1f, $08        ;; 02:7c34 ????????
    db   $3f, $08, $3f, $11, $7f, $13, $7f, $26        ;; 02:7c3c ????????
    db   $ff, $2c, $ff, $58, $ff, $7f, $ff, $00        ;; 02:7c44 ????????
    db   $80, $00, $80, $00, $c0, $00, $c0, $80        ;; 02:7c4c ????????
    db   $e0, $80, $e0, $40, $f0, $40, $f0, $60        ;; 02:7c54 ????????
    db   $f8, $e0, $f8, $90, $fc, $10, $fc, $18        ;; 02:7c5c ????????
    db   $fe, $38, $fe, $64, $fe, $fc, $fe, $00        ;; 02:7c64 ????????
    db   $06, $07, $0b, $0d, $0d, $0b, $16, $1a        ;; 02:7c6c ????????
    db   $16, $1a, $0d, $0b, $0a, $0d, $05, $06        ;; 02:7c74 ????????
    db   $06, $07, $0b, $0d, $0d, $0b, $16, $1a        ;; 02:7c7c ????????
    db   $16, $1a, $0d, $0b, $0a, $0d, $05, $06        ;; 02:7c84 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7c8c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7c94 ????????
    db   $06, $07, $0b, $0d, $0d, $0b, $16, $1a        ;; 02:7c9c ????????
    db   $16, $1a, $0d, $0b, $0a, $0d, $05, $06        ;; 02:7ca4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7cac ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7cb4 ????????
    db   $a0, $60, $50, $b0, $b0, $d0, $68, $58        ;; 02:7cbc ????????
    db   $68, $58, $b0, $d0, $d0, $b0, $60, $e0        ;; 02:7cc4 ????????
    db   $04, $00, $00, $00, $48, $00, $07, $00        ;; 02:7ccc ????????
    db   $01, $00, $1f, $00, $07, $00, $fd, $02        ;; 02:7cd4 ????????
    db   $0e, $01, $17, $08, $7e, $01, $0c, $03        ;; 02:7cdc ????????
    db   $77, $00, $7f, $00, $30, $0f, $6a, $15        ;; 02:7ce4 ????????
    db   $2e, $01, $3b, $04, $fb, $04, $6a, $95        ;; 02:7cec ????????
    db   $c0, $3f, $c4, $3b, $e1, $1e, $31, $ce        ;; 02:7cf4 ????????
    db   $59, $a6, $09, $f6, $ed, $12, $bd, $42        ;; 02:7cfc ????????
    db   $0d, $f2, $e4, $1b, $00, $ff, $81, $7e        ;; 02:7d04 ????????
    db   $fc, $03, $eb, $14, $01, $3e, $78, $07        ;; 02:7d0c ????????
    db   $72, $0d, $33, $0c, $3e, $01, $29, $16        ;; 02:7d14 ????????
    db   $1b, $04, $76, $09, $0d, $02, $8b, $00        ;; 02:7d1c ????????
    db   $22, $00, $38, $00, $01, $00, $00, $00        ;; 02:7d24 ????????
    db   $60, $9f, $84, $7b, $18, $e7, $3a, $c5        ;; 02:7d2c ????????
    db   $ea, $15, $c2, $3d, $82, $7d, $8d, $72        ;; 02:7d34 ????????
    db   $05, $fa, $cb, $34, $f7, $00, $37, $00        ;; 02:7d3c ????????
    db   $27, $00, $a5, $00, $55, $00, $41, $00        ;; 02:7d44 ????????
    db   $00, $00, $00, $03, $00, $07, $01, $0e        ;; 02:7d4c ????????
    db   $07, $08, $05, $1a, $01, $1e, $00, $0f        ;; 02:7d54 ????????
    db   $00, $77, $3a, $c5, $7e, $81, $03, $fc        ;; 02:7d5c ????????
    db   $19, $e6, $38, $c7, $20, $df, $00, $7f        ;; 02:7d64 ????????
    db   $00, $00, $00, $e0, $00, $f0, $40, $b8        ;; 02:7d6c ????????
    db   $e0, $1b, $c1, $36, $e3, $1c, $c8, $37        ;; 02:7d74 ????????
    db   $a3, $5c, $06, $f9, $0e, $f1, $08, $f7        ;; 02:7d7c ????????
    db   $68, $97, $d1, $2e, $c0, $3f, $00, $ff        ;; 02:7d84 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7d8c ????????
    db   $00, $c0, $c0, $20, $c0, $30, $60, $93        ;; 02:7d94 ????????
    db   $01, $fe, $23, $dc, $74, $8b, $40, $bf        ;; 02:7d9c ????????
    db   $f1, $0e, $e3, $1c, $83, $7c, $00, $ff        ;; 02:7da4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7dac ????????
    db   $00, $00, $00, $00, $00, $00, $00, $80        ;; 02:7db4 ????????
    db   $80, $40, $c0, $20, $00, $e0, $c0, $38        ;; 02:7dbc ????????
    db   $e8, $14, $88, $76, $98, $67, $12, $ed        ;; 02:7dc4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7dcc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7dd4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7ddc ????????
    db   $00, $00, $00, $f0, $20, $d8, $88, $77        ;; 02:7de4 ????????
    db   $00, $00, $00, $01, $00, $03, $00, $07        ;; 02:7dec ????????
    db   $01, $0e, $03, $14, $07, $28, $05, $2a        ;; 02:7df4 ????????
    db   $0a, $55, $08, $57, $00, $1f, $00, $1a        ;; 02:7dfc ????????
    db   $00, $34, $00, $30, $00, $69, $00, $42        ;; 02:7e04 ????????
    db   $00, $00, $00, $00, $00, $e0, $80, $70        ;; 02:7e0c ????????
    db   $c0, $38, $00, $f8, $80, $50, $00, $b0        ;; 02:7e14 ????????
    db   $00, $b4, $00, $64, $00, $a8, $00, $70        ;; 02:7e1c ????????
    db   $00, $c0, $00, $80, $00, $00, $00, $00        ;; 02:7e24 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7e2c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7e34 ????????
    db   $00, $00, $00, $00, $00, $01, $00, $0f        ;; 02:7e3c ????????
    db   $03, $38, $07, $50, $03, $bc, $1a, $a5        ;; 02:7e44 ????????
    db   $3c, $43, $20, $df, $4c, $b3, $98, $66        ;; 02:7e4c ????????
    db   $90, $6c, $40, $b9, $40, $b9, $00, $f2        ;; 02:7e54 ????????
    db   $00, $f0, $00, $a4, $00, $40, $00, $00        ;; 02:7e5c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7e64 ????????
    db   $00, $00, $00, $03, $00, $01, $00, $05        ;; 02:7e6c ????????
    db   $00, $12, $00, $07, $00, $0d, $00, $12        ;; 02:7e74 ????????
    db   $00, $15, $00, $29, $00, $13, $00, $0a        ;; 02:7e7c ????????
    db   $00, $10, $00, $00, $00, $00, $00, $00        ;; 02:7e84 ????????
    db   $00, $00, $00, $02, $00, $13, $00, $17        ;; 02:7e8c ????????
    db   $01, $66, $05, $5a, $0e, $f1, $02, $3d        ;; 02:7e94 ????????
    db   $04, $7b, $18, $65, $00, $fa, $c0, $2d        ;; 02:7e9c ????????
    db   $80, $59, $00, $f2, $00, $c2, $00, $a8        ;; 02:7ea4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7eac ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7eb4 ????????
    db   $00, $00, $00, $03, $01, $06, $03, $04        ;; 02:7ebc ????????
    db   $03, $04, $03, $04, $01, $02, $00, $01        ;; 02:7ec4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7ecc ????????
    db   $00, $00, $00, $1e, $1e, $61, $3f, $40        ;; 02:7ed4 ????????
    db   $3f, $40, $1e, $e1, $d0, $2f, $f6, $09        ;; 02:7edc ????????
    db   $f7, $08, $e3, $1c, $cf, $30, $7f, $80        ;; 02:7ee4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7eec ????????
    db   $00, $00, $00, $1e, $0e, $31, $1f, $a0        ;; 02:7ef4 ????????
    db   $3f, $c0, $0f, $f0, $e7, $18, $f7, $08        ;; 02:7efc ????????
    db   $f7, $08, $e6, $19, $ff, $00, $ff, $00        ;; 02:7f04 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 02:7f0c ????????
    db   $00, $00, $00, $00, $00, $00, $00, $80        ;; 02:7f14 ????????
    db   $00, $80, $80, $40, $80, $40, $80, $40        ;; 02:7f1c ????????
    db   $00, $80, $00, $e0, $60, $90, $a0, $50        ;; 02:7f24 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $06        ;; 02:7f2c ????????
    db   $06, $09, $0c, $13, $18, $24, $10, $28        ;; 02:7f34 ????????
    db   $20, $58, $00, $60, $00, $5c, $18, $24        ;; 02:7f3c ????????
    db   $30, $48, $60, $90, $60, $90, $60, $90        ;; 02:7f44 ????????
    db   $00, $3e, $3e, $41, $61, $9e, $80, $61        ;; 02:7f4c ????????
    db   $00, $00, $00, $80, $00, $18, $18, $26        ;; 02:7f54 ????????
    db   $3e, $41, $70, $8e, $40, $b0, $00, $c7        ;; 02:7f5c ????????
    db   $06, $89, $0c, $12, $18, $24, $18, $24        ;; 02:7f64 ????????
    db   $00, $07, $01, $8e, $80, $61, $00, $80        ;; 02:7f6c ????????
    db   $00, $01, $01, $02, $00, $07, $00, $3c        ;; 02:7f74 ????????
    db   $38, $44, $0c, $32, $1e, $21, $03, $1c        ;; 02:7f7c ????????
    db   $01, $02, $01, $02, $00, $01, $00, $00        ;; 02:7f84 ????????
    db   $00, $80, $80, $40, $40, $a0, $00, $60        ;; 02:7f8c ????????
    db   $00, $c0, $c0, $30, $70, $88, $30, $48        ;; 02:7f94 ????????
    db   $18, $24, $08, $14, $00, $08, $00, $9c        ;; 02:7f9c ????????
    db   $0c, $92, $06, $89, $06, $09, $06, $09        ;; 02:7fa4 ????????
    db   $81, $ff, $42, $ff, $24, $ff, $18, $ff        ;; 02:7fac ????????
    db   $18, $ff, $24, $ff, $42, $ff, $81, $ff        ;; 02:7fb4 ????????
    db   $81, $ff, $42, $ff, $24, $ff, $18, $ff        ;; 02:7fbc ????????
    db   $18, $ff, $24, $ff, $42, $ff, $81, $ff        ;; 02:7fc4 ????????
    db   $81, $ff, $42, $ff, $24, $ff, $18, $ff        ;; 02:7fcc ????????
    db   $18, $ff, $24, $ff, $42, $ff, $81, $ff        ;; 02:7fd4 ????????
    db   $81, $ff, $42, $ff, $24, $ff, $18, $ff        ;; 02:7fdc ????????
    db   $18, $ff, $24, $ff, $42, $ff, $81, $ff        ;; 02:7fe4 ????????
