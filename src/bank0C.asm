;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank0c", ROMX[$4000], BANK[$0c]
    ld   HL, wCC0F                                     ;; 0c:4000 $21 $0f $cc
    ld   A, $11                                        ;; 0c:4003 $3e $11
    ld   [HL+], A                                      ;; 0c:4005 $22
    ld   [HL], $cc                                     ;; 0c:4006 $36 $cc

jp_0c_4008:
    ld   A, [DE]                                       ;; 0c:4008 $1a
    and  A, $1f                                        ;; 0c:4009 $e6 $1f
    cp   A, $1f                                        ;; 0c:400b $fe $1f
    ret  Z                                             ;; 0c:400d $c8
    ld_long_store hFF9F, A                             ;; 0c:400e $ea $9f $ff
    ld   HL, .data_0c_4320                             ;; 0c:4011 $21 $20 $43
    jp   doJumptableHL                                 ;; 0c:4014 $c3 $3b $37
.jp_0c_4017:
    ld   A, [wCC03]                                    ;; 0c:4017 $fa $03 $cc
    cp   A, $03                                        ;; 0c:401a $fe $03
    jr   C, .jr_0c_4026                                ;; 0c:401c $38 $08
    cp   A, $05                                        ;; 0c:401e $fe $05
    jr   C, .jr_0c_4024                                ;; 0c:4020 $38 $02
    sub  A, $02                                        ;; 0c:4022 $d6 $02
.jr_0c_4024:
    sub  A, $03                                        ;; 0c:4024 $d6 $03
.jr_0c_4026:
    ld   C, A                                          ;; 0c:4026 $4f
    ld   HL, wCC01                                     ;; 0c:4027 $21 $01 $cc
    ld   A, [HL+]                                      ;; 0c:402a $2a
    ld   H, [HL]                                       ;; 0c:402b $66
    ld   L, A                                          ;; 0c:402c $6f
    push DE                                            ;; 0c:402d $d5
    ld   DE, wCC05                                     ;; 0c:402e $11 $05 $cc
    ld   A, C                                          ;; 0c:4031 $79
    cp   A, $01                                        ;; 0c:4032 $fe $01
    jr   Z, .jr_0c_403b                                ;; 0c:4034 $28 $05
    jr   C, .jr_0c_403e                                ;; 0c:4036 $38 $06
    ld   A, [DE]                                       ;; 0c:4038 $1a
    inc  DE                                            ;; 0c:4039 $13
    ld   [HL+], A                                      ;; 0c:403a $22
.jr_0c_403b:
    ld   A, [DE]                                       ;; 0c:403b $1a
    inc  DE                                            ;; 0c:403c $13
    ld   [HL+], A                                      ;; 0c:403d $22
.jr_0c_403e:
    ld   A, [DE]                                       ;; 0c:403e $1a
    ld   [HL+], A                                      ;; 0c:403f $22
    pop  DE                                            ;; 0c:4040 $d1
    jr   jp_0c_4008                                    ;; 0c:4041 $18 $c5
.data_0c_4043:
    inc  DE                                            ;; 0c:4043 $13
    ld   A, [wCC04]                                    ;; 0c:4044 $fa $04 $cc
    or   A, A                                          ;; 0c:4047 $b7
    jr   Z, .jp_0c_4017                                ;; 0c:4048 $28 $cd
    push DE                                            ;; 0c:404a $d5
    ld   DE, wCC0C                                     ;; 0c:404b $11 $0c $cc
    ld   HL, wCC05                                     ;; 0c:404e $21 $05 $cc
    call call_00_1d0c                                  ;; 0c:4051 $cd $0c $1d
    pop  DE                                            ;; 0c:4054 $d1
    ld   A, [wCC04]                                    ;; 0c:4055 $fa $04 $cc
    jr   Z, .jr_0c_4066                                ;; 0c:4058 $28 $0c
    jr   C, .jr_0c_4074                                ;; 0c:405a $38 $18
    cp   A, $0e                                        ;; 0c:405c $fe $0e
    jr   Z, jp_0c_4008                                 ;; 0c:405e $28 $a8
    cp   A, $10                                        ;; 0c:4060 $fe $10
    jr   Z, jp_0c_4008                                 ;; 0c:4062 $28 $a4
    jr   .jr_0c_407c                                   ;; 0c:4064 $18 $16
.jr_0c_4066:
    cp   A, $0c                                        ;; 0c:4066 $fe $0c
    jr   Z, jp_0c_4008                                 ;; 0c:4068 $28 $9e
    cp   A, $13                                        ;; 0c:406a $fe $13
    jr   Z, jp_0c_4008                                 ;; 0c:406c $28 $9a
    cp   A, $0f                                        ;; 0c:406e $fe $0f
    jr   NC, jp_0c_4008                                ;; 0c:4070 $30 $96
    jr   .jr_0c_407c                                   ;; 0c:4072 $18 $08
.jr_0c_4074:
    cp   A, $0d                                        ;; 0c:4074 $fe $0d
    jr   Z, jp_0c_4008                                 ;; 0c:4076 $28 $90
    cp   A, $0f                                        ;; 0c:4078 $fe $0f
    jr   Z, jp_0c_4008                                 ;; 0c:407a $28 $8c
.jr_0c_407c:
    ld   A, [DE]                                       ;; 0c:407c $1a
    and  A, $1f                                        ;; 0c:407d $e6 $1f
    cp   A, $1f                                        ;; 0c:407f $fe $1f
    jr   NZ, .jr_0c_4085                               ;; 0c:4081 $20 $02
    ld   A, $06                                        ;; 0c:4083 $3e $06
.jr_0c_4085:
    ld   B, $07                                        ;; 0c:4085 $06 $07
    ld   HL, .data_0c_437c                             ;; 0c:4087 $21 $7c $43
    call doJumptableHL                                 ;; 0c:408a $cd $3b $37
    jr   .jr_0c_4104                                   ;; 0c:408d $18 $75
.data_0c_408f:
    ld   A, [DE]                                       ;; 0c:408f $1a
    ld   B, A                                          ;; 0c:4090 $47
    swap A                                             ;; 0c:4091 $cb $37
    srl  A                                             ;; 0c:4093 $cb $3f
    and  A, $07                                        ;; 0c:4095 $e6 $07
    ld   C, A                                          ;; 0c:4097 $4f
    call call_0c_4433                                  ;; 0c:4098 $cd $33 $44
    inc  C                                             ;; 0c:409b $0c
    srl  B                                             ;; 0c:409c $cb $38
    jr   NC, .jr_0c_40aa                               ;; 0c:409e $30 $0a
.jr_0c_40a0:
    inc  [HL]                                          ;; 0c:40a0 $34
    jr   NZ, .jr_0c_40a7                               ;; 0c:40a1 $20 $04
    inc  HL                                            ;; 0c:40a3 $23
    dec  C                                             ;; 0c:40a4 $0d
    jr   NZ, .jr_0c_40a0                               ;; 0c:40a5 $20 $f9
.jr_0c_40a7:
    jp   jp_0c_4008                                    ;; 0c:40a7 $c3 $08 $40
.jr_0c_40aa:
    dec  [HL]                                          ;; 0c:40aa $35
    ld   A, [HL+]                                      ;; 0c:40ab $2a
    inc  A                                             ;; 0c:40ac $3c
    jr   NZ, .jr_0c_40a7                               ;; 0c:40ad $20 $f8
    dec  C                                             ;; 0c:40af $0d
    jr   NZ, .jr_0c_40aa                               ;; 0c:40b0 $20 $f8
    jr   .jr_0c_40a7                                   ;; 0c:40b2 $18 $f3
.data_0c_40b4:
    call call_0c_4433                                  ;; 0c:40b4 $cd $33 $44
    ld   A, [HL+]                                      ;; 0c:40b7 $2a
    ld   H, [HL]                                       ;; 0c:40b8 $66
    ld   L, A                                          ;; 0c:40b9 $6f
    jr   .jr_0c_40f1                                   ;; 0c:40ba $18 $35
.data_0c_40bc:
    ld   HL, .data_0c_40ce                             ;; 0c:40bc $21 $ce $40
    ld   A, [DE]                                       ;; 0c:40bf $1a
    swap A                                             ;; 0c:40c0 $cb $37
    srl  A                                             ;; 0c:40c2 $cb $3f
    and  A, $07                                        ;; 0c:40c4 $e6 $07
    add  A, A                                          ;; 0c:40c6 $87
    rst  add_hl_a                                      ;; 0c:40c7 $c7
    ld   A, [HL+]                                      ;; 0c:40c8 $2a
    ld   H, [HL]                                       ;; 0c:40c9 $66
    ld   L, A                                          ;; 0c:40ca $6f
    inc  DE                                            ;; 0c:40cb $13
    jr   .jr_0c_40f1                                   ;; 0c:40cc $18 $23
.data_0c_40ce:
    dw   data_0c_5f4a                                  ;; 0c:40ce pP
    dw   data_0c_782a                                  ;; 0c:40d0 pP
    dw   data_0c_7c9c                                  ;; 0c:40d2 pP
    dw   data_0c_756a                                  ;; 0c:40d4 pP
    dw   data_0c_7d38                                  ;; 0c:40d6 pP
    dw   data_0c_46b0                                  ;; 0c:40d8 pP
    dw   data_0c_4711                                  ;; 0c:40da pP
    dw   data_0c_47bb                                  ;; 0c:40dc pP
.data_0c_40de:
    dw   data_0c_5f4a                                  ;; 0c:40de pP
    dw   data_0c_7331                                  ;; 0c:40e0 pP
    db   $1a, $7e                                      ;; 0c:40e2 ??
    dw   data_0c_76ca                                  ;; 0c:40e4 pP
    db   $e0, $6c, $2d, $73                            ;; 0c:40e6 ????
.data_0c_40ea:
    inc  DE                                            ;; 0c:40ea $13
    ld   A, [DE]                                       ;; 0c:40eb $1a
    inc  DE                                            ;; 0c:40ec $13
    ld   L, A                                          ;; 0c:40ed $6f
    ld   A, [DE]                                       ;; 0c:40ee $1a
    inc  DE                                            ;; 0c:40ef $13
    ld   H, A                                          ;; 0c:40f0 $67
.jr_0c_40f1:
    push HL                                            ;; 0c:40f1 $e5
    ld   HL, wCC0F                                     ;; 0c:40f2 $21 $0f $cc
    ld   A, [HL+]                                      ;; 0c:40f5 $2a
    ld   H, [HL]                                       ;; 0c:40f6 $66
    ld   L, A                                          ;; 0c:40f7 $6f
    ld   A, E                                          ;; 0c:40f8 $7b
    ld   [HL+], A                                      ;; 0c:40f9 $22
    ld   A, D                                          ;; 0c:40fa $7a
    ld   [HL+], A                                      ;; 0c:40fb $22
    ld   C, H                                          ;; 0c:40fc $4c
    ld   A, L                                          ;; 0c:40fd $7d
    ld   HL, wCC0F                                     ;; 0c:40fe $21 $0f $cc
    ld   [HL+], A                                      ;; 0c:4101 $22
    ld   [HL], C                                       ;; 0c:4102 $71
    pop  DE                                            ;; 0c:4103 $d1
.jr_0c_4104:
    jp   jp_0c_4008                                    ;; 0c:4104 $c3 $08 $40
.data_0c_4107:
    ld   HL, wCC0F                                     ;; 0c:4107 $21 $0f $cc
    ld   A, [HL+]                                      ;; 0c:410a $2a
    ld   H, [HL]                                       ;; 0c:410b $66
    ld   L, A                                          ;; 0c:410c $6f
    dec  HL                                            ;; 0c:410d $2b
    ld   A, [HL-]                                      ;; 0c:410e $3a
    ld   D, A                                          ;; 0c:410f $57
    ld   E, [HL]                                       ;; 0c:4110 $5e
    ld   B, H                                          ;; 0c:4111 $44
    ld   A, L                                          ;; 0c:4112 $7d
    ld   HL, wCC0F                                     ;; 0c:4113 $21 $0f $cc
    ld   [HL+], A                                      ;; 0c:4116 $22
    ld   [HL], B                                       ;; 0c:4117 $70
    jr   .jr_0c_4104                                   ;; 0c:4118 $18 $ea
.data_0c_411a:
    inc  DE                                            ;; 0c:411a $13
    ld   L, E                                          ;; 0c:411b $6b
    ld   H, D                                          ;; 0c:411c $62
    jr   .jr_0c_4130                                   ;; 0c:411d $18 $11
.data_0c_411f:
    ld   HL, .data_0c_40de                             ;; 0c:411f $21 $de $40
    ld   A, [DE]                                       ;; 0c:4122 $1a
    swap A                                             ;; 0c:4123 $cb $37
    srl  A                                             ;; 0c:4125 $cb $3f
    and  A, $07                                        ;; 0c:4127 $e6 $07
    add  A, A                                          ;; 0c:4129 $87
    rst  add_hl_a                                      ;; 0c:412a $c7
    jr   .jr_0c_4130                                   ;; 0c:412b $18 $03
.data_0c_412d:
    call call_0c_4433                                  ;; 0c:412d $cd $33 $44
.jr_0c_4130:
    ld   A, [HL+]                                      ;; 0c:4130 $2a
    ld   D, [HL]                                       ;; 0c:4131 $56
    ld   E, A                                          ;; 0c:4132 $5f
    jr   .jr_0c_4104                                   ;; 0c:4133 $18 $cf
.data_0c_4135:
    inc  DE                                            ;; 0c:4135 $13
    ld   L, E                                          ;; 0c:4136 $6b
    ld   H, D                                          ;; 0c:4137 $62
    ld   A, [HL+]                                      ;; 0c:4138 $2a
    ld   C, A                                          ;; 0c:4139 $4f
    ld   A, [HL+]                                      ;; 0c:413a $2a
    ld   B, A                                          ;; 0c:413b $47
    push HL                                            ;; 0c:413c $e5
    ld   HL, .data_0c_4143                             ;; 0c:413d $21 $43 $41
    push HL                                            ;; 0c:4140 $e5
    push BC                                            ;; 0c:4141 $c5
    ret                                                ;; 0c:4142 $c9
.data_0c_4143:
    pop  DE                                            ;; 0c:4143 $d1
    jr   .jr_0c_4104                                   ;; 0c:4144 $18 $be
    db   $13, $1a, $13, $18, $b9                       ;; 0c:4146 ?????
.data_0c_414b:
    ld   A, [DE]                                       ;; 0c:414b $1a
    swap A                                             ;; 0c:414c $cb $37
    srl  A                                             ;; 0c:414e $cb $3f
    and  A, $07                                        ;; 0c:4150 $e6 $07
    ld   C, A                                          ;; 0c:4152 $4f
    call call_0c_4433                                  ;; 0c:4153 $cd $33 $44
    ld   A, C                                          ;; 0c:4156 $79
    cp   A, $03                                        ;; 0c:4157 $fe $03
    jr   C, .jr_0c_4167                                ;; 0c:4159 $38 $0c
    cp   A, $05                                        ;; 0c:415b $fe $05
    jr   NC, .jr_0c_4164                               ;; 0c:415d $30 $05
    ld   A, [HL+]                                      ;; 0c:415f $2a
    ld   H, [HL]                                       ;; 0c:4160 $66
    ld   L, A                                          ;; 0c:4161 $6f
    jr   .jr_0c_4167                                   ;; 0c:4162 $18 $03
.jr_0c_4164:
    ld   A, [DE]                                       ;; 0c:4164 $1a
    inc  DE                                            ;; 0c:4165 $13
    ld   H, A                                          ;; 0c:4166 $67
.jr_0c_4167:
    ld   B, H                                          ;; 0c:4167 $44
    ld   A, L                                          ;; 0c:4168 $7d
    ld   HL, wCC01                                     ;; 0c:4169 $21 $01 $cc
    ld   [HL+], A                                      ;; 0c:416c $22
    ld   A, B                                          ;; 0c:416d $78
    ld   [HL+], A                                      ;; 0c:416e $22
    ld   A, C                                          ;; 0c:416f $79
    ld   [HL+], A                                      ;; 0c:4170 $22
    ld   [HL], $00                                     ;; 0c:4171 $36 $00
    ld_long_load A, hFF9F                              ;; 0c:4173 $fa $9f $ff
    cp   A, $0b                                        ;; 0c:4176 $fe $0b
    jr   NZ, .jp_0c_4186                               ;; 0c:4178 $20 $0c
    ld   A, [DE]                                       ;; 0c:417a $1a
    inc  DE                                            ;; 0c:417b $13
    ld   HL, wCC05                                     ;; 0c:417c $21 $05 $cc
    ld   [HL+], A                                      ;; 0c:417f $22
    xor  A, A                                          ;; 0c:4180 $af
    ld   [HL+], A                                      ;; 0c:4181 $22
    ld   [HL], A                                       ;; 0c:4182 $77
    jp   .jp_0c_4017                                   ;; 0c:4183 $c3 $17 $40
.jp_0c_4186:
    ld   A, [DE]                                       ;; 0c:4186 $1a
    and  A, $1f                                        ;; 0c:4187 $e6 $1f
    ld   HL, .data_0c_433c                             ;; 0c:4189 $21 $3c $43
    jp   doJumptableHL                                 ;; 0c:418c $c3 $3b $37
.data_0c_418f:
    call call_0c_43c0                                  ;; 0c:418f $cd $c0 $43
    push DE                                            ;; 0c:4192 $d5
    ld   DE, wCC05                                     ;; 0c:4193 $11 $05 $cc
    ld   HL, wCC08                                     ;; 0c:4196 $21 $08 $cc
    call call_00_1cdd                                  ;; 0c:4199 $cd $dd $1c
    pop  DE                                            ;; 0c:419c $d1
    jr   .jp_0c_4186                                   ;; 0c:419d $18 $e7
.data_0c_419f:
    call call_0c_43c0                                  ;; 0c:419f $cd $c0 $43
    push DE                                            ;; 0c:41a2 $d5
    ld   DE, wCC05                                     ;; 0c:41a3 $11 $05 $cc
    ld   HL, wCC08                                     ;; 0c:41a6 $21 $08 $cc
    call call_00_1cf5                                  ;; 0c:41a9 $cd $f5 $1c
    pop  DE                                            ;; 0c:41ac $d1
    jr   .jp_0c_4186                                   ;; 0c:41ad $18 $d7
.data_0c_41af:
    call call_0c_43c0                                  ;; 0c:41af $cd $c0 $43
    push DE                                            ;; 0c:41b2 $d5
    ld   DE, wCC05                                     ;; 0c:41b3 $11 $05 $cc
    ld   HL, wCC08                                     ;; 0c:41b6 $21 $08 $cc
    call call_00_1cf5                                  ;; 0c:41b9 $cd $f5 $1c
    jr   NC, .jr_0c_41c5                               ;; 0c:41bc $30 $07
    ld   HL, wCC05                                     ;; 0c:41be $21 $05 $cc
    xor  A, A                                          ;; 0c:41c1 $af
    ld   [HL+], A                                      ;; 0c:41c2 $22
    ld   [HL+], A                                      ;; 0c:41c3 $22
    ld   [HL], A                                       ;; 0c:41c4 $77
.jr_0c_41c5:
    pop  DE                                            ;; 0c:41c5 $d1
    jr   .jp_0c_4186                                   ;; 0c:41c6 $18 $be
.data_0c_41c8:
    call call_0c_43c0                                  ;; 0c:41c8 $cd $c0 $43
    call call_0c_443a                                  ;; 0c:41cb $cd $3a $44
    call call_0c_4446                                  ;; 0c:41ce $cd $46 $44
    jr   .jp_0c_4186                                   ;; 0c:41d1 $18 $b3
.data_0c_41d3:
    call call_0c_43c0                                  ;; 0c:41d3 $cd $c0 $43
    call call_0c_443a                                  ;; 0c:41d6 $cd $3a $44
    or   A, [HL]                                       ;; 0c:41d9 $b6
    ld   [HL+], A                                      ;; 0c:41da $22
    ld   A, C                                          ;; 0c:41db $79
    or   A, [HL]                                       ;; 0c:41dc $b6
    ld   [HL+], A                                      ;; 0c:41dd $22
    ld   A, B                                          ;; 0c:41de $78
    or   A, [HL]                                       ;; 0c:41df $b6
    ld   [HL], A                                       ;; 0c:41e0 $77
    jr   .jp_0c_4186                                   ;; 0c:41e1 $18 $a3
    db   $cd, $c0, $43, $cd, $3a, $44, $cd, $46        ;; 0c:41e3 ????????
    db   $44, $21, $07, $cc, $cd, $3d, $44, $18        ;; 0c:41eb ????????
    db   $16                                           ;; 0c:41f3 ?
.data_0c_41f4:
    call call_0c_43c0                                  ;; 0c:41f4 $cd $c0 $43
    call call_0c_443a                                  ;; 0c:41f7 $cd $3a $44
    xor  A, [HL]                                       ;; 0c:41fa $ae
    ld   [HL+], A                                      ;; 0c:41fb $22
    ld   A, C                                          ;; 0c:41fc $79
    xor  A, [HL]                                       ;; 0c:41fd $ae
    ld   [HL+], A                                      ;; 0c:41fe $22
    ld   A, B                                          ;; 0c:41ff $78
    xor  A, [HL]                                       ;; 0c:4200 $ae
    ld   [HL], A                                       ;; 0c:4201 $77
    jr   .jp_0c_4186                                   ;; 0c:4202 $18 $82
    db   $cd, $c0, $43, $cd, $3a, $44, $2f, $22        ;; 0c:4204 ????????
    db   $79, $2f, $22, $78, $2f, $22, $18, $73        ;; 0c:420c ????????
.data_0c_4214:
    call call_0c_43c0                                  ;; 0c:4214 $cd $c0 $43
    ld   A, [wCC08]                                    ;; 0c:4217 $fa $08 $cc
.jr_0c_421a:
    sub  A, $01                                        ;; 0c:421a $d6 $01
    jr   C, .jr_0c_4287                                ;; 0c:421c $38 $69
    ld   HL, wCC07                                     ;; 0c:421e $21 $07 $cc
    srl  [HL]                                          ;; 0c:4221 $cb $3e
    dec  HL                                            ;; 0c:4223 $2b
    rr   [HL]                                          ;; 0c:4224 $cb $1e
    dec  HL                                            ;; 0c:4226 $2b
    rr   [HL]                                          ;; 0c:4227 $cb $1e
    jr   .jr_0c_421a                                   ;; 0c:4229 $18 $ef
.data_0c_422b:
    call call_0c_43c0                                  ;; 0c:422b $cd $c0 $43
    ld   A, [wCC08]                                    ;; 0c:422e $fa $08 $cc
.jr_0c_4231:
    sub  A, $01                                        ;; 0c:4231 $d6 $01
    jr   C, .jr_0c_4287                                ;; 0c:4233 $38 $52
    ld   HL, wCC05                                     ;; 0c:4235 $21 $05 $cc
    sla  [HL]                                          ;; 0c:4238 $cb $26
    inc  HL                                            ;; 0c:423a $23
    rl   [HL]                                          ;; 0c:423b $cb $16
    inc  HL                                            ;; 0c:423d $23
    rl   [HL]                                          ;; 0c:423e $cb $16
    jr   .jr_0c_4231                                   ;; 0c:4240 $18 $ef
.data_0c_4242:
    call call_0c_43c0                                  ;; 0c:4242 $cd $c0 $43
    ld   HL, wCC07                                     ;; 0c:4245 $21 $07 $cc
    ld   A, [HL]                                       ;; 0c:4248 $7e
    ld   [wCC0B], A                                    ;; 0c:4249 $ea $0b $cc
    call call_0c_441f                                  ;; 0c:424c $cd $1f $44
    ld   HL, wCC0A                                     ;; 0c:424f $21 $0a $cc
    ld   A, [HL+]                                      ;; 0c:4252 $2a
    xor  A, [HL]                                       ;; 0c:4253 $ae
    ld   [HL-], A                                      ;; 0c:4254 $32
    call call_0c_441f                                  ;; 0c:4255 $cd $1f $44
    push DE                                            ;; 0c:4258 $d5
    ld   HL, wCC08                                     ;; 0c:4259 $21 $08 $cc
    ld   A, [HL+]                                      ;; 0c:425c $2a
    ld   D, [HL]                                       ;; 0c:425d $56
    ld   E, A                                          ;; 0c:425e $5f
    ld   HL, wCC05                                     ;; 0c:425f $21 $05 $cc
    ld   A, [HL+]                                      ;; 0c:4262 $2a
    ld   H, [HL]                                       ;; 0c:4263 $66
    ld   L, A                                          ;; 0c:4264 $6f
    call call_00_1c7e                                  ;; 0c:4265 $cd $7e $1c
    ld   A, [wCC0B]                                    ;; 0c:4268 $fa $0b $cc
    and  A, $80                                        ;; 0c:426b $e6 $80
    jr   Z, .jr_0c_427e                                ;; 0c:426d $28 $0f
    ld   H, $00                                        ;; 0c:426f $26 $00
    ld   E, A                                          ;; 0c:4271 $5f
    cpl                                                ;; 0c:4272 $2f
    add  A, $01                                        ;; 0c:4273 $c6 $01
    ld   E, A                                          ;; 0c:4275 $5f
    ld   A, D                                          ;; 0c:4276 $7a
    cpl                                                ;; 0c:4277 $2f
    adc  A, H                                          ;; 0c:4278 $8c
    ld   D, A                                          ;; 0c:4279 $57
    ld   A, L                                          ;; 0c:427a $7d
    cpl                                                ;; 0c:427b $2f
    adc  A, H                                          ;; 0c:427c $8c
    ld   L, A                                          ;; 0c:427d $6f
.jr_0c_427e:
    ld   A, L                                          ;; 0c:427e $7d
    ld   HL, wCC07                                     ;; 0c:427f $21 $07 $cc
    ld   [HL-], A                                      ;; 0c:4282 $32
    ld   A, D                                          ;; 0c:4283 $7a
    ld   [HL-], A                                      ;; 0c:4284 $32
    ld   [HL], E                                       ;; 0c:4285 $73
    pop  DE                                            ;; 0c:4286 $d1
.jr_0c_4287:
    jp   .jp_0c_4186                                   ;; 0c:4287 $c3 $86 $41
.data_0c_428a:
    call call_0c_43c0                                  ;; 0c:428a $cd $c0 $43
    ld   HL, wCC07                                     ;; 0c:428d $21 $07 $cc
    ld   A, [HL]                                       ;; 0c:4290 $7e
    ld   [wCC0B], A                                    ;; 0c:4291 $ea $0b $cc
    call call_0c_441f                                  ;; 0c:4294 $cd $1f $44
    ld   HL, wCC0A                                     ;; 0c:4297 $21 $0a $cc
    ld   A, [HL+]                                      ;; 0c:429a $2a
    xor  A, [HL]                                       ;; 0c:429b $ae
    ld   [HL-], A                                      ;; 0c:429c $32
    call call_0c_441f                                  ;; 0c:429d $cd $1f $44
    push DE                                            ;; 0c:42a0 $d5
    ld   HL, wCC08                                     ;; 0c:42a1 $21 $08 $cc
    ld   A, [HL+]                                      ;; 0c:42a4 $2a
    ld   D, [HL]                                       ;; 0c:42a5 $56
    ld   E, A                                          ;; 0c:42a6 $5f
    ld   HL, wCC05                                     ;; 0c:42a7 $21 $05 $cc
    ld   A, [HL+]                                      ;; 0c:42aa $2a
    ld   H, [HL]                                       ;; 0c:42ab $66
    ld   L, A                                          ;; 0c:42ac $6f
    call call_00_1c9c                                  ;; 0c:42ad $cd $9c $1c
    ld   E, L                                          ;; 0c:42b0 $5d
    ld   D, H                                          ;; 0c:42b1 $54
    ld   L, $00                                        ;; 0c:42b2 $2e $00
    ld   A, [wCC0B]                                    ;; 0c:42b4 $fa $0b $cc
    and  A, $80                                        ;; 0c:42b7 $e6 $80
    jr   Z, .jr_0c_427e                                ;; 0c:42b9 $28 $c3
    dec  L                                             ;; 0c:42bb $2d
    ld   A, E                                          ;; 0c:42bc $7b
    cpl                                                ;; 0c:42bd $2f
    add  A, $01                                        ;; 0c:42be $c6 $01
    ld   E, A                                          ;; 0c:42c0 $5f
    ld   A, D                                          ;; 0c:42c1 $7a
    cpl                                                ;; 0c:42c2 $2f
    adc  A, $00                                        ;; 0c:42c3 $ce $00
    ld   D, A                                          ;; 0c:42c5 $57
    jr   .jr_0c_427e                                   ;; 0c:42c6 $18 $b6
.data_0c_42c8:
    ld   A, $01                                        ;; 0c:42c8 $3e $01
    ld   [wCC04], A                                    ;; 0c:42ca $ea $04 $cc
.jr_0c_42cd:
    call call_0c_43c0                                  ;; 0c:42cd $cd $c0 $43
.jr_0c_42d0:
    ld   HL, wCC05                                     ;; 0c:42d0 $21 $05 $cc
    ld   BC, wCC08                                     ;; 0c:42d3 $01 $08 $cc
    ld   A, [BC]                                       ;; 0c:42d6 $0a
    inc  BC                                            ;; 0c:42d7 $03
    ld   [HL+], A                                      ;; 0c:42d8 $22
    ld   A, [BC]                                       ;; 0c:42d9 $0a
    inc  BC                                            ;; 0c:42da $03
    ld   [HL+], A                                      ;; 0c:42db $22
    ld   A, [BC]                                       ;; 0c:42dc $0a
    ld   [HL], A                                       ;; 0c:42dd $77
.jr_0c_42de:
    jp   .jp_0c_4186                                   ;; 0c:42de $c3 $86 $41
.data_0c_42e1:
    ld   HL, wCC04                                     ;; 0c:42e1 $21 $04 $cc
    ld   A, [HL]                                       ;; 0c:42e4 $7e
    and  A, A                                          ;; 0c:42e5 $a7
    jr   Z, .jr_0c_42cd                                ;; 0c:42e6 $28 $e5
    call call_0c_444f                                  ;; 0c:42e8 $cd $4f $44
    jr   .jr_0c_42cd                                   ;; 0c:42eb $18 $e0
.data_0c_42ed:
    call call_0c_4433                                  ;; 0c:42ed $cd $33 $44
    push DE                                            ;; 0c:42f0 $d5
    ld   A, [HL]                                       ;; 0c:42f1 $7e
    ld   D, A                                          ;; 0c:42f2 $57
    ld   E, $00                                        ;; 0c:42f3 $1e $00
    ld   A, $05                                        ;; 0c:42f5 $3e $05
    call call_00_1d2e                                  ;; 0c:42f7 $cd $2e $1d
    pop  DE                                            ;; 0c:42fa $d1
    ld   HL, wCC05                                     ;; 0c:42fb $21 $05 $cc
    ld   [HL+], A                                      ;; 0c:42fe $22
    xor  A, A                                          ;; 0c:42ff $af
    ld   [HL+], A                                      ;; 0c:4300 $22
    ld   [HL], A                                       ;; 0c:4301 $77
    jr   .jr_0c_42de                                   ;; 0c:4302 $18 $da
.data_0c_4304:
    ld   HL, wCC04                                     ;; 0c:4304 $21 $04 $cc
    ld   A, [HL]                                       ;; 0c:4307 $7e
    and  A, A                                          ;; 0c:4308 $a7
    call NZ, call_0c_444f                              ;; 0c:4309 $c4 $4f $44
    ld   A, [DE]                                       ;; 0c:430c $1a
    inc  DE                                            ;; 0c:430d $13
    swap A                                             ;; 0c:430e $cb $37
    srl  A                                             ;; 0c:4310 $cb $3f
    and  A, $07                                        ;; 0c:4312 $e6 $07
    ld   C, A                                          ;; 0c:4314 $4f
    ld   A, [DE]                                       ;; 0c:4315 $1a
    inc  DE                                            ;; 0c:4316 $13
    ld   L, A                                          ;; 0c:4317 $6f
    ld   A, [DE]                                       ;; 0c:4318 $1a
    inc  DE                                            ;; 0c:4319 $13
    ld   H, A                                          ;; 0c:431a $67
    call call_0c_43d6                                  ;; 0c:431b $cd $d6 $43
    jr   .jr_0c_42d0                                   ;; 0c:431e $18 $b0
.data_0c_4320:
    dw   .data_0c_414b                                 ;; 0c:4320 pP
    dw   .data_0c_42c8                                 ;; 0c:4322 pP
    dw   .data_0c_411a                                 ;; 0c:4324 pP
    dw   .data_0c_4135                                 ;; 0c:4326 pP
    db   $46, $41                                      ;; 0c:4328 ??
    dw   .data_0c_40ea                                 ;; 0c:432a pP
    dw   .data_0c_4107                                 ;; 0c:432c pP
    dw   .data_0c_408f                                 ;; 0c:432e pP
    db   $8f, $40                                      ;; 0c:4330 ??
    dw   .data_0c_40b4                                 ;; 0c:4332 pP
    dw   .data_0c_412d                                 ;; 0c:4334 pP
    dw   .data_0c_414b                                 ;; 0c:4336 pP
    dw   .data_0c_40bc                                 ;; 0c:4338 pP
    dw   .data_0c_411f                                 ;; 0c:433a pP
.data_0c_433c:
    db   $cd, $42                                      ;; 0c:433c ??
    dw   .data_0c_4242                                 ;; 0c:433e pP
    dw   .data_0c_428a                                 ;; 0c:4340 pP
    dw   .data_0c_418f                                 ;; 0c:4342 pP
    dw   .data_0c_419f                                 ;; 0c:4344 pP
    dw   .data_0c_41c8                                 ;; 0c:4346 pP
    dw   .data_0c_41d3                                 ;; 0c:4348 pP
    db   $e3, $41                                      ;; 0c:434a ??
    dw   .data_0c_41f4                                 ;; 0c:434c pP
    db   $04, $42                                      ;; 0c:434e ??
    dw   .data_0c_4214                                 ;; 0c:4350 pP
    dw   .data_0c_422b                                 ;; 0c:4352 pP
    dw   .data_0c_42e1                                 ;; 0c:4354 pP
    dw   .data_0c_42e1                                 ;; 0c:4356 pP
    dw   .data_0c_42e1                                 ;; 0c:4358 pP
    dw   .data_0c_42e1                                 ;; 0c:435a pP
    dw   .data_0c_42e1                                 ;; 0c:435c pP
    dw   .data_0c_41af                                 ;; 0c:435e pP
    dw   .data_0c_42ed                                 ;; 0c:4360 pP
    dw   .data_0c_4304                                 ;; 0c:4362 pP
    db   $cd, $42, $cd, $42, $cd, $42, $cd, $42        ;; 0c:4364 ????????
    db   $cd, $42, $cd, $42, $cd, $42, $cd, $42        ;; 0c:436c ????????
    db   $cd, $42, $cd, $42, $cd, $42                  ;; 0c:4374 ??????
    dw   .data_0c_4043                                 ;; 0c:437a pP
.data_0c_437c:
    dw   .data_0c_4398                                 ;; 0c:437c pP
    db   $a5, $43                                      ;; 0c:437e ??
    dw   .data_0c_43bc                                 ;; 0c:4380 pP
    db   $bc, $43, $bd, $43                            ;; 0c:4382 ????
    dw   .data_0c_43bc                                 ;; 0c:4386 pP
    dw   .jr_0c_43be                                   ;; 0c:4388 pP
    dw   .data_0c_43bd                                 ;; 0c:438a pP
    db   $bd, $43, $bd, $43, $bd, $43, $be, $43        ;; 0c:438c ????????
    db   $be, $43                                      ;; 0c:4394 ??
    dw   .jr_0c_43be                                   ;; 0c:4396 pP
.data_0c_4398:
    ld   A, [DE]                                       ;; 0c:4398 $1a
    swap A                                             ;; 0c:4399 $cb $37
    srl  A                                             ;; 0c:439b $cb $3f
    and  A, B                                          ;; 0c:439d $a0
    cp   A, $05                                        ;; 0c:439e $fe $05
    jr   C, .jr_0c_43a3                                ;; 0c:43a0 $38 $01
.jr_0c_43a2:
    inc  DE                                            ;; 0c:43a2 $13
.jr_0c_43a3:
    inc  DE                                            ;; 0c:43a3 $13
    inc  DE                                            ;; 0c:43a4 $13
    ld   A, [DE]                                       ;; 0c:43a5 $1a
    ld   C, A                                          ;; 0c:43a6 $4f
    and  A, $1f                                        ;; 0c:43a7 $e6 $1f
    cp   A, $1f                                        ;; 0c:43a9 $fe $1f
    jr   Z, .jr_0c_43be                                ;; 0c:43ab $28 $11
    cp   A, $13                                        ;; 0c:43ad $fe $13
    jr   Z, .jr_0c_43a2                                ;; 0c:43af $28 $f1
    ld   A, C                                          ;; 0c:43b1 $79
    swap A                                             ;; 0c:43b2 $cb $37
    srl  A                                             ;; 0c:43b4 $cb $3f
    and  A, B                                          ;; 0c:43b6 $a0
    cp   A, B                                          ;; 0c:43b7 $b8
    jr   NZ, .jr_0c_43a3                               ;; 0c:43b8 $20 $e9
    jr   .jr_0c_43a2                                   ;; 0c:43ba $18 $e6
.data_0c_43bc:
    inc  DE                                            ;; 0c:43bc $13
.data_0c_43bd:
    inc  DE                                            ;; 0c:43bd $13
.jr_0c_43be:
    inc  DE                                            ;; 0c:43be $13
    ret                                                ;; 0c:43bf $c9

call_0c_43c0:
    ld   A, [DE]                                       ;; 0c:43c0 $1a
    inc  DE                                            ;; 0c:43c1 $13
    swap A                                             ;; 0c:43c2 $cb $37
    srl  A                                             ;; 0c:43c4 $cb $3f
    and  A, $07                                        ;; 0c:43c6 $e6 $07
    ld   C, A                                          ;; 0c:43c8 $4f
    cp   A, $05                                        ;; 0c:43c9 $fe $05
    jr   Z, jr_0c_440b                                 ;; 0c:43cb $28 $3e
    cp   A, $06                                        ;; 0c:43cd $fe $06
    jr   Z, jr_0c_4407                                 ;; 0c:43cf $28 $36
    jr   NC, jr_0c_43fb                                ;; 0c:43d1 $30 $28
    call call_0c_4434                                  ;; 0c:43d3 $cd $34 $44

