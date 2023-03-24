;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank01", ROMX[$4000], BANK[$01]

call_01_4000:
    xor  A, A                                          ;; 01:4000 $af
    ldh  [hFF96], A                                    ;; 01:4001 $e0 $96
    ld   [wCA56], A                                    ;; 01:4003 $ea $56 $ca
    call call_00_3c50                                  ;; 01:4006 $cd $50 $3c
    ld   A, $47                                        ;; 01:4009 $3e $47
    ld   [HL], A                                       ;; 01:400b $77
    call call_01_4700                                  ;; 01:400c $cd $00 $47
    call call_01_4dff                                  ;; 01:400f $cd $ff $4d
    call call_00_3c60                                  ;; 01:4012 $cd $60 $3c
    ld   A, [DE]                                       ;; 01:4015 $1a
    ld   [HL], A                                       ;; 01:4016 $77
    and  A, $40                                        ;; 01:4017 $e6 $40
    ld   [wCA12], A                                    ;; 01:4019 $ea $12 $ca
    call call_00_1024                                  ;; 01:401c $cd $24 $10
    call call_01_463d                                  ;; 01:401f $cd $3d $46
    call call_01_4e48                                  ;; 01:4022 $cd $48 $4e
    ld   A, [wCA6E]                                    ;; 01:4025 $fa $6e $ca
    and  A, A                                          ;; 01:4028 $a7
    jp   Z, jp_01_548d                                 ;; 01:4029 $ca $8d $54
    ret                                                ;; 01:402c $c9

call_01_402d:
    ld   A, [wCA16]                                    ;; 01:402d $fa $16 $ca
    cp   A, $21                                        ;; 01:4030 $fe $21
    jr   Z, .jr_01_4049                                ;; 01:4032 $28 $15
    cp   A, $20                                        ;; 01:4034 $fe $20
    jp   Z, jp_01_40dd                                 ;; 01:4036 $ca $dd $40
    cp   A, $1b                                        ;; 01:4039 $fe $1b
    jp   Z, jp_01_41d6                                 ;; 01:403b $ca $d6 $41
    cp   A, $2c                                        ;; 01:403e $fe $2c
    jp   Z, jp_01_41d6                                 ;; 01:4040 $ca $d6 $41
    cp   A, $25                                        ;; 01:4043 $fe $25
    jp   Z, jp_01_4233                                 ;; 01:4045 $ca $33 $42
    ret                                                ;; 01:4048 $c9
.jr_01_4049:
    ld   A, $1f                                        ;; 01:4049 $3e $1f
    ldh  [hFFBC], A                                    ;; 01:404b $e0 $bc
    call call_01_4063                                  ;; 01:404d $cd $63 $40
    call call_00_01d7                                  ;; 01:4050 $cd $d7 $01
    ld   A, $01                                        ;; 01:4053 $3e $01
    ld   [wC6E3], A                                    ;; 01:4055 $ea $e3 $c6
    call call_00_089e                                  ;; 01:4058 $cd $9e $08
    call call_01_4f24                                  ;; 01:405b $cd $24 $4f
    ld   B, $fe                                        ;; 01:405e $06 $fe
    jp   call_00_1586                                  ;; 01:4060 $c3 $86 $15

call_01_4063:
    call call_00_01d7                                  ;; 01:4063 $cd $d7 $01
    call call_00_3c0b                                  ;; 01:4066 $cd $0b $3c
    ld   A, [HL+]                                      ;; 01:4069 $2a
    ld   [wC800], A                                    ;; 01:406a $ea $00 $c8
    ld   A, [HL]                                       ;; 01:406d $7e
    ld   [wC801], A                                    ;; 01:406e $ea $01 $c8
    call call_00_3c14                                  ;; 01:4071 $cd $14 $3c
    ld   A, [HL+]                                      ;; 01:4074 $2a
    ld   [wC802], A                                    ;; 01:4075 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:4078 $7e
    ld   [wC803], A                                    ;; 01:4079 $ea $03 $c8
    call call_00_01db                                  ;; 01:407c $cd $db $01
    call call_00_3c03                                  ;; 01:407f $cd $03 $3c
    ld   [HL], $fe                                     ;; 01:4082 $36 $fe
    call call_00_3c0b                                  ;; 01:4084 $cd $0b $3c
    ld   D, H                                          ;; 01:4087 $54
    ld   E, L                                          ;; 01:4088 $5d
    ld   HL, wCA04                                     ;; 01:4089 $21 $04 $ca
    ld   A, [wC800]                                    ;; 01:408c $fa $00 $c8
    sub  A, $50                                        ;; 01:408f $d6 $50
    ld   [DE], A                                       ;; 01:4091 $12
    inc  E                                             ;; 01:4092 $1c
    ld   A, [wC801]                                    ;; 01:4093 $fa $01 $c8
    sbc  A, $00                                        ;; 01:4096 $de $00
    and  A, [HL]                                       ;; 01:4098 $a6
    ld   [DE], A                                       ;; 01:4099 $12
    call call_00_3c14                                  ;; 01:409a $cd $14 $3c
    ld   A, [wC802]                                    ;; 01:409d $fa $02 $c8
    ld   [HL+], A                                      ;; 01:40a0 $22
    ld   A, [wC803]                                    ;; 01:40a1 $fa $03 $c8
    ld   [HL], A                                       ;; 01:40a4 $77
    call call_00_3c2e                                  ;; 01:40a5 $cd $2e $3c
    ld   [HL], $20                                     ;; 01:40a8 $36 $20
    call call_00_3c1d                                  ;; 01:40aa $cd $1d $3c
    ld   [HL], $00                                     ;; 01:40ad $36 $00
    call call_00_3c90                                  ;; 01:40af $cd $90 $3c
    ld   [HL], $00                                     ;; 01:40b2 $36 $00
    call call_00_3c70                                  ;; 01:40b4 $cd $70 $3c
    ld   [HL], $20                                     ;; 01:40b7 $36 $20
    call call_00_3c48                                  ;; 01:40b9 $cd $48 $3c
    ld   A, $80                                        ;; 01:40bc $3e $80
    ld   [HL], A                                       ;; 01:40be $77
    call call_01_5272                                  ;; 01:40bf $cd $72 $52
    ld   B, $24                                        ;; 01:40c2 $06 $24
.jr_01_40c4:
    push BC                                            ;; 01:40c4 $c5
    call call_01_4f66                                  ;; 01:40c5 $cd $66 $4f
    call call_01_54a0                                  ;; 01:40c8 $cd $a0 $54
    call call_00_01a0                                  ;; 01:40cb $cd $a0 $01
    call call_00_3a6b                                  ;; 01:40ce $cd $6b $3a
    pop  BC                                            ;; 01:40d1 $c1
    dec  B                                             ;; 01:40d2 $05
    jr   NZ, .jr_01_40c4                               ;; 01:40d3 $20 $ef
    ret                                                ;; 01:40d5 $c9
    db   $cd, $08, $00, $c0, $c3, $8a, $41             ;; 01:40d6 ???????

jp_01_40dd:
    call call_01_4132                                  ;; 01:40dd $cd $32 $41
    ret  NZ                                            ;; 01:40e0 $c0
    ld   A, $27                                        ;; 01:40e1 $3e $27
    ldh  [hFFBC], A                                    ;; 01:40e3 $e0 $bc
    call call_00_3a6b                                  ;; 01:40e5 $cd $6b $3a
    ld   A, [wC6EE]                                    ;; 01:40e8 $fa $ee $c6
    rlca                                               ;; 01:40eb $07
    rlca                                               ;; 01:40ec $07
    and  A, $03                                        ;; 01:40ed $e6 $03
    call doJumptable                                   ;; 01:40ef $cd $3a $37
;@jumptable amount=4
    dw   call_01_40fa                                  ;; 01:40f2 ?? $00
    dw   call_01_4108                                  ;; 01:40f4 ?? $01
    dw   call_01_4116                                  ;; 01:40f6 ?? $02
    dw   call_01_4124                                  ;; 01:40f8 ?? $03

call_01_40fa:
    call call_01_5c02                                  ;; 01:40fa $cd $02 $5c
.jr_01_40fd:
    call call_01_44e9                                  ;; 01:40fd $cd $e9 $44
    call call_01_41af                                  ;; 01:4100 $cd $af $41
    jr   NZ, .jr_01_40fd                               ;; 01:4103 $20 $f8
    jp   jp_01_4182                                    ;; 01:4105 $c3 $82 $41

call_01_4108:
    call call_01_5c43                                  ;; 01:4108 $cd $43 $5c
.jr_01_410b:
    call call_01_4562                                  ;; 01:410b $cd $62 $45
    call call_01_41af                                  ;; 01:410e $cd $af $41
    jr   NZ, .jr_01_410b                               ;; 01:4111 $20 $f8
    jp   jp_01_4182                                    ;; 01:4113 $c3 $82 $41

call_01_4116:
    call call_01_5c22                                  ;; 01:4116 $cd $22 $5c
.jr_01_4119:
    call call_01_445f                                  ;; 01:4119 $cd $5f $44
    call call_01_41af                                  ;; 01:411c $cd $af $41
    jr   NZ, .jr_01_4119                               ;; 01:411f $20 $f8
    jp   jp_01_4182                                    ;; 01:4121 $c3 $82 $41

call_01_4124:
    call call_01_5c64                                  ;; 01:4124 $cd $64 $5c
.jr_01_4127:
    call call_01_45db                                  ;; 01:4127 $cd $db $45
    call call_01_41af                                  ;; 01:412a $cd $af $41
    jr   NZ, .jr_01_4127                               ;; 01:412d $20 $f8
    jp   jp_01_4182                                    ;; 01:412f $c3 $82 $41

call_01_4132:
    call call_00_0008                                  ;; 01:4132 $cd $08 $00
    ret  NZ                                            ;; 01:4135 $c0
    call call_01_418a                                  ;; 01:4136 $cd $8a $41
    ret  NZ                                            ;; 01:4139 $c0
    call call_00_01d7                                  ;; 01:413a $cd $d7 $01
    ld   A, [wC6EE]                                    ;; 01:413d $fa $ee $c6
    rlca                                               ;; 01:4140 $07
    rlca                                               ;; 01:4141 $07
    and  A, $03                                        ;; 01:4142 $e6 $03
    call doJumptable                                   ;; 01:4144 $cd $3a $37
;@jumptable amount=4
    dw   call_01_414f                                  ;; 01:4147 ?? $00
    dw   call_01_4159                                  ;; 01:4149 ?? $01
    dw   call_01_4163                                  ;; 01:414b ?? $02
    dw   call_01_416d                                  ;; 01:414d ?? $03

call_01_414f:
    call call_01_4755                                  ;; 01:414f $cd $55 $47
    call call_01_4177                                  ;; 01:4152 $cd $77 $41
    jp   NZ, jp_00_101f                                ;; 01:4155 $c2 $1f $10
    ret                                                ;; 01:4158 $c9

call_01_4159:
    call call_01_4793                                  ;; 01:4159 $cd $93 $47
    call call_01_4177                                  ;; 01:415c $cd $77 $41
    jp   NZ, jp_00_101f                                ;; 01:415f $c2 $1f $10
    ret                                                ;; 01:4162 $c9

call_01_4163:
    call call_01_4774                                  ;; 01:4163 $cd $74 $47
    call call_01_4177                                  ;; 01:4166 $cd $77 $41
    jp   NZ, jp_00_101f                                ;; 01:4169 $c2 $1f $10
    ret                                                ;; 01:416c $c9

call_01_416d:
    call call_01_4736                                  ;; 01:416d $cd $36 $47
    call call_01_4177                                  ;; 01:4170 $cd $77 $41
    jp   NZ, jp_00_101f                                ;; 01:4173 $c2 $1f $10
    ret                                                ;; 01:4176 $c9

call_01_4177:
    call call_00_0187                                  ;; 01:4177 $cd $87 $01
    ld   A, [wC805]                                    ;; 01:417a $fa $05 $c8
    and  A, $e4                                        ;; 01:417d $e6 $e4
    cp   A, $40                                        ;; 01:417f $fe $40
    ret                                                ;; 01:4181 $c9

jp_01_4182:
    ld   A, $02                                        ;; 01:4182 $3e $02
    ld   [wC6E3], A                                    ;; 01:4184 $ea $e3 $c6
    jp   call_00_089e                                  ;; 01:4187 $c3 $9e $08

call_01_418a:
    ld   HL, .data_01_4194                             ;; 01:418a $21 $94 $41
    ld   C, $04                                        ;; 01:418d $0e $04
    ld   A, [wC6E8]                                    ;; 01:418f $fa $e8 $c6
    jr   jr_01_41a5                                    ;; 01:4192 $18 $11
.data_01_4194:
    db   $02, $03, $04, $05                            ;; 01:4194 ....

call_01_4198:
    ld   HL, .data_01_41a2                             ;; 01:4198 $21 $a2 $41
    ld   C, $03                                        ;; 01:419b $0e $03
    ld   A, [wC6E8]                                    ;; 01:419d $fa $e8 $c6
    jr   jr_01_41a5                                    ;; 01:41a0 $18 $03
.data_01_41a2:
    db   $06, $07, $08                                 ;; 01:41a2 ???

jr_01_41a5:
    ld   B, A                                          ;; 01:41a5 $47
.jr_01_41a6:
    ld   A, [HL+]                                      ;; 01:41a6 $2a
    cp   A, B                                          ;; 01:41a7 $b8
    ret  Z                                             ;; 01:41a8 $c8
    dec  C                                             ;; 01:41a9 $0d
    jr   NZ, .jr_01_41a6                               ;; 01:41aa $20 $fa
    jp   jp_00_101f                                    ;; 01:41ac $c3 $1f $10

call_01_41af:
    call call_01_4f24                                  ;; 01:41af $cd $24 $4f
    call call_01_54a0                                  ;; 01:41b2 $cd $a0 $54
    call call_00_01a0                                  ;; 01:41b5 $cd $a0 $01
    call call_00_3a6b                                  ;; 01:41b8 $cd $6b $3a
    ld   A, [wC6EF]                                    ;; 01:41bb $fa $ef $c6
    and  A, A                                          ;; 01:41be $a7
    ret                                                ;; 01:41bf $c9

call_01_41c0:
    ldh  A, [hFF96]                                    ;; 01:41c0 $f0 $96
    push AF                                            ;; 01:41c2 $f5
    call call_01_54a0                                  ;; 01:41c3 $cd $a0 $54
    call call_00_01a0                                  ;; 01:41c6 $cd $a0 $01
    call call_00_3a6b                                  ;; 01:41c9 $cd $6b $3a
    pop  AF                                            ;; 01:41cc $f1
    ldh  [hFF96], A                                    ;; 01:41cd $e0 $96
    call call_00_3c48                                  ;; 01:41cf $cd $48 $3c
    ld   A, [HL]                                       ;; 01:41d2 $7e
    and  A, $0f                                        ;; 01:41d3 $e6 $0f
    ret                                                ;; 01:41d5 $c9

jp_01_41d6:
    call call_01_422e                                  ;; 01:41d6 $cd $2e $42
    ret  NZ                                            ;; 01:41d9 $c0
    call call_01_5f39                                  ;; 01:41da $cd $39 $5f
    ld   A, $1a                                        ;; 01:41dd $3e $1a
    ldh  [hFFBC], A                                    ;; 01:41df $e0 $bc
    ld   A, $02                                        ;; 01:41e1 $3e $02
    ld   [wCA6B], A                                    ;; 01:41e3 $ea $6b $ca
    ld   A, [wC6F7]                                    ;; 01:41e6 $fa $f7 $c6
    ld   [wC6EE], A                                    ;; 01:41e9 $ea $ee $c6
    ld   A, [wC7C9]                                    ;; 01:41ec $fa $c9 $c7
    ld   B, A                                          ;; 01:41ef $47
    swap A                                             ;; 01:41f0 $cb $37
    and  A, $f0                                        ;; 01:41f2 $e6 $f0
    ld   [wC6E4], A                                    ;; 01:41f4 $ea $e4 $c6
    ld   A, B                                          ;; 01:41f7 $78
    swap A                                             ;; 01:41f8 $cb $37
    and  A, $0f                                        ;; 01:41fa $e6 $0f
    ld   [wC6E5], A                                    ;; 01:41fc $ea $e5 $c6
    ld   A, [wC7CA]                                    ;; 01:41ff $fa $ca $c7
    ld   B, A                                          ;; 01:4202 $47
    swap A                                             ;; 01:4203 $cb $37
    and  A, $f0                                        ;; 01:4205 $e6 $f0
    ld   [wC6E6], A                                    ;; 01:4207 $ea $e6 $c6
    ld   A, B                                          ;; 01:420a $78
    swap A                                             ;; 01:420b $cb $37
    and  A, $0f                                        ;; 01:420d $e6 $0f
    ld   [wC6E7], A                                    ;; 01:420f $ea $e7 $c6
    ld   A, [wC7CB]                                    ;; 01:4212 $fa $cb $c7
    ld   [wC6E8], A                                    ;; 01:4215 $ea $e8 $c6
    call call_01_4198                                  ;; 01:4218 $cd $98 $41
    jr   NZ, .jr_01_4222                               ;; 01:421b $20 $05
    ld   A, $02                                        ;; 01:421d $3e $02
    ld   [wC6E3], A                                    ;; 01:421f $ea $e3 $c6
.jr_01_4222:
    xor  A, A                                          ;; 01:4222 $af
    ld   [wC7C8], A                                    ;; 01:4223 $ea $c8 $c7
    call call_00_027d                                  ;; 01:4226 $cd $7d $02
    xor  A, A                                          ;; 01:4229 $af
    ld   [wCA6B], A                                    ;; 01:422a $ea $6b $ca
    ret                                                ;; 01:422d $c9

call_01_422e:
    ld   A, [wCA6C]                                    ;; 01:422e $fa $6c $ca
    and  A, A                                          ;; 01:4231 $a7
    ret                                                ;; 01:4232 $c9

jp_01_4233:
    ld   A, $2c                                        ;; 01:4233 $3e $2c
    ldh  [hFFBC], A                                    ;; 01:4235 $e0 $bc
    ld   A, $0a                                        ;; 01:4237 $3e $0a
    call call_00_3cb2                                  ;; 01:4239 $cd $b2 $3c
    jr   C, .jr_01_4245                                ;; 01:423c $38 $07
    ld   A, $0a                                        ;; 01:423e $3e $0a
    call call_00_3ca0                                  ;; 01:4240 $cd $a0 $3c
    jr   .jr_01_424a                                   ;; 01:4243 $18 $05
.jr_01_4245:
    ld   A, $0a                                        ;; 01:4245 $3e $0a
    call call_00_3ca6                                  ;; 01:4247 $cd $a6 $3c
.jr_01_424a:
    jp   call_00_01e7                                  ;; 01:424a $c3 $e7 $01
    db   $af, $a7, $c9                                 ;; 01:424d ???

call_01_4250:
    xor  A, A                                          ;; 01:4250 $af
    ldh  [hFF96], A                                    ;; 01:4251 $e0 $96
    call call_01_4700                                  ;; 01:4253 $cd $00 $47
    call call_01_42e2                                  ;; 01:4256 $cd $e2 $42
    xor  A, A                                          ;; 01:4259 $af
    ld   [wC6E3], A                                    ;; 01:425a $ea $e3 $c6
    ld   [wC6F1], A                                    ;; 01:425d $ea $f1 $c6
    ld   [wC6F0], A                                    ;; 01:4260 $ea $f0 $c6
    call call_00_0165                                  ;; 01:4263 $cd $65 $01
    ld   HL, wC6E4                                     ;; 01:4266 $21 $e4 $c6
    ld   DE, wC6E9                                     ;; 01:4269 $11 $e9 $c6
    call call_00_1f87                                  ;; 01:426c $cd $87 $1f
    jp   jp_01_636d                                    ;; 01:426f $c3 $6d $63

call_01_4272:
    call call_01_4198                                  ;; 01:4272 $cd $98 $41
    ret  Z                                             ;; 01:4275 $c8
    call call_00_3a6b                                  ;; 01:4276 $cd $6b $3a
    call call_00_01d7                                  ;; 01:4279 $cd $d7 $01
    ld   A, [wC6EE]                                    ;; 01:427c $fa $ee $c6
    rlca                                               ;; 01:427f $07
    rlca                                               ;; 01:4280 $07
    and  A, $03                                        ;; 01:4281 $e6 $03
    call doJumptable                                   ;; 01:4283 $cd $3a $37
    db   $8e, $42, $a3, $42, $b8, $42, $cd, $42        ;; 01:4286 ????????
    db   $cd, $55, $47, $cd, $e2, $42, $c0, $cd        ;; 01:428e ????????
    db   $02, $5c, $cd, $e9, $44, $cd, $af, $41        ;; 01:4296 ????????
    db   $20, $f8, $c3, $07, $43, $cd, $93, $47        ;; 01:429e ????????
    db   $cd, $e2, $42, $c0, $cd, $43, $5c, $cd        ;; 01:42a6 ????????
    db   $62, $45, $cd, $af, $41, $20, $f8, $c3        ;; 01:42ae ????????
    db   $07, $43, $cd, $74, $47, $cd, $e2, $42        ;; 01:42b6 ????????
    db   $c0, $cd, $22, $5c, $cd, $5f, $44, $cd        ;; 01:42be ????????
    db   $af, $41, $20, $f8, $c3, $07, $43, $cd        ;; 01:42c6 ????????
    db   $36, $47, $cd, $e2, $42, $c0, $cd, $64        ;; 01:42ce ????????
    db   $5c, $cd, $db, $45, $cd, $af, $41, $20        ;; 01:42d6 ????????
    db   $f8, $c3, $07, $43                            ;; 01:42de ????

call_01_42e2:
    ld   A, $04                                        ;; 01:42e2 $3e $04
    call call_00_3ca0                                  ;; 01:42e4 $cd $a0 $3c
    call call_00_0187                                  ;; 01:42e7 $cd $87 $01
    ld   A, [wC805]                                    ;; 01:42ea $fa $05 $c8
    and  A, A                                          ;; 01:42ed $a7
    jr   Z, .jr_01_42ff                                ;; 01:42ee $28 $0f
    cp   A, $01                                        ;; 01:42f0 $fe $01
    jr   Z, .jr_01_42ff                                ;; 01:42f2 $28 $0b
    cp   A, $02                                        ;; 01:42f4 $fe $02
    jr   Z, .jr_01_42ff                                ;; 01:42f6 $28 $07
    and  A, $fc                                        ;; 01:42f8 $e6 $fc
    cp   A, $88                                        ;; 01:42fa $fe $88
    jr   Z, .jr_01_42ff                                ;; 01:42fc $28 $01
    ret                                                ;; 01:42fe $c9
.jr_01_42ff:
    ld   A, $04                                        ;; 01:42ff $3e $04
    call call_00_3ca6                                  ;; 01:4301 $cd $a6 $3c
    xor  A, A                                          ;; 01:4304 $af
    and  A, A                                          ;; 01:4305 $a7
    ret                                                ;; 01:4306 $c9

jp_01_4307:
    xor  A, A                                          ;; 01:4307 $af
    ld   [wC6E3], A                                    ;; 01:4308 $ea $e3 $c6
    call call_00_089e                                  ;; 01:430b $cd $9e $08
    jp   call_01_4f24                                  ;; 01:430e $c3 $24 $4f

call_01_4311:
    call call_00_3a6b                                  ;; 01:4311 $cd $6b $3a
    call call_01_4700                                  ;; 01:4314 $cd $00 $47
    call call_01_42e2                                  ;; 01:4317 $cd $e2 $42
    ret  NZ                                            ;; 01:431a $c0
    jp   jp_01_4307                                    ;; 01:431b $c3 $07 $43
    db   $fa, $ee, $c6, $07, $07, $e6, $03, $cd        ;; 01:431e ????????
    db   $3a, $37, $30, $43, $5a, $43, $3e, $43        ;; 01:4326 ????????
    db   $4c, $43, $cd, $d7, $01, $cd, $55, $47        ;; 01:432e ????????
    db   $cd, $8d, $43, $06, $80, $c3, $68, $43        ;; 01:4336 ????????
    db   $cd, $d7, $01, $cd, $74, $47, $cd, $8d        ;; 01:433e ????????
    db   $43, $06, $00, $c3, $68, $43, $cd, $d7        ;; 01:4346 ????????
    db   $01, $cd, $36, $47, $cd, $8d, $43, $06        ;; 01:434e ????????
    db   $40, $c3, $68, $43, $cd, $d7, $01, $cd        ;; 01:4356 ????????
    db   $93, $47, $cd, $8d, $43, $06, $c0, $c3        ;; 01:435e ????????
    db   $68, $43, $c5, $cd, $95, $43, $20, $02        ;; 01:4366 ????????
    db   $c1, $c9, $c1, $cd, $88, $3c, $7e, $a7        ;; 01:436e ????????
    db   $20, $10, $cd, $03, $3c, $7e, $fe, $e0        ;; 01:4376 ????????
    db   $30, $08, $cd, $48, $3c, $70, $78, $cd        ;; 01:437e ????????
    db   $72, $52, $3e, $ff, $cb, $47, $c9, $cd        ;; 01:4386 ????????
    db   $50, $3c, $7e, $ea, $04, $c8, $c9, $3e        ;; 01:438e ????????
    db   $02, $e0, $96, $cd, $03, $3c, $7e, $a7        ;; 01:4396 ????????
    db   $28, $4c, $cd, $36, $3c, $fa, $00, $c8        ;; 01:439e ????????
    db   $be, $20, $43, $23, $fa, $01, $c8, $be        ;; 01:43a6 ????????
    db   $20, $3c, $cd, $3f, $3c, $fa, $02, $c8        ;; 01:43ae ????????
    db   $be, $20, $33, $23, $fa, $03, $c8, $be        ;; 01:43b6 ????????
    db   $20, $2c, $fa, $04, $c8, $e6, $03, $fe        ;; 01:43be ????????
    db   $03, $28, $16, $cd, $50, $3c, $7e, $e6        ;; 01:43c6 ????????
    db   $03, $fe, $03, $28, $0c, $fa, $04, $c8        ;; 01:43ce ????????
    db   $e6, $03, $47, $7e, $e6, $03, $b8, $20        ;; 01:43d6 ????????
    db   $0d, $cd, $48, $3c, $7e, $e6, $3f, $20        ;; 01:43de ????????
    db   $05, $3e, $ff, $cb, $47, $c9, $f0, $96        ;; 01:43e6 ????????
    db   $c6, $01, $e0, $96, $fe, $10, $20, $a3        ;; 01:43ee ????????
    db   $af, $a7, $c9                                 ;; 01:43f6 ???

call_01_43f9:
    ld   A, [wC6EF]                                    ;; 01:43f9 $fa $ef $c6
    and  A, A                                          ;; 01:43fc $a7
    ret  Z                                             ;; 01:43fd $c8
    ld   HL, .data_01_4418                             ;; 01:43fe $21 $18 $44
    push HL                                            ;; 01:4401 $e5
    ld   A, [wC6EE]                                    ;; 01:4402 $fa $ee $c6
    swap A                                             ;; 01:4405 $cb $37
    sra  A                                             ;; 01:4407 $cb $2f
    sra  A                                             ;; 01:4409 $cb $2f
    and  A, $03                                        ;; 01:440b $e6 $03
    call doJumptable                                   ;; 01:440d $cd $3a $37
;@jumptable amount=4
    dw   call_01_44e9                                  ;; 01:4410 pP $00
    dw   call_01_4562                                  ;; 01:4412 pP $01
    dw   call_01_445f                                  ;; 01:4414 pP $02
    dw   call_01_45db                                  ;; 01:4416 pP $03
.data_01_4418:
    ld   A, $ff                                        ;; 01:4418 $3e $ff
    bit  0, A                                          ;; 01:441a $cb $47
    ret                                                ;; 01:441c $c9

call_01_441d:
    xor  A, A                                          ;; 01:441d $af
    ld   [wCA30], A                                    ;; 01:441e $ea $30 $ca
    ld   A, $01                                        ;; 01:4421 $3e $01
    ld   [wCA56], A                                    ;; 01:4423 $ea $56 $ca
    ld   A, [wC6F1]                                    ;; 01:4426 $fa $f1 $c6
    ld   [wC6F0], A                                    ;; 01:4429 $ea $f0 $c6
    call call_00_0165                                  ;; 01:442c $cd $65 $01

jp_01_442f:
    call call_01_4490                                  ;; 01:442f $cd $90 $44

jp_01_4432:
    ld   A, $80                                        ;; 01:4432 $3e $80
    ld   [wC6EE], A                                    ;; 01:4434 $ea $ee $c6
    call call_01_4645                                  ;; 01:4437 $cd $45 $46
    jr   Z, .jr_01_4442                                ;; 01:443a $28 $06
    ld   A, $01                                        ;; 01:443c $3e $01
    ld   [wCA30], A                                    ;; 01:443e $ea $30 $ca
    ret                                                ;; 01:4441 $c9
.jr_01_4442:
    xor  A, A                                          ;; 01:4442 $af
    ld   [wCA51], A                                    ;; 01:4443 $ea $51 $ca
    ld   A, $10                                        ;; 01:4446 $3e $10
    ld   [wC6EF], A                                    ;; 01:4448 $ea $ef $c6
    call call_00_01d7                                  ;; 01:444b $cd $d7 $01
    call call_00_3c36                                  ;; 01:444e $cd $36 $3c
    ld   A, [HL]                                       ;; 01:4451 $7e
    add  A, $10                                        ;; 01:4452 $c6 $10
    ld   [HL+], A                                      ;; 01:4454 $22
    ld   E, L                                          ;; 01:4455 $5d
    ld   D, H                                          ;; 01:4456 $54
    ld   HL, wCA04                                     ;; 01:4457 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:445a $1a
    adc  A, $00                                        ;; 01:445b $ce $00
    and  A, [HL]                                       ;; 01:445d $a6
    ld   [DE], A                                       ;; 01:445e $12

call_01_445f:
    call call_00_0c5b                                  ;; 01:445f $cd $5b $0c
    call call_00_01d7                                  ;; 01:4462 $cd $d7 $01
    call call_00_3c0b                                  ;; 01:4465 $cd $0b $3c
    ld   E, L                                          ;; 01:4468 $5d
    ld   D, H                                          ;; 01:4469 $54
    ld   HL, wC6F4                                     ;; 01:446a $21 $f4 $c6
    ld   A, [DE]                                       ;; 01:446d $1a
    add  A, [HL]                                       ;; 01:446e $86
    ld   [DE], A                                       ;; 01:446f $12
    inc  DE                                            ;; 01:4470 $13
    ld   HL, wCA04                                     ;; 01:4471 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:4474 $1a
    adc  A, $00                                        ;; 01:4475 $ce $00
    and  A, [HL]                                       ;; 01:4477 $a6
    ld   [DE], A                                       ;; 01:4478 $12
    ld   HL, wC6F4                                     ;; 01:4479 $21 $f4 $c6
    ldh  A, [hFF92]                                    ;; 01:447c $f0 $92
    add  A, [HL]                                       ;; 01:447e $86
    ldh  [hFF92], A                                    ;; 01:447f $e0 $92
    ld   A, [wCA03]                                    ;; 01:4481 $fa $03 $ca
    adc  A, $00                                        ;; 01:4484 $ce $00
    ld   HL, wCA04                                     ;; 01:4486 $21 $04 $ca
    and  A, [HL]                                       ;; 01:4489 $a6
    ld   [wCA03], A                                    ;; 01:448a $ea $03 $ca
    jp   jp_01_4609                                    ;; 01:448d $c3 $09 $46

call_01_4490:
    ld   HL, data_01_6abe                              ;; 01:4490 $21 $be $6a

jp_01_4493:
    push HL                                            ;; 01:4493 $e5
    call call_00_01d7                                  ;; 01:4494 $cd $d7 $01
    call call_00_3c70                                  ;; 01:4497 $cd $70 $3c
    ld   A, [HL]                                       ;; 01:449a $7e
    pop  HL                                            ;; 01:449b $e1
    call call_00_3741                                  ;; 01:449c $cd $41 $37
    ld   D, H                                          ;; 01:449f $54
    ld   E, L                                          ;; 01:44a0 $5d
    call call_00_3c25                                  ;; 01:44a1 $cd $25 $3c
    ld   A, E                                          ;; 01:44a4 $7b
    ld   [HL+], A                                      ;; 01:44a5 $22
    ld   [HL], D                                       ;; 01:44a6 $72
    ret                                                ;; 01:44a7 $c9

call_01_44a8:
    xor  A, A                                          ;; 01:44a8 $af
    ld   [wCA30], A                                    ;; 01:44a9 $ea $30 $ca
    ld   A, $01                                        ;; 01:44ac $3e $01
    ld   [wCA56], A                                    ;; 01:44ae $ea $56 $ca
    ld   A, [wC6F1]                                    ;; 01:44b1 $fa $f1 $c6
    ld   [wC6F0], A                                    ;; 01:44b4 $ea $f0 $c6
    call call_00_0165                                  ;; 01:44b7 $cd $65 $01

jp_01_44ba:
    call call_01_451a                                  ;; 01:44ba $cd $1a $45

jp_01_44bd:
    xor  A, A                                          ;; 01:44bd $af
    ld   [wC6EE], A                                    ;; 01:44be $ea $ee $c6
    call call_01_4645                                  ;; 01:44c1 $cd $45 $46
    jr   Z, .jr_01_44cc                                ;; 01:44c4 $28 $06
    ld   A, $01                                        ;; 01:44c6 $3e $01
    ld   [wCA30], A                                    ;; 01:44c8 $ea $30 $ca
    ret                                                ;; 01:44cb $c9
.jr_01_44cc:
    xor  A, A                                          ;; 01:44cc $af
    ld   [wCA51], A                                    ;; 01:44cd $ea $51 $ca
    ld   A, $10                                        ;; 01:44d0 $3e $10
    ld   [wC6EF], A                                    ;; 01:44d2 $ea $ef $c6
    call call_00_01d7                                  ;; 01:44d5 $cd $d7 $01
    call call_00_3c36                                  ;; 01:44d8 $cd $36 $3c
    ld   A, [HL]                                       ;; 01:44db $7e
    sub  A, $10                                        ;; 01:44dc $d6 $10
    ld   [HL+], A                                      ;; 01:44de $22
    ld   E, L                                          ;; 01:44df $5d
    ld   D, H                                          ;; 01:44e0 $54
    ld   HL, wCA04                                     ;; 01:44e1 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:44e4 $1a
    sbc  A, $00                                        ;; 01:44e5 $de $00
    and  A, [HL]                                       ;; 01:44e7 $a6
    ld   [DE], A                                       ;; 01:44e8 $12

call_01_44e9:
    call call_00_0ba2                                  ;; 01:44e9 $cd $a2 $0b
    call call_00_01d7                                  ;; 01:44ec $cd $d7 $01
    call call_00_3c0b                                  ;; 01:44ef $cd $0b $3c
    ld   E, L                                          ;; 01:44f2 $5d
    ld   D, H                                          ;; 01:44f3 $54
    ld   HL, wC6F4                                     ;; 01:44f4 $21 $f4 $c6
    ld   A, [DE]                                       ;; 01:44f7 $1a
    sub  A, [HL]                                       ;; 01:44f8 $96
    ld   [DE], A                                       ;; 01:44f9 $12
    inc  DE                                            ;; 01:44fa $13
    ld   HL, wCA04                                     ;; 01:44fb $21 $04 $ca
    ld   A, [DE]                                       ;; 01:44fe $1a
    sbc  A, $00                                        ;; 01:44ff $de $00
    and  A, [HL]                                       ;; 01:4501 $a6
    ld   [DE], A                                       ;; 01:4502 $12
    ld   HL, wC6F4                                     ;; 01:4503 $21 $f4 $c6
    ldh  A, [hFF92]                                    ;; 01:4506 $f0 $92
    sub  A, [HL]                                       ;; 01:4508 $96
    ldh  [hFF92], A                                    ;; 01:4509 $e0 $92
    ld   A, [wCA03]                                    ;; 01:450b $fa $03 $ca
    sbc  A, $00                                        ;; 01:450e $de $00
    ld   HL, wCA04                                     ;; 01:4510 $21 $04 $ca
    and  A, [HL]                                       ;; 01:4513 $a6
    ld   [wCA03], A                                    ;; 01:4514 $ea $03 $ca
    jp   jp_01_4609                                    ;; 01:4517 $c3 $09 $46

call_01_451a:
    ld   HL, data_01_6afe                              ;; 01:451a $21 $fe $6a
    jp   jp_01_4493                                    ;; 01:451d $c3 $93 $44

call_01_4520:
    xor  A, A                                          ;; 01:4520 $af
    ld   [wCA30], A                                    ;; 01:4521 $ea $30 $ca
    ld   A, $01                                        ;; 01:4524 $3e $01
    ld   [wCA56], A                                    ;; 01:4526 $ea $56 $ca
    ld   A, [wC6F1]                                    ;; 01:4529 $fa $f1 $c6
    ld   [wC6F0], A                                    ;; 01:452c $ea $f0 $c6
    call call_00_0165                                  ;; 01:452f $cd $65 $01

jp_01_4532:
    call call_01_4593                                  ;; 01:4532 $cd $93 $45

jp_01_4535:
    ld   A, $40                                        ;; 01:4535 $3e $40
    ld   [wC6EE], A                                    ;; 01:4537 $ea $ee $c6
    call call_01_4645                                  ;; 01:453a $cd $45 $46
    jr   Z, .jr_01_4545                                ;; 01:453d $28 $06
    ld   A, $01                                        ;; 01:453f $3e $01
    ld   [wCA30], A                                    ;; 01:4541 $ea $30 $ca
    ret                                                ;; 01:4544 $c9
.jr_01_4545:
    xor  A, A                                          ;; 01:4545 $af
    ld   [wCA51], A                                    ;; 01:4546 $ea $51 $ca
    ld   A, $10                                        ;; 01:4549 $3e $10
    ld   [wC6EF], A                                    ;; 01:454b $ea $ef $c6
    call call_00_01d7                                  ;; 01:454e $cd $d7 $01
    call call_00_3c3f                                  ;; 01:4551 $cd $3f $3c
    ld   A, [HL]                                       ;; 01:4554 $7e
    add  A, $10                                        ;; 01:4555 $c6 $10
    ld   [HL+], A                                      ;; 01:4557 $22
    ld   E, L                                          ;; 01:4558 $5d
    ld   D, H                                          ;; 01:4559 $54
    ld   HL, wCA05                                     ;; 01:455a $21 $05 $ca
    ld   A, [DE]                                       ;; 01:455d $1a
    adc  A, $00                                        ;; 01:455e $ce $00
    and  A, [HL]                                       ;; 01:4560 $a6
    ld   [DE], A                                       ;; 01:4561 $12

call_01_4562:
    call call_00_0a3a                                  ;; 01:4562 $cd $3a $0a
    call call_00_01d7                                  ;; 01:4565 $cd $d7 $01
    call call_00_3c14                                  ;; 01:4568 $cd $14 $3c
    ld   E, L                                          ;; 01:456b $5d
    ld   D, H                                          ;; 01:456c $54
    ld   HL, wC6F4                                     ;; 01:456d $21 $f4 $c6
    ld   A, [DE]                                       ;; 01:4570 $1a
    add  A, [HL]                                       ;; 01:4571 $86
    ld   [DE], A                                       ;; 01:4572 $12
    inc  DE                                            ;; 01:4573 $13
    ld   HL, wCA05                                     ;; 01:4574 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:4577 $1a
    adc  A, $00                                        ;; 01:4578 $ce $00
    and  A, [HL]                                       ;; 01:457a $a6
    ld   [DE], A                                       ;; 01:457b $12
    ld   HL, wC6F4                                     ;; 01:457c $21 $f4 $c6
    ldh  A, [hFF91]                                    ;; 01:457f $f0 $91
    add  A, [HL]                                       ;; 01:4581 $86
    ldh  [hFF91], A                                    ;; 01:4582 $e0 $91
    ld   A, [wCA02]                                    ;; 01:4584 $fa $02 $ca
    adc  A, $00                                        ;; 01:4587 $ce $00
    ld   HL, wCA05                                     ;; 01:4589 $21 $05 $ca
    and  A, [HL]                                       ;; 01:458c $a6
    ld   [wCA02], A                                    ;; 01:458d $ea $02 $ca
    jp   jp_01_4609                                    ;; 01:4590 $c3 $09 $46

call_01_4593:
    ld   HL, data_01_6b7e                              ;; 01:4593 $21 $7e $6b
    jp   jp_01_4493                                    ;; 01:4596 $c3 $93 $44

call_01_4599:
    xor  A, A                                          ;; 01:4599 $af
    ld   [wCA30], A                                    ;; 01:459a $ea $30 $ca
    ld   A, $01                                        ;; 01:459d $3e $01
    ld   [wCA56], A                                    ;; 01:459f $ea $56 $ca
    ld   A, [wC6F1]                                    ;; 01:45a2 $fa $f1 $c6
    ld   [wC6F0], A                                    ;; 01:45a5 $ea $f0 $c6
    call call_00_0165                                  ;; 01:45a8 $cd $65 $01

jp_01_45ab:
    call call_01_4637                                  ;; 01:45ab $cd $37 $46

jp_01_45ae:
    ld   A, $c0                                        ;; 01:45ae $3e $c0
    ld   [wC6EE], A                                    ;; 01:45b0 $ea $ee $c6
    call call_01_4645                                  ;; 01:45b3 $cd $45 $46
    jr   Z, .jr_01_45be                                ;; 01:45b6 $28 $06
    ld   A, $01                                        ;; 01:45b8 $3e $01
    ld   [wCA30], A                                    ;; 01:45ba $ea $30 $ca
    ret                                                ;; 01:45bd $c9
.jr_01_45be:
    xor  A, A                                          ;; 01:45be $af
    ld   [wCA51], A                                    ;; 01:45bf $ea $51 $ca
    ld   A, $10                                        ;; 01:45c2 $3e $10
    ld   [wC6EF], A                                    ;; 01:45c4 $ea $ef $c6
    call call_00_01d7                                  ;; 01:45c7 $cd $d7 $01
    call call_00_3c3f                                  ;; 01:45ca $cd $3f $3c
    ld   A, [HL]                                       ;; 01:45cd $7e
    sub  A, $10                                        ;; 01:45ce $d6 $10
    ld   [HL+], A                                      ;; 01:45d0 $22
    ld   E, L                                          ;; 01:45d1 $5d
    ld   D, H                                          ;; 01:45d2 $54
    ld   HL, wCA05                                     ;; 01:45d3 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:45d6 $1a
    sbc  A, $00                                        ;; 01:45d7 $de $00
    and  A, [HL]                                       ;; 01:45d9 $a6
    ld   [DE], A                                       ;; 01:45da $12

call_01_45db:
    call call_00_0aee                                  ;; 01:45db $cd $ee $0a
    call call_00_01d7                                  ;; 01:45de $cd $d7 $01
    call call_00_3c14                                  ;; 01:45e1 $cd $14 $3c
    ld   E, L                                          ;; 01:45e4 $5d
    ld   D, H                                          ;; 01:45e5 $54
    ld   HL, wC6F4                                     ;; 01:45e6 $21 $f4 $c6
    ld   A, [DE]                                       ;; 01:45e9 $1a
    sub  A, [HL]                                       ;; 01:45ea $96
    ld   [DE], A                                       ;; 01:45eb $12
    inc  DE                                            ;; 01:45ec $13
    ld   HL, wCA05                                     ;; 01:45ed $21 $05 $ca
    ld   A, [DE]                                       ;; 01:45f0 $1a
    sbc  A, $00                                        ;; 01:45f1 $de $00
    and  A, [HL]                                       ;; 01:45f3 $a6
    ld   [DE], A                                       ;; 01:45f4 $12
    ld   HL, wC6F4                                     ;; 01:45f5 $21 $f4 $c6
    ldh  A, [hFF91]                                    ;; 01:45f8 $f0 $91
    sub  A, [HL]                                       ;; 01:45fa $96
    ldh  [hFF91], A                                    ;; 01:45fb $e0 $91
    ld   A, [wCA02]                                    ;; 01:45fd $fa $02 $ca
    sbc  A, $00                                        ;; 01:4600 $de $00
    ld   HL, wCA05                                     ;; 01:4602 $21 $05 $ca
    and  A, [HL]                                       ;; 01:4605 $a6
    ld   [wCA02], A                                    ;; 01:4606 $ea $02 $ca

jp_01_4609:
    ld   HL, wC6F4                                     ;; 01:4609 $21 $f4 $c6
    ld   A, [wC6EF]                                    ;; 01:460c $fa $ef $c6
    sub  A, [HL]                                       ;; 01:460f $96
    ld   [wC6EF], A                                    ;; 01:4610 $ea $ef $c6
    and  A, A                                          ;; 01:4613 $a7
    jr   Z, .jr_01_4617                                ;; 01:4614 $28 $01
    ret                                                ;; 01:4616 $c9
.jr_01_4617:
    ld   A, [wCA2B]                                    ;; 01:4617 $fa $2b $ca
    and  A, A                                          ;; 01:461a $a7
    ret  Z                                             ;; 01:461b $c8
    ld   A, [wC6E3]                                    ;; 01:461c $fa $e3 $c6
    cp   A, $03                                        ;; 01:461f $fe $03
    jr   C, .jr_01_4629                                ;; 01:4621 $38 $06
    ld   A, [wC6FB]                                    ;; 01:4623 $fa $fb $c6
    cp   A, $e4                                        ;; 01:4626 $fe $e4
    ret  Z                                             ;; 01:4628 $c8
.jr_01_4629:
    call call_00_39d5                                  ;; 01:4629 $cd $d5 $39
    ld   HL, wCA2B                                     ;; 01:462c $21 $2b $ca
    cp   A, [HL]                                       ;; 01:462f $be
    ret  NC                                            ;; 01:4630 $d0
    ld   A, $01                                        ;; 01:4631 $3e $01
    ld   [wCA2C], A                                    ;; 01:4633 $ea $2c $ca
    ret                                                ;; 01:4636 $c9

call_01_4637:
    ld   HL, data_01_6b3e                              ;; 01:4637 $21 $3e $6b
    jp   jp_01_4493                                    ;; 01:463a $c3 $93 $44

call_01_463d:
    call call_00_3c60                                  ;; 01:463d $cd $60 $3c
    ld   A, [wC806]                                    ;; 01:4640 $fa $06 $c8
    ld   [HL], A                                       ;; 01:4643 $77
    ret                                                ;; 01:4644 $c9

call_01_4645:
    call call_00_01d7                                  ;; 01:4645 $cd $d7 $01
    call call_01_471e                                  ;; 01:4648 $cd $1e $47
    call call_00_1024                                  ;; 01:464b $cd $24 $10
    ret  NZ                                            ;; 01:464e $c0

jp_01_464f:
    call call_01_465f                                  ;; 01:464f $cd $5f $46
    ret  NZ                                            ;; 01:4652 $c0
    call call_00_01d7                                  ;; 01:4653 $cd $d7 $01
    call call_01_463d                                  ;; 01:4656 $cd $3d $46
    call call_01_4e48                                  ;; 01:4659 $cd $48 $4e
    xor  A, A                                          ;; 01:465c $af
    and  A, A                                          ;; 01:465d $a7
    ret                                                ;; 01:465e $c9

call_01_465f:
    ld   A, $02                                        ;; 01:465f $3e $02
    ldh  [hFF96], A                                    ;; 01:4661 $e0 $96
.jr_01_4663:
    call call_00_3c03                                  ;; 01:4663 $cd $03 $3c
    ld   A, [HL]                                       ;; 01:4666 $7e
    and  A, A                                          ;; 01:4667 $a7
    jr   Z, .jr_01_46b8                                ;; 01:4668 $28 $4e
    call call_00_3c90                                  ;; 01:466a $cd $90 $3c
    ld   A, [HL]                                       ;; 01:466d $7e
    and  A, $40                                        ;; 01:466e $e6 $40
    jr   NZ, .jr_01_46b8                               ;; 01:4670 $20 $46
    call call_00_3c36                                  ;; 01:4672 $cd $36 $3c
    ld   E, L                                          ;; 01:4675 $5d
    ld   D, H                                          ;; 01:4676 $54
    ld   HL, wC800                                     ;; 01:4677 $21 $00 $c8
    ld   A, [DE]                                       ;; 01:467a $1a
    cp   A, [HL]                                       ;; 01:467b $be
    jr   NZ, .jr_01_46b8                               ;; 01:467c $20 $3a
    inc  HL                                            ;; 01:467e $23
    inc  DE                                            ;; 01:467f $13
    ld   A, [DE]                                       ;; 01:4680 $1a
    cp   A, [HL]                                       ;; 01:4681 $be
    jr   NZ, .jr_01_46b8                               ;; 01:4682 $20 $34
    call call_00_3c3f                                  ;; 01:4684 $cd $3f $3c
    ld   E, L                                          ;; 01:4687 $5d
    ld   D, H                                          ;; 01:4688 $54
    ld   HL, wC802                                     ;; 01:4689 $21 $02 $c8
    ld   A, [DE]                                       ;; 01:468c $1a
    cp   A, [HL]                                       ;; 01:468d $be
    jr   NZ, .jr_01_46b8                               ;; 01:468e $20 $28
    inc  HL                                            ;; 01:4690 $23
    inc  DE                                            ;; 01:4691 $13
    ld   A, [DE]                                       ;; 01:4692 $1a
    cp   A, [HL]                                       ;; 01:4693 $be
    jr   NZ, .jr_01_46b8                               ;; 01:4694 $20 $22
    call call_00_3c50                                  ;; 01:4696 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:4699 $7e
    and  A, $08                                        ;; 01:469a $e6 $08
    jr   Z, .jr_01_46a7                                ;; 01:469c $28 $09
    ld   E, L                                          ;; 01:469e $5d
    ld   D, H                                          ;; 01:469f $54
    ld   HL, wC804                                     ;; 01:46a0 $21 $04 $c8
    ld   A, [DE]                                       ;; 01:46a3 $1a
    cp   A, [HL]                                       ;; 01:46a4 $be
    jr   NZ, .jr_01_46b8                               ;; 01:46a5 $20 $11
.jr_01_46a7:
    call call_00_3c70                                  ;; 01:46a7 $cd $70 $3c
    ld   A, [HL]                                       ;; 01:46aa $7e
    cp   A, $0b                                        ;; 01:46ab $fe $0b
    ret  NZ                                            ;; 01:46ad $c0
    call call_01_46c5                                  ;; 01:46ae $cd $c5 $46
    jr   Z, .jr_01_46b8                                ;; 01:46b1 $28 $05
    ld   A, $ff                                        ;; 01:46b3 $3e $ff
    bit  0, A                                          ;; 01:46b5 $cb $47
    ret                                                ;; 01:46b7 $c9
.jr_01_46b8:
    ldh  A, [hFF96]                                    ;; 01:46b8 $f0 $96
    add  A, $01                                        ;; 01:46ba $c6 $01
    ldh  [hFF96], A                                    ;; 01:46bc $e0 $96
    cp   A, $10                                        ;; 01:46be $fe $10
    jr   NZ, .jr_01_4663                               ;; 01:46c0 $20 $a1
    xor  A, A                                          ;; 01:46c2 $af
    and  A, A                                          ;; 01:46c3 $a7
    ret                                                ;; 01:46c4 $c9

call_01_46c5:
    ld   A, [wCA26]                                    ;; 01:46c5 $fa $26 $ca
    inc  A                                             ;; 01:46c8 $3c
    ld   [wCA26], A                                    ;; 01:46c9 $ea $26 $ca
    cp   A, $08                                        ;; 01:46cc $fe $08
    jr   Z, .jr_01_46d5                                ;; 01:46ce $28 $05
    ld   A, $ff                                        ;; 01:46d0 $3e $ff
    bit  0, A                                          ;; 01:46d2 $cb $47
    ret                                                ;; 01:46d4 $c9
.jr_01_46d5:
    xor  A, A                                          ;; 01:46d5 $af
    ld   [wCA26], A                                    ;; 01:46d6 $ea $26 $ca
    call call_00_3c48                                  ;; 01:46d9 $cd $48 $3c
    ld   A, [wC6EE]                                    ;; 01:46dc $fa $ee $c6
    ld   [HL], A                                       ;; 01:46df $77
    ld   HL, wC800                                     ;; 01:46e0 $21 $00 $c8
    ld   DE, wC810                                     ;; 01:46e3 $11 $10 $c8
    call call_00_1f81                                  ;; 01:46e6 $cd $81 $1f
    call call_01_5312                                  ;; 01:46e9 $cd $12 $53
    call call_00_0ffd                                  ;; 01:46ec $cd $fd $0f
    jr   NZ, .jr_01_46f4                               ;; 01:46ef $20 $03
    call call_01_52ae                                  ;; 01:46f1 $cd $ae $52
.jr_01_46f4:
    push AF                                            ;; 01:46f4 $f5
    ld   HL, wC810                                     ;; 01:46f5 $21 $10 $c8
    ld   DE, wC800                                     ;; 01:46f8 $11 $00 $c8
    call call_00_1f81                                  ;; 01:46fb $cd $81 $1f
    pop  AF                                            ;; 01:46fe $f1
    ret                                                ;; 01:46ff $c9

call_01_4700:
    call call_00_3c50                                  ;; 01:4700 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:4703 $7e
    ld   [wC804], A                                    ;; 01:4704 $ea $04 $c8
    call call_00_3c36                                  ;; 01:4707 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:470a $2a
    ld   [wC800], A                                    ;; 01:470b $ea $00 $c8
    ld   A, [HL]                                       ;; 01:470e $7e
    ld   [wC801], A                                    ;; 01:470f $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4712 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:4715 $2a
    ld   [wC802], A                                    ;; 01:4716 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:4719 $7e
    ld   [wC803], A                                    ;; 01:471a $ea $03 $c8
    ret                                                ;; 01:471d $c9

call_01_471e:
    call call_00_3c50                                  ;; 01:471e $cd $50 $3c
    ld   A, [HL]                                       ;; 01:4721 $7e
    ld   [wC804], A                                    ;; 01:4722 $ea $04 $c8
    ld   A, [wC6EE]                                    ;; 01:4725 $fa $ee $c6
    and  A, A                                          ;; 01:4728 $a7
    jp   Z, call_01_4755                               ;; 01:4729 $ca $55 $47
    cp   A, $40                                        ;; 01:472c $fe $40
    jp   Z, call_01_4793                               ;; 01:472e $ca $93 $47
    cp   A, $80                                        ;; 01:4731 $fe $80
    jp   Z, call_01_4774                               ;; 01:4733 $ca $74 $47

call_01_4736:
    call call_00_3c36                                  ;; 01:4736 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4739 $2a
    ld   [wC800], A                                    ;; 01:473a $ea $00 $c8
    ld   A, [HL]                                       ;; 01:473d $7e
    ld   [wC801], A                                    ;; 01:473e $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4741 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:4744 $2a
    sub  A, $10                                        ;; 01:4745 $d6 $10
    ld   [wC802], A                                    ;; 01:4747 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:474a $7e
    sbc  A, $00                                        ;; 01:474b $de $00
    ld   HL, wCA05                                     ;; 01:474d $21 $05 $ca
    and  A, [HL]                                       ;; 01:4750 $a6
    ld   [wC803], A                                    ;; 01:4751 $ea $03 $c8
    ret                                                ;; 01:4754 $c9

call_01_4755:
    call call_00_3c36                                  ;; 01:4755 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4758 $2a
    sub  A, $10                                        ;; 01:4759 $d6 $10
    ld   [wC800], A                                    ;; 01:475b $ea $00 $c8
    ld   A, [HL]                                       ;; 01:475e $7e
    sbc  A, $00                                        ;; 01:475f $de $00
    ld   HL, wCA04                                     ;; 01:4761 $21 $04 $ca
    and  A, [HL]                                       ;; 01:4764 $a6
    ld   [wC801], A                                    ;; 01:4765 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4768 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:476b $2a
    ld   [wC802], A                                    ;; 01:476c $ea $02 $c8
    ld   A, [HL]                                       ;; 01:476f $7e
    ld   [wC803], A                                    ;; 01:4770 $ea $03 $c8
    ret                                                ;; 01:4773 $c9

call_01_4774:
    call call_00_3c36                                  ;; 01:4774 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4777 $2a
    add  A, $10                                        ;; 01:4778 $c6 $10
    ld   [wC800], A                                    ;; 01:477a $ea $00 $c8
    ld   A, [HL]                                       ;; 01:477d $7e
    adc  A, $00                                        ;; 01:477e $ce $00
    ld   HL, wCA04                                     ;; 01:4780 $21 $04 $ca
    and  A, [HL]                                       ;; 01:4783 $a6
    ld   [wC801], A                                    ;; 01:4784 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4787 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:478a $2a
    ld   [wC802], A                                    ;; 01:478b $ea $02 $c8
    ld   A, [HL]                                       ;; 01:478e $7e
    ld   [wC803], A                                    ;; 01:478f $ea $03 $c8
    ret                                                ;; 01:4792 $c9

call_01_4793:
    call call_00_3c36                                  ;; 01:4793 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4796 $2a
    ld   [wC800], A                                    ;; 01:4797 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:479a $7e
    ld   [wC801], A                                    ;; 01:479b $ea $01 $c8
    call call_00_3c3f                                  ;; 01:479e $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:47a1 $2a
    add  A, $10                                        ;; 01:47a2 $c6 $10
    ld   [wC802], A                                    ;; 01:47a4 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:47a7 $7e
    adc  A, $00                                        ;; 01:47a8 $ce $00
    ld   HL, wCA05                                     ;; 01:47aa $21 $05 $ca
    and  A, [HL]                                       ;; 01:47ad $a6
    ld   [wC803], A                                    ;; 01:47ae $ea $03 $c8
    ret                                                ;; 01:47b1 $c9

call_01_47b2:
    ldh  A, [hFF8B]                                    ;; 01:47b2 $f0 $8b
    and  A, $02                                        ;; 01:47b4 $e6 $02
    ret  Z                                             ;; 01:47b6 $c8
    ld   A, $39                                        ;; 01:47b7 $3e $39
    ldh  [hFFBC], A                                    ;; 01:47b9 $e0 $bc
    xor  A, A                                          ;; 01:47bb $af
    ld   [wCA26], A                                    ;; 01:47bc $ea $26 $ca
    ld   A, $01                                        ;; 01:47bf $3e $01
    ld   [wC6F4], A                                    ;; 01:47c1 $ea $f4 $c6
    ld   HL, .data_01_47de                             ;; 01:47c4 $21 $de $47
    push HL                                            ;; 01:47c7 $e5
    ld   A, [wC6EE]                                    ;; 01:47c8 $fa $ee $c6
    swap A                                             ;; 01:47cb $cb $37
    sra  A                                             ;; 01:47cd $cb $2f
    sra  A                                             ;; 01:47cf $cb $2f
    and  A, $03                                        ;; 01:47d1 $e6 $03
    call doJumptable                                   ;; 01:47d3 $cd $3a $37
;@jumptable amount=4
    dw   call_01_47e3                                  ;; 01:47d6 ?? $00
    dw   call_01_4897                                  ;; 01:47d8 ?? $01
    dw   call_01_483d                                  ;; 01:47da ?? $02
    dw   call_01_48f1                                  ;; 01:47dc ?? $03
.data_01_47de:
    db   $3e, $ff, $cb, $47, $c9                       ;; 01:47de ?????

call_01_47e3:
    call call_01_4a7f                                  ;; 01:47e3 $cd $7f $4a
    call doJumptable                                   ;; 01:47e6 $cd $3a $37
;@jumptable amount=4
    dw   call_01_48ff                                  ;; 01:47e9 ?? $00
    dw   call_01_495e                                  ;; 01:47eb ?? $01
    dw   call_01_47f1                                  ;; 01:47ed ?? $02
    dw   call_01_4805                                  ;; 01:47ef ?? $03

call_01_47f1:
    ld   A, $01                                        ;; 01:47f1 $3e $01
    ld   [wCA56], A                                    ;; 01:47f3 $ea $56 $ca
    ld   A, $1f                                        ;; 01:47f6 $3e $1f
    ld   [wCA13], A                                    ;; 01:47f8 $ea $13 $ca
    ld   B, $01                                        ;; 01:47fb $06 $01
    call call_01_4811                                  ;; 01:47fd $cd $11 $48
    ld   B, $10                                        ;; 01:4800 $06 $10
    jp   jp_01_4965                                    ;; 01:4802 $c3 $65 $49

call_01_4805:
    ld   A, $01                                        ;; 01:4805 $3e $01
    ld   [wCA56], A                                    ;; 01:4807 $ea $56 $ca
    ld   A, $9f                                        ;; 01:480a $3e $9f
    ld   [wCA13], A                                    ;; 01:480c $ea $13 $ca
    ld   B, $02                                        ;; 01:480f $06 $02

call_01_4811:
    push BC                                            ;; 01:4811 $c5
    ld   A, $10                                        ;; 01:4812 $3e $10
    ld   [wC6EF], A                                    ;; 01:4814 $ea $ef $c6
    call call_00_01d7                                  ;; 01:4817 $cd $d7 $01
    call call_00_3c36                                  ;; 01:481a $cd $36 $3c
    ld   A, [HL]                                       ;; 01:481d $7e
    sub  A, $10                                        ;; 01:481e $d6 $10
    ld   [HL+], A                                      ;; 01:4820 $22
    ld   E, L                                          ;; 01:4821 $5d
    ld   D, H                                          ;; 01:4822 $54
    ld   HL, wCA04                                     ;; 01:4823 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:4826 $1a
    sbc  A, $00                                        ;; 01:4827 $de $00
    and  A, [HL]                                       ;; 01:4829 $a6
    ld   [DE], A                                       ;; 01:482a $12
    ld   B, $10                                        ;; 01:482b $06 $10
.jr_01_482d:
    push BC                                            ;; 01:482d $c5
    call call_01_44e9                                  ;; 01:482e $cd $e9 $44
    call call_01_49bd                                  ;; 01:4831 $cd $bd $49
    pop  BC                                            ;; 01:4834 $c1
    dec  B                                             ;; 01:4835 $05
    jr   NZ, .jr_01_482d                               ;; 01:4836 $20 $f5
    pop  BC                                            ;; 01:4838 $c1
    dec  B                                             ;; 01:4839 $05
    jr   NZ, call_01_4811                              ;; 01:483a $20 $d5
    ret                                                ;; 01:483c $c9

call_01_483d:
    call call_01_4a7f                                  ;; 01:483d $cd $7f $4a
    call doJumptable                                   ;; 01:4840 $cd $3a $37
;@jumptable amount=2
    dw   call_01_48ff                                  ;; 01:4843 ?? $00
    dw   call_01_495e                                  ;; 01:4845 ?? $01
    db   $4b                                           ;; 01:4847 ?

data_01_4848:
    db   $48, $5f, $48, $3e, $01, $ea, $56, $ca        ;; 01:4848 ????????
    db   $3e, $1f, $ea, $13, $ca, $06, $01, $cd        ;; 01:4850 ????????
    db   $6b, $48, $06, $10, $c3, $65, $49, $3e        ;; 01:4858 ????????
    db   $01, $ea, $56, $ca, $3e, $9f, $ea, $13        ;; 01:4860 ????????
    db   $ca, $06, $02, $c5, $3e, $10, $ea, $ef        ;; 01:4868 ????????
    db   $c6, $cd, $d7, $01, $cd, $36, $3c, $7e        ;; 01:4870 ????????
    db   $c6, $10, $22, $5d, $54, $21, $04, $ca        ;; 01:4878 ????????
    db   $1a, $ce, $00, $a6, $12, $06, $10, $c5        ;; 01:4880 ????????
    db   $cd, $5f, $44, $cd, $bd, $49, $c1, $05        ;; 01:4888 ????????
    db   $20, $f5, $c1, $05, $20, $d5, $c9             ;; 01:4890 ???????

call_01_4897:
    call call_01_4a7f                                  ;; 01:4897 $cd $7f $4a
    call doJumptable                                   ;; 01:489a $cd $3a $37
;@jumptable amount=4
    dw   call_01_48ff                                  ;; 01:489d ?? $00
    dw   call_01_495e                                  ;; 01:489f ?? $01
    dw   call_01_48a5                                  ;; 01:48a1 ?? $02
    dw   call_01_48b9                                  ;; 01:48a3 ?? $03

call_01_48a5:
    ld   A, $01                                        ;; 01:48a5 $3e $01
    ld   [wCA56], A                                    ;; 01:48a7 $ea $56 $ca
    ld   A, $1f                                        ;; 01:48aa $3e $1f
    ld   [wCA13], A                                    ;; 01:48ac $ea $13 $ca
    ld   B, $01                                        ;; 01:48af $06 $01
    call call_01_48c5                                  ;; 01:48b1 $cd $c5 $48
    ld   B, $10                                        ;; 01:48b4 $06 $10
    jp   jp_01_4965                                    ;; 01:48b6 $c3 $65 $49

call_01_48b9:
    ld   A, $01                                        ;; 01:48b9 $3e $01
    ld   [wCA56], A                                    ;; 01:48bb $ea $56 $ca
    ld   A, $9f                                        ;; 01:48be $3e $9f
    ld   [wCA13], A                                    ;; 01:48c0 $ea $13 $ca
    ld   B, $02                                        ;; 01:48c3 $06 $02

call_01_48c5:
    push BC                                            ;; 01:48c5 $c5
    ld   A, $10                                        ;; 01:48c6 $3e $10
    ld   [wC6EF], A                                    ;; 01:48c8 $ea $ef $c6
    call call_00_01d7                                  ;; 01:48cb $cd $d7 $01
    call call_00_3c3f                                  ;; 01:48ce $cd $3f $3c
    ld   A, [HL]                                       ;; 01:48d1 $7e
    add  A, $10                                        ;; 01:48d2 $c6 $10
    ld   [HL+], A                                      ;; 01:48d4 $22
    ld   E, L                                          ;; 01:48d5 $5d
    ld   D, H                                          ;; 01:48d6 $54
    ld   HL, wCA05                                     ;; 01:48d7 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:48da $1a
    adc  A, $00                                        ;; 01:48db $ce $00
    and  A, [HL]                                       ;; 01:48dd $a6
    ld   [DE], A                                       ;; 01:48de $12
    ld   B, $10                                        ;; 01:48df $06 $10
.jr_01_48e1:
    push BC                                            ;; 01:48e1 $c5
    call call_01_4562                                  ;; 01:48e2 $cd $62 $45
    call call_01_49bd                                  ;; 01:48e5 $cd $bd $49
    pop  BC                                            ;; 01:48e8 $c1
    dec  B                                             ;; 01:48e9 $05
    jr   NZ, .jr_01_48e1                               ;; 01:48ea $20 $f5
    pop  BC                                            ;; 01:48ec $c1
    dec  B                                             ;; 01:48ed $05
    jr   NZ, call_01_48c5                              ;; 01:48ee $20 $d5
    ret                                                ;; 01:48f0 $c9

call_01_48f1:
    call call_01_4a7f                                  ;; 01:48f1 $cd $7f $4a
    call doJumptable                                   ;; 01:48f4 $cd $3a $37
;@jumptable amount=4
    dw   call_01_48ff                                  ;; 01:48f7 ?? $00
    dw   call_01_495e                                  ;; 01:48f9 ?? $01
    dw   call_01_4971                                  ;; 01:48fb ?? $02
    dw   call_01_4985                                  ;; 01:48fd ?? $03

call_01_48ff:
    ld   A, $10                                        ;; 01:48ff $3e $10
    ldh  [hFFBC], A                                    ;; 01:4901 $e0 $bc
    ld   C, $0f                                        ;; 01:4903 $0e $0f
    ld   B, $00                                        ;; 01:4905 $06 $00
.jr_01_4907:
    push BC                                            ;; 01:4907 $c5
    ld   HL, .data_01_4936                             ;; 01:4908 $21 $36 $49
    add  HL, BC                                        ;; 01:490b $09
    add  HL, BC                                        ;; 01:490c $09
    ld   E, [HL]                                       ;; 01:490d $5e
    inc  HL                                            ;; 01:490e $23
    ld   D, [HL]                                       ;; 01:490f $56
    ldh  A, [hFF92]                                    ;; 01:4910 $f0 $92
    add  A, E                                          ;; 01:4912 $83
    ldh  [hFF92], A                                    ;; 01:4913 $e0 $92
    ld   A, [wCA03]                                    ;; 01:4915 $fa $03 $ca
    adc  A, D                                          ;; 01:4918 $8a
    ld   [wCA03], A                                    ;; 01:4919 $ea $03 $ca
    ld   A, $01                                        ;; 01:491c $3e $01
    call call_00_3a6d                                  ;; 01:491e $cd $6d $3a
    pop  BC                                            ;; 01:4921 $c1
    dec  C                                             ;; 01:4922 $0d
    jr   NZ, .jr_01_4907                               ;; 01:4923 $20 $e2
    ld   A, $0c                                        ;; 01:4925 $3e $0c
    ld   BC, $612                                      ;; 01:4927 $01 $12 $06
    ld   DE, $101                                      ;; 01:492a $11 $01 $01
    ld   HL, .data_01_4956                             ;; 01:492d $21 $56 $49
    call call_00_3211                                  ;; 01:4930 $cd $11 $32
    jp   call_00_35d2                                  ;; 01:4933 $c3 $d2 $35
.data_01_4936:
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 01:4936 ????????
    db   $00, $00, $ff, $ff, $02, $00, $fd, $ff        ;; 01:493e ????????
    db   $04, $00, $fa, $ff, $08, $00, $f6, $ff        ;; 01:4946 ????????
    db   $0c, $00, $f2, $ff, $10, $00, $f8, $ff        ;; 01:494e ????????
.data_01_4956:
    db   $c8, $e8, $d6, $db, $f3, $f3, $0b, $00        ;; 01:4956 ????????

call_01_495e:
    ld   A, $9f                                        ;; 01:495e $3e $9f
    ld   [wCA13], A                                    ;; 01:4960 $ea $13 $ca
    ld   B, $20                                        ;; 01:4963 $06 $20

jp_01_4965:
    push BC                                            ;; 01:4965 $c5
    call call_00_01d7                                  ;; 01:4966 $cd $d7 $01
    call call_01_49bd                                  ;; 01:4969 $cd $bd $49
    pop  BC                                            ;; 01:496c $c1
    dec  B                                             ;; 01:496d $05
    jr   NZ, jp_01_4965                                ;; 01:496e $20 $f5
    ret                                                ;; 01:4970 $c9

call_01_4971:
    ld   A, $01                                        ;; 01:4971 $3e $01
    ld   [wCA56], A                                    ;; 01:4973 $ea $56 $ca
    ld   A, $1f                                        ;; 01:4976 $3e $1f
    ld   [wCA13], A                                    ;; 01:4978 $ea $13 $ca
    ld   B, $01                                        ;; 01:497b $06 $01
    call call_01_4991                                  ;; 01:497d $cd $91 $49
    ld   B, $10                                        ;; 01:4980 $06 $10
    jp   jp_01_4965                                    ;; 01:4982 $c3 $65 $49

call_01_4985:
    ld   A, $01                                        ;; 01:4985 $3e $01
    ld   [wCA56], A                                    ;; 01:4987 $ea $56 $ca
    ld   A, $9f                                        ;; 01:498a $3e $9f
    ld   [wCA13], A                                    ;; 01:498c $ea $13 $ca
    ld   B, $02                                        ;; 01:498f $06 $02

call_01_4991:
    push BC                                            ;; 01:4991 $c5
    ld   A, $10                                        ;; 01:4992 $3e $10
    ld   [wC6EF], A                                    ;; 01:4994 $ea $ef $c6
    call call_00_01d7                                  ;; 01:4997 $cd $d7 $01
    call call_00_3c3f                                  ;; 01:499a $cd $3f $3c
    ld   A, [HL]                                       ;; 01:499d $7e
    sub  A, $10                                        ;; 01:499e $d6 $10
    ld   [HL+], A                                      ;; 01:49a0 $22
    ld   E, L                                          ;; 01:49a1 $5d
    ld   D, H                                          ;; 01:49a2 $54
    ld   HL, wCA05                                     ;; 01:49a3 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:49a6 $1a
    sbc  A, $00                                        ;; 01:49a7 $de $00
    and  A, [HL]                                       ;; 01:49a9 $a6
    ld   [DE], A                                       ;; 01:49aa $12
    ld   B, $10                                        ;; 01:49ab $06 $10
.jr_01_49ad:
    push BC                                            ;; 01:49ad $c5
    call call_01_45db                                  ;; 01:49ae $cd $db $45
    call call_01_49bd                                  ;; 01:49b1 $cd $bd $49
    pop  BC                                            ;; 01:49b4 $c1
    dec  B                                             ;; 01:49b5 $05
    jr   NZ, .jr_01_49ad                               ;; 01:49b6 $20 $f5
    pop  BC                                            ;; 01:49b8 $c1
    dec  B                                             ;; 01:49b9 $05
    jr   NZ, call_01_4991                              ;; 01:49ba $20 $d5
    ret                                                ;; 01:49bc $c9

call_01_49bd:
    call call_00_01d7                                  ;; 01:49bd $cd $d7 $01
    call call_00_3c1d                                  ;; 01:49c0 $cd $1d $3c
    ld   E, [HL]                                       ;; 01:49c3 $5e
    push DE                                            ;; 01:49c4 $d5
    xor  A, A                                          ;; 01:49c5 $af
    ld   [HL], A                                       ;; 01:49c6 $77
    call call_01_49de                                  ;; 01:49c7 $cd $de $49
    call call_00_01a0                                  ;; 01:49ca $cd $a0 $01
    ld   A, $01                                        ;; 01:49cd $3e $01
    call call_00_3a6d                                  ;; 01:49cf $cd $6d $3a
    call call_01_54a0                                  ;; 01:49d2 $cd $a0 $54
    call call_00_01d7                                  ;; 01:49d5 $cd $d7 $01
    call call_00_3c1d                                  ;; 01:49d8 $cd $1d $3c
    pop  DE                                            ;; 01:49db $d1
    ld   [HL], E                                       ;; 01:49dc $73
    ret                                                ;; 01:49dd $c9

call_01_49de:
    call call_00_3c0b                                  ;; 01:49de $cd $0b $3c
    push HL                                            ;; 01:49e1 $e5
    ld   HL, .data_01_4a2f                             ;; 01:49e2 $21 $2f $4a
    ld   A, [wCA13]                                    ;; 01:49e5 $fa $13 $ca
    srl  A                                             ;; 01:49e8 $cb $3f
    and  A, $3e                                        ;; 01:49ea $e6 $3e
    ld   E, A                                          ;; 01:49ec $5f
    ld   D, $00                                        ;; 01:49ed $16 $00
    add  HL, DE                                        ;; 01:49ef $19
    pop  DE                                            ;; 01:49f0 $d1
    ld   C, [HL]                                       ;; 01:49f1 $4e
    inc  HL                                            ;; 01:49f2 $23
    ld   B, [HL]                                       ;; 01:49f3 $46
    ld   A, [DE]                                       ;; 01:49f4 $1a
    add  A, C                                          ;; 01:49f5 $81
    ld   [DE], A                                       ;; 01:49f6 $12
    inc  DE                                            ;; 01:49f7 $13
    ld   A, [DE]                                       ;; 01:49f8 $1a
    adc  A, B                                          ;; 01:49f9 $88
    ld   [DE], A                                       ;; 01:49fa $12
    call call_01_4f24                                  ;; 01:49fb $cd $24 $4f
    call call_00_3c0b                                  ;; 01:49fe $cd $0b $3c
    push HL                                            ;; 01:4a01 $e5
    ld   HL, .data_01_4a3f                             ;; 01:4a02 $21 $3f $4a
    ld   A, [wCA13]                                    ;; 01:4a05 $fa $13 $ca
    and  A, $3f                                        ;; 01:4a08 $e6 $3f
    sla  A                                             ;; 01:4a0a $cb $27
    ld   E, A                                          ;; 01:4a0c $5f
    ld   D, $00                                        ;; 01:4a0d $16 $00
    add  HL, DE                                        ;; 01:4a0f $19
    pop  DE                                            ;; 01:4a10 $d1
    ld   C, [HL]                                       ;; 01:4a11 $4e
    inc  HL                                            ;; 01:4a12 $23
    ld   B, [HL]                                       ;; 01:4a13 $46
    ld   A, [DE]                                       ;; 01:4a14 $1a
    add  A, C                                          ;; 01:4a15 $81
    ld   [DE], A                                       ;; 01:4a16 $12
    inc  DE                                            ;; 01:4a17 $13
    ld   A, [DE]                                       ;; 01:4a18 $1a
    adc  A, B                                          ;; 01:4a19 $88
    ld   [DE], A                                       ;; 01:4a1a $12
    call call_00_01d7                                  ;; 01:4a1b $cd $d7 $01
    ld   A, [wCA13]                                    ;; 01:4a1e $fa $13 $ca
    and  A, $80                                        ;; 01:4a21 $e6 $80
    ld   B, A                                          ;; 01:4a23 $47
    ld   A, [wCA13]                                    ;; 01:4a24 $fa $13 $ca
    and  A, $7f                                        ;; 01:4a27 $e6 $7f
    dec  A                                             ;; 01:4a29 $3d
    or   A, B                                          ;; 01:4a2a $b0
    ld   [wCA13], A                                    ;; 01:4a2b $ea $13 $ca
    ret                                                ;; 01:4a2e $c9
.data_01_4a2f:
    db   $02, $00, $02, $00, $01, $00, $01, $00        ;; 01:4a2f ????????
    db   $ff, $ff, $ff, $ff, $fe, $ff, $fe, $ff        ;; 01:4a37 ????????
.data_01_4a3f:
    db   $00, $00, $02, $00, $04, $00, $06, $00        ;; 01:4a3f ????????
    db   $08, $00, $0a, $00, $0c, $00, $0e, $00        ;; 01:4a47 ????????
    db   $10, $00, $11, $00, $12, $00, $13, $00        ;; 01:4a4f ????????
    db   $14, $00, $15, $00, $16, $00, $17, $00        ;; 01:4a57 ????????
    db   $18, $00, $17, $00, $16, $00, $15, $00        ;; 01:4a5f ????????
    db   $14, $00, $13, $00, $12, $00, $11, $00        ;; 01:4a67 ????????
    db   $10, $00, $0e, $00, $0c, $00, $0a, $00        ;; 01:4a6f ????????
    db   $08, $00, $06, $00, $04, $00, $02, $00        ;; 01:4a77 ????????

call_01_4a7f:
    ld   A, [wCA51]                                    ;; 01:4a7f $fa $51 $ca
    and  A, A                                          ;; 01:4a82 $a7
    jr   NZ, .jr_01_4a99                               ;; 01:4a83 $20 $14
    call call_00_3c58                                  ;; 01:4a85 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4a88 $7e
    and  A, $f0                                        ;; 01:4a89 $e6 $f0
    cp   A, $30                                        ;; 01:4a8b $fe $30
    jr   Z, .jr_01_4a99                                ;; 01:4a8d $28 $0a
    call call_00_3c50                                  ;; 01:4a8f $cd $50 $3c
    ld   A, [HL]                                       ;; 01:4a92 $7e
    and  A, $8b                                        ;; 01:4a93 $e6 $8b
    cp   A, $09                                        ;; 01:4a95 $fe $09
    jr   NZ, .jr_01_4a9b                               ;; 01:4a97 $20 $02
.jr_01_4a99:
    xor  A, A                                          ;; 01:4a99 $af
    ret                                                ;; 01:4a9a $c9
.jr_01_4a9b:
    call call_01_471e                                  ;; 01:4a9b $cd $1e $47
    call call_01_4b5e                                  ;; 01:4a9e $cd $5e $4b
    jr   NZ, .jr_01_4aa6                               ;; 01:4aa1 $20 $03
    ld   A, $01                                        ;; 01:4aa3 $3e $01
    ret                                                ;; 01:4aa5 $c9
.jr_01_4aa6:
    call call_01_4ba7                                  ;; 01:4aa6 $cd $a7 $4b
    jr   NZ, .jr_01_4ab9                               ;; 01:4aa9 $20 $0e
    call call_01_4ac7                                  ;; 01:4aab $cd $c7 $4a
    call call_01_4ba7                                  ;; 01:4aae $cd $a7 $4b
    jr   Z, .jr_01_4ab6                                ;; 01:4ab1 $28 $03
    ld   A, $02                                        ;; 01:4ab3 $3e $02
    ret                                                ;; 01:4ab5 $c9
.jr_01_4ab6:
    ld   A, $03                                        ;; 01:4ab6 $3e $03
    ret                                                ;; 01:4ab8 $c9
.jr_01_4ab9:
    call call_01_4ac7                                  ;; 01:4ab9 $cd $c7 $4a
    call call_01_4ba7                                  ;; 01:4abc $cd $a7 $4b
    jr   Z, .jr_01_4ac4                                ;; 01:4abf $28 $03
    ld   A, $01                                        ;; 01:4ac1 $3e $01
    ret                                                ;; 01:4ac3 $c9
.jr_01_4ac4:
    ld   A, $03                                        ;; 01:4ac4 $3e $03
    ret                                                ;; 01:4ac6 $c9

call_01_4ac7:
    call call_00_01d7                                  ;; 01:4ac7 $cd $d7 $01
    call call_00_3c50                                  ;; 01:4aca $cd $50 $3c
    ld   A, [HL]                                       ;; 01:4acd $7e
    ld   [wC804], A                                    ;; 01:4ace $ea $04 $c8
    ld   A, [wC6EE]                                    ;; 01:4ad1 $fa $ee $c6
    and  A, A                                          ;; 01:4ad4 $a7
    jp   Z, .jp_01_4b01                                ;; 01:4ad5 $ca $01 $4b
    cp   A, $40                                        ;; 01:4ad8 $fe $40
    jp   Z, .jp_01_4b3f                                ;; 01:4ada $ca $3f $4b
    cp   A, $80                                        ;; 01:4add $fe $80
    jp   Z, .jp_01_4b20                                ;; 01:4adf $ca $20 $4b
    call call_00_3c36                                  ;; 01:4ae2 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4ae5 $2a
    ld   [wC800], A                                    ;; 01:4ae6 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:4ae9 $7e
    ld   [wC801], A                                    ;; 01:4aea $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4aed $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:4af0 $2a
    sub  A, $20                                        ;; 01:4af1 $d6 $20
    ld   [wC802], A                                    ;; 01:4af3 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:4af6 $7e
    sbc  A, $00                                        ;; 01:4af7 $de $00
    ld   HL, wCA05                                     ;; 01:4af9 $21 $05 $ca
    and  A, [HL]                                       ;; 01:4afc $a6
    ld   [wC803], A                                    ;; 01:4afd $ea $03 $c8
    ret                                                ;; 01:4b00 $c9
.jp_01_4b01:
    call call_00_3c36                                  ;; 01:4b01 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4b04 $2a
    sub  A, $20                                        ;; 01:4b05 $d6 $20
    ld   [wC800], A                                    ;; 01:4b07 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:4b0a $7e
    sbc  A, $00                                        ;; 01:4b0b $de $00
    ld   HL, wCA04                                     ;; 01:4b0d $21 $04 $ca
    and  A, [HL]                                       ;; 01:4b10 $a6
    ld   [wC801], A                                    ;; 01:4b11 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4b14 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:4b17 $2a
    ld   [wC802], A                                    ;; 01:4b18 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:4b1b $7e
    ld   [wC803], A                                    ;; 01:4b1c $ea $03 $c8
    ret                                                ;; 01:4b1f $c9
.jp_01_4b20:
    call call_00_3c36                                  ;; 01:4b20 $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4b23 $2a
    add  A, $20                                        ;; 01:4b24 $c6 $20
    ld   [wC800], A                                    ;; 01:4b26 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:4b29 $7e
    adc  A, $00                                        ;; 01:4b2a $ce $00
    ld   HL, wCA04                                     ;; 01:4b2c $21 $04 $ca
    and  A, [HL]                                       ;; 01:4b2f $a6
    ld   [wC801], A                                    ;; 01:4b30 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4b33 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:4b36 $2a
    ld   [wC802], A                                    ;; 01:4b37 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:4b3a $7e
    ld   [wC803], A                                    ;; 01:4b3b $ea $03 $c8
    ret                                                ;; 01:4b3e $c9
.jp_01_4b3f:
    call call_00_3c36                                  ;; 01:4b3f $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:4b42 $2a
    ld   [wC800], A                                    ;; 01:4b43 $ea $00 $c8
    ld   A, [HL+]                                      ;; 01:4b46 $2a
    ld   [wC801], A                                    ;; 01:4b47 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:4b4a $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:4b4d $2a
    add  A, $20                                        ;; 01:4b4e $c6 $20
    ld   [wC802], A                                    ;; 01:4b50 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:4b53 $7e
    adc  A, $00                                        ;; 01:4b54 $ce $00
    ld   HL, wCA05                                     ;; 01:4b56 $21 $05 $ca
    and  A, [HL]                                       ;; 01:4b59 $a6
    ld   [wC803], A                                    ;; 01:4b5a $ea $03 $c8
    ret                                                ;; 01:4b5d $c9

call_01_4b5e:
    call call_00_1060                                  ;; 01:4b5e $cd $60 $10
    push AF                                            ;; 01:4b61 $f5
    and  A, $08                                        ;; 01:4b62 $e6 $08
    jr   Z, .jr_01_4b75                                ;; 01:4b64 $28 $0f
    ld   A, [wC804]                                    ;; 01:4b66 $fa $04 $c8
    and  A, $cb                                        ;; 01:4b69 $e6 $cb
    cp   A, $09                                        ;; 01:4b6b $fe $09
    jr   NZ, .jr_01_4b75                               ;; 01:4b6d $20 $06
.jr_01_4b6f:
    ld   A, $ff                                        ;; 01:4b6f $3e $ff
    bit  0, A                                          ;; 01:4b71 $cb $47
    pop  BC                                            ;; 01:4b73 $c1
    ret                                                ;; 01:4b74 $c9
.jr_01_4b75:
    ld   A, [wC806]                                    ;; 01:4b75 $fa $06 $c8
    and  A, $40                                        ;; 01:4b78 $e6 $40
    ld   HL, wCA12                                     ;; 01:4b7a $21 $12 $ca
    cp   A, [HL]                                       ;; 01:4b7d $be
    jr   NZ, .jr_01_4b6f                               ;; 01:4b7e $20 $ef
    ld   A, [wC805]                                    ;; 01:4b80 $fa $05 $c8
    cp   A, $eb                                        ;; 01:4b83 $fe $eb
    jr   Z, .jr_01_4b6f                                ;; 01:4b85 $28 $e8
    cp   A, $c1                                        ;; 01:4b87 $fe $c1
    jr   Z, .jr_01_4b6f                                ;; 01:4b89 $28 $e4
    cp   A, $c3                                        ;; 01:4b8b $fe $c3
    jr   Z, .jr_01_4b6f                                ;; 01:4b8d $28 $e0
    cp   A, $c5                                        ;; 01:4b8f $fe $c5
    jr   Z, .jr_01_4b6f                                ;; 01:4b91 $28 $dc
    cp   A, $cc                                        ;; 01:4b93 $fe $cc
    jr   Z, .jr_01_4b6f                                ;; 01:4b95 $28 $d8
    cp   A, $e4                                        ;; 01:4b97 $fe $e4
    jr   Z, .jr_01_4b6f                                ;; 01:4b99 $28 $d4
    and  A, $70                                        ;; 01:4b9b $e6 $70
    cp   A, $30                                        ;; 01:4b9d $fe $30
    jr   Z, .jr_01_4b6f                                ;; 01:4b9f $28 $ce
    pop  AF                                            ;; 01:4ba1 $f1
    and  A, $03                                        ;; 01:4ba2 $e6 $03
    cp   A, $03                                        ;; 01:4ba4 $fe $03
    ret                                                ;; 01:4ba6 $c9

call_01_4ba7:
    call call_00_1060                                  ;; 01:4ba7 $cd $60 $10
    push AF                                            ;; 01:4baa $f5
    and  A, $08                                        ;; 01:4bab $e6 $08
    jr   Z, .jr_01_4bbe                                ;; 01:4bad $28 $0f
    ld   A, [wC804]                                    ;; 01:4baf $fa $04 $c8
    and  A, $0b                                        ;; 01:4bb2 $e6 $0b
    cp   A, $09                                        ;; 01:4bb4 $fe $09
    jr   NZ, .jr_01_4bbe                               ;; 01:4bb6 $20 $06
.jr_01_4bb8:
    ld   A, $ff                                        ;; 01:4bb8 $3e $ff
    bit  0, A                                          ;; 01:4bba $cb $47
    pop  BC                                            ;; 01:4bbc $c1
    ret                                                ;; 01:4bbd $c9
.jr_01_4bbe:
    ld   A, [wC806]                                    ;; 01:4bbe $fa $06 $c8
    and  A, $40                                        ;; 01:4bc1 $e6 $40
    ld   HL, wCA12                                     ;; 01:4bc3 $21 $12 $ca
    cp   A, [HL]                                       ;; 01:4bc6 $be
    jr   NZ, .jr_01_4bb8                               ;; 01:4bc7 $20 $ef
    ld   A, [wC805]                                    ;; 01:4bc9 $fa $05 $c8
    cp   A, $eb                                        ;; 01:4bcc $fe $eb
    jr   Z, .jr_01_4bb8                                ;; 01:4bce $28 $e8
    cp   A, $c1                                        ;; 01:4bd0 $fe $c1
    jr   Z, .jr_01_4bb8                                ;; 01:4bd2 $28 $e4
    cp   A, $c3                                        ;; 01:4bd4 $fe $c3
    jr   Z, .jr_01_4bb8                                ;; 01:4bd6 $28 $e0
    cp   A, $c5                                        ;; 01:4bd8 $fe $c5
    jr   Z, .jr_01_4bb8                                ;; 01:4bda $28 $dc
    cp   A, $cc                                        ;; 01:4bdc $fe $cc
    jr   Z, .jr_01_4bb8                                ;; 01:4bde $28 $d8
    cp   A, $e4                                        ;; 01:4be0 $fe $e4
    jr   Z, .jr_01_4bb8                                ;; 01:4be2 $28 $d4
    and  A, $70                                        ;; 01:4be4 $e6 $70
    cp   A, $30                                        ;; 01:4be6 $fe $30
    jr   Z, .jr_01_4bb8                                ;; 01:4be8 $28 $ce
    pop  AF                                            ;; 01:4bea $f1
    ld   B, A                                          ;; 01:4beb $47
    ld   A, [wC804]                                    ;; 01:4bec $fa $04 $c8
    and  A, $07                                        ;; 01:4bef $e6 $07
    and  A, B                                          ;; 01:4bf1 $a0
    ret  NZ                                            ;; 01:4bf2 $c0
    jp   jp_01_464f                                    ;; 01:4bf3 $c3 $4f $46

call_01_4bf6:
    call call_00_3c58                                  ;; 01:4bf6 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4bf9 $7e
    and  A, $c0                                        ;; 01:4bfa $e6 $c0
    cp   A, $80                                        ;; 01:4bfc $fe $80
    ret  NZ                                            ;; 01:4bfe $c0
    ld   A, [wC6E8]                                    ;; 01:4bff $fa $e8 $c6
    cp   A, $01                                        ;; 01:4c02 $fe $01
    jr   NZ, .jr_01_4c0e                               ;; 01:4c04 $20 $08
    ld   A, $ad                                        ;; 01:4c06 $3e $ad
    call call_00_3cb2                                  ;; 01:4c08 $cd $b2 $3c
    jp   C, jp_00_101f                                 ;; 01:4c0b $da $1f $10
.jr_01_4c0e:
    ld   A, [wC6E8]                                    ;; 01:4c0e $fa $e8 $c6
    cp   A, $50                                        ;; 01:4c11 $fe $50
    jr   NZ, .jr_01_4c21                               ;; 01:4c13 $20 $0c
    call call_00_3c2e                                  ;; 01:4c15 $cd $2e $3c
    ld   A, $30                                        ;; 01:4c18 $3e $30
    ld   [HL], A                                       ;; 01:4c1a $77
    call call_00_3c70                                  ;; 01:4c1b $cd $70 $3c
    ld   A, $1b                                        ;; 01:4c1e $3e $1b
    ld   [HL], A                                       ;; 01:4c20 $77
.jr_01_4c21:
    xor  A, A                                          ;; 01:4c21 $af
    ld   [wCA13], A                                    ;; 01:4c22 $ea $13 $ca
    call call_00_3c58                                  ;; 01:4c25 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4c28 $7e
    and  A, $03                                        ;; 01:4c29 $e6 $03
    ld   DE, .data_01_4c3a                             ;; 01:4c2b $11 $3a $4c
    push DE                                            ;; 01:4c2e $d5
    call doJumptable                                   ;; 01:4c2f $cd $3a $37
;@jumptable amount=4
    dw   call_01_4c3d                                  ;; 01:4c32 pP $00
    dw   call_01_4d2a                                  ;; 01:4c34 ?? $01
    dw   call_01_4c8c                                  ;; 01:4c36 ?? $02
    dw   call_01_4cdb                                  ;; 01:4c38 ?? $03
.data_01_4c3a:
    xor  A, A                                          ;; 01:4c3a $af
    and  A, A                                          ;; 01:4c3b $a7
    ret                                                ;; 01:4c3c $c9

call_01_4c3d:
    ldh  A, [hFF8A]                                    ;; 01:4c3d $f0 $8a
    and  A, $80                                        ;; 01:4c3f $e6 $80
    jr   Z, .jr_01_4c4c                                ;; 01:4c41 $28 $09
    call call_01_4d9c                                  ;; 01:4c43 $cd $9c $4d
    call call_01_4490                                  ;; 01:4c46 $cd $90 $44
    jp   jp_01_44bd                                    ;; 01:4c49 $c3 $bd $44
.jr_01_4c4c:
    ldh  A, [hFF8A]                                    ;; 01:4c4c $f0 $8a
    and  A, $20                                        ;; 01:4c4e $e6 $20
    jr   Z, .jr_01_4c63                                ;; 01:4c50 $28 $11
    call call_01_4599                                  ;; 01:4c52 $cd $99 $45
    ld   A, [wC6EF]                                    ;; 01:4c55 $fa $ef $c6
    and  A, A                                          ;; 01:4c58 $a7
    ret  NZ                                            ;; 01:4c59 $c0
    call call_01_4d79                                  ;; 01:4c5a $cd $79 $4d
    call call_01_4637                                  ;; 01:4c5d $cd $37 $46
    jp   jp_01_44bd                                    ;; 01:4c60 $c3 $bd $44
.jr_01_4c63:
    ldh  A, [hFF8A]                                    ;; 01:4c63 $f0 $8a
    and  A, $10                                        ;; 01:4c65 $e6 $10
    jr   Z, .jr_01_4c7a                                ;; 01:4c67 $28 $11
    call call_01_4520                                  ;; 01:4c69 $cd $20 $45
    ld   A, [wC6EF]                                    ;; 01:4c6c $fa $ef $c6
    and  A, A                                          ;; 01:4c6f $a7
    ret  NZ                                            ;; 01:4c70 $c0
    call call_01_4d79                                  ;; 01:4c71 $cd $79 $4d
    call call_01_4593                                  ;; 01:4c74 $cd $93 $45
    jp   jp_01_44bd                                    ;; 01:4c77 $c3 $bd $44
.jr_01_4c7a:
    ldh  A, [hFF8A]                                    ;; 01:4c7a $f0 $8a
    and  A, $40                                        ;; 01:4c7c $e6 $40
    jr   Z, .jr_01_4c86                                ;; 01:4c7e $28 $06
    call call_01_4d89                                  ;; 01:4c80 $cd $89 $4d
    jp   jp_01_44ba                                    ;; 01:4c83 $c3 $ba $44
.jr_01_4c86:
    call call_01_4d79                                  ;; 01:4c86 $cd $79 $4d
    jp   jp_01_44ba                                    ;; 01:4c89 $c3 $ba $44

call_01_4c8c:
    ldh  A, [hFF8A]                                    ;; 01:4c8c $f0 $8a
    and  A, $40                                        ;; 01:4c8e $e6 $40
    jr   Z, .jr_01_4c9b                                ;; 01:4c90 $28 $09
    call call_01_4d9c                                  ;; 01:4c92 $cd $9c $4d
    call call_01_451a                                  ;; 01:4c95 $cd $1a $45
    jp   jp_01_4432                                    ;; 01:4c98 $c3 $32 $44
.jr_01_4c9b:
    ldh  A, [hFF8A]                                    ;; 01:4c9b $f0 $8a
    and  A, $20                                        ;; 01:4c9d $e6 $20
    jr   Z, .jr_01_4cb2                                ;; 01:4c9f $28 $11
    call call_01_4599                                  ;; 01:4ca1 $cd $99 $45
    ld   A, [wC6EF]                                    ;; 01:4ca4 $fa $ef $c6
    and  A, A                                          ;; 01:4ca7 $a7
    ret  NZ                                            ;; 01:4ca8 $c0
    call call_01_4d79                                  ;; 01:4ca9 $cd $79 $4d
    call call_01_4637                                  ;; 01:4cac $cd $37 $46
    jp   jp_01_4432                                    ;; 01:4caf $c3 $32 $44
.jr_01_4cb2:
    ldh  A, [hFF8A]                                    ;; 01:4cb2 $f0 $8a
    and  A, $10                                        ;; 01:4cb4 $e6 $10
    jr   Z, .jr_01_4cc9                                ;; 01:4cb6 $28 $11
    call call_01_4520                                  ;; 01:4cb8 $cd $20 $45
    ld   A, [wC6EF]                                    ;; 01:4cbb $fa $ef $c6
    and  A, A                                          ;; 01:4cbe $a7
    ret  NZ                                            ;; 01:4cbf $c0
    call call_01_4d79                                  ;; 01:4cc0 $cd $79 $4d
    call call_01_4593                                  ;; 01:4cc3 $cd $93 $45
    jp   jp_01_4432                                    ;; 01:4cc6 $c3 $32 $44
.jr_01_4cc9:
    ldh  A, [hFF8A]                                    ;; 01:4cc9 $f0 $8a
    and  A, $80                                        ;; 01:4ccb $e6 $80
    jr   Z, .jr_01_4cd5                                ;; 01:4ccd $28 $06
    call call_01_4d89                                  ;; 01:4ccf $cd $89 $4d
    jp   jp_01_442f                                    ;; 01:4cd2 $c3 $2f $44
.jr_01_4cd5:
    call call_01_4d79                                  ;; 01:4cd5 $cd $79 $4d
    jp   jp_01_442f                                    ;; 01:4cd8 $c3 $2f $44

call_01_4cdb:
    ldh  A, [hFF8A]                                    ;; 01:4cdb $f0 $8a
    and  A, $10                                        ;; 01:4cdd $e6 $10
    jr   Z, .jr_01_4cea                                ;; 01:4cdf $28 $09
    call call_01_4d9c                                  ;; 01:4ce1 $cd $9c $4d
    call call_01_4593                                  ;; 01:4ce4 $cd $93 $45
    jp   jp_01_45ae                                    ;; 01:4ce7 $c3 $ae $45
.jr_01_4cea:
    ldh  A, [hFF8A]                                    ;; 01:4cea $f0 $8a
    and  A, $40                                        ;; 01:4cec $e6 $40
    jr   Z, .jr_01_4d01                                ;; 01:4cee $28 $11
    call call_01_44a8                                  ;; 01:4cf0 $cd $a8 $44
    ld   A, [wC6EF]                                    ;; 01:4cf3 $fa $ef $c6
    and  A, A                                          ;; 01:4cf6 $a7
    ret  NZ                                            ;; 01:4cf7 $c0
    call call_01_4d79                                  ;; 01:4cf8 $cd $79 $4d
    call call_01_451a                                  ;; 01:4cfb $cd $1a $45
    jp   jp_01_45ae                                    ;; 01:4cfe $c3 $ae $45
.jr_01_4d01:
    ldh  A, [hFF8A]                                    ;; 01:4d01 $f0 $8a
    and  A, $80                                        ;; 01:4d03 $e6 $80
    jr   Z, .jr_01_4d18                                ;; 01:4d05 $28 $11
    call call_01_441d                                  ;; 01:4d07 $cd $1d $44
    ld   A, [wC6EF]                                    ;; 01:4d0a $fa $ef $c6
    and  A, A                                          ;; 01:4d0d $a7
    ret  NZ                                            ;; 01:4d0e $c0
    call call_01_4d79                                  ;; 01:4d0f $cd $79 $4d
    call call_01_4593                                  ;; 01:4d12 $cd $93 $45
    jp   jp_01_45ae                                    ;; 01:4d15 $c3 $ae $45
.jr_01_4d18:
    ldh  A, [hFF8A]                                    ;; 01:4d18 $f0 $8a
    and  A, $20                                        ;; 01:4d1a $e6 $20
    jr   Z, .jr_01_4d24                                ;; 01:4d1c $28 $06
    call call_01_4d89                                  ;; 01:4d1e $cd $89 $4d
    jp   jp_01_45ab                                    ;; 01:4d21 $c3 $ab $45
.jr_01_4d24:
    call call_01_4d79                                  ;; 01:4d24 $cd $79 $4d
    jp   jp_01_45ab                                    ;; 01:4d27 $c3 $ab $45

call_01_4d2a:
    ldh  A, [hFF8A]                                    ;; 01:4d2a $f0 $8a
    and  A, $20                                        ;; 01:4d2c $e6 $20
    jr   Z, .jr_01_4d39                                ;; 01:4d2e $28 $09
    call call_01_4d9c                                  ;; 01:4d30 $cd $9c $4d
    call call_01_4637                                  ;; 01:4d33 $cd $37 $46
    jp   jp_01_4535                                    ;; 01:4d36 $c3 $35 $45
.jr_01_4d39:
    ldh  A, [hFF8A]                                    ;; 01:4d39 $f0 $8a
    and  A, $40                                        ;; 01:4d3b $e6 $40
    jr   Z, .jr_01_4d50                                ;; 01:4d3d $28 $11
    call call_01_44a8                                  ;; 01:4d3f $cd $a8 $44
    ld   A, [wC6EF]                                    ;; 01:4d42 $fa $ef $c6
    and  A, A                                          ;; 01:4d45 $a7
    ret  NZ                                            ;; 01:4d46 $c0
    call call_01_4d79                                  ;; 01:4d47 $cd $79 $4d
    call call_01_451a                                  ;; 01:4d4a $cd $1a $45
    jp   jp_01_4535                                    ;; 01:4d4d $c3 $35 $45
.jr_01_4d50:
    ldh  A, [hFF8A]                                    ;; 01:4d50 $f0 $8a
    and  A, $80                                        ;; 01:4d52 $e6 $80
    jr   Z, .jr_01_4d67                                ;; 01:4d54 $28 $11
    call call_01_441d                                  ;; 01:4d56 $cd $1d $44
    ld   A, [wC6EF]                                    ;; 01:4d59 $fa $ef $c6
    and  A, A                                          ;; 01:4d5c $a7
    ret  NZ                                            ;; 01:4d5d $c0
    call call_01_4d79                                  ;; 01:4d5e $cd $79 $4d
    call call_01_4490                                  ;; 01:4d61 $cd $90 $44
    jp   jp_01_4535                                    ;; 01:4d64 $c3 $35 $45
.jr_01_4d67:
    ldh  A, [hFF8A]                                    ;; 01:4d67 $f0 $8a
    and  A, $10                                        ;; 01:4d69 $e6 $10
    jr   Z, .jr_01_4d73                                ;; 01:4d6b $28 $06
    call call_01_4d89                                  ;; 01:4d6d $cd $89 $4d
    jp   jp_01_4532                                    ;; 01:4d70 $c3 $32 $45
.jr_01_4d73:
    call call_01_4d79                                  ;; 01:4d73 $cd $79 $4d
    jp   jp_01_4532                                    ;; 01:4d76 $c3 $32 $45

call_01_4d79:
    call call_00_3c58                                  ;; 01:4d79 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4d7c $7e
    and  A, $0c                                        ;; 01:4d7d $e6 $0c
    srl  A                                             ;; 01:4d7f $cb $3f
    srl  A                                             ;; 01:4d81 $cb $3f

jr_01_4d83:
    ld   [wC6F0], A                                    ;; 01:4d83 $ea $f0 $c6
    jp   call_00_0165                                  ;; 01:4d86 $c3 $65 $01

call_01_4d89:
    call call_00_3c58                                  ;; 01:4d89 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4d8c $7e
    and  A, $0c                                        ;; 01:4d8d $e6 $0c
    srl  A                                             ;; 01:4d8f $cb $3f
    srl  A                                             ;; 01:4d91 $cb $3f
    inc  A                                             ;; 01:4d93 $3c
    cp   A, $04                                        ;; 01:4d94 $fe $04
    jr   NZ, jr_01_4d83                                ;; 01:4d96 $20 $eb
    ld   A, $03                                        ;; 01:4d98 $3e $03
    jr   jr_01_4d83                                    ;; 01:4d9a $18 $e7

call_01_4d9c:
    call call_00_3c58                                  ;; 01:4d9c $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4d9f $7e
    and  A, $0c                                        ;; 01:4da0 $e6 $0c
    srl  A                                             ;; 01:4da2 $cb $3f
    srl  A                                             ;; 01:4da4 $cb $3f
    dec  A                                             ;; 01:4da6 $3d
    cp   A, $ff                                        ;; 01:4da7 $fe $ff
    jr   NZ, jr_01_4d83                                ;; 01:4da9 $20 $d8
    xor  A, A                                          ;; 01:4dab $af
    jr   jr_01_4d83                                    ;; 01:4dac $18 $d5

call_01_4dae:
    call call_00_3c58                                  ;; 01:4dae $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4db1 $7e
    and  A, $c0                                        ;; 01:4db2 $e6 $c0
    cp   A, $80                                        ;; 01:4db4 $fe $80
    ret  NZ                                            ;; 01:4db6 $c0
    ld   A, [wC6E8]                                    ;; 01:4db7 $fa $e8 $c6
    cp   A, $50                                        ;; 01:4dba $fe $50
    jr   NZ, .jr_01_4dca                               ;; 01:4dbc $20 $0c
    call call_00_3c2e                                  ;; 01:4dbe $cd $2e $3c
    ld   A, $30                                        ;; 01:4dc1 $3e $30
    ld   [HL], A                                       ;; 01:4dc3 $77
    call call_00_3c70                                  ;; 01:4dc4 $cd $70 $3c
    ld   A, $1b                                        ;; 01:4dc7 $3e $1b
    ld   [HL], A                                       ;; 01:4dc9 $77
.jr_01_4dca:
    call call_00_3c58                                  ;; 01:4dca $cd $58 $3c
    ld   A, [HL]                                       ;; 01:4dcd $7e
    and  A, $0c                                        ;; 01:4dce $e6 $0c
    srl  A                                             ;; 01:4dd0 $cb $3f
    srl  A                                             ;; 01:4dd2 $cb $3f
    call call_00_0173                                  ;; 01:4dd4 $cd $73 $01
    ld   B, A                                          ;; 01:4dd7 $47
    push HL                                            ;; 01:4dd8 $e5
    call call_00_3c68                                  ;; 01:4dd9 $cd $68 $3c
    ld   [HL], B                                       ;; 01:4ddc $70
    pop  HL                                            ;; 01:4ddd $e1
    ld   A, [HL]                                       ;; 01:4dde $7e
    and  A, $03                                        ;; 01:4ddf $e6 $03
    ld   DE, .data_01_4df0                             ;; 01:4de1 $11 $f0 $4d
    push DE                                            ;; 01:4de4 $d5
    call doJumptable                                   ;; 01:4de5 $cd $3a $37
;@jumptable amount=4
    dw   call_01_4df3                                  ;; 01:4de8 ?? $00
    dw   call_01_4dfc                                  ;; 01:4dea ?? $01
    dw   call_01_4df6                                  ;; 01:4dec ?? $02
    dw   call_01_4df9                                  ;; 01:4dee ?? $03
.data_01_4df0:
    db   $af, $a7, $c9                                 ;; 01:4df0 ???

call_01_4df3:
    jp   jp_01_5124                                    ;; 01:4df3 $c3 $24 $51

call_01_4df6:
    jp   jp_01_50df                                    ;; 01:4df6 $c3 $df $50

call_01_4df9:
    jp   jp_01_51af                                    ;; 01:4df9 $c3 $af $51

call_01_4dfc:
    jp   jp_01_5169                                    ;; 01:4dfc $c3 $69 $51

call_01_4dff:
    ld   HL, wD000                                     ;; 01:4dff $21 $00 $d0
    ld   A, [wC802]                                    ;; 01:4e02 $fa $02 $c8
    ld   E, A                                          ;; 01:4e05 $5f
    ld   A, [wC803]                                    ;; 01:4e06 $fa $03 $c8
    ld   D, A                                          ;; 01:4e09 $57
    ld   A, [wC801]                                    ;; 01:4e0a $fa $01 $c8
    ld   B, A                                          ;; 01:4e0d $47
    ld   A, [wC800]                                    ;; 01:4e0e $fa $00 $c8
    ld   C, A                                          ;; 01:4e11 $4f
    swap A                                             ;; 01:4e12 $cb $37
    and  A, $0f                                        ;; 01:4e14 $e6 $0f
    ld   C, A                                          ;; 01:4e16 $4f
    ld   A, C                                          ;; 01:4e17 $79
    swap B                                             ;; 01:4e18 $cb $30
    or   A, B                                          ;; 01:4e1a $b0
    ld   C, A                                          ;; 01:4e1b $4f
    ld   B, $04                                        ;; 01:4e1c $06 $04
.jr_01_4e1e:
    srl  D                                             ;; 01:4e1e $cb $3a
    rr   E                                             ;; 01:4e20 $cb $1b
    dec  B                                             ;; 01:4e22 $05
    jr   NZ, .jr_01_4e1e                               ;; 01:4e23 $20 $f9
    ld   A, [wCA07]                                    ;; 01:4e25 $fa $07 $ca
    dec  A                                             ;; 01:4e28 $3d
    ld   B, A                                          ;; 01:4e29 $47
    ld   D, $00                                        ;; 01:4e2a $16 $00
    ld   A, E                                          ;; 01:4e2c $7b
    and  A, B                                          ;; 01:4e2d $a0
    ld   E, A                                          ;; 01:4e2e $5f
    add  HL, DE                                        ;; 01:4e2f $19
    ld   A, C                                          ;; 01:4e30 $79
    and  A, A                                          ;; 01:4e31 $a7
    jr   Z, .jr_01_4e3e                                ;; 01:4e32 $28 $0a
    ld   A, [wCA07]                                    ;; 01:4e34 $fa $07 $ca
    ld   E, A                                          ;; 01:4e37 $5f
    ld   D, $00                                        ;; 01:4e38 $16 $00
.jr_01_4e3a:
    add  HL, DE                                        ;; 01:4e3a $19
    dec  C                                             ;; 01:4e3b $0d
    jr   NZ, .jr_01_4e3a                               ;; 01:4e3c $20 $fc
.jr_01_4e3e:
    ld   E, L                                          ;; 01:4e3e $5d
    ld   A, H                                          ;; 01:4e3f $7c
    ld   HL, wCA06                                     ;; 01:4e40 $21 $06 $ca
    and  A, [HL]                                       ;; 01:4e43 $a6
    or   A, $d0                                        ;; 01:4e44 $f6 $d0
    ld   D, A                                          ;; 01:4e46 $57
    ret                                                ;; 01:4e47 $c9

call_01_4e48:
    call call_00_3c58                                  ;; 01:4e48 $cd $58 $3c
    ld   A, [wC805]                                    ;; 01:4e4b $fa $05 $c8
    ld   [HL], A                                       ;; 01:4e4e $77
    ld   A, [wC6E3]                                    ;; 01:4e4f $fa $e3 $c6
    and  A, A                                          ;; 01:4e52 $a7
    jr   Z, .jr_01_4e5b                                ;; 01:4e53 $28 $06
    cp   A, $02                                        ;; 01:4e55 $fe $02
    jr   Z, .jr_01_4e5b                                ;; 01:4e57 $28 $02
    jr   .jr_01_4e80                                   ;; 01:4e59 $18 $25
.jr_01_4e5b:
    ld   A, [HL]                                       ;; 01:4e5b $7e
    cp   A, $c1                                        ;; 01:4e5c $fe $c1
    jr   Z, .jr_01_4e94                                ;; 01:4e5e $28 $34
    cp   A, $c3                                        ;; 01:4e60 $fe $c3
    jr   Z, .jr_01_4e94                                ;; 01:4e62 $28 $30
    cp   A, $c5                                        ;; 01:4e64 $fe $c5
    jr   Z, .jr_01_4e94                                ;; 01:4e66 $28 $2c
    cp   A, $cc                                        ;; 01:4e68 $fe $cc
    jr   Z, .jr_01_4e94                                ;; 01:4e6a $28 $28
    cp   A, $e4                                        ;; 01:4e6c $fe $e4
    jr   Z, .jr_01_4e94                                ;; 01:4e6e $28 $24
    cp   A, $e0                                        ;; 01:4e70 $fe $e0
    jr   Z, .jr_01_4e89                                ;; 01:4e72 $28 $15
    cp   A, $e1                                        ;; 01:4e74 $fe $e1
    jr   Z, .jr_01_4e89                                ;; 01:4e76 $28 $11
    and  A, $c0                                        ;; 01:4e78 $e6 $c0
    cp   A, $c0                                        ;; 01:4e7a $fe $c0
    jr   Z, .jr_01_4eb3                                ;; 01:4e7c $28 $35
    jr   NZ, .jr_01_4e9f                               ;; 01:4e7e $20 $1f
.jr_01_4e80:
    call call_00_3c1d                                  ;; 01:4e80 $cd $1d $3c
    ld   A, [HL]                                       ;; 01:4e83 $7e
    and  A, $f1                                        ;; 01:4e84 $e6 $f1
    ld   [HL], A                                       ;; 01:4e86 $77
    jr   .jr_01_4eb3                                   ;; 01:4e87 $18 $2a
.jr_01_4e89:
    call call_00_3c1d                                  ;; 01:4e89 $cd $1d $3c
    ld   A, [HL]                                       ;; 01:4e8c $7e
    and  A, $f1                                        ;; 01:4e8d $e6 $f1
    or   A, $02                                        ;; 01:4e8f $f6 $02
    ld   [HL], A                                       ;; 01:4e91 $77
    jr   .jr_01_4eb3                                   ;; 01:4e92 $18 $1f
.jr_01_4e94:
    call call_00_3c1d                                  ;; 01:4e94 $cd $1d $3c
    ld   A, [HL]                                       ;; 01:4e97 $7e
    and  A, $f1                                        ;; 01:4e98 $e6 $f1
    or   A, $06                                        ;; 01:4e9a $f6 $06
    ld   [HL], A                                       ;; 01:4e9c $77
    jr   .jr_01_4eb3                                   ;; 01:4e9d $18 $14
.jr_01_4e9f:
    call call_00_3c1d                                  ;; 01:4e9f $cd $1d $3c
    ld   A, [wC805]                                    ;; 01:4ea2 $fa $05 $c8
    and  A, $30                                        ;; 01:4ea5 $e6 $30
    srl  A                                             ;; 01:4ea7 $cb $3f
    srl  A                                             ;; 01:4ea9 $cb $3f
    srl  A                                             ;; 01:4eab $cb $3f
    ld   C, A                                          ;; 01:4ead $4f
    ld   A, [HL]                                       ;; 01:4eae $7e
    and  A, $f1                                        ;; 01:4eaf $e6 $f1
    or   A, C                                          ;; 01:4eb1 $b1
    ld   [HL], A                                       ;; 01:4eb2 $77
.jr_01_4eb3:
    call call_00_3c60                                  ;; 01:4eb3 $cd $60 $3c
    ld   A, [HL]                                       ;; 01:4eb6 $7e
    ld   HL, wCA12                                     ;; 01:4eb7 $21 $12 $ca
    and  A, $40                                        ;; 01:4eba $e6 $40
    cp   A, [HL]                                       ;; 01:4ebc $be
    jr   Z, .jr_01_4ec8                                ;; 01:4ebd $28 $09
    call call_00_3c1d                                  ;; 01:4ebf $cd $1d $3c
    ld   A, [HL]                                       ;; 01:4ec2 $7e
    and  A, $f1                                        ;; 01:4ec3 $e6 $f1
    or   A, $06                                        ;; 01:4ec5 $f6 $06
    ld   [HL], A                                       ;; 01:4ec7 $77
.jr_01_4ec8:
    call call_00_3c50                                  ;; 01:4ec8 $cd $50 $3c
    ld   A, [wC805]                                    ;; 01:4ecb $fa $05 $c8
    and  A, $c0                                        ;; 01:4ece $e6 $c0
    cp   A, $c0                                        ;; 01:4ed0 $fe $c0
    jr   Z, .jr_01_4edd                                ;; 01:4ed2 $28 $09
    cp   A, $80                                        ;; 01:4ed4 $fe $80
    jr   Z, .jr_01_4edd                                ;; 01:4ed6 $28 $05
    ld   A, [wC804]                                    ;; 01:4ed8 $fa $04 $c8
    ld   [HL], A                                       ;; 01:4edb $77
    ret                                                ;; 01:4edc $c9
.jr_01_4edd:
    ld   A, $47                                        ;; 01:4edd $3e $47
    ld   [HL], A                                       ;; 01:4edf $77
    ret                                                ;; 01:4ee0 $c9

jp_01_4ee1:
    call call_00_3c50                                  ;; 01:4ee1 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:4ee4 $7e
    ld   [wC804], A                                    ;; 01:4ee5 $ea $04 $c8
    ld   A, [wC805]                                    ;; 01:4ee8 $fa $05 $c8
    ld   B, A                                          ;; 01:4eeb $47
    and  A, $4b                                        ;; 01:4eec $e6 $4b
    jr   NZ, .jr_01_4ef8                               ;; 01:4eee $20 $08
    ld   A, [wC804]                                    ;; 01:4ef0 $fa $04 $c8
    or   A, $03                                        ;; 01:4ef3 $f6 $03
    ld   [wC804], A                                    ;; 01:4ef5 $ea $04 $c8
.jr_01_4ef8:
    ld   A, [wC804]                                    ;; 01:4ef8 $fa $04 $c8
    and  A, $03                                        ;; 01:4efb $e6 $03
    cp   A, $03                                        ;; 01:4efd $fe $03
    jr   NZ, .jr_01_4f16                               ;; 01:4eff $20 $15
    ld   A, B                                          ;; 01:4f01 $78
    and  A, $03                                        ;; 01:4f02 $e6 $03
    jr   Z, .jr_01_4f16                                ;; 01:4f04 $28 $10
    cp   A, $03                                        ;; 01:4f06 $fe $03
    jr   Z, .jr_01_4f16                                ;; 01:4f08 $28 $0c
    xor  A, $03                                        ;; 01:4f0a $ee $03
    ld   C, A                                          ;; 01:4f0c $4f
    ld   A, [wC804]                                    ;; 01:4f0d $fa $04 $c8
    and  A, $fc                                        ;; 01:4f10 $e6 $fc
    or   A, C                                          ;; 01:4f12 $b1
    ld   [wC804], A                                    ;; 01:4f13 $ea $04 $c8
.jr_01_4f16:
    ld   A, B                                          ;; 01:4f16 $78
    and  A, $08                                        ;; 01:4f17 $e6 $08
    ld   C, A                                          ;; 01:4f19 $4f
    ld   A, [wC804]                                    ;; 01:4f1a $fa $04 $c8
    and  A, $f7                                        ;; 01:4f1d $e6 $f7
    or   A, C                                          ;; 01:4f1f $b1
    ld   [wC804], A                                    ;; 01:4f20 $ea $04 $c8
    ret                                                ;; 01:4f23 $c9

call_01_4f24:
    ld   A, $00                                        ;; 01:4f24 $3e $00
    ldh  [hFF96], A                                    ;; 01:4f26 $e0 $96
    call call_00_004b                                  ;; 01:4f28 $cd $4b $00

call_01_4f2b:
    ld   A, $01                                        ;; 01:4f2b $3e $01
    ldh  [hFF96], A                                    ;; 01:4f2d $e0 $96
    call call_00_3c25                                  ;; 01:4f2f $cd $25 $3c
    ld   A, $44                                        ;; 01:4f32 $3e $44
    ld   [HL+], A                                      ;; 01:4f34 $22
    ld   A, [wCA13]                                    ;; 01:4f35 $fa $13 $ca
    and  A, A                                          ;; 01:4f38 $a7
    jr   Z, .jr_01_4f40                                ;; 01:4f39 $28 $05
    ld   A, $6e                                        ;; 01:4f3b $3e $6e
    ld   [HL], A                                       ;; 01:4f3d $77
    jr   .jr_01_4f42                                   ;; 01:4f3e $18 $02
.jr_01_4f40:
    xor  A, A                                          ;; 01:4f40 $af
    ld   [HL], A                                       ;; 01:4f41 $77
.jr_01_4f42:
    call call_01_4f50                                  ;; 01:4f42 $cd $50 $4f
    call call_00_3c2e                                  ;; 01:4f45 $cd $2e $3c
    ld   [HL], $70                                     ;; 01:4f48 $36 $70
    call call_00_3c03                                  ;; 01:4f4a $cd $03 $3c
    ld   [HL], $02                                     ;; 01:4f4d $36 $02
    ret                                                ;; 01:4f4f $c9

call_01_4f50:
    call call_00_0008                                  ;; 01:4f50 $cd $08 $00
    ret  Z                                             ;; 01:4f53 $c8
    push HL                                            ;; 01:4f54 $e5
    ld   HL, .data_01_4f5d                             ;; 01:4f55 $21 $5d $4f
    rst  add_hl_a                                      ;; 01:4f58 $c7
    ld   A, [HL]                                       ;; 01:4f59 $7e
    pop  HL                                            ;; 01:4f5a $e1
    ld   [HL], A                                       ;; 01:4f5b $77
    ret                                                ;; 01:4f5c $c9
.data_01_4f5d:
    db   $00, $6e, $00, $00, $00, $00, $00, $00        ;; 01:4f5d ????????
    db   $00                                           ;; 01:4f65 ?

call_01_4f66:
    ld   A, $02                                        ;; 01:4f66 $3e $02
    ldh  [hFF96], A                                    ;; 01:4f68 $e0 $96
.jr_01_4f6a:
    call call_00_3c03                                  ;; 01:4f6a $cd $03 $3c
    ld   A, [HL]                                       ;; 01:4f6d $7e
    and  A, A                                          ;; 01:4f6e $a7
    jr   Z, .jr_01_4fbe                                ;; 01:4f6f $28 $4d
    call call_00_3c70                                  ;; 01:4f71 $cd $70 $3c
    ld   A, [HL]                                       ;; 01:4f74 $7e
    ld   HL, .jr_01_4fbe                               ;; 01:4f75 $21 $be $4f
    push HL                                            ;; 01:4f78 $e5
    call doJumptable                                   ;; 01:4f79 $cd $3a $37
;@jumptable amount=33
    dw   call_01_5060                                  ;; 01:4f7c ?? $00
    dw   call_01_5060                                  ;; 01:4f7e ?? $01
    dw   call_01_5060                                  ;; 01:4f80 ?? $02
    dw   call_01_5060                                  ;; 01:4f82 ?? $03
    dw   call_01_4fc8                                  ;; 01:4f84 ?? $04
    dw   call_01_4fc8                                  ;; 01:4f86 ?? $05
    dw   call_01_4fc8                                  ;; 01:4f88 ?? $06
    dw   call_01_4fc8                                  ;; 01:4f8a ?? $07
    dw   call_01_4fc8                                  ;; 01:4f8c ?? $08
    dw   call_01_4fc8                                  ;; 01:4f8e ?? $09
    dw   call_01_4fc8                                  ;; 01:4f90 ?? $0a
    dw   call_01_51fe                                  ;; 01:4f92 ?? $0b
    dw   call_01_5007                                  ;; 01:4f94 ?? $0c
    dw   call_01_4fc8                                  ;; 01:4f96 ?? $0d
    dw   call_01_4fc8                                  ;; 01:4f98 ?? $0e
    dw   call_01_4fdc                                  ;; 01:4f9a ?? $0f
    dw   call_01_4fc8                                  ;; 01:4f9c ?? $10
    dw   call_01_4fc8                                  ;; 01:4f9e ?? $11
    dw   call_01_4fc8                                  ;; 01:4fa0 ?? $12
    dw   call_01_4fc8                                  ;; 01:4fa2 pP $13
    dw   call_01_4fc8                                  ;; 01:4fa4 ?? $14
    dw   call_01_4fc8                                  ;; 01:4fa6 ?? $15
    dw   call_01_4fc8                                  ;; 01:4fa8 ?? $16
    dw   call_01_4fc8                                  ;; 01:4faa ?? $17
    dw   call_01_4fc8                                  ;; 01:4fac pP $18
    dw   call_01_5049                                  ;; 01:4fae ?? $19
    dw   call_01_4fc8                                  ;; 01:4fb0 ?? $1a
    dw   call_01_5060                                  ;; 01:4fb2 ?? $1b
    dw   call_01_5060                                  ;; 01:4fb4 ?? $1c
    dw   call_01_5060                                  ;; 01:4fb6 ?? $1d
    dw   call_01_5060                                  ;; 01:4fb8 ?? $1e
    dw   call_01_5030                                  ;; 01:4fba pP $1f
    dw   call_01_4fc9                                  ;; 01:4fbc ?? $20
.jr_01_4fbe:
    ldh  A, [hFF96]                                    ;; 01:4fbe $f0 $96
    add  A, $01                                        ;; 01:4fc0 $c6 $01
    ldh  [hFF96], A                                    ;; 01:4fc2 $e0 $96
    cp   A, $10                                        ;; 01:4fc4 $fe $10
    jr   NZ, .jr_01_4f6a                               ;; 01:4fc6 $20 $a2

call_01_4fc8:
    ret                                                ;; 01:4fc8 $c9

call_01_4fc9:
    call call_00_3c0b                                  ;; 01:4fc9 $cd $0b $3c
    ld   D, H                                          ;; 01:4fcc $54
    ld   E, L                                          ;; 01:4fcd $5d
    ld   HL, wCA04                                     ;; 01:4fce $21 $04 $ca
    ld   A, [DE]                                       ;; 01:4fd1 $1a
    add  A, $02                                        ;; 01:4fd2 $c6 $02
    ld   [DE], A                                       ;; 01:4fd4 $12
    inc  DE                                            ;; 01:4fd5 $13
    ld   A, [DE]                                       ;; 01:4fd6 $1a
    adc  A, $00                                        ;; 01:4fd7 $ce $00
    and  A, [HL]                                       ;; 01:4fd9 $a6
    ld   [DE], A                                       ;; 01:4fda $12
    ret                                                ;; 01:4fdb $c9

call_01_4fdc:
    call call_00_3c48                                  ;; 01:4fdc $cd $48 $3c
    ld   A, [HL]                                       ;; 01:4fdf $7e
    srl  A                                             ;; 01:4fe0 $cb $3f
    srl  A                                             ;; 01:4fe2 $cb $3f
    and  A, $0f                                        ;; 01:4fe4 $e6 $0f
    ld   B, A                                          ;; 01:4fe6 $47
    call call_00_3c1d                                  ;; 01:4fe7 $cd $1d $3c
    ld   [HL], B                                       ;; 01:4fea $70
    call call_00_3c2e                                  ;; 01:4feb $cd $2e $3c
    ld   A, B                                          ;; 01:4fee $78
    and  A, $0c                                        ;; 01:4fef $e6 $0c
    or   A, $50                                        ;; 01:4ff1 $f6 $50
    ld   [HL], A                                       ;; 01:4ff3 $77
    xor  A, A                                          ;; 01:4ff4 $af
    call call_01_5272                                  ;; 01:4ff5 $cd $72 $52
    call call_00_3c48                                  ;; 01:4ff8 $cd $48 $3c
    ld   A, [HL]                                       ;; 01:4ffb $7e
    inc  A                                             ;; 01:4ffc $3c
    ld   [HL], A                                       ;; 01:4ffd $77
    cp   A, $18                                        ;; 01:4ffe $fe $18
    ret  NZ                                            ;; 01:5000 $c0
    call call_00_3c03                                  ;; 01:5001 $cd $03 $3c
    ld   [HL], $00                                     ;; 01:5004 $36 $00
    ret                                                ;; 01:5006 $c9

call_01_5007:
    ld_long_load A, hFF93                              ;; 01:5007 $fa $93 $ff
    and  A, $01                                        ;; 01:500a $e6 $01
    ret  Z                                             ;; 01:500c $c8
    call call_00_3c48                                  ;; 01:500d $cd $48 $3c
    ld   A, [HL]                                       ;; 01:5010 $7e
    add  A, $01                                        ;; 01:5011 $c6 $01
    ld   [HL], A                                       ;; 01:5013 $77
    and  A, $10                                        ;; 01:5014 $e6 $10
    jr   NZ, .jr_01_5024                               ;; 01:5016 $20 $0c
    call call_00_3c14                                  ;; 01:5018 $cd $14 $3c
    ld   A, [HL]                                       ;; 01:501b $7e
    add  A, $01                                        ;; 01:501c $c6 $01
    ld   [HL+], A                                      ;; 01:501e $22
    ld   A, [HL]                                       ;; 01:501f $7e
    adc  A, $00                                        ;; 01:5020 $ce $00
    ld   [HL], A                                       ;; 01:5022 $77
    ret                                                ;; 01:5023 $c9
.jr_01_5024:
    call call_00_3c14                                  ;; 01:5024 $cd $14 $3c
    ld   A, [HL]                                       ;; 01:5027 $7e
    sub  A, $01                                        ;; 01:5028 $d6 $01
    ld   [HL+], A                                      ;; 01:502a $22
    ld   A, [HL]                                       ;; 01:502b $7e
    sbc  A, $00                                        ;; 01:502c $de $00
    ld   [HL], A                                       ;; 01:502e $77
    ret                                                ;; 01:502f $c9

call_01_5030:
    call call_00_3c3f                                  ;; 01:5030 $cd $3f $3c
    call call_01_5039                                  ;; 01:5033 $cd $39 $50
    call call_00_3c14                                  ;; 01:5036 $cd $14 $3c

call_01_5039:
    ld   D, H                                          ;; 01:5039 $54
    ld   E, L                                          ;; 01:503a $5d
    ld   HL, wCA05                                     ;; 01:503b $21 $05 $ca
    ld   A, [DE]                                       ;; 01:503e $1a
    add  A, $02                                        ;; 01:503f $c6 $02
    ld   [DE], A                                       ;; 01:5041 $12
    inc  DE                                            ;; 01:5042 $13
    ld   A, [DE]                                       ;; 01:5043 $1a
    adc  A, $00                                        ;; 01:5044 $ce $00
    and  A, [HL]                                       ;; 01:5046 $a6
    ld   [DE], A                                       ;; 01:5047 $12
    ret                                                ;; 01:5048 $c9

call_01_5049:
    ld_long_load A, hFF93                              ;; 01:5049 $fa $93 $ff
    and  A, $01                                        ;; 01:504c $e6 $01
    ret  NZ                                            ;; 01:504e $c0
    call call_00_3c36                                  ;; 01:504f $cd $36 $3c
    call call_01_5058                                  ;; 01:5052 $cd $58 $50
    call call_00_3c0b                                  ;; 01:5055 $cd $0b $3c

call_01_5058:
    ld   D, H                                          ;; 01:5058 $54
    ld   E, L                                          ;; 01:5059 $5d
    ld   HL, wCA04                                     ;; 01:505a $21 $04 $ca
    jp   jp_00_18de                                    ;; 01:505d $c3 $de $18

call_01_5060:
    call call_01_50ac                                  ;; 01:5060 $cd $ac $50
    jr   NZ, .jr_01_50ab                               ;; 01:5063 $20 $46
    call call_01_4dae                                  ;; 01:5065 $cd $ae $4d
    jr   Z, .jr_01_50ab                                ;; 01:5068 $28 $41
    ld   A, [wCA0E]                                    ;; 01:506a $fa $0e $ca
    and  A, A                                          ;; 01:506d $a7
    ret  NZ                                            ;; 01:506e $c0
    ld   A, [wC6E8]                                    ;; 01:506f $fa $e8 $c6
    cp   A, $50                                        ;; 01:5072 $fe $50
    jr   NZ, .jr_01_508f                               ;; 01:5074 $20 $19
    call call_00_3c78                                  ;; 01:5076 $cd $78 $3c
    ld   B, [HL]                                       ;; 01:5079 $46
    call call_00_3c2e                                  ;; 01:507a $cd $2e $3c
    ld   [HL], B                                       ;; 01:507d $70
    call call_00_3c80                                  ;; 01:507e $cd $80 $3c
    ld   B, [HL]                                       ;; 01:5081 $46
    call call_00_3c70                                  ;; 01:5082 $cd $70 $3c
    ld   [HL], B                                       ;; 01:5085 $70
    call call_00_3c48                                  ;; 01:5086 $cd $48 $3c
    ld   A, [HL]                                       ;; 01:5089 $7e
    and  A, $c0                                        ;; 01:508a $e6 $c0
    call call_01_5272                                  ;; 01:508c $cd $72 $52
.jr_01_508f:
    call call_00_39d5                                  ;; 01:508f $cd $d5 $39
    ldh  A, [hFF90]                                    ;; 01:5092 $f0 $90
    and  A, $fc                                        ;; 01:5094 $e6 $fc
    jr   NZ, .jr_01_50ab                               ;; 01:5096 $20 $13
    ldh  A, [hFF90]                                    ;; 01:5098 $f0 $90
    and  A, $03                                        ;; 01:509a $e6 $03
    ld   DE, .jr_01_50ab                               ;; 01:509c $11 $ab $50
    push DE                                            ;; 01:509f $d5
    call doJumptable                                   ;; 01:50a0 $cd $3a $37
;@jumptable amount=4
    dw   call_01_50dc                                  ;; 01:50a3 ?? $00
    dw   call_01_5121                                  ;; 01:50a5 ?? $01
    dw   call_01_51ac                                  ;; 01:50a7 ?? $02
    dw   call_01_5166                                  ;; 01:50a9 ?? $03
.jr_01_50ab:
    ret                                                ;; 01:50ab $c9

call_01_50ac:
    call call_00_3c48                                  ;; 01:50ac $cd $48 $3c
    ld   A, [HL]                                       ;; 01:50af $7e
    and  A, $0f                                        ;; 01:50b0 $e6 $0f
    and  A, A                                          ;; 01:50b2 $a7
    ret  Z                                             ;; 01:50b3 $c8
    ld   DE, .data_01_50cc                             ;; 01:50b4 $11 $cc $50
    push DE                                            ;; 01:50b7 $d5
    ld   A, [HL]                                       ;; 01:50b8 $7e
    swap A                                             ;; 01:50b9 $cb $37
    sra  A                                             ;; 01:50bb $cb $2f
    sra  A                                             ;; 01:50bd $cb $2f
    and  A, $03                                        ;; 01:50bf $e6 $03
    call doJumptable                                   ;; 01:50c1 $cd $3a $37
;@jumptable amount=4
    dw   call_01_5144                                  ;; 01:50c4 ?? $00
    dw   call_01_518a                                  ;; 01:50c6 ?? $01
    dw   call_01_5100                                  ;; 01:50c8 ?? $02
    dw   call_01_51d0                                  ;; 01:50ca ?? $03
;@code
.data_01_50cc:
    ld   A, $ff                                        ;; 01:50cc $3e $ff
    bit  0, A                                          ;; 01:50ce $cb $47
    ret                                                ;; 01:50d0 $c9

call_01_50d1:
    call call_00_3c48                                  ;; 01:50d1 $cd $48 $3c
    ld   A, $80                                        ;; 01:50d4 $3e $80
    ld   [HL], A                                       ;; 01:50d6 $77
    call call_01_5272                                  ;; 01:50d7 $cd $72 $52
    jr   jr_01_50ec                                    ;; 01:50da $18 $10

call_01_50dc:
    call call_01_51f8                                  ;; 01:50dc $cd $f8 $51

jp_01_50df:
    call call_00_3c48                                  ;; 01:50df $cd $48 $3c
    ld   A, $80                                        ;; 01:50e2 $3e $80
    ld   [HL], A                                       ;; 01:50e4 $77
    call call_01_5272                                  ;; 01:50e5 $cd $72 $52
    call call_01_529a                                  ;; 01:50e8 $cd $9a $52
    ret  NZ                                            ;; 01:50eb $c0

jr_01_50ec:
    call call_01_51f0                                  ;; 01:50ec $cd $f0 $51
    call call_00_3c36                                  ;; 01:50ef $cd $36 $3c
    ld   A, [HL]                                       ;; 01:50f2 $7e
    add  A, $10                                        ;; 01:50f3 $c6 $10
    ld   [HL+], A                                      ;; 01:50f5 $22
    ld   E, L                                          ;; 01:50f6 $5d
    ld   D, H                                          ;; 01:50f7 $54
    ld   HL, wCA04                                     ;; 01:50f8 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:50fb $1a
    adc  A, $00                                        ;; 01:50fc $ce $00
    and  A, [HL]                                       ;; 01:50fe $a6
    ld   [DE], A                                       ;; 01:50ff $12

call_01_5100:
    call call_00_3c0b                                  ;; 01:5100 $cd $0b $3c
    push HL                                            ;; 01:5103 $e5
    call call_00_3c68                                  ;; 01:5104 $cd $68 $3c
    pop  DE                                            ;; 01:5107 $d1
    ld   A, [DE]                                       ;; 01:5108 $1a
    add  A, [HL]                                       ;; 01:5109 $86
    ld   [DE], A                                       ;; 01:510a $12
    inc  DE                                            ;; 01:510b $13
    ld   HL, wCA04                                     ;; 01:510c $21 $04 $ca
    ld   A, [DE]                                       ;; 01:510f $1a
    adc  A, $00                                        ;; 01:5110 $ce $00
    and  A, [HL]                                       ;; 01:5112 $a6
    ld   [DE], A                                       ;; 01:5113 $12
    jp   jp_01_51e4                                    ;; 01:5114 $c3 $e4 $51

call_01_5117:
    call call_00_3c48                                  ;; 01:5117 $cd $48 $3c
    xor  A, A                                          ;; 01:511a $af
    ld   [HL], A                                       ;; 01:511b $77
    call call_01_5272                                  ;; 01:511c $cd $72 $52
    jr   jr_01_5130                                    ;; 01:511f $18 $0f

call_01_5121:
    call call_01_51f8                                  ;; 01:5121 $cd $f8 $51

jp_01_5124:
    call call_00_3c48                                  ;; 01:5124 $cd $48 $3c
    xor  A, A                                          ;; 01:5127 $af
    ld   [HL], A                                       ;; 01:5128 $77
    call call_01_5272                                  ;; 01:5129 $cd $72 $52
    call call_01_529a                                  ;; 01:512c $cd $9a $52
    ret  NZ                                            ;; 01:512f $c0

jr_01_5130:
    call call_01_51f0                                  ;; 01:5130 $cd $f0 $51
    call call_00_3c36                                  ;; 01:5133 $cd $36 $3c
    ld   A, [HL]                                       ;; 01:5136 $7e
    sub  A, $10                                        ;; 01:5137 $d6 $10
    ld   [HL+], A                                      ;; 01:5139 $22
    ld   E, L                                          ;; 01:513a $5d
    ld   D, H                                          ;; 01:513b $54
    ld   HL, wCA04                                     ;; 01:513c $21 $04 $ca
    ld   A, [DE]                                       ;; 01:513f $1a
    sbc  A, $00                                        ;; 01:5140 $de $00
    and  A, [HL]                                       ;; 01:5142 $a6
    ld   [DE], A                                       ;; 01:5143 $12

call_01_5144:
    call call_00_3c0b                                  ;; 01:5144 $cd $0b $3c
    push HL                                            ;; 01:5147 $e5
    call call_00_3c68                                  ;; 01:5148 $cd $68 $3c
    pop  DE                                            ;; 01:514b $d1
    ld   A, [DE]                                       ;; 01:514c $1a
    sub  A, [HL]                                       ;; 01:514d $96
    ld   [DE], A                                       ;; 01:514e $12
    inc  DE                                            ;; 01:514f $13
    ld   HL, wCA04                                     ;; 01:5150 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:5153 $1a
    sbc  A, $00                                        ;; 01:5154 $de $00
    and  A, [HL]                                       ;; 01:5156 $a6
    ld   [DE], A                                       ;; 01:5157 $12
    jp   jp_01_51e4                                    ;; 01:5158 $c3 $e4 $51

call_01_515b:
    call call_00_3c48                                  ;; 01:515b $cd $48 $3c
    ld   A, $40                                        ;; 01:515e $3e $40
    ld   [HL], A                                       ;; 01:5160 $77
    call call_01_5272                                  ;; 01:5161 $cd $72 $52
    jr   jr_01_5176                                    ;; 01:5164 $18 $10

call_01_5166:
    call call_01_51f8                                  ;; 01:5166 $cd $f8 $51

jp_01_5169:
    call call_00_3c48                                  ;; 01:5169 $cd $48 $3c
    ld   A, $40                                        ;; 01:516c $3e $40
    ld   [HL], A                                       ;; 01:516e $77
    call call_01_5272                                  ;; 01:516f $cd $72 $52
    call call_01_529a                                  ;; 01:5172 $cd $9a $52
    ret  NZ                                            ;; 01:5175 $c0

jr_01_5176:
    call call_01_51f0                                  ;; 01:5176 $cd $f0 $51
    call call_00_3c3f                                  ;; 01:5179 $cd $3f $3c
    ld   A, [HL]                                       ;; 01:517c $7e
    add  A, $10                                        ;; 01:517d $c6 $10
    ld   [HL+], A                                      ;; 01:517f $22
    ld   E, L                                          ;; 01:5180 $5d
    ld   D, H                                          ;; 01:5181 $54
    ld   HL, wCA05                                     ;; 01:5182 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:5185 $1a
    adc  A, $00                                        ;; 01:5186 $ce $00
    and  A, [HL]                                       ;; 01:5188 $a6
    ld   [DE], A                                       ;; 01:5189 $12

call_01_518a:
    call call_00_3c14                                  ;; 01:518a $cd $14 $3c
    push HL                                            ;; 01:518d $e5
    call call_00_3c68                                  ;; 01:518e $cd $68 $3c
    pop  DE                                            ;; 01:5191 $d1
    ld   A, [DE]                                       ;; 01:5192 $1a
    add  A, [HL]                                       ;; 01:5193 $86
    ld   [DE], A                                       ;; 01:5194 $12
    inc  DE                                            ;; 01:5195 $13
    ld   HL, wCA05                                     ;; 01:5196 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:5199 $1a
    adc  A, $00                                        ;; 01:519a $ce $00
    and  A, [HL]                                       ;; 01:519c $a6
    ld   [DE], A                                       ;; 01:519d $12
    jp   jp_01_51e4                                    ;; 01:519e $c3 $e4 $51

call_01_51a1:
    call call_00_3c48                                  ;; 01:51a1 $cd $48 $3c
    ld   A, $c0                                        ;; 01:51a4 $3e $c0
    ld   [HL], A                                       ;; 01:51a6 $77
    call call_01_5272                                  ;; 01:51a7 $cd $72 $52
    jr   jr_01_51bc                                    ;; 01:51aa $18 $10

call_01_51ac:
    call call_01_51f8                                  ;; 01:51ac $cd $f8 $51

jp_01_51af:
    call call_00_3c48                                  ;; 01:51af $cd $48 $3c
    ld   A, $c0                                        ;; 01:51b2 $3e $c0
    ld   [HL], A                                       ;; 01:51b4 $77
    call call_01_5272                                  ;; 01:51b5 $cd $72 $52
    call call_01_529a                                  ;; 01:51b8 $cd $9a $52
    ret  NZ                                            ;; 01:51bb $c0

jr_01_51bc:
    call call_01_51f0                                  ;; 01:51bc $cd $f0 $51
    call call_00_3c3f                                  ;; 01:51bf $cd $3f $3c
    ld   A, [HL]                                       ;; 01:51c2 $7e
    sub  A, $10                                        ;; 01:51c3 $d6 $10
    ld   [HL+], A                                      ;; 01:51c5 $22
    ld   E, L                                          ;; 01:51c6 $5d
    ld   D, H                                          ;; 01:51c7 $54
    ld   HL, wCA05                                     ;; 01:51c8 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:51cb $1a
    sbc  A, $00                                        ;; 01:51cc $de $00
    and  A, [HL]                                       ;; 01:51ce $a6
    ld   [DE], A                                       ;; 01:51cf $12

call_01_51d0:
    call call_00_3c14                                  ;; 01:51d0 $cd $14 $3c
    push HL                                            ;; 01:51d3 $e5
    call call_00_3c68                                  ;; 01:51d4 $cd $68 $3c
    pop  DE                                            ;; 01:51d7 $d1
    ld   A, [DE]                                       ;; 01:51d8 $1a
    sub  A, [HL]                                       ;; 01:51d9 $96
    ld   [DE], A                                       ;; 01:51da $12
    inc  DE                                            ;; 01:51db $13
    ld   HL, wCA05                                     ;; 01:51dc $21 $05 $ca
    ld   A, [DE]                                       ;; 01:51df $1a
    sbc  A, $00                                        ;; 01:51e0 $de $00
    and  A, [HL]                                       ;; 01:51e2 $a6
    ld   [DE], A                                       ;; 01:51e3 $12

jp_01_51e4:
    call call_00_3c48                                  ;; 01:51e4 $cd $48 $3c
    push HL                                            ;; 01:51e7 $e5
    call call_00_3c68                                  ;; 01:51e8 $cd $68 $3c
    pop  DE                                            ;; 01:51eb $d1
    ld   A, [DE]                                       ;; 01:51ec $1a
    sub  A, [HL]                                       ;; 01:51ed $96
    ld   [DE], A                                       ;; 01:51ee $12
    ret                                                ;; 01:51ef $c9

call_01_51f0:
    call call_00_3c48                                  ;; 01:51f0 $cd $48 $3c
    ld   A, [HL]                                       ;; 01:51f3 $7e
    or   A, $10                                        ;; 01:51f4 $f6 $10
    ld   [HL], A                                       ;; 01:51f6 $77
    ret                                                ;; 01:51f7 $c9

call_01_51f8:
    call call_00_3c68                                  ;; 01:51f8 $cd $68 $3c
    ld   [HL], $01                                     ;; 01:51fb $36 $01
    ret                                                ;; 01:51fd $c9

call_01_51fe:
    call call_01_50ac                                  ;; 01:51fe $cd $ac $50
    jr   NZ, .jr_01_525a                               ;; 01:5201 $20 $57
    call call_01_4dae                                  ;; 01:5203 $cd $ae $4d
    jr   Z, .jr_01_525a                                ;; 01:5206 $28 $52
    call call_00_3c50                                  ;; 01:5208 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:520b $7e
    and  A, $08                                        ;; 01:520c $e6 $08
    jr   Z, .jr_01_5215                                ;; 01:520e $28 $05
    ld   A, [wC2E0]                                    ;; 01:5210 $fa $e0 $c2
    cp   A, [HL]                                       ;; 01:5213 $be
    ret  NZ                                            ;; 01:5214 $c0
.jr_01_5215:
    call call_01_525b                                  ;; 01:5215 $cd $5b $52
    call call_00_3c36                                  ;; 01:5218 $cd $36 $3c
    ld   D, H                                          ;; 01:521b $54
    ld   E, L                                          ;; 01:521c $5d
    ld   A, [DE]                                       ;; 01:521d $1a
    ld   HL, wC290                                     ;; 01:521e $21 $90 $c2
    cp   A, [HL]                                       ;; 01:5221 $be
    jr   NZ, .jr_01_525a                               ;; 01:5222 $20 $36
    inc  DE                                            ;; 01:5224 $13
    ld   A, [DE]                                       ;; 01:5225 $1a
    ld   HL, wC291                                     ;; 01:5226 $21 $91 $c2
    cp   A, [HL]                                       ;; 01:5229 $be
    jr   NZ, .jr_01_525a                               ;; 01:522a $20 $2e
    call call_00_3c3f                                  ;; 01:522c $cd $3f $3c
    ld   D, H                                          ;; 01:522f $54
    ld   E, L                                          ;; 01:5230 $5d
    ld   A, [DE]                                       ;; 01:5231 $1a
    ld   HL, wC2B0                                     ;; 01:5232 $21 $b0 $c2
    cp   A, [HL]                                       ;; 01:5235 $be
    jr   NZ, .jr_01_525a                               ;; 01:5236 $20 $22
    inc  DE                                            ;; 01:5238 $13
    ld   A, [DE]                                       ;; 01:5239 $1a
    ld   HL, wC2B1                                     ;; 01:523a $21 $b1 $c2
    cp   A, [HL]                                       ;; 01:523d $be
    jr   NZ, .jr_01_525a                               ;; 01:523e $20 $1a
    ld   A, [wC6EE]                                    ;; 01:5240 $fa $ee $c6
    swap A                                             ;; 01:5243 $cb $37
    srl  A                                             ;; 01:5245 $cb $3f
    srl  A                                             ;; 01:5247 $cb $3f
    and  A, $03                                        ;; 01:5249 $e6 $03
    ld   DE, .jr_01_525a                               ;; 01:524b $11 $5a $52
    push DE                                            ;; 01:524e $d5
    call doJumptable                                   ;; 01:524f $cd $3a $37
;@jumptable amount=4
    dw   call_01_5121                                  ;; 01:5252 ?? $00
    dw   call_01_5166                                  ;; 01:5254 ?? $01
    dw   call_01_50dc                                  ;; 01:5256 ?? $02
    dw   call_01_51ac                                  ;; 01:5258 ?? $03
.jr_01_525a:
    ret                                                ;; 01:525a $c9

call_01_525b:
    call call_00_3c58                                  ;; 01:525b $cd $58 $3c
    ld   A, [HL]                                       ;; 01:525e $7e
    cp   A, $eb                                        ;; 01:525f $fe $eb
    ret  NZ                                            ;; 01:5261 $c0
    ld   A, $01                                        ;; 01:5262 $3e $01
    ld   [wCA52], A                                    ;; 01:5264 $ea $52 $ca
    ldh  A, [hFF96]                                    ;; 01:5267 $f0 $96
    ld   [wCA6D], A                                    ;; 01:5269 $ea $6d $ca
    call call_00_3c58                                  ;; 01:526c $cd $58 $3c
    ld   [HL], $00                                     ;; 01:526f $36 $00
    ret                                                ;; 01:5271 $c9

call_01_5272:
    swap A                                             ;; 01:5272 $cb $37
    srl  A                                             ;; 01:5274 $cb $3f
    srl  A                                             ;; 01:5276 $cb $3f
    and  A, $03                                        ;; 01:5278 $e6 $03
    ld   HL, data_01_5292                              ;; 01:527a $21 $92 $52
    call call_00_3741                                  ;; 01:527d $cd $41 $37
    push HL                                            ;; 01:5280 $e5
    call call_00_3c70                                  ;; 01:5281 $cd $70 $3c
    ld   A, [HL]                                       ;; 01:5284 $7e
    pop  HL                                            ;; 01:5285 $e1
    call call_00_3741                                  ;; 01:5286 $cd $41 $37
    ld   D, H                                          ;; 01:5289 $54
    ld   E, L                                          ;; 01:528a $5d
    call call_00_3c25                                  ;; 01:528b $cd $25 $3c
    ld   A, E                                          ;; 01:528e $7b
    ld   [HL+], A                                      ;; 01:528f $22
    ld   [HL], D                                       ;; 01:5290 $72
    ret                                                ;; 01:5291 $c9

data_01_5292:
    dw   $6afe                                         ;; 01:5292 wW
    dw   $6b7e                                         ;; 01:5294 wW
    dw   $6abe                                         ;; 01:5296 wW
    dw   $6b3e                                         ;; 01:5298 wW

call_01_529a:
    call call_01_5312                                  ;; 01:529a $cd $12 $53
    call call_00_0ffd                                  ;; 01:529d $cd $fd $0f
    ret  NZ                                            ;; 01:52a0 $c0
    call call_01_52ae                                  ;; 01:52a1 $cd $ae $52
    ret  NZ                                            ;; 01:52a4 $c0
    call call_01_463d                                  ;; 01:52a5 $cd $3d $46
    call call_01_4e48                                  ;; 01:52a8 $cd $48 $4e
    xor  A, A                                          ;; 01:52ab $af
    and  A, A                                          ;; 01:52ac $a7
    ret                                                ;; 01:52ad $c9

call_01_52ae:
    ldh  A, [hFF96]                                    ;; 01:52ae $f0 $96
    ldh  [hFF97], A                                    ;; 01:52b0 $e0 $97
    ld   A, $00                                        ;; 01:52b2 $3e $00
    ldh  [hFF96], A                                    ;; 01:52b4 $e0 $96
.jr_01_52b6:
    call call_00_3c03                                  ;; 01:52b6 $cd $03 $3c
    ld   A, [HL]                                       ;; 01:52b9 $7e
    and  A, A                                          ;; 01:52ba $a7
    jr   Z, .jr_01_5301                                ;; 01:52bb $28 $44
    ld   HL, hFF97                                     ;; 01:52bd $21 $97 $ff
    ldh  A, [hFF96]                                    ;; 01:52c0 $f0 $96
    cp   A, [HL]                                       ;; 01:52c2 $be
    jr   Z, .jr_01_5301                                ;; 01:52c3 $28 $3c
    call call_00_3c36                                  ;; 01:52c5 $cd $36 $3c
    ld   E, L                                          ;; 01:52c8 $5d
    ld   D, H                                          ;; 01:52c9 $54
    ld   HL, wC800                                     ;; 01:52ca $21 $00 $c8
    ld   A, [DE]                                       ;; 01:52cd $1a
    cp   A, [HL]                                       ;; 01:52ce $be
    jr   NZ, .jr_01_5301                               ;; 01:52cf $20 $30
    inc  HL                                            ;; 01:52d1 $23
    inc  DE                                            ;; 01:52d2 $13
    ld   A, [DE]                                       ;; 01:52d3 $1a
    cp   A, [HL]                                       ;; 01:52d4 $be
    jr   NZ, .jr_01_5301                               ;; 01:52d5 $20 $2a
    call call_00_3c3f                                  ;; 01:52d7 $cd $3f $3c
    ld   E, L                                          ;; 01:52da $5d
    ld   D, H                                          ;; 01:52db $54
    ld   HL, wC802                                     ;; 01:52dc $21 $02 $c8
    ld   A, [DE]                                       ;; 01:52df $1a
    cp   A, [HL]                                       ;; 01:52e0 $be
    jr   NZ, .jr_01_5301                               ;; 01:52e1 $20 $1e
    inc  HL                                            ;; 01:52e3 $23
    inc  DE                                            ;; 01:52e4 $13
    ld   A, [DE]                                       ;; 01:52e5 $1a
    cp   A, [HL]                                       ;; 01:52e6 $be
    jr   NZ, .jr_01_5301                               ;; 01:52e7 $20 $18
    call call_00_3c50                                  ;; 01:52e9 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:52ec $7e
    and  A, $08                                        ;; 01:52ed $e6 $08
    jr   Z, .jr_01_52fa                                ;; 01:52ef $28 $09
    ld   E, L                                          ;; 01:52f1 $5d
    ld   D, H                                          ;; 01:52f2 $54
    ld   HL, wC804                                     ;; 01:52f3 $21 $04 $c8
    ld   A, [DE]                                       ;; 01:52f6 $1a
    cp   A, [HL]                                       ;; 01:52f7 $be
    jr   NZ, .jr_01_5301                               ;; 01:52f8 $20 $07
.jr_01_52fa:
    ld   A, $ff                                        ;; 01:52fa $3e $ff
    bit  0, A                                          ;; 01:52fc $cb $47
    jp   .jp_01_530d                                   ;; 01:52fe $c3 $0d $53
.jr_01_5301:
    ldh  A, [hFF96]                                    ;; 01:5301 $f0 $96
    add  A, $01                                        ;; 01:5303 $c6 $01
    ldh  [hFF96], A                                    ;; 01:5305 $e0 $96
    cp   A, $10                                        ;; 01:5307 $fe $10
    jr   NZ, .jr_01_52b6                               ;; 01:5309 $20 $ab
    xor  A, A                                          ;; 01:530b $af
    and  A, A                                          ;; 01:530c $a7
.jp_01_530d:
    ldh  A, [hFF97]                                    ;; 01:530d $f0 $97
    ldh  [hFF96], A                                    ;; 01:530f $e0 $96
    ret                                                ;; 01:5311 $c9

call_01_5312:
    call call_00_3c50                                  ;; 01:5312 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:5315 $7e
    ld   [wC804], A                                    ;; 01:5316 $ea $04 $c8
    call call_00_3c48                                  ;; 01:5319 $cd $48 $3c
    ld   A, [HL]                                       ;; 01:531c $7e
    and  A, $c0                                        ;; 01:531d $e6 $c0
    and  A, A                                          ;; 01:531f $a7
    jp   Z, .jp_01_534c                                ;; 01:5320 $ca $4c $53
    cp   A, $40                                        ;; 01:5323 $fe $40
    jp   Z, .jp_01_538a                                ;; 01:5325 $ca $8a $53
    cp   A, $80                                        ;; 01:5328 $fe $80
    jp   Z, .jp_01_536b                                ;; 01:532a $ca $6b $53
    call call_00_3c36                                  ;; 01:532d $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:5330 $2a
    ld   [wC800], A                                    ;; 01:5331 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:5334 $7e
    ld   [wC801], A                                    ;; 01:5335 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:5338 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:533b $2a
    sub  A, $10                                        ;; 01:533c $d6 $10
    ld   [wC802], A                                    ;; 01:533e $ea $02 $c8
    ld   A, [HL]                                       ;; 01:5341 $7e
    sbc  A, $00                                        ;; 01:5342 $de $00
    ld   HL, wCA05                                     ;; 01:5344 $21 $05 $ca
    and  A, [HL]                                       ;; 01:5347 $a6
    ld   [wC803], A                                    ;; 01:5348 $ea $03 $c8
    ret                                                ;; 01:534b $c9
.jp_01_534c:
    call call_00_3c36                                  ;; 01:534c $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:534f $2a
    sub  A, $10                                        ;; 01:5350 $d6 $10
    ld   [wC800], A                                    ;; 01:5352 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:5355 $7e
    sbc  A, $00                                        ;; 01:5356 $de $00
    ld   HL, wCA04                                     ;; 01:5358 $21 $04 $ca
    and  A, [HL]                                       ;; 01:535b $a6
    ld   [wC801], A                                    ;; 01:535c $ea $01 $c8
    call call_00_3c3f                                  ;; 01:535f $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:5362 $2a
    ld   [wC802], A                                    ;; 01:5363 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:5366 $7e
    ld   [wC803], A                                    ;; 01:5367 $ea $03 $c8
    ret                                                ;; 01:536a $c9
.jp_01_536b:
    call call_00_3c36                                  ;; 01:536b $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:536e $2a
    add  A, $10                                        ;; 01:536f $c6 $10
    ld   [wC800], A                                    ;; 01:5371 $ea $00 $c8
    ld   A, [HL]                                       ;; 01:5374 $7e
    adc  A, $00                                        ;; 01:5375 $ce $00
    ld   HL, wCA04                                     ;; 01:5377 $21 $04 $ca
    and  A, [HL]                                       ;; 01:537a $a6
    ld   [wC801], A                                    ;; 01:537b $ea $01 $c8
    call call_00_3c3f                                  ;; 01:537e $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:5381 $2a
    ld   [wC802], A                                    ;; 01:5382 $ea $02 $c8
    ld   A, [HL]                                       ;; 01:5385 $7e
    ld   [wC803], A                                    ;; 01:5386 $ea $03 $c8
    ret                                                ;; 01:5389 $c9
.jp_01_538a:
    call call_00_3c36                                  ;; 01:538a $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:538d $2a
    ld   [wC800], A                                    ;; 01:538e $ea $00 $c8
    ld   A, [HL]                                       ;; 01:5391 $7e
    ld   [wC801], A                                    ;; 01:5392 $ea $01 $c8
    call call_00_3c3f                                  ;; 01:5395 $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:5398 $2a
    add  A, $10                                        ;; 01:5399 $c6 $10
    ld   [wC802], A                                    ;; 01:539b $ea $02 $c8
    ld   A, [HL]                                       ;; 01:539e $7e
    adc  A, $00                                        ;; 01:539f $ce $00
    ld   HL, wCA05                                     ;; 01:53a1 $21 $05 $ca
    and  A, [HL]                                       ;; 01:53a4 $a6
    ld   [wC803], A                                    ;; 01:53a5 $ea $03 $c8
    ret                                                ;; 01:53a8 $c9

call_01_53a9:
    call call_00_01d7                                  ;; 01:53a9 $cd $d7 $01
    call call_00_3c1d                                  ;; 01:53ac $cd $1d $3c
    ldh  A, [hFF93]                                    ;; 01:53af $f0 $93
    swap A                                             ;; 01:53b1 $cb $37
    and  A, $01                                        ;; 01:53b3 $e6 $01
    ld   E, A                                          ;; 01:53b5 $5f
    ld   A, [HL]                                       ;; 01:53b6 $7e
    and  A, $fe                                        ;; 01:53b7 $e6 $fe
    or   A, E                                          ;; 01:53b9 $b3
    ld   [HL], A                                       ;; 01:53ba $77
    call call_00_3c50                                  ;; 01:53bb $cd $50 $3c
    ld   A, [HL]                                       ;; 01:53be $7e
    and  A, $cb                                        ;; 01:53bf $e6 $cb
    cp   A, $49                                        ;; 01:53c1 $fe $49
    jr   NZ, .jr_01_53d0                               ;; 01:53c3 $20 $0b
    call call_00_3c58                                  ;; 01:53c5 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:53c8 $7e
    and  A, $c0                                        ;; 01:53c9 $e6 $c0
    cp   A, $c0                                        ;; 01:53cb $fe $c0
    call NZ, call_01_53ec                              ;; 01:53cd $c4 $ec $53
.jr_01_53d0:
    call call_01_53f6                                  ;; 01:53d0 $cd $f6 $53
    ld   A, [wC6E3]                                    ;; 01:53d3 $fa $e3 $c6
    cp   A, $01                                        ;; 01:53d6 $fe $01
    jp   Z, call_00_3a7f                               ;; 01:53d8 $ca $7f $3a
    cp   A, $03                                        ;; 01:53db $fe $03
    jp   NC, call_00_3a7f                              ;; 01:53dd $d2 $7f $3a
    call call_00_3c90                                  ;; 01:53e0 $cd $90 $3c
    ld   A, [HL]                                       ;; 01:53e3 $7e
    and  A, $04                                        ;; 01:53e4 $e6 $04
    jp   NZ, call_00_3a7f                              ;; 01:53e6 $c2 $7f $3a
    jp   call_00_3b3f                                  ;; 01:53e9 $c3 $3f $3b

call_01_53ec:
    call call_00_3c1d                                  ;; 01:53ec $cd $1d $3c
    ld   A, [HL]                                       ;; 01:53ef $7e
    and  A, $01                                        ;; 01:53f0 $e6 $01
    or   A, $06                                        ;; 01:53f2 $f6 $06
    ld   [HL], A                                       ;; 01:53f4 $77
    ret                                                ;; 01:53f5 $c9

call_01_53f6:
    call call_00_3c58                                  ;; 01:53f6 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:53f9 $7e
    and  A, $f0                                        ;; 01:53fa $e6 $f0
    cp   A, $90                                        ;; 01:53fc $fe $90
    ret  NZ                                            ;; 01:53fe $c0

call_01_53ff:
    ldh  A, [hFF93]                                    ;; 01:53ff $f0 $93
    rlca                                               ;; 01:5401 $07
    swap A                                             ;; 01:5402 $cb $37
    and  A, $03                                        ;; 01:5404 $e6 $03
    ld   HL, data_01_5292                              ;; 01:5406 $21 $92 $52
    call call_00_3741                                  ;; 01:5409 $cd $41 $37
    push HL                                            ;; 01:540c $e5
    call call_00_3c70                                  ;; 01:540d $cd $70 $3c
    ld   A, [HL]                                       ;; 01:5410 $7e
    pop  HL                                            ;; 01:5411 $e1
    call call_00_3741                                  ;; 01:5412 $cd $41 $37
    ld   D, H                                          ;; 01:5415 $54
    ld   E, L                                          ;; 01:5416 $5d
    call call_00_3c25                                  ;; 01:5417 $cd $25 $3c
    ld   A, E                                          ;; 01:541a $7b
    ld   [HL+], A                                      ;; 01:541b $22
    ld   [HL], D                                       ;; 01:541c $72
    ret                                                ;; 01:541d $c9

call_01_541e:
    ld   A, $01                                        ;; 01:541e $3e $01
    ldh  [hFF96], A                                    ;; 01:5420 $e0 $96
    call call_00_3c1d                                  ;; 01:5422 $cd $1d $3c
    ld   A, [wCA13]                                    ;; 01:5425 $fa $13 $ca
    and  A, $1f                                        ;; 01:5428 $e6 $1f
    cp   A, $18                                        ;; 01:542a $fe $18
    jr   NC, .jr_01_5437                               ;; 01:542c $30 $09
    cp   A, $08                                        ;; 01:542e $fe $08
    jr   C, .jr_01_5437                                ;; 01:5430 $38 $05
    ld   A, $01                                        ;; 01:5432 $3e $01
    ld   [HL], A                                       ;; 01:5434 $77
    jr   .jr_01_5439                                   ;; 01:5435 $18 $02
.jr_01_5437:
    xor  A, A                                          ;; 01:5437 $af
    ld   [HL], A                                       ;; 01:5438 $77
.jr_01_5439:
    jp   call_00_3a7f                                  ;; 01:5439 $c3 $7f $3a

call_01_543c:
    ld   A, $02                                        ;; 01:543c $3e $02
    ldh  [hFF96], A                                    ;; 01:543e $e0 $96
.jr_01_5440:
    call call_00_3c03                                  ;; 01:5440 $cd $03 $3c
    ld   A, [HL]                                       ;; 01:5443 $7e
    and  A, A                                          ;; 01:5444 $a7
    jr   Z, .jr_01_5470                                ;; 01:5445 $28 $29
    call call_00_3c1d                                  ;; 01:5447 $cd $1d $3c
    ldh  A, [hFF93]                                    ;; 01:544a $f0 $93
    swap A                                             ;; 01:544c $cb $37
    rr   [HL]                                          ;; 01:544e $cb $1e
    rrca                                               ;; 01:5450 $0f
    rl   [HL]                                          ;; 01:5451 $cb $16
    call call_00_3c50                                  ;; 01:5453 $cd $50 $3c
    ld   A, [HL]                                       ;; 01:5456 $7e
    and  A, $0b                                        ;; 01:5457 $e6 $0b
    cp   A, $09                                        ;; 01:5459 $fe $09
    call Z, call_01_53ec                               ;; 01:545b $cc $ec $53
    call call_01_53f6                                  ;; 01:545e $cd $f6 $53
    call call_00_3c90                                  ;; 01:5461 $cd $90 $3c
    bit  2, [HL]                                       ;; 01:5464 $cb $56
    jr   NZ, .jr_01_546d                               ;; 01:5466 $20 $05
    call call_00_3b3f                                  ;; 01:5468 $cd $3f $3b
    jr   .jr_01_5470                                   ;; 01:546b $18 $03
.jr_01_546d:
    call call_00_3a7f                                  ;; 01:546d $cd $7f $3a
.jr_01_5470:
    ldh  A, [hFF96]                                    ;; 01:5470 $f0 $96
    inc  A                                             ;; 01:5472 $3c
    ldh  [hFF96], A                                    ;; 01:5473 $e0 $96
    cp   A, $10                                        ;; 01:5475 $fe $10
    jr   NZ, .jr_01_5440                               ;; 01:5477 $20 $c7
    ret                                                ;; 01:5479 $c9
    ld   A, [wC250]                                    ;; 01:547a $fa $50 $c2
    ld   [wC7CD], A                                    ;; 01:547d $ea $cd $c7
    ld   A, [wC2F0]                                    ;; 01:5480 $fa $f0 $c2
    ld   [wC7CE], A                                    ;; 01:5483 $ea $ce $c7
    ld   A, [wC2E0]                                    ;; 01:5486 $fa $e0 $c2
    ld   [wC7CF], A                                    ;; 01:5489 $ea $cf $c7
    ret                                                ;; 01:548c $c9

jp_01_548d:
    ld   A, [wC7CD]                                    ;; 01:548d $fa $cd $c7
    ld   [wC250], A                                    ;; 01:5490 $ea $50 $c2
    ld   A, [wC7CE]                                    ;; 01:5493 $fa $ce $c7
    ld   [wC2F0], A                                    ;; 01:5496 $ea $f0 $c2
    ld   A, [wC7CF]                                    ;; 01:5499 $fa $cf $c7
    ld   [wC2E0], A                                    ;; 01:549c $ea $e0 $c2
    ret                                                ;; 01:549f $c9

call_01_54a0:
    ld   A, [wCA6F]                                    ;; 01:54a0 $fa $6f $ca
    and  A, A                                          ;; 01:54a3 $a7
    ret  NZ                                            ;; 01:54a4 $c0
    ld   A, $01                                        ;; 01:54a5 $3e $01
    ld   [wCA6F], A                                    ;; 01:54a7 $ea $6f $ca
    ld   HL, .data_01_54fc                             ;; 01:54aa $21 $fc $54
    push HL                                            ;; 01:54ad $e5
    ld   A, [wCA18]                                    ;; 01:54ae $fa $18 $ca
    call doJumptable                                   ;; 01:54b1 $cd $3a $37
;@jumptable amount=36
    dw   call_01_5500                                  ;; 01:54b4 ?? $00
    dw   call_01_56e4                                  ;; 01:54b6 ?? $01
    dw   call_01_571e                                  ;; 01:54b8 ?? $02
    dw   call_01_5723                                  ;; 01:54ba ?? $03
    dw   call_01_56df                                  ;; 01:54bc pP $04
    dw   call_01_5719                                  ;; 01:54be ?? $05
    dw   call_01_5714                                  ;; 01:54c0 ?? $06
    dw   call_01_578c                                  ;; 01:54c2 ?? $07
    dw   call_01_59c2                                  ;; 01:54c4 ?? $08
    dw   call_01_56c8                                  ;; 01:54c6 ?? $09
    dw   call_01_56c5                                  ;; 01:54c8 ?? $0a
    dw   call_01_59fe                                  ;; 01:54ca ?? $0b
    dw   call_01_5500                                  ;; 01:54cc ?? $0c
    dw   call_01_57f2                                  ;; 01:54ce ?? $0d
    dw   call_01_56e9                                  ;; 01:54d0 ?? $0e
    dw   call_01_5601                                  ;; 01:54d2 pP $0f
    dw   call_01_5836                                  ;; 01:54d4 ?? $10
    dw   call_01_5828                                  ;; 01:54d6 ?? $11
    dw   call_01_565f                                  ;; 01:54d8 ?? $12
    dw   call_01_565f                                  ;; 01:54da ?? $13
    dw   call_01_586a                                  ;; 01:54dc ?? $14
    dw   call_01_5601                                  ;; 01:54de pP $15
    dw   call_01_589e                                  ;; 01:54e0 ?? $16
    dw   call_01_5899                                  ;; 01:54e2 ?? $17
    dw   call_01_5798                                  ;; 01:54e4 ?? $18
    dw   call_01_58d0                                  ;; 01:54e6 pP $19
    dw   call_01_58d6                                  ;; 01:54e8 ?? $1a
    dw   call_01_5964                                  ;; 01:54ea pP $1b
    dw   call_01_56cd                                  ;; 01:54ec ?? $1c
    dw   call_01_5828                                  ;; 01:54ee ?? $1d
    dw   call_01_5601                                  ;; 01:54f0 ?? $1e
    dw   call_01_5701                                  ;; 01:54f2 ?? $1f
    dw   call_01_5709                                  ;; 01:54f4 ?? $20
    dw   call_01_5850                                  ;; 01:54f6 ?? $21
    dw   call_01_5993                                  ;; 01:54f8 ?? $22
    dw   call_01_5814                                  ;; 01:54fa pP $23
.data_01_54fc:
    xor  A, A                                          ;; 01:54fc $af
    ld   [wCA6F], A                                    ;; 01:54fd $ea $6f $ca

call_01_5500:
    ret                                                ;; 01:5500 $c9

call_01_5501:
    ld   A, [wC6E8]                                    ;; 01:5501 $fa $e8 $c6
    cp   A, $0a                                        ;; 01:5504 $fe $0a
    jr   Z, .jr_01_550d                                ;; 01:5506 $28 $05
    cp   A, $0b                                        ;; 01:5508 $fe $0b
    jr   Z, .jr_01_550d                                ;; 01:550a $28 $01
    ret                                                ;; 01:550c $c9
.jr_01_550d:
    ld   HL, $9060                                     ;; 01:550d $21 $60 $90
    ld   DE, $9460                                     ;; 01:5510 $11 $60 $94
    call call_01_5552                                  ;; 01:5513 $cd $52 $55
    ld   HL, $9460                                     ;; 01:5516 $21 $60 $94
    ld   DE, $94a0                                     ;; 01:5519 $11 $a0 $94
    call call_01_5552                                  ;; 01:551c $cd $52 $55
    ld   HL, $94a0                                     ;; 01:551f $21 $a0 $94
    ld   DE, $94c0                                     ;; 01:5522 $11 $c0 $94
    call call_01_5552                                  ;; 01:5525 $cd $52 $55
    ld   HL, $94c0                                     ;; 01:5528 $21 $c0 $94
    ld   DE, $94e0                                     ;; 01:552b $11 $e0 $94
    jp   call_01_5552                                  ;; 01:552e $c3 $52 $55
    db   $21, $d0, $96, $11, $a0, $90, $cd, $52        ;; 01:5531 ????????
    db   $55, $21, $a0, $90, $11, $c0, $90, $cd        ;; 01:5539 ????????
    db   $52, $55, $21, $c0, $90, $11, $e0, $90        ;; 01:5541 ????????
    db   $cd, $52, $55, $21, $e0, $90, $11, $40        ;; 01:5549 ????????
    db   $94                                           ;; 01:5551 ?

call_01_5552:
    ld   A, L                                          ;; 01:5552 $7d
    ld   [wC860], A                                    ;; 01:5553 $ea $60 $c8
    ld   A, H                                          ;; 01:5556 $7c
    ld   [wC861], A                                    ;; 01:5557 $ea $61 $c8
    ld   A, E                                          ;; 01:555a $7b
    ld   [wC862], A                                    ;; 01:555b $ea $62 $c8
    ld   A, D                                          ;; 01:555e $7a
    ld   [wC863], A                                    ;; 01:555f $ea $63 $c8
    ld   A, [wC860]                                    ;; 01:5562 $fa $60 $c8
    ld   L, A                                          ;; 01:5565 $6f
    ld   A, [wC861]                                    ;; 01:5566 $fa $61 $c8
    ld   H, A                                          ;; 01:5569 $67
    ld   DE, wC810                                     ;; 01:556a $11 $10 $c8
    call call_00_0159                                  ;; 01:556d $cd $59 $01
    ld   A, [wC860]                                    ;; 01:5570 $fa $60 $c8
    ld   L, A                                          ;; 01:5573 $6f
    ld   A, [wC861]                                    ;; 01:5574 $fa $61 $c8
    add  A, $01                                        ;; 01:5577 $c6 $01
    ld   H, A                                          ;; 01:5579 $67
    call call_00_0159                                  ;; 01:557a $cd $59 $01
    ld   A, [wC860]                                    ;; 01:557d $fa $60 $c8
    add  A, $10                                        ;; 01:5580 $c6 $10
    ld   L, A                                          ;; 01:5582 $6f
    ld   A, [wC861]                                    ;; 01:5583 $fa $61 $c8
    adc  A, $00                                        ;; 01:5586 $ce $00
    ld   H, A                                          ;; 01:5588 $67
    call call_00_0159                                  ;; 01:5589 $cd $59 $01
    ld   A, [wC860]                                    ;; 01:558c $fa $60 $c8
    add  A, $10                                        ;; 01:558f $c6 $10
    ld   L, A                                          ;; 01:5591 $6f
    ld   A, [wC861]                                    ;; 01:5592 $fa $61 $c8
    adc  A, $01                                        ;; 01:5595 $ce $01
    ld   H, A                                          ;; 01:5597 $67
    call call_00_0159                                  ;; 01:5598 $cd $59 $01
    ld   HL, wC810                                     ;; 01:559b $21 $10 $c8
    ld   DE, wC850                                     ;; 01:559e $11 $50 $c8
    call call_01_5a18                                  ;; 01:55a1 $cd $18 $5a
    ld   A, [wC862]                                    ;; 01:55a4 $fa $62 $c8
    add  A, $10                                        ;; 01:55a7 $c6 $10
    ld   E, A                                          ;; 01:55a9 $5f
    ld   A, [wC863]                                    ;; 01:55aa $fa $63 $c8
    adc  A, $00                                        ;; 01:55ad $ce $00
    ld   D, A                                          ;; 01:55af $57
    ld   HL, wC850                                     ;; 01:55b0 $21 $50 $c8
    call call_00_0159                                  ;; 01:55b3 $cd $59 $01
    ld   HL, wC820                                     ;; 01:55b6 $21 $20 $c8
    ld   DE, wC850                                     ;; 01:55b9 $11 $50 $c8
    call call_01_5a18                                  ;; 01:55bc $cd $18 $5a
    ld   A, [wC862]                                    ;; 01:55bf $fa $62 $c8
    ld   E, A                                          ;; 01:55c2 $5f
    ld   A, [wC863]                                    ;; 01:55c3 $fa $63 $c8
    ld   D, A                                          ;; 01:55c6 $57
    ld   HL, wC850                                     ;; 01:55c7 $21 $50 $c8
    call call_00_0159                                  ;; 01:55ca $cd $59 $01
    ld   HL, wC830                                     ;; 01:55cd $21 $30 $c8
    ld   DE, wC850                                     ;; 01:55d0 $11 $50 $c8
    call call_01_5a18                                  ;; 01:55d3 $cd $18 $5a
    ld   A, [wC862]                                    ;; 01:55d6 $fa $62 $c8
    add  A, $10                                        ;; 01:55d9 $c6 $10
    ld   E, A                                          ;; 01:55db $5f
    ld   A, [wC863]                                    ;; 01:55dc $fa $63 $c8
    adc  A, $01                                        ;; 01:55df $ce $01
    ld   D, A                                          ;; 01:55e1 $57
    ld   HL, wC850                                     ;; 01:55e2 $21 $50 $c8
    call call_00_0159                                  ;; 01:55e5 $cd $59 $01
    ld   HL, wC840                                     ;; 01:55e8 $21 $40 $c8
    ld   DE, wC850                                     ;; 01:55eb $11 $50 $c8
    call call_01_5a18                                  ;; 01:55ee $cd $18 $5a
    ld   A, [wC862]                                    ;; 01:55f1 $fa $62 $c8
    ld   E, A                                          ;; 01:55f4 $5f
    ld   A, [wC863]                                    ;; 01:55f5 $fa $63 $c8
    add  A, $01                                        ;; 01:55f8 $c6 $01
    ld   D, A                                          ;; 01:55fa $57
    ld   HL, wC850                                     ;; 01:55fb $21 $50 $c8
    jp   call_00_0159                                  ;; 01:55fe $c3 $59 $01

call_01_5601:
    ldh  A, [hFF93]                                    ;; 01:5601 $f0 $93
    and  A, $0f                                        ;; 01:5603 $e6 $0f
    ret  NZ                                            ;; 01:5605 $c0
    ldh  A, [hFF93]                                    ;; 01:5606 $f0 $93
    swap A                                             ;; 01:5608 $cb $37
    and  A, $03                                        ;; 01:560a $e6 $03
    call doJumptable                                   ;; 01:560c $cd $3a $37
;@jumptable amount=4
    dw   call_01_5617                                  ;; 01:560f pP $00
    dw   call_01_5629                                  ;; 01:5611 pP $01
    dw   call_01_563b                                  ;; 01:5613 pP $02
    dw   call_01_564d                                  ;; 01:5615 pP $03

call_01_5617:
    ld   HL, $9460                                     ;; 01:5617 $21 $60 $94
    ld   DE, $9060                                     ;; 01:561a $11 $60 $90
    call call_00_015f                                  ;; 01:561d $cd $5f $01
    ld   HL, $9560                                     ;; 01:5620 $21 $60 $95
    ld   DE, $9160                                     ;; 01:5623 $11 $60 $91
    jp   call_00_015f                                  ;; 01:5626 $c3 $5f $01

call_01_5629:
    ld   HL, $94a0                                     ;; 01:5629 $21 $a0 $94
    ld   DE, $9060                                     ;; 01:562c $11 $60 $90
    call call_00_015f                                  ;; 01:562f $cd $5f $01
    ld   HL, $95a0                                     ;; 01:5632 $21 $a0 $95
    ld   DE, $9160                                     ;; 01:5635 $11 $60 $91
    jp   call_00_015f                                  ;; 01:5638 $c3 $5f $01

call_01_563b:
    ld   HL, $94c0                                     ;; 01:563b $21 $c0 $94
    ld   DE, $9060                                     ;; 01:563e $11 $60 $90
    call call_00_015f                                  ;; 01:5641 $cd $5f $01
    ld   HL, $95c0                                     ;; 01:5644 $21 $c0 $95
    ld   DE, $9160                                     ;; 01:5647 $11 $60 $91
    jp   call_00_015f                                  ;; 01:564a $c3 $5f $01

call_01_564d:
    ld   HL, $94e0                                     ;; 01:564d $21 $e0 $94
    ld   DE, $9060                                     ;; 01:5650 $11 $60 $90
    call call_00_015f                                  ;; 01:5653 $cd $5f $01
    ld   HL, $95e0                                     ;; 01:5656 $21 $e0 $95
    ld   DE, $9160                                     ;; 01:5659 $11 $60 $91
    jp   call_00_015f                                  ;; 01:565c $c3 $5f $01

call_01_565f:
    ldh  A, [hFF93]                                    ;; 01:565f $f0 $93
    and  A, $0f                                        ;; 01:5661 $e6 $0f
    jr   NZ, .jr_01_567a                               ;; 01:5663 $20 $15
    ldh  A, [hFF93]                                    ;; 01:5665 $f0 $93
    swap A                                             ;; 01:5667 $cb $37
    and  A, $03                                        ;; 01:5669 $e6 $03
    ld   HL, .jr_01_567a                               ;; 01:566b $21 $7a $56
    push HL                                            ;; 01:566e $e5
    call doJumptable                                   ;; 01:566f $cd $3a $37
;@jumptable amount=4
    dw   call_01_567d                                  ;; 01:5672 ?? $00
    dw   call_01_568f                                  ;; 01:5674 ?? $01
    dw   call_01_56a1                                  ;; 01:5676 ?? $02
    dw   call_01_56b3                                  ;; 01:5678 ?? $03
.jr_01_567a:
    jp   call_01_5836                                  ;; 01:567a $c3 $36 $58

call_01_567d:
    ld   HL, $90a0                                     ;; 01:567d $21 $a0 $90
    ld   DE, $96d0                                     ;; 01:5680 $11 $d0 $96
    call call_00_015f                                  ;; 01:5683 $cd $5f $01
    ld   HL, $91a0                                     ;; 01:5686 $21 $a0 $91
    ld   DE, $97d0                                     ;; 01:5689 $11 $d0 $97
    jp   call_00_015f                                  ;; 01:568c $c3 $5f $01

call_01_568f:
    ld   HL, $90c0                                     ;; 01:568f $21 $c0 $90
    ld   DE, $96d0                                     ;; 01:5692 $11 $d0 $96
    call call_00_015f                                  ;; 01:5695 $cd $5f $01
    ld   HL, $91c0                                     ;; 01:5698 $21 $c0 $91
    ld   DE, $97d0                                     ;; 01:569b $11 $d0 $97
    jp   call_00_015f                                  ;; 01:569e $c3 $5f $01

call_01_56a1:
    ld   HL, $90e0                                     ;; 01:56a1 $21 $e0 $90
    ld   DE, $96d0                                     ;; 01:56a4 $11 $d0 $96
    call call_00_015f                                  ;; 01:56a7 $cd $5f $01
    ld   HL, $91e0                                     ;; 01:56aa $21 $e0 $91
    ld   DE, $97d0                                     ;; 01:56ad $11 $d0 $97
    jp   call_00_015f                                  ;; 01:56b0 $c3 $5f $01

call_01_56b3:
    ld   HL, $9440                                     ;; 01:56b3 $21 $40 $94
    ld   DE, $96d0                                     ;; 01:56b6 $11 $d0 $96
    call call_00_015f                                  ;; 01:56b9 $cd $5f $01
    ld   HL, $9540                                     ;; 01:56bc $21 $40 $95
    ld   DE, $97d0                                     ;; 01:56bf $11 $d0 $97
    jp   call_00_015f                                  ;; 01:56c2 $c3 $5f $01

call_01_56c5:
    call call_01_56e4                                  ;; 01:56c5 $cd $e4 $56

call_01_56c8:
    ld   HL, $9400                                     ;; 01:56c8 $21 $00 $94
    jr   call_01_5730                                  ;; 01:56cb $18 $63

call_01_56cd:
    ldh  A, [hFF93]                                    ;; 01:56cd $f0 $93
    and  A, $03                                        ;; 01:56cf $e6 $03
    jr   NZ, call_01_56df                              ;; 01:56d1 $20 $0c
    ld   HL, $8600                                     ;; 01:56d3 $21 $00 $86
    call call_01_57a9                                  ;; 01:56d6 $cd $a9 $57
    ld   HL, $8610                                     ;; 01:56d9 $21 $10 $86
    call call_01_57a9                                  ;; 01:56dc $cd $a9 $57

call_01_56df:
    ld   HL, $9200                                     ;; 01:56df $21 $00 $92
    jr   call_01_5730                                  ;; 01:56e2 $18 $4c

call_01_56e4:
    ld   HL, $9080                                     ;; 01:56e4 $21 $80 $90
    jr   call_01_5730                                  ;; 01:56e7 $18 $47

call_01_56e9:
    ldh  A, [hFF93]                                    ;; 01:56e9 $f0 $93
    and  A, $0f                                        ;; 01:56eb $e6 $0f
    jr   NZ, call_01_5714                              ;; 01:56ed $20 $25
    ld   HL, $9190                                     ;; 01:56ef $21 $90 $91
    call call_01_60f5                                  ;; 01:56f2 $cd $f5 $60
    ld   HL, wC800                                     ;; 01:56f5 $21 $00 $c8
    call call_01_5847                                  ;; 01:56f8 $cd $47 $58
    ld   DE, $9190                                     ;; 01:56fb $11 $90 $91
    call call_01_60fb                                  ;; 01:56fe $cd $fb $60

call_01_5701:
    call call_01_571e                                  ;; 01:5701 $cd $1e $57
    ld   HL, $9060                                     ;; 01:5704 $21 $60 $90
    jr   call_01_5730                                  ;; 01:5707 $18 $27

call_01_5709:
    ld   HL, $9260                                     ;; 01:5709 $21 $60 $92
    call call_01_5730                                  ;; 01:570c $cd $30 $57
    ld   HL, $9400                                     ;; 01:570f $21 $00 $94
    jr   call_01_5730                                  ;; 01:5712 $18 $1c

call_01_5714:
    ld   HL, $9000                                     ;; 01:5714 $21 $00 $90
    jr   call_01_5730                                  ;; 01:5717 $18 $17

call_01_5719:
    ld   HL, $9680                                     ;; 01:5719 $21 $80 $96
    jr   call_01_5730                                  ;; 01:571c $18 $12

call_01_571e:
    ld   HL, $9600                                     ;; 01:571e $21 $00 $96
    jr   call_01_5730                                  ;; 01:5721 $18 $0d

call_01_5723:
    ld   HL, $9680                                     ;; 01:5723 $21 $80 $96
    di                                                 ;; 01:5726 $f3
    ldh  A, [hFF93]                                    ;; 01:5727 $f0 $93
    and  A, $0f                                        ;; 01:5729 $e6 $0f
    cp   A, $06                                        ;; 01:572b $fe $06
    jr   Z, jr_01_5742                                 ;; 01:572d $28 $13
    reti                                               ;; 01:572f $d9

call_01_5730:
    di                                                 ;; 01:5730 $f3
    ldh  A, [hFF93]                                    ;; 01:5731 $f0 $93
    and  A, $0f                                        ;; 01:5733 $e6 $0f
    cp   A, $06                                        ;; 01:5735 $fe $06
    jr   Z, jr_01_5742                                 ;; 01:5737 $28 $09
    cp   A, $0e                                        ;; 01:5739 $fe $0e
    jr   Z, .jr_01_573e                                ;; 01:573b $28 $01
    reti                                               ;; 01:573d $d9
.jr_01_573e:
    ld   DE, $100                                      ;; 01:573e $11 $00 $01
    add  HL, DE                                        ;; 01:5741 $19

jr_01_5742:
    xor  A, A                                          ;; 01:5742 $af
    ld   [wC800], A                                    ;; 01:5743 $ea $00 $c8
    push HL                                            ;; 01:5746 $e5
.jr_01_5747:
    pop  HL                                            ;; 01:5747 $e1
    push HL                                            ;; 01:5748 $e5
    ld   A, [wC800]                                    ;; 01:5749 $fa $00 $c8
    ld   C, A                                          ;; 01:574c $4f
    ld   B, $00                                        ;; 01:574d $06 $00
    add  HL, BC                                        ;; 01:574f $09
.jr_01_5750:
    ldh  A, [rSTAT]                                    ;; 01:5750 $f0 $41
    and  A, $03                                        ;; 01:5752 $e6 $03
    jr   Z, .jr_01_5750                                ;; 01:5754 $28 $fa
.jr_01_5756:
    ldh  A, [rSTAT]                                    ;; 01:5756 $f0 $41
    and  A, $02                                        ;; 01:5758 $e6 $02
    jr   NZ, .jr_01_5756                               ;; 01:575a $20 $fa
    ld   B, [HL]                                       ;; 01:575c $46
    ld   DE, $10                                       ;; 01:575d $11 $10 $00
    add  HL, DE                                        ;; 01:5760 $19
    ld   C, [HL]                                       ;; 01:5761 $4e
    call call_01_5785                                  ;; 01:5762 $cd $85 $57
.jr_01_5765:
    ldh  A, [rSTAT]                                    ;; 01:5765 $f0 $41
    and  A, $03                                        ;; 01:5767 $e6 $03
    jr   Z, .jr_01_5765                                ;; 01:5769 $28 $fa
.jr_01_576b:
    ldh  A, [rSTAT]                                    ;; 01:576b $f0 $41
    and  A, $02                                        ;; 01:576d $e6 $02
    jr   NZ, .jr_01_576b                               ;; 01:576f $20 $fa
    ld   [HL], C                                       ;; 01:5771 $71
    ld   DE, hFFF0                                     ;; 01:5772 $11 $f0 $ff
    add  HL, DE                                        ;; 01:5775 $19
    ld   [HL], B                                       ;; 01:5776 $70
    ld   A, [wC800]                                    ;; 01:5777 $fa $00 $c8
    add  A, $01                                        ;; 01:577a $c6 $01
    ld   [wC800], A                                    ;; 01:577c $ea $00 $c8
    cp   A, $10                                        ;; 01:577f $fe $10
    jr   NZ, .jr_01_5747                               ;; 01:5781 $20 $c4
    pop  HL                                            ;; 01:5783 $e1
    reti                                               ;; 01:5784 $d9

call_01_5785:
    ld   A, C                                          ;; 01:5785 $79
    rrca                                               ;; 01:5786 $0f
    rr   B                                             ;; 01:5787 $cb $18
    rr   C                                             ;; 01:5789 $cb $19
    ret                                                ;; 01:578b $c9

call_01_578c:
    ld   HL, $9020                                     ;; 01:578c $21 $20 $90
    call call_01_57c7                                  ;; 01:578f $cd $c7 $57
    ld   HL, $91b0                                     ;; 01:5792 $21 $b0 $91
    jp   jp_01_57a4                                    ;; 01:5795 $c3 $a4 $57

call_01_5798:
    ld   HL, $9220                                     ;; 01:5798 $21 $20 $92
    call call_01_57c7                                  ;; 01:579b $cd $c7 $57
    ld   HL, $93b0                                     ;; 01:579e $21 $b0 $93
    jp   jp_01_57a4                                    ;; 01:57a1 $c3 $a4 $57

jp_01_57a4:
    ldh  A, [hFF93]                                    ;; 01:57a4 $f0 $93
    and  A, $03                                        ;; 01:57a6 $e6 $03
    ret  NZ                                            ;; 01:57a8 $c0

call_01_57a9:
    push HL                                            ;; 01:57a9 $e5
    call call_01_60f5                                  ;; 01:57aa $cd $f5 $60
    ld   B, $02                                        ;; 01:57ad $06 $02
.jr_01_57af:
    ld   C, $10                                        ;; 01:57af $0e $10
    ld   HL, wC80F                                     ;; 01:57b1 $21 $0f $c8
.jr_01_57b4:
    ld   A, [HL+]                                      ;; 01:57b4 $2a
    ld   [HL-], A                                      ;; 01:57b5 $32
    dec  HL                                            ;; 01:57b6 $2b
    dec  C                                             ;; 01:57b7 $0d
    jr   NZ, .jr_01_57b4                               ;; 01:57b8 $20 $fa
    ld   A, [wC810]                                    ;; 01:57ba $fa $10 $c8
    ld   [wC800], A                                    ;; 01:57bd $ea $00 $c8
    dec  B                                             ;; 01:57c0 $05
    jr   NZ, .jr_01_57af                               ;; 01:57c1 $20 $ec
    pop  DE                                            ;; 01:57c3 $d1
    jp   call_01_60fb                                  ;; 01:57c4 $c3 $fb $60

call_01_57c7:
    ldh  A, [hFF93]                                    ;; 01:57c7 $f0 $93
    and  A, $03                                        ;; 01:57c9 $e6 $03
    cp   A, $02                                        ;; 01:57cb $fe $02
    ret  NZ                                            ;; 01:57cd $c0

jp_01_57ce:
    push HL                                            ;; 01:57ce $e5
    ld   DE, wC801                                     ;; 01:57cf $11 $01 $c8
    call call_00_0159                                  ;; 01:57d2 $cd $59 $01
    ld   B, $02                                        ;; 01:57d5 $06 $02
.jr_01_57d7:
    ld   C, $10                                        ;; 01:57d7 $0e $10
    ld   HL, wC801                                     ;; 01:57d9 $21 $01 $c8
.jr_01_57dc:
    ld   A, [HL-]                                      ;; 01:57dc $3a
    ld   [HL+], A                                      ;; 01:57dd $22
    inc  HL                                            ;; 01:57de $23
    dec  C                                             ;; 01:57df $0d
    jr   NZ, .jr_01_57dc                               ;; 01:57e0 $20 $fa
    ld   A, [wC800]                                    ;; 01:57e2 $fa $00 $c8
    ld   [wC810], A                                    ;; 01:57e5 $ea $10 $c8
    dec  B                                             ;; 01:57e8 $05
    jr   NZ, .jr_01_57d7                               ;; 01:57e9 $20 $ec
    pop  DE                                            ;; 01:57eb $d1
    ld   HL, wC801                                     ;; 01:57ec $21 $01 $c8
    jp   call_00_0159                                  ;; 01:57ef $c3 $59 $01

call_01_57f2:
    ldh  A, [hFF93]                                    ;; 01:57f2 $f0 $93
    and  A, $0f                                        ;; 01:57f4 $e6 $0f
    cp   A, $08                                        ;; 01:57f6 $fe $08
    jr   Z, .jr_01_580e                                ;; 01:57f8 $28 $14
    and  A, A                                          ;; 01:57fa $a7
    ret  NZ                                            ;; 01:57fb $c0
    ld   HL, $9390                                     ;; 01:57fc $21 $90 $93
    call call_01_60f5                                  ;; 01:57ff $cd $f5 $60
    ld   HL, wC800                                     ;; 01:5802 $21 $00 $c8
    call call_01_5847                                  ;; 01:5805 $cd $47 $58
    ld   DE, $9390                                     ;; 01:5808 $11 $90 $93
    jp   call_01_60fb                                  ;; 01:580b $c3 $fb $60
.jr_01_580e:
    ld   HL, $9380                                     ;; 01:580e $21 $80 $93
    jp   jp_01_57ce                                    ;; 01:5811 $c3 $ce $57

call_01_5814:
    call call_01_56e4                                  ;; 01:5814 $cd $e4 $56
    ldh  A, [hFF93]                                    ;; 01:5817 $f0 $93
    and  A, $03                                        ;; 01:5819 $e6 $03
    ret  NZ                                            ;; 01:581b $c0
    ld   HL, $9600                                     ;; 01:581c $21 $00 $96
    call call_01_57a9                                  ;; 01:581f $cd $a9 $57
    ld   HL, $9610                                     ;; 01:5822 $21 $10 $96
    jp   call_01_57a9                                  ;; 01:5825 $c3 $a9 $57

call_01_5828:
    ldh  A, [hFF93]                                    ;; 01:5828 $f0 $93
    and  A, $03                                        ;; 01:582a $e6 $03
    cp   A, $02                                        ;; 01:582c $fe $02
    jr   NZ, call_01_5836                              ;; 01:582e $20 $06
    ld   HL, $9190                                     ;; 01:5830 $21 $90 $91
    call call_01_57a9                                  ;; 01:5833 $cd $a9 $57

call_01_5836:
    ldh  A, [hFF93]                                    ;; 01:5836 $f0 $93
    and  A, $03                                        ;; 01:5838 $e6 $03
    ret  NZ                                            ;; 01:583a $c0
    ld   HL, $9790                                     ;; 01:583b $21 $90 $97
    call call_01_57a9                                  ;; 01:583e $cd $a9 $57
    ld   HL, $97a0                                     ;; 01:5841 $21 $a0 $97
    jp   call_01_57a9                                  ;; 01:5844 $c3 $a9 $57

call_01_5847:
    ld   A, $10                                        ;; 01:5847 $3e $10
.jr_01_5849:
    rrc  [HL]                                          ;; 01:5849 $cb $0e
    inc  HL                                            ;; 01:584b $23
    dec  A                                             ;; 01:584c $3d
    jr   NZ, .jr_01_5849                               ;; 01:584d $20 $fa
    ret                                                ;; 01:584f $c9

call_01_5850:
    ldh  A, [hFF93]                                    ;; 01:5850 $f0 $93
    and  A, $0f                                        ;; 01:5852 $e6 $0f
    ret  NZ                                            ;; 01:5854 $c0
    ld   HL, $9660                                     ;; 01:5855 $21 $60 $96
    call call_01_6101                                  ;; 01:5858 $cd $01 $61
    ld   HL, $9760                                     ;; 01:585b $21 $60 $97
    ld   DE, $9660                                     ;; 01:585e $11 $60 $96
    call call_00_015f                                  ;; 01:5861 $cd $5f $01
    ld   DE, $9760                                     ;; 01:5864 $11 $60 $97
    jp   call_01_6107                                  ;; 01:5867 $c3 $07 $61

call_01_586a:
    ldh  A, [hFF93]                                    ;; 01:586a $f0 $93
    and  A, $1f                                        ;; 01:586c $e6 $1f
    ret  NZ                                            ;; 01:586e $c0
    ld   HL, $9440                                     ;; 01:586f $21 $40 $94
    call call_01_6101                                  ;; 01:5872 $cd $01 $61
    ld   HL, $9460                                     ;; 01:5875 $21 $60 $94
    ld   DE, $9440                                     ;; 01:5878 $11 $40 $94
    call call_00_015f                                  ;; 01:587b $cd $5f $01
    ld   DE, $9460                                     ;; 01:587e $11 $60 $94
    call call_01_6107                                  ;; 01:5881 $cd $07 $61
    ld   HL, $9540                                     ;; 01:5884 $21 $40 $95
    call call_01_6101                                  ;; 01:5887 $cd $01 $61
    ld   HL, $9560                                     ;; 01:588a $21 $60 $95
    ld   DE, $9540                                     ;; 01:588d $11 $40 $95
    call call_00_015f                                  ;; 01:5890 $cd $5f $01
    ld   DE, $9560                                     ;; 01:5893 $11 $60 $95
    jp   call_01_6107                                  ;; 01:5896 $c3 $07 $61

call_01_5899:
    call call_01_5714                                  ;; 01:5899 $cd $14 $57
    jr   jr_01_58a1                                    ;; 01:589c $18 $03

call_01_589e:
    call call_01_5798                                  ;; 01:589e $cd $98 $57

jr_01_58a1:
    ldh  A, [hFF93]                                    ;; 01:58a1 $f0 $93
    and  A, $0f                                        ;; 01:58a3 $e6 $0f
    ret  NZ                                            ;; 01:58a5 $c0
    ld   HL, $97b0                                     ;; 01:58a6 $21 $b0 $97
    call call_01_6101                                  ;; 01:58a9 $cd $01 $61
    ld   HL, $9690                                     ;; 01:58ac $21 $90 $96
    ld   DE, $97b0                                     ;; 01:58af $11 $b0 $97
    call call_00_015f                                  ;; 01:58b2 $cd $5f $01
    ld   DE, $9690                                     ;; 01:58b5 $11 $90 $96
    call call_01_6107                                  ;; 01:58b8 $cd $07 $61
    ld   HL, $96d0                                     ;; 01:58bb $21 $d0 $96
    call call_01_6101                                  ;; 01:58be $cd $01 $61
    ld   HL, $9790                                     ;; 01:58c1 $21 $90 $97
    ld   DE, $96d0                                     ;; 01:58c4 $11 $d0 $96
    call call_00_015f                                  ;; 01:58c7 $cd $5f $01
    ld   DE, $9790                                     ;; 01:58ca $11 $90 $97
    jp   call_01_6107                                  ;; 01:58cd $c3 $07 $61

call_01_58d0:
    call call_01_594a                                  ;; 01:58d0 $cd $4a $59
    jp   call_01_5964                                  ;; 01:58d3 $c3 $64 $59

call_01_58d6:
    ldh  A, [hFF93]                                    ;; 01:58d6 $f0 $93
    and  A, $0f                                        ;; 01:58d8 $e6 $0f
    jr   NZ, .jr_01_58f1                               ;; 01:58da $20 $15
    ld   HL, $9500                                     ;; 01:58dc $21 $00 $95
    call call_01_60f5                                  ;; 01:58df $cd $f5 $60
    ld   HL, $9510                                     ;; 01:58e2 $21 $10 $95
    ld   DE, $9500                                     ;; 01:58e5 $11 $00 $95
    call call_00_0159                                  ;; 01:58e8 $cd $59 $01
    ld   DE, $9510                                     ;; 01:58eb $11 $10 $95
    call call_01_60fb                                  ;; 01:58ee $cd $fb $60
.jr_01_58f1:
    ldh  A, [hFF93]                                    ;; 01:58f1 $f0 $93
    and  A, $1f                                        ;; 01:58f3 $e6 $1f
    ret  NZ                                            ;; 01:58f5 $c0
    ld   HL, $92e0                                     ;; 01:58f6 $21 $e0 $92
    call call_01_60f5                                  ;; 01:58f9 $cd $f5 $60
    ld   HL, $96c0                                     ;; 01:58fc $21 $c0 $96
    ld   DE, $92e0                                     ;; 01:58ff $11 $e0 $92
    call call_00_0159                                  ;; 01:5902 $cd $59 $01
    ld   DE, $96c0                                     ;; 01:5905 $11 $c0 $96
    call call_01_60fb                                  ;; 01:5908 $cd $fb $60
    ld   HL, $93e0                                     ;; 01:590b $21 $e0 $93
    call call_01_60f5                                  ;; 01:590e $cd $f5 $60
    ld   HL, $96d0                                     ;; 01:5911 $21 $d0 $96
    ld   DE, $93e0                                     ;; 01:5914 $11 $e0 $93
    call call_00_0159                                  ;; 01:5917 $cd $59 $01
    ld   DE, $96d0                                     ;; 01:591a $11 $d0 $96
    call call_01_60fb                                  ;; 01:591d $cd $fb $60
    ld   HL, $93b0                                     ;; 01:5920 $21 $b0 $93
    call call_01_60f5                                  ;; 01:5923 $cd $f5 $60
    ld   HL, $9640                                     ;; 01:5926 $21 $40 $96
    ld   DE, $93b0                                     ;; 01:5929 $11 $b0 $93
    call call_00_0159                                  ;; 01:592c $cd $59 $01
    ld   DE, $9640                                     ;; 01:592f $11 $40 $96
    call call_01_60fb                                  ;; 01:5932 $cd $fb $60
    ld   HL, $93c0                                     ;; 01:5935 $21 $c0 $93
    call call_01_60f5                                  ;; 01:5938 $cd $f5 $60
    ld   HL, $9750                                     ;; 01:593b $21 $50 $97
    ld   DE, $93c0                                     ;; 01:593e $11 $c0 $93
    call call_00_0159                                  ;; 01:5941 $cd $59 $01
    ld   DE, $9750                                     ;; 01:5944 $11 $50 $97
    jp   call_01_60fb                                  ;; 01:5947 $c3 $fb $60

call_01_594a:
    ldh  A, [hFF93]                                    ;; 01:594a $f0 $93
    and  A, $0f                                        ;; 01:594c $e6 $0f
    ret  NZ                                            ;; 01:594e $c0
    ld   HL, $90c0                                     ;; 01:594f $21 $c0 $90
    call call_01_60f5                                  ;; 01:5952 $cd $f5 $60
    ld   HL, $92a0                                     ;; 01:5955 $21 $a0 $92
    ld   DE, $90c0                                     ;; 01:5958 $11 $c0 $90
    call call_00_0159                                  ;; 01:595b $cd $59 $01
    ld   DE, $92a0                                     ;; 01:595e $11 $a0 $92
    jp   call_01_60fb                                  ;; 01:5961 $c3 $fb $60

call_01_5964:
    ldh  A, [hFF93]                                    ;; 01:5964 $f0 $93
    and  A, $0f                                        ;; 01:5966 $e6 $0f
    ret  NZ                                            ;; 01:5968 $c0
    ld   HL, $9220                                     ;; 01:5969 $21 $20 $92
    call call_01_6101                                  ;; 01:596c $cd $01 $61
    ld   HL, $9250                                     ;; 01:596f $21 $50 $92
    ld   DE, $9220                                     ;; 01:5972 $11 $20 $92
    call call_00_015f                                  ;; 01:5975 $cd $5f $01
    ld   DE, $9250                                     ;; 01:5978 $11 $50 $92
    call call_01_6107                                  ;; 01:597b $cd $07 $61
    ld   HL, $9320                                     ;; 01:597e $21 $20 $93
    call call_01_6101                                  ;; 01:5981 $cd $01 $61
    ld   HL, $9350                                     ;; 01:5984 $21 $50 $93
    ld   DE, $9320                                     ;; 01:5987 $11 $20 $93
    call call_00_015f                                  ;; 01:598a $cd $5f $01
    ld   DE, $9350                                     ;; 01:598d $11 $50 $93
    jp   call_01_6107                                  ;; 01:5990 $c3 $07 $61

call_01_5993:
    ldh  A, [hFF93]                                    ;; 01:5993 $f0 $93
    and  A, $1f                                        ;; 01:5995 $e6 $1f
    ret  NZ                                            ;; 01:5997 $c0
    ld   HL, $9620                                     ;; 01:5998 $21 $20 $96
    call call_01_6101                                  ;; 01:599b $cd $01 $61
    ld   HL, $9660                                     ;; 01:599e $21 $60 $96
    ld   DE, $9620                                     ;; 01:59a1 $11 $20 $96
    call call_00_015f                                  ;; 01:59a4 $cd $5f $01
    ld   DE, $9660                                     ;; 01:59a7 $11 $60 $96
    call call_01_6107                                  ;; 01:59aa $cd $07 $61
    ld   HL, $9720                                     ;; 01:59ad $21 $20 $97
    call call_01_6101                                  ;; 01:59b0 $cd $01 $61
    ld   HL, $9760                                     ;; 01:59b3 $21 $60 $97
    ld   DE, $9720                                     ;; 01:59b6 $11 $20 $97
    call call_00_015f                                  ;; 01:59b9 $cd $5f $01
    ld   DE, $9760                                     ;; 01:59bc $11 $60 $97
    jp   call_01_6107                                  ;; 01:59bf $c3 $07 $61

call_01_59c2:
    ld   HL, $96c0                                     ;; 01:59c2 $21 $c0 $96
    call call_01_5730                                  ;; 01:59c5 $cd $30 $57
    ldh  A, [hFF93]                                    ;; 01:59c8 $f0 $93
    and  A, $3f                                        ;; 01:59ca $e6 $3f
    cp   A, $20                                        ;; 01:59cc $fe $20
    jr   Z, .jr_01_59e9                                ;; 01:59ce $28 $19
    and  A, A                                          ;; 01:59d0 $a7
    jr   Z, .jr_01_59d4                                ;; 01:59d1 $28 $01
    ret                                                ;; 01:59d3 $c9
.jr_01_59d4:
    ld   HL, $97c0                                     ;; 01:59d4 $21 $c0 $97
    call call_01_6101                                  ;; 01:59d7 $cd $01 $61
    ld   HL, $96c0                                     ;; 01:59da $21 $c0 $96
    ld   DE, $97c0                                     ;; 01:59dd $11 $c0 $97
    call call_00_015f                                  ;; 01:59e0 $cd $5f $01
    ld   DE, $96c0                                     ;; 01:59e3 $11 $c0 $96
    jp   call_01_6107                                  ;; 01:59e6 $c3 $07 $61
.jr_01_59e9:
    ld   HL, $97e0                                     ;; 01:59e9 $21 $e0 $97
    call call_01_6101                                  ;; 01:59ec $cd $01 $61
    ld   HL, $96e0                                     ;; 01:59ef $21 $e0 $96
    ld   DE, $97e0                                     ;; 01:59f2 $11 $e0 $97
    call call_00_015f                                  ;; 01:59f5 $cd $5f $01
    ld   DE, $96e0                                     ;; 01:59f8 $11 $e0 $96
    jp   call_01_6107                                  ;; 01:59fb $c3 $07 $61

call_01_59fe:
    ldh  A, [hFF93]                                    ;; 01:59fe $f0 $93
    and  A, $3f                                        ;; 01:5a00 $e6 $3f
    ret  NZ                                            ;; 01:5a02 $c0
    ld   HL, $97e0                                     ;; 01:5a03 $21 $e0 $97
    call call_01_6101                                  ;; 01:5a06 $cd $01 $61
    ld   HL, $96e0                                     ;; 01:5a09 $21 $e0 $96
    ld   DE, $97e0                                     ;; 01:5a0c $11 $e0 $97
    call call_00_015f                                  ;; 01:5a0f $cd $5f $01
    ld   DE, $96e0                                     ;; 01:5a12 $11 $e0 $96
    jp   call_01_6107                                  ;; 01:5a15 $c3 $07 $61

call_01_5a18:
    push HL                                            ;; 01:5a18 $e5
    push DE                                            ;; 01:5a19 $d5
    ld   BC, $0e                                       ;; 01:5a1a $01 $0e $00
    add  HL, BC                                        ;; 01:5a1d $09
    call call_01_5a44                                  ;; 01:5a1e $cd $44 $5a
    ld   HL, wC801                                     ;; 01:5a21 $21 $01 $c8
    ld   C, $08                                        ;; 01:5a24 $0e $08
.jr_01_5a26:
    ld   A, [HL+]                                      ;; 01:5a26 $2a
    ld   [DE], A                                       ;; 01:5a27 $12
    inc  DE                                            ;; 01:5a28 $13
    inc  DE                                            ;; 01:5a29 $13
    dec  C                                             ;; 01:5a2a $0d
    jr   NZ, .jr_01_5a26                               ;; 01:5a2b $20 $f9
    pop  DE                                            ;; 01:5a2d $d1
    pop  HL                                            ;; 01:5a2e $e1
    inc  DE                                            ;; 01:5a2f $13
    ld   BC, $0f                                       ;; 01:5a30 $01 $0f $00
    add  HL, BC                                        ;; 01:5a33 $09
    call call_01_5a44                                  ;; 01:5a34 $cd $44 $5a
    ld   HL, wC801                                     ;; 01:5a37 $21 $01 $c8
    ld   C, $08                                        ;; 01:5a3a $0e $08
.jr_01_5a3c:
    ld   A, [HL+]                                      ;; 01:5a3c $2a
    ld   [DE], A                                       ;; 01:5a3d $12
    inc  DE                                            ;; 01:5a3e $13
    inc  DE                                            ;; 01:5a3f $13
    dec  C                                             ;; 01:5a40 $0d
    jr   NZ, .jr_01_5a3c                               ;; 01:5a41 $20 $f9
    ret                                                ;; 01:5a43 $c9

call_01_5a44:
    ld   B, $01                                        ;; 01:5a44 $06 $01
.jr_01_5a46:
    push HL                                            ;; 01:5a46 $e5
    ld   C, B                                          ;; 01:5a47 $48
.jr_01_5a48:
    ld   A, [HL-]                                      ;; 01:5a48 $3a
.jr_01_5a49:
    sla  A                                             ;; 01:5a49 $cb $27
    dec  C                                             ;; 01:5a4b $0d
    jr   NZ, .jr_01_5a49                               ;; 01:5a4c $20 $fb
    push HL                                            ;; 01:5a4e $e5
    push AF                                            ;; 01:5a4f $f5
    ld   HL, wC800                                     ;; 01:5a50 $21 $00 $c8
    ld   A, L                                          ;; 01:5a53 $7d
    add  A, B                                          ;; 01:5a54 $80
    ld   L, A                                          ;; 01:5a55 $6f
    pop  AF                                            ;; 01:5a56 $f1
    rl   [HL]                                          ;; 01:5a57 $cb $16
    ld   C, B                                          ;; 01:5a59 $48
    pop  HL                                            ;; 01:5a5a $e1
    dec  HL                                            ;; 01:5a5b $2b
    ld   A, L                                          ;; 01:5a5c $7d
    and  A, $0e                                        ;; 01:5a5d $e6 $0e
    cp   A, $0e                                        ;; 01:5a5f $fe $0e
    jr   NZ, .jr_01_5a48                               ;; 01:5a61 $20 $e5
    pop  HL                                            ;; 01:5a63 $e1
    inc  B                                             ;; 01:5a64 $04
    ld   A, B                                          ;; 01:5a65 $78
    cp   A, $09                                        ;; 01:5a66 $fe $09
    jr   NZ, .jr_01_5a46                               ;; 01:5a68 $20 $dc
    ret                                                ;; 01:5a6a $c9
    db   $21, $c0, $94, $cd, $01, $61, $21, $00        ;; 01:5a6b ????????
    db   $92, $cd, $5f, $01, $21, $c0, $95, $cd        ;; 01:5a73 ????????
    db   $5f, $01, $21, $00, $93, $cd, $5f, $01        ;; 01:5a7b ????????
    db   $3e, $20, $cd, $6d, $3a, $21, $20, $c8        ;; 01:5a83 ????????
    db   $11, $20, $c8, $01, $00, $92, $cd, $06        ;; 01:5a8b ????????
    db   $5b, $21, $60, $c8, $11, $60, $c8, $01        ;; 01:5a93 ????????
    db   $00, $93, $cd, $06, $5b, $3e, $20, $cd        ;; 01:5a9b ????????
    db   $6d, $3a, $21, $20, $c8, $11, $22, $c8        ;; 01:5aa3 ????????
    db   $01, $00, $92, $cd, $28, $5b, $21, $60        ;; 01:5aab ????????
    db   $c8, $11, $62, $c8, $01, $00, $93, $cd        ;; 01:5ab3 ????????
    db   $28, $5b, $3e, $20, $cd, $6d, $3a, $21        ;; 01:5abb ????????
    db   $20, $c8, $11, $20, $c8, $01, $00, $92        ;; 01:5ac3 ????????
    db   $cd, $28, $5b, $21, $60, $c8, $11, $60        ;; 01:5acb ????????
    db   $c8, $01, $00, $93, $cd, $28, $5b, $3e        ;; 01:5ad3 ????????
    db   $20, $cd, $6d, $3a, $21, $20, $c8, $11        ;; 01:5adb ????????
    db   $22, $c8, $01, $00, $92, $cd, $06, $5b        ;; 01:5ae3 ????????
    db   $21, $60, $c8, $11, $62, $c8, $01, $00        ;; 01:5aeb ????????
    db   $93, $cd, $06, $5b, $3e, $20, $cd, $6d        ;; 01:5af3 ????????
    db   $3a, $3e, $11, $ea, $17, $ca, $3e, $ec        ;; 01:5afb ????????
    db   $c3, $a0, $3c, $c5, $e5, $21, $e0, $ff        ;; 01:5b03 ????????
    db   $19, $0e, $08, $c5, $0e, $02, $1a, $e6        ;; 01:5b0b ????????
    db   $55, $47, $2a, $e6, $aa, $b0, $12, $13        ;; 01:5b13 ????????
    db   $0d, $20, $f3, $c1, $23, $23, $13, $13        ;; 01:5b1b ????????
    db   $0d, $20, $e8, $18, $20, $c5, $e5, $21        ;; 01:5b23 ????????
    db   $e0, $ff, $19, $0e, $08, $c5, $0e, $02        ;; 01:5b2b ????????
    db   $1a, $e6, $aa, $47, $2a, $e6, $55, $b0        ;; 01:5b33 ????????
    db   $12, $13, $0d, $20, $f3, $c1, $23, $23        ;; 01:5b3b ????????
    db   $13, $13, $0d, $20, $e8, $e1, $d1, $c3        ;; 01:5b43 ????????
    db   $5f, $01, $3e, $00, $e0, $45, $ea, $23        ;; 01:5b4b ????????
    db   $ca, $ea, $22, $ca, $ea, $25, $ca, $3e        ;; 01:5b53 ????????
    db   $02, $ea, $24, $ca, $3e, $01, $cd, $6d        ;; 01:5b5b ????????
    db   $3a, $f3, $21, $e4, $11, $cd, $46, $3d        ;; 01:5b63 ????????
    db   $fb, $cd, $97, $5c, $cd, $85, $5c, $3e        ;; 01:5b6b ????????
    db   $01, $cd, $6d, $3a, $f3, $21, $a2, $11        ;; 01:5b73 ????????
    db   $cd, $46, $3d, $fb, $fa, $f0, $c6, $f5        ;; 01:5b7b ????????
    db   $01, $00, $02, $cd, $cf, $5b, $01, $01        ;; 01:5b83 ????????
    db   $03, $cd, $cf, $5b, $01, $02, $0b, $cd        ;; 01:5b8b ????????
    db   $cf, $5b, $01, $01, $03, $cd, $cf, $5b        ;; 01:5b93 ????????
    db   $01, $00, $02, $cd, $cf, $5b, $f1, $ea        ;; 01:5b9b ????????
    db   $f0, $c6, $cd, $65, $01, $3e, $00, $e0        ;; 01:5ba3 ????????
    db   $45, $ea, $25, $ca, $3e, $01, $cd, $6d        ;; 01:5bab ????????
    db   $3a, $f3, $21, $e4, $11, $cd, $46, $3d        ;; 01:5bb3 ????????
    db   $fb, $cd, $85, $5c, $3e, $01, $cd, $6d        ;; 01:5bbb ????????
    db   $3a, $f3, $21, $a2, $11, $cd, $46, $3d        ;; 01:5bc3 ????????
    db   $fb, $c3, $b8, $5c, $78, $ea, $25, $ca        ;; 01:5bcb ????????
    db   $79, $ea, $f0, $c6, $cd, $65, $01, $cd        ;; 01:5bd3 ????????
    db   $f9, $43, $20, $0f, $fa, $25, $ca, $3d        ;; 01:5bdb ????????
    db   $ea, $25, $ca, $a7, $c8, $cd, $d7, $01        ;; 01:5be3 ????????
    db   $cd, $02, $5c, $cd, $24, $4f, $cd, $6b        ;; 01:5beb ????????
    db   $3a, $cd, $24, $3a, $af, $e0, $97, $cd        ;; 01:5bf3 ????????
    db   $a9, $53, $cd, $1e, $54, $18, $d8             ;; 01:5bfb ???????

call_01_5c02:
    xor  A, A                                          ;; 01:5c02 $af
    ld   [wC6EE], A                                    ;; 01:5c03 $ea $ee $c6
    ld   A, $10                                        ;; 01:5c06 $3e $10
    ld   [wC6EF], A                                    ;; 01:5c08 $ea $ef $c6
    call call_00_01d7                                  ;; 01:5c0b $cd $d7 $01
    call call_00_3c36                                  ;; 01:5c0e $cd $36 $3c
    ld   A, [HL]                                       ;; 01:5c11 $7e
    sub  A, $10                                        ;; 01:5c12 $d6 $10
    ld   [HL+], A                                      ;; 01:5c14 $22
    ld   E, L                                          ;; 01:5c15 $5d
    ld   D, H                                          ;; 01:5c16 $54
    ld   HL, wCA04                                     ;; 01:5c17 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:5c1a $1a
    sbc  A, $00                                        ;; 01:5c1b $de $00
    and  A, [HL]                                       ;; 01:5c1d $a6
    ld   [DE], A                                       ;; 01:5c1e $12
    jp   call_01_44e9                                  ;; 01:5c1f $c3 $e9 $44

call_01_5c22:
    ld   A, $80                                        ;; 01:5c22 $3e $80
    ld   [wC6EE], A                                    ;; 01:5c24 $ea $ee $c6
    ld   A, $10                                        ;; 01:5c27 $3e $10
    ld   [wC6EF], A                                    ;; 01:5c29 $ea $ef $c6
    call call_00_01d7                                  ;; 01:5c2c $cd $d7 $01
    call call_00_3c36                                  ;; 01:5c2f $cd $36 $3c
    ld   A, [HL]                                       ;; 01:5c32 $7e
    add  A, $10                                        ;; 01:5c33 $c6 $10
    ld   [HL+], A                                      ;; 01:5c35 $22
    ld   E, L                                          ;; 01:5c36 $5d
    ld   D, H                                          ;; 01:5c37 $54
    ld   HL, wCA04                                     ;; 01:5c38 $21 $04 $ca
    ld   A, [DE]                                       ;; 01:5c3b $1a
    adc  A, $00                                        ;; 01:5c3c $ce $00
    and  A, [HL]                                       ;; 01:5c3e $a6
    ld   [DE], A                                       ;; 01:5c3f $12
    jp   call_01_445f                                  ;; 01:5c40 $c3 $5f $44

call_01_5c43:
    ld   A, $40                                        ;; 01:5c43 $3e $40
    ld   [wC6EE], A                                    ;; 01:5c45 $ea $ee $c6
    ld   A, $10                                        ;; 01:5c48 $3e $10
    ld   [wC6EF], A                                    ;; 01:5c4a $ea $ef $c6
    call call_00_01d7                                  ;; 01:5c4d $cd $d7 $01
    call call_00_3c3f                                  ;; 01:5c50 $cd $3f $3c
    ld   A, [HL]                                       ;; 01:5c53 $7e
    add  A, $10                                        ;; 01:5c54 $c6 $10
    ld   [HL+], A                                      ;; 01:5c56 $22
    ld   E, L                                          ;; 01:5c57 $5d
    ld   D, H                                          ;; 01:5c58 $54
    ld   HL, wCA05                                     ;; 01:5c59 $21 $05 $ca
    ld   A, [DE]                                       ;; 01:5c5c $1a
    adc  A, $00                                        ;; 01:5c5d $ce $00
    and  A, [HL]                                       ;; 01:5c5f $a6
    ld   [DE], A                                       ;; 01:5c60 $12
    jp   call_01_4562                                  ;; 01:5c61 $c3 $62 $45

call_01_5c64:
    ld   A, $c0                                        ;; 01:5c64 $3e $c0
    ld   [wC6EE], A                                    ;; 01:5c66 $ea $ee $c6
    ld   A, $10                                        ;; 01:5c69 $3e $10
    ld   [wC6EF], A                                    ;; 01:5c6b $ea $ef $c6
    call call_00_01d7                                  ;; 01:5c6e $cd $d7 $01
    call call_00_3c3f                                  ;; 01:5c71 $cd $3f $3c
    ld   A, [HL]                                       ;; 01:5c74 $7e
    sub  A, $10                                        ;; 01:5c75 $d6 $10
    ld   [HL+], A                                      ;; 01:5c77 $22
    ld   E, L                                          ;; 01:5c78 $5d
    ld   D, H                                          ;; 01:5c79 $54
    ld   HL, wCA05                                     ;; 01:5c7a $21 $05 $ca
    ld   A, [DE]                                       ;; 01:5c7d $1a
    sbc  A, $00                                        ;; 01:5c7e $de $00
    and  A, [HL]                                       ;; 01:5c80 $a6
    ld   [DE], A                                       ;; 01:5c81 $12
    jp   call_01_45db                                  ;; 01:5c82 $c3 $db $45
    db   $cd, $6b, $3a, $fa, $25, $ca, $a7, $28        ;; 01:5c85 ????????
    db   $f7, $fa, $24, $ca, $2f, $3c, $ea, $24        ;; 01:5c8d ????????
    db   $ca, $c9, $f3, $fa, $bd, $c0, $ea, $1f        ;; 01:5c95 ????????
    db   $ca, $fa, $be, $c0, $ea, $20, $ca, $f0        ;; 01:5c9d ????????
    db   $41, $e6, $f8, $ea, $21, $ca, $f0, $41        ;; 01:5ca5 ????????
    db   $cb, $df, $e0, $41, $21, $1d, $12, $cd        ;; 01:5cad ????????
    db   $5a, $3d, $d9, $f3, $fa, $1f, $ca, $ea        ;; 01:5cb5 ????????
    db   $bd, $c0, $fa, $20, $ca, $ea, $be, $c0        ;; 01:5cbd ????????
    db   $fa, $21, $ca, $e6, $f0, $47, $f0, $41        ;; 01:5cc5 ????????
    db   $b0, $cb, $9f, $e0, $41, $d9                  ;; 01:5ccd ??????

call_01_5cd3:
    ld   A, [wC300]                                    ;; 01:5cd3 $fa $00 $c3
    and  A, $40                                        ;; 01:5cd6 $e6 $40
    ld   HL, wCA12                                     ;; 01:5cd8 $21 $12 $ca
    cp   A, [HL]                                       ;; 01:5cdb $be
    ret  Z                                             ;; 01:5cdc $c8
    call call_00_1d9e                                  ;; 01:5cdd $cd $9e $1d
    ld   A, [wCA12]                                    ;; 01:5ce0 $fa $12 $ca
    xor  A, $40                                        ;; 01:5ce3 $ee $40
    ld   [wCA12], A                                    ;; 01:5ce5 $ea $12 $ca
    ld   A, $01                                        ;; 01:5ce8 $3e $01
    ld   [wCA2E], A                                    ;; 01:5cea $ea $2e $ca
    ld   A, $04                                        ;; 01:5ced $3e $04
    ld   [wCA2A], A                                    ;; 01:5cef $ea $2a $ca
    call call_00_0e34                                  ;; 01:5cf2 $cd $34 $0e
    call call_01_5e14                                  ;; 01:5cf5 $cd $14 $5e
    call call_01_5d66                                  ;; 01:5cf8 $cd $66 $5d
    ld   A, $04                                        ;; 01:5cfb $3e $04
    ld   [wCA2A], A                                    ;; 01:5cfd $ea $2a $ca
    call call_00_0e34                                  ;; 01:5d00 $cd $34 $0e
    call call_01_5d0c                                  ;; 01:5d03 $cd $0c $5d
    call call_01_5e56                                  ;; 01:5d06 $cd $56 $5e
    jp   call_00_1dfd                                  ;; 01:5d09 $c3 $fd $1d

call_01_5d0c:
    ld   A, $1b                                        ;; 01:5d0c $3e $1b
    ld   [wC800], A                                    ;; 01:5d0e $ea $00 $c8
    xor  A, A                                          ;; 01:5d11 $af
    ld   [wC801], A                                    ;; 01:5d12 $ea $01 $c8
    ld   [wC804], A                                    ;; 01:5d15 $ea $04 $c8
    ld   A, $e0                                        ;; 01:5d18 $3e $e0
    ld   [wC802], A                                    ;; 01:5d1a $ea $02 $c8
    ld   A, $c0                                        ;; 01:5d1d $3e $c0
    ld   [wC803], A                                    ;; 01:5d1f $ea $03 $c8
.jr_01_5d22:
    call call_01_5de7                                  ;; 01:5d22 $cd $e7 $5d
    call Z, call_01_5d4b                               ;; 01:5d25 $cc $4b $5d
    ld   A, [wC804]                                    ;; 01:5d28 $fa $04 $c8
    and  A, $03                                        ;; 01:5d2b $e6 $03
    ld   HL, .data_01_5d3c                             ;; 01:5d2d $21 $3c $5d
    push HL                                            ;; 01:5d30 $e5
    call doJumptable                                   ;; 01:5d31 $cd $3a $37
;@jumptable amount=4
    dw   call_01_5dc3                                  ;; 01:5d34 pP $00
    dw   call_01_5dde                                  ;; 01:5d36 pP $01
    dw   call_01_5dd5                                  ;; 01:5d38 pP $02
    dw   call_01_5dcc                                  ;; 01:5d3a pP $03
.data_01_5d3c:
    ld   A, [wC801]                                    ;; 01:5d3c $fa $01 $c8
    add  A, $01                                        ;; 01:5d3f $c6 $01
    ld   [wC801], A                                    ;; 01:5d41 $ea $01 $c8
    ld   A, [wC800]                                    ;; 01:5d44 $fa $00 $c8
    and  A, A                                          ;; 01:5d47 $a7
    jr   NZ, .jr_01_5d22                               ;; 01:5d48 $20 $d8
    ret                                                ;; 01:5d4a $c9

call_01_5d4b:
    call call_00_3a6b                                  ;; 01:5d4b $cd $6b $3a
    xor  A, A                                          ;; 01:5d4e $af
    ld   [wC801], A                                    ;; 01:5d4f $ea $01 $c8
    ld   A, [wC804]                                    ;; 01:5d52 $fa $04 $c8
    add  A, $01                                        ;; 01:5d55 $c6 $01
    ld   [wC804], A                                    ;; 01:5d57 $ea $04 $c8
    and  A, $01                                        ;; 01:5d5a $e6 $01
    ret  Z                                             ;; 01:5d5c $c8
    ld   A, [wC800]                                    ;; 01:5d5d $fa $00 $c8
    sub  A, $01                                        ;; 01:5d60 $d6 $01
    ld   [wC800], A                                    ;; 01:5d62 $ea $00 $c8
    ret                                                ;; 01:5d65 $c9

call_01_5d66:
    ld   A, $01                                        ;; 01:5d66 $3e $01
    ld   [wC800], A                                    ;; 01:5d68 $ea $00 $c8
    xor  A, A                                          ;; 01:5d6b $af
    ld   [wC801], A                                    ;; 01:5d6c $ea $01 $c8
    ld   [wC804], A                                    ;; 01:5d6f $ea $04 $c8
    ld   A, $50                                        ;; 01:5d72 $3e $50
    ld   [wC802], A                                    ;; 01:5d74 $ea $02 $c8
    ld   [wC803], A                                    ;; 01:5d77 $ea $03 $c8
.jr_01_5d7a:
    call call_01_5de7                                  ;; 01:5d7a $cd $e7 $5d
    call Z, call_01_5da1                               ;; 01:5d7d $cc $a1 $5d
    ld   A, [wC804]                                    ;; 01:5d80 $fa $04 $c8
    and  A, $03                                        ;; 01:5d83 $e6 $03
    ld   HL, .data_01_5d94                             ;; 01:5d85 $21 $94 $5d
    push HL                                            ;; 01:5d88 $e5
    call doJumptable                                   ;; 01:5d89 $cd $3a $37
;@jumptable amount=4
    dw   call_01_5dc3                                  ;; 01:5d8c pP $00
    dw   call_01_5dcc                                  ;; 01:5d8e pP $01
    dw   call_01_5dd5                                  ;; 01:5d90 pP $02
    dw   call_01_5dde                                  ;; 01:5d92 pP $03
.data_01_5d94:
    ld   A, [wC801]                                    ;; 01:5d94 $fa $01 $c8
    add  A, $01                                        ;; 01:5d97 $c6 $01
    ld   [wC801], A                                    ;; 01:5d99 $ea $01 $c8
    cp   A, $20                                        ;; 01:5d9c $fe $20
    jr   NZ, .jr_01_5d7a                               ;; 01:5d9e $20 $da
    ret                                                ;; 01:5da0 $c9

call_01_5da1:
    ld   A, [wC800]                                    ;; 01:5da1 $fa $00 $c8
    cp   A, $10                                        ;; 01:5da4 $fe $10
    jr   NC, .jr_01_5dab                               ;; 01:5da6 $30 $03
    call call_00_3a6b                                  ;; 01:5da8 $cd $6b $3a
.jr_01_5dab:
    xor  A, A                                          ;; 01:5dab $af
    ld   [wC801], A                                    ;; 01:5dac $ea $01 $c8
    ld   A, [wC804]                                    ;; 01:5daf $fa $04 $c8
    add  A, $01                                        ;; 01:5db2 $c6 $01
    ld   [wC804], A                                    ;; 01:5db4 $ea $04 $c8
    and  A, $01                                        ;; 01:5db7 $e6 $01
    ret  NZ                                            ;; 01:5db9 $c0
    ld   A, [wC800]                                    ;; 01:5dba $fa $00 $c8
    add  A, $01                                        ;; 01:5dbd $c6 $01
    ld   [wC800], A                                    ;; 01:5dbf $ea $00 $c8
    ret                                                ;; 01:5dc2 $c9

call_01_5dc3:
    ld   A, [wC802]                                    ;; 01:5dc3 $fa $02 $c8
    add  A, $08                                        ;; 01:5dc6 $c6 $08
    ld   [wC802], A                                    ;; 01:5dc8 $ea $02 $c8
    ret                                                ;; 01:5dcb $c9

call_01_5dcc:
    ld   A, [wC803]                                    ;; 01:5dcc $fa $03 $c8
    add  A, $08                                        ;; 01:5dcf $c6 $08
    ld   [wC803], A                                    ;; 01:5dd1 $ea $03 $c8
    ret                                                ;; 01:5dd4 $c9

call_01_5dd5:
    ld   A, [wC802]                                    ;; 01:5dd5 $fa $02 $c8
    sub  A, $08                                        ;; 01:5dd8 $d6 $08
    ld   [wC802], A                                    ;; 01:5dda $ea $02 $c8
    ret                                                ;; 01:5ddd $c9

call_01_5dde:
    ld   A, [wC803]                                    ;; 01:5dde $fa $03 $c8
    sub  A, $08                                        ;; 01:5de1 $d6 $08
    ld   [wC803], A                                    ;; 01:5de3 $ea $03 $c8
    ret                                                ;; 01:5de6 $c9

call_01_5de7:
    ld   A, [wC803]                                    ;; 01:5de7 $fa $03 $c8
    ld   B, A                                          ;; 01:5dea $47
    ld   A, [wC802]                                    ;; 01:5deb $fa $02 $c8
    ld   C, A                                          ;; 01:5dee $4f
    ld   A, $04                                        ;; 01:5def $3e $04
    ld   [wCA2A], A                                    ;; 01:5df1 $ea $2a $ca
    call call_00_0de4                                  ;; 01:5df4 $cd $e4 $0d
    push HL                                            ;; 01:5df7 $e5
    xor  A, A                                          ;; 01:5df8 $af
    ld   [wCA2A], A                                    ;; 01:5df9 $ea $2a $ca
    call call_00_0de4                                  ;; 01:5dfc $cd $e4 $0d
    pop  DE                                            ;; 01:5dff $d1
.jr_01_5e00:
    ldh  A, [rSTAT]                                    ;; 01:5e00 $f0 $41
    and  A, $03                                        ;; 01:5e02 $e6 $03
    jr   Z, .jr_01_5e00                                ;; 01:5e04 $28 $fa
    call call_00_3a78                                  ;; 01:5e06 $cd $78 $3a
    ld   A, [DE]                                       ;; 01:5e09 $1a
    ld   [HL], A                                       ;; 01:5e0a $77
    ld   A, [wC800]                                    ;; 01:5e0b $fa $00 $c8
    ld   B, A                                          ;; 01:5e0e $47
    ld   A, [wC801]                                    ;; 01:5e0f $fa $01 $c8
    cp   A, B                                          ;; 01:5e12 $b8
    ret                                                ;; 01:5e13 $c9

call_01_5e14:
    call call_00_3a24                                  ;; 01:5e14 $cd $24 $3a
    xor  A, A                                          ;; 01:5e17 $af
    ldh  [hFF97], A                                    ;; 01:5e18 $e0 $97
    ld   A, $00                                        ;; 01:5e1a $3e $00
    ldh  [hFF96], A                                    ;; 01:5e1c $e0 $96
    call call_00_3c60                                  ;; 01:5e1e $cd $60 $3c
    ld   A, [HL]                                       ;; 01:5e21 $7e
    and  A, $40                                        ;; 01:5e22 $e6 $40
    ld   HL, wCA12                                     ;; 01:5e24 $21 $12 $ca
    cp   A, [HL]                                       ;; 01:5e27 $be
    jr   Z, .jr_01_5e35                                ;; 01:5e28 $28 $0b
    call call_00_3c1d                                  ;; 01:5e2a $cd $1d $3c
    ld   A, [HL]                                       ;; 01:5e2d $7e
    and  A, $f9                                        ;; 01:5e2e $e6 $f9
    or   A, $06                                        ;; 01:5e30 $f6 $06
    ld   [HL], A                                       ;; 01:5e32 $77
    jr   .jr_01_5e4a                                   ;; 01:5e33 $18 $15
.jr_01_5e35:
    call call_00_3c58                                  ;; 01:5e35 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:5e38 $7e
    and  A, $30                                        ;; 01:5e39 $e6 $30
    srl  A                                             ;; 01:5e3b $cb $3f
    srl  A                                             ;; 01:5e3d $cb $3f
    srl  A                                             ;; 01:5e3f $cb $3f
    ld   C, A                                          ;; 01:5e41 $4f
    call call_00_3c1d                                  ;; 01:5e42 $cd $1d $3c
    ld   A, [HL]                                       ;; 01:5e45 $7e
    and  A, $f1                                        ;; 01:5e46 $e6 $f1
    or   A, C                                          ;; 01:5e48 $b1
    ld   [HL], A                                       ;; 01:5e49 $77
.jr_01_5e4a:
    call call_00_3c90                                  ;; 01:5e4a $cd $90 $3c
    ld   A, [HL]                                       ;; 01:5e4d $7e
    and  A, $04                                        ;; 01:5e4e $e6 $04
    jp   NZ, call_00_3a7f                              ;; 01:5e50 $c2 $7f $3a
    jp   call_00_3b3f                                  ;; 01:5e53 $c3 $3f $3b

call_01_5e56:
    call call_00_3a24                                  ;; 01:5e56 $cd $24 $3a
    xor  A, A                                          ;; 01:5e59 $af
    ldh  [hFF97], A                                    ;; 01:5e5a $e0 $97
    xor  A, A                                          ;; 01:5e5c $af
    ldh  [hFF96], A                                    ;; 01:5e5d $e0 $96
.jr_01_5e5f:
    call call_00_3c60                                  ;; 01:5e5f $cd $60 $3c
    ld   A, [HL]                                       ;; 01:5e62 $7e
    and  A, $40                                        ;; 01:5e63 $e6 $40
    ld   HL, wCA12                                     ;; 01:5e65 $21 $12 $ca
    cp   A, [HL]                                       ;; 01:5e68 $be
    jr   Z, .jr_01_5e76                                ;; 01:5e69 $28 $0b
    call call_00_3c1d                                  ;; 01:5e6b $cd $1d $3c
    ld   A, [HL]                                       ;; 01:5e6e $7e
    and  A, $f9                                        ;; 01:5e6f $e6 $f9
    or   A, $06                                        ;; 01:5e71 $f6 $06
    ld   [HL], A                                       ;; 01:5e73 $77
    jr   .jr_01_5e8b                                   ;; 01:5e74 $18 $15
.jr_01_5e76:
    call call_00_3c58                                  ;; 01:5e76 $cd $58 $3c
    ld   A, [HL]                                       ;; 01:5e79 $7e
    and  A, $30                                        ;; 01:5e7a $e6 $30
    srl  A                                             ;; 01:5e7c $cb $3f
    srl  A                                             ;; 01:5e7e $cb $3f
    srl  A                                             ;; 01:5e80 $cb $3f
    ld   C, A                                          ;; 01:5e82 $4f
    call call_00_3c1d                                  ;; 01:5e83 $cd $1d $3c
    ld   A, [HL]                                       ;; 01:5e86 $7e
    and  A, $f1                                        ;; 01:5e87 $e6 $f1
    or   A, C                                          ;; 01:5e89 $b1
    ld   [HL], A                                       ;; 01:5e8a $77
.jr_01_5e8b:
    call call_00_3c90                                  ;; 01:5e8b $cd $90 $3c
    ld   A, [HL]                                       ;; 01:5e8e $7e
    and  A, $04                                        ;; 01:5e8f $e6 $04
    jr   NZ, .jr_01_5e98                               ;; 01:5e91 $20 $05
    call call_00_3b3f                                  ;; 01:5e93 $cd $3f $3b
    jr   .jr_01_5e9b                                   ;; 01:5e96 $18 $03
.jr_01_5e98:
    call call_00_3a7f                                  ;; 01:5e98 $cd $7f $3a
.jr_01_5e9b:
    ldh  A, [hFF96]                                    ;; 01:5e9b $f0 $96
    add  A, $01                                        ;; 01:5e9d $c6 $01
    ldh  [hFF96], A                                    ;; 01:5e9f $e0 $96
    cp   A, $10                                        ;; 01:5ea1 $fe $10
    jr   NZ, .jr_01_5e5f                               ;; 01:5ea3 $20 $ba
    ret                                                ;; 01:5ea5 $c9

call_01_5ea6:
    push AF                                            ;; 01:5ea6 $f5
    ld   A, [wCA12]                                    ;; 01:5ea7 $fa $12 $ca
    and  A, $40                                        ;; 01:5eaa $e6 $40
    jr   Z, .jr_01_5eb3                                ;; 01:5eac $28 $05
    pop  AF                                            ;; 01:5eae $f1
    ret  C                                             ;; 01:5eaf $d8
    ld   E, $00                                        ;; 01:5eb0 $1e $00
    ret                                                ;; 01:5eb2 $c9
.jr_01_5eb3:
    pop  AF                                            ;; 01:5eb3 $f1
    ret  NC                                            ;; 01:5eb4 $d0
    ld   E, $04                                        ;; 01:5eb5 $1e $04
    ret                                                ;; 01:5eb7 $c9

call_01_5eb8:
    call call_01_6013                                  ;; 01:5eb8 $cd $13 $60
    xor  A, A                                          ;; 01:5ebb $af
    ld   HL, wC800                                     ;; 01:5ebc $21 $00 $c8
    ld   B, $48                                        ;; 01:5ebf $06 $48
    call call_00_3934                                  ;; 01:5ec1 $cd $34 $39
    ldh  A, [rSCX]                                     ;; 01:5ec4 $f0 $43
    ld   C, A                                          ;; 01:5ec6 $4f
    ldh  A, [rWX]                                      ;; 01:5ec7 $f0 $4b
    ld   B, A                                          ;; 01:5ec9 $47
    ld   D, $48                                        ;; 01:5eca $16 $48
.jr_01_5ecc:
    ldh  A, [rLY]                                      ;; 01:5ecc $f0 $44
    and  A, A                                          ;; 01:5ece $a7
    jr   NZ, .jr_01_5ecc                               ;; 01:5ecf $20 $fb
.jr_01_5ed1:
    call call_00_3a78                                  ;; 01:5ed1 $cd $78 $3a
    ldh  A, [rLY]                                      ;; 01:5ed4 $f0 $44
    ld   [wC848], A                                    ;; 01:5ed6 $ea $48 $c8
    cp   A, $48                                        ;; 01:5ed9 $fe $48
    jr   C, .jr_01_5ee3                                ;; 01:5edb $38 $06
    sub  A, $48                                        ;; 01:5edd $d6 $48
    ld   E, A                                          ;; 01:5edf $5f
    ld   A, $47                                        ;; 01:5ee0 $3e $47
    sub  A, E                                          ;; 01:5ee2 $93
.jr_01_5ee3:
    ld   HL, wC800                                     ;; 01:5ee3 $21 $00 $c8
    rst  add_hl_a                                      ;; 01:5ee6 $c7
    ld   A, [HL]                                       ;; 01:5ee7 $7e
    add  A, B                                          ;; 01:5ee8 $80
    cp   A, $a6                                        ;; 01:5ee9 $fe $a6
    jr   C, .jr_01_5eef                                ;; 01:5eeb $38 $02
    ld   A, $a5                                        ;; 01:5eed $3e $a5
.jr_01_5eef:
    ldh  [rWX], A                                      ;; 01:5eef $e0 $4b
    ld   A, [HL]                                       ;; 01:5ef1 $7e
    add  A, C                                          ;; 01:5ef2 $81
    ldh  [rSCX], A                                     ;; 01:5ef3 $e0 $43
    ld   A, [wC848]                                    ;; 01:5ef5 $fa $48 $c8
    cp   A, $48                                        ;; 01:5ef8 $fe $48
    jr   NC, .jr_01_5f07                               ;; 01:5efa $30 $0b
    cp   A, D                                          ;; 01:5efc $ba
    jr   C, .jr_01_5f07                                ;; 01:5efd $38 $08
    ld   A, [HL]                                       ;; 01:5eff $7e
    add  A, $04                                        ;; 01:5f00 $c6 $04
    cp   A, $54                                        ;; 01:5f02 $fe $54
    jr   NC, .jr_01_5f07                               ;; 01:5f04 $30 $01
    ld   [HL], A                                       ;; 01:5f06 $77
.jr_01_5f07:
    ldh  A, [rSTAT]                                    ;; 01:5f07 $f0 $41
    and  A, $03                                        ;; 01:5f09 $e6 $03
    cp   A, $01                                        ;; 01:5f0b $fe $01
    jr   NZ, .jr_01_5ed1                               ;; 01:5f0d $20 $c2
    call call_00_3a60                                  ;; 01:5f0f $cd $60 $3a
    ld   A, D                                          ;; 01:5f12 $7a
    and  A, A                                          ;; 01:5f13 $a7
    jr   Z, .jr_01_5f18                                ;; 01:5f14 $28 $02
    sub  A, $04                                        ;; 01:5f16 $d6 $04
.jr_01_5f18:
    ld   D, A                                          ;; 01:5f18 $57
    ld   A, [wC800]                                    ;; 01:5f19 $fa $00 $c8
    cp   A, $50                                        ;; 01:5f1c $fe $50
    jr   C, .jr_01_5ecc                                ;; 01:5f1e $38 $ac
    ld   HL, $9800                                     ;; 01:5f20 $21 $00 $98
    ld   BC, $400                                      ;; 01:5f23 $01 $00 $04
    ld   A, $ff                                        ;; 01:5f26 $3e $ff
    call call_00_218f                                  ;; 01:5f28 $cd $8f $21
    call call_00_3a4b                                  ;; 01:5f2b $cd $4b $3a
    di                                                 ;; 01:5f2e $f3
    call call_00_3d4e                                  ;; 01:5f2f $cd $4e $3d
    call call_00_3d62                                  ;; 01:5f32 $cd $62 $3d
    ei                                                 ;; 01:5f35 $fb
    jp   call_00_3a6b                                  ;; 01:5f36 $c3 $6b $3a

call_01_5f39:
    ldh  A, [rWY]                                      ;; 01:5f39 $f0 $4a
    push AF                                            ;; 01:5f3b $f5
    call call_01_6013                                  ;; 01:5f3c $cd $13 $60
    ld   BC, data_01_4848                              ;; 01:5f3f $01 $48 $48
    ld   D, $50                                        ;; 01:5f42 $16 $50
.jr_01_5f44:
    ldh  A, [rLY]                                      ;; 01:5f44 $f0 $44
    and  A, A                                          ;; 01:5f46 $a7
    jr   NZ, .jr_01_5f44                               ;; 01:5f47 $20 $fb
    ldh  A, [rWX]                                      ;; 01:5f49 $f0 $4b
    add  A, $01                                        ;; 01:5f4b $c6 $01
    cp   A, $a6                                        ;; 01:5f4d $fe $a6
    jr   C, .jr_01_5f53                                ;; 01:5f4f $38 $02
    ld   A, $a5                                        ;; 01:5f51 $3e $a5
.jr_01_5f53:
    ldh  [rWX], A                                      ;; 01:5f53 $e0 $4b
    ldh  A, [rSCX]                                     ;; 01:5f55 $f0 $43
    add  A, $01                                        ;; 01:5f57 $c6 $01
    ldh  [rSCX], A                                     ;; 01:5f59 $e0 $43
    dec  D                                             ;; 01:5f5b $15
    xor  A, A                                          ;; 01:5f5c $af
    cp   A, B                                          ;; 01:5f5d $b8
    jr   Z, .jr_01_5f62                                ;; 01:5f5e $28 $02
    dec  B                                             ;; 01:5f60 $05
    inc  C                                             ;; 01:5f61 $0c
.jr_01_5f62:
    ldh  A, [rLY]                                      ;; 01:5f62 $f0 $44
    cp   A, B                                          ;; 01:5f64 $b8
    jr   NZ, .jr_01_5f62                               ;; 01:5f65 $20 $fb
    call call_00_3a4b                                  ;; 01:5f67 $cd $4b $3a
    xor  A, A                                          ;; 01:5f6a $af
    ldh  [rBGP], A                                     ;; 01:5f6b $e0 $47
    ldh  [rOBP0], A                                    ;; 01:5f6d $e0 $48
    ldh  [rOBP1], A                                    ;; 01:5f6f $e0 $49
    call call_00_3a59                                  ;; 01:5f71 $cd $59 $3a
.jr_01_5f74:
    ldh  A, [rLY]                                      ;; 01:5f74 $f0 $44
    cp   A, C                                          ;; 01:5f76 $b9
    jr   NZ, .jr_01_5f74                               ;; 01:5f77 $20 $fb
    call call_00_3a44                                  ;; 01:5f79 $cd $44 $3a
    call call_00_3a52                                  ;; 01:5f7c $cd $52 $3a
    ld   A, [wCDB4]                                    ;; 01:5f7f $fa $b4 $cd
    ldh  [rBGP], A                                     ;; 01:5f82 $e0 $47
    call call_00_3a60                                  ;; 01:5f84 $cd $60 $3a
    xor  A, A                                          ;; 01:5f87 $af
    cp   A, D                                          ;; 01:5f88 $ba
    jr   NZ, .jr_01_5f44                               ;; 01:5f89 $20 $b9
    call call_00_3a4b                                  ;; 01:5f8b $cd $4b $3a
    xor  A, A                                          ;; 01:5f8e $af
    ldh  [rBGP], A                                     ;; 01:5f8f $e0 $47
    call call_00_3d4e                                  ;; 01:5f91 $cd $4e $3d
    call call_00_3d62                                  ;; 01:5f94 $cd $62 $3d
    pop  AF                                            ;; 01:5f97 $f1
    ldh  [rWY], A                                      ;; 01:5f98 $e0 $4a
    jp   call_00_3a6b                                  ;; 01:5f9a $c3 $6b $3a
    db   $f0, $4a, $f5, $cd, $13, $60, $3e, $a2        ;; 01:5f9d ????????
    db   $e0, $4b, $f0, $91, $c6, $54, $e0, $43        ;; 01:5fa5 ????????
    db   $01, $8f, $00, $16, $4c, $f0, $44, $a7        ;; 01:5fad ????????
    db   $20, $fb, $f0, $4b, $d6, $01, $e0, $4b        ;; 01:5fb5 ????????
    db   $f0, $43, $d6, $01, $e0, $43, $15, $3e        ;; 01:5fbd ????????
    db   $44, $ba, $38, $02, $04, $0d, $f0, $44        ;; 01:5fc5 ????????
    db   $b8, $20, $fb, $3e, $46, $b8, $28, $2a        ;; 01:5fcd ????????
    db   $cd, $4b, $3a, $af, $e0, $47, $cd, $59        ;; 01:5fd5 ????????
    db   $3a, $f0, $44, $b9, $20, $fb, $cd, $44        ;; 01:5fdd ????????
    db   $3a, $cd, $52, $3a, $fa, $b4, $cd, $e0        ;; 01:5fe5 ????????
    db   $47, $fa, $b5, $cd, $e0, $48, $fa, $b6        ;; 01:5fed ????????
    db   $cd, $e0, $49, $cd, $60, $3a, $af, $ba        ;; 01:5ff5 ????????
    db   $20, $b3, $cd, $4e, $3d, $cd, $62, $3d        ;; 01:5ffd ????????
    db   $cd, $34, $0e, $f1, $e0, $4a, $cd, $4b        ;; 01:6005 ????????
    db   $3a, $3e, $07, $e0, $4b, $c9                  ;; 01:600d ??????

call_01_6013:
    call call_00_3a24                                  ;; 01:6013 $cd $24 $3a
    di                                                 ;; 01:6016 $f3
    call call_00_3d54                                  ;; 01:6017 $cd $54 $3d
    call call_00_3d68                                  ;; 01:601a $cd $68 $3d
    ei                                                 ;; 01:601d $fb
    ldh  A, [hFF92]                                    ;; 01:601e $f0 $92
    push AF                                            ;; 01:6020 $f5
    ldh  A, [hFF91]                                    ;; 01:6021 $f0 $91
    push AF                                            ;; 01:6023 $f5
    ld   A, $f0                                        ;; 01:6024 $3e $f0
    ldh  [hFF92], A                                    ;; 01:6026 $e0 $92
    ld   A, $a8                                        ;; 01:6028 $3e $a8
    ldh  [hFF91], A                                    ;; 01:602a $e0 $91
    ld   A, $04                                        ;; 01:602c $3e $04
    ld   [wCA2A], A                                    ;; 01:602e $ea $2a $ca
    call call_00_0e34                                  ;; 01:6031 $cd $34 $0e
    ld   A, $57                                        ;; 01:6034 $3e $57
    ldh  [rWX], A                                      ;; 01:6036 $e0 $4b
    xor  A, A                                          ;; 01:6038 $af
    ldh  [rWY], A                                      ;; 01:6039 $e0 $4a
    call call_00_3a44                                  ;; 01:603b $cd $44 $3a
    pop  AF                                            ;; 01:603e $f1
    ldh  [hFF91], A                                    ;; 01:603f $e0 $91
    pop  AF                                            ;; 01:6041 $f1
    ldh  [hFF92], A                                    ;; 01:6042 $e0 $92
    ld   A, $f8                                        ;; 01:6044 $3e $f8
    ld   [wC800], A                                    ;; 01:6046 $ea $00 $c8
    ld   A, $58                                        ;; 01:6049 $3e $58
    ld   [wC801], A                                    ;; 01:604b $ea $01 $c8
.jr_01_604e:
    ld   A, [wC800]                                    ;; 01:604e $fa $00 $c8
    ld   B, A                                          ;; 01:6051 $47
    ld   A, [wC801]                                    ;; 01:6052 $fa $01 $c8
    ld   C, A                                          ;; 01:6055 $4f
    call call_00_0de4                                  ;; 01:6056 $cd $e4 $0d
    ld   B, $16                                        ;; 01:6059 $06 $16
.jr_01_605b:
    ldh  A, [rSTAT]                                    ;; 01:605b $f0 $41
    and  A, $03                                        ;; 01:605d $e6 $03
    jr   Z, .jr_01_605b                                ;; 01:605f $28 $fa
    call call_00_3a78                                  ;; 01:6061 $cd $78 $3a
    ld   A, $ff                                        ;; 01:6064 $3e $ff
    ld   [HL], A                                       ;; 01:6066 $77
    ld   A, L                                          ;; 01:6067 $7d
    and  A, $e0                                        ;; 01:6068 $e6 $e0
    ld   C, A                                          ;; 01:606a $4f
    ld   A, L                                          ;; 01:606b $7d
    add  A, $01                                        ;; 01:606c $c6 $01
    and  A, $1f                                        ;; 01:606e $e6 $1f
    or   A, C                                          ;; 01:6070 $b1
    ld   L, A                                          ;; 01:6071 $6f
    dec  B                                             ;; 01:6072 $05
    jr   NZ, .jr_01_605b                               ;; 01:6073 $20 $e6
    ld   A, [wC800]                                    ;; 01:6075 $fa $00 $c8
    add  A, $08                                        ;; 01:6078 $c6 $08
    ld   [wC800], A                                    ;; 01:607a $ea $00 $c8
    cp   A, $f8                                        ;; 01:607d $fe $f8
    jr   NZ, .jr_01_604e                               ;; 01:607f $20 $cd
    ret                                                ;; 01:6081 $c9

call_01_6082:
    call call_01_418a                                  ;; 01:6082 $cd $8a $41
    ret  NZ                                            ;; 01:6085 $c0
    ld   HL, data_01_7b90                              ;; 01:6086 $21 $90 $7b
    ld   DE, $9600                                     ;; 01:6089 $11 $00 $96
    ld   BC, $20                                       ;; 01:608c $01 $20 $00
    rst  rst_00_0018                                   ;; 01:608f $df
    db   $51                                           ;; 01:6090 .
    ret                                                ;; 01:6091 $c9

call_01_6092:
    ld   A, [wC6E8]                                    ;; 01:6092 $fa $e8 $c6
    cp   A, $b4                                        ;; 01:6095 $fe $b4
    ret  NZ                                            ;; 01:6097 $c0
    ld   HL, data_01_7e80                              ;; 01:6098 $21 $80 $7e
    ld   DE, $9630                                     ;; 01:609b $11 $30 $96
    call call_01_60ef                                  ;; 01:609e $cd $ef $60
    ld   HL, data_01_7ea0                              ;; 01:60a1 $21 $a0 $7e
    ld   DE, $94e0                                     ;; 01:60a4 $11 $e0 $94
    call call_01_60ef                                  ;; 01:60a7 $cd $ef $60
    ld   HL, data_01_7f80                              ;; 01:60aa $21 $80 $7f
    ld   DE, $9730                                     ;; 01:60ad $11 $30 $97
    call call_01_60ef                                  ;; 01:60b0 $cd $ef $60
    ld   HL, data_01_7fa0                              ;; 01:60b3 $21 $a0 $7f
    ld   DE, $95e0                                     ;; 01:60b6 $11 $e0 $95
    call call_01_60ef                                  ;; 01:60b9 $cd $ef $60
    ld   HL, data_01_7ec0                              ;; 01:60bc $21 $c0 $7e
    ld   DE, $90a0                                     ;; 01:60bf $11 $a0 $90
    call call_01_60ef                                  ;; 01:60c2 $cd $ef $60
    ld   HL, data_01_7ee0                              ;; 01:60c5 $21 $e0 $7e
    ld   DE, $90e0                                     ;; 01:60c8 $11 $e0 $90
    call call_01_60ef                                  ;; 01:60cb $cd $ef $60
    ld   HL, data_01_7fc0                              ;; 01:60ce $21 $c0 $7f
    ld   DE, $91a0                                     ;; 01:60d1 $11 $a0 $91
    call call_01_60ef                                  ;; 01:60d4 $cd $ef $60
    ld   HL, data_01_7fe0                              ;; 01:60d7 $21 $e0 $7f
    ld   DE, $91e0                                     ;; 01:60da $11 $e0 $91
    call call_01_60ef                                  ;; 01:60dd $cd $ef $60
    ld   HL, $4480                                     ;; 01:60e0 $21 $80 $44
    ld   DE, $96d0                                     ;; 01:60e3 $11 $d0 $96
    call call_01_60ef                                  ;; 01:60e6 $cd $ef $60
    ld   HL, $4580                                     ;; 01:60e9 $21 $80 $45
    ld   DE, $97d0                                     ;; 01:60ec $11 $d0 $97

call_01_60ef:
    ld   BC, $20                                       ;; 01:60ef $01 $20 $00
    rst  rst_00_0018                                   ;; 01:60f2 $df
    db   $51                                           ;; 01:60f3 ?
    ret                                                ;; 01:60f4 $c9

call_01_60f5:
    ld   DE, wC800                                     ;; 01:60f5 $11 $00 $c8
    jp   call_00_0159                                  ;; 01:60f8 $c3 $59 $01

call_01_60fb:
    ld   HL, wC800                                     ;; 01:60fb $21 $00 $c8
    jp   call_00_0159                                  ;; 01:60fe $c3 $59 $01

call_01_6101:
    ld   DE, wC800                                     ;; 01:6101 $11 $00 $c8
    jp   call_00_015f                                  ;; 01:6104 $c3 $5f $01

call_01_6107:
    ld   HL, wC800                                     ;; 01:6107 $21 $00 $c8
    jp   call_00_015f                                  ;; 01:610a $c3 $5f $01

call_01_610d:
    ld   B, $dc                                        ;; 01:610d $06 $dc
.jr_01_610f:
    dec  B                                             ;; 01:610f $05
    ld   A, B                                          ;; 01:6110 $78
    push BC                                            ;; 01:6111 $c5
    call call_00_2901                                  ;; 01:6112 $cd $01 $29
    pop  BC                                            ;; 01:6115 $c1
    jr   Z, .jr_01_610f                                ;; 01:6116 $28 $f7
    ld   A, B                                          ;; 01:6118 $78
    ld   [wC6FB], A                                    ;; 01:6119 $ea $fb $c6
    ret                                                ;; 01:611c $c9
    db   $be, $e0, $e3, $e7, $ec, $06, $0b, $00        ;; 01:611d ????????
    db   $3e, $2d, $e0, $bc, $f0, $47, $f5, $06        ;; 01:6125 ????????
    db   $80, $fa, $93, $ff, $e6, $07, $20, $06        ;; 01:612d ????????
    db   $f0, $47, $ee, $ff, $e0, $47, $cd, $6b        ;; 01:6135 ????????
    db   $3a, $05, $20, $ed, $f1, $e0, $47, $c9        ;; 01:613d ????????
    db   $21, $40, $62, $18, $30, $21, $4b, $62        ;; 01:6145 ????????
    db   $18, $2b, $21, $54, $62, $18, $26, $21        ;; 01:614d ????????
    db   $6b, $62, $18, $21, $cd, $f3, $39, $3e        ;; 01:6155 ????????
    db   $10, $cd, $6d, $3a, $cd, $0c, $3a, $21        ;; 01:615d ????????
    db   $8b, $62, $18, $11, $21, $c3, $62, $cd        ;; 01:6165 ????????
    db   $7a, $61, $cd, $f3, $39, $3e, $20, $cd        ;; 01:616d ????????
    db   $6d, $3a, $c3, $0c, $3a, $af, $ea, $60        ;; 01:6175 ????????
    db   $ca, $af, $ea, $61, $ca, $11, $62, $ca        ;; 01:617d ????????
    db   $cd, $7e, $1f, $cd, $2d, $1b, $3e, $01        ;; 01:6185 ????????
    db   $ea, $f2, $c6, $cd, $6b, $3a, $cd, $a0        ;; 01:618d ????????
    db   $54, $cd, $66, $4f, $cd, $a0, $01, $fa        ;; 01:6195 ????????
    db   $93, $ff, $e6, $0f, $20, $1c, $fa, $64        ;; 01:619d ????????
    db   $ca, $6f, $fa, $65, $ca, $67, $fa, $60        ;; 01:61a5 ????????
    db   $ca, $c7, $46, $fa, $61, $ca, $b8, $cc        ;; 01:61ad ????????
    db   $d3, $61, $fa, $61, $ca, $c6, $01, $ea        ;; 01:61b5 ????????
    db   $61, $ca, $cd, $6b, $3a, $fa, $61, $ca        ;; 01:61bd ????????
    db   $47, $fa, $63, $ca, $b8, $20, $c7, $af        ;; 01:61c5 ????????
    db   $ea, $f2, $c6, $c3, $50, $1b, $fa, $60        ;; 01:61cd ????????
    db   $ca, $47, $fa, $62, $ca, $b8, $c8, $3e        ;; 01:61d5 ????????
    db   $16, $e0, $bc, $cd, $db, $01, $cd, $03        ;; 01:61dd ????????
    db   $3c, $36, $01, $cd, $70, $3c, $36, $0f        ;; 01:61e5 ????????
    db   $cd, $48, $3c, $36, $00, $cd, $1d, $3c        ;; 01:61ed ????????
    db   $36, $00, $cd, $2e, $3c, $36, $50, $cd        ;; 01:61f5 ????????
    db   $90, $3c, $36, $44, $af, $cd, $72, $52        ;; 01:61fd ????????
    db   $fa, $68, $ca, $6f, $fa, $69, $ca, $67        ;; 01:6205 ????????
    db   $fa, $60, $ca, $c7, $46, $cd, $0b, $3c        ;; 01:620d ????????
    db   $cd, $33, $62, $fa, $66, $ca, $6f, $fa        ;; 01:6215 ????????
    db   $67, $ca, $67, $fa, $60, $ca, $c7, $46        ;; 01:621d ????????
    db   $cd, $14, $3c, $cd, $33, $62, $fa, $60        ;; 01:6225 ????????
    db   $ca, $3c, $ea, $60, $ca, $c9, $78, $cb        ;; 01:622d ????????
    db   $37, $e6, $f0, $22, $78, $cb, $37, $e6        ;; 01:6235 ????????
    db   $0f, $77, $c9, $01, $03, $48, $62, $49        ;; 01:623d ????????
    db   $62, $4a, $62, $00, $36, $07, $01, $03        ;; 01:6245 ????????
    db   $48, $62, $53, $62, $4a, $62, $3a, $05        ;; 01:624d ????????
    db   $0b, $5c, $62, $61, $62, $66, $62, $00        ;; 01:6255 ????????
    db   $02, $04, $06, $08, $1e, $20, $1e, $20        ;; 01:625d ????????
    db   $1f, $1e, $20, $20, $1e, $1f, $08, $0b        ;; 01:6265 ????????
    db   $73, $62, $7b, $62, $83, $62, $00, $01        ;; 01:626d ????????
    db   $02, $03, $04, $05, $06, $07, $2a, $2c        ;; 01:6275 ????????
    db   $2b, $2d, $2a, $2c, $2b, $2d, $06, $06        ;; 01:627d ????????
    db   $07, $07, $08, $08, $09, $09, $10, $22        ;; 01:6285 ????????
    db   $93, $62, $a3, $62, $b3, $62, $04, $08        ;; 01:628d ????????
    db   $0c, $0d, $0e, $0f, $12, $14, $18, $19        ;; 01:6295 ????????
    db   $1a, $1b, $1c, $1d, $1e, $1f, $09, $0b        ;; 01:629d ????????
    db   $09, $0b, $0b, $0a, $09, $0a, $0a, $09        ;; 01:62a5 ????????
    db   $0a, $0b, $0b, $09, $0b, $09, $2f, $31        ;; 01:62ad ????????
    db   $32, $2f, $30, $30, $30, $31, $2f, $31        ;; 01:62b5 ????????
    db   $30, $32, $30, $2f, $31, $31, $18, $1a        ;; 01:62bd ????????
    db   $cb, $62, $e3, $62, $fb, $62, $00, $01        ;; 01:62c5 ????????
    db   $02, $03, $04, $05, $06, $07, $08, $09        ;; 01:62cd ????????
    db   $0a, $0b, $0c, $0d, $0e, $0f, $10, $11        ;; 01:62d5 ????????
    db   $12, $13, $14, $15, $16, $17, $0b, $0f        ;; 01:62dd ????????
    db   $0d, $0b, $0f, $0d, $0b, $0f, $0d, $0b        ;; 01:62e5 ????????
    db   $0f, $0d, $0b, $0f, $0d, $0b, $0f, $0d        ;; 01:62ed ????????
    db   $0b, $0f, $0d, $0b, $0f, $0d, $1e, $1e        ;; 01:62f5 ????????
    db   $1f, $1d, $1d, $1e, $1c, $1c, $1d, $1b        ;; 01:62fd ????????
    db   $1b, $1c, $1a, $1a, $1b, $19, $19, $1a        ;; 01:6305 ????????
    db   $18, $18, $19, $17, $17, $18, $fa, $e3        ;; 01:630d ????????
    db   $c6, $a7, $28, $01, $c9, $06, $05, $11        ;; 01:6315 ????????
    db   $e4, $c6, $21, $e9, $c6, $1a, $be, $c0        ;; 01:631d ????????
    db   $1c, $2c, $05, $20, $f8, $3e, $09, $cd        ;; 01:6325 ????????
    db   $a0, $3c, $3e, $82, $cd, $b2, $3c, $d0        ;; 01:632d ????????
    db   $3e, $8f, $cd, $b2, $3c, $30, $0e, $21        ;; 01:6335 ????????
    db   $0a, $6a, $11, $01, $01, $01, $12, $06        ;; 01:633d ????????
    db   $3e, $08, $df, $a0, $c9, $3e, $20, $ea        ;; 01:6345 ????????
    db   $e4, $c6                                      ;; 01:634d ??

jr_01_634f:
    ld   A, $00                                        ;; 01:634f $3e $00
    ld   [wC6E5], A                                    ;; 01:6351 $ea $e5 $c6
    ld   A, $b0                                        ;; 01:6354 $3e $b0
    ld   [wC6E6], A                                    ;; 01:6356 $ea $e6 $c6
    ld   A, $00                                        ;; 01:6359 $3e $00
    ld   [wC6E7], A                                    ;; 01:635b $ea $e7 $c6
    xor  A, A                                          ;; 01:635e $af
    ld   [wC6EE], A                                    ;; 01:635f $ea $ee $c6
    ld   A, $10                                        ;; 01:6362 $3e $10
    ld   [wC6E8], A                                    ;; 01:6364 $ea $e8 $c6
    call call_00_027d                                  ;; 01:6367 $cd $7d $02
    xor  A, A                                          ;; 01:636a $af
    and  A, A                                          ;; 01:636b $a7
    ret                                                ;; 01:636c $c9

jp_01_636d:
    ld   A, $00                                        ;; 01:636d $3e $00
    ld   [wC6E4], A                                    ;; 01:636f $ea $e4 $c6
    jr   jr_01_634f                                    ;; 01:6372 $18 $db

call_01_6374:
    ld   A, [wC6E3]                                    ;; 01:6374 $fa $e3 $c6
    and  A, A                                          ;; 01:6377 $a7
    ret  Z                                             ;; 01:6378 $c8
    ld   A, [wC6E8]                                    ;; 01:6379 $fa $e8 $c6
    cp   A, $01                                        ;; 01:637c $fe $01
    ret  NZ                                            ;; 01:637e $c0
    ld   A, $e8                                        ;; 01:637f $3e $e8
    call call_00_3cb2                                  ;; 01:6381 $cd $b2 $3c
    ret  C                                             ;; 01:6384 $d8
    ld   A, $cf                                        ;; 01:6385 $3e $cf
    call call_00_3cb2                                  ;; 01:6387 $cd $b2 $3c
    ret  C                                             ;; 01:638a $d8
    call call_00_3c36                                  ;; 01:638b $cd $36 $3c
    ld   A, [HL+]                                      ;; 01:638e $2a
    sub  A, $60                                        ;; 01:638f $d6 $60
    ld   A, [HL-]                                      ;; 01:6391 $3a
    sbc  A, $00                                        ;; 01:6392 $de $00
    ret  C                                             ;; 01:6394 $d8
    ld   A, [HL+]                                      ;; 01:6395 $2a
    sub  A, $b0                                        ;; 01:6396 $d6 $b0
    ld   A, [HL]                                       ;; 01:6398 $7e
    sbc  A, $01                                        ;; 01:6399 $de $01
    ret  NC                                            ;; 01:639b $d0
    call call_00_3c3f                                  ;; 01:639c $cd $3f $3c
    ld   A, [HL+]                                      ;; 01:639f $2a
    sub  A, $00                                        ;; 01:63a0 $d6 $00
    ld   A, [HL-]                                      ;; 01:63a2 $3a
    sbc  A, $02                                        ;; 01:63a3 $de $02
    ret  C                                             ;; 01:63a5 $d8
    ld   A, [HL+]                                      ;; 01:63a6 $2a
    sub  A, $80                                        ;; 01:63a7 $d6 $80
    ld   A, [HL]                                       ;; 01:63a9 $7e
    sbc  A, $03                                        ;; 01:63aa $de $03
    ret  NC                                            ;; 01:63ac $d0
    ld   A, $40                                        ;; 01:63ad $3e $40
    ldh  [hFFBC], A                                    ;; 01:63af $e0 $bc
    ld   A, $01                                        ;; 01:63b1 $3e $01
    ld   [wC6F2], A                                    ;; 01:63b3 $ea $f2 $c6
    ld   B, $06                                        ;; 01:63b6 $06 $06
.jr_01_63b8:
    call call_00_1af7                                  ;; 01:63b8 $cd $f7 $1a
    dec  B                                             ;; 01:63bb $05
    jr   NZ, .jr_01_63b8                               ;; 01:63bc $20 $fa
    xor  A, A                                          ;; 01:63be $af
    ld   [wC6F2], A                                    ;; 01:63bf $ea $f2 $c6
    ld   A, [wC6EE]                                    ;; 01:63c2 $fa $ee $c6
    rlca                                               ;; 01:63c5 $07
    rlca                                               ;; 01:63c6 $07
    call doJumptable                                   ;; 01:63c7 $cd $3a $37
;@jumptable amount=4
    dw   call_01_63d2                                  ;; 01:63ca ?? $00
    dw   call_01_63d7                                  ;; 01:63cc ?? $01
    dw   call_01_63dc                                  ;; 01:63ce ?? $02
    dw   call_01_63e1                                  ;; 01:63d0 ?? $03

call_01_63d2:
    ld   B, $03                                        ;; 01:63d2 $06 $03
    jp   jp_01_6884                                    ;; 01:63d4 $c3 $84 $68

call_01_63d7:
    ld   B, $03                                        ;; 01:63d7 $06 $03
    jp   jp_01_68b9                                    ;; 01:63d9 $c3 $b9 $68

call_01_63dc:
    ld   B, $03                                        ;; 01:63dc $06 $03
    jp   jp_01_686b                                    ;; 01:63de $c3 $6b $68

call_01_63e1:
    ld   B, $03                                        ;; 01:63e1 $06 $03
    jp   jp_01_68a0                                    ;; 01:63e3 $c3 $a0 $68

call_01_63e6:
    ld   HL, wC6E9                                     ;; 01:63e6 $21 $e9 $c6
    ld   DE, wC6E4                                     ;; 01:63e9 $11 $e4 $c6
    call call_00_1f87                                  ;; 01:63ec $cd $87 $1f
    ld   A, $3a                                        ;; 01:63ef $3e $3a
    call call_00_3cb2                                  ;; 01:63f1 $cd $b2 $3c
    jr   C, .jr_01_6410                                ;; 01:63f4 $38 $1a
    ld   A, $39                                        ;; 01:63f6 $3e $39
    call call_00_3cb2                                  ;; 01:63f8 $cd $b2 $3c
    jr   C, .jr_01_6401                                ;; 01:63fb $38 $04
    ld   A, $03                                        ;; 01:63fd $3e $03
    jr   .jr_01_6425                                   ;; 01:63ff $18 $24
.jr_01_6401:
    ld   A, [wC6FA]                                    ;; 01:6401 $fa $fa $c6
    cp   A, $df                                        ;; 01:6404 $fe $df
    jr   NZ, .jr_01_640c                               ;; 01:6406 $20 $04
    ld   A, $05                                        ;; 01:6408 $3e $05
    jr   .jr_01_6425                                   ;; 01:640a $18 $19
.jr_01_640c:
    ld   A, $04                                        ;; 01:640c $3e $04
    jr   .jr_01_6425                                   ;; 01:640e $18 $15
.jr_01_6410:
    ld   A, [wC6FA]                                    ;; 01:6410 $fa $fa $c6
    cp   A, $e0                                        ;; 01:6413 $fe $e0
    jr   NZ, .jr_01_641b                               ;; 01:6415 $20 $04
    ld   A, $08                                        ;; 01:6417 $3e $08
    jr   .jr_01_6425                                   ;; 01:6419 $18 $0a
.jr_01_641b:
    cp   A, $df                                        ;; 01:641b $fe $df
    jr   NZ, .jr_01_6423                               ;; 01:641d $20 $04
    ld   A, $07                                        ;; 01:641f $3e $07
    jr   .jr_01_6425                                   ;; 01:6421 $18 $02
.jr_01_6423:
    ld   A, $06                                        ;; 01:6423 $3e $06
.jr_01_6425:
    ld   [wC6E3], A                                    ;; 01:6425 $ea $e3 $c6
    jp   call_00_027d                                  ;; 01:6428 $c3 $7d $02
    db   $de, $df, $e0                                 ;; 01:642b ???

call_01_642e:
    ld   A, [wCA50]                                    ;; 01:642e $fa $50 $ca
    call doJumptable                                   ;; 01:6431 $cd $3a $37
    db   $3a, $64, $4d, $64, $7b, $64, $3e, $0e        ;; 01:6434 ????????
    db   $cd, $b2, $3c, $30, $1f, $3e, $0e, $cd        ;; 01:643c ????????
    db   $a6, $3c, $3e, $0f, $cd, $a6, $3c, $18        ;; 01:6444 ????????
    db   $2b, $3e, $0e, $cd, $b2, $3c, $30, $0c        ;; 01:644c ????????
    db   $3e, $0e, $cd, $a6, $3c, $3e, $0f, $cd        ;; 01:6454 ????????
    db   $a0, $3c, $18, $18, $3e, $0e, $cd, $a0        ;; 01:645c ????????
    db   $3c, $3e, $56, $cd, $b2, $3c, $38, $07        ;; 01:6464 ????????
    db   $3e, $0f, $cd, $a6, $3c, $18, $05, $3e        ;; 01:646c ????????
    db   $0f, $cd, $a0, $3c, $df, $7d, $c9, $3e        ;; 01:6474 ????????
    db   $05, $cd, $a0, $3c, $3e, $8d, $cd, $a0        ;; 01:647c ????????
    db   $3c, $df, $5a, $df, $18, $df, $9a, $3e        ;; 01:6484 ????????
    db   $39, $cd, $a6, $3c, $3e, $3d, $cd, $a6        ;; 01:648c ????????
    db   $3c, $3e, $03, $ea, $e3, $c6, $3e, $2f        ;; 01:6494 ????????
    db   $ea, $28, $ca, $3e, $0e, $ea, $29, $ca        ;; 01:649c ????????
    db   $cd, $36, $12, $21, $37, $6d, $af, $01        ;; 01:64a4 ????????
    db   $12, $06, $11, $01, $01, $df, $a0, $c9        ;; 01:64ac ????????

call_01_64b4:
    ld   A, [wC6E8]                                    ;; 01:64b4 $fa $e8 $c6
    ld   B, $ff                                        ;; 01:64b7 $06 $ff
    ld   C, A                                          ;; 01:64b9 $4f
    ld   A, [wCA29]                                    ;; 01:64ba $fa $29 $ca
    cp   A, $0f                                        ;; 01:64bd $fe $0f
    jr   NZ, .jr_01_64c6                               ;; 01:64bf $20 $05
    ld   HL, .data_01_6503                             ;; 01:64c1 $21 $03 $65
    jr   .jr_01_64d2                                   ;; 01:64c4 $18 $0c
.jr_01_64c6:
    cp   A, $2f                                        ;; 01:64c6 $fe $2f
    jr   NZ, .jr_01_64cf                               ;; 01:64c8 $20 $05
    ld   HL, .data_01_6563                             ;; 01:64ca $21 $63 $65
    jr   .jr_01_64d2                                   ;; 01:64cd $18 $03
.jr_01_64cf:
    ld   HL, .data_01_6575                             ;; 01:64cf $21 $75 $65
.jr_01_64d2:
    inc  B                                             ;; 01:64d2 $04
    ld   A, [HL+]                                      ;; 01:64d3 $2a
    cp   A, C                                          ;; 01:64d4 $b9
    jr   Z, .jr_01_64dd                                ;; 01:64d5 $28 $06
    ld   A, $20                                        ;; 01:64d7 $3e $20
    cp   A, B                                          ;; 01:64d9 $b8
    jr   NZ, .jr_01_64d2                               ;; 01:64da $20 $f6
    ret  Z                                             ;; 01:64dc $c8
.jr_01_64dd:
    ld   A, [wCA29]                                    ;; 01:64dd $fa $29 $ca
    cp   A, $0f                                        ;; 01:64e0 $fe $0f
    jr   NZ, .jr_01_64e9                               ;; 01:64e2 $20 $05
    ld   HL, .data_01_6523                             ;; 01:64e4 $21 $23 $65
    jr   .jr_01_64f5                                   ;; 01:64e7 $18 $0c
.jr_01_64e9:
    cp   A, $2f                                        ;; 01:64e9 $fe $2f
    jr   NZ, .jr_01_64f2                               ;; 01:64eb $20 $05
    ld   HL, .data_01_6569                             ;; 01:64ed $21 $69 $65
    jr   .jr_01_64f5                                   ;; 01:64f0 $18 $03
.jr_01_64f2:
    ld   HL, .data_01_6576                             ;; 01:64f2 $21 $76 $65
.jr_01_64f5:
    ld   A, B                                          ;; 01:64f5 $78
    call call_00_3741                                  ;; 01:64f6 $cd $41 $37
    xor  A, A                                          ;; 01:64f9 $af
    ld   BC, $612                                      ;; 01:64fa $01 $12 $06
    ld   DE, $101                                      ;; 01:64fd $11 $01 $01
    rst  rst_00_0018                                   ;; 01:6500 $df
    db   $a0                                           ;; 01:6501 .
    ret                                                ;; 01:6502 $c9
.data_01_6503:
    db   $02, $17, $32, $0a, $0b, $10, $04, $03        ;; 01:6503 .....???
    db   $44, $48, $05, $66, $68, $01, $88, $80        ;; 01:650b ????????
    db   $83, $7c, $7d, $7e, $96, $a8, $b2, $b4        ;; 01:6513 ????????
    db   $b9, $b8, $ba, $09, $50, $7f, $83, $ad        ;; 01:651b ????????
.data_01_6523:
    db   $9e, $79, $d1, $79, $ee, $79, $fc, $79        ;; 01:6523 ??????..
    db   $14, $7a, $25, $7a, $2f, $7a, $3b, $7a        ;; 01:652b ..??????
    db   $42, $7a, $49, $7a, $66, $7a, $74, $7a        ;; 01:6533 ????????
    db   $7b, $7a, $e4, $7c, $90, $7a, $93, $7a        ;; 01:653b ????????
    db   $9a, $7a, $09, $7c, $12, $7c, $1b, $7c        ;; 01:6543 ????????
    db   $24, $7c, $2e, $7c, $30, $7c, $37, $7c        ;; 01:654b ????????
    db   $5d, $7d, $3f, $7c, $46, $7c, $48, $7d        ;; 01:6553 ????????
    db   $22, $7d, $29, $7d, $e1, $7c, $58, $7d        ;; 01:655b ????????
.data_01_6563:
    db   $02, $10, $03, $05, $66, $a8                  ;; 01:6563 ??????
.data_01_6569:
    db   $a1, $79, $28, $7a, $3e, $7a, $69, $7a        ;; 01:6569 ????????
    db   $6d, $7a, $2f, $7c                            ;; 01:6571 ????
.data_01_6575:
    db   $10                                           ;; 01:6575 .
.data_01_6576:
    db   $c7, $7c, $cd, $b7, $66, $2a, $ea, $04        ;; 01:6576 ..??????
    db   $ca, $7e, $ea, $05, $ca, $cd, $ad, $66        ;; 01:657e ????????
    db   $7e, $cb, $37, $e6, $f0, $ea, $e4, $c6        ;; 01:6586 ????????
    db   $2a, $cb, $37, $e6, $0f, $ea, $e5, $c6        ;; 01:658e ????????
    db   $7e, $cb, $37, $e6, $f0, $ea, $e6, $c6        ;; 01:6596 ????????
    db   $7e, $cb, $37, $e6, $0f, $ea, $e7, $c6        ;; 01:659e ????????
    db   $fa, $ee, $c6, $a7, $28, $1e, $fe, $40        ;; 01:65a6 ????????
    db   $28, $30, $fe, $80, $28, $42, $fa, $e6        ;; 01:65ae ????????
    db   $c6, $d6, $10, $ea, $e6, $c6, $fa, $e7        ;; 01:65b6 ????????
    db   $c6, $de, $00, $21, $05, $ca, $a6, $ea        ;; 01:65be ????????
    db   $e7, $c6, $18, $40, $fa, $e4, $c6, $d6        ;; 01:65c6 ????????
    db   $10, $ea, $e4, $c6, $fa, $e5, $c6, $de        ;; 01:65ce ????????
    db   $00, $21, $04, $ca, $a6, $ea, $e5, $c6        ;; 01:65d6 ????????
    db   $18, $2a, $fa, $e6, $c6, $c6, $10, $ea        ;; 01:65de ????????
    db   $e6, $c6, $fa, $e7, $c6, $ce, $00, $21        ;; 01:65e6 ????????
    db   $05, $ca, $a6, $ea, $e7, $c6, $18, $14        ;; 01:65ee ????????
    db   $fa, $e4, $c6, $c6, $10, $ea, $e4, $c6        ;; 01:65f6 ????????
    db   $fa, $e5, $c6, $ce, $00, $21, $04, $ca        ;; 01:65fe ????????
    db   $a6, $ea, $e5, $c6, $cd, $a1, $66, $7e        ;; 01:6606 ????????
    db   $ea, $e8, $c6, $fa, $c8, $c7, $d6, $02        ;; 01:660e ????????
    db   $ea, $c8, $c7, $c3, $7d, $02, $af, $e0        ;; 01:6616 ????????
    db   $96, $cd, $03, $3c, $af, $22, $77, $cd        ;; 01:661e ????????
    db   $a0, $01, $cd, $22, $5c, $cd, $5f, $44        ;; 01:6626 ????????
    db   $cd, $a0, $01, $cd, $6b, $3a, $fa, $ef        ;; 01:662e ????????
    db   $c6, $a7, $20, $f1, $fa, $e4, $c6, $d6        ;; 01:6636 ????????
    db   $10, $ea, $e4, $c6, $fa, $e5, $c6, $de        ;; 01:663e ????????
    db   $00, $ea, $e5, $c6, $c9, $fa, $28, $ca        ;; 01:6646 ????????
    db   $3d, $e6, $0f, $47, $21, $c1, $66, $cd        ;; 01:664e ????????
    db   $41, $37, $2a, $ea, $c8, $c7, $f5, $cb        ;; 01:6656 ????????
    db   $3f, $47, $5d, $54, $cd, $b7, $66, $1a        ;; 01:665e ????????
    db   $e6, $0f, $22, $1a, $e6, $f0, $cb, $37        ;; 01:6666 ????????
    db   $77, $13, $cd, $ad, $66, $1a, $22, $13        ;; 01:666e ????????
    db   $1a, $22, $13, $cd, $a1, $66, $1a, $77        ;; 01:6676 ????????
    db   $13, $fa, $c8, $c7, $d6, $02, $ea, $c8        ;; 01:667e ????????
    db   $c7, $05, $20, $d8, $f1, $ea, $c8, $c7        ;; 01:6686 ????????
    db   $fa, $c0, $c7, $ea, $cb, $c7, $fa, $a0        ;; 01:668e ????????
    db   $c7, $ea, $c9, $c7, $fa, $a1, $c7, $ea        ;; 01:6696 ????????
    db   $ca, $c7, $c9, $21, $c0, $c7, $fa, $c8        ;; 01:669e ????????
    db   $c7, $d6, $02, $cb, $3f, $c7, $c9, $21        ;; 01:66a6 ????????
    db   $a0, $c7, $fa, $c8, $c7, $d6, $02, $c7        ;; 01:66ae ????????
    db   $c9, $21, $b0, $c7, $fa, $c8, $c7, $d6        ;; 01:66b6 ????????
    db   $02, $c7, $c9, $c9, $66, $d2, $66, $db        ;; 01:66be ????????
    db   $66, $e0, $66, $04, $33, $0b, $14, $50        ;; 01:66c6 ????????
    db   $33, $19, $30, $05, $04, $33, $22, $0f        ;; 01:66ce ????????
    db   $16, $33, $1b, $21, $03, $02, $33, $0c        ;; 01:66d6 ????????
    db   $04, $01, $04, $33, $34, $0b, $26, $33        ;; 01:66de ????????
    db   $18, $07, $04                                 ;; 01:66e6 ???

call_01_66e9:
    ld   A, [wCA28]                                    ;; 01:66e9 $fa $28 $ca
    swap A                                             ;; 01:66ec $cb $37
    and  A, $0f                                        ;; 01:66ee $e6 $0f
    call doJumptable                                   ;; 01:66f0 $cd $3a $37
;@jumptable amount=8
    dw   call_01_6714                                  ;; 01:66f3 pP $00
    dw   call_01_6714                                  ;; 01:66f5 pP $01
    dw   call_01_6714                                  ;; 01:66f7 pP $02
    dw   call_01_6714                                  ;; 01:66f9 pP $03
    dw   call_01_6733                                  ;; 01:66fb pP $04
    dw   call_01_673c                                  ;; 01:66fd ?? $05
    dw   call_01_6748                                  ;; 01:66ff ?? $06
    dw   call_01_675e                                  ;; 01:6701 pP $07
    db   $87, $67, $87, $67, $87, $67, $87, $67        ;; 01:6703 ????????
    db   $87, $67, $87, $67, $b1, $67, $c9, $67        ;; 01:670b ????????
    db   $c9                                           ;; 01:6713 ?

call_01_6714:
    call call_01_67ed                                  ;; 01:6714 $cd $ed $67
    jr   NZ, .jr_01_6725                               ;; 01:6717 $20 $0c
    ld   A, [wCA28]                                    ;; 01:6719 $fa $28 $ca
    and  A, $30                                        ;; 01:671c $e6 $30
    add  A, A                                          ;; 01:671e $87
    add  A, A                                          ;; 01:671f $87
    ld   [wC6EE], A                                    ;; 01:6720 $ea $ee $c6
    jr   .jr_01_6730                                   ;; 01:6723 $18 $0b
.jr_01_6725:
    call call_00_3c48                                  ;; 01:6725 $cd $48 $3c
    ld   A, [wCA28]                                    ;; 01:6728 $fa $28 $ca
    and  A, $30                                        ;; 01:672b $e6 $30
    add  A, A                                          ;; 01:672d $87
    add  A, A                                          ;; 01:672e $87
    ld   [HL], A                                       ;; 01:672f $77
.jr_01_6730:
    jp   call_01_5272                                  ;; 01:6730 $c3 $72 $52

call_01_6733:
    call call_01_67ed                                  ;; 01:6733 $cd $ed $67
    call call_00_3c03                                  ;; 01:6736 $cd $03 $3c
    xor  A, A                                          ;; 01:6739 $af
    ld   [HL], A                                       ;; 01:673a $77
    ret                                                ;; 01:673b $c9

call_01_673c:
    call call_01_67ed                                  ;; 01:673c $cd $ed $67
    call call_00_3c98                                  ;; 01:673f $cd $98 $3c
    ld   B, [HL]                                       ;; 01:6742 $46
    call call_00_3c03                                  ;; 01:6743 $cd $03 $3c
    ld   [HL], B                                       ;; 01:6746 $70
    ret                                                ;; 01:6747 $c9

call_01_6748:
    call call_01_67ed                                  ;; 01:6748 $cd $ed $67
    jr   NZ, .jr_01_6757                               ;; 01:674b $20 $0a
    xor  A, A                                          ;; 01:674d $af
    ld   [wC6F1], A                                    ;; 01:674e $ea $f1 $c6
    ld   [wC6F0], A                                    ;; 01:6751 $ea $f0 $c6
    jp   call_00_0165                                  ;; 01:6754 $c3 $65 $01
.jr_01_6757:
    call call_00_3c68                                  ;; 01:6757 $cd $68 $3c
    ld   A, $01                                        ;; 01:675a $3e $01
    ld   [HL], A                                       ;; 01:675c $77
    ret                                                ;; 01:675d $c9

call_01_675e:
    call call_01_67ed                                  ;; 01:675e $cd $ed $67
    jr   NZ, .jr_01_676e                               ;; 01:6761 $20 $0b
    ld   A, $01                                        ;; 01:6763 $3e $01
    ld   [wC6F1], A                                    ;; 01:6765 $ea $f1 $c6
    ld   [wC6F0], A                                    ;; 01:6768 $ea $f0 $c6
    jp   call_00_0165                                  ;; 01:676b $c3 $65 $01
.jr_01_676e:
    call call_00_3c68                                  ;; 01:676e $cd $68 $3c
    ld   A, $02                                        ;; 01:6771 $3e $02
    ld   [HL], A                                       ;; 01:6773 $77
    ret                                                ;; 01:6774 $c9
    db   $10, $30, $40, $10, $10, $30, $1a, $1b        ;; 01:6775 ????????
    db   $1c, $00, $02, $00, $04, $00, $00, $00        ;; 01:677d ????????
    db   $00, $00, $cd, $ed, $67, $fa, $28, $ca        ;; 01:6785 ????????
    db   $e6, $70, $cb, $37, $4f, $21, $75, $67        ;; 01:678d ????????
    db   $c7, $46, $cd, $2e, $3c, $70, $79, $21        ;; 01:6795 ????????
    db   $7b, $67, $c7, $46, $cd, $70, $3c, $70        ;; 01:679d ????????
    db   $79, $21, $81, $67, $c7, $46, $cd, $90        ;; 01:67a5 ????????
    db   $3c, $70, $18, $2b, $cd, $d7, $01, $cd        ;; 01:67ad ????????
    db   $70, $3c, $46, $cd, $2e, $3c, $4e, $cd        ;; 01:67b5 ????????
    db   $ed, $67, $cd, $2e, $3c, $71, $cd, $70        ;; 01:67bd ????????
    db   $3c, $70, $18, $13, $cd, $ed, $67, $cd        ;; 01:67c5 ????????
    db   $78, $3c, $46, $cd, $2e, $3c, $70, $cd        ;; 01:67cd ????????
    db   $80, $3c, $46, $cd, $70, $3c, $70, $f0        ;; 01:67d5 ????????
    db   $96, $a7, $20, $05, $fa, $ee, $c6, $18        ;; 01:67dd ????????
    db   $04, $cd, $48, $3c, $7e, $c3, $72, $52        ;; 01:67e5 ????????

call_01_67ed:
    ld   A, [wCA28]                                    ;; 01:67ed $fa $28 $ca
    and  A, $0f                                        ;; 01:67f0 $e6 $0f
    ldh  [hFF96], A                                    ;; 01:67f2 $e0 $96
    ret                                                ;; 01:67f4 $c9

call_01_67f5:
    call call_00_1b2d                                  ;; 01:67f5 $cd $2d $1b
    call call_01_67ed                                  ;; 01:67f8 $cd $ed $67
    ld   A, [wCA28]                                    ;; 01:67fb $fa $28 $ca
    and  A, $0f                                        ;; 01:67fe $e6 $0f
    jr   NZ, .jr_01_6818                               ;; 01:6800 $20 $16
    ld   A, [wC6EE]                                    ;; 01:6802 $fa $ee $c6
    rlca                                               ;; 01:6805 $07
    rlca                                               ;; 01:6806 $07
    and  A, $03                                        ;; 01:6807 $e6 $03
    ld   HL, .data_01_682f                             ;; 01:6809 $21 $2f $68
    push HL                                            ;; 01:680c $e5
    call doJumptable                                   ;; 01:680d $cd $3a $37
;@jumptable amount=4
    dw   call_01_6832                                  ;; 01:6810 pP $00
    dw   call_01_6838                                  ;; 01:6812 pP $01
    dw   call_01_683e                                  ;; 01:6814 pP $02
    dw   call_01_6844                                  ;; 01:6816 pP $03
.jr_01_6818:
    call call_00_3c48                                  ;; 01:6818 $cd $48 $3c
    ld   A, [HL]                                       ;; 01:681b $7e
    rlca                                               ;; 01:681c $07
    rlca                                               ;; 01:681d $07
    and  A, $03                                        ;; 01:681e $e6 $03
    ld   HL, .data_01_682f                             ;; 01:6820 $21 $2f $68
    push HL                                            ;; 01:6823 $e5
    call doJumptable                                   ;; 01:6824 $cd $3a $37
;@jumptable amount=4
    dw   call_01_684a                                  ;; 01:6827 pP $00
    dw   call_01_6850                                  ;; 01:6829 pP $01
    dw   call_01_6856                                  ;; 01:682b pP $02
    dw   call_01_685c                                  ;; 01:682d pP $03
.data_01_682f:
    jp   jp_00_1b50                                    ;; 01:682f $c3 $50 $1b

call_01_6832:
    call call_01_6862                                  ;; 01:6832 $cd $62 $68
    jp   jp_01_686b                                    ;; 01:6835 $c3 $6b $68

call_01_6838:
    call call_01_6862                                  ;; 01:6838 $cd $62 $68
    jp   jp_01_68a0                                    ;; 01:683b $c3 $a0 $68

call_01_683e:
    call call_01_6862                                  ;; 01:683e $cd $62 $68
    jp   jp_01_6884                                    ;; 01:6841 $c3 $84 $68

call_01_6844:
    call call_01_6862                                  ;; 01:6844 $cd $62 $68
    jp   jp_01_68b9                                    ;; 01:6847 $c3 $b9 $68

call_01_684a:
    call call_01_6862                                  ;; 01:684a $cd $62 $68
    jp   jp_01_68d2                                    ;; 01:684d $c3 $d2 $68

call_01_6850:
    call call_01_6862                                  ;; 01:6850 $cd $62 $68
    jp   jp_01_68f8                                    ;; 01:6853 $c3 $f8 $68

call_01_6856:
    call call_01_6862                                  ;; 01:6856 $cd $62 $68
    jp   jp_01_68e5                                    ;; 01:6859 $c3 $e5 $68

call_01_685c:
    call call_01_6862                                  ;; 01:685c $cd $62 $68
    jp   jp_01_690b                                    ;; 01:685f $c3 $0b $69

call_01_6862:
    ld   A, [wCA28]                                    ;; 01:6862 $fa $28 $ca
    and  A, $f0                                        ;; 01:6865 $e6 $f0
    swap A                                             ;; 01:6867 $cb $37
    ld   B, A                                          ;; 01:6869 $47
    ret                                                ;; 01:686a $c9

jp_01_686b:
    push BC                                            ;; 01:686b $c5
    call call_01_44a8                                  ;; 01:686c $cd $a8 $44
    ld   A, [wCA30]                                    ;; 01:686f $fa $30 $ca
    and  A, A                                          ;; 01:6872 $a7
    jr   Z, .jr_01_687a                                ;; 01:6873 $28 $05
    jr   .jr_01_687f                                   ;; 01:6875 $18 $08
.jr_01_6877:
    call call_01_44e9                                  ;; 01:6877 $cd $e9 $44
.jr_01_687a:
    call call_01_41af                                  ;; 01:687a $cd $af $41
    jr   NZ, .jr_01_6877                               ;; 01:687d $20 $f8
.jr_01_687f:
    pop  BC                                            ;; 01:687f $c1
    dec  B                                             ;; 01:6880 $05
    jr   NZ, jp_01_686b                                ;; 01:6881 $20 $e8
    ret                                                ;; 01:6883 $c9

jp_01_6884:
    push BC                                            ;; 01:6884 $c5
    call call_01_5cd3                                  ;; 01:6885 $cd $d3 $5c
    call call_01_441d                                  ;; 01:6888 $cd $1d $44
    ld   A, [wCA30]                                    ;; 01:688b $fa $30 $ca
    and  A, A                                          ;; 01:688e $a7
    jr   Z, .jr_01_6896                                ;; 01:688f $28 $05
    jr   .jr_01_689b                                   ;; 01:6891 $18 $08
.jr_01_6893:
    call call_01_445f                                  ;; 01:6893 $cd $5f $44
.jr_01_6896:
    call call_01_41af                                  ;; 01:6896 $cd $af $41
    jr   NZ, .jr_01_6893                               ;; 01:6899 $20 $f8
.jr_01_689b:
    pop  BC                                            ;; 01:689b $c1
    dec  B                                             ;; 01:689c $05
    jr   NZ, jp_01_6884                                ;; 01:689d $20 $e5
    ret                                                ;; 01:689f $c9

jp_01_68a0:
    push BC                                            ;; 01:68a0 $c5
    call call_01_4520                                  ;; 01:68a1 $cd $20 $45
    ld   A, [wCA30]                                    ;; 01:68a4 $fa $30 $ca
    and  A, A                                          ;; 01:68a7 $a7
    jr   Z, .jr_01_68af                                ;; 01:68a8 $28 $05
    jr   .jr_01_68b4                                   ;; 01:68aa $18 $08
.jr_01_68ac:
    call call_01_4562                                  ;; 01:68ac $cd $62 $45
.jr_01_68af:
    call call_01_41af                                  ;; 01:68af $cd $af $41
    jr   NZ, .jr_01_68ac                               ;; 01:68b2 $20 $f8
.jr_01_68b4:
    pop  BC                                            ;; 01:68b4 $c1
    dec  B                                             ;; 01:68b5 $05
    jr   NZ, jp_01_68a0                                ;; 01:68b6 $20 $e8
    ret                                                ;; 01:68b8 $c9

jp_01_68b9:
    push BC                                            ;; 01:68b9 $c5
    call call_01_4599                                  ;; 01:68ba $cd $99 $45
    ld   A, [wCA30]                                    ;; 01:68bd $fa $30 $ca
    and  A, A                                          ;; 01:68c0 $a7
    jr   Z, .jr_01_68c8                                ;; 01:68c1 $28 $05
    jr   .jr_01_68cd                                   ;; 01:68c3 $18 $08
.jr_01_68c5:
    call call_01_45db                                  ;; 01:68c5 $cd $db $45
.jr_01_68c8:
    call call_01_41af                                  ;; 01:68c8 $cd $af $41
    jr   NZ, .jr_01_68c5                               ;; 01:68cb $20 $f8
.jr_01_68cd:
    pop  BC                                            ;; 01:68cd $c1
    dec  B                                             ;; 01:68ce $05
    jr   NZ, jp_01_68b9                                ;; 01:68cf $20 $e8
    ret                                                ;; 01:68d1 $c9

jp_01_68d2:
    push BC                                            ;; 01:68d2 $c5
    call call_01_5121                                  ;; 01:68d3 $cd $21 $51
    jr   .jr_01_68db                                   ;; 01:68d6 $18 $03
.jr_01_68d8:
    call call_01_5144                                  ;; 01:68d8 $cd $44 $51
.jr_01_68db:
    call call_01_41c0                                  ;; 01:68db $cd $c0 $41
    jr   NZ, .jr_01_68d8                               ;; 01:68de $20 $f8
    pop  BC                                            ;; 01:68e0 $c1
    dec  B                                             ;; 01:68e1 $05
    jr   NZ, jp_01_68d2                                ;; 01:68e2 $20 $ee
    ret                                                ;; 01:68e4 $c9

jp_01_68e5:
    push BC                                            ;; 01:68e5 $c5
    call call_01_50dc                                  ;; 01:68e6 $cd $dc $50
    jr   .jr_01_68ee                                   ;; 01:68e9 $18 $03
.jr_01_68eb:
    call call_01_5100                                  ;; 01:68eb $cd $00 $51
.jr_01_68ee:
    call call_01_41c0                                  ;; 01:68ee $cd $c0 $41
    jr   NZ, .jr_01_68eb                               ;; 01:68f1 $20 $f8
    pop  BC                                            ;; 01:68f3 $c1
    dec  B                                             ;; 01:68f4 $05
    jr   NZ, jp_01_68e5                                ;; 01:68f5 $20 $ee
    ret                                                ;; 01:68f7 $c9

jp_01_68f8:
    push BC                                            ;; 01:68f8 $c5
    call call_01_5166                                  ;; 01:68f9 $cd $66 $51
    jr   .jr_01_6901                                   ;; 01:68fc $18 $03
.jr_01_68fe:
    call call_01_518a                                  ;; 01:68fe $cd $8a $51
.jr_01_6901:
    call call_01_41c0                                  ;; 01:6901 $cd $c0 $41
    jr   NZ, .jr_01_68fe                               ;; 01:6904 $20 $f8
    pop  BC                                            ;; 01:6906 $c1
    dec  B                                             ;; 01:6907 $05
    jr   NZ, jp_01_68f8                                ;; 01:6908 $20 $ee
    ret                                                ;; 01:690a $c9

jp_01_690b:
    push BC                                            ;; 01:690b $c5
    call call_01_51ac                                  ;; 01:690c $cd $ac $51
    jr   .jr_01_6914                                   ;; 01:690f $18 $03
.jr_01_6911:
    call call_01_51d0                                  ;; 01:6911 $cd $d0 $51
.jr_01_6914:
    call call_01_41c0                                  ;; 01:6914 $cd $c0 $41
    jr   NZ, .jr_01_6911                               ;; 01:6917 $20 $f8
    pop  BC                                            ;; 01:6919 $c1
    dec  B                                             ;; 01:691a $05
    jr   NZ, jp_01_690b                                ;; 01:691b $20 $ee
    ret                                                ;; 01:691d $c9

call_01_691e:
    call call_00_1b2d                                  ;; 01:691e $cd $2d $1b
    call call_01_67ed                                  ;; 01:6921 $cd $ed $67
    ld   A, [wCA28]                                    ;; 01:6924 $fa $28 $ca
    and  A, $0f                                        ;; 01:6927 $e6 $0f
    jr   NZ, .jr_01_6941                               ;; 01:6929 $20 $16
    ld   A, [wC6EE]                                    ;; 01:692b $fa $ee $c6
    rlca                                               ;; 01:692e $07
    rlca                                               ;; 01:692f $07
    and  A, $03                                        ;; 01:6930 $e6 $03
    ld   HL, .data_01_6958                             ;; 01:6932 $21 $58 $69
    push HL                                            ;; 01:6935 $e5
    call doJumptable                                   ;; 01:6936 $cd $3a $37
;@jumptable amount=4
    dw   call_01_695b                                  ;; 01:6939 pP $00
    dw   call_01_6961                                  ;; 01:693b ?? $01
    dw   call_01_6967                                  ;; 01:693d pP $02
    dw   call_01_696d                                  ;; 01:693f ?? $03
.jr_01_6941:
    call call_00_3c48                                  ;; 01:6941 $cd $48 $3c
    ld   A, [HL]                                       ;; 01:6944 $7e
    rlca                                               ;; 01:6945 $07
    rlca                                               ;; 01:6946 $07
    and  A, $03                                        ;; 01:6947 $e6 $03
    ld   HL, .data_01_6958                             ;; 01:6949 $21 $58 $69
    push HL                                            ;; 01:694c $e5
    call doJumptable                                   ;; 01:694d $cd $3a $37
;@jumptable amount=4
    dw   call_01_6973                                  ;; 01:6950 pP $00
    dw   call_01_6979                                  ;; 01:6952 pP $01
    dw   call_01_697f                                  ;; 01:6954 pP $02
    dw   call_01_6985                                  ;; 01:6956 pP $03
.data_01_6958:
    jp   jp_00_1b50                                    ;; 01:6958 $c3 $50 $1b

call_01_695b:
    call call_01_6862                                  ;; 01:695b $cd $62 $68
    jp   jp_01_698b                                    ;; 01:695e $c3 $8b $69

call_01_6961:
    call call_01_6862                                  ;; 01:6961 $cd $62 $68
    jp   jp_01_69b1                                    ;; 01:6964 $c3 $b1 $69

call_01_6967:
    call call_01_6862                                  ;; 01:6967 $cd $62 $68
    jp   jp_01_699e                                    ;; 01:696a $c3 $9e $69

call_01_696d:
    call call_01_6862                                  ;; 01:696d $cd $62 $68
    jp   jp_01_69c4                                    ;; 01:6970 $c3 $c4 $69

call_01_6973:
    call call_01_6862                                  ;; 01:6973 $cd $62 $68
    jp   jp_01_69d7                                    ;; 01:6976 $c3 $d7 $69

call_01_6979:
    call call_01_6862                                  ;; 01:6979 $cd $62 $68
    jp   jp_01_69fd                                    ;; 01:697c $c3 $fd $69

call_01_697f:
    call call_01_6862                                  ;; 01:697f $cd $62 $68
    jp   jp_01_69ea                                    ;; 01:6982 $c3 $ea $69

call_01_6985:
    call call_01_6862                                  ;; 01:6985 $cd $62 $68
    jp   jp_01_6a10                                    ;; 01:6988 $c3 $10 $6a

jp_01_698b:
    push BC                                            ;; 01:698b $c5
    call call_01_5c02                                  ;; 01:698c $cd $02 $5c
    jr   .jr_01_6994                                   ;; 01:698f $18 $03
.jr_01_6991:
    call call_01_44e9                                  ;; 01:6991 $cd $e9 $44
.jr_01_6994:
    call call_01_41af                                  ;; 01:6994 $cd $af $41
    jr   NZ, .jr_01_6991                               ;; 01:6997 $20 $f8
    pop  BC                                            ;; 01:6999 $c1
    dec  B                                             ;; 01:699a $05
    jr   NZ, jp_01_698b                                ;; 01:699b $20 $ee
    ret                                                ;; 01:699d $c9

jp_01_699e:
    push BC                                            ;; 01:699e $c5
    call call_01_5c22                                  ;; 01:699f $cd $22 $5c
    jr   .jr_01_69a7                                   ;; 01:69a2 $18 $03
.jr_01_69a4:
    call call_01_445f                                  ;; 01:69a4 $cd $5f $44
.jr_01_69a7:
    call call_01_41af                                  ;; 01:69a7 $cd $af $41
    jr   NZ, .jr_01_69a4                               ;; 01:69aa $20 $f8
    pop  BC                                            ;; 01:69ac $c1
    dec  B                                             ;; 01:69ad $05
    jr   NZ, jp_01_699e                                ;; 01:69ae $20 $ee
    ret                                                ;; 01:69b0 $c9

jp_01_69b1:
    push BC                                            ;; 01:69b1 $c5
    call call_01_5c43                                  ;; 01:69b2 $cd $43 $5c
    jr   .jr_01_69ba                                   ;; 01:69b5 $18 $03
.jr_01_69b7:
    call call_01_4562                                  ;; 01:69b7 $cd $62 $45
.jr_01_69ba:
    call call_01_41af                                  ;; 01:69ba $cd $af $41
    jr   NZ, .jr_01_69b7                               ;; 01:69bd $20 $f8
    pop  BC                                            ;; 01:69bf $c1
    dec  B                                             ;; 01:69c0 $05
    jr   NZ, jp_01_69b1                                ;; 01:69c1 $20 $ee
    ret                                                ;; 01:69c3 $c9

jp_01_69c4:
    push BC                                            ;; 01:69c4 $c5
    call call_01_5c64                                  ;; 01:69c5 $cd $64 $5c
    jr   .jr_01_69cd                                   ;; 01:69c8 $18 $03
.jr_01_69ca:
    call call_01_45db                                  ;; 01:69ca $cd $db $45
.jr_01_69cd:
    call call_01_41af                                  ;; 01:69cd $cd $af $41
    jr   NZ, .jr_01_69ca                               ;; 01:69d0 $20 $f8
    pop  BC                                            ;; 01:69d2 $c1
    dec  B                                             ;; 01:69d3 $05
    jr   NZ, jp_01_69c4                                ;; 01:69d4 $20 $ee
    ret                                                ;; 01:69d6 $c9

jp_01_69d7:
    push BC                                            ;; 01:69d7 $c5
    call call_01_5117                                  ;; 01:69d8 $cd $17 $51
    jr   .jr_01_69e0                                   ;; 01:69db $18 $03
.jr_01_69dd:
    call call_01_5144                                  ;; 01:69dd $cd $44 $51
.jr_01_69e0:
    call call_01_41c0                                  ;; 01:69e0 $cd $c0 $41
    jr   NZ, .jr_01_69dd                               ;; 01:69e3 $20 $f8
    pop  BC                                            ;; 01:69e5 $c1
    dec  B                                             ;; 01:69e6 $05
    jr   NZ, jp_01_69d7                                ;; 01:69e7 $20 $ee
    ret                                                ;; 01:69e9 $c9

jp_01_69ea:
    push BC                                            ;; 01:69ea $c5
    call call_01_50d1                                  ;; 01:69eb $cd $d1 $50
    jr   .jr_01_69f3                                   ;; 01:69ee $18 $03
.jr_01_69f0:
    call call_01_5100                                  ;; 01:69f0 $cd $00 $51
.jr_01_69f3:
    call call_01_41c0                                  ;; 01:69f3 $cd $c0 $41
    jr   NZ, .jr_01_69f0                               ;; 01:69f6 $20 $f8
    pop  BC                                            ;; 01:69f8 $c1
    dec  B                                             ;; 01:69f9 $05
    jr   NZ, jp_01_69ea                                ;; 01:69fa $20 $ee
    ret                                                ;; 01:69fc $c9

jp_01_69fd:
    push BC                                            ;; 01:69fd $c5
    call call_01_515b                                  ;; 01:69fe $cd $5b $51
    jr   .jr_01_6a06                                   ;; 01:6a01 $18 $03
.jr_01_6a03:
    call call_01_518a                                  ;; 01:6a03 $cd $8a $51
.jr_01_6a06:
    call call_01_41c0                                  ;; 01:6a06 $cd $c0 $41
    jr   NZ, .jr_01_6a03                               ;; 01:6a09 $20 $f8
    pop  BC                                            ;; 01:6a0b $c1
    dec  B                                             ;; 01:6a0c $05
    jr   NZ, jp_01_69fd                                ;; 01:6a0d $20 $ee
    ret                                                ;; 01:6a0f $c9

jp_01_6a10:
    push BC                                            ;; 01:6a10 $c5
    call call_01_51a1                                  ;; 01:6a11 $cd $a1 $51
    jr   .jr_01_6a19                                   ;; 01:6a14 $18 $03
.jr_01_6a16:
    call call_01_51d0                                  ;; 01:6a16 $cd $d0 $51
.jr_01_6a19:
    call call_01_41c0                                  ;; 01:6a19 $cd $c0 $41
    jr   NZ, .jr_01_6a16                               ;; 01:6a1c $20 $f8
    pop  BC                                            ;; 01:6a1e $c1
    dec  B                                             ;; 01:6a1f $05
    jr   NZ, jp_01_6a10                                ;; 01:6a20 $20 $ee
    ret                                                ;; 01:6a22 $c9
    db   $cd, $d7, $01, $cd, $36, $3c, $2a, $ea        ;; 01:6a23 ????????
    db   $00, $c8, $7e, $ea, $01, $c8, $cd, $3f        ;; 01:6a2b ????????
    db   $3c, $2a, $ea, $02, $c8, $7e, $ea, $03        ;; 01:6a33 ????????
    db   $c8, $cd, $db, $01, $fa, $00, $c8, $47        ;; 01:6a3b ????????
    db   $cd, $36, $3c, $70, $cd, $0b, $3c, $70        ;; 01:6a43 ????????
    db   $fa, $01, $c8, $47, $cd, $36, $3c, $2c        ;; 01:6a4b ????????
    db   $70, $cd, $0b, $3c, $2c, $70, $fa, $02        ;; 01:6a53 ????????
    db   $c8, $47, $cd, $3f, $3c, $70, $cd, $14        ;; 01:6a5b ????????
    db   $3c, $70, $fa, $03, $c8, $47, $cd, $3f        ;; 01:6a63 ????????
    db   $3c, $2c, $70, $cd, $14, $3c, $2c, $70        ;; 01:6a6b ????????
    db   $c9, $11, $03, $00, $fa, $28, $ca, $e6        ;; 01:6a73 ????????
    db   $0f, $3d, $6f, $26, $00, $cd, $7e, $1c        ;; 01:6a7b ????????
    db   $21, $ac, $6a, $19, $7e, $cb, $37, $e6        ;; 01:6a83 ????????
    db   $f0, $ea, $e9, $c6, $2a, $cb, $37, $e6        ;; 01:6a8b ????????
    db   $0f, $ea, $ea, $c6, $7e, $cb, $37, $e6        ;; 01:6a93 ????????
    db   $f0, $ea, $eb, $c6, $2a, $cb, $37, $e6        ;; 01:6a9b ????????
    db   $0f, $ea, $ec, $c6, $7e, $ea, $ed, $c6        ;; 01:6aa3 ????????
    db   $c9, $1b, $2f, $05, $2e, $13, $01, $1c        ;; 01:6aab ????????
    db   $0f, $01, $0d, $04, $01, $2b, $35, $00        ;; 01:6ab3 ????????
    db   $18, $25, $01                                 ;; 01:6abb ???

data_01_6abe:
    dw   $6bbe                                         ;; 01:6abe wW
    db   $0e, $6c, $4e, $6c, $76, $6c                  ;; 01:6ac0 ??????
    dw   $6bbe                                         ;; 01:6ac6 wW
    db   $0e, $6c, $4e, $6c, $76, $6c, $be, $6b        ;; 01:6ac8 ??..????
    db   $4e, $6c, $4a, $6c, $4a, $6c, $4e, $6c        ;; 01:6ad0 ????????
    db   $70, $6e, $f8, $6e, $1b, $6f, $58, $6f        ;; 01:6ad8 ..??????
    db   $8e, $6f, $8e, $6f, $99, $6e, $02, $6d        ;; 01:6ae0 ????..??
    db   $36, $6c, $be, $6b, $20, $6e, $cf, $6f        ;; 01:6ae8 ????????
    db   $2a, $6d, $2a, $6d, $9e, $6c, $02, $6d        ;; 01:6af0 ??..????
    db   $02, $6e, $ee, $6c, $8e, $6f                  ;; 01:6af8 ??????

data_01_6afe:
    dw   $6bd2                                         ;; 01:6afe wW
    db   $22, $6c, $62, $6c, $8a, $6c                  ;; 01:6b00 ??????
    dw   $6bd2                                         ;; 01:6b06 wW
    db   $22, $6c, $62, $6c, $8a, $6c, $d2, $6b        ;; 01:6b08 ????????
    dw   $6c4e                                         ;; 01:6b10 wW
    db   $4a, $6c, $4a, $6c, $4e, $6c, $70, $6e        ;; 01:6b12 ????????
    db   $f8, $6e, $1b, $6f, $58, $6f, $8e, $6f        ;; 01:6b1a ????????
    db   $8e, $6f, $99, $6e, $16, $6d, $36, $6c        ;; 01:6b22 ??..????
    db   $be, $6b, $20, $6e, $cf, $6f, $60, $6d        ;; 01:6b2a ????..??
    db   $60, $6d, $b2, $6c, $16, $6d, $02, $6e        ;; 01:6b32 ..??????
    db   $ee, $6c, $8e, $6f                            ;; 01:6b3a ??..

data_01_6b3e:
    dw   $6bfa                                         ;; 01:6b3e wW
    db   $fa, $6b, $fa, $6b, $fa, $6b                  ;; 01:6b40 ??????
    dw   $6bfa                                         ;; 01:6b46 wW
    db   $fa, $6b, $fa, $6b, $fa, $6b, $fa, $6b        ;; 01:6b48 ????????
    db   $4e, $6c, $4a, $6c, $4a, $6c, $4e, $6c        ;; 01:6b50 ????????
    db   $70, $6e, $f8, $6e, $1b, $6f, $58, $6f        ;; 01:6b58 ????????
    db   $8e, $6f, $8e, $6f, $99, $6e, $c6, $6c        ;; 01:6b60 ????????
    db   $36, $6c, $be, $6b, $20, $6e, $cf, $6f        ;; 01:6b68 ????????
    db   $cc, $6d, $cc, $6d, $c6, $6c, $c6, $6c        ;; 01:6b70 ????????
    db   $02, $6e, $ee, $6c, $8e, $6f                  ;; 01:6b78 ??????

data_01_6b7e:
    dw   $6be6                                         ;; 01:6b7e wW
    db   $e6, $6b, $e6, $6b, $e6, $6b                  ;; 01:6b80 ??????
    dw   $6be6                                         ;; 01:6b86 wW
    db   $e6, $6b, $e6, $6b, $e6, $6b, $e6, $6b        ;; 01:6b88 ????????
    db   $4e, $6c, $4a, $6c, $4a, $6c, $4e, $6c        ;; 01:6b90 ????????
    db   $70, $6e, $f8, $6e, $1b, $6f, $58, $6f        ;; 01:6b98 ????????
    db   $8e, $6f, $8e, $6f, $99, $6e, $da, $6c        ;; 01:6ba0 ????????
    db   $36, $6c, $be, $6b, $20, $6e, $cf, $6f        ;; 01:6ba8 ????????
    db   $96, $6d, $96, $6d, $da, $6c, $da, $6c        ;; 01:6bb0 ????????
    db   $02, $6e, $ee, $6c, $8e, $6f                  ;; 01:6bb8 ??????
    dw   .data_01_6bc2                                 ;; 01:6bbe pP
    dw   .data_01_6bca                                 ;; 01:6bc0 pP
.data_01_6bc2:
    db   $00, $00, $80, $01, $08, $02, $88, $03        ;; 01:6bc2 ........
.data_01_6bca:
    db   $01, $00, $81, $23, $09, $02, $89, $21        ;; 01:6bca ........
    dw   .data_01_6bd6                                 ;; 01:6bd2 pP
    dw   .data_01_6bde                                 ;; 01:6bd4 pP
.data_01_6bd6:
    db   $00, $04, $80, $05, $08, $06, $88, $07        ;; 01:6bd6 ........
.data_01_6bde:
    db   $01, $04, $81, $27, $09, $06, $89, $25        ;; 01:6bde ........
    dw   .data_01_6bea                                 ;; 01:6be6 pP
    dw   .data_01_6bf2                                 ;; 01:6be8 pP
.data_01_6bea:
    db   $01, $2a, $81, $2b, $09, $28, $89, $29        ;; 01:6bea ........
.data_01_6bf2:
    db   $01, $2e, $81, $2f, $09, $2c, $89, $2d        ;; 01:6bf2 ........
    dw   .data_01_6bfe                                 ;; 01:6bfa pP
    dw   .data_01_6c06                                 ;; 01:6bfc pP
.data_01_6bfe:
    db   $01, $08, $81, $09, $09, $0a, $89, $0b        ;; 01:6bfe ........
.data_01_6c06:
    db   $01, $0c, $81, $0d, $09, $0e, $89, $0f        ;; 01:6c06 ........
    db   $12, $6c, $1a, $6c, $01, $00, $81, $01        ;; 01:6c0e ????????
    db   $09, $20, $89, $21, $21, $22, $a1, $23        ;; 01:6c16 ????????
    db   $29, $02, $a9, $03, $26, $6c, $2e, $6c        ;; 01:6c1e ????????
    db   $01, $04, $81, $05, $09, $24, $89, $25        ;; 01:6c26 ????????
    db   $21, $26, $a1, $27, $29, $06, $a9, $07        ;; 01:6c2e ????????
    db   $3a, $6c, $42, $6c, $71, $00, $f1, $01        ;; 01:6c36 ????????
    db   $79, $02, $f9, $03, $71, $22, $f1, $23        ;; 01:6c3e ????????
    db   $79, $20, $f9, $21, $52, $6c, $52, $6c        ;; 01:6c46 ????????
    dw   .data_01_6c52                                 ;; 01:6c4e pP
    dw   .data_01_6c5a                                 ;; 01:6c50 pP
.data_01_6c52:
    db   $01, $00, $81, $01, $09, $02, $89, $03        ;; 01:6c52 ........
.data_01_6c5a:
    db   $01, $22, $81, $23, $09, $20, $89, $21        ;; 01:6c5a ........
    db   $66, $6c, $6e, $6c, $01, $04, $81, $05        ;; 01:6c62 ????????
    db   $09, $06, $89, $07, $01, $26, $81, $27        ;; 01:6c6a ????????
    db   $09, $24, $89, $25, $7a, $6c, $82, $6c        ;; 01:6c72 ????????
    db   $00, $00, $80, $01, $08, $02, $88, $03        ;; 01:6c7a ????????
    db   $01, $22, $81, $23, $09, $20, $89, $21        ;; 01:6c82 ????????
    db   $8e, $6c, $96, $6c, $00, $04, $80, $05        ;; 01:6c8a ????????
    db   $08, $06, $88, $07, $01, $26, $81, $27        ;; 01:6c92 ????????
    db   $09, $24, $89, $25, $a2, $6c, $aa, $6c        ;; 01:6c9a ????????
    db   $00, $0c, $80, $0d, $08, $2c, $88, $2d        ;; 01:6ca2 ????????
    db   $10, $0e, $90, $0f, $18, $2e, $98, $2f        ;; 01:6caa ????????
    db   $b6, $6c, $be, $6c, $00, $00, $80, $01        ;; 01:6cb2 ????????
    db   $08, $20, $88, $21, $10, $02, $90, $03        ;; 01:6cba ????????
    db   $18, $22, $98, $23, $ca, $6c, $d2, $6c        ;; 01:6cc2 ????????
    db   $00, $26, $80, $27, $08, $24, $88, $25        ;; 01:6cca ????????
    db   $10, $2a, $90, $2b, $18, $28, $98, $29        ;; 01:6cd2 ????????
    db   $de, $6c, $e6, $6c, $00, $04, $80, $05        ;; 01:6cda ????????
    db   $08, $06, $88, $07, $10, $08, $90, $09        ;; 01:6ce2 ????????
    db   $18, $0a, $98, $0b, $f2, $6c, $fa, $6c        ;; 01:6cea ????????
    db   $00, $00, $80, $01, $08, $02, $88, $03        ;; 01:6cf2 ????????
    db   $10, $04, $90, $05, $18, $06, $98, $07        ;; 01:6cfa ????????
    db   $06, $6d, $0e, $6d, $00, $00, $80, $01        ;; 01:6d02 ????????
    db   $08, $02, $88, $03, $10, $00, $90, $01        ;; 01:6d0a ????????
    db   $18, $02, $98, $03, $1a, $6d, $22, $6d        ;; 01:6d12 ????????
    db   $00, $0c, $80, $0d, $08, $0e, $88, $0f        ;; 01:6d1a ????????
    db   $10, $0c, $90, $0d, $18, $0e, $98, $0f        ;; 01:6d22 ????????
    db   $3a, $6d, $4d, $6d, $3a, $6d, $4d, $6d        ;; 01:6d2a ????????
    db   $3a, $6d, $4d, $6d, $3a, $6d, $4d, $6d        ;; 01:6d32 ????????
    db   $06, $f0, $fe, $0c, $f8, $fe, $0d, $f0        ;; 01:6d3a ????????
    db   $06, $0e, $f8, $05, $2d, $08, $00, $8f        ;; 01:6d42 ????????
    db   $08, $08, $6f, $06, $f1, $fe, $0c, $f9        ;; 01:6d4a ????????
    db   $fe, $0f, $f1, $06, $0e, $f9, $05, $2f        ;; 01:6d52 ????????
    db   $08, $00, $8f, $08, $08, $6f, $70, $6d        ;; 01:6d5a ????????
    db   $83, $6d, $70, $6d, $83, $6d, $70, $6d        ;; 01:6d62 ????????
    db   $83, $6d, $70, $6d, $83, $6d, $06, $f0        ;; 01:6d6a ????????
    db   $fe, $00, $f8, $fe, $01, $f0, $05, $20        ;; 01:6d72 ????????
    db   $f8, $06, $02, $08, $00, $8f, $08, $08        ;; 01:6d7a ????????
    db   $6f, $06, $f1, $fe, $03, $f9, $fe, $01        ;; 01:6d82 ????????
    db   $f1, $05, $23, $f9, $06, $02, $08, $00        ;; 01:6d8a ????????
    db   $8f, $08, $08, $6f, $a6, $6d, $b9, $6d        ;; 01:6d92 ????????
    db   $a6, $6d, $b9, $6d, $a6, $6d, $b9, $6d        ;; 01:6d9a ????????
    db   $a6, $6d, $b9, $6d, $06, $f0, $fe, $04        ;; 01:6da2 ????????
    db   $f8, $fe, $05, $f0, $06, $06, $f8, $06        ;; 01:6daa ????????
    db   $07, $08, $00, $8f, $08, $08, $6f, $06        ;; 01:6db2 ????????
    db   $f1, $fe, $08, $f9, $fe, $09, $f1, $06        ;; 01:6dba ????????
    db   $0a, $f9, $06, $0b, $08, $00, $8f, $08        ;; 01:6dc2 ????????
    db   $08, $6f, $dc, $6d, $ef, $6d, $dc, $6d        ;; 01:6dca ????????
    db   $ef, $6d, $dc, $6d, $ef, $6d, $dc, $6d        ;; 01:6dd2 ????????
    db   $ef, $6d, $06, $f0, $fe, $26, $f8, $fe        ;; 01:6dda ????????
    db   $27, $f0, $06, $24, $f8, $06, $25, $08        ;; 01:6de2 ????????
    db   $00, $8f, $08, $08, $6f, $06, $f1, $fe        ;; 01:6dea ????????
    db   $2a, $f9, $fe, $2b, $f1, $06, $28, $f9        ;; 01:6df2 ????????
    db   $06, $29, $08, $00, $8f, $08, $08, $6f        ;; 01:6dfa ????????
    db   $06, $6e, $13, $6e, $04, $f8, $00, $00        ;; 01:6e02 ????????
    db   $00, $00, $01, $f8, $08, $02, $00, $08        ;; 01:6e0a ????????
    db   $03, $04, $f9, $00, $04, $01, $00, $05        ;; 01:6e12 ????????
    db   $f9, $08, $06, $01, $08, $07, $30, $6e        ;; 01:6e1a ????????
    db   $30, $6e, $30, $6e, $30, $6e, $30, $6e        ;; 01:6e22 ????????
    db   $30, $6e, $3a, $6e, $3a, $6e, $03, $08        ;; 01:6e2a ????????
    db   $00, $01, $00, $08, $02, $08, $08, $03        ;; 01:6e32 ????????
    db   $03, $08, $00, $81, $00, $08, $82, $08        ;; 01:6e3a ????????
    db   $08, $83, $54, $6e, $62, $6e, $5b, $6e        ;; 01:6e42 ????????
    db   $69, $6e, $54, $6e, $62, $6e, $5b, $6e        ;; 01:6e4a ????????
    db   $69, $6e, $02, $08, $00, $2f, $08, $08        ;; 01:6e52 ????????
    db   $0f, $02, $08, $00, $af, $08, $08, $8f        ;; 01:6e5a ????????
    db   $02, $08, $00, $0d, $08, $08, $2d, $02        ;; 01:6e62 ????????
    db   $08, $00, $8d, $08, $08, $ad, $80, $6e        ;; 01:6e6a ????????
    db   $80, $6e, $80, $6e, $80, $6e, $80, $6e        ;; 01:6e72 ????????
    db   $80, $6e, $80, $6e, $80, $6e, $08, $f0        ;; 01:6e7a ????????
    db   $ff, $00, $f8, $ff, $01, $00, $ff, $04        ;; 01:6e82 ????????
    db   $08, $ff, $05, $f0, $07, $02, $f8, $07        ;; 01:6e8a ????????
    db   $03, $00, $07, $06, $08, $07, $07, $a9        ;; 01:6e92 ???????.
    db   $6e, $a9, $6e, $a9, $6e, $a9, $6e, $a9        ;; 01:6e9a ...?????
    db   $6e, $a9, $6e, $a9, $6e, $a9, $6e, $1a        ;; 01:6ea2 ???????.
    db   $f0, $f0, $00, $f8, $f0, $01, $00, $f0        ;; 01:6eaa ??.??.??
    db   $06, $08, $f0, $07, $f0, $f8, $02, $f8        ;; 01:6eb2 .??.??.?
    db   $f8, $03, $00, $f8, $08, $08, $f8, $09        ;; 01:6eba ?.??.??.
    db   $f0, $00, $04, $f8, $00, $05, $00, $00        ;; 01:6ec2 ??.??.??
    db   $0a, $f0, $08, $24, $f8, $08, $25, $00        ;; 01:6eca .??.??.?
    db   $08, $2a, $f0, $10, $22, $f8, $10, $23        ;; 01:6ed2 ?.??.??.
    db   $00, $10, $28, $08, $10, $29, $f0, $18        ;; 01:6eda ??.??.??
    db   $20, $f8, $18, $21, $00, $18, $26, $08        ;; 01:6ee2 .??.??.?
    db   $18, $27, $18, $f8, $8b, $18, $00, $8c        ;; 01:6eea ?.??.??.
    db   $18, $08, $ac, $18, $10, $ab, $08, $6f        ;; 01:6ef2 ??.??.??
    db   $08, $6f, $08, $6f, $08, $6f, $08, $6f        ;; 01:6efa ????????
    db   $08, $6f, $08, $6f, $08, $6f, $06, $00        ;; 01:6f02 ????????
    db   $00, $00, $08, $00, $00, $10, $00, $00        ;; 01:6f0a ????????
    db   $00, $08, $01, $08, $08, $01, $10, $08        ;; 01:6f12 ????????
    db   $01, $27, $6f, $27, $6f, $27, $6f, $27        ;; 01:6f1a ????????
    db   $6f, $27, $6f, $27, $6f, $10, $f0, $f0        ;; 01:6f22 ????????
    db   $10, $f8, $f0, $11, $00, $f0, $51, $08        ;; 01:6f2a ????????
    db   $f0, $50, $f0, $f8, $12, $f8, $f8, $13        ;; 01:6f32 ????????
    db   $00, $f8, $53, $08, $f8, $52, $f0, $00        ;; 01:6f3a ????????
    db   $32, $f8, $00, $33, $00, $00, $73, $08        ;; 01:6f42 ????????
    db   $00, $72, $f0, $08, $30, $f8, $08, $31        ;; 01:6f4a ????????
    db   $00, $08, $71, $08, $08, $70, $5c, $6f        ;; 01:6f52 ????????
    db   $75, $6f, $08, $00, $f8, $80, $00, $00        ;; 01:6f5a ????????
    db   $81, $08, $f8, $81, $08, $00, $80, $10        ;; 01:6f62 ????????
    db   $f8, $82, $10, $00, $83, $18, $f8, $83        ;; 01:6f6a ????????
    db   $18, $00, $82, $08, $00, $f8, $81, $00        ;; 01:6f72 ????????
    db   $00, $80, $08, $f8, $80, $08, $00, $81        ;; 01:6f7a ????????
    db   $10, $f8, $83, $10, $00, $82, $18, $f8        ;; 01:6f82 ????????
    db   $82, $18, $00, $83, $9e, $6f, $9e, $6f        ;; 01:6f8a ????????
    db   $9e, $6f, $9e, $6f, $9e, $6f, $9e, $6f        ;; 01:6f92 ....????
    db   $9e, $6f, $9e, $6f, $10, $f0, $f8, $00        ;; 01:6f9a ????.??.
    db   $f8, $f8, $01, $f0, $00, $02, $f8, $00        ;; 01:6fa2 ??.??.??
    db   $03, $f0, $08, $04, $f8, $08, $05, $f0        ;; 01:6faa .??.??.?
    db   $10, $06, $f8, $10, $07, $00, $f8, $08        ;; 01:6fb2 ?.??.??.
    db   $08, $f8, $09, $00, $00, $0a, $08, $00        ;; 01:6fba ??.??.??
    db   $0b, $00, $08, $0c, $08, $08, $0d, $00        ;; 01:6fc2 .??.??.?
    db   $10, $0e, $08, $10, $0f, $d3, $6f, $d3        ;; 01:6fca ?.??....
    db   $6f, $00, $cd, $52, $1d, $fa, $2f, $ca        ;; 01:6fd2 ..??????
    db   $e6, $7f, $ea, $2a, $ce, $fe, $40, $38        ;; 01:6fda ????????
    db   $0d, $fe, $50, $38, $23, $21, $50, $79        ;; 01:6fe2 ????????
    db   $d6, $50, $87, $c7, $18, $14, $21, $04        ;; 01:6fea ????????
    db   $78, $4f, $e6, $f0, $cb, $37, $87, $c7        ;; 01:6ff2 ????????
    db   $2a, $56, $5f, $79, $e6, $0f, $cd, $48        ;; 01:6ffa ????????
    db   $24, $19, $11, $2b, $ce, $cd, $84, $1f        ;; 01:7002 ????????
    db   $fa, $2a, $ce, $fe, $50, $d2, $c7, $76        ;; 01:700a ????????
    db   $df, $0d, $21, $23, $70, $e5, $fa, $2a        ;; 01:7012 ????????
    db   $ce, $fe, $40, $da, $4a, $70, $c3, $21        ;; 01:701a ????????
    db   $76                                           ;; 01:7022 ?
    xor  A, A                                          ;; 01:7023 $af
    ld   [wCD42], A                                    ;; 01:7024 $ea $42 $cd
    call call_00_39f3                                  ;; 01:7027 $cd $f3 $39
    call call_00_20cf                                  ;; 01:702a $cd $cf $20
    call call_00_3a4b                                  ;; 01:702d $cd $4b $3a
    call call_00_1df3                                  ;; 01:7030 $cd $f3 $1d
    ld   A, $50                                        ;; 01:7033 $3e $50
    ldh  [rWY], A                                      ;; 01:7035 $e0 $4a
    rst  rst_00_0018                                   ;; 01:7037 $df
    db   $58                                           ;; 01:7038 .
    jp   call_00_3a0c                                  ;; 01:7039 $c3 $0c $3a
    db   $df, $0f, $fa, $94, $ce, $3c, $ca, $83        ;; 01:703c ????????
    db   $1e, $3e, $35, $e0, $bc, $c9, $cd, $e2        ;; 01:7044 ????????
    db   $70, $cd, $0c, $3a, $df, $05, $62, $70        ;; 01:704c ????????
    db   $79, $1e, $83, $1e, $83, $1e, $77, $70        ;; 01:7054 ????????
    db   $90, $70, $83, $1e, $83, $1e, $fa, $15        ;; 01:705c ????????
    db   $cd, $b7, $ca, $79, $1e, $11, $e2, $70        ;; 01:7064 ????????
    db   $d5, $3d, $cd, $3a, $37, $86, $71, $5c        ;; 01:706c ????????
    db   $72, $3c, $73, $21, $15, $cd, $7e, $fe        ;; 01:7074 ????????
    db   $03, $28, $0d, $fe, $02, $20, $06, $fa        ;; 01:707c ????????
    db   $2f, $ca, $07, $30, $03, $34, $18, $17        ;; 01:7084 ????????
    db   $36, $00, $18, $13, $21, $15, $cd, $7e        ;; 01:708c ????????
    db   $b7, $28, $03, $35, $18, $09, $36, $03        ;; 01:7094 ????????
    db   $fa, $2f, $ca, $07, $38, $01, $35, $7e        ;; 01:709c ????????
    db   $21, $ad, $70, $c7, $7e, $ea, $81, $c0        ;; 01:70a4 ????????
    db   $c9, $10, $38, $58, $80, $df, $3d, $21        ;; 01:70ac ????????
    db   $e6, $cd, $3e, $fd, $22, $36, $76, $af        ;; 01:70b4 ????????
    db   $ea, $15, $cd, $21, $80, $c0, $3e, $48        ;; 01:70bc ????????
    db   $22, $36, $18, $c9, $fa, $2f, $ce, $3c        ;; 01:70c4 ????????
    db   $28, $10, $3e, $03, $ea, $19, $cd, $3e        ;; 01:70cc ????????
    db   $58, $ea, $88, $c0, $3e, $60, $ea, $8c        ;; 01:70d4 ????????
    db   $c0, $c9, $ea, $19, $cd, $c9, $cd, $b1        ;; 01:70dc ????????
    db   $70, $21, $80, $c0, $36, $30, $2c, $36        ;; 01:70e4 ????????
    db   $38, $3e, $01, $ea, $15, $cd, $cd, $1a        ;; 01:70ec ????????
    db   $71, $16, $01, $af, $cd, $e2, $76, $16        ;; 01:70f4 ????????
    db   $03, $21, $57, $75, $fa, $2f, $ca, $07        ;; 01:70fc ????????
    db   $30, $03, $21, $66, $75, $c3, $d8, $76        ;; 01:7104 ????????
    db   $21, $c5, $76, $11, $01, $01, $01, $12        ;; 01:710c ????????
    db   $04, $3e, $24, $df, $90, $c9, $21, $68        ;; 01:7114 ????????
    db   $71, $11, $b0, $c8, $cd, $6c, $1f, $fa        ;; 01:711c ????????
    db   $80, $c0, $fe, $40, $30, $11, $21, $7d        ;; 01:7124 ????????
    db   $71, $cd, $81, $1f, $cd, $59, $71, $21        ;; 01:712c ????????
    db   $76, $71, $cd, $81, $1f, $18, $09, $21        ;; 01:7134 ????????
    db   $76, $71, $cd, $6c, $1f, $cd, $59, $71        ;; 01:713c ????????
    db   $21, $84, $71, $cd, $90, $1f, $df, $3c        ;; 01:7144 ????????
    db   $20, $08, $21, $b4, $c8, $3e, $3c, $22        ;; 01:714c ????????
    db   $36, $77, $c3, $49, $1e, $1b, $1b, $1b        ;; 01:7154 ????????
    db   $fa, $e6, $cd, $12, $13, $fa, $e7, $cd        ;; 01:715c ????????
    db   $12, $13, $13, $c9, $01, $0f, $0a, $02        ;; 01:7164 ????????
    db   $38, $77, $00, $0c, $0f, $07, $02, $35        ;; 01:716c ????????
    db   $77, $00, $01, $01, $12, $04, $c5, $76        ;; 01:7174 ????????
    db   $00, $01, $06, $12, $08, $fd, $76, $00        ;; 01:717c ????????
    db   $00, $00, $cd, $4c, $72, $df, $05, $9b        ;; 01:7184 ????????
    db   $71, $79, $1e, $83, $1e, $83, $1e, $83        ;; 01:718c ????????
    db   $1e, $83, $1e, $f2, $71, $1b, $72, $21        ;; 01:7194 ????????
    db   $2b, $ce, $fa, $15, $cd, $c7, $7e, $ea        ;; 01:719c ????????
    db   $94, $ce, $fe, $ff, $ca, $83, $1e, $cd        ;; 01:71a4 ????????
    db   $54, $2e, $cd, $78, $77, $30, $16, $3e        ;; 01:71ac ????????
    db   $02                                           ;; 01:71b4 ?

data_01_71b5:
    db   $f5, $cd, $cd, $77, $cd, $1a, $71, $f1        ;; 01:71b5 ????????
    db   $16, $01, $cd, $e2, $76, $df, $2c, $cd        ;; 01:71bd ????????
    db   $db, $77, $18, $23, $cd, $0c, $71, $21        ;; 01:71c5 ????????
    db   $c0, $75, $16, $01, $cd, $d8, $76, $cd        ;; 01:71cd ????????
    db   $e1, $75, $20, $10, $cd, $3c, $70, $28        ;; 01:71d5 ????????
    db   $04, $3e, $03, $18, $d3, $cd, $94, $77        ;; 01:71dd ????????
    db   $3e, $04, $18, $cc, $cd, $94, $77, $cd        ;; 01:71e5 ????????
    db   $1a, $71, $c3, $55, $72, $21, $15, $cd        ;; 01:71ed ????????
    db   $7e, $b7, $28, $13, $35, $21, $80, $c0        ;; 01:71f5 ????????
    db   $7e, $fe, $48, $28, $04, $d6, $10, $77        ;; 01:71fd ????????
    db   $c9, $06, $06, $78, $c3, $e0, $34, $fa        ;; 01:7205 ????????
    db   $2f, $ce, $3c, $c2, $83, $1e, $36, $03        ;; 01:720d ????????

data_01_7215:
    db   $3e, $78, $ea, $80, $c0, $c9, $06, $05        ;; 01:7215 ????????
    db   $fa, $2f, $ce, $3c, $20, $02, $06, $03        ;; 01:721d ????????
    db   $21, $15, $cd, $7e, $b8, $28, $13, $34        ;; 01:7225 ????????
    db   $21, $80, $c0, $7e, $fe, $78, $28, $04        ;; 01:722d ????????
    db   $c6, $10, $77, $c9, $06, $06, $78, $c3        ;; 01:7235 ????????
    db   $70, $34, $fe, $03, $c2, $83, $1e, $36        ;; 01:723d ????????
    db   $00, $3e, $48, $ea, $80, $c0, $c9, $cd        ;; 01:7245 ????????
    db   $b1, $70, $cd, $c8, $70, $cd, $1a, $71        ;; 01:724d ????????
    db   $16, $01, $3e, $01, $c3, $e2, $76, $cd        ;; 01:7255 ????????
    db   $24, $73, $df, $05, $71, $72, $79, $1e        ;; 01:725d ????????
    db   $83, $1e, $83, $1e, $83, $1e, $83, $1e        ;; 01:7265 ????????
    db   $ed, $72, $08, $73, $fa, $15, $cd, $87        ;; 01:726d ????????
    db   $21, $ff, $c6, $c7, $7d, $ea, $28, $cd        ;; 01:7275 ????????
    db   $7c, $ea, $29, $cd, $7e, $ea, $94, $ce        ;; 01:727d ????????
    db   $fe, $ff, $ca, $83, $1e, $cd, $54, $2e        ;; 01:7285 ????????
    db   $21, $7c, $ce, $2a, $b6, $28, $4a, $cb        ;; 01:728d ????????
    db   $3e, $2b, $cb, $1e, $cd, $94, $77, $cd        ;; 01:7295 ????????
    db   $0c, $71, $21, $da, $75, $16, $01, $cd        ;; 01:729d ????????
    db   $d8, $76, $3e, $06, $16, $03, $cd, $e2        ;; 01:72a5 ????????
    db   $76, $cd, $e1, $75, $20, $22, $21, $28        ;; 01:72ad ????????
    db   $cd, $2a, $66, $6f, $23, $35, $20, $04        ;; 01:72b5 ????????
    db   $35, $2b, $36, $ff, $cd, $cd, $77, $cd        ;; 01:72bd ????????
    db   $1a, $71, $3e, $03, $16, $01, $cd, $e2        ;; 01:72c5 ????????
    db   $76, $df, $2c, $cd, $db, $77, $18, $03        ;; 01:72cd ????????
    db   $cd, $78, $77, $cd, $1a, $71, $c3, $35        ;; 01:72d5 ????????
    db   $73, $cd, $0c, $71, $21, $ce, $75, $16        ;; 01:72dd ????????
    db   $01, $cd, $d8, $76, $df, $2e, $18, $eb        ;; 01:72e5 ????????
    db   $21, $15, $cd, $7e, $b7, $ca, $83, $1e        ;; 01:72ed ????????
    db   $35, $21, $80, $c0, $7e, $fe, $48, $28        ;; 01:72f5 ????????
    db   $04, $d6, $10, $77, $c9, $06, $06, $78        ;; 01:72fd ????????
    db   $c3, $e0, $34, $21, $15, $cd, $7e, $fe        ;; 01:7305 ????????
    db   $17, $ca, $83, $1e, $34, $21, $80, $c0        ;; 01:730d ????????
    db   $7e, $fe, $78, $28, $04, $c6, $10, $77        ;; 01:7315 ????????
    db   $c9, $06, $06, $78, $c3, $70, $34, $cd        ;; 01:731d ????????
    db   $b1, $70, $cd, $ce, $70, $21, $e6, $cd        ;; 01:7325 ????????
    db   $36, $33, $23, $36, $70, $cd, $1a, $71        ;; 01:732d ????????
    db   $16, $01, $3e, $05, $c3, $e2, $76, $fa        ;; 01:7335 ????????
    db   $2a, $ce, $fe, $20, $d2, $5b, $74, $cd        ;; 01:733d ????????
    db   $2a, $74, $df, $05, $59, $73, $79, $1e        ;; 01:7345 ????????
    db   $83, $1e, $83, $1e, $83, $1e, $83, $1e        ;; 01:734d ????????
    db   $07, $74, $1c, $74, $21, $84, $ce, $af        ;; 01:7355 ????????
    db   $cd, $51, $1f, $fa, $15, $cd, $87, $21        ;; 01:735d ????????
    db   $31, $ce, $c7, $2a, $ea, $94, $ce, $7e        ;; 01:7365 ????????
    db   $cb, $37, $e6, $0f, $ea, $84, $ce, $7e        ;; 01:736d ????????
    db   $e6, $0f, $ea, $88, $ce, $cd, $0c, $71        ;; 01:7375 ????????
    db   $21, $05, $76, $16, $01, $cd, $d8, $76        ;; 01:737d ????????
    db   $21, $14, $76, $16, $03, $cd, $d8, $76        ;; 01:7385 ????????
    db   $cd, $e1, $75, $20, $43, $cd, $cd, $77        ;; 01:738d ????????
    db   $cd, $db, $73, $38, $2e, $e5, $d5, $cd        ;; 01:7395 ????????
    db   $3c, $70, $d1, $e1, $28, $15, $df, $18        ;; 01:739d ????????
    db   $3e, $03, $f5, $cd, $1a, $71, $f1, $16        ;; 01:73a5 ????????
    db   $01, $cd, $e2, $76, $df, $2c, $cd, $db        ;; 01:73ad ????????
    db   $77, $18, $1d, $fa, $88, $ce, $86, $77        ;; 01:73b5 ????????
    db   $6b, $62, $fa, $84, $ce, $86, $77, $3e        ;; 01:73bd ????????
    db   $04, $18, $df, $cd, $1a, $71, $21, $25        ;; 01:73c5 ????????
    db   $76, $16, $01, $cd, $d8, $76, $18, $dc        ;; 01:73cd ????????
    db   $cd, $1a, $71, $c3, $4b, $74, $fa, $84        ;; 01:73d5 ????????
    db   $ce, $47, $3e, $d7, $cd, $f6, $73, $d8        ;; 01:73dd ????????
    db   $4f, $e5, $fa, $88, $ce, $47, $3e, $d6        ;; 01:73e5 ????????
    db   $cd, $f6, $73, $d1, $d8, $77, $79, $12        ;; 01:73ed ????????
    db   $c9, $ea, $91, $ce, $c5, $df, $0e, $c1        ;; 01:73f5 ????????
    db   $fa, $91, $ce, $3c, $28, $02, $34, $7e        ;; 01:73fd ????????
    db   $90, $c9, $21, $15, $cd, $7e, $b7, $28        ;; 01:7405 ????????
    db   $03, $3d, $18, $02, $3e, $03, $77, $cb        ;; 01:740d ????????
    db   $37, $c6, $48, $ea, $80, $c0, $c9, $21        ;; 01:7415 ????????
    db   $15, $cd, $7e, $fe, $03, $28, $03, $3c        ;; 01:741d ????????
    db   $18, $ec, $af, $18, $e9, $fa, $2a, $ce        ;; 01:7425 ????????
    db   $fe, $10, $21, $f4, $77, $38, $03, $21        ;; 01:742d ????????
    db   $fc, $77, $11, $31, $ce, $cd, $7e, $1f        ;; 01:7435 ????????
    db   $cd, $b1, $70, $21, $e6, $cd, $3e, $4d        ;; 01:743d ????????
    db   $22, $36, $77, $cd, $1a, $71, $21, $e7        ;; 01:7445 ????????
    db   $75, $16, $01, $cd, $d8, $76, $21, $f9        ;; 01:744d ????????
    db   $75, $16, $03, $c3, $d8, $76, $cd, $84        ;; 01:7455 ????????
    db   $75, $df, $05, $70, $74, $3a, $75, $83        ;; 01:745d ????????
    db   $1e, $83, $1e, $83, $1e, $83, $1e, $55        ;; 01:7465 ????????
    db   $75, $64, $75, $fa, $80, $c0, $d6, $48        ;; 01:746d ????????
    db   $cb, $37, $c6, $d2, $ea, $91, $ce, $ea        ;; 01:7475 ????????
    db   $3c, $ce, $df, $0e, $fa, $91, $ce, $3c        ;; 01:747d ????????
    db   $ca, $83, $1e, $3d, $47, $21, $40, $ce        ;; 01:7485 ????????
    db   $fa, $3b, $ce, $c7, $70, $21, $30, $76        ;; 01:748d ????????
    db   $16, $08, $b7, $28, $02, $16, $0c, $cd        ;; 01:7495 ????????
    db   $d8, $76, $cd, $a6, $75, $fa, $3b, $ce        ;; 01:749d ????????
    db   $3c, $e6, $01, $ea, $3b, $ce, $c0, $cd        ;; 01:74a5 ????????
    db   $0c, $71, $fa, $41, $ce, $d6, $d2, $87        ;; 01:74ad ????????
    db   $87, $47, $fa, $40, $ce, $d6, $d2, $80        ;; 01:74b5 ????????
    db   $21, $e4, $77, $c7, $7e, $b7, $20, $21        ;; 01:74bd ????????
    db   $16, $01, $21, $54, $76, $cd, $d8, $76        ;; 01:74c5 ????????
    db   $16, $03, $21, $66, $76, $cd, $d8, $76        ;; 01:74cd ????????
    db   $cd, $73, $75, $cd, $cd, $77, $df, $2c        ;; 01:74d5 ????????
    db   $cd, $db, $77, $cd, $b4, $75, $c3, $96        ;; 01:74dd ????????
    db   $75, $ea, $3c, $ce, $21, $31, $76, $11        ;; 01:74e5 ????????
    db   $0c, $0f, $01, $06, $02, $3e, $04, $df        ;; 01:74ed ????????
    db   $90, $16, $01, $21, $73, $76, $cd, $d8        ;; 01:74f5 ????????
    db   $76, $cd, $e1, $75, $c2, $31, $75, $cd        ;; 01:74fd ????????
    db   $cd, $77, $cd, $b4, $75, $fa, $3c, $ce        ;; 01:7505 ????????
    db   $ea, $94, $ce, $cd, $3c, $70, $20, $0d        ;; 01:750d ????????
    db   $3e, $04, $16, $01, $cd, $e2, $76, $cd        ;; 01:7515 ????????
    db   $db, $77, $c3, $d5, $74, $df, $18, $3e        ;; 01:751d ????????
    db   $03, $16, $01, $cd, $e2, $76, $cd, $db        ;; 01:7525 ????????
    db   $77, $c3, $d8, $74, $cd, $73, $75, $cd        ;; 01:752d ????????
    db   $b4, $75, $c3, $96, $75, $fa, $3b, $ce        ;; 01:7535 ????????
    db   $b7, $28, $12, $af, $ea, $3b, $ce, $21        ;; 01:753d ????????
    db   $51, $76, $16, $08, $cd, $d8, $76, $cd        ;; 01:7545 ????????
    db   $7b, $75, $c3, $a6, $75, $c3, $79, $1e        ;; 01:754d ????????
    db   $21, $80, $c0, $7e, $fe, $48, $28, $04        ;; 01:7555 ????????
    db   $d6, $10, $77, $c9, $36, $78, $c9, $21        ;; 01:755d ????????
    db   $80, $c0, $7e, $fe, $78, $28, $04, $c6        ;; 01:7565 ????????
    db   $10, $77, $c9, $36, $48, $c9, $fa, $41        ;; 01:756d ????????
    db   $ce, $ea, $94, $ce, $df, $0f, $fa, $40        ;; 01:7575 ????????
    db   $ce, $ea, $94, $ce, $df, $0f, $c9, $af        ;; 01:757d ????????
    db   $ea, $3b, $ce, $cd, $cf, $20, $21, $80        ;; 01:7585 ????????
    db   $c0, $3e, $48, $22, $36, $50, $cd, $b4        ;; 01:758d ????????
    db   $75, $16, $01, $21, $35, $76, $cd, $d8        ;; 01:7595 ????????
    db   $76, $16, $03, $21, $43, $76, $c3, $d8        ;; 01:759d ????????
    db   $76, $21, $79, $76, $11, $11, $06, $01        ;; 01:75a5 ????????
    db   $01, $08, $3e, $04, $df, $90, $c9, $21        ;; 01:75ad ????????
    db   $c3, $75, $11, $b0, $c8, $06, $1e, $df        ;; 01:75b5 ????????
    db   $03, $cd, $49, $1e, $18, $e3, $01, $01        ;; 01:75bd ????????
    db   $12, $04, $c5, $76, $00, $01, $0f, $12        ;; 01:75c5 ????????
    db   $02, $8c, $77, $00, $01, $06, $07, $08        ;; 01:75cd ????????
    db   $61, $77, $00, $09, $06, $0a, $08, $6f        ;; 01:75d5 ????????
    db   $77, $00, $00, $00, $cd, $cd, $77, $36        ;; 01:75dd ????????
    db   $60, $2c, $36, $38, $21, $c6, $75, $11        ;; 01:75e5 ????????
    db   $06, $09, $01, $08, $02, $3e, $24, $df        ;; 01:75ed ????????
    db   $90, $df, $05, $08, $76, $11, $76, $83        ;; 01:75f5 ????????
    db   $1e, $83, $1e, $19, $76, $19, $76, $83        ;; 01:75fd ????????
    db   $1e, $83, $1e, $fa, $81, $c0, $fe, $38        ;; 01:7605 ????????
    db   $20, $02, $18, $02, $f6, $01, $cd, $db        ;; 01:760d ????????
    db   $77, $c3, $79, $1e, $21, $81, $c0, $7e        ;; 01:7615 ????????
    db   $ee, $60, $77, $c9, $cd, $31, $77, $cd        ;; 01:761d ????????
    db   $68, $76, $df, $05, $39, $76, $79, $1e        ;; 01:7625 ????????
    db   $83, $1e, $83, $1e, $60, $76, $60, $76        ;; 01:762d ????????
    db   $83, $1e, $83, $1e, $fa, $81, $c0, $fe        ;; 01:7635 ????????
    db   $50, $c2, $79, $1e, $cd, $78, $77, $38        ;; 01:763d ????????
    db   $06, $df, $08, $3e, $02, $18, $02, $3e        ;; 01:7645 ????????
    db   $03, $f5, $cd, $cf, $20, $cd, $97, $76        ;; 01:764d ????????
    db   $f1, $16, $03, $cd, $e2, $76, $df, $2e        ;; 01:7655 ????????
    db   $c3, $79, $1e, $21, $81, $c0, $7e, $ee        ;; 01:765d ????????
    db   $28, $77, $c9, $21, $80, $c0, $36, $48        ;; 01:7665 ????????
    db   $2c, $36, $50, $cd, $97, $76, $cd, $8a        ;; 01:766d ????????
    db   $76, $cd, $7c, $76, $c3, $0c, $3a, $01        ;; 01:7675 ????????
    db   $0a, $02, $11, $09, $06, $21, $4c, $75        ;; 01:767d ????????
    db   $3e, $24, $df, $90, $c9, $16, $01, $af        ;; 01:7685 ????????
    db   $cd, $e2, $76, $16, $03, $3e, $01, $c3        ;; 01:768d ????????
    db   $e2, $76, $21, $b0, $76, $11, $b0, $c8        ;; 01:7695 ????????
    db   $06, $17, $df, $03, $df, $3c, $20, $08        ;; 01:769d ????????
    db   $21, $bb, $c8, $36, $ca, $23, $36, $76        ;; 01:76a5 ????????
    db   $c3, $49, $1e, $01, $01, $12, $06, $c5        ;; 01:76ad ????????
    db   $76, $00, $01, $09, $12, $08, $85, $76        ;; 01:76b5 ????????
    db   $01, $0b, $0f, $08, $02, $c6, $76, $00        ;; 01:76bd ????????
    db   $00, $00, $cd, $98, $1d, $21, $2b, $ce        ;; 01:76c5 ????????
    db   $3e, $08, $cd, $f8, $2e, $cd, $d2, $35        ;; 01:76cd ????????
    db   $c3, $f3, $1d, $1e, $01, $01, $12, $02        ;; 01:76d5 ????????
    db   $3e, $04, $df, $90, $c9, $87, $4f, $06        ;; 01:76dd ????????
    db   $00, $fa, $2a, $ce, $fe, $40, $21, $5c        ;; 01:76e5 ????????
    db   $79, $38, $03, $21, $6a, $79, $09, $2a        ;; 01:76ed ????????
    db   $66, $6f, $1e, $01, $01, $12, $04, $3e        ;; 01:76f5 ????????
    db   $04, $df, $90, $c9                            ;; 01:76fd ????
    rst  rst_00_0018                                   ;; 01:7701 $df
    db   $3c                                           ;; 01:7702 .
    ld   B, $04                                        ;; 01:7703 $06 $04
    jr   Z, .jr_01_7708                                ;; 01:7705 $28 $01
    inc  B                                             ;; 01:7707 $04
.jr_01_7708:
    push BC                                            ;; 01:7708 $c5
    ld   A, B                                          ;; 01:7709 $78
    dec  A                                             ;; 01:770a $3d
    call call_01_7713                                  ;; 01:770b $cd $13 $77
    pop  BC                                            ;; 01:770e $c1
    dec  B                                             ;; 01:770f $05
    jr   NZ, .jr_01_7708                               ;; 01:7710 $20 $f6
    ret                                                ;; 01:7712 $c9

call_01_7713:
    call call_00_1fcd                                  ;; 01:7713 $cd $cd $1f
    ld   DE, wC501                                     ;; 01:7716 $11 $01 $c5
    add  HL, DE                                        ;; 01:7719 $19
    bit  6, [HL]                                       ;; 01:771a $cb $76
    ret  NZ                                            ;; 01:771c $c0
    ld   DE, $16                                       ;; 01:771d $11 $16 $00
    call call_01_7726                                  ;; 01:7720 $cd $26 $77
    ld   DE, $12                                       ;; 01:7723 $11 $12 $00

call_01_7726:
    push HL                                            ;; 01:7726 $e5
    add  HL, DE                                        ;; 01:7727 $19
    ld   A, [HL-]                                      ;; 01:7728 $3a
    ld   D, A                                          ;; 01:7729 $57
    ld   A, [HL-]                                      ;; 01:772a $3a
    ld   E, A                                          ;; 01:772b $5f
    ld   A, D                                          ;; 01:772c $7a
    ld   [HL-], A                                      ;; 01:772d $32
    ld   [HL], E                                       ;; 01:772e $73
    pop  HL                                            ;; 01:772f $e1
    ret                                                ;; 01:7730 $c9
    db   $df, $3c, $06, $04, $28, $01, $04, $21        ;; 01:7731 ????????
    db   $7c, $ce, $af, $22, $22, $22, $c5, $78        ;; 01:7739 ????????
    db   $3d, $cd, $cd, $1f, $11, $01, $c5, $19        ;; 01:7741 ????????
    db   $cb, $76, $20, $0c, $11, $12, $00, $cd        ;; 01:7749 ????????
    db   $5e, $77, $11, $16, $00, $cd, $5e, $77        ;; 01:7751 ????????
    db   $c1, $05, $20, $e2, $c9, $e5, $19, $3a        ;; 01:7759 ????????
    db   $57, $3a, $2b, $96, $5f, $23, $7a, $9e        ;; 01:7761 ????????
    db   $57, $21, $7c, $ce, $7b, $86, $22, $7a        ;; 01:7769 ????????
    db   $8e, $22, $30, $01, $34, $e1, $c9, $21        ;; 01:7771 ????????
    db   $7c, $ce, $fa, $e0, $c6, $96, $5f, $23        ;; 01:7779 ????????
    db   $fa, $e1, $c6, $9e, $57, $23, $fa, $e2        ;; 01:7781 ????????
    db   $c6, $9e, $d8, $21, $e2, $c6, $32, $7a        ;; 01:7789 ????????
    db   $32, $73, $c9, $21, $e0, $c6, $fa, $7c        ;; 01:7791 ????????
    db   $ce, $86, $22, $fa, $7d, $ce, $8e, $22        ;; 01:7799 ????????
    db   $30, $01, $34, $21, $ca, $77, $fa, $e0        ;; 01:77a1 ????????
    db   $c6, $96, $5f, $23, $fa, $e1, $c6, $9e        ;; 01:77a9 ????????
    db   $57, $23, $fa, $e2, $c6, $9e, $d8, $21        ;; 01:77b1 ????????
    db   $7c, $ce, $7e, $93, $22, $7e, $9a, $77        ;; 01:77b9 ????????
    db   $21, $ca, $77, $11, $e0, $c6, $c3, $8d        ;; 01:77c1 ????????
    db   $1f, $3f, $42, $0f, $21, $80, $c0, $11        ;; 01:77c9 ????????
    db   $39, $ce, $cd, $90, $1f, $2d, $2d, $36        ;; 01:77d1 ????????
    db   $00, $c9, $21, $39, $ce, $11, $80, $c0        ;; 01:77d9 ????????
    db   $c3, $90, $1f, $2b, $29, $2a, $27, $00        ;; 01:77e1 ????????
    db   $2e, $2d, $24, $00, $00, $2f, $28, $00        ;; 01:77e9 ????????
    db   $00, $00, $2c, $4a, $11, $4d, $12, $6d        ;; 01:77f1 ????????
    db   $21, $5b, $13, $a7, $11, $b7, $12, $ae        ;; 01:77f9 ????????
    db   $21, $7b, $31, $0c, $78, $66, $78, $c0        ;; 01:7801 ????????
    db   $78, $f6, $78, $44, $55, $47, $77, $ff        ;; 01:7809 ????????
    db   $ff, $51, $4b, $6a, $30, $ff, $ff, $50        ;; 01:7811 ????????
    db   $31, $41, $73, $ff, $ff, $52, $46, $56        ;; 01:7819 ????????
    db   $62, $ff, $ff, $52, $32, $6b, $72, $ff        ;; 01:7821 ????????
    db   $ff, $4f, $33, $71, $63, $ff, $ff, $45        ;; 01:7829 ????????
    db   $58, $6e, $64, $ff, $ff, $34, $48, $5a        ;; 01:7831 ????????
    db   $5e, $ff, $ff, $35, $40, $5e, $65, $ff        ;; 01:7839 ????????
    db   $ff, $53, $3d, $6f, $6e, $ff, $ff, $3e        ;; 01:7841 ????????
    db   $60, $74, $66, $ff, $ff, $6c, $5c, $76        ;; 01:7849 ????????
    db   $67, $ff, $ff, $6c, $44, $5f, $68, $ff        ;; 01:7851 ????????
    db   $ff, $5f, $59, $49, $4c, $ff, $ff, $36        ;; 01:7859 ????????
    db   $75, $69, $70, $ff, $ff, $9b, $a9, $82        ;; 01:7861 ????????
    db   $b6, $ff, $ff, $87, $aa, $b8, $90, $ff        ;; 01:7869 ????????
    db   $ff, $ba, $84, $a4, $ad, $ff, $ff, $78        ;; 01:7871 ????????
    db   $91, $85, $92, $ff, $ff, $b9, $a2, $ab        ;; 01:7879 ????????
    db   $a3, $ff, $ff, $79, $86, $ac, $a5, $ff        ;; 01:7881 ????????

data_01_7889:
    db   $ff, $bb, $7a, $93, $98, $ff, $ff, $89        ;; 01:7889 ????????
    db   $b0, $7d, $99, $ff, $ff, $bd, $af, $a1        ;; 01:7891 ????????
    db   $8a, $ff, $ff, $7c, $88, $96, $bc, $ff        ;; 01:7899 ????????
    db   $ff, $bc, $b1, $8c, $80, $ff, $ff, $a6        ;; 01:78a1 ????????
    db   $9a, $8d, $b2, $ff, $ff, $b4, $81, $9b        ;; 01:78a9 ????????
    db   $9c, $ff, $ff, $8e, $a8, $82, $9d, $ff        ;; 01:78b1 ????????
    db   $ff, $b3, $8f, $9e, $9f, $ff, $ff, $c0        ;; 01:78b9 ????????
    db   $c1, $c2, $d1, $cb, $ca, $c0, $c3, $c6        ;; 01:78c1 ????????
    db   $c5, $cd, $ce, $c0, $c7, $c8, $c9, $cf        ;; 01:78c9 ????????
    db   $d0, $c1, $c3, $c6, $c5, $cd, $ce, $c1        ;; 01:78d1 ????????
    db   $c7, $c8, $c9, $cf, $d0, $c1, $c3, $c6        ;; 01:78d9 ????????
    db   $c4, $c5, $ca, $c2, $c3, $c6, $c5, $cd        ;; 01:78e1 ????????
    db   $ce, $c2, $c3, $c4, $cf, $d0, $d1, $c2        ;; 01:78e9 ????????
    db   $c3, $c6, $c4, $c5, $ca, $23, $0c, $1c        ;; 01:78f1 ????????
    db   $26, $ff, $ff, $00, $01, $10, $11, $ff        ;; 01:78f9 ????????
    db   $ff, $00, $03, $10, $13, $ff, $ff, $02        ;; 01:7901 ????????
    db   $03, $12, $13, $ff, $ff, $02, $05, $12        ;; 01:7909 ????????
    db   $15, $ff, $ff, $04, $05, $14, $15, $ff        ;; 01:7911 ????????
    db   $ff, $04, $07, $14, $17, $ff, $ff, $06        ;; 01:7919 ????????
    db   $0b, $16, $1b, $ff, $ff, $06, $09, $16        ;; 01:7921 ????????
    db   $19, $ff, $ff, $08, $09, $18, $19, $ff        ;; 01:7929 ????????
    db   $ff, $08, $0b, $18, $1b, $ff, $ff, $0a        ;; 01:7931 ????????
    db   $0b, $1a, $1b, $ff, $ff, $0d, $23, $1a        ;; 01:7939 ????????
    db   $22, $ff, $ff, $0c, $26, $1c, $1d, $ff        ;; 01:7941 ????????
    db   $ff, $0e, $0f, $1e, $1f, $ff, $ff, $3d        ;; 01:7949 ????????
    db   $f1, $25, $a4, $66, $a3, $e8, $a7, $dc        ;; 01:7951 ????????
    db   $a6, $d3, $ae, $79, $75, $8a, $75, $3c        ;; 01:7959 ????????
    db   $75, $2f, $75, $9c, $75, $af, $75, $bb        ;; 01:7961 ????????
    db   $75, $1c, $75, $24, $75, $2f, $75, $3c        ;; 01:7969 ????????
    db   $75                                           ;; 01:7971 ?

call_01_7972:
    call call_00_1d98                                  ;; 01:7972 $cd $98 $1d
    call call_01_7c1b                                  ;; 01:7975 $cd $1b $7c
    call call_00_39f3                                  ;; 01:7978 $cd $f3 $39
    ld   HL, data_01_7ab0                              ;; 01:797b $21 $b0 $7a
    call call_00_2ef6                                  ;; 01:797e $cd $f6 $2e
    xor  A, A                                          ;; 01:7981 $af
    call call_01_7bcc                                  ;; 01:7982 $cd $cc $7b
    call call_00_20cf                                  ;; 01:7985 $cd $cf $20
    rst  rst_00_0018                                   ;; 01:7988 $df
    db   $0b                                           ;; 01:7989 ?
    ld   HL, wC080                                     ;; 01:798a $21 $80 $c0
    ld   A, $50                                        ;; 01:798d $3e $50
    ld   [HL+], A                                      ;; 01:798f $22
    ld   [HL], $10                                     ;; 01:7990 $36 $10
    ld   HL, wC084                                     ;; 01:7992 $21 $84 $c0
    xor  A, A                                          ;; 01:7995 $af
    ld   [HL+], A                                      ;; 01:7996 $22
    ld   [HL], $58                                     ;; 01:7997 $36 $58
    ld   A, $ff                                        ;; 01:7999 $3e $ff
    ld   [wCA50], A                                    ;; 01:799b $ea $50 $ca
    call call_00_3a0c                                  ;; 01:799e $cd $0c $3a
    rst  rst_00_0018                                   ;; 01:79a1 $df
    db   $05                                           ;; 01:79a2 ?
    dw   call_01_7a43                                  ;; 01:79a3 ?? $00
    dw   call_01_7a8c                                  ;; 01:79a5 ?? $01
    dw   call_00_1e83                                  ;; 01:79a7 ?? $02
    dw   call_00_1e83                                  ;; 01:79a9 ?? $03
    dw   call_00_1e83                                  ;; 01:79ab ?? $04
    dw   call_00_1e83                                  ;; 01:79ad ?? $05
    dw   call_01_7a92                                  ;; 01:79af ?? $06
    dw   call_01_7aa1                                  ;; 01:79b1 ?? $07

jp_01_79b3:
    ld   A, $05                                        ;; 01:79b3 $3e $05
    call call_00_3cb2                                  ;; 01:79b5 $cd $b2 $3c
    jr   C, .jr_01_79d2                                ;; 01:79b8 $38 $18
    ld   A, $0e                                        ;; 01:79ba $3e $0e
    call call_00_3cb2                                  ;; 01:79bc $cd $b2 $3c
    jp   C, call_00_1e83                               ;; 01:79bf $da $83 $1e
    ld   A, $0f                                        ;; 01:79c2 $3e $0f
    call call_00_3cb2                                  ;; 01:79c4 $cd $b2 $3c
    jp   NC, call_00_1e83                              ;; 01:79c7 $d2 $83 $1e
    ld   A, $e1                                        ;; 01:79ca $3e $e1
    call call_00_3cb2                                  ;; 01:79cc $cd $b2 $3c
    jp   NC, call_00_1e83                              ;; 01:79cf $d2 $83 $1e
.jr_01_79d2:
    pop  HL                                            ;; 01:79d2 $e1
    pop  HL                                            ;; 01:79d3 $e1
    xor  A, A                                          ;; 01:79d4 $af
    ld   [wCD42], A                                    ;; 01:79d5 $ea $42 $cd
    call call_00_39f3                                  ;; 01:79d8 $cd $f3 $39
    call call_00_20cf                                  ;; 01:79db $cd $cf $20
    call call_00_3a4b                                  ;; 01:79de $cd $4b $3a
    call call_00_1df3                                  ;; 01:79e1 $cd $f3 $1d
    ld   A, $50                                        ;; 01:79e4 $3e $50
    ldh  [rWY], A                                      ;; 01:79e6 $e0 $4a
    ret                                                ;; 01:79e8 $c9
    db   $fe, $03, $47, $3e, $08, $28, $2e, $3e        ;; 01:79e9 ????????
    db   $05, $cd, $b2, $3c, $38, $47, $3e, $0e        ;; 01:79f1 ????????
    db   $cd, $b2, $3c, $38, $1b, $05, $3e, $0f        ;; 01:79f9 ????????
    db   $20, $0b, $cd, $b2, $3c, $38, $36, $df        ;; 01:7a01 ????????
    db   $8b, $ee, $03, $18, $10, $cd, $b2, $3c        ;; 01:7a09 ????????
    db   $30, $2b, $df, $8b, $ee, $05, $18, $05        ;; 01:7a11 ????????
    db   $05, $28, $ec, $18, $f5, $ea, $c0, $cd        ;; 01:7a19 ????????
    db   $11, $68, $48, $df, $3b, $21, $14, $73        ;; 01:7a21 ????????
    db   $11, $01, $08, $01, $12, $02, $3e, $24        ;; 01:7a29 ????????
    db   $df, $90, $df, $2e, $e6, $02, $20, $39        ;; 01:7a31 ????????

jr_01_7a39:
    pop  HL                                            ;; 01:7a39 $e1
    pop  HL                                            ;; 01:7a3a $e1
    rst  rst_00_0018                                   ;; 01:7a3b $df
    db   $09                                           ;; 01:7a3c ?
    ret                                                ;; 01:7a3d $c9
    db   $cd, $83, $1e, $18, $2f                       ;; 01:7a3e ?????

call_01_7a43:
    ld   A, [wC080]                                    ;; 01:7a43 $fa $80 $c0
    sub  A, $50                                        ;; 01:7a46 $d6 $50
    jr   Z, .jr_01_7a4c                                ;; 01:7a48 $28 $02
    ld   A, $01                                        ;; 01:7a4a $3e $01
.jr_01_7a4c:
    inc  A                                             ;; 01:7a4c $3c
    ld   [wCA57], A                                    ;; 01:7a4d $ea $57 $ca
    ld   A, [wC080]                                    ;; 01:7a50 $fa $80 $c0
    sub  A, $50                                        ;; 01:7a53 $d6 $50
    jp   Z, jp_01_79b3                                 ;; 01:7a55 $ca $b3 $79
    ld   HL, .data_01_7a6b                             ;; 01:7a58 $21 $6b $7a
    push HL                                            ;; 01:7a5b $e5
    swap A                                             ;; 01:7a5c $cb $37
    add  A, A                                          ;; 01:7a5e $87
    ld   HL, data_01_7a82                              ;; 01:7a5f $21 $82 $7a
    rst  add_hl_a                                      ;; 01:7a62 $c7
    xor  A, A                                          ;; 01:7a63 $af
    ld   [wC081], A                                    ;; 01:7a64 $ea $81 $c0
    ld   A, [HL+]                                      ;; 01:7a67 $2a
    ld   H, [HL]                                       ;; 01:7a68 $66
    ld   L, A                                          ;; 01:7a69 $6f
    jp   HL                                            ;; 01:7a6a $e9
.data_01_7a6b:
    db   $fa, $50, $ca, $3c, $c2, $e9, $79, $3e        ;; 01:7a6b ????????
    db   $ff, $ea, $50, $ca, $3e, $10, $ea, $81        ;; 01:7a73 ????????
    db   $c0, $af, $ea, $84, $c0, $af                  ;; 01:7a7b ??????

data_01_7a81:
    db   $c3                                           ;; 01:7a81 ?

data_01_7a82:
    db   $cc, $7b, $b2, $7a, $e9, $7a, $19, $7b        ;; 01:7a82 ????????
    db   $42, $7b                                      ;; 01:7a8a ??

call_01_7a8c:
    xor  A, A                                          ;; 01:7a8c $af
    ld   [wCA57], A                                    ;; 01:7a8d $ea $57 $ca
    jr   jr_01_7a39                                    ;; 01:7a90 $18 $a7

call_01_7a92:
    ld   HL, wC080                                     ;; 01:7a92 $21 $80 $c0
    ld   A, [HL]                                       ;; 01:7a95 $7e
    cp   A, $50                                        ;; 01:7a96 $fe $50
    jr   Z, .jr_01_7a9e                                ;; 01:7a98 $28 $04
    sub  A, $10                                        ;; 01:7a9a $d6 $10
    ld   [HL], A                                       ;; 01:7a9c $77
    ret                                                ;; 01:7a9d $c9
.jr_01_7a9e:
    ld   [HL], $90                                     ;; 01:7a9e $36 $90
    ret                                                ;; 01:7aa0 $c9

call_01_7aa1:
    ld   HL, wC080                                     ;; 01:7aa1 $21 $80 $c0
    ld   A, [HL]                                       ;; 01:7aa4 $7e
    cp   A, $90                                        ;; 01:7aa5 $fe $90
    jr   Z, .jr_01_7aad                                ;; 01:7aa7 $28 $04
    add  A, $10                                        ;; 01:7aa9 $c6 $10
    ld   [HL], A                                       ;; 01:7aab $77
    ret                                                ;; 01:7aac $c9
.jr_01_7aad:
    ld   [HL], $50                                     ;; 01:7aad $36 $50
    ret                                                ;; 01:7aaf $c9

data_01_7ab0:
    db   $00, $1f, $3e, $01, $cd, $cc, $7b, $fa        ;; 01:7ab0 ????????
    db   $f8, $c6, $e6, $03, $20, $08, $fa, $f9        ;; 01:7ab8 ????????
    db   $c6, $e6, $80, $ca, $b4, $7b, $21, $f4        ;; 01:7ac0 ????????
    db   $77, $cd, $c1, $7b, $cd, $6f, $7b, $c8        ;; 01:7ac8 ????????
    db   $fe, $03, $30, $09, $c6, $de, $f5, $cd        ;; 01:7ad0 ????????
    db   $01, $29, $c1, $20, $05, $cd, $83, $1e        ;; 01:7ad8 ????????
    db   $18, $ea, $78, $ea, $fa, $c6, $c3, $5b        ;; 01:7ae0 ????????
    db   $7b, $3e, $02, $cd, $cc, $7b, $fa, $f9        ;; 01:7ae8 ????????
    db   $c6, $e6, $70, $ca, $b4, $7b, $21, $13        ;; 01:7af0 ????????
    db   $78, $cd, $c1, $7b, $cd, $6f, $7b, $c8        ;; 01:7af8 ????????
    db   $fe, $03, $30, $09, $c6, $e1, $f5, $cd        ;; 01:7b00 ????????
    db   $01, $29, $c1, $20, $05, $cd, $83, $1e        ;; 01:7b08 ????????
    db   $18, $ea, $78, $d6, $e1, $ea, $50, $ca        ;; 01:7b10 ????????
    db   $c9, $3e, $03, $cd, $cc, $7b, $21, $44        ;; 01:7b18 ????????
    db   $78, $cd, $c1, $7b, $cd, $6f, $7b, $c8        ;; 01:7b20 ????????
    db   $fe, $04, $20, $02, $3e, $0c, $c6, $d8        ;; 01:7b28 ????????
    db   $f5, $cd, $01, $29, $c1, $20, $05, $cd        ;; 01:7b30 ????????
    db   $83, $1e, $18, $e8, $78, $ea, $fb, $c6        ;; 01:7b38 ????????
    db   $18, $19, $af, $ea, $84, $c0, $3e, $04        ;; 01:7b40 ????????
    db   $cd, $cc, $7b, $fa, $f8, $c6, $e6, $0c        ;; 01:7b48 ????????
    db   $28, $62, $21, $6f, $78, $cd, $c1, $7b        ;; 01:7b50 ????????
    db   $df, $2e, $c9, $af, $ea, $84, $c0, $21        ;; 01:7b58 ????????
    db   $2c, $78, $11, $03, $0a, $01, $0e, $02        ;; 01:7b60 ????????
    db   $3e, $24, $df, $90, $df, $2e, $c9, $3e        ;; 01:7b68 ????????
    db   $50, $ea, $84, $c0, $df, $05, $8d, $7b        ;; 01:7b70 ????????
    db   $86, $7b, $83, $1e, $83, $1e, $83, $1e        ;; 01:7b78 ????????
    db   $83, $1e, $96, $7b, $a5, $7b, $3e, $ff        ;; 01:7b80 ????????
    db   $fe, $ff, $c3, $79, $1e, $fa, $84, $c0        ;; 01:7b88 ????????

data_01_7b90:
    db   $d6, $50, $cb, $37, $18, $f2, $21, $84        ;; 01:7b90 ????????

data_01_7b98:
    db   $c0, $7e, $fe, $50, $28, $04, $d6, $10        ;; 01:7b98 ????????
    db   $77, $c9, $36, $90, $c9, $21, $84, $c0        ;; 01:7ba0 ????????
    db   $7e, $fe, $90, $28, $04, $c6, $10, $77        ;; 01:7ba8 ????????
    db   $c9, $36, $50, $c9, $af, $ea, $84, $c0        ;; 01:7bb0 ????????
    db   $21, $e2, $77, $cd, $c1, $7b, $df, $2e        ;; 01:7bb8 ????????
    db   $c9, $11, $01, $03, $01, $12, $02, $3e        ;; 01:7bc0 ????????
    db   $04, $df, $90, $c9                            ;; 01:7bc8 ????

call_01_7bcc:
    push AF                                            ;; 01:7bcc $f5
    ld   HL, .data_01_7c04                             ;; 01:7bcd $21 $04 $7c
    ld   DE, wC8B0                                     ;; 01:7bd0 $11 $b0 $c8
    ld   B, $17                                        ;; 01:7bd3 $06 $17
    rst  rst_00_0018                                   ;; 01:7bd5 $df
    db   $03                                           ;; 01:7bd6 ?
    pop  AF                                            ;; 01:7bd7 $f1
    add  A, A                                          ;; 01:7bd8 $87
    add  A, A                                          ;; 01:7bd9 $87
    ld   HL, .data_01_7bf0                             ;; 01:7bda $21 $f0 $7b
    rst  add_hl_a                                      ;; 01:7bdd $c7
    ld   DE, wC8B4                                     ;; 01:7bde $11 $b4 $c8
    call call_00_1f90                                  ;; 01:7be1 $cd $90 $1f
    ld   DE, wC8BB                                     ;; 01:7be4 $11 $bb $c8
    call call_00_1f90                                  ;; 01:7be7 $cd $90 $1f
    call call_00_1e49                                  ;; 01:7bea $cd $49 $1e
    rst  rst_00_0018                                   ;; 01:7bed $df
    db   $39                                           ;; 01:7bee ?
    ret                                                ;; 01:7bef $c9
.data_01_7bf0:
    db   $98, $77, $c5, $76, $d9, $77, $02, $78        ;; 01:7bf0 ????????
    db   $0c, $78, $22, $78, $3b, $78, $56, $78        ;; 01:7bf8 ????????
    db   $66, $78, $82, $78                            ;; 01:7c00 ????
.data_01_7c04:
    db   $01, $01, $12, $04, $c5, $76, $00, $0a        ;; 01:7c04 ????????
    db   $07, $09, $0a, $c5, $76, $00, $01, $07        ;; 01:7c0c ????????
    db   $07, $0a, $b6, $77, $00, $00, $00             ;; 01:7c14 ???????

call_01_7c1b:
    ld   BC, $80d8                                     ;; 01:7c1b $01 $d8 $80
    ld   HL, wC6F8                                     ;; 01:7c1e $21 $f8 $c6
.jr_01_7c21:
    call call_01_7c3a                                  ;; 01:7c21 $cd $3a $7c
    jr   Z, .jr_01_7c2c                                ;; 01:7c24 $28 $06
    ld   A, B                                          ;; 01:7c26 $78
    or   A, [HL]                                       ;; 01:7c27 $b6
    ld   [HL], A                                       ;; 01:7c28 $77
    call call_01_7c49                                  ;; 01:7c29 $cd $49 $7c
.jr_01_7c2c:
    rrc  B                                             ;; 01:7c2c $cb $08
    jr   NC, .jr_01_7c31                               ;; 01:7c2e $30 $01
    inc  HL                                            ;; 01:7c30 $23
.jr_01_7c31:
    inc  C                                             ;; 01:7c31 $0c
    ld   A, C                                          ;; 01:7c32 $79
    cp   A, $e5                                        ;; 01:7c33 $fe $e5
    jr   C, .jr_01_7c21                                ;; 01:7c35 $38 $ea
    rst  rst_00_0018                                   ;; 01:7c37 $df
    db   $18                                           ;; 01:7c38 ?
    ret                                                ;; 01:7c39 $c9

call_01_7c3a:
    push BC                                            ;; 01:7c3a $c5
    push HL                                            ;; 01:7c3b $e5
    ld   A, C                                          ;; 01:7c3c $79
    ld   [wCE91], A                                    ;; 01:7c3d $ea $91 $ce
    rst  rst_00_0018                                   ;; 01:7c40 $df
    db   $0e                                           ;; 01:7c41 ?
    ld   A, [wCE91]                                    ;; 01:7c42 $fa $91 $ce
    inc  A                                             ;; 01:7c45 $3c
    pop  HL                                            ;; 01:7c46 $e1
    pop  BC                                            ;; 01:7c47 $c1
    ret                                                ;; 01:7c48 $c9

call_01_7c49:
    push BC                                            ;; 01:7c49 $c5
    push HL                                            ;; 01:7c4a $e5
    ld   A, C                                          ;; 01:7c4b $79
    ld   [wCE94], A                                    ;; 01:7c4c $ea $94 $ce
    cp   A, $e1                                        ;; 01:7c4f $fe $e1
    jr   NC, .jr_01_7c5b                               ;; 01:7c51 $30 $08
    ld   HL, data_01_7b98                              ;; 01:7c53 $21 $98 $7b
    rst  add_hl_a                                      ;; 01:7c56 $c7
    ld   A, [HL]                                       ;; 01:7c57 $7e
    call call_00_3ca0                                  ;; 01:7c58 $cd $a0 $3c
.jr_01_7c5b:
    ld   HL, data_01_7889                              ;; 01:7c5b $21 $89 $78
    ld   DE, $101                                      ;; 01:7c5e $11 $01 $01
    ld   BC, $612                                      ;; 01:7c61 $01 $12 $06
    ld   A, $0c                                        ;; 01:7c64 $3e $0c
    rst  rst_00_0018                                   ;; 01:7c66 $df
    db   $90                                           ;; 01:7c67 ?
    rst  rst_00_0018                                   ;; 01:7c68 $df
    db   $2c                                           ;; 01:7c69 ?
    call call_00_35d2                                  ;; 01:7c6a $cd $d2 $35
    pop  HL                                            ;; 01:7c6d $e1
    pop  BC                                            ;; 01:7c6e $c1
    ret                                                ;; 01:7c6f $c9
    db   $30, $31, $32, $33, $36, $37, $38, $39        ;; 01:7c70 ????????
    db   $3a                                           ;; 01:7c78 ?

call_01_7c79:
    ld   A, $0a                                        ;; 01:7c79 $3e $0a
    ld   [wCED9], A                                    ;; 01:7c7b $ea $d9 $ce
    ld   A, $06                                        ;; 01:7c7e $3e $06
    ldh  [hFFBA], A                                    ;; 01:7c80 $e0 $ba
    call call_00_1d9e                                  ;; 01:7c82 $cd $9e $1d
    ld   HL, data_01_7dda                              ;; 01:7c85 $21 $da $7d
    ld   DE, wCDB4                                     ;; 01:7c88 $11 $b4 $cd
    call call_00_1f8d                                  ;; 01:7c8b $cd $8d $1f
    call call_00_1d7f                                  ;; 01:7c8e $cd $7f $1d
    ld   HL, call_01_4000                              ;; 01:7c91 $21 $00 $40
    ld   DE, $8800                                     ;; 01:7c94 $11 $00 $88
    ld   BC, $800                                      ;; 01:7c97 $01 $00 $08
    rst  rst_00_0018                                   ;; 01:7c9a $df
    db   $31                                           ;; 01:7c9b .
    ld   HL, wD000                                     ;; 01:7c9c $21 $00 $d0
    ld   BC, $800                                      ;; 01:7c9f $01 $00 $08
    rst  rst_00_0018                                   ;; 01:7ca2 $df
    db   $01                                           ;; 01:7ca3 .
    rst  rst_00_0018                                   ;; 01:7ca4 $df
    db   $39                                           ;; 01:7ca5 .
    rst  rst_00_0018                                   ;; 01:7ca6 $df
    db   $0b                                           ;; 01:7ca7 .
    ld   HL, data_01_71b5                              ;; 01:7ca8 $21 $b5 $71
    ld   DE, $8180                                     ;; 01:7cab $11 $80 $81
    ld   BC, $10                                       ;; 01:7cae $01 $10 $00
    rst  rst_00_0018                                   ;; 01:7cb1 $df
    db   $31                                           ;; 01:7cb2 .
    ld   DE, $9c22                                     ;; 01:7cb3 $11 $22 $9c
    ld   BC, $800                                      ;; 01:7cb6 $01 $00 $08
.jr_01_7cb9:
    push BC                                            ;; 01:7cb9 $c5
    push DE                                            ;; 01:7cba $d5
    ld   HL, wC880                                     ;; 01:7cbb $21 $80 $c8
    ld   A, $08                                        ;; 01:7cbe $3e $08
    sub  A, B                                          ;; 01:7cc0 $90
    swap A                                             ;; 01:7cc1 $cb $37
    add  A, C                                          ;; 01:7cc3 $81
    ld   C, $10                                        ;; 01:7cc4 $0e $10
.jr_01_7cc6:
    ld   [HL+], A                                      ;; 01:7cc6 $22
    inc  A                                             ;; 01:7cc7 $3c
    dec  C                                             ;; 01:7cc8 $0d
    jr   NZ, .jr_01_7cc6                               ;; 01:7cc9 $20 $fb
    ld   HL, wC880                                     ;; 01:7ccb $21 $80 $c8
    ld   BC, $10                                       ;; 01:7cce $01 $10 $00
    rst  rst_00_0018                                   ;; 01:7cd1 $df
    db   $01                                           ;; 01:7cd2 .
    pop  DE                                            ;; 01:7cd3 $d1
    pop  BC                                            ;; 01:7cd4 $c1
    ld   A, $20                                        ;; 01:7cd5 $3e $20
    call call_00_2466                                  ;; 01:7cd7 $cd $66 $24
    dec  B                                             ;; 01:7cda $05
    jr   NZ, .jr_01_7cb9                               ;; 01:7cdb $20 $dc
    ld   HL, data_01_7215                              ;; 01:7cdd $21 $15 $72
    ld   DE, $a06                                      ;; 01:7ce0 $11 $06 $0a
    ld   BC, $408                                      ;; 01:7ce3 $01 $08 $04
    ld   A, $04                                        ;; 01:7ce6 $3e $04
    rst  rst_00_0018                                   ;; 01:7ce8 $df
    db   $90                                           ;; 01:7ce9 .
    ld   DE, $e00                                      ;; 01:7cea $11 $00 $0e
    ld   BC, $414                                      ;; 01:7ced $01 $14 $04
    ld   A, $04                                        ;; 01:7cf0 $3e $04
    rst  rst_00_0018                                   ;; 01:7cf2 $df
    db   $90                                           ;; 01:7cf3 .
    ld   HL, wC080                                     ;; 01:7cf4 $21 $80 $c0
    ld   A, $78                                        ;; 01:7cf7 $3e $78
    ld   [HL+], A                                      ;; 01:7cf9 $22
    ld   [HL], $30                                     ;; 01:7cfa $36 $30
    ld   HL, wC060                                     ;; 01:7cfc $21 $60 $c0
    ld   A, $53                                        ;; 01:7cff $3e $53
    ld   [HL+], A                                      ;; 01:7d01 $22
    ld   [HL], $52                                     ;; 01:7d02 $36 $52
    call call_00_3a0c                                  ;; 01:7d04 $cd $0c $3a
    rst  rst_00_0018                                   ;; 01:7d07 $df
    db   $05                                           ;; 01:7d08 .
    dw   call_01_7d21                                  ;; 01:7d09 pP $00
    dw   call_00_1e83                                  ;; 01:7d0b ?? $01
    dw   call_00_1e83                                  ;; 01:7d0d ?? $02
    dw   call_00_1e83                                  ;; 01:7d0f ?? $03
    dw   call_00_1e83                                  ;; 01:7d11 ?? $04
    dw   call_00_1e83                                  ;; 01:7d13 ?? $05
    dw   call_01_7d19                                  ;; 01:7d15 pP $06
    dw   call_01_7d19                                  ;; 01:7d17 pP $07

call_01_7d19:
    ld   HL, wC080                                     ;; 01:7d19 $21 $80 $c0
    ld   A, [HL]                                       ;; 01:7d1c $7e
    xor  A, $10                                        ;; 01:7d1d $ee $10
    ld   [HL], A                                       ;; 01:7d1f $77
    ret                                                ;; 01:7d20 $c9

call_01_7d21:
    pop  HL                                            ;; 01:7d21 $e1
    pop  HL                                            ;; 01:7d22 $e1
    ld   HL, wC080                                     ;; 01:7d23 $21 $80 $c0
    ld   A, [HL]                                       ;; 01:7d26 $7e
    push AF                                            ;; 01:7d27 $f5
    call call_00_39f3                                  ;; 01:7d28 $cd $f3 $39
    ld   A, $00                                        ;; 01:7d2b $3e $00
    ld   [HL], A                                       ;; 01:7d2d $77
    ld   [wC060], A                                    ;; 01:7d2e $ea $60 $c0
    rst  rst_00_0018                                   ;; 01:7d31 $df
    db   $39                                           ;; 01:7d32 .
    call call_00_1d98                                  ;; 01:7d33 $cd $98 $1d
    pop  AF                                            ;; 01:7d36 $f1
    cp   A, $68                                        ;; 01:7d37 $fe $68
    jr   Z, .jr_01_7d40                                ;; 01:7d39 $28 $05
    rst  rst_00_0018                                   ;; 01:7d3b $df
    db   $3f                                           ;; 01:7d3c .
    jp   Z, .jp_01_7dc5                                ;; 01:7d3d $ca $c5 $7d
.jr_01_7d40:
    ld   HL, data_01_7a81                              ;; 01:7d40 $21 $81 $7a
    ld   DE, wC500                                     ;; 01:7d43 $11 $00 $c5
    ld   BC, $1e0                                      ;; 01:7d46 $01 $e0 $01
    rst  rst_00_0018                                   ;; 01:7d49 $df
    db   $74                                           ;; 01:7d4a .
    ld   HL, data_01_7e41                              ;; 01:7d4b $21 $41 $7e
    ld   DE, wC6E0                                     ;; 01:7d4e $11 $e0 $c6
    ld   B, $60                                        ;; 01:7d51 $06 $60
    rst  rst_00_0018                                   ;; 01:7d53 $df
    db   $73                                           ;; 01:7d54 .
    ld   HL, data_01_7ddd                              ;; 01:7d55 $21 $dd $7d
    ld   DE, wC760                                     ;; 01:7d58 $11 $60 $c7
    ld   B, $20                                        ;; 01:7d5b $06 $20
    rst  rst_00_0018                                   ;; 01:7d5d $df
    db   $03                                           ;; 01:7d5e .
    rst  rst_00_0018                                   ;; 01:7d5f $df
    db   $38                                           ;; 01:7d60 .
    ld   A, $01                                        ;; 01:7d61 $3e $01
    ld   [wCA6E], A                                    ;; 01:7d63 $ea $6e $ca
    call call_00_3a4b                                  ;; 01:7d66 $cd $4b $3a
    xor  A, A                                          ;; 01:7d69 $af
    ld   HL, $5ead                                     ;; 01:7d6a $21 $ad $5e
    ld   DE, $101                                      ;; 01:7d6d $11 $01 $01
    ld   BC, $612                                      ;; 01:7d70 $01 $12 $06
    rst  rst_00_0018                                   ;; 01:7d73 $df
    db   $90                                           ;; 01:7d74 .
    call call_00_39f3                                  ;; 01:7d75 $cd $f3 $39
    ld   HL, wC200                                     ;; 01:7d78 $21 $00 $c2
    xor  A, A                                          ;; 01:7d7b $af
    call call_00_1f49                                  ;; 01:7d7c $cd $49 $1f
    rst  rst_00_0018                                   ;; 01:7d7f $df
    db   $39                                           ;; 01:7d80 .
    call call_00_20cf                                  ;; 01:7d81 $cd $cf $20
    call call_00_240e                                  ;; 01:7d84 $cd $0e $24
    xor  A, A                                          ;; 01:7d87 $af
    rst  rst_00_0018                                   ;; 01:7d88 $df
    db   $8a                                           ;; 01:7d89 .
    ld   A, $08                                        ;; 01:7d8a $3e $08
    ld   [wC089], A                                    ;; 01:7d8c $ea $89 $c0
    ld   [wC08D], A                                    ;; 01:7d8f $ea $8d $c0
    call call_00_3a0c                                  ;; 01:7d92 $cd $0c $3a
    ld   B, $04                                        ;; 01:7d95 $06 $04
.jr_01_7d97:
    ld   A, $04                                        ;; 01:7d97 $3e $04
    sub  A, B                                          ;; 01:7d99 $90
    push BC                                            ;; 01:7d9a $c5
    rst  rst_00_0018                                   ;; 01:7d9b $df
    db   $89                                           ;; 01:7d9c .
    pop  BC                                            ;; 01:7d9d $c1
    ld   A, [wCDEA]                                    ;; 01:7d9e $fa $ea $cd
    inc  A                                             ;; 01:7da1 $3c
    jr   NZ, .jr_01_7dab                               ;; 01:7da2 $20 $07
    ld   A, B                                          ;; 01:7da4 $78
    cp   A, $04                                        ;; 01:7da5 $fe $04
    jr   Z, .jr_01_7d97                                ;; 01:7da7 $28 $ee
    inc  B                                             ;; 01:7da9 $04
    inc  B                                             ;; 01:7daa $04
.jr_01_7dab:
    dec  B                                             ;; 01:7dab $05
    jr   NZ, .jr_01_7d97                               ;; 01:7dac $20 $e9
    call call_00_39f3                                  ;; 01:7dae $cd $f3 $39
    ld   HL, wC620                                     ;; 01:7db1 $21 $20 $c6
    ld   DE, wC680                                     ;; 01:7db4 $11 $80 $c6
    ld   B, $60                                        ;; 01:7db7 $06 $60
    rst  rst_00_0018                                   ;; 01:7db9 $df
    db   $03                                           ;; 01:7dba .
    ld   A, $03                                        ;; 01:7dbb $3e $03
    ld   B, $02                                        ;; 01:7dbd $06 $02
    rst  rst_00_0018                                   ;; 01:7dbf $df
    db   $4a                                           ;; 01:7dc0 .
    ld   A, $04                                        ;; 01:7dc1 $3e $04
    rst  rst_00_0018                                   ;; 01:7dc3 $df
    db   $4b                                           ;; 01:7dc4 .
.jp_01_7dc5:
    call call_00_1e46                                  ;; 01:7dc5 $cd $46 $1e
    rst  rst_00_0018                                   ;; 01:7dc8 $df
    db   $ba                                           ;; 01:7dc9 .
    call call_00_3a4b                                  ;; 01:7dca $cd $4b $3a
    ld   A, $50                                        ;; 01:7dcd $3e $50
    ldh  [rWY], A                                      ;; 01:7dcf $e0 $4a
    call call_00_20cf                                  ;; 01:7dd1 $cd $cf $20
    call call_00_1df3                                  ;; 01:7dd4 $cd $f3 $1d
    jp   call_00_1dfd                                  ;; 01:7dd7 $c3 $fd $1d

data_01_7dda:
    db   $d2, $d0, $90                                 ;; 01:7dda ...

data_01_7ddd:
    db   $01, $02, $00, $f8, $03, $c0, $80, $00        ;; 01:7ddd ........
    db   $80, $00, $0c, $91, $1a, $00, $00, $01        ;; 01:7de5 ........
    db   $81, $00, $02, $a2, $a0, $02, $0f, $40        ;; 01:7ded ........
    db   $15, $20, $02, $10, $00, $00, $03, $ff        ;; 01:7df5 ........
    ld   HL, $9c00                                     ;; 01:7dfd $21 $00 $9c
    ld   A, $ff                                        ;; 01:7e00 $3e $ff
    ld   BC, $240                                      ;; 01:7e02 $01 $40 $02
    rst  rst_00_0018                                   ;; 01:7e05 $df
    db   $9f                                           ;; 01:7e06 .
    ret                                                ;; 01:7e07 $c9
    db   $cd, $7c, $1e, $18, $03, $cd, $83, $1e        ;; 01:7e08 ????????
    db   $3e, $01, $ea, $45, $cd, $fa, $80, $c0        ;; 01:7e10 ????????
    db   $f5, $fa, $88, $c0, $f5, $fa, $8c, $c0        ;; 01:7e18 ????????
    db   $f5, $e5, $11, $68, $48, $df, $3b, $e1        ;; 01:7e20 ????????
    db   $11, $01, $08, $01, $12, $02, $3e, $24        ;; 01:7e28 ????????
    db   $df, $90, $df, $2e, $af, $ea, $45, $cd        ;; 01:7e30 ????????
    db   $3c, $ea, $39, $cd, $f1, $ea, $8c, $c0        ;; 01:7e38 ????????
    db   $f1                                           ;; 01:7e40 ?

data_01_7e41:
    db   $ea, $88, $c0, $f1, $ea, $80, $c0, $c9        ;; 01:7e41 ????????
    call call_00_0150                                  ;; 01:7e49 $cd $50 $01
    jp   call_00_01a0                                  ;; 01:7e4c $c3 $a0 $01
    db   $90, $01, $90, $01, $bc, $02, $bc, $02        ;; 01:7e4f ????????
    db   $a4, $06, $a4, $06, $48, $0d, $48, $0d        ;; 01:7e57 ????????
    db   $7c, $15, $7c, $15, $34, $21, $34, $21        ;; 01:7e5f ????????
    db   $50, $46, $50, $46, $a8, $61, $a8, $61        ;; 01:7e67 ????????
    db   $90, $01, $90, $01, $bc, $02, $bc, $02        ;; 01:7e6f ????????
    db   $a4, $06, $a4, $06, $48, $0d, $48, $0d        ;; 01:7e77 ????????
    db   $7c                                           ;; 01:7e7f ?

data_01_7e80:
    db   $15, $7c, $15, $34, $21, $34, $21, $50        ;; 01:7e80 ????????
    db   $46, $50, $46, $a8, $61, $a8, $61, $00        ;; 01:7e88 ????????
    db   $00, $00, $00, $10, $27, $10, $27, $00        ;; 01:7e90 ????????
    db   $00, $00, $00, $68, $f1, $00, $00, $00        ;; 01:7e98 ????????

data_01_7ea0:
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 01:7ea0 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $c8        ;; 01:7ea8 ????????
    db   $00, $90, $01, $bc, $02, $4c, $04, $60        ;; 01:7eb0 ????????
    db   $09, $48, $0d, $a8, $61, $7c, $15, $00        ;; 01:7eb8 ????????

data_01_7ec0:
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 01:7ec0 ????????
    db   $00, $a0, $0f, $7c, $15, $34, $21, $48        ;; 01:7ec8 ????????
    db   $0d, $58, $02, $f4, $01, $60, $09, $c8        ;; 01:7ed0 ????????
    db   $32, $a4, $06, $f4, $01, $50, $46, $60        ;; 01:7ed8 ????????

data_01_7ee0:
    db   $09, $50, $46, $c8, $32, $64, $00, $50        ;; 01:7ee0 ????????
    db   $46, $c8, $32, $bc, $02, $4c, $04, $90        ;; 01:7ee8 ????????
    db   $01, $32, $00, $f4, $01, $a0, $0f, $a0        ;; 01:7ef0 ????????
    db   $0f, $50, $46, $bc, $02, $a4, $06, $a4        ;; 01:7ef8 ????????
    db   $06, $50, $46, $60, $09, $a8, $61, $34        ;; 01:7f00 ????????
    db   $21, $a0, $0f, $48, $0d, $c8, $32, $7c        ;; 01:7f08 ????????
    db   $15, $a0, $0f, $bc, $02, $a4, $06, $60        ;; 01:7f10 ????????
    db   $09, $7c, $15, $34, $21, $c8, $32, $a8        ;; 01:7f18 ????????
    db   $61, $60, $6d, $64, $00, $bc, $02, $c8        ;; 01:7f20 ????????
    db   $32, $50, $46, $a4, $06, $7c, $15, $50        ;; 01:7f28 ????????
    db   $c3, $a4, $06, $4c, $04, $f4, $01, $7c        ;; 01:7f30 ????????
    db   $15, $a8, $61, $34, $21, $50, $46, $bc        ;; 01:7f38 ????????
    db   $02, $14, $05, $a4, $06, $00, $00, $7c        ;; 01:7f40 ????????
    db   $15, $48, $0d, $08, $07, $a0, $0f, $34        ;; 01:7f48 ????????
    db   $21, $c8, $32, $50, $46, $a8, $61, $90        ;; 01:7f50 ????????
    db   $01, $4c, $04, $a4, $06, $32, $00, $7c        ;; 01:7f58 ????????
    db   $15, $60, $09, $a0, $0f, $c4, $09, $34        ;; 01:7f60 ????????
    db   $21, $c8, $32, $50, $46, $a8, $61, $c8        ;; 01:7f68 ????????
    db   $00, $bc, $02, $14, $05, $60, $09, $cc        ;; 01:7f70 ????????
    db   $10, $7c, $15, $7c, $15, $7c, $15, $28        ;; 01:7f78 ????????

data_01_7f80:
    db   $0a, $48, $0d, $34, $21, $c8, $32, $50        ;; 01:7f80 ????????
    db   $46, $50, $46, $a8, $61, $a8, $61, $32        ;; 01:7f88 ????????
    db   $00, $a0, $0f, $4c, $04, $a4, $06, $90        ;; 01:7f90 ????????
    db   $01, $60, $09, $34, $21, $c8, $32, $50        ;; 01:7f98 ????????

data_01_7fa0:
    db   $46, $50, $46, $32, $00, $4c, $04, $a4        ;; 01:7fa0 ????????
    db   $06, $f4, $01, $50, $46, $48, $0d, $60        ;; 01:7fa8 ????????
    db   $09, $7c, $15, $c8, $32, $50, $46, $34        ;; 01:7fb0 ????????
    db   $21, $00, $00, $50, $46, $50, $46, $64        ;; 01:7fb8 ????????

data_01_7fc0:
    db   $00, $bc, $02, $c8, $00, $40, $06, $7c        ;; 01:7fc0 ????????
    db   $15, $48, $0d, $7c, $15, $34, $21, $32        ;; 01:7fc8 ????????
    db   $00, $96, $00, $2c, $01, $c8, $00, $c8        ;; 01:7fd0 ????????
    db   $00, $c8, $00, $c8, $00, $c8, $00, $c8        ;; 01:7fd8 ????????

data_01_7fe0:
    db   $00, $c8, $00, $ac, $0d, $d0, $07, $e8        ;; 01:7fe0 ????????
    db   $03, $dc, $05, $dc, $05, $dc, $05, $dc        ;; 01:7fe8 ????????
    db   $05, $dc, $05                                 ;; 01:7ff0 ???
