;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank0f", ROMX[$4000], BANK[$0f]

;@code
; Unused in FFL3, but this is the main entry point in FFL2.
runSoundEngine:
    jr   runSoundEngineReal                            ;; 0f:4000 $18 $04
    db   $00                                           ;; 0f:4002 ?

;@code
; Unused in FFL3, but this is the init entry point in FFL2.
; As far as I can tell, FFL3 actually doesn't bother initing the engine at all.
initSoundEngine:
    jr   initSoundEngineReal                           ;; 0f:4003 $18 $2c
    db   $00                                           ;; 0f:4005 ?

runSoundEngineReal:
    push AF                                            ;; 0f:4006 $f5
    push BC                                            ;; 0f:4007 $c5
    push DE                                            ;; 0f:4008 $d5
    push HL                                            ;; 0f:4009 $e5
    ld   A, [wSoundEffectDurationChannel1]             ;; 0f:400a $fa $1c $cb
    ld   C, A                                          ;; 0f:400d $4f
    ld   A, [wSoundEffectDurationChannel4]             ;; 0f:400e $fa $4c $cb
    or   A, C                                          ;; 0f:4011 $b1
    jr   NZ, .startSoundEffect                         ;; 0f:4012 $20 $08
    ld   HL, hCurrentMusic                             ;; 0f:4014 $21 $ba $ff
    ld   A, [HL+]                                      ;; 0f:4017 $2a
    cp   A, [HL]                                       ;; 0f:4018 $be
    call NZ, musicSongInit                             ;; 0f:4019 $c4 $2d $40
.startSoundEffect:
    ldh  A, [hSFX]                                     ;; 0f:401c $f0 $bc
    or   A, A                                          ;; 0f:401e $b7
    call NZ, soundEffectPlay                           ;; 0f:401f $c4 $59 $47
    call musicPlayStep                                 ;; 0f:4022 $cd $ce $41
    call soundEffectPlayStep                           ;; 0f:4025 $cd $8e $47
    pop  HL                                            ;; 0f:4028 $e1
    pop  DE                                            ;; 0f:4029 $d1
    pop  BC                                            ;; 0f:402a $c1
    pop  AF                                            ;; 0f:402b $f1
    ret                                                ;; 0f:402c $c9

musicSongInit:
    ld   [HL], A                                       ;; 0f:402d $77
    or   A, A                                          ;; 0f:402e $b7
    jr   NZ, musicSongPlay                             ;; 0f:402f $20 $34

initSoundEngineReal:
    ld   A, $ff                                        ;; 0f:4031 $3e $ff
    ldh  [rNR52], A                                    ;; 0f:4033 $e0 $26
    ld   A, $08                                        ;; 0f:4035 $3e $08
    ldh  [rNR12], A                                    ;; 0f:4037 $e0 $12
    ldh  [rNR22], A                                    ;; 0f:4039 $e0 $17
    ldh  [rNR32], A                                    ;; 0f:403b $e0 $1c
    call muteSoundEngine                               ;; 0f:403d $cd $b9 $40
    ld   A, $77                                        ;; 0f:4040 $3e $77
    ldh  [rNR50], A                                    ;; 0f:4042 $e0 $24
    ld   A, $ff                                        ;; 0f:4044 $3e $ff
    ldh  [rNR51], A                                    ;; 0f:4046 $e0 $25
    ld   [wCB05], A                                    ;; 0f:4048 $ea $05 $cb
    ld   [wCB1D], A                                    ;; 0f:404b $ea $1d $cb
    ld   [wCB35], A                                    ;; 0f:404e $ea $35 $cb
    ld   [wCB4D], A                                    ;; 0f:4051 $ea $4d $cb
    xor  A, A                                          ;; 0f:4054 $af
    ld   [wSoundEffectDurationChannel1], A             ;; 0f:4055 $ea $1c $cb
    ld   [wMusicTempo], A                              ;; 0f:4058 $ea $01 $cb
    ld   HL, hCurrentMusic                             ;; 0f:405b $21 $ba $ff
    ld   C, $10                                        ;; 0f:405e $0e $10
.loop:
    ld   [HL+], A                                      ;; 0f:4060 $22
    dec  C                                             ;; 0f:4061 $0d
    jr   NZ, .loop                                     ;; 0f:4062 $20 $fc
    ret                                                ;; 0f:4064 $c9

musicSongPlay:
    dec  A                                             ;; 0f:4065 $3d
    cp   A, $14                                        ;; 0f:4066 $fe $14
    ret  NC                                            ;; 0f:4068 $d0
    add  A, A                                          ;; 0f:4069 $87
    add  A, A                                          ;; 0f:406a $87
    add  A, A                                          ;; 0f:406b $87
    ld   HL, musicSongChannelPointers                  ;; 0f:406c $21 $2f $48
    ld   E, A                                          ;; 0f:406f $5f
    ld   D, $00                                        ;; 0f:4070 $16 $00
    add  HL, DE                                        ;; 0f:4072 $19
    ld   A, [HL+]                                      ;; 0f:4073 $2a
    ld   [wMusicInstructionPointerChannel2], A         ;; 0f:4074 $ea $09 $cb
    ld   A, [HL+]                                      ;; 0f:4077 $2a
    ld   [wMusicInstructionPointerChannel2.high], A    ;; 0f:4078 $ea $0a $cb
    ld   A, [HL+]                                      ;; 0f:407b $2a
    ld   [wMusicInstructionPointerChannel1], A         ;; 0f:407c $ea $21 $cb
    ld   A, [HL+]                                      ;; 0f:407f $2a
    ld   [wMusicInstructionPointerChannel1.high], A    ;; 0f:4080 $ea $22 $cb
    ld   A, [HL+]                                      ;; 0f:4083 $2a
    ld   [wMusicInstructionPointerChannel3], A         ;; 0f:4084 $ea $39 $cb
    ld   A, [HL+]                                      ;; 0f:4087 $2a
    ld   [wMusicInstructionPointerChannel3.high], A    ;; 0f:4088 $ea $3a $cb
    ld   A, [HL+]                                      ;; 0f:408b $2a
    ld   [wMusicInstructionPointerChannel4], A         ;; 0f:408c $ea $51 $cb
    ld   A, [HL]                                       ;; 0f:408f $7e
    ld   [wMusicInstructionPointerChannel4.high], A    ;; 0f:4090 $ea $52 $cb
    ld   HL, wMusicTempoTimeCounter                    ;; 0f:4093 $21 $00 $cb
    ld   A, $ff                                        ;; 0f:4096 $3e $ff
    ld   [HL+], A                                      ;; 0f:4098 $22
    ld   A, $3c                                        ;; 0f:4099 $3e $3c
    ld   [HL+], A                                      ;; 0f:409b $22
    ld   HL, wMusicLoopCounter1Channel2                ;; 0f:409c $21 $02 $cb
    call musicInitChannel                              ;; 0f:409f $cd $b1 $40
    ld   HL, wMusicLoopCounter1Channel1                ;; 0f:40a2 $21 $1a $cb
    call musicInitChannel                              ;; 0f:40a5 $cd $b1 $40
    ld   HL, wMusicLoopCounter1Channel3                ;; 0f:40a8 $21 $32 $cb
    call musicInitChannel                              ;; 0f:40ab $cd $b1 $40
    ld   HL, wMusicLoopCounter1Channel4                ;; 0f:40ae $21 $4a $cb

musicInitChannel:
    xor  A, A                                          ;; 0f:40b1 $af
    ld   [HL+], A                                      ;; 0f:40b2 $22
    ld   [HL+], A                                      ;; 0f:40b3 $22
    ld   [HL+], A                                      ;; 0f:40b4 $22
    ld   [HL+], A                                      ;; 0f:40b5 $22
    inc  A                                             ;; 0f:40b6 $3c
    ld   [HL], A                                       ;; 0f:40b7 $77
    ret                                                ;; 0f:40b8 $c9

muteSoundEngine:
    xor  A, A                                          ;; 0f:40b9 $af
    ld   [wCB66], A                                    ;; 0f:40ba $ea $66 $cb
    ld   [wCB67], A                                    ;; 0f:40bd $ea $67 $cb
    ldh  [rNR10], A                                    ;; 0f:40c0 $e0 $10
    ld   A, $ff                                        ;; 0f:40c2 $3e $ff
    ldh  [rNR13], A                                    ;; 0f:40c4 $e0 $13
    ldh  [rNR23], A                                    ;; 0f:40c6 $e0 $18
    ldh  [rNR31], A                                    ;; 0f:40c8 $e0 $1b
    ldh  [rNR33], A                                    ;; 0f:40ca $e0 $1d
    ld   A, $07                                        ;; 0f:40cc $3e $07
    ldh  [rNR14], A                                    ;; 0f:40ce $e0 $14
    ldh  [rNR24], A                                    ;; 0f:40d0 $e0 $19
    ldh  [rNR34], A                                    ;; 0f:40d2 $e0 $1e
    ld   A, $00                                        ;; 0f:40d4 $3e $00
    ldh  [rNR42], A                                    ;; 0f:40d6 $e0 $21
    ld   A, $80                                        ;; 0f:40d8 $3e $80
    ldh  [rNR44], A                                    ;; 0f:40da $e0 $23
    ret                                                ;; 0f:40dc $c9

soundEffectRestoreChannel1:
    xor  A, A                                          ;; 0f:40dd $af
    ldh  [rNR10], A                                    ;; 0f:40de $e0 $10
    ld   A, [wMusicNR11DutyCycleChannel1]              ;; 0f:40e0 $fa $30 $cb
    ldh  [rNR11], A                                    ;; 0f:40e3 $e0 $11
    ld   A, $00                                        ;; 0f:40e5 $3e $00
    ldh  [rNR12], A                                    ;; 0f:40e7 $e0 $12
    ld   A, $ff                                        ;; 0f:40e9 $3e $ff
    ldh  [rNR13], A                                    ;; 0f:40eb $e0 $13
    ld   A, $87                                        ;; 0f:40ed $3e $87
    ldh  [rNR14], A                                    ;; 0f:40ef $e0 $14
    ld   A, [wMusicStereoPanChannel1]                  ;; 0f:40f1 $fa $31 $cb
    ld   E, A                                          ;; 0f:40f4 $5f
    ldh  A, [rNR51]                                    ;; 0f:40f5 $f0 $25
    and  A, $ee                                        ;; 0f:40f7 $e6 $ee
    or   A, E                                          ;; 0f:40f9 $b3
    ldh  [rNR51], A                                    ;; 0f:40fa $e0 $25
    ret                                                ;; 0f:40fc $c9

soundEffectMuteChannel4:
    ld   A, $08                                        ;; 0f:40fd $3e $08
    ldh  [rNR42], A                                    ;; 0f:40ff $e0 $21
    xor  A, A                                          ;; 0f:4101 $af
    ldh  [rNR43], A                                    ;; 0f:4102 $e0 $22
    ld   A, $80                                        ;; 0f:4104 $3e $80
    ldh  [rNR44], A                                    ;; 0f:4106 $e0 $23
    ld   A, [wCB61]                                    ;; 0f:4108 $fa $61 $cb
    ld   E, A                                          ;; 0f:410b $5f
    ldh  A, [rNR51]                                    ;; 0f:410c $f0 $25
    and  A, $77                                        ;; 0f:410e $e6 $77
    or   A, E                                          ;; 0f:4110 $b3
    ldh  [rNR51], A                                    ;; 0f:4111 $e0 $25
    ret                                                ;; 0f:4113 $c9

;@data format=wwwwwwwwwwww amount=7
musicNoteFrequencies:
    dw   $802c, $809d, $8107, $816b, $81c9, $8223, $8277, $82c7, $8312, $8358, $839b, $83da ;; 0f:4114 ????????wWwWwWwWwWwW??wW $00
    dw   $8416, $844e, $8483, $84b5, $84e5, $8511, $853b, $8563, $8589, $85ac, $85ce, $85ed ;; 0f:412c wWwWwW??wWw.wWwWw.wWwWw. $01
    dw   $860b, $8627, $8642, $865b, $8672, $8689, $869e, $86b2, $86c4, $86d6, $86e7, $86f7 ;; 0f:4144 wWwWwWwWwWwWwWwWwWwWwWwW $02
    dw   $8706, $8714, $8721, $872d, $8739, $8744, $874f, $8759, $8762, $876b, $8773, $877b ;; 0f:415c wWwWwWwWwWwWwWwWwWwWwWwW $03
    dw   $8783, $878a, $8790, $8797, $879d, $87a2, $87a7, $87ac, $87b1, $87b6, $87ba, $87be ;; 0f:4174 wWwWwWwWwWwWwWwWwWwW??w. $04
    dw   $87c1, $87c5, $87c8, $87cb, $87ce, $87d1, $87d4, $87d6, $87d9, $87db, $87dd, $87df ;; 0f:418c w.??w.?????????????????? $05
    dw   $87e1, $87e2, $87e4, $87e6, $87e7, $87e9, $87ea, $87eb, $87ec, $87ed, $87ee, $87ef ;; 0f:41a4 ???????????????????????? $06
    db   $f0, $87                                      ;; 0f:41bc ??

musicNoteDurations:
    db   $90, $60, $48, $30, $24, $20, $18, $12        ;; 0f:41be .....?..
    db   $10, $0c, $09, $08, $06, $04, $03, $02        ;; 0f:41c6 ?..?....

musicPlayStep:
    ld   HL, wMusicTempo                               ;; 0f:41ce $21 $01 $cb
    ld   A, [HL-]                                      ;; 0f:41d1 $3a
    add  A, [HL]                                       ;; 0f:41d2 $86
    ld   [HL], A                                       ;; 0f:41d3 $77
    jr   NC, .vibratoAndVolume                         ;; 0f:41d4 $30 $06
    call musicTempoPlayNotes                           ;; 0f:41d6 $cd $f9 $41
    call musicTempoPlayNotes                           ;; 0f:41d9 $cd $f9 $41
.vibratoAndVolume:
    ldh  A, [hVibratoVolumeChannelSelection]           ;; 0f:41dc $f0 $bd
    inc  A                                             ;; 0f:41de $3c
    cp   A, $03                                        ;; 0f:41df $fe $03
    jr   NZ, .vibratoAndVolumeSingleChannel            ;; 0f:41e1 $20 $01
    xor  A, A                                          ;; 0f:41e3 $af
.vibratoAndVolumeSingleChannel:
    ldh  [hVibratoVolumeChannelSelection], A           ;; 0f:41e4 $e0 $bd
    or   A, A                                          ;; 0f:41e6 $b7
    call Z, musicVibratoAndVolumeChannel2              ;; 0f:41e7 $cc $25 $46
    ldh  A, [hVibratoVolumeChannelSelection]           ;; 0f:41ea $f0 $bd
    cp   A, $01                                        ;; 0f:41ec $fe $01
    call Z, musicVibratoAndVolumeChannel1              ;; 0f:41ee $cc $7d $46
    ldh  A, [hVibratoVolumeChannelSelection]           ;; 0f:41f1 $f0 $bd
    cp   A, $02                                        ;; 0f:41f3 $fe $02
    call Z, musicVibratoAndVolumeChannel3              ;; 0f:41f5 $cc $db $46
    ret                                                ;; 0f:41f8 $c9

musicTempoPlayNotes:
    ld   HL, wCB05                                     ;; 0f:41f9 $21 $05 $cb
    ld   A, [HL+]                                      ;; 0f:41fc $2a
    inc  A                                             ;; 0f:41fd $3c
    jr   Z, musicTempoPlayNotes_Channel1               ;; 0f:41fe $28 $60
    dec  [HL]                                          ;; 0f:4200 $35
    ld   A, [HL]                                       ;; 0f:4201 $7e
    ldh  [hMusicNoteDurationChannel2Copy], A           ;; 0f:4202 $e0 $be
    jr   NZ, musicTempoPlayNotes_Channel1              ;; 0f:4204 $20 $5a
    ld   HL, wMusicInstructionPointerChannel2          ;; 0f:4206 $21 $09 $cb
    ld   A, [HL+]                                      ;; 0f:4209 $2a
    ld   D, [HL]                                       ;; 0f:420a $56
    ld   E, A                                          ;; 0f:420b $5f

data_0f_420c:
    ld   A, [DE]                                       ;; 0f:420c $1a
    inc  DE                                            ;; 0f:420d $13
    cp   A, $e0                                        ;; 0f:420e $fe $e0
    jr   C, .jr_0f_4224                                ;; 0f:4210 $38 $12
    cp   A, $ff                                        ;; 0f:4212 $fe $ff
    jp   NZ, jp_0f_43da                                ;; 0f:4214 $c2 $da $43
    ld   [wCB05], A                                    ;; 0f:4217 $ea $05 $cb
.jr_0f_421a:
    ld   A, $ff                                        ;; 0f:421a $3e $ff
    ldh  [rNR23], A                                    ;; 0f:421c $e0 $18
    ld   A, $07                                        ;; 0f:421e $3e $07
    ldh  [rNR24], A                                    ;; 0f:4220 $e0 $19
    jr   musicTempoPlayNotes_Channel1                  ;; 0f:4222 $18 $3c
.jr_0f_4224:
    ld   HL, wMusicInstructionPointerChannel2          ;; 0f:4224 $21 $09 $cb
    ld   [HL], E                                       ;; 0f:4227 $73
    inc  L                                             ;; 0f:4228 $2c
    ld   [HL], D                                       ;; 0f:4229 $72
    call musicGetNoteDuration                          ;; 0f:422a $cd $08 $44
    ld   HL, wCB06                                     ;; 0f:422d $21 $06 $cb
    ld   [HL+], A                                      ;; 0f:4230 $22
    ld   A, E                                          ;; 0f:4231 $7b
    and  A, $0f                                        ;; 0f:4232 $e6 $0f
    ld   [HL], A                                       ;; 0f:4234 $77
    cp   A, $0c                                        ;; 0f:4235 $fe $0c
    jr   Z, musicTempoPlayNotes_Channel1               ;; 0f:4237 $28 $27
    jr   NC, .jr_0f_421a                               ;; 0f:4239 $30 $df
    ld   HL, wCB08                                     ;; 0f:423b $21 $08 $cb
    call musicGetNoteFrequencyPointer                  ;; 0f:423e $cd $16 $44
    push HL                                            ;; 0f:4241 $e5
    ld   HL, wMusicVolumeEnvelopeChannel2              ;; 0f:4242 $21 $14 $cb
    ld   A, [HL+]                                      ;; 0f:4245 $2a
    ld   H, [HL]                                       ;; 0f:4246 $66
    ld   L, A                                          ;; 0f:4247 $6f
    inc  HL                                            ;; 0f:4248 $23
    ld   A, [HL]                                       ;; 0f:4249 $7e
    ldh  [rNR22], A                                    ;; 0f:424a $e0 $17
    pop  HL                                            ;; 0f:424c $e1
    ld   A, [HL+]                                      ;; 0f:424d $2a
    ld   C, [HL]                                       ;; 0f:424e $4e
    ld   HL, wCB0C                                     ;; 0f:424f $21 $0c $cb
    ldh  [rNR23], A                                    ;; 0f:4252 $e0 $18
    ld   [HL+], A                                      ;; 0f:4254 $22
    ld   A, C                                          ;; 0f:4255 $79
    ldh  [rNR24], A                                    ;; 0f:4256 $e0 $19
    ld   [HL+], A                                      ;; 0f:4258 $22
    call call_0f_439b                                  ;; 0f:4259 $cd $9b $43
    inc  L                                             ;; 0f:425c $2c
    call call_0f_439b                                  ;; 0f:425d $cd $9b $43

musicTempoPlayNotes_Channel1:
    ld   HL, wCB1D                                     ;; 0f:4260 $21 $1d $cb
    ld   A, [HL+]                                      ;; 0f:4263 $2a
    inc  A                                             ;; 0f:4264 $3c
    jr   Z, musicTempoPlayNotes_Channel3               ;; 0f:4265 $28 $6c
    dec  [HL]                                          ;; 0f:4267 $35
    ld   A, [HL]                                       ;; 0f:4268 $7e
    ldh  [hMusicNoteDurationChannel1Copy], A           ;; 0f:4269 $e0 $bf
    jr   NZ, musicTempoPlayNotes_Channel3              ;; 0f:426b $20 $66
    ld   HL, wMusicInstructionPointerChannel1          ;; 0f:426d $21 $21 $cb
    ld   A, [HL+]                                      ;; 0f:4270 $2a
    ld   D, [HL]                                       ;; 0f:4271 $56
    ld   E, A                                          ;; 0f:4272 $5f

data_0f_4273:
    ld   A, [DE]                                       ;; 0f:4273 $1a
    inc  DE                                            ;; 0f:4274 $13
    cp   A, $e0                                        ;; 0f:4275 $fe $e0
    jr   C, .jr_0f_428b                                ;; 0f:4277 $38 $12
    cp   A, $ff                                        ;; 0f:4279 $fe $ff
    jp   NZ, jp_0f_43c8                                ;; 0f:427b $c2 $c8 $43
    ld   [wCB1D], A                                    ;; 0f:427e $ea $1d $cb
.jr_0f_4281:
    ld   A, $ff                                        ;; 0f:4281 $3e $ff
    ldh  [rNR13], A                                    ;; 0f:4283 $e0 $13
    ld   A, $07                                        ;; 0f:4285 $3e $07
    ldh  [rNR14], A                                    ;; 0f:4287 $e0 $14
    jr   musicTempoPlayNotes_Channel3                  ;; 0f:4289 $18 $48
.jr_0f_428b:
    ld   HL, wMusicInstructionPointerChannel1          ;; 0f:428b $21 $21 $cb
    ld   [HL], E                                       ;; 0f:428e $73
    inc  L                                             ;; 0f:428f $2c
    ld   [HL], D                                       ;; 0f:4290 $72
    call musicGetNoteDuration                          ;; 0f:4291 $cd $08 $44
    ld   HL, wCB1E                                     ;; 0f:4294 $21 $1e $cb
    ld   [HL+], A                                      ;; 0f:4297 $22
    ld   A, E                                          ;; 0f:4298 $7b
    and  A, $0f                                        ;; 0f:4299 $e6 $0f
    ld   [HL], A                                       ;; 0f:429b $77
    ld   C, A                                          ;; 0f:429c $4f
    ld   A, [wSoundEffectDurationChannel1]             ;; 0f:429d $fa $1c $cb
    or   A, A                                          ;; 0f:42a0 $b7
    jr   NZ, musicTempoPlayNotes_Channel3              ;; 0f:42a1 $20 $30
    ld   A, C                                          ;; 0f:42a3 $79
    cp   A, $0c                                        ;; 0f:42a4 $fe $0c
    jr   Z, musicTempoPlayNotes_Channel3               ;; 0f:42a6 $28 $2b
    jr   NC, .jr_0f_4281                               ;; 0f:42a8 $30 $d7
    ld   HL, wCB20                                     ;; 0f:42aa $21 $20 $cb
    call musicGetNoteFrequencyPointer                  ;; 0f:42ad $cd $16 $44
    push HL                                            ;; 0f:42b0 $e5
    ld   HL, wMusicVolumeEnvelopeChannel1              ;; 0f:42b1 $21 $2c $cb
    ld   A, [HL+]                                      ;; 0f:42b4 $2a
    ld   H, [HL]                                       ;; 0f:42b5 $66
    ld   L, A                                          ;; 0f:42b6 $6f
    inc  HL                                            ;; 0f:42b7 $23
    ld   A, [HL]                                       ;; 0f:42b8 $7e
    ldh  [rNR12], A                                    ;; 0f:42b9 $e0 $12
    pop  HL                                            ;; 0f:42bb $e1
    ld   A, [HL+]                                      ;; 0f:42bc $2a
    ld   C, [HL]                                       ;; 0f:42bd $4e
    ld   HL, wCB24                                     ;; 0f:42be $21 $24 $cb
    ldh  [rNR13], A                                    ;; 0f:42c1 $e0 $13
    ld   [HL+], A                                      ;; 0f:42c3 $22
    ld   A, C                                          ;; 0f:42c4 $79
    ldh  [rNR14], A                                    ;; 0f:42c5 $e0 $14
    ld   [HL+], A                                      ;; 0f:42c7 $22
    call call_0f_439b                                  ;; 0f:42c8 $cd $9b $43
    inc  L                                             ;; 0f:42cb $2c
    call call_0f_439b                                  ;; 0f:42cc $cd $9b $43
    xor  A, A                                          ;; 0f:42cf $af
    ld   [wCB66], A                                    ;; 0f:42d0 $ea $66 $cb

musicTempoPlayNotes_Channel3:
    ld   HL, wCB35                                     ;; 0f:42d3 $21 $35 $cb
    ld   A, [HL+]                                      ;; 0f:42d6 $2a
    inc  A                                             ;; 0f:42d7 $3c
    jr   Z, musicTempoPlayNotes_Channel4               ;; 0f:42d8 $28 $5a
    dec  [HL]                                          ;; 0f:42da $35
    ld   A, [HL]                                       ;; 0f:42db $7e
    ldh  [hMusicNoteDurationChannel3Copy], A           ;; 0f:42dc $e0 $c0
    jr   NZ, musicTempoPlayNotes_Channel4              ;; 0f:42de $20 $54
    ld   HL, wMusicInstructionPointerChannel3          ;; 0f:42e0 $21 $39 $cb
    ld   A, [HL+]                                      ;; 0f:42e3 $2a
    ld   D, [HL]                                       ;; 0f:42e4 $56
    ld   E, A                                          ;; 0f:42e5 $5f

data_0f_42e6:
    ld   A, [DE]                                       ;; 0f:42e6 $1a
    inc  DE                                            ;; 0f:42e7 $13
    cp   A, $e0                                        ;; 0f:42e8 $fe $e0
    jr   C, .jr_0f_42fc                                ;; 0f:42ea $38 $10
    cp   A, $ff                                        ;; 0f:42ec $fe $ff
    jp   NZ, jp_0f_43b6                                ;; 0f:42ee $c2 $b6 $43
    ld   [wCB35], A                                    ;; 0f:42f1 $ea $35 $cb
    ldh  [rNR33], A                                    ;; 0f:42f4 $e0 $1d
    ld   A, $07                                        ;; 0f:42f6 $3e $07
    ldh  [rNR34], A                                    ;; 0f:42f8 $e0 $1e
    jr   musicTempoPlayNotes_Channel4                  ;; 0f:42fa $18 $38
.jr_0f_42fc:
    ld   HL, wMusicInstructionPointerChannel3          ;; 0f:42fc $21 $39 $cb
    ld   [HL], E                                       ;; 0f:42ff $73
    inc  L                                             ;; 0f:4300 $2c
    ld   [HL], D                                       ;; 0f:4301 $72
    call musicGetNoteDuration                          ;; 0f:4302 $cd $08 $44
    ld   HL, wCB36                                     ;; 0f:4305 $21 $36 $cb
    ld   [HL+], A                                      ;; 0f:4308 $22
    ld   A, E                                          ;; 0f:4309 $7b
    and  A, $0f                                        ;; 0f:430a $e6 $0f
    ld   [HL], A                                       ;; 0f:430c $77
    cp   A, $0c                                        ;; 0f:430d $fe $0c
    jr   C, .jr_0f_4318                                ;; 0f:430f $38 $07
    jr   Z, musicTempoPlayNotes_Channel4               ;; 0f:4311 $28 $21
    xor  A, A                                          ;; 0f:4313 $af
    ldh  [rNR32], A                                    ;; 0f:4314 $e0 $1c
    jr   musicTempoPlayNotes_Channel4                  ;; 0f:4316 $18 $1c
.jr_0f_4318:
    ld   HL, wCB38                                     ;; 0f:4318 $21 $38 $cb
    call musicGetNoteFrequencyPointer                  ;; 0f:431b $cd $16 $44
    ld   A, [HL+]                                      ;; 0f:431e $2a
    ld   B, [HL]                                       ;; 0f:431f $46
    ld   C, A                                          ;; 0f:4320 $4f
    ld   HL, wMusicVolumeChannel3                      ;; 0f:4321 $21 $3b $cb
    ld   A, [HL+]                                      ;; 0f:4324 $2a
    ldh  [rNR32], A                                    ;; 0f:4325 $e0 $1c
    ld   A, C                                          ;; 0f:4327 $79
    ldh  [rNR33], A                                    ;; 0f:4328 $e0 $1d
    ld   [HL+], A                                      ;; 0f:432a $22
    ld   A, B                                          ;; 0f:432b $78
    and  A, $07                                        ;; 0f:432c $e6 $07
    ldh  [rNR34], A                                    ;; 0f:432e $e0 $1e
    ld   [HL+], A                                      ;; 0f:4330 $22
    call call_0f_439b                                  ;; 0f:4331 $cd $9b $43

musicTempoPlayNotes_Channel4:
    ld   HL, wCB4D                                     ;; 0f:4334 $21 $4d $cb
    ld   A, [HL+]                                      ;; 0f:4337 $2a
    inc  A                                             ;; 0f:4338 $3c
    ret  Z                                             ;; 0f:4339 $c8
    dec  [HL]                                          ;; 0f:433a $35
    ld   A, [HL]                                       ;; 0f:433b $7e
    ldh  [hMusicNoteDurationChannel4Copy], A           ;; 0f:433c $e0 $c1
    ret  NZ                                            ;; 0f:433e $c0
    ld   HL, wMusicInstructionPointerChannel4          ;; 0f:433f $21 $51 $cb
    ld   A, [HL+]                                      ;; 0f:4342 $2a
    ld   D, [HL]                                       ;; 0f:4343 $56
    ld   E, A                                          ;; 0f:4344 $5f

data_0f_4345:
    ld   A, [DE]                                       ;; 0f:4345 $1a
    inc  DE                                            ;; 0f:4346 $13
    cp   A, $e0                                        ;; 0f:4347 $fe $e0
    jr   C, .jr_0f_435c                                ;; 0f:4349 $38 $11
    cp   A, $ff                                        ;; 0f:434b $fe $ff
    jr   NZ, jr_0f_43a4                                ;; 0f:434d $20 $55
    ld   [wCB4D], A                                    ;; 0f:434f $ea $4d $cb
.jr_0f_4352:
    xor  A, A                                          ;; 0f:4352 $af
    ldh  [rNR42], A                                    ;; 0f:4353 $e0 $21
    ldh  [rNR43], A                                    ;; 0f:4355 $e0 $22
    ld   A, $80                                        ;; 0f:4357 $3e $80
    ldh  [rNR44], A                                    ;; 0f:4359 $e0 $23
    ret                                                ;; 0f:435b $c9
.jr_0f_435c:
    ld   HL, wMusicInstructionPointerChannel4          ;; 0f:435c $21 $51 $cb
    ld   [HL], E                                       ;; 0f:435f $73
    inc  L                                             ;; 0f:4360 $2c
    ld   [HL], D                                       ;; 0f:4361 $72
    call musicGetNoteDuration                          ;; 0f:4362 $cd $08 $44
    ld   HL, wCB4E                                     ;; 0f:4365 $21 $4e $cb
    ld   [HL+], A                                      ;; 0f:4368 $22
    ld   A, E                                          ;; 0f:4369 $7b
    and  A, $0f                                        ;; 0f:436a $e6 $0f
    ld   [HL], A                                       ;; 0f:436c $77
    ld   E, A                                          ;; 0f:436d $5f
    ld   A, [wSoundEffectDurationChannel4]             ;; 0f:436e $fa $4c $cb
    or   A, A                                          ;; 0f:4371 $b7
    ret  NZ                                            ;; 0f:4372 $c0
    ld   A, E                                          ;; 0f:4373 $7b
    cp   A, $0c                                        ;; 0f:4374 $fe $0c
    ret  Z                                             ;; 0f:4376 $c8
    jr   NC, .jr_0f_4352                               ;; 0f:4377 $30 $d9
    ld   D, $00                                        ;; 0f:4379 $16 $00
    ld   HL, data_0f_4619                              ;; 0f:437b $21 $19 $46
    add  HL, DE                                        ;; 0f:437e $19
    ld   C, [HL]                                       ;; 0f:437f $4e
    ld   HL, wMusicVolumeEnvelopeChannel4              ;; 0f:4380 $21 $5c $cb
    ld   A, [HL+]                                      ;; 0f:4383 $2a
    ld   H, [HL]                                       ;; 0f:4384 $66
    ld   L, A                                          ;; 0f:4385 $6f
    inc  HL                                            ;; 0f:4386 $23
    ld   A, [HL]                                       ;; 0f:4387 $7e
    ldh  [rNR42], A                                    ;; 0f:4388 $e0 $21
    ld   A, C                                          ;; 0f:438a $79
    ldh  [rNR43], A                                    ;; 0f:438b $e0 $22
    ld   [wCB54], A                                    ;; 0f:438d $ea $54 $cb
    ld   A, $80                                        ;; 0f:4390 $3e $80
    ldh  [rNR44], A                                    ;; 0f:4392 $e0 $23
    xor  A, A                                          ;; 0f:4394 $af
    ld   [wCB67], A                                    ;; 0f:4395 $ea $67 $cb
    ld   HL, wCB5B                                     ;; 0f:4398 $21 $5b $cb

call_0f_439b:
    ld   A, $01                                        ;; 0f:439b $3e $01
    ld   [HL+], A                                      ;; 0f:439d $22
    ld   A, [HL+]                                      ;; 0f:439e $2a
    ld   E, [HL]                                       ;; 0f:439f $5e
    inc  L                                             ;; 0f:43a0 $2c
    ld   [HL+], A                                      ;; 0f:43a1 $22
    ld   [HL], E                                       ;; 0f:43a2 $73
    ret                                                ;; 0f:43a3 $c9

jr_0f_43a4:
    ld   HL, data_0f_4345                              ;; 0f:43a4 $21 $45 $43
    push HL                                            ;; 0f:43a7 $e5
    ld   HL, musicOpCodeTableChannel4                  ;; 0f:43a8 $21 $88 $44

jr_0f_43ab:
    and  A, $0f                                        ;; 0f:43ab $e6 $0f
    add  A, A                                          ;; 0f:43ad $87
    ld   C, A                                          ;; 0f:43ae $4f
    ld   B, $00                                        ;; 0f:43af $06 $00
    add  HL, BC                                        ;; 0f:43b1 $09
    ld   A, [HL+]                                      ;; 0f:43b2 $2a
    ld   H, [HL]                                       ;; 0f:43b3 $66
    ld   L, A                                          ;; 0f:43b4 $6f
    jp   HL                                            ;; 0f:43b5 $e9

jp_0f_43b6:
    ld   HL, data_0f_42e6                              ;; 0f:43b6 $21 $e6 $42
    push HL                                            ;; 0f:43b9 $e5
    cp   A, $f0                                        ;; 0f:43ba $fe $f0
    jr   C, .jr_0f_43c3                                ;; 0f:43bc $38 $05
    ld   HL, musicOpCodeTableChannel3                  ;; 0f:43be $21 $68 $44
    jr   jr_0f_43ab                                    ;; 0f:43c1 $18 $e8
.jr_0f_43c3:
    ld   BC, wCB38                                     ;; 0f:43c3 $01 $38 $cb
    jr   jr_0f_43ea                                    ;; 0f:43c6 $18 $22

jp_0f_43c8:
    ld   HL, data_0f_4273                              ;; 0f:43c8 $21 $73 $42
    push HL                                            ;; 0f:43cb $e5
    cp   A, $f0                                        ;; 0f:43cc $fe $f0
    jr   C, .jr_0f_43d5                                ;; 0f:43ce $38 $05
    ld   HL, musicOpCodeTableChannel1                  ;; 0f:43d0 $21 $48 $44
    jr   jr_0f_43ab                                    ;; 0f:43d3 $18 $d6
.jr_0f_43d5:
    ld   BC, wCB20                                     ;; 0f:43d5 $01 $20 $cb
    jr   jr_0f_43ea                                    ;; 0f:43d8 $18 $10

jp_0f_43da:
    ld   HL, data_0f_420c                              ;; 0f:43da $21 $0c $42
    push HL                                            ;; 0f:43dd $e5
    cp   A, $f0                                        ;; 0f:43de $fe $f0
    jr   C, .jr_0f_43e7                                ;; 0f:43e0 $38 $05
    ld   HL, musicOpCodeTableChannel2                  ;; 0f:43e2 $21 $28 $44
    jr   jr_0f_43ab                                    ;; 0f:43e5 $18 $c4
.jr_0f_43e7:
    ld   BC, wCB08                                     ;; 0f:43e7 $01 $08 $cb

jr_0f_43ea:
    push DE                                            ;; 0f:43ea $d5
    bit  3, A                                          ;; 0f:43eb $cb $5f
    jr   NZ, .jr_0f_43fa                               ;; 0f:43ed $20 $0b
    and  A, $07                                        ;; 0f:43ef $e6 $07
    add  A, A                                          ;; 0f:43f1 $87
    add  A, A                                          ;; 0f:43f2 $87
    add  A, A                                          ;; 0f:43f3 $87
    ld   E, A                                          ;; 0f:43f4 $5f
    add  A, A                                          ;; 0f:43f5 $87
    add  A, E                                          ;; 0f:43f6 $83
    ld   [BC], A                                       ;; 0f:43f7 $02
    pop  DE                                            ;; 0f:43f8 $d1
    ret                                                ;; 0f:43f9 $c9
.jr_0f_43fa:
    and  A, $07                                        ;; 0f:43fa $e6 $07
    ld   E, A                                          ;; 0f:43fc $5f
    ld   D, $00                                        ;; 0f:43fd $16 $00
    ld   HL, musicOctaveRelativeOffsets                ;; 0f:43ff $21 $20 $44
    add  HL, DE                                        ;; 0f:4402 $19
    ld   A, [BC]                                       ;; 0f:4403 $0a
    add  A, [HL]                                       ;; 0f:4404 $86
    ld   [BC], A                                       ;; 0f:4405 $02
    pop  DE                                            ;; 0f:4406 $d1
    ret                                                ;; 0f:4407 $c9

musicGetNoteDuration:
    ld   E, A                                          ;; 0f:4408 $5f
    swap E                                             ;; 0f:4409 $cb $33
    and  A, $0f                                        ;; 0f:440b $e6 $0f
    ld   C, A                                          ;; 0f:440d $4f
    ld   B, $00                                        ;; 0f:440e $06 $00
    ld   HL, musicNoteDurations                        ;; 0f:4410 $21 $be $41
    add  HL, BC                                        ;; 0f:4413 $09
    ld   A, [HL]                                       ;; 0f:4414 $7e
    ret                                                ;; 0f:4415 $c9

musicGetNoteFrequencyPointer:
    add  A, A                                          ;; 0f:4416 $87
    add  A, [HL]                                       ;; 0f:4417 $86
    ld   C, A                                          ;; 0f:4418 $4f
    ld   B, $00                                        ;; 0f:4419 $06 $00
    ld   HL, musicNoteFrequencies                      ;; 0f:441b $21 $14 $41
    add  HL, BC                                        ;; 0f:441e $09
    ret                                                ;; 0f:441f $c9

musicOctaveRelativeOffsets:
    db   $18, $30, $48, $60, $e8, $d0, $b8, $a0        ;; 0f:4420 ????????

;@jumptable amount=16
musicOpCodeTableChannel2:
    dw   musicOpCodeSetChannel2VolumeEnvelope          ;; 0f:4428 pP $00
    dw   musicOpCodeJump                               ;; 0f:442a pP $01
    dw   musicOpCodeChannel2LoopCounter1               ;; 0f:442c pP $02
    dw   musicOpCodeSetChannel2LoopCounter1            ;; 0f:442e pP $03
    dw   musicOpCodeSetChannel2VibratoEnvelope         ;; 0f:4430 ?? $04
    dw   musicChannel2SetDutyCycle                     ;; 0f:4432 ?? $05
    dw   musicOpCodeSetChannel2StereoPan               ;; 0f:4434 pP $06
    dw   musicOpCodeSetTempo                           ;; 0f:4436 pP $07
    dw   musicOpCodeHalt                               ;; 0f:4438 ?? $08
    dw   musicOpCodeChannel2LoopCounter2               ;; 0f:443a pP $09
    dw   musicOpCodeSetChannel2LoopCounter2            ;; 0f:443c pP $0a
    dw   musicOpCodeIfChannel2LoopCounter1Equal        ;; 0f:443e pP $0b
    dw   musicOpCodeSetDoubletimeMode                  ;; 0f:4440 ?? $0c
    dw   musicOpCodeHalt                               ;; 0f:4442 ?? $0d
    dw   musicOpCodeChannel2Init                       ;; 0f:4444 pP $0e
    dw   musicOpCodeHalt                               ;; 0f:4446 ?? $0f

;@jumptable amount=16
musicOpCodeTableChannel1:
    dw   musicOpCodeSetChannel1VolumeEnvelope          ;; 0f:4448 pP $00
    dw   musicOpCodeJump                               ;; 0f:444a pP $01
    dw   musicOpCodeChannel1LoopCounter1               ;; 0f:444c pP $02
    dw   musicOpCodeSetChannel1LoopCounter1            ;; 0f:444e pP $03
    dw   musicOpCodeSetChannel1VibratoEnvelope         ;; 0f:4450 ?? $04
    dw   musicChannel1SetDutyCycle                     ;; 0f:4452 ?? $05
    dw   musicOpCodeSetChannel1StereoPan               ;; 0f:4454 pP $06
    dw   musicOpCodeHalt                               ;; 0f:4456 ?? $07
    dw   musicOpCodeHalt                               ;; 0f:4458 ?? $08
    dw   musicOpCodeChannel1LoopCounter2               ;; 0f:445a pP $09
    dw   musicOpCodeSetChannel1LoopCounter2            ;; 0f:445c pP $0a
    dw   musicOpCodeIfChannel1LoopCounter1Equal        ;; 0f:445e pP $0b
    dw   musicOpCodeHalt                               ;; 0f:4460 ?? $0c
    dw   musicOpCodeHalt                               ;; 0f:4462 ?? $0d
    dw   musicOpCodeChannel1Init                       ;; 0f:4464 pP $0e
    dw   musicOpCodeHalt                               ;; 0f:4466 ?? $0f

;@jumptable amount=16
musicOpCodeTableChannel3:
    dw   musicOpCodeSetChannel3Volume                  ;; 0f:4468 ?? $00
    dw   musicOpCodeJump                               ;; 0f:446a pP $01
    dw   musicOpCodeChannel3LoopCounter1               ;; 0f:446c pP $02
    dw   musicOpCodeSetChannel3LoopCounter1            ;; 0f:446e pP $03
    dw   musicOpCodeSetChannel3VibratoEnvelope         ;; 0f:4470 ?? $04
    dw   musicOpCodeHalt                               ;; 0f:4472 ?? $05
    dw   musicOpCodeSetChannel3StereoPan               ;; 0f:4474 pP $06
    dw   musicOpCodeHalt                               ;; 0f:4476 ?? $07
    dw   musicOpCodeChannel3LoadWaveTable              ;; 0f:4478 ?? $08
    dw   musicOpCodeChannel3LoopCounter2               ;; 0f:447a pP $09
    dw   musicOpCodeSetChannel3LoopCounter2            ;; 0f:447c pP $0a
    dw   musicOpCodeIfChannel3LoopCounter1Equal        ;; 0f:447e pP $0b
    dw   musicOpCodeHalt                               ;; 0f:4480 ?? $0c
    dw   musicOpCodeHalt                               ;; 0f:4482 ?? $0d
    dw   musicOpCodeChannel3Init                       ;; 0f:4484 pP $0e
    dw   musicOpCodeHalt                               ;; 0f:4486 ?? $0f

;@jumptable amount=16
musicOpCodeTableChannel4:
    dw   musicOpCodeSetChannel4VolumeEnvelope          ;; 0f:4488 pP $00
    dw   musicOpCodeJump                               ;; 0f:448a pP $01
    dw   musicOpCodeChannel4LoopCounter1               ;; 0f:448c pP $02
    dw   musicOpCodeSetChannel4LoopCounter1            ;; 0f:448e pP $03
    dw   musicOpCodeHalt                               ;; 0f:4490 ?? $04
    dw   musicOpCodeHalt                               ;; 0f:4492 ?? $05
    dw   musicOpCodeSetChannel4StereoPan               ;; 0f:4494 pP $06
    dw   musicOpCodeHalt                               ;; 0f:4496 ?? $07
    dw   musicOpCodeHalt                               ;; 0f:4498 ?? $08
    dw   musicOpCodeChannel4LoopCounter2               ;; 0f:449a pP $09
    dw   musicOpCodeSetChannel4LoopCounter2            ;; 0f:449c pP $0a
    dw   musicOpCodeIfChannel4LoopCounter1Equal        ;; 0f:449e ?? $0b
    dw   musicOpCodeHalt                               ;; 0f:44a0 ?? $0c
    dw   musicOpCodeHalt                               ;; 0f:44a2 ?? $0d
    dw   musicOpCodeHalt                               ;; 0f:44a4 ?? $0e
    dw   musicOpCodeHalt                               ;; 0f:44a6 ?? $0f

musicOpCodeSetChannel3Volume:
    ld   A, [DE]                                       ;; 0f:44a8 $1a
    inc  DE                                            ;; 0f:44a9 $13
    ld   [wMusicVolumeChannel3], A                     ;; 0f:44aa $ea $3b $cb
    ldh  [rNR32], A                                    ;; 0f:44ad $e0 $1c
    ret                                                ;; 0f:44af $c9

musicOpCodeSetChannel2VolumeEnvelope:
    ld   HL, wMusicVolumeEnvelopeChannel2              ;; 0f:44b0 $21 $14 $cb
    jr   musicOpCode_SetEnvelope_Common                ;; 0f:44b3 $18 $17

musicOpCodeSetChannel1VolumeEnvelope:
    ld   HL, wMusicVolumeEnvelopeChannel1              ;; 0f:44b5 $21 $2c $cb
    jr   musicOpCode_SetEnvelope_Common                ;; 0f:44b8 $18 $12

musicOpCodeSetChannel4VolumeEnvelope:
    ld   HL, wMusicVolumeEnvelopeChannel4              ;; 0f:44ba $21 $5c $cb
    jr   musicOpCode_SetEnvelope_Common                ;; 0f:44bd $18 $0d

musicOpCodeSetChannel2VibratoEnvelope:
    ld   HL, wMusicVibratoEnvelopeChannel2             ;; 0f:44bf $21 $0f $cb
    jr   musicOpCode_SetEnvelope_Common                ;; 0f:44c2 $18 $08

musicOpCodeSetChannel1VibratoEnvelope:
    ld   HL, wMusicVibratoEnvelopeChannel1             ;; 0f:44c4 $21 $27 $cb
    jr   musicOpCode_SetEnvelope_Common                ;; 0f:44c7 $18 $03

musicOpCodeSetChannel3VibratoEnvelope:
    ld   HL, wMusicVibratoEnvelopeChannel3             ;; 0f:44c9 $21 $3f $cb

musicOpCode_SetEnvelope_Common:
    ld   A, [DE]                                       ;; 0f:44cc $1a
    inc  DE                                            ;; 0f:44cd $13
    ld   [HL+], A                                      ;; 0f:44ce $22
    ld   A, [DE]                                       ;; 0f:44cf $1a
    inc  DE                                            ;; 0f:44d0 $13
    ld   [HL], A                                       ;; 0f:44d1 $77
    ret                                                ;; 0f:44d2 $c9

musicOpCodeSetChannel2LoopCounter1:
    ld   A, [DE]                                       ;; 0f:44d3 $1a
    inc  DE                                            ;; 0f:44d4 $13
    ld   [wMusicLoopCounter1Channel2], A               ;; 0f:44d5 $ea $02 $cb
    ret                                                ;; 0f:44d8 $c9

musicOpCodeSetChannel1LoopCounter1:
    ld   A, [DE]                                       ;; 0f:44d9 $1a
    inc  DE                                            ;; 0f:44da $13
    ld   [wMusicLoopCounter1Channel1], A               ;; 0f:44db $ea $1a $cb
    ret                                                ;; 0f:44de $c9

musicOpCodeSetChannel3LoopCounter1:
    ld   A, [DE]                                       ;; 0f:44df $1a
    inc  DE                                            ;; 0f:44e0 $13
    ld   [wMusicLoopCounter1Channel3], A               ;; 0f:44e1 $ea $32 $cb
    ret                                                ;; 0f:44e4 $c9

musicOpCodeSetChannel4LoopCounter1:
    ld   A, [DE]                                       ;; 0f:44e5 $1a
    inc  DE                                            ;; 0f:44e6 $13
    ld   [wMusicLoopCounter1Channel4], A               ;; 0f:44e7 $ea $4a $cb
    ret                                                ;; 0f:44ea $c9

musicOpCodeSetChannel2LoopCounter2:
    ld   A, [DE]                                       ;; 0f:44eb $1a
    inc  DE                                            ;; 0f:44ec $13
    ld   [wMusicLoopCounter2Channel2], A               ;; 0f:44ed $ea $03 $cb
    ret                                                ;; 0f:44f0 $c9

musicOpCodeSetChannel1LoopCounter2:
    ld   A, [DE]                                       ;; 0f:44f1 $1a
    inc  DE                                            ;; 0f:44f2 $13
    ld   [wMusicLoopCounter2Channel1], A               ;; 0f:44f3 $ea $1b $cb
    ret                                                ;; 0f:44f6 $c9

musicOpCodeSetChannel3LoopCounter2:
    ld   A, [DE]                                       ;; 0f:44f7 $1a
    inc  DE                                            ;; 0f:44f8 $13
    ld   [wMusicLoopCounter2Channel3], A               ;; 0f:44f9 $ea $33 $cb
    ret                                                ;; 0f:44fc $c9

musicOpCodeSetChannel4LoopCounter2:
    ld   A, [DE]                                       ;; 0f:44fd $1a
    inc  DE                                            ;; 0f:44fe $13
    ld   [wMusicLoopCounter2Channel4], A               ;; 0f:44ff $ea $4b $cb
    ret                                                ;; 0f:4502 $c9

musicOpCodeChannel2LoopCounter1:
    ld   HL, wMusicLoopCounter1Channel2                ;; 0f:4503 $21 $02 $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:4506 $18 $21

musicOpCodeChannel1LoopCounter1:
    ld   HL, wMusicLoopCounter1Channel1                ;; 0f:4508 $21 $1a $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:450b $18 $1c

musicOpCodeChannel3LoopCounter1:
    ld   HL, wMusicLoopCounter1Channel3                ;; 0f:450d $21 $32 $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:4510 $18 $17

musicOpCodeChannel4LoopCounter1:
    ld   HL, wMusicLoopCounter1Channel4                ;; 0f:4512 $21 $4a $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:4515 $18 $12

musicOpCodeChannel2LoopCounter2:
    ld   HL, wMusicLoopCounter2Channel2                ;; 0f:4517 $21 $03 $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:451a $18 $0d

musicOpCodeChannel1LoopCounter2:
    ld   HL, wMusicLoopCounter2Channel1                ;; 0f:451c $21 $1b $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:451f $18 $08

musicOpCodeChannel3LoopCounter2:
    ld   HL, wMusicLoopCounter2Channel3                ;; 0f:4521 $21 $33 $cb
    jr   musicOpCode_JumpNotZero_Common                ;; 0f:4524 $18 $03

musicOpCodeChannel4LoopCounter2:
    ld   HL, wMusicLoopCounter2Channel4                ;; 0f:4526 $21 $4b $cb

musicOpCode_JumpNotZero_Common:
    dec  [HL]                                          ;; 0f:4529 $35
    jr   NZ, musicOpCodeJump                           ;; 0f:452a $20 $1c

musicOpCode_NoJump_Common:
    inc  DE                                            ;; 0f:452c $13
    inc  DE                                            ;; 0f:452d $13
    ret                                                ;; 0f:452e $c9

musicOpCodeIfChannel2LoopCounter1Equal:
    ld   HL, wMusicLoopCounter1Channel2                ;; 0f:452f $21 $02 $cb
    jr   musicOpCode_JumpNotEqual                      ;; 0f:4532 $18 $0f

musicOpCodeIfChannel1LoopCounter1Equal:
    ld   HL, wMusicLoopCounter1Channel1                ;; 0f:4534 $21 $1a $cb
    jr   musicOpCode_JumpNotEqual                      ;; 0f:4537 $18 $0a

musicOpCodeIfChannel3LoopCounter1Equal:
    ld   HL, wMusicLoopCounter1Channel3                ;; 0f:4539 $21 $32 $cb
    jr   musicOpCode_JumpNotEqual                      ;; 0f:453c $18 $05

musicOpCodeIfChannel4LoopCounter1Equal:
    ld   HL, wMusicLoopCounter1Channel4                ;; 0f:453e $21 $4a $cb
    jr   musicOpCode_JumpNotEqual                      ;; 0f:4541 $18 $00

musicOpCode_JumpNotEqual:
    ld   A, [DE]                                       ;; 0f:4543 $1a
    inc  DE                                            ;; 0f:4544 $13
    cp   A, [HL]                                       ;; 0f:4545 $be
    jr   NZ, musicOpCode_NoJump_Common                 ;; 0f:4546 $20 $e4

musicOpCodeJump:
    ld   L, E                                          ;; 0f:4548 $6b
    ld   H, D                                          ;; 0f:4549 $62
    ld   A, [HL+]                                      ;; 0f:454a $2a
    ld   D, [HL]                                       ;; 0f:454b $56
    ld   E, A                                          ;; 0f:454c $5f
    ret                                                ;; 0f:454d $c9

musicChannel2SetDutyCycle:
    ld   A, [DE]                                       ;; 0f:454e $1a
    inc  DE                                            ;; 0f:454f $13
    ldh  [rNR21], A                                    ;; 0f:4550 $e0 $16
    ld   [wMusicNR21DutyCycleChannel2], A              ;; 0f:4552 $ea $18 $cb
    ret                                                ;; 0f:4555 $c9

musicChannel1SetDutyCycle:
    ld   A, [DE]                                       ;; 0f:4556 $1a
    inc  DE                                            ;; 0f:4557 $13
    ld   [wMusicNR11DutyCycleChannel1], A              ;; 0f:4558 $ea $30 $cb
    ld   B, A                                          ;; 0f:455b $47
    ld   A, [wSoundEffectDurationChannel1]             ;; 0f:455c $fa $1c $cb
    or   A, A                                          ;; 0f:455f $b7
    ret  NZ                                            ;; 0f:4560 $c0
    ld   A, B                                          ;; 0f:4561 $78
    ldh  [rNR11], A                                    ;; 0f:4562 $e0 $11
    ret                                                ;; 0f:4564 $c9

musicOpCodeSetTempo:
    ld   A, [DE]                                       ;; 0f:4565 $1a
    inc  DE                                            ;; 0f:4566 $13
    ld   [wMusicTempo], A                              ;; 0f:4567 $ea $01 $cb
    ret                                                ;; 0f:456a $c9

musicOpCodeChannel3LoadWaveTable:
    ld   A, [DE]                                       ;; 0f:456b $1a
    inc  DE                                            ;; 0f:456c $13
    ld   C, A                                          ;; 0f:456d $4f
    ldh  [hWaveTablePointer], A                        ;; 0f:456e $e0 $c2
    ld   A, [DE]                                       ;; 0f:4570 $1a
    inc  DE                                            ;; 0f:4571 $13
    ldh  [hWaveTablePointer.high], A                   ;; 0f:4572 $e0 $c3
    ld   H, A                                          ;; 0f:4574 $67
    ld   L, C                                          ;; 0f:4575 $69
    xor  A, A                                          ;; 0f:4576 $af
    ldh  [rNR30], A                                    ;; 0f:4577 $e0 $1a
    ld   C, $30                                        ;; 0f:4579 $0e $30
    ld   B, $10                                        ;; 0f:457b $06 $10
.loop:
    ld   A, [HL+]                                      ;; 0f:457d $2a
    ldh  [C], A                                        ;; 0f:457e $e2
    inc  C                                             ;; 0f:457f $0c
    dec  B                                             ;; 0f:4580 $05
    jr   NZ, .loop                                     ;; 0f:4581 $20 $fa
    ld   A, $80                                        ;; 0f:4583 $3e $80
    ldh  [rNR30], A                                    ;; 0f:4585 $e0 $1a
    xor  A, A                                          ;; 0f:4587 $af
    ldh  [rNR32], A                                    ;; 0f:4588 $e0 $1c
    ld   A, $87                                        ;; 0f:458a $3e $87
    ldh  [rNR34], A                                    ;; 0f:458c $e0 $1e
    ret                                                ;; 0f:458e $c9

musicOpCodeChannel2Init:
    call musicOpCodeSetTempo                           ;; 0f:458f $cd $65 $45
    call musicOpCodeSetChannel2VibratoEnvelope         ;; 0f:4592 $cd $bf $44
    call musicOpCodeSetChannel2VolumeEnvelope          ;; 0f:4595 $cd $b0 $44
    call musicChannel2SetDutyCycle                     ;; 0f:4598 $cd $4e $45

musicOpCodeSetChannel2StereoPan:
    ld   A, [DE]                                       ;; 0f:459b $1a
    inc  DE                                            ;; 0f:459c $13
    ld   C, A                                          ;; 0f:459d $4f
    ld   B, $00                                        ;; 0f:459e $06 $00
    ld   HL, channel2StereoPanValues                   ;; 0f:45a0 $21 $03 $46
    add  HL, BC                                        ;; 0f:45a3 $09
    ldh  A, [rNR51]                                    ;; 0f:45a4 $f0 $25
    and  A, $dd                                        ;; 0f:45a6 $e6 $dd
    or   A, [HL]                                       ;; 0f:45a8 $b6
    ldh  [rNR51], A                                    ;; 0f:45a9 $e0 $25
    ret                                                ;; 0f:45ab $c9

musicOpCodeChannel1Init:
    call musicOpCodeSetChannel1VibratoEnvelope         ;; 0f:45ac $cd $c4 $44
    call musicOpCodeSetChannel1VolumeEnvelope          ;; 0f:45af $cd $b5 $44
    call musicChannel1SetDutyCycle                     ;; 0f:45b2 $cd $56 $45

musicOpCodeSetChannel1StereoPan:
    ld   A, [DE]                                       ;; 0f:45b5 $1a
    inc  DE                                            ;; 0f:45b6 $13
    ld   C, A                                          ;; 0f:45b7 $4f
    ld   B, $00                                        ;; 0f:45b8 $06 $00
    ld   HL, channel1StereoPanValues                   ;; 0f:45ba $21 $07 $46
    add  HL, BC                                        ;; 0f:45bd $09
    ld   A, [HL]                                       ;; 0f:45be $7e
    ld   [wMusicStereoPanChannel1], A                  ;; 0f:45bf $ea $31 $cb
    ld   A, [wSoundEffectDurationChannel1]             ;; 0f:45c2 $fa $1c $cb
    or   A, A                                          ;; 0f:45c5 $b7
    ret  NZ                                            ;; 0f:45c6 $c0
    ldh  A, [rNR51]                                    ;; 0f:45c7 $f0 $25
    and  A, $ee                                        ;; 0f:45c9 $e6 $ee
    or   A, [HL]                                       ;; 0f:45cb $b6
    ldh  [rNR51], A                                    ;; 0f:45cc $e0 $25
    ret                                                ;; 0f:45ce $c9

musicOpCodeChannel3Init:
    call musicOpCodeSetChannel3VibratoEnvelope         ;; 0f:45cf $cd $c9 $44
    call musicOpCodeSetChannel3Volume                  ;; 0f:45d2 $cd $a8 $44
    call musicOpCodeChannel3LoadWaveTable              ;; 0f:45d5 $cd $6b $45

musicOpCodeSetChannel3StereoPan:
    ld   A, [DE]                                       ;; 0f:45d8 $1a
    inc  DE                                            ;; 0f:45d9 $13
    ld   C, A                                          ;; 0f:45da $4f
    ld   B, $00                                        ;; 0f:45db $06 $00
    ld   HL, channel3StereoPanValues                   ;; 0f:45dd $21 $0b $46
    add  HL, BC                                        ;; 0f:45e0 $09
    ldh  A, [rNR51]                                    ;; 0f:45e1 $f0 $25
    and  A, $bb                                        ;; 0f:45e3 $e6 $bb
    or   A, [HL]                                       ;; 0f:45e5 $b6
    ldh  [rNR51], A                                    ;; 0f:45e6 $e0 $25
    ret                                                ;; 0f:45e8 $c9

musicOpCodeSetChannel4StereoPan:
    ld   A, [DE]                                       ;; 0f:45e9 $1a
    inc  DE                                            ;; 0f:45ea $13
    ld   C, A                                          ;; 0f:45eb $4f
    ld   B, $00                                        ;; 0f:45ec $06 $00
    ld   HL, channel4StereoPanValues                   ;; 0f:45ee $21 $0f $46
    add  HL, BC                                        ;; 0f:45f1 $09
    ld   A, [HL]                                       ;; 0f:45f2 $7e
    ld   [wCB61], A                                    ;; 0f:45f3 $ea $61 $cb
    ld   A, [wSoundEffectDurationChannel4]             ;; 0f:45f6 $fa $4c $cb
    or   A, A                                          ;; 0f:45f9 $b7
    ret  NZ                                            ;; 0f:45fa $c0
    ldh  A, [rNR51]                                    ;; 0f:45fb $f0 $25
    and  A, $77                                        ;; 0f:45fd $e6 $77
    or   A, [HL]                                       ;; 0f:45ff $b6
    ldh  [rNR51], A                                    ;; 0f:4600 $e0 $25
    ret                                                ;; 0f:4602 $c9

channel2StereoPanValues:
    db   $00, $02, $20, $22                            ;; 0f:4603 ????

channel1StereoPanValues:
    db   $00, $01, $10, $11                            ;; 0f:4607 ?...

channel3StereoPanValues:
    db   $00, $04, $40, $44                            ;; 0f:460b ????

channel4StereoPanValues:
    db   $00, $08, $80, $88                            ;; 0f:460f ?...

; Final Fantasy Adventure had a (non working) command to set or clear a "double-time" mode.
; This was gone in FFL2, which I think had a newer version of the sound engine.
; Now it's back but doing even less than it was before.
musicOpCodeSetDoubletimeMode:
    ld   A, [DE]                                       ;; 0f:4613 $1a
    inc  DE                                            ;; 0f:4614 $13
    ret                                                ;; 0f:4615 $c9

musicOpCodeHalt:
    jr   musicOpCodeHalt                               ;; 0f:4616 $18 $fe
    db   $c9                                           ;; 0f:4618 ?

data_0f_4619:
    db   $64, $59, $54, $2f, $44, $34, $2e, $24        ;; 0f:4619 ?????.?.
    db   $2d, $14, $1d, $04                            ;; 0f:4621 ?.?.

musicVibratoAndVolumeChannel2:
    ld   HL, wCB05                                     ;; 0f:4625 $21 $05 $cb
    ld   A, [HL+]                                      ;; 0f:4628 $2a
    or   A, A                                          ;; 0f:4629 $b7
    ret  NZ                                            ;; 0f:462a $c0
    ldh  A, [hMusicNoteDurationChannel2Copy]           ;; 0f:462b $f0 $be
    or   A, A                                          ;; 0f:462d $b7
    ret  Z                                             ;; 0f:462e $c8
    inc  L                                             ;; 0f:462f $2c
    ld   A, [HL]                                       ;; 0f:4630 $7e
    cp   A, $0d                                        ;; 0f:4631 $fe $0d
    ret  Z                                             ;; 0f:4633 $c8
    ld   HL, wCB0E                                     ;; 0f:4634 $21 $0e $cb
    dec  [HL]                                          ;; 0f:4637 $35
    jr   NZ, .jr_0f_465f                               ;; 0f:4638 $20 $25
    call call_0f_474b                                  ;; 0f:463a $cd $4b $47
    ld   [wCB0E], A                                    ;; 0f:463d $ea $0e $cb
    ld   A, [HL+]                                      ;; 0f:4640 $2a
    ld   E, A                                          ;; 0f:4641 $5f
    ld   D, $00                                        ;; 0f:4642 $16 $00
    ld   C, H                                          ;; 0f:4644 $4c
    ld   A, L                                          ;; 0f:4645 $7d
    ld   HL, wCB11                                     ;; 0f:4646 $21 $11 $cb
    ld   [HL+], A                                      ;; 0f:4649 $22
    ld   [HL], C                                       ;; 0f:464a $71
    bit  7, E                                          ;; 0f:464b $cb $7b
    jr   Z, .jr_0f_4650                                ;; 0f:464d $28 $01
    dec  D                                             ;; 0f:464f $15
.jr_0f_4650:
    ld   HL, wCB0C                                     ;; 0f:4650 $21 $0c $cb
    ld   A, [HL+]                                      ;; 0f:4653 $2a
    ld   H, [HL]                                       ;; 0f:4654 $66
    ld   L, A                                          ;; 0f:4655 $6f
    add  HL, DE                                        ;; 0f:4656 $19
    ld   A, L                                          ;; 0f:4657 $7d
    ldh  [rNR23], A                                    ;; 0f:4658 $e0 $18
    ld   A, H                                          ;; 0f:465a $7c
    and  A, $07                                        ;; 0f:465b $e6 $07
    ldh  [rNR24], A                                    ;; 0f:465d $e0 $19
.jr_0f_465f:
    ld   HL, wCB13                                     ;; 0f:465f $21 $13 $cb
    ld   A, [HL]                                       ;; 0f:4662 $7e
    inc  A                                             ;; 0f:4663 $3c
    ret  Z                                             ;; 0f:4664 $c8
    dec  [HL]                                          ;; 0f:4665 $35
    ret  NZ                                            ;; 0f:4666 $c0
    call call_0f_474b                                  ;; 0f:4667 $cd $4b $47
    ld   [wCB13], A                                    ;; 0f:466a $ea $13 $cb
    ld   A, [HL+]                                      ;; 0f:466d $2a
    ldh  [rNR22], A                                    ;; 0f:466e $e0 $17
    ld   A, [wCB0D]                                    ;; 0f:4670 $fa $0d $cb
    ldh  [rNR24], A                                    ;; 0f:4673 $e0 $19
    ld   C, H                                          ;; 0f:4675 $4c
    ld   A, L                                          ;; 0f:4676 $7d
    ld   HL, wCB16                                     ;; 0f:4677 $21 $16 $cb
    ld   [HL+], A                                      ;; 0f:467a $22
    ld   [HL], C                                       ;; 0f:467b $71
    ret                                                ;; 0f:467c $c9

musicVibratoAndVolumeChannel1:
    ld   HL, wSoundEffectDurationChannel1              ;; 0f:467d $21 $1c $cb
    ld   A, [HL+]                                      ;; 0f:4680 $2a
    or   A, [HL]                                       ;; 0f:4681 $b6
    ret  NZ                                            ;; 0f:4682 $c0
    ldh  A, [hMusicNoteDurationChannel1Copy]           ;; 0f:4683 $f0 $bf
    or   A, A                                          ;; 0f:4685 $b7
    ret  Z                                             ;; 0f:4686 $c8
    inc  L                                             ;; 0f:4687 $2c
    inc  L                                             ;; 0f:4688 $2c
    ld   A, [HL]                                       ;; 0f:4689 $7e
    cp   A, $0d                                        ;; 0f:468a $fe $0d
    ret  Z                                             ;; 0f:468c $c8
    ld   A, [wCB66]                                    ;; 0f:468d $fa $66 $cb
    and  A, A                                          ;; 0f:4690 $a7
    ret  NZ                                            ;; 0f:4691 $c0
    ld   HL, wCB26                                     ;; 0f:4692 $21 $26 $cb
    dec  [HL]                                          ;; 0f:4695 $35
    jr   NZ, .jr_0f_46bd                               ;; 0f:4696 $20 $25
    call call_0f_474b                                  ;; 0f:4698 $cd $4b $47
    ld   [wCB26], A                                    ;; 0f:469b $ea $26 $cb
    ld   A, [HL+]                                      ;; 0f:469e $2a
    ld   E, A                                          ;; 0f:469f $5f
    ld   D, $00                                        ;; 0f:46a0 $16 $00
    ld   C, H                                          ;; 0f:46a2 $4c
    ld   A, L                                          ;; 0f:46a3 $7d
    ld   HL, wCB29                                     ;; 0f:46a4 $21 $29 $cb
    ld   [HL+], A                                      ;; 0f:46a7 $22
    ld   [HL], C                                       ;; 0f:46a8 $71
    bit  7, E                                          ;; 0f:46a9 $cb $7b
    jr   Z, .jr_0f_46ae                                ;; 0f:46ab $28 $01
    dec  D                                             ;; 0f:46ad $15
.jr_0f_46ae:
    ld   HL, wCB24                                     ;; 0f:46ae $21 $24 $cb
    ld   A, [HL+]                                      ;; 0f:46b1 $2a
    ld   H, [HL]                                       ;; 0f:46b2 $66
    ld   L, A                                          ;; 0f:46b3 $6f
    add  HL, DE                                        ;; 0f:46b4 $19
    ld   A, L                                          ;; 0f:46b5 $7d
    ldh  [rNR13], A                                    ;; 0f:46b6 $e0 $13
    ld   A, H                                          ;; 0f:46b8 $7c
    and  A, $07                                        ;; 0f:46b9 $e6 $07
    ldh  [rNR14], A                                    ;; 0f:46bb $e0 $14
.jr_0f_46bd:
    ld   HL, wCB2B                                     ;; 0f:46bd $21 $2b $cb
    ld   A, [HL]                                       ;; 0f:46c0 $7e
    inc  A                                             ;; 0f:46c1 $3c
    ret  Z                                             ;; 0f:46c2 $c8
    dec  [HL]                                          ;; 0f:46c3 $35
    ret  NZ                                            ;; 0f:46c4 $c0
    call call_0f_474b                                  ;; 0f:46c5 $cd $4b $47
    ld   [wCB2B], A                                    ;; 0f:46c8 $ea $2b $cb
    ld   A, [HL+]                                      ;; 0f:46cb $2a
    ldh  [rNR12], A                                    ;; 0f:46cc $e0 $12
    ld   A, [wCB25]                                    ;; 0f:46ce $fa $25 $cb
    ldh  [rNR14], A                                    ;; 0f:46d1 $e0 $14
    ld   C, H                                          ;; 0f:46d3 $4c
    ld   A, L                                          ;; 0f:46d4 $7d
    ld   HL, wCB2E                                     ;; 0f:46d5 $21 $2e $cb
    ld   [HL+], A                                      ;; 0f:46d8 $22
    ld   [HL], C                                       ;; 0f:46d9 $71
    ret                                                ;; 0f:46da $c9

musicVibratoAndVolumeChannel3:
    ld   HL, wCB35                                     ;; 0f:46db $21 $35 $cb
    ld   A, [HL+]                                      ;; 0f:46de $2a
    or   A, A                                          ;; 0f:46df $b7
    jr   NZ, .jr_0f_4718                               ;; 0f:46e0 $20 $36
    ldh  A, [hMusicNoteDurationChannel3Copy]           ;; 0f:46e2 $f0 $c0
    or   A, A                                          ;; 0f:46e4 $b7
    jr   Z, .jr_0f_4718                                ;; 0f:46e5 $28 $31
    inc  L                                             ;; 0f:46e7 $2c
    ld   A, [HL]                                       ;; 0f:46e8 $7e
    cp   A, $0d                                        ;; 0f:46e9 $fe $0d
    jr   Z, .jr_0f_4718                                ;; 0f:46eb $28 $2b
    ld   HL, wCB3E                                     ;; 0f:46ed $21 $3e $cb
    dec  [HL]                                          ;; 0f:46f0 $35
    jr   NZ, .jr_0f_4718                               ;; 0f:46f1 $20 $25
    call call_0f_474b                                  ;; 0f:46f3 $cd $4b $47
    ld   [wCB3E], A                                    ;; 0f:46f6 $ea $3e $cb
    ld   A, [HL+]                                      ;; 0f:46f9 $2a
    ld   E, A                                          ;; 0f:46fa $5f
    ld   D, $00                                        ;; 0f:46fb $16 $00
    ld   C, H                                          ;; 0f:46fd $4c
    ld   A, L                                          ;; 0f:46fe $7d
    ld   HL, wCB41                                     ;; 0f:46ff $21 $41 $cb
    ld   [HL+], A                                      ;; 0f:4702 $22
    ld   [HL], C                                       ;; 0f:4703 $71
    bit  7, E                                          ;; 0f:4704 $cb $7b
    jr   Z, .jr_0f_4709                                ;; 0f:4706 $28 $01
    dec  D                                             ;; 0f:4708 $15
.jr_0f_4709:
    ld   HL, wCB3C                                     ;; 0f:4709 $21 $3c $cb
    ld   A, [HL+]                                      ;; 0f:470c $2a
    ld   H, [HL]                                       ;; 0f:470d $66
    ld   L, A                                          ;; 0f:470e $6f
    add  HL, DE                                        ;; 0f:470f $19
    ld   A, L                                          ;; 0f:4710 $7d
    ldh  [rNR33], A                                    ;; 0f:4711 $e0 $1d
    ld   A, H                                          ;; 0f:4713 $7c
    and  A, $07                                        ;; 0f:4714 $e6 $07
    ldh  [rNR34], A                                    ;; 0f:4716 $e0 $1e
.jr_0f_4718:
    ld   HL, wSoundEffectDurationChannel4              ;; 0f:4718 $21 $4c $cb
    ld   A, [HL+]                                      ;; 0f:471b $2a
    or   A, [HL]                                       ;; 0f:471c $b6
    ret  NZ                                            ;; 0f:471d $c0
    ldh  A, [hMusicNoteDurationChannel4Copy]           ;; 0f:471e $f0 $c1
    or   A, A                                          ;; 0f:4720 $b7
    ret  Z                                             ;; 0f:4721 $c8
    inc  L                                             ;; 0f:4722 $2c
    inc  L                                             ;; 0f:4723 $2c
    ld   A, [HL]                                       ;; 0f:4724 $7e
    cp   A, $0d                                        ;; 0f:4725 $fe $0d
    ret  Z                                             ;; 0f:4727 $c8
    ld   HL, wCB5B                                     ;; 0f:4728 $21 $5b $cb
    ld   A, [HL]                                       ;; 0f:472b $7e
    inc  A                                             ;; 0f:472c $3c
    ret  Z                                             ;; 0f:472d $c8
    dec  [HL]                                          ;; 0f:472e $35
    ret  NZ                                            ;; 0f:472f $c0
    ld   A, [wCB67]                                    ;; 0f:4730 $fa $67 $cb
    and  A, A                                          ;; 0f:4733 $a7
    ret  NZ                                            ;; 0f:4734 $c0
    call call_0f_474b                                  ;; 0f:4735 $cd $4b $47
    ld   [wCB5B], A                                    ;; 0f:4738 $ea $5b $cb
    ld   A, [HL+]                                      ;; 0f:473b $2a
    ldh  [rNR42], A                                    ;; 0f:473c $e0 $21
    ld   A, $80                                        ;; 0f:473e $3e $80
    ldh  [rNR44], A                                    ;; 0f:4740 $e0 $23
    ld   A, L                                          ;; 0f:4742 $7d
    ld   [wCB5E], A                                    ;; 0f:4743 $ea $5e $cb
    ld   A, H                                          ;; 0f:4746 $7c
    ld   [wCB5F], A                                    ;; 0f:4747 $ea $5f $cb
    ret                                                ;; 0f:474a $c9

call_0f_474b:
    inc  L                                             ;; 0f:474b $2c
    inc  L                                             ;; 0f:474c $2c
    inc  L                                             ;; 0f:474d $2c
    ld   A, [HL+]                                      ;; 0f:474e $2a
    ld   H, [HL]                                       ;; 0f:474f $66
    ld   L, A                                          ;; 0f:4750 $6f
    ld   A, [HL+]                                      ;; 0f:4751 $2a
    or   A, A                                          ;; 0f:4752 $b7
    ret  NZ                                            ;; 0f:4753 $c0
    ld   A, [HL+]                                      ;; 0f:4754 $2a
    ld   H, [HL]                                       ;; 0f:4755 $66
    ld   L, A                                          ;; 0f:4756 $6f
    ld   A, [HL+]                                      ;; 0f:4757 $2a
    ret                                                ;; 0f:4758 $c9

soundEffectPlay:
    dec  A                                             ;; 0f:4759 $3d
    add  A, A                                          ;; 0f:475a $87
    ld   E, A                                          ;; 0f:475b $5f
    ld   D, $00                                        ;; 0f:475c $16 $00
    ld   HL, data_0f_66f2                              ;; 0f:475e $21 $f2 $66
    add  HL, DE                                        ;; 0f:4761 $19
    push DE                                            ;; 0f:4762 $d5
    ld   A, [HL+]                                      ;; 0f:4763 $2a
    ld   C, [HL]                                       ;; 0f:4764 $4e
    add  A, C                                          ;; 0f:4765 $81
    jr   Z, .jr_0f_4775                                ;; 0f:4766 $28 $0d
    sub  A, C                                          ;; 0f:4768 $91
    ld   DE, wCB62                                     ;; 0f:4769 $11 $62 $cb
    ld   [DE], A                                       ;; 0f:476c $12
    inc  E                                             ;; 0f:476d $1c
    ld   A, C                                          ;; 0f:476e $79
    ld   [DE], A                                       ;; 0f:476f $12
    ld   A, $01                                        ;; 0f:4770 $3e $01
    ld   [wSoundEffectDurationChannel1], A             ;; 0f:4772 $ea $1c $cb
.jr_0f_4775:
    pop  DE                                            ;; 0f:4775 $d1
    ld   HL, data_0f_6774                              ;; 0f:4776 $21 $74 $67
    add  HL, DE                                        ;; 0f:4779 $19
    ld   A, [HL+]                                      ;; 0f:477a $2a
    ld   C, [HL]                                       ;; 0f:477b $4e
    add  A, C                                          ;; 0f:477c $81
    jr   Z, .jr_0f_478a                                ;; 0f:477d $28 $0b
    sub  A, C                                          ;; 0f:477f $91
    ld   HL, wCB64                                     ;; 0f:4780 $21 $64 $cb
    ld   [HL+], A                                      ;; 0f:4783 $22
    ld   [HL], C                                       ;; 0f:4784 $71
    ld   A, $01                                        ;; 0f:4785 $3e $01
    ld   [wSoundEffectDurationChannel4], A             ;; 0f:4787 $ea $4c $cb
.jr_0f_478a:
    xor  A, A                                          ;; 0f:478a $af
    ldh  [hSFX], A                                     ;; 0f:478b $e0 $bc
    ret                                                ;; 0f:478d $c9

soundEffectPlayStep:
    ld   DE, wSoundEffectDurationChannel1              ;; 0f:478e $11 $1c $cb
    ld   A, [DE]                                       ;; 0f:4791 $1a
    or   A, A                                          ;; 0f:4792 $b7
    jr   Z, .channel4                                  ;; 0f:4793 $28 $4b
    ld   [wCB66], A                                    ;; 0f:4795 $ea $66 $cb
    dec  A                                             ;; 0f:4798 $3d
    ld   [DE], A                                       ;; 0f:4799 $12
    jr   NZ, .channel4                                 ;; 0f:479a $20 $44
    ld   HL, wCB62                                     ;; 0f:479c $21 $62 $cb
    ld   A, [HL+]                                      ;; 0f:479f $2a
    ld   H, [HL]                                       ;; 0f:47a0 $66
    ld   L, A                                          ;; 0f:47a1 $6f
.jr_0f_47a2:
    ld   A, [HL+]                                      ;; 0f:47a2 $2a
    ld   [DE], A                                       ;; 0f:47a3 $12
    or   A, A                                          ;; 0f:47a4 $b7
    jr   NZ, .jr_0f_47ac                               ;; 0f:47a5 $20 $05
    call soundEffectRestoreChannel1                    ;; 0f:47a7 $cd $dd $40
    jr   .channel4                                     ;; 0f:47aa $18 $34
.jr_0f_47ac:
    cp   A, $ef                                        ;; 0f:47ac $fe $ef
    jr   NZ, .jr_0f_47bf                               ;; 0f:47ae $20 $0f
    ld   A, [HL+]                                      ;; 0f:47b0 $2a
    ld   C, A                                          ;; 0f:47b1 $4f
    ld   A, [HL+]                                      ;; 0f:47b2 $2a
    ld   B, A                                          ;; 0f:47b3 $47
    ldh  A, [hSoundEffectLoopCounterChannel1]          ;; 0f:47b4 $f0 $c4
    dec  A                                             ;; 0f:47b6 $3d
    ldh  [hSoundEffectLoopCounterChannel1], A          ;; 0f:47b7 $e0 $c4
    jr   Z, .jr_0f_47a2                                ;; 0f:47b9 $28 $e7
    ld   L, C                                          ;; 0f:47bb $69
    ld   H, B                                          ;; 0f:47bc $60
    jr   .jr_0f_47a2                                   ;; 0f:47bd $18 $e3
.jr_0f_47bf:
    cp   A, $f0                                        ;; 0f:47bf $fe $f0
    jr   C, .jr_0f_47c9                                ;; 0f:47c1 $38 $06
    and  A, $0f                                        ;; 0f:47c3 $e6 $0f
    ldh  [hSoundEffectLoopCounterChannel1], A          ;; 0f:47c5 $e0 $c4
    jr   .jr_0f_47a2                                   ;; 0f:47c7 $18 $d9
.jr_0f_47c9:
    ld   C, $10                                        ;; 0f:47c9 $0e $10
    ld   B, $05                                        ;; 0f:47cb $06 $05
.copyLoop:
    ld   A, [HL+]                                      ;; 0f:47cd $2a
    ldh  [C], A                                        ;; 0f:47ce $e2
    inc  C                                             ;; 0f:47cf $0c
    dec  B                                             ;; 0f:47d0 $05
    jr   NZ, .copyLoop                                 ;; 0f:47d1 $20 $fa
    ldh  A, [rNR51]                                    ;; 0f:47d3 $f0 $25
    or   A, $11                                        ;; 0f:47d5 $f6 $11
    ldh  [rNR51], A                                    ;; 0f:47d7 $e0 $25
    ld   C, H                                          ;; 0f:47d9 $4c
    ld   A, L                                          ;; 0f:47da $7d
    ld   HL, wCB62                                     ;; 0f:47db $21 $62 $cb
    ld   [HL+], A                                      ;; 0f:47de $22
    ld   [HL], C                                       ;; 0f:47df $71
.channel4:
    ld   DE, wSoundEffectDurationChannel4              ;; 0f:47e0 $11 $4c $cb
    ld   A, [DE]                                       ;; 0f:47e3 $1a
    or   A, A                                          ;; 0f:47e4 $b7
    ret  Z                                             ;; 0f:47e5 $c8
    ld   [wCB67], A                                    ;; 0f:47e6 $ea $67 $cb
    dec  A                                             ;; 0f:47e9 $3d
    ld   [DE], A                                       ;; 0f:47ea $12
    ret  NZ                                            ;; 0f:47eb $c0
    ld   HL, wCB64                                     ;; 0f:47ec $21 $64 $cb
    ld   A, [HL+]                                      ;; 0f:47ef $2a
    ld   H, [HL]                                       ;; 0f:47f0 $66
    ld   L, A                                          ;; 0f:47f1 $6f
.jr_0f_47f2:
    ld   A, [HL+]                                      ;; 0f:47f2 $2a
    ld   [DE], A                                       ;; 0f:47f3 $12
    or   A, A                                          ;; 0f:47f4 $b7
    jr   NZ, .jr_0f_47fa                               ;; 0f:47f5 $20 $03
    jp   soundEffectMuteChannel4                       ;; 0f:47f7 $c3 $fd $40
.jr_0f_47fa:
    cp   A, $ef                                        ;; 0f:47fa $fe $ef
    jr   NZ, .jr_0f_480d                               ;; 0f:47fc $20 $0f
    ld   A, [HL+]                                      ;; 0f:47fe $2a
    ld   C, A                                          ;; 0f:47ff $4f
    ld   A, [HL+]                                      ;; 0f:4800 $2a
    ld   B, A                                          ;; 0f:4801 $47
    ldh  A, [hSoundEffectLoopCounterChannel4]          ;; 0f:4802 $f0 $c5
    dec  A                                             ;; 0f:4804 $3d
    ldh  [hSoundEffectLoopCounterChannel4], A          ;; 0f:4805 $e0 $c5
    jr   Z, .jr_0f_47f2                                ;; 0f:4807 $28 $e9
    ld   L, C                                          ;; 0f:4809 $69
    ld   H, B                                          ;; 0f:480a $60
    jr   .jr_0f_47f2                                   ;; 0f:480b $18 $e5
.jr_0f_480d:
    cp   A, $f0                                        ;; 0f:480d $fe $f0
    jr   C, .jr_0f_4817                                ;; 0f:480f $38 $06
    and  A, $0f                                        ;; 0f:4811 $e6 $0f
    ldh  [hSoundEffectLoopCounterChannel4], A          ;; 0f:4813 $e0 $c5
    jr   .jr_0f_47f2                                   ;; 0f:4815 $18 $db
.jr_0f_4817:
    ld   A, [HL+]                                      ;; 0f:4817 $2a
    ldh  [rNR42], A                                    ;; 0f:4818 $e0 $21
    ld   A, [HL+]                                      ;; 0f:481a $2a
    ldh  [rNR43], A                                    ;; 0f:481b $e0 $22
    ld   A, $80                                        ;; 0f:481d $3e $80
    ldh  [rNR44], A                                    ;; 0f:481f $e0 $23
    ldh  A, [rNR51]                                    ;; 0f:4821 $f0 $25
    or   A, $88                                        ;; 0f:4823 $f6 $88
    ldh  [rNR51], A                                    ;; 0f:4825 $e0 $25
    ld   C, H                                          ;; 0f:4827 $4c
    ld   A, L                                          ;; 0f:4828 $7d
    ld   HL, wCB64                                     ;; 0f:4829 $21 $64 $cb
    ld   [HL+], A                                      ;; 0f:482c $22
    ld   [HL], C                                       ;; 0f:482d $71
    ret                                                ;; 0f:482e $c9

;@data format=pppp amount=20
musicSongChannelPointers:
    dw   data_0f_5d66, data_0f_5de5, data_0f_5e81, data_0f_5efb ;; 0f:482f pPpPpPpP $00
    dw   data_0f_5f0d, data_0f_5fd8, data_0f_6099, data_0f_60e9 ;; 0f:4837 ???????? $01
    dw   data_0f_4ac0, data_0f_4aec, data_0f_4b66, data_0f_4b91 ;; 0f:483f ???????? $02
    dw   data_0f_62e5, data_0f_632f, data_0f_637b, data_0f_63c7 ;; 0f:4847 pPpPpPpP $03
    dw   data_0f_651a, data_0f_6568, data_0f_65a0, data_0f_65c9 ;; 0f:484f ???????? $04
    dw   data_0f_48cf, data_0f_491f, data_0f_49df, data_0f_4a87 ;; 0f:4857 pPpPpPpP $05
    dw   data_0f_4b92, data_0f_4c64, data_0f_4d23, data_0f_4e10 ;; 0f:485f ???????? $06
    dw   data_0f_59cc, data_0f_5a40, data_0f_5ae9, data_0f_5b38 ;; 0f:4867 pPpPpPpP $07
    dw   data_0f_4e5b, data_0f_4f19, data_0f_5008, data_0f_508b ;; 0f:486f pPpPpPpP $08
    dw   data_0f_52b6, data_0f_530f, data_0f_532a, data_0f_4b91 ;; 0f:4877 ???????? $09
    dw   data_0f_509f, data_0f_5110, data_0f_51d0, data_0f_52a5 ;; 0f:487f pPpPpPpP $0a
    dw   data_0f_5b72, data_0f_5bae, data_0f_5bea, data_0f_5c11 ;; 0f:4887 ???????? $0b
    dw   data_0f_63d5, data_0f_644e, data_0f_64ea, data_0f_650a ;; 0f:488f pPpPpPpP $0c
    dw   data_0f_6110, data_0f_6194, data_0f_6271, data_0f_62d5 ;; 0f:4897 ???????? $0d
    dw   data_0f_55f3, data_0f_56b6, data_0f_5730, data_0f_574f ;; 0f:489f pPpPpPpP $0e
    dw   data_0f_576e, data_0f_57ed, data_0f_583f, data_0f_592f ;; 0f:48a7 ???????? $0f
    dw   data_0f_5945, data_0f_5986, data_0f_5991, data_0f_59be ;; 0f:48af ???????? $10
    dw   data_0f_536d, data_0f_539f, data_0f_5420, data_0f_54c2 ;; 0f:48b7 ???????? $11
    dw   data_0f_5c2c, data_0f_5ca3, data_0f_5cd7, data_0f_5d48 ;; 0f:48bf pPpPpPpP $12
    dw   data_0f_54d5, data_0f_5521, data_0f_559b, data_0f_4b91 ;; 0f:48c7 pPpPpPpP $13

data_0f_48cf:
    db   $fe, $60, $68, $66                            ;; 0f:48cf ....
    dw   $6625                                         ;; 0f:48d3 wP
    db   $80, $03, $e3, $fa, $02                       ;; 0f:48d5 .w...
.data_0f_48da:
    db   $26, $93, $8c, $9c, $b9, $91, $f9             ;; 0f:48da .......
    dw   .data_0f_48da                                 ;; 0f:48e1 pP
    db   $f0                                           ;; 0f:48e3 .
    dw   $662b                                         ;; 0f:48e4 wP
    db   $f3, $02                                      ;; 0f:48e6 ..
.data_0f_48e8:
    db   $63, $79, $69, $49, $79, $66, $23, $ec        ;; 0f:48e8 ........
    db   $96, $a6, $e8, $26, $46, $26, $fb, $01        ;; 0f:48f0 ........
    dw   .data_0f_48ff                                 ;; 0f:48f8 pP
    db   $23, $13, $f2                                 ;; 0f:48fa ...
    dw   .data_0f_48e8                                 ;; 0f:48fd pP
.data_0f_48ff:
    db   $91, $26, $93, $8c, $9c, $b9, $96, $23        ;; 0f:48ff ......??
    db   $26, $a3, $e8, $06, $ec, $a6, $91, $26        ;; 0f:4907 ????????
    db   $93, $8c, $9c, $b9, $96, $23, $26, $e8        ;; 0f:490f ????????
    db   $23, $06, $ec, $a6, $91, $f1, $e6, $48        ;; 0f:4917 ????????

data_0f_491f:
    db   $fe, $63, $66                                 ;; 0f:491f ...
    dw   $65e3                                         ;; 0f:4922 wP
    db   $80, $03, $fa, $02                            ;; 0f:4924 .w..
.data_0f_4928:
    db   $f6, $03, $e2, $66, $e8, $63, $4c, $6c        ;; 0f:4928 .w......
    db   $79, $f6, $01, $6c, $2c, $ec, $9c, $f6        ;; 0f:4930 ..w.....
    db   $02, $e8, $9c, $6c, $2c, $f6, $01, $e8        ;; 0f:4938 w.....w.
    db   $2c, $ec, $9c, $6c, $f6, $02, $e8, $6c        ;; 0f:4940 .....w..
    db   $2c, $ec, $9c, $f6, $01, $e8, $9c, $2c        ;; 0f:4948 ....w...
    db   $f6, $02, $7c, $2c, $f9                       ;; 0f:4950 .w...
    dw   .data_0f_4928                                 ;; 0f:4955 pP
    db   $f0                                           ;; 0f:4957 .
    dw   $6613                                         ;; 0f:4958 wP
    db   $f3, $02                                      ;; 0f:495a ..
.data_0f_495c:
    db   $e3, $fa, $08                                 ;; 0f:495c ...
.data_0f_495f:
    db   $9c, $4c, $6c, $2c, $f9                       ;; 0f:495f .....
    dw   .data_0f_495f                                 ;; 0f:4964 pP
    db   $fa, $04                                      ;; 0f:4966 ..
.data_0f_4968:
    db   $9c, $4c, $5c, $2c, $f9                       ;; 0f:4968 .....
    dw   .data_0f_4968                                 ;; 0f:496d pP
    db   $fa, $02                                      ;; 0f:496f ..
.data_0f_4971:
    db   $9c, $2c, $4c, $ec, $9c, $e8, $f9             ;; 0f:4971 .......
    dw   .data_0f_4971                                 ;; 0f:4978 pP
    db   $9c, $1c, $4c, $ec, $9c, $e8, $9c, $ec        ;; 0f:497a ........
    db   $9c, $e8, $1c, $ec, $9c, $f2                  ;; 0f:4982 ......
    dw   .data_0f_495c                                 ;; 0f:4988 pP
    db   $f6, $03, $f0                                 ;; 0f:498a .w.
    dw   $65f7                                         ;; 0f:498d wP
    db   $ec, $96, $e8, $26, $96, $4c, $6c, $79        ;; 0f:498f ........
    db   $66, $26, $99, $79, $69, $49, $26, $49        ;; 0f:4997 ????????
    db   $59, $46, $26, $19, $ec, $99, $49, $99        ;; 0f:499f ????????
    db   $e8, $49, $19, $99, $49, $94, $9c, $7c        ;; 0f:49a7 ????????
    db   $66, $4c, $6c, $79, $6c, $4c, $6c, $7c        ;; 0f:49af ????????
    db   $99, $2c, $1c, $2c, $4c, $69, $9c, $7c        ;; 0f:49b7 ????????
    db   $6c, $4c, $76, $a6, $96, $76, $64, $7c        ;; 0f:49bf ????????
    db   $6c, $f0, $0f, $66, $f6, $01, $4c, $ec        ;; 0f:49c7 ????????
    db   $9c, $e8, $4c, $9c, $f6, $02, $e8, $4c        ;; 0f:49cf ????????
    db   $ec, $9c, $4c, $ec, $9c, $f1, $57, $49        ;; 0f:49d7 ????????

data_0f_49df:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e0        ;; 0f:49df ......w.
    db   $96, $e8, $22, $e8, $26, $93, $8c, $9c        ;; 0f:49e7 ........
    db   $b9, $e0, $96, $e8, $22, $e8, $26, $96        ;; 0f:49ef ........
    db   $ed, $9c, $bc, $e8, $1c, $2c, $4c, $6c        ;; 0f:49f7 ........
    db   $7c, $9c, $f3, $02                            ;; 0f:49ff ....
.data_0f_4a03:
    db   $e2, $fa, $07                                 ;; 0f:4a03 ...
.data_0f_4a06:
    db   $2a, $de, $2d, $df, $2d, $df, $f9             ;; 0f:4a06 .......
    dw   .data_0f_4a06                                 ;; 0f:4a0d pP
    db   $2c, $ec, $9c, $ac, $e8, $0c, $ec, $fa        ;; 0f:4a0f ........
    db   $04                                           ;; 0f:4a17 .
.data_0f_4a18:
    db   $aa, $de, $ad, $df, $ad, $df, $f9             ;; 0f:4a18 .......
    dw   .data_0f_4a18                                 ;; 0f:4a1f pP
    db   $fa, $02                                      ;; 0f:4a21 ..
.data_0f_4a23:
    db   $9a, $de, $9d, $df, $9d, $df, $f9             ;; 0f:4a23 .......
    dw   .data_0f_4a23                                 ;; 0f:4a2a pP
    db   $9c, $e8, $2c, $1c, $ec, $9c, $e8, $7c        ;; 0f:4a2c ........
    db   $6c, $4c, $ec, $9c, $f2                       ;; 0f:4a34 .....
    dw   .data_0f_4a03                                 ;; 0f:4a39 pP
    db   $f3, $02, $e8, $fa, $02                       ;; 0f:4a3b .....
.data_0f_4a40:
    db   $2a, $de, $2d, $df, $2d, $df, $f9             ;; 0f:4a40 .......
    dw   .data_0f_4a40                                 ;; 0f:4a47 pP
    db   $fa, $02                                      ;; 0f:4a49 ..
.data_0f_4a4b:
    db   $1a, $de, $1d, $df, $1d, $df, $f9             ;; 0f:4a4b .......
    dw   .data_0f_4a4b                                 ;; 0f:4a52 pP
    db   $fa, $02, $0a, $de, $0d, $df, $0d, $df        ;; 0f:4a54 ????????
    db   $f9, $56, $4a, $ec, $fa, $02, $ba, $de        ;; 0f:4a5c ????????
    db   $bd, $df, $bd, $df, $f9, $62, $4a, $fa        ;; 0f:4a64 ????????
    db   $04, $aa, $de, $ad, $df, $ad, $df, $f9        ;; 0f:4a6c ????????
    db   $6d, $4a, $fa, $04, $9a, $de, $9d, $df        ;; 0f:4a74 ????????
    db   $9d, $df, $f9, $78, $4a, $f2, $3d, $4a        ;; 0f:4a7c ????????
    db   $f1, $01, $4a                                 ;; 0f:4a84 ???

data_0f_4a87:
    db   $d0, $d0, $d1, $f0                            ;; 0f:4a87 ....
    dw   $661b                                         ;; 0f:4a8b wP
    db   $f6, $01, $f3, $0f                            ;; 0f:4a8d .w..
.data_0f_4a91:
    db   $b9, $bc, $bc, $7e, $5a, $bc, $bc, $f2        ;; 0f:4a91 ........
    dw   .data_0f_4a91                                 ;; 0f:4a99 pP
    db   $b9, $bc, $bc, $f6, $03, $59, $5c, $5c        ;; 0f:4a9b ....w...
    db   $f3, $0f, $f6, $02                            ;; 0f:4aa3 ...w
.data_0f_4aa7:
    db   $b9, $bc, $bc, $f6, $01, $7e, $5a, $f6        ;; 0f:4aa7 ....w...
    db   $02, $bc, $bc, $f2                            ;; 0f:4aaf w...
    dw   .data_0f_4aa7                                 ;; 0f:4ab3 pP
    db   $b9, $bc, $bc, $f6, $03, $59, $5c, $5c        ;; 0f:4ab5 ????????
    db   $f1, $8d, $4a                                 ;; 0f:4abd ???

data_0f_4ac0:
    db   $fe, $40, $63, $66, $25, $66, $80, $03        ;; 0f:4ac0 ????????
    db   $e1, $94, $e8, $09, $ec, $b4, $79, $91        ;; 0f:4ac8 ????????
    db   $e8, $04, $29, $ec, $b4, $79, $51, $e8        ;; 0f:4ad0 ????????
    db   $59, $46, $09, $ec, $99, $59, $49, $09        ;; 0f:4ad8 ????????
    db   $ec, $99, $59, $49, $29, $42, $e8, $02        ;; 0f:4ae0 ????????
    db   $c6, $f1, $c8, $4a                            ;; 0f:4ae8 ????

data_0f_4aec:
    db   $fe, $63, $66, $e7, $65, $40, $03, $e3        ;; 0f:4aec ????????
    db   $99, $49, $f6, $02, $e8, $99, $ec, $49        ;; 0f:4af4 ????????
    db   $f6, $03, $e8, $29, $ec, $b4, $f6, $03        ;; 0f:4afc ????????
    db   $e8, $09, $ec, $49, $f6, $01, $99, $49        ;; 0f:4b04 ????????
    db   $f6, $03, $e8, $49, $ec, $44, $f6, $03        ;; 0f:4b0c ????????
    db   $99, $49, $f6, $02, $e8, $09, $ec, $b9        ;; 0f:4b14 ????????
    db   $f6, $03, $e8, $09, $ec, $44, $f6, $03        ;; 0f:4b1c ????????
    db   $99, $59, $f6, $01, $29, $ec, $99, $f6        ;; 0f:4b24 ????????
    db   $03, $e8, $59, $24, $f6, $03, $e2, $9e        ;; 0f:4b2c ????????
    db   $e8, $0a, $e8, $03, $c9, $ed, $be, $e8        ;; 0f:4b34 ????????
    db   $2a, $e8, $29, $ed, $9e, $e8, $0a, $e8        ;; 0f:4b3c ????????
    db   $09, $ed, $7e, $ba, $e8, $b9, $0e, $4a        ;; 0f:4b44 ????????
    db   $79, $e8, $09, $ec, $b9, $e8, $09, $ec        ;; 0f:4b4c ????????
    db   $79, $e8, $0e, $4a, $ec, $79, $be, $e8        ;; 0f:4b54 ????????
    db   $0a, $ec, $79, $e8, $0e, $44, $ca, $f1        ;; 0f:4b5c ????????
    db   $f3, $4a                                      ;; 0f:4b64 ??

data_0f_4b66:
    db   $fe, $68, $66, $20, $c2, $66, $03, $e4        ;; 0f:4b66 ????????
    db   $06, $ec, $96, $e8, $76, $56, $46, $02        ;; 0f:4b6e ????????
    db   $46, $ec, $96, $76, $46, $96, $e8, $22        ;; 0f:4b76 ????????
    db   $ec, $92, $79, $59, $49, $09, $ec, $b9        ;; 0f:4b7e ????????
    db   $e8, $09, $b2, $e8, $02, $f0, $60, $c6        ;; 0f:4b86 ????????
    db   $f1, $66, $4b                                 ;; 0f:4b8e ???

data_0f_4b91:
    db   $ff                                           ;; 0f:4b91 .

data_0f_4b92:
    db   $fe, $57, $7a, $66, $25, $66, $c0, $03        ;; 0f:4b92 ????????
    db   $e3, $fa, $10, $f3, $02, $47, $59, $4c        ;; 0f:4b9a ????????
    db   $27, $77, $4c, $dc, $0d, $df, $06, $cc        ;; 0f:4ba2 ????????
    db   $dc, $fb, $01, $bc, $4b, $0c, $2c, $4c        ;; 0f:4baa ????????
    db   $56, $7c, $5c, $49, $29, $09, $22, $f2        ;; 0f:4bb2 ????????
    db   $9f, $4b, $ec, $9c, $e8, $0c, $7c, $57        ;; 0f:4bba ????????
    db   $ec, $9c, $e8, $0c, $5c, $49, $ec, $7c        ;; 0f:4bc2 ????????
    db   $e8, $27, $02, $f3, $02, $07, $dc, $0c        ;; 0f:4bca ????????
    db   $2c, $37, $dc, $3c, $5c, $7c, $dc, $0d        ;; 0f:4bd2 ????????
    db   $df, $fb, $01, $fa, $4b, $09, $3f, $5f        ;; 0f:4bda ????????
    db   $7f, $8a, $de, $7a, $de, $5a, $de, $36        ;; 0f:4be2 ????????
    db   $cc, $2e, $3e, $27, $09, $dc, $06, $cc        ;; 0f:4bea ????????
    db   $ec, $bd, $df, $b4, $e8, $f2, $cf, $4b        ;; 0f:4bf2 ????????
    db   $04, $77, $97, $dc, $9c, $7c, $67, $dc        ;; 0f:4bfa ????????
    db   $6c, $7d, $df, $74, $ec, $bc, $e8, $0c        ;; 0f:4c02 ????????
    db   $2c, $4c, $5c, $7c, $f9, $9d, $4b, $f7        ;; 0f:4c0a ????????
    db   $68, $f0, $45, $66, $f4, $68, $66, $e3        ;; 0f:4c12 ????????
    db   $9a, $da, $5c, $53, $96, $ba, $da, $7c        ;; 0f:4c1a ????????
    db   $73, $76, $9a, $da, $5c, $53, $96, $ba        ;; 0f:4c22 ????????
    db   $da, $7c, $73, $f7, $60, $b6, $e8, $03        ;; 0f:4c2a ????????
    db   $f7, $5b, $c3, $f7, $56, $23, $f7, $51        ;; 0f:4c32 ????????
    db   $c3, $f5, $80, $f7, $4c, $ec, $06, $73        ;; 0f:4c3a ????????
    db   $6c, $7c, $99, $f7, $49, $76, $e8, $03        ;; 0f:4c42 ????????
    db   $ec, $bc, $e8, $0c, $29, $06, $f7, $47        ;; 0f:4c4a ????????
    db   $c6, $f7, $46, $c6, $f7, $44, $c6, $f0        ;; 0f:4c52 ????????
    db   $db, $65, $06, $e2, $0c, $0c, $0c, $0c        ;; 0f:4c5a ????????
    db   $06, $ff                                      ;; 0f:4c62 ??

data_0f_4c64:
    db   $fe, $71, $66, $37, $66, $80, $03, $fa        ;; 0f:4c64 ????????
    db   $10, $f3, $02, $e3, $04, $ec, $b7, $7c        ;; 0f:4c6c ????????
    db   $9c, $bc, $97, $77, $57, $fb, $01, $91        ;; 0f:4c74 ????????
    db   $4c, $4c, $5c, $7c, $5c, $9c, $e8, $0c        ;; 0f:4c7c ????????
    db   $ec, $7c, $bc, $9c, $77, $47, $77, $97        ;; 0f:4c84 ????????
    db   $a7, $b7, $f2, $6f, $4c, $47, $54, $79        ;; 0f:4c8c ????????
    db   $4c, $57, $0c, $4c, $7c, $e8, $0c, $4c        ;; 0f:4c94 ????????
    db   $7c, $e8, $07, $ed, $2c, $5c, $ac, $f3        ;; 0f:4c9c ????????
    db   $02, $86, $7c, $ac, $e8, $06, $0c, $2c        ;; 0f:4ca4 ????????
    db   $37, $ec, $74, $fb, $01, $bf, $4c, $87        ;; 0f:4cac ????????
    db   $94, $67, $97, $77, $6c, $7c, $9c, $74        ;; 0f:4cb4 ????????
    db   $f2, $a5, $4c, $37, $2c, $6c, $9c, $e8        ;; 0f:4cbc ????????
    db   $07, $ec, $6c, $9c, $e8, $0c, $27, $06        ;; 0f:4cc4 ????????
    db   $2c, $0c, $ec, $7c, $9c, $bc, $e8, $0c        ;; 0f:4ccc ????????
    db   $29, $f9, $6d, $4c, $f0, $4b, $66, $e3        ;; 0f:4cd4 ????????
    db   $fa, $02, $e3, $5a, $da, $0c, $03, $56        ;; 0f:4cdc ????????
    db   $7a, $da, $2c, $2c, $2c, $1c, $2c, $ec        ;; 0f:4ce4 ????????
    db   $bc, $bc, $ac, $bc, $7c, $9c, $bc, $7c        ;; 0f:4cec ????????
    db   $f9, $de, $4c, $f0, $31, $66, $f5, $80        ;; 0f:4cf4 ????????
    db   $83, $89, $a9, $e8, $09, $39, $26, $ec        ;; 0f:4cfc ????????
    db   $a6, $56, $26, $f0, $ff, $65, $dc, $e8        ;; 0f:4d04 ????????
    db   $06, $73, $6c, $7c, $9c, $f0, $4b, $66        ;; 0f:4d0c ????????
    db   $06, $73, $76, $41, $f0, $e7, $65, $46        ;; 0f:4d14 ????????
    db   $e3, $0c, $0c, $0c, $0c, $06, $ff             ;; 0f:4d1c ???????

data_0f_4d23:
    db   $fe, $63, $66, $20, $e2, $66, $03, $fa        ;; 0f:4d23 ????????
    db   $10, $f3, $02, $e2, $09, $dc, $0c, $f6        ;; 0f:4d2b ????????
    db   $02, $4c, $7c, $f6, $03, $ec, $b9, $dc        ;; 0f:4d33 ????????
    db   $bc, $f6, $01, $e8, $2c, $7c, $f6, $03        ;; 0f:4d3b ????????
    db   $ec, $99, $dc, $99, $dc, $79, $dc, $79        ;; 0f:4d43 ????????
    db   $dc, $59, $dc, $5c, $f6, $02, $e8, $0c        ;; 0f:4d4b ????????
    db   $5c, $f6, $03, $fb, $01, $6b, $4d, $09        ;; 0f:4d53 ????????
    db   $dc, $0c, $f6, $01, $4c, $7c, $f6, $03        ;; 0f:4d5b ????????
    db   $ec, $77, $97, $a7, $b7, $f2, $2e, $4d        ;; 0f:4d63 ????????
    db   $ec, $79, $dc, $7c, $f6, $01, $bc, $e8        ;; 0f:4d6b ????????
    db   $2c, $f6, $03, $07, $ec, $77, $06, $d9        ;; 0f:4d73 ????????
    db   $f3, $02, $89, $dc, $8c, $f6, $02, $e8        ;; 0f:4d7b ????????
    db   $0c, $3c, $ec, $f6, $03, $89, $dc, $89        ;; 0f:4d83 ????????
    db   $dc, $79, $dc, $7c, $f6, $01, $e8, $0c        ;; 0f:4d8b ????????
    db   $3c, $ec, $f6, $03, $79, $dc, $79, $dc        ;; 0f:4d93 ????????
    db   $69, $dc, $6c, $f6, $02, $e8, $0c, $2c        ;; 0f:4d9b ????????
    db   $ec, $f6, $03, $69, $dc, $69, $dc, $fb        ;; 0f:4da3 ????????
    db   $01, $be, $4d, $79, $dc, $7c, $f6, $01        ;; 0f:4dab ????????
    db   $e8, $0c, $2c, $f6, $03, $ec, $77, $b7        ;; 0f:4db3 ????????
    db   $f2, $7d, $4d, $77, $97, $b7, $77, $f9        ;; 0f:4dbb ????????
    db   $2c, $4d, $e1, $fa, $02, $5a, $da, $d7        ;; 0f:4dc3 ????????
    db   $09, $59, $09, $59, $09, $7a, $da, $d7        ;; 0f:4dcb ????????
    db   $29, $79, $29, $79, $29, $f9, $c8, $4d        ;; 0f:4dd3 ????????
    db   $fa, $04, $8a, $de, $3a, $de, $f9, $dd        ;; 0f:4ddb ????????
    db   $4d, $fa, $04, $aa, $de, $5a, $de, $f9        ;; 0f:4de3 ????????
    db   $e6, $4d, $e8, $03, $ec, $b3, $a3, $96        ;; 0f:4deb ????????
    db   $b6, $fa, $04, $e8, $0c, $dc, $ec, $7c        ;; 0f:4df3 ????????
    db   $dc, $f9, $f6, $4d, $e8, $09, $ec, $d9        ;; 0f:4dfb ????????
    db   $0e, $de, $0e, $de, $0e, $de, $0e, $de        ;; 0f:4e03 ????????
    db   $09, $f0, $60, $c9, $ff                       ;; 0f:4e0b ?????

data_0f_4e10:
    db   $f0, $1b, $66, $fa, $20, $f3, $0f, $f6        ;; 0f:4e10 ????????
    db   $02, $57, $fb, $08, $36, $4e, $f6, $01        ;; 0f:4e18 ????????
    db   $7c, $7c, $7c, $f2, $17, $4e, $f6, $02        ;; 0f:4e20 ????????
    db   $7c, $7c, $7c, $f6, $03, $7c, $7c, $7c        ;; 0f:4e28 ????????
    db   $f9, $15, $4e, $f1, $3b, $4e, $f6, $03        ;; 0f:4e30 ????????
    db   $f1, $20, $4e, $f6, $02, $fa, $04, $74        ;; 0f:4e38 ????????
    db   $f6, $01, $7d, $7d, $7d, $79, $f6, $02        ;; 0f:4e40 ????????
    db   $7d, $7d, $7d, $76, $f9, $3f, $4e, $fa        ;; 0f:4e48 ????????
    db   $08, $f6, $02, $59, $f6, $01, $99, $f9        ;; 0f:4e50 ????????
    db   $51, $4e, $ff                                 ;; 0f:4e58 ???

data_0f_4e5b:
    db   $fe, $5d, $63, $66                            ;; 0f:4e5b ....
    dw   $6651                                         ;; 0f:4e5f wP
    db   $c0, $03, $e2, $2c, $dc, $2c, $97, $2c        ;; 0f:4e61 .w......
    db   $dc, $2c, $e8, $07, $ec, $bc, $e8, $0c        ;; 0f:4e69 ........
    db   $ec, $bc, $9c, $f6, $02, $e8, $4e, $5e        ;; 0f:4e71 ....w...
    db   $7e, $9e, $e8, $f6, $01, $0c, $ec, $be        ;; 0f:4e79 ....w...
    db   $9e, $2c, $f6, $02, $7c, $5e, $7e, $9c        ;; 0f:4e81 ...w....
    db   $f6, $03, $e2, $57, $4c, $5c, $4c, $27        ;; 0f:4e89 .w......
    db   $07, $2c, $ec, $dc, $9c, $94, $e8, $0e        ;; 0f:4e91 ........
    db   $2e, $4e, $5e, $7c, $57, $5c, $4c, $2c        ;; 0f:4e99 ........
    db   $77, $7c, $5c, $4c, $27, $f6, $01, $e8        ;; 0f:4ea1 ......w.
    db   $5c, $7e, $9e, $bc, $f6, $02, $e8, $0c        ;; 0f:4ea9 .....w..
    db   $ec, $be, $9e, $7c, $f6, $01, $5c, $4e        ;; 0f:4eb1 .....w..
    db   $2e, $0c, $f6, $03, $27, $0c, $ec, $bc        ;; 0f:4eb9 ...w....
    db   $e8, $0c, $ec, $97, $7c, $9c, $bc, $e8        ;; 0f:4ec1 ........
    db   $06, $cc, $ec, $bc, $e8, $0c, $ec, $5c        ;; 0f:4ec9 ........
    db   $7c, $9c, $ac, $e8, $0c, $27, $5c, $4c        ;; 0f:4ed1 ........
    db   $2c, $47, $7c, $4c, $0c, $22, $ec, $5c        ;; 0f:4ed9 ........
    db   $4c, $2c, $4c, $5c, $2c, $97, $7c, $5c        ;; 0f:4ee1 ........
    db   $4c, $4c, $5c, $7c, $03, $cc, $97, $e8        ;; 0f:4ee9 ........
    db   $0c, $ec, $2c, $ac, $9c, $7c, $5c, $4c        ;; 0f:4ef1 ....????
    db   $2c, $7c, $42, $5c, $4c, $2c, $4c, $5c        ;; 0f:4ef9 ????????
    db   $7c, $9c, $5c, $2c, $4c, $2c, $0c, $ac        ;; 0f:4f01 ????????
    db   $9c, $7c, $5c, $4c, $2c, $ec, $ac, $e8        ;; 0f:4f09 ????????
    db   $2c, $9c, $7c, $5c, $4c, $f1, $8b, $4e        ;; 0f:4f11 ????????

data_0f_4f19:
    db   $fe, $63, $66                                 ;; 0f:4f19 ...
    dw   $6657                                         ;; 0f:4f1c wP
    db   $40, $03, $e1, $9c, $dc, $9c, $e8, $27        ;; 0f:4f1e .w......
    db   $ec, $9c, $dc, $9c, $e8, $57, $4c, $5c        ;; 0f:4f26 ........
    db   $4c, $2c, $e8, $0e, $2e, $4e, $5e, $9c        ;; 0f:4f2e ........
    db   $7e, $5e, $ec, $9c, $e8, $4c, $2e, $4e        ;; 0f:4f36 ........
    db   $5c, $e2, $97, $7c, $9c, $7c, $57, $47        ;; 0f:4f3e ........
    db   $ec, $99, $2c, $29, $f6, $02, $e9, $5c        ;; 0f:4f46 .....w..
    db   $2c, $ec, $9c, $5c, $2e, $2e, $4e, $5e        ;; 0f:4f4e ........
    db   $7c, $f6, $03, $27, $2c, $0c, $ec, $ac        ;; 0f:4f56 ..w.....
    db   $e8, $47, $4c, $2c, $0c, $59, $9c, $e8        ;; 0f:4f5e ........
    db   $2c, $4e, $5e, $7c, $9c, $7e, $5e, $4c        ;; 0f:4f66 ........
    db   $2c, $0e, $ec, $be, $9c, $ec, $97, $e8        ;; 0f:4f6e ........
    db   $5c, $4c, $5c, $27, $4c, $5c, $7c, $57        ;; 0f:4f76 ........
    db   $5c, $0c, $ec, $ac, $97, $e8, $57, $f0        ;; 0f:4f7e ........
    dw   $65f7                                         ;; 0f:4f86 wP
    db   $f6, $02, $ac, $5c, $2c, $e8, $2c, $ec        ;; 0f:4f88 .w......
    db   $ac, $5c, $f6, $01, $7c, $4c, $0c, $4c        ;; 0f:4f90 ...w....
    db   $0c, $4c, $f6, $02, $5c, $4c, $5c, $2c        ;; 0f:4f98 ...w....
    db   $4c, $0c, $f6, $03, $2c, $ec, $9c, $e8        ;; 0f:4fa0 ...w....
    db   $9c, $7c, $5c, $4c, $f0                       ;; 0f:4fa8 .....
    dw   $6657                                         ;; 0f:4fad wP
    db   $27, $0c, $2c, $ec, $ac, $a7, $e8, $27        ;; 0f:4faf ........
    db   $47, $e8, $0c, $ec, $7c, $4c, $f6, $02        ;; 0f:4fb7 .......w
    db   $0c, $4c, $7c, $f6, $03, $e8, $4c, $5c        ;; 0f:4fbf ....w...
    db   $7c, $ec, $27, $9c, $2c, $7c, $5c, $4c        ;; 0f:4fc7 ......??
    db   $2c, $0c, $ec, $7c, $e8, $4c, $07, $77        ;; 0f:4fcf ????????
    db   $e8, $f6, $01, $0c, $ec, $bc, $e8, $0c        ;; 0f:4fd7 ????????
    db   $f6, $03, $ec, $7c, $4c, $0c, $2c, $0c        ;; 0f:4fdf ????????
    db   $ec, $ac, $e8, $0c, $2c, $4c, $5c, $2c        ;; 0f:4fe7 ????????
    db   $ec, $9c, $e8, $7c, $5c, $4c, $7c, $5c        ;; 0f:4fef ????????
    db   $4c, $2c, $0c, $ec, $ac, $7c, $e8, $2c        ;; 0f:4ff7 ????????
    db   $ec, $7c, $e8, $4c, $2c, $0c, $f1, $3f        ;; 0f:4fff ????????
    db   $4f                                           ;; 0f:5007 ?

data_0f_5008:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e1        ;; 0f:5008 ......w.
    db   $2c, $dc, $2c, $97, $2c, $dc, $2c, $e8        ;; 0f:5010 ........
    db   $07, $ec, $bc, $5c, $4c, $27, $e8, $fa        ;; 0f:5018 ........
    db   $06                                           ;; 0f:5020 .
.data_0f_5021:
    db   $2d, $df, $f9                                 ;; 0f:5021 ...
    dw   .data_0f_5021                                 ;; 0f:5024 pP
    db   $e2, $fa, $08                                 ;; 0f:5026 ...
.data_0f_5029:
    db   $2c, $dc, $2d, $df, $f9                       ;; 0f:5029 .....
    dw   .data_0f_5029                                 ;; 0f:502e pP
    db   $f3, $02                                      ;; 0f:5030 ..
.data_0f_5032:
    db   $ec, $ac, $dc, $ac, $e8, $5c, $7c, $5c        ;; 0f:5032 ........
    db   $4c, $dc, $4c, $0c, $ec, $ac, $e8, $0c        ;; 0f:503a ........
    db   $fa, $04                                      ;; 0f:5042 ..
.data_0f_5044:
    db   $2c, $dc, $2d, $df, $f9                       ;; 0f:5044 .....
    dw   .data_0f_5044                                 ;; 0f:5049 pP
    db   $fb, $01                                      ;; 0f:504b ..
    dw   .data_0f_5064                                 ;; 0f:504d pP
    db   $fa, $04                                      ;; 0f:504f ..
.data_0f_5051:
    db   $2c, $dc, $2d, $df, $f9                       ;; 0f:5051 .....
    dw   .data_0f_5051                                 ;; 0f:5056 pP
    db   $fa, $04                                      ;; 0f:5058 ..
.data_0f_505a:
    db   $5c, $dc, $5d, $df, $f9                       ;; 0f:505a .....
    dw   .data_0f_505a                                 ;; 0f:505f pP
    db   $f2                                           ;; 0f:5061 .
    dw   .data_0f_5032                                 ;; 0f:5062 pP
.data_0f_5064:
    db   $fa, $02                                      ;; 0f:5064 ..
.data_0f_5066:
    db   $ec, $a6, $d3, $e8, $0c, $dc, $09, $d3        ;; 0f:5066 ........
    db   $f9                                           ;; 0f:506e .
    dw   .data_0f_5066                                 ;; 0f:506f pP
    db   $ec, $a7, $e8, $07, $27, $47, $5c, $4c        ;; 0f:5071 ????????
    db   $2c, $0c, $ec, $ac, $9c, $7c, $e8, $7c        ;; 0f:5079 ????????
    db   $ec, $7c, $9c, $e8, $9c, $ec, $9c, $f1        ;; 0f:5081 ????????
    db   $26, $50                                      ;; 0f:5089 ??

data_0f_508b:
    db   $d0, $f0                                      ;; 0f:508b ..
    dw   $661b                                         ;; 0f:508d wP
.data_0f_508f:
    db   $f6, $01, $b9, $bc, $b9, $bc, $b9, $bc        ;; 0f:508f .w......
    db   $f6, $02, $7e, $5e, $d9, $f1                  ;; 0f:5097 .w....
    dw   .data_0f_508f                                 ;; 0f:509d pP

data_0f_509f:
    db   $fe, $7d, $68, $66                            ;; 0f:509f ....
    dw   $6611                                         ;; 0f:50a3 wP
    db   $c0, $03, $e2, $2c, $4c, $5c, $7c, $9c        ;; 0f:50a5 .w......
    db   $ac, $e8, $0c, $1c, $f0                       ;; 0f:50ad .....
    dw   $6651                                         ;; 0f:50b2 wP
    db   $e3, $96, $26, $54, $4c, $5c, $49, $09        ;; 0f:50b4 ........
    db   $ec, $a9, $e8, $09, $96, $76, $56, $46        ;; 0f:50bc ????????
    db   $24, $ec, $ac, $e8, $0c, $24, $1c, $2c        ;; 0f:50c4 ????????
    db   $43, $56, $26, $94, $4c, $5c, $74, $7c        ;; 0f:50cc ????????
    db   $5c, $44, $2c, $1c, $24, $a9, $99, $79        ;; 0f:50d4 ????????
    db   $59, $49, $54, $4c, $5c, $73, $fa, $02        ;; 0f:50dc ????????
    db   $26, $ec, $96, $a4, $e8, $5c, $4c, $29        ;; 0f:50e4 ????????
    db   $ec, $99, $a9, $e8, $09, $56, $46, $26        ;; 0f:50ec ????????
    db   $ec, $96, $a4, $e8, $5c, $4c, $29, $ec        ;; 0f:50f4 ????????
    db   $99, $e8, $59, $49, $ec, $ac, $9c, $a9        ;; 0f:50fc ????????
    db   $e8, $0c, $ec, $ac, $e8, $09, $f9, $e4        ;; 0f:5104 ????????
    db   $50, $f1, $b4, $50                            ;; 0f:510c ????

data_0f_5110:
    db   $fe, $63, $66                                 ;; 0f:5110 ...
    dw   $6613                                         ;; 0f:5113 wP
    db   $40, $03, $e1, $9c, $ac, $e8, $0c, $2c        ;; 0f:5115 .w......
    db   $4c, $5c, $7c, $8c, $e2, $59, $59, $4c        ;; 0f:511d ........
    db   $5c, $4c, $2c, $99, $99, $e8, $f6, $02        ;; 0f:5125 .......w
    db   $2c, $0c, $ec, $a9, $f6, $03, $79, $79        ;; 0f:512d .....w..
    db   $5c, $4c, $5c, $7c, $f6, $02, $e8, $59        ;; 0f:5135 ????????
    db   $79, $f6, $01, $49, $09, $f6, $03, $ec        ;; 0f:513d ????????
    db   $29, $29, $4c, $0c, $2c, $ec, $9c, $e8        ;; 0f:5145 ????????
    db   $59, $59, $4c, $5c, $49, $f6, $02, $96        ;; 0f:514d ????????
    db   $ac, $9c, $7c, $5c, $f6, $01, $76, $9c        ;; 0f:5155 ????????
    db   $7c, $5c, $7c, $f6, $03, $99, $99, $7c        ;; 0f:515d ????????
    db   $5c, $4c, $5c, $59, $59, $f6, $02, $4c        ;; 0f:5165 ????????
    db   $5c, $49, $f6, $03, $09, $09, $4c, $2c        ;; 0f:516d ????????
    db   $0c, $2c, $f6, $01, $e8, $09, $ec, $79        ;; 0f:5175 ????????
    db   $f6, $02, $e8, $09, $ec, $79, $f6, $03        ;; 0f:517d ????????
    db   $59, $59, $4c, $2c, $0c, $2c, $e8, $09        ;; 0f:5185 ????????
    db   $ec, $a9, $99, $79, $f6, $01, $96, $ac        ;; 0f:518d ????????
    db   $9c, $7c, $9c, $f6, $02, $46, $4c, $e8        ;; 0f:5195 ????????
    db   $0c, $ec, $7c, $4c, $f6, $03, $fa, $02        ;; 0f:519d ????????
    db   $96, $56, $76, $e8, $76, $56, $46, $26        ;; 0f:51a5 ????????
    db   $06, $ec, $96, $56, $76, $e8, $56, $f6        ;; 0f:51ad ????????
    db   $01, $a9, $99, $f6, $02, $e8, $29, $09        ;; 0f:51b5 ????????
    db   $f6, $01, $2c, $0c, $29, $f6, $02, $4c        ;; 0f:51bd ????????
    db   $2c, $49, $ed, $f6, $03, $f9, $a5, $51        ;; 0f:51c5 ????????
    db   $f1, $21, $51                                 ;; 0f:51cd ???

data_0f_51d0:
    db   $fe, $63, $66, $20, $e2, $66, $03, $d3        ;; 0f:51d0 ......w.
    db   $fa, $04                                      ;; 0f:51d8 ..
.data_0f_51da:
    db   $e1, $29, $e8, $29, $f9                       ;; 0f:51da .....
    dw   .data_0f_51da                                 ;; 0f:51df pP
    db   $ec, $09, $e8, $09, $ec, $09, $e8, $09        ;; 0f:51e1 ....????
    db   $ed, $a9, $e8, $a9, $09, $e8, $09, $fa        ;; 0f:51e9 ????????
    db   $04, $ec, $29, $e8, $29, $f9, $f2, $51        ;; 0f:51f1 ????????
    db   $ed, $a9, $e8, $a9, $ec, $a9, $e8, $a9        ;; 0f:51f9 ????????
    db   $e8, $09, $ec, $09, $e8, $09, $ec, $09        ;; 0f:5201 ????????
    db   $fa, $04, $e1, $29, $e8, $29, $f9, $0b        ;; 0f:5209 ????????
    db   $52, $fa, $04, $ec, $09, $e8, $09, $f9        ;; 0f:5211 ????????
    db   $14, $52, $fa, $04, $e0, $a9, $e8, $a9        ;; 0f:5219 ????????
    db   $f9, $1d, $52, $59, $e8, $59, $ec, $59        ;; 0f:5221 ????????
    db   $e8, $59, $ec, $09, $e8, $09, $ec, $09        ;; 0f:5229 ????????
    db   $e8, $09, $f3, $02, $e0, $fa, $04, $2c        ;; 0f:5231 ????????
    db   $e8, $f9, $38, $52, $f6, $01, $fa, $04        ;; 0f:5239 ????????
    db   $2c, $ec, $f9, $41, $52, $f6, $03, $fa        ;; 0f:5241 ????????
    db   $04, $ac, $e8, $f9, $4a, $52, $f6, $02        ;; 0f:5249 ????????
    db   $fa, $04, $ac, $ec, $f9, $53, $52, $f6        ;; 0f:5251 ????????
    db   $03, $e9, $59, $e8, $59, $ec, $49, $e8        ;; 0f:5259 ????????
    db   $49, $ec, $29, $e8, $29, $ec, $09, $e8        ;; 0f:5261 ????????
    db   $09, $e0, $fa, $04, $2c, $e8, $f9, $6d        ;; 0f:5269 ????????
    db   $52, $f6, $01, $fa, $04, $2c, $ec, $f9        ;; 0f:5271 ????????
    db   $76, $52, $f6, $03, $fa, $04, $ac, $e8        ;; 0f:5279 ????????
    db   $f9, $7f, $52, $f6, $02, $fa, $04, $ac        ;; 0f:5281 ????????
    db   $ec, $f9, $88, $52, $f6, $03, $e9, $59        ;; 0f:5289 ????????
    db   $e8, $59, $ec, $09, $e8, $09, $ec, $29        ;; 0f:5291 ????????
    db   $e8, $29, $ec, $49, $e8, $49, $f2, $35        ;; 0f:5299 ????????
    db   $52, $f1, $d8, $51                            ;; 0f:52a1 ????

data_0f_52a5:
    db   $f0                                           ;; 0f:52a5 .
    dw   $661b                                         ;; 0f:52a6 wP
    db   $d3                                           ;; 0f:52a8 .
.data_0f_52a9:
    db   $f6, $02, $59, $bc, $bc, $f6, $01, $79        ;; 0f:52a9 .w....w.
    db   $bc, $bc, $f1                                 ;; 0f:52b1 ...
    dw   .data_0f_52a9                                 ;; 0f:52b4 pP

data_0f_52b6:
    db   $fe, $42, $63, $66, $41, $66, $80, $03        ;; 0f:52b6 ????????
    db   $f3, $02, $fa, $02, $e0, $99, $e8, $19        ;; 0f:52be ????????
    db   $49, $79, $99, $b9, $99, $79, $f9, $c2        ;; 0f:52c6 ????????
    db   $52, $ec, $79, $b9, $e8, $29, $59, $79        ;; 0f:52ce ????????
    db   $99, $79, $59, $ec, $99, $e8, $19, $49        ;; 0f:52d6 ????????
    db   $79, $99, $b9, $99, $79, $f2, $c0, $52        ;; 0f:52de ????????
    db   $f3, $02, $ec, $79, $b9, $e8, $29, $59        ;; 0f:52e6 ????????
    db   $79, $99, $79, $59, $ec, $fb, $01, $03        ;; 0f:52ee ????????
    db   $53, $99, $e8, $19, $49, $79, $99, $b9        ;; 0f:52f6 ????????
    db   $99, $79, $f2, $e8, $52, $89, $b9, $e8        ;; 0f:52fe ????????
    db   $29, $49, $69, $89, $69, $49, $f1, $be        ;; 0f:5306 ????????
    db   $52                                           ;; 0f:530e ?

data_0f_530f:
    db   $fe, $63, $66, $3d, $66, $00, $03, $e4        ;; 0f:530f ????????
    db   $f6, $02, $49, $ec, $49, $f6, $03, $49        ;; 0f:5317 ????????
    db   $ec, $49, $f6, $01, $e3, $49, $e8, $44        ;; 0f:531f ????????
    db   $f1, $17, $53                                 ;; 0f:5327 ???

data_0f_532a:
    db   $fe, $68, $66, $20, $b2, $66, $03, $fa        ;; 0f:532a ????????
    db   $02, $e4, $43, $26, $ec, $bc, $e8, $1c        ;; 0f:5332 ????????
    db   $29, $13, $ec, $96, $f0, $40, $c6, $f0        ;; 0f:533a ????????
    db   $20, $b3, $76, $7c, $9c, $bc, $7c, $93        ;; 0f:5342 ????????
    db   $f0, $40, $c4, $d9, $f0, $20, $f9, $33        ;; 0f:534a ????????
    db   $53, $73, $b6, $e8, $26, $13, $ec, $96        ;; 0f:5352 ????????
    db   $f0, $40, $c6, $f0, $20, $b3, $76, $e8        ;; 0f:535a ????????
    db   $26, $43, $f0, $40, $c4, $d9, $f0, $20        ;; 0f:5362 ????????
    db   $f1, $31, $53                                 ;; 0f:536a ???

data_0f_536d:
    db   $fe, $c8, $8c, $66, $ef, $65, $c0, $03        ;; 0f:536d ????????
    db   $e3, $90, $e8, $20, $00, $54, $04, $ec        ;; 0f:5375 ????????
    db   $b4, $74, $90, $70, $50, $ec, $94, $74        ;; 0f:537d ????????
    db   $e8, $04, $ec, $b4, $e8, $92, $e8, $02        ;; 0f:5385 ????????
    db   $ec, $b2, $72, $e8, $02, $ec, $b2, $e8        ;; 0f:538d ????????
    db   $20, $fa, $08, $40, $f9, $98, $53, $f1        ;; 0f:5395 ????????
    db   $75, $53                                      ;; 0f:539d ??

data_0f_539f:
    db   $fe, $63, $66, $fb, $65, $40, $03, $e3        ;; 0f:539f ????????
    db   $40, $70, $50, $ec, $f0, $11, $66, $5d        ;; 0f:53a7 ????????
    db   $cd, $9d, $cd, $e8, $0d, $cd, $59, $f6        ;; 0f:53af ????????
    db   $02, $99, $89, $99, $f6, $01, $b9, $99        ;; 0f:53b7 ????????
    db   $b9, $f6, $02, $e8, $09, $ec, $b9, $e8        ;; 0f:53bf ????????
    db   $09, $f6, $03, $f0, $fb, $65, $ec, $40        ;; 0f:53c7 ????????
    db   $20, $00, $f0, $11, $66, $e8, $0d, $cd        ;; 0f:53cf ????????
    db   $ec, $bd, $cd, $9d, $cd, $79, $f6, $01        ;; 0f:53d7 ????????
    db   $59, $ec, $b9, $e8, $49, $f6, $02, $09        ;; 0f:53df ????????
    db   $ec, $49, $e8, $29, $f6, $01, $ec, $59        ;; 0f:53e7 ????????
    db   $b9, $79, $f6, $03, $f0, $fb, $65, $e8        ;; 0f:53ef ????????
    db   $42, $52, $72, $22, $92, $72, $b0, $f0        ;; 0f:53f7 ????????
    db   $11, $66, $fa, $08, $f6, $01, $99, $29        ;; 0f:53ff ????????
    db   $49, $f6, $03, $99, $29, $49, $f6, $02        ;; 0f:5407 ????????
    db   $99, $29, $49, $f6, $03, $99, $29, $49        ;; 0f:540f ????????
    db   $f9, $03, $54, $f0, $fb, $65, $f1, $a6        ;; 0f:5417 ????????
    db   $53                                           ;; 0f:541f ?

data_0f_5420:
    db   $fe, $8c, $66, $20, $e2, $66, $03, $e1        ;; 0f:5420 ????????
    db   $fa, $06, $99, $e8, $99, $ec, $f9, $2a        ;; 0f:5428 ????????
    db   $54, $f3, $02, $fa, $0c, $99, $e8, $99        ;; 0f:5430 ????????
    db   $ec, $f9, $35, $54, $fb, $01, $57, $54        ;; 0f:5438 ????????
    db   $57, $dc, $5a, $de, $9a, $de, $9a, $de        ;; 0f:5440 ????????
    db   $9a, $de, $77, $dc, $7a, $de, $4a, $de        ;; 0f:5448 ????????
    db   $4a, $de, $4a, $de, $f2, $33, $54, $fa        ;; 0f:5450 ????????
    db   $06, $59, $e8, $59, $ec, $f9, $59, $54        ;; 0f:5458 ????????
    db   $57, $dc, $5a, $de, $4a, $de, $4a, $de        ;; 0f:5460 ????????
    db   $4a, $de, $07, $dc, $0a, $de, $ec, $ba        ;; 0f:5468 ????????
    db   $de, $ba, $de, $ba, $de, $e8, $96, $e8        ;; 0f:5470 ????????
    db   $09, $ec, $99, $e8, $09, $ec, $99, $57        ;; 0f:5478 ????????
    db   $dc, $59, $e8, $09, $ec, $b9, $e8, $09        ;; 0f:5480 ????????
    db   $27, $dc, $29, $09, $ec, $b9, $99, $77        ;; 0f:5488 ????????
    db   $dc, $79, $e8, $29, $19, $29, $ec, $97        ;; 0f:5490 ????????
    db   $dc, $99, $e8, $49, $ec, $99, $e8, $49        ;; 0f:5498 ????????
    db   $27, $dc, $29, $09, $ec, $b9, $99, $77        ;; 0f:54a0 ????????
    db   $dc, $79, $e8, $79, $ec, $79, $e8, $79        ;; 0f:54a8 ????????
    db   $77, $dc, $79, $ec, $79, $29, $b9, $90        ;; 0f:54b0 ????????
    db   $70, $50, $70, $90, $70, $50, $70, $f1        ;; 0f:54b8 ????????
    db   $27, $54                                      ;; 0f:54c0 ??

data_0f_54c2:
    db   $f0, $1b, $66, $f6, $01, $b9, $b9, $b9        ;; 0f:54c2 ????????
    db   $f6, $02, $79, $b9, $b9, $f6, $03, $52        ;; 0f:54ca ????????
    db   $f1, $c5, $54                                 ;; 0f:54d2 ???

data_0f_54d5:
    db   $fe, $4a, $7a, $66                            ;; 0f:54d5 ....
    dw   $662b                                         ;; 0f:54d9 wP
    db   $80, $03, $e3, $43, $96, $46, $61, $43        ;; 0f:54db .w......
    db   $96, $46, $61, $43, $96, $46, $51, $f0        ;; 0f:54e3 ......??
    db   $5d, $66, $e8, $03, $ec, $b3, $f0, $2b        ;; 0f:54eb ????????
    db   $66, $ec, $b4, $e8, $16, $ec, $49, $99        ;; 0f:54f3 ????????
    db   $e8, $19, $24, $14, $ec, $b6, $e8, $13        ;; 0f:54fb ????????
    db   $c9, $49, $89, $99, $64, $23, $c9, $b4        ;; 0f:5503 ????????
    db   $93, $c9, $54, $04, $ec, $96, $e8, $44        ;; 0f:550b ????????
    db   $23, $c9, $ec, $b4, $e8, $10, $c9, $ec        ;; 0f:5513 ????????
    db   $b4, $90, $c9, $f1, $dd, $54                  ;; 0f:551b ??????

data_0f_5521:
    db   $fe, $63, $66                                 ;; 0f:5521 ...
    dw   $665f                                         ;; 0f:5524 wP
    db   $40, $02, $e1, $f3, $05                       ;; 0f:5526 .w...
.data_0f_552b:
    db   $f6, $02, $e8, $19, $ec, $49, $99, $49        ;; 0f:552b .w......
    db   $f6, $01, $e8, $16, $ec, $99, $49, $f6        ;; 0f:5533 .w......
    db   $02, $e8, $29, $ec, $69, $99, $69, $f6        ;; 0f:553b w.......
    db   $01, $e8, $26, $ec, $99, $69, $fb, $05        ;; 0f:5543 w.......
    dw   .data_0f_5598                                 ;; 0f:554b pP
    db   $fb, $03, $98, $55, $f6, $02, $e8, $19        ;; 0f:554d ..??.w..
    db   $ec, $49, $99, $49, $f6, $01, $e8, $16        ;; 0f:5555 .....w..
    db   $ec, $99, $49, $f6, $02, $e8, $09, $ec        ;; 0f:555d ..??????
    db   $09, $99, $09, $f6, $01, $e8, $06, $ec        ;; 0f:5565 ????????
    db   $99, $09, $fb, $04, $7d, $55, $fb, $02        ;; 0f:556d ????????
    db   $86, $55, $f2, $2b, $55, $f1, $29, $55        ;; 0f:5575 ????????
    db   $e8, $43, $f6, $02, $23, $ec, $f2, $2b        ;; 0f:557d ????????
    db   $55, $f6, $02, $e8, $29, $ec, $69, $99        ;; 0f:5585 ????????
    db   $69, $f6, $01, $e8, $26, $ec, $99, $69        ;; 0f:558d ????????
    db   $f2, $2b, $55                                 ;; 0f:5595 ???
.data_0f_5598:
    db   $f2                                           ;; 0f:5598 .
    dw   .data_0f_552b                                 ;; 0f:5599 pP

data_0f_559b:
    db   $fe, $63, $66, $20, $d2, $66, $03, $f3        ;; 0f:559b ......w.
    db   $03                                           ;; 0f:55a3 .
.data_0f_55a4:
    db   $e1, $94, $e8, $44, $ec, $96, $fb, $01        ;; 0f:55a4 ........
    db   $b6, $55, $24, $e8, $24, $ec, $86, $f2        ;; 0f:55ac ??......
    dw   .data_0f_55a4                                 ;; 0f:55b4 pP
    db   $54, $e8, $04, $ec, $56, $59, $d4, $79        ;; 0f:55b6 ????????
    db   $d4, $f3, $03, $e1, $94, $e8, $44, $ec        ;; 0f:55be ????????
    db   $96, $fb, $01, $d3, $55, $24, $e8, $24        ;; 0f:55c6 ????????
    db   $ec, $86, $f2, $c1, $55, $54, $e8, $04        ;; 0f:55ce ????????
    db   $ec, $56, $24, $e8, $24, $ec, $86, $e1        ;; 0f:55d6 ????????
    db   $94, $e8, $44, $ec, $96, $24, $e8, $24        ;; 0f:55de ????????
    db   $ec, $86, $e1, $94, $e8, $44, $ec, $96        ;; 0f:55e6 ????????
    db   $53, $73, $f1, $a2, $55                       ;; 0f:55ee ?????

data_0f_55f3:
    db   $fe, $4c, $63, $66                            ;; 0f:55f3 ....
    dw   $6613                                         ;; 0f:55f7 wP
    db   $c0, $03, $fa, $0a                            ;; 0f:55f9 .w..
.data_0f_55fd:
    db   $e4, $2c, $ec, $7c, $7c, $e8, $2c, $ec        ;; 0f:55fd ........
    db   $7c, $7c, $e8, $2c, $ec, $7c, $e8, $0c        ;; 0f:5605 ........
    db   $ec, $7c, $f9                                 ;; 0f:560d ...
    dw   .data_0f_55fd                                 ;; 0f:5610 pP
    db   $f0                                           ;; 0f:5612 .
    dw   $660f                                         ;; 0f:5613 wP
    db   $fa, $02                                      ;; 0f:5615 ..
.data_0f_5617:
    db   $79, $2c, $99, $2c, $ac, $2c, $7c, $2c        ;; 0f:5617 ........
    db   $99, $2c, $a9, $2c, $e8, $0c, $ec, $2c        ;; 0f:561f ........
    db   $9c, $2c, $a9, $3c, $e8, $09, $ec, $3c        ;; 0f:5627 ........
    db   $ac, $3c, $9c, $3c, $79, $3c, $99, $3c        ;; 0f:562f ........
    db   $ac, $3c, $9c, $3c, $a9, $4c, $e8, $09        ;; 0f:5637 ........
    db   $ec, $4c, $e8, $2c, $ec, $4c, $e8, $0c        ;; 0f:563f ........
    db   $ec, $4c, $a9, $0c, $99, $0c, $7c, $0c        ;; 0f:5647 ........
    db   $9c, $0c, $e8, $29, $ec, $3c, $e8, $09        ;; 0f:564f ........
    db   $ec, $3c, $e8, $3c, $ec, $3c, $e8, $2c        ;; 0f:5657 ........
    db   $ec, $3c, $e8, $0c, $ec, $3c, $ac, $3c        ;; 0f:565f ........
    db   $9c, $3c, $7c, $ec, $ac, $e8, $5c, $ec        ;; 0f:5667 ........
    db   $9c, $e8, $f9                                 ;; 0f:566f ...
    dw   .data_0f_5617                                 ;; 0f:5672 pP
    db   $f0                                           ;; 0f:5674 .
    dw   $662b                                         ;; 0f:5675 wP
    db   $73, $c9, $53, $c9, $33, $c9, $f6, $02        ;; 0f:5677 ...?????
    db   $7c, $2c, $7c, $f6, $01, $9c, $2c, $9c        ;; 0f:567f ????????
    db   $f6, $02, $ac, $2c, $f6, $01, $e8, $0c        ;; 0f:5687 ????????
    db   $ec, $2c, $f6, $03, $73, $c9, $93, $c9        ;; 0f:568f ????????
    db   $99, $ac, $76, $c7, $f6, $02, $e8, $2c        ;; 0f:5697 ????????
    db   $ec, $7c, $e8, $2c, $f6, $01, $0c, $ec        ;; 0f:569f ????????
    db   $7c, $e8, $0c, $f6, $02, $ec, $ac, $2c        ;; 0f:56a7 ????????
    db   $f6, $01, $9c, $2c, $f1, $f3, $55             ;; 0f:56af ???????

data_0f_56b6:
    db   $fe, $8c, $66                                 ;; 0f:56b6 ...
    dw   $6619                                         ;; 0f:56b9 wP
    db   $00, $03, $dd, $f3, $06                       ;; 0f:56bb .w...
.data_0f_56c0:
    db   $e4, $2c, $ec, $7c, $7c, $e8, $2c, $ec        ;; 0f:56c0 ........
    db   $7c, $7c, $e8, $2c, $ec, $7c, $e8, $0c        ;; 0f:56c8 ........
    db   $ec, $fb, $01                                 ;; 0f:56d0 ...
    dw   .data_0f_56d9                                 ;; 0f:56d3 pP
    db   $7c, $f2                                      ;; 0f:56d5 ..
    dw   .data_0f_56c0                                 ;; 0f:56d7 pP
.data_0f_56d9:
    db   $7f, $f0                                      ;; 0f:56d9 ..
    dw   $6645                                         ;; 0f:56db wP
    db   $e2, $fa, $02                                 ;; 0f:56dd ...
.data_0f_56e0:
    db   $f6, $02, $73, $c9, $f6, $01, $73, $c9        ;; 0f:56e0 .w...w..
    db   $f9                                           ;; 0f:56e8 .
    dw   .data_0f_56e0                                 ;; 0f:56e9 pP
    db   $fa, $02                                      ;; 0f:56eb ..
.data_0f_56ed:
    db   $f6, $02, $73, $c9, $f6, $01, $73, $c9        ;; 0f:56ed .w...w..
    db   $f6, $02, $33, $c9, $f6, $01, $33, $c9        ;; 0f:56f5 .w...w..
    db   $f6, $02, $43, $c9, $f6, $01, $43, $c9        ;; 0f:56fd .w...w..
    db   $f6, $02, $33, $c9, $f6, $01, $33, $c9        ;; 0f:5705 .w...w..
    db   $f9                                           ;; 0f:570d .
    dw   .data_0f_56ed                                 ;; 0f:570e pP
    db   $f6, $03, $f0                                 ;; 0f:5710 .w.
    dw   $6631                                         ;; 0f:5713 wP
    db   $e8, $23, $c9, $03, $c9, $a3, $c9, $ec        ;; 0f:5715 ....????
    db   $a7, $97, $59, $29, $e8, $23, $c9, $23        ;; 0f:571d ????????
    db   $c9, $33, $c9, $ec, $37, $57, $79, $99        ;; 0f:5725 ????????
    db   $f1, $b6, $56                                 ;; 0f:572d ???

data_0f_5730:
    db   $fe, $68, $66, $20, $e2, $66, $03, $e2        ;; 0f:5730 ......w.
    db   $71, $c6, $31, $c6, $51, $c6, $e1, $f3        ;; 0f:5738 ........
    db   $1c                                           ;; 0f:5740 .
.data_0f_5741:
    db   $7c, $d9, $7c, $d9, $7c, $dc, $7c, $dc        ;; 0f:5741 ........
    db   $f2                                           ;; 0f:5749 .
    dw   .data_0f_5741                                 ;; 0f:574a pP
    db   $f1, $37, $57                                 ;; 0f:574c ???

data_0f_574f:
    db   $f0                                           ;; 0f:574f .
    dw   $661b                                         ;; 0f:5750 wP
    db   $d0, $d0, $d2, $fa, $0e                       ;; 0f:5752 .....
.data_0f_5757:
    db   $f6, $02, $57, $57, $59, $f6, $01, $79        ;; 0f:5757 .w....w.
    db   $f6, $02, $57, $57, $59, $f6, $03, $7c        ;; 0f:575f .w....w.
    db   $7c, $f9                                      ;; 0f:5767 ..
    dw   .data_0f_5757                                 ;; 0f:5769 pP
    db   $f1, $52, $57                                 ;; 0f:576b ???

data_0f_576e:
    db   $fe, $78, $63, $66, $0d, $66, $c0, $03        ;; 0f:576e ????????
    db   $f6, $03, $e0, $47, $47, $43, $c9, $f6        ;; 0f:5776 ????????
    db   $01, $e8, $9c, $bc, $9c, $7c, $5c, $7c        ;; 0f:577e ????????
    db   $f6, $02, $44, $ec, $9c, $e8, $0c, $4c        ;; 0f:5786 ????????
    db   $9c, $f6, $03, $ec, $57, $57, $53, $c9        ;; 0f:578e ????????
    db   $f6, $02, $e9, $0c, $2c, $0c, $ec, $bc        ;; 0f:5796 ????????
    db   $9c, $7c, $f6, $01, $54, $59, $9c, $e8        ;; 0f:579e ????????
    db   $2c, $f6, $03, $ed, $77, $77, $73, $c9        ;; 0f:57a6 ????????
    db   $f6, $01, $e9, $4c, $2c, $0c, $ec, $b9        ;; 0f:57ae ????????
    db   $f6, $02, $9c, $e8, $4c, $5c, $f6, $01        ;; 0f:57b6 ????????
    db   $ec, $b9, $7c, $59, $f6, $02, $4c, $29        ;; 0f:57be ????????
    db   $f6, $03, $ec, $97, $97, $93, $c9, $f6        ;; 0f:57c6 ????????
    db   $02, $e8, $4c, $9c, $e8, $49, $ec, $f6        ;; 0f:57ce ????????
    db   $01, $bc, $e8, $0c, $ec, $bc, $7c, $f6        ;; 0f:57d6 ????????
    db   $02, $5c, $4c, $2c, $09, $f6, $01, $ec        ;; 0f:57de ????????
    db   $9c, $7c, $e8, $2c, $f1, $76, $57             ;; 0f:57e6 ???????

data_0f_57ed:
    db   $fe, $63, $66, $31, $66, $40, $03, $d6        ;; 0f:57ed ????????
    db   $e2, $99, $b9, $d3, $bc, $d9, $9c, $d9        ;; 0f:57f5 ????????
    db   $b9, $d9, $e8, $64, $d6, $ec, $b9, $e8        ;; 0f:57fd ????????
    db   $09, $d3, $4c, $d9, $2c, $d9, $09, $d9        ;; 0f:5805 ????????
    db   $04, $d6, $09, $29, $d3, $4c, $d9, $2c        ;; 0f:580d ????????
    db   $d9, $49, $d9, $24, $d6, $29, $49, $d3        ;; 0f:5815 ????????
    db   $4c, $ec, $bc, $7c, $e8, $42, $cc, $ec        ;; 0f:581d ????????
    db   $72, $ec, $b6, $e8, $41, $51, $51, $71        ;; 0f:5825 ????????
    db   $71, $41, $41, $b1, $b3, $43, $91, $91        ;; 0f:582d ????????
    db   $23, $ec, $b3, $e8, $71, $41, $41, $f1        ;; 0f:5835 ????????
    db   $f4, $57                                      ;; 0f:583d ??

data_0f_583f:
    db   $fe, $68, $66, $20, $d2, $66, $03, $d6        ;; 0f:583f ????????
    db   $e4, $29, $49, $d3, $4c, $d9, $2c, $d9        ;; 0f:5847 ????????
    db   $49, $d9, $b4, $d6, $49, $59, $d3, $9c        ;; 0f:584f ????????
    db   $d9, $7c, $d9, $59, $d9, $54, $d6, $59        ;; 0f:5857 ????????
    db   $79, $d3, $bc, $d9, $9c, $d9, $b9, $d9        ;; 0f:585f ????????
    db   $74, $d6, $79, $99, $d3, $bc, $7c, $4c        ;; 0f:5867 ????????
    db   $92, $cc, $ec, $b2, $4c, $6c, $7c, $9c        ;; 0f:586f ????????
    db   $b1, $e8, $06, $ec, $bc, $9c, $7c, $5c        ;; 0f:5877 ????????
    db   $e8, $53, $93, $e8, $24, $1c, $0c, $ec        ;; 0f:587f ????????
    db   $b3, $43, $29, $0c, $ec, $b9, $e8, $0c        ;; 0f:5887 ????????
    db   $2c, $7c, $0c, $2c, $0c, $ec, $b9, $7c        ;; 0f:588f ????????
    db   $bc, $e8, $2c, $ec, $b7, $e8, $07, $ec        ;; 0f:5897 ????????
    db   $93, $c9, $e8, $4c, $0c, $ec, $9c, $e8        ;; 0f:589f ????????
    db   $2c, $ec, $bc, $7c, $e8, $0c, $ec, $9c        ;; 0f:58a7 ????????
    db   $4c, $0c, $ec, $9c, $4c, $e9, $4c, $0c        ;; 0f:58af ????????
    db   $ec, $9c, $5c, $46, $4c, $5c, $4c, $2c        ;; 0f:58b7 ????????
    db   $43, $e8, $44, $ec, $b4, $99, $79, $53        ;; 0f:58bf ????????
    db   $e8, $2c, $0c, $ec, $bc, $e8, $0c, $ec        ;; 0f:58c7 ????????
    db   $9c, $bc, $7c, $9c, $e8, $2c, $0c, $ec        ;; 0f:58cf ????????
    db   $bc, $e8, $0c, $5c, $4c, $2c, $0c, $9c        ;; 0f:58d7 ????????
    db   $7c, $5c, $4c, $2c, $0c, $ec, $bc, $9c        ;; 0f:58df ????????
    db   $74, $5c, $4c, $23, $b4, $e8, $0c, $ec        ;; 0f:58e7 ????????
    db   $bc, $79, $bc, $e8, $2c, $79, $ec, $b9        ;; 0f:58ef ????????
    db   $e8, $0d, $cd, $ec, $9d, $cd, $4d, $cd        ;; 0f:58f7 ????????
    db   $e8, $2d, $cd, $ec, $9d, $cd, $4d, $cd        ;; 0f:58ff ????????
    db   $e8, $4d, $cd, $ec, $9d, $cd, $4d, $cd        ;; 0f:5907 ????????
    db   $e8, $9d, $cd, $0d, $cd, $ec, $9d, $cd        ;; 0f:590f ????????
    db   $e8, $4c, $0c, $ec, $99, $e8, $2c, $ec        ;; 0f:5917 ????????
    db   $bc, $79, $ec, $9c, $e8, $0c, $4c, $9c        ;; 0f:591f ????????
    db   $4c, $9c, $e8, $0c, $4c, $f1, $46, $58        ;; 0f:5927 ????????

data_0f_592f:
    db   $f0, $1b, $66, $f6, $01, $77, $77, $79        ;; 0f:592f ????????
    db   $f6, $02, $5c, $9c, $5c, $5c, $f6, $03        ;; 0f:5937 ????????
    db   $7e, $7e, $57, $f1, $32, $59                  ;; 0f:593f ??????

data_0f_5945:
    db   $fe, $8c, $63, $66, $0d, $66, $40, $02        ;; 0f:5945 ????????
    db   $fa, $02, $e3, $b9, $49, $99, $39, $79        ;; 0f:594d ????????
    db   $ec, $b9, $e8, $49, $ec, $a9, $e8, $a9        ;; 0f:5955 ????????
    db   $49, $99, $ec, $b9, $e8, $69, $ec, $b9        ;; 0f:595d ????????
    db   $f9, $4f, $59, $fa, $02, $e8, $a9, $39        ;; 0f:5965 ????????
    db   $89, $29, $69, $ec, $a9, $e8, $39, $ec        ;; 0f:596d ????????
    db   $99, $e8, $99, $39, $89, $ec, $a9, $e8        ;; 0f:5975 ????????
    db   $59, $ec, $a9, $f9, $6a, $59, $f1, $4d        ;; 0f:597d ????????
    db   $59                                           ;; 0f:5985 ?

data_0f_5986:
    db   $fe, $87, $66, $15, $66, $40, $01, $dd        ;; 0f:5986 ????????
    db   $f1, $4d, $59                                 ;; 0f:598e ???

data_0f_5991:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e1        ;; 0f:5991 ????????
    db   $fa, $02, $49, $d6, $49, $d6, $4a, $de        ;; 0f:5999 ????????
    db   $4a, $de, $49, $d6, $49, $d6, $f9, $9b        ;; 0f:59a1 ????????
    db   $59, $fa, $02, $39, $d6, $39, $d6, $3a        ;; 0f:59a9 ????????
    db   $de, $3a, $de, $39, $d6, $39, $d6, $f9        ;; 0f:59b1 ????????
    db   $ac, $59, $f1, $98, $59                       ;; 0f:59b9 ?????

data_0f_59be:
    db   $f6, $03, $f0, $1b, $66, $44, $43, $d9        ;; 0f:59be ????????
    db   $53, $b9, $b9, $f1, $c3, $59                  ;; 0f:59c6 ??????

data_0f_59cc:
    db   $fe, $96, $63, $66                            ;; 0f:59cc ....
    dw   $661f                                         ;; 0f:59d0 wP
    db   $c0, $03, $e0, $99, $9c, $9c, $96, $79        ;; 0f:59d2 .w......
    db   $7c, $7c, $79, $e8, $06, $ec, $b9, $99        ;; 0f:59da ........
    db   $79, $5c, $4c, $59, $7c, $5c, $79, $fa        ;; 0f:59e2 ........
    db   $02                                           ;; 0f:59ea .
.data_0f_59eb:
    db   $f3, $08                                      ;; 0f:59eb ..
.data_0f_59ed:
    db   $99, $f2                                      ;; 0f:59ed ..
    dw   .data_0f_59ed                                 ;; 0f:59ef pP
    db   $f3, $08                                      ;; 0f:59f1 ..
.data_0f_59f3:
    db   $89, $f2                                      ;; 0f:59f3 ..
    dw   .data_0f_59f3                                 ;; 0f:59f5 pP
    db   $f3, $08                                      ;; 0f:59f7 ..
.data_0f_59f9:
    db   $79, $f2                                      ;; 0f:59f9 ..
    dw   .data_0f_59f9                                 ;; 0f:59fb pP
    db   $f3, $08                                      ;; 0f:59fd ..
.data_0f_59ff:
    db   $69, $f2                                      ;; 0f:59ff ..
    dw   .data_0f_59ff                                 ;; 0f:5a01 pP
    db   $f9                                           ;; 0f:5a03 .
    dw   .data_0f_59eb                                 ;; 0f:5a04 pP
    db   $f3, $02                                      ;; 0f:5a06 ..
.data_0f_5a08:
    db   $fa, $02                                      ;; 0f:5a08 ..
.data_0f_5a0a:
    db   $59, $59, $e8, $09, $ec, $59, $b9, $e8        ;; 0f:5a0a ........
    db   $09, $ec, $f9                                 ;; 0f:5a12 ...
    dw   .data_0f_5a0a                                 ;; 0f:5a15 pP
    db   $fb, $01, $2d, $5a, $fa, $02                  ;; 0f:5a17 ..??..
.data_0f_5a1d:
    db   $79, $79, $e8, $29, $ec, $79, $e8, $19        ;; 0f:5a1d ........
    db   $29, $ec, $f9                                 ;; 0f:5a25 ...
    dw   .data_0f_5a1d                                 ;; 0f:5a28 pP
    db   $f2                                           ;; 0f:5a2a .
    dw   .data_0f_5a08                                 ;; 0f:5a2b pP
    db   $79, $7c, $7c, $79, $99, $9c, $9c, $99        ;; 0f:5a2d ????????
    db   $b9, $bc, $bc, $b9, $99, $7c, $5c, $49        ;; 0f:5a35 ????????
    db   $f1, $e9, $59                                 ;; 0f:5a3d ???

data_0f_5a40:
    db   $fe, $63, $66                                 ;; 0f:5a40 ...
    dw   $6613                                         ;; 0f:5a43 wP
    db   $40, $03, $e3, $4c, $2c, $0c, $2c, $4c        ;; 0f:5a45 .w......
    db   $d7, $2c, $0c, $ec, $bc, $e8, $0c, $2c        ;; 0f:5a4d ........
    db   $dc, $46, $29, $09, $ec, $b9, $9c, $8c        ;; 0f:5a55 ........
    db   $99, $bc, $9c, $b9, $fa, $02                  ;; 0f:5a5d ......
.data_0f_5a63:
    db   $f3, $02                                      ;; 0f:5a63 ..
.data_0f_5a65:
    db   $f6, $02, $e8, $49, $ec, $49, $f6, $01        ;; 0f:5a65 .w.....w
    db   $e8, $09, $ec, $49, $f2                       ;; 0f:5a6d .....
    dw   .data_0f_5a65                                 ;; 0f:5a72 pP
    db   $f3, $02                                      ;; 0f:5a74 ..
.data_0f_5a76:
    db   $f6, $02, $e8, $49, $ec, $49, $f6, $01        ;; 0f:5a76 .w.....w
    db   $b9, $49, $f2                                 ;; 0f:5a7e ...
    dw   .data_0f_5a76                                 ;; 0f:5a81 pP
    db   $f3, $02                                      ;; 0f:5a83 ..
.data_0f_5a85:
    db   $f6, $02, $e8, $49, $ec, $49, $f6, $01        ;; 0f:5a85 .w.....w
    db   $99, $49, $f2                                 ;; 0f:5a8d ...
    dw   .data_0f_5a85                                 ;; 0f:5a90 pP
    db   $f3, $02                                      ;; 0f:5a92 ..
.data_0f_5a94:
    db   $f6, $02, $e8, $29, $ec, $29, $f6, $01        ;; 0f:5a94 .w.....w
    db   $99, $29, $f2                                 ;; 0f:5a9c ...
    dw   .data_0f_5a94                                 ;; 0f:5a9f pP
    db   $f9                                           ;; 0f:5aa1 .
    dw   .data_0f_5a63                                 ;; 0f:5aa2 pP
    db   $f3, $02                                      ;; 0f:5aa4 ..
.data_0f_5aa6:
    db   $fa, $02                                      ;; 0f:5aa6 ..
.data_0f_5aa8:
    db   $f6, $03, $b9, $e8, $09, $f6, $02, $ec        ;; 0f:5aa8 .w....w.
    db   $b9, $99, $f6, $01, $79, $59, $f9             ;; 0f:5ab0 ...w...
    dw   .data_0f_5aa8                                 ;; 0f:5ab7 pP
    db   $fb, $01, $d3, $5a, $fa, $02                  ;; 0f:5ab9 ..??..
.data_0f_5abf:
    db   $f6, $03, $e8, $09, $29, $f6, $02, $09        ;; 0f:5abf .w....w.
    db   $ec, $b9, $f6, $01, $99, $79, $f9             ;; 0f:5ac7 ...w...
    dw   .data_0f_5abf                                 ;; 0f:5ace pP
    db   $f2                                           ;; 0f:5ad0 .
    dw   .data_0f_5aa6                                 ;; 0f:5ad1 pP
    db   $ec, $f6, $03, $fa, $03, $bc, $bc, $bc        ;; 0f:5ad3 ????????
    db   $bc, $b9, $f9, $d8, $5a, $e9, $09, $ec        ;; 0f:5adb ????????
    db   $bc, $9c, $79, $f1, $61, $5a                  ;; 0f:5ae3 ??????

data_0f_5ae9:
    db   $fe, $a9, $66, $20, $d2, $66, $03, $e4        ;; 0f:5ae9 ......w.
    db   $0c, $ec, $bc, $9c, $bc, $e8, $0c, $d7        ;; 0f:5af1 ........
    db   $ec, $bc, $9c, $7c, $9c, $bc, $dc, $46        ;; 0f:5af9 ........
    db   $29, $09, $b9, $9c, $8c, $99, $bc, $9c        ;; 0f:5b01 ........
    db   $b9, $e8, $41, $e8, $22, $06, $ec, $b2        ;; 0f:5b09 ........
    db   $e8, $06, $ec, $91, $02, $ec, $b9, $e8        ;; 0f:5b11 ........
    db   $09, $23, $ec, $b3, $e8, $06, $26, $46        ;; 0f:5b19 ........
    db   $76, $61, $b2, $e8, $06, $ec, $93, $e8        ;; 0f:5b21 ........
    db   $02, $26, $ec, $b3, $93, $b6, $e8, $06        ;; 0f:5b29 ........
    db   $26, $46, $20, $ec, $f1, $0b, $5b             ;; 0f:5b31 .??????

data_0f_5b38:
    db   $d1, $f0                                      ;; 0f:5b38 ..
    dw   $661b                                         ;; 0f:5b3a wP
    db   $d1, $fa, $10                                 ;; 0f:5b3c ...
.data_0f_5b3f:
    db   $f6, $01, $b9, $b9, $f6, $02, $7e, $5e        ;; 0f:5b3f .w...w..
    db   $d7, $f9                                      ;; 0f:5b47 ..
    dw   .data_0f_5b3f                                 ;; 0f:5b49 pP
    db   $fa, $06                                      ;; 0f:5b4b ..
.data_0f_5b4d:
    db   $f6, $01, $b9, $b9, $f6, $03, $7e, $5e        ;; 0f:5b4d .w...w..
    db   $d7, $f6, $02, $7e, $5e, $d7, $f9             ;; 0f:5b55 ..w....
    dw   .data_0f_5b4d                                 ;; 0f:5b5c pP
    db   $fa, $02, $f6, $02, $b9, $bc, $bc, $79        ;; 0f:5b5e ????????
    db   $f6, $01, $b9, $bc, $bc, $79, $f9, $60        ;; 0f:5b66 ????????
    db   $5b, $f1, $3d, $5b                            ;; 0f:5b6e ????

data_0f_5b72:
    db   $fe, $5a, $68, $66, $f3, $65, $80, $03        ;; 0f:5b72 ????????
    db   $e3, $67, $57, $47, $37, $fa, $02, $f3        ;; 0f:5b7a ????????
    db   $02, $fb, $01, $a6, $5b, $e4, $a4, $34        ;; 0f:5b82 ????????
    db   $04, $a4, $92, $2c, $5c, $bc, $e8, $2c        ;; 0f:5b8a ????????
    db   $ec, $bc, $5c, $2c, $5c, $bc, $e8, $2c        ;; 0f:5b92 ????????
    db   $ec, $bc, $5c, $f2, $83, $5b, $f9, $81        ;; 0f:5b9a ????????
    db   $5b, $f1, $7a, $5b, $64, $04, $a4, $34        ;; 0f:5ba2 ????????
    db   $22, $f1, $8d, $5b                            ;; 0f:5baa ????

data_0f_5bae:
    db   $fe, $63, $66, $03, $66, $c0, $03, $f0        ;; 0f:5bae ????????
    db   $03, $66, $e3, $37, $27, $17, $07, $f0        ;; 0f:5bb6 ????????
    db   $e7, $65, $fa, $04, $f3, $04, $f6, $02        ;; 0f:5bbe ????????
    db   $0c, $3c, $6c, $f6, $01, $e8, $0c, $ec        ;; 0f:5bc6 ????????
    db   $6c, $3c, $f2, $c4, $5b, $f3, $04, $f6        ;; 0f:5bce ????????
    db   $02, $ec, $bc, $e8, $2c, $5c, $f6, $01        ;; 0f:5bd6 ????????
    db   $bc, $5c, $2c, $f2, $d5, $5b, $f9, $c2        ;; 0f:5bde ????????
    db   $5b, $f1, $b5, $5b                            ;; 0f:5be6 ????

data_0f_5bea:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e2        ;; 0f:5bea ????????
    db   $07, $ec, $b7, $a7, $97, $f3, $04, $0c        ;; 0f:5bf2 ????????
    db   $d9, $0c, $d3, $0c, $d9, $0c, $d3, $ec        ;; 0f:5bfa ????????
    db   $bc, $d9, $bc, $d3, $bc, $d9, $bc, $d3        ;; 0f:5c02 ????????
    db   $e8, $f2, $f9, $5b, $f1, $f1, $5b             ;; 0f:5c0a ???????

data_0f_5c11:
    db   $f0, $1b, $66, $f6, $03, $d4, $d7, $7c        ;; 0f:5c11 ????????
    db   $7c, $7c, $fa, $10, $f6, $01, $57, $57        ;; 0f:5c19 ????????
    db   $f6, $02, $7e, $9a, $d6, $f9, $1d, $5c        ;; 0f:5c21 ????????
    db   $f1, $14, $5c                                 ;; 0f:5c29 ???

data_0f_5c2c:
    db   $fe, $78, $68, $66                            ;; 0f:5c2c ....
    dw   $6641                                         ;; 0f:5c30 wP
    db   $80, $03                                      ;; 0f:5c32 .w
.data_0f_5c34:
    db   $e3, $79, $69, $79, $e8, $06, $ec, $b9        ;; 0f:5c34 ........
    db   $99, $b9, $49, $39, $49, $56, $49, $29        ;; 0f:5c3c ........
    db   $09, $e8, $09, $ec, $79, $59, $46, $29        ;; 0f:5c44 ........
    db   $09, $ec, $b9, $e8, $76, $e8, $09, $ec        ;; 0f:5c4c ........
    db   $94, $c6, $76, $e8, $09, $ec, $96, $79        ;; 0f:5c54 ........
    db   $59, $29, $49, $39, $49, $94, $56, $49        ;; 0f:5c5c ........
    db   $59, $79, $26, $49, $29, $09, $b6, $e8        ;; 0f:5c64 ........
    db   $09, $ec, $94, $c6, $f3, $02                  ;; 0f:5c6c ......
.data_0f_5c72:
    db   $e8, $49, $29, $09, $ec, $b6, $79, $69        ;; 0f:5c72 ........
    db   $79, $99, $89, $99, $b6, $fb, $01             ;; 0f:5c7a .......
    dw   .data_0f_5c97                                 ;; 0f:5c81 pP
    db   $79, $29, $ec, $b9, $e8, $06, $79, $56        ;; 0f:5c83 ........
    db   $49, $29, $49, $06, $ec, $79, $e8, $73        ;; 0f:5c8b ........
    db   $c9, $f2                                      ;; 0f:5c93 ..
    dw   .data_0f_5c72                                 ;; 0f:5c95 pP
.data_0f_5c97:
    db   $b9, $e8, $09, $29, $43, $03, $ec, $73        ;; 0f:5c97 ........
    db   $53, $f1                                      ;; 0f:5c9f ..
    dw   .data_0f_5c34                                 ;; 0f:5ca1 pP

data_0f_5ca3:
    db   $fe, $68, $66                                 ;; 0f:5ca3 ...
    dw   $6631                                         ;; 0f:5ca6 wP
    db   $80, $02, $e2, $fa, $04                       ;; 0f:5ca8 .w...
.data_0f_5cad:
    db   $74, $53, $c9, $44, $53, $c9, $f9             ;; 0f:5cad .......
    dw   .data_0f_5cad                                 ;; 0f:5cb4 pP
    db   $94, $b3, $c9, $e8, $04, $ec, $73, $c9        ;; 0f:5cb6 ........
    db   $44, $53, $c9, $74, $23, $c9, $94, $b3        ;; 0f:5cbe ........
    db   $c9, $e8, $04, $ec, $73, $c9, $f0             ;; 0f:5cc6 .......
    dw   $663d                                         ;; 0f:5ccd wP
    db   $e8, $73, $53, $43, $23, $f1                  ;; 0f:5ccf ......
    dw   data_0f_5ca3                                  ;; 0f:5cd5 pP

data_0f_5cd7:
    db   $fe, $63, $66, $20, $e2, $66, $03             ;; 0f:5cd7 ......w
.data_0f_5cde:
    db   $fa, $04                                      ;; 0f:5cde ..
.data_0f_5ce0:
    db   $f6, $03, $e1, $09, $79, $e8, $09, $ec        ;; 0f:5ce0 .w......
    db   $56, $f6, $01, $e8, $59, $49, $59, $f6        ;; 0f:5ce8 ..w.....
    db   $03, $ec, $09, $79, $e8, $09, $ec, $56        ;; 0f:5cf0 w.......
    db   $f6, $01, $e8, $59, $49, $29, $f9             ;; 0f:5cf8 .w.....
    dw   .data_0f_5ce0                                 ;; 0f:5cff pP
    db   $f3, $02                                      ;; 0f:5d01 ..
.data_0f_5d03:
    db   $fa, $02                                      ;; 0f:5d03 ..
.data_0f_5d05:
    db   $f6, $03, $ec, $59, $e8, $09, $59, $ec        ;; 0f:5d05 .w......
    db   $76, $f6, $01, $e8, $29, $79, $b9, $f9        ;; 0f:5d0d ..w.....
    dw   .data_0f_5d05                                 ;; 0f:5d15 pP
    db   $fb, $01                                      ;; 0f:5d17 ..
    dw   .data_0f_5d3c                                 ;; 0f:5d19 pP
    db   $f6, $03, $ec, $09, $79, $e8, $09, $ec        ;; 0f:5d1b .w......
    db   $56, $f6, $01, $e8, $59, $49, $29, $f6        ;; 0f:5d23 ..w.....
    db   $03, $ec, $09, $79, $e8, $09, $ec, $76        ;; 0f:5d2b w.......
    db   $f6, $01, $e8, $29, $79, $b9, $f2             ;; 0f:5d33 .w.....
    dw   .data_0f_5d03                                 ;; 0f:5d3a pP
.data_0f_5d3c:
    db   $09, $d4, $ec, $59, $d4, $49, $d4, $29        ;; 0f:5d3c ........
    db   $d4, $f1                                      ;; 0f:5d44 ..
    dw   .data_0f_5cde                                 ;; 0f:5d46 pP

data_0f_5d48:
    db   $f0                                           ;; 0f:5d48 .
    dw   $661b                                         ;; 0f:5d49 wP
.data_0f_5d4b:
    db   $fa, $0e                                      ;; 0f:5d4b ..
.data_0f_5d4d:
    db   $f6, $01, $d6, $74, $f6, $02, $b9, $f6        ;; 0f:5d4d .w...w..
    db   $03, $79, $f6, $02, $b9, $f9                  ;; 0f:5d55 w..w..
    dw   .data_0f_5d4d                                 ;; 0f:5d5b pP
    db   $f6, $01, $b3, $b3, $b3, $b3, $f1             ;; 0f:5d5d .w.....
    dw   .data_0f_5d4b                                 ;; 0f:5d64 pP

data_0f_5d66:
    db   $fe, $7e, $63, $66                            ;; 0f:5d66 ....
    dw   $6621                                         ;; 0f:5d6a wP
    db   $40, $03, $e2, $9c, $bc, $e8, $06, $26        ;; 0f:5d6c .w......
    db   $ec                                           ;; 0f:5d74 .
.data_0f_5d75:
    db   $93, $e8, $44, $4c, $3c, $23, $56, $76        ;; 0f:5d75 ........
    db   $46, $06, $ec, $96, $e8, $09, $ec, $b9        ;; 0f:5d7d ........
    db   $a3, $e8, $54, $5c, $2c, $42, $29, $49        ;; 0f:5d85 ........
    db   $53, $49, $29, $09, $29, $94, $7c, $9c        ;; 0f:5d8d ........
    db   $49, $09, $ec, $99, $49, $e8, $74, $5c        ;; 0f:5d95 ........
    db   $7c, $53, $ec, $fa, $02                       ;; 0f:5d9d .....
.data_0f_5da2:
    db   $99, $a9, $79, $99, $a9, $79, $99, $49        ;; 0f:5da2 ........
    db   $e8, $19, $29, $4c, $1c, $ec, $ac, $9c        ;; 0f:5daa ........
    db   $7c, $5c, $4c, $2c, $f6, $02, $5c, $4c        ;; 0f:5db2 .....w..
    db   $f6, $01, $5c, $4c, $f6, $03, $e8, $59        ;; 0f:5dba .w...w..
    db   $79, $49, $29, $1c, $ec, $9c, $4c, $2c        ;; 0f:5dc2 ........
    db   $1c, $2c, $7c, $9c, $e8, $49, $26, $16        ;; 0f:5dca ........
    db   $5c, $4c, $f6, $02, $2c, $1c, $f6, $01        ;; 0f:5dd2 ...w...w
    db   $ec, $ac, $9c, $f6, $03, $f9                  ;; 0f:5dda ....w.
    dw   .data_0f_5da2                                 ;; 0f:5de0 pP
    db   $f1                                           ;; 0f:5de2 .
    dw   .data_0f_5d75                                 ;; 0f:5de3 pP

data_0f_5de5:
    db   $fe, $63, $66                                 ;; 0f:5de5 ...
    dw   $65e3                                         ;; 0f:5de8 wP
    db   $40, $03, $e2, $2c, $4c, $56, $76             ;; 0f:5dea .w.....
.data_0f_5df1:
    db   $fa, $02                                      ;; 0f:5df1 ..
.data_0f_5df3:
    db   $f3, $02                                      ;; 0f:5df3 ..
.data_0f_5df5:
    db   $f6, $02, $49, $0c, $2c, $f6, $01, $49        ;; 0f:5df5 .w....w.
    db   $0c, $2c, $f6, $02, $49, $09, $f6, $01        ;; 0f:5dfd ...w...w
    db   $fb, $01                                      ;; 0f:5e05 ..
    dw   .data_0f_5e25                                 ;; 0f:5e07 pP
    db   $29, $49, $f6, $02, $59, $2c, $4c, $f6        ;; 0f:5e09 ...w....
    db   $01, $e8, $2c, $0c, $ec, $a9, $f6, $02        ;; 0f:5e11 w......w
    db   $29, $ec, $a9, $f6, $01, $e8, $5c, $4c        ;; 0f:5e19 ....w...
    db   $29, $f2                                      ;; 0f:5e21 ..
    dw   .data_0f_5df5                                 ;; 0f:5e23 pP
.data_0f_5e25:
    db   $ec, $99, $49, $f6, $02, $e8, $29, $0c        ;; 0f:5e25 ....w...
    db   $2c, $f6, $01, $5c, $4c, $29, $f6, $02        ;; 0f:5e2d ..w....w
    db   $29, $09, $f6, $01, $ec, $a9, $e8, $29        ;; 0f:5e35 ...w....
    db   $f9                                           ;; 0f:5e3d .
    dw   .data_0f_5df3                                 ;; 0f:5e3e pP
    db   $fa, $02                                      ;; 0f:5e40 ..
.data_0f_5e42:
    db   $f6, $03, $49, $59, $29, $49, $59, $29        ;; 0f:5e42 .w......
    db   $49, $ec, $99, $f6, $01, $e8, $19, $29        ;; 0f:5e4a ....w...
    db   $ec, $99, $a6, $9c, $7c, $f6, $03, $e8        ;; 0f:5e52 ......w.
    db   $ac, $9c, $e8, $2c, $1c, $29, $49, $19        ;; 0f:5e5a ........
    db   $ec, $a9, $9c, $4c, $1c, $ec, $ac, $e8        ;; 0f:5e62 ........
    db   $4c, $5c, $4c, $5c, $e8, $19, $ec, $a6        ;; 0f:5e6a ........
    db   $96, $e8, $2c, $1c, $ec, $ac, $9c, $5c        ;; 0f:5e72 ........
    db   $4c, $f9                                      ;; 0f:5e7a ..
    dw   .data_0f_5e42                                 ;; 0f:5e7c pP
    db   $f1                                           ;; 0f:5e7e .
    dw   .data_0f_5df1                                 ;; 0f:5e7f pP

data_0f_5e81:
    db   $fe, $63, $66, $20, $e2, $66, $03, $d9        ;; 0f:5e81 ......w.
    db   $e1, $5c, $0c, $59, $7c, $2c, $79             ;; 0f:5e89 .......
.data_0f_5e90:
    db   $f3, $04                                      ;; 0f:5e90 ..
.data_0f_5e92:
    db   $fa, $04                                      ;; 0f:5e92 ..
.data_0f_5e94:
    db   $9c, $dc, $9d, $df, $9d, $df, $f9             ;; 0f:5e94 .......
    dw   .data_0f_5e94                                 ;; 0f:5e9b pP
    db   $fa, $02                                      ;; 0f:5e9d ..
.data_0f_5e9f:
    db   $ac, $dc, $ad, $df, $ad, $df, $f9             ;; 0f:5e9f .......
    dw   .data_0f_5e9f                                 ;; 0f:5ea6 pP
    db   $fb, $03                                      ;; 0f:5ea8 ..
    dw   .data_0f_5ebe                                 ;; 0f:5eaa pP
    db   $fb, $01                                      ;; 0f:5eac ..
    dw   .data_0f_5ebe                                 ;; 0f:5eae pP
    db   $fa, $02                                      ;; 0f:5eb0 ..
.data_0f_5eb2:
    db   $ac, $dc, $ad, $df, $ad, $df, $f9             ;; 0f:5eb2 .......
    dw   .data_0f_5eb2                                 ;; 0f:5eb9 pP
    db   $f2                                           ;; 0f:5ebb .
    dw   .data_0f_5e92                                 ;; 0f:5ebc pP
.data_0f_5ebe:
    db   $7c, $9c, $ac, $e8, $0c, $ec, $ac, $e8        ;; 0f:5ebe ........
    db   $0c, $ec, $ac, $7c, $f2                       ;; 0f:5ec6 .....
    dw   .data_0f_5e92                                 ;; 0f:5ecb pP
    db   $fa, $04                                      ;; 0f:5ecd ..
.data_0f_5ecf:
    db   $9c, $dc, $9d, $df, $9d, $df, $99, $ad        ;; 0f:5ecf ........
    db   $df, $ad, $df, $a9, $7d, $df, $7d, $df        ;; 0f:5ed7 ........
    db   $79, $9d, $df, $9d, $df, $99, $5d, $df        ;; 0f:5edf ........
    db   $5d, $df, $59, $7d, $df, $7d, $df, $79        ;; 0f:5ee7 ........
    db   $5c, $4c, $7c, $5c, $ac, $9c, $f9             ;; 0f:5eef .......
    dw   .data_0f_5ecf                                 ;; 0f:5ef6 pP
    db   $f1                                           ;; 0f:5ef8 .
    dw   .data_0f_5e90                                 ;; 0f:5ef9 pP

data_0f_5efb:
    db   $d4, $f0                                      ;; 0f:5efb ..
    dw   $661b                                         ;; 0f:5efd wP
    db   $d6                                           ;; 0f:5eff .
.data_0f_5f00:
    db   $f6, $01, $d9, $bc, $bc, $f6, $02, $7e        ;; 0f:5f00 .w....w.
    db   $5e, $d7, $f1                                 ;; 0f:5f08 ...
    dw   .data_0f_5f00                                 ;; 0f:5f0b pP

data_0f_5f0d:
    db   $fe, $7e, $63, $66, $21, $66, $40, $02        ;; 0f:5f0d ????????
    db   $e3, $f3, $01, $fa, $03, $f1, $48, $5f        ;; 0f:5f15 ????????
    db   $f0, $21, $66, $fa, $02, $f3, $02, $f6        ;; 0f:5f1d ????????
    db   $03, $e2, $b4, $44, $fb, $01, $32, $5f        ;; 0f:5f25 ????????
    db   $a2, $fb, $02, $36, $5f, $e8, $46, $ec        ;; 0f:5f2d ????????
    db   $a3, $c9, $49, $b9, $e8, $19, $f0, $0f        ;; 0f:5f35 ????????
    db   $66, $ec, $44, $43, $e8, $d9, $f0, $21        ;; 0f:5f3d ????????
    db   $66, $f6, $02, $4c, $7c, $ac, $e8, $4c        ;; 0f:5f45 ????????
    db   $f6, $01, $ec, $6c, $9c, $e8, $0c, $3c        ;; 0f:5f4d ????????
    db   $f6, $02, $ec, $8c, $bc, $e8, $2c, $5c        ;; 0f:5f55 ????????
    db   $f6, $01, $ec, $ac, $e8, $1c, $4c, $7c        ;; 0f:5f5d ????????
    db   $f2, $24, $5f, $f9, $22, $5f, $ec, $fa        ;; 0f:5f65 ????????
    db   $02, $f6, $02, $bc, $ac, $7c, $4c, $f6        ;; 0f:5f6d ????????
    db   $01, $bc, $ac, $7c, $4c, $f6, $02, $e8        ;; 0f:5f75 ????????
    db   $4c, $ec, $bc, $ac, $4c, $f6, $01, $e8        ;; 0f:5f7d ????????
    db   $4c, $ec, $bc, $ac, $4c, $f6, $02, $e8        ;; 0f:5f85 ????????
    db   $2c, $1c, $ec, $7c, $4c, $f6, $01, $e8        ;; 0f:5f8d ????????
    db   $2c, $1c, $ec, $7c, $4c, $f6, $02, $e8        ;; 0f:5f95 ????????
    db   $1c, $ec, $ac, $7c, $4c, $f6, $01, $e8        ;; 0f:5f9d ????????
    db   $1c, $ec, $ac, $7c, $4c, $f9, $6e, $5f        ;; 0f:5fa5 ????????
    db   $f6, $03, $f0, $0f, $66, $49, $ec, $b9        ;; 0f:5fad ????????
    db   $79, $e8, $39, $ec, $b9, $79, $e8, $bc        ;; 0f:5fb5 ????????
    db   $9c, $7c, $6c, $7c, $9c, $7c, $6c, $ec        ;; 0f:5fbd ????????
    db   $bc, $e8, $0c, $3c, $6c, $e8, $2c, $0c        ;; 0f:5fc5 ????????
    db   $ec, $bc, $e8, $0c, $4c, $2c, $0c, $2c        ;; 0f:5fcd ????????
    db   $f1, $1d, $5f                                 ;; 0f:5fd5 ???

data_0f_5fd8:
    db   $fe, $63, $66, $17, $66, $00, $03, $e3        ;; 0f:5fd8 ????????
    db   $f3, $01, $fa, $03, $f1, $27, $60, $fa        ;; 0f:5fe0 ????????
    db   $02, $f3, $02, $f0, $37, $66, $fb, $01        ;; 0f:5fe8 ????????
    db   $09, $60, $e3, $74, $ec, $b6, $e8, $79        ;; 0f:5ff0 ????????
    db   $64, $a9, $69, $19, $ec, $bc, $ac, $7c        ;; 0f:5ff8 ????????
    db   $6c, $7c, $6c, $4c, $3c, $fb, $02, $20        ;; 0f:6000 ????????
    db   $60, $ec, $74, $ec, $b6, $79, $e8, $bc        ;; 0f:6008 ????????
    db   $ac, $7c, $4c, $26, $ec, $66, $ac, $bc        ;; 0f:6010 ????????
    db   $e8, $1c, $2c, $1c, $2c, $1c, $ec, $bc        ;; 0f:6018 ????????
    db   $f0, $17, $66, $e8, $b4, $a3, $c9, $ce        ;; 0f:6020 ????????
    db   $4c, $7c, $ac, $e8, $4c, $ec, $6c, $9c        ;; 0f:6028 ????????
    db   $e8, $0c, $3c, $ec, $8c, $bc, $e8, $2c        ;; 0f:6030 ????????
    db   $5c, $ec, $ac, $e8, $1c, $4c, $7e, $f2        ;; 0f:6038 ????????
    db   $eb, $5f, $f9, $e9, $5f, $ec, $fa, $02        ;; 0f:6040 ????????
    db   $ce, $bc, $ac, $7c, $4c, $bc, $ac, $7c        ;; 0f:6048 ????????
    db   $4c, $e8, $4c, $ec, $bc, $ac, $4c, $e8        ;; 0f:6050 ????????
    db   $4c, $ec, $bc, $ac, $4c, $e8, $2c, $1c        ;; 0f:6058 ????????
    db   $ec, $7c, $4c, $e8, $2c, $1c, $ec, $7c        ;; 0f:6060 ????????
    db   $4c, $e8, $1c, $ec, $ac, $7c, $4c, $e8        ;; 0f:6068 ????????
    db   $1c, $ec, $ac, $7c, $4e, $f9, $48, $60        ;; 0f:6070 ????????
    db   $b9, $79, $49, $a9, $79, $49, $7c, $6c        ;; 0f:6078 ????????
    db   $4c, $3c, $ec, $bc, $e8, $0c, $ec, $bc        ;; 0f:6080 ????????
    db   $ac, $e8, $3c, $4c, $6c, $3c, $9c, $7c        ;; 0f:6088 ????????
    db   $6c, $7c, $bc, $9c, $7c, $9c, $f1, $e7        ;; 0f:6090 ????????
    db   $5f                                           ;; 0f:6098 ?

data_0f_6099:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e1        ;; 0f:6099 ????????
    db   $46, $36, $26, $16, $fa, $3e, $4c, $dc        ;; 0f:60a1 ????????
    db   $4d, $df, $4d, $df, $f9, $a7, $60, $7d        ;; 0f:60a9 ????????
    db   $cd, $ad, $cd, $e8, $4d, $cd, $3d, $cd        ;; 0f:60b1 ????????
    db   $2d, $cd, $1d, $cd, $ec, $49, $d2, $49        ;; 0f:60b9 ????????
    db   $d9, $49, $d2, $49, $d1, $49, $d6, $49        ;; 0f:60c1 ????????
    db   $d4, $49, $d6, $39, $d6, $e8, $7c, $6c        ;; 0f:60c9 ????????
    db   $4c, $3c, $ec, $ac, $dc, $6c, $dc, $4c        ;; 0f:60d1 ????????
    db   $6c, $7c, $4c, $6c, $4c, $6c, $bc, $4c        ;; 0f:60d9 ????????
    db   $e8, $2c, $0c, $ec, $bc, $f1, $a5, $60        ;; 0f:60e1 ????????

data_0f_60e9:
    db   $f0, $1b, $66, $d1, $fa, $20, $f6, $01        ;; 0f:60e9 ????????
    db   $d9, $bc, $bc, $f6, $02, $7e, $5e, $d7        ;; 0f:60f1 ????????
    db   $f9, $ef, $60, $fa, $10, $f6, $01, $99        ;; 0f:60f9 ????????
    db   $f6, $02, $b9, $f9, $fe, $60, $f6, $03        ;; 0f:6101 ????????
    db   $54, $54, $d1, $56, $f1, $ed, $60             ;; 0f:6109 ???????

data_0f_6110:
    db   $fe, $82, $63, $66, $d7, $65, $00, $03        ;; 0f:6110 ????????
    db   $e3, $be, $ae, $9e, $8e, $7e, $6e, $5e        ;; 0f:6118 ????????
    db   $4e, $3e, $2e, $1e, $0e, $e3, $49, $3c        ;; 0f:6120 ????????
    db   $dc, $d3, $79, $6c, $dc, $d3, $99, $7c        ;; 0f:6128 ????????
    db   $d7, $49, $6c, $d7, $39, $4c, $d7, $f6        ;; 0f:6130 ????????
    db   $01, $4c, $3c, $2c, $f6, $02, $1c, $0c        ;; 0f:6138 ????????
    db   $ec, $bc, $f6, $03, $e8, $b9, $9c, $dc        ;; 0f:6140 ????????
    db   $d3, $99, $7c, $dc, $d3, $79, $6c, $d7        ;; 0f:6148 ????????
    db   $99, $3c, $d7, $f6, $01, $3c, $4c, $6c        ;; 0f:6150 ????????
    db   $f6, $02, $9c, $bc, $e8, $0c, $f6, $01        ;; 0f:6158 ????????
    db   $3c, $4c, $6c, $f6, $02, $7c, $6c, $4c        ;; 0f:6160 ????????
    db   $f6, $03, $ec, $fa, $02, $47, $67, $37        ;; 0f:6168 ????????
    db   $47, $67, $97, $77, $67, $47, $37, $47        ;; 0f:6170 ????????
    db   $ec, $b7, $e8, $b4, $94, $77, $97, $77        ;; 0f:6178 ????????
    db   $67, $47, $ec, $b7, $e8, $67, $ec, $b7        ;; 0f:6180 ????????
    db   $e8, $77, $47, $67, $27, $42, $f9, $6d        ;; 0f:6188 ????????
    db   $61, $f1, $25, $61                            ;; 0f:6190 ????

data_0f_6194:
    db   $fe, $63, $66, $e3, $65, $40, $03, $e3        ;; 0f:6194 ????????
    db   $4e, $3e, $2e, $1e, $0e, $ec, $be, $ae        ;; 0f:619c ????????
    db   $9e, $8e, $7e, $6e, $5e, $f6, $03, $e2        ;; 0f:61a4 ????????
    db   $b9, $bc, $d3, $dc, $e8, $49, $3c, $d3        ;; 0f:61ac ????????
    db   $dc, $09, $ec, $bc, $d7, $79, $9c, $d7        ;; 0f:61b4 ????????
    db   $69, $7c, $d7, $bc, $ac, $9c, $8c, $7c        ;; 0f:61bc ????????
    db   $6c, $e8, $79, $6c, $d3, $dc, $69, $4c        ;; 0f:61c4 ????????
    db   $d3, $dc, $49, $3c, $d7, $69, $ec, $bc        ;; 0f:61cc ????????
    db   $d7, $b7, $b7, $e8, $6c, $4c, $3c, $0c        ;; 0f:61d4 ????????
    db   $ec, $bc, $ac, $e3, $f3, $02, $fa, $04        ;; 0f:61dc ????????
    db   $f6, $01, $e8, $b9, $ec, $bc, $f6, $02        ;; 0f:61e4 ????????
    db   $e8, $b9, $ec, $bc, $f9, $e4, $61, $f6        ;; 0f:61ec ????????
    db   $01, $e8, $79, $ec, $7c, $f6, $02, $e8        ;; 0f:61f4 ????????
    db   $69, $ec, $7c, $f6, $01, $e8, $49, $ec        ;; 0f:61fc ????????
    db   $7c, $f6, $02, $e8, $39, $ec, $7c, $f6        ;; 0f:6204 ????????
    db   $01, $e8, $49, $ec, $4c, $f6, $02, $e8        ;; 0f:620c ????????
    db   $49, $ec, $4c, $f6, $01, $e8, $69, $ec        ;; 0f:6214 ????????
    db   $6c, $f6, $02, $e8, $69, $ec, $6c, $fa        ;; 0f:621c ????????
    db   $02, $f6, $01, $e8, $b9, $ec, $bc, $f6        ;; 0f:6224 ????????
    db   $02, $e8, $b9, $ec, $bc, $f9, $25, $62        ;; 0f:622c ????????
    db   $f6, $01, $e8, $99, $ec, $9c, $f6, $02        ;; 0f:6234 ????????
    db   $e8, $79, $ec, $7c, $f6, $01, $e8, $69        ;; 0f:623c ????????
    db   $ec, $6c, $f6, $02, $e8, $39, $ec, $3c        ;; 0f:6244 ????????
    db   $f6, $03, $b7, $77, $97, $67, $f6, $01        ;; 0f:624c ????????
    db   $e8, $7c, $6c, $4c, $f6, $02, $ec, $bc        ;; 0f:6254 ????????
    db   $7c, $4c, $f6, $01, $9c, $6c, $ec, $bc        ;; 0f:625c ????????
    db   $f6, $02, $e8, $7c, $4c, $ec, $bc, $f2        ;; 0f:6264 ????????
    db   $e2, $61, $f1, $a9, $61                       ;; 0f:626c ?????

data_0f_6271:
    db   $fe, $63, $66, $20, $e2, $66, $03, $d4        ;; 0f:6271 ????????
    db   $e1, $fa, $1e, $4c, $dc, $4d, $df, $f9        ;; 0f:6279 ????????
    db   $7c, $62, $6c, $5c, $6c, $9c, $bc, $e8        ;; 0f:6281 ????????
    db   $0c, $ec, $f3, $02, $fa, $04, $4c, $dc        ;; 0f:6289 ????????
    db   $4d, $df, $f9, $8f, $62, $fa, $04, $6c        ;; 0f:6291 ????????
    db   $dc, $6d, $df, $f9, $98, $62, $fa, $04        ;; 0f:6299 ????????
    db   $7c, $dc, $7d, $df, $f9, $a1, $62, $fa        ;; 0f:62a1 ????????
    db   $04, $6c, $dc, $6d, $df, $f9, $aa, $62        ;; 0f:62a9 ????????
    db   $fa, $04, $4c, $dc, $4d, $df, $f9, $b3        ;; 0f:62b1 ????????
    db   $62, $6c, $dc, $6c, $bc, $dc, $bc, $3c        ;; 0f:62b9 ????????
    db   $dc, $3c, $6c, $dc, $6c, $fa, $08, $4c        ;; 0f:62c1 ????????
    db   $dc, $4d, $df, $f9, $c8, $62, $f2, $8d        ;; 0f:62c9 ????????
    db   $62, $f1, $79, $62                            ;; 0f:62d1 ????

data_0f_62d5:
    db   $f0, $1b, $66, $d4, $d7, $f6, $01, $7e        ;; 0f:62d5 ????????
    db   $5e, $d9, $f6, $02, $57, $f1, $da, $62        ;; 0f:62dd ????????

data_0f_62e5:
    db   $fe, $41, $63, $66                            ;; 0f:62e5 ....
    dw   $65e3                                         ;; 0f:62e9 wP
    db   $00, $03, $e2, $9f, $af, $e8, $0f, $2f        ;; 0f:62eb .w......
    db   $4f, $5f, $a9, $ad, $ad, $ad, $9c, $7c        ;; 0f:62f3 ........
    db   $5c, $9c, $74, $f7, $82, $ec, $9c, $bc        ;; 0f:62fb ........
    db   $e8, $0c, $2c, $fa, $02, $46, $46, $29        ;; 0f:6303 ......??
    db   $46, $49, $29, $46, $59, $46, $26, $f9        ;; 0f:630b ????????
    db   $08, $63, $f3, $02, $79, $59, $39, $56        ;; 0f:6313 ????????
    db   $59, $39, $59, $76, $56, $fb, $01, $29        ;; 0f:631b ????????
    db   $63, $36, $56, $f2, $17, $63, $39, $56        ;; 0f:6323 ????????
    db   $59, $f1, $06, $63                            ;; 0f:632b ????

data_0f_632f:
    db   $fe, $63, $66                                 ;; 0f:632f ...
    dw   $65eb                                         ;; 0f:6332 wP
    db   $00, $03, $e3, $0f, $2f, $4f, $5f, $7f        ;; 0f:6334 .w......
    db   $9f, $79, $7d, $7d, $7d, $5c, $3c, $2c        ;; 0f:633c ........
    db   $5c, $24, $ec, $6c, $7c, $9c, $bc, $e8        ;; 0f:6344 ........
    db   $fa, $02, $06, $06, $ec, $b9, $e8, $06        ;; 0f:634c ...?????
    db   $09, $ec, $b9, $e8, $06, $29, $06, $ec        ;; 0f:6354 ????????
    db   $b6, $e8, $f9, $4e, $63, $f3, $02, $39        ;; 0f:635c ????????
    db   $19, $09, $16, $19, $09, $19, $36, $16        ;; 0f:6364 ????????
    db   $fb, $01, $75, $63, $06, $16, $f2, $63        ;; 0f:636c ????????
    db   $63, $09, $16, $19, $f1, $4c, $63             ;; 0f:6374 ???????

data_0f_637b:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e2        ;; 0f:637b ......w.
    db   $d9, $39, $ad, $7d, $3d, $59, $29, $7d        ;; 0f:6383 ........
    db   $6d, $7d, $2d, $1d, $2d, $ec, $79, $e8        ;; 0f:638b ........
    db   $d6, $fa, $08, $f6, $03, $0a, $de, $f6        ;; 0f:6393 ....w...
    db   $02, $6c, $7c, $ec, $f6, $03, $7a, $de        ;; 0f:639b w.??????
    db   $f6, $01, $e8, $0c, $7c, $f9, $96, $63        ;; 0f:63a3 ????????
    db   $fa, $08, $f6, $03, $1a, $de, $f6, $02        ;; 0f:63ab ????????
    db   $7c, $8c, $ec, $f6, $03, $8a, $de, $e8        ;; 0f:63b3 ????????
    db   $f6, $01, $8c, $e8, $1c, $ec, $f9, $ad        ;; 0f:63bb ????????
    db   $63, $f1, $94, $63                            ;; 0f:63c3 ????

data_0f_63c7:
    db   $d1, $f0                                      ;; 0f:63c7 ..
    dw   $661b                                         ;; 0f:63c9 wP
    db   $d4, $f6, $01, $76, $f6, $02, $76, $f1        ;; 0f:63cb ..w.????
    db   $cc, $63                                      ;; 0f:63d3 ??

data_0f_63d5:
    db   $fe, $96, $63, $66                            ;; 0f:63d5 ....
    dw   $660f                                         ;; 0f:63d9 wP
    db   $00, $03                                      ;; 0f:63db .w
.data_0f_63dd:
    db   $fa, $02                                      ;; 0f:63dd ..
.data_0f_63df:
    db   $e3, $f3, $04                                 ;; 0f:63df ...
.data_0f_63e2:
    db   $5c, $6c, $f2                                 ;; 0f:63e2 ...
    dw   .data_0f_63e2                                 ;; 0f:63e5 pP
    db   $e8, $f3, $04                                 ;; 0f:63e7 ...
.data_0f_63ea:
    db   $1c, $0c, $f2                                 ;; 0f:63ea ...
    dw   .data_0f_63ea                                 ;; 0f:63ed pP
    db   $f9                                           ;; 0f:63ef .
    dw   .data_0f_63df                                 ;; 0f:63f0 pP
    db   $5c, $0c, $ec, $5c, $e8, $5c, $4c, $ec        ;; 0f:63f2 ........
    db   $bc, $4c, $e8, $4c, $3c, $ec, $ac, $3c        ;; 0f:63fa ........
    db   $e8, $3c, $2c, $ec, $9c, $2c, $e8, $2c        ;; 0f:6402 ........
    db   $5c, $3c, $1c, $0c, $ec, $ac, $9c, $ac        ;; 0f:640a ........
    db   $9c, $6c, $5c, $3c, $1c, $0c, $3c, $5c        ;; 0f:6412 ........
    db   $9c, $ec, $f3, $02                            ;; 0f:641a ....
.data_0f_641e:
    db   $f0                                           ;; 0f:641e .
    dw   $6609                                         ;; 0f:641f wP
    db   $5c, $5c, $5c, $5c, $59, $6c, $6c, $6c        ;; 0f:6421 ........
    db   $6c, $69, $8c, $8c, $8c, $8c, $f0             ;; 0f:6429 .......
    dw   $660f                                         ;; 0f:6430 wP
    db   $89, $e8, $fb, $01                            ;; 0f:6432 ....
    dw   .data_0f_6445                                 ;; 0f:6436 pP
    db   $8c, $e8, $2c, $8c, $ec, $8c, $e8, $2c        ;; 0f:6438 ........
    db   $8c, $ed, $f2                                 ;; 0f:6440 ...
    dw   .data_0f_641e                                 ;; 0f:6443 pP
.data_0f_6445:
    db   $bc, $ac, $9c, $8c, $7c, $6c, $f1             ;; 0f:6445 .......
    dw   .data_0f_63dd                                 ;; 0f:644c pP

data_0f_644e:
    db   $fe, $63, $66                                 ;; 0f:644e ...
    dw   $6613                                         ;; 0f:6451 wP
    db   $00, $03                                      ;; 0f:6453 .w
.data_0f_6455:
    db   $e2, $f6, $02, $0c, $5c, $0c, $5c, $f6        ;; 0f:6455 ..w.....
    db   $03, $0c, $5c, $0c, $5c, $f6, $01, $1c        ;; 0f:645d w.....w.
    db   $6c, $1c, $6c, $f6, $03, $1c, $6c, $1c        ;; 0f:6465 ....w...
    db   $6c, $f6, $02, $3c, $8c, $3c, $8c, $f6        ;; 0f:646d ..w.....
    db   $03, $3c, $8c, $3c, $8c, $f6, $01, $1c        ;; 0f:6475 w.....w.
    db   $6c, $1c, $6c, $f6, $03, $1c, $6c, $1c        ;; 0f:647d ....w...
    db   $6c, $f6, $02, $0c, $5c, $0c, $5c, $f6        ;; 0f:6485 ..w.....
    db   $01, $1c, $6c, $1c, $6c, $f6, $02, $3c        ;; 0f:648d w.....w.
    db   $8c, $3c, $8c, $f6, $01, $1c, $6c, $1c        ;; 0f:6495 ....w...
    db   $6c, $f3, $03                                 ;; 0f:649d ...
.data_0f_64a0:
    db   $f6, $02, $9c, $5c, $0c, $fb, $01             ;; 0f:64a0 .w.....
    dw   .data_0f_64b1                                 ;; 0f:64a7 pP
    db   $f6, $01, $9c, $5c, $0c, $f2                  ;; 0f:64a9 .w....
    dw   .data_0f_64a0                                 ;; 0f:64af pP
.data_0f_64b1:
    db   $9c, $f3, $02                                 ;; 0f:64b1 ...
.data_0f_64b4:
    db   $f6, $03, $f0                                 ;; 0f:64b4 .w.
    dw   $660b                                         ;; 0f:64b7 wP
    db   $0c, $0c, $0c, $0c, $09, $1c, $1c, $1c        ;; 0f:64b9 ........
    db   $1c, $19, $3c, $3c, $3c, $3c, $39, $e8        ;; 0f:64c1 ........
    db   $f0                                           ;; 0f:64c9 .
    dw   $6613                                         ;; 0f:64ca wP
    db   $fb, $01                                      ;; 0f:64cc ..
    dw   .data_0f_64e1                                 ;; 0f:64ce pP
    db   $f6, $01, $2c, $8c, $e8, $2c, $f6, $02        ;; 0f:64d0 .w.....w
    db   $ec, $2c, $8c, $e8, $2c, $ed, $f2             ;; 0f:64d8 .......
    dw   .data_0f_64b4                                 ;; 0f:64df pP
.data_0f_64e1:
    db   $5c, $4c, $3c, $2c, $1c, $0c, $f1             ;; 0f:64e1 .......
    dw   .data_0f_6455                                 ;; 0f:64e8 pP

data_0f_64ea:
    db   $fe, $63, $66, $20, $e2, $66, $03, $e1        ;; 0f:64ea ......w.
.data_0f_64f2:
    db   $fa, $10                                      ;; 0f:64f2 ..
.data_0f_64f4:
    db   $5a, $de, $6a, $de, $f9                       ;; 0f:64f4 .....
    dw   .data_0f_64f4                                 ;; 0f:64f9 pP
    db   $fa, $02                                      ;; 0f:64fb ..
.data_0f_64fd:
    db   $59, $d6, $69, $d6, $89, $d3, $d9, $f9        ;; 0f:64fd ........
    dw   .data_0f_64fd                                 ;; 0f:6505 pP
    db   $f1                                           ;; 0f:6507 .
    dw   .data_0f_64f2                                 ;; 0f:6508 pP

data_0f_650a:
    db   $f0                                           ;; 0f:650a .
    dw   $661b                                         ;; 0f:650b wP
.data_0f_650d:
    db   $f6, $01, $99, $bc, $bc, $f6, $02, $99        ;; 0f:650d .w....w.
    db   $bc, $bc, $f1                                 ;; 0f:6515 ...
    dw   .data_0f_650d                                 ;; 0f:6518 pP

data_0f_651a:
    db   $fe, $78, $63, $66, $df, $65, $c0, $03        ;; 0f:651a ????????
    db   $d4, $e1, $f3, $02, $46, $76, $b6, $46        ;; 0f:6522 ????????
    db   $73, $36, $66, $b6, $36, $63, $26, $76        ;; 0f:652a ????????
    db   $b6, $26, $73, $16, $56, $b6, $16, $53        ;; 0f:6532 ????????
    db   $06, $46, $b6, $06, $43, $fb, $01, $55        ;; 0f:653a ????????
    db   $65, $36, $66, $b6, $36, $63, $26, $76        ;; 0f:6542 ????????
    db   $b6, $26, $73, $36, $66, $b6, $36, $63        ;; 0f:654a ????????
    db   $f2, $26, $65, $26, $66, $b6, $26, $63        ;; 0f:6552 ????????
    db   $46, $76, $b6, $46, $73, $46, $76, $b6        ;; 0f:655a ????????
    db   $36, $66, $b6, $f1, $24, $65                  ;; 0f:6562 ??????

data_0f_6568:
    db   $fe, $7a, $66, $fb, $65, $40, $03, $e2        ;; 0f:6568 ????????
    db   $f3, $02, $b4, $e8, $41, $c9, $44, $31        ;; 0f:6570 ????????
    db   $c9, $34, $21, $c9, $24, $11, $c9, $14        ;; 0f:6578 ????????
    db   $fb, $01, $93, $65, $01, $c9, $04, $ec        ;; 0f:6580 ????????
    db   $b1, $c9, $b4, $71, $c9, $74, $61, $c9        ;; 0f:6588 ????????
    db   $f2, $72, $65, $01, $03, $21, $ec, $b3        ;; 0f:6590 ????????
    db   $92, $73, $66, $41, $c9, $f1, $70, $65        ;; 0f:6598 ????????

data_0f_65a0:
    db   $fe, $7a, $66, $20, $c2, $66, $03, $e3        ;; 0f:65a0 ????????
    db   $f3, $03, $44, $71, $d9, $74, $91, $d9        ;; 0f:65a8 ????????
    db   $94, $b0, $c2, $f0, $60, $c6, $f0, $20        ;; 0f:65b0 ????????
    db   $d9, $f2, $aa, $65, $d4, $b3, $93, $73        ;; 0f:65b8 ????????
    db   $63, $43, $23, $40, $f3, $04, $f1, $b2        ;; 0f:65c0 ????????
    db   $65                                           ;; 0f:65c8 ?

data_0f_65c9:
    db   $d4, $f0, $1b, $66, $f6, $02, $56, $f6        ;; 0f:65c9 ????????
    db   $01, $96, $b6, $f1, $cd, $65, $01, $d1        ;; 0f:65d1 ????????
    db   $63, $b5, $01, $c1, $63, $95, $01, $b1        ;; 0f:65d9 ????????
    db   $63, $85, $01, $a1, $63, $75, $01, $91        ;; 0f:65e1 ??....??
    db   $63, $65, $01, $81, $63, $55, $02, $79        ;; 0f:65e9 ??....??
    db   $63, $a7, $02, $79, $63, $97, $02, $79        ;; 0f:65f1 ??????..
    db   $63, $87, $02, $79, $63, $77, $02, $79        ;; 0f:65f9 ..??????
    db   $63, $67, $02, $79, $63, $57, $63, $d2        ;; 0f:6601 ????????
    db   $63, $c2, $63, $92, $63, $d3, $63, $c3        ;; 0f:6609 ....??..
    db   $63, $a3, $63, $93, $63, $83, $63, $73        ;; 0f:6611 ....????
    db   $63, $53, $01, $60, $63, $00, $63, $e1        ;; 0f:6619 ........
    db   $03, $d2, $63, $a7, $03, $d2, $0a, $a0        ;; 0f:6621 ........
    db   $63, $a7, $02, $69, $0e, $a0, $63, $a7        ;; 0f:6629 ........
    db   $02, $49, $0e, $80, $63, $87, $01, $69        ;; 0f:6631 ......??
    db   $0a, $77, $63, $50, $03, $b1, $63, $67        ;; 0f:6639 ????....
    db   $03, $d1, $63, $97, $03, $c2, $18, $90        ;; 0f:6641 ........
    db   $63, $80, $03, $92, $18, $60, $63, $50        ;; 0f:6649 ..??????
    db   $02, $d1, $04, $95, $63, $97, $02, $b1        ;; 0f:6651 ........
    db   $04, $75, $63, $77, $63, $a7, $63, $97        ;; 0f:6659 ....??..
    db   $ff, $00, $63, $00, $00, $63, $66, $08        ;; 0f:6661 ??.w???.
    db   $00, $02, $ff, $02, $00, $00, $6a, $66        ;; 0f:6669 w.w.w...
    db   $04, $00, $01, $01, $01, $00, $00, $73        ;; 0f:6671 ????????
    db   $66, $05, $00, $01, $00, $01, $02, $01        ;; 0f:6679 ?.w.w.w.
    db   $00, $01, $fe, $00, $7c, $66, $63, $ff        ;; 0f:6681 w.w...??
    db   $00, $87, $66, $02, $00, $01, $01, $01        ;; 0f:6689 ???.w.w.
    db   $00, $01, $ff, $01, $00, $01, $02, $01        ;; 0f:6691 w.w.w.w.
    db   $00, $01, $fe, $01, $00, $01, $03, $01        ;; 0f:6699 w.w.w.w.
    db   $00, $01, $fd, $01, $00, $00, $9e, $66        ;; 0f:66a1 w.w.w...
    db   $08, $00, $01, $ff, $01, $00, $00, $ab        ;; 0f:66a9 .w.w.w..
    db   $66, $ac, $ee, $dc, $ba, $ab, $cd, $ee        ;; 0f:66b1 .???????
    db   $ca, $63, $21, $12, $45, $54, $32, $11        ;; 0f:66b9 ????????
    db   $24, $df, $ff, $fc, $86, $12, $8b, $de        ;; 0f:66c1 ????????
    db   $dc, $42, $12, $46, $de, $97, $41, $00        ;; 0f:66c9 ????????
    db   $02, $ee, $dd, $cc, $bb, $aa, $99, $98        ;; 0f:66d1 ?.......
    db   $88, $77, $76, $66, $55, $44, $33, $22        ;; 0f:66d9 ........
    db   $11, $dd, $dd, $dd, $dd, $dd, $dd, $dd        ;; 0f:66e1 ........
    db   $dd, $00, $00, $00, $00, $00, $00, $00        ;; 0f:66e9 ........
    db   $00                                           ;; 0f:66f1 .

data_0f_66f2:
    db   $fc, $67, $00, $00, $17, $68, $25, $68        ;; 0f:66f2 ..??..??
    db   $36, $68, $f6, $67, $00, $00, $5c, $68        ;; 0f:66fa ????????
    db   $67, $68, $75, $68, $86, $68, $9c, $68        ;; 0f:6702 ????????
    db   $00, $00, $b7, $68, $b1, $68, $d2, $68        ;; 0f:670a ........
    db   $dd, $68, $00, $00, $e8, $68, $00, $00        ;; 0f:6712 ????????
    db   $00, $00, $1a, $69, $2e, $69, $35, $69        ;; 0f:671a ??....??
    db   $3c, $69, $4b, $69, $64, $69, $af, $69        ;; 0f:6722 ????????
    db   $96, $69, $c4, $69, $00, $00, $cf, $69        ;; 0f:672a ????????
    db   $d6, $69, $e1, $69, $00, $00, $fe, $69        ;; 0f:6732 ??..????
    db   $0b, $6a, $1f, $6a, $2a, $6a, $49, $6a        ;; 0f:673a ??..????
    db   $00, $00, $00, $00, $72, $6a, $8f, $6a        ;; 0f:6742 ..??????
    db   $9a, $6a, $b1, $6a, $c7, $6a, $cd, $6a        ;; 0f:674a ????....
    db   $e7, $6a, $00, $00, $03, $6b, $00, $00        ;; 0f:6752 ????????
    db   $19, $6b, $00, $00, $0e, $6b, $00, $00        ;; 0f:675a ??..????
    db   $32, $6b, $39, $6b, $46, $6b, $57, $6b        ;; 0f:6762 ??......
    db   $70, $6b, $89, $6b, $90, $6b, $00, $00        ;; 0f:676a ....????
    db   $00, $00                                      ;; 0f:6772 ??

data_0f_6774:
    db   $09, $68, $10, $68, $1e, $68, $2c, $68        ;; 0f:6774 ..??..??
    db   $4b, $68, $03, $68, $52, $68, $63, $68        ;; 0f:677c ????????
    db   $6e, $68, $82, $68, $91, $68, $a3, $68        ;; 0f:6784 ????????
    db   $aa, $68, $c8, $68, $c2, $68, $d9, $68        ;; 0f:678c ........
    db   $00, $00, $e4, $68, $f5, $68, $f9, $68        ;; 0f:6794 ????????
    db   $03, $69, $21, $69, $00, $00, $00, $00        ;; 0f:679c ??....??
    db   $47, $69, $00, $00, $89, $69, $b6, $69        ;; 0f:67a4 ????????
    db   $00, $00, $cb, $69, $ba, $69, $00, $00        ;; 0f:67ac ????????
    db   $00, $00, $ec, $69, $f7, $69, $00, $00        ;; 0f:67b4 ??..????
    db   $18, $6a, $26, $6a, $00, $00, $00, $00        ;; 0f:67bc ??..????
    db   $56, $6a, $67, $6a, $00, $00, $00, $00        ;; 0f:67c4 ..??????
    db   $a7, $6a, $bc, $6a, $d4, $6a, $dd, $6a        ;; 0f:67cc ????....
    db   $00, $00, $f8, $6a, $0a, $6b, $15, $6b        ;; 0f:67d4 ????????
    db   $00, $00, $20, $6b, $15, $6b, $2b, $6b        ;; 0f:67dc ??..????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 0f:67e4 ??......
    db   $00, $00, $97, $6b, $00, $00, $97, $6b        ;; 0f:67ec ....????
    db   $a4, $6b, $0b, $14, $00, $f1, $70, $82        ;; 0f:67f4 ????????
    db   $08, $14, $c0, $f0, $70, $82, $00, $04        ;; 0f:67fc .......?
    db   $f1, $42, $07, $f1, $31, $04, $f0, $61        ;; 0f:6804 ?????...
    db   $05, $f3, $41, $00, $03, $f0, $31, $05        ;; 0f:680c ....????
    db   $f1, $42, $00, $09, $14, $40, $f0, $c0        ;; 0f:6814 ???.....
    db   $83, $00, $08, $1a, $35, $05, $f1, $25        ;; 0f:681c ........
    db   $00, $08, $1c, $c0, $f1, $00, $83, $00        ;; 0f:6824 .???????
    db   $02, $c0, $33, $06, $f1, $53, $04, $d1        ;; 0f:682c ????????
    db   $32, $00, $f2, $06, $14, $40, $a9, $80        ;; 0f:6834 ????????
    db   $84, $ef, $37, $68, $f2, $06, $14, $40        ;; 0f:683c ????????
    db   $59, $80, $84, $ef, $41, $68, $00, $09        ;; 0f:6844 ????????
    db   $69, $31, $09, $d1, $31, $00, $02, $f1        ;; 0f:684c ????????
    db   $60, $01, $00, $77, $08, $f1, $60, $00        ;; 0f:6854 ????????
    db   $0a, $14, $40, $a9, $80, $84, $00, $14        ;; 0f:685c ????????
    db   $f2, $50, $00, $23, $46, $00, $e0, $10        ;; 0f:6864 ????????
    db   $82, $00, $03, $f2, $31, $20, $6a, $3b        ;; 0f:686c ????????
    db   $00, $05, $1a, $00, $f1, $20, $81, $0a        ;; 0f:6874 ????????
    db   $00, $c0, $d1, $f0, $87, $00, $14, $f2        ;; 0f:687c ????????
    db   $23, $00, $f7, $03, $1c, $80, $f0, $e0        ;; 0f:6884 ????????
    db   $87, $ef, $87, $68, $00, $f7, $02, $f1        ;; 0f:688c ????????
    db   $3c, $01, $00, $4f, $ef, $92, $68, $00        ;; 0f:6894 ????????
    db   $19, $08, $c0, $e0, $93, $87, $00, $05        ;; 0f:689c ????????
    db   $f0, $27, $14, $f0, $17, $00, $04, $f0        ;; 0f:68a4 ??????..
    db   $71, $28, $39, $71, $00, $1e, $2f, $80        ;; 0f:68ac ........
    db   $4b, $ff, $87, $f2, $04, $1b, $c0, $f0        ;; 0f:68b4 ........
    db   $00, $87, $ef, $b8, $68, $00, $14, $09        ;; 0f:68bc ........
    db   $40, $0a, $f0, $41, $03, $f0, $61, $01        ;; 0f:68c4 ........
    db   $00, $61, $08, $f2, $61, $00, $0c, $1b        ;; 0f:68cc ........
    db   $c0, $f2, $00, $87, $00, $0c, $f1, $70        ;; 0f:68d4 ........
    db   $00, $08, $1f, $40, $f1, $c0, $87, $00        ;; 0f:68dc .???????
    db   $1c, $09, $32, $00, $32, $1f, $00, $f0        ;; 0f:68e4 ????????
    db   $ff, $87, $32, $17, $00, $f0, $80, $83        ;; 0f:68ec ????????
    db   $00, $64, $f0, $5b, $00, $05, $89, $40        ;; 0f:68f4 ????????
    db   $06, $f0, $71, $14, $f2, $70, $00, $f2        ;; 0f:68fc ????????
    db   $0c, $f1, $3e, $06, $f1, $3e, $06, $f1        ;; 0f:6904 ????????
    db   $3e, $06, $f1, $2e, $0c, $f1, $3e, $06        ;; 0f:690c ????????
    db   $f1, $3e, $ef, $04, $69, $00, $4b, $1c        ;; 0f:6914 ??????..
    db   $00, $f0, $ff, $87, $00, $03, $f1, $30        ;; 0f:691c ....?...
    db   $0a, $f0, $a8, $19, $f0, $47, $28, $f0        ;; 0f:6924 ......??
    db   $67, $00, $11, $26, $80, $f0, $00, $86        ;; 0f:692c ??......
    db   $00, $0f, $46, $40, $99, $10, $87, $00        ;; 0f:6934 .???????
    db   $f3, $0c, $4f, $40, $d9, $ff, $87, $ef        ;; 0f:693c ????????
    db   $3d, $69, $00, $24, $0a, $40, $00, $14        ;; 0f:6944 ????????
    db   $16, $80, $f5, $10, $84, $14, $16, $80        ;; 0f:694c ????????
    db   $d5, $10, $84, $14, $16, $80, $b5, $10        ;; 0f:6954 ????????
    db   $84, $14, $16, $80, $95, $10, $84, $00        ;; 0f:695c ????????
    db   $14, $26, $40, $f0, $00, $84, $14, $26        ;; 0f:6964 ????????
    db   $40, $f0, $60, $84, $14, $26, $40, $f0        ;; 0f:696c ????????
    db   $c0, $84, $14, $26, $40, $f0, $20, $85        ;; 0f:6974 ????????
    db   $1e, $26, $40, $f0, $80, $85, $3c, $1e        ;; 0f:697c ????????
    db   $00, $f7, $ff, $87, $00, $64, $f0, $b8        ;; 0f:6984 ????????
    db   $0a, $00, $00, $1e, $f0, $50, $1e, $f3        ;; 0f:698c ????????
    db   $62, $00, $0f, $3f, $c0, $59, $20, $87        ;; 0f:6994 ????????
    db   $0f, $3f, $c0, $59, $10, $87, $0f, $3f        ;; 0f:699c ????????
    db   $c0, $59, $00, $87, $0f, $3f, $c0, $59        ;; 0f:69a4 ????????
    db   $f0, $86, $00, $0f, $1d, $c0, $f3, $80        ;; 0f:69ac ????????
    db   $86, $00, $0f, $f0, $35, $00, $18, $19        ;; 0f:69b4 ????????
    db   $70, $12, $39, $40, $1e, $f3, $10, $00        ;; 0f:69bc ????????
    db   $0a, $13, $c0, $f0, $b0, $82, $00, $0a        ;; 0f:69c4 ????????
    db   $f1, $23, $00, $0f, $7f, $80, $f0, $d8        ;; 0f:69cc ????????
    db   $87, $00, $f3, $0a, $15, $80, $f0, $b0        ;; 0f:69d4 ????????
    db   $85, $ef, $d7, $69, $00, $f7, $06, $1b        ;; 0f:69dc ?????...
    db   $c0, $f1, $00, $86, $ef, $e2, $69, $00        ;; 0f:69e4 ........
    db   $f7, $03, $f0, $5c, $03, $f1, $5d, $ef        ;; 0f:69ec ........
    db   $ed, $69, $00, $04, $f1, $3d, $1e, $f3        ;; 0f:69f4 ...?????
    db   $3d, $00, $04, $00, $80, $f1, $df, $87        ;; 0f:69fc ????????
    db   $14, $00, $80, $f2, $e1, $87, $00, $0f        ;; 0f:6a04 ????????
    db   $00, $00, $09, $8c, $86, $0f, $00, $00        ;; 0f:6a0c ????????
    db   $f1, $8c, $86, $00, $0f, $09, $0e, $0f        ;; 0f:6a14 ????????
    db   $f1, $0e, $00, $0c, $00, $80, $f0, $f3        ;; 0f:6a1c ???.....
    db   $87, $00, $0c, $f0, $41, $00, $08, $14        ;; 0f:6a24 ......??
    db   $80, $f0, $00, $83, $08, $14, $80, $f0        ;; 0f:6a2c ????????
    db   $00, $84, $08, $14, $80, $f0, $00, $85        ;; 0f:6a34 ????????
    db   $08, $14, $80, $f0, $00, $86, $08, $14        ;; 0f:6a3c ????????
    db   $80, $f0, $00, $87, $00, $0d, $4e, $40        ;; 0f:6a44 ????????
    db   $f0, $80, $87, $10, $2e, $40, $f0, $80        ;; 0f:6a4c ????????
    db   $86, $00, $04, $f0, $41, $01, $f0, $89        ;; 0f:6a54 ??......
    db   $10, $f3, $41, $fd, $04, $f0, $89, $ef        ;; 0f:6a5c ........
    db   $60, $6a, $00, $f2, $0b, $49, $61, $05        ;; 0f:6a64 ...?????
    db   $f3, $60, $ef, $68, $6a, $00, $06, $00        ;; 0f:6a6c ????????
    db   $80, $f1, $b8, $87, $f2, $06, $00, $80        ;; 0f:6a74 ????????
    db   $f1, $bd, $87, $ef, $79, $6a, $06, $00        ;; 0f:6a7c ????????
    db   $80, $f1, $b8, $87, $17, $00, $80, $f3        ;; 0f:6a84 ????????
    db   $bd, $87, $00, $f5, $08, $14, $40, $f3        ;; 0f:6a8c ????????
    db   $00, $83, $ef, $90, $6a, $00, $06, $14        ;; 0f:6a94 ????????
    db   $c0, $f0, $70, $82, $0c, $08, $c0, $a2        ;; 0f:6a9c ????????
    db   $ef, $87, $00, $04, $f0, $61, $04, $f0        ;; 0f:6aa4 ????????
    db   $31, $0a, $f1, $30, $00, $f5, $06, $12        ;; 0f:6aac ????????
    db   $c0, $f0, $00, $84, $ef, $b2, $6a, $00        ;; 0f:6ab4 ????????
    db   $f5, $05, $f1, $32, $01, $01, $22, $ef        ;; 0f:6abc ????????
    db   $bd, $6a, $00, $12, $1c, $80, $f2, $ff        ;; 0f:6ac4 ???.....
    db   $87, $1f, $1c, $80, $f3, $ff, $87, $00        ;; 0f:6acc ........
    db   $03, $f1, $30, $05, $f0, $98, $0a, $f2        ;; 0f:6ad4 ........
    db   $61, $03, $f1, $30, $05, $f0, $98, $17        ;; 0f:6adc ........
    db   $f2, $61, $00, $fa, $02, $00, $80, $f0        ;; 0f:6ae4 ...?????
    db   $eb, $87, $02, $00, $80, $f0, $ea, $87        ;; 0f:6aec ????????
    db   $ef, $e8, $6a, $00, $f4, $02, $f1, $50        ;; 0f:6af4 ????????
    db   $04, $00, $00, $ef, $f9, $6a, $00, $96        ;; 0f:6afc ????????
    db   $27, $00, $0a, $80, $82, $00, $96, $f0        ;; 0f:6b04 ????????
    db   $37, $00, $19, $00, $80, $f1, $ef, $87        ;; 0f:6b0c ????????
    db   $00, $19, $f2, $70, $00, $0c, $25, $80        ;; 0f:6b14 ????????
    db   $f0, $b0, $85, $00, $f4, $02, $f0, $44        ;; 0f:6b1c ????....
    db   $ef, $21, $6b, $28, $f4, $44, $00, $0f        ;; 0f:6b24 .......?
    db   $09, $44, $5a, $f7, $44, $00, $0f, $1f        ;; 0f:6b2c ????????
    db   $80, $f3, $50, $87, $00, $04, $00, $80        ;; 0f:6b34 ?????...
    db   $f1, $c0, $87, $08, $00, $80, $f1, $b0        ;; 0f:6b3c ........
    db   $87, $00, $f6, $01, $00, $40, $f0, $00        ;; 0f:6b44 ........
    db   $86, $01, $00, $80, $f0, $00, $87, $ef        ;; 0f:6b4c ........
    db   $47, $6b, $00, $05, $00, $80, $f2, $06        ;; 0f:6b54 ........
    db   $87, $05, $00, $80, $f2, $44, $87, $05        ;; 0f:6b5c ........
    db   $00, $80, $f2, $59, $87, $14, $00, $80        ;; 0f:6b64 ........
    db   $f2, $83, $87, $00, $05, $00, $80, $f2        ;; 0f:6b6c ........
    db   $7b, $87, $05, $00, $80, $f2, $59, $87        ;; 0f:6b74 ........
    db   $05, $00, $80, $f2, $6b, $87, $14, $00        ;; 0f:6b7c ........
    db   $80, $f2, $90, $87, $00, $74, $57, $40        ;; 0f:6b84 ........
    db   $0b, $30, $85, $00, $23, $2e, $80, $49        ;; 0f:6b8c ....????
    db   $b0, $87, $00, $04, $f1, $23, $08, $f1        ;; 0f:6b94 ???.....
    db   $25, $04, $f1, $23, $14, $f2, $25, $00        ;; 0f:6b9c ........
    db   $f7, $14, $f0, $2c, $0a, $00, $00, $ef        ;; 0f:6ba4 ????????
    db   $a5, $6b, $00, $03, $ff, $1b, $7f, $7f        ;; 0f:6bac ????????
    db   $7f, $7b, $00, $00, $b0, $fe, $fc, $f0        ;; 0f:6bb4 ????????
    db   $ed, $c9, $24, $80, $03, $90, $c0, $32        ;; 0f:6bbc ????????
    db   $7f, $ae, $04, $0d, $08, $24, $61, $a6        ;; 0f:6bc4 ????????
    db   $93, $40, $1f, $7f, $f9, $e9, $7f, $7f        ;; 0f:6bcc ????????
    db   $1f, $df, $af, $97, $f8, $ef, $fb, $ff        ;; 0f:6bd4 ????????
    db   $fb, $ff, $ff, $ff, $0f, $00, $1f, $7f        ;; 0f:6bdc ????????
    db   $c3, $30, $ec, $fc, $fe, $fe, $f0, $03        ;; 0f:6be4 ????????
    db   $46, $cc, $08, $10, $10, $10, $40, $88        ;; 0f:6bec ????????
    db   $20, $90, $01, $03, $07, $43, $41, $93        ;; 0f:6bf4 ????????
    db   $07, $01, $4c, $81, $f1, $fc, $fe, $7f        ;; 0f:6bfc ????????
    db   $3f, $5f, $df, $ed, $ea, $e2, $f0, $fc        ;; 0f:6c04 ????????
    db   $af, $89, $c1, $7e, $92, $a8, $10, $ff        ;; 0f:6c0c ????????
    db   $ff, $e3, $ff, $ff, $ff, $00, $89, $ff        ;; 0f:6c14 ????????
    db   $c3, $6c, $b4, $cc, $03, $4f, $1f, $3f        ;; 0f:6c1c ????????
    db   $13, $ca, $00, $56, $7f, $01, $42, $51        ;; 0f:6c24 ????????
    db   $c9, $f0, $f8, $fc, $df, $fe, $fd, $7e        ;; 0f:6c2c ????????
    db   $3e, $bf, $bf, $7e, $5c, $1f, $1f, $5f        ;; 0f:6c34 ????????
    db   $5f, $3f, $2f, $6f, $9f, $fd, $fe, $fc        ;; 0f:6c3c ????????
    db   $80, $e0, $71, $d9, $f8, $ec, $e9, $cf        ;; 0f:6c44 ????????
    db   $ff, $cf, $04, $7f, $ff, $f0, $00, $e0        ;; 0f:6c4c ????????
    db   $ff, $7b, $fb, $f7, $fe, $7f, $2f, $dd        ;; 0f:6c54 ????????
    db   $fe, $f6, $fc, $b9, $f0, $e4, $93, $4d        ;; 0f:6c5c ????????
    db   $4a, $cf, $ab, $be, $5f, $bf, $2f, $27        ;; 0f:6c64 ????????
    db   $4b, $1b, $c7, $ea, $e8, $f0, $8e, $b7        ;; 0f:6c6c ????????
    db   $97, $ef, $cf, $97, $eb, $c8, $ff, $ff        ;; 0f:6c74 ????????
    db   $ff, $ff, $fc, $00, $00, $00, $ff, $48        ;; 0f:6c7c ????????
    db   $25, $c8, $f0, $f8, $fe, $ef, $6f, $fe        ;; 0f:6c84 ????????
    db   $ad, $a4, $c0, $7f, $20, $0c, $88, $42        ;; 0f:6c8c ????????
    db   $44, $1c, $e2, $19, $0d, $45, $23, $7f        ;; 0f:6c94 ????????
    db   $5f, $2f, $3f, $0f, $9f, $e1, $f2, $fc        ;; 0f:6c9c ????????
    db   $f4, $e0, $cf, $de, $fb, $ff, $f6, $ff        ;; 0f:6ca4 ????????
    db   $fd, $0f, $00, $00, $00, $f0, $24, $00        ;; 0f:6cac ????????
    db   $07, $5a, $fe, $aa, $01, $00, $02, $00        ;; 0f:6cb4 ????????
    db   $e9, $e3, $c7, $0d, $27, $9d, $74, $dc        ;; 0f:6cbc ????????
    db   $fe, $7a, $fc, $7f, $7f, $bf, $bf, $ef        ;; 0f:6cc4 ????????
    db   $e2, $f1, $f3, $ff, $ff, $ff, $ff, $ff        ;; 0f:6ccc ????????
    db   $07, $18, $00, $00, $80, $53, $1c, $e0        ;; 0f:6cd4 ????????
    db   $0e, $1c, $88, $c0, $5f, $bf, $3d, $1f        ;; 0f:6cdc ????????
    db   $00, $00, $0c, $08, $f4, $da, $71, $e5        ;; 0f:6ce4 ????????
    db   $14, $41, $3e, $22, $7f, $3f, $3f, $5f        ;; 0f:6cec ????????
    db   $8f, $1b, $13, $02, $fc, $f5, $03, $9f        ;; 0f:6cf4 ????????
    db   $7f, $ff, $80, $f0, $fe, $fe, $f8, $00        ;; 0f:6cfc ????????
    db   $01, $1f, $f0, $00, $c1, $f8, $fc, $00        ;; 0f:6d04 ????????
    db   $01, $11, $00, $18, $fc, $fe, $e0, $f1        ;; 0f:6d0c ????????
    db   $a0, $52, $03, $07, $0f, $07, $97, $0f        ;; 0f:6d14 ????????
    db   $1f, $7f, $db, $df, $ef, $f6, $fa, $f7        ;; 0f:6d1c ????????
    db   $ff, $1d, $18, $00, $00, $0c, $df, $ff        ;; 0f:6d24 ????????
    db   $ff, $de, $df, $fd, $bb, $f7, $f7, $f9        ;; 0f:6d2c ????????
    db   $fe, $f6, $fd, $9a, $e4, $09, $f4, $28        ;; 0f:6d34 ????????
    db   $30, $e0, $0c, $18, $c0, $18, $00, $82        ;; 0f:6d3c ????????
    db   $57, $27, $82, $4d, $05, $00, $19, $a4        ;; 0f:6d44 ????????
    db   $ff, $ff, $7f, $7e, $07, $db, $ff, $ff        ;; 0f:6d4c ????????
    db   $ff, $df, $bf, $bf, $6c, $59, $90, $d0        ;; 0f:6d54 ????????
    db   $d0, $c0, $11, $00, $00, $12, $00, $83        ;; 0f:6d5c ????????
    db   $1f, $03, $21, $08, $40, $7c, $7f, $3f        ;; 0f:6d64 ????????
    db   $3f, $f3, $fe, $fb, $ec, $fb, $ed, $e1        ;; 0f:6d6c ????????
    db   $40, $c4, $9c, $b8, $20, $62, $54, $00        ;; 0f:6d74 ????????
    db   $19, $01, $81, $09, $c1, $61, $00, $d0        ;; 0f:6d7c ????????
    db   $84, $aa, $f6, $fd, $bb, $f5, $fd, $ff        ;; 0f:6d84 ????????
    db   $ff, $ff, $00, $c0, $7f, $ff, $ff, $ff        ;; 0f:6d8c ????????
    db   $6a, $a4, $f2, $51, $1a, $2f, $9f, $5b        ;; 0f:6d94 ????????
    db   $0f, $1f, $3f, $3f, $bf, $5f, $2f, $17        ;; 0f:6d9c ????????
    db   $9f, $df, $f9, $f2, $fe, $fa, $f4, $fd        ;; 0f:6da4 ????????
    db   $fc, $57, $46, $44, $76, $36, $25, $3b        ;; 0f:6dac ????????
    db   $53, $8c, $c0, $a1, $70, $fc, $3b, $9f        ;; 0f:6db4 ????????
    db   $cf, $7e, $0f, $89, $00, $60, $93, $70        ;; 0f:6dbc ????????
    db   $ee, $ff, $ff, $ff, $3f, $00, $df, $ff        ;; 0f:6dc4 ????????
    db   $e5, $bf, $85, $8d, $d7, $cb, $61, $33        ;; 0f:6dcc ????????
    db   $1a, $18, $0b, $05, $04, $02, $02, $02        ;; 0f:6dd4 ????????
    db   $82, $82, $7f, $bf, $5f, $0f, $d7, $8f        ;; 0f:6ddc ????????
    db   $fc, $fc, $fd, $f9, $fa, $fa, $fa, $89        ;; 0f:6de4 ????????
    db   $bb, $0d, $44, $fb, $fd, $fd, $3e, $f3        ;; 0f:6dec ????????
    db   $f9, $fd, $7f, $bf, $fb, $7f, $1f, $a7        ;; 0f:6df4 ????????
    db   $e3, $f9, $f7, $ff, $df, $ff, $ff, $00        ;; 0f:6dfc ????????
    db   $ff, $ef, $ff, $ff, $24, $c3, $f1, $f0        ;; 0f:6e04 ????????
    db   $dc, $a0, $c4, $86, $e4, $7b, $99, $18        ;; 0f:6e0c ????????
    db   $00, $0c, $c0, $03, $23, $13, $15, $43        ;; 0f:6e14 ????????
    db   $91, $09, $3a, $f2, $f6, $ea, $e2, $e1        ;; 0f:6e1c ????????
    db   $e5, $d1, $c1, $02, $40, $fc, $7f, $1f        ;; 0f:6e24 ????????
    db   $03, $60, $5f, $3f, $13, $8d, $c3, $e0        ;; 0f:6e2c ????????
    db   $f8, $3f, $f0, $f1, $e0, $a4, $ce, $1c        ;; 0f:6e34 ????????
    db   $38, $e2, $ff, $ff, $ff, $ff, $07, $ff        ;; 0f:6e3c ????????
    db   $ff, $cd, $df, $03, $19, $00, $63, $c1        ;; 0f:6e44 ????????
    db   $00, $08, $1c, $00, $80, $c1, $68, $31        ;; 0f:6e4c ????????
    db   $1a, $cd, $45, $6e, $43, $05, $30, $10        ;; 0f:6e54 ????????
    db   $01, $c0, $84, $7f, $7f, $3f, $c0, $c3        ;; 0f:6e5c ????????
    db   $c0, $d2, $e4, $f0, $fc, $f4, $bc, $bf        ;; 0f:6e64 ????????
    db   $c7, $20, $14, $2a, $1d, $07, $00, $c0        ;; 0f:6e6c ????????
    db   $00, $80, $7f, $06, $3e, $f0, $03, $1d        ;; 0f:6e74 ????????
    db   $fb, $f6, $ff, $ff, $ff, $ff, $ef, $f0        ;; 0f:6e7c ????????
    db   $f8, $80, $f0, $c8, $20, $02, $c1, $fe        ;; 0f:6e84 ????????
    db   $e0, $80, $40, $1f, $ca, $42, $03, $85        ;; 0f:6e8c ????????
    db   $42, $00, $12, $00, $00, $08, $07, $8c        ;; 0f:6e94 ????????
    db   $b1, $80, $d3, $bf, $3f, $7f, $2f, $83        ;; 0f:6e9c ????????
    db   $3b, $37, $e0, $e6, $da, $ed, $69, $0d        ;; 0f:6ea4 ????????
    db   $0a, $59, $df, $c0, $0c, $fa, $f9, $fe        ;; 0f:6eac ????????
    db   $ff, $f8, $f8, $e0, $e0, $00, $00, $00        ;; 0f:6eb4 ????????
    db   $00, $06, $60, $b4, $e5, $f6, $01, $00        ;; 0f:6ebc ????????
    db   $6d, $b1, $fb, $c6, $ef, $fd, $9f, $5b        ;; 0f:6ec4 ????????
    db   $bf, $02, $7f, $ff, $ff, $fb, $7f, $00        ;; 0f:6ecc ????????
    db   $00, $01, $03, $07, $1f, $3f, $32, $3f        ;; 0f:6ed4 ????????
    db   $f6, $db, $7c, $c4, $a4, $f3, $f5, $80        ;; 0f:6edc ????????
    db   $f1, $5e, $3d, $8e, $4a, $0c, $99, $6c        ;; 0f:6ee4 ????????
    db   $b0, $9b, $6f, $ba, $e6, $00, $ff, $00        ;; 0f:6eec ????????
    db   $00, $ff, $80, $e0, $a0, $70, $70, $f0        ;; 0f:6ef4 ????????
    db   $58, $6c, $3f, $2f, $3a, $3e, $1f, $1f        ;; 0f:6efc ????????
    db   $1f, $16, $b7, $ff, $f7, $7f, $ff, $30        ;; 0f:6f04 ????????
    db   $cc, $e2, $9d, $b2, $f7, $de, $c7, $db        ;; 0f:6f0c ????????
    db   $92, $1d, $4b, $bc, $b9, $70, $dc, $61        ;; 0f:6f14 ????????
    db   $c6, $0b, $4f, $9b, $1d, $6a, $0e, $f1        ;; 0f:6f1c ????????
    db   $b2, $86, $b0, $ac, $ea, $00, $1f, $00        ;; 0f:6f24 ????????
    db   $3f, $ff, $80, $c0, $e0, $90, $30, $1f        ;; 0f:6f2c ????????
    db   $33, $35, $29, $13, $1c, $72, $df, $b6        ;; 0f:6f34 ????????
    db   $c1, $fe, $75, $5a, $e9, $ff, $ff, $ec        ;; 0f:6f3c ????????
    db   $fe, $bf, $5f, $1d, $73, $d2, $bb, $2c        ;; 0f:6f44 ????????
    db   $d6, $a7, $6c, $35, $40, $92, $d6, $87        ;; 0f:6f4c ????????
    db   $a1, $aa, $d4, $7d, $cd, $de, $ba, $dc        ;; 0f:6f54 ????????
    db   $be, $6d, $7f, $ae, $bd, $00, $ff, $00        ;; 0f:6f5c ????????
    db   $ff, $ff, $70, $70, $38, $18, $68, $b8        ;; 0f:6f64 ????????
    db   $e8, $fc, $0b, $0b, $06, $07, $07, $0a        ;; 0f:6f6c ????????
    db   $0b, $1d, $bd, $69, $d3, $bb, $fc, $ba        ;; 0f:6f74 ????????
    db   $ea, $5c, $ff, $87, $03, $7f, $ff, $77        ;; 0f:6f7c ????????
    db   $f7, $72, $ce, $dd, $49, $fe, $fe, $f5        ;; 0f:6f84 ????????
    db   $e2, $b7, $2b, $af, $af, $ae, $bf, $cd        ;; 0f:6f8c ????????
    db   $bb, $ee, $9f, $76, $00, $fc, $00, $fc        ;; 0f:6f94 ????????
    db   $ff, $dc, $36, $06, $c6, $78, $c0, $35        ;; 0f:6f9c ????????
    db   $26, $10, $0f, $03, $01, $ab, $df, $fe        ;; 0f:6fa4 ????????
    db   $8b, $bb, $a6, $d2, $56, $fe, $fb, $7f        ;; 0f:6fac ????????
    db   $ff, $ff, $b6, $52, $d4, $b6, $eb, $bf        ;; 0f:6fb4 ????????
    db   $3f, $52, $5b, $c0, $7f, $a6, $50, $91        ;; 0f:6fbc ????????
    db   $ba, $a4, $1c, $e2, $25, $73, $b9, $da        ;; 0f:6fc4 ????????
    db   $ac, $b8, $58, $48, $38, $90, $60, $00        ;; 0f:6fcc ????????
    db   $00, $00, $00, $00, $ff, $6e, $31, $3c        ;; 0f:6fd4 ????????
    db   $3b, $3e, $7e, $7b, $6e, $ff, $f7, $ff        ;; 0f:6fdc ????????
    db   $fb, $ff, $db, $c0, $07, $a5, $ab, $fe        ;; 0f:6fe4 ????????
    db   $ab, $22, $e7, $1c, $ec, $f1, $f3, $f5        ;; 0f:6fec ????????
    db   $ef, $c6, $17, $5e, $fd, $7f, $fa, $fd        ;; 0f:6ff4 ????????
    db   $00, $00, $80, $80, $40, $c0, $20, $60        ;; 0f:6ffc ????????
    db   $00, $00, $00, $00, $fc, $2b, $2d, $16        ;; 0f:7004 ????????
    db   $13, $0f, $01, $ff, $ff, $bf, $7f, $ff        ;; 0f:700c ????????
    db   $8f, $ab, $9d, $ef, $31, $62, $b7, $4c        ;; 0f:7014 ????????
    db   $77, $f7, $3d, $5c, $87, $00, $94, $f1        ;; 0f:701c ????????
    db   $d6, $6a, $2a, $b9, $3f, $d5, $a0, $e0        ;; 0f:7024 ????????
    db   $a0, $50, $bc, $67, $48, $65, $00, $1f        ;; 0f:702c ????????
    db   $3e, $00, $00, $01, $02, $0f, $fb, $b6        ;; 0f:7034 ????????
    db   $78, $fc, $e6, $82, $02, $00, $c0, $f8        ;; 0f:703c ????????
    db   $ff, $ff, $30, $0f, $1d, $c2, $39, $04        ;; 0f:7044 ????????
    db   $03, $75, $8a, $2a, $33, $19, $fc, $06        ;; 0f:704c ????????
    db   $01, $12, $08, $59, $aa, $f3, $47, $0c        ;; 0f:7054 ????????
    db   $f0, $00, $fc, $00, $03, $3f, $44, $4c        ;; 0f:705c ????????
    db   $98, $10, $60, $80, $fc, $67, $e2, $73        ;; 0f:7064 ????????
    db   $3b, $2f, $17, $da, $00, $ff, $7f, $01        ;; 0f:706c ????????
    db   $01, $40, $60, $61, $73, $72, $d6, $dd        ;; 0f:7074 ????????
    db   $dd, $08, $0c, $9c, $9c, $a8, $28, $50        ;; 0f:707c ????????
    db   $7f, $f8, $00, $1f, $ff, $ff, $ff, $07        ;; 0f:7084 ????????
    db   $3e, $06, $01, $0f, $39, $0e, $7f, $a6        ;; 0f:708c ????????
    db   $1d, $78, $f2, $65, $f2, $ec, $31, $c6        ;; 0f:7094 ????????
    db   $20, $c5, $1b, $40, $3a, $7b, $07, $96        ;; 0f:709c ????????
    db   $21, $7a, $24, $a9, $c4, $f5, $ff, $ff        ;; 0f:70a4 ????????
    db   $ff, $b1, $66, $78, $e2, $8b, $c6, $80        ;; 0f:70ac ????????
    db   $20, $8a, $5d, $a2, $64, $b6, $4b, $06        ;; 0f:70b4 ????????
    db   $61, $8c, $92, $45, $98, $ff, $83, $00        ;; 0f:70bc ????????
    db   $00, $80, $40, $20, $a0, $50, $90, $ed        ;; 0f:70c4 ????????
    db   $ff, $de, $ff, $ff, $3c, $0e, $07, $1c        ;; 0f:70cc ????????
    db   $73, $3f, $1d, $73, $3a, $d2, $b9, $f6        ;; 0f:70d4 ????????
    db   $64, $f2, $ba, $25, $d3, $6b, $15, $2d        ;; 0f:70dc ????????
    db   $91, $16, $d2, $9d, $e7, $ba, $bb, $dd        ;; 0f:70e4 ????????
    db   $cf, $e5, $00, $ff, $ff, $00, $e0, $f0        ;; 0f:70ec ????????
    db   $69, $3c, $96, $3b, $9f, $4d, $0d, $dc        ;; 0f:70f4 ????????
    db   $b0, $20, $60, $20, $90, $c8, $64, $b0        ;; 0f:70fc ????????
    db   $50, $30, $ef, $ff, $ef, $fb, $ff, $3f        ;; 0f:7104 ????????
    db   $0f, $1a, $3e, $0e, $1d, $3c, $05, $65        ;; 0f:710c ????????
    db   $f5, $ee, $2e, $7f, $b7, $7e, $e2, $e5        ;; 0f:7114 ????????
    db   $ea, $f8, $5f, $bf, $fb, $7e, $8f, $51        ;; 0f:711c ????????
    db   $8c, $13, $e4, $f3, $fe, $00, $ff, $ff        ;; 0f:7124 ????????
    db   $7f, $00, $cb, $9b, $ef, $d7, $6b, $b5        ;; 0f:712c ????????
    db   $dd, $9b, $33, $19, $89, $24, $14, $90        ;; 0f:7134 ????????
    db   $c0, $88, $80, $c0, $60, $90, $38, $0c        ;; 0f:713c ????????
    db   $54, $ff, $ff, $7f, $f7, $7f, $04, $06        ;; 0f:7144 ????????
    db   $05, $07, $0f, $0b, $0f, $0e, $cd, $97        ;; 0f:714c ????????
    db   $a7, $06, $03, $03, $41, $ea, $7b, $fe        ;; 0f:7154 ????????
    db   $bf, $df, $7f, $ef, $be, $ef, $3b, $de        ;; 0f:715c ????????
    db   $f7, $fa, $df, $00, $ff, $ff, $ff, $01        ;; 0f:7164 ????????
    db   $55, $db, $ff, $fa, $b3, $f0, $7f, $e4        ;; 0f:716c ????????
    db   $90, $82, $66, $58, $a2, $b1, $02, $2d        ;; 0f:7174 ????????
    db   $ae, $52, $a6, $a3, $09, $49, $13, $bd        ;; 0f:717c ????????
    db   $80, $79, $fe, $ff, $ff, $ef, $1f, $1b        ;; 0f:7184 ????????
    db   $37, $3b, $25, $31, $67, $85, $b8, $03        ;; 0f:718c ????????
    db   $00, $80, $20, $c4, $98, $fb, $6e, $9f        ;; 0f:7194 ????????
    db   $7e, $3f, $1f, $07, $40, $fc, $b2, $eb        ;; 0f:719c ????????
    db   $f0, $e2, $c5, $13, $80, $ff, $ff, $ff        ;; 0f:71a4 ????????
    db   $07, $4f, $a5, $8b, $14, $36, $e2, $d5        ;; 0f:71ac ????????
    db   $02, $e1, $dc, $e2, $f3, $31, $fa, $2d        ;; 0f:71b4 ????????
    db   $9d, $1f, $37, $8b, $04, $6b, $32, $cd        ;; 0f:71bc ????????
    db   $9a, $c0, $c0, $20, $00, $ff, $ff, $c5        ;; 0f:71c4 ????????
    db   $ff, $70, $43, $62, $64, $33, $18, $0f        ;; 0f:71cc ????????
    db   $1a, $c3, $c0, $f8, $21, $1a, $cd, $1e        ;; 0f:71d4 ????????
    db   $df, $80, $3f, $7f, $80, $0a, $c2, $01        ;; 0f:71dc ????????
    db   $09, $04, $e3, $07, $0f, $16, $7f, $bf        ;; 0f:71e4 ????????
    db   $ff, $ff, $c9, $34, $c6, $7e, $e1, $98        ;; 0f:71ec ????????
    db   $a6, $27, $a3, $1f, $6b, $a5, $d8, $a9        ;; 0f:71f4 ????????
    db   $45, $3b, $b4, $c7, $ad, $ca, $c5, $ef        ;; 0f:71fc ????????
    db   $60, $a0, $40, $f0, $5c, $2e, $f9, $2d        ;; 0f:7204 ????????
    db   $00, $fe, $fe, $f8, $f8, $2d, $37, $6e        ;; 0f:720c ????????
    db   $7b, $5d, $63, $01, $85, $3e, $df, $b7        ;; 0f:7214 ????????
    db   $f3, $3c, $c0, $ff, $bf, $c0, $20, $e0        ;; 0f:721c ????????
    db   $fe, $fd, $3f, $27, $39, $00, $fe, $fe        ;; 0f:7224 ????????
    db   $f0, $f0, $69, $f1, $da, $3b, $bf, $6f        ;; 0f:722c ????????
    db   $30, $62, $5d, $f3, $df, $1e, $f4, $08        ;; 0f:7234 ????????
    db   $d5, $a4, $16, $0f, $f3, $ce, $6c, $f8        ;; 0f:723c ????????
    db   $00, $00, $00, $00, $00, $03, $ff, $3f        ;; 0f:7244 ????????
    db   $3f, $1f, $03, $01, $00, $08, $ff, $fc        ;; 0f:724c ????????
    db   $f2, $c5, $c5, $c2, $c2, $6d, $f3, $81        ;; 0f:7254 ????????
    db   $01, $0e, $30, $7f, $3f, $3f, $1f, $0f        ;; 0f:725c ????????
    db   $f6, $ef, $7f, $fe, $04, $04, $f2, $7e        ;; 0f:7264 ????????
    db   $cd, $63, $fd, $7c, $ff, $ff, $ff, $ff        ;; 0f:726c ????????
    db   $ff, $37, $00, $80, $fb, $60, $43, $26        ;; 0f:7274 ????????
    db   $00, $9d, $3a, $fd, $dd, $8f, $1d, $2b        ;; 0f:727c ????????
    db   $13, $92, $10, $d0, $b0, $59, $dc, $f4        ;; 0f:7284 ????????
    db   $69, $7e, $50, $60, $72, $4f, $56, $6f        ;; 0f:728c ????????
    db   $59, $70, $68, $d2, $fc, $7f, $7f, $5f        ;; 0f:7294 ????????
    db   $6f, $97, $fe, $8f, $7b, $03, $8d, $c0        ;; 0f:729c ????????
    db   $df, $df, $ff, $ff, $ff, $ff, $ff, $ff        ;; 0f:72a4 ????????
    db   $03, $3f, $ff, $63, $5d, $83, $83, $07        ;; 0f:72ac ????????
    db   $fc, $fc, $f9, $10, $d8, $3f, $9d, $3b        ;; 0f:72b4 ????????
    db   $7f, $fc, $f8, $5c, $fc, $d8, $f0, $d0        ;; 0f:72bc ????????
    db   $f1, $d1, $20, $a0, $41, $01, $01, $c2        ;; 0f:72c4 ????????
    db   $82, $85, $04, $93, $0f, $0b, $70, $80        ;; 0f:72cc ????????
    db   $80, $00, $c2, $7f, $7f, $fe, $fc, $fd        ;; 0f:72d4 ????????
    db   $fe, $fe, $fe, $ef, $e0, $70, $3f, $fb        ;; 0f:72dc ????????
    db   $3d, $3e, $f1, $ff, $ef, $87, $e3, $ff        ;; 0f:72e4 ????????
    db   $ff, $9f, $80, $e0, $e3, $07, $0f, $3f        ;; 0f:72ec ????????
    db   $1f, $17, $2c, $fc, $c7, $00, $42, $00        ;; 0f:72f4 ????????
    db   $f0, $f8, $7f, $3f, $09, $12, $20, $e5        ;; 0f:72fc ????????
    db   $f8, $c0, $81, $18, $01, $60, $10, $00        ;; 0f:7304 ????????
    db   $60, $98, $04, $04, $7f, $7f, $3f, $2f        ;; 0f:730c ????????
    db   $0f, $27, $fe, $70, $00, $c0, $ff, $ff        ;; 0f:7314 ????????
    db   $ff, $ff, $ff, $ff, $fe, $00, $ef, $0b        ;; 0f:731c ????????
    db   $10, $23, $ce, $b8, $c0, $00, $00, $06        ;; 0f:7324 ????????
    db   $fc, $b0, $60, $c0, $86, $89, $80, $1f        ;; 0f:732c ????????
    db   $0e, $04, $04, $05, $4c, $88, $18, $21        ;; 0f:7334 ????????
    db   $50, $80, $87, $18, $20, $41, $a4, $1e        ;; 0f:733c ????????
    db   $b0, $61, $c0, $00, $05, $04, $04, $37        ;; 0f:7344 ????????
    db   $57, $bf, $bf, $3f, $1f, $bf, $fe, $fe        ;; 0f:734c ????????
    db   $fe, $fd, $fc, $fc, $fd, $ff, $ff, $ff        ;; 0f:7354 ????????
    db   $ff, $ff, $ff, $fe, $00, $c0, $00, $00        ;; 0f:735c ????????
    db   $c0, $80, $78, $0c, $04, $f8, $80, $40        ;; 0f:7364 ????????
    db   $20, $01, $07, $0e, $39, $32, $39, $7a        ;; 0f:736c ????????
    db   $fa, $bc, $5c, $9c, $18, $c9, $18, $04        ;; 0f:7374 ????????
    db   $02, $22, $50, $00, $70, $f8, $0c, $19        ;; 0f:737c ????????
    db   $39, $32, $70, $64, $cb, $df, $1f, $6f        ;; 0f:7384 ????????
    db   $7f, $3f, $ef, $ef, $7f, $fe, $fe, $ff        ;; 0f:738c ????????
    db   $f0, $e0, $fc, $ff, $ff, $00, $00, $00        ;; 0f:7394 ????????
    db   $c0, $78, $00, $c0, $05, $1e, $7b, $2d        ;; 0f:739c ????????
    db   $4c, $6c, $6d, $fc, $fe, $b0, $18, $28        ;; 0f:73a4 ????????
    db   $c0, $30, $c1, $03, $fe, $a7, $a7, $2f        ;; 0f:73ac ????????
    db   $53, $c3, $87, $69, $88, $ff, $00, $00        ;; 0f:73b4 ????????
    db   $00, $e0, $f0, $40, $02, $1f, $f9, $f5        ;; 0f:73bc ????????
    db   $fb, $09, $6a, $6c, $fe, $7f, $fa, $df        ;; 0f:73c4 ????????
    db   $df, $df, $df, $bf, $ff, $00, $00, $00        ;; 0f:73cc ????????
    db   $00, $00, $1f, $36, $03, $fc, $fb, $f7        ;; 0f:73d4 ????????
    db   $f7, $f7, $bf, $7d, $fd, $fb, $df, $6f        ;; 0f:73dc ????????
    db   $ff, $03, $17, $00, $01, $10, $f9, $ff        ;; 0f:73e4 ????????
    db   $fa, $fd, $7b, $df, $df, $ef, $7f, $fb        ;; 0f:73ec ????????
    db   $fd, $ef, $cf, $cf, $8f, $ef, $fb, $f6        ;; 0f:73f4 ????????
    db   $fc, $f9, $fb, $fe, $f7, $7f, $bf, $f7        ;; 0f:73fc ????????
    db   $fb, $bf, $ef, $da, $d7, $ff, $fa, $fc        ;; 0f:7404 ????????
    db   $07, $fc, $f8, $bf, $f7, $9f, $f7, $ef        ;; 0f:740c ????????
    db   $fe, $fb, $ad, $f5, $b7, $9f, $cf, $ef        ;; 0f:7414 ????????
    db   $bf, $f7, $fe, $fe, $fd, $fb, $f3, $fb        ;; 0f:741c ????????
    db   $fb, $b7, $0f, $df, $cf, $e3, $f1, $fd        ;; 0f:7424 ????????
    db   $fd, $fc, $fc, $fa, $fe, $fe, $fd, $7e        ;; 0f:742c ????????
    db   $fe, $7c, $f9, $7f, $1f, $3f, $ed, $3f        ;; 0f:7434 ????????
    db   $df, $e3, $f0, $f7, $ff, $df, $7f, $6f        ;; 0f:743c ????????
    db   $8f, $00, $fe, $ff, $7f, $db, $7f, $fe        ;; 0f:7444 ????????
    db   $fd, $e3, $04, $f8, $fb, $f5, $68, $84        ;; 0f:744c ????????
    db   $0e, $15, $74, $fd, $fa, $3f, $00, $00        ;; 0f:7454 ????????
    db   $e0, $bf, $fd, $f9, $01, $03, $fd, $f9        ;; 0f:745c ????????
    db   $f9, $f3, $e7, $ef, $df, $3f, $7f, $5f        ;; 0f:7464 ????????
    db   $37, $af, $94, $ca, $c1, $df, $bf, $fe        ;; 0f:746c ????????
    db   $f8, $30, $41, $87, $ff, $ff, $ff, $f8        ;; 0f:7474 ????????
    db   $bf, $7e, $27, $fb, $ff, $e0, $c3, $07        ;; 0f:747c ????????
    db   $1b, $3b, $f2, $f4, $c4, $f4, $f6, $ea        ;; 0f:7484 ????????
    db   $f4, $f6, $0a, $15, $69, $9c, $83, $80        ;; 0f:748c ????????
    db   $80, $9e, $0f, $7f, $7f, $7f, $7f, $3f        ;; 0f:7494 ????????
    db   $bf, $ef, $f3, $f3, $f9, $fc, $fe, $fb        ;; 0f:749c ????????
    db   $7f, $1f, $3f, $c2, $ec, $f0, $e1, $f2        ;; 0f:74a4 ????????
    db   $f5, $e7, $0f, $37, $43, $9c, $77, $f8        ;; 0f:74ac ????????
    db   $80, $60, $ff, $f7, $c7, $7f, $fc, $00        ;; 0f:74b4 ????????
    db   $ff, $ff, $ff, $db, $d7, $ef, $1f, $1f        ;; 0f:74bc ????????
    db   $1f, $1f, $f1, $fb, $de, $bf, $f7, $cf        ;; 0f:74c4 ????????
    db   $fb, $fc, $fe, $fc, $78, $f3, $bf, $bf        ;; 0f:74cc ????????
    db   $bf, $df, $bf, $7f, $df, $cf, $f2, $cf        ;; 0f:74d4 ????????
    db   $80, $80, $80, $80, $9c, $ec, $58, $b0        ;; 0f:74dc ????????
    db   $03, $00, $00, $00, $dc, $3e, $00, $03        ;; 0f:74e4 ????????
    db   $e0, $03, $0d, $36, $ff, $ff, $ff, $ff        ;; 0f:74ec ????????
    db   $00, $00, $f8, $f8, $c0, $3f, $3f, $1f        ;; 0f:74f4 ????????
    db   $03, $dc, $60, $80, $0f, $eb, $07, $fd        ;; 0f:74fc ????????
    db   $fe, $01, $00, $e0, $00, $cf, $3f, $c3        ;; 0f:7504 ????????
    db   $f1, $00, $00, $00, $00, $80, $80, $80        ;; 0f:750c ????????
    db   $c0, $e0, $00, $00, $01, $07, $1f, $d8        ;; 0f:7514 ????????
    db   $6f, $ff, $c0, $f8, $f8, $00, $00, $00        ;; 0f:751c ????????
    db   $00, $00, $f0, $fc, $00, $00, $00, $f0        ;; 0f:7524 ????????
    db   $fc, $00, $00, $00, $01, $03, $01, $00        ;; 0f:752c ????????
    db   $7f, $7f, $03, $0f, $3d, $4b, $63, $b7        ;; 0f:7534 ????????
    db   $ae, $9e, $f3, $8c, $78, $c2, $11, $4e        ;; 0f:753c ????????
    db   $00, $3f, $07, $80, $c0, $e0, $b0, $b0        ;; 0f:7544 ????????
    db   $68, $0f, $19, $f0, $00, $03, $00, $c0        ;; 0f:754c ????????
    db   $f0, $03, $f0, $ff, $01, $01, $01, $01        ;; 0f:7554 ????????
    db   $66, $a6, $fb, $8e, $f3, $bd, $1a, $af        ;; 0f:755c ????????
    db   $1c, $f7, $df, $90, $24, $59, $67, $a6        ;; 0f:7564 ????????
    db   $c3, $6b, $5b, $8e, $3c, $1d, $d7, $f3        ;; 0f:756c ????????
    db   $70, $ff, $ff, $77, $e6, $7f, $6f, $df        ;; 0f:7574 ????????
    db   $de, $f1, $f3, $e5, $f9, $f0, $e6, $df        ;; 0f:757c ????????
    db   $bf, $bd, $00, $7f, $00, $80, $c0, $c0        ;; 0f:7584 ????????
    db   $60, $f0, $58, $ec, $00, $e0, $ff, $03        ;; 0f:758c ????????
    db   $01, $01, $fb, $f7, $3b, $95, $ff, $f5        ;; 0f:7594 ????????
    db   $f7, $7f, $ff, $fe, $df, $be, $3f, $f3        ;; 0f:759c ????????
    db   $e2, $fe, $5f, $de, $30, $d8, $5e, $bd        ;; 0f:75a4 ????????
    db   $79, $fb, $fb, $fe, $fd, $ff, $63, $fb        ;; 0f:75ac ????????
    db   $ef, $9f, $33, $36, $eb, $e2, $67, $ed        ;; 0f:75b4 ????????
    db   $fd, $3a, $73, $64, $c6, $80, $ff, $e3        ;; 0f:75bc ????????
    db   $ae, $31, $15, $8f, $70, $0e, $bf, $dd        ;; 0f:75c4 ????????
    db   $00, $00, $00, $c0, $c0, $03, $dc, $ff        ;; 0f:75cc ????????
    db   $00, $01, $07, $07, $06, $7a, $ff, $ff        ;; 0f:75d4 ????????
    db   $3f, $d9, $f9, $de, $d7, $ff, $bf, $9f        ;; 0f:75dc ????????
    db   $bf, $f9, $f0, $30, $19, $17, $ad, $fc        ;; 0f:75e4 ????????
    db   $3f, $7f, $c7, $36, $b1, $ff, $e3, $ff        ;; 0f:75ec ????????
    db   $01, $f0, $f8, $7f, $3f, $89, $12, $2c        ;; 0f:75f4 ????????
    db   $f5, $f9, $cf, $bf, $65, $60, $ff, $cf        ;; 0f:75fc ????????
    db   $0a, $ed, $54, $f6, $6e, $db, $fd, $f9        ;; 0f:7604 ????????
    db   $c0, $40, $30, $68, $98, $30, $00, $c0        ;; 0f:760c ????????
    db   $f7, $02, $01, $7f, $1c, $c0, $3f, $01        ;; 0f:7614 ????????
    db   $01, $01, $49, $ff, $db, $0c, $1f, $24        ;; 0f:761c ????????
    db   $d1, $c5, $23, $9f, $ff, $c9, $02, $93        ;; 0f:7624 ????????
    db   $27, $16, $39, $8e, $fb, $bf, $1f, $ce        ;; 0f:762c ????????
    db   $c5, $a5, $46, $49, $9b, $d2, $53, $28        ;; 0f:7634 ????????
    db   $a4, $50, $ae, $59, $c0, $f7, $fe, $a0        ;; 0f:763c ????????
    db   $46, $92, $2c, $05, $95, $84, $3c, $54        ;; 0f:7644 ????????
    db   $8c, $a4, $a0, $50, $b8, $00, $00, $ff        ;; 0f:764c ????????
    db   $03, $03, $03, $02, $06, $07, $06, $06        ;; 0f:7654 ????????
    db   $fd, $3f, $ff, $3e, $48, $85, $32, $fa        ;; 0f:765c ????????
    db   $04, $2e, $90, $58, $1d, $27, $8f, $39        ;; 0f:7664 ????????
    db   $33, $f5, $ff, $df, $3a, $6d, $ec, $ea        ;; 0f:766c ????????
    db   $39, $59, $3d, $3e, $a7, $4b, $d8, $ad        ;; 0f:7674 ????????
    db   $e7, $8d, $04, $c0, $ff, $9e, $4d, $1b        ;; 0f:767c ????????
    db   $39, $36, $72, $65, $cb, $de, $00, $60        ;; 0f:7684 ????????
    db   $60, $80, $40, $00, $00, $e0, $03, $03        ;; 0f:768c ????????
    db   $01, $00, $f8, $fc, $38, $86, $fd, $c0        ;; 0f:7694 ????????
    db   $3f, $07, $9b, $6e, $c7, $02, $01, $fe        ;; 0f:769c ????????
    db   $6f, $ff, $6f, $de, $d7, $23, $01, $00        ;; 0f:76a4 ????????
    db   $48, $24, $d5, $38, $ce, $25, $d7, $ff        ;; 0f:76ac ????????
    db   $00, $ff, $01, $bc, $ac, $34, $6a, $f6        ;; 0f:76b4 ????????
    db   $ca, $97, $fd, $80, $00, $00, $00, $00        ;; 0f:76bc ????????
    db   $00, $00, $00, $00, $f8, $0f, $1b, $2f        ;; 0f:76c4 ????????
    db   $3e, $03, $00, $f8, $f8, $ca, $99, $6d        ;; 0f:76cc ????????
    db   $72, $81, $40, $c0, $c0, $a0, $e0, $20        ;; 0f:76d4 ????????
    db   $df, $df, $0f, $10, $4d, $5d, $58, $47        ;; 0f:76dc ????????
    db   $67, $80, $40, $b0, $f0, $f1, $31, $7a        ;; 0f:76e4 ????????
    db   $17, $ff, $f1, $18, $28, $48, $a8, $f4        ;; 0f:76ec ????????
    db   $74, $74, $cf, $0c, $0a, $09, $0a, $f9        ;; 0f:76f4 ????????
    db   $00, $1f, $00, $80, $80, $40, $40, $a0        ;; 0f:76fc ????????
    db   $0c, $ff, $f8, $00, $01, $01, $01, $02        ;; 0f:7704 ????????
    db   $04, $08, $08, $98, $27, $00, $03, $07        ;; 0f:770c ????????
    db   $00, $ff, $83, $ca, $12, $66, $ca, $8c        ;; 0f:7714 ????????
    db   $06, $0c, $09, $80, $e3, $b2, $00, $03        ;; 0f:771c ????????
    db   $ff, $e3, $e6, $a0, $20, $30, $28, $18        ;; 0f:7724 ????????
    db   $30, $98, $c8, $00, $0f, $0f, $03, $04        ;; 0f:772c ????????
    db   $08, $11, $f0, $08, $04, $c6, $40, $f0        ;; 0f:7734 ????????
    db   $ff, $10, $10, $20, $23, $18, $38, $38        ;; 0f:773c ????????
    db   $f8, $79, $19, $0f, $0d, $fa, $ff, $ef        ;; 0f:7744 ????????
    db   $19, $17, $7e, $9c, $09, $0d, $9e, $e1        ;; 0f:774c ????????
    db   $79, $ac, $ef, $7f, $3f, $bf, $d7, $fe        ;; 0f:7754 ????????
    db   $f9, $ff, $cf, $9a, $fb, $af, $ff, $f5        ;; 0f:775c ????????
    db   $4c, $f4, $bf, $9c, $49, $5a, $be, $ca        ;; 0f:7764 ????????
    db   $f8, $ff, $f9, $11, $10, $70, $91, $98        ;; 0f:776c ????????
    db   $95, $8b, $47, $e6, $0e, $1e, $be, $fc        ;; 0f:7774 ????????
    db   $f4, $03, $ff, $f8, $60, $70, $3c, $1e        ;; 0f:777c ????????
    db   $0f, $02, $04, $04, $1e, $37, $47, $87        ;; 0f:7784 ????????
    db   $07, $fc, $ff, $f7, $d1, $d9, $db, $87        ;; 0f:778c ????????
    db   $af, $f8, $f2, $d6, $d7, $ad, $d5, $eb        ;; 0f:7794 ????????
    db   $3f, $9f, $df, $ff, $fb, $ff, $f5, $da        ;; 0f:779c ????????
    db   $55, $eb, $1f, $fd, $fa, $9a, $9d, $be        ;; 0f:77a4 ????????
    db   $ef, $b7, $4f, $9f, $7f, $03, $3f, $f7        ;; 0f:77ac ????????
    db   $07, $00, $c0, $ff, $7f, $ef, $c2, $01        ;; 0f:77b4 ????????
    db   $01, $01, $07, $ff, $fe, $10, $c7, $ff        ;; 0f:77bc ????????
    db   $08, $08, $70, $50, $40, $03, $07, $07        ;; 0f:77c4 ????????
    db   $0f, $1c, $18, $30, $f0, $fb, $fb, $ff        ;; 0f:77cc ????????
    db   $d6, $d1, $e8, $ed, $f7, $7d, $7f, $d8        ;; 0f:77d4 ????????
    db   $30, $67, $6e, $eb, $f4, $d9, $a7, $9f        ;; 0f:77dc ????????
    db   $ef, $fe, $2c, $d3, $66, $3f, $ff, $8f        ;; 0f:77e4 ????????
    db   $7f, $bf, $4d, $1d, $5b, $fb, $f7, $ef        ;; 0f:77ec ????????
    db   $c0, $fb, $c3, $ff, $ff, $ff, $ff, $e1        ;; 0f:77f4 ????????
    db   $40, $40, $fc, $f0, $e0, $60, $1c, $cf        ;; 0f:77fc ????????
    db   $ff, $21, $30, $0e, $07, $03, $01, $08        ;; 0f:7804 ????????
    db   $04, $07, $02, $05, $88, $f4, $e2, $8f        ;; 0f:780c ????????
    db   $fb, $f7, $7e, $3d, $f6, $29, $13, $4f        ;; 0f:7814 ????????
    db   $3c, $cc, $3d, $7f, $e3, $f8, $e0, $ff        ;; 0f:781c ????????
    db   $ff, $ff, $7f, $3f, $7c, $f8, $f3, $fb        ;; 0f:7824 ????????
    db   $1b, $11, $fc, $0e, $06, $05, $be, $e7        ;; 0f:782c ????????
    db   $c1, $78, $03, $eb, $ff, $70, $fc, $86        ;; 0f:7834 ????????
    db   $01, $87, $8f, $78, $68, $48, $30, $60        ;; 0f:783c ????????
    db   $c0, $80, $00, $00, $00, $ff, $e9, $74        ;; 0f:7844 ????????
    db   $3f, $7f, $ff, $ff, $ff, $ff, $ff, $68        ;; 0f:784c ????????
    db   $df, $f7, $ef, $fc, $3f, $c1, $fc, $1f        ;; 0f:7854 ????????
    db   $fc, $f3, $ce, $ff, $ff, $e9, $e0, $eb        ;; 0f:785c ????????
    db   $fc, $f3, $3f, $e1, $9f, $7f, $fc, $f8        ;; 0f:7864 ????????
    db   $03, $0e, $cf, $fe, $f0, $ff, $3e, $fc        ;; 0f:786c ????????
    db   $da, $0d, $00, $00, $00, $00, $80, $80        ;; 0f:7874 ????????
    db   $80, $80, $00, $00, $fc, $ff, $bf, $bf        ;; 0f:787c ????????
    db   $5f, $20, $1f, $00, $fc, $f0, $ff, $ff        ;; 0f:7884 ????????
    db   $f9, $c7, $18, $e0, $38, $6f, $f0, $80        ;; 0f:788c ????????
    db   $00, $e0, $fc, $f0, $fd, $03, $3f, $c7        ;; 0f:7894 ????????
    db   $38, $f7, $0c, $03                            ;; 0f:789c ????

data_0f_78a0:
    db   $00, $fc, $e0, $fe, $fe, $fc, $f9, $02        ;; 0f:78a0 ????????
    db   $fc, $80, $80, $80, $00, $00, $00, $00        ;; 0f:78a8 ????????
    db   $00, $00                                      ;; 0f:78b0 ??
    xor  A, A                                          ;; 0f:78b2 $af
    ld   [wC088], A                                    ;; 0f:78b3 $ea $88 $c0
    ld   [wC08C], A                                    ;; 0f:78b6 $ea $8c $c0
    ret                                                ;; 0f:78b9 $c9
    ld   HL, wCD04                                     ;; 0f:78ba $21 $04 $cd
    ld   A, [HL+]                                      ;; 0f:78bd $2a
    ld   H, [HL]                                       ;; 0f:78be $66
    ld   L, A                                          ;; 0f:78bf $6f
    ld   DE, hFFDF                                     ;; 0f:78c0 $11 $df $ff
    add  HL, DE                                        ;; 0f:78c3 $19
    ld   A, $f7                                        ;; 0f:78c4 $3e $f7
    ld   BC, $01                                       ;; 0f:78c6 $01 $01 $00
    call call_0f_792c                                  ;; 0f:78c9 $cd $2c $79
    call call_0f_7925                                  ;; 0f:78cc $cd $25 $79
    ld   A, $fc                                        ;; 0f:78cf $3e $fc
    call call_0f_792c                                  ;; 0f:78d1 $cd $2c $79
    ld   A, $f9                                        ;; 0f:78d4 $3e $f9
    ld   BC, $01                                       ;; 0f:78d6 $01 $01 $00
    call call_0f_792c                                  ;; 0f:78d9 $cd $2c $79
    call call_0f_791a                                  ;; 0f:78dc $cd $1a $79
    ld   A, [wCD0A]                                    ;; 0f:78df $fa $0a $cd
    ld   B, A                                          ;; 0f:78e2 $47
.jr_0f_78e3:
    push BC                                            ;; 0f:78e3 $c5
    ld   A, $fb                                        ;; 0f:78e4 $3e $fb
    ld   BC, $01                                       ;; 0f:78e6 $01 $01 $00
    call call_0f_792c                                  ;; 0f:78e9 $cd $2c $79
    call call_0f_7925                                  ;; 0f:78ec $cd $25 $79
    ld   A, $ff                                        ;; 0f:78ef $3e $ff
    call call_0f_792c                                  ;; 0f:78f1 $cd $2c $79
    ld   A, $fb                                        ;; 0f:78f4 $3e $fb
    ld   BC, $01                                       ;; 0f:78f6 $01 $01 $00
    call call_0f_792c                                  ;; 0f:78f9 $cd $2c $79
    call call_0f_791a                                  ;; 0f:78fc $cd $1a $79
    pop  BC                                            ;; 0f:78ff $c1
    dec  B                                             ;; 0f:7900 $05
    jr   NZ, .jr_0f_78e3                               ;; 0f:7901 $20 $e0
    ld   A, $f8                                        ;; 0f:7903 $3e $f8
    ld   BC, $01                                       ;; 0f:7905 $01 $01 $00
    call call_0f_792c                                  ;; 0f:7908 $cd $2c $79
    call call_0f_7925                                  ;; 0f:790b $cd $25 $79
    ld   A, $fc                                        ;; 0f:790e $3e $fc
    call call_0f_792c                                  ;; 0f:7910 $cd $2c $79
    ld   A, $fa                                        ;; 0f:7913 $3e $fa
    ld   BC, $01                                       ;; 0f:7915 $01 $01 $00
    jr   call_0f_792c                                  ;; 0f:7918 $18 $12

call_0f_791a:
    call call_0f_7925                                  ;; 0f:791a $cd $25 $79
    ld   A, $1e                                        ;; 0f:791d $3e $1e
    sub  A, C                                          ;; 0f:791f $91
    ld   E, A                                          ;; 0f:7920 $5f
    ld   D, $00                                        ;; 0f:7921 $16 $00
    add  HL, DE                                        ;; 0f:7923 $19
    ret                                                ;; 0f:7924 $c9

call_0f_7925:
    ld   A, [wCD00]                                    ;; 0f:7925 $fa $00 $cd
    ld   C, A                                          ;; 0f:7928 $4f
    ld   B, $00                                        ;; 0f:7929 $06 $00
    ret                                                ;; 0f:792b $c9

call_0f_792c:
    ld   D, A                                          ;; 0f:792c $57
    ld   E, $0e                                        ;; 0f:792d $1e $0e
    ld   A, C                                          ;; 0f:792f $79
.jr_0f_7930:
    inc  B                                             ;; 0f:7930 $04
.jr_0f_7931:
    dec  B                                             ;; 0f:7931 $05
    jr   NZ, .jr_0f_7937                               ;; 0f:7932 $20 $03
    cp   A, E                                          ;; 0f:7934 $bb
    jr   C, .jr_0f_7974                                ;; 0f:7935 $38 $3d
.jr_0f_7937:
    ldh  A, [rLY]                                      ;; 0f:7937 $f0 $44
    ld   E, A                                          ;; 0f:7939 $5f
    ldh  A, [rLYC]                                     ;; 0f:793a $f0 $45
    sub  A, E                                          ;; 0f:793c $93
    cp   A, $03                                        ;; 0f:793d $fe $03
    jr   C, .jr_0f_7937                                ;; 0f:793f $38 $f6
    ld   E, $02                                        ;; 0f:7941 $1e $02
.jr_0f_7943:
    ldh  A, [rSTAT]                                    ;; 0f:7943 $f0 $41
    and  A, $03                                        ;; 0f:7945 $e6 $03
    jr   Z, .jr_0f_7943                                ;; 0f:7947 $28 $fa
.jr_0f_7949:
    ldh  A, [rSTAT]                                    ;; 0f:7949 $f0 $41
    and  A, E                                          ;; 0f:794b $a3
    jr   NZ, .jr_0f_7949                               ;; 0f:794c $20 $fb
    ld   A, D                                          ;; 0f:794e $7a
    ld   [HL+], A                                      ;; 0f:794f $22
    ld   [HL+], A                                      ;; 0f:7950 $22
    ld   [HL+], A                                      ;; 0f:7951 $22
    ld   [HL+], A                                      ;; 0f:7952 $22
    ld   [HL+], A                                      ;; 0f:7953 $22
    ld   [HL+], A                                      ;; 0f:7954 $22
    ld   [HL+], A                                      ;; 0f:7955 $22
    ld   [HL+], A                                      ;; 0f:7956 $22
    ld   [HL+], A                                      ;; 0f:7957 $22
    ld   [HL+], A                                      ;; 0f:7958 $22
    ld   [HL+], A                                      ;; 0f:7959 $22
    ld   [HL+], A                                      ;; 0f:795a $22
    ld   [HL+], A                                      ;; 0f:795b $22
    ld   [HL+], A                                      ;; 0f:795c $22
    ldh  A, [rSTAT]                                    ;; 0f:795d $f0 $41
    and  A, E                                          ;; 0f:795f $a3
    jr   NZ, .jr_0f_796b                               ;; 0f:7960 $20 $09
    ld   E, $0e                                        ;; 0f:7962 $1e $0e
    ld   A, C                                          ;; 0f:7964 $79
    sub  A, E                                          ;; 0f:7965 $93
    ld   C, A                                          ;; 0f:7966 $4f
    jr   NC, .jr_0f_7930                               ;; 0f:7967 $30 $c7
    jr   .jr_0f_7931                                   ;; 0f:7969 $18 $c6
.jr_0f_796b:
    ld   A, L                                          ;; 0f:796b $7d
    sub  A, $0e                                        ;; 0f:796c $d6 $0e
    ld   L, A                                          ;; 0f:796e $6f
    jr   NC, .jr_0f_7937                               ;; 0f:796f $30 $c6
    dec  H                                             ;; 0f:7971 $25
    jr   .jr_0f_7937                                   ;; 0f:7972 $18 $c3
.jr_0f_7974:
    or   A, A                                          ;; 0f:7974 $b7
    ret  Z                                             ;; 0f:7975 $c8
    sub  A, $04                                        ;; 0f:7976 $d6 $04
    jr   C, .jr_0f_797d                                ;; 0f:7978 $38 $03
    ld   B, A                                          ;; 0f:797a $47
    ld   C, $04                                        ;; 0f:797b $0e $04
.jr_0f_797d:
    push BC                                            ;; 0f:797d $c5
.jr_0f_797e:
    ldh  A, [rLY]                                      ;; 0f:797e $f0 $44
    ld   E, A                                          ;; 0f:7980 $5f
    ldh  A, [rLYC]                                     ;; 0f:7981 $f0 $45
    sub  A, E                                          ;; 0f:7983 $93
    cp   A, $03                                        ;; 0f:7984 $fe $03
    jr   C, .jr_0f_797e                                ;; 0f:7986 $38 $f6
    ld   E, $02                                        ;; 0f:7988 $1e $02
.jr_0f_798a:
    ldh  A, [rSTAT]                                    ;; 0f:798a $f0 $41
    and  A, $03                                        ;; 0f:798c $e6 $03
    jr   Z, .jr_0f_798a                                ;; 0f:798e $28 $fa
.jr_0f_7990:
    ldh  A, [rSTAT]                                    ;; 0f:7990 $f0 $41
    and  A, E                                          ;; 0f:7992 $a3
    jr   NZ, .jr_0f_7990                               ;; 0f:7993 $20 $fb
    ld   A, D                                          ;; 0f:7995 $7a
.jr_0f_7996:
    ld   [HL+], A                                      ;; 0f:7996 $22
    dec  C                                             ;; 0f:7997 $0d
    jr   NZ, .jr_0f_7996                               ;; 0f:7998 $20 $fc
    ldh  A, [rSTAT]                                    ;; 0f:799a $f0 $41
    pop  BC                                            ;; 0f:799c $c1
    and  A, E                                          ;; 0f:799d $a3
    jr   NZ, .jr_0f_79a6                               ;; 0f:799e $20 $06
    ld   A, B                                          ;; 0f:79a0 $78
    ld   B, $00                                        ;; 0f:79a1 $06 $00
    ld   C, A                                          ;; 0f:79a3 $4f
    jr   .jr_0f_7974                                   ;; 0f:79a4 $18 $ce
.jr_0f_79a6:
    ld   A, L                                          ;; 0f:79a6 $7d
    sub  A, C                                          ;; 0f:79a7 $91
    ld   L, A                                          ;; 0f:79a8 $6f
    jr   NC, .jr_0f_797d                               ;; 0f:79a9 $30 $d2
    dec  H                                             ;; 0f:79ab $25
    jr   .jr_0f_797d                                   ;; 0f:79ac $18 $cf
    ld   HL, wCDB4                                     ;; 0f:79ae $21 $b4 $cd
    ld   DE, wCDB7                                     ;; 0f:79b1 $11 $b7 $cd
    ld   C, $03                                        ;; 0f:79b4 $0e $03
.jr_0f_79b6:
    ld   A, [HL+]                                      ;; 0f:79b6 $2a
    push HL                                            ;; 0f:79b7 $e5
    push DE                                            ;; 0f:79b8 $d5
    ld   B, $02                                        ;; 0f:79b9 $06 $02
.jr_0f_79bb:
    ld   L, A                                          ;; 0f:79bb $6f
    and  A, $aa                                        ;; 0f:79bc $e6 $aa
    srl  A                                             ;; 0f:79be $cb $3f
    or   A, L                                          ;; 0f:79c0 $b5
    and  A, $55                                        ;; 0f:79c1 $e6 $55
    cpl                                                ;; 0f:79c3 $2f
    inc  A                                             ;; 0f:79c4 $3c
    add  A, L                                          ;; 0f:79c5 $85
    ld   [DE], A                                       ;; 0f:79c6 $12
    inc  DE                                            ;; 0f:79c7 $13
    inc  DE                                            ;; 0f:79c8 $13
    inc  DE                                            ;; 0f:79c9 $13
    dec  B                                             ;; 0f:79ca $05
    jr   NZ, .jr_0f_79bb                               ;; 0f:79cb $20 $ee
    pop  DE                                            ;; 0f:79cd $d1
    pop  HL                                            ;; 0f:79ce $e1
    inc  DE                                            ;; 0f:79cf $13
    dec  C                                             ;; 0f:79d0 $0d
    jr   NZ, .jr_0f_79b6                               ;; 0f:79d1 $20 $e3
    ret                                                ;; 0f:79d3 $c9
    xor  A, A                                          ;; 0f:79d4 $af
.jr_0f_79d5:
    push AF                                            ;; 0f:79d5 $f5
    push AF                                            ;; 0f:79d6 $f5
    push AF                                            ;; 0f:79d7 $f5
    xor  A, A                                          ;; 0f:79d8 $af
    ld   HL, wCD46                                     ;; 0f:79d9 $21 $46 $cd
    ld   [HL+], A                                      ;; 0f:79dc $22
    ld   [HL+], A                                      ;; 0f:79dd $22
    ld   [HL+], A                                      ;; 0f:79de $22
    pop  AF                                            ;; 0f:79df $f1
    call call_00_1fcd                                  ;; 0f:79e0 $cd $cd $1f
    ld   DE, wC503                                     ;; 0f:79e3 $11 $03 $c5
    add  HL, DE                                        ;; 0f:79e6 $19
    ld   A, [HL]                                       ;; 0f:79e7 $7e
    cp   A, $63                                        ;; 0f:79e8 $fe $63
    jr   Z, .jr_0f_7a04                                ;; 0f:79ea $28 $18
    add  A, $04                                        ;; 0f:79ec $c6 $04
    ld   [wCD46], A                                    ;; 0f:79ee $ea $46 $cd
    sub  A, $03                                        ;; 0f:79f1 $d6 $03
    ld   L, A                                          ;; 0f:79f3 $6f
    ld   H, $00                                        ;; 0f:79f4 $26 $00
    call call_00_246b                                  ;; 0f:79f6 $cd $6b $24
    ld   A, L                                          ;; 0f:79f9 $7d
    ld   [wCD48], A                                    ;; 0f:79fa $ea $48 $cd
    ld   A, H                                          ;; 0f:79fd $7c
    ld   [wCD49], A                                    ;; 0f:79fe $ea $49 $cd
    call call_00_2499                                  ;; 0f:7a01 $cd $99 $24
.jr_0f_7a04:
    pop  AF                                            ;; 0f:7a04 $f1
    call call_00_242d                                  ;; 0f:7a05 $cd $2d $24
    ld   DE, wCD9D                                     ;; 0f:7a08 $11 $9d $cd
    add  HL, DE                                        ;; 0f:7a0b $19
    ld   E, L                                          ;; 0f:7a0c $5d
    ld   D, H                                          ;; 0f:7a0d $54
    ld   HL, wCD46                                     ;; 0f:7a0e $21 $46 $cd
    call call_00_1f8d                                  ;; 0f:7a11 $cd $8d $1f
    pop  AF                                            ;; 0f:7a14 $f1
    inc  A                                             ;; 0f:7a15 $3c
    cp   A, $04                                        ;; 0f:7a16 $fe $04
    jr   NZ, .jr_0f_79d5                               ;; 0f:7a18 $20 $bb
    ret                                                ;; 0f:7a1a $c9
    db   $21, $f8, $c6, $cb, $86, $23, $cb, $a6        ;; 0f:7a1b ????????
    db   $c9, $3e, $ff, $18, $06, $3e, $31, $18        ;; 0f:7a23 ????????
    db   $02                                           ;; 0f:7a2b ?
    ld   A, $03                                        ;; 0f:7a2c $3e $03
    push BC                                            ;; 0f:7a2e $c5
    ld   C, A                                          ;; 0f:7a2f $4f
.jr_0f_7a30:
    call call_00_358b                                  ;; 0f:7a30 $cd $8b $35
    ldh  A, [hFF8B]                                    ;; 0f:7a33 $f0 $8b
    or   A, A                                          ;; 0f:7a35 $b7
    jr   Z, .jr_0f_7a30                                ;; 0f:7a36 $28 $f8
    and  A, C                                          ;; 0f:7a38 $a1
    jr   NZ, .jr_0f_7a40                               ;; 0f:7a39 $20 $05
    call call_00_1e83                                  ;; 0f:7a3b $cd $83 $1e
    jr   .jr_0f_7a30                                   ;; 0f:7a3e $18 $f0
.jr_0f_7a40:
    pop  BC                                            ;; 0f:7a40 $c1
    jp   call_00_1e7c                                  ;; 0f:7a41 $c3 $7c $1e
    ld   [wCD4E], A                                    ;; 0f:7a44 $ea $4e $cd
    rst  rst_00_0018                                   ;; 0f:7a47 $df
    db   $8a                                           ;; 0f:7a48 .
    xor  A, A                                          ;; 0f:7a49 $af
    ld   [wCDEA], A                                    ;; 0f:7a4a $ea $ea $cd
    ld   HL, wCDE6                                     ;; 0f:7a4d $21 $e6 $cd
    ld   A, $00                                        ;; 0f:7a50 $3e $00
    ld   [HL+], A                                      ;; 0f:7a52 $22
    ld   [HL], $d0                                     ;; 0f:7a53 $36 $d0
    xor  A, A                                          ;; 0f:7a55 $af
    ld   [wCD15], A                                    ;; 0f:7a56 $ea $15 $cd
    ld   [wCD18], A                                    ;; 0f:7a59 $ea $18 $cd
    rst  rst_00_0018                                   ;; 0f:7a5c $df
    db   $05                                           ;; 0f:7a5d .
    dw   call_0f_7a6e                                  ;; 0f:7a5e pP $00
    dw   call_0f_7aab                                  ;; 0f:7a60 ?? $01
    dw   call_00_1e83                                  ;; 0f:7a62 ?? $02
    dw   call_0f_7ac5                                  ;; 0f:7a64 pP $03
    dw   call_0f_7ae8                                  ;; 0f:7a66 pP $04
    dw   call_0f_7af7                                  ;; 0f:7a68 ?? $05
    dw   call_0f_7b04                                  ;; 0f:7a6a ?? $06
    dw   call_0f_7b1c                                  ;; 0f:7a6c pP $07

call_0f_7a6e:
    ld   A, [wCD18]                                    ;; 0f:7a6e $fa $18 $cd
    or   A, A                                          ;; 0f:7a71 $b7
    jr   NZ, .jr_0f_7a8b                               ;; 0f:7a72 $20 $17
    ld   HL, wC687                                     ;; 0f:7a74 $21 $87 $c6
    ld   A, $ff                                        ;; 0f:7a77 $3e $ff
    call call_00_1f53                                  ;; 0f:7a79 $cd $53 $1f
    ld   HL, $3161                                     ;; 0f:7a7c $21 $61 $31
    ld   DE, $10d                                      ;; 0f:7a7f $11 $0d $01
    ld   BC, $206                                      ;; 0f:7a82 $01 $06 $02
    ld   A, $04                                        ;; 0f:7a85 $3e $04
    rst  rst_00_0018                                   ;; 0f:7a87 $df
    db   $00                                           ;; 0f:7a88 .
    jr   .jr_0f_7a90                                   ;; 0f:7a89 $18 $05
.jr_0f_7a8b:
    cp   A, $06                                        ;; 0f:7a8b $fe $06
    jp   Z, call_00_1e83                               ;; 0f:7a8d $ca $83 $1e
.jr_0f_7a90:
    call call_0f_7b4b                                  ;; 0f:7a90 $cd $4b $7b
    ld   B, A                                          ;; 0f:7a93 $47
    ld   HL, wC687                                     ;; 0f:7a94 $21 $87 $c6
    ld   A, [wCD18]                                    ;; 0f:7a97 $fa $18 $cd
    rst  add_hl_a                                      ;; 0f:7a9a $c7
    ld   A, B                                          ;; 0f:7a9b $78
    cp   A, $ff                                        ;; 0f:7a9c $fe $ff
    jr   NZ, .jr_0f_7aa2                               ;; 0f:7a9e $20 $02
    ld   B, $4c                                        ;; 0f:7aa0 $06 $4c
.jr_0f_7aa2:
    ld   [HL], B                                       ;; 0f:7aa2 $70
    call call_0f_7b35                                  ;; 0f:7aa3 $cd $35 $7b
    ld   HL, wCD18                                     ;; 0f:7aa6 $21 $18 $cd
    inc  [HL]                                          ;; 0f:7aa9 $34
    ret                                                ;; 0f:7aaa $c9

call_0f_7aab:
    ld   HL, wCD18                                     ;; 0f:7aab $21 $18 $cd
    ld   A, [HL]                                       ;; 0f:7aae $7e
    or   A, A                                          ;; 0f:7aaf $b7
    jr   Z, .jr_0f_7abe                                ;; 0f:7ab0 $28 $0c
    dec  A                                             ;; 0f:7ab2 $3d
    ld   [HL], A                                       ;; 0f:7ab3 $77
    ld   HL, wC687                                     ;; 0f:7ab4 $21 $87 $c6
    rst  add_hl_a                                      ;; 0f:7ab7 $c7
    ld   A, $ff                                        ;; 0f:7ab8 $3e $ff
    ld   [HL], A                                       ;; 0f:7aba $77
    jp   call_0f_7b35                                  ;; 0f:7abb $c3 $35 $7b
.jr_0f_7abe:
    ld   A, $ff                                        ;; 0f:7abe $3e $ff
    ld   [wCDEA], A                                    ;; 0f:7ac0 $ea $ea $cd
    jr   jr_0f_7ae5                                    ;; 0f:7ac3 $18 $20

call_0f_7ac5:
    ld   A, [wCD18]                                    ;; 0f:7ac5 $fa $18 $cd
    or   A, A                                          ;; 0f:7ac8 $b7
    jr   NZ, .jr_0f_7ad3                               ;; 0f:7ac9 $20 $08
    ld   A, [wC687]                                    ;; 0f:7acb $fa $87 $c6
    cp   A, $ff                                        ;; 0f:7ace $fe $ff
    jp   Z, call_00_1e83                               ;; 0f:7ad0 $ca $83 $1e
.jr_0f_7ad3:
    ld   A, [wCD4E]                                    ;; 0f:7ad3 $fa $4e $cd
    call call_00_1fcd                                  ;; 0f:7ad6 $cd $cd $1f
    ld   DE, wC507                                     ;; 0f:7ad9 $11 $07 $c5
    add  HL, DE                                        ;; 0f:7adc $19
    ld   E, L                                          ;; 0f:7add $5d
    ld   D, H                                          ;; 0f:7ade $54
    ld   HL, wC687                                     ;; 0f:7adf $21 $87 $c6
    call call_00_1f84                                  ;; 0f:7ae2 $cd $84 $1f

jr_0f_7ae5:
    jp   call_00_1e79                                  ;; 0f:7ae5 $c3 $79 $1e

call_0f_7ae8:
    ld   HL, wC081                                     ;; 0f:7ae8 $21 $81 $c0
    ld   A, [HL]                                       ;; 0f:7aeb $7e
    cp   A, $90                                        ;; 0f:7aec $fe $90
    jr   Z, .jr_0f_7af4                                ;; 0f:7aee $28 $04
    add  A, $10                                        ;; 0f:7af0 $c6 $10
    ld   [HL], A                                       ;; 0f:7af2 $77
    ret                                                ;; 0f:7af3 $c9
.jr_0f_7af4:
    ld   [HL], $10                                     ;; 0f:7af4 $36 $10
    ret                                                ;; 0f:7af6 $c9

call_0f_7af7:
    ld   HL, wC081                                     ;; 0f:7af7 $21 $81 $c0
    ld   A, [HL]                                       ;; 0f:7afa $7e
    sub  A, $10                                        ;; 0f:7afb $d6 $10
    jr   Z, .jr_0f_7b01                                ;; 0f:7afd $28 $02
    ld   [HL], A                                       ;; 0f:7aff $77
    ret                                                ;; 0f:7b00 $c9
.jr_0f_7b01:
    ld   [HL], $90                                     ;; 0f:7b01 $36 $90
    ret                                                ;; 0f:7b03 $c9

call_0f_7b04:
    ld   HL, wCD15                                     ;; 0f:7b04 $21 $15 $cd
    ld   A, [HL]                                       ;; 0f:7b07 $7e
    or   A, A                                          ;; 0f:7b08 $b7
    jr   Z, .jr_0f_7b14                                ;; 0f:7b09 $28 $09
    dec  [HL]                                          ;; 0f:7b0b $35
    ld   HL, wC080                                     ;; 0f:7b0c $21 $80 $c0
    ld   A, [HL]                                       ;; 0f:7b0f $7e
    sub  A, $10                                        ;; 0f:7b10 $d6 $10
    ld   [HL], A                                       ;; 0f:7b12 $77
    ret                                                ;; 0f:7b13 $c9
.jr_0f_7b14:
    ld   [HL], $05                                     ;; 0f:7b14 $36 $05
    ld   A, $90                                        ;; 0f:7b16 $3e $90
    ld   [wC080], A                                    ;; 0f:7b18 $ea $80 $c0
    ret                                                ;; 0f:7b1b $c9

call_0f_7b1c:
    ld   HL, wCD15                                     ;; 0f:7b1c $21 $15 $cd
    ld   A, [HL]                                       ;; 0f:7b1f $7e
    cp   A, $05                                        ;; 0f:7b20 $fe $05
    jr   Z, .jr_0f_7b2d                                ;; 0f:7b22 $28 $09
    inc  [HL]                                          ;; 0f:7b24 $34
    ld   HL, wC080                                     ;; 0f:7b25 $21 $80 $c0
    ld   A, [HL]                                       ;; 0f:7b28 $7e
    add  A, $10                                        ;; 0f:7b29 $c6 $10
    ld   [HL], A                                       ;; 0f:7b2b $77
    ret                                                ;; 0f:7b2c $c9
.jr_0f_7b2d:
    ld   [HL], $00                                     ;; 0f:7b2d $36 $00
    ld   A, $40                                        ;; 0f:7b2f $3e $40
    ld   [wC080], A                                    ;; 0f:7b31 $ea $80 $c0
    ret                                                ;; 0f:7b34 $c9

call_0f_7b35:
    ld   HL, wCD46                                     ;; 0f:7b35 $21 $46 $cd
    ld   [HL+], A                                      ;; 0f:7b38 $22
    xor  A, A                                          ;; 0f:7b39 $af
    ld   [HL-], A                                      ;; 0f:7b3a $32
    ld   A, [wCD18]                                    ;; 0f:7b3b $fa $18 $cd
    add  A, $0d                                        ;; 0f:7b3e $c6 $0d
    ld   E, A                                          ;; 0f:7b40 $5f
    ld   D, $01                                        ;; 0f:7b41 $16 $01
    ld   BC, $201                                      ;; 0f:7b43 $01 $01 $02
    ld   A, $04                                        ;; 0f:7b46 $3e $04
    rst  rst_00_0018                                   ;; 0f:7b48 $df
    db   $00                                           ;; 0f:7b49 .
    ret                                                ;; 0f:7b4a $c9

call_0f_7b4b:
    ld   A, [wCD15]                                    ;; 0f:7b4b $fa $15 $cd
    ld   B, A                                          ;; 0f:7b4e $47
    ld   A, [wC081]                                    ;; 0f:7b4f $fa $81 $c0
    sub  A, $10                                        ;; 0f:7b52 $d6 $10
    swap A                                             ;; 0f:7b54 $cb $37
    ld   C, A                                          ;; 0f:7b56 $4f
    ld   A, B                                          ;; 0f:7b57 $78
    call call_00_245f                                  ;; 0f:7b58 $cd $5f $24
    add  A, L                                          ;; 0f:7b5b $85
    add  A, C                                          ;; 0f:7b5c $81
    ld   HL, data_0f_78a0                              ;; 0f:7b5d $21 $a0 $78
    rst  add_hl_a                                      ;; 0f:7b60 $c7
    jp   jp_00_1eb4                                    ;; 0f:7b61 $c3 $b4 $1e
    ld   HL, $60                                       ;; 0f:7b64 $21 $60 $00
    call call_00_246b                                  ;; 0f:7b67 $cd $6b $24
    ld   DE, $7a81                                     ;; 0f:7b6a $11 $81 $7a
    add  HL, DE                                        ;; 0f:7b6d $19
    ld   DE, wC680                                     ;; 0f:7b6e $11 $80 $c6
    ld   B, $60                                        ;; 0f:7b71 $06 $60
    rst  rst_00_0018                                   ;; 0f:7b73 $df
    db   $73                                           ;; 0f:7b74 .
    xor  A, A                                          ;; 0f:7b75 $af
    rst  rst_00_0018                                   ;; 0f:7b76 $df
    db   $59                                           ;; 0f:7b77 .
    ld   HL, .data_0f_7b90                             ;; 0f:7b78 $21 $90 $7b
    ld   DE, wC8B0                                     ;; 0f:7b7b $11 $b0 $c8
    ld   B, $17                                        ;; 0f:7b7e $06 $17
    rst  rst_00_0018                                   ;; 0f:7b80 $df
    db   $03                                           ;; 0f:7b81 .
    call call_00_1e49                                  ;; 0f:7b82 $cd $49 $1e
    ld   HL, wC080                                     ;; 0f:7b85 $21 $80 $c0
    ld   A, $40                                        ;; 0f:7b88 $3e $40
    ld   [HL+], A                                      ;; 0f:7b8a $22
    ld   [HL], $10                                     ;; 0f:7b8b $36 $10
    rst  rst_00_0018                                   ;; 0f:7b8d $df
    db   $39                                           ;; 0f:7b8e .
    ret                                                ;; 0f:7b8f $c9
.data_0f_7b90:
    db   $01, $05, $12, $0c, $00, $d0, $00, $01        ;; 0f:7b90 ........
    db   $01, $02, $02, $f3, $78, $00, $05, $01        ;; 0f:7b98 ........
    db   $0e, $02, $f8, $78, $00, $00, $00, $3e        ;; 0f:7ba0 .......?
    db   $05, $cd, $b2, $3c, $3e, $08, $38, $14        ;; 0f:7ba8 ????????
    db   $3e, $0e, $cd, $b2, $3c, $3e, $01, $38        ;; 0f:7bb0 ????????
    db   $0b, $3e, $0f, $cd, $b2, $3c, $3e, $04        ;; 0f:7bb8 ????????
    db   $38, $02, $3e, $02, $ea, $c0, $cd, $c9        ;; 0f:7bc0 ????????
    db   $fa, $80, $c0, $f5, $11, $78, $38, $df        ;; 0f:7bc8 ????????
    db   $3b, $df, $8b, $cd, $38, $7c, $ea, $c0        ;; 0f:7bd0 ????????
    db   $cd, $5f, $16, $00, $06, $d8, $78, $cd        ;; 0f:7bd8 ????????
    db   $01, $29, $20, $1d, $78, $ea, $91, $ce        ;; 0f:7be0 ????????
    db   $c5, $d5, $df, $0e, $d1, $c1, $fa, $91        ;; 0f:7be8 ????????
    db   $ce, $3c, $28, $03, $34, $18, $0a, $21        ;; 0f:7bf0 ????????
    db   $8f, $7b, $78, $c7, $7e, $a3, $28, $01        ;; 0f:7bf8 ????????
    db   $14, $04, $78, $fe, $e5, $38, $d7, $d5        ;; 0f:7c00 ????????
    db   $21, $85, $72, $11, $01, $06, $01, $12        ;; 0f:7c08 ????????
    db   $06, $3e, $24, $df, $90, $f1, $b7, $28        ;; 0f:7c10 ????????
    db   $0c, $ea, $7c, $ce, $af, $ea, $7d, $ce        ;; 0f:7c18 ????????
    db   $ea, $7e, $ce, $18, $03, $21, $a6, $72        ;; 0f:7c20 ????????
    db   $3e, $04, $01, $12, $04, $df, $90, $df        ;; 0f:7c28 ????????
    db   $2c, $df, $49, $f1, $ea, $80, $c0, $c9        ;; 0f:7c30 ????????
    db   $fe, $04, $28, $20, $fe, $08, $c0, $fa        ;; 0f:7c38 ????????
    db   $e8, $c6, $fe, $0a, $28, $10, $fe, $0b        ;; 0f:7c40 ????????
    db   $28, $0c, $fe, $09, $28, $0b, $fe, $9b        ;; 0f:7c48 ????????
    db   $38, $04, $fe, $ad, $38, $03, $3e, $20        ;; 0f:7c50 ????????
    db   $c9, $3e, $40, $c9, $3e, $2f, $cd, $b2        ;; 0f:7c58 ????????
    db   $3c, $3e, $04, $d0, $3e, $10, $c9, $20        ;; 0f:7c60 ????????
    db   $20, $20, $40, $04, $02, $02, $21, $20        ;; 0f:7c68 ????????
    db   $01, $01, $10, $20                            ;; 0f:7c70 ????
    ld   HL, .data_0f_7c7e                             ;; 0f:7c74 $21 $7e $7c
    sub  A, $61                                        ;; 0f:7c77 $d6 $61
    rst  add_hl_a                                      ;; 0f:7c79 $c7
    ld   A, [HL]                                       ;; 0f:7c7a $7e
    jp   call_00_3ca0                                  ;; 0f:7c7b $c3 $a0 $3c
.data_0f_7c7e:
    db   $44, $00, $00, $50, $00, $61, $00, $3c        ;; 0f:7c7e ????????
    db   $00, $00, $2d, $3d, $00, $00, $00, $00        ;; 0f:7c86 ????????
    db   $90, $00, $92, $93, $3e, $00, $00, $dc        ;; 0f:7c8e ????????
    db   $d7, $00, $d4, $d8, $00, $dd, $00, $00        ;; 0f:7c96 ????????
    db   $2c, $3b, $50, $00, $74, $76, $00, $b2        ;; 0f:7c9e .???????
    db   $b1, $de, $d5, $da, $d9, $52, $34, $60        ;; 0f:7ca6 ????????
    db   $91, $62, $fe, $f5, $28, $38, $fe, $e8        ;; 0f:7cae ????????
    db   $da, $42, $7d, $28, $53, $fa, $e8, $c6        ;; 0f:7cb6 ????????
    db   $b7, $c2, $79, $7d, $3e, $e7, $ea, $91        ;; 0f:7cbe ????????
    db   $ce, $df, $0e, $fa, $91, $ce, $3c, $28        ;; 0f:7cc6 ????????
    db   $16, $34, $3e, $e3, $ea, $91, $ce, $df        ;; 0f:7cce ????????
    db   $0e, $fa, $91, $ce, $3c, $28, $08, $34        ;; 0f:7cd6 ????????
    db   $af, $21, $88, $69, $c3, $7c, $7d, $af        ;; 0f:7cde ????????
    db   $21, $ae, $61, $c3, $7c, $7d, $ea, $91        ;; 0f:7ce6 ????????
    db   $ce, $fa, $e8, $c6, $fe, $7f, $c2, $79        ;; 0f:7cee ????????
    db   $7d, $df, $0e, $3e, $ff, $32, $77, $3e        ;; 0f:7cf6 ????????
    db   $b6, $cd, $a6, $3c, $3e, $a9, $cd, $a0        ;; 0f:7cfe ????????
    db   $3c, $3e, $08, $21, $6f, $68, $18, $6e        ;; 0f:7d06 ????????
    db   $3c, $ea, $91, $ce, $df, $0e, $fa, $91        ;; 0f:7d0e ????????
    db   $ce, $3c, $28, $5f, $34, $fa, $e3, $c6        ;; 0f:7d16 ????????
    db   $b7, $20, $58, $fa, $e8, $c6, $fe, $05        ;; 0f:7d1e ????????
    db   $20, $51, $21, $e4, $c6, $11, $89, $7d        ;; 0f:7d26 ????????
    db   $06, $04, $1a, $be, $20, $45, $23, $13        ;; 0f:7d2e ????????
    db   $05, $20, $f7, $cd, $90, $1d, $af, $21        ;; 0f:7d36 ????????
    db   $5f, $69, $18, $3a, $3e, $cf, $cd, $b2        ;; 0f:7d3e ????????
    db   $3c, $38, $30, $3e, $bb, $cd, $b2, $3c        ;; 0f:7d46 ????????
    db   $38, $29, $fa, $e3, $c6, $a7, $20, $23        ;; 0f:7d4e ????????
    db   $fa, $e8, $c6, $b7, $28, $07, $fe, $05        ;; 0f:7d56 ????????
    db   $28, $03, $3d, $20, $16, $3e, $e1, $cd        ;; 0f:7d5e ????????
    db   $b2, $3c, $30, $0f, $3e, $2b, $e0, $bc        ;; 0f:7d66 ????????
    db   $3e, $82, $cd, $a0, $3c, $af, $21, $00        ;; 0f:7d6e ????????
    db   $40, $18, $03, $f6, $01, $c9, $ea, $34        ;; 0f:7d76 ????????
    db   $cd, $7d, $ea, $e6, $cd, $7c, $ea, $e7        ;; 0f:7d7e ????????
    db   $cd, $af, $c9, $30, $01, $a0, $01             ;; 0f:7d86 ???????
    call call_00_1fc4                                  ;; 0f:7d8d $cd $c4 $1f
    ld   DE, wC550                                     ;; 0f:7d90 $11 $50 $c5
    add  HL, DE                                        ;; 0f:7d93 $19
    bit  7, [HL]                                       ;; 0f:7d94 $cb $7e
    ret                                                ;; 0f:7d96 $c9
    ld   A, $01                                        ;; 0f:7d97 $3e $01
    ld   [wCD39], A                                    ;; 0f:7d99 $ea $39 $cd
    jp   call_00_20cf                                  ;; 0f:7d9c $c3 $cf $20
    db   $21, $00, $c0, $01, $04, $28, $7e, $ba        ;; 0f:7d9f ????????
    db   $38, $04, $bb, $30, $01, $71, $79, $85        ;; 0f:7da7 ????????
    db   $6f, $05, $20, $f2, $c9                       ;; 0f:7daf ?????
    call call_00_1fc4                                  ;; 0f:7db4 $cd $c4 $1f
    ld   DE, wC500                                     ;; 0f:7db7 $11 $00 $c5
    add  HL, DE                                        ;; 0f:7dba $19
    bit  7, [HL]                                       ;; 0f:7dbb $cb $7e
    ret                                                ;; 0f:7dbd $c9
    ld   HL, wC6E0                                     ;; 0f:7dbe $21 $e0 $c6
    ld   DE, wDD00                                     ;; 0f:7dc1 $11 $00 $dd
    ld   B, $60                                        ;; 0f:7dc4 $06 $60
    rst  rst_00_0018                                   ;; 0f:7dc6 $df
    db   $03                                           ;; 0f:7dc7 .
    ret                                                ;; 0f:7dc8 $c9
    db   $11, $e0, $c6, $21, $00, $dd, $06, $60        ;; 0f:7dc9 ????????
    db   $df, $03, $c9                                 ;; 0f:7dd1 ???
    cp   A, $10                                        ;; 0f:7dd4 $fe $10
    jr   C, .jr_0f_7de5                                ;; 0f:7dd6 $38 $0d
    ld   HL, .data_0f_7de8                             ;; 0f:7dd8 $21 $e8 $7d
    ld   B, $07                                        ;; 0f:7ddb $06 $07
.jr_0f_7ddd:
    cp   A, [HL]                                       ;; 0f:7ddd $be
    jr   Z, .jr_0f_7de5                                ;; 0f:7dde $28 $05
    inc  HL                                            ;; 0f:7de0 $23
    dec  B                                             ;; 0f:7de1 $05
    jr   NZ, .jr_0f_7ddd                               ;; 0f:7de2 $20 $f9
    ret                                                ;; 0f:7de4 $c9
.jr_0f_7de5:
    jp   call_00_35d2                                  ;; 0f:7de5 $c3 $d2 $35
.data_0f_7de8:
    db   $11, $17, $1b, $1e, $1f, $27, $28, $cd        ;; 0f:7de8 ????????
    db   $08, $7f, $cd, $18, $7e, $1e, $00, $cd        ;; 0f:7df0 ????????
    db   $86, $7e, $3e, $1a, $e0, $bc, $1c, $cd        ;; 0f:7df8 ????????
    db   $9d, $7e, $1c, $cd, $9d, $7e, $1c, $cd        ;; 0f:7e00 ????????
    db   $97, $7e, $1d, $cd, $9d, $7e, $1d, $cd        ;; 0f:7e08 ????????
    db   $9d, $7e, $1d, $cd, $8d, $7e, $18, $5c        ;; 0f:7e10 ????????

call_0f_7e18:
    xor  A, A                                          ;; 0f:7e18 $af
    ld   [wCDB2], A                                    ;; 0f:7e19 $ea $b2 $cd
    ld   A, $8f                                        ;; 0f:7e1c $3e $8f
    ld   [wCDB3], A                                    ;; 0f:7e1e $ea $b3 $cd
    ld   A, $50                                        ;; 0f:7e21 $3e $50
    ldh  [rWY], A                                      ;; 0f:7e23 $e0 $4a
    call call_00_1d9e                                  ;; 0f:7e25 $cd $9e $1d
    rst  rst_00_0018                                   ;; 0f:7e28 $df
    db   $9c                                           ;; 0f:7e29 .
    ld   HL, .data_0f_7e54                             ;; 0f:7e2a $21 $54 $7e
    ld   DE, wC880                                     ;; 0f:7e2d $11 $80 $c8
    ld   B, $20                                        ;; 0f:7e30 $06 $20
    rst  rst_00_0018                                   ;; 0f:7e32 $df
    db   $03                                           ;; 0f:7e33 .
    ld   HL, .data_0f_7e54                             ;; 0f:7e34 $21 $54 $7e
    ld   B, $20                                        ;; 0f:7e37 $06 $20
    rst  rst_00_0018                                   ;; 0f:7e39 $df
    db   $03                                           ;; 0f:7e3a .
    di                                                 ;; 0f:7e3b $f3
    ldh  A, [rSCX]                                     ;; 0f:7e3c $f0 $43
    ld   [wCDB0], A                                    ;; 0f:7e3e $ea $b0 $cd
    ld   A, $0f                                        ;; 0f:7e41 $3e $0f
    ld   [wCDB1], A                                    ;; 0f:7e43 $ea $b1 $cd
    ld   A, [wCDB2]                                    ;; 0f:7e46 $fa $b2 $cd
    ldh  [rLYC], A                                     ;; 0f:7e49 $e0 $45
    ld   HL, wC0BD                                     ;; 0f:7e4b $21 $bd $c0
    ld   A, $c2                                        ;; 0f:7e4e $3e $c2
    ld   [HL+], A                                      ;; 0f:7e50 $22
    ld   [HL], $7e                                     ;; 0f:7e51 $36 $7e
    reti                                               ;; 0f:7e53 $d9
.data_0f_7e54:
    db   $00, $08, $0b, $0d, $0e, $0f, $0f, $10        ;; 0f:7e54 ........
    db   $10, $0f, $0f, $0e, $0d, $0b, $08, $00        ;; 0f:7e5c ........
    db   $00, $f8, $f5, $f3, $f2, $f1, $f1, $f0        ;; 0f:7e64 ........
    db   $f0, $f1, $f1, $f2, $f3, $f5, $f8, $00        ;; 0f:7e6c ........

call_0f_7e74:
    di                                                 ;; 0f:7e74 $f3
    ld   A, $03                                        ;; 0f:7e75 $3e $03
    ldh  [rLYC], A                                     ;; 0f:7e77 $e0 $45
    ld   HL, $1e40                                     ;; 0f:7e79 $21 $40 $1e
    ld   DE, wC0BC                                     ;; 0f:7e7c $11 $bc $c0
    call call_00_1f8d                                  ;; 0f:7e7f $cd $8d $1f
    ei                                                 ;; 0f:7e82 $fb
    jp   call_00_1dfd                                  ;; 0f:7e83 $c3 $fd $1d

call_0f_7e86:
    call call_0f_7e9d                                  ;; 0f:7e86 $cd $9d $7e
    dec  [HL]                                          ;; 0f:7e89 $35
    jr   NZ, call_0f_7e86                              ;; 0f:7e8a $20 $fa
    ret                                                ;; 0f:7e8c $c9

call_0f_7e8d:
    ld   C, $0f                                        ;; 0f:7e8d $0e $0f
.jr_0f_7e8f:
    inc  [HL]                                          ;; 0f:7e8f $34
    call call_0f_7e9d                                  ;; 0f:7e90 $cd $9d $7e
    dec  C                                             ;; 0f:7e93 $0d
    jr   NZ, .jr_0f_7e8f                               ;; 0f:7e94 $20 $f9
    ret                                                ;; 0f:7e96 $c9
    db   $cd, $9a, $7e, $cd, $9d, $7e                  ;; 0f:7e97 ??????

call_0f_7e9d:
    ld   B, $06                                        ;; 0f:7e9d $06 $06
.jr_0f_7e9f:
    push BC                                            ;; 0f:7e9f $c5
    push DE                                            ;; 0f:7ea0 $d5
    call call_0f_7ead                                  ;; 0f:7ea1 $cd $ad $7e
    pop  DE                                            ;; 0f:7ea4 $d1
    pop  BC                                            ;; 0f:7ea5 $c1
    dec  B                                             ;; 0f:7ea6 $05
    jr   NZ, .jr_0f_7e9f                               ;; 0f:7ea7 $20 $f6
    ld   HL, wCDB1                                     ;; 0f:7ea9 $21 $b1 $cd
    ret                                                ;; 0f:7eac $c9

call_0f_7ead:
    ldh  A, [rLY]                                      ;; 0f:7ead $f0 $44
    or   A, A                                          ;; 0f:7eaf $b7
    jr   NZ, call_0f_7ead                              ;; 0f:7eb0 $20 $fb
    ld   HL, wCDB4                                     ;; 0f:7eb2 $21 $b4 $cd
    ld   A, E                                          ;; 0f:7eb5 $7b
    add  A, A                                          ;; 0f:7eb6 $87
    add  A, E                                          ;; 0f:7eb7 $83
    rst  add_hl_a                                      ;; 0f:7eb8 $c7
    ld   DE, rBGP                                      ;; 0f:7eb9 $11 $47 $ff
    call call_00_1f8d                                  ;; 0f:7ebc $cd $8d $1f
    jp   runSoundEngineReal                            ;; 0f:7ebf $c3 $06 $40
    push AF                                            ;; 0f:7ec2 $f5
    push DE                                            ;; 0f:7ec3 $d5
    push HL                                            ;; 0f:7ec4 $e5
    ldh  A, [rLY]                                      ;; 0f:7ec5 $f0 $44
    ld   L, A                                          ;; 0f:7ec7 $6f
    ldh  A, [hFF93]                                    ;; 0f:7ec8 $f0 $93
    add  A, L                                          ;; 0f:7eca $85
    and  A, $1f                                        ;; 0f:7ecb $e6 $1f
    ld   HL, wC880                                     ;; 0f:7ecd $21 $80 $c8
    add  A, L                                          ;; 0f:7ed0 $85
    ld   L, A                                          ;; 0f:7ed1 $6f
    jr   NC, .jr_0f_7ed5                               ;; 0f:7ed2 $30 $01
    inc  H                                             ;; 0f:7ed4 $24
.jr_0f_7ed5:
    ld   L, [HL]                                       ;; 0f:7ed5 $6e
    ld   A, [wCDB1]                                    ;; 0f:7ed6 $fa $b1 $cd
    ld   H, A                                          ;; 0f:7ed9 $67
    ld   E, L                                          ;; 0f:7eda $5d
    ld   D, H                                          ;; 0f:7edb $54
    xor  A, A                                          ;; 0f:7edc $af
    bit  7, L                                          ;; 0f:7edd $cb $7d
    jr   Z, .jr_0f_7ee5                                ;; 0f:7edf $28 $04
    sub  A, E                                          ;; 0f:7ee1 $93
    ld   E, A                                          ;; 0f:7ee2 $5f
    jr   .jr_0f_7ee7                                   ;; 0f:7ee3 $18 $02
.jr_0f_7ee5:
    sub  A, D                                          ;; 0f:7ee5 $92
    ld   D, A                                          ;; 0f:7ee6 $57
.jr_0f_7ee7:
    ld   A, E                                          ;; 0f:7ee7 $7b
    ld   E, $00                                        ;; 0f:7ee8 $1e $00
    cp   A, H                                          ;; 0f:7eea $bc
    jr   C, .jr_0f_7ef0                                ;; 0f:7eeb $38 $03
    ld   A, D                                          ;; 0f:7eed $7a
    add  A, L                                          ;; 0f:7eee $85
    ld   E, A                                          ;; 0f:7eef $5f
.jr_0f_7ef0:
    ld   A, [wCDB0]                                    ;; 0f:7ef0 $fa $b0 $cd
    add  A, E                                          ;; 0f:7ef3 $83
    ldh  [rSCX], A                                     ;; 0f:7ef4 $e0 $43
    ld   HL, rLYC                                      ;; 0f:7ef6 $21 $45 $ff
    inc  [HL]                                          ;; 0f:7ef9 $34
    ld   A, [wCDB3]                                    ;; 0f:7efa $fa $b3 $cd
    cp   A, [HL]                                       ;; 0f:7efd $be
    jr   NC, .jr_0f_7f04                               ;; 0f:7efe $30 $04
    ld   A, [wCDB2]                                    ;; 0f:7f00 $fa $b2 $cd
    ld   [HL], A                                       ;; 0f:7f03 $77
.jr_0f_7f04:
    pop  HL                                            ;; 0f:7f04 $e1
    pop  DE                                            ;; 0f:7f05 $d1
    pop  AF                                            ;; 0f:7f06 $f1
    reti                                               ;; 0f:7f07 $d9
    db   $3e, $50, $e0, $4a, $cd, $98, $1d, $af        ;; 0f:7f08 ????????
    db   $e0, $ba, $3e, $02, $cd, $6d, $3a, $3e        ;; 0f:7f10 ????????
    db   $16, $e0, $bc, $21, $7e, $72, $11, $01        ;; 0f:7f18 ????????
    db   $01, $01, $12, $06, $3e, $08, $df, $90        ;; 0f:7f20 ????????
    db   $cd, $4b, $3a, $3e, $25, $18, $03, $cd        ;; 0f:7f28 ????????
    db   $98, $1d, $ea, $81, $c8, $21, $80, $93        ;; 0f:7f30 ????????
    db   $11, $00, $94, $01, $10, $00, $df, $01        ;; 0f:7f38 ????????
    db   $3e, $0d, $ea, $80, $c8, $cd, $5e, $7f        ;; 0f:7f40 ????????
    db   $21, $80, $c8, $35, $20, $f7, $06, $0f        ;; 0f:7f48 ????????
    db   $c5, $cd, $5e, $7f, $c1, $05, $20, $f8        ;; 0f:7f50 ????????
    db   $cd, $f3, $1d, $df, $58, $c9, $fa, $81        ;; 0f:7f58 ????????
    db   $c8, $e0, $bc, $3e, $37, $cd, $6f, $7f        ;; 0f:7f60 ????????
    db   $3e, $1d, $cd, $6f, $7f, $3e, $40, $21        ;; 0f:7f68 ????????
    db   $10, $00, $cd, $6b, $24, $11, $00, $90        ;; 0f:7f70 ????????
    db   $19, $11, $80, $93, $01, $10, $00, $f0        ;; 0f:7f78 ????????
    db   $44, $fe, $30, $20, $fa, $df, $01, $fa        ;; 0f:7f80 ????????
    db   $80, $c8, $c6, $02, $c3, $6d, $3a, $21        ;; 0f:7f88 ????????
    db   $fb, $74, $11, $01, $01, $01, $12, $05        ;; 0f:7f90 ????????
    db   $3e, $24, $df, $90, $21, $80, $c0, $3e        ;; 0f:7f98 ????????
    db   $78, $22, $36, $70, $df, $05, $be, $7f        ;; 0f:7fa0 ????????
    db   $83, $1e, $83, $1e, $83, $1e, $83, $1e        ;; 0f:7fa8 ????????
    db   $83, $1e, $b6, $7f, $b6, $7f, $21, $80        ;; 0f:7fb0 ????????
    db   $c0, $7e, $ee, $f0, $77, $c9, $e1, $e1        ;; 0f:7fb8 ????????
    db   $21, $80, $c0, $7e, $36, $00, $fe, $78        ;; 0f:7fc0 ????????
    db   $c2, $00, $02, $df, $ba, $c9                  ;; 0f:7fc8 ??????