call_0c_43d6:
    ld   A, C                                          ;; 0c:43d6 $79
    cp   A, $03                                        ;; 0c:43d7 $fe $03
    jr   C, .jr_0c_43e1                                ;; 0c:43d9 $38 $06
    dec  C                                             ;; 0c:43db $0d
    dec  C                                             ;; 0c:43dc $0d
    dec  C                                             ;; 0c:43dd $0d
    ld   A, [HL+]                                      ;; 0c:43de $2a
    ld   H, [HL]                                       ;; 0c:43df $66
    ld   L, A                                          ;; 0c:43e0 $6f
.jr_0c_43e1:
    push DE                                            ;; 0c:43e1 $d5
    ld   DE, wCC0A                                     ;; 0c:43e2 $11 $0a $cc
    xor  A, A                                          ;; 0c:43e5 $af
    ld   [DE], A                                       ;; 0c:43e6 $12
    dec  DE                                            ;; 0c:43e7 $1b
    ld   [DE], A                                       ;; 0c:43e8 $12
    dec  DE                                            ;; 0c:43e9 $1b
    ld   A, C                                          ;; 0c:43ea $79
    cp   A, $01                                        ;; 0c:43eb $fe $01
    jr   Z, .jr_0c_43f4                                ;; 0c:43ed $28 $05
    jr   C, .jr_0c_43f7                                ;; 0c:43ef $38 $06
    ld   A, [HL+]                                      ;; 0c:43f1 $2a
    ld   [DE], A                                       ;; 0c:43f2 $12
    inc  DE                                            ;; 0c:43f3 $13
.jr_0c_43f4:
    ld   A, [HL+]                                      ;; 0c:43f4 $2a
    ld   [DE], A                                       ;; 0c:43f5 $12
    inc  DE                                            ;; 0c:43f6 $13
.jr_0c_43f7:
    ld   A, [HL]                                       ;; 0c:43f7 $7e
    ld   [DE], A                                       ;; 0c:43f8 $12
    pop  DE                                            ;; 0c:43f9 $d1
    ret                                                ;; 0c:43fa $c9

jr_0c_43fb:
    ld   HL, wCC08                                     ;; 0c:43fb $21 $08 $cc
    ld   A, [DE]                                       ;; 0c:43fe $1a
    inc  DE                                            ;; 0c:43ff $13
    ld   [HL+], A                                      ;; 0c:4400 $22
    ld   A, [DE]                                       ;; 0c:4401 $1a
    inc  DE                                            ;; 0c:4402 $13
    ld   [HL+], A                                      ;; 0c:4403 $22
    ld   [HL], $00                                     ;; 0c:4404 $36 $00
    ret                                                ;; 0c:4406 $c9

jr_0c_4407:
    ld   A, [DE]                                       ;; 0c:4407 $1a
    inc  DE                                            ;; 0c:4408 $13
    jr   jr_0c_4417                                    ;; 0c:4409 $18 $0c

jr_0c_440b:
    ld   A, [DE]                                       ;; 0c:440b $1a
    inc  DE                                            ;; 0c:440c $13
    push DE                                            ;; 0c:440d $d5
    ld   D, A                                          ;; 0c:440e $57
    ld   E, $00                                        ;; 0c:440f $1e $00
    ld   A, $06                                        ;; 0c:4411 $3e $06
    call call_00_1d2e                                  ;; 0c:4413 $cd $2e $1d
    pop  DE                                            ;; 0c:4416 $d1

jr_0c_4417:
    ld   HL, wCC08                                     ;; 0c:4417 $21 $08 $cc
    ld   [HL+], A                                      ;; 0c:441a $22
    xor  A, A                                          ;; 0c:441b $af
    ld   [HL+], A                                      ;; 0c:441c $22
    ld   [HL], A                                       ;; 0c:441d $77
    ret                                                ;; 0c:441e $c9

call_0c_441f:
    ld   A, [HL]                                       ;; 0c:441f $7e
    bit  7, A                                          ;; 0c:4420 $cb $7f
    ret  Z                                             ;; 0c:4422 $c8
    cpl                                                ;; 0c:4423 $2f
    ld   [HL-], A                                      ;; 0c:4424 $32
    ld   A, [HL]                                       ;; 0c:4425 $7e
    cpl                                                ;; 0c:4426 $2f
    ld   [HL-], A                                      ;; 0c:4427 $32
    ld   A, [HL]                                       ;; 0c:4428 $7e
    cpl                                                ;; 0c:4429 $2f
    inc  A                                             ;; 0c:442a $3c
    ld   [HL], A                                       ;; 0c:442b $77
    ret  NZ                                            ;; 0c:442c $c0
    inc  HL                                            ;; 0c:442d $23
    inc  [HL]                                          ;; 0c:442e $34
    ret  NZ                                            ;; 0c:442f $c0
    inc  HL                                            ;; 0c:4430 $23
    inc  [HL]                                          ;; 0c:4431 $34
    ret                                                ;; 0c:4432 $c9

call_0c_4433:
    inc  DE                                            ;; 0c:4433 $13

call_0c_4434:
    ld   A, [DE]                                       ;; 0c:4434 $1a
    inc  DE                                            ;; 0c:4435 $13
    ld   L, A                                          ;; 0c:4436 $6f
    ld   H, $c9                                        ;; 0c:4437 $26 $c9
    ret                                                ;; 0c:4439 $c9

call_0c_443a:
    ld   HL, wCC0A                                     ;; 0c:443a $21 $0a $cc
    ld   A, [HL-]                                      ;; 0c:443d $3a
    ld   B, A                                          ;; 0c:443e $47
    ld   A, [HL-]                                      ;; 0c:443f $3a
    ld   C, A                                          ;; 0c:4440 $4f
    ld   A, [HL]                                       ;; 0c:4441 $7e
    ld   HL, wCC05                                     ;; 0c:4442 $21 $05 $cc
    ret                                                ;; 0c:4445 $c9

call_0c_4446:
    and  A, [HL]                                       ;; 0c:4446 $a6
    ld   [HL+], A                                      ;; 0c:4447 $22
    ld   A, C                                          ;; 0c:4448 $79
    and  A, [HL]                                       ;; 0c:4449 $a6
    ld   [HL+], A                                      ;; 0c:444a $22
    ld   A, B                                          ;; 0c:444b $78
    and  A, [HL]                                       ;; 0c:444c $a6
    ld   [HL], A                                       ;; 0c:444d $77
    ret                                                ;; 0c:444e $c9

call_0c_444f:
    ld   A, [DE]                                       ;; 0c:444f $1a
    and  A, $1f                                        ;; 0c:4450 $e6 $1f
    ld   [HL+], A                                      ;; 0c:4452 $22
    ld   BC, wCC0C                                     ;; 0c:4453 $01 $0c $cc
    ld   A, [HL+]                                      ;; 0c:4456 $2a
    ld   [BC], A                                       ;; 0c:4457 $02
    inc  BC                                            ;; 0c:4458 $03
    ld   A, [HL+]                                      ;; 0c:4459 $2a
    ld   [BC], A                                       ;; 0c:445a $02
    inc  BC                                            ;; 0c:445b $03
    ld   A, [HL]                                       ;; 0c:445c $7e
    ld   [BC], A                                       ;; 0c:445d $02
    ret                                                ;; 0c:445e $c9
    db   $21, $5e, $cc, $11, $7b, $d8, $0e, $03        ;; 0c:445f ????????
    db   $af, $06, $08, $cb, $06, $ce, $00, $05        ;; 0c:4467 ????????
    db   $20, $f9, $12, $23, $13, $0d, $20, $f0        ;; 0c:446f ????????
    db   $c9                                           ;; 0c:4477 ?

data_0c_4478:
    db   $0b, $e7, $07, $ec, $03                       ;; 0c:4478 .....
    dw   data_0c_4490                                  ;; 0c:447d pP
    db   $06, $0b, $e7, $07, $ec, $03, $9c, $44        ;; 0c:447f .???????
    db   $06                                           ;; 0c:4487 ?

data_0c_4488:
    db   $0b, $e7, $48, $ec, $03                       ;; 0c:4488 .....
    dw   data_0c_44ac                                  ;; 0c:448d pP
    db   $06                                           ;; 0c:448f .

data_0c_4490:
    ld   HL, wC9C2                                     ;; 0c:4490 $21 $c2 $c9
    ld   A, [HL+]                                      ;; 0c:4493 $2a
    ld   H, [HL]                                       ;; 0c:4494 $66
    ld   L, A                                          ;; 0c:4495 $6f
    ld   DE, wC90A                                     ;; 0c:4496 $11 $0a $c9
    jp   call_00_1f84                                  ;; 0c:4499 $c3 $84 $1f
    db   $21, $c2, $c9, $2a, $66, $6f, $11, $0a        ;; 0c:449c ????????
    db   $c9, $e5, $d5, $e1, $d1, $c3, $84, $1f        ;; 0c:44a4 ????????

data_0c_44ac:
    ld   HL, wC9C2                                     ;; 0c:44ac $21 $c2 $c9
    ld   A, [HL+]                                      ;; 0c:44af $2a
    ld   H, [HL]                                       ;; 0c:44b0 $66
    ld   L, A                                          ;; 0c:44b1 $6f
    ld   DE, wD83E                                     ;; 0c:44b2 $11 $3e $d8
    jp   jp_00_1f7e                                    ;; 0c:44b5 $c3 $7e $1f

data_0c_44b8:
    db   $0b, $e7, $59, $ec, $20, $a5, $8c, $c2        ;; 0c:44b8 ........
    db   $1f, $27, $c2, $27, $c2, $20, $a7, $8c        ;; 0c:44c0 ..p.p...
    db   $c2, $1f, $06                                 ;; 0c:44c8 ...

data_0c_44cb:
    db   $0b, $e7, $5d, $ec, $00, $70, $6c, $c2        ;; 0c:44cb ........
    db   $1f, $27, $c2, $20, $71, $8c, $c2, $1f        ;; 0c:44d3 ..p.....
    db   $06                                           ;; 0c:44db .

data_0c_44dc:
    db   $0b, $e7, $62, $ec, $00, $9b, $6c, $c2        ;; 0c:44dc ........
    db   $1f, $27, $c2, $20, $9c, $8c, $c2, $1f        ;; 0c:44e4 ..p.....
    db   $06                                           ;; 0c:44ec .

data_0c_44ed:
    db   $0b, $e7, $63, $ec, $00, $9c, $6c, $c2        ;; 0c:44ed ........
    db   $1f, $06                                      ;; 0c:44f5 ..

data_0c_44f7:
    db   $0b, $e7, $00, $ec, $00, $73, $6c, $c2        ;; 0c:44f7 ........
    db   $1f, $06, $0b, $e7, $00, $ec, $00, $74        ;; 0c:44ff ..??????
    db   $6c, $c2, $1f, $06, $0b, $e7, $39, $ec        ;; 0c:4507 ????????
    db   $00, $55, $6c, $c2, $1f, $06                  ;; 0c:450f ??????

data_0c_4515:
    db   $0b, $e7, $39, $ec, $00, $55, $6c, $c2        ;; 0c:4515 ........
    db   $1f, $27, $c2, $20, $56, $8c, $c2, $1f        ;; 0c:451d ..p.....
    db   $06                                           ;; 0c:4525 .

data_0c_4526:
    db   $0b, $e7, $39, $ec, $00, $58, $6c, $c2        ;; 0c:4526 ........
    db   $1f, $27, $c2, $20, $59, $8c, $c2, $1f        ;; 0c:452e ..p.....
    db   $06                                           ;; 0c:4536 .

data_0c_4537:
    db   $0b, $e7, $3e, $ec, $20, $60, $8c, $c2        ;; 0c:4537 ........
    db   $1f, $06                                      ;; 0c:453f ..

data_0c_4541:
    db   $0b, $e7, $3c, $ec, $20, $5b, $8c, $c2        ;; 0c:4541 ........
    db   $1f, $06                                      ;; 0c:4549 ..

data_0c_454b:
    db   $0b, $e7, $3c, $ec, $20, $5d, $8c, $c2        ;; 0c:454b ........
    db   $1f, $06                                      ;; 0c:4553 ..

data_0c_4555:
    db   $0b, $e7, $3d, $ec, $20, $5c, $8c, $c2        ;; 0c:4555 ........
    db   $1f, $06                                      ;; 0c:455d ..

data_0c_455f:
    db   $0b, $e7, $3d, $ec, $20, $5e, $8c, $c2        ;; 0c:455f ........
    db   $1f, $06, $0b, $e7, $0f, $ec, $00, $95        ;; 0c:4567 ..??????
    db   $6c, $c2, $1f, $06                            ;; 0c:456f ????

data_0c_4573:
    db   $0b, $e7, $60, $ec, $00, $97, $6c, $c2        ;; 0c:4573 ........
    db   $1f, $06                                      ;; 0c:457b ..

data_0c_457d:
    db   $0b, $e7, $60, $ec, $00, $99, $6c, $c2        ;; 0c:457d ........
    db   $1f, $06                                      ;; 0c:4585 ..

data_0c_4587:
    db   $0b, $e7, $61, $ec, $00, $98, $6c, $c2        ;; 0c:4587 ........
    db   $1f, $06                                      ;; 0c:458f ..

data_0c_4591:
    db   $0b, $e7, $61, $ec, $00, $9a, $6c, $c2        ;; 0c:4591 ........
    db   $1f, $06                                      ;; 0c:4599 ..

data_0c_459b:
    db   $0b, $e7, $57, $ec, $00, $91, $6c, $c2        ;; 0c:459b ........
    db   $1f, $06                                      ;; 0c:45a3 ..

data_0c_45a5:
    db   $0b, $e7, $57, $ec, $00, $93, $6c, $c2        ;; 0c:45a5 ........
    db   $1f, $06                                      ;; 0c:45ad ..

data_0c_45af:
    db   $0b, $e7, $41, $ec, $00, $64, $6c, $c2        ;; 0c:45af ........
    db   $1f, $06                                      ;; 0c:45b7 ..

data_0c_45b9:
    db   $0b, $e7, $40, $ec, $00, $63, $6c, $c2        ;; 0c:45b9 ........
    db   $1f, $06, $0b, $e7, $40, $ec, $00, $65        ;; 0c:45c1 ..??????
    db   $6c, $c2, $1f, $06                            ;; 0c:45c9 ????

data_0c_45cd:
    db   $0b, $e7, $04, $ec, $00, $07, $6c, $c2        ;; 0c:45cd ........
    db   $1f, $27, $c2, $20, $08, $8c, $c2, $1f        ;; 0c:45d5 ..p.....
    db   $06                                           ;; 0c:45dd .

data_0c_45de:
    db   $0b, $e7, $10, $ec, $20, $20, $8c, $c2        ;; 0c:45de ........
    db   $1f, $06                                      ;; 0c:45e6 ..

data_0c_45e8:
    db   $0b, $e7, $10, $ec, $20, $22, $8c, $c2        ;; 0c:45e8 ........
    db   $1f, $06                                      ;; 0c:45f0 ..

data_0c_45f2:
    db   $0b, $e7, $12, $ec, $20, $24, $8c, $c2        ;; 0c:45f2 ........
    db   $1f, $06                                      ;; 0c:45fa ..

data_0c_45fc:
    db   $0b, $e7, $12, $ec, $20, $26, $8c, $c2        ;; 0c:45fc ........
    db   $1f, $06                                      ;; 0c:4604 ..

data_0c_4606:
    db   $0b, $e7, $14, $ec, $20, $28, $8c, $c2        ;; 0c:4606 ........
    db   $1f, $06                                      ;; 0c:460e ..

data_0c_4610:
    db   $0b, $e7, $14, $ec, $20, $2a, $8c, $c2        ;; 0c:4610 ........
    db   $1f, $06                                      ;; 0c:4618 ..

data_0c_461a:
    db   $0b, $e7, $16, $ec, $20, $2c, $8c, $c2        ;; 0c:461a ........
    db   $1f, $06                                      ;; 0c:4622 ..

data_0c_4624:
    db   $0b, $e7, $16, $ec, $20, $2e, $8c, $c2        ;; 0c:4624 ........
    db   $1f, $06, $0b, $e7, $20, $ec, $20, $3c        ;; 0c:462c ..??????
    db   $8c, $c2, $1f, $06, $0b, $e7, $22, $ec        ;; 0c:4634 ????????
    db   $20, $3e, $8c, $c2, $1f, $06, $0b, $e7        ;; 0c:463c ????????
    db   $28, $ec, $20, $44, $8c, $c2, $1f, $06        ;; 0c:4644 ????????
    db   $0b, $e7, $2a, $ec, $20, $46, $8c, $c2        ;; 0c:464c ????????
    db   $1f, $06, $0b, $e7, $30, $ec, $20, $4c        ;; 0c:4654 ????????
    db   $8c, $c2, $1f, $06, $0b, $e7, $36, $ec        ;; 0c:465c ????????
    db   $00, $52, $6c, $c2, $1f, $06, $0b, $e7        ;; 0c:4664 ????????
    db   $37, $ec, $20, $53, $8c, $c2, $1f, $06        ;; 0c:466c ????????

data_0c_4674:
    db   $0b, $e7, $65, $ec, $00, $a1, $6c, $c2        ;; 0c:4674 ........
    db   $1f, $06                                      ;; 0c:467c ..

data_0c_467e:
    db   $0b, $e7, $66, $ec, $00, $a2, $6c, $c2        ;; 0c:467e ........
    db   $1f, $06, $0b, $e7, $67, $ec, $00, $a3        ;; 0c:4686 ..??????
    db   $6c, $c2, $1f, $06, $0b, $e7, $68, $ec        ;; 0c:468e ????????
    db   $00, $a4, $6c, $c2, $1f, $06                  ;; 0c:4696 ??????

data_0c_469c:
    db   $0b, $e7, $01, $ec, $20, $01, $8c, $c2        ;; 0c:469c ........
    db   $1f, $06                                      ;; 0c:46a4 ..

data_0c_46a6:
    db   $0b, $e7, $01, $ec, $20, $03, $8c, $c2        ;; 0c:46a6 ........
    db   $1f, $06                                      ;; 0c:46ae ..

data_0c_46b0:
    db   $0b, $e7, $01, $ec, $00, $01, $6c, $c2        ;; 0c:46b0 ........
    db   $1f, $06                                      ;; 0c:46b8 ..

data_0c_46ba:
    db   $0b, $e7, $01, $ec, $00, $03, $6c, $c2        ;; 0c:46ba ........
    db   $1f, $06                                      ;; 0c:46c2 ..

data_0c_46c4:
    db   $0b, $e7, $02, $ec, $00, $02, $6c, $c2        ;; 0c:46c4 ........
    db   $1f, $06, $0b, $e7, $02, $ec, $00, $04        ;; 0c:46cc ..??????
    db   $6c, $c2, $1f, $06                            ;; 0c:46d4 ????

data_0c_46d8:
    db   $0b, $e7, $0d, $ec, $00, $19, $6c, $c2        ;; 0c:46d8 ........
    db   $1f, $00, $e0, $0c, $19, $c5, $f8, $1f        ;; 0c:46e0 ....p...
    db   $06                                           ;; 0c:46e8 .

data_0c_46e9:
    db   $0b, $e7, $0e, $ec, $00, $1b, $6c, $c2        ;; 0c:46e9 ........
    db   $1f, $06                                      ;; 0c:46f1 ..

data_0c_46f3:
    db   $0b, $e7, $0e, $ec, $00, $fc, $6c, $c2        ;; 0c:46f3 ........
    db   $1f, $06, $0b, $e7, $58, $ec, $00, $1d        ;; 0c:46fb ..??????
    db   $6c, $c2, $1f, $06                            ;; 0c:4703 ????

data_0c_4707:
    db   $0b, $e7, $58, $ec, $00, $1e, $6c, $c2        ;; 0c:4707 ........
    db   $1f, $06                                      ;; 0c:470f ..

data_0c_4711:
    db   $0b, $e7, $03, $ec, $00, $05, $6c, $c2        ;; 0c:4711 ........
    db   $1f, $06                                      ;; 0c:4719 ..

data_0c_471b:
    db   $0b, $e7, $03, $ec, $00, $06, $6c, $c2        ;; 0c:471b ........
    db   $1f, $06                                      ;; 0c:4723 ..

data_0c_4725:
    db   $0b, $e7, $1a, $ec, $00, $32, $6c, $c2        ;; 0c:4725 ........
    db   $1f, $06                                      ;; 0c:472d ..

data_0c_472f:
    db   $0b, $e7, $18, $ec, $20, $30, $8c, $c2        ;; 0c:472f ........
    db   $1f, $27, $c2, $27, $c2, $20, $32, $8c        ;; 0c:4737 ..p.p...
    db   $c2, $1f, $06                                 ;; 0c:473f ...

data_0c_4742:
    db   $0b, $e7, $18, $ec, $20, $34, $8c, $c2        ;; 0c:4742 ........
    db   $1f, $27, $c2, $27, $c2, $20, $36, $8c        ;; 0c:474a ..p.p...
    db   $c2, $1f, $06                                 ;; 0c:4752 ...

data_0c_4755:
    db   $0b, $e7, $70, $ec, $20, $a9, $8c, $c2        ;; 0c:4755 ........
    db   $1f, $27, $c2, $27, $c2, $20, $ab, $8c        ;; 0c:475d ..p.p...
    db   $c2, $1f, $06, $0b, $e7, $1c, $ec, $20        ;; 0c:4765 ...?????
    db   $38, $8c, $c2, $1f, $27, $c2, $27, $c2        ;; 0c:476d ????????
    db   $20, $3a, $8c, $c2, $1f, $06, $0b, $e7        ;; 0c:4775 ????????
    db   $24, $ec, $20, $40, $8c, $c2, $1f, $27        ;; 0c:477d ????????
    db   $c2, $27, $c2, $20, $42, $8c, $c2, $1f        ;; 0c:4785 ????????
    db   $06, $0b, $e7, $2c, $ec, $20, $48, $8c        ;; 0c:478d ????????
    db   $c2, $1f, $27, $c2, $27, $c2, $20, $4a        ;; 0c:4795 ????????
    db   $8c, $c2, $1f, $06, $0b, $e7, $32, $ec        ;; 0c:479d ????????
    db   $20, $4e, $8c, $c2, $1f, $27, $c2, $27        ;; 0c:47a5 ????????
    db   $c2, $20, $50, $8c, $c2, $1f, $06, $ec        ;; 0c:47ad ????????
    db   $00, $c2, $03, $e8, $1f, $06                  ;; 0c:47b5 ??????

data_0c_47bb:
    db   $05                                           ;; 0c:47bb .
    dw   .data_0c_47c6                                 ;; 0c:47bc pP
    db   $00, $c2, $0c, $c2, $03, $e7, $1f, $06        ;; 0c:47be ...p.p..
.data_0c_47c6:
    db   $20, $c2, $0c, $d6, $c1, $80, $e3, $00        ;; 0c:47c6 ...p....
    db   $d0, $1f, $06                                 ;; 0c:47ce ...

data_0c_47d1:
    db   $0b, $e7, $59, $ec, $80, $c2, $2c, $a5        ;; 0c:47d1 ........
    db   $1f, $27, $c2, $27, $c2, $80, $c2, $2c        ;; 0c:47d9 ..p.p...
    db   $a7, $1f, $06, $0b, $e7, $40, $ec, $60        ;; 0c:47e1 ...?????
    db   $c2, $0c, $65, $1f, $06, $0b, $e7, $66        ;; 0c:47e9 ????????
    db   $ec, $60, $c2, $0c, $a2, $1f, $06             ;; 0c:47f1 ???????

data_0c_47f8:
    db   $0b, $e7, $60, $ec, $60, $c2, $0c, $97        ;; 0c:47f8 .......p
    db   $1f, $06                                      ;; 0c:4800 ..

data_0c_4802:
    db   $0b, $e7, $61, $ec, $60, $c2, $0c, $98        ;; 0c:4802 .......p
    db   $1f, $06, $0b, $e7, $61, $ec, $60, $c2        ;; 0c:480a ..??????
    db   $0c, $9a, $1f, $06, $0b, $e7, $00, $ec        ;; 0c:4812 ????????
    db   $60, $c2, $0c, $73, $1f, $06, $0b, $e7        ;; 0c:481a ????????
    db   $00, $ec, $60, $c2, $0c, $74, $1f, $06        ;; 0c:4822 ????????

data_0c_482a:
    db   $0b, $e7, $04, $ec, $60, $c2, $0c, $07        ;; 0c:482a .......p
    db   $1f, $27, $c2, $80, $c2, $2c, $08, $1f        ;; 0c:4832 ..p.....
    db   $06                                           ;; 0c:483a .

data_0c_483b:
    db   $0b, $e7, $5d, $ec, $60, $c2, $0c, $70        ;; 0c:483b .......p
    db   $1f, $27, $c2, $80, $c2, $2c, $71, $1f        ;; 0c:4843 ..p.....
    db   $06, $0b, $e7, $39, $ec, $60, $c2, $0c        ;; 0c:484b .???????
    db   $55, $1f, $27, $c2, $80, $c2, $2c, $56        ;; 0c:4853 ????????
    db   $1f, $06, $0b, $e7, $48, $ec, $03, $65        ;; 0c:485b ????????
    db   $48, $06, $fa, $c2, $c9, $5f, $fa, $c3        ;; 0c:4863 ????????
    db   $c9, $57, $21, $3e, $d8, $c3, $7e, $1f        ;; 0c:486b ????????
    db   $0b, $e7, $10, $ec, $80, $c2, $2c, $20        ;; 0c:4873 ????????
    db   $1f, $06                                      ;; 0c:487b ??

data_0c_487d:
    db   $0b, $e7, $10, $ec, $80, $c2, $2c, $22        ;; 0c:487d ........
    db   $1f, $06, $0b, $e7, $12, $ec, $80, $c2        ;; 0c:4885 ..??????
    db   $2c, $24, $1f, $06, $0b, $e7, $20, $ec        ;; 0c:488d ????????
    db   $80, $c2, $2c, $3c, $1f, $06                  ;; 0c:4895 ??????

data_0c_489b:
    db   $0b, $e7, $14, $ec, $80, $c2, $2c, $28        ;; 0c:489b ........
    db   $1f, $06                                      ;; 0c:48a3 ..

data_0c_48a5:
    db   $0b, $e7, $14, $ec, $80, $c2, $2c, $2a        ;; 0c:48a5 ........
    db   $1f, $06, $0b, $e7, $16, $ec, $80, $c2        ;; 0c:48ad ..??????
    db   $2c, $2c, $1f, $06, $0b, $e7, $22, $ec        ;; 0c:48b5 ????????
    db   $80, $c2, $2c, $3e, $1f, $06                  ;; 0c:48bd ??????

data_0c_48c3:
    db   $0b, $e7, $01, $ec, $80, $c2, $2c, $01        ;; 0c:48c3 ........
    db   $1f, $06                                      ;; 0c:48cb ..

data_0c_48cd:
    db   $0b, $e7, $01, $ec, $80, $c2, $2c, $03        ;; 0c:48cd ........
    db   $1f, $06                                      ;; 0c:48d5 ..

data_0c_48d7:
    db   $0b, $e7, $01, $ec, $60, $c2, $0c, $03        ;; 0c:48d7 .......p
    db   $1f, $06                                      ;; 0c:48df ..

data_0c_48e1:
    db   $0b, $e7, $02, $ec, $60, $c2, $0c, $02        ;; 0c:48e1 .......p
    db   $1f, $06, $0b, $e7, $0d, $ec, $60, $c2        ;; 0c:48e9 ..??????
    db   $0c, $19, $06, $e0, $1f, $06                  ;; 0c:48f1 ??????

data_0c_48f7:
    db   $0b, $e7, $62, $ec, $60, $c2, $0c, $9b        ;; 0c:48f7 .......p
    db   $1f, $06                                      ;; 0c:48ff ..

data_0c_4901:
    db   $0b, $e7, $63, $ec, $60, $c2, $0c, $9c        ;; 0c:4901 .......p
    db   $1f, $06                                      ;; 0c:4909 ..

data_0c_490b:
    db   $0b, $e7, $64, $ec, $60, $c2, $0c, $9d        ;; 0c:490b .......p
    db   $1f, $06, $0b, $e7, $0e, $ec, $60, $c2        ;; 0c:4913 ..??????
    db   $0c, $1b, $1f, $06, $0b, $e7, $57, $ec        ;; 0c:491b ????????
    db   $60, $c2, $0c, $91, $1f, $06, $0b, $e7        ;; 0c:4923 ????????
    db   $0f, $ec, $60, $c2, $0c, $95, $1f, $06        ;; 0c:492b ????????
    db   $0b, $e7, $58, $ec, $60, $c2, $0c, $1d        ;; 0c:4933 ????????
    db   $1f, $06, $0b, $e7, $03, $ec, $60, $c2        ;; 0c:493b ????????
    db   $0c, $05, $1f, $06, $0b, $e7, $03, $ec        ;; 0c:4943 ????????
    db   $60, $c2, $0c, $06, $1f, $06, $0b, $e7        ;; 0c:494b ????????
    db   $50, $ec, $60, $c2, $0c, $84, $1f, $06        ;; 0c:4953 ????????
    db   $0b, $e7, $70, $ec, $02, $66, $49, $0b        ;; 0c:495b ????????
    db   $e7, $18, $ec, $80, $c2, $2c, $30, $1f        ;; 0c:4963 ????????
    db   $27, $c2, $27, $c2, $80, $c2, $2c, $32        ;; 0c:496b ????????
    db   $1f, $06                                      ;; 0c:4973 ??

data_0c_4975:
    db   $0b, $e7, $18, $ec, $80, $c2, $2c, $34        ;; 0c:4975 ........
    db   $1f, $27, $c2, $27, $c2, $80, $c2, $2c        ;; 0c:497d ..p.p...
    db   $36, $1f, $06, $0b, $e7, $24, $ec, $80        ;; 0c:4985 ...?????
    db   $c2, $2c, $40, $1f, $27, $c2, $27, $c2        ;; 0c:498d ????????
    db   $80, $c2, $2c, $42, $1f, $06, $21, $94        ;; 0c:4995 ????????
    db   $d8, $fa, $7a, $d8, $c7, $4e, $21, $5e        ;; 0c:499d ????????
    db   $cc, $c7, $7e, $a9, $4f, $06, $01, $3e        ;; 0c:49a5 ????????
    db   $08, $cb, $08, $cb, $01, $3d, $30, $f9        ;; 0c:49ad ????????
    db   $4f, $7e, $b0, $77, $21, $00, $d0, $79        ;; 0c:49b5 ????????
    db   $c6, $05, $ea, $85, $c9, $cb, $3f, $cb        ;; 0c:49bd ????????
    db   $1d, $84, $67, $e5, $21, $00, $d0, $fa        ;; 0c:49c5 ????????
    db   $d6, $c9, $cb, $3f, $cb, $1d, $84, $67        ;; 0c:49cd ????????
    db   $d1, $06, $80, $c3, $97, $1f                  ;; 0c:49d5 ??????

data_0c_49db:
    ld   DE, $6a                                       ;; 0c:49db $11 $6a $00
    ld   HL, wD000                                     ;; 0c:49de $21 $00 $d0
    ld   A, [wC9D6]                                    ;; 0c:49e1 $fa $d6 $c9
    srl  A                                             ;; 0c:49e4 $cb $3f
    rr   L                                             ;; 0c:49e6 $cb $1d
    add  A, H                                          ;; 0c:49e8 $84
    ld   H, A                                          ;; 0c:49e9 $67
    add  HL, DE                                        ;; 0c:49ea $19
    ld   D, H                                          ;; 0c:49eb $54
    ld   E, L                                          ;; 0c:49ec $5d
    ld   HL, wD846                                     ;; 0c:49ed $21 $46 $d8
    xor  A, A                                          ;; 0c:49f0 $af
    ld   [wD86A], A                                    ;; 0c:49f1 $ea $6a $d8
    ld   C, A                                          ;; 0c:49f4 $4f
    ld   B, A                                          ;; 0c:49f5 $47
.jr_0c_49f6:
    ld   A, [DE]                                       ;; 0c:49f6 $1a
.jr_0c_49f7:
    rlca                                               ;; 0c:49f7 $07
    jr   NC, .jr_0c_4a14                               ;; 0c:49f8 $30 $1a
    push AF                                            ;; 0c:49fa $f5
    ld   A, [wCE92]                                    ;; 0c:49fb $fa $92 $ce
    cp   A, C                                          ;; 0c:49fe $b9
    jr   Z, .jr_0c_4a03                                ;; 0c:49ff $28 $02
    jr   NC, .jr_0c_4a13                               ;; 0c:4a01 $30 $10
.jr_0c_4a03:
    push HL                                            ;; 0c:4a03 $e5
    ld   HL, data_0c_7f33                              ;; 0c:4a04 $21 $33 $7f
    ld   A, C                                          ;; 0c:4a07 $79
    rst  add_hl_a                                      ;; 0c:4a08 $c7
    ld   A, [HL]                                       ;; 0c:4a09 $7e
    pop  HL                                            ;; 0c:4a0a $e1
    ld   [HL+], A                                      ;; 0c:4a0b $22
    ld   A, [wD86A]                                    ;; 0c:4a0c $fa $6a $d8
    inc  A                                             ;; 0c:4a0f $3c
    ld   [wD86A], A                                    ;; 0c:4a10 $ea $6a $d8
.jr_0c_4a13:
    pop  AF                                            ;; 0c:4a13 $f1
.jr_0c_4a14:
    inc  C                                             ;; 0c:4a14 $0c
    push AF                                            ;; 0c:4a15 $f5
    ld   A, [wCE93]                                    ;; 0c:4a16 $fa $93 $ce
    cp   A, C                                          ;; 0c:4a19 $b9
    jr   NC, .jr_0c_4a1e                               ;; 0c:4a1a $30 $02
    pop  AF                                            ;; 0c:4a1c $f1
    ret                                                ;; 0c:4a1d $c9
.jr_0c_4a1e:
    inc  B                                             ;; 0c:4a1e $04
    ld   A, B                                          ;; 0c:4a1f $78
    and  A, $07                                        ;; 0c:4a20 $e6 $07
    jr   NZ, .jr_0c_4a2a                               ;; 0c:4a22 $20 $06
    xor  A, A                                          ;; 0c:4a24 $af
    ld   B, A                                          ;; 0c:4a25 $47
    inc  DE                                            ;; 0c:4a26 $13
    pop  AF                                            ;; 0c:4a27 $f1
    jr   .jr_0c_49f6                                   ;; 0c:4a28 $18 $cc
.jr_0c_4a2a:
    pop  AF                                            ;; 0c:4a2a $f1
    jr   .jr_0c_49f7                                   ;; 0c:4a2b $18 $ca
    db   $0b, $e9, $00, $0b, $da, $00, $ab, $da        ;; 0c:4a2d ........
    db   $ce, $00, $e0, $94, $d8, $53, $5e, $cc        ;; 0c:4a35 ........
    db   $1f, $05                                      ;; 0c:4a3d ..
    dw   .data_0c_4bc2                                 ;; 0c:4a3f pP
    db   $05                                           ;; 0c:4a41 .
    dw   data_0c_4c2b                                  ;; 0c:4a42 pP
    db   $0b, $80, $00, $c1, $b6, $13                  ;; 0c:4a44 ......
    dw   wCC59                                         ;; 0c:4a4a pP
    db   $1f, $02, $53, $4a, $02                       ;; 0c:4a4c ..??.
    dw   .data_0c_4a57                                 ;; 0c:4a51 pP
    db   $0b, $bf, $5c, $0c                            ;; 0c:4a53 ????
.data_0c_4a57:
    db   $01, $81, $cc, $01, $1f, $02, $c5, $4a        ;; 0c:4a57 .p....??
    db   $00, $7f, $13                                 ;; 0c:4a5f ...
    dw   wC6E3                                         ;; 0c:4a62 pP
    db   $1f, $01, $7f, $cd, $03, $1f, $02             ;; 0c:4a64 ..p....
    dw   .data_0c_4a79                                 ;; 0c:4a6b pP
    db   $c1, $ff, $13, $fb, $c6, $1f, $02, $79        ;; 0c:4a6d ????????
    db   $4a, $02, $84, $4a                            ;; 0c:4a75 ????
.data_0c_4a79:
    db   $c1, $ff, $0c, $e9, $1f, $02, $84, $4a        ;; 0c:4a79 ...p..??
    db   $02                                           ;; 0c:4a81 .
    dw   .data_0c_4a8f                                 ;; 0c:4a82 pP
    db   $05, $c8, $4c, $01, $7f, $cc, $00, $1f        ;; 0c:4a84 ????????
    db   $02, $0b, $4b                                 ;; 0c:4a8c ???
.data_0c_4a8f:
    db   $03                                           ;; 0c:4a8f .
    dw   $1d69                                         ;; 0c:4a90 pP
    db   $ab, $00, $de, $15, $03                       ;; 0c:4a92 .....
    dw   data_0c_6b71                                  ;; 0c:4a97 pP
    db   $c0, $95, $ce, $ec, $01, $01, $1f, $0b        ;; 0c:4a99 ........
    db   $d6, $00, $05                                 ;; 0c:4aa1 .w.
    dw   data_0c_4587                                  ;; 0c:4aa4 pP
    db   $c1, $00, $0c, $98, $c5, $80, $1f, $02        ;; 0c:4aa6 ...p....
    dw   .data_0c_4ac2                                 ;; 0c:4aae pP
    db   $05, $61, $4d, $01, $82, $ce, $00, $1f        ;; 0c:4ab0 ????????
    db   $02, $c5, $4a, $ab, $bc, $ff, $32, $02        ;; 0c:4ab8 ????????
    db   $82, $4b                                      ;; 0c:4ac0 ??
.data_0c_4ac2:
    db   $05                                           ;; 0c:4ac2 .
    dw   data_0c_4d5d                                  ;; 0c:4ac3 pP
    db   $05                                           ;; 0c:4ac5 .
    dw   data_0c_4dda                                  ;; 0c:4ac6 pP
    db   $05                                           ;; 0c:4ac8 .
    dw   data_0c_60bc                                  ;; 0c:4ac9 pP
    db   $20, $c4, $ec, $08, $d8, $1f, $0b, $d1        ;; 0c:4acb ........
    db   $00                                           ;; 0c:4ad3 .
.data_0c_4ad4:
    db   $20, $d6, $ec                                 ;; 0c:4ad4 ...
    dw   $d808                                         ;; 0c:4ad7 pP
    db   $03, $d1, $1f, $00, $d6, $6c, $d6, $1f        ;; 0c:4ad9 .p......
    db   $ac, $c1, $00, $0d, $01, $c5, $c0, $1f        ;; 0c:4ae1 ....p...
    db   $02                                           ;; 0c:4ae9 .
    dw   .data_0c_4b1e                                 ;; 0c:4aea pP
    db   $05                                           ;; 0c:4aec .
    dw   data_0c_4f05                                  ;; 0c:4aed pP
    db   $05                                           ;; 0c:4aef .
    dw   data_0c_44b8                                  ;; 0c:4af0 pP
    db   $05                                           ;; 0c:4af2 .
    dw   data_0c_44cb                                  ;; 0c:4af3 pP
    db   $20, $a7, $2c, $a7, $e5, $7f, $7f, $1f        ;; 0c:4af5 ........
    db   $20, $71, $2c, $71, $e5, $7f, $7f, $1f        ;; 0c:4afd ........
    db   $05                                           ;; 0c:4b05 .
    dw   data_0c_47d1                                  ;; 0c:4b06 pP
    db   $05                                           ;; 0c:4b08 .
    dw   data_0c_483b                                  ;; 0c:4b09 pP
    db   $05                                           ;; 0c:4b0b .
    dw   data_0c_5483                                  ;; 0c:4b0c pP
    db   $01, $d0, $cc, $01, $1f, $02                  ;; 0c:4b0e .p....
    dw   .data_0c_4b5c                                 ;; 0c:4b14 pP
    db   $01, $d0, $cc, $02, $1f, $02, $6a, $4b        ;; 0c:4b16 .p....??
.data_0c_4b1e:
    db   $07, $d1, $01, $d1, $0d, $d2, $1f, $02        ;; 0c:4b1e .p.p.p..
    dw   .data_0c_4ad4                                 ;; 0c:4b26 pP
    db   $05                                           ;; 0c:4b28 .
    dw   data_0c_54dc                                  ;; 0c:4b29 pP
    db   $05                                           ;; 0c:4b2b .
    dw   data_0c_5483                                  ;; 0c:4b2c pP
    db   $01, $d0, $cc, $01, $1f, $02, $5c, $4b        ;; 0c:4b2e .p....??
    db   $01, $d0, $cc, $02, $1f, $02, $6a, $4b        ;; 0c:4b36 .p....??
    db   $05                                           ;; 0c:4b3e .
    dw   data_0c_5567                                  ;; 0c:4b3f pP
    db   $0b, $d6, $00, $0b, $d7, $0c, $0b, $98        ;; 0c:4b41 ..w.....
    db   $00                                           ;; 0c:4b49 .
.data_0c_4b4a:
    db   $05                                           ;; 0c:4b4a .
    dw   data_0c_4802                                  ;; 0c:4b4b pP
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:4b4d .p.p.p..
    dw   .data_0c_4b4a                                 ;; 0c:4b55 pP
    db   $07, $80, $02                                 ;; 0c:4b57 .p.
    dw   .data_0c_4a79                                 ;; 0c:4b5a pP
.data_0c_4b5c:
    db   $ab, $ba, $ff, $04, $0b, $bf, $43, $0c        ;; 0c:4b5c ......w.
    db   $05                                           ;; 0c:4b64 .
    dw   data_0c_5701                                  ;; 0c:4b65 pP
    db   $02                                           ;; 0c:4b67 .
    dw   .data_0c_4b82                                 ;; 0c:4b68 pP
    db   $c1, $00, $13, $2d, $ca, $1f, $02, $9b        ;; 0c:4b6a ????????
    db   $4b, $ab, $da, $ce, $ff, $ab, $ba, $ff        ;; 0c:4b72 ????????
    db   $05, $0b, $bf, $42, $0c, $02, $9b, $4b        ;; 0c:4b7a ????????
.data_0c_4b82:
    db   $0b, $d6, $00, $0b, $02, $00                  ;; 0c:4b82 ..w...
.data_0c_4b88:
    db   $05                                           ;; 0c:4b88 .
    dw   data_0c_48e1                                  ;; 0c:4b89 pP
    db   $05                                           ;; 0c:4b8b .
    dw   data_0c_6ffc                                  ;; 0c:4b8c pP
    db   $07, $d6, $01, $d6, $cf, $04, $1f, $02        ;; 0c:4b8e .p.p....
    dw   .data_0c_4b88                                 ;; 0c:4b96 pP
    db   $03                                           ;; 0c:4b98 .
    dw   .data_0c_4b9f                                 ;; 0c:4b99 pP
    db   $03                                           ;; 0c:4b9b .
    dw   $1d77                                         ;; 0c:4b9c pP
    db   $1f                                           ;; 0c:4b9e .
.data_0c_4b9f:
    ld   HL, wD000                                     ;; 0c:4b9f $21 $00 $d0
    ld   DE, wC500                                     ;; 0c:4ba2 $11 $00 $c5
    ld   C, $04                                        ;; 0c:4ba5 $0e $04
    ld   A, [wD203]                                    ;; 0c:4ba7 $fa $03 $d2
    inc  A                                             ;; 0c:4baa $3c
    jr   Z, .jr_0c_4baf                                ;; 0c:4bab $28 $02
    ld   C, $05                                        ;; 0c:4bad $0e $05
.jr_0c_4baf:
    ld   B, $59                                        ;; 0c:4baf $06 $59
    call call_00_1f97                                  ;; 0c:4bb1 $cd $97 $1f
    ld   A, $27                                        ;; 0c:4bb4 $3e $27
    rst  add_hl_a                                      ;; 0c:4bb6 $c7
    ld   A, $07                                        ;; 0c:4bb7 $3e $07
    add  A, E                                          ;; 0c:4bb9 $83
    ld   E, A                                          ;; 0c:4bba $5f
    jr   NC, .jr_0c_4bbe                               ;; 0c:4bbb $30 $01
    inc  D                                             ;; 0c:4bbd $14
.jr_0c_4bbe:
    dec  C                                             ;; 0c:4bbe $0d
    jr   NZ, .jr_0c_4baf                               ;; 0c:4bbf $20 $ee
    ret                                                ;; 0c:4bc1 $c9
.data_0c_4bc2:
    db   $0b, $d6, $00, $0b, $d7, $0c                  ;; 0c:4bc2 ..w...
.data_0c_4bc8:
    db   $cc, $01, $05, $cc, $ff, $1f, $02             ;; 0c:4bc8 ..p....
    dw   .data_0c_4bdd                                 ;; 0c:4bcf pP
    db   $2b, $97, $00, $03                            ;; 0c:4bd1 ....
    dw   data_0c_4bf6                                  ;; 0c:4bd5 pP
    db   $05                                           ;; 0c:4bd7 .
    dw   data_0c_47f8                                  ;; 0c:4bd8 pP
    db   $05                                           ;; 0c:4bda .
    dw   data_0c_4802                                  ;; 0c:4bdb pP
.data_0c_4bdd:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:4bdd .p.p.p..
    dw   .data_0c_4bc8                                 ;; 0c:4be5 pP
    db   $06                                           ;; 0c:4be7 .

call_0c_4be8:
    ld   HL, wD000                                     ;; 0c:4be8 $21 $00 $d0
    ld   A, [wC9D6]                                    ;; 0c:4beb $fa $d6 $c9
    srl  A                                             ;; 0c:4bee $cb $3f
    rr   L                                             ;; 0c:4bf0 $cb $1d
    add  A, H                                          ;; 0c:4bf2 $84
    ld   H, A                                          ;; 0c:4bf3 $67
    add  HL, DE                                        ;; 0c:4bf4 $19
    ret                                                ;; 0c:4bf5 $c9

data_0c_4bf6:
    ld   DE, $03                                       ;; 0c:4bf6 $11 $03 $00
    call call_0c_4be8                                  ;; 0c:4bf9 $cd $e8 $4b
    ld   A, [HL]                                       ;; 0c:4bfc $7e
    inc  A                                             ;; 0c:4bfd $3c
    ret  Z                                             ;; 0c:4bfe $c8
    ld   DE, $45                                       ;; 0c:4bff $11 $45 $00
    add  HL, DE                                        ;; 0c:4c02 $19
    ld   A, $08                                        ;; 0c:4c03 $3e $08
    ld   C, $00                                        ;; 0c:4c05 $0e $00
.jr_0c_4c07:
    push AF                                            ;; 0c:4c07 $f5
    inc  HL                                            ;; 0c:4c08 $23
    ld   DE, .data_0c_4c23                             ;; 0c:4c09 $11 $23 $4c
    ld   B, $08                                        ;; 0c:4c0c $06 $08
.jr_0c_4c0e:
    ld   A, [DE]                                       ;; 0c:4c0e $1a
    inc  DE                                            ;; 0c:4c0f $13
    cp   A, [HL]                                       ;; 0c:4c10 $be
    jr   NZ, .jr_0c_4c15                               ;; 0c:4c11 $20 $02
    set  0, C                                          ;; 0c:4c13 $cb $c1
.jr_0c_4c15:
    rrc  C                                             ;; 0c:4c15 $cb $09
    dec  B                                             ;; 0c:4c17 $05
    jr   NZ, .jr_0c_4c0e                               ;; 0c:4c18 $20 $f4
    pop  AF                                            ;; 0c:4c1a $f1
    dec  A                                             ;; 0c:4c1b $3d
    jr   NZ, .jr_0c_4c07                               ;; 0c:4c1c $20 $e9
    ld   A, C                                          ;; 0c:4c1e $79
    ld   [wC997], A                                    ;; 0c:4c1f $ea $97 $c9
    ret                                                ;; 0c:4c22 $c9
.data_0c_4c23:
    db   $6f, $6e, $6d, $6c, $36, $59, $56, $4b        ;; 0c:4c23 ........

data_0c_4c2b:
    db   $00, $7f, $13                                 ;; 0c:4c2b ...
    dw   wCC5C                                         ;; 0c:4c2e pP
    db   $1f, $c1, $80, $0c, $7f, $c5, $80, $1f        ;; 0c:4c30 ....p...
    db   $02, $ab, $4c, $05                            ;; 0c:4c38 .??.
    dw   data_0c_5fba                                  ;; 0c:4c3c pP
    db   $20, $ca, $ec                                 ;; 0c:4c3e ...
    dw   data_0c_4711                                  ;; 0c:4c41 pP
    db   $1f, $05                                      ;; 0c:4c43 ..
    dw   data_0c_5ee5                                  ;; 0c:4c45 pP
    db   $00, $1c, $0c, $ed, $1f, $05                  ;; 0c:4c47 ...p..
    dw   data_0c_5fc1                                  ;; 0c:4c4d pP
    db   $20, $ca, $ec                                 ;; 0c:4c4f ...
    dw   data_0c_4711                                  ;; 0c:4c52 pP
    db   $1f, $05                                      ;; 0c:4c54 ..
    dw   data_0c_5ee5                                  ;; 0c:4c56 pP
    db   $00, $96, $0c, $ed, $1f, $00, $75, $0c        ;; 0c:4c58 ...p....
    db   $1c, $04, $96, $1f, $0b, $7f, $01, $01        ;; 0c:4c60 p.p.....
    db   $1c, $0e, $96, $1f, $02                       ;; 0c:4c68 p.p..
    dw   .data_0c_4c79                                 ;; 0c:4c6d pP
    db   $00, $75, $0c, $96, $04, $1c, $1f, $0b        ;; 0c:4c6f ????????
    db   $7f, $00                                      ;; 0c:4c77 ??
.data_0c_4c79:
    db   $01, $75, $ce, $05, $1f, $00, $75, $cc        ;; 0c:4c79 .p....?.
    db   $05, $1f, $00, $75, $0c, $75, $c1, $0a        ;; 0c:4c81 ?....p..
    db   $1f, $00, $75, $cc, $64, $04, $75, $c3        ;; 0c:4c89 ......p.
    db   $01, $1f, $01, $75, $ae, $65, $1f, $02        ;; 0c:4c91 ...p....
    dw   .data_0c_4cc4                                 ;; 0c:4c99 pP
    db   $01, $7f, $cc, $00, $1f, $02, $ab, $4c        ;; 0c:4c9b ????????
    db   $0b, $81, $02, $0b, $bf, $01, $0c, $06        ;; 0c:4ca3 ????????
    db   $0b, $81, $01, $0b, $bf, $02, $05, $4a        ;; 0c:4cab ????????
    db   $5f, $00, $7f, $13, $e3, $c6, $1f, $01        ;; 0c:4cb3 ????????
    db   $7f, $cd, $03, $1f, $06, $0b, $bf, $05        ;; 0c:4cbb ????????
    db   $0d                                           ;; 0c:4cc3 ?
.data_0c_4cc4:
    db   $0b, $81, $00, $06, $0b, $e6, $ff, $0b        ;; 0c:4cc4 ....????
    db   $d6, $00, $0b, $dd, $01, $03, $f1, $5f        ;; 0c:4ccc ????????
    db   $2b, $01, $00, $0b, $91, $63, $0b, $9b        ;; 0c:4cd4 ????????
    db   $30, $00, $9d, $13, $fb, $c6, $1f, $03        ;; 0c:4cdc ????????
    db   $49, $6b, $0b, $9c, $81, $01, $80, $ce        ;; 0c:4ce4 ????????
    db   $05, $1f, $02, $f5, $4c, $0b, $bf, $03        ;; 0c:4cec ????????
    db   $0c, $00, $7f, $0c, $d6, $1f, $03, $5d        ;; 0c:4cf4 ????????
    db   $60, $20, $d8, $33, $8f, $ce, $1f, $c0        ;; 0c:4cfc ????????
    db   $73, $d8, $2c, $d8, $1f, $05, $da, $50        ;; 0c:4d04 ????????
    db   $07, $d8, $01, $d8, $0f, $d9, $1f, $02        ;; 0c:4d0c ????????
    db   $09, $4d, $0b, $e6, $00, $03, $6c, $6b        ;; 0c:4d14 ????????
    db   $05, $59, $53, $40, $7d, $53, $5e, $cc        ;; 0c:4d1c ????????
    db   $1f, $00, $7f, $0c, $7d, $06, $7e, $06        ;; 0c:4d24 ????????
    db   $7f, $1f, $01, $7f, $ce, $00, $1f, $02        ;; 0c:4d2c ????????
    db   $37, $4d, $06, $c1, $ff, $0c, $e9, $1f        ;; 0c:4d34 ????????
    db   $06, $0b, $bf, $05, $0d                       ;; 0c:4d3c ?????

data_0c_4d41:
    ld   B, $05                                        ;; 0c:4d41 $06 $05
    ld   HL, wCE00                                     ;; 0c:4d43 $21 $00 $ce
    ld   DE, wD062                                     ;; 0c:4d46 $11 $62 $d0
.jr_0c_4d49:
    ld   A, [HL+]                                      ;; 0c:4d49 $2a
    ld   [DE], A                                       ;; 0c:4d4a $12
    inc  DE                                            ;; 0c:4d4b $13
    inc  HL                                            ;; 0c:4d4c $23
    call call_00_1f90                                  ;; 0c:4d4d $cd $90 $1f
    ld   A, E                                          ;; 0c:4d50 $7b
    add  A, $7d                                        ;; 0c:4d51 $c6 $7d
    jr   NC, .jr_0c_4d56                               ;; 0c:4d53 $30 $01
    inc  D                                             ;; 0c:4d55 $14
.jr_0c_4d56:
    ld   E, A                                          ;; 0c:4d56 $5f
    dec  B                                             ;; 0c:4d57 $05
    dec  B                                             ;; 0c:4d58 $05
    inc  B                                             ;; 0c:4d59 $04
    jr   NZ, .jr_0c_4d49                               ;; 0c:4d5a $20 $ed
    ret                                                ;; 0c:4d5c $c9

data_0c_4d5d:
    db   $03                                           ;; 0c:4d5d .
    dw   data_0c_4d41                                  ;; 0c:4d5e pP
    db   $06, $0b, $82, $00, $00, $7f, $13, $5c        ;; 0c:4d60 .???????
    db   $cc, $1f, $c1, $40, $0c, $7f, $c5, $40        ;; 0c:4d68 ????????
    db   $1f, $02, $ca, $4d, $01, $80, $ce, $00        ;; 0c:4d70 ????????
    db   $1f, $02, $84, $4d, $01, $81, $cc, $02        ;; 0c:4d78 ????????
    db   $1f, $02, $d4, $4d, $05, $ba, $5f, $20        ;; 0c:4d80 ????????
    db   $ca, $ec, $25, $47, $1f, $05, $e5, $5e        ;; 0c:4d88 ????????
    db   $00, $f0, $0c, $ed, $1f, $05, $c1, $5f        ;; 0c:4d90 ????????
    db   $20, $ca, $ec, $25, $47, $1f, $05, $e5        ;; 0c:4d98 ????????
    db   $5e, $00, $f1, $0c, $ed, $1f, $00, $75        ;; 0c:4da0 ????????
    db   $0c, $80, $c3, $01, $1f, $00, $75, $0c        ;; 0c:4da8 ????????
    db   $f1, $c2, $05, $01, $75, $1f, $00, $75        ;; 0c:4db0 ????????
    db   $12, $75, $1f, $00, $f1, $0c, $f1, $11        ;; 0c:4db8 ????????
    db   $75, $1f, $01, $f0, $0e, $f1, $1f, $02        ;; 0c:4dc0 ????????
    db   $d4, $4d, $0b, $82, $01, $0b, $81, $01        ;; 0c:4dc8 ????????
    db   $0b, $bf, $07, $0d, $0b, $bf, $06, $02        ;; 0c:4dd0 ????????
    db   $d3, $4d                                      ;; 0c:4dd8 ??

data_0c_4dda:
    db   $20, $c4, $ec, $08, $d8, $1f, $20, $c6        ;; 0c:4dda ........
    db   $ec, $15, $d8, $1f, $0b, $d2, $00, $01        ;; 0c:4de2 ........
    db   $81, $cc, $01, $1f, $02, $f7, $4d, $0b        ;; 0c:4dea p....??.
    db   $d6, $00, $02                                 ;; 0c:4df2 .w.
    dw   .data_0c_4dfa                                 ;; 0c:4df5 pP
    db   $0b, $d6, $05                                 ;; 0c:4df7 ???
.data_0c_4dfa:
    db   $01, $81, $cc, $02, $1f, $02, $08, $4e        ;; 0c:4dfa .p....??
    db   $0b, $d7, $0c, $02                            ;; 0c:4e02 ....
    dw   .data_0c_4e0b                                 ;; 0c:4e06 pP
    db   $0b, $d7, $04                                 ;; 0c:4e08 ???
.data_0c_4e0b:
    db   $cc, $01, $05, $cc, $ff, $1f, $02             ;; 0c:4e0b ..p....
    dw   .data_0c_4e7e                                 ;; 0c:4e12 pP
    db   $ac, $c1, $00, $0d, $01, $c5, $c0, $1f        ;; 0c:4e14 ....p...
    db   $02                                           ;; 0c:4e1c .
    dw   .data_0c_4e7e                                 ;; 0c:4e1d pP
    db   $05                                           ;; 0c:4e1f .
    dw   data_0c_4725                                  ;; 0c:4e20 pP
    db   $01, $d6, $cd, $05, $1f, $02                  ;; 0c:4e22 .p....
    dw   .data_0c_4e6e                                 ;; 0c:4e28 pP
    db   $00, $75, $0c, $32, $c2, $04, $1f, $00        ;; 0c:4e2a ...p.w..
    db   $78, $0c, $32, $ca, $01, $c3, $01, $1f        ;; 0c:4e32 ..p.....
    db   $00, $78, $12, $78, $1f, $01, $78, $0d        ;; 0c:4e3a ...p..p.
    db   $75, $1f, $02, $58, $4e, $00, $78, $0c        ;; 0c:4e42 p..??...
    db   $78, $04, $75, $1f, $00, $32, $0c, $32        ;; 0c:4e4a p.p....p
    db   $03, $78, $1f, $02                            ;; 0c:4e52 .p..
    dw   .data_0c_4e6e                                 ;; 0c:4e56 pP
    db   $01, $78, $0c, $75, $1f, $02, $6e, $4e        ;; 0c:4e58 ????????
    db   $00, $78, $0c, $75, $04, $78, $1f, $00        ;; 0c:4e60 ????????
    db   $32, $0c, $32, $04, $78, $1f                  ;; 0c:4e68 ??????
.data_0c_4e6e:
    db   $60, $c4, $0c, $d6, $1f, $60, $c6, $0c        ;; 0c:4e6e ...p....
    db   $32, $1f, $27, $c4, $27, $c6, $07, $d2        ;; 0c:4e76 p..p.p.p
.data_0c_4e7e:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:4e7e .p.p.p..
    dw   .data_0c_4e0b                                 ;; 0c:4e86 pP
    db   $00, $00, $0c, $d2, $1f, $01, $00, $cc        ;; 0c:4e88 ...p..p.
    db   $01, $1f, $02, $01, $4f, $20, $c4, $ec        ;; 0c:4e90 ...??...
    db   $08, $d8, $1f, $20, $c6, $ec, $15, $d8        ;; 0c:4e98 ........
    db   $1f, $0b, $d6, $00                            ;; 0c:4ea0 ....
.data_0c_4ea4:
    db   $0b, $d8, $00                                 ;; 0c:4ea4 ...
.data_0c_4ea7:
    db   $20, $75, $0c, $d8, $23, $c6, $1f, $20        ;; 0c:4ea7 ...p....
    db   $78, $2c, $75, $c3, $01, $1f, $61, $75        ;; 0c:4eaf ........
    db   $6e, $78, $1f, $02                            ;; 0c:4eb7 ....
    dw   .data_0c_4ee9                                 ;; 0c:4ebb pP
    db   $00, $7b, $6c, $75, $1f, $60, $75, $6c        ;; 0c:4ebd ........
    db   $78, $1f, $60, $78, $0c, $7b, $1f, $20        ;; 0c:4ec5 .....p..
    db   $75, $0c, $d8, $23, $c4, $1f, $20, $78        ;; 0c:4ecd ..p.....
    db   $2c, $75, $c3, $01, $1f, $00, $7b, $6c        ;; 0c:4ed5 ........
    db   $75, $1f, $60, $75, $6c, $78, $1f, $60        ;; 0c:4edd ........
    db   $78, $0c, $7b, $1f                            ;; 0c:4ee5 ..p.
.data_0c_4ee9:
    db   $07, $d8, $01, $d8, $0d, $00, $04, $d6        ;; 0c:4ee9 .p.p.p.p
    db   $c4, $01, $1f, $02                            ;; 0c:4ef1 ....
    dw   .data_0c_4ea7                                 ;; 0c:4ef5 pP
    db   $07, $d6, $01, $d6, $0d, $00, $1f, $02        ;; 0c:4ef7 .p.p.p..
    dw   .data_0c_4ea4                                 ;; 0c:4eff pP
    db   $0b, $81, $00, $06                            ;; 0c:4f01 ....

data_0c_4f05:
    db   $0b, $dd, $01, $03                            ;; 0c:4f05 ..w.
    dw   data_0c_5ff1                                  ;; 0c:4f09 pP
    db   $cb, $73, $d8, $00, $cb, $99, $d8, $00        ;; 0c:4f0b ........
    db   $0b, $8a, $00, $05                            ;; 0c:4f13 ....
    dw   data_0c_50a9                                  ;; 0c:4f17 pP
    db   $05                                           ;; 0c:4f19 .
    dw   data_0c_46c4                                  ;; 0c:4f1a pP
    db   $c1, $00, $0c, $02, $1f, $02                  ;; 0c:4f1c ...p..
    dw   .data_0c_4f36                                 ;; 0c:4f22 pP
    db   $05, $04, $56, $c1, $20, $0c, $02, $1f        ;; 0c:4f24 ????????
    db   $02, $30, $4f, $06, $05, $2a, $61, $02        ;; 0c:4f2c ????????
    db   $51, $4f                                      ;; 0c:4f34 ??
.data_0c_4f36:
    db   $01, $d6, $d0, $05, $1f, $02                  ;; 0c:4f36 .p....
    dw   .data_0c_4f4b                                 ;; 0c:4f3c pP
    db   $05                                           ;; 0c:4f3e .
    dw   data_0c_44f7                                  ;; 0c:4f3f pP
    db   $c1, $00, $0c, $73, $c5, $80, $1f, $02        ;; 0c:4f41 ...p....
    dw   .data_0c_4f51                                 ;; 0c:4f49 pP
.data_0c_4f4b:
    db   $05                                           ;; 0c:4f4b .
    dw   data_0c_44dc                                  ;; 0c:4f4c pP
    db   $05                                           ;; 0c:4f4e .
    dw   data_0c_65cf                                  ;; 0c:4f4f pP
.data_0c_4f51:
    db   $05                                           ;; 0c:4f51 .
    dw   data_0c_44dc                                  ;; 0c:4f52 pP
    db   $c1, $ff, $0c, $9b, $1f, $06, $c1, $01        ;; 0c:4f54 ...p....
    db   $0c, $9b, $c5, $0f, $1f, $02                  ;; 0c:4f5c .p....
    dw   .data_0c_4f67                                 ;; 0c:4f62 pP
    db   $02                                           ;; 0c:4f64 .
    dw   .data_0c_4f6a                                 ;; 0c:4f65 pP
.data_0c_4f67:
    db   $02                                           ;; 0c:4f67 .
    dw   data_0c_5220                                  ;; 0c:4f68 pP
.data_0c_4f6a:
    db   $c1, $00, $0d, $9b, $1f, $02                  ;; 0c:4f6a ...p..
    dw   .data_0c_4f80                                 ;; 0c:4f70 pP
    db   $05                                           ;; 0c:4f72 .
    dw   data_0c_45b9                                  ;; 0c:4f73 pP
    db   $00, $9d, $0c, $63, $1f, $05                  ;; 0c:4f75 ...p..
    dw   data_0c_490b                                  ;; 0c:4f7b pP
    db   $02                                           ;; 0c:4f7d .
    dw   .data_0c_4f9e                                 ;; 0c:4f7e pP
.data_0c_4f80:
    db   $05                                           ;; 0c:4f80 .
    dw   data_0c_469c                                  ;; 0c:4f81 pP
    db   $c1, $20, $0c, $9b, $1f, $02                  ;; 0c:4f83 ...p..
    dw   .data_0c_4f8e                                 ;; 0c:4f89 pP
    db   $02                                           ;; 0c:4f8b .
    dw   .data_0c_4f9e                                 ;; 0c:4f8c pP
.data_0c_4f8e:
    db   $c1, $00, $0d, $01, $c5, $20, $1f, $02        ;; 0c:4f8e ...p....
    db   $9b, $4f, $02                                 ;; 0c:4f96 ??.
    dw   .data_0c_4f9e                                 ;; 0c:4f99 pP
    db   $02, $4f, $52                                 ;; 0c:4f9b ???
.data_0c_4f9e:
    db   $03                                           ;; 0c:4f9e .
    dw   data_0c_6b49                                  ;; 0c:4f9f pP
    db   $05                                           ;; 0c:4fa1 .
    dw   data_0c_6a39                                  ;; 0c:4fa2 pP
    db   $05                                           ;; 0c:4fa4 .
    dw   data_0c_469c                                  ;; 0c:4fa5 pP
    db   $05                                           ;; 0c:4fa7 .
    dw   data_0c_44f7                                  ;; 0c:4fa8 pP
    db   $cc, $05                                      ;; 0c:4faa ..
    dw   data_0c_4478                                  ;; 0c:4fac pP
    db   $05                                           ;; 0c:4fae .
    dw   data_0c_46d8                                  ;; 0c:4faf pP
    db   $05                                           ;; 0c:4fb1 .
    dw   data_0c_45de                                  ;; 0c:4fb2 pP
    db   $05                                           ;; 0c:4fb4 .
    dw   data_0c_45f2                                  ;; 0c:4fb5 pP
    db   $05                                           ;; 0c:4fb7 .
    dw   data_0c_4606                                  ;; 0c:4fb8 pP
    db   $05                                           ;; 0c:4fba .
    dw   data_0c_461a                                  ;; 0c:4fbb pP
    db   $05                                           ;; 0c:4fbd .
    dw   data_0c_472f                                  ;; 0c:4fbe pP
    db   $05                                           ;; 0c:4fc0 .
    dw   data_0c_45b9                                  ;; 0c:4fc1 pP
    db   $05                                           ;; 0c:4fc3 .
    dw   data_0c_45af                                  ;; 0c:4fc4 pP
    db   $05                                           ;; 0c:4fc6 .
    dw   data_0c_459b                                  ;; 0c:4fc7 pP
    db   $05                                           ;; 0c:4fc9 .
    dw   data_0c_4515                                  ;; 0c:4fca pP
    db   $05                                           ;; 0c:4fcc .
    dw   data_0c_4541                                  ;; 0c:4fcd pP
    db   $05                                           ;; 0c:4fcf .
    dw   data_0c_4555                                  ;; 0c:4fd0 pP
    db   $c1, $00, $0c, $9c, $c5, $80, $1f, $02        ;; 0c:4fd2 ...p....
    dw   .data_0c_500d                                 ;; 0c:4fda pP
    db   $c1, $01, $0c, $9c, $c5, $01, $1f, $02        ;; 0c:4fdc ????????
    db   $01, $50, $03, $2b, $60, $00, $d9, $13        ;; 0c:4fe4 ????????
    db   $ff, $dd, $c4, $01, $1f, $c1, $00, $0d        ;; 0c:4fec ????????
    db   $9c, $c5, $80, $1f, $02, $4c, $50, $05        ;; 0c:4ff4 ????????
    db   $b6, $50, $02, $4c, $50, $03, $5d, $60        ;; 0c:4ffc ????????
    db   $20, $d8, $33, $8f, $ce, $1f, $02, $4c        ;; 0c:5004 ????????
    db   $50                                           ;; 0c:500c ?
.data_0c_500d:
    db   $c1, $00, $0c, $9c, $c5, $40, $1f, $02        ;; 0c:500d ...p....
    dw   .data_0c_5040                                 ;; 0c:5015 pP
    db   $c1, $00, $0c, $9c, $c5, $03, $1f, $02        ;; 0c:5017 ????????
    db   $e6, $4f, $00, $7f, $0c, $9c, $c5, $0f        ;; 0c:501f ????????
    db   $1f, $a0, $84, $ce, $0c, $7f, $1f, $03        ;; 0c:5027 ????????
    db   $4c, $6b, $00, $d8, $13, $8f, $ce, $1f        ;; 0c:502f ????????
    db   $00, $d9, $13, $90, $ce, $1f, $02, $fb        ;; 0c:5037 ????????
    db   $4f                                           ;; 0c:503f ?
.data_0c_5040:
    db   $00, $d8, $0c, $9c, $c5, $0f, $1f, $00        ;; 0c:5040 ...p....
    db   $d9, $0c, $d8, $1f, $05                       ;; 0c:5048 ..p..
    dw   data_0c_50d4                                  ;; 0c:504d pP
    db   $02                                           ;; 0c:504f .
    dw   .data_0c_5055                                 ;; 0c:5050 pP
    db   $05, $da, $50                                 ;; 0c:5052 ???
.data_0c_5055:
    db   $07, $d8, $01, $d8, $0f, $d9, $1f, $02        ;; 0c:5055 .p.p.p..
    db   $52, $50, $01, $d6, $13                       ;; 0c:505d ??.p.
    dw   wD873                                         ;; 0c:5062 pP
    db   $1f, $02, $9a, $50, $01, $d6, $d0, $05        ;; 0c:5064 ..??.p..
    db   $1f, $02                                      ;; 0c:506c ..
    dw   .data_0c_5080                                 ;; 0c:506e pP
    db   $01, $9c, $cc, $80, $1f, $02, $9a, $50        ;; 0c:5070 .p....??
    db   $01, $9c, $cc, $40, $1f, $02, $9a, $50        ;; 0c:5078 .p....??
.data_0c_5080:
    db   $20, $c8, $0c, $d6, $cb, $01, $e3, $22        ;; 0c:5080 ...p....
    db   $d8, $1f, $01, $8a, $cc, $ff, $1f, $20        ;; 0c:5088 ...p....
    db   $f5, $33, $99, $d8, $1f, $80, $c8, $2c        ;; 0c:5090 ?.??....
    db   $f5, $1f, $c1, $00, $0c, $bc, $1f, $06        ;; 0c:5098 .....p..
    db   $03                                           ;; 0c:50a0 .
    dw   data_0c_6b6c                                  ;; 0c:50a1 pP
    db   $05                                           ;; 0c:50a3 .
    dw   data_0c_5359                                  ;; 0c:50a4 pP
    db   $02                                           ;; 0c:50a6 .
    dw   data_0c_48c3                                  ;; 0c:50a7 pP

data_0c_50a9:
    db   $20, $f5, $ec, $80, $80, $1f, $20, $c0        ;; 0c:50a9 ........
    db   $ec, $80, $80, $1f, $06, $01, $d8, $d0        ;; 0c:50b1 .....???
    db   $05, $1f, $02, $c4, $50, $03, $42, $60        ;; 0c:50b9 ????????
    db   $02, $cd, $50, $a0, $7a, $d8, $0c, $d8        ;; 0c:50c1 ????????
    db   $1f, $05, $49, $72, $00, $dd, $0c, $7e        ;; 0c:50c9 ????????
    db   $1f, $06, $06                                 ;; 0c:50d1 ???

data_0c_50d4:
    db   $c0, $73, $d8, $2c, $d8, $1f, $0b, $f7        ;; 0c:50d4 ........
    db   $ff, $00, $7f, $0c, $d6, $1f, $00, $d6        ;; 0c:50dc ....p...
    db   $0c, $d8, $1f, $c1, $05, $0f, $7f, $1f        ;; 0c:50e4 .p....p.
    db   $02                                           ;; 0c:50ec .
    dw   .data_0c_50f9                                 ;; 0c:50ed pP
    db   $c1, $00, $0d, $af, $c5, $c0, $1f, $02        ;; 0c:50ef ...p....
    db   $4b, $51                                      ;; 0c:50f7 ??
.data_0c_50f9:
    db   $05                                           ;; 0c:50f9 .
    dw   data_0c_471b                                  ;; 0c:50fa pP
    db   $01, $06, $cc, $ff, $1f, $02, $40, $52        ;; 0c:50fc .p....??
    db   $05                                           ;; 0c:5104 .
    dw   data_0c_46ba                                  ;; 0c:5105 pP
    db   $c1, $00, $0d, $03, $c5, $c0, $1f, $02        ;; 0c:5107 ...p....
    db   $40, $52, $0b, $f7, $ff, $01, $7f, $cd        ;; 0c:510f ??....p.
    db   $05, $1f, $02                                 ;; 0c:5117 ...
    dw   .data_0c_514b                                 ;; 0c:511a pP
    db   $05                                           ;; 0c:511c .
    dw   data_0c_4591                                  ;; 0c:511d pP
    db   $c1, $00, $0c, $9a, $c5, $10, $1f, $02        ;; 0c:511f ...p....
    dw   .data_0c_514b                                 ;; 0c:5127 pP
    db   $00, $f7, $0c, $9a, $c5, $0f, $1f, $00        ;; 0c:5129 ????????
    db   $d6, $0c, $f7, $1f, $05, $a6, $46, $c1        ;; 0c:5131 ????????
    db   $00, $2c, $03, $e5, $c0, $e0, $1f, $02        ;; 0c:5139 ????????
    db   $4b, $51, $0b, $f7, $ff, $00, $d6, $0c        ;; 0c:5141 ????????
    db   $d8, $1f                                      ;; 0c:5149 ??
.data_0c_514b:
    db   $05                                           ;; 0c:514b .
    dw   data_0c_46a6                                  ;; 0c:514c pP
    db   $05                                           ;; 0c:514e .
    dw   data_0c_4742                                  ;; 0c:514f pP
    db   $05                                           ;; 0c:5151 .
    dw   data_0c_471b                                  ;; 0c:5152 pP
    db   $05                                           ;; 0c:5154 .
    dw   data_0c_4707                                  ;; 0c:5155 pP
    db   $05                                           ;; 0c:5157 .
    dw   data_0c_45e8                                  ;; 0c:5158 pP
    db   $05                                           ;; 0c:515a .
    dw   data_0c_45fc                                  ;; 0c:515b pP
    db   $05                                           ;; 0c:515d .
    dw   data_0c_4610                                  ;; 0c:515e pP
    db   $05                                           ;; 0c:5160 .
    dw   data_0c_4624                                  ;; 0c:5161 pP
    db   $05                                           ;; 0c:5163 .
    dw   data_0c_4526                                  ;; 0c:5164 pP
    db   $05                                           ;; 0c:5166 .
    dw   data_0c_454b                                  ;; 0c:5167 pP
    db   $05                                           ;; 0c:5169 .
    dw   data_0c_455f                                  ;; 0c:516a pP
    db   $05                                           ;; 0c:516c .
    dw   data_0c_4537                                  ;; 0c:516d pP
    db   $05                                           ;; 0c:516f .
    dw   data_0c_457d                                  ;; 0c:5170 pP
    db   $05                                           ;; 0c:5172 .
    dw   data_0c_4591                                  ;; 0c:5173 pP
    db   $05                                           ;; 0c:5175 .
    dw   data_0c_45a5                                  ;; 0c:5176 pP
    db   $05                                           ;; 0c:5178 .
    dw   data_0c_46f3                                  ;; 0c:5179 pP
    db   $01, $f7, $cc, $ff, $1f, $02                  ;; 0c:517b .p....
    dw   .data_0c_5189                                 ;; 0c:5181 pP
    db   $0b, $99, $00, $0b, $9a, $00                  ;; 0c:5183 ??????
.data_0c_5189:
    db   $05                                           ;; 0c:5189 .
    dw   data_0c_5240                                  ;; 0c:518a pP
    db   $01, $9b, $ce, $00, $1f, $02                  ;; 0c:518c .p....
    dw   .data_0c_51a2                                 ;; 0c:5192 pP
    db   $05                                           ;; 0c:5194 .
    dw   data_0c_45b9                                  ;; 0c:5195 pP
    db   $01, $63, $cc, $ff, $1f, $02, $46, $52        ;; 0c:5197 .p....??
    db   $02                                           ;; 0c:519f .
    dw   data_0c_5264                                  ;; 0c:51a0 pP
.data_0c_51a2:
    db   $00, $7f, $0c, $9d, $1f, $00, $85, $0c        ;; 0c:51a2 ...p....
    db   $9b, $1f, $01, $9b, $cc, $30, $1f, $02        ;; 0c:51aa p..p....
    db   $b7, $51, $02                                 ;; 0c:51b2 ??.
    dw   data_0c_5264                                  ;; 0c:51b5 pP
    db   $01, $9d, $ce, $bf, $1f, $02, $e6, $51        ;; 0c:51b7 ????????
    db   $01, $9d, $ce, $2f, $1f, $00, $9b, $cc        ;; 0c:51bf ????????
    db   $00, $1f, $01, $9d, $ce, $77, $1f, $00        ;; 0c:51c7 ????????
    db   $9b, $cc, $40, $1f, $03, $49, $6b, $00        ;; 0c:51cf ????????
    db   $9d, $0c, $ba, $1f, $01, $9d, $cc, $ff        ;; 0c:51d7 ????????
    db   $1f, $02, $38, $52, $0b, $9b, $20, $03        ;; 0c:51df ????????
    db   $49, $6b, $00, $9d, $0c, $7f, $1f, $00        ;; 0c:51e7 ????????
    db   $9b, $0c, $85, $1f, $01, $73, $d0, $80        ;; 0c:51ef ????????
    db   $1f, $02, $64, $52, $a0, $91, $ce, $0c        ;; 0c:51f7 ????????
    db   $9d, $1f, $01, $9d, $cd, $c0, $1f, $02        ;; 0c:51ff ????????
    db   $64, $52, $c1, $ff, $0c, $e6, $1f, $02        ;; 0c:5207 ????????
    db   $64, $52, $03, $2b, $6b, $c1, $ff, $13        ;; 0c:520f ????????
    db   $91, $ce, $1f, $02, $38, $52, $02, $64        ;; 0c:5217 ????????
    db   $52                                           ;; 0c:521f ?

data_0c_5220:
    db   $c1, $11, $0c, $9b, $1f, $02, $30, $52        ;; 0c:5220 ...p..??
    db   $00, $bc, $cc, $1e, $1f, $02                  ;; 0c:5228 ......
    dw   data_0c_525f                                  ;; 0c:522e pP
    db   $00, $bc, $cc, $1f, $1f, $02, $5f, $52        ;; 0c:5230 ????????
    db   $00, $bc, $cc, $00, $1f, $02, $5f, $52        ;; 0c:5238 ????????

data_0c_5240:
    db   $00, $d6, $0c, $7f, $1f, $06, $0b, $bc        ;; 0c:5240 ...p..??
    db   $01, $0b, $7d, $01, $02, $5f, $52, $00        ;; 0c:5248 ????????
    db   $f8, $0c, $d6, $1f, $0b, $bf, $3f, $0c        ;; 0c:5250 ????????
    db   $0b, $d8, $00, $0b, $d9, $00, $06             ;; 0c:5258 ???????

data_0c_525f:
    db   $00, $d8, $0c, $d9, $1f                       ;; 0c:525f ...p.

data_0c_5264:
    db   $00, $f8, $0c, $d6, $1f, $00, $f9, $0c        ;; 0c:5264 ...p....
    db   $d8, $1f, $a0, $8c, $ce, $0c, $9d, $1f        ;; 0c:526c p.....p.
    db   $01, $d8, $0d, $d9, $1f, $02, $9c, $52        ;; 0c:5274 .p.p..??
    db   $01, $9b, $cc, $20, $1f, $02                  ;; 0c:527c .p....
    dw   .data_0c_5287                                 ;; 0c:5282 pP
    db   $02                                           ;; 0c:5284 .
    dw   .data_0c_529c                                 ;; 0c:5285 pP
.data_0c_5287:
    db   $05                                           ;; 0c:5287 .
    dw   .data_0c_5333                                 ;; 0c:5288 pP
    db   $20, $28, $2c, $28, $11, $7f, $1f, $05        ;; 0c:528a .....p..
    dw   data_0c_489b                                  ;; 0c:5292 pP
    db   $01, $d6, $0c, $d8, $1f, $05, $10, $46        ;; 0c:5294 .p.p..??
.data_0c_529c:
    db   $05                                           ;; 0c:529c .
    dw   data_0c_50a9                                  ;; 0c:529d pP
    db   $00, $de, $0c, $d8, $1f, $05                  ;; 0c:529f ...p..
    dw   data_0c_46e9                                  ;; 0c:52a5 pP
    db   $01, $1b, $cc, $c2, $1f, $05, $42, $7e        ;; 0c:52a7 .p....??
    db   $01, $1b, $cc, $c1, $1f, $02, $42, $7e        ;; 0c:52af .p....??
    db   $20, $ca, $0c, $bc, $cb, $01, $e3, $ea        ;; 0c:52b7 ...p....
    db   $7c, $1f, $20, $ca, $8c, $ca, $1f, $09        ;; 0c:52bf ........
    db   $ca, $0b, $df, $00, $c1, $01, $0c, $9b        ;; 0c:52c7 .......p
    db   $c5, $0f, $1f, $06, $00, $7f, $0c, $d6        ;; 0c:52cf .......p
    db   $1f, $20, $c8, $ec, $22, $d8, $1f, $01        ;; 0c:52d7 ........
    db   $f7, $cd, $ff, $1f, $02, $fc, $52, $20        ;; 0c:52df p....??.
    db   $c8, $0c, $de, $cb, $01, $23, $c8, $1f        ;; 0c:52e7 ..p.....
    db   $80, $c8, $2c, $c0, $1f, $00, $d6, $0c        ;; 0c:52ef ........
    db   $de, $1f, $02                                 ;; 0c:52f7 p..
    dw   .data_0c_530f                                 ;; 0c:52fa pP
    db   $20, $c8, $0c, $f7, $cb, $01, $23, $c8        ;; 0c:52fc ????????
    db   $1f, $80, $c8, $2c, $c0, $1f, $00, $d6        ;; 0c:5304 ????????
    db   $0c, $f7, $1f                                 ;; 0c:530c ???
.data_0c_530f:
    db   $21, $f5, $ec, $80, $80, $1f, $02             ;; 0c:530f .......
    dw   .data_0c_5324                                 ;; 0c:5316 pP
    db   $0b, $8a, $ff, $c0, $99, $d8, $33, $99        ;; 0c:5318 ????????
    db   $d8, $23, $f5, $1f                            ;; 0c:5320 ????
.data_0c_5324:
    db   $05                                           ;; 0c:5324 .
    dw   data_0c_48cd                                  ;; 0c:5325 pP
    db   $03                                           ;; 0c:5327 .
    dw   data_0c_6001                                  ;; 0c:5328 pP
    db   $05                                           ;; 0c:532a .
    dw   data_0c_48a5                                  ;; 0c:532b pP
    db   $05                                           ;; 0c:532d .
    dw   data_0c_4975                                  ;; 0c:532e pP
    db   $02                                           ;; 0c:5330 .
    dw   data_0c_5240                                  ;; 0c:5331 pP
.data_0c_5333:
    db   $05                                           ;; 0c:5333 .
    dw   data_0c_4606                                  ;; 0c:5334 pP
    db   $00, $7f, $0c, $9d, $ca, $01, $c5, $07        ;; 0c:5336 ...p....
    db   $cb, $01, $c3, $04, $1f, $01, $9d, $d0        ;; 0c:533e ......p.
    db   $20, $1f, $00, $7f, $0c, $7f, $cb, $01        ;; 0c:5346 ...?.?.?
    db   $c4, $08, $1f, $00, $7f, $0c, $7f, $03        ;; 0c:534e .?....p.
    db   $7f, $1f, $06                                 ;; 0c:5356 p..

data_0c_5359:
    db   $20, $c6, $ec, $22, $d8, $1f, $00, $7f        ;; 0c:5359 ........
    db   $0c, $d6, $1f, $00, $d6, $13                  ;; 0c:5361 .p....
    dw   wD873                                         ;; 0c:5367 pP
    db   $1f, $00, $d7, $13                            ;; 0c:5369 ....
    dw   $d874                                         ;; 0c:536d pP
    db   $1f, $01, $d6, $0c, $7f, $1f, $02, $7b        ;; 0c:536f ..p.p..?
    db   $53, $05                                      ;; 0c:5377 ?.
    dw   .data_0c_53a4                                 ;; 0c:5379 pP
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:537b .p.p.p..
    db   $70, $53, $01, $f7, $cc, $ff, $1f, $02        ;; 0c:5383 ??.p....
    dw   .data_0c_5395                                 ;; 0c:538b pP
    db   $00, $d6, $0c, $f7, $1f, $05, $a4, $53        ;; 0c:538d ????????
.data_0c_5395:
    db   $05                                           ;; 0c:5395 .
    dw   data_0c_5240                                  ;; 0c:5396 pP
    db   $05                                           ;; 0c:5398 .
    dw   data_0c_46a6                                  ;; 0c:5399 pP
    db   $05                                           ;; 0c:539b .
    dw   .data_0c_53a4                                 ;; 0c:539c pP
    db   $20, $01, $2c, $03, $1f, $06                  ;; 0c:539e ......
.data_0c_53a4:
    db   $20, $c8, $0c, $d6, $cb, $01, $e3, $22        ;; 0c:53a4 ...p....
    db   $d8, $1f, $20, $c0, $8c, $c8, $1f, $80        ;; 0c:53ac ........
    db   $c8, $ec, $80, $80, $1f, $21, $c0, $cc        ;; 0c:53b4 ........
    db   $00, $1f, $06, $21, $c0, $ec, $80, $80        ;; 0c:53bc ........
    db   $1f, $06, $05                                 ;; 0c:53c4 ...
    dw   data_0c_45e8                                  ;; 0c:53c7 pP
    db   $c1, $00, $cc, $80, $05, $c1, $1f, $02        ;; 0c:53c9 .....p..
    dw   .data_0c_53dd                                 ;; 0c:53d1 pP
    db   $20, $22, $2c, $22, $24, $c0, $1f, $02        ;; 0c:53d3 ????????
    db   $e4, $53                                      ;; 0c:53db ??
.data_0c_53dd:
    db   $20, $22, $2c, $22, $31, $c0, $1f, $05        ;; 0c:53dd ........
    dw   data_0c_487d                                  ;; 0c:53e5 pP
    db   $21, $22, $cc, $00, $1f, $02                  ;; 0c:53e7 ......
    dw   .data_0c_544b                                 ;; 0c:53ed pP
    db   $05                                           ;; 0c:53ef .
    dw   data_0c_45fc                                  ;; 0c:53f0 pP
    db   $00, $7d, $2c, $22, $c4, $01, $cb, $02        ;; 0c:53f2 ........
    db   $22, $26, $c8, $ff, $c3, $04, $1f, $05        ;; 0c:53fa ........
    dw   data_0c_46ba                                  ;; 0c:5402 pP
    db   $00, $03, $0c, $03, $c5, $fc, $03, $7d        ;; 0c:5404 ...p...p
    db   $1f, $02                                      ;; 0c:540c ..
    dw   data_0c_48d7                                  ;; 0c:540e pP
    db   $00, $7f, $0c, $d6, $1f, $00, $d6, $0c        ;; 0c:5410 ????????
    db   $d8, $1f, $05, $23, $54, $05, $51, $54        ;; 0c:5418 ????????
    db   $02, $40, $52                                 ;; 0c:5420 ???
.data_0c_5423:
    db   $20, $03, $2c, $03, $e5, $00, $00, $e6        ;; 0c:5423 ........
    db   $80, $00, $1f, $05                            ;; 0c:542b ....
    dw   data_0c_48cd                                  ;; 0c:542f pP
    db   $2b, $22, $00, $05                            ;; 0c:5431 ....
    dw   data_0c_487d                                  ;; 0c:5435 pP
    db   $03                                           ;; 0c:5437 .
    dw   data_0c_6001                                  ;; 0c:5438 pP
    db   $00, $f8, $0c, $d6, $1f, $0b, $bf, $1d        ;; 0c:543a ...p...w
    db   $0c, $ab, $00, $de, $12, $03                  ;; 0c:5442 ......
    dw   data_0c_6b71                                  ;; 0c:5448 pP
    db   $06                                           ;; 0c:544a .
.data_0c_544b:
    db   $05                                           ;; 0c:544b .
    dw   data_0c_46a6                                  ;; 0c:544c pP
    db   $05                                           ;; 0c:544e .
    dw   .data_0c_5423                                 ;; 0c:544f pP
    db   $01, $d6, $cd, $05, $1f, $06, $00, $7d        ;; 0c:5451 .p......
    db   $0c, $d6, $c4, $05, $1f, $00, $7d, $cc        ;; 0c:5459 .p......
    db   $01, $0b, $7d, $c8, $ff, $1f, $a0, $5e        ;; 0c:5461 ..p.....
    db   $cc, $13                                      ;; 0c:5469 ..
    dw   wCC5E                                         ;; 0c:546b pP
    db   $05, $7d, $1f, $a0, $5f, $cc, $13             ;; 0c:546d .p.....
    dw   $cc5f                                         ;; 0c:5474 pP
    db   $05, $7d, $1f, $a0, $60, $cc, $13             ;; 0c:5476 .p.....
    dw   $cc60                                         ;; 0c:547d pP
    db   $05, $7d, $1f, $06                            ;; 0c:547f .p..

data_0c_5483:
    db   $00, $7f, $0c, $d6, $1f, $05                  ;; 0c:5483 ...p..
    dw   data_0c_5fba                                  ;; 0c:5489 pP
    db   $cc, $01, $05, $cc, $ff, $1f, $02, $9f        ;; 0c:548b ..p....?
    db   $54, $ac, $c1, $00, $0c, $01, $c5, $c0        ;; 0c:5493 ?....p..
    db   $1f, $02                                      ;; 0c:549b ..
    dw   .data_0c_54af                                 ;; 0c:549d pP
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:549f ????????
    db   $8b, $54, $0b, $d0, $02, $02, $d9, $54        ;; 0c:54a7 ????????
.data_0c_54af:
    db   $05                                           ;; 0c:54af .
    dw   data_0c_5fc1                                  ;; 0c:54b0 pP
.data_0c_54b2:
    db   $cc, $01, $05, $cc, $ff, $1f, $02             ;; 0c:54b2 ..p....
    dw   .data_0c_54c6                                 ;; 0c:54b9 pP
    db   $ac, $c1, $00, $0c, $01, $c5, $80, $1f        ;; 0c:54bb ....p...
    db   $02                                           ;; 0c:54c3 .
    dw   .data_0c_54d6                                 ;; 0c:54c4 pP
.data_0c_54c6:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:54c6 .p.p.p..
    dw   .data_0c_54b2                                 ;; 0c:54ce pP
    db   $0b, $d0, $01, $02                            ;; 0c:54d0 ....
    dw   .data_0c_54d9                                 ;; 0c:54d4 pP
.data_0c_54d6:
    db   $0b, $d0, $00                                 ;; 0c:54d6 ...
.data_0c_54d9:
    db   $02                                           ;; 0c:54d9 .
    dw   data_0c_5240                                  ;; 0c:54da pP

data_0c_54dc:
    db   $03                                           ;; 0c:54dc .
    dw   data_0c_5ff1                                  ;; 0c:54dd pP
    db   $0b, $dc, $00, $20, $c4, $ec                  ;; 0c:54df ......
    dw   $d808                                         ;; 0c:54e5 pP
    db   $1f, $0b, $d1, $00                            ;; 0c:54e7 ....
.data_0c_54eb:
    db   $20, $75, $2c, $c4, $03, $d1, $1f, $00        ;; 0c:54eb .....p..
    db   $d6, $6c, $75, $1f, $ac, $c1, $00, $0d        ;; 0c:54f3 ........
    db   $01, $c5, $c0, $1f, $02                       ;; 0c:54fb p....
    dw   .data_0c_5546                                 ;; 0c:5500 pP
    db   $c1, $00, $0c, $01, $c5, $08, $1f, $02        ;; 0c:5502 ...p....
    dw   .data_0c_5546                                 ;; 0c:550a pP
    db   $00, $dc, $0c, $01, $c5, $08, $06, $dc        ;; 0c:550c ????????
    db   $1f, $05, $f2, $45, $20, $c0, $2c, $24        ;; 0c:5514 ????????
    db   $c2, $14, $1f, $20, $85, $12, $c0, $1f        ;; 0c:551c ????????
    db   $20, $c0, $2c, $c0, $23, $85, $c3, $01        ;; 0c:5524 ????????
    db   $1f, $21, $c0, $ce, $63, $1f, $20, $c0        ;; 0c:552c ????????
    db   $cc, $63, $1f, $20, $c6, $0c, $d6, $cb        ;; 0c:5534 ????????
    db   $01, $e3, $22, $d8, $1f, $80, $c6, $2c        ;; 0c:553c ????????
    db   $c0, $1f                                      ;; 0c:5544 ??
.data_0c_5546:
    db   $07, $d1, $01, $d1, $0d, $d2, $1f, $02        ;; 0c:5546 .p.p.p..
    dw   .data_0c_54eb                                 ;; 0c:554e pP
    db   $01, $dc, $cc, $00, $1f, $06, $03, $6c        ;; 0c:5550 .p....??
    db   $6b, $0b, $d6, $00, $ab, $73, $d8, $00        ;; 0c:5558 ????????
    db   $ab, $74, $d8, $0c, $02, $59, $53             ;; 0c:5560 ???????

data_0c_5567:
    db   $0b, $d1, $00                                 ;; 0c:5567 ...
.data_0c_556a:
    db   $20, $75, $ec                                 ;; 0c:556a ...
    dw   $d808                                         ;; 0c:556d pP
    db   $03, $d1, $1f, $00, $d6, $6c, $75, $1f        ;; 0c:556f .p......
    db   $ac, $c1, $80, $0c, $01, $c5, $80, $1f        ;; 0c:5577 ....p...
    db   $02                                           ;; 0c:557f .
    dw   .data_0c_558f                                 ;; 0c:5580 pP
    db   $05                                           ;; 0c:5582 .
    dw   data_0c_4573                                  ;; 0c:5583 pP
    db   $c1, $00, $0d, $97, $c5, $03, $1f, $05        ;; 0c:5585 ...p....
    db   $9a, $55                                      ;; 0c:558d ??
.data_0c_558f:
    db   $07, $d1, $01, $d1, $0d, $d2, $1f, $02        ;; 0c:558f .p.p.p..
    dw   .data_0c_556a                                 ;; 0c:5597 pP
    db   $06, $00, $f8, $0c, $d6, $1f, $c1, $00        ;; 0c:5599 .???????
    db   $0c, $97, $c5, $01, $1f, $02, $de, $55        ;; 0c:55a1 ????????
    db   $05, $de, $45, $05, $f2, $45, $20, $7b        ;; 0c:55a9 ????????
    db   $2c, $24, $c2, $0a, $1f, $21, $24, $2d        ;; 0c:55b1 ????????
    db   $20, $23, $7b, $1f, $20, $7b, $2c, $24        ;; 0c:55b9 ????????
    db   $24, $20, $1f, $20, $20, $2c, $20, $23        ;; 0c:55c1 ????????
    db   $7b, $1f, $05, $73, $48, $c1, $00, $0c        ;; 0c:55c9 ????????
    db   $7b, $1f, $06, $0b, $bf, $52, $e0, $75        ;; 0c:55d1 ????????
    db   $d8, $2c, $7b, $1f, $0c, $c1, $00, $0c        ;; 0c:55d9 ????????
    db   $97, $c5, $02, $1f, $06, $05, $9c, $46        ;; 0c:55e1 ????????
    db   $c1, $00, $2c, $01, $e5, $fc, $e0, $1f        ;; 0c:55e9 ????????
    db   $06, $20, $01, $2c, $01, $e5, $80, $00        ;; 0c:55f1 ????????
    db   $1f, $05, $c3, $48, $03, $01, $60, $0b        ;; 0c:55f9 ????????
    db   $bf, $53, $0d, $00, $f8, $0c, $d6, $1f        ;; 0c:5601 ????????
    db   $05, $c4, $46, $c1, $00, $0c, $02, $c5        ;; 0c:5609 ????????
    db   $80, $1f, $02, $50, $56, $0b, $e2, $18        ;; 0c:5611 ????????
    db   $0b, $e3, $08, $05, $d4, $56, $01, $fa        ;; 0c:5619 ????????
    db   $cc, $00, $1f, $02, $37, $56, $05, $de        ;; 0c:5621 ????????
    db   $56, $05, $fa, $56, $0b, $bf, $15, $0c        ;; 0c:5629 ????????
    db   $0b, $bf, $2c, $02, $f9, $56, $a1, $64        ;; 0c:5631 ????????
    db   $ce, $31, $1f, $02, $50, $56, $00, $02        ;; 0c:5639 ????????
    db   $0c, $02, $c5, $67, $1f, $0b, $bf, $15        ;; 0c:5641 ????????
    db   $0c, $0b, $bf, $2b, $02, $f9, $56, $c1        ;; 0c:5649 ????????
    db   $00, $0c, $02, $c5, $40, $1f, $02, $94        ;; 0c:5651 ????????
    db   $56, $0b, $e2, $06, $0b, $e3, $02, $05        ;; 0c:5659 ????????
    db   $d4, $56, $01, $fa, $cc, $00, $1f, $02        ;; 0c:5661 ????????
    db   $7b, $56, $05, $de, $56, $05, $fa, $56        ;; 0c:5669 ????????
    db   $0b, $bf, $15, $0c, $0b, $bf, $2f, $02        ;; 0c:5671 ????????
    db   $f9, $56, $a1, $64, $ce, $31, $1f, $02        ;; 0c:5679 ????????
    db   $94, $56, $00, $02, $0c, $02, $c5, $b9        ;; 0c:5681 ????????
    db   $1f, $0b, $bf, $15, $0c, $0b, $bf, $2e        ;; 0c:5689 ????????
    db   $02, $f9, $56, $c1, $00, $0c, $02, $c5        ;; 0c:5691 ????????
    db   $20, $1f, $06, $0b, $e2, $01, $0b, $e3        ;; 0c:5699 ????????
    db   $01, $05, $d4, $56, $01, $fa, $cc, $00        ;; 0c:56a1 ????????
    db   $1f, $02, $bd, $56, $05, $de, $56, $05        ;; 0c:56a9 ????????
    db   $fa, $56, $0b, $bf, $15, $0c, $0b, $bf        ;; 0c:56b1 ????????
    db   $32, $02, $f9, $56, $a1, $64, $ce, $19        ;; 0c:56b9 ????????
    db   $1f, $06, $00, $02, $0c, $02, $c5, $de        ;; 0c:56c1 ????????
    db   $1f, $0b, $bf, $15, $0c, $0b, $bf, $31        ;; 0c:56c9 ????????
    db   $02, $f9, $56, $00, $fa, $0c, $02, $05        ;; 0c:56d1 ????????
    db   $e2, $02, $e3, $1f, $06, $00, $fa, $0c        ;; 0c:56d9 ????????
    db   $02, $05, $e2, $02, $e3, $c4, $01, $01        ;; 0c:56e1 ????????
    db   $e3, $1f, $00, $02, $0c, $e2, $c8, $ff        ;; 0c:56e9 ????????
    db   $05, $02, $06, $fa, $1f, $02, $fa, $56        ;; 0c:56f1 ????????
    db   $0c, $05, $e1, $48, $03, $01, $60, $06        ;; 0c:56f9 ????????

data_0c_5701:
    db   $ab, $7e, $d8, $ff, $ab, $7f, $d8, $ff        ;; 0c:5701 ........
    db   $ab, $80, $d8, $ff, $ab, $81, $d8, $ff        ;; 0c:5709 ........
    db   $ab, $94, $ce, $ff, $eb, $82, $d8, $00        ;; 0c:5711 ........
    db   $eb, $85, $d8, $00, $05                       ;; 0c:5719 ...w.
    dw   data_0c_5fc1                                  ;; 0c:571e pP
.data_0c_5720:
    db   $cc, $01, $05, $cc, $ff, $1f, $02             ;; 0c:5720 ..p....
    dw   .data_0c_577a                                 ;; 0c:5727 pP
    db   $05                                           ;; 0c:5729 .
    dw   data_0c_46e9                                  ;; 0c:572a pP
    db   $01, $1b, $13                                 ;; 0c:572c .p.
    dw   wCC59                                         ;; 0c:572f pP
    db   $1f, $02                                      ;; 0c:5731 ..
    dw   .data_0c_5747                                 ;; 0c:5733 pP
    db   $01, $1b, $13                                 ;; 0c:5735 .p.
    dw   wCC5A                                         ;; 0c:5738 pP
    db   $1f, $02                                      ;; 0c:573a ..
    dw   .data_0c_5759                                 ;; 0c:573c pP
    db   $01, $1b, $13, $5b, $cc, $1f, $02, $6b        ;; 0c:573e ????????
    db   $57                                           ;; 0c:5746 ?
.data_0c_5747:
    db   $a0, $82, $d8, $13                            ;; 0c:5747 ....
    dw   $d882                                         ;; 0c:574b pP
    db   $c3, $01, $1f, $a0, $85, $d8, $0c, $d6        ;; 0c:574d .......p
    db   $1f, $02                                      ;; 0c:5755 ..
    dw   .data_0c_577a                                 ;; 0c:5757 pP
.data_0c_5759:
    db   $a0, $83, $d8, $13                            ;; 0c:5759 ....
    dw   $d883                                         ;; 0c:575d pP
    db   $c3, $01, $1f, $a0, $86, $d8, $0c, $d6        ;; 0c:575f .......p
    db   $1f, $02                                      ;; 0c:5767 ..
    dw   .data_0c_577a                                 ;; 0c:5769 pP
    db   $a0, $84, $d8, $13, $84, $d8, $c3, $01        ;; 0c:576b ????????
    db   $1f, $a0, $87, $d8, $0c, $d6, $1f             ;; 0c:5773 ???????
.data_0c_577a:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:577a .p.p.p..
    dw   .data_0c_5720                                 ;; 0c:5782 pP
    db   $0b, $7d, $00, $0b, $d6, $00, $0b, $d7        ;; 0c:5784 .....w..
    db   $03                                           ;; 0c:578c .
.data_0c_578d:
    db   $cc, $01, $05, $cc, $ff, $1f, $02, $a3        ;; 0c:578d ..p....?
    db   $57, $ac, $c1, $00, $0d, $01, $c5, $c0        ;; 0c:5795 ?....p..
    db   $1f, $02, $a3, $57, $07, $7d, $07, $d6        ;; 0c:579d ..??.p.p
    db   $01, $d6, $0f, $d7, $1f, $02                  ;; 0c:57a5 .p.p..
    dw   .data_0c_578d                                 ;; 0c:57ab pP
    db   $0b, $d8, $00, $0b, $d9, $02, $eb, $8b        ;; 0c:57ad ........
    db   $d8, $00, $4b, $85, $00                       ;; 0c:57b5 .....
.data_0c_57ba:
    db   $0b, $7e, $0a, $0b, $7b, $01, $20, $c4        ;; 0c:57ba ........
    db   $ec                                           ;; 0c:57c2 .
    dw   wCC59                                         ;; 0c:57c3 pP
    db   $03, $d8, $1f, $61, $c4, $cf, $b3, $1f        ;; 0c:57c5 .p......
    db   $02                                           ;; 0c:57cd .
    dw   .data_0c_57d6                                 ;; 0c:57ce pP
    db   $0b, $7e, $3c, $0b, $7b, $3c                  ;; 0c:57d0 ......
.data_0c_57d6:
    db   $01, $d8, $cc, $00, $1f, $00, $d6, $13        ;; 0c:57d6 .p......
    dw   $d885                                         ;; 0c:57de pP
    db   $1f, $01, $d8, $cc, $01, $1f, $00, $d6        ;; 0c:57e0 ..p.....
    db   $13                                           ;; 0c:57e8 .
    dw   $d886                                         ;; 0c:57e9 pP
    db   $1f, $01, $d8, $cc, $02, $1f, $00, $d6        ;; 0c:57eb ..p.....
    db   $13                                           ;; 0c:57f3 .
    dw   $d887                                         ;; 0c:57f4 pP
    db   $1f, $05                                      ;; 0c:57f6 ..
    dw   data_0c_4674                                  ;; 0c:57f8 pP
    db   $05                                           ;; 0c:57fa .
    dw   data_0c_467e                                  ;; 0c:57fb pP
    db   $01, $d8, $cc, $00, $1f, $00, $75, $13        ;; 0c:57fd .p......
    dw   $d882                                         ;; 0c:5805 pP
    db   $1f, $01, $d8, $cc, $01, $1f, $00, $75        ;; 0c:5807 ..p.....
    db   $13                                           ;; 0c:580f .
    dw   $d883                                         ;; 0c:5810 pP
    db   $1f, $01, $d8, $cc, $02, $1f, $00, $75        ;; 0c:5812 ..p.....
    db   $13                                           ;; 0c:581a .
    dw   $d884                                         ;; 0c:581b pP
    db   $1f, $01, $75, $cc, $00, $1f, $02             ;; 0c:581d ..p....
    dw   .data_0c_5848                                 ;; 0c:5824 pP
    db   $20, $78, $0c, $75, $01, $a2, $01, $7e        ;; 0c:5826 ...p.p.p
    db   $1f, $20, $75, $0c, $75, $01, $a1, $01        ;; 0c:582e ....p.p.
    db   $7b, $1f, $e0, $8b, $d8, $53, $8b, $d8        ;; 0c:5836 p.......
    db   $23, $75, $1f, $40, $85, $4c, $85, $23        ;; 0c:583e ........
    db   $78, $1f                                      ;; 0c:5846 ..
.data_0c_5848:
    db   $07, $d8, $01, $d8, $0f, $d9, $1f, $02        ;; 0c:5848 .p.p.p..
    dw   .data_0c_57ba                                 ;; 0c:5850 pP
    db   $40, $88, $4c, $85, $1f, $e0, $8b, $d8        ;; 0c:5852 ........
    db   $53, $8b, $d8, $02, $7d, $1f, $e0, $75        ;; 0c:585a ....p...
    db   $d8, $53, $8b, $d8, $1f, $0b, $bf, $08        ;; 0c:5862 .......w
    db   $0c, $20, $c4, $ec, $9d, $cd, $1f, $0b        ;; 0c:586a ........
    db   $d6, $00, $0b, $d7, $03                       ;; 0c:5872 .w...
.data_0c_5877:
    db   $ac, $cc, $c1, $00, $0d, $01, $c5, $c0        ;; 0c:5877 .....p..
    db   $1f, $02, $e7, $58, $01, $05, $d0, $63        ;; 0c:587f ..??.p..
    db   $1f, $02, $e7, $58, $05                       ;; 0c:5887 ..??.
    dw   data_0c_45cd                                  ;; 0c:588c pP
    db   $40, $07, $53, $8b, $d8, $43, $07, $1f        ;; 0c:588e ........
    db   $05                                           ;; 0c:5896 .
    dw   data_0c_482a                                  ;; 0c:5897 pP
    db   $20, $c4, $0c, $d6, $c1, $03, $e3, $9d        ;; 0c:5899 ...p....
    db   $cd, $1f, $00, $75, $6c, $c4, $1f, $27        ;; 0c:58a1 ........
    db   $c4, $20, $76, $8c, $c4, $1f, $41, $07        ;; 0c:58a9 p.......
    db   $4d, $75, $1f, $02                            ;; 0c:58b1 ....
    dw   .data_0c_58e7                                 ;; 0c:58b5 pP
    db   $05, $02, $5e, $00, $f8, $0c, $d6, $1f        ;; 0c:58b7 ????????
    db   $0b, $bf, $11, $0c, $ab, $bc, $ff, $3c        ;; 0c:58bf ????????
    db   $05, $d8, $46, $00, $7f, $0c, $19, $c5        ;; 0c:58c7 ????????
    db   $07, $1f, $01, $7f, $cc, $02, $1f, $02        ;; 0c:58cf ????????
    db   $e7, $58, $01, $7f, $cc, $03, $1f, $02        ;; 0c:58d7 ????????
    db   $e4, $58, $02, $e7, $58, $05, $cf, $5d        ;; 0c:58df ????????
.data_0c_58e7:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:58e7 .p.p.p..
    dw   .data_0c_5877                                 ;; 0c:58ef pP
    db   $40, $85, $4c, $88, $1f, $20, $75, $ec        ;; 0c:58f1 ........
    db   $3f, $42, $1f, $0b, $77, $0f, $40, $85        ;; 0c:58f9 ........
    db   $53, $e0, $c6, $43, $85, $1f, $41, $85        ;; 0c:5901 ........
    db   $4e, $75, $1f, $40, $85, $4c, $75, $1f        ;; 0c:5909 ....?.?.
    db   $40, $75, $53, $e0, $c6, $1f, $e0, $75        ;; 0c:5911 ........
    db   $d8, $4c, $85, $44, $75, $1f, $0b, $bf        ;; 0c:5919 ........
    db   $09, $c1, $00, $53, $75, $d8, $1f, $02        ;; 0c:5921 w.......
    db   $2c, $59, $0c, $e0, $e0, $c6, $4c, $85        ;; 0c:5929 ??......
    db   $1f, $c1, $00, $13                            ;; 0c:5931 ....
    dw   wCA2D                                         ;; 0c:5935 pP
    db   $1f, $06, $a1, $64, $ce, $32, $1f, $06        ;; 0c:5937 ..??????
    db   $40, $75, $53, $36, $cc, $1f, $00, $d6        ;; 0c:593f ????????
    db   $0c, $75, $03, $76, $03, $77, $1f, $00        ;; 0c:5947 ????????
    db   $d6, $12, $d6, $1f, $00, $d6, $0c, $d6        ;; 0c:594f ????????
    db   $c3, $05, $1f, $05, $e9, $46, $01, $1b        ;; 0c:5957 ????????
    db   $d0, $b4, $1f, $06, $a1, $64, $cd, $46        ;; 0c:595f ????????
    db   $1f, $02, $8f, $59, $05, $88, $46, $c1        ;; 0c:5967 ????????
    db   $ff, $0c, $a3, $1f, $06, $a0, $94, $ce        ;; 0c:596f ????????
    db   $0c, $a3, $1f, $03, $3b, $6b, $c1, $ff        ;; 0c:5977 ????????
    db   $13, $94, $ce, $1f, $06, $a0, $8c, $ce        ;; 0c:597f ????????
    db   $13, $94, $ce, $1f, $0b, $bf, $0a, $0d        ;; 0c:5987 ????????
    db   $01, $1b, $ce, $b3, $1f, $06, $a0, $80        ;; 0c:598f ????????
    db   $d8, $0c, $1b, $1f, $cc, $a0, $7e, $d8        ;; 0c:5997 ????????
    db   $0c, $05, $1f, $05, $92, $46, $a0, $7f        ;; 0c:599f ????????
    db   $d8, $0c, $a4, $1f, $05, $d8, $46, $a0        ;; 0c:59a7 ????????
    db   $81, $d8, $0c, $19, $1f, $00, $f9, $0c        ;; 0c:59af ????????
    db   $d6, $1f, $0b, $bf, $5b, $0b, $8a, $00        ;; 0c:59b7 ????????
    db   $01, $1b, $ce, $77, $1f, $02, $de, $59        ;; 0c:59bf ????????
    db   $08, $bf, $07, $8a, $20, $c4, $ec, $51        ;; 0c:59c7 ????????
    db   $cc, $03, $d6, $c4, $05, $1f, $c1, $57        ;; 0c:59cf ????????
    db   $6c, $c4, $c5, $57, $1f, $07, $8a, $03        ;; 0c:59d7 ????????
    db   $71, $1d, $ab, $00, $de, $14, $03, $71        ;; 0c:59df ????????
    db   $6b, $0c, $a0, $36, $cd, $0c, $1b, $1f        ;; 0c:59e7 ????????
    db   $03, $74, $1d, $c1, $ff, $13, $36, $cd        ;; 0c:59ef ????????
    db   $1f, $06, $00, $d6, $13, $36, $cd, $1f        ;; 0c:59f7 ????????
    db   $05, $41, $45, $00, $f8, $0c, $d6, $1f        ;; 0c:59ff ????????
    db   $a0, $81, $d8, $13, $81, $d8, $c5, $07        ;; 0c:5a07 ????????
    db   $1f, $05, $f7, $44, $05, $69, $45, $05        ;; 0c:5a0f ????????
    db   $e9, $46, $05, $d8, $46, $00, $85, $13        ;; 0c:5a17 ????????
    db   $81, $d8, $1f, $01, $85, $0c, $19, $c5        ;; 0c:5a1f ????????
    db   $07, $1f, $02, $62, $5a, $01, $85, $0d        ;; 0c:5a27 ????????
    db   $19, $c5, $07, $1f, $02, $3b, $5a, $07        ;; 0c:5a2f ????????
    db   $19, $02, $3d, $5a, $08, $19, $05, $eb        ;; 0c:5a37 ????????
    db   $48, $c1, $02, $0c, $19, $c5, $07, $1f        ;; 0c:5a3f ????????
    db   $02, $4d, $5a, $02, $62, $5a, $0b, $1b        ;; 0c:5a47 ????????
    db   $f0, $05, $15, $49, $00, $95, $0c, $73        ;; 0c:5a4f ????????
    db   $c5, $60, $ca, $05, $1f, $05, $29, $49        ;; 0c:5a57 ????????
    db   $02, $94, $5c, $20, $7b, $0c, $95, $cb        ;; 0c:5a5f ????????
    db   $02, $e3, $ac, $60, $1f, $20, $7b, $13        ;; 0c:5a67 ????????
    db   $7f, $d8, $23, $7b, $1f, $00, $95, $6c        ;; 0c:5a6f ????????
    db   $7b, $1f, $05, $29, $49, $05, $f2, $5d        ;; 0c:5a77 ????????
    db   $20, $ca, $0c, $19, $c5, $07, $cb, $01        ;; 0c:5a7f ????????
    db   $e3, $92, $5a, $1f, $20, $ca, $8c, $ca        ;; 0c:5a87 ????????
    db   $1f, $0a, $ca, $c4, $5a, $b8, $5a, $94        ;; 0c:5a8f ????????
    db   $5c, $a8, $5a, $9c, $5a, $20, $7b, $ec        ;; 0c:5a97 ????????
    db   $b3, $7e, $1f, $03, $52, $6b, $02, $cd        ;; 0c:5a9f ????????
    db   $5a, $05, $ae, $5a, $02, $cd, $5a, $20        ;; 0c:5aa7 ????????
    db   $7b, $ec, $f3, $7e, $1f, $03, $52, $6b        ;; 0c:5aaf ????????
    db   $06, $20, $7b, $ec, $33, $7f, $1f, $03        ;; 0c:5ab7 ????????
    db   $55, $6b, $02, $cd, $5a, $20, $7b, $ec        ;; 0c:5abf ????????
    db   $53, $7f, $1f, $03, $55, $6b, $01, $1b        ;; 0c:5ac7 ????????
    db   $13, $88, $d8, $1f, $02, $10, $5d, $00        ;; 0c:5acf ????????
    db   $1b, $13, $88, $d8, $1f, $05, $15, $49        ;; 0c:5ad7 ????????
    db   $03, $25, $6b, $00, $7f, $0c, $d6, $1f        ;; 0c:5adf ????????
    db   $0b, $d6, $0d, $05, $2f, $47, $05, $b8        ;; 0c:5ae7 ????????
    db   $44, $05, $cb, $44, $05, $88, $44, $05        ;; 0c:5aef ????????
    db   $0b, $45, $05, $fd, $46, $00, $55, $0c        ;; 0c:5af7 ????????
    db   $55, $c5, $03, $1f, $05, $40, $52, $05        ;; 0c:5aff ????????
    db   $62, $49, $03, $6d, $60, $cc, $05, $25        ;; 0c:5b07 ????????
    db   $47, $05, $94, $60, $c1, $02, $0e, $19        ;; 0c:5b0f ????????
    db   $c5, $07, $1f, $02, $5c, $5b, $00, $7f        ;; 0c:5b17 ????????
    db   $0c, $d6, $1f, $0b, $d6, $0d, $05, $f2        ;; 0c:5b1f ????????
    db   $45, $05, $1a, $46, $05, $40, $52, $c0        ;; 0c:5b27 ????????
    db   $89, $d8, $2c, $24, $1f, $05, $48, $5d        ;; 0c:5b2f ????????
    db   $c0, $89, $d8, $2c, $2c, $1f, $05, $79        ;; 0c:5b37 ????????
    db   $5d, $c1, $04, $0e, $19, $c5, $07, $1f        ;; 0c:5b3f ????????
    db   $02, $5c, $5b, $05, $5d, $48, $a0, $36        ;; 0c:5b47 ????????
    db   $cd, $0c, $d6, $1f, $03, $44, $6b, $0b        ;; 0c:5b4f ????????
    db   $84, $ff, $02, $d3, $5c, $05, $60, $46        ;; 0c:5b57 ????????
    db   $05, $6a, $46, $40, $55, $4c, $55, $46        ;; 0c:5b5f ????????
    db   $52, $1f, $05, $5d, $48, $a0, $36, $cd        ;; 0c:5b67 ????????
    db   $0c, $d6, $1f, $03, $44, $6b, $c1, $02        ;; 0c:5b6f ????????
    db   $0e, $19, $c5, $07, $1f, $02, $a8, $5b        ;; 0c:5b77 ????????
    db   $05, $68, $47, $00, $30, $0c, $30, $03        ;; 0c:5b7f ????????
    db   $38, $1f, $00, $31, $0c, $31, $c2, $02        ;; 0c:5b87 ????????
    db   $03, $39, $03, $5b, $1f, $00, $32, $0c        ;; 0c:5b8f ????????
    db   $32, $03, $3a, $1f, $00, $33, $0c, $33        ;; 0c:5b97 ????????
    db   $03, $3b, $1f, $0b, $84, $00, $02, $d3        ;; 0c:5b9f ????????
    db   $5c, $c1, $00, $0c, $19, $c5, $07, $1f        ;; 0c:5ba7 ????????
    db   $02, $2a, $5c, $03, $28, $6b, $00, $7f        ;; 0c:5baf ????????
    db   $0c, $d6, $1f, $0b, $d6, $0d, $05, $f2        ;; 0c:5bb7 ????????
    db   $45, $05, $1a, $46, $05, $40, $52, $05        ;; 0c:5bbf ????????
    db   $42, $46, $c0, $89, $d8, $2c, $24, $c1        ;; 0c:5bc7 ????????
    db   $02, $c2, $05, $23, $44, $1f, $05, $48        ;; 0c:5bcf ????????
    db   $5d, $05, $4c, $46, $c0, $89, $d8, $2c        ;; 0c:5bd7 ????????
    db   $2c, $c1, $02, $c2, $05, $23, $46, $1f        ;; 0c:5bdf ????????
    db   $05, $79, $5d, $05, $8e, $47, $05, $68        ;; 0c:5be7 ????????
    db   $47, $00, $30, $0c, $30, $c1, $07, $c2        ;; 0c:5bef ????????
    db   $0a, $03, $38, $03, $48, $1f, $00, $31        ;; 0c:5bf7 ????????
    db   $0c, $31, $c2, $05, $03, $39, $03, $49        ;; 0c:5bff ????????
    db   $03, $5b, $1f, $00, $32, $0c, $32, $c1        ;; 0c:5c07 ????????
    db   $07, $c2, $0a, $03, $3a, $03, $4a, $1f        ;; 0c:5c0f ????????
    db   $00, $33, $0c, $33, $c1, $07, $c2, $0a        ;; 0c:5c17 ????????
    db   $03, $3b, $03, $4b, $1f, $0b, $84, $00        ;; 0c:5c1f ????????
    db   $02, $d3, $5c, $03, $28, $6b, $00, $7f        ;; 0c:5c27 ????????
    db   $0c, $d6, $1f, $0b, $d6, $0d, $05, $f2        ;; 0c:5c2f ????????
    db   $45, $05, $1a, $46, $05, $40, $52, $05        ;; 0c:5c37 ????????
    db   $56, $46, $c0, $89, $d8, $2c, $24, $c2        ;; 0c:5c3f ????????
    db   $05, $23, $4c, $1f, $05, $48, $5d, $2b        ;; 0c:5c47 ????????
    db   $28, $00, $2b, $2c, $00, $05, $9b, $48        ;; 0c:5c4f ????????
    db   $05, $af, $48, $05, $a1, $47, $05, $68        ;; 0c:5c57 ????????
    db   $47, $00, $30, $0c, $30, $ca, $01, $03        ;; 0c:5c5f ????????
    db   $38, $03, $4e, $1f, $00, $31, $0c, $31        ;; 0c:5c67 ????????
    db   $c2, $0a, $03, $39, $03, $4f, $03, $5b        ;; 0c:5c6f ????????
    db   $1f, $00, $32, $0c, $32, $ca, $01, $03        ;; 0c:5c77 ????????
    db   $3a, $03, $50, $1f, $00, $33, $0c, $33        ;; 0c:5c7f ????????
    db   $ca, $01, $03, $3b, $03, $51, $1f, $0b        ;; 0c:5c87 ????????
    db   $84, $00, $02, $d3, $5c, $05, $2e, $46        ;; 0c:5c8f ????????
    db   $c0, $89, $d8, $2c, $3c, $1f, $05, $48        ;; 0c:5c97 ????????
    db   $5d, $05, $38, $46, $c0, $89, $d8, $2c        ;; 0c:5c9f ????????
    db   $3e, $1f, $05, $79, $5d, $05, $7b, $47        ;; 0c:5ca7 ????????
    db   $05, $68, $47, $03, $db, $5f, $03, $cc        ;; 0c:5caf ????????
    db   $5f, $40, $55, $4c, $52, $1f, $05, $5d        ;; 0c:5cb7 ????????
    db   $48, $a0, $36, $cd, $0c, $d6, $1f, $03        ;; 0c:5cbf ????????
    db   $44, $6b, $cc, $05, $26, $5d, $05, $94        ;; 0c:5cc7 ????????
    db   $60, $0b, $84, $00, $05, $62, $49, $05        ;; 0c:5ccf ????????
    db   $5b, $49, $05, $d1, $47, $05, $3b, $48        ;; 0c:5cd7 ????????
    db   $05, $1f, $49, $05, $51, $49, $05, $eb        ;; 0c:5cdf ????????
    db   $48, $03, $b6, $5d, $03, $01, $60, $c1        ;; 0c:5ce7 ????????
    db   $02, $0c, $8a, $1f, $05, $14, $5d, $c1        ;; 0c:5cef ????????
    db   $02, $0c, $19, $c5, $07, $1f, $02, $08        ;; 0c:5cf7 ????????
    db   $5d, $0b, $bf, $0e, $0c, $0b, $bf, $10        ;; 0c:5cff ????????
    db   $0d, $0b, $bf, $0d, $0c, $0b, $bf, $0f        ;; 0c:5d07 ????????
    db   $0d, $0b, $bf, $0b, $0c, $ab, $bc, $ff        ;; 0c:5d0f ????????
    db   $17, $05, $de, $45, $05, $f2, $45, $20        ;; 0c:5d17 ????????
    db   $20, $2c, $24, $1f, $02, $73, $48, $05        ;; 0c:5d1f ????????
    db   $68, $47, $00, $30, $0c, $40, $03, $38        ;; 0c:5d27 ????????
    db   $1f, $00, $31, $0c, $41, $03, $39, $03        ;; 0c:5d2f ????????
    db   $5b, $1f, $00, $32, $0c, $42, $03, $3a        ;; 0c:5d37 ????????
    db   $1f, $00, $33, $0c, $43, $03, $3b, $1f        ;; 0c:5d3f ????????
    db   $06, $05, $de, $45, $05, $f2, $45, $c0        ;; 0c:5d47 ????????
    db   $46, $cd, $33, $89, $d8, $1f, $c0, $48        ;; 0c:5d4f ????????
    db   $cd, $2c, $20, $1f, $03, $99, $24, $c0        ;; 0c:5d57 ????????
    db   $4a, $cd, $2c, $24, $1f, $03, $c7, $24        ;; 0c:5d5f ????????
    db   $20, $20, $33, $46, $cd, $1f, $20, $24        ;; 0c:5d67 ????????
    db   $33, $89, $d8, $1f, $05, $73, $48, $02        ;; 0c:5d6f ????????
    db   $87, $48, $05, $06, $46, $05, $1a, $46        ;; 0c:5d77 ????????
    db   $cb, $46, $cd, $00, $c1, $00, $2c, $2c        ;; 0c:5d7f ????????
    db   $1f, $02, $a4, $5d, $c0, $46, $cd, $33        ;; 0c:5d87 ????????
    db   $89, $d8, $1f, $c0, $48, $cd, $2c, $28        ;; 0c:5d8f ????????
    db   $1f, $03, $99, $24, $c0, $4a, $cd, $2c        ;; 0c:5d97 ????????
    db   $2c, $1f, $03, $c7, $24, $20, $28, $33        ;; 0c:5d9f ????????
    db   $46, $cd, $1f, $20, $2c, $33, $89, $d8        ;; 0c:5da7 ????????
    db   $1f, $05, $9b, $48, $02, $af, $48, $21        ;; 0c:5daf ????????
    db   $c7, $5d, $fa, $d6, $c9, $87, $c7, $2a        ;; 0c:5db7 ????????
    db   $56, $5f, $21, $a5, $c9, $c3, $81, $1f        ;; 0c:5dbf ????????
    db   $59, $c5, $b9, $c5, $19, $c6, $79, $c6        ;; 0c:5dc7 ????????
    db   $00, $f8, $0c, $d6, $1f, $00, $f9, $0c        ;; 0c:5dcf ????????
    db   $d6, $1f, $05, $f2, $5d, $05, $69, $45        ;; 0c:5dd7 ????????
    db   $05, $e9, $46, $00, $95, $cc, $03, $04        ;; 0c:5ddf ????????
    db   $95, $1f, $05, $29, $49, $05, $ae, $5a        ;; 0c:5de7 ????????
    db   $02, $d6, $5a, $cc, $00, $6e, $0c, $05        ;; 0c:5def ????????
    db   $1f, $01, $6e, $cf, $20, $1f, $06, $0b        ;; 0c:5df7 ????????
    db   $6e, $20, $06, $05, $d8, $46, $cc, $05        ;; 0c:5dff ????????
    db   $2f, $47, $05, $2e, $46, $05, $38, $46        ;; 0c:5e07 ????????
    db   $05, $7b, $47, $05, $41, $45, $07, $05        ;; 0c:5e0f ????????
    db   $05, $3d, $49, $0b, $7f, $00, $c1, $01        ;; 0c:5e17 ????????
    db   $0d, $19, $c5, $80, $1f, $00, $7f, $cc        ;; 0c:5e1f ????????
    db   $02, $1f, $00, $7b, $cc, $14, $a3, $03        ;; 0c:5e27 ????????
    db   $04, $7f, $1f, $20, $3c, $2c, $3c, $03        ;; 0c:5e2f ????????
    db   $7b, $1f, $c0, $89, $d8, $2c, $3c, $1f        ;; 0c:5e37 ????????
    db   $c1, $02, $0c, $19, $c5, $07, $1f, $05        ;; 0c:5e3f ????????
    db   $48, $5d, $0b, $7f, $0c, $c1, $01, $0d        ;; 0c:5e47 ????????
    db   $19, $c5, $80, $1f, $00, $7f, $cc, $00        ;; 0c:5e4f ????????
    db   $1f, $00, $7b, $cc, $14, $a3, $03, $04        ;; 0c:5e57 ????????
    db   $7f, $1f, $20, $3e, $2c, $3e, $03, $7b        ;; 0c:5e5f ????????
    db   $1f, $c0, $89, $d8, $2c, $3e, $1f, $c1        ;; 0c:5e67 ????????
    db   $02, $0c, $19, $c5, $07, $1f, $05, $79        ;; 0c:5e6f ????????
    db   $5d, $0b, $7f, $03, $c1, $00, $0d, $19        ;; 0c:5e77 ????????
    db   $c5, $80, $1f, $00, $7f, $cc, $01, $1f        ;; 0c:5e7f ????????
    db   $00, $40, $0c, $40, $03, $7f, $1f, $00        ;; 0c:5e87 ????????
    db   $41, $0c, $41, $c3, $02, $1f, $00, $42        ;; 0c:5e8f ????????
    db   $0c, $42, $c3, $02, $1f, $0b, $7f, $01        ;; 0c:5e97 ????????
    db   $c1, $00, $0d, $19, $c5, $80, $1f, $00        ;; 0c:5e9f ????????
    db   $7f, $cc, $03, $1f, $00, $43, $0c, $43        ;; 0c:5ea7 ????????
    db   $03, $7f, $1f, $03, $83, $60, $c1, $02        ;; 0c:5eaf ????????
    db   $0c, $19, $c5, $07, $1f, $02, $c2, $5e        ;; 0c:5eb7 ????????
    db   $02, $c8, $5e, $05, $26, $5d, $05, $94        ;; 0c:5ebf ????????
    db   $60, $03, $46, $1e, $05, $88, $49, $05        ;; 0c:5ec7 ????????
    db   $91, $48, $05, $b9, $48, $c1, $02, $0c        ;; 0c:5ecf ????????
    db   $19, $c5, $07, $1f, $02, $df, $5e, $06        ;; 0c:5ed7 ????????
    db   $05, $62, $49, $02, $5b, $49                  ;; 0c:5edf ??????

data_0c_5ee5:
    db   $2b, $d4, $00, $0b, $d8, $00                  ;; 0c:5ee5 ......
.data_0c_5eeb:
    db   $cc, $01, $05, $cc, $ff, $1f, $02             ;; 0c:5eeb ..p....
    dw   .data_0c_5f0d                                 ;; 0c:5ef2 pP
    db   $05                                           ;; 0c:5ef4 .
    dw   data_0c_469c                                  ;; 0c:5ef5 pP
    db   $c1, $00, $2d, $01, $e5, $c0, $c0, $1f        ;; 0c:5ef7 ........
    db   $02, $0d, $5f, $09, $ca, $20, $d4, $2c        ;; 0c:5eff .??.....
    db   $d4, $63, $c2, $1f, $07, $d8                  ;; 0c:5f07 .....p
.data_0c_5f0d:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:5f0d .p.p.p..
    dw   .data_0c_5eeb                                 ;; 0c:5f15 pP
    db   $00, $ed, $2c, $d4, $02, $d8, $1f, $06        ;; 0c:5f17 .....p..

data_0c_5f1f:
    db   $01, $d8, $cd, $05, $1f, $0d, $c1, $00        ;; 0c:5f1f .p......
    db   $0c, $9c, $c5, $c0, $1f, $0d, $a0, $7a        ;; 0c:5f27 .p....??
    db   $d8, $0c, $d8, $1f, $03, $58, $6b, $a0        ;; 0c:5f2f ????????
    db   $84, $ce, $13, $7a, $d8, $c3, $01, $1f        ;; 0c:5f37 ????????
    db   $03, $4c, $6b, $01, $d8, $13, $90, $ce        ;; 0c:5f3f ????????
    db   $1f, $0d, $06                                 ;; 0c:5f47 ???

data_0c_5f4a:
    db   $01, $f8, $cc, $ff, $1f, $02                  ;; 0c:5f4a .p....
    dw   .data_0c_5f64                                 ;; 0c:5f50 pP
    db   $01, $f8, $ce, $04, $1f, $00, $f8, $0c        ;; 0c:5f52 .p......
    db   $f8, $c3, $7b, $1f, $a0, $36, $cd, $0c        ;; 0c:5f5a p.......
    db   $f8, $1f                                      ;; 0c:5f62 p.
.data_0c_5f64:
    db   $01, $f9, $cc, $ff, $1f, $02                  ;; 0c:5f64 .p....
    dw   .data_0c_5f7e                                 ;; 0c:5f6a pP
    db   $01, $f9, $ce, $04, $1f, $00, $f9, $0c        ;; 0c:5f6c .p......
    db   $f9, $c3, $7b, $1f, $a0, $4c, $cd, $0c        ;; 0c:5f74 p.......
    db   $f9, $1f                                      ;; 0c:5f7c p.
.data_0c_5f7e:
    db   $03                                           ;; 0c:5f7e .
    dw   data_0c_6b41                                  ;; 0c:5f7f pP
    db   $ab, $7f, $ce, $00, $e0, $7c, $ce, $53        ;; 0c:5f81 ........
    db   $75, $d8, $1f, $03                            ;; 0c:5f89 ....
    dw   .data_0c_5f9d                                 ;; 0c:5f8d pP
    db   $03                                           ;; 0c:5f8f .
    dw   .data_0c_5fb7                                 ;; 0c:5f90 pP
    db   $0b, $f8, $ff, $0b, $f9, $ff, $ab, $8c        ;; 0c:5f92 ........
    db   $ce, $ff, $06                                 ;; 0c:5f9a ...
.data_0c_5f9d:
    ld   A, [wC9BF]                                    ;; 0c:5f9d $fa $bf $c9
    ld   HL, data_0c_78fe                              ;; 0c:5fa0 $21 $fe $78
    rst  add_hl_a                                      ;; 0c:5fa3 $c7
    rst  add_hl_a                                      ;; 0c:5fa4 $c7
    ld   A, $09                                        ;; 0c:5fa5 $3e $09
    call call_00_391b                                  ;; 0c:5fa7 $cd $1b $39
    ld   [wCE8D], A                                    ;; 0c:5faa $ea $8d $ce
    inc  HL                                            ;; 0c:5fad $23
    ld   A, $09                                        ;; 0c:5fae $3e $09
    call call_00_391b                                  ;; 0c:5fb0 $cd $1b $39
    ld   [wCE8E], A                                    ;; 0c:5fb3 $ea $8e $ce
    ret                                                ;; 0c:5fb6 $c9
.data_0c_5fb7:
    rst  rst_00_0018                                   ;; 0c:5fb7 $df
    db   $5c                                           ;; 0c:5fb8 .
    ret                                                ;; 0c:5fb9 $c9

data_0c_5fba:
    db   $0b, $d6, $00, $0b, $d7, $04, $06             ;; 0c:5fba ..w....

data_0c_5fc1:
    db   $0b, $d6, $05, $0b, $d7, $0c, $06, $05        ;; 0c:5fc1 ..w....?
    db   $ff, $59, $1f, $3e, $ff, $21, $3e, $d8        ;; 0c:5fc9 ????????
    db   $18, $05, $3e, $19, $21, $6b, $d8, $c3        ;; 0c:5fd1 ????????
    db   $51, $1f, $21, $da, $7a, $fa, $d6, $c9        ;; 0c:5fd9 ????????
    db   $11, $60, $00, $3c, $19, $3d, $20, $fc        ;; 0c:5fe1 ????????
    db   $11, $a5, $c9, $06, $07, $df, $73, $c9        ;; 0c:5fe9 ????????

data_0c_5ff1:
    ld   A, $80                                        ;; 0c:5ff1 $3e $80
    ld   HL, wD822                                     ;; 0c:5ff3 $21 $22 $d8
    call call_00_1f4c                                  ;; 0c:5ff6 $cd $4c $1f
    ld   A, $80                                        ;; 0c:5ff9 $3e $80
    ld   HL, wD82F                                     ;; 0c:5ffb $21 $2f $d8
    jp   call_00_1f4c                                  ;; 0c:5ffe $c3 $4c $1f

data_0c_6001:
    ld   A, [wD203]                                    ;; 0c:6001 $fa $03 $d2
    rlca                                               ;; 0c:6004 $07
    ld   A, $05                                        ;; 0c:6005 $3e $05
    sbc  A, $00                                        ;; 0c:6007 $de $00
    ld   B, A                                          ;; 0c:6009 $47
    ld   HL, wD00D                                     ;; 0c:600a $21 $0d $d0
    ld   DE, $86c0                                     ;; 0c:600d $11 $c0 $86
.jr_0c_6010:
    push BC                                            ;; 0c:6010 $c5
    push HL                                            ;; 0c:6011 $e5
    push DE                                            ;; 0c:6012 $d5
    ld   A, $02                                        ;; 0c:6013 $3e $02
    rst  rst_00_0018                                   ;; 0c:6015 $df
    db   $59                                           ;; 0c:6016 .
    pop  DE                                            ;; 0c:6017 $d1
    ld   HL, $40                                       ;; 0c:6018 $21 $40 $00
    add  HL, DE                                        ;; 0c:601b $19
    ld   D, H                                          ;; 0c:601c $54
    ld   E, L                                          ;; 0c:601d $5d
    pop  HL                                            ;; 0c:601e $e1
    ld   A, $80                                        ;; 0c:601f $3e $80
    rst  add_hl_a                                      ;; 0c:6021 $c7
    pop  BC                                            ;; 0c:6022 $c1
    dec  B                                             ;; 0c:6023 $05
    jr   NZ, .jr_0c_6010                               ;; 0c:6024 $20 $ea
    ld   A, $17                                        ;; 0c:6026 $3e $17
    jp   jp_0c_6b6e                                    ;; 0c:6028 $c3 $6e $6b
    db   $21, $01, $d0, $11, $80, $00, $af, $cb        ;; 0c:602b ????????
    db   $7e, $20, $04, $cb, $76, $28, $04, $19        ;; 0c:6033 ????????
    db   $3c, $18, $f4, $ea, $d8, $c9, $c9, $fa        ;; 0c:603b ????????
    db   $ff, $dd, $47, $0e, $00, $11, $80, $00        ;; 0c:6043 ????????
    db   $21, $01, $d0, $7e, $e6, $c0, $20, $01        ;; 0c:604b ????????
    db   $0c, $19, $05, $20, $f6, $79, $ea, $7e        ;; 0c:6053 ????????
    db   $c9, $c9                                      ;; 0c:605b ??

data_0c_605d:
    ld   HL, wCC5E                                     ;; 0c:605d $21 $5e $cc
    ld   A, [HL+]                                      ;; 0c:6060 $2a
    ld   C, [HL]                                       ;; 0c:6061 $4e
    inc  HL                                            ;; 0c:6062 $23
    ld   B, [HL]                                       ;; 0c:6063 $46
    or   A, B                                          ;; 0c:6064 $b0
    or   A, C                                          ;; 0c:6065 $b1
    ld   HL, wCE84                                     ;; 0c:6066 $21 $84 $ce
    ld   [HL], A                                       ;; 0c:6069 $77
    rst  rst_00_0018                                   ;; 0c:606a $df
    db   $7f                                           ;; 0c:606b .
    ret                                                ;; 0c:606c $c9
    db   $11, $3d, $00, $cd, $e8, $4b, $fa, $19        ;; 0c:606d ????????
    db   $c9, $e6, $07, $fe, $04, $c0, $54, $5d        ;; 0c:6075 ????????
    db   $21, $bd, $d6, $c3, $8d, $1f, $21, $40        ;; 0c:607d ????????
    db   $c9, $06, $04, $7e, $fe, $64, $38, $02        ;; 0c:6085 ????????
    db   $3e, $63, $22, $05, $20, $f5, $c9, $00        ;; 0c:608d ????????
    db   $91, $0c, $05, $03, $32, $ca, $02, $c3        ;; 0c:6095 ????????
    db   $4b, $1f, $01, $91, $ce, $63, $1f, $00        ;; 0c:609d ????????
    db   $91, $cc, $63, $1f, $02, $1f, $49, $00        ;; 0c:60a5 ????????
    db   $02, $03, $01, $03, $01, $00, $02, $01        ;; 0c:60ad ????????
    db   $03, $02, $00, $02, $00, $01, $03             ;; 0c:60b5 ???????

data_0c_60bc:
    db   $20, $c4, $ec, $08, $d8, $1f, $0b, $83        ;; 0c:60bc ........
    db   $ff, $0b, $d1, $00                            ;; 0c:60c4 ....
.data_0c_60c8:
    db   $20, $7b, $ec                                 ;; 0c:60c8 ...
    dw   $d808                                         ;; 0c:60cb pP
    db   $03, $d1, $1f, $00, $d6, $6c, $7b, $1f        ;; 0c:60cd .p......
    db   $05                                           ;; 0c:60d5 .
    dw   data_0c_46c4                                  ;; 0c:60d6 pP
    db   $c1, $00, $0d, $02, $1f, $02, $fd, $63        ;; 0c:60d8 ...p..??
    db   $01, $d6, $ce, $04, $1f, $02                  ;; 0c:60e0 .p....
    dw   .data_0c_60f8                                 ;; 0c:60e6 pP
    db   $05                                           ;; 0c:60e8 .
    dw   data_0c_44f7                                  ;; 0c:60e9 pP
    db   $c1, $00, $0d, $73, $c5, $80, $1f, $02        ;; 0c:60eb ...p....
    db   $2a, $61, $02                                 ;; 0c:60f3 ??.
    dw   .data_0c_6406                                 ;; 0c:60f6 pP
.data_0c_60f8:
    db   $05                                           ;; 0c:60f8 .
    dw   data_0c_46e9                                  ;; 0c:60f9 pP
    db   $01, $1b, $cc, $c1, $1f, $02, $0e, $61        ;; 0c:60fb .p....??
    db   $01, $1b, $cc, $c2, $1f, $02, $16, $61        ;; 0c:6103 .p....??
    db   $02                                           ;; 0c:610b .
    dw   .data_0c_612a                                 ;; 0c:610c pP
    db   $0b, $9b, $00, $eb, $e2, $d2, $00, $06        ;; 0c:610e ????????
    db   $01, $80, $cc, $02, $1f, $02, $21, $61        ;; 0c:6116 ????????
    db   $02, $2a, $61, $ab, $e2, $d2, $10, $ab        ;; 0c:611e ????????
    db   $e4, $d2, $3c, $06                            ;; 0c:6126 ????
.data_0c_612a:
    db   $05                                           ;; 0c:612a .
    dw   data_0c_44b8                                  ;; 0c:612b pP
    db   $c1, $00, $0c, $02, $c5, $20, $1f, $02        ;; 0c:612d ...p....
    dw   .data_0c_6143                                 ;; 0c:6135 pP
    db   $0b, $a5, $19, $0b, $a6, $19, $0b, $a7        ;; 0c:6137 ????????
    db   $19, $0b, $a8, $19                            ;; 0c:613f ????
.data_0c_6143:
    db   $05                                           ;; 0c:6143 .
    dw   data_0c_46d8                                  ;; 0c:6144 pP
    db   $c1, $00, $0c, $19, $c5, $07, $1f, $00        ;; 0c:6146 ...p....
    db   $a7, $cc, $00, $1f, $c1, $02, $0c, $19        ;; 0c:614e ?.?....p
    db   $c5, $07, $1f, $00, $a6, $cc, $00, $1f        ;; 0c:6156 ....?.?.
    db   $c1, $04, $0c, $19, $c5, $07, $1f, $00        ;; 0c:615e ...p....
    db   $a5, $cc, $00, $1f, $01, $80, $ce, $00        ;; 0c:6166 ?.?..p..
    db   $1f, $02                                      ;; 0c:616e ..
    dw   .data_0c_6192                                 ;; 0c:6170 pP
    db   $0b, $d8, $00, $0b, $d9, $03                  ;; 0c:6172 ......
.data_0c_6178:
    db   $20, $c8, $0c, $d8, $e3, $a5, $c9, $1f        ;; 0c:6178 ...p....
    db   $61, $c8, $d0, $80, $1f, $02, $c8, $61        ;; 0c:6180 ......??
    db   $07, $d8, $01, $d8, $0f, $d9, $1f, $02        ;; 0c:6188 .p.p.p..
    dw   .data_0c_6178                                 ;; 0c:6190 pP
.data_0c_6192:
    db   $20, $c8, $ec                                 ;; 0c:6192 ...
    dw   $c9a5                                         ;; 0c:6195 pP
    db   $1f, $20, $7b, $2c, $c8, $1f, $00, $78        ;; 0c:6197 ........
    db   $ac, $64, $c3, $01, $1f, $0b, $d8, $00        ;; 0c:619f ........
    db   $0b, $d9, $03                                 ;; 0c:61a7 ...
.data_0c_61aa:
    db   $61, $7b, $0e, $78, $1f, $02                  ;; 0c:61aa ...p..
    dw   .data_0c_61c8                                 ;; 0c:61b0 pP
    db   $00, $78, $0c, $78, $71, $7b, $1f, $07        ;; 0c:61b2 ...p....
    db   $d8, $27, $7b, $01, $d8, $0f, $d9, $1f        ;; 0c:61ba p.p.p.p.
    db   $02                                           ;; 0c:61c2 .
    dw   .data_0c_61aa                                 ;; 0c:61c3 pP
    db   $02                                           ;; 0c:61c5 .
    dw   .data_0c_6192                                 ;; 0c:61c6 pP
.data_0c_61c8:
    db   $01, $d8, $cc, $03, $1f, $02                  ;; 0c:61c8 .p....
    dw   .data_0c_61f2                                 ;; 0c:61ce pP
    db   $01, $d8, $cc, $01, $1f, $02                  ;; 0c:61d0 .p....
    dw   .data_0c_6208                                 ;; 0c:61d6 pP
    db   $01, $d8, $cc, $02, $1f, $02                  ;; 0c:61d8 .p....
    dw   .data_0c_62f6                                 ;; 0c:61de pP
    db   $0b, $9b, $00, $05, $f7, $48, $a0, $36        ;; 0c:61e0 ????????
    db   $cd, $0c, $d6, $1f, $03, $61, $6b, $02        ;; 0c:61e8 ????????
    db   $19, $64                                      ;; 0c:61f0 ??
.data_0c_61f2:
    db   $0b, $9b, $01, $05                            ;; 0c:61f2 ....
    dw   data_0c_48f7                                  ;; 0c:61f6 pP
    db   $05                                           ;; 0c:61f8 .
    dw   data_0c_4587                                  ;; 0c:61f9 pP
    db   $00, $98, $0c, $98, $c6, $20, $1f, $05        ;; 0c:61fb ...p....
    dw   data_0c_4802                                  ;; 0c:6203 pP
    db   $02                                           ;; 0c:6205 .
    dw   .data_0c_6406                                 ;; 0c:6206 pP
.data_0c_6208:
    db   $05                                           ;; 0c:6208 .
    dw   data_0c_4488                                  ;; 0c:6209 pP
    db   $20, $75, $ec                                 ;; 0c:620b ...
    dw   wD83E                                         ;; 0c:620e pP
    db   $1f, $0b, $e1, $00, $0b, $d8, $00, $0b        ;; 0c:6210 ........
    db   $d9, $07                                      ;; 0c:6218 ..
.data_0c_621a:
    db   $20, $78, $2c, $75, $03, $d8, $1f, $c1        ;; 0c:621a .....p..
    db   $6c, $6e, $78, $1f, $07, $e1, $07, $d8        ;; 0c:6222 .....p.p
    db   $01, $d8, $0f, $d9, $1f, $02                  ;; 0c:622a .p.p..
    dw   .data_0c_621a                                 ;; 0c:6230 pP
    db   $c1, $00, $0c, $e1, $1f, $02, $f0, $62        ;; 0c:6232 ...p..??
    db   $0b, $9b, $10, $05                            ;; 0c:623a ....
    dw   data_0c_48f7                                  ;; 0c:623e pP
    db   $c1, $20, $0c, $02, $c5, $20, $1f, $02        ;; 0c:6240 ...p....
    db   $69, $62, $c0, $6b, $d8, $ec, $32, $28        ;; 0c:6248 ??......
    db   $1f, $c0, $6d, $d8, $ec, $1e, $10, $1f        ;; 0c:6250 ........
    db   $c0, $6f, $d8, $ec, $10, $10, $1f, $c0        ;; 0c:6258 ........
    db   $71, $d8, $ec, $10, $10, $1f, $02             ;; 0c:6260 .......
    dw   .data_0c_626c                                 ;; 0c:6267 pP
    db   $03, $d3, $5f                                 ;; 0c:6269 ???
.data_0c_626c:
    db   $20, $c8, $ec                                 ;; 0c:626c ...
    dw   $d86b                                         ;; 0c:626f pP
    db   $1f, $20, $7b, $2c, $c8, $1f, $00, $78        ;; 0c:6271 ........
    db   $ac, $c8, $c3, $01, $1f, $0b, $d8, $00        ;; 0c:6279 ........
    db   $00, $d9, $0c, $e1, $1f, $61, $7b, $0e        ;; 0c:6281 ...p....
    db   $78, $1f, $02                                 ;; 0c:6289 p..
    dw   .data_0c_62a4                                 ;; 0c:628c pP
    db   $00, $78, $0c, $78, $71, $7b, $1f, $07        ;; 0c:628e ...p....
    db   $d8, $27, $7b, $01, $d8, $0d, $d9, $1f        ;; 0c:6296 p.p.p.p.
    db   $02, $86, $62, $02                            ;; 0c:629e .??.
    dw   .data_0c_626c                                 ;; 0c:62a2 pP
.data_0c_62a4:
    db   $20, $85, $2c, $75, $03, $d8, $1f, $00        ;; 0c:62a4 .....p..
    db   $6d, $6c, $85, $1f, $01, $6d, $cc, $45        ;; 0c:62ac .....p..
    db   $1f, $02, $c8, $62, $01, $6d, $cc, $46        ;; 0c:62b4 ..??.p..
    db   $1f, $02, $c8, $62, $01, $6d, $cd, $6c        ;; 0c:62bc ..??.p..
    db   $1f, $02                                      ;; 0c:62c4 ..
    dw   .data_0c_62d5                                 ;; 0c:62c6 pP
    db   $20, $7b, $2c, $c8, $03, $d8, $1f, $6b        ;; 0c:62c8 ????????
    db   $7b, $00, $02, $6c, $62                       ;; 0c:62d0 ?????
.data_0c_62d5:
    db   $00, $9d, $0c, $6d, $1f, $0b, $6d, $ff        ;; 0c:62d5 ...p....
    db   $05                                           ;; 0c:62dd .
    dw   data_0c_490b                                  ;; 0c:62de pP
    db   $ab, $25, $ce, $01, $a0, $26, $ce, $0c        ;; 0c:62e0 ........
    db   $9d, $1f, $03                                 ;; 0c:62e8 p..
    dw   data_0c_6b64                                  ;; 0c:62eb pP
    db   $02                                           ;; 0c:62ed .
    dw   .data_0c_6419                                 ;; 0c:62ee pP
    db   $0b, $a6, $00, $02, $92, $61                  ;; 0c:62f0 ??????
.data_0c_62f6:
    db   $ab, $92, $ce, $00, $ab, $93, $ce, $2f        ;; 0c:62f6 ........
    db   $03                                           ;; 0c:62fe .
    dw   data_0c_49db                                  ;; 0c:62ff pP
    db   $c1, $00, $13                                 ;; 0c:6301 ...
    dw   wD86A                                         ;; 0c:6304 pP
    db   $1f, $02                                      ;; 0c:6306 ..
    dw   .data_0c_63f7                                 ;; 0c:6308 pP
    db   $0b, $9b, $20, $05, $f7, $48, $05, $cb        ;; 0c:630a ????????
    db   $44, $c1, $20, $0c, $02, $c5, $20, $1f        ;; 0c:6312 ????????
    db   $02, $4f, $63, $01, $80, $ce, $00, $1f        ;; 0c:631a ????????
    db   $02, $58, $63, $c1, $80, $0e, $70, $1f        ;; 0c:6322 ????????
    db   $02, $33, $63, $0b, $d8, $00, $02, $8b        ;; 0c:632a ????????
    db   $63, $c1, $80, $0e, $71, $1f, $02, $41        ;; 0c:6332 ????????
    db   $63, $0b, $d8, $01, $02, $96, $63, $c1        ;; 0c:633a ????????
    db   $80, $0e, $72, $1f, $02, $58, $63, $0b        ;; 0c:6342 ????????
    db   $d8, $02, $02, $a1, $63, $0b, $70, $1e        ;; 0c:634a ????????
    db   $20, $71, $ec, $1e, $1e, $1f, $20, $c8        ;; 0c:6352 ????????
    db   $ec, $70, $c9, $1f, $20, $7b, $2c, $c8        ;; 0c:635a ????????
    db   $1f, $00, $78, $ac, $64, $c3, $01, $1f        ;; 0c:6362 ????????
    db   $0b, $d8, $00, $0b, $d9, $02, $61, $7b        ;; 0c:636a ????????
    db   $0e, $78, $1f, $02, $8b, $63, $00, $78        ;; 0c:6372 ????????
    db   $0c, $78, $71, $7b, $1f, $07, $d8, $27        ;; 0c:637a ????????
    db   $7b, $01, $d8, $0f, $d9, $1f, $02, $70        ;; 0c:6382 ????????
    db   $63, $ab, $92, $ce, $1c, $ab, $93, $ce        ;; 0c:638a ????????
    db   $2f, $02, $a9, $63, $ab, $92, $ce, $08        ;; 0c:6392 ????????
    db   $ab, $93, $ce, $12, $02, $a9, $63, $ab        ;; 0c:639a ????????
    db   $92, $ce, $05, $ab, $93, $ce, $07, $03        ;; 0c:63a2 ????????
    db   $db, $49, $c1, $00, $13, $6a, $d8, $1f        ;; 0c:63aa ????????
    db   $02, $f7, $63, $02, $b8, $63, $05, $df        ;; 0c:63b2 ????????
    db   $68, $05, $06, $46, $05, $33, $53, $21        ;; 0c:63ba ????????
    db   $28, $0d, $7f, $1f, $02, $f7, $63, $ab        ;; 0c:63c2 ????????
    db   $25, $ce, $00, $a0, $26, $ce, $0c, $6d        ;; 0c:63ca ????????
    db   $1f, $ab, $27, $ce, $00, $03, $64, $6b        ;; 0c:63d2 ????????
    db   $c1, $08, $13, $28, $ce, $1f, $02, $e6        ;; 0c:63da ????????
    db   $63, $02, $19, $64, $0b, $f3, $00, $00        ;; 0c:63e2 ????????
    db   $7f, $0c, $d6, $1f, $05, $5a, $65, $05        ;; 0c:63ea ????????
    db   $40, $52, $02, $76, $64                       ;; 0c:63f2 ?????
.data_0c_63f7:
    db   $0b, $a7, $00, $02                            ;; 0c:63f7 ....
    dw   .data_0c_6192                                 ;; 0c:63fb pP
    db   $0b, $9b, $ff, $05, $f7, $48, $02, $0e        ;; 0c:63fd ????????
    db   $64                                           ;; 0c:6405 ?
.data_0c_6406:
    db   $c1, $20, $0c, $02, $c5, $20, $1f, $06        ;; 0c:6406 ...p....
    db   $07, $d1, $01, $d1, $0d, $d2, $1f, $02        ;; 0c:640e .p.p.p..
    dw   .data_0c_60c8                                 ;; 0c:6416 pP
    db   $06                                           ;; 0c:6418 .
.data_0c_6419:
    db   $c1, $00, $13                                 ;; 0c:6419 ...
    dw   wCE28                                         ;; 0c:641c pP
    db   $c5, $04, $1f, $02                            ;; 0c:641e ....
    dw   .data_0c_643a                                 ;; 0c:6422 pP
    db   $c1, $20, $0c, $02, $c5, $20, $1f, $02        ;; 0c:6424 ????????
    db   $34, $64, $05, $8a, $64, $02, $76, $64        ;; 0c:642c ????????
    db   $05, $9b, $64, $02, $76, $64                  ;; 0c:6434 ??????
.data_0c_643a:
    db   $a1, $64, $cf, $1e, $1f, $02                  ;; 0c:643a ......
    dw   .data_0c_6463                                 ;; 0c:6440 pP
    db   $c1, $00, $13                                 ;; 0c:6442 ...
    dw   wCE28                                         ;; 0c:6445 pP
    db   $c5, $02, $1f, $02                            ;; 0c:6447 ....
    dw   .data_0c_6463                                 ;; 0c:644b pP
    db   $c1, $20, $0c, $02, $c5, $20, $1f, $02        ;; 0c:644d ????????
    db   $5d, $64, $05, $a4, $64, $02, $76, $64        ;; 0c:6455 ????????
    db   $05, $ec, $64, $02, $76, $64                  ;; 0c:645d ??????
.data_0c_6463:
    db   $c1, $20, $0c, $02, $c5, $20, $1f, $02        ;; 0c:6463 ...p....
    db   $73, $64, $05                                 ;; 0c:646b ??.
    dw   .data_0c_64f5                                 ;; 0c:646e pP
    db   $02                                           ;; 0c:6470 .
    dw   .data_0c_6476                                 ;; 0c:6471 pP
    db   $05, $a5, $65                                 ;; 0c:6473 ???
.data_0c_6476:
    db   $00, $f2, $0c, $f3, $cb, $04, $03, $f4        ;; 0c:6476 ...p...p
    db   $1f, $00, $9c, $0c, $f2, $1f, $05             ;; 0c:647e ....p..
    dw   data_0c_4901                                  ;; 0c:6485 pP
    db   $02                                           ;; 0c:6487 .
    dw   .data_0c_6406                                 ;; 0c:6488 pP
    db   $0b, $f3, $08, $0b, $f4, $00, $01, $d6        ;; 0c:648a ????????
    db   $cd, $05, $1f, $00, $f4, $cc, $01, $1f        ;; 0c:6492 ????????
    db   $06, $0b, $f3, $08, $00, $f4, $ac, $02        ;; 0c:649a ????????
    db   $1f, $06, $0b, $f3, $04, $01, $d6, $cd        ;; 0c:64a2 ????????
    db   $05, $1f, $02, $b3, $64, $0b, $f4, $00        ;; 0c:64aa ????????
    db   $06, $03, $5f, $44, $00, $7d, $13, $7b        ;; 0c:64b2 ????????
    db   $d8, $1f, $00, $7e, $13, $7c, $d8, $1f        ;; 0c:64ba ????????
    db   $00, $7f, $13, $7d, $d8, $1f, $01, $7d        ;; 0c:64c2 ????????
    db   $10, $7e, $1f, $02, $e0, $64, $01, $7e        ;; 0c:64ca ????????
    db   $0f, $7f, $1f, $02, $dc, $64, $0b, $f4        ;; 0c:64d2 ????????
    db   $02, $06, $0b, $f4, $03, $06, $01, $7d        ;; 0c:64da ????????
    db   $0f, $7f, $1f, $02, $dc, $64, $0b, $f4        ;; 0c:64e2 ????????
    db   $01, $06, $0b, $f3, $04, $00, $f4, $ac        ;; 0c:64ea ????????
    db   $04, $1f, $06                                 ;; 0c:64f2 ???
.data_0c_64f5:
    db   $0b, $f3, $00, $00, $7f, $0c, $d6, $1f        ;; 0c:64f5 ......p.
    db   $01, $7f, $cd, $05, $1f, $02, $0b, $65        ;; 0c:64fd .p....??
    db   $05                                           ;; 0c:6505 .
    dw   .data_0c_655a                                 ;; 0c:6506 pP
    db   $02                                           ;; 0c:6508 .
    dw   .data_0c_6557                                 ;; 0c:6509 pP
    db   $03, $5d, $60, $20, $d6, $33, $8f, $ce        ;; 0c:650b ????????
    db   $1f, $cc, $c1, $ff, $0c, $05, $1f, $02        ;; 0c:6513 ????????
    db   $40, $65, $ac, $c1, $00, $0d, $01, $c5        ;; 0c:651b ????????
    db   $c0, $1f, $02, $40, $65, $05, $de, $45        ;; 0c:6523 ????????
    db   $c1, $00, $2c, $20, $1f, $02, $40, $65        ;; 0c:652b ????????
    db   $20, $75, $2c, $20, $1f, $00, $f4, $0c        ;; 0c:6533 ????????
    db   $d6, $1f, $02, $4a, $65, $07, $d6, $01        ;; 0c:653b ????????
    db   $d6, $0f, $d7, $1f, $02, $14, $65, $05        ;; 0c:6543 ????????
    db   $76, $65, $07, $d6, $01, $d6, $0f, $d7        ;; 0c:654b ????????
    db   $1f, $02, $4a, $65                            ;; 0c:6553 ????
.data_0c_6557:
    db   $02                                           ;; 0c:6557 .
    dw   data_0c_5240                                  ;; 0c:6558 pP
.data_0c_655a:
    db   $00, $f4, $13                                 ;; 0c:655a ...
    dw   wDDFF                                         ;; 0c:655d pP
    db   $1f, $00, $f4, $12, $f4, $1f, $00, $d6        ;; 0c:655f ....p...
    db   $0c, $f4, $1f, $ac, $c1, $00, $0d, $01        ;; 0c:6567 .p.....p
    db   $c5, $c0, $1f, $02, $5a, $65, $06, $cc        ;; 0c:656f ....??.?
    db   $c1, $ff, $0c, $05, $1f, $06, $ac, $c1        ;; 0c:6577 ????????
    db   $00, $0d, $01, $c5, $c0, $1f, $06, $05        ;; 0c:657f ????????
    db   $de, $45, $c1, $00, $2c, $20, $1f, $06        ;; 0c:6587 ????????
    db   $20, $78, $2c, $20, $1f, $21, $75, $2f        ;; 0c:658f ????????
    db   $78, $1f, $06, $20, $75, $2c, $78, $1f        ;; 0c:6597 ????????
    db   $00, $f4, $0c, $d6, $1f, $06, $0b, $f3        ;; 0c:659f ????????
    db   $00, $00, $f4, $ac, $0d, $1f, $06, $0b        ;; 0c:65a7 ????????
    db   $7e, $0c, $0b, $85, $80, $c1, $00, $0d        ;; 0c:65af ????????
    db   $7d, $05, $85, $1f, $06, $00, $85, $0c        ;; 0c:65b7 ????????
    db   $85, $ca, $01, $1f, $08, $7e, $01, $7e        ;; 0c:65bf ????????
    db   $cc, $05, $1f, $06, $02, $b4, $65, $06        ;; 0c:65c7 ????????

data_0c_65cf:
    db   $40, $ea, $4c, $9b, $1f, $05                  ;; 0c:65cf ......
    dw   data_0c_46d8                                  ;; 0c:65d5 pP
    db   $c1, $02, $0c, $19, $c5, $07, $1f, $02        ;; 0c:65d7 ...p....
    db   $ef, $65, $00, $fb, $0c, $19, $c5, $01        ;; 0c:65df ??...p..
    db   $c1, $0a, $c3, $32, $1f, $02                  ;; 0c:65e7 ......
    dw   .data_0c_6600                                 ;; 0c:65ed pP
    db   $20, $85, $0c, $19, $c5, $78, $ca, $03        ;; 0c:65ef ????????
    db   $e3, $15, $68, $1f, $00, $fb, $6c, $85        ;; 0c:65f7 ????????
    db   $1f                                           ;; 0c:65ff ?
.data_0c_6600:
    db   $20, $7b, $ec, $fe, $e0, $1f, $05             ;; 0c:6600 .......
    dw   .data_0c_686b                                 ;; 0c:6607 pP
    db   $c1, $00, $13                                 ;; 0c:6609 ...
    dw   $d878                                         ;; 0c:660c pP
    db   $1f, $06, $01, $fb, $ad, $64, $1f, $06        ;; 0c:660e ...p....
    db   $01, $d6, $cd, $04, $1f, $02, $27, $66        ;; 0c:6616 .p....??
    db   $0b, $fd, $02, $0b, $fe, $09, $02             ;; 0c:661e ..w....
    dw   .data_0c_662d                                 ;; 0c:6625 pP
    db   $0b, $fd, $00, $0b, $fe, $09                  ;; 0c:6627 ??????
.data_0c_662d:
    db   $03                                           ;; 0c:662d .
    dw   .data_0c_6851                                 ;; 0c:662e pP
    db   $05                                           ;; 0c:6630 .
    dw   .data_0c_686b                                 ;; 0c:6631 pP
    db   $c1, $00, $13                                 ;; 0c:6633 ...
    dw   $d878                                         ;; 0c:6636 pP
    db   $1f, $02                                      ;; 0c:6638 ..
    dw   .data_0c_6779                                 ;; 0c:663a pP
    db   $c1, $01, $13                                 ;; 0c:663c ...
    dw   $d878                                         ;; 0c:663f pP
    db   $1f, $02                                      ;; 0c:6641 ..
    dw   .data_0c_666c                                 ;; 0c:6643 pP
    db   $01, $fd, $cc, $01, $1f, $02, $6c, $66        ;; 0c:6645 .p....??
    db   $01, $fd, $cc, $03, $1f, $02, $6c, $66        ;; 0c:664d .p....??
    db   $01, $fd, $cc, $09, $1f, $02, $6c, $66        ;; 0c:6655 .p....??
    db   $03                                           ;; 0c:665d .
    dw   data_0c_49db                                  ;; 0c:665e pP
    db   $c1, $00, $13                                 ;; 0c:6660 ...
    dw   wD86A                                         ;; 0c:6663 pP
    db   $1f, $02                                      ;; 0c:6665 ..
    dw   .data_0c_666c                                 ;; 0c:6667 pP
    db   $02, $4b, $67                                 ;; 0c:6669 ???
.data_0c_666c:
    db   $01, $fd, $cc, $00, $1f, $02, $c0, $66        ;; 0c:666c .p....??
    db   $01, $fd, $cc, $07, $1f, $02, $c0, $66        ;; 0c:6674 .p....??
    db   $01, $d6, $ce, $04, $1f, $02                  ;; 0c:667c .p....
    dw   .data_0c_66c0                                 ;; 0c:6682 pP
    db   $03, $2b, $6b, $01, $fd, $cc, $05, $1f        ;; 0c:6684 ????????
    db   $02, $92, $66, $02, $9b, $66, $c1, $ff        ;; 0c:668c ????????
    db   $13, $91, $ce, $1f, $02, $b0, $66, $c1        ;; 0c:6694 ????????
    db   $ff, $13, $91, $ce, $1f, $02, $c0, $66        ;; 0c:669c ????????
    db   $05, $00, $69, $00, $7b, $13, $79, $d8        ;; 0c:66a4 ????????
    db   $1f, $02, $80, $69, $07, $ff, $a0, $91        ;; 0c:66ac ????????
    db   $ce, $0c, $ff, $1f, $01, $ff, $cf, $c2        ;; 0c:66b4 ????????
    db   $1f, $02, $6c, $66                            ;; 0c:66bc ????
.data_0c_66c0:
    db   $c1, $00, $0c, $19, $c5, $07, $1f, $02        ;; 0c:66c0 ...p....
    db   $79, $67, $01, $fd, $cc, $01, $1f, $02        ;; 0c:66c8 ??.p....
    db   $f9, $66, $01, $fd, $cc, $03, $1f, $02        ;; 0c:66d0 ??.p....
    db   $f9, $66, $01, $fd, $cc, $09, $1f, $02        ;; 0c:66d8 ??.p....
    db   $f9, $66, $01, $fd, $cc, $05, $1f, $05        ;; 0c:66e0 ??.p....
    dw   .data_0c_6742                                 ;; 0c:66e8 pP
    db   $03                                           ;; 0c:66ea .
    dw   data_0c_49db                                  ;; 0c:66eb pP
    db   $c1, $00, $13                                 ;; 0c:66ed ...
    dw   wD86A                                         ;; 0c:66f0 pP
    db   $1f, $02                                      ;; 0c:66f2 ..
    dw   .data_0c_66f9                                 ;; 0c:66f4 pP
    db   $02, $62, $67                                 ;; 0c:66f6 ???
.data_0c_66f9:
    db   $01, $fd, $cd, $04, $1f, $02, $0c, $67        ;; 0c:66f9 .p....??
    db   $01, $fd, $cc, $09, $1f, $02, $0c, $67        ;; 0c:6701 .p....??
    db   $02                                           ;; 0c:6709 .
    dw   .data_0c_6779                                 ;; 0c:670a pP
    db   $01, $fd, $cc, $00, $1f, $02, $79, $67        ;; 0c:670c ????????
    db   $ab, $92, $ce, $12, $ab, $93, $ce, $12        ;; 0c:6714 ????????
    db   $03, $db, $49, $c1, $00, $13, $6a, $d8        ;; 0c:671c ????????
    db   $1f, $02, $2b, $67, $02, $62, $67, $ab        ;; 0c:6724 ????????
    db   $92, $ce, $04, $ab, $93, $ce, $04, $03        ;; 0c:672c ????????
    db   $db, $49, $c1, $00, $13, $6a, $d8, $1f        ;; 0c:6734 ????????
    db   $02, $79, $67, $02, $62, $67                  ;; 0c:673c ??????
.data_0c_6742:
    db   $ab, $92, $ce, $17, $ab, $93, $ce, $19        ;; 0c:6742 ........
    db   $06, $05, $d9, $68, $05, $33, $53, $21        ;; 0c:674a .???????
    db   $28, $0d, $7f, $1f, $02, $07, $68, $00        ;; 0c:6752 ????????
    db   $7b, $13, $79, $d8, $1f, $02, $cc, $69        ;; 0c:675a ????????
    db   $05, $d9, $68, $05, $33, $53, $21, $28        ;; 0c:6762 ????????
    db   $0d, $7f, $1f, $02, $07, $68, $00, $7b        ;; 0c:676a ????????
    db   $13, $79, $d8, $1f, $02, $80, $69             ;; 0c:6772 ???????
.data_0c_6779:
    db   $07, $fd, $01, $fd, $0f, $fe, $1f, $02        ;; 0c:6779 .p.p.p..
    dw   .data_0c_662d                                 ;; 0c:6781 pP
    db   $01, $d6, $ce, $04, $1f, $02                  ;; 0c:6783 .p....
    dw   .data_0c_6807                                 ;; 0c:6789 pP
    db   $c1, $32, $ad, $64, $1f, $02, $07, $68        ;; 0c:678b ????????
    db   $20, $7b, $ec, $02, $00, $1f, $05, $6b        ;; 0c:6793 ????????
    db   $68, $c1, $00, $13, $78, $d8, $1f, $02        ;; 0c:679b ????????
    db   $07, $68, $05, $15, $69, $01, $d6, $0c        ;; 0c:67a3 ????????
    db   $f4, $1f, $02, $ea, $67, $00, $7f, $0c        ;; 0c:67ab ????????
    db   $d6, $1f, $00, $d6, $0c, $f4, $1f, $05        ;; 0c:67b3 ????????
    db   $87, $45, $c1, $00, $0d, $98, $c5, $10        ;; 0c:67bb ????????
    db   $1f, $02, $04, $68, $05, $87, $45, $00        ;; 0c:67c3 ????????
    db   $98, $0c, $98, $c5, $f0, $c6, $10, $03        ;; 0c:67cb ????????
    db   $7f, $1f, $05, $02, $48, $05, $40, $52        ;; 0c:67d3 ????????
    db   $0b, $9b, $11, $05, $f7, $48, $00, $9c        ;; 0c:67db ????????
    db   $0c, $f4, $1f, $05, $01, $49, $06, $0b        ;; 0c:67e3 ????????
    db   $9b, $01, $05, $f7, $48, $05, $87, $45        ;; 0c:67eb ????????
    db   $05, $87, $45, $00, $98, $0c, $98, $c6        ;; 0c:67f3 ????????
    db   $20, $1f, $05, $02, $48, $06, $02, $40        ;; 0c:67fb ????????
    db   $52, $05, $40, $52                            ;; 0c:6803 ????
.data_0c_6807:
    db   $40, $9b, $4c, $ea, $1f, $05                  ;; 0c:6807 ......
    dw   data_0c_48f7                                  ;; 0c:680d pP
    db   $05                                           ;; 0c:680f .
    dw   data_0c_4901                                  ;; 0c:6810 pP
    db   $02                                           ;; 0c:6812 .
    dw   data_0c_490b                                  ;; 0c:6813 pP
    db   $35, $3c, $2f, $2f, $28, $43, $35, $43        ;; 0c:6815 ????????
    db   $3c, $2f                                      ;; 0c:681d ??
.data_0c_681f:
    db   $80, $00, $ff, $14, $16, $40, $00, $c3        ;; 0c:681f ????????
    db   $00, $00, $00, $80, $c7, $10, $10, $00        ;; 0c:6827 ??......
    db   $40, $c8, $00, $00, $08, $00, $c6, $0e        ;; 0c:682f ........
    db   $0e, $02, $00, $c0, $1a, $1b, $00, $20        ;; 0c:6837 ........
    db   $c9, $0d, $0d, $04, $00, $ff, $03, $03        ;; 0c:683f ........
    db   $10, $00, $c5, $0c, $0c, $20, $00, $c4        ;; 0c:6847 ........
    db   $00, $00                                      ;; 0c:684f ..
.data_0c_6851:
    ld   A, [wC9FD]                                    ;; 0c:6851 $fa $fd $c9
    ld   HL, .data_0c_681f                             ;; 0c:6854 $21 $1f $68
    rst  add_hl_a                                      ;; 0c:6857 $c7
    add  A, A                                          ;; 0c:6858 $87
    add  A, A                                          ;; 0c:6859 $87
    rst  add_hl_a                                      ;; 0c:685a $c7
    ld   DE, wC97B                                     ;; 0c:685b $11 $7b $c9
    call call_00_1f90                                  ;; 0c:685e $cd $90 $1f
    ld   A, [HL]                                       ;; 0c:6861 $7e
    ld   [wC9FF], A                                    ;; 0c:6862 $ea $ff $c9
    ld   DE, wCE91                                     ;; 0c:6865 $11 $91 $ce
    jp   call_00_1f8d                                  ;; 0c:6868 $c3 $8d $1f
.data_0c_686b:
    db   $00, $7f, $0c, $d6, $1f, $ab, $78, $d8        ;; 0c:686b ...p....
    db   $00, $ab, $79, $d8, $00, $01, $d6, $ce        ;; 0c:6873 ......p.
    db   $04, $1f, $02                                 ;; 0c:687b ...
    dw   .data_0c_6886                                 ;; 0c:687e pP
    db   $05, $ba, $5f, $02, $89, $68                  ;; 0c:6880 ??????
.data_0c_6886:
    db   $05                                           ;; 0c:6886 .
    dw   data_0c_5fc1                                  ;; 0c:6887 pP
.data_0c_6889:
    db   $cc, $01, $05, $cc, $ff, $1f, $02             ;; 0c:6889 ..p....
    dw   .data_0c_68b1                                 ;; 0c:6890 pP
    db   $05                                           ;; 0c:6892 .
    dw   data_0c_469c                                  ;; 0c:6893 pP
    db   $c1, $00, $2c, $01, $25, $7b, $1f, $02        ;; 0c:6895 ........
    dw   .data_0c_68b1                                 ;; 0c:689d pP
    db   $a0, $78, $d8, $13                            ;; 0c:689f ....
    dw   $d878                                         ;; 0c:68a3 pP
    db   $c3, $01, $1f, $20, $c8, $ec                  ;; 0c:68a5 ......
    dw   $d879                                         ;; 0c:68ab pP
    db   $1f, $05                                      ;; 0c:68ad ..
    dw   .data_0c_68be                                 ;; 0c:68af pP
.data_0c_68b1:
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:68b1 .p.p.p..
    dw   .data_0c_6889                                 ;; 0c:68b9 pP
    db   $02                                           ;; 0c:68bb .
    dw   data_0c_5240                                  ;; 0c:68bc pP
.data_0c_68be:
    db   $00, $85, $0c, $d6, $1f, $01, $d6, $d0        ;; 0c:68be ...p..p.
    db   $05, $1f, $00, $85, $0c, $d6, $c4, $05        ;; 0c:68c6 .....p..
    db   $1f, $60, $c8, $cc, $01, $0b, $85, $66        ;; 0c:68ce ......p.
    db   $c8, $1f, $06, $0b, $9b, $20, $05, $f7        ;; 0c:68d6 ...?????
    db   $48, $00, $7d, $13, $6a, $d8, $1f, $00        ;; 0c:68de ????????
    db   $7e, $12, $7d, $1f, $20, $c8, $0c, $7e        ;; 0c:68e6 ????????
    db   $e3, $46, $d8, $1f, $00, $6d, $6c, $c8        ;; 0c:68ee ????????
    db   $1f, $00, $9d, $0c, $6d, $1f, $05, $0b        ;; 0c:68f6 ????????
    db   $49, $06, $0b, $9b, $30, $05, $f7, $48        ;; 0c:68fe ????????
    db   $00, $6d, $13, $91, $ce, $1f, $00, $9d        ;; 0c:6906 ????????
    db   $0c, $6d, $1f, $05, $0b, $49, $06, $0b        ;; 0c:690e ????????
    db   $f3, $00, $00, $7f, $0c, $d6, $1f, $05        ;; 0c:6916 ????????
    db   $ba, $5f, $cc, $c1, $ff, $0c, $05, $1f        ;; 0c:691e ????????
    db   $02, $4c, $69, $ac, $c1, $00, $0d, $01        ;; 0c:6926 ????????
    db   $e6, $c0, $1f, $02, $4c, $69, $05, $de        ;; 0c:692e ????????
    db   $45, $c1, $00, $2c, $20, $1f, $02, $4c        ;; 0c:6936 ????????
    db   $69, $20, $75, $2c, $20, $1f, $00, $f4        ;; 0c:693e ????????
    db   $0c, $d6, $1f, $02, $56, $69, $07, $d6        ;; 0c:6946 ????????
    db   $01, $d6, $0f, $d7, $1f, $02, $20, $69        ;; 0c:694e ????????
    db   $05, $76, $65, $07, $d6, $01, $d6, $0f        ;; 0c:6956 ????????
    db   $d7, $1f, $02, $56, $69, $05, $40, $52        ;; 0c:695e ????????
    db   $01, $d6, $ce, $04, $1f, $00, $f4, $0c        ;; 0c:6966 ????????
    db   $f4, $c3, $05, $1f, $00, $f2, $0c, $f4        ;; 0c:696e ????????
    db   $1f, $00, $9c, $0c, $f2, $1f, $05, $01        ;; 0c:6976 ????????
    db   $49, $06, $01, $d6, $ce, $04, $1f, $02        ;; 0c:697e ????????
    db   $91, $69, $0b, $d8, $00, $0b, $d9, $04        ;; 0c:6986 ????????
    db   $02, $97, $69, $0b, $d8, $00, $0b, $d9        ;; 0c:698e ????????
    db   $07, $00, $7f, $cc, $01, $0b, $d8, $1f        ;; 0c:6996 ????????
    db   $c1, $00, $0d, $7b, $05, $7f, $1f, $02        ;; 0c:699e ????????
    db   $b2, $69, $07, $d8, $01, $d8, $0f, $d9        ;; 0c:69a6 ????????
    db   $1f, $02, $97, $69, $01, $d6, $ce, $04        ;; 0c:69ae ????????
    db   $1f, $00, $d8, $0c, $d8, $c3, $05, $1f        ;; 0c:69b6 ????????
    db   $00, $f2, $0c, $d8, $1f, $00, $9c, $0c        ;; 0c:69be ????????
    db   $f2, $1f, $05, $01, $49, $06, $ab, $25        ;; 0c:69c6 ????????
    db   $ce, $00, $a0, $26, $ce, $0c, $9d, $1f        ;; 0c:69ce ????????
    db   $ab, $27, $ce, $00, $03, $64, $6b, $c1        ;; 0c:69d6 ????????
    db   $00, $13, $28, $ce, $c5, $10, $1f, $02        ;; 0c:69de ????????
    db   $80, $69, $01, $d6, $ce, $04, $1f, $02        ;; 0c:69e6 ????????
    db   $f6, $69, $0b, $f4, $00, $02, $22, $6a        ;; 0c:69ee ????????
    db   $20, $75, $ec, $5e, $cc, $1f, $0b, $d8        ;; 0c:69f6 ????????
    db   $00, $0b, $d9, $02, $00, $78, $0c, $75        ;; 0c:69fe ????????
    db   $03, $d8, $1f, $00, $7f, $6c, $78, $1f        ;; 0c:6a06 ????????
    db   $c1, $00, $0d, $7b, $05, $7f, $1f, $02        ;; 0c:6a0e ????????
    db   $b2, $69, $07, $d8, $01, $d8, $0f, $d9        ;; 0c:6a16 ????????
    db   $1f, $02, $97, $69, $01, $d6, $ce, $04        ;; 0c:6a1e ????????
    db   $1f, $07, $f4, $00, $f2, $0c, $f4, $c6        ;; 0c:6a26 ????????
    db   $40, $1f, $00, $9c, $0c, $f2, $1f, $05        ;; 0c:6a2e ????????
    db   $01, $49, $06                                 ;; 0c:6a36 ???

data_0c_6a39:
    db   $c1, $00, $0c, $af, $c5, $c0, $1f, $02        ;; 0c:6a39 ...p....
    dw   .data_0c_6a53                                 ;; 0c:6a41 pP
    db   $c1, $04, $0d, $9c, $c5, $0f, $1f, $02        ;; 0c:6a43 ????????
    db   $53, $6a, $c1, $04, $10, $d6, $1f, $06        ;; 0c:6a4b ????????
.data_0c_6a53:
    db   $05                                           ;; 0c:6a53 .
    dw   data_0c_44ed                                  ;; 0c:6a54 pP
    db   $00, $7f, $0c, $d6, $1f, $c1, $80, $0c        ;; 0c:6a56 ...p....
    db   $9c, $c5, $80, $1f, $02, $ce, $6a, $c1        ;; 0c:6a5e p....??.
    db   $40, $0c, $9c, $c5, $40, $1f, $02, $e0        ;; 0c:6a66 ..p....?
    db   $6a, $00, $d6, $0c, $9c, $c5, $0f, $1f        ;; 0c:6a6e ?...p...
    db   $cc, $c1, $ff, $0c, $05, $1f, $02, $8a        ;; 0c:6a76 ....p..?
    db   $6a, $ac, $c1, $00, $0c, $01, $c5, $c0        ;; 0c:6a7e ?....p..
    db   $1f, $02                                      ;; 0c:6a86 ..
    dw   .data_0c_6ace                                 ;; 0c:6a88 pP
    db   $c1, $04, $0d, $9c, $c5, $0f, $1f, $02        ;; 0c:6a8a ...p....
    dw   .data_0c_6aa7                                 ;; 0c:6a92 pP
    db   $03, $2b, $60, $00, $d6, $0c, $d8, $1f        ;; 0c:6a94 ????????
    db   $00, $d7, $13, $ff, $dd, $c4, $01, $1f        ;; 0c:6a9c ????????
    db   $02, $b0, $6a                                 ;; 0c:6aa4 ???
.data_0c_6aa7:
    db   $03                                           ;; 0c:6aa7 .
    dw   data_0c_605d                                  ;; 0c:6aa8 pP
    db   $20, $d6, $33, $8f, $ce, $1f, $cc, $01        ;; 0c:6aaa ........
    db   $05, $cc, $ff, $1f, $02, $c4, $6a, $ac        ;; 0c:6ab2 p....??.
    db   $c1, $00, $0c, $01, $c5, $c0, $1f, $02        ;; 0c:6aba ...p....
    dw   .data_0c_6ad1                                 ;; 0c:6ac2 pP
    db   $07, $d6, $01, $d6, $0f, $d7, $1f, $02        ;; 0c:6ac4 ????????
    db   $b0, $6a                                      ;; 0c:6acc ??
.data_0c_6ace:
    db   $02                                           ;; 0c:6ace .
    dw   data_0c_5240                                  ;; 0c:6acf pP
.data_0c_6ad1:
    db   $00, $9c, $0c, $9c, $c5, $f0, $03, $d6        ;; 0c:6ad1 ...p...p
    db   $1f, $05                                      ;; 0c:6ad9 ..
    dw   data_0c_5240                                  ;; 0c:6adb pP
    db   $02                                           ;; 0c:6add .
    dw   data_0c_4901                                  ;; 0c:6ade pP
    db   $00, $d6, $0c, $9c, $c5, $03, $1f, $c1        ;; 0c:6ae0 ????????
    db   $00, $0c, $9c, $c5, $03, $1f, $02, $ce        ;; 0c:6ae8 ????????
    db   $6a, $20, $c4, $ec, $5d, $cc, $03, $d6        ;; 0c:6af0 ????????
    db   $1f, $c1, $00, $6d, $c4, $1f, $02, $ce        ;; 0c:6af8 ????????
    db   $6a, $0b, $d6, $01, $0b, $d7, $03, $20        ;; 0c:6b00 ????????
    db   $c4, $ec, $5d, $cc, $03, $d6, $1f, $c1        ;; 0c:6b08 ????????
    db   $00, $6c, $c4, $1f, $02, $1a, $6b, $02        ;; 0c:6b10 ????????
    db   $d1, $6a, $07, $d6, $01, $d6, $0f, $d7        ;; 0c:6b18 ????????
    db   $1f, $02, $07, $6b, $06, $df, $1f, $c9        ;; 0c:6b20 ????????
    db   $df, $28, $c9, $fa, $d6, $c9, $fe, $05        ;; 0c:6b28 ????????
    db   $38, $06, $3e, $ff, $ea, $91, $ce, $c9        ;; 0c:6b30 ????????
    db   $df, $0e, $c9, $df, $0f, $c9, $df, $19        ;; 0c:6b38 ????????
    db   $c9                                           ;; 0c:6b40 ?

data_0c_6b41:
    rst  rst_00_0018                                   ;; 0c:6b41 $df
    db   $1a                                           ;; 0c:6b42 .
    ret                                                ;; 0c:6b43 $c9
    db   $df, $1b, $df, $88, $c9                       ;; 0c:6b44 ?????

data_0c_6b49:
    rst  rst_00_0018                                   ;; 0c:6b49 $df
    db   $5d                                           ;; 0c:6b4a .
    ret                                                ;; 0c:6b4b $c9
    db   $df, $5e, $c9, $df, $aa, $c9, $df, $bb        ;; 0c:6b4c ????????
    db   $c9, $df, $bc, $c9, $fa, $7a, $d8, $df        ;; 0c:6b54 ????????
    db   $5b, $ea, $7a, $d8, $c9, $df, $2b, $c9        ;; 0c:6b5c ????????

data_0c_6b64:
    rst  rst_00_0018                                   ;; 0c:6b64 $df
    db   $2a                                           ;; 0c:6b65 .
    ret                                                ;; 0c:6b66 $c9
    db   $c9                                           ;; 0c:6b67 ?

data_0c_6b68:
    ld   A, $11                                        ;; 0c:6b68 $3e $11
    jr   jp_0c_6b6e                                    ;; 0c:6b6a $18 $02

data_0c_6b6c:
    ld   A, $10                                        ;; 0c:6b6c $3e $10

jp_0c_6b6e:
    ld   [wDE00], A                                    ;; 0c:6b6e $ea $00 $de

data_0c_6b71:
    ld   A, $94                                        ;; 0c:6b71 $3e $94
    ld   [wC0B3], A                                    ;; 0c:6b73 $ea $b3 $c0
    ld   A, $43                                        ;; 0c:6b76 $3e $43
    ld   [wC0B4], A                                    ;; 0c:6b78 $ea $b4 $c0
    ld   A, $02                                        ;; 0c:6b7b $3e $02
    rst  rst_00_0030                                   ;; 0c:6b7d $f7
    ret                                                ;; 0c:6b7e $c9

data_0c_6b7f:
    ld   A, $00                                        ;; 0c:6b7f $3e $00
    ld   [wC0B3], A                                    ;; 0c:6b81 $ea $b3 $c0
    ld   A, $40                                        ;; 0c:6b84 $3e $40
    ld   [wC0B4], A                                    ;; 0c:6b86 $ea $b4 $c0
    ld   A, $02                                        ;; 0c:6b89 $3e $02
    rst  rst_00_0030                                   ;; 0c:6b8b $f7
    ret                                                ;; 0c:6b8c $c9

data_0c_6b8d:
    db   $a0, $bc, $ff, $0c, $be, $1f, $06, $0b        ;; 0c:6b8d ....p..?
    db   $bf, $39, $0d, $05, $35, $73, $05, $2c        ;; 0c:6b95 ????????
    db   $74, $01, $68, $0d, $69, $1f, $2d, $6c        ;; 0c:6b9d ????????
    db   $20, $c0, $0c, $30, $cb, $01, $1f, $c1        ;; 0c:6ba5 ????????
    db   $03, $0c, $19, $c5, $07, $1f, $05, $44        ;; 0c:6bad ????????
    db   $7d, $0b, $bd, $96, $0b, $be, $07, $4c        ;; 0c:6bb5 ????????
    db   $0b, $ad, $01, $2c, $02, $b6, $75, $05        ;; 0c:6bbd ????????
    db   $5e, $7d, $01, $68, $0d, $69, $1f, $2d        ;; 0c:6bc5 ????????
    db   $6c, $05, $f4, $76, $c1, $03, $0c, $19        ;; 0c:6bcd ????????
    db   $c5, $07, $1f, $05, $4c, $7d, $02, $bc        ;; 0c:6bd5 ????????
    db   $6b                                           ;; 0c:6bdd ?

data_0c_6bde:
    db   $8c, $01, $68, $0d, $69, $1f, $2d, $6c        ;; 0c:6bde ..p.p...
    db   $05                                           ;; 0c:6be6 .
    dw   data_0c_76fe                                  ;; 0c:6be7 pP
    db   $05                                           ;; 0c:6be9 .
    dw   data_0c_7e26                                  ;; 0c:6bea pP
    db   $01, $9d, $cc, $1d, $1f, $02, $f7, $6b        ;; 0c:6bec .p....??
    db   $02                                           ;; 0c:6bf4 .
    dw   .data_0c_6bff                                 ;; 0c:6bf5 pP
    db   $01, $d8, $0e, $85, $1f, $02, $00, $6c        ;; 0c:6bf7 ????????
.data_0c_6bff:
    db   $4c, $2c, $05                                 ;; 0c:6bff ...
    dw   data_0c_75b6                                  ;; 0c:6c02 pP
    db   $01, $9d, $cf, $1a, $1f, $06, $01, $9d        ;; 0c:6c04 .p....??
    db   $d0, $21, $1f, $06, $05, $2d, $7e, $01        ;; 0c:6c0c ????????
    db   $68, $0d, $69, $1f, $06, $01, $9d, $cc        ;; 0c:6c14 ????????
    db   $1e, $1f, $02, $dd, $78, $02, $23, $7a        ;; 0c:6c1c ????????
    db   $8c, $01, $68, $0d, $69, $1f, $2d, $6c        ;; 0c:6c24 ????????
    db   $05, $fe, $76, $c1, $00, $0c, $19, $c5        ;; 0c:6c2c ????????
    db   $07, $1f, $05, $4c, $7d, $05, $56, $7d        ;; 0c:6c34 ????????
    db   $01, $9d, $cf, $24, $1f, $06, $05, $2d        ;; 0c:6c3c ????????
    db   $7e, $01, $68, $0d, $69, $1f, $06, $01        ;; 0c:6c44 ????????
    db   $9d, $cc, $25, $1f, $02, $dd, $78, $02        ;; 0c:6c4c ????????
    db   $23, $79                                      ;; 0c:6c54 ??

data_0c_6c56:
    db   $05                                           ;; 0c:6c56 .
    dw   data_0c_7d5e                                  ;; 0c:6c57 pP
    db   $01, $68, $0d, $69, $1f, $2d, $6c, $c1        ;; 0c:6c59 .p.p....
    db   $06, $0c, $bc, $1f, $02, $96, $6c, $c1        ;; 0c:6c61 ..p..??.
    db   $08, $0c, $bc, $1f, $02, $e4, $6c, $05        ;; 0c:6c69 ..p..??.
    dw   data_0c_7724                                  ;; 0c:6c71 pP
    db   $05                                           ;; 0c:6c73 .
    dw   data_0c_7d56                                  ;; 0c:6c74 pP
    db   $01, $9d, $cf, $46, $1f, $06, $01, $9d        ;; 0c:6c76 .p.....p
    db   $d0, $4b, $1f, $06, $05, $2d, $7e, $01        ;; 0c:6c7e ....????
    db   $68, $0d, $69, $1f, $06, $01, $9d, $cc        ;; 0c:6c86 ????????
    db   $47, $1f, $02, $23, $7a, $02, $23, $79        ;; 0c:6c8e ????????
    db   $05, $24, $77, $c1, $82, $0c, $19, $c5        ;; 0c:6c96 ????????
    db   $87, $1f, $05, $44, $7d, $02, $bc, $6b        ;; 0c:6c9e ????????
    db   $8c, $05, $da, $6e, $01, $68, $0d, $69        ;; 0c:6ca6 ????????
    db   $1f, $2d, $6c, $05, $2e, $77, $01, $9d        ;; 0c:6cae ????????
    db   $cd, $31, $1f, $8d, $01, $9d, $ce, $39        ;; 0c:6cb6 ????????
    db   $1f, $8d, $01, $9d, $cc, $31, $1f, $02        ;; 0c:6cbe ????????
    db   $e1, $6c, $01, $9d, $cc, $34, $1f, $02        ;; 0c:6cc6 ????????
    db   $e1, $6c, $01, $9d, $cc, $37, $1f, $02        ;; 0c:6cce ????????
    db   $e1, $6c, $01, $9d, $cc, $39, $1f, $02        ;; 0c:6cd6 ????????
    db   $e1, $6c, $4c, $02, $57, $7d, $05, $2e        ;; 0c:6cde ????????
    db   $77, $01, $9d, $cc, $0b, $1f, $02, $f9        ;; 0c:6ce6 ????????
    db   $6c, $c1, $00, $0c, $19, $c5, $07, $1f        ;; 0c:6cee ????????
    db   $05, $4c, $7d, $8d, $05, $5e, $7d, $01        ;; 0c:6cf6 ????????
    db   $68, $0d, $69, $1f, $2d, $6c, $05, $24        ;; 0c:6cfe ????????
    db   $77, $c1, $00, $0d, $59, $c5, $80, $1f        ;; 0c:6d06 ????????
    db   $05, $44, $7d, $c1, $02, $0c, $19, $c5        ;; 0c:6d0e ????????
    db   $87, $1f, $02, $1e, $6d, $05, $44, $7d        ;; 0c:6d16 ????????
    db   $4c, $c1, $00, $0c, $58, $c5, $01, $1f        ;; 0c:6d1e ????????
    db   $2c, $05, $b6, $75, $01, $9d, $cc, $3c        ;; 0c:6d26 ????????
    db   $1f, $02, $33, $6d, $06, $20, $f5, $12        ;; 0c:6d2e ????????
    db   $c0, $1f, $20, $f5, $2c, $f5, $c3, $ff        ;; 0c:6d36 ????????
    db   $1f, $06, $05, $5b, $73, $05, $45, $75        ;; 0c:6d3e ????????
    db   $01, $6a, $cc, $00, $1f, $2d, $4c, $05        ;; 0c:6d46 ????????
    db   $69, $73, $6c, $c1, $0b, $0c, $bc, $1f        ;; 0c:6d4e ????????
    db   $02, $70, $6d, $c1, $0c, $0c, $bc, $1f        ;; 0c:6d56 ????????
    db   $02, $88, $6d, $05, $24, $77, $20, $c0        ;; 0c:6d5e ????????
    db   $2c, $c0, $01, $6a, $ca, $01, $1f, $02        ;; 0c:6d66 ????????
    db   $bd, $6b, $05, $2e, $77, $01, $9d, $cd        ;; 0c:6d6e ????????
    db   $2f, $1f, $02, $85, $6d, $c1, $00, $0c        ;; 0c:6d76 ????????
    db   $19, $c5, $07, $1f, $05, $4c, $7d, $02        ;; 0c:6d7e ????????
    db   $64, $6d, $05, $fe, $76, $02, $64, $6d        ;; 0c:6d86 ????????
    db   $01, $d8, $13, $73, $d8, $1f, $05, $b9        ;; 0c:6d8e ????????
    db   $73, $6c, $20, $c0, $2c, $24, $1f, $05        ;; 0c:6d96 ????????
    db   $26, $7e, $01, $d8, $0f, $85, $1f, $4c        ;; 0c:6d9e ????????
    db   $05, $b6, $75, $20, $f5, $2c, $20, $1f        ;; 0c:6da6 ????????
    db   $06, $05, $26, $7e, $01, $d8, $0e, $85        ;; 0c:6dae ????????
    db   $1f, $02, $c6, $6d, $a0, $94, $ce, $13        ;; 0c:6db6 ????????
    db   $fb, $c6, $1f, $0b, $bf, $04, $0c, $4c        ;; 0c:6dbe ????????
    db   $05, $2c, $74, $01, $68, $0d, $69, $1f        ;; 0c:6dc6 ????????
    db   $2d, $6c, $05, $4f, $77, $05, $cd, $7b        ;; 0c:6dce ????????
    db   $02, $b6, $75, $05, $5e, $7d, $01, $68        ;; 0c:6dd6 ????????
    db   $0d, $69, $1f, $2d, $6c, $05, $3d, $77        ;; 0c:6dde ????????
    db   $4c, $2c, $02, $b6, $75, $8c, $01, $68        ;; 0c:6de6 ????????
    db   $0d, $69, $1f, $2d, $6c, $05, $47, $77        ;; 0c:6dee ????????
    db   $01, $9d, $cc, $60, $1f, $02, $01, $6e        ;; 0c:6df6 ????????
    db   $02, $11, $6e, $c1, $82, $0c, $19, $c5        ;; 0c:6dfe ????????
    db   $87, $1f, $20, $c0, $2c, $c0, $03, $33        ;; 0c:6e06 ????????
    db   $03, $33, $1f, $02, $e6, $6d, $01, $d8        ;; 0c:6e0e ????????
    db   $13, $73, $d8, $1f, $02, $20, $6e, $02        ;; 0c:6e16 ????????
    db   $30, $6e, $05, $b9, $73, $01, $9d, $cd        ;; 0c:6e1e ????????
    db   $6e, $1f, $02, $30, $6e, $08, $73, $05        ;; 0c:6e26 ????????
    db   $16, $48, $05, $2c, $74, $01, $68, $0d        ;; 0c:6e2e ????????
    db   $68, $1f, $2d, $6c, $05, $4f, $77, $05        ;; 0c:6e36 ????????
    db   $26, $7e, $01, $9d, $cd, $6e, $1f, $02        ;; 0c:6e3e ????????
    db   $58, $6e, $01, $9d, $ce, $70, $1f, $02        ;; 0c:6e46 ????????
    db   $58, $6e, $01, $d8, $0e, $85, $1f, $02        ;; 0c:6e4e ????????
    db   $59, $6e, $4c, $05, $57, $7d, $01, $9d        ;; 0c:6e56 ????????
    db   $ce, $6f, $1f, $06, $01, $9d, $cc, $61        ;; 0c:6e5e ????????
    db   $1f, $06, $05, $2d, $7e, $01, $68, $0d        ;; 0c:6e66 ????????
    db   $69, $1f, $06, $01, $9d, $cc, $6e, $1f        ;; 0c:6e6e ????????
    db   $02, $23, $7a, $02, $23, $79, $05, $7b        ;; 0c:6e76 ????????
    db   $73, $05, $8d, $6b, $00, $9a, $0c, $9a        ;; 0c:6e7e ????????
    db   $c6, $40, $1f, $00, $7f, $0c, $d6, $1f        ;; 0c:6e86 ????????
    db   $00, $d6, $0c, $d8, $1f, $05, $0c, $48        ;; 0c:6e8e ????????
    db   $02, $40, $52                                 ;; 0c:6e96 ???

data_0c_6e99:
    db   $8c, $05                                      ;; 0c:6e99 ..
    dw   .data_0c_6eda                                 ;; 0c:6e9b pP
    db   $01, $68, $0d, $69, $1f, $2d, $05             ;; 0c:6e9d .p.p...
    dw   data_0c_7591                                  ;; 0c:6ea4 pP
    db   $05                                           ;; 0c:6ea6 .
    dw   data_0c_7757                                  ;; 0c:6ea7 pP
    db   $c1, $14, $0c, $bc, $1f, $02, $bc, $6e        ;; 0c:6ea9 ...p..??
    db   $4c, $2c, $05                                 ;; 0c:6eb1 ...
    dw   data_0c_777c                                  ;; 0c:6eb4 pP
    db   $05                                           ;; 0c:6eb6 .
    dw   data_0c_75b6                                  ;; 0c:6eb7 pP
    db   $02                                           ;; 0c:6eb9 .
    dw   data_0c_7c82                                  ;; 0c:6eba pP
    db   $05, $26, $7e, $01, $9d, $cc, $0e, $1f        ;; 0c:6ebc ????????
    db   $02, $d2, $6e, $01, $9d, $cc, $1c, $1f        ;; 0c:6ec4 ????????
    db   $02, $d2, $6e, $02, $d3, $6e, $4c, $2c        ;; 0c:6ecc ????????
    db   $05, $7c, $77, $02, $b6, $6e                  ;; 0c:6ed4 ??????
.data_0c_6eda:
    db   $01, $d8, $13                                 ;; 0c:6eda .p.
    dw   wD873                                         ;; 0c:6edd pP
    db   $1f, $02                                      ;; 0c:6edf ..
    dw   .data_0c_6ee4                                 ;; 0c:6ee1 pP
    db   $06                                           ;; 0c:6ee3 ?
.data_0c_6ee4:
    db   $01, $9c, $d0, $80, $1f, $05, $9c, $7c        ;; 0c:6ee4 .p....??
    db   $06, $8c, $01, $68, $0d, $69, $1f, $2d        ;; 0c:6eec .???????
    db   $01, $9d, $cc, $1d, $1f, $05, $91, $75        ;; 0c:6ef4 ????????
    db   $01, $9d, $ce, $1d, $1f, $6c, $01, $9d        ;; 0c:6efc ????????
    db   $cc, $1d, $1f, $05, $57, $77, $01, $9d        ;; 0c:6f04 ????????
    db   $cc, $37, $1f, $05, $24, $77, $01, $9d        ;; 0c:6f0c ????????
    db   $cc, $6d, $1f, $05, $3d, $77, $01, $9b        ;; 0c:6f14 ????????
    db   $cc, $10, $1f, $05, $2e, $77, $4c, $01        ;; 0c:6f1c ????????
    db   $9d, $ce, $1d, $1f, $02, $39, $6f, $c1        ;; 0c:6f24 ????????
    db   $00, $0c, $9a, $c5, $40, $1f, $02, $39        ;; 0c:6f2c ????????
    db   $6f, $05, $a9, $50, $ad, $2c, $21, $f5        ;; 0c:6f34 ????????
    db   $ec, $80, $80, $1f, $02, $6b, $6f, $05        ;; 0c:6f3c ????????
    db   $b6, $75, $20, $f5, $2c, $c0, $1f, $20        ;; 0c:6f44 ????????
    db   $c0, $12, $f5, $1f, $21, $26, $2d, $22        ;; 0c:6f4c ????????
    db   $23, $c0, $1f, $20, $c0, $2c, $26, $24        ;; 0c:6f54 ????????
    db   $22, $1f, $20, $c0, $cc, $00, $24, $c0        ;; 0c:6f5c ????????
    db   $1f, $0b, $bf, $4b, $02, $9a, $6f, $05        ;; 0c:6f64 ????????
    db   $b6, $75, $01, $05, $0d, $06, $1f, $02        ;; 0c:6f6c ????????
    db   $91, $6f, $20, $f5, $12, $c0, $1f, $21        ;; 0c:6f74 ????????
    db   $24, $2d, $20, $23, $f5, $1f, $20, $f5        ;; 0c:6f7c ????????
    db   $2c, $24, $24, $20, $1f, $20, $f5, $cc        ;; 0c:6f84 ????????
    db   $00, $24, $f5, $1f, $06, $20, $f5, $ec        ;; 0c:6f8c ????????
    db   $80, $80, $1f, $0b, $bf, $4a, $01, $f7        ;; 0c:6f94 ????????
    db   $cd, $ff, $1f, $00, $f9, $0c, $f7, $1f        ;; 0c:6f9c ????????
    db   $0c, $00, $f9, $0c, $d8, $1f, $06, $8c        ;; 0c:6fa4 ????????
    db   $01, $fc, $ce, $b3, $1f, $2d, $01, $68        ;; 0c:6fac ????????
    db   $0d, $69, $1f, $2d, $4c, $c1, $00, $0d        ;; 0c:6fb4 ????????
    db   $9a, $c5, $40, $1f, $ad, $00, $7f, $0c        ;; 0c:6fbc ????????
    db   $d6, $1f, $00, $d6, $0c, $d8, $1f, $0b        ;; 0c:6fc4 ????????
    db   $06, $ff, $05, $47, $49, $05, $40, $52        ;; 0c:6fcc ????????
    db   $02, $10, $54, $05, $7b, $73, $05, $2c        ;; 0c:6fd4 ????????
    db   $74, $01, $68, $0d, $69, $1f, $2d, $4c        ;; 0c:6fdc ????????
    db   $c1, $00, $0d, $9a, $c5, $40, $1f, $ad        ;; 0c:6fe4 ????????
    db   $00, $7f, $0c, $d6, $1f, $00, $d6, $0c        ;; 0c:6fec ????????
    db   $d8, $1f, $05, $fc, $6f, $02, $40, $52        ;; 0c:6ff4 ????????

data_0c_6ffc:
    db   $05                                           ;; 0c:6ffc .
    dw   data_0c_4755                                  ;; 0c:6ffd pP
    db   $20, $34, $2c, $a9, $1f, $20, $36, $2c        ;; 0c:6fff ........
    db   $ab, $1f, $05                                 ;; 0c:7007 ...
    dw   data_0c_4975                                  ;; 0c:700a pP
    db   $06, $c1, $00, $0d, $02, $c5, $20, $1f        ;; 0c:700c .???????
    db   $02, $22, $70, $05, $cb, $7c, $01, $85        ;; 0c:7014 ????????
    db   $cc, $ff, $1f, $02, $73, $70, $8c, $01        ;; 0c:701c ????????
    db   $fc, $ce, $b3, $1f, $2d, $01, $06, $0e        ;; 0c:7024 ????????
    db   $05, $1f, $2d, $01, $d6, $ce, $04, $1f        ;; 0c:702c ????????
    db   $05, $2d, $7e, $01, $68, $0d, $69, $1f        ;; 0c:7034 ????????
    db   $2d, $4c, $c1, $00, $0d, $9a, $c5, $40        ;; 0c:703c ????????
    db   $1f, $ad, $01, $9d, $cc, $0c, $1f, $02        ;; 0c:7044 ????????
    db   $59, $70, $01, $9d, $cc, $2e, $1f, $02        ;; 0c:704c ????????
    db   $59, $70, $02, $67, $70, $c1, $00, $0c        ;; 0c:7054 ????????
    db   $1e, $c5, $04, $1f, $ad, $20, $c0, $2c        ;; 0c:705c ????????
    db   $22, $1f, $06, $05, $dd, $78, $c1, $00        ;; 0c:7064 ????????
    db   $0c, $03, $c5, $80, $1f, $ad, $06, $05        ;; 0c:706c ????????
    db   $64, $7d, $0b, $be, $18, $05, $8d, $6b        ;; 0c:7074 ????????
    db   $0b, $bd, $80, $03, $7f, $6b, $05, $dd        ;; 0c:707c ????????
    db   $78, $01, $9d, $cc, $ca, $1f, $02, $8e        ;; 0c:7084 ????????
    db   $70, $06, $20, $2a, $2c, $2e, $1f, $20        ;; 0c:708c ????????
    db   $03, $2c, $03, $e5, $80, $00, $1f, $0b        ;; 0c:7094 ????????
    db   $c1, $77, $02, $ee, $7a, $c1, $00, $0d        ;; 0c:709c ????????
    db   $02, $c5, $20, $1f, $02, $b6, $70, $05        ;; 0c:70a4 ????????
    db   $cb, $7c, $01, $85, $cc, $ff, $1f, $02        ;; 0c:70ac ????????
    db   $e0, $70, $8c, $05, $da, $6e, $01, $05        ;; 0c:70b4 ????????
    db   $0d, $06, $1f, $00, $68, $0c, $68, $ca        ;; 0c:70bc ????????
    db   $01, $1f, $01, $68, $0d, $69, $1f, $2d        ;; 0c:70c4 ????????
    db   $01, $9d, $cc, $53, $1f, $02, $d5, $70        ;; 0c:70cc ????????
    db   $4c, $c1, $00, $0d, $9a, $c5, $40, $1f        ;; 0c:70d4 ????????
    db   $ad, $02, $23, $79, $05, $e6, $70, $02        ;; 0c:70dc ????????
    db   $29, $79, $05, $64, $7d, $0b, $be, $18        ;; 0c:70e4 ????????
    db   $05, $8d, $6b, $0b, $bd, $80, $03, $7f        ;; 0c:70ec ????????
    db   $6b, $06, $c1, $00, $0d, $02, $c5, $20        ;; 0c:70f4 ????????
    db   $1f, $02, $0b, $71, $05, $cb, $7c, $01        ;; 0c:70fc ????????
    db   $85, $cc, $ff, $1f, $02, $1e, $71, $8c        ;; 0c:7104 ????????
    db   $01, $68, $0d, $69, $1f, $2d, $4c, $c1        ;; 0c:710c ????????
    db   $00, $0d, $9a, $c5, $40, $1f, $ad, $02        ;; 0c:7114 ????????
    db   $23, $7a, $05, $e6, $70, $02, $29, $7a        ;; 0c:711c ????????
    db   $01, $9d, $cc, $0b, $1f, $02, $7a, $71        ;; 0c:7124 ????????
    db   $c1, $00, $0d, $02, $c5, $20, $1f, $02        ;; 0c:712c ????????
    db   $41, $71, $05, $cb, $7c, $01, $85, $cc        ;; 0c:7134 ????????
    db   $ff, $1f, $02, $7a, $71, $8c, $01, $68        ;; 0c:713c ????????
    db   $0d, $69, $1f, $2d, $4c, $c1, $00, $0d        ;; 0c:7144 ????????
    db   $9a, $c5, $40, $1f, $ad, $20, $7b, $2c        ;; 0c:714c ????????
    db   $03, $1f, $00, $7d, $ac, $1f, $c3, $01        ;; 0c:7154 ????????
    db   $c1, $04, $1f, $00, $ae, $0c, $7d, $1f        ;; 0c:715c ????????
    db   $05, $23, $79, $00, $7e, $ac, $07, $c3        ;; 0c:7164 ????????
    db   $01, $c1, $20, $c3, $01, $1f, $00, $ae        ;; 0c:716c ????????
    db   $0c, $7e, $1f, $02, $23, $7a, $05, $e6        ;; 0c:7174 ????????
    db   $70, $20, $03, $2c, $03, $e5, $80, $00        ;; 0c:717c ????????
    db   $1f, $06, $01, $9b, $cc, $20, $1f, $02        ;; 0c:7184 ????????
    db   $91, $71, $02, $d6, $71, $c1, $00, $0d        ;; 0c:718c ????????
    db   $02, $c5, $20, $1f, $02, $a6, $71, $05        ;; 0c:7194 ????????
    db   $cb, $7c, $01, $85, $cc, $ff, $1f, $02        ;; 0c:719c ????????
    db   $d6, $71, $8c, $01, $68, $0d, $69, $1f        ;; 0c:71a4 ????????
    db   $2d, $05, $91, $75, $20, $c0, $2c, $26        ;; 0c:71ac ????????
    db   $01, $b6, $c2, $14, $1f, $4c, $05, $7c        ;; 0c:71b4 ????????
    db   $77, $01, $c0, $ce, $00, $1f, $02, $d0        ;; 0c:71bc ????????
    db   $71, $c1, $00, $0d, $9a, $c5, $40, $1f        ;; 0c:71c4 ????????
    db   $ad, $02, $e5, $71, $05, $b6, $75, $02        ;; 0c:71cc ????????
    db   $82, $7c, $05, $64, $7d, $0b, $be, $17        ;; 0c:71d4 ????????
    db   $05, $8d, $6b, $0b, $bd, $80, $03, $7f        ;; 0c:71dc ????????
    db   $6b, $01, $9d, $ce, $2f, $1f, $05, $db        ;; 0c:71e4 ????????
    db   $7a, $01, $9b, $cc, $20, $1f, $05, $e5        ;; 0c:71ec ????????
    db   $7a, $06, $01, $9b, $cc, $20, $1f, $02        ;; 0c:71f4 ????????
    db   $14, $72, $8c, $01, $68, $0d, $69, $1f        ;; 0c:71fc ????????
    db   $2d, $6c, $20, $c0, $0c, $b6, $c5, $0f        ;; 0c:7204 ????????
    db   $c1, $0a, $1f, $4c, $2c, $05, $b6, $75        ;; 0c:720c ????????
    db   $02, $04, $7b                                 ;; 0c:7214 ???

data_0c_7217:
    db   $0b, $bf, $4e, $0d, $0b, $bf, $4f, $0d        ;; 0c:7217 ..w.????
    db   $a0, $7a, $d8, $0c, $d6, $1f, $05, $49        ;; 0c:721f ????????
    db   $72, $01, $7d, $0c, $7e, $1f, $02, $94        ;; 0c:7227 ????????
    db   $6b, $c1, $50, $ad, $64, $1f, $02, $94        ;; 0c:722f ????????
    db   $6b, $03, $9b, $49, $05, $8d, $6b, $ab        ;; 0c:7237 ????????
    db   $00, $de, $13, $03, $71, $6b, $0b, $bf        ;; 0c:723f ????????
    db   $54, $0d, $03, $58, $6b, $20, $c8, $13        ;; 0c:7247 ????????
    db   $7a, $d8, $e3, $36, $cc, $1f, $00, $7d        ;; 0c:724f ????????
    db   $6c, $c8, $1f, $03, $5f, $44, $20, $c8        ;; 0c:7257 ????????
    db   $13, $7a, $d8, $e3, $7b, $d8, $1f, $00        ;; 0c:725f ????????
    db   $7e, $6c, $c8, $1f, $06, $0b, $bf, $55        ;; 0c:7267 ????????
    db   $0c, $c1, $64, $0e, $32, $a3, $64, $1f        ;; 0c:726f ????????
    db   $2d, $01, $d8, $ce, $04, $1f, $02, $b4        ;; 0c:7277 ????????
    db   $72, $20, $7b, $0c, $32, $01, $b6, $1f        ;; 0c:727f ????????
    db   $40, $75, $53, $e0, $c6, $1f, $01, $d6        ;; 0c:7287 ????????
    db   $cd, $05, $1f, $02, $b4, $72, $40, $78        ;; 0c:728f ????????
    db   $4c, $75, $24, $7b, $1f, $e0, $75, $d8        ;; 0c:7297 ????????
    db   $4c, $75, $44, $78, $1f, $e0, $e0, $c6        ;; 0c:729f ????????
    db   $4c, $78, $1f, $05, $8d, $6b, $03, $7f        ;; 0c:72a7 ????????
    db   $6b, $0b, $bf, $56, $0d, $00, $7f, $0c        ;; 0c:72af ????????
    db   $d6, $1f, $00, $d6, $0c, $d8, $1f, $05        ;; 0c:72b7 ????????
    db   $7e, $46, $20, $7b, $0c, $a2, $c1, $0a        ;; 0c:72bf ????????
    db   $1f, $00, $a2, $0c, $a2, $ca, $01, $c3        ;; 0c:72c7 ????????
    db   $01, $1f, $05, $ee, $47, $01, $fc, $ce        ;; 0c:72cf ????????
    db   $b3, $1f, $20, $7b, $2c, $7b, $c1, $06        ;; 0c:72d7 ????????
    db   $1f, $05, $40, $52, $03, $35, $7e, $40        ;; 0c:72df ????????
    db   $78, $4c, $75, $23, $7b, $1f, $41, $78        ;; 0c:72e7 ????????
    db   $4e, $85, $1f, $40, $78, $4c, $85, $44        ;; 0c:72ef ????????
    db   $78, $1f, $e0, $75, $d8, $4c, $78, $44        ;; 0c:72f7 ????????
    db   $75, $1f, $05, $8d, $6b, $03, $7f, $6b        ;; 0c:72ff ????????
    db   $0b, $bf, $57, $0d, $0b, $bf, $12, $0c        ;; 0c:7307 ????????
    db   $0b, $bf, $62, $0c, $ab, $b9, $d2, $f3        ;; 0c:730f ????????
    db   $ab, $c8, $d2, $3f, $02, $9c, $7c, $05        ;; 0c:7317 ????????
    db   $73, $73, $20, $2a, $2c, $2e, $1f, $02        ;; 0c:731f ????????
    db   $9c, $7c, $0b, $bf, $58, $0d, $0b, $bf        ;; 0c:7327 ????????
    db   $59, $0d                                      ;; 0c:732f ??

data_0c_7331:
    db   $03                                           ;; 0c:7331 .
    dw   data_0c_6b68                                  ;; 0c:7332 pP
    db   $06, $0b, $bf, $33, $0c, $0b, $bf, $35        ;; 0c:7334 .???????
    db   $0d                                           ;; 0c:733c ?

data_0c_733d:
    db   $0b, $bf, $34, $0c, $0b, $bf, $35, $0d        ;; 0c:733d ..w...w.
    db   $00, $85, $13, $73, $d8, $1f, $0b, $bf        ;; 0c:7345 ????????
    db   $34, $0c, $0b, $bf, $37, $0d, $0b, $bf        ;; 0c:734d ????????
    db   $34, $0c, $0b, $bf, $38, $0d, $0b, $bf        ;; 0c:7355 ????????
    db   $34, $0c, $0b, $bf, $36, $e0, $75, $d8        ;; 0c:735d ????????
    db   $0c, $b2, $1f, $0d, $0b, $bf, $3d, $e0        ;; 0c:7365 ????????
    db   $75, $d8, $0c, $6a, $1f, $0d, $0b, $bf        ;; 0c:736d ????????
    db   $12, $0c, $0b, $bf, $51, $0d, $01, $9b        ;; 0c:7375 ????????
    db   $cc, $30, $1f, $02, $a9, $73, $0b, $bf        ;; 0c:737d ????????
    db   $12, $0c, $0b, $bf, $13, $0d, $0b, $bf        ;; 0c:7385 ????????
    db   $12, $0c, $0b, $bf, $14, $0d, $0b, $bf        ;; 0c:738d ????????
    db   $12, $0c, $0b, $bf, $50, $0d, $00, $85        ;; 0c:7395 ????????
    db   $13, $73, $d8, $1f, $0b, $bf, $34, $0c        ;; 0c:739d ????????
    db   $0b, $bf, $61, $0d, $0b, $bf, $12, $0c        ;; 0c:73a5 ????????
    db   $0b, $bf, $62, $0d, $0b, $bf, $4c, $0d        ;; 0c:73ad ????????
    db   $0b, $bf, $4d, $0d                            ;; 0c:73b5 ????

data_0c_73b9:
    db   $01, $9b, $cc, $30, $1f, $02, $c4, $73        ;; 0c:73b9 .p....??
    db   $02                                           ;; 0c:73c1 .
    dw   .data_0c_73cf                                 ;; 0c:73c2 pP
    db   $01, $9d, $d0, $c0, $1f, $02, $73, $73        ;; 0c:73c4 ????????
    db   $02, $a9, $73                                 ;; 0c:73cc ???
.data_0c_73cf:
    db   $c1, $00, $0c, $9c, $c5, $c0, $1f, $02        ;; 0c:73cf ...p....
    dw   data_0c_733d                                  ;; 0c:73d7 pP
    db   $c1, $40, $0d, $9c, $c5, $43, $1f, $02        ;; 0c:73d9 ????????
    db   $45, $73, $c1, $81, $0c, $9c, $c5, $81        ;; 0c:73e1 ????????
    db   $1f, $02, $53, $73, $02, $9b, $73, $01        ;; 0c:73e9 ????????
    db   $9b, $cc, $30, $1f, $02, $fb, $73, $02        ;; 0c:73f1 ????????
    db   $06, $74, $01, $9d, $d0, $c0, $1f, $02        ;; 0c:73f9 ????????
    db   $73, $73, $02, $a9, $73, $c1, $10, $0c        ;; 0c:7401 ????????
    db   $9b, $1f, $02, $73, $73, $c1, $00, $0c        ;; 0c:7409 ????????
    db   $9c, $c5, $c0, $1f, $02, $7b, $73, $c1        ;; 0c:7411 ????????
    db   $00, $0d, $9c, $c5, $40, $1f, $02, $8b        ;; 0c:7419 ????????
    db   $73, $c1, $00, $0d, $9c, $c5, $80, $1f        ;; 0c:7421 ????????
    db   $02, $93, $73                                 ;; 0c:7429 ???

data_0c_742c:
    db   $c1, $00, $0d, $02, $c5, $20, $1f, $02        ;; 0c:742c ...p....
    db   $41, $74, $05                                 ;; 0c:7434 ??.
    dw   data_0c_7ccb                                  ;; 0c:7437 pP
    db   $01, $85, $cc, $ff, $1f, $02, $ae, $74        ;; 0c:7439 .p....??
    db   $00, $68, $0c, $91, $1f, $01, $bc, $cf        ;; 0c:7441 ...p..p.
    db   $01, $1f, $02, $b4, $74, $00, $8a, $0c        ;; 0c:7449 ...??...
    db   $b3, $c3, $01, $c1, $03, $c3, $58, $1f        ;; 0c:7451 p.......
    db   $20, $ca, $0c, $bc, $cb, $01, $e3, $03        ;; 0c:7459 ...p....
    db   $75, $1f, $20, $ca, $8c, $ca, $1f, $0a        ;; 0c:7461 ........
    db   $ca                                           ;; 0c:7469 .
.data_0c_746a:
    db   $00, $68, $0c, $32, $ca, $02, $c3, $4b        ;; 0c:746a ...p....
    db   $03, $91, $03, $8a, $c2, $03, $1f, $02        ;; 0c:7472 .p.p.w..
    dw   .data_0c_74b4                                 ;; 0c:747a pP
.data_0c_747c:
    db   $00, $68, $0c, $68, $03, $8a, $c2, $02        ;; 0c:747c ...p.p.w
    db   $1f, $02                                      ;; 0c:7484 ..
    dw   .data_0c_74b4                                 ;; 0c:7486 pP
    db   $0b, $68, $64, $02, $b4, $74                  ;; 0c:7488 ??????
.data_0c_748e:
    db   $00, $68, $0c, $33, $ca, $02, $c3, $4b        ;; 0c:748e ...p....
    db   $03, $91, $03, $8a, $c2, $03, $1f, $02        ;; 0c:7496 .p.p.w..
    dw   .data_0c_74b4                                 ;; 0c:749e pP
    db   $01, $9b, $cc, $20, $1f, $02, $8e, $74        ;; 0c:74a0 ????????
    db   $02, $7c, $74, $02, $8e, $74, $0b, $68        ;; 0c:74a8 ????????
    db   $64, $02, $fb, $74                            ;; 0c:74b0 ????
.data_0c_74b4:
    db   $01, $68, $ce, $63, $1f, $00, $68, $cc        ;; 0c:74b4 .p....?.
    db   $63, $1f, $c1, $00, $0d, $01, $c5, $10        ;; 0c:74bc ?....p..
    db   $1f, $05, $2d, $7e, $01, $d6, $cf, $04        ;; 0c:74c4 ..??.p..
    db   $1f, $02                                      ;; 0c:74cc ..
    dw   .data_0c_74fb                                 ;; 0c:74ce pP
    db   $01, $fc, $ce, $b3, $1f, $02                  ;; 0c:74d0 .p....
    dw   .data_0c_74fb                                 ;; 0c:74d6 pP
    db   $01, $05, $0e, $06, $1f, $02, $fb, $74        ;; 0c:74d8 ????????
    db   $00, $68, $cc, $64, $04, $5e, $1f, $01        ;; 0c:74e0 ????????
    db   $bc, $cf, $15, $1f, $02, $fb, $74, $01        ;; 0c:74e8 ????????
    db   $bc, $cd, $23, $1f, $00, $68, $cc, $64        ;; 0c:74f0 ????????
    db   $04, $62, $1f                                 ;; 0c:74f8 ???
.data_0c_74fb:
    db   $00, $69, $ac, $64, $c3, $01, $1f, $06        ;; 0c:74fb ........
    db   $6a, $74, $6a, $74, $6a, $74                  ;; 0c:7503 ??????
    dw   .data_0c_746a                                 ;; 0c:7509 pP
    db   $6a, $74                                      ;; 0c:750b ??
    dw   .data_0c_747c                                 ;; 0c:750d pP
    db   $7c, $74, $7c, $74, $7c, $74, $7c, $74        ;; 0c:750f ????????
    db   $6a, $74, $6a, $74, $6a, $74, $88, $74        ;; 0c:7517 ????????
    db   $b4, $74, $7c, $74, $b4, $74, $b4, $74        ;; 0c:751f ????????
    db   $88, $74                                      ;; 0c:7527 ??
    dw   .data_0c_748e                                 ;; 0c:7529 pP
    db   $8e, $74, $a0, $74, $8e, $74, $8e, $74        ;; 0c:752b ????????
    db   $a0, $74, $a0, $74, $a0, $74, $a0, $74        ;; 0c:7533 ????????
    db   $a0, $74, $a0, $74, $a0, $74, $a0, $74        ;; 0c:753b ????????
    db   $7c, $74, $0b, $6a, $00, $0b, $e4, $00        ;; 0c:7543 ????????
    db   $00, $e5, $0c, $b2, $c4, $01, $1f, $05        ;; 0c:754b ????????
    db   $2c, $74, $01, $68, $0d, $69, $1f, $02        ;; 0c:7553 ????????
    db   $5f, $75, $07, $6a, $07, $e4, $01, $e4        ;; 0c:755b ????????
    db   $0f, $e5, $1f, $02, $52, $75, $06             ;; 0c:7563 ???????

data_0c_756a:
    db   $c0, $8e, $d8, $0c, $35, $1f                  ;; 0c:756a ....p.

data_0c_7570:
    db   $c1, $00, $0d, $9a, $c5, $20, $1f, $c0        ;; 0c:7570 ...p....
    db   $8e, $d8, $33, $8e, $d8, $cb, $01, $1f        ;; 0c:7578 ........
    db   $c1, $00, $0d, $03, $c5, $04, $1f, $c0        ;; 0c:7580 ...p....
    db   $8e, $d8, $33, $8e, $d8, $ca, $01, $1f        ;; 0c:7588 ??.??.?.
    db   $06                                           ;; 0c:7590 .

data_0c_7591:
    db   $c0, $8e, $d8, $0c, $60, $1f, $02             ;; 0c:7591 ....p..
    dw   data_0c_7570                                  ;; 0c:7598 pP

data_0c_759a:
    db   $09, $0c, $10, $11, $1d, $1f, $24, $25        ;; 0c:759a .....?.?
    db   $31, $35, $37, $3a, $44, $44, $47, $4a        ;; 0c:75a2 .?.?.?.?
    db   $4c, $50, $52, $53, $55, $55, $57, $58        ;; 0c:75aa .?.?.?.?
    db   $5a, $64, $66, $67                            ;; 0c:75b2 .?.?

data_0c_75b6:
    db   $0b, $df, $00, $c1, $02, $0c, $19, $c5        ;; 0c:75b6 ......p.
    db   $87, $1f, $02                                 ;; 0c:75be ...
    dw   .data_0c_75c6                                 ;; 0c:75c1 pP
    db   $02                                           ;; 0c:75c3 .
    dw   .data_0c_75d9                                 ;; 0c:75c4 pP
.data_0c_75c6:
    db   $01, $9b, $ce, $00, $1f, $02                  ;; 0c:75c6 .p....
    dw   .data_0c_75d9                                 ;; 0c:75cc pP
    db   $01, $9d, $ce, $5b, $1f, $02, $d9, $75        ;; 0c:75ce .p....??
    db   $05                                           ;; 0c:75d6 .
    dw   data_0c_7d44                                  ;; 0c:75d7 pP
.data_0c_75d9:
    db   $20, $85, $33, $8e, $d8, $02, $dd, $1f        ;; 0c:75d9 ......p.
    db   $20, $c0, $2c, $c0, $02, $dd, $31, $85        ;; 0c:75e1 .....p..
    db   $1f, $c1, $00, $2c, $22, $31, $c0, $1f        ;; 0c:75e9 ........
    db   $6d, $01, $9b, $cc, $10, $1f, $02             ;; 0c:75f1 ..p....
    dw   .data_0c_75fd                                 ;; 0c:75f8 pP
    db   $02                                           ;; 0c:75fa .
    dw   .data_0c_7627                                 ;; 0c:75fb pP
.data_0c_75fd:
    db   $0b, $85, $00                                 ;; 0c:75fd ...
.data_0c_7600:
    db   $20, $c4, $ec                                 ;; 0c:7600 ...
    dw   data_0c_759a                                  ;; 0c:7603 pP
    db   $03, $85, $03, $85, $1f, $01, $9d, $6d        ;; 0c:7605 .p.p..p.
    db   $c4, $1f, $02                                 ;; 0c:760d ...
    dw   .data_0c_761a                                 ;; 0c:7610 pP
    db   $27, $c4, $01, $9d, $6f, $c4, $1f, $6d        ;; 0c:7612 .p.p....
.data_0c_761a:
    db   $07, $85, $01, $85, $cf, $0d, $1f, $02        ;; 0c:761a .p.p....
    dw   .data_0c_7600                                 ;; 0c:7622 pP
    db   $02                                           ;; 0c:7624 .
    dw   .data_0c_7649                                 ;; 0c:7625 pP
.data_0c_7627:
    db   $c1, $10, $0d, $9b, $1f, $6d, $01, $9d        ;; 0c:7627 ...p...p
    db   $cf, $69, $1f, $02                            ;; 0c:762f ....
    dw   .data_0c_763b                                 ;; 0c:7633 pP
    db   $01, $9d, $cf, $6e, $1f, $6d                  ;; 0c:7635 ??????
.data_0c_763b:
    db   $01, $9d, $cf, $59, $1f, $02                  ;; 0c:763b .p....
    dw   .data_0c_7649                                 ;; 0c:7641 pP
    db   $01, $9d, $cf, $61, $1f, $6d                  ;; 0c:7643 ??????
.data_0c_7649:
    db   $c1, $ff, $0c, $e6, $1f, $6d, $01, $d9        ;; 0c:7649 ...p...p
    db   $13                                           ;; 0c:7651 .
    dw   wD873                                         ;; 0c:7652 pP
    db   $1f, $02                                      ;; 0c:7654 ..
    dw   .data_0c_7659                                 ;; 0c:7656 pP
    db   $6d                                           ;; 0c:7658 ?
.data_0c_7659:
    db   $c1, $00, $0c, $99, $c5, $fc, $1f, $6d        ;; 0c:7659 ...p....
    db   $c0, $90, $d8, $2c, $c0, $1f, $c1, $00        ;; 0c:7661 ????????
    db   $0c, $99, $c5, $04, $1f, $02, $77, $76        ;; 0c:7669 ????????
    db   $0b, $6f, $6d, $02, $94, $76, $c1, $00        ;; 0c:7671 ????????
    db   $0c, $99, $c5, $08, $1f, $02, $87, $76        ;; 0c:7679 ????????
    db   $0b, $6f, $6c, $02, $94, $76, $c1, $00        ;; 0c:7681 ????????
    db   $0c, $99, $c5, $10, $1f, $02, $a1, $76        ;; 0c:7689 ????????
    db   $0b, $6f, $36, $05, $ce, $76, $05, $e3        ;; 0c:7691 ????????
    db   $7b, $20, $c0, $33, $90, $d8, $1f, $6d        ;; 0c:7699 ????????
    db   $c1, $00, $0c, $99, $c5, $20, $1f, $02        ;; 0c:76a1 ????????
    db   $b1, $76, $0b, $6f, $59, $02, $c4, $76        ;; 0c:76a9 ????????
    db   $c1, $00, $0c, $99, $c5, $40, $1f, $02        ;; 0c:76b1 ????????
    db   $c1, $76, $0b, $6f, $56, $02, $c4, $76        ;; 0c:76b9 ????????
    db   $0b, $6f, $4b, $05, $ce, $76, $05, $e3        ;; 0c:76c1 ????????
    db   $7b                                           ;; 0c:76c9 ?

data_0c_76ca:
    db   $0b, $6f, $ff, $06, $00, $7d, $0c, $9b        ;; 0c:76ca ....????
    db   $1f, $00, $7e, $0c, $9d, $1f, $0b, $9b        ;; 0c:76d2 ????????
    db   $10, $00, $9d, $0c, $6f, $1f, $a0, $94        ;; 0c:76da ????????
    db   $ce, $0c, $6f, $1f, $03, $49, $6b, $00        ;; 0c:76e2 ????????
    db   $9b, $0c, $7d, $1f, $00, $9d, $0c, $7e        ;; 0c:76ea ????????
    db   $1f, $06, $20, $c0, $0c, $30, $01, $b6        ;; 0c:76f2 ????????
    db   $ca, $01, $1f, $06                            ;; 0c:76fa ????

data_0c_76fe:
    db   $05                                           ;; 0c:76fe .
    dw   .data_0c_7711                                 ;; 0c:76ff pP
    db   $20, $c0, $2c, $24, $02, $85, $03, $30        ;; 0c:7701 .....p.p
    db   $ca, $01, $01, $b6, $ca, $01, $1f, $06        ;; 0c:7709 ...p....
.data_0c_7711:
    db   $0b, $85, $0a, $01, $1b, $cd, $b7, $1f        ;; 0c:7711 ..w.p...
    db   $06, $01, $1b, $ce, $c2, $1f, $06, $0b        ;; 0c:7719 .???????
    db   $85, $32, $06                                 ;; 0c:7721 ???

data_0c_7724:
    db   $20, $c0, $0c, $b6, $03, $30, $03, $32        ;; 0c:7724 ...p.p.p
    db   $1f, $06, $05, $11, $77, $20, $c0, $2c        ;; 0c:772c ..??????
    db   $24, $02, $85, $03, $30, $03, $b6, $1f        ;; 0c:7734 ????????
    db   $06, $20, $c0, $0c, $30, $cb, $01, $03        ;; 0c:773c ????????
    db   $b6, $1f, $06, $20, $c0, $0c, $b6, $cb        ;; 0c:7744 ????????
    db   $02, $1f, $06, $20, $c0, $0c, $b6, $cb        ;; 0c:774c ????????
    db   $03, $1f, $06                                 ;; 0c:7754 ???

data_0c_7757:
    db   $20, $c0, $0c, $33, $03, $b6, $c1, $03        ;; 0c:7757 ...p.p..
    db   $ca, $01, $1f, $01, $9b, $cc, $20, $1f        ;; 0c:775f ....p...
    db   $02                                           ;; 0c:7767 .
    dw   .data_0c_7771                                 ;; 0c:7768 pP
    db   $06, $01, $9d, $d0, $20, $1f, $06             ;; 0c:776a ???????
.data_0c_7771:
    db   $c1, $82, $0c, $19, $c5, $87, $1f, $05        ;; 0c:7771 ...p....
    db   $44, $7d, $06                                 ;; 0c:7779 ??.

data_0c_777c:
    db   $c1, $00, $0c, $1e, $05, $ad, $1f, $02        ;; 0c:777c ...p.p..
    dw   .data_0c_7814                                 ;; 0c:7784 pP
    db   $c1, $50, $0c, $ad, $1f, $02, $9e, $77        ;; 0c:7786 ????????
    db   $c1, $00, $0d, $ad, $c5, $0c, $1f, $02        ;; 0c:778e ????????
    db   $44, $7d, $05, $b5, $7c, $02, $bb, $77        ;; 0c:7796 ????????
    db   $c1, $50, $0c, $ad, $05, $1e, $1f, $02        ;; 0c:779e ????????
    db   $a9, $77, $06, $05, $44, $7d, $05, $b5        ;; 0c:77a6 ????????
    db   $7c, $05, $20, $7e, $0b, $bf, $48, $05        ;; 0c:77ae ????????
    db   $1f, $5f, $02, $cd, $7b, $05, $44, $7d        ;; 0c:77b6 ????????
    db   $c1, $00, $0c, $ad, $c5, $80, $1f, $02        ;; 0c:77be ????????
    db   $d4, $77, $05, $20, $7e, $0b, $bf, $44        ;; 0c:77c6 ????????
    db   $05, $1f, $5f, $02, $cd, $7b, $c1, $00        ;; 0c:77ce ????????
    db   $0c, $ad, $c5, $10, $1f, $02, $ea, $77        ;; 0c:77d6 ????????
    db   $05, $20, $7e, $0b, $bf, $45, $05, $1f        ;; 0c:77de ????????
    db   $5f, $02, $cd, $7b, $c1, $00, $0c, $ad        ;; 0c:77e6 ????????
    db   $c5, $20, $1f, $02, $00, $78, $05, $20        ;; 0c:77ee ????????
    db   $7e, $0b, $bf, $46, $05, $1f, $5f, $02        ;; 0c:77f6 ????????
    db   $cd, $7b, $c1, $00, $0c, $ad, $c5, $40        ;; 0c:77fe ????????
    db   $1f, $06, $05, $20, $7e, $0b, $bf, $47        ;; 0c:7806 ????????
    db   $05, $1f, $5f, $02, $cd, $7b                  ;; 0c:780e ??????
.data_0c_7814:
    db   $01, $ad, $cc, $04, $1f, $02, $1d, $78        ;; 0c:7814 .p....??
    db   $06, $01, $9b, $cc, $20, $1f, $02, $26        ;; 0c:781c .???????
    db   $78, $06, $2b, $c0, $00, $06                  ;; 0c:7824 ??????

data_0c_782a:
    db   $c1, $00, $0c, $58, $05, $ad, $1f, $02        ;; 0c:782a ...p.p..
    dw   data_0c_7bcd                                  ;; 0c:7832 pP
    db   $c1, $00, $0c, $ad, $c5, $02, $1f, $02        ;; 0c:7834 ...p....
    dw   .data_0c_7844                                 ;; 0c:783c pP
    db   $20, $f5, $2c, $c0, $1f, $06                  ;; 0c:783e ??????
.data_0c_7844:
    db   $c1, $50, $0c, $ad, $1f, $02, $75, $78        ;; 0c:7844 ...p..??
    db   $20, $c0, $2c, $c0, $ca, $01, $1f, $c1        ;; 0c:784c ........
    db   $00, $0d, $ad, $c5, $02, $1f, $06, $05        ;; 0c:7854 ..p.....
    dw   data_0c_7cb5                                  ;; 0c:785c pP
    db   $c1, $00, $0c, $ad, $c5, $01, $1f, $02        ;; 0c:785e ...p....
    dw   .data_0c_7893                                 ;; 0c:7866 pP
    db   $05, $1a, $7e, $0b, $bf, $49, $02, $1f        ;; 0c:7868 ????????
    db   $5f, $00, $00, $00, $00, $c1, $50, $0c        ;; 0c:7870 ????????
    db   $ad, $05, $58, $1f, $02, $80, $78, $06        ;; 0c:7878 ????????
    db   $20, $c0, $2c, $c0, $ca, $01, $1f, $05        ;; 0c:7880 ????????
    db   $b5, $7c, $05, $1a, $7e, $0b, $bf, $48        ;; 0c:7888 ????????
    db   $02, $1f, $5f                                 ;; 0c:7890 ???
.data_0c_7893:
    db   $c1, $00, $0c, $ad, $c5, $80, $1f, $02        ;; 0c:7893 ...p....
    dw   .data_0c_78a6                                 ;; 0c:789b pP
    db   $05, $1a, $7e, $0b, $bf, $44, $02, $1f        ;; 0c:789d ????????
    db   $5f                                           ;; 0c:78a5 ?
.data_0c_78a6:
    db   $c1, $00, $0c, $ad, $c5, $10, $1f, $02        ;; 0c:78a6 ...p....
    dw   .data_0c_78b9                                 ;; 0c:78ae pP
    db   $05, $1a, $7e, $0b, $bf, $45, $02, $1f        ;; 0c:78b0 ????????
    db   $5f                                           ;; 0c:78b8 ?
.data_0c_78b9:
    db   $c1, $00, $0c, $ad, $c5, $20, $1f, $02        ;; 0c:78b9 ...p....
    db   $cc, $78, $05                                 ;; 0c:78c1 ??.
    dw   data_0c_7e1a                                  ;; 0c:78c4 pP
    db   $0b, $bf, $46, $02                            ;; 0c:78c6 ..w.
    dw   data_0c_5f1f                                  ;; 0c:78ca pP
    db   $c1, $00, $0c, $ad, $c5, $40, $1f, $06        ;; 0c:78cc ????????
    db   $05, $1a, $7e, $0b, $bf, $47, $02, $1f        ;; 0c:78d4 ????????
    db   $5f, $01, $d6, $d0, $05, $1f, $02, $ed        ;; 0c:78dc ????????
    db   $78, $01, $d8, $cd, $05, $1f, $02, $fb        ;; 0c:78e4 ????????
    db   $78, $c1, $00, $0d, $59, $c5, $80, $1f        ;; 0c:78ec ????????
    db   $06, $05, $af, $50, $02, $10, $54, $01        ;; 0c:78f4 ????????
    db   $9d, $cc                                      ;; 0c:78fc ??

data_0c_78fe:
    db   $ca, $1f, $02, $09, $79, $01, $03, $cd        ;; 0c:78fe ????????
    db   $80, $1f, $ad, $05, $e5, $7a, $01, $03        ;; 0c:7906 ????????
    db   $cd, $80, $1f, $02, $1b, $79, $05, $b5        ;; 0c:790e ????????
    db   $7c, $0b, $bf, $1e, $0c, $00, $03, $0c        ;; 0c:7916 ????????
    db   $03, $c5, $7f, $1f, $06, $c1, $ff, $0c        ;; 0c:791e ????????
    db   $df, $1f, $06, $c1, $00, $0d, $02, $c5        ;; 0c:7926 ????????
    db   $20, $1f, $02, $3e, $79, $05, $cb, $7c        ;; 0c:792e ????????
    db   $01, $85, $cc, $ff, $1f, $02, $ae, $79        ;; 0c:7936 ????????
    db   $c1, $00, $0d, $59, $05, $ae, $1f, $ad        ;; 0c:793e ????????
    db   $05, $a4, $7c, $c1, $00, $0c, $ae, $c5        ;; 0c:7946 ????????
    db   $40, $1f, $02, $6c, $79, $0b, $bf, $1f        ;; 0c:794e ????????
    db   $0c, $01, $d8, $cd, $05, $1f, $02, $65        ;; 0c:7956 ????????
    db   $79, $05, $af, $50, $02, $10, $54, $20        ;; 0c:795e ????????
    db   $03, $ec, $40, $00, $1f, $06, $c1, $00        ;; 0c:7966 ????????
    db   $0c, $ae, $c5, $20, $1f, $02, $7d, $79        ;; 0c:796e ????????
    db   $0b, $bf, $21, $0c, $02, $0c, $7a, $c1        ;; 0c:7976 ????????
    db   $00, $0c, $ae, $c5, $10, $1f, $02, $8e        ;; 0c:797e ????????
    db   $79, $0b, $bf, $23, $0c, $02, $0c, $7a        ;; 0c:7986 ????????
    db   $c1, $00, $0c, $ae, $c5, $08, $1f, $02        ;; 0c:798e ????????
    db   $9f, $79, $0b, $bf, $25, $0c, $02, $0c        ;; 0c:7996 ????????
    db   $7a, $c1, $00, $0c, $ae, $c5, $04, $1f        ;; 0c:799e ????????
    db   $06, $0b, $bf, $27, $0c, $02, $0c, $7a        ;; 0c:79a6 ????????
    db   $c1, $00, $0c, $ae, $05, $03, $1f, $ad        ;; 0c:79ae ????????
    db   $05, $a4, $7c, $c1, $00, $0c, $ae, $c5        ;; 0c:79b6 ????????
    db   $40, $1f, $02, $ca, $79, $0b, $bf, $20        ;; 0c:79be ????????
    db   $0c, $02, $14, $7a, $c1, $00, $0c, $ae        ;; 0c:79c6 ????????
    db   $c5, $20, $1f, $02, $db, $79, $0b, $bf        ;; 0c:79ce ????????
    db   $22, $0c, $02, $14, $7a, $c1, $00, $0c        ;; 0c:79d6 ????????
    db   $ae, $c5, $10, $1f, $02, $ec, $79, $0b        ;; 0c:79de ????????
    db   $bf, $24, $0c, $02, $14, $7a, $c1, $00        ;; 0c:79e6 ????????
    db   $0c, $ae, $c5, $08, $1f, $02, $fd, $79        ;; 0c:79ee ????????
    db   $0b, $bf, $26, $0c, $02, $14, $7a, $c1        ;; 0c:79f6 ????????
    db   $00, $0c, $ae, $c5, $04, $1f, $06, $0b        ;; 0c:79fe ????????
    db   $bf, $29, $0c, $02, $14, $7a, $00, $03        ;; 0c:7a06 ????????
    db   $0c, $03, $06, $ae, $1f, $06, $00, $7b        ;; 0c:7a0e ????????
    db   $0c, $ae, $c8, $ff, $1f, $00, $03, $0c        ;; 0c:7a16 ????????
    db   $03, $05, $7b, $1f, $06, $c1, $ff, $0c        ;; 0c:7a1e ????????
    db   $df, $1f, $06, $c1, $00, $0d, $02, $c5        ;; 0c:7a26 ????????
    db   $20, $1f, $02, $3e, $7a, $05, $cb, $7c        ;; 0c:7a2e ????????
    db   $01, $85, $cc, $ff, $1f, $02, $82, $7a        ;; 0c:7a36 ????????
    db   $c1, $00, $0d, $5a, $05, $ae, $c5, $e0        ;; 0c:7a3e ????????
    db   $1f, $ad, $05, $a4, $7c, $c1, $00, $0c        ;; 0c:7a46 ????????
    db   $ae, $c5, $80, $1f, $02, $5f, $7a, $0b        ;; 0c:7a4e ????????
    db   $bf, $2a, $0c, $0b, $ae, $98, $02, $c4        ;; 0c:7a56 ????????
    db   $7a, $c1, $00, $0c, $ae, $c5, $40, $1f        ;; 0c:7a5e ????????
    db   $02, $73, $7a, $0b, $bf, $2d, $0c, $0b        ;; 0c:7a66 ????????
    db   $ae, $46, $02, $c4, $7a, $c1, $00, $0c        ;; 0c:7a6e ????????
    db   $ae, $c5, $20, $1f, $06, $0b, $bf, $30        ;; 0c:7a76 ????????
    db   $0c, $02, $c4, $7a, $c1, $00, $0c, $ae        ;; 0c:7a7e ????????
    db   $05, $04, $1f, $ad, $05, $a4, $7c, $c1        ;; 0c:7a86 ????????
    db   $00, $0c, $ae, $c5, $80, $1f, $02, $a1        ;; 0c:7a8e ????????
    db   $7a, $0b, $bf, $2b, $0c, $0b, $ae, $98        ;; 0c:7a96 ????????
    db   $02, $cc, $7a, $c1, $00, $0c, $ae, $c5        ;; 0c:7a9e ????????
    db   $40, $1f, $02, $b5, $7a, $0b, $bf, $2e        ;; 0c:7aa6 ????????
    db   $0c, $0b, $ae, $46, $02, $cc, $7a, $c1        ;; 0c:7aae ????????
    db   $00, $0c, $ae, $c5, $20, $1f, $06, $0b        ;; 0c:7ab6 ????????
    db   $bf, $31, $0c, $02, $cc, $7a, $00, $04        ;; 0c:7abe ????????
    db   $0c, $04, $06, $ae, $1f, $06, $00, $7b        ;; 0c:7ac6 ????????
    db   $0c, $ae, $c8, $ff, $1f, $00, $04, $0c        ;; 0c:7ace ????????
    db   $04, $05, $7b, $1f, $06, $20, $c0, $0c        ;; 0c:7ad6 ????????
    db   $b6, $c1, $0a, $1f, $02, $ee, $7a, $20        ;; 0c:7ade ????????
    db   $c0, $2c, $26, $01, $b6, $c2, $0a, $1f        ;; 0c:7ae6 ????????
    db   $21, $26, $2d, $c0, $23, $22, $1f, $20        ;; 0c:7aee ????????
    db   $c0, $2c, $26, $24, $22, $1f, $20, $c0        ;; 0c:7af6 ????????
    db   $cc, $00, $24, $c0, $1f, $06, $01, $9b        ;; 0c:7afe ????????
    db   $cc, $20, $1f, $02, $77, $7b, $05, $a4        ;; 0c:7b06 ????????
    db   $7c, $00, $7f, $0c, $b6, $c5, $30, $ca        ;; 0c:7b0e ????????
    db   $04, $c1, $05, $1f, $c1, $00, $0d, $b6        ;; 0c:7b16 ????????
    db   $c5, $c0, $ca, $06, $1f, $02, $34, $7b        ;; 0c:7b1e ????????
    db   $00, $34, $0c, $34, $11, $7f, $1f, $0b        ;; 0c:7b26 ????????
    db   $bf, $17, $0c, $02, $73, $7b, $c1, $01        ;; 0c:7b2e ????????
    db   $0d, $b6, $c5, $c0, $ca, $06, $1f, $02        ;; 0c:7b36 ????????
    db   $4e, $7b, $00, $35, $0c, $35, $11, $7f        ;; 0c:7b3e ????????
    db   $1f, $0b, $bf, $18, $0c, $02, $73, $7b        ;; 0c:7b46 ????????
    db   $c1, $02, $0d, $b6, $c5, $c0, $ca, $06        ;; 0c:7b4e ????????
    db   $1f, $02, $68, $7b, $00, $36, $0c, $36        ;; 0c:7b56 ????????
    db   $11, $7f, $1f, $0b, $bf, $19, $0c, $02        ;; 0c:7b5e ????????
    db   $73, $7b, $00, $37, $0c, $37, $11, $7f        ;; 0c:7b66 ????????
    db   $1f, $0b, $bf, $1a, $0c, $0b, $bf, $1b        ;; 0c:7b6e ????????
    db   $0d, $05, $7b, $73, $05, $9c, $7c, $0b        ;; 0c:7b76 ????????
    db   $bf, $16, $0c, $00, $7f, $0c, $b6, $c5        ;; 0c:7b7e ????????
    db   $30, $ca, $04, $c1, $05, $1f, $c1, $00        ;; 0c:7b86 ????????
    db   $0d, $b6, $c5, $c0, $ca, $06, $1f, $02        ;; 0c:7b8e ????????
    db   $b2, $7b, $c1, $ff, $0d, $34, $03, $7f        ;; 0c:7b96 ????????
    db   $1f, $00, $7f, $cc, $00, $1f, $00, $34        ;; 0c:7b9e ????????
    db   $0c, $34, $03, $7f, $1f, $0b, $bf, $17        ;; 0c:7ba6 ????????
    db   $0c, $02, $c9, $7b, $c1, $ff, $0d, $35        ;; 0c:7bae ????????
    db   $03, $7f, $1f, $00, $7f, $cc, $00, $1f        ;; 0c:7bb6 ????????
    db   $00, $35, $0c, $35, $03, $7f, $1f, $0b        ;; 0c:7bbe ????????
    db   $bf, $18, $0c, $0b, $bf, $1c, $0d             ;; 0c:7bc6 ???????

data_0c_7bcd:
    db   $01, $9b, $cc, $20, $1f, $06, $01, $69        ;; 0c:7bcd .p.....p
    db   $d0, $05, $1f, $06, $0b, $69, $05, $05        ;; 0c:7bd5 ....????
    db   $44, $7d, $0b, $bf, $3e, $0d, $05, $2c        ;; 0c:7bdd ????????
    db   $74, $01, $68, $0d, $69, $1f, $06, $01        ;; 0c:7be5 ????????
    db   $6f, $cf, $4a, $1f, $02, $fc, $7b, $01        ;; 0c:7bed ????????
    db   $6f, $cd, $64, $1f, $02, $33, $7c, $c0        ;; 0c:7bf5 ????????
    db   $8e, $d8, $0c, $31, $1f, $20, $c0, $0c        ;; 0c:7bfd ????????
    db   $34, $03, $b6, $1f, $20, $85, $33, $8e        ;; 0c:7c05 ????????
    db   $d8, $1f, $20, $c0, $2c, $c0, $31, $85        ;; 0c:7c0d ????????
    db   $1f, $c1, $00, $2d, $c0, $1f, $02, $21        ;; 0c:7c15 ????????
    db   $7c, $02, $af, $50, $20, $f5, $2c, $c0        ;; 0c:7c1d ????????
    db   $1f, $05, $b5, $73, $0b, $bd, $00, $03        ;; 0c:7c25 ????????
    db   $7f, $6b, $0b, $df, $ff, $06, $05, $b5        ;; 0c:7c2d ????????
    db   $73, $0b, $bd, $00, $03, $7f, $6b, $05        ;; 0c:7c35 ????????
    db   $26, $45, $05, $56, $7c, $01, $6f, $d0        ;; 0c:7c3d ????????
    db   $59, $1f, $02, $50, $7c, $05, $23, $79        ;; 0c:7c45 ????????
    db   $02, $53, $7c, $05, $23, $7a, $0b, $df        ;; 0c:7c4d ????????
    db   $ff, $00, $85, $0c, $d6, $1f, $00, $d6        ;; 0c:7c55 ????????
    db   $0c, $d8, $1f, $00, $d8, $0c, $85, $1f        ;; 0c:7c5d ????????
    db   $05, $cd, $48, $20, $85, $2c, $01, $1f        ;; 0c:7c65 ????????
    db   $20, $01, $2c, $03, $1f, $20, $03, $2c        ;; 0c:7c6d ????????
    db   $85, $1f, $00, $f8, $0c, $d6, $1f, $00        ;; 0c:7c75 ????????
    db   $f9, $0c, $d8, $1f, $06                       ;; 0c:7c7d ?????

data_0c_7c82:
    db   $c1, $00, $0c, $9a, $c5, $40, $1f, $06        ;; 0c:7c82 ...p....
    db   $c1, $00, $0c, $9c, $c5, $c0, $1f, $20        ;; 0c:7c8a ????????
    db   $f5, $2c, $c0, $1f, $2b, $c0, $00, $02        ;; 0c:7c92 ????????
    db   $b1, $73                                      ;; 0c:7c9a ??

data_0c_7c9c:
    db   $05                                           ;; 0c:7c9c .
    dw   data_0c_6b8d                                  ;; 0c:7c9d pP
    db   $03                                           ;; 0c:7c9f .
    dw   data_0c_6b7f                                  ;; 0c:7ca0 pP
    db   $06, $06, $01, $f7, $cd, $ff, $1f, $00        ;; 0c:7ca2 .???????
    db   $f9, $0c, $f7, $1f, $0b, $bf, $16, $0c        ;; 0c:7caa ????????
    db   $02, $c5, $7c                                 ;; 0c:7cb2 ???

data_0c_7cb5:
    db   $01, $f7, $cd, $ff, $1f, $00, $f9, $0c        ;; 0c:7cb5 .p....?.
    db   $f7, $1f, $0b, $bf, $3a, $05                  ;; 0c:7cbd ?...w.
    dw   data_0c_5f1f                                  ;; 0c:7cc3 pP
    db   $00, $f9, $0c, $d8, $1f, $06                  ;; 0c:7cc5 ...p..

data_0c_7ccb:
    db   $0b, $85, $00, $01, $d6, $d0, $05, $1f        ;; 0c:7ccb ....p...
    db   $02                                           ;; 0c:7cd3 .
    dw   .data_0c_7ce1                                 ;; 0c:7cd4 pP
    db   $01, $d8, $cd, $05, $1f, $00, $85, $cc        ;; 0c:7cd6 .p....?.
    db   $ff, $1f, $06                                 ;; 0c:7cde ?..
.data_0c_7ce1:
    db   $01, $d8, $d0, $05, $1f, $02, $db, $7c        ;; 0c:7ce1 .p....??
    db   $06, $94, $6b, $98, $6b, $c4, $6b             ;; 0c:7ce9 .??????
    dw   data_0c_6bde                                  ;; 0c:7cf0 pP
    db   $24, $6c                                      ;; 0c:7cf2 ??
    dw   data_0c_6c56                                  ;; 0c:7cf4 pP
    db   $56, $6c, $a6, $6c, $56, $6c, $fa, $6c        ;; 0c:7cf6 ????????
    db   $40, $6d, $40, $6d, $40, $6d, $8e, $6d        ;; 0c:7cfe ????????
    db   $af, $6d, $d9, $6d, $eb, $6d, $14, $6e        ;; 0c:7d06 ????????
    db   $7c, $6e                                      ;; 0c:7d0e ??
    dw   data_0c_6e99                                  ;; 0c:7d10 pP
    db   $99, $6e, $ed, $6e, $ab, $6f, $d7, $6f        ;; 0c:7d12 ????????
    db   $0d, $70, $a1, $70, $f6, $70, $24, $71        ;; 0c:7d1a ????????
    db   $86, $71, $f6, $71                            ;; 0c:7d22 ????
    dw   data_0c_7217                                  ;; 0c:7d26 pP
    db   $1b, $72, $1f, $72, $6c, $72, $0b, $73        ;; 0c:7d28 ????????
    db   $41, $7e, $41, $7e, $41, $7e, $1e, $73        ;; 0c:7d30 ????????

data_0c_7d38:
    db   $01, $d8, $13                                 ;; 0c:7d38 .p.
    dw   wD873                                         ;; 0c:7d3b pP
    db   $1f, $05                                      ;; 0c:7d3d ..
    dw   data_0c_73b9                                  ;; 0c:7d3f pP
    db   $02                                           ;; 0c:7d41 .
    dw   data_0c_742c                                  ;; 0c:7d42 pP

data_0c_7d44:
    db   $20, $c0, $2c, $c0, $23, $c0, $1f, $06        ;; 0c:7d44 ........
    db   $20, $c0, $2c, $c0, $c1, $03, $ca, $01        ;; 0c:7d4c ????????
    db   $1f, $06                                      ;; 0c:7d54 ??

data_0c_7d56:
    db   $4c, $2c, $05                                 ;; 0c:7d56 ...
    dw   data_0c_777c                                  ;; 0c:7d59 pP
    db   $02                                           ;; 0c:7d5b .
    dw   data_0c_75b6                                  ;; 0c:7d5c pP

data_0c_7d5e:
    db   $05                                           ;; 0c:7d5e .
    dw   data_0c_733d                                  ;; 0c:7d5f pP
    db   $02                                           ;; 0c:7d61 .
    dw   data_0c_742c                                  ;; 0c:7d62 pP
    db   $01, $d8, $13, $73, $d8, $1f, $02, $f0        ;; 0c:7d64 ????????
    db   $73, $06, $01, $b3, $cc, $00, $1f, $00        ;; 0c:7d6c ????????
    db   $68, $0c, $91, $c3, $3c, $c2, $02, $1f        ;; 0c:7d74 ????????
    db   $01, $b3, $cc, $01, $1f, $00, $68, $0c        ;; 0c:7d7c ????????
    db   $91, $c3, $46, $c2, $02, $1f, $01, $b3        ;; 0c:7d84 ????????
    db   $cc, $02, $1f, $00, $68, $0c, $91, $c3        ;; 0c:7d8c ????????
    db   $50, $c2, $02, $1f, $06, $01, $b3, $cc        ;; 0c:7d94 ????????
    db   $00, $1f, $00, $68, $0c, $91, $03, $32        ;; 0c:7d9c ????????
    db   $c3, $3c, $c2, $03, $1f, $01, $b3, $cc        ;; 0c:7da4 ????????
    db   $01, $1f, $00, $68, $0c, $91, $03, $32        ;; 0c:7dac ????????
    db   $c3, $46, $c2, $03, $1f, $01, $b3, $cc        ;; 0c:7db4 ????????
    db   $02, $1f, $00, $68, $0c, $91, $03, $32        ;; 0c:7dbc ????????
    db   $c3, $50, $c2, $03, $1f, $06, $01, $b3        ;; 0c:7dc4 ????????
    db   $cc, $00, $1f, $00, $68, $cc, $3c, $1f        ;; 0c:7dcc ????????
    db   $01, $b3, $cc, $01, $1f, $00, $68, $cc        ;; 0c:7dd4 ????????
    db   $46, $1f, $01, $b3, $cc, $02, $1f, $00        ;; 0c:7ddc ????????
    db   $68, $cc, $50, $1f, $06, $01, $b3, $cc        ;; 0c:7de4 ????????
    db   $00, $1f, $00, $68, $0c, $91, $03, $33        ;; 0c:7dec ????????
    db   $c3, $3c, $c2, $03, $1f, $01, $b3, $cc        ;; 0c:7df4 ????????
    db   $01, $1f, $00, $68, $0c, $91, $03, $33        ;; 0c:7dfc ????????
    db   $c3, $46, $c2, $03, $1f, $01, $b3, $cc        ;; 0c:7e04 ????????
    db   $02, $1f, $00, $68, $0c, $91, $03, $33        ;; 0c:7e0c ????????
    db   $c3, $50, $c2, $03, $1f, $06                  ;; 0c:7e14 ??????

data_0c_7e1a:
    db   $0b, $bf, $3c, $02                            ;; 0c:7e1a ..w.
    dw   data_0c_5f1f                                  ;; 0c:7e1e pP
    db   $0b, $bf, $3b, $02, $1f, $5f                  ;; 0c:7e20 ??????

data_0c_7e26:
    db   $00, $85, $13                                 ;; 0c:7e26 ...
    dw   wD873                                         ;; 0c:7e29 pP
    db   $1f, $06, $00, $68, $0c, $68, $ca, $01        ;; 0c:7e2b ..??????
    db   $1f, $06, $21, $3e, $7e, $11, $85, $c9        ;; 0c:7e33 ????????
    db   $c3, $8d, $1f, $0f, $42, $3f, $06, $20        ;; 0c:7e3b ????????
    db   $ca, $0c, $da, $cb, $01, $e3, $53, $7e        ;; 0c:7e43 ????????
    db   $1f, $20, $ca, $8c, $ca, $1f, $0a, $ca        ;; 0c:7e4b ????????
    db   $5d, $7e, $7f, $7e, $f5, $7e, $18, $7f        ;; 0c:7e53 ????????
    db   $32, $7f, $01, $80, $cc, $02, $1f, $02        ;; 0c:7e5b ????????
    db   $6e, $7e, $ab, $90, $d2, $60, $ab, $91        ;; 0c:7e63 ????????
    db   $d2, $ea, $06, $0b, $da, $01, $0b, $bf        ;; 0c:7e6b ????????
    db   $5d, $0c, $c0, $97, $d8, $ec, $08, $cf        ;; 0c:7e73 ????????
    db   $1f, $02, $65, $7e, $20, $85, $33, $97        ;; 0c:7e7b ????????
    db   $d8, $1f, $21, $20, $2f, $85, $1f, $02        ;; 0c:7e83 ????????
    db   $b3, $7e, $c1, $80, $13, $61, $d0, $c5        ;; 0c:7e8b ????????
    db   $80, $1f, $02, $65, $7e, $c0, $97, $d8        ;; 0c:7e93 ????????
    db   $33, $97, $d8, $e3, $e8, $03, $1f, $e1        ;; 0c:7e9b ????????
    db   $60, $ea, $33, $97, $d8, $1f, $c0, $97        ;; 0c:7ea3 ????????
    db   $d8, $ec, $78, $e6, $1f, $02, $65, $7e        ;; 0c:7eab ????????
    db   $0b, $da, $02, $0b, $bf, $5e, $0c, $ab        ;; 0c:7eb3 ????????
    db   $5c, $cc, $62, $ab, $00, $de, $12, $03        ;; 0c:7ebb ????????
    db   $71, $6b, $ab, $59, $cc, $c2, $ab, $5c        ;; 0c:7ec3 ????????
    db   $cc, $e3, $ab, $41, $cc, $02, $ab, $42        ;; 0c:7ecb ????????
    db   $cc, $00, $ab, $51, $cc, $f7, $0b, $1b        ;; 0c:7ed3 ????????
    db   $c2, $03, $4f, $6b, $0b, $9b, $00, $eb        ;; 0c:7edb ????????
    db   $e2, $d2, $00, $ab, $e0, $d2, $00, $0b        ;; 0c:7ee3 ????????
    db   $80, $01, $ab, $ba, $ff, $0e, $0b, $bf        ;; 0c:7eeb ????????
    db   $5f, $0d, $01, $80, $cc, $04, $1f, $02        ;; 0c:7ef3 ????????
    db   $fe, $7e, $06, $0b, $da, $03, $0b, $e9        ;; 0c:7efb ????????
    db   $ff, $ab, $e3, $c6, $08, $c1, $e4, $13        ;; 0c:7f03 ????????
    db   $fb, $c6, $1f, $a0, $fb, $c6, $cc, $d8        ;; 0c:7f0b ????????
    db   $1f, $0b, $bf, $60, $0c, $21, $20, $ee        ;; 0c:7f13 ????????
    db   $40, $1f, $1f, $06, $0b, $da, $04, $ab        ;; 0c:7f1b ????????
    db   $b9, $d2, $00, $ab, $bc, $ff, $30, $ab        ;; 0c:7f23 ????????
    db   $00, $de, $0f, $03, $71, $6b, $06, $06        ;; 0c:7f2b ????????

data_0c_7f33:
    db   $25, $20, $21, $22, $0b, $17, $0d, $01        ;; 0c:7f33 ????????
    db   $1b, $2c, $19, $09, $03, $05, $13, $11        ;; 0c:7f3b ????????
    db   $15, $07, $29, $1f, $2b, $0c, $2e, $00        ;; 0c:7f43 ????????
    db   $04, $08, $23, $26, $10, $16, $24, $02        ;; 0c:7f4b ????????
    db   $0a, $27, $12, $18, $28, $06, $0e, $2a        ;; 0c:7f53 ????????
    db   $14, $1a, $2d, $1c, $0f, $1e, $2f, $1d        ;; 0c:7f5b ????????
    db   $fa, $2f, $ca, $fe, $80, $c0, $21, $40        ;; 0c:7f63 ????????
    db   $c5, $06, $04, $7e, $fe, $3c, $28, $07        ;; 0c:7f6b ????????
    db   $3e, $60, $c7, $05, $20, $f5, $c9, $35        ;; 0c:7f73 ????????
    db   $ea, $26, $ce, $3e, $04, $90, $ea, $36        ;; 0c:7f7b ????????
    db   $cd, $3e, $01, $ea, $25, $ce, $df, $a8        ;; 0c:7f83 ????????
    db   $af, $ea, $25, $ce, $3e, $3b, $ea, $26        ;; 0c:7f8b ????????
    db   $ce, $ea, $91, $ce, $df, $a8, $df, $0e        ;; 0c:7f93 ????????
    db   $df, $18, $c9, $11, $05, $00, $19, $cd        ;; 0c:7f9b ????????
    db   $a9, $7f, $11, $fe, $ff, $19, $78, $86        ;; 0c:7fa3 ????????
    db   $22, $3e, $00, $8e, $32, $c9                  ;; 0c:7fab ??????
