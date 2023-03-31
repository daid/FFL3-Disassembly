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
    ld   [wMusicEndedOnChannel2], A                    ;; 0f:4048 $ea $05 $cb
    ld   [wMusicEndedOnChannel1], A                    ;; 0f:404b $ea $1d $cb
    ld   [wMusicEndedOnChannel3], A                    ;; 0f:404e $ea $35 $cb
    ld   [wMusicEndedOnChannel4], A                    ;; 0f:4051 $ea $4d $cb
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
; Range check requested song number.
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

; FFL2 and FFA set NR42 to 00 here. According to Pan Docs doing that "may cause an audio pop".
soundEffectMuteChannel4:
    ld   A, $08                                        ;; 0f:40fd $3e $08
    ldh  [rNR42], A                                    ;; 0f:40ff $e0 $21
    xor  A, A                                          ;; 0f:4101 $af
    ldh  [rNR43], A                                    ;; 0f:4102 $e0 $22
    ld   A, $80                                        ;; 0f:4104 $3e $80
    ldh  [rNR44], A                                    ;; 0f:4106 $e0 $23
    ld   A, [wMusicStereoPanChannel4]                  ;; 0f:4108 $fa $61 $cb
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
    ld   HL, wMusicEndedOnChannel2                     ;; 0f:41f9 $21 $05 $cb
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
.nextMusicInstruction:
    ld   A, [DE]                                       ;; 0f:420c $1a
    inc  DE                                            ;; 0f:420d $13
    cp   A, $e0                                        ;; 0f:420e $fe $e0
    jr   C, .playNote                                  ;; 0f:4210 $38 $12
    cp   A, $ff                                        ;; 0f:4212 $fe $ff
    jp   NZ, jp_0f_43da                                ;; 0f:4214 $c2 $da $43
    ld   [wMusicEndedOnChannel2], A                    ;; 0f:4217 $ea $05 $cb
; Rest note by maxing frequency
.rest:
    ld   A, $ff                                        ;; 0f:421a $3e $ff
    ldh  [rNR23], A                                    ;; 0f:421c $e0 $18
    ld   A, $07                                        ;; 0f:421e $3e $07
    ldh  [rNR24], A                                    ;; 0f:4220 $e0 $19
    jr   musicTempoPlayNotes_Channel1                  ;; 0f:4222 $18 $3c
.playNote:
    ld   HL, wMusicInstructionPointerChannel2          ;; 0f:4224 $21 $09 $cb
    ld   [HL], E                                       ;; 0f:4227 $73
    inc  L                                             ;; 0f:4228 $2c
    ld   [HL], D                                       ;; 0f:4229 $72
    call musicGetNoteDuration                          ;; 0f:422a $cd $08 $44
    ld   HL, wMusicNoteDurationChannel2                ;; 0f:422d $21 $06 $cb
    ld   [HL+], A                                      ;; 0f:4230 $22
    ld   A, E                                          ;; 0f:4231 $7b
    and  A, $0f                                        ;; 0f:4232 $e6 $0f
    ld   [HL], A                                       ;; 0f:4234 $77
    cp   A, $0c                                        ;; 0f:4235 $fe $0c
    jr   Z, musicTempoPlayNotes_Channel1               ;; 0f:4237 $28 $27
    jr   NC, .rest                                     ;; 0f:4239 $30 $df
    ld   HL, wMusicOctaveChannel2                      ;; 0f:423b $21 $08 $cb
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
    ld   HL, wMusicCurrentPitchChannel2                ;; 0f:424f $21 $0c $cb
    ldh  [rNR23], A                                    ;; 0f:4252 $e0 $18
    ld   [HL+], A                                      ;; 0f:4254 $22
    ld   A, C                                          ;; 0f:4255 $79
    ldh  [rNR24], A                                    ;; 0f:4256 $e0 $19
    ld   [HL+], A                                      ;; 0f:4258 $22
    call musicStartEnvelope                            ;; 0f:4259 $cd $9b $43
    inc  L                                             ;; 0f:425c $2c
    call musicStartEnvelope                            ;; 0f:425d $cd $9b $43

musicTempoPlayNotes_Channel1:
    ld   HL, wMusicEndedOnChannel1                     ;; 0f:4260 $21 $1d $cb
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
.nextMusicInstruction:
    ld   A, [DE]                                       ;; 0f:4273 $1a
    inc  DE                                            ;; 0f:4274 $13
    cp   A, $e0                                        ;; 0f:4275 $fe $e0
    jr   C, .playNote                                  ;; 0f:4277 $38 $12
    cp   A, $ff                                        ;; 0f:4279 $fe $ff
    jp   NZ, jp_0f_43c8                                ;; 0f:427b $c2 $c8 $43
    ld   [wMusicEndedOnChannel1], A                    ;; 0f:427e $ea $1d $cb
; Rest note by maxing frequency
.rest:
    ld   A, $ff                                        ;; 0f:4281 $3e $ff
    ldh  [rNR13], A                                    ;; 0f:4283 $e0 $13
    ld   A, $07                                        ;; 0f:4285 $3e $07
    ldh  [rNR14], A                                    ;; 0f:4287 $e0 $14
    jr   musicTempoPlayNotes_Channel3                  ;; 0f:4289 $18 $48
.playNote:
    ld   HL, wMusicInstructionPointerChannel1          ;; 0f:428b $21 $21 $cb
    ld   [HL], E                                       ;; 0f:428e $73
    inc  L                                             ;; 0f:428f $2c
    ld   [HL], D                                       ;; 0f:4290 $72
    call musicGetNoteDuration                          ;; 0f:4291 $cd $08 $44
    ld   HL, wMusicNoteDurationChannel1                ;; 0f:4294 $21 $1e $cb
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
    jr   NC, .rest                                     ;; 0f:42a8 $30 $d7
    ld   HL, wMusicOctaveChannel1                      ;; 0f:42aa $21 $20 $cb
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
    ld   HL, wMusicCurrentPitchChannel1                ;; 0f:42be $21 $24 $cb
    ldh  [rNR13], A                                    ;; 0f:42c1 $e0 $13
    ld   [HL+], A                                      ;; 0f:42c3 $22
    ld   A, C                                          ;; 0f:42c4 $79
    ldh  [rNR14], A                                    ;; 0f:42c5 $e0 $14
    ld   [HL+], A                                      ;; 0f:42c7 $22
    call musicStartEnvelope                            ;; 0f:42c8 $cd $9b $43
    inc  L                                             ;; 0f:42cb $2c
    call musicStartEnvelope                            ;; 0f:42cc $cd $9b $43
    xor  A, A                                          ;; 0f:42cf $af
    ld   [wCB66], A                                    ;; 0f:42d0 $ea $66 $cb

musicTempoPlayNotes_Channel3:
    ld   HL, wMusicEndedOnChannel3                     ;; 0f:42d3 $21 $35 $cb
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
.nextMusicInstruction:
    ld   A, [DE]                                       ;; 0f:42e6 $1a
    inc  DE                                            ;; 0f:42e7 $13
    cp   A, $e0                                        ;; 0f:42e8 $fe $e0
    jr   C, .playNote                                  ;; 0f:42ea $38 $10
    cp   A, $ff                                        ;; 0f:42ec $fe $ff
    jp   NZ, jp_0f_43b6                                ;; 0f:42ee $c2 $b6 $43
    ld   [wMusicEndedOnChannel3], A                    ;; 0f:42f1 $ea $35 $cb
    ldh  [rNR33], A                                    ;; 0f:42f4 $e0 $1d
    ld   A, $07                                        ;; 0f:42f6 $3e $07
    ldh  [rNR34], A                                    ;; 0f:42f8 $e0 $1e
    jr   musicTempoPlayNotes_Channel4                  ;; 0f:42fa $18 $38
.playNote:
    ld   HL, wMusicInstructionPointerChannel3          ;; 0f:42fc $21 $39 $cb
    ld   [HL], E                                       ;; 0f:42ff $73
    inc  L                                             ;; 0f:4300 $2c
    ld   [HL], D                                       ;; 0f:4301 $72
    call musicGetNoteDuration                          ;; 0f:4302 $cd $08 $44
    ld   HL, wMusicNoteDurationChannel3                ;; 0f:4305 $21 $36 $cb
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
    ld   HL, wMusicOctaveChannel3                      ;; 0f:4318 $21 $38 $cb
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
    call musicStartEnvelope                            ;; 0f:4331 $cd $9b $43

musicTempoPlayNotes_Channel4:
    ld   HL, wMusicEndedOnChannel4                     ;; 0f:4334 $21 $4d $cb
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
.nextMusicInstruction:
    ld   A, [DE]                                       ;; 0f:4345 $1a
    inc  DE                                            ;; 0f:4346 $13
    cp   A, $e0                                        ;; 0f:4347 $fe $e0
    jr   C, .playNote                                  ;; 0f:4349 $38 $11
    cp   A, $ff                                        ;; 0f:434b $fe $ff
    jr   NZ, jr_0f_43a4                                ;; 0f:434d $20 $55
    ld   [wMusicEndedOnChannel4], A                    ;; 0f:434f $ea $4d $cb
.rest:
    xor  A, A                                          ;; 0f:4352 $af
    ldh  [rNR42], A                                    ;; 0f:4353 $e0 $21
    ldh  [rNR43], A                                    ;; 0f:4355 $e0 $22
    ld   A, $80                                        ;; 0f:4357 $3e $80
    ldh  [rNR44], A                                    ;; 0f:4359 $e0 $23
    ret                                                ;; 0f:435b $c9
.playNote:
    ld   HL, wMusicInstructionPointerChannel4          ;; 0f:435c $21 $51 $cb
    ld   [HL], E                                       ;; 0f:435f $73
    inc  L                                             ;; 0f:4360 $2c
    ld   [HL], D                                       ;; 0f:4361 $72
    call musicGetNoteDuration                          ;; 0f:4362 $cd $08 $44
    ld   HL, wMusicNoteDurationChannel4                ;; 0f:4365 $21 $4e $cb
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
    jr   NC, .rest                                     ;; 0f:4377 $30 $d9
    ld   D, $00                                        ;; 0f:4379 $16 $00
    ld   HL, wMusicNR43ValuesChannel4                  ;; 0f:437b $21 $19 $46
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
    ld   [wMusicCurrentPitchChannel4], A               ;; 0f:438d $ea $54 $cb
    ld   A, $80                                        ;; 0f:4390 $3e $80
    ldh  [rNR44], A                                    ;; 0f:4392 $e0 $23
    xor  A, A                                          ;; 0f:4394 $af
    ld   [wCB67], A                                    ;; 0f:4395 $ea $67 $cb
    ld   HL, wMusicVolumeDurationChannel4              ;; 0f:4398 $21 $5b $cb

musicStartEnvelope:
    ld   A, $01                                        ;; 0f:439b $3e $01
    ld   [HL+], A                                      ;; 0f:439d $22
    ld   A, [HL+]                                      ;; 0f:439e $2a
    ld   E, [HL]                                       ;; 0f:439f $5e
    inc  L                                             ;; 0f:43a0 $2c
    ld   [HL+], A                                      ;; 0f:43a1 $22
    ld   [HL], E                                       ;; 0f:43a2 $73
    ret                                                ;; 0f:43a3 $c9

jr_0f_43a4:
    ld   HL, musicTempoPlayNotes_Channel4.nextMusicInstruction ;; 0f:43a4 $21 $45 $43
    push HL                                            ;; 0f:43a7 $e5
    ld   HL, musicOpCodeTableChannel4                  ;; 0f:43a8 $21 $88 $44

musicCallOpCode:
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
    ld   HL, musicTempoPlayNotes_Channel3.nextMusicInstruction ;; 0f:43b6 $21 $e6 $42
    push HL                                            ;; 0f:43b9 $e5
    cp   A, $f0                                        ;; 0f:43ba $fe $f0
    jr   C, .jr_0f_43c3                                ;; 0f:43bc $38 $05
    ld   HL, musicOpCodeTableChannel3                  ;; 0f:43be $21 $68 $44
    jr   musicCallOpCode                               ;; 0f:43c1 $18 $e8
.jr_0f_43c3:
    ld   BC, wMusicOctaveChannel3                      ;; 0f:43c3 $01 $38 $cb
    jr   jr_0f_43ea                                    ;; 0f:43c6 $18 $22

jp_0f_43c8:
    ld   HL, musicTempoPlayNotes_Channel1.nextMusicInstruction ;; 0f:43c8 $21 $73 $42
    push HL                                            ;; 0f:43cb $e5
    cp   A, $f0                                        ;; 0f:43cc $fe $f0
    jr   C, .jr_0f_43d5                                ;; 0f:43ce $38 $05
    ld   HL, musicOpCodeTableChannel1                  ;; 0f:43d0 $21 $48 $44
    jr   musicCallOpCode                               ;; 0f:43d3 $18 $d6
.jr_0f_43d5:
    ld   BC, wMusicOctaveChannel1                      ;; 0f:43d5 $01 $20 $cb
    jr   jr_0f_43ea                                    ;; 0f:43d8 $18 $10

jp_0f_43da:
    ld   HL, musicTempoPlayNotes.nextMusicInstruction  ;; 0f:43da $21 $0c $42
    push HL                                            ;; 0f:43dd $e5
    cp   A, $f0                                        ;; 0f:43de $fe $f0
    jr   C, .jr_0f_43e7                                ;; 0f:43e0 $38 $05
    ld   HL, musicOpCodeTableChannel2                  ;; 0f:43e2 $21 $28 $44
    jr   musicCallOpCode                               ;; 0f:43e5 $18 $c4
.jr_0f_43e7:
    ld   BC, wMusicOctaveChannel2                      ;; 0f:43e7 $01 $08 $cb

jr_0f_43ea:
    push DE                                            ;; 0f:43ea $d5
    bit  3, A                                          ;; 0f:43eb $cb $5f
    jr   NZ, .relativeOctave                           ;; 0f:43ed $20 $0b
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
.relativeOctave:
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
    ld   [wMusicStereoPanChannel4], A                  ;; 0f:45f3 $ea $61 $cb
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

wMusicNR43ValuesChannel4:
    db   $64, $59, $54, $2f, $44, $34, $2e, $24        ;; 0f:4619 ?????.?.
    db   $2d, $14, $1d, $04                            ;; 0f:4621 ?.?.

musicVibratoAndVolumeChannel2:
    ld   HL, wMusicEndedOnChannel2                     ;; 0f:4625 $21 $05 $cb
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
    ld   HL, wMusicVibratoDurationChannel2             ;; 0f:4634 $21 $0e $cb
    dec  [HL]                                          ;; 0f:4637 $35
    jr   NZ, .volume_envelope                          ;; 0f:4638 $20 $25
    call call_0f_474b                                  ;; 0f:463a $cd $4b $47
    ld   [wMusicVibratoDurationChannel2], A            ;; 0f:463d $ea $0e $cb
    ld   A, [HL+]                                      ;; 0f:4640 $2a
    ld   E, A                                          ;; 0f:4641 $5f
    ld   D, $00                                        ;; 0f:4642 $16 $00
    ld   C, H                                          ;; 0f:4644 $4c
    ld   A, L                                          ;; 0f:4645 $7d
    ld   HL, wMusicVibratoEnvelopePointerChannel2      ;; 0f:4646 $21 $11 $cb
    ld   [HL+], A                                      ;; 0f:4649 $22
    ld   [HL], C                                       ;; 0f:464a $71
    bit  7, E                                          ;; 0f:464b $cb $7b
    jr   Z, .sign_extended                             ;; 0f:464d $28 $01
    dec  D                                             ;; 0f:464f $15
.sign_extended:
    ld   HL, wMusicCurrentPitchChannel2                ;; 0f:4650 $21 $0c $cb
    ld   A, [HL+]                                      ;; 0f:4653 $2a
    ld   H, [HL]                                       ;; 0f:4654 $66
    ld   L, A                                          ;; 0f:4655 $6f
    add  HL, DE                                        ;; 0f:4656 $19
    ld   A, L                                          ;; 0f:4657 $7d
    ldh  [rNR23], A                                    ;; 0f:4658 $e0 $18
    ld   A, H                                          ;; 0f:465a $7c
    and  A, $07                                        ;; 0f:465b $e6 $07
    ldh  [rNR24], A                                    ;; 0f:465d $e0 $19
.volume_envelope:
    ld   HL, wMusicVolumeDurationChannel2              ;; 0f:465f $21 $13 $cb
    ld   A, [HL]                                       ;; 0f:4662 $7e
    inc  A                                             ;; 0f:4663 $3c
    ret  Z                                             ;; 0f:4664 $c8
    dec  [HL]                                          ;; 0f:4665 $35
    ret  NZ                                            ;; 0f:4666 $c0
    call call_0f_474b                                  ;; 0f:4667 $cd $4b $47
    ld   [wMusicVolumeDurationChannel2], A             ;; 0f:466a $ea $13 $cb
    ld   A, [HL+]                                      ;; 0f:466d $2a
    ldh  [rNR22], A                                    ;; 0f:466e $e0 $17
    ld   A, [wMusicCurrentPitchChannel2.high]          ;; 0f:4670 $fa $0d $cb
    ldh  [rNR24], A                                    ;; 0f:4673 $e0 $19
    ld   C, H                                          ;; 0f:4675 $4c
    ld   A, L                                          ;; 0f:4676 $7d
    ld   HL, wMusicVolumeEnvelopePointerChannel2       ;; 0f:4677 $21 $16 $cb
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
    ld   HL, wMusicVibratoDurationChannel1             ;; 0f:4692 $21 $26 $cb
    dec  [HL]                                          ;; 0f:4695 $35
    jr   NZ, .volume_envelope                          ;; 0f:4696 $20 $25
    call call_0f_474b                                  ;; 0f:4698 $cd $4b $47
    ld   [wMusicVibratoDurationChannel1], A            ;; 0f:469b $ea $26 $cb
    ld   A, [HL+]                                      ;; 0f:469e $2a
    ld   E, A                                          ;; 0f:469f $5f
    ld   D, $00                                        ;; 0f:46a0 $16 $00
    ld   C, H                                          ;; 0f:46a2 $4c
    ld   A, L                                          ;; 0f:46a3 $7d
    ld   HL, wMusicVibratoEnvelopePointerChannel1      ;; 0f:46a4 $21 $29 $cb
    ld   [HL+], A                                      ;; 0f:46a7 $22
    ld   [HL], C                                       ;; 0f:46a8 $71
    bit  7, E                                          ;; 0f:46a9 $cb $7b
    jr   Z, .sign_extended                             ;; 0f:46ab $28 $01
    dec  D                                             ;; 0f:46ad $15
.sign_extended:
    ld   HL, wMusicCurrentPitchChannel1                ;; 0f:46ae $21 $24 $cb
    ld   A, [HL+]                                      ;; 0f:46b1 $2a
    ld   H, [HL]                                       ;; 0f:46b2 $66
    ld   L, A                                          ;; 0f:46b3 $6f
    add  HL, DE                                        ;; 0f:46b4 $19
    ld   A, L                                          ;; 0f:46b5 $7d
    ldh  [rNR13], A                                    ;; 0f:46b6 $e0 $13
    ld   A, H                                          ;; 0f:46b8 $7c
    and  A, $07                                        ;; 0f:46b9 $e6 $07
    ldh  [rNR14], A                                    ;; 0f:46bb $e0 $14
.volume_envelope:
    ld   HL, wMusicVolumeDurationChannel1              ;; 0f:46bd $21 $2b $cb
    ld   A, [HL]                                       ;; 0f:46c0 $7e
    inc  A                                             ;; 0f:46c1 $3c
    ret  Z                                             ;; 0f:46c2 $c8
    dec  [HL]                                          ;; 0f:46c3 $35
    ret  NZ                                            ;; 0f:46c4 $c0
    call call_0f_474b                                  ;; 0f:46c5 $cd $4b $47
    ld   [wMusicVolumeDurationChannel1], A             ;; 0f:46c8 $ea $2b $cb
    ld   A, [HL+]                                      ;; 0f:46cb $2a
    ldh  [rNR12], A                                    ;; 0f:46cc $e0 $12
    ld   A, [wMusicCurrentPitchChannel1.high]          ;; 0f:46ce $fa $25 $cb
    ldh  [rNR14], A                                    ;; 0f:46d1 $e0 $14
    ld   C, H                                          ;; 0f:46d3 $4c
    ld   A, L                                          ;; 0f:46d4 $7d
    ld   HL, wMusicVolumeEnvelopePointerChannel1       ;; 0f:46d5 $21 $2e $cb
    ld   [HL+], A                                      ;; 0f:46d8 $22
    ld   [HL], C                                       ;; 0f:46d9 $71
    ret                                                ;; 0f:46da $c9

musicVibratoAndVolumeChannel3:
    ld   HL, wMusicEndedOnChannel3                     ;; 0f:46db $21 $35 $cb
    ld   A, [HL+]                                      ;; 0f:46de $2a
    or   A, A                                          ;; 0f:46df $b7
    jr   NZ, musicVolumeChannel4                       ;; 0f:46e0 $20 $36
    ldh  A, [hMusicNoteDurationChannel3Copy]           ;; 0f:46e2 $f0 $c0
    or   A, A                                          ;; 0f:46e4 $b7
    jr   Z, musicVolumeChannel4                        ;; 0f:46e5 $28 $31
    inc  L                                             ;; 0f:46e7 $2c
    ld   A, [HL]                                       ;; 0f:46e8 $7e
    cp   A, $0d                                        ;; 0f:46e9 $fe $0d
    jr   Z, musicVolumeChannel4                        ;; 0f:46eb $28 $2b
    ld   HL, wMusicVibratoDurationChannel3             ;; 0f:46ed $21 $3e $cb
    dec  [HL]                                          ;; 0f:46f0 $35
    jr   NZ, musicVolumeChannel4                       ;; 0f:46f1 $20 $25
    call call_0f_474b                                  ;; 0f:46f3 $cd $4b $47
    ld   [wMusicVibratoDurationChannel3], A            ;; 0f:46f6 $ea $3e $cb
    ld   A, [HL+]                                      ;; 0f:46f9 $2a
    ld   E, A                                          ;; 0f:46fa $5f
    ld   D, $00                                        ;; 0f:46fb $16 $00
    ld   C, H                                          ;; 0f:46fd $4c
    ld   A, L                                          ;; 0f:46fe $7d
    ld   HL, wMusicVibratoEnvelopePointerChannel3      ;; 0f:46ff $21 $41 $cb
    ld   [HL+], A                                      ;; 0f:4702 $22
    ld   [HL], C                                       ;; 0f:4703 $71
    bit  7, E                                          ;; 0f:4704 $cb $7b
    jr   Z, .sign_extended                             ;; 0f:4706 $28 $01
    dec  D                                             ;; 0f:4708 $15
.sign_extended:
    ld   HL, wMusicCurrentPitchChannel3                ;; 0f:4709 $21 $3c $cb
    ld   A, [HL+]                                      ;; 0f:470c $2a
    ld   H, [HL]                                       ;; 0f:470d $66
    ld   L, A                                          ;; 0f:470e $6f
    add  HL, DE                                        ;; 0f:470f $19
    ld   A, L                                          ;; 0f:4710 $7d
    ldh  [rNR33], A                                    ;; 0f:4711 $e0 $1d
    ld   A, H                                          ;; 0f:4713 $7c
    and  A, $07                                        ;; 0f:4714 $e6 $07
    ldh  [rNR34], A                                    ;; 0f:4716 $e0 $1e

musicVolumeChannel4:
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
    ld   HL, wMusicVolumeDurationChannel4              ;; 0f:4728 $21 $5b $cb
    ld   A, [HL]                                       ;; 0f:472b $7e
    inc  A                                             ;; 0f:472c $3c
    ret  Z                                             ;; 0f:472d $c8
    dec  [HL]                                          ;; 0f:472e $35
    ret  NZ                                            ;; 0f:472f $c0
    ld   A, [wCB67]                                    ;; 0f:4730 $fa $67 $cb
    and  A, A                                          ;; 0f:4733 $a7
    ret  NZ                                            ;; 0f:4734 $c0
    call call_0f_474b                                  ;; 0f:4735 $cd $4b $47
    ld   [wMusicVolumeDurationChannel4], A             ;; 0f:4738 $ea $5b $cb
    ld   A, [HL+]                                      ;; 0f:473b $2a
    ldh  [rNR42], A                                    ;; 0f:473c $e0 $21
    ld   A, $80                                        ;; 0f:473e $3e $80
    ldh  [rNR44], A                                    ;; 0f:4740 $e0 $23
    ld   A, L                                          ;; 0f:4742 $7d
    ld   [wMusicVolumeEnvelopePointerChannel4], A      ;; 0f:4743 $ea $5e $cb
    ld   A, H                                          ;; 0f:4746 $7c
    ld   [wMusicVolumeEnvelopePointerChannel4.high], A ;; 0f:4747 $ea $5f $cb
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
    ld   HL, soundEffectDataChannel1                   ;; 0f:475e $21 $f2 $66
    add  HL, DE                                        ;; 0f:4761 $19
    push DE                                            ;; 0f:4762 $d5
    ld   A, [HL+]                                      ;; 0f:4763 $2a
    ld   C, [HL]                                       ;; 0f:4764 $4e
    add  A, C                                          ;; 0f:4765 $81
    jr   Z, .channel4                                  ;; 0f:4766 $28 $0d
    sub  A, C                                          ;; 0f:4768 $91
    ld   DE, wSoundEffectInstructionPointerChannel1    ;; 0f:4769 $11 $62 $cb
    ld   [DE], A                                       ;; 0f:476c $12
    inc  E                                             ;; 0f:476d $1c
    ld   A, C                                          ;; 0f:476e $79
    ld   [DE], A                                       ;; 0f:476f $12
    ld   A, $01                                        ;; 0f:4770 $3e $01
    ld   [wSoundEffectDurationChannel1], A             ;; 0f:4772 $ea $1c $cb
.channel4:
    pop  DE                                            ;; 0f:4775 $d1
    ld   HL, soundEffectDataChannel4                   ;; 0f:4776 $21 $74 $67
    add  HL, DE                                        ;; 0f:4779 $19
    ld   A, [HL+]                                      ;; 0f:477a $2a
    ld   C, [HL]                                       ;; 0f:477b $4e
    add  A, C                                          ;; 0f:477c $81
    jr   Z, .finished                                  ;; 0f:477d $28 $0b
    sub  A, C                                          ;; 0f:477f $91
    ld   HL, wSoundEffectInstructionPointerChannel4    ;; 0f:4780 $21 $64 $cb
    ld   [HL+], A                                      ;; 0f:4783 $22
    ld   [HL], C                                       ;; 0f:4784 $71
    ld   A, $01                                        ;; 0f:4785 $3e $01
    ld   [wSoundEffectDurationChannel4], A             ;; 0f:4787 $ea $4c $cb
.finished:
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
    ld   HL, wSoundEffectInstructionPointerChannel1    ;; 0f:479c $21 $62 $cb
    ld   A, [HL+]                                      ;; 0f:479f $2a
    ld   H, [HL]                                       ;; 0f:47a0 $66
    ld   L, A                                          ;; 0f:47a1 $6f
.nextInstructionChannel1:
    ld   A, [HL+]                                      ;; 0f:47a2 $2a
    ld   [DE], A                                       ;; 0f:47a3 $12
    or   A, A                                          ;; 0f:47a4 $b7
    jr   NZ, .notTerminatorChannel1                    ;; 0f:47a5 $20 $05
    call soundEffectRestoreChannel1                    ;; 0f:47a7 $cd $dd $40
    jr   .channel4                                     ;; 0f:47aa $18 $34
.notTerminatorChannel1:
    cp   A, $ef                                        ;; 0f:47ac $fe $ef
    jr   NZ, .notLoopChannel1                          ;; 0f:47ae $20 $0f
    ld   A, [HL+]                                      ;; 0f:47b0 $2a
    ld   C, A                                          ;; 0f:47b1 $4f
    ld   A, [HL+]                                      ;; 0f:47b2 $2a
    ld   B, A                                          ;; 0f:47b3 $47
    ldh  A, [hSoundEffectLoopCounterChannel1]          ;; 0f:47b4 $f0 $c4
    dec  A                                             ;; 0f:47b6 $3d
    ldh  [hSoundEffectLoopCounterChannel1], A          ;; 0f:47b7 $e0 $c4
    jr   Z, .nextInstructionChannel1                   ;; 0f:47b9 $28 $e7
    ld   L, C                                          ;; 0f:47bb $69
    ld   H, B                                          ;; 0f:47bc $60
    jr   .nextInstructionChannel1                      ;; 0f:47bd $18 $e3
.notLoopChannel1:
    cp   A, $f0                                        ;; 0f:47bf $fe $f0
    jr   C, .playChannel1                              ;; 0f:47c1 $38 $06
    and  A, $0f                                        ;; 0f:47c3 $e6 $0f
    ldh  [hSoundEffectLoopCounterChannel1], A          ;; 0f:47c5 $e0 $c4
    jr   .nextInstructionChannel1                      ;; 0f:47c7 $18 $d9
.playChannel1:
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
    ld   HL, wSoundEffectInstructionPointerChannel1    ;; 0f:47db $21 $62 $cb
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
    ld   HL, wSoundEffectInstructionPointerChannel4    ;; 0f:47ec $21 $64 $cb
    ld   A, [HL+]                                      ;; 0f:47ef $2a
    ld   H, [HL]                                       ;; 0f:47f0 $66
    ld   L, A                                          ;; 0f:47f1 $6f
.nextInstructionChannel4:
    ld   A, [HL+]                                      ;; 0f:47f2 $2a
    ld   [DE], A                                       ;; 0f:47f3 $12
    or   A, A                                          ;; 0f:47f4 $b7
    jr   NZ, .notTerminatorChannel4                    ;; 0f:47f5 $20 $03
    jp   soundEffectMuteChannel4                       ;; 0f:47f7 $c3 $fd $40
.notTerminatorChannel4:
    cp   A, $ef                                        ;; 0f:47fa $fe $ef
    jr   NZ, .notLoopChannel4                          ;; 0f:47fc $20 $0f
    ld   A, [HL+]                                      ;; 0f:47fe $2a
    ld   C, A                                          ;; 0f:47ff $4f
    ld   A, [HL+]                                      ;; 0f:4800 $2a
    ld   B, A                                          ;; 0f:4801 $47
    ldh  A, [hSoundEffectLoopCounterChannel4]          ;; 0f:4802 $f0 $c5
    dec  A                                             ;; 0f:4804 $3d
    ldh  [hSoundEffectLoopCounterChannel4], A          ;; 0f:4805 $e0 $c5
    jr   Z, .nextInstructionChannel4                   ;; 0f:4807 $28 $e9
    ld   L, C                                          ;; 0f:4809 $69
    ld   H, B                                          ;; 0f:480a $60
    jr   .nextInstructionChannel4                      ;; 0f:480b $18 $e5
.notLoopChannel4:
    cp   A, $f0                                        ;; 0f:480d $fe $f0
    jr   C, .notSetCounterChannel4                     ;; 0f:480f $38 $06
    and  A, $0f                                        ;; 0f:4811 $e6 $0f
    ldh  [hSoundEffectLoopCounterChannel4], A          ;; 0f:4813 $e0 $c5
    jr   .nextInstructionChannel4                      ;; 0f:4815 $18 $db
.notSetCounterChannel4:
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
    ld   HL, wSoundEffectInstructionPointerChannel4    ;; 0f:4829 $21 $64 $cb
    ld   [HL+], A                                      ;; 0f:482c $22
    ld   [HL], C                                       ;; 0f:482d $71
    ret                                                ;; 0f:482e $c9

; BUG: This table is 19 entries long, but the music plugin chokes on the 12 song.
;@music_pointers amount=19
musicSongChannelPointers:
    dw   song00_channel2, song00_channel1, song00_channel3, song00_channel4 ;; 0f:482f $66 $5d $e5 $5d $81 $5e $fb $5e
    dw   song01_channel2, song01_channel1, song01_channel3, song01_channel4 ;; 0f:4837 $0d $5f $d8 $5f $99 $60 $e9 $60
    dw   song02_channel2, song02_channel1, song02_channel3, song02_channel4 ;; 0f:483f $c0 $4a $ec $4a $66 $4b $91 $4b
    dw   song03_channel2, song03_channel1, song03_channel3, song03_channel4 ;; 0f:4847 $e5 $62 $2f $63 $7b $63 $c7 $63
    dw   song04_channel2, song04_channel1, song04_channel3, song04_channel4 ;; 0f:484f $1a $65 $68 $65 $a0 $65 $c9 $65
    dw   song05_channel2, song05_channel1, song05_channel3, song05_channel4 ;; 0f:4857 $cf $48 $1f $49 $df $49 $87 $4a
    dw   song06_channel2, song06_channel1, song06_channel3, song06_channel4 ;; 0f:485f $92 $4b $64 $4c $23 $4d $10 $4e
    dw   song07_channel2, song07_channel1, song07_channel3, song07_channel4 ;; 0f:4867 $cc $59 $40 $5a $e9 $5a $38 $5b
    dw   song08_channel2, song08_channel1, song08_channel3, song08_channel4 ;; 0f:486f $5b $4e $19 $4f $08 $50 $8b $50
    dw   song09_channel2, song09_channel1, song09_channel3, song02_channel4 ;; 0f:4877 $b6 $52 $0f $53 $2a $53 $91 $4b
    dw   song0a_channel2, song0a_channel1, song0a_channel3, song0a_channel4 ;; 0f:487f $9f $50 $10 $51 $d0 $51 $a5 $52
    dw   song0b_channel2, song0b_channel1, song0b_channel3, song0b_channel4 ;; 0f:4887 $72 $5b $ae $5b $ea $5b $11 $5c
    dw   song0c_channel2, song0c_channel1, song0c_channel3, song0c_channel4 ;; 0f:488f $d5 $63 $4e $64 $ea $64 $0a $65
    dw   song0d_channel2, song0d_channel1, song0d_channel3, song0d_channel4 ;; 0f:4897 $10 $61 $94 $61 $71 $62 $d5 $62
    dw   song0e_channel2, song0e_channel1, song0e_channel3, song0e_channel4 ;; 0f:489f $f3 $55 $b6 $56 $30 $57 $4f $57
    dw   song0f_channel2, song0f_channel1, song0f_channel3, song0f_channel4 ;; 0f:48a7 $6e $57 $ed $57 $3f $58 $2f $59
    dw   song10_channel2, song10_channel1, song10_channel3, song10_channel4 ;; 0f:48af $45 $59 $86 $59 $91 $59 $be $59
    dw   song11_channel2, song11_channel1, song11_channel3, song11_channel4 ;; 0f:48b7 $6d $53 $9f $53 $20 $54 $c2 $54
    dw   song12_channel2, song12_channel1, song12_channel3, song12_channel4 ;; 0f:48bf $2c $5c $a3 $5c $d7 $5c $48 $5d
    dw   data_0f_54d5                                  ;; 0f:48c7 pP
    dw   data_0f_5521                                  ;; 0f:48c9 pP
    dw   data_0f_559b                                  ;; 0f:48cb pP
    dw   song02_channel4                               ;; 0f:48cd pP

song05_channel2:
    mINIT2 $60, data_0f_6668, data_0f_6625, $80        ;; 0f:48cf $fe $60 $68 $66 $25 $66 $80
    mC_3                                               ;; 0f:48d6 $03
    mOCTAVE_3                                          ;; 0f:48d7 $e3
    mCOUNTER_2 $02                                     ;; 0f:48d8 $fa $02
.data_0f_48da:
    mD_6                                               ;; 0f:48da $26
    mA_3                                               ;; 0f:48db $93
    mGis_12                                            ;; 0f:48dc $8c
    mA_12                                              ;; 0f:48dd $9c
    mB_9                                               ;; 0f:48de $b9
    mA_1                                               ;; 0f:48df $91
    mREPEAT_2 .data_0f_48da                            ;; 0f:48e0 $f9 $da $48
    mVOLUME_ENVELOPE data_0f_662b                      ;; 0f:48e3 $f0 $2b $66
.data_0f_48e6:
    mCOUNTER $02                                       ;; 0f:48e6 $f3 $02
.data_0f_48e8:
    mFis_3                                             ;; 0f:48e8 $63
    mG_9                                               ;; 0f:48e9 $79
    mFis_9                                             ;; 0f:48ea $69
    mE_9                                               ;; 0f:48eb $49
    mG_9                                               ;; 0f:48ec $79
    mFis_6                                             ;; 0f:48ed $66
    mD_3                                               ;; 0f:48ee $23
    mOCTAVE_MINUS_1                                    ;; 0f:48ef $ec
    mA_6                                               ;; 0f:48f0 $96
    mAis_6                                             ;; 0f:48f1 $a6
    mOCTAVE_PLUS_1                                     ;; 0f:48f2 $e8
    mD_6                                               ;; 0f:48f3 $26
    mE_6                                               ;; 0f:48f4 $46
    mD_6                                               ;; 0f:48f5 $26
    mJUMPIF $01, .data_0f_48ff                         ;; 0f:48f6 $fb $01 $ff $48
    mD_3                                               ;; 0f:48fa $23
    mCis_3                                             ;; 0f:48fb $13
    mREPEAT .data_0f_48e8                              ;; 0f:48fc $f2 $e8 $48
.data_0f_48ff:
    mA_1                                               ;; 0f:48ff $91
    mD_6                                               ;; 0f:4900 $26
    mA_3                                               ;; 0f:4901 $93
    mGis_12                                            ;; 0f:4902 $8c
    mA_12                                              ;; 0f:4903 $9c
    mB_9                                               ;; 0f:4904 $b9
    mA_6                                               ;; 0f:4905 $96
    mD_3                                               ;; 0f:4906 $23
    mD_6                                               ;; 0f:4907 $26
    mAis_3                                             ;; 0f:4908 $a3
    mOCTAVE_PLUS_1                                     ;; 0f:4909 $e8
    mC_6                                               ;; 0f:490a $06
    mOCTAVE_MINUS_1                                    ;; 0f:490b $ec
    mAis_6                                             ;; 0f:490c $a6
    mA_1                                               ;; 0f:490d $91
    mD_6                                               ;; 0f:490e $26
    mA_3                                               ;; 0f:490f $93
    mGis_12                                            ;; 0f:4910 $8c
    mA_12                                              ;; 0f:4911 $9c
    mB_9                                               ;; 0f:4912 $b9
    mA_6                                               ;; 0f:4913 $96
    mD_3                                               ;; 0f:4914 $23
    mD_6                                               ;; 0f:4915 $26
    mOCTAVE_PLUS_1                                     ;; 0f:4916 $e8
    mD_3                                               ;; 0f:4917 $23
    mC_6                                               ;; 0f:4918 $06
    mOCTAVE_MINUS_1                                    ;; 0f:4919 $ec
    mAis_6                                             ;; 0f:491a $a6
    mA_1                                               ;; 0f:491b $91
    mJUMP .data_0f_48e6                                ;; 0f:491c $f1 $e6 $48

song05_channel1:
    mINIT1 frequencyDeltaData, data_0f_65e3, $80       ;; 0f:491f $fe $63 $66 $e3 $65 $80
    mC_3                                               ;; 0f:4925 $03
    mCOUNTER_2 $02                                     ;; 0f:4926 $fa $02
.data_0f_4928:
    mSTEREOPAN $03                                     ;; 0f:4928 $f6 $03
    mOCTAVE_2                                          ;; 0f:492a $e2
    mFis_6                                             ;; 0f:492b $66
    mOCTAVE_PLUS_1                                     ;; 0f:492c $e8
    mFis_3                                             ;; 0f:492d $63
    mE_12                                              ;; 0f:492e $4c
    mFis_12                                            ;; 0f:492f $6c
    mG_9                                               ;; 0f:4930 $79
    mSTEREOPAN $01                                     ;; 0f:4931 $f6 $01
    mFis_12                                            ;; 0f:4933 $6c
    mD_12                                              ;; 0f:4934 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4935 $ec
    mA_12                                              ;; 0f:4936 $9c
    mSTEREOPAN $02                                     ;; 0f:4937 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4939 $e8
    mA_12                                              ;; 0f:493a $9c
    mFis_12                                            ;; 0f:493b $6c
    mD_12                                              ;; 0f:493c $2c
    mSTEREOPAN $01                                     ;; 0f:493d $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:493f $e8
    mD_12                                              ;; 0f:4940 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4941 $ec
    mA_12                                              ;; 0f:4942 $9c
    mFis_12                                            ;; 0f:4943 $6c
    mSTEREOPAN $02                                     ;; 0f:4944 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4946 $e8
    mFis_12                                            ;; 0f:4947 $6c
    mD_12                                              ;; 0f:4948 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4949 $ec
    mA_12                                              ;; 0f:494a $9c
    mSTEREOPAN $01                                     ;; 0f:494b $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:494d $e8
    mA_12                                              ;; 0f:494e $9c
    mD_12                                              ;; 0f:494f $2c
    mSTEREOPAN $02                                     ;; 0f:4950 $f6 $02
    mG_12                                              ;; 0f:4952 $7c
    mD_12                                              ;; 0f:4953 $2c
    mREPEAT_2 .data_0f_4928                            ;; 0f:4954 $f9 $28 $49
.data_0f_4957:
    mVOLUME_ENVELOPE data_0f_6613                      ;; 0f:4957 $f0 $13 $66
    mCOUNTER $02                                       ;; 0f:495a $f3 $02
.data_0f_495c:
    mOCTAVE_3                                          ;; 0f:495c $e3
    mCOUNTER_2 $08                                     ;; 0f:495d $fa $08
.data_0f_495f:
    mA_12                                              ;; 0f:495f $9c
    mE_12                                              ;; 0f:4960 $4c
    mFis_12                                            ;; 0f:4961 $6c
    mD_12                                              ;; 0f:4962 $2c
    mREPEAT_2 .data_0f_495f                            ;; 0f:4963 $f9 $5f $49
    mCOUNTER_2 $04                                     ;; 0f:4966 $fa $04
.data_0f_4968:
    mA_12                                              ;; 0f:4968 $9c
    mE_12                                              ;; 0f:4969 $4c
    mF_12                                              ;; 0f:496a $5c
    mD_12                                              ;; 0f:496b $2c
    mREPEAT_2 .data_0f_4968                            ;; 0f:496c $f9 $68 $49
    mCOUNTER_2 $02                                     ;; 0f:496f $fa $02
.data_0f_4971:
    mA_12                                              ;; 0f:4971 $9c
    mD_12                                              ;; 0f:4972 $2c
    mE_12                                              ;; 0f:4973 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:4974 $ec
    mA_12                                              ;; 0f:4975 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4976 $e8
    mREPEAT_2 .data_0f_4971                            ;; 0f:4977 $f9 $71 $49
    mA_12                                              ;; 0f:497a $9c
    mCis_12                                            ;; 0f:497b $1c
    mE_12                                              ;; 0f:497c $4c
    mOCTAVE_MINUS_1                                    ;; 0f:497d $ec
    mA_12                                              ;; 0f:497e $9c
    mOCTAVE_PLUS_1                                     ;; 0f:497f $e8
    mA_12                                              ;; 0f:4980 $9c
    mOCTAVE_MINUS_1                                    ;; 0f:4981 $ec
    mA_12                                              ;; 0f:4982 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4983 $e8
    mCis_12                                            ;; 0f:4984 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:4985 $ec
    mA_12                                              ;; 0f:4986 $9c
    mREPEAT .data_0f_495c                              ;; 0f:4987 $f2 $5c $49
    mSTEREOPAN $03                                     ;; 0f:498a $f6 $03
    mVOLUME_ENVELOPE data_0f_65f7                      ;; 0f:498c $f0 $f7 $65
    mOCTAVE_MINUS_1                                    ;; 0f:498f $ec
    mA_6                                               ;; 0f:4990 $96
    mOCTAVE_PLUS_1                                     ;; 0f:4991 $e8
    mD_6                                               ;; 0f:4992 $26
    mA_6                                               ;; 0f:4993 $96
    mE_12                                              ;; 0f:4994 $4c
    mFis_12                                            ;; 0f:4995 $6c
    mG_9                                               ;; 0f:4996 $79
    mFis_6                                             ;; 0f:4997 $66
    mD_6                                               ;; 0f:4998 $26
    mA_9                                               ;; 0f:4999 $99
    mG_9                                               ;; 0f:499a $79
    mFis_9                                             ;; 0f:499b $69
    mE_9                                               ;; 0f:499c $49
    mD_6                                               ;; 0f:499d $26
    mE_9                                               ;; 0f:499e $49
    mF_9                                               ;; 0f:499f $59
    mE_6                                               ;; 0f:49a0 $46
    mD_6                                               ;; 0f:49a1 $26
    mCis_9                                             ;; 0f:49a2 $19
    mOCTAVE_MINUS_1                                    ;; 0f:49a3 $ec
    mA_9                                               ;; 0f:49a4 $99
    mE_9                                               ;; 0f:49a5 $49
    mA_9                                               ;; 0f:49a6 $99
    mOCTAVE_PLUS_1                                     ;; 0f:49a7 $e8
    mE_9                                               ;; 0f:49a8 $49
    mCis_9                                             ;; 0f:49a9 $19
    mA_9                                               ;; 0f:49aa $99
    mE_9                                               ;; 0f:49ab $49
    mA_4                                               ;; 0f:49ac $94
    mA_12                                              ;; 0f:49ad $9c
    mG_12                                              ;; 0f:49ae $7c
    mFis_6                                             ;; 0f:49af $66
    mE_12                                              ;; 0f:49b0 $4c
    mFis_12                                            ;; 0f:49b1 $6c
    mG_9                                               ;; 0f:49b2 $79
    mFis_12                                            ;; 0f:49b3 $6c
    mE_12                                              ;; 0f:49b4 $4c
    mFis_12                                            ;; 0f:49b5 $6c
    mG_12                                              ;; 0f:49b6 $7c
    mA_9                                               ;; 0f:49b7 $99
    mD_12                                              ;; 0f:49b8 $2c
    mCis_12                                            ;; 0f:49b9 $1c
    mD_12                                              ;; 0f:49ba $2c
    mE_12                                              ;; 0f:49bb $4c
    mFis_9                                             ;; 0f:49bc $69
    mA_12                                              ;; 0f:49bd $9c
    mG_12                                              ;; 0f:49be $7c
    mFis_12                                            ;; 0f:49bf $6c
    mE_12                                              ;; 0f:49c0 $4c
    mG_6                                               ;; 0f:49c1 $76
    mAis_6                                             ;; 0f:49c2 $a6
    mA_6                                               ;; 0f:49c3 $96
    mG_6                                               ;; 0f:49c4 $76
    mFis_4                                             ;; 0f:49c5 $64
    mG_12                                              ;; 0f:49c6 $7c
    mFis_12                                            ;; 0f:49c7 $6c
    mVOLUME_ENVELOPE data_0f_660f                      ;; 0f:49c8 $f0 $0f $66
    mSTEREOPAN $01                                     ;; 0f:49cb $f6 $01
    mE_12                                              ;; 0f:49cd $4c
    mOCTAVE_MINUS_1                                    ;; 0f:49ce $ec
    mA_12                                              ;; 0f:49cf $9c
    mOCTAVE_PLUS_1                                     ;; 0f:49d0 $e8
    mE_12                                              ;; 0f:49d1 $4c
    mA_12                                              ;; 0f:49d2 $9c
    mSTEREOPAN $02                                     ;; 0f:49d3 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:49d5 $e8
    mE_12                                              ;; 0f:49d6 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:49d7 $ec
    mA_12                                              ;; 0f:49d8 $9c
    mE_12                                              ;; 0f:49d9 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:49da $ec
    mA_12                                              ;; 0f:49db $9c
    mJUMP .data_0f_4957                                ;; 0f:49dc $f1 $57 $49

song05_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:49df $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:49e5 $03
    mOCTAVE_0                                          ;; 0f:49e6 $e0
    mA_6                                               ;; 0f:49e7 $96
    mOCTAVE_PLUS_1                                     ;; 0f:49e8 $e8
    mD_2                                               ;; 0f:49e9 $22
    mOCTAVE_PLUS_1                                     ;; 0f:49ea $e8
    mD_6                                               ;; 0f:49eb $26
    mA_3                                               ;; 0f:49ec $93
    mGis_12                                            ;; 0f:49ed $8c
    mA_12                                              ;; 0f:49ee $9c
    mB_9                                               ;; 0f:49ef $b9
    mOCTAVE_0                                          ;; 0f:49f0 $e0
    mA_6                                               ;; 0f:49f1 $96
    mOCTAVE_PLUS_1                                     ;; 0f:49f2 $e8
    mD_2                                               ;; 0f:49f3 $22
    mOCTAVE_PLUS_1                                     ;; 0f:49f4 $e8
    mD_6                                               ;; 0f:49f5 $26
    mA_6                                               ;; 0f:49f6 $96
    mOCTAVE_MINUS_2                                    ;; 0f:49f7 $ed
    mA_12                                              ;; 0f:49f8 $9c
    mB_12                                              ;; 0f:49f9 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:49fa $e8
    mCis_12                                            ;; 0f:49fb $1c
    mD_12                                              ;; 0f:49fc $2c
    mE_12                                              ;; 0f:49fd $4c
    mFis_12                                            ;; 0f:49fe $6c
    mG_12                                              ;; 0f:49ff $7c
    mA_12                                              ;; 0f:4a00 $9c
.data_0f_4a01:
    mCOUNTER $02                                       ;; 0f:4a01 $f3 $02
.data_0f_4a03:
    mOCTAVE_2                                          ;; 0f:4a03 $e2
    mCOUNTER_2 $07                                     ;; 0f:4a04 $fa $07
.data_0f_4a06:
    mD_10                                              ;; 0f:4a06 $2a
    mRest_14                                           ;; 0f:4a07 $de
    mD_13                                              ;; 0f:4a08 $2d
    mRest_15                                           ;; 0f:4a09 $df
    mD_13                                              ;; 0f:4a0a $2d
    mRest_15                                           ;; 0f:4a0b $df
    mREPEAT_2 .data_0f_4a06                            ;; 0f:4a0c $f9 $06 $4a
    mD_12                                              ;; 0f:4a0f $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4a10 $ec
    mA_12                                              ;; 0f:4a11 $9c
    mAis_12                                            ;; 0f:4a12 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:4a13 $e8
    mC_12                                              ;; 0f:4a14 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4a15 $ec
    mCOUNTER_2 $04                                     ;; 0f:4a16 $fa $04
.data_0f_4a18:
    mAis_10                                            ;; 0f:4a18 $aa
    mRest_14                                           ;; 0f:4a19 $de
    mAis_13                                            ;; 0f:4a1a $ad
    mRest_15                                           ;; 0f:4a1b $df
    mAis_13                                            ;; 0f:4a1c $ad
    mRest_15                                           ;; 0f:4a1d $df
    mREPEAT_2 .data_0f_4a18                            ;; 0f:4a1e $f9 $18 $4a
    mCOUNTER_2 $02                                     ;; 0f:4a21 $fa $02
.data_0f_4a23:
    mA_10                                              ;; 0f:4a23 $9a
    mRest_14                                           ;; 0f:4a24 $de
    mA_13                                              ;; 0f:4a25 $9d
    mRest_15                                           ;; 0f:4a26 $df
    mA_13                                              ;; 0f:4a27 $9d
    mRest_15                                           ;; 0f:4a28 $df
    mREPEAT_2 .data_0f_4a23                            ;; 0f:4a29 $f9 $23 $4a
    mA_12                                              ;; 0f:4a2c $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4a2d $e8
    mD_12                                              ;; 0f:4a2e $2c
    mCis_12                                            ;; 0f:4a2f $1c
    mOCTAVE_MINUS_1                                    ;; 0f:4a30 $ec
    mA_12                                              ;; 0f:4a31 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4a32 $e8
    mG_12                                              ;; 0f:4a33 $7c
    mFis_12                                            ;; 0f:4a34 $6c
    mE_12                                              ;; 0f:4a35 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:4a36 $ec
    mA_12                                              ;; 0f:4a37 $9c
    mREPEAT .data_0f_4a03                              ;; 0f:4a38 $f2 $03 $4a
    mCOUNTER $02                                       ;; 0f:4a3b $f3 $02
.data_0f_4a3d:
    mOCTAVE_PLUS_1                                     ;; 0f:4a3d $e8
    mCOUNTER_2 $02                                     ;; 0f:4a3e $fa $02
.data_0f_4a40:
    mD_10                                              ;; 0f:4a40 $2a
    mRest_14                                           ;; 0f:4a41 $de
    mD_13                                              ;; 0f:4a42 $2d
    mRest_15                                           ;; 0f:4a43 $df
    mD_13                                              ;; 0f:4a44 $2d
    mRest_15                                           ;; 0f:4a45 $df
    mREPEAT_2 .data_0f_4a40                            ;; 0f:4a46 $f9 $40 $4a
    mCOUNTER_2 $02                                     ;; 0f:4a49 $fa $02
.data_0f_4a4b:
    mCis_10                                            ;; 0f:4a4b $1a
    mRest_14                                           ;; 0f:4a4c $de
    mCis_13                                            ;; 0f:4a4d $1d
    mRest_15                                           ;; 0f:4a4e $df
    mCis_13                                            ;; 0f:4a4f $1d
    mRest_15                                           ;; 0f:4a50 $df
    mREPEAT_2 .data_0f_4a4b                            ;; 0f:4a51 $f9 $4b $4a
    mCOUNTER_2 $02                                     ;; 0f:4a54 $fa $02
.data_0f_4a56:
    mC_10                                              ;; 0f:4a56 $0a
    mRest_14                                           ;; 0f:4a57 $de
    mC_13                                              ;; 0f:4a58 $0d
    mRest_15                                           ;; 0f:4a59 $df
    mC_13                                              ;; 0f:4a5a $0d
    mRest_15                                           ;; 0f:4a5b $df
    mREPEAT_2 .data_0f_4a56                            ;; 0f:4a5c $f9 $56 $4a
    mOCTAVE_MINUS_1                                    ;; 0f:4a5f $ec
    mCOUNTER_2 $02                                     ;; 0f:4a60 $fa $02
.data_0f_4a62:
    mB_10                                              ;; 0f:4a62 $ba
    mRest_14                                           ;; 0f:4a63 $de
    mB_13                                              ;; 0f:4a64 $bd
    mRest_15                                           ;; 0f:4a65 $df
    mB_13                                              ;; 0f:4a66 $bd
    mRest_15                                           ;; 0f:4a67 $df
    mREPEAT_2 .data_0f_4a62                            ;; 0f:4a68 $f9 $62 $4a
    mCOUNTER_2 $04                                     ;; 0f:4a6b $fa $04
.data_0f_4a6d:
    mAis_10                                            ;; 0f:4a6d $aa
    mRest_14                                           ;; 0f:4a6e $de
    mAis_13                                            ;; 0f:4a6f $ad
    mRest_15                                           ;; 0f:4a70 $df
    mAis_13                                            ;; 0f:4a71 $ad
    mRest_15                                           ;; 0f:4a72 $df
    mREPEAT_2 .data_0f_4a6d                            ;; 0f:4a73 $f9 $6d $4a
    mCOUNTER_2 $04                                     ;; 0f:4a76 $fa $04
.data_0f_4a78:
    mA_10                                              ;; 0f:4a78 $9a
    mRest_14                                           ;; 0f:4a79 $de
    mA_13                                              ;; 0f:4a7a $9d
    mRest_15                                           ;; 0f:4a7b $df
    mA_13                                              ;; 0f:4a7c $9d
    mRest_15                                           ;; 0f:4a7d $df
    mREPEAT_2 .data_0f_4a78                            ;; 0f:4a7e $f9 $78 $4a
    mREPEAT .data_0f_4a3d                              ;; 0f:4a81 $f2 $3d $4a
    mJUMP .data_0f_4a01                                ;; 0f:4a84 $f1 $01 $4a

song05_channel4:
    mRest_0                                            ;; 0f:4a87 $d0
    mRest_0                                            ;; 0f:4a88 $d0
    mRest_1                                            ;; 0f:4a89 $d1
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:4a8a $f0 $1b $66
.data_0f_4a8d:
    mSTEREOPAN $01                                     ;; 0f:4a8d $f6 $01
    mCOUNTER $0f                                       ;; 0f:4a8f $f3 $0f
.data_0f_4a91:
    mB_9                                               ;; 0f:4a91 $b9
    mB_12                                              ;; 0f:4a92 $bc
    mB_12                                              ;; 0f:4a93 $bc
    mG_14                                              ;; 0f:4a94 $7e
    mF_10                                              ;; 0f:4a95 $5a
    mB_12                                              ;; 0f:4a96 $bc
    mB_12                                              ;; 0f:4a97 $bc
    mREPEAT .data_0f_4a91                              ;; 0f:4a98 $f2 $91 $4a
    mB_9                                               ;; 0f:4a9b $b9
    mB_12                                              ;; 0f:4a9c $bc
    mB_12                                              ;; 0f:4a9d $bc
    mSTEREOPAN $03                                     ;; 0f:4a9e $f6 $03
    mF_9                                               ;; 0f:4aa0 $59
    mF_12                                              ;; 0f:4aa1 $5c
    mF_12                                              ;; 0f:4aa2 $5c
    mCOUNTER $0f                                       ;; 0f:4aa3 $f3 $0f
    mSTEREOPAN $02                                     ;; 0f:4aa5 $f6 $02
.data_0f_4aa7:
    mB_9                                               ;; 0f:4aa7 $b9
    mB_12                                              ;; 0f:4aa8 $bc
    mB_12                                              ;; 0f:4aa9 $bc
    mSTEREOPAN $01                                     ;; 0f:4aaa $f6 $01
    mG_14                                              ;; 0f:4aac $7e
    mF_10                                              ;; 0f:4aad $5a
    mSTEREOPAN $02                                     ;; 0f:4aae $f6 $02
    mB_12                                              ;; 0f:4ab0 $bc
    mB_12                                              ;; 0f:4ab1 $bc
    mREPEAT .data_0f_4aa7                              ;; 0f:4ab2 $f2 $a7 $4a
    mB_9                                               ;; 0f:4ab5 $b9
    mB_12                                              ;; 0f:4ab6 $bc
    mB_12                                              ;; 0f:4ab7 $bc
    mSTEREOPAN $03                                     ;; 0f:4ab8 $f6 $03
    mF_9                                               ;; 0f:4aba $59
    mF_12                                              ;; 0f:4abb $5c
    mF_12                                              ;; 0f:4abc $5c
    mJUMP .data_0f_4a8d                                ;; 0f:4abd $f1 $8d $4a

song02_channel2:
    mINIT2 $40, frequencyDeltaData, data_0f_6625, $80  ;; 0f:4ac0 $fe $40 $63 $66 $25 $66 $80
    mC_3                                               ;; 0f:4ac7 $03
.data_0f_4ac8:
    mOCTAVE_1                                          ;; 0f:4ac8 $e1
    mA_4                                               ;; 0f:4ac9 $94
    mOCTAVE_PLUS_1                                     ;; 0f:4aca $e8
    mC_9                                               ;; 0f:4acb $09
    mOCTAVE_MINUS_1                                    ;; 0f:4acc $ec
    mB_4                                               ;; 0f:4acd $b4
    mG_9                                               ;; 0f:4ace $79
    mA_1                                               ;; 0f:4acf $91
    mOCTAVE_PLUS_1                                     ;; 0f:4ad0 $e8
    mC_4                                               ;; 0f:4ad1 $04
    mD_9                                               ;; 0f:4ad2 $29
    mOCTAVE_MINUS_1                                    ;; 0f:4ad3 $ec
    mB_4                                               ;; 0f:4ad4 $b4
    mG_9                                               ;; 0f:4ad5 $79
    mF_1                                               ;; 0f:4ad6 $51
    mOCTAVE_PLUS_1                                     ;; 0f:4ad7 $e8
    mF_9                                               ;; 0f:4ad8 $59
    mE_6                                               ;; 0f:4ad9 $46
    mC_9                                               ;; 0f:4ada $09
    mOCTAVE_MINUS_1                                    ;; 0f:4adb $ec
    mA_9                                               ;; 0f:4adc $99
    mF_9                                               ;; 0f:4add $59
    mE_9                                               ;; 0f:4ade $49
    mC_9                                               ;; 0f:4adf $09
    mOCTAVE_MINUS_1                                    ;; 0f:4ae0 $ec
    mA_9                                               ;; 0f:4ae1 $99
    mF_9                                               ;; 0f:4ae2 $59
    mE_9                                               ;; 0f:4ae3 $49
    mD_9                                               ;; 0f:4ae4 $29
    mE_2                                               ;; 0f:4ae5 $42
    mOCTAVE_PLUS_1                                     ;; 0f:4ae6 $e8
    mC_2                                               ;; 0f:4ae7 $02
    mWait_6                                            ;; 0f:4ae8 $c6
    mJUMP .data_0f_4ac8                                ;; 0f:4ae9 $f1 $c8 $4a

song02_channel1:
    mINIT1 frequencyDeltaData, data_0f_65e7, $40       ;; 0f:4aec $fe $63 $66 $e7 $65 $40
    mC_3                                               ;; 0f:4af2 $03
.data_0f_4af3:
    mOCTAVE_3                                          ;; 0f:4af3 $e3
    mA_9                                               ;; 0f:4af4 $99
    mE_9                                               ;; 0f:4af5 $49
    mSTEREOPAN $02                                     ;; 0f:4af6 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4af8 $e8
    mA_9                                               ;; 0f:4af9 $99
    mOCTAVE_MINUS_1                                    ;; 0f:4afa $ec
    mE_9                                               ;; 0f:4afb $49
    mSTEREOPAN $03                                     ;; 0f:4afc $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:4afe $e8
    mD_9                                               ;; 0f:4aff $29
    mOCTAVE_MINUS_1                                    ;; 0f:4b00 $ec
    mB_4                                               ;; 0f:4b01 $b4
    mSTEREOPAN $03                                     ;; 0f:4b02 $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:4b04 $e8
    mC_9                                               ;; 0f:4b05 $09
    mOCTAVE_MINUS_1                                    ;; 0f:4b06 $ec
    mE_9                                               ;; 0f:4b07 $49
    mSTEREOPAN $01                                     ;; 0f:4b08 $f6 $01
    mA_9                                               ;; 0f:4b0a $99
    mE_9                                               ;; 0f:4b0b $49
    mSTEREOPAN $03                                     ;; 0f:4b0c $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:4b0e $e8
    mE_9                                               ;; 0f:4b0f $49
    mOCTAVE_MINUS_1                                    ;; 0f:4b10 $ec
    mE_4                                               ;; 0f:4b11 $44
    mSTEREOPAN $03                                     ;; 0f:4b12 $f6 $03
    mA_9                                               ;; 0f:4b14 $99
    mE_9                                               ;; 0f:4b15 $49
    mSTEREOPAN $02                                     ;; 0f:4b16 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4b18 $e8
    mC_9                                               ;; 0f:4b19 $09
    mOCTAVE_MINUS_1                                    ;; 0f:4b1a $ec
    mB_9                                               ;; 0f:4b1b $b9
    mSTEREOPAN $03                                     ;; 0f:4b1c $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:4b1e $e8
    mC_9                                               ;; 0f:4b1f $09
    mOCTAVE_MINUS_1                                    ;; 0f:4b20 $ec
    mE_4                                               ;; 0f:4b21 $44
    mSTEREOPAN $03                                     ;; 0f:4b22 $f6 $03
    mA_9                                               ;; 0f:4b24 $99
    mF_9                                               ;; 0f:4b25 $59
    mSTEREOPAN $01                                     ;; 0f:4b26 $f6 $01
    mD_9                                               ;; 0f:4b28 $29
    mOCTAVE_MINUS_1                                    ;; 0f:4b29 $ec
    mA_9                                               ;; 0f:4b2a $99
    mSTEREOPAN $03                                     ;; 0f:4b2b $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:4b2d $e8
    mF_9                                               ;; 0f:4b2e $59
    mD_4                                               ;; 0f:4b2f $24
    mSTEREOPAN $03                                     ;; 0f:4b30 $f6 $03
    mOCTAVE_2                                          ;; 0f:4b32 $e2
    mA_14                                              ;; 0f:4b33 $9e
    mOCTAVE_PLUS_1                                     ;; 0f:4b34 $e8
    mC_10                                              ;; 0f:4b35 $0a
    mOCTAVE_PLUS_1                                     ;; 0f:4b36 $e8
    mC_3                                               ;; 0f:4b37 $03
    mWait_9                                            ;; 0f:4b38 $c9
    mOCTAVE_MINUS_2                                    ;; 0f:4b39 $ed
    mB_14                                              ;; 0f:4b3a $be
    mOCTAVE_PLUS_1                                     ;; 0f:4b3b $e8
    mD_10                                              ;; 0f:4b3c $2a
    mOCTAVE_PLUS_1                                     ;; 0f:4b3d $e8
    mD_9                                               ;; 0f:4b3e $29
    mOCTAVE_MINUS_2                                    ;; 0f:4b3f $ed
    mA_14                                              ;; 0f:4b40 $9e
    mOCTAVE_PLUS_1                                     ;; 0f:4b41 $e8
    mC_10                                              ;; 0f:4b42 $0a
    mOCTAVE_PLUS_1                                     ;; 0f:4b43 $e8
    mC_9                                               ;; 0f:4b44 $09
    mOCTAVE_MINUS_2                                    ;; 0f:4b45 $ed
    mG_14                                              ;; 0f:4b46 $7e
    mB_10                                              ;; 0f:4b47 $ba
    mOCTAVE_PLUS_1                                     ;; 0f:4b48 $e8
    mB_9                                               ;; 0f:4b49 $b9
    mC_14                                              ;; 0f:4b4a $0e
    mE_10                                              ;; 0f:4b4b $4a
    mG_9                                               ;; 0f:4b4c $79
    mOCTAVE_PLUS_1                                     ;; 0f:4b4d $e8
    mC_9                                               ;; 0f:4b4e $09
    mOCTAVE_MINUS_1                                    ;; 0f:4b4f $ec
    mB_9                                               ;; 0f:4b50 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:4b51 $e8
    mC_9                                               ;; 0f:4b52 $09
    mOCTAVE_MINUS_1                                    ;; 0f:4b53 $ec
    mG_9                                               ;; 0f:4b54 $79
    mOCTAVE_PLUS_1                                     ;; 0f:4b55 $e8
    mC_14                                              ;; 0f:4b56 $0e
    mE_10                                              ;; 0f:4b57 $4a
    mOCTAVE_MINUS_1                                    ;; 0f:4b58 $ec
    mG_9                                               ;; 0f:4b59 $79
    mB_14                                              ;; 0f:4b5a $be
    mOCTAVE_PLUS_1                                     ;; 0f:4b5b $e8
    mC_10                                              ;; 0f:4b5c $0a
    mOCTAVE_MINUS_1                                    ;; 0f:4b5d $ec
    mG_9                                               ;; 0f:4b5e $79
    mOCTAVE_PLUS_1                                     ;; 0f:4b5f $e8
    mC_14                                              ;; 0f:4b60 $0e
    mE_4                                               ;; 0f:4b61 $44
    mWait_10                                           ;; 0f:4b62 $ca
    mJUMP .data_0f_4af3                                ;; 0f:4b63 $f1 $f3 $4a

song02_channel3:
    mINIT3 data_0f_6668, $20, data_0f_66c2             ;; 0f:4b66 $fe $68 $66 $20 $c2 $66
    mC_3                                               ;; 0f:4b6c $03
    mOCTAVE_4                                          ;; 0f:4b6d $e4
    mC_6                                               ;; 0f:4b6e $06
    mOCTAVE_MINUS_1                                    ;; 0f:4b6f $ec
    mA_6                                               ;; 0f:4b70 $96
    mOCTAVE_PLUS_1                                     ;; 0f:4b71 $e8
    mG_6                                               ;; 0f:4b72 $76
    mF_6                                               ;; 0f:4b73 $56
    mE_6                                               ;; 0f:4b74 $46
    mC_2                                               ;; 0f:4b75 $02
    mE_6                                               ;; 0f:4b76 $46
    mOCTAVE_MINUS_1                                    ;; 0f:4b77 $ec
    mA_6                                               ;; 0f:4b78 $96
    mG_6                                               ;; 0f:4b79 $76
    mE_6                                               ;; 0f:4b7a $46
    mA_6                                               ;; 0f:4b7b $96
    mOCTAVE_PLUS_1                                     ;; 0f:4b7c $e8
    mD_2                                               ;; 0f:4b7d $22
    mOCTAVE_MINUS_1                                    ;; 0f:4b7e $ec
    mA_2                                               ;; 0f:4b7f $92
    mG_9                                               ;; 0f:4b80 $79
    mF_9                                               ;; 0f:4b81 $59
    mE_9                                               ;; 0f:4b82 $49
    mC_9                                               ;; 0f:4b83 $09
    mOCTAVE_MINUS_1                                    ;; 0f:4b84 $ec
    mB_9                                               ;; 0f:4b85 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:4b86 $e8
    mC_9                                               ;; 0f:4b87 $09
    mB_2                                               ;; 0f:4b88 $b2
    mOCTAVE_PLUS_1                                     ;; 0f:4b89 $e8
    mC_2                                               ;; 0f:4b8a $02
    mVOLUME $60                                        ;; 0f:4b8b $f0 $60
    mWait_6                                            ;; 0f:4b8d $c6
    mJUMP song02_channel3                              ;; 0f:4b8e $f1 $66 $4b

song02_channel4:
    mEND                                               ;; 0f:4b91 $ff

song06_channel2:
    mINIT2 $57, data_0f_667a, data_0f_6625, $c0        ;; 0f:4b92 $fe $57 $7a $66 $25 $66 $c0
    mC_3                                               ;; 0f:4b99 $03
    mOCTAVE_3                                          ;; 0f:4b9a $e3
    mCOUNTER_2 $10                                     ;; 0f:4b9b $fa $10
.data_0f_4b9d:
    mCOUNTER $02                                       ;; 0f:4b9d $f3 $02
.data_0f_4b9f:
    mE_7                                               ;; 0f:4b9f $47
    mF_9                                               ;; 0f:4ba0 $59
    mE_12                                              ;; 0f:4ba1 $4c
    mD_7                                               ;; 0f:4ba2 $27
    mG_7                                               ;; 0f:4ba3 $77
    mE_12                                              ;; 0f:4ba4 $4c
    mRest_12                                           ;; 0f:4ba5 $dc
    mC_13                                              ;; 0f:4ba6 $0d
    mRest_15                                           ;; 0f:4ba7 $df
    mC_6                                               ;; 0f:4ba8 $06
    mWait_12                                           ;; 0f:4ba9 $cc
    mRest_12                                           ;; 0f:4baa $dc
    mJUMPIF $01, .data_0f_4bbc                         ;; 0f:4bab $fb $01 $bc $4b
    mC_12                                              ;; 0f:4baf $0c
    mD_12                                              ;; 0f:4bb0 $2c
    mE_12                                              ;; 0f:4bb1 $4c
    mF_6                                               ;; 0f:4bb2 $56
    mG_12                                              ;; 0f:4bb3 $7c
    mF_12                                              ;; 0f:4bb4 $5c
    mE_9                                               ;; 0f:4bb5 $49
    mD_9                                               ;; 0f:4bb6 $29
    mC_9                                               ;; 0f:4bb7 $09
    mD_2                                               ;; 0f:4bb8 $22
    mREPEAT .data_0f_4b9f                              ;; 0f:4bb9 $f2 $9f $4b
.data_0f_4bbc:
    mOCTAVE_MINUS_1                                    ;; 0f:4bbc $ec
    mA_12                                              ;; 0f:4bbd $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4bbe $e8
    mC_12                                              ;; 0f:4bbf $0c
    mG_12                                              ;; 0f:4bc0 $7c
    mF_7                                               ;; 0f:4bc1 $57
    mOCTAVE_MINUS_1                                    ;; 0f:4bc2 $ec
    mA_12                                              ;; 0f:4bc3 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4bc4 $e8
    mC_12                                              ;; 0f:4bc5 $0c
    mF_12                                              ;; 0f:4bc6 $5c
    mE_9                                               ;; 0f:4bc7 $49
    mOCTAVE_MINUS_1                                    ;; 0f:4bc8 $ec
    mG_12                                              ;; 0f:4bc9 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:4bca $e8
    mD_7                                               ;; 0f:4bcb $27
    mC_2                                               ;; 0f:4bcc $02
    mCOUNTER $02                                       ;; 0f:4bcd $f3 $02
.data_0f_4bcf:
    mC_7                                               ;; 0f:4bcf $07
    mRest_12                                           ;; 0f:4bd0 $dc
    mC_12                                              ;; 0f:4bd1 $0c
    mD_12                                              ;; 0f:4bd2 $2c
    mDis_7                                             ;; 0f:4bd3 $37
    mRest_12                                           ;; 0f:4bd4 $dc
    mDis_12                                            ;; 0f:4bd5 $3c
    mF_12                                              ;; 0f:4bd6 $5c
    mG_12                                              ;; 0f:4bd7 $7c
    mRest_12                                           ;; 0f:4bd8 $dc
    mC_13                                              ;; 0f:4bd9 $0d
    mRest_15                                           ;; 0f:4bda $df
    mJUMPIF $01, .data_0f_4bfa                         ;; 0f:4bdb $fb $01 $fa $4b
    mC_9                                               ;; 0f:4bdf $09
    mDis_15                                            ;; 0f:4be0 $3f
    mF_15                                              ;; 0f:4be1 $5f
    mG_15                                              ;; 0f:4be2 $7f
    mGis_10                                            ;; 0f:4be3 $8a
    mRest_14                                           ;; 0f:4be4 $de
    mG_10                                              ;; 0f:4be5 $7a
    mRest_14                                           ;; 0f:4be6 $de
    mF_10                                              ;; 0f:4be7 $5a
    mRest_14                                           ;; 0f:4be8 $de
    mDis_6                                             ;; 0f:4be9 $36
    mWait_12                                           ;; 0f:4bea $cc
    mD_14                                              ;; 0f:4beb $2e
    mDis_14                                            ;; 0f:4bec $3e
    mD_7                                               ;; 0f:4bed $27
    mC_9                                               ;; 0f:4bee $09
    mRest_12                                           ;; 0f:4bef $dc
    mC_6                                               ;; 0f:4bf0 $06
    mWait_12                                           ;; 0f:4bf1 $cc
    mOCTAVE_MINUS_1                                    ;; 0f:4bf2 $ec
    mB_13                                              ;; 0f:4bf3 $bd
    mRest_15                                           ;; 0f:4bf4 $df
    mB_4                                               ;; 0f:4bf5 $b4
    mOCTAVE_PLUS_1                                     ;; 0f:4bf6 $e8
    mREPEAT .data_0f_4bcf                              ;; 0f:4bf7 $f2 $cf $4b
.data_0f_4bfa:
    mC_4                                               ;; 0f:4bfa $04
    mG_7                                               ;; 0f:4bfb $77
    mA_7                                               ;; 0f:4bfc $97
    mRest_12                                           ;; 0f:4bfd $dc
    mA_12                                              ;; 0f:4bfe $9c
    mG_12                                              ;; 0f:4bff $7c
    mFis_7                                             ;; 0f:4c00 $67
    mRest_12                                           ;; 0f:4c01 $dc
    mFis_12                                            ;; 0f:4c02 $6c
    mG_13                                              ;; 0f:4c03 $7d
    mRest_15                                           ;; 0f:4c04 $df
    mG_4                                               ;; 0f:4c05 $74
    mOCTAVE_MINUS_1                                    ;; 0f:4c06 $ec
    mB_12                                              ;; 0f:4c07 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4c08 $e8
    mC_12                                              ;; 0f:4c09 $0c
    mD_12                                              ;; 0f:4c0a $2c
    mE_12                                              ;; 0f:4c0b $4c
    mF_12                                              ;; 0f:4c0c $5c
    mG_12                                              ;; 0f:4c0d $7c
    mREPEAT_2 .data_0f_4b9d                            ;; 0f:4c0e $f9 $9d $4b
    mTEMPO $68                                         ;; 0f:4c11 $f7 $68
    mVOLUME_ENVELOPE data_0f_6645                      ;; 0f:4c13 $f0 $45 $66
    mVIBRATO data_0f_6668                              ;; 0f:4c16 $f4 $68 $66
    mOCTAVE_3                                          ;; 0f:4c19 $e3
    mA_10                                              ;; 0f:4c1a $9a
    mRest_10                                           ;; 0f:4c1b $da
    mF_12                                              ;; 0f:4c1c $5c
    mF_3                                               ;; 0f:4c1d $53
    mA_6                                               ;; 0f:4c1e $96
    mB_10                                              ;; 0f:4c1f $ba
    mRest_10                                           ;; 0f:4c20 $da
    mG_12                                              ;; 0f:4c21 $7c
    mG_3                                               ;; 0f:4c22 $73
    mG_6                                               ;; 0f:4c23 $76
    mA_10                                              ;; 0f:4c24 $9a
    mRest_10                                           ;; 0f:4c25 $da
    mF_12                                              ;; 0f:4c26 $5c
    mF_3                                               ;; 0f:4c27 $53
    mA_6                                               ;; 0f:4c28 $96
    mB_10                                              ;; 0f:4c29 $ba
    mRest_10                                           ;; 0f:4c2a $da
    mG_12                                              ;; 0f:4c2b $7c
    mG_3                                               ;; 0f:4c2c $73
    mTEMPO $60                                         ;; 0f:4c2d $f7 $60
    mB_6                                               ;; 0f:4c2f $b6
    mOCTAVE_PLUS_1                                     ;; 0f:4c30 $e8
    mC_3                                               ;; 0f:4c31 $03
    mTEMPO $5b                                         ;; 0f:4c32 $f7 $5b
    mWait_3                                            ;; 0f:4c34 $c3
    mTEMPO $56                                         ;; 0f:4c35 $f7 $56
    mD_3                                               ;; 0f:4c37 $23
    mTEMPO $51                                         ;; 0f:4c38 $f7 $51
    mWait_3                                            ;; 0f:4c3a $c3
    mDUTYCYCLE $80                                     ;; 0f:4c3b $f5 $80
    mTEMPO $4c                                         ;; 0f:4c3d $f7 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:4c3f $ec
    mC_6                                               ;; 0f:4c40 $06
    mG_3                                               ;; 0f:4c41 $73
    mFis_12                                            ;; 0f:4c42 $6c
    mG_12                                              ;; 0f:4c43 $7c
    mA_9                                               ;; 0f:4c44 $99
    mTEMPO $49                                         ;; 0f:4c45 $f7 $49
    mG_6                                               ;; 0f:4c47 $76
    mOCTAVE_PLUS_1                                     ;; 0f:4c48 $e8
    mC_3                                               ;; 0f:4c49 $03
    mOCTAVE_MINUS_1                                    ;; 0f:4c4a $ec
    mB_12                                              ;; 0f:4c4b $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4c4c $e8
    mC_12                                              ;; 0f:4c4d $0c
    mD_9                                               ;; 0f:4c4e $29
    mC_6                                               ;; 0f:4c4f $06
    mTEMPO $47                                         ;; 0f:4c50 $f7 $47
    mWait_6                                            ;; 0f:4c52 $c6
    mTEMPO $46                                         ;; 0f:4c53 $f7 $46
    mWait_6                                            ;; 0f:4c55 $c6
    mTEMPO $44                                         ;; 0f:4c56 $f7 $44
    mWait_6                                            ;; 0f:4c58 $c6
    mVOLUME_ENVELOPE data_0f_65db                      ;; 0f:4c59 $f0 $db $65
    mC_6                                               ;; 0f:4c5c $06
    mOCTAVE_2                                          ;; 0f:4c5d $e2
    mC_12                                              ;; 0f:4c5e $0c
    mC_12                                              ;; 0f:4c5f $0c
    mC_12                                              ;; 0f:4c60 $0c
    mC_12                                              ;; 0f:4c61 $0c
    mC_6                                               ;; 0f:4c62 $06
    mEND                                               ;; 0f:4c63 $ff

song06_channel1:
    mINIT1 data_0f_6671, data_0f_6637, $80             ;; 0f:4c64 $fe $71 $66 $37 $66 $80
    mC_3                                               ;; 0f:4c6a $03
    mCOUNTER_2 $10                                     ;; 0f:4c6b $fa $10
.data_0f_4c6d:
    mCOUNTER $02                                       ;; 0f:4c6d $f3 $02
.data_0f_4c6f:
    mOCTAVE_3                                          ;; 0f:4c6f $e3
    mC_4                                               ;; 0f:4c70 $04
    mOCTAVE_MINUS_1                                    ;; 0f:4c71 $ec
    mB_7                                               ;; 0f:4c72 $b7
    mG_12                                              ;; 0f:4c73 $7c
    mA_12                                              ;; 0f:4c74 $9c
    mB_12                                              ;; 0f:4c75 $bc
    mA_7                                               ;; 0f:4c76 $97
    mG_7                                               ;; 0f:4c77 $77
    mF_7                                               ;; 0f:4c78 $57
    mJUMPIF $01, .data_0f_4c91                         ;; 0f:4c79 $fb $01 $91 $4c
    mE_12                                              ;; 0f:4c7d $4c
    mF_12                                              ;; 0f:4c7e $5c
    mG_12                                              ;; 0f:4c7f $7c
    mF_12                                              ;; 0f:4c80 $5c
    mA_12                                              ;; 0f:4c81 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4c82 $e8
    mC_12                                              ;; 0f:4c83 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4c84 $ec
    mG_12                                              ;; 0f:4c85 $7c
    mB_12                                              ;; 0f:4c86 $bc
    mA_12                                              ;; 0f:4c87 $9c
    mG_7                                               ;; 0f:4c88 $77
    mE_7                                               ;; 0f:4c89 $47
    mG_7                                               ;; 0f:4c8a $77
    mA_7                                               ;; 0f:4c8b $97
    mAis_7                                             ;; 0f:4c8c $a7
    mB_7                                               ;; 0f:4c8d $b7
    mREPEAT .data_0f_4c6f                              ;; 0f:4c8e $f2 $6f $4c
.data_0f_4c91:
    mE_7                                               ;; 0f:4c91 $47
    mF_4                                               ;; 0f:4c92 $54
    mG_9                                               ;; 0f:4c93 $79
    mE_12                                              ;; 0f:4c94 $4c
    mF_7                                               ;; 0f:4c95 $57
    mC_12                                              ;; 0f:4c96 $0c
    mE_12                                              ;; 0f:4c97 $4c
    mG_12                                              ;; 0f:4c98 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:4c99 $e8
    mC_12                                              ;; 0f:4c9a $0c
    mE_12                                              ;; 0f:4c9b $4c
    mG_12                                              ;; 0f:4c9c $7c
    mOCTAVE_PLUS_1                                     ;; 0f:4c9d $e8
    mC_7                                               ;; 0f:4c9e $07
    mOCTAVE_MINUS_2                                    ;; 0f:4c9f $ed
    mD_12                                              ;; 0f:4ca0 $2c
    mF_12                                              ;; 0f:4ca1 $5c
    mAis_12                                            ;; 0f:4ca2 $ac
    mCOUNTER $02                                       ;; 0f:4ca3 $f3 $02
.data_0f_4ca5:
    mGis_6                                             ;; 0f:4ca5 $86
    mG_12                                              ;; 0f:4ca6 $7c
    mAis_12                                            ;; 0f:4ca7 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:4ca8 $e8
    mC_6                                               ;; 0f:4ca9 $06
    mC_12                                              ;; 0f:4caa $0c
    mD_12                                              ;; 0f:4cab $2c
    mDis_7                                             ;; 0f:4cac $37
    mOCTAVE_MINUS_1                                    ;; 0f:4cad $ec
    mG_4                                               ;; 0f:4cae $74
    mJUMPIF $01, .data_0f_4cbf                         ;; 0f:4caf $fb $01 $bf $4c
    mGis_7                                             ;; 0f:4cb3 $87
    mA_4                                               ;; 0f:4cb4 $94
    mFis_7                                             ;; 0f:4cb5 $67
    mA_7                                               ;; 0f:4cb6 $97
    mG_7                                               ;; 0f:4cb7 $77
    mFis_12                                            ;; 0f:4cb8 $6c
    mG_12                                              ;; 0f:4cb9 $7c
    mA_12                                              ;; 0f:4cba $9c
    mG_4                                               ;; 0f:4cbb $74
    mREPEAT .data_0f_4ca5                              ;; 0f:4cbc $f2 $a5 $4c
.data_0f_4cbf:
    mDis_7                                             ;; 0f:4cbf $37
    mD_12                                              ;; 0f:4cc0 $2c
    mFis_12                                            ;; 0f:4cc1 $6c
    mA_12                                              ;; 0f:4cc2 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4cc3 $e8
    mC_7                                               ;; 0f:4cc4 $07
    mOCTAVE_MINUS_1                                    ;; 0f:4cc5 $ec
    mFis_12                                            ;; 0f:4cc6 $6c
    mA_12                                              ;; 0f:4cc7 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4cc8 $e8
    mC_12                                              ;; 0f:4cc9 $0c
    mD_7                                               ;; 0f:4cca $27
    mC_6                                               ;; 0f:4ccb $06
    mD_12                                              ;; 0f:4ccc $2c
    mC_12                                              ;; 0f:4ccd $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4cce $ec
    mG_12                                              ;; 0f:4ccf $7c
    mA_12                                              ;; 0f:4cd0 $9c
    mB_12                                              ;; 0f:4cd1 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4cd2 $e8
    mC_12                                              ;; 0f:4cd3 $0c
    mD_9                                               ;; 0f:4cd4 $29
    mREPEAT_2 .data_0f_4c6d                            ;; 0f:4cd5 $f9 $6d $4c
    mVOLUME_ENVELOPE data_0f_664b                      ;; 0f:4cd8 $f0 $4b $66
    mOCTAVE_3                                          ;; 0f:4cdb $e3
    mCOUNTER_2 $02                                     ;; 0f:4cdc $fa $02
.data_0f_4cde:
    mOCTAVE_3                                          ;; 0f:4cde $e3
    mF_10                                              ;; 0f:4cdf $5a
    mRest_10                                           ;; 0f:4ce0 $da
    mC_12                                              ;; 0f:4ce1 $0c
    mC_3                                               ;; 0f:4ce2 $03
    mF_6                                               ;; 0f:4ce3 $56
    mG_10                                              ;; 0f:4ce4 $7a
    mRest_10                                           ;; 0f:4ce5 $da
    mD_12                                              ;; 0f:4ce6 $2c
    mD_12                                              ;; 0f:4ce7 $2c
    mD_12                                              ;; 0f:4ce8 $2c
    mCis_12                                            ;; 0f:4ce9 $1c
    mD_12                                              ;; 0f:4cea $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4ceb $ec
    mB_12                                              ;; 0f:4cec $bc
    mB_12                                              ;; 0f:4ced $bc
    mAis_12                                            ;; 0f:4cee $ac
    mB_12                                              ;; 0f:4cef $bc
    mG_12                                              ;; 0f:4cf0 $7c
    mA_12                                              ;; 0f:4cf1 $9c
    mB_12                                              ;; 0f:4cf2 $bc
    mG_12                                              ;; 0f:4cf3 $7c
    mREPEAT_2 .data_0f_4cde                            ;; 0f:4cf4 $f9 $de $4c
    mVOLUME_ENVELOPE data_0f_6631                      ;; 0f:4cf7 $f0 $31 $66
    mDUTYCYCLE $80                                     ;; 0f:4cfa $f5 $80
    mGis_3                                             ;; 0f:4cfc $83
    mGis_9                                             ;; 0f:4cfd $89
    mAis_9                                             ;; 0f:4cfe $a9
    mOCTAVE_PLUS_1                                     ;; 0f:4cff $e8
    mC_9                                               ;; 0f:4d00 $09
    mDis_9                                             ;; 0f:4d01 $39
    mD_6                                               ;; 0f:4d02 $26
    mOCTAVE_MINUS_1                                    ;; 0f:4d03 $ec
    mAis_6                                             ;; 0f:4d04 $a6
    mF_6                                               ;; 0f:4d05 $56
    mD_6                                               ;; 0f:4d06 $26
    mVOLUME_ENVELOPE data_0f_65ff                      ;; 0f:4d07 $f0 $ff $65
    mRest_12                                           ;; 0f:4d0a $dc
    mOCTAVE_PLUS_1                                     ;; 0f:4d0b $e8
    mC_6                                               ;; 0f:4d0c $06
    mG_3                                               ;; 0f:4d0d $73
    mFis_12                                            ;; 0f:4d0e $6c
    mG_12                                              ;; 0f:4d0f $7c
    mA_12                                              ;; 0f:4d10 $9c
    mVOLUME_ENVELOPE data_0f_664b                      ;; 0f:4d11 $f0 $4b $66
    mC_6                                               ;; 0f:4d14 $06
    mG_3                                               ;; 0f:4d15 $73
    mG_6                                               ;; 0f:4d16 $76
    mE_1                                               ;; 0f:4d17 $41
    mVOLUME_ENVELOPE data_0f_65e7                      ;; 0f:4d18 $f0 $e7 $65
    mE_6                                               ;; 0f:4d1b $46
    mOCTAVE_3                                          ;; 0f:4d1c $e3
    mC_12                                              ;; 0f:4d1d $0c
    mC_12                                              ;; 0f:4d1e $0c
    mC_12                                              ;; 0f:4d1f $0c
    mC_12                                              ;; 0f:4d20 $0c
    mC_6                                               ;; 0f:4d21 $06
    mEND                                               ;; 0f:4d22 $ff

song06_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:4d23 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:4d29 $03
    mCOUNTER_2 $10                                     ;; 0f:4d2a $fa $10
.data_0f_4d2c:
    mCOUNTER $02                                       ;; 0f:4d2c $f3 $02
.data_0f_4d2e:
    mOCTAVE_2                                          ;; 0f:4d2e $e2
    mC_9                                               ;; 0f:4d2f $09
    mRest_12                                           ;; 0f:4d30 $dc
    mC_12                                              ;; 0f:4d31 $0c
    mSTEREOPAN $02                                     ;; 0f:4d32 $f6 $02
    mE_12                                              ;; 0f:4d34 $4c
    mG_12                                              ;; 0f:4d35 $7c
    mSTEREOPAN $03                                     ;; 0f:4d36 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:4d38 $ec
    mB_9                                               ;; 0f:4d39 $b9
    mRest_12                                           ;; 0f:4d3a $dc
    mB_12                                              ;; 0f:4d3b $bc
    mSTEREOPAN $01                                     ;; 0f:4d3c $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:4d3e $e8
    mD_12                                              ;; 0f:4d3f $2c
    mG_12                                              ;; 0f:4d40 $7c
    mSTEREOPAN $03                                     ;; 0f:4d41 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:4d43 $ec
    mA_9                                               ;; 0f:4d44 $99
    mRest_12                                           ;; 0f:4d45 $dc
    mA_9                                               ;; 0f:4d46 $99
    mRest_12                                           ;; 0f:4d47 $dc
    mG_9                                               ;; 0f:4d48 $79
    mRest_12                                           ;; 0f:4d49 $dc
    mG_9                                               ;; 0f:4d4a $79
    mRest_12                                           ;; 0f:4d4b $dc
    mF_9                                               ;; 0f:4d4c $59
    mRest_12                                           ;; 0f:4d4d $dc
    mF_12                                              ;; 0f:4d4e $5c
    mSTEREOPAN $02                                     ;; 0f:4d4f $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4d51 $e8
    mC_12                                              ;; 0f:4d52 $0c
    mF_12                                              ;; 0f:4d53 $5c
    mSTEREOPAN $03                                     ;; 0f:4d54 $f6 $03
    mJUMPIF $01, .data_0f_4d6b                         ;; 0f:4d56 $fb $01 $6b $4d
    mC_9                                               ;; 0f:4d5a $09
    mRest_12                                           ;; 0f:4d5b $dc
    mC_12                                              ;; 0f:4d5c $0c
    mSTEREOPAN $01                                     ;; 0f:4d5d $f6 $01
    mE_12                                              ;; 0f:4d5f $4c
    mG_12                                              ;; 0f:4d60 $7c
    mSTEREOPAN $03                                     ;; 0f:4d61 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:4d63 $ec
    mG_7                                               ;; 0f:4d64 $77
    mA_7                                               ;; 0f:4d65 $97
    mAis_7                                             ;; 0f:4d66 $a7
    mB_7                                               ;; 0f:4d67 $b7
    mREPEAT .data_0f_4d2e                              ;; 0f:4d68 $f2 $2e $4d
.data_0f_4d6b:
    mOCTAVE_MINUS_1                                    ;; 0f:4d6b $ec
    mG_9                                               ;; 0f:4d6c $79
    mRest_12                                           ;; 0f:4d6d $dc
    mG_12                                              ;; 0f:4d6e $7c
    mSTEREOPAN $01                                     ;; 0f:4d6f $f6 $01
    mB_12                                              ;; 0f:4d71 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4d72 $e8
    mD_12                                              ;; 0f:4d73 $2c
    mSTEREOPAN $03                                     ;; 0f:4d74 $f6 $03
    mC_7                                               ;; 0f:4d76 $07
    mOCTAVE_MINUS_1                                    ;; 0f:4d77 $ec
    mG_7                                               ;; 0f:4d78 $77
    mC_6                                               ;; 0f:4d79 $06
    mRest_9                                            ;; 0f:4d7a $d9
    mCOUNTER $02                                       ;; 0f:4d7b $f3 $02
.data_0f_4d7d:
    mGis_9                                             ;; 0f:4d7d $89
    mRest_12                                           ;; 0f:4d7e $dc
    mGis_12                                            ;; 0f:4d7f $8c
    mSTEREOPAN $02                                     ;; 0f:4d80 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4d82 $e8
    mC_12                                              ;; 0f:4d83 $0c
    mDis_12                                            ;; 0f:4d84 $3c
    mOCTAVE_MINUS_1                                    ;; 0f:4d85 $ec
    mSTEREOPAN $03                                     ;; 0f:4d86 $f6 $03
    mGis_9                                             ;; 0f:4d88 $89
    mRest_12                                           ;; 0f:4d89 $dc
    mGis_9                                             ;; 0f:4d8a $89
    mRest_12                                           ;; 0f:4d8b $dc
    mG_9                                               ;; 0f:4d8c $79
    mRest_12                                           ;; 0f:4d8d $dc
    mG_12                                              ;; 0f:4d8e $7c
    mSTEREOPAN $01                                     ;; 0f:4d8f $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:4d91 $e8
    mC_12                                              ;; 0f:4d92 $0c
    mDis_12                                            ;; 0f:4d93 $3c
    mOCTAVE_MINUS_1                                    ;; 0f:4d94 $ec
    mSTEREOPAN $03                                     ;; 0f:4d95 $f6 $03
    mG_9                                               ;; 0f:4d97 $79
    mRest_12                                           ;; 0f:4d98 $dc
    mG_9                                               ;; 0f:4d99 $79
    mRest_12                                           ;; 0f:4d9a $dc
    mFis_9                                             ;; 0f:4d9b $69
    mRest_12                                           ;; 0f:4d9c $dc
    mFis_12                                            ;; 0f:4d9d $6c
    mSTEREOPAN $02                                     ;; 0f:4d9e $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4da0 $e8
    mC_12                                              ;; 0f:4da1 $0c
    mD_12                                              ;; 0f:4da2 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4da3 $ec
    mSTEREOPAN $03                                     ;; 0f:4da4 $f6 $03
    mFis_9                                             ;; 0f:4da6 $69
    mRest_12                                           ;; 0f:4da7 $dc
    mFis_9                                             ;; 0f:4da8 $69
    mRest_12                                           ;; 0f:4da9 $dc
    mJUMPIF $01, .data_0f_4dbe                         ;; 0f:4daa $fb $01 $be $4d
    mG_9                                               ;; 0f:4dae $79
    mRest_12                                           ;; 0f:4daf $dc
    mG_12                                              ;; 0f:4db0 $7c
    mSTEREOPAN $01                                     ;; 0f:4db1 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:4db3 $e8
    mC_12                                              ;; 0f:4db4 $0c
    mD_12                                              ;; 0f:4db5 $2c
    mSTEREOPAN $03                                     ;; 0f:4db6 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:4db8 $ec
    mG_7                                               ;; 0f:4db9 $77
    mB_7                                               ;; 0f:4dba $b7
    mREPEAT .data_0f_4d7d                              ;; 0f:4dbb $f2 $7d $4d
.data_0f_4dbe:
    mG_7                                               ;; 0f:4dbe $77
    mA_7                                               ;; 0f:4dbf $97
    mB_7                                               ;; 0f:4dc0 $b7
    mG_7                                               ;; 0f:4dc1 $77
    mREPEAT_2 .data_0f_4d2c                            ;; 0f:4dc2 $f9 $2c $4d
    mOCTAVE_1                                          ;; 0f:4dc5 $e1
    mCOUNTER_2 $02                                     ;; 0f:4dc6 $fa $02
.data_0f_4dc8:
    mF_10                                              ;; 0f:4dc8 $5a
    mRest_10                                           ;; 0f:4dc9 $da
    mRest_7                                            ;; 0f:4dca $d7
    mC_9                                               ;; 0f:4dcb $09
    mF_9                                               ;; 0f:4dcc $59
    mC_9                                               ;; 0f:4dcd $09
    mF_9                                               ;; 0f:4dce $59
    mC_9                                               ;; 0f:4dcf $09
    mG_10                                              ;; 0f:4dd0 $7a
    mRest_10                                           ;; 0f:4dd1 $da
    mRest_7                                            ;; 0f:4dd2 $d7
    mD_9                                               ;; 0f:4dd3 $29
    mG_9                                               ;; 0f:4dd4 $79
    mD_9                                               ;; 0f:4dd5 $29
    mG_9                                               ;; 0f:4dd6 $79
    mD_9                                               ;; 0f:4dd7 $29
    mREPEAT_2 .data_0f_4dc8                            ;; 0f:4dd8 $f9 $c8 $4d
    mCOUNTER_2 $04                                     ;; 0f:4ddb $fa $04
.data_0f_4ddd:
    mGis_10                                            ;; 0f:4ddd $8a
    mRest_14                                           ;; 0f:4dde $de
    mDis_10                                            ;; 0f:4ddf $3a
    mRest_14                                           ;; 0f:4de0 $de
    mREPEAT_2 .data_0f_4ddd                            ;; 0f:4de1 $f9 $dd $4d
    mCOUNTER_2 $04                                     ;; 0f:4de4 $fa $04
.data_0f_4de6:
    mAis_10                                            ;; 0f:4de6 $aa
    mRest_14                                           ;; 0f:4de7 $de
    mF_10                                              ;; 0f:4de8 $5a
    mRest_14                                           ;; 0f:4de9 $de
    mREPEAT_2 .data_0f_4de6                            ;; 0f:4dea $f9 $e6 $4d
    mOCTAVE_PLUS_1                                     ;; 0f:4ded $e8
    mC_3                                               ;; 0f:4dee $03
    mOCTAVE_MINUS_1                                    ;; 0f:4def $ec
    mB_3                                               ;; 0f:4df0 $b3
    mAis_3                                             ;; 0f:4df1 $a3
    mA_6                                               ;; 0f:4df2 $96
    mB_6                                               ;; 0f:4df3 $b6
    mCOUNTER_2 $04                                     ;; 0f:4df4 $fa $04
.data_0f_4df6:
    mOCTAVE_PLUS_1                                     ;; 0f:4df6 $e8
    mC_12                                              ;; 0f:4df7 $0c
    mRest_12                                           ;; 0f:4df8 $dc
    mOCTAVE_MINUS_1                                    ;; 0f:4df9 $ec
    mG_12                                              ;; 0f:4dfa $7c
    mRest_12                                           ;; 0f:4dfb $dc
    mREPEAT_2 .data_0f_4df6                            ;; 0f:4dfc $f9 $f6 $4d
    mOCTAVE_PLUS_1                                     ;; 0f:4dff $e8
    mC_9                                               ;; 0f:4e00 $09
    mOCTAVE_MINUS_1                                    ;; 0f:4e01 $ec
    mRest_9                                            ;; 0f:4e02 $d9
    mC_14                                              ;; 0f:4e03 $0e
    mRest_14                                           ;; 0f:4e04 $de
    mC_14                                              ;; 0f:4e05 $0e
    mRest_14                                           ;; 0f:4e06 $de
    mC_14                                              ;; 0f:4e07 $0e
    mRest_14                                           ;; 0f:4e08 $de
    mC_14                                              ;; 0f:4e09 $0e
    mRest_14                                           ;; 0f:4e0a $de
    mC_9                                               ;; 0f:4e0b $09
    mVOLUME $60                                        ;; 0f:4e0c $f0 $60
    mWait_9                                            ;; 0f:4e0e $c9
    mEND                                               ;; 0f:4e0f $ff

song06_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:4e10 $f0 $1b $66
    mCOUNTER_2 $20                                     ;; 0f:4e13 $fa $20
.data_0f_4e15:
    mCOUNTER $0f                                       ;; 0f:4e15 $f3 $0f
.data_0f_4e17:
    mSTEREOPAN $02                                     ;; 0f:4e17 $f6 $02
    mF_7                                               ;; 0f:4e19 $57
    mJUMPIF $08, .data_0f_4e36                         ;; 0f:4e1a $fb $08 $36 $4e
    mSTEREOPAN $01                                     ;; 0f:4e1e $f6 $01
.data_0f_4e20:
    mG_12                                              ;; 0f:4e20 $7c
    mG_12                                              ;; 0f:4e21 $7c
    mG_12                                              ;; 0f:4e22 $7c
    mREPEAT .data_0f_4e17                              ;; 0f:4e23 $f2 $17 $4e
    mSTEREOPAN $02                                     ;; 0f:4e26 $f6 $02
    mG_12                                              ;; 0f:4e28 $7c
    mG_12                                              ;; 0f:4e29 $7c
    mG_12                                              ;; 0f:4e2a $7c
    mSTEREOPAN $03                                     ;; 0f:4e2b $f6 $03
    mG_12                                              ;; 0f:4e2d $7c
    mG_12                                              ;; 0f:4e2e $7c
    mG_12                                              ;; 0f:4e2f $7c
    mREPEAT_2 .data_0f_4e15                            ;; 0f:4e30 $f9 $15 $4e
    mJUMP .data_0f_4e3b                                ;; 0f:4e33 $f1 $3b $4e
.data_0f_4e36:
    mSTEREOPAN $03                                     ;; 0f:4e36 $f6 $03
    mJUMP .data_0f_4e20                                ;; 0f:4e38 $f1 $20 $4e
.data_0f_4e3b:
    mSTEREOPAN $02                                     ;; 0f:4e3b $f6 $02
    mCOUNTER_2 $04                                     ;; 0f:4e3d $fa $04
.data_0f_4e3f:
    mG_4                                               ;; 0f:4e3f $74
    mSTEREOPAN $01                                     ;; 0f:4e40 $f6 $01
    mG_13                                              ;; 0f:4e42 $7d
    mG_13                                              ;; 0f:4e43 $7d
    mG_13                                              ;; 0f:4e44 $7d
    mG_9                                               ;; 0f:4e45 $79
    mSTEREOPAN $02                                     ;; 0f:4e46 $f6 $02
    mG_13                                              ;; 0f:4e48 $7d
    mG_13                                              ;; 0f:4e49 $7d
    mG_13                                              ;; 0f:4e4a $7d
    mG_6                                               ;; 0f:4e4b $76
    mREPEAT_2 .data_0f_4e3f                            ;; 0f:4e4c $f9 $3f $4e
    mCOUNTER_2 $08                                     ;; 0f:4e4f $fa $08
.data_0f_4e51:
    mSTEREOPAN $02                                     ;; 0f:4e51 $f6 $02
    mF_9                                               ;; 0f:4e53 $59
    mSTEREOPAN $01                                     ;; 0f:4e54 $f6 $01
    mA_9                                               ;; 0f:4e56 $99
    mREPEAT_2 .data_0f_4e51                            ;; 0f:4e57 $f9 $51 $4e
    mEND                                               ;; 0f:4e5a $ff

song08_channel2:
    mINIT2 $5d, frequencyDeltaData, data_0f_6651, $c0  ;; 0f:4e5b $fe $5d $63 $66 $51 $66 $c0
    mC_3                                               ;; 0f:4e62 $03
    mOCTAVE_2                                          ;; 0f:4e63 $e2
    mD_12                                              ;; 0f:4e64 $2c
    mRest_12                                           ;; 0f:4e65 $dc
    mD_12                                              ;; 0f:4e66 $2c
    mA_7                                               ;; 0f:4e67 $97
    mD_12                                              ;; 0f:4e68 $2c
    mRest_12                                           ;; 0f:4e69 $dc
    mD_12                                              ;; 0f:4e6a $2c
    mOCTAVE_PLUS_1                                     ;; 0f:4e6b $e8
    mC_7                                               ;; 0f:4e6c $07
    mOCTAVE_MINUS_1                                    ;; 0f:4e6d $ec
    mB_12                                              ;; 0f:4e6e $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4e6f $e8
    mC_12                                              ;; 0f:4e70 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4e71 $ec
    mB_12                                              ;; 0f:4e72 $bc
    mA_12                                              ;; 0f:4e73 $9c
    mSTEREOPAN $02                                     ;; 0f:4e74 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4e76 $e8
    mE_14                                              ;; 0f:4e77 $4e
    mF_14                                              ;; 0f:4e78 $5e
    mG_14                                              ;; 0f:4e79 $7e
    mA_14                                              ;; 0f:4e7a $9e
    mOCTAVE_PLUS_1                                     ;; 0f:4e7b $e8
    mSTEREOPAN $01                                     ;; 0f:4e7c $f6 $01
    mC_12                                              ;; 0f:4e7e $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4e7f $ec
    mB_14                                              ;; 0f:4e80 $be
    mA_14                                              ;; 0f:4e81 $9e
    mD_12                                              ;; 0f:4e82 $2c
    mSTEREOPAN $02                                     ;; 0f:4e83 $f6 $02
    mG_12                                              ;; 0f:4e85 $7c
    mF_14                                              ;; 0f:4e86 $5e
    mG_14                                              ;; 0f:4e87 $7e
    mA_12                                              ;; 0f:4e88 $9c
    mSTEREOPAN $03                                     ;; 0f:4e89 $f6 $03
.data_0f_4e8b:
    mOCTAVE_2                                          ;; 0f:4e8b $e2
    mF_7                                               ;; 0f:4e8c $57
    mE_12                                              ;; 0f:4e8d $4c
    mF_12                                              ;; 0f:4e8e $5c
    mE_12                                              ;; 0f:4e8f $4c
    mD_7                                               ;; 0f:4e90 $27
    mC_7                                               ;; 0f:4e91 $07
    mD_12                                              ;; 0f:4e92 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4e93 $ec
    mRest_12                                           ;; 0f:4e94 $dc
    mA_12                                              ;; 0f:4e95 $9c
    mA_4                                               ;; 0f:4e96 $94
    mOCTAVE_PLUS_1                                     ;; 0f:4e97 $e8
    mC_14                                              ;; 0f:4e98 $0e
    mD_14                                              ;; 0f:4e99 $2e
    mE_14                                              ;; 0f:4e9a $4e
    mF_14                                              ;; 0f:4e9b $5e
    mG_12                                              ;; 0f:4e9c $7c
    mF_7                                               ;; 0f:4e9d $57
    mF_12                                              ;; 0f:4e9e $5c
    mE_12                                              ;; 0f:4e9f $4c
    mD_12                                              ;; 0f:4ea0 $2c
    mG_7                                               ;; 0f:4ea1 $77
    mG_12                                              ;; 0f:4ea2 $7c
    mF_12                                              ;; 0f:4ea3 $5c
    mE_12                                              ;; 0f:4ea4 $4c
    mD_7                                               ;; 0f:4ea5 $27
    mSTEREOPAN $01                                     ;; 0f:4ea6 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:4ea8 $e8
    mF_12                                              ;; 0f:4ea9 $5c
    mG_14                                              ;; 0f:4eaa $7e
    mA_14                                              ;; 0f:4eab $9e
    mB_12                                              ;; 0f:4eac $bc
    mSTEREOPAN $02                                     ;; 0f:4ead $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:4eaf $e8
    mC_12                                              ;; 0f:4eb0 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4eb1 $ec
    mB_14                                              ;; 0f:4eb2 $be
    mA_14                                              ;; 0f:4eb3 $9e
    mG_12                                              ;; 0f:4eb4 $7c
    mSTEREOPAN $01                                     ;; 0f:4eb5 $f6 $01
    mF_12                                              ;; 0f:4eb7 $5c
    mE_14                                              ;; 0f:4eb8 $4e
    mD_14                                              ;; 0f:4eb9 $2e
    mC_12                                              ;; 0f:4eba $0c
    mSTEREOPAN $03                                     ;; 0f:4ebb $f6 $03
    mD_7                                               ;; 0f:4ebd $27
    mC_12                                              ;; 0f:4ebe $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4ebf $ec
    mB_12                                              ;; 0f:4ec0 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4ec1 $e8
    mC_12                                              ;; 0f:4ec2 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4ec3 $ec
    mA_7                                               ;; 0f:4ec4 $97
    mG_12                                              ;; 0f:4ec5 $7c
    mA_12                                              ;; 0f:4ec6 $9c
    mB_12                                              ;; 0f:4ec7 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4ec8 $e8
    mC_6                                               ;; 0f:4ec9 $06
    mWait_12                                           ;; 0f:4eca $cc
    mOCTAVE_MINUS_1                                    ;; 0f:4ecb $ec
    mB_12                                              ;; 0f:4ecc $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4ecd $e8
    mC_12                                              ;; 0f:4ece $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4ecf $ec
    mF_12                                              ;; 0f:4ed0 $5c
    mG_12                                              ;; 0f:4ed1 $7c
    mA_12                                              ;; 0f:4ed2 $9c
    mAis_12                                            ;; 0f:4ed3 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:4ed4 $e8
    mC_12                                              ;; 0f:4ed5 $0c
    mD_7                                               ;; 0f:4ed6 $27
    mF_12                                              ;; 0f:4ed7 $5c
    mE_12                                              ;; 0f:4ed8 $4c
    mD_12                                              ;; 0f:4ed9 $2c
    mE_7                                               ;; 0f:4eda $47
    mG_12                                              ;; 0f:4edb $7c
    mE_12                                              ;; 0f:4edc $4c
    mC_12                                              ;; 0f:4edd $0c
    mD_2                                               ;; 0f:4ede $22
    mOCTAVE_MINUS_1                                    ;; 0f:4edf $ec
    mF_12                                              ;; 0f:4ee0 $5c
    mE_12                                              ;; 0f:4ee1 $4c
    mD_12                                              ;; 0f:4ee2 $2c
    mE_12                                              ;; 0f:4ee3 $4c
    mF_12                                              ;; 0f:4ee4 $5c
    mD_12                                              ;; 0f:4ee5 $2c
    mA_7                                               ;; 0f:4ee6 $97
    mG_12                                              ;; 0f:4ee7 $7c
    mF_12                                              ;; 0f:4ee8 $5c
    mE_12                                              ;; 0f:4ee9 $4c
    mE_12                                              ;; 0f:4eea $4c
    mF_12                                              ;; 0f:4eeb $5c
    mG_12                                              ;; 0f:4eec $7c
    mC_3                                               ;; 0f:4eed $03
    mWait_12                                           ;; 0f:4eee $cc
    mA_7                                               ;; 0f:4eef $97
    mOCTAVE_PLUS_1                                     ;; 0f:4ef0 $e8
    mC_12                                              ;; 0f:4ef1 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4ef2 $ec
    mD_12                                              ;; 0f:4ef3 $2c
    mAis_12                                            ;; 0f:4ef4 $ac
    mA_12                                              ;; 0f:4ef5 $9c
    mG_12                                              ;; 0f:4ef6 $7c
    mF_12                                              ;; 0f:4ef7 $5c
    mE_12                                              ;; 0f:4ef8 $4c
    mD_12                                              ;; 0f:4ef9 $2c
    mG_12                                              ;; 0f:4efa $7c
    mE_2                                               ;; 0f:4efb $42
    mF_12                                              ;; 0f:4efc $5c
    mE_12                                              ;; 0f:4efd $4c
    mD_12                                              ;; 0f:4efe $2c
    mE_12                                              ;; 0f:4eff $4c
    mF_12                                              ;; 0f:4f00 $5c
    mG_12                                              ;; 0f:4f01 $7c
    mA_12                                              ;; 0f:4f02 $9c
    mF_12                                              ;; 0f:4f03 $5c
    mD_12                                              ;; 0f:4f04 $2c
    mE_12                                              ;; 0f:4f05 $4c
    mD_12                                              ;; 0f:4f06 $2c
    mC_12                                              ;; 0f:4f07 $0c
    mAis_12                                            ;; 0f:4f08 $ac
    mA_12                                              ;; 0f:4f09 $9c
    mG_12                                              ;; 0f:4f0a $7c
    mF_12                                              ;; 0f:4f0b $5c
    mE_12                                              ;; 0f:4f0c $4c
    mD_12                                              ;; 0f:4f0d $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4f0e $ec
    mAis_12                                            ;; 0f:4f0f $ac
    mOCTAVE_PLUS_1                                     ;; 0f:4f10 $e8
    mD_12                                              ;; 0f:4f11 $2c
    mA_12                                              ;; 0f:4f12 $9c
    mG_12                                              ;; 0f:4f13 $7c
    mF_12                                              ;; 0f:4f14 $5c
    mE_12                                              ;; 0f:4f15 $4c
    mJUMP .data_0f_4e8b                                ;; 0f:4f16 $f1 $8b $4e

song08_channel1:
    mINIT1 frequencyDeltaData, data_0f_6657, $40       ;; 0f:4f19 $fe $63 $66 $57 $66 $40
    mC_3                                               ;; 0f:4f1f $03
    mOCTAVE_1                                          ;; 0f:4f20 $e1
    mA_12                                              ;; 0f:4f21 $9c
    mRest_12                                           ;; 0f:4f22 $dc
    mA_12                                              ;; 0f:4f23 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4f24 $e8
    mD_7                                               ;; 0f:4f25 $27
    mOCTAVE_MINUS_1                                    ;; 0f:4f26 $ec
    mA_12                                              ;; 0f:4f27 $9c
    mRest_12                                           ;; 0f:4f28 $dc
    mA_12                                              ;; 0f:4f29 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4f2a $e8
    mF_7                                               ;; 0f:4f2b $57
    mE_12                                              ;; 0f:4f2c $4c
    mF_12                                              ;; 0f:4f2d $5c
    mE_12                                              ;; 0f:4f2e $4c
    mD_12                                              ;; 0f:4f2f $2c
    mOCTAVE_PLUS_1                                     ;; 0f:4f30 $e8
    mC_14                                              ;; 0f:4f31 $0e
    mD_14                                              ;; 0f:4f32 $2e
    mE_14                                              ;; 0f:4f33 $4e
    mF_14                                              ;; 0f:4f34 $5e
    mA_12                                              ;; 0f:4f35 $9c
    mG_14                                              ;; 0f:4f36 $7e
    mF_14                                              ;; 0f:4f37 $5e
    mOCTAVE_MINUS_1                                    ;; 0f:4f38 $ec
    mA_12                                              ;; 0f:4f39 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4f3a $e8
    mE_12                                              ;; 0f:4f3b $4c
    mD_14                                              ;; 0f:4f3c $2e
    mE_14                                              ;; 0f:4f3d $4e
    mF_12                                              ;; 0f:4f3e $5c
.data_0f_4f3f:
    mOCTAVE_2                                          ;; 0f:4f3f $e2
    mA_7                                               ;; 0f:4f40 $97
    mG_12                                              ;; 0f:4f41 $7c
    mA_12                                              ;; 0f:4f42 $9c
    mG_12                                              ;; 0f:4f43 $7c
    mF_7                                               ;; 0f:4f44 $57
    mE_7                                               ;; 0f:4f45 $47
    mOCTAVE_MINUS_1                                    ;; 0f:4f46 $ec
    mA_9                                               ;; 0f:4f47 $99
    mD_12                                              ;; 0f:4f48 $2c
    mD_9                                               ;; 0f:4f49 $29
    mSTEREOPAN $02                                     ;; 0f:4f4a $f6 $02
    mOCTAVE_PLUS_2                                     ;; 0f:4f4c $e9
    mF_12                                              ;; 0f:4f4d $5c
    mD_12                                              ;; 0f:4f4e $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4f4f $ec
    mA_12                                              ;; 0f:4f50 $9c
    mF_12                                              ;; 0f:4f51 $5c
    mD_14                                              ;; 0f:4f52 $2e
    mD_14                                              ;; 0f:4f53 $2e
    mE_14                                              ;; 0f:4f54 $4e
    mF_14                                              ;; 0f:4f55 $5e
    mG_12                                              ;; 0f:4f56 $7c
    mSTEREOPAN $03                                     ;; 0f:4f57 $f6 $03
    mD_7                                               ;; 0f:4f59 $27
    mD_12                                              ;; 0f:4f5a $2c
    mC_12                                              ;; 0f:4f5b $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4f5c $ec
    mAis_12                                            ;; 0f:4f5d $ac
    mOCTAVE_PLUS_1                                     ;; 0f:4f5e $e8
    mE_7                                               ;; 0f:4f5f $47
    mE_12                                              ;; 0f:4f60 $4c
    mD_12                                              ;; 0f:4f61 $2c
    mC_12                                              ;; 0f:4f62 $0c
    mF_9                                               ;; 0f:4f63 $59
    mA_12                                              ;; 0f:4f64 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4f65 $e8
    mD_12                                              ;; 0f:4f66 $2c
    mE_14                                              ;; 0f:4f67 $4e
    mF_14                                              ;; 0f:4f68 $5e
    mG_12                                              ;; 0f:4f69 $7c
    mA_12                                              ;; 0f:4f6a $9c
    mG_14                                              ;; 0f:4f6b $7e
    mF_14                                              ;; 0f:4f6c $5e
    mE_12                                              ;; 0f:4f6d $4c
    mD_12                                              ;; 0f:4f6e $2c
    mC_14                                              ;; 0f:4f6f $0e
    mOCTAVE_MINUS_1                                    ;; 0f:4f70 $ec
    mB_14                                              ;; 0f:4f71 $be
    mA_12                                              ;; 0f:4f72 $9c
    mOCTAVE_MINUS_1                                    ;; 0f:4f73 $ec
    mA_7                                               ;; 0f:4f74 $97
    mOCTAVE_PLUS_1                                     ;; 0f:4f75 $e8
    mF_12                                              ;; 0f:4f76 $5c
    mE_12                                              ;; 0f:4f77 $4c
    mF_12                                              ;; 0f:4f78 $5c
    mD_7                                               ;; 0f:4f79 $27
    mE_12                                              ;; 0f:4f7a $4c
    mF_12                                              ;; 0f:4f7b $5c
    mG_12                                              ;; 0f:4f7c $7c
    mF_7                                               ;; 0f:4f7d $57
    mF_12                                              ;; 0f:4f7e $5c
    mC_12                                              ;; 0f:4f7f $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4f80 $ec
    mAis_12                                            ;; 0f:4f81 $ac
    mA_7                                               ;; 0f:4f82 $97
    mOCTAVE_PLUS_1                                     ;; 0f:4f83 $e8
    mF_7                                               ;; 0f:4f84 $57
    mVOLUME_ENVELOPE data_0f_65f7                      ;; 0f:4f85 $f0 $f7 $65
    mSTEREOPAN $02                                     ;; 0f:4f88 $f6 $02
    mAis_12                                            ;; 0f:4f8a $ac
    mF_12                                              ;; 0f:4f8b $5c
    mD_12                                              ;; 0f:4f8c $2c
    mOCTAVE_PLUS_1                                     ;; 0f:4f8d $e8
    mD_12                                              ;; 0f:4f8e $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4f8f $ec
    mAis_12                                            ;; 0f:4f90 $ac
    mF_12                                              ;; 0f:4f91 $5c
    mSTEREOPAN $01                                     ;; 0f:4f92 $f6 $01
    mG_12                                              ;; 0f:4f94 $7c
    mE_12                                              ;; 0f:4f95 $4c
    mC_12                                              ;; 0f:4f96 $0c
    mE_12                                              ;; 0f:4f97 $4c
    mC_12                                              ;; 0f:4f98 $0c
    mE_12                                              ;; 0f:4f99 $4c
    mSTEREOPAN $02                                     ;; 0f:4f9a $f6 $02
    mF_12                                              ;; 0f:4f9c $5c
    mE_12                                              ;; 0f:4f9d $4c
    mF_12                                              ;; 0f:4f9e $5c
    mD_12                                              ;; 0f:4f9f $2c
    mE_12                                              ;; 0f:4fa0 $4c
    mC_12                                              ;; 0f:4fa1 $0c
    mSTEREOPAN $03                                     ;; 0f:4fa2 $f6 $03
    mD_12                                              ;; 0f:4fa4 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4fa5 $ec
    mA_12                                              ;; 0f:4fa6 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4fa7 $e8
    mA_12                                              ;; 0f:4fa8 $9c
    mG_12                                              ;; 0f:4fa9 $7c
    mF_12                                              ;; 0f:4faa $5c
    mE_12                                              ;; 0f:4fab $4c
    mVOLUME_ENVELOPE data_0f_6657                      ;; 0f:4fac $f0 $57 $66
    mD_7                                               ;; 0f:4faf $27
    mC_12                                              ;; 0f:4fb0 $0c
    mD_12                                              ;; 0f:4fb1 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4fb2 $ec
    mAis_12                                            ;; 0f:4fb3 $ac
    mAis_7                                             ;; 0f:4fb4 $a7
    mOCTAVE_PLUS_1                                     ;; 0f:4fb5 $e8
    mD_7                                               ;; 0f:4fb6 $27
    mE_7                                               ;; 0f:4fb7 $47
    mOCTAVE_PLUS_1                                     ;; 0f:4fb8 $e8
    mC_12                                              ;; 0f:4fb9 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4fba $ec
    mG_12                                              ;; 0f:4fbb $7c
    mE_12                                              ;; 0f:4fbc $4c
    mSTEREOPAN $02                                     ;; 0f:4fbd $f6 $02
    mC_12                                              ;; 0f:4fbf $0c
    mE_12                                              ;; 0f:4fc0 $4c
    mG_12                                              ;; 0f:4fc1 $7c
    mSTEREOPAN $03                                     ;; 0f:4fc2 $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:4fc4 $e8
    mE_12                                              ;; 0f:4fc5 $4c
    mF_12                                              ;; 0f:4fc6 $5c
    mG_12                                              ;; 0f:4fc7 $7c
    mOCTAVE_MINUS_1                                    ;; 0f:4fc8 $ec
    mD_7                                               ;; 0f:4fc9 $27
    mA_12                                              ;; 0f:4fca $9c
    mD_12                                              ;; 0f:4fcb $2c
    mG_12                                              ;; 0f:4fcc $7c
    mF_12                                              ;; 0f:4fcd $5c
    mE_12                                              ;; 0f:4fce $4c
    mD_12                                              ;; 0f:4fcf $2c
    mC_12                                              ;; 0f:4fd0 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4fd1 $ec
    mG_12                                              ;; 0f:4fd2 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:4fd3 $e8
    mE_12                                              ;; 0f:4fd4 $4c
    mC_7                                               ;; 0f:4fd5 $07
    mG_7                                               ;; 0f:4fd6 $77
    mOCTAVE_PLUS_1                                     ;; 0f:4fd7 $e8
    mSTEREOPAN $01                                     ;; 0f:4fd8 $f6 $01
    mC_12                                              ;; 0f:4fda $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4fdb $ec
    mB_12                                              ;; 0f:4fdc $bc
    mOCTAVE_PLUS_1                                     ;; 0f:4fdd $e8
    mC_12                                              ;; 0f:4fde $0c
    mSTEREOPAN $03                                     ;; 0f:4fdf $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:4fe1 $ec
    mG_12                                              ;; 0f:4fe2 $7c
    mE_12                                              ;; 0f:4fe3 $4c
    mC_12                                              ;; 0f:4fe4 $0c
    mD_12                                              ;; 0f:4fe5 $2c
    mC_12                                              ;; 0f:4fe6 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4fe7 $ec
    mAis_12                                            ;; 0f:4fe8 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:4fe9 $e8
    mC_12                                              ;; 0f:4fea $0c
    mD_12                                              ;; 0f:4feb $2c
    mE_12                                              ;; 0f:4fec $4c
    mF_12                                              ;; 0f:4fed $5c
    mD_12                                              ;; 0f:4fee $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4fef $ec
    mA_12                                              ;; 0f:4ff0 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:4ff1 $e8
    mG_12                                              ;; 0f:4ff2 $7c
    mF_12                                              ;; 0f:4ff3 $5c
    mE_12                                              ;; 0f:4ff4 $4c
    mG_12                                              ;; 0f:4ff5 $7c
    mF_12                                              ;; 0f:4ff6 $5c
    mE_12                                              ;; 0f:4ff7 $4c
    mD_12                                              ;; 0f:4ff8 $2c
    mC_12                                              ;; 0f:4ff9 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:4ffa $ec
    mAis_12                                            ;; 0f:4ffb $ac
    mG_12                                              ;; 0f:4ffc $7c
    mOCTAVE_PLUS_1                                     ;; 0f:4ffd $e8
    mD_12                                              ;; 0f:4ffe $2c
    mOCTAVE_MINUS_1                                    ;; 0f:4fff $ec
    mG_12                                              ;; 0f:5000 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:5001 $e8
    mE_12                                              ;; 0f:5002 $4c
    mD_12                                              ;; 0f:5003 $2c
    mC_12                                              ;; 0f:5004 $0c
    mJUMP .data_0f_4f3f                                ;; 0f:5005 $f1 $3f $4f

song08_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:5008 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:500e $03
    mOCTAVE_1                                          ;; 0f:500f $e1
    mD_12                                              ;; 0f:5010 $2c
    mRest_12                                           ;; 0f:5011 $dc
    mD_12                                              ;; 0f:5012 $2c
    mA_7                                               ;; 0f:5013 $97
    mD_12                                              ;; 0f:5014 $2c
    mRest_12                                           ;; 0f:5015 $dc
    mD_12                                              ;; 0f:5016 $2c
    mOCTAVE_PLUS_1                                     ;; 0f:5017 $e8
    mC_7                                               ;; 0f:5018 $07
    mOCTAVE_MINUS_1                                    ;; 0f:5019 $ec
    mB_12                                              ;; 0f:501a $bc
    mF_12                                              ;; 0f:501b $5c
    mE_12                                              ;; 0f:501c $4c
    mD_7                                               ;; 0f:501d $27
    mOCTAVE_PLUS_1                                     ;; 0f:501e $e8
    mCOUNTER_2 $06                                     ;; 0f:501f $fa $06
.data_0f_5021:
    mD_13                                              ;; 0f:5021 $2d
    mRest_15                                           ;; 0f:5022 $df
    mREPEAT_2 .data_0f_5021                            ;; 0f:5023 $f9 $21 $50
.data_0f_5026:
    mOCTAVE_2                                          ;; 0f:5026 $e2
    mCOUNTER_2 $08                                     ;; 0f:5027 $fa $08
.data_0f_5029:
    mD_12                                              ;; 0f:5029 $2c
    mRest_12                                           ;; 0f:502a $dc
    mD_13                                              ;; 0f:502b $2d
    mRest_15                                           ;; 0f:502c $df
    mREPEAT_2 .data_0f_5029                            ;; 0f:502d $f9 $29 $50
    mCOUNTER $02                                       ;; 0f:5030 $f3 $02
.data_0f_5032:
    mOCTAVE_MINUS_1                                    ;; 0f:5032 $ec
    mAis_12                                            ;; 0f:5033 $ac
    mRest_12                                           ;; 0f:5034 $dc
    mAis_12                                            ;; 0f:5035 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5036 $e8
    mF_12                                              ;; 0f:5037 $5c
    mG_12                                              ;; 0f:5038 $7c
    mF_12                                              ;; 0f:5039 $5c
    mE_12                                              ;; 0f:503a $4c
    mRest_12                                           ;; 0f:503b $dc
    mE_12                                              ;; 0f:503c $4c
    mC_12                                              ;; 0f:503d $0c
    mOCTAVE_MINUS_1                                    ;; 0f:503e $ec
    mAis_12                                            ;; 0f:503f $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5040 $e8
    mC_12                                              ;; 0f:5041 $0c
    mCOUNTER_2 $04                                     ;; 0f:5042 $fa $04
.data_0f_5044:
    mD_12                                              ;; 0f:5044 $2c
    mRest_12                                           ;; 0f:5045 $dc
    mD_13                                              ;; 0f:5046 $2d
    mRest_15                                           ;; 0f:5047 $df
    mREPEAT_2 .data_0f_5044                            ;; 0f:5048 $f9 $44 $50
    mJUMPIF $01, .data_0f_5064                         ;; 0f:504b $fb $01 $64 $50
    mCOUNTER_2 $04                                     ;; 0f:504f $fa $04
.data_0f_5051:
    mD_12                                              ;; 0f:5051 $2c
    mRest_12                                           ;; 0f:5052 $dc
    mD_13                                              ;; 0f:5053 $2d
    mRest_15                                           ;; 0f:5054 $df
    mREPEAT_2 .data_0f_5051                            ;; 0f:5055 $f9 $51 $50
    mCOUNTER_2 $04                                     ;; 0f:5058 $fa $04
.data_0f_505a:
    mF_12                                              ;; 0f:505a $5c
    mRest_12                                           ;; 0f:505b $dc
    mF_13                                              ;; 0f:505c $5d
    mRest_15                                           ;; 0f:505d $df
    mREPEAT_2 .data_0f_505a                            ;; 0f:505e $f9 $5a $50
    mREPEAT .data_0f_5032                              ;; 0f:5061 $f2 $32 $50
.data_0f_5064:
    mCOUNTER_2 $02                                     ;; 0f:5064 $fa $02
.data_0f_5066:
    mOCTAVE_MINUS_1                                    ;; 0f:5066 $ec
    mAis_6                                             ;; 0f:5067 $a6
    mRest_3                                            ;; 0f:5068 $d3
    mOCTAVE_PLUS_1                                     ;; 0f:5069 $e8
    mC_12                                              ;; 0f:506a $0c
    mRest_12                                           ;; 0f:506b $dc
    mC_9                                               ;; 0f:506c $09
    mRest_3                                            ;; 0f:506d $d3
    mREPEAT_2 .data_0f_5066                            ;; 0f:506e $f9 $66 $50
    mOCTAVE_MINUS_1                                    ;; 0f:5071 $ec
    mAis_7                                             ;; 0f:5072 $a7
    mOCTAVE_PLUS_1                                     ;; 0f:5073 $e8
    mC_7                                               ;; 0f:5074 $07
    mD_7                                               ;; 0f:5075 $27
    mE_7                                               ;; 0f:5076 $47
    mF_12                                              ;; 0f:5077 $5c
    mE_12                                              ;; 0f:5078 $4c
    mD_12                                              ;; 0f:5079 $2c
    mC_12                                              ;; 0f:507a $0c
    mOCTAVE_MINUS_1                                    ;; 0f:507b $ec
    mAis_12                                            ;; 0f:507c $ac
    mA_12                                              ;; 0f:507d $9c
    mG_12                                              ;; 0f:507e $7c
    mOCTAVE_PLUS_1                                     ;; 0f:507f $e8
    mG_12                                              ;; 0f:5080 $7c
    mOCTAVE_MINUS_1                                    ;; 0f:5081 $ec
    mG_12                                              ;; 0f:5082 $7c
    mA_12                                              ;; 0f:5083 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5084 $e8
    mA_12                                              ;; 0f:5085 $9c
    mOCTAVE_MINUS_1                                    ;; 0f:5086 $ec
    mA_12                                              ;; 0f:5087 $9c
    mJUMP .data_0f_5026                                ;; 0f:5088 $f1 $26 $50

song08_channel4:
    mRest_0                                            ;; 0f:508b $d0
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:508c $f0 $1b $66
.data_0f_508f:
    mSTEREOPAN $01                                     ;; 0f:508f $f6 $01
    mB_9                                               ;; 0f:5091 $b9
    mB_12                                              ;; 0f:5092 $bc
    mB_9                                               ;; 0f:5093 $b9
    mB_12                                              ;; 0f:5094 $bc
    mB_9                                               ;; 0f:5095 $b9
    mB_12                                              ;; 0f:5096 $bc
    mSTEREOPAN $02                                     ;; 0f:5097 $f6 $02
    mG_14                                              ;; 0f:5099 $7e
    mF_14                                              ;; 0f:509a $5e
    mRest_9                                            ;; 0f:509b $d9
    mJUMP .data_0f_508f                                ;; 0f:509c $f1 $8f $50

song0a_channel2:
    mINIT2 $7d, data_0f_6668, data_0f_6611, $c0        ;; 0f:509f $fe $7d $68 $66 $11 $66 $c0
    mC_3                                               ;; 0f:50a6 $03
    mOCTAVE_2                                          ;; 0f:50a7 $e2
    mD_12                                              ;; 0f:50a8 $2c
    mE_12                                              ;; 0f:50a9 $4c
    mF_12                                              ;; 0f:50aa $5c
    mG_12                                              ;; 0f:50ab $7c
    mA_12                                              ;; 0f:50ac $9c
    mAis_12                                            ;; 0f:50ad $ac
    mOCTAVE_PLUS_1                                     ;; 0f:50ae $e8
    mC_12                                              ;; 0f:50af $0c
    mCis_12                                            ;; 0f:50b0 $1c
    mVOLUME_ENVELOPE data_0f_6651                      ;; 0f:50b1 $f0 $51 $66
.data_0f_50b4:
    mOCTAVE_3                                          ;; 0f:50b4 $e3
    mA_6                                               ;; 0f:50b5 $96
    mD_6                                               ;; 0f:50b6 $26
    mF_4                                               ;; 0f:50b7 $54
    mE_12                                              ;; 0f:50b8 $4c
    mF_12                                              ;; 0f:50b9 $5c
    mE_9                                               ;; 0f:50ba $49
    mC_9                                               ;; 0f:50bb $09
    mOCTAVE_MINUS_1                                    ;; 0f:50bc $ec
    mAis_9                                             ;; 0f:50bd $a9
    mOCTAVE_PLUS_1                                     ;; 0f:50be $e8
    mC_9                                               ;; 0f:50bf $09
    mA_6                                               ;; 0f:50c0 $96
    mG_6                                               ;; 0f:50c1 $76
    mF_6                                               ;; 0f:50c2 $56
    mE_6                                               ;; 0f:50c3 $46
    mD_4                                               ;; 0f:50c4 $24
    mOCTAVE_MINUS_1                                    ;; 0f:50c5 $ec
    mAis_12                                            ;; 0f:50c6 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:50c7 $e8
    mC_12                                              ;; 0f:50c8 $0c
    mD_4                                               ;; 0f:50c9 $24
    mCis_12                                            ;; 0f:50ca $1c
    mD_12                                              ;; 0f:50cb $2c
    mE_3                                               ;; 0f:50cc $43
    mF_6                                               ;; 0f:50cd $56
    mD_6                                               ;; 0f:50ce $26
    mA_4                                               ;; 0f:50cf $94
    mE_12                                              ;; 0f:50d0 $4c
    mF_12                                              ;; 0f:50d1 $5c
    mG_4                                               ;; 0f:50d2 $74
    mG_12                                              ;; 0f:50d3 $7c
    mF_12                                              ;; 0f:50d4 $5c
    mE_4                                               ;; 0f:50d5 $44
    mD_12                                              ;; 0f:50d6 $2c
    mCis_12                                            ;; 0f:50d7 $1c
    mD_4                                               ;; 0f:50d8 $24
    mAis_9                                             ;; 0f:50d9 $a9
    mA_9                                               ;; 0f:50da $99
    mG_9                                               ;; 0f:50db $79
    mF_9                                               ;; 0f:50dc $59
    mE_9                                               ;; 0f:50dd $49
    mF_4                                               ;; 0f:50de $54
    mE_12                                              ;; 0f:50df $4c
    mF_12                                              ;; 0f:50e0 $5c
    mG_3                                               ;; 0f:50e1 $73
    mCOUNTER_2 $02                                     ;; 0f:50e2 $fa $02
.data_0f_50e4:
    mD_6                                               ;; 0f:50e4 $26
    mOCTAVE_MINUS_1                                    ;; 0f:50e5 $ec
    mA_6                                               ;; 0f:50e6 $96
    mAis_4                                             ;; 0f:50e7 $a4
    mOCTAVE_PLUS_1                                     ;; 0f:50e8 $e8
    mF_12                                              ;; 0f:50e9 $5c
    mE_12                                              ;; 0f:50ea $4c
    mD_9                                               ;; 0f:50eb $29
    mOCTAVE_MINUS_1                                    ;; 0f:50ec $ec
    mA_9                                               ;; 0f:50ed $99
    mAis_9                                             ;; 0f:50ee $a9
    mOCTAVE_PLUS_1                                     ;; 0f:50ef $e8
    mC_9                                               ;; 0f:50f0 $09
    mF_6                                               ;; 0f:50f1 $56
    mE_6                                               ;; 0f:50f2 $46
    mD_6                                               ;; 0f:50f3 $26
    mOCTAVE_MINUS_1                                    ;; 0f:50f4 $ec
    mA_6                                               ;; 0f:50f5 $96
    mAis_4                                             ;; 0f:50f6 $a4
    mOCTAVE_PLUS_1                                     ;; 0f:50f7 $e8
    mF_12                                              ;; 0f:50f8 $5c
    mE_12                                              ;; 0f:50f9 $4c
    mD_9                                               ;; 0f:50fa $29
    mOCTAVE_MINUS_1                                    ;; 0f:50fb $ec
    mA_9                                               ;; 0f:50fc $99
    mOCTAVE_PLUS_1                                     ;; 0f:50fd $e8
    mF_9                                               ;; 0f:50fe $59
    mE_9                                               ;; 0f:50ff $49
    mOCTAVE_MINUS_1                                    ;; 0f:5100 $ec
    mAis_12                                            ;; 0f:5101 $ac
    mA_12                                              ;; 0f:5102 $9c
    mAis_9                                             ;; 0f:5103 $a9
    mOCTAVE_PLUS_1                                     ;; 0f:5104 $e8
    mC_12                                              ;; 0f:5105 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5106 $ec
    mAis_12                                            ;; 0f:5107 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5108 $e8
    mC_9                                               ;; 0f:5109 $09
    mREPEAT_2 .data_0f_50e4                            ;; 0f:510a $f9 $e4 $50
    mJUMP .data_0f_50b4                                ;; 0f:510d $f1 $b4 $50

song0a_channel1:
    mINIT1 frequencyDeltaData, data_0f_6613, $40       ;; 0f:5110 $fe $63 $66 $13 $66 $40
    mC_3                                               ;; 0f:5116 $03
    mOCTAVE_1                                          ;; 0f:5117 $e1
    mA_12                                              ;; 0f:5118 $9c
    mAis_12                                            ;; 0f:5119 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:511a $e8
    mC_12                                              ;; 0f:511b $0c
    mD_12                                              ;; 0f:511c $2c
    mE_12                                              ;; 0f:511d $4c
    mF_12                                              ;; 0f:511e $5c
    mG_12                                              ;; 0f:511f $7c
    mGis_12                                            ;; 0f:5120 $8c
.data_0f_5121:
    mOCTAVE_2                                          ;; 0f:5121 $e2
    mF_9                                               ;; 0f:5122 $59
    mF_9                                               ;; 0f:5123 $59
    mE_12                                              ;; 0f:5124 $4c
    mF_12                                              ;; 0f:5125 $5c
    mE_12                                              ;; 0f:5126 $4c
    mD_12                                              ;; 0f:5127 $2c
    mA_9                                               ;; 0f:5128 $99
    mA_9                                               ;; 0f:5129 $99
    mOCTAVE_PLUS_1                                     ;; 0f:512a $e8
    mSTEREOPAN $02                                     ;; 0f:512b $f6 $02
    mD_12                                              ;; 0f:512d $2c
    mC_12                                              ;; 0f:512e $0c
    mOCTAVE_MINUS_1                                    ;; 0f:512f $ec
    mAis_9                                             ;; 0f:5130 $a9
    mSTEREOPAN $03                                     ;; 0f:5131 $f6 $03
    mG_9                                               ;; 0f:5133 $79
    mG_9                                               ;; 0f:5134 $79
    mF_12                                              ;; 0f:5135 $5c
    mE_12                                              ;; 0f:5136 $4c
    mF_12                                              ;; 0f:5137 $5c
    mG_12                                              ;; 0f:5138 $7c
    mSTEREOPAN $02                                     ;; 0f:5139 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:513b $e8
    mF_9                                               ;; 0f:513c $59
    mG_9                                               ;; 0f:513d $79
    mSTEREOPAN $01                                     ;; 0f:513e $f6 $01
    mE_9                                               ;; 0f:5140 $49
    mC_9                                               ;; 0f:5141 $09
    mSTEREOPAN $03                                     ;; 0f:5142 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:5144 $ec
    mD_9                                               ;; 0f:5145 $29
    mD_9                                               ;; 0f:5146 $29
    mE_12                                              ;; 0f:5147 $4c
    mC_12                                              ;; 0f:5148 $0c
    mD_12                                              ;; 0f:5149 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:514a $ec
    mA_12                                              ;; 0f:514b $9c
    mOCTAVE_PLUS_1                                     ;; 0f:514c $e8
    mF_9                                               ;; 0f:514d $59
    mF_9                                               ;; 0f:514e $59
    mE_12                                              ;; 0f:514f $4c
    mF_12                                              ;; 0f:5150 $5c
    mE_9                                               ;; 0f:5151 $49
    mSTEREOPAN $02                                     ;; 0f:5152 $f6 $02
    mA_6                                               ;; 0f:5154 $96
    mAis_12                                            ;; 0f:5155 $ac
    mA_12                                              ;; 0f:5156 $9c
    mG_12                                              ;; 0f:5157 $7c
    mF_12                                              ;; 0f:5158 $5c
    mSTEREOPAN $01                                     ;; 0f:5159 $f6 $01
    mG_6                                               ;; 0f:515b $76
    mA_12                                              ;; 0f:515c $9c
    mG_12                                              ;; 0f:515d $7c
    mF_12                                              ;; 0f:515e $5c
    mG_12                                              ;; 0f:515f $7c
    mSTEREOPAN $03                                     ;; 0f:5160 $f6 $03
    mA_9                                               ;; 0f:5162 $99
    mA_9                                               ;; 0f:5163 $99
    mG_12                                              ;; 0f:5164 $7c
    mF_12                                              ;; 0f:5165 $5c
    mE_12                                              ;; 0f:5166 $4c
    mF_12                                              ;; 0f:5167 $5c
    mF_9                                               ;; 0f:5168 $59
    mF_9                                               ;; 0f:5169 $59
    mSTEREOPAN $02                                     ;; 0f:516a $f6 $02
    mE_12                                              ;; 0f:516c $4c
    mF_12                                              ;; 0f:516d $5c
    mE_9                                               ;; 0f:516e $49
    mSTEREOPAN $03                                     ;; 0f:516f $f6 $03
    mC_9                                               ;; 0f:5171 $09
    mC_9                                               ;; 0f:5172 $09
    mE_12                                              ;; 0f:5173 $4c
    mD_12                                              ;; 0f:5174 $2c
    mC_12                                              ;; 0f:5175 $0c
    mD_12                                              ;; 0f:5176 $2c
    mSTEREOPAN $01                                     ;; 0f:5177 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5179 $e8
    mC_9                                               ;; 0f:517a $09
    mOCTAVE_MINUS_1                                    ;; 0f:517b $ec
    mG_9                                               ;; 0f:517c $79
    mSTEREOPAN $02                                     ;; 0f:517d $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:517f $e8
    mC_9                                               ;; 0f:5180 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5181 $ec
    mG_9                                               ;; 0f:5182 $79
    mSTEREOPAN $03                                     ;; 0f:5183 $f6 $03
    mF_9                                               ;; 0f:5185 $59
    mF_9                                               ;; 0f:5186 $59
    mE_12                                              ;; 0f:5187 $4c
    mD_12                                              ;; 0f:5188 $2c
    mC_12                                              ;; 0f:5189 $0c
    mD_12                                              ;; 0f:518a $2c
    mOCTAVE_PLUS_1                                     ;; 0f:518b $e8
    mC_9                                               ;; 0f:518c $09
    mOCTAVE_MINUS_1                                    ;; 0f:518d $ec
    mAis_9                                             ;; 0f:518e $a9
    mA_9                                               ;; 0f:518f $99
    mG_9                                               ;; 0f:5190 $79
    mSTEREOPAN $01                                     ;; 0f:5191 $f6 $01
    mA_6                                               ;; 0f:5193 $96
    mAis_12                                            ;; 0f:5194 $ac
    mA_12                                              ;; 0f:5195 $9c
    mG_12                                              ;; 0f:5196 $7c
    mA_12                                              ;; 0f:5197 $9c
    mSTEREOPAN $02                                     ;; 0f:5198 $f6 $02
    mE_6                                               ;; 0f:519a $46
    mE_12                                              ;; 0f:519b $4c
    mOCTAVE_PLUS_1                                     ;; 0f:519c $e8
    mC_12                                              ;; 0f:519d $0c
    mOCTAVE_MINUS_1                                    ;; 0f:519e $ec
    mG_12                                              ;; 0f:519f $7c
    mE_12                                              ;; 0f:51a0 $4c
    mSTEREOPAN $03                                     ;; 0f:51a1 $f6 $03
    mCOUNTER_2 $02                                     ;; 0f:51a3 $fa $02
.data_0f_51a5:
    mA_6                                               ;; 0f:51a5 $96
    mF_6                                               ;; 0f:51a6 $56
    mG_6                                               ;; 0f:51a7 $76
    mOCTAVE_PLUS_1                                     ;; 0f:51a8 $e8
    mG_6                                               ;; 0f:51a9 $76
    mF_6                                               ;; 0f:51aa $56
    mE_6                                               ;; 0f:51ab $46
    mD_6                                               ;; 0f:51ac $26
    mC_6                                               ;; 0f:51ad $06
    mOCTAVE_MINUS_1                                    ;; 0f:51ae $ec
    mA_6                                               ;; 0f:51af $96
    mF_6                                               ;; 0f:51b0 $56
    mG_6                                               ;; 0f:51b1 $76
    mOCTAVE_PLUS_1                                     ;; 0f:51b2 $e8
    mF_6                                               ;; 0f:51b3 $56
    mSTEREOPAN $01                                     ;; 0f:51b4 $f6 $01
    mAis_9                                             ;; 0f:51b6 $a9
    mA_9                                               ;; 0f:51b7 $99
    mSTEREOPAN $02                                     ;; 0f:51b8 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:51ba $e8
    mD_9                                               ;; 0f:51bb $29
    mC_9                                               ;; 0f:51bc $09
    mSTEREOPAN $01                                     ;; 0f:51bd $f6 $01
    mD_12                                              ;; 0f:51bf $2c
    mC_12                                              ;; 0f:51c0 $0c
    mD_9                                               ;; 0f:51c1 $29
    mSTEREOPAN $02                                     ;; 0f:51c2 $f6 $02
    mE_12                                              ;; 0f:51c4 $4c
    mD_12                                              ;; 0f:51c5 $2c
    mE_9                                               ;; 0f:51c6 $49
    mOCTAVE_MINUS_2                                    ;; 0f:51c7 $ed
    mSTEREOPAN $03                                     ;; 0f:51c8 $f6 $03
    mREPEAT_2 .data_0f_51a5                            ;; 0f:51ca $f9 $a5 $51
    mJUMP .data_0f_5121                                ;; 0f:51cd $f1 $21 $51

song0a_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:51d0 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:51d6 $03
    mRest_3                                            ;; 0f:51d7 $d3
.data_0f_51d8:
    mCOUNTER_2 $04                                     ;; 0f:51d8 $fa $04
.data_0f_51da:
    mOCTAVE_1                                          ;; 0f:51da $e1
    mD_9                                               ;; 0f:51db $29
    mOCTAVE_PLUS_1                                     ;; 0f:51dc $e8
    mD_9                                               ;; 0f:51dd $29
    mREPEAT_2 .data_0f_51da                            ;; 0f:51de $f9 $da $51
    mOCTAVE_MINUS_1                                    ;; 0f:51e1 $ec
    mC_9                                               ;; 0f:51e2 $09
    mOCTAVE_PLUS_1                                     ;; 0f:51e3 $e8
    mC_9                                               ;; 0f:51e4 $09
    mOCTAVE_MINUS_1                                    ;; 0f:51e5 $ec
    mC_9                                               ;; 0f:51e6 $09
    mOCTAVE_PLUS_1                                     ;; 0f:51e7 $e8
    mC_9                                               ;; 0f:51e8 $09
    mOCTAVE_MINUS_2                                    ;; 0f:51e9 $ed
    mAis_9                                             ;; 0f:51ea $a9
    mOCTAVE_PLUS_1                                     ;; 0f:51eb $e8
    mAis_9                                             ;; 0f:51ec $a9
    mC_9                                               ;; 0f:51ed $09
    mOCTAVE_PLUS_1                                     ;; 0f:51ee $e8
    mC_9                                               ;; 0f:51ef $09
    mCOUNTER_2 $04                                     ;; 0f:51f0 $fa $04
.data_0f_51f2:
    mOCTAVE_MINUS_1                                    ;; 0f:51f2 $ec
    mD_9                                               ;; 0f:51f3 $29
    mOCTAVE_PLUS_1                                     ;; 0f:51f4 $e8
    mD_9                                               ;; 0f:51f5 $29
    mREPEAT_2 .data_0f_51f2                            ;; 0f:51f6 $f9 $f2 $51
    mOCTAVE_MINUS_2                                    ;; 0f:51f9 $ed
    mAis_9                                             ;; 0f:51fa $a9
    mOCTAVE_PLUS_1                                     ;; 0f:51fb $e8
    mAis_9                                             ;; 0f:51fc $a9
    mOCTAVE_MINUS_1                                    ;; 0f:51fd $ec
    mAis_9                                             ;; 0f:51fe $a9
    mOCTAVE_PLUS_1                                     ;; 0f:51ff $e8
    mAis_9                                             ;; 0f:5200 $a9
    mOCTAVE_PLUS_1                                     ;; 0f:5201 $e8
    mC_9                                               ;; 0f:5202 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5203 $ec
    mC_9                                               ;; 0f:5204 $09
    mOCTAVE_PLUS_1                                     ;; 0f:5205 $e8
    mC_9                                               ;; 0f:5206 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5207 $ec
    mC_9                                               ;; 0f:5208 $09
    mCOUNTER_2 $04                                     ;; 0f:5209 $fa $04
.data_0f_520b:
    mOCTAVE_1                                          ;; 0f:520b $e1
    mD_9                                               ;; 0f:520c $29
    mOCTAVE_PLUS_1                                     ;; 0f:520d $e8
    mD_9                                               ;; 0f:520e $29
    mREPEAT_2 .data_0f_520b                            ;; 0f:520f $f9 $0b $52
    mCOUNTER_2 $04                                     ;; 0f:5212 $fa $04
.data_0f_5214:
    mOCTAVE_MINUS_1                                    ;; 0f:5214 $ec
    mC_9                                               ;; 0f:5215 $09
    mOCTAVE_PLUS_1                                     ;; 0f:5216 $e8
    mC_9                                               ;; 0f:5217 $09
    mREPEAT_2 .data_0f_5214                            ;; 0f:5218 $f9 $14 $52
    mCOUNTER_2 $04                                     ;; 0f:521b $fa $04
.data_0f_521d:
    mOCTAVE_0                                          ;; 0f:521d $e0
    mAis_9                                             ;; 0f:521e $a9
    mOCTAVE_PLUS_1                                     ;; 0f:521f $e8
    mAis_9                                             ;; 0f:5220 $a9
    mREPEAT_2 .data_0f_521d                            ;; 0f:5221 $f9 $1d $52
    mF_9                                               ;; 0f:5224 $59
    mOCTAVE_PLUS_1                                     ;; 0f:5225 $e8
    mF_9                                               ;; 0f:5226 $59
    mOCTAVE_MINUS_1                                    ;; 0f:5227 $ec
    mF_9                                               ;; 0f:5228 $59
    mOCTAVE_PLUS_1                                     ;; 0f:5229 $e8
    mF_9                                               ;; 0f:522a $59
    mOCTAVE_MINUS_1                                    ;; 0f:522b $ec
    mC_9                                               ;; 0f:522c $09
    mOCTAVE_PLUS_1                                     ;; 0f:522d $e8
    mC_9                                               ;; 0f:522e $09
    mOCTAVE_MINUS_1                                    ;; 0f:522f $ec
    mC_9                                               ;; 0f:5230 $09
    mOCTAVE_PLUS_1                                     ;; 0f:5231 $e8
    mC_9                                               ;; 0f:5232 $09
    mCOUNTER $02                                       ;; 0f:5233 $f3 $02
.data_0f_5235:
    mOCTAVE_0                                          ;; 0f:5235 $e0
    mCOUNTER_2 $04                                     ;; 0f:5236 $fa $04
.data_0f_5238:
    mD_12                                              ;; 0f:5238 $2c
    mOCTAVE_PLUS_1                                     ;; 0f:5239 $e8
    mREPEAT_2 .data_0f_5238                            ;; 0f:523a $f9 $38 $52
    mSTEREOPAN $01                                     ;; 0f:523d $f6 $01
    mCOUNTER_2 $04                                     ;; 0f:523f $fa $04
.data_0f_5241:
    mD_12                                              ;; 0f:5241 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5242 $ec
    mREPEAT_2 .data_0f_5241                            ;; 0f:5243 $f9 $41 $52
    mSTEREOPAN $03                                     ;; 0f:5246 $f6 $03
    mCOUNTER_2 $04                                     ;; 0f:5248 $fa $04
.data_0f_524a:
    mAis_12                                            ;; 0f:524a $ac
    mOCTAVE_PLUS_1                                     ;; 0f:524b $e8
    mREPEAT_2 .data_0f_524a                            ;; 0f:524c $f9 $4a $52
    mSTEREOPAN $02                                     ;; 0f:524f $f6 $02
    mCOUNTER_2 $04                                     ;; 0f:5251 $fa $04
.data_0f_5253:
    mAis_12                                            ;; 0f:5253 $ac
    mOCTAVE_MINUS_1                                    ;; 0f:5254 $ec
    mREPEAT_2 .data_0f_5253                            ;; 0f:5255 $f9 $53 $52
    mSTEREOPAN $03                                     ;; 0f:5258 $f6 $03
    mOCTAVE_PLUS_2                                     ;; 0f:525a $e9
    mF_9                                               ;; 0f:525b $59
    mOCTAVE_PLUS_1                                     ;; 0f:525c $e8
    mF_9                                               ;; 0f:525d $59
    mOCTAVE_MINUS_1                                    ;; 0f:525e $ec
    mE_9                                               ;; 0f:525f $49
    mOCTAVE_PLUS_1                                     ;; 0f:5260 $e8
    mE_9                                               ;; 0f:5261 $49
    mOCTAVE_MINUS_1                                    ;; 0f:5262 $ec
    mD_9                                               ;; 0f:5263 $29
    mOCTAVE_PLUS_1                                     ;; 0f:5264 $e8
    mD_9                                               ;; 0f:5265 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5266 $ec
    mC_9                                               ;; 0f:5267 $09
    mOCTAVE_PLUS_1                                     ;; 0f:5268 $e8
    mC_9                                               ;; 0f:5269 $09
    mOCTAVE_0                                          ;; 0f:526a $e0
    mCOUNTER_2 $04                                     ;; 0f:526b $fa $04
.data_0f_526d:
    mD_12                                              ;; 0f:526d $2c
    mOCTAVE_PLUS_1                                     ;; 0f:526e $e8
    mREPEAT_2 .data_0f_526d                            ;; 0f:526f $f9 $6d $52
    mSTEREOPAN $01                                     ;; 0f:5272 $f6 $01
    mCOUNTER_2 $04                                     ;; 0f:5274 $fa $04
.data_0f_5276:
    mD_12                                              ;; 0f:5276 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5277 $ec
    mREPEAT_2 .data_0f_5276                            ;; 0f:5278 $f9 $76 $52
    mSTEREOPAN $03                                     ;; 0f:527b $f6 $03
    mCOUNTER_2 $04                                     ;; 0f:527d $fa $04
.data_0f_527f:
    mAis_12                                            ;; 0f:527f $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5280 $e8
    mREPEAT_2 .data_0f_527f                            ;; 0f:5281 $f9 $7f $52
    mSTEREOPAN $02                                     ;; 0f:5284 $f6 $02
    mCOUNTER_2 $04                                     ;; 0f:5286 $fa $04
.data_0f_5288:
    mAis_12                                            ;; 0f:5288 $ac
    mOCTAVE_MINUS_1                                    ;; 0f:5289 $ec
    mREPEAT_2 .data_0f_5288                            ;; 0f:528a $f9 $88 $52
    mSTEREOPAN $03                                     ;; 0f:528d $f6 $03
    mOCTAVE_PLUS_2                                     ;; 0f:528f $e9
    mF_9                                               ;; 0f:5290 $59
    mOCTAVE_PLUS_1                                     ;; 0f:5291 $e8
    mF_9                                               ;; 0f:5292 $59
    mOCTAVE_MINUS_1                                    ;; 0f:5293 $ec
    mC_9                                               ;; 0f:5294 $09
    mOCTAVE_PLUS_1                                     ;; 0f:5295 $e8
    mC_9                                               ;; 0f:5296 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5297 $ec
    mD_9                                               ;; 0f:5298 $29
    mOCTAVE_PLUS_1                                     ;; 0f:5299 $e8
    mD_9                                               ;; 0f:529a $29
    mOCTAVE_MINUS_1                                    ;; 0f:529b $ec
    mE_9                                               ;; 0f:529c $49
    mOCTAVE_PLUS_1                                     ;; 0f:529d $e8
    mE_9                                               ;; 0f:529e $49
    mREPEAT .data_0f_5235                              ;; 0f:529f $f2 $35 $52
    mJUMP .data_0f_51d8                                ;; 0f:52a2 $f1 $d8 $51

song0a_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:52a5 $f0 $1b $66
    mRest_3                                            ;; 0f:52a8 $d3
.data_0f_52a9:
    mSTEREOPAN $02                                     ;; 0f:52a9 $f6 $02
    mF_9                                               ;; 0f:52ab $59
    mB_12                                              ;; 0f:52ac $bc
    mB_12                                              ;; 0f:52ad $bc
    mSTEREOPAN $01                                     ;; 0f:52ae $f6 $01
    mG_9                                               ;; 0f:52b0 $79
    mB_12                                              ;; 0f:52b1 $bc
    mB_12                                              ;; 0f:52b2 $bc
    mJUMP .data_0f_52a9                                ;; 0f:52b3 $f1 $a9 $52

song09_channel2:
    mINIT2 $42, frequencyDeltaData, data_0f_6641, $80  ;; 0f:52b6 $fe $42 $63 $66 $41 $66 $80
    mC_3                                               ;; 0f:52bd $03
.data_0f_52be:
    mCOUNTER $02                                       ;; 0f:52be $f3 $02
.data_0f_52c0:
    mCOUNTER_2 $02                                     ;; 0f:52c0 $fa $02
.data_0f_52c2:
    mOCTAVE_0                                          ;; 0f:52c2 $e0
    mA_9                                               ;; 0f:52c3 $99
    mOCTAVE_PLUS_1                                     ;; 0f:52c4 $e8
    mCis_9                                             ;; 0f:52c5 $19
    mE_9                                               ;; 0f:52c6 $49
    mG_9                                               ;; 0f:52c7 $79
    mA_9                                               ;; 0f:52c8 $99
    mB_9                                               ;; 0f:52c9 $b9
    mA_9                                               ;; 0f:52ca $99
    mG_9                                               ;; 0f:52cb $79
    mREPEAT_2 .data_0f_52c2                            ;; 0f:52cc $f9 $c2 $52
    mOCTAVE_MINUS_1                                    ;; 0f:52cf $ec
    mG_9                                               ;; 0f:52d0 $79
    mB_9                                               ;; 0f:52d1 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:52d2 $e8
    mD_9                                               ;; 0f:52d3 $29
    mF_9                                               ;; 0f:52d4 $59
    mG_9                                               ;; 0f:52d5 $79
    mA_9                                               ;; 0f:52d6 $99
    mG_9                                               ;; 0f:52d7 $79
    mF_9                                               ;; 0f:52d8 $59
    mOCTAVE_MINUS_1                                    ;; 0f:52d9 $ec
    mA_9                                               ;; 0f:52da $99
    mOCTAVE_PLUS_1                                     ;; 0f:52db $e8
    mCis_9                                             ;; 0f:52dc $19
    mE_9                                               ;; 0f:52dd $49
    mG_9                                               ;; 0f:52de $79
    mA_9                                               ;; 0f:52df $99
    mB_9                                               ;; 0f:52e0 $b9
    mA_9                                               ;; 0f:52e1 $99
    mG_9                                               ;; 0f:52e2 $79
    mREPEAT .data_0f_52c0                              ;; 0f:52e3 $f2 $c0 $52
    mCOUNTER $02                                       ;; 0f:52e6 $f3 $02
.data_0f_52e8:
    mOCTAVE_MINUS_1                                    ;; 0f:52e8 $ec
    mG_9                                               ;; 0f:52e9 $79
    mB_9                                               ;; 0f:52ea $b9
    mOCTAVE_PLUS_1                                     ;; 0f:52eb $e8
    mD_9                                               ;; 0f:52ec $29
    mF_9                                               ;; 0f:52ed $59
    mG_9                                               ;; 0f:52ee $79
    mA_9                                               ;; 0f:52ef $99
    mG_9                                               ;; 0f:52f0 $79
    mF_9                                               ;; 0f:52f1 $59
    mOCTAVE_MINUS_1                                    ;; 0f:52f2 $ec
    mJUMPIF $01, .data_0f_5303                         ;; 0f:52f3 $fb $01 $03 $53
    mA_9                                               ;; 0f:52f7 $99
    mOCTAVE_PLUS_1                                     ;; 0f:52f8 $e8
    mCis_9                                             ;; 0f:52f9 $19
    mE_9                                               ;; 0f:52fa $49
    mG_9                                               ;; 0f:52fb $79
    mA_9                                               ;; 0f:52fc $99
    mB_9                                               ;; 0f:52fd $b9
    mA_9                                               ;; 0f:52fe $99
    mG_9                                               ;; 0f:52ff $79
    mREPEAT .data_0f_52e8                              ;; 0f:5300 $f2 $e8 $52
.data_0f_5303:
    mGis_9                                             ;; 0f:5303 $89
    mB_9                                               ;; 0f:5304 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5305 $e8
    mD_9                                               ;; 0f:5306 $29
    mE_9                                               ;; 0f:5307 $49
    mFis_9                                             ;; 0f:5308 $69
    mGis_9                                             ;; 0f:5309 $89
    mFis_9                                             ;; 0f:530a $69
    mE_9                                               ;; 0f:530b $49
    mJUMP .data_0f_52be                                ;; 0f:530c $f1 $be $52

song09_channel1:
    mINIT1 frequencyDeltaData, data_0f_663d, $00       ;; 0f:530f $fe $63 $66 $3d $66 $00
    mC_3                                               ;; 0f:5315 $03
    mOCTAVE_4                                          ;; 0f:5316 $e4
.data_0f_5317:
    mSTEREOPAN $02                                     ;; 0f:5317 $f6 $02
    mE_9                                               ;; 0f:5319 $49
    mOCTAVE_MINUS_1                                    ;; 0f:531a $ec
    mE_9                                               ;; 0f:531b $49
    mSTEREOPAN $03                                     ;; 0f:531c $f6 $03
    mE_9                                               ;; 0f:531e $49
    mOCTAVE_MINUS_1                                    ;; 0f:531f $ec
    mE_9                                               ;; 0f:5320 $49
    mSTEREOPAN $01                                     ;; 0f:5321 $f6 $01
    mOCTAVE_3                                          ;; 0f:5323 $e3
    mE_9                                               ;; 0f:5324 $49
    mOCTAVE_PLUS_1                                     ;; 0f:5325 $e8
    mE_4                                               ;; 0f:5326 $44
    mJUMP .data_0f_5317                                ;; 0f:5327 $f1 $17 $53

song09_channel3:
    mINIT3 data_0f_6668, $20, wavePatternsData         ;; 0f:532a $fe $68 $66 $20 $b2 $66
    mC_3                                               ;; 0f:5330 $03
.data_0f_5331:
    mCOUNTER_2 $02                                     ;; 0f:5331 $fa $02
.data_0f_5333:
    mOCTAVE_4                                          ;; 0f:5333 $e4
    mE_3                                               ;; 0f:5334 $43
    mD_6                                               ;; 0f:5335 $26
    mOCTAVE_MINUS_1                                    ;; 0f:5336 $ec
    mB_12                                              ;; 0f:5337 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5338 $e8
    mCis_12                                            ;; 0f:5339 $1c
    mD_9                                               ;; 0f:533a $29
    mCis_3                                             ;; 0f:533b $13
    mOCTAVE_MINUS_1                                    ;; 0f:533c $ec
    mA_6                                               ;; 0f:533d $96
    mVOLUME $40                                        ;; 0f:533e $f0 $40
    mWait_6                                            ;; 0f:5340 $c6
    mVOLUME $20                                        ;; 0f:5341 $f0 $20
    mB_3                                               ;; 0f:5343 $b3
    mG_6                                               ;; 0f:5344 $76
    mG_12                                              ;; 0f:5345 $7c
    mA_12                                              ;; 0f:5346 $9c
    mB_12                                              ;; 0f:5347 $bc
    mG_12                                              ;; 0f:5348 $7c
    mA_3                                               ;; 0f:5349 $93
    mVOLUME $40                                        ;; 0f:534a $f0 $40
    mWait_4                                            ;; 0f:534c $c4
    mRest_9                                            ;; 0f:534d $d9
    mVOLUME $20                                        ;; 0f:534e $f0 $20
    mREPEAT_2 .data_0f_5333                            ;; 0f:5350 $f9 $33 $53
    mG_3                                               ;; 0f:5353 $73
    mB_6                                               ;; 0f:5354 $b6
    mOCTAVE_PLUS_1                                     ;; 0f:5355 $e8
    mD_6                                               ;; 0f:5356 $26
    mCis_3                                             ;; 0f:5357 $13
    mOCTAVE_MINUS_1                                    ;; 0f:5358 $ec
    mA_6                                               ;; 0f:5359 $96
    mVOLUME $40                                        ;; 0f:535a $f0 $40
    mWait_6                                            ;; 0f:535c $c6
    mVOLUME $20                                        ;; 0f:535d $f0 $20
    mB_3                                               ;; 0f:535f $b3
    mG_6                                               ;; 0f:5360 $76
    mOCTAVE_PLUS_1                                     ;; 0f:5361 $e8
    mD_6                                               ;; 0f:5362 $26
    mE_3                                               ;; 0f:5363 $43
    mVOLUME $40                                        ;; 0f:5364 $f0 $40
    mWait_4                                            ;; 0f:5366 $c4
    mRest_9                                            ;; 0f:5367 $d9
    mVOLUME $20                                        ;; 0f:5368 $f0 $20
    mJUMP .data_0f_5331                                ;; 0f:536a $f1 $31 $53

song11_channel2:
    mINIT2 $c8, data_0f_668c, data_0f_65ef, $c0        ;; 0f:536d $fe $c8 $8c $66 $ef $65 $c0
    mC_3                                               ;; 0f:5374 $03
.data_0f_5375:
    mOCTAVE_3                                          ;; 0f:5375 $e3
    mA_0                                               ;; 0f:5376 $90
    mOCTAVE_PLUS_1                                     ;; 0f:5377 $e8
    mD_0                                               ;; 0f:5378 $20
    mC_0                                               ;; 0f:5379 $00
    mF_4                                               ;; 0f:537a $54
    mC_4                                               ;; 0f:537b $04
    mOCTAVE_MINUS_1                                    ;; 0f:537c $ec
    mB_4                                               ;; 0f:537d $b4
    mG_4                                               ;; 0f:537e $74
    mA_0                                               ;; 0f:537f $90
    mG_0                                               ;; 0f:5380 $70
    mF_0                                               ;; 0f:5381 $50
    mOCTAVE_MINUS_1                                    ;; 0f:5382 $ec
    mA_4                                               ;; 0f:5383 $94
    mG_4                                               ;; 0f:5384 $74
    mOCTAVE_PLUS_1                                     ;; 0f:5385 $e8
    mC_4                                               ;; 0f:5386 $04
    mOCTAVE_MINUS_1                                    ;; 0f:5387 $ec
    mB_4                                               ;; 0f:5388 $b4
    mOCTAVE_PLUS_1                                     ;; 0f:5389 $e8
    mA_2                                               ;; 0f:538a $92
    mOCTAVE_PLUS_1                                     ;; 0f:538b $e8
    mC_2                                               ;; 0f:538c $02
    mOCTAVE_MINUS_1                                    ;; 0f:538d $ec
    mB_2                                               ;; 0f:538e $b2
    mG_2                                               ;; 0f:538f $72
    mOCTAVE_PLUS_1                                     ;; 0f:5390 $e8
    mC_2                                               ;; 0f:5391 $02
    mOCTAVE_MINUS_1                                    ;; 0f:5392 $ec
    mB_2                                               ;; 0f:5393 $b2
    mOCTAVE_PLUS_1                                     ;; 0f:5394 $e8
    mD_0                                               ;; 0f:5395 $20
    mCOUNTER_2 $08                                     ;; 0f:5396 $fa $08
.data_0f_5398:
    mE_0                                               ;; 0f:5398 $40
    mREPEAT_2 .data_0f_5398                            ;; 0f:5399 $f9 $98 $53
    mJUMP .data_0f_5375                                ;; 0f:539c $f1 $75 $53

song11_channel1:
    mINIT1 frequencyDeltaData, data_0f_65fb, $40       ;; 0f:539f $fe $63 $66 $fb $65 $40
    mC_3                                               ;; 0f:53a5 $03
.data_0f_53a6:
    mOCTAVE_3                                          ;; 0f:53a6 $e3
    mE_0                                               ;; 0f:53a7 $40
    mG_0                                               ;; 0f:53a8 $70
    mF_0                                               ;; 0f:53a9 $50
    mOCTAVE_MINUS_1                                    ;; 0f:53aa $ec
    mVOLUME_ENVELOPE data_0f_6611                      ;; 0f:53ab $f0 $11 $66
    mF_13                                              ;; 0f:53ae $5d
    mWait_13                                           ;; 0f:53af $cd
    mA_13                                              ;; 0f:53b0 $9d
    mWait_13                                           ;; 0f:53b1 $cd
    mOCTAVE_PLUS_1                                     ;; 0f:53b2 $e8
    mC_13                                              ;; 0f:53b3 $0d
    mWait_13                                           ;; 0f:53b4 $cd
    mF_9                                               ;; 0f:53b5 $59
    mSTEREOPAN $02                                     ;; 0f:53b6 $f6 $02
    mA_9                                               ;; 0f:53b8 $99
    mGis_9                                             ;; 0f:53b9 $89
    mA_9                                               ;; 0f:53ba $99
    mSTEREOPAN $01                                     ;; 0f:53bb $f6 $01
    mB_9                                               ;; 0f:53bd $b9
    mA_9                                               ;; 0f:53be $99
    mB_9                                               ;; 0f:53bf $b9
    mSTEREOPAN $02                                     ;; 0f:53c0 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:53c2 $e8
    mC_9                                               ;; 0f:53c3 $09
    mOCTAVE_MINUS_1                                    ;; 0f:53c4 $ec
    mB_9                                               ;; 0f:53c5 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:53c6 $e8
    mC_9                                               ;; 0f:53c7 $09
    mSTEREOPAN $03                                     ;; 0f:53c8 $f6 $03
    mVOLUME_ENVELOPE data_0f_65fb                      ;; 0f:53ca $f0 $fb $65
    mOCTAVE_MINUS_1                                    ;; 0f:53cd $ec
    mE_0                                               ;; 0f:53ce $40
    mD_0                                               ;; 0f:53cf $20
    mC_0                                               ;; 0f:53d0 $00
    mVOLUME_ENVELOPE data_0f_6611                      ;; 0f:53d1 $f0 $11 $66
    mOCTAVE_PLUS_1                                     ;; 0f:53d4 $e8
    mC_13                                              ;; 0f:53d5 $0d
    mWait_13                                           ;; 0f:53d6 $cd
    mOCTAVE_MINUS_1                                    ;; 0f:53d7 $ec
    mB_13                                              ;; 0f:53d8 $bd
    mWait_13                                           ;; 0f:53d9 $cd
    mA_13                                              ;; 0f:53da $9d
    mWait_13                                           ;; 0f:53db $cd
    mG_9                                               ;; 0f:53dc $79
    mSTEREOPAN $01                                     ;; 0f:53dd $f6 $01
    mF_9                                               ;; 0f:53df $59
    mOCTAVE_MINUS_1                                    ;; 0f:53e0 $ec
    mB_9                                               ;; 0f:53e1 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:53e2 $e8
    mE_9                                               ;; 0f:53e3 $49
    mSTEREOPAN $02                                     ;; 0f:53e4 $f6 $02
    mC_9                                               ;; 0f:53e6 $09
    mOCTAVE_MINUS_1                                    ;; 0f:53e7 $ec
    mE_9                                               ;; 0f:53e8 $49
    mOCTAVE_PLUS_1                                     ;; 0f:53e9 $e8
    mD_9                                               ;; 0f:53ea $29
    mSTEREOPAN $01                                     ;; 0f:53eb $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:53ed $ec
    mF_9                                               ;; 0f:53ee $59
    mB_9                                               ;; 0f:53ef $b9
    mG_9                                               ;; 0f:53f0 $79
    mSTEREOPAN $03                                     ;; 0f:53f1 $f6 $03
    mVOLUME_ENVELOPE data_0f_65fb                      ;; 0f:53f3 $f0 $fb $65
    mOCTAVE_PLUS_1                                     ;; 0f:53f6 $e8
    mE_2                                               ;; 0f:53f7 $42
    mF_2                                               ;; 0f:53f8 $52
    mG_2                                               ;; 0f:53f9 $72
    mD_2                                               ;; 0f:53fa $22
    mA_2                                               ;; 0f:53fb $92
    mG_2                                               ;; 0f:53fc $72
    mB_0                                               ;; 0f:53fd $b0
    mVOLUME_ENVELOPE data_0f_6611                      ;; 0f:53fe $f0 $11 $66
    mCOUNTER_2 $08                                     ;; 0f:5401 $fa $08
.data_0f_5403:
    mSTEREOPAN $01                                     ;; 0f:5403 $f6 $01
    mA_9                                               ;; 0f:5405 $99
    mD_9                                               ;; 0f:5406 $29
    mE_9                                               ;; 0f:5407 $49
    mSTEREOPAN $03                                     ;; 0f:5408 $f6 $03
    mA_9                                               ;; 0f:540a $99
    mD_9                                               ;; 0f:540b $29
    mE_9                                               ;; 0f:540c $49
    mSTEREOPAN $02                                     ;; 0f:540d $f6 $02
    mA_9                                               ;; 0f:540f $99
    mD_9                                               ;; 0f:5410 $29
    mE_9                                               ;; 0f:5411 $49
    mSTEREOPAN $03                                     ;; 0f:5412 $f6 $03
    mA_9                                               ;; 0f:5414 $99
    mD_9                                               ;; 0f:5415 $29
    mE_9                                               ;; 0f:5416 $49
    mREPEAT_2 .data_0f_5403                            ;; 0f:5417 $f9 $03 $54
    mVOLUME_ENVELOPE data_0f_65fb                      ;; 0f:541a $f0 $fb $65
    mJUMP .data_0f_53a6                                ;; 0f:541d $f1 $a6 $53

song11_channel3:
    mINIT3 data_0f_668c, $20, data_0f_66e2             ;; 0f:5420 $fe $8c $66 $20 $e2 $66
    mC_3                                               ;; 0f:5426 $03
.data_0f_5427:
    mOCTAVE_1                                          ;; 0f:5427 $e1
    mCOUNTER_2 $06                                     ;; 0f:5428 $fa $06
.data_0f_542a:
    mA_9                                               ;; 0f:542a $99
    mOCTAVE_PLUS_1                                     ;; 0f:542b $e8
    mA_9                                               ;; 0f:542c $99
    mOCTAVE_MINUS_1                                    ;; 0f:542d $ec
    mREPEAT_2 .data_0f_542a                            ;; 0f:542e $f9 $2a $54
    mCOUNTER $02                                       ;; 0f:5431 $f3 $02
.data_0f_5433:
    mCOUNTER_2 $0c                                     ;; 0f:5433 $fa $0c
.data_0f_5435:
    mA_9                                               ;; 0f:5435 $99
    mOCTAVE_PLUS_1                                     ;; 0f:5436 $e8
    mA_9                                               ;; 0f:5437 $99
    mOCTAVE_MINUS_1                                    ;; 0f:5438 $ec
    mREPEAT_2 .data_0f_5435                            ;; 0f:5439 $f9 $35 $54
    mJUMPIF $01, .data_0f_5457                         ;; 0f:543c $fb $01 $57 $54
    mF_7                                               ;; 0f:5440 $57
    mRest_12                                           ;; 0f:5441 $dc
    mF_10                                              ;; 0f:5442 $5a
    mRest_14                                           ;; 0f:5443 $de
    mA_10                                              ;; 0f:5444 $9a
    mRest_14                                           ;; 0f:5445 $de
    mA_10                                              ;; 0f:5446 $9a
    mRest_14                                           ;; 0f:5447 $de
    mA_10                                              ;; 0f:5448 $9a
    mRest_14                                           ;; 0f:5449 $de
    mG_7                                               ;; 0f:544a $77
    mRest_12                                           ;; 0f:544b $dc
    mG_10                                              ;; 0f:544c $7a
    mRest_14                                           ;; 0f:544d $de
    mE_10                                              ;; 0f:544e $4a
    mRest_14                                           ;; 0f:544f $de
    mE_10                                              ;; 0f:5450 $4a
    mRest_14                                           ;; 0f:5451 $de
    mE_10                                              ;; 0f:5452 $4a
    mRest_14                                           ;; 0f:5453 $de
    mREPEAT .data_0f_5433                              ;; 0f:5454 $f2 $33 $54
.data_0f_5457:
    mCOUNTER_2 $06                                     ;; 0f:5457 $fa $06
.data_0f_5459:
    mF_9                                               ;; 0f:5459 $59
    mOCTAVE_PLUS_1                                     ;; 0f:545a $e8
    mF_9                                               ;; 0f:545b $59
    mOCTAVE_MINUS_1                                    ;; 0f:545c $ec
    mREPEAT_2 .data_0f_5459                            ;; 0f:545d $f9 $59 $54
    mF_7                                               ;; 0f:5460 $57
    mRest_12                                           ;; 0f:5461 $dc
    mF_10                                              ;; 0f:5462 $5a
    mRest_14                                           ;; 0f:5463 $de
    mE_10                                              ;; 0f:5464 $4a
    mRest_14                                           ;; 0f:5465 $de
    mE_10                                              ;; 0f:5466 $4a
    mRest_14                                           ;; 0f:5467 $de
    mE_10                                              ;; 0f:5468 $4a
    mRest_14                                           ;; 0f:5469 $de
    mC_7                                               ;; 0f:546a $07
    mRest_12                                           ;; 0f:546b $dc
    mC_10                                              ;; 0f:546c $0a
    mRest_14                                           ;; 0f:546d $de
    mOCTAVE_MINUS_1                                    ;; 0f:546e $ec
    mB_10                                              ;; 0f:546f $ba
    mRest_14                                           ;; 0f:5470 $de
    mB_10                                              ;; 0f:5471 $ba
    mRest_14                                           ;; 0f:5472 $de
    mB_10                                              ;; 0f:5473 $ba
    mRest_14                                           ;; 0f:5474 $de
    mOCTAVE_PLUS_1                                     ;; 0f:5475 $e8
    mA_6                                               ;; 0f:5476 $96
    mOCTAVE_PLUS_1                                     ;; 0f:5477 $e8
    mC_9                                               ;; 0f:5478 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5479 $ec
    mA_9                                               ;; 0f:547a $99
    mOCTAVE_PLUS_1                                     ;; 0f:547b $e8
    mC_9                                               ;; 0f:547c $09
    mOCTAVE_MINUS_1                                    ;; 0f:547d $ec
    mA_9                                               ;; 0f:547e $99
    mF_7                                               ;; 0f:547f $57
    mRest_12                                           ;; 0f:5480 $dc
    mF_9                                               ;; 0f:5481 $59
    mOCTAVE_PLUS_1                                     ;; 0f:5482 $e8
    mC_9                                               ;; 0f:5483 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5484 $ec
    mB_9                                               ;; 0f:5485 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5486 $e8
    mC_9                                               ;; 0f:5487 $09
    mD_7                                               ;; 0f:5488 $27
    mRest_12                                           ;; 0f:5489 $dc
    mD_9                                               ;; 0f:548a $29
    mC_9                                               ;; 0f:548b $09
    mOCTAVE_MINUS_1                                    ;; 0f:548c $ec
    mB_9                                               ;; 0f:548d $b9
    mA_9                                               ;; 0f:548e $99
    mG_7                                               ;; 0f:548f $77
    mRest_12                                           ;; 0f:5490 $dc
    mG_9                                               ;; 0f:5491 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5492 $e8
    mD_9                                               ;; 0f:5493 $29
    mCis_9                                             ;; 0f:5494 $19
    mD_9                                               ;; 0f:5495 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5496 $ec
    mA_7                                               ;; 0f:5497 $97
    mRest_12                                           ;; 0f:5498 $dc
    mA_9                                               ;; 0f:5499 $99
    mOCTAVE_PLUS_1                                     ;; 0f:549a $e8
    mE_9                                               ;; 0f:549b $49
    mOCTAVE_MINUS_1                                    ;; 0f:549c $ec
    mA_9                                               ;; 0f:549d $99
    mOCTAVE_PLUS_1                                     ;; 0f:549e $e8
    mE_9                                               ;; 0f:549f $49
    mD_7                                               ;; 0f:54a0 $27
    mRest_12                                           ;; 0f:54a1 $dc
    mD_9                                               ;; 0f:54a2 $29
    mC_9                                               ;; 0f:54a3 $09
    mOCTAVE_MINUS_1                                    ;; 0f:54a4 $ec
    mB_9                                               ;; 0f:54a5 $b9
    mA_9                                               ;; 0f:54a6 $99
    mG_7                                               ;; 0f:54a7 $77
    mRest_12                                           ;; 0f:54a8 $dc
    mG_9                                               ;; 0f:54a9 $79
    mOCTAVE_PLUS_1                                     ;; 0f:54aa $e8
    mG_9                                               ;; 0f:54ab $79
    mOCTAVE_MINUS_1                                    ;; 0f:54ac $ec
    mG_9                                               ;; 0f:54ad $79
    mOCTAVE_PLUS_1                                     ;; 0f:54ae $e8
    mG_9                                               ;; 0f:54af $79
    mG_7                                               ;; 0f:54b0 $77
    mRest_12                                           ;; 0f:54b1 $dc
    mG_9                                               ;; 0f:54b2 $79
    mOCTAVE_MINUS_1                                    ;; 0f:54b3 $ec
    mG_9                                               ;; 0f:54b4 $79
    mD_9                                               ;; 0f:54b5 $29
    mB_9                                               ;; 0f:54b6 $b9
    mA_0                                               ;; 0f:54b7 $90
    mG_0                                               ;; 0f:54b8 $70
    mF_0                                               ;; 0f:54b9 $50
    mG_0                                               ;; 0f:54ba $70
    mA_0                                               ;; 0f:54bb $90
    mG_0                                               ;; 0f:54bc $70
    mF_0                                               ;; 0f:54bd $50
    mG_0                                               ;; 0f:54be $70
    mJUMP .data_0f_5427                                ;; 0f:54bf $f1 $27 $54

song11_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:54c2 $f0 $1b $66
.data_0f_54c5:
    mSTEREOPAN $01                                     ;; 0f:54c5 $f6 $01
    mB_9                                               ;; 0f:54c7 $b9
    mB_9                                               ;; 0f:54c8 $b9
    mB_9                                               ;; 0f:54c9 $b9
    mSTEREOPAN $02                                     ;; 0f:54ca $f6 $02
    mG_9                                               ;; 0f:54cc $79
    mB_9                                               ;; 0f:54cd $b9
    mB_9                                               ;; 0f:54ce $b9
    mSTEREOPAN $03                                     ;; 0f:54cf $f6 $03
    mF_2                                               ;; 0f:54d1 $52
    mJUMP .data_0f_54c5                                ;; 0f:54d2 $f1 $c5 $54

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

song0e_channel2:
    mINIT2 $4c, frequencyDeltaData, data_0f_6613, $c0  ;; 0f:55f3 $fe $4c $63 $66 $13 $66 $c0
    mC_3                                               ;; 0f:55fa $03
    mCOUNTER_2 $0a                                     ;; 0f:55fb $fa $0a
.data_0f_55fd:
    mOCTAVE_4                                          ;; 0f:55fd $e4
    mD_12                                              ;; 0f:55fe $2c
    mOCTAVE_MINUS_1                                    ;; 0f:55ff $ec
    mG_12                                              ;; 0f:5600 $7c
    mG_12                                              ;; 0f:5601 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:5602 $e8
    mD_12                                              ;; 0f:5603 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5604 $ec
    mG_12                                              ;; 0f:5605 $7c
    mG_12                                              ;; 0f:5606 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:5607 $e8
    mD_12                                              ;; 0f:5608 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5609 $ec
    mG_12                                              ;; 0f:560a $7c
    mOCTAVE_PLUS_1                                     ;; 0f:560b $e8
    mC_12                                              ;; 0f:560c $0c
    mOCTAVE_MINUS_1                                    ;; 0f:560d $ec
    mG_12                                              ;; 0f:560e $7c
    mREPEAT_2 .data_0f_55fd                            ;; 0f:560f $f9 $fd $55
    mVOLUME_ENVELOPE data_0f_660f                      ;; 0f:5612 $f0 $0f $66
    mCOUNTER_2 $02                                     ;; 0f:5615 $fa $02
.data_0f_5617:
    mG_9                                               ;; 0f:5617 $79
    mD_12                                              ;; 0f:5618 $2c
    mA_9                                               ;; 0f:5619 $99
    mD_12                                              ;; 0f:561a $2c
    mAis_12                                            ;; 0f:561b $ac
    mD_12                                              ;; 0f:561c $2c
    mG_12                                              ;; 0f:561d $7c
    mD_12                                              ;; 0f:561e $2c
    mA_9                                               ;; 0f:561f $99
    mD_12                                              ;; 0f:5620 $2c
    mAis_9                                             ;; 0f:5621 $a9
    mD_12                                              ;; 0f:5622 $2c
    mOCTAVE_PLUS_1                                     ;; 0f:5623 $e8
    mC_12                                              ;; 0f:5624 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5625 $ec
    mD_12                                              ;; 0f:5626 $2c
    mA_12                                              ;; 0f:5627 $9c
    mD_12                                              ;; 0f:5628 $2c
    mAis_9                                             ;; 0f:5629 $a9
    mDis_12                                            ;; 0f:562a $3c
    mOCTAVE_PLUS_1                                     ;; 0f:562b $e8
    mC_9                                               ;; 0f:562c $09
    mOCTAVE_MINUS_1                                    ;; 0f:562d $ec
    mDis_12                                            ;; 0f:562e $3c
    mAis_12                                            ;; 0f:562f $ac
    mDis_12                                            ;; 0f:5630 $3c
    mA_12                                              ;; 0f:5631 $9c
    mDis_12                                            ;; 0f:5632 $3c
    mG_9                                               ;; 0f:5633 $79
    mDis_12                                            ;; 0f:5634 $3c
    mA_9                                               ;; 0f:5635 $99
    mDis_12                                            ;; 0f:5636 $3c
    mAis_12                                            ;; 0f:5637 $ac
    mDis_12                                            ;; 0f:5638 $3c
    mA_12                                              ;; 0f:5639 $9c
    mDis_12                                            ;; 0f:563a $3c
    mAis_9                                             ;; 0f:563b $a9
    mE_12                                              ;; 0f:563c $4c
    mOCTAVE_PLUS_1                                     ;; 0f:563d $e8
    mC_9                                               ;; 0f:563e $09
    mOCTAVE_MINUS_1                                    ;; 0f:563f $ec
    mE_12                                              ;; 0f:5640 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:5641 $e8
    mD_12                                              ;; 0f:5642 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5643 $ec
    mE_12                                              ;; 0f:5644 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:5645 $e8
    mC_12                                              ;; 0f:5646 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5647 $ec
    mE_12                                              ;; 0f:5648 $4c
    mAis_9                                             ;; 0f:5649 $a9
    mC_12                                              ;; 0f:564a $0c
    mA_9                                               ;; 0f:564b $99
    mC_12                                              ;; 0f:564c $0c
    mG_12                                              ;; 0f:564d $7c
    mC_12                                              ;; 0f:564e $0c
    mA_12                                              ;; 0f:564f $9c
    mC_12                                              ;; 0f:5650 $0c
    mOCTAVE_PLUS_1                                     ;; 0f:5651 $e8
    mD_9                                               ;; 0f:5652 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5653 $ec
    mDis_12                                            ;; 0f:5654 $3c
    mOCTAVE_PLUS_1                                     ;; 0f:5655 $e8
    mC_9                                               ;; 0f:5656 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5657 $ec
    mDis_12                                            ;; 0f:5658 $3c
    mOCTAVE_PLUS_1                                     ;; 0f:5659 $e8
    mDis_12                                            ;; 0f:565a $3c
    mOCTAVE_MINUS_1                                    ;; 0f:565b $ec
    mDis_12                                            ;; 0f:565c $3c
    mOCTAVE_PLUS_1                                     ;; 0f:565d $e8
    mD_12                                              ;; 0f:565e $2c
    mOCTAVE_MINUS_1                                    ;; 0f:565f $ec
    mDis_12                                            ;; 0f:5660 $3c
    mOCTAVE_PLUS_1                                     ;; 0f:5661 $e8
    mC_12                                              ;; 0f:5662 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5663 $ec
    mDis_12                                            ;; 0f:5664 $3c
    mAis_12                                            ;; 0f:5665 $ac
    mDis_12                                            ;; 0f:5666 $3c
    mA_12                                              ;; 0f:5667 $9c
    mDis_12                                            ;; 0f:5668 $3c
    mG_12                                              ;; 0f:5669 $7c
    mOCTAVE_MINUS_1                                    ;; 0f:566a $ec
    mAis_12                                            ;; 0f:566b $ac
    mOCTAVE_PLUS_1                                     ;; 0f:566c $e8
    mF_12                                              ;; 0f:566d $5c
    mOCTAVE_MINUS_1                                    ;; 0f:566e $ec
    mA_12                                              ;; 0f:566f $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5670 $e8
    mREPEAT_2 .data_0f_5617                            ;; 0f:5671 $f9 $17 $56
    mVOLUME_ENVELOPE data_0f_662b                      ;; 0f:5674 $f0 $2b $66
    mG_3                                               ;; 0f:5677 $73
    mWait_9                                            ;; 0f:5678 $c9
    mF_3                                               ;; 0f:5679 $53
    mWait_9                                            ;; 0f:567a $c9
    mDis_3                                             ;; 0f:567b $33
    mWait_9                                            ;; 0f:567c $c9
    mSTEREOPAN $02                                     ;; 0f:567d $f6 $02
    mG_12                                              ;; 0f:567f $7c
    mD_12                                              ;; 0f:5680 $2c
    mG_12                                              ;; 0f:5681 $7c
    mSTEREOPAN $01                                     ;; 0f:5682 $f6 $01
    mA_12                                              ;; 0f:5684 $9c
    mD_12                                              ;; 0f:5685 $2c
    mA_12                                              ;; 0f:5686 $9c
    mSTEREOPAN $02                                     ;; 0f:5687 $f6 $02
    mAis_12                                            ;; 0f:5689 $ac
    mD_12                                              ;; 0f:568a $2c
    mSTEREOPAN $01                                     ;; 0f:568b $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:568d $e8
    mC_12                                              ;; 0f:568e $0c
    mOCTAVE_MINUS_1                                    ;; 0f:568f $ec
    mD_12                                              ;; 0f:5690 $2c
    mSTEREOPAN $03                                     ;; 0f:5691 $f6 $03
    mG_3                                               ;; 0f:5693 $73
    mWait_9                                            ;; 0f:5694 $c9
    mA_3                                               ;; 0f:5695 $93
    mWait_9                                            ;; 0f:5696 $c9
    mA_9                                               ;; 0f:5697 $99
    mAis_12                                            ;; 0f:5698 $ac
    mG_6                                               ;; 0f:5699 $76
    mWait_7                                            ;; 0f:569a $c7
    mSTEREOPAN $02                                     ;; 0f:569b $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:569d $e8
    mD_12                                              ;; 0f:569e $2c
    mOCTAVE_MINUS_1                                    ;; 0f:569f $ec
    mG_12                                              ;; 0f:56a0 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:56a1 $e8
    mD_12                                              ;; 0f:56a2 $2c
    mSTEREOPAN $01                                     ;; 0f:56a3 $f6 $01
    mC_12                                              ;; 0f:56a5 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:56a6 $ec
    mG_12                                              ;; 0f:56a7 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:56a8 $e8
    mC_12                                              ;; 0f:56a9 $0c
    mSTEREOPAN $02                                     ;; 0f:56aa $f6 $02
    mOCTAVE_MINUS_1                                    ;; 0f:56ac $ec
    mAis_12                                            ;; 0f:56ad $ac
    mD_12                                              ;; 0f:56ae $2c
    mSTEREOPAN $01                                     ;; 0f:56af $f6 $01
    mA_12                                              ;; 0f:56b1 $9c
    mD_12                                              ;; 0f:56b2 $2c
    mJUMP song0e_channel2                              ;; 0f:56b3 $f1 $f3 $55

song0e_channel1:
    mINIT1 data_0f_668c, data_0f_6619, $00             ;; 0f:56b6 $fe $8c $66 $19 $66 $00
    mC_3                                               ;; 0f:56bc $03
    mRest_13                                           ;; 0f:56bd $dd
    mCOUNTER $06                                       ;; 0f:56be $f3 $06
.data_0f_56c0:
    mOCTAVE_4                                          ;; 0f:56c0 $e4
    mD_12                                              ;; 0f:56c1 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:56c2 $ec
    mG_12                                              ;; 0f:56c3 $7c
    mG_12                                              ;; 0f:56c4 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:56c5 $e8
    mD_12                                              ;; 0f:56c6 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:56c7 $ec
    mG_12                                              ;; 0f:56c8 $7c
    mG_12                                              ;; 0f:56c9 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:56ca $e8
    mD_12                                              ;; 0f:56cb $2c
    mOCTAVE_MINUS_1                                    ;; 0f:56cc $ec
    mG_12                                              ;; 0f:56cd $7c
    mOCTAVE_PLUS_1                                     ;; 0f:56ce $e8
    mC_12                                              ;; 0f:56cf $0c
    mOCTAVE_MINUS_1                                    ;; 0f:56d0 $ec
    mJUMPIF $01, .data_0f_56d9                         ;; 0f:56d1 $fb $01 $d9 $56
    mG_12                                              ;; 0f:56d5 $7c
    mREPEAT .data_0f_56c0                              ;; 0f:56d6 $f2 $c0 $56
.data_0f_56d9:
    mG_15                                              ;; 0f:56d9 $7f
    mVOLUME_ENVELOPE data_0f_6645                      ;; 0f:56da $f0 $45 $66
    mOCTAVE_2                                          ;; 0f:56dd $e2
    mCOUNTER_2 $02                                     ;; 0f:56de $fa $02
.data_0f_56e0:
    mSTEREOPAN $02                                     ;; 0f:56e0 $f6 $02
    mG_3                                               ;; 0f:56e2 $73
    mWait_9                                            ;; 0f:56e3 $c9
    mSTEREOPAN $01                                     ;; 0f:56e4 $f6 $01
    mG_3                                               ;; 0f:56e6 $73
    mWait_9                                            ;; 0f:56e7 $c9
    mREPEAT_2 .data_0f_56e0                            ;; 0f:56e8 $f9 $e0 $56
    mCOUNTER_2 $02                                     ;; 0f:56eb $fa $02
.data_0f_56ed:
    mSTEREOPAN $02                                     ;; 0f:56ed $f6 $02
    mG_3                                               ;; 0f:56ef $73
    mWait_9                                            ;; 0f:56f0 $c9
    mSTEREOPAN $01                                     ;; 0f:56f1 $f6 $01
    mG_3                                               ;; 0f:56f3 $73
    mWait_9                                            ;; 0f:56f4 $c9
    mSTEREOPAN $02                                     ;; 0f:56f5 $f6 $02
    mDis_3                                             ;; 0f:56f7 $33
    mWait_9                                            ;; 0f:56f8 $c9
    mSTEREOPAN $01                                     ;; 0f:56f9 $f6 $01
    mDis_3                                             ;; 0f:56fb $33
    mWait_9                                            ;; 0f:56fc $c9
    mSTEREOPAN $02                                     ;; 0f:56fd $f6 $02
    mE_3                                               ;; 0f:56ff $43
    mWait_9                                            ;; 0f:5700 $c9
    mSTEREOPAN $01                                     ;; 0f:5701 $f6 $01
    mE_3                                               ;; 0f:5703 $43
    mWait_9                                            ;; 0f:5704 $c9
    mSTEREOPAN $02                                     ;; 0f:5705 $f6 $02
    mDis_3                                             ;; 0f:5707 $33
    mWait_9                                            ;; 0f:5708 $c9
    mSTEREOPAN $01                                     ;; 0f:5709 $f6 $01
    mDis_3                                             ;; 0f:570b $33
    mWait_9                                            ;; 0f:570c $c9
    mREPEAT_2 .data_0f_56ed                            ;; 0f:570d $f9 $ed $56
    mSTEREOPAN $03                                     ;; 0f:5710 $f6 $03
    mVOLUME_ENVELOPE data_0f_6631                      ;; 0f:5712 $f0 $31 $66
    mOCTAVE_PLUS_1                                     ;; 0f:5715 $e8
    mD_3                                               ;; 0f:5716 $23
    mWait_9                                            ;; 0f:5717 $c9
    mC_3                                               ;; 0f:5718 $03
    mWait_9                                            ;; 0f:5719 $c9
    mAis_3                                             ;; 0f:571a $a3
    mWait_9                                            ;; 0f:571b $c9
    mOCTAVE_MINUS_1                                    ;; 0f:571c $ec
    mAis_7                                             ;; 0f:571d $a7
    mA_7                                               ;; 0f:571e $97
    mF_9                                               ;; 0f:571f $59
    mD_9                                               ;; 0f:5720 $29
    mOCTAVE_PLUS_1                                     ;; 0f:5721 $e8
    mD_3                                               ;; 0f:5722 $23
    mWait_9                                            ;; 0f:5723 $c9
    mD_3                                               ;; 0f:5724 $23
    mWait_9                                            ;; 0f:5725 $c9
    mDis_3                                             ;; 0f:5726 $33
    mWait_9                                            ;; 0f:5727 $c9
    mOCTAVE_MINUS_1                                    ;; 0f:5728 $ec
    mDis_7                                             ;; 0f:5729 $37
    mF_7                                               ;; 0f:572a $57
    mG_9                                               ;; 0f:572b $79
    mA_9                                               ;; 0f:572c $99
    mJUMP song0e_channel1                              ;; 0f:572d $f1 $b6 $56

song0e_channel3:
    mINIT3 data_0f_6668, $20, data_0f_66e2             ;; 0f:5730 $fe $68 $66 $20 $e2 $66
    mC_3                                               ;; 0f:5736 $03
.data_0f_5737:
    mOCTAVE_2                                          ;; 0f:5737 $e2
    mG_1                                               ;; 0f:5738 $71
    mWait_6                                            ;; 0f:5739 $c6
    mDis_1                                             ;; 0f:573a $31
    mWait_6                                            ;; 0f:573b $c6
    mF_1                                               ;; 0f:573c $51
    mWait_6                                            ;; 0f:573d $c6
    mOCTAVE_1                                          ;; 0f:573e $e1
    mCOUNTER $1c                                       ;; 0f:573f $f3 $1c
.data_0f_5741:
    mG_12                                              ;; 0f:5741 $7c
    mRest_9                                            ;; 0f:5742 $d9
    mG_12                                              ;; 0f:5743 $7c
    mRest_9                                            ;; 0f:5744 $d9
    mG_12                                              ;; 0f:5745 $7c
    mRest_12                                           ;; 0f:5746 $dc
    mG_12                                              ;; 0f:5747 $7c
    mRest_12                                           ;; 0f:5748 $dc
    mREPEAT .data_0f_5741                              ;; 0f:5749 $f2 $41 $57
    mJUMP .data_0f_5737                                ;; 0f:574c $f1 $37 $57

song0e_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:574f $f0 $1b $66
.data_0f_5752:
    mRest_0                                            ;; 0f:5752 $d0
    mRest_0                                            ;; 0f:5753 $d0
    mRest_2                                            ;; 0f:5754 $d2
    mCOUNTER_2 $0e                                     ;; 0f:5755 $fa $0e
.data_0f_5757:
    mSTEREOPAN $02                                     ;; 0f:5757 $f6 $02
    mF_7                                               ;; 0f:5759 $57
    mF_7                                               ;; 0f:575a $57
    mF_9                                               ;; 0f:575b $59
    mSTEREOPAN $01                                     ;; 0f:575c $f6 $01
    mG_9                                               ;; 0f:575e $79
    mSTEREOPAN $02                                     ;; 0f:575f $f6 $02
    mF_7                                               ;; 0f:5761 $57
    mF_7                                               ;; 0f:5762 $57
    mF_9                                               ;; 0f:5763 $59
    mSTEREOPAN $03                                     ;; 0f:5764 $f6 $03
    mG_12                                              ;; 0f:5766 $7c
    mG_12                                              ;; 0f:5767 $7c
    mREPEAT_2 .data_0f_5757                            ;; 0f:5768 $f9 $57 $57
    mJUMP .data_0f_5752                                ;; 0f:576b $f1 $52 $57

song0f_channel2:
    mINIT2 $78, frequencyDeltaData, data_0f_660d, $c0  ;; 0f:576e $fe $78 $63 $66 $0d $66 $c0
    mC_3                                               ;; 0f:5775 $03
.data_0f_5776:
    mSTEREOPAN $03                                     ;; 0f:5776 $f6 $03
    mOCTAVE_0                                          ;; 0f:5778 $e0
    mE_7                                               ;; 0f:5779 $47
    mE_7                                               ;; 0f:577a $47
    mE_3                                               ;; 0f:577b $43
    mWait_9                                            ;; 0f:577c $c9
    mSTEREOPAN $01                                     ;; 0f:577d $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:577f $e8
    mA_12                                              ;; 0f:5780 $9c
    mB_12                                              ;; 0f:5781 $bc
    mA_12                                              ;; 0f:5782 $9c
    mG_12                                              ;; 0f:5783 $7c
    mF_12                                              ;; 0f:5784 $5c
    mG_12                                              ;; 0f:5785 $7c
    mSTEREOPAN $02                                     ;; 0f:5786 $f6 $02
    mE_4                                               ;; 0f:5788 $44
    mOCTAVE_MINUS_1                                    ;; 0f:5789 $ec
    mA_12                                              ;; 0f:578a $9c
    mOCTAVE_PLUS_1                                     ;; 0f:578b $e8
    mC_12                                              ;; 0f:578c $0c
    mE_12                                              ;; 0f:578d $4c
    mA_12                                              ;; 0f:578e $9c
    mSTEREOPAN $03                                     ;; 0f:578f $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:5791 $ec
    mF_7                                               ;; 0f:5792 $57
    mF_7                                               ;; 0f:5793 $57
    mF_3                                               ;; 0f:5794 $53
    mWait_9                                            ;; 0f:5795 $c9
    mSTEREOPAN $02                                     ;; 0f:5796 $f6 $02
    mOCTAVE_PLUS_2                                     ;; 0f:5798 $e9
    mC_12                                              ;; 0f:5799 $0c
    mD_12                                              ;; 0f:579a $2c
    mC_12                                              ;; 0f:579b $0c
    mOCTAVE_MINUS_1                                    ;; 0f:579c $ec
    mB_12                                              ;; 0f:579d $bc
    mA_12                                              ;; 0f:579e $9c
    mG_12                                              ;; 0f:579f $7c
    mSTEREOPAN $01                                     ;; 0f:57a0 $f6 $01
    mF_4                                               ;; 0f:57a2 $54
    mF_9                                               ;; 0f:57a3 $59
    mA_12                                              ;; 0f:57a4 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:57a5 $e8
    mD_12                                              ;; 0f:57a6 $2c
    mSTEREOPAN $03                                     ;; 0f:57a7 $f6 $03
    mOCTAVE_MINUS_2                                    ;; 0f:57a9 $ed
    mG_7                                               ;; 0f:57aa $77
    mG_7                                               ;; 0f:57ab $77
    mG_3                                               ;; 0f:57ac $73
    mWait_9                                            ;; 0f:57ad $c9
    mSTEREOPAN $01                                     ;; 0f:57ae $f6 $01
    mOCTAVE_PLUS_2                                     ;; 0f:57b0 $e9
    mE_12                                              ;; 0f:57b1 $4c
    mD_12                                              ;; 0f:57b2 $2c
    mC_12                                              ;; 0f:57b3 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:57b4 $ec
    mB_9                                               ;; 0f:57b5 $b9
    mSTEREOPAN $02                                     ;; 0f:57b6 $f6 $02
    mA_12                                              ;; 0f:57b8 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:57b9 $e8
    mE_12                                              ;; 0f:57ba $4c
    mF_12                                              ;; 0f:57bb $5c
    mSTEREOPAN $01                                     ;; 0f:57bc $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:57be $ec
    mB_9                                               ;; 0f:57bf $b9
    mG_12                                              ;; 0f:57c0 $7c
    mF_9                                               ;; 0f:57c1 $59
    mSTEREOPAN $02                                     ;; 0f:57c2 $f6 $02
    mE_12                                              ;; 0f:57c4 $4c
    mD_9                                               ;; 0f:57c5 $29
    mSTEREOPAN $03                                     ;; 0f:57c6 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:57c8 $ec
    mA_7                                               ;; 0f:57c9 $97
    mA_7                                               ;; 0f:57ca $97
    mA_3                                               ;; 0f:57cb $93
    mWait_9                                            ;; 0f:57cc $c9
    mSTEREOPAN $02                                     ;; 0f:57cd $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:57cf $e8
    mE_12                                              ;; 0f:57d0 $4c
    mA_12                                              ;; 0f:57d1 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:57d2 $e8
    mE_9                                               ;; 0f:57d3 $49
    mOCTAVE_MINUS_1                                    ;; 0f:57d4 $ec
    mSTEREOPAN $01                                     ;; 0f:57d5 $f6 $01
    mB_12                                              ;; 0f:57d7 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:57d8 $e8
    mC_12                                              ;; 0f:57d9 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:57da $ec
    mB_12                                              ;; 0f:57db $bc
    mG_12                                              ;; 0f:57dc $7c
    mSTEREOPAN $02                                     ;; 0f:57dd $f6 $02
    mF_12                                              ;; 0f:57df $5c
    mE_12                                              ;; 0f:57e0 $4c
    mD_12                                              ;; 0f:57e1 $2c
    mC_9                                               ;; 0f:57e2 $09
    mSTEREOPAN $01                                     ;; 0f:57e3 $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:57e5 $ec
    mA_12                                              ;; 0f:57e6 $9c
    mG_12                                              ;; 0f:57e7 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:57e8 $e8
    mD_12                                              ;; 0f:57e9 $2c
    mJUMP .data_0f_5776                                ;; 0f:57ea $f1 $76 $57

song0f_channel1:
    mINIT1 frequencyDeltaData, data_0f_6631, $40       ;; 0f:57ed $fe $63 $66 $31 $66 $40
    mC_3                                               ;; 0f:57f3 $03
.data_0f_57f4:
    mRest_6                                            ;; 0f:57f4 $d6
    mOCTAVE_2                                          ;; 0f:57f5 $e2
    mA_9                                               ;; 0f:57f6 $99
    mB_9                                               ;; 0f:57f7 $b9
    mRest_3                                            ;; 0f:57f8 $d3
    mB_12                                              ;; 0f:57f9 $bc
    mRest_9                                            ;; 0f:57fa $d9
    mA_12                                              ;; 0f:57fb $9c
    mRest_9                                            ;; 0f:57fc $d9
    mB_9                                               ;; 0f:57fd $b9
    mRest_9                                            ;; 0f:57fe $d9
    mOCTAVE_PLUS_1                                     ;; 0f:57ff $e8
    mFis_4                                             ;; 0f:5800 $64
    mRest_6                                            ;; 0f:5801 $d6
    mOCTAVE_MINUS_1                                    ;; 0f:5802 $ec
    mB_9                                               ;; 0f:5803 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5804 $e8
    mC_9                                               ;; 0f:5805 $09
    mRest_3                                            ;; 0f:5806 $d3
    mE_12                                              ;; 0f:5807 $4c
    mRest_9                                            ;; 0f:5808 $d9
    mD_12                                              ;; 0f:5809 $2c
    mRest_9                                            ;; 0f:580a $d9
    mC_9                                               ;; 0f:580b $09
    mRest_9                                            ;; 0f:580c $d9
    mC_4                                               ;; 0f:580d $04
    mRest_6                                            ;; 0f:580e $d6
    mC_9                                               ;; 0f:580f $09
    mD_9                                               ;; 0f:5810 $29
    mRest_3                                            ;; 0f:5811 $d3
    mE_12                                              ;; 0f:5812 $4c
    mRest_9                                            ;; 0f:5813 $d9
    mD_12                                              ;; 0f:5814 $2c
    mRest_9                                            ;; 0f:5815 $d9
    mE_9                                               ;; 0f:5816 $49
    mRest_9                                            ;; 0f:5817 $d9
    mD_4                                               ;; 0f:5818 $24
    mRest_6                                            ;; 0f:5819 $d6
    mD_9                                               ;; 0f:581a $29
    mE_9                                               ;; 0f:581b $49
    mRest_3                                            ;; 0f:581c $d3
    mE_12                                              ;; 0f:581d $4c
    mOCTAVE_MINUS_1                                    ;; 0f:581e $ec
    mB_12                                              ;; 0f:581f $bc
    mG_12                                              ;; 0f:5820 $7c
    mOCTAVE_PLUS_1                                     ;; 0f:5821 $e8
    mE_2                                               ;; 0f:5822 $42
    mWait_12                                           ;; 0f:5823 $cc
    mOCTAVE_MINUS_1                                    ;; 0f:5824 $ec
    mG_2                                               ;; 0f:5825 $72
    mOCTAVE_MINUS_1                                    ;; 0f:5826 $ec
    mB_6                                               ;; 0f:5827 $b6
    mOCTAVE_PLUS_1                                     ;; 0f:5828 $e8
    mE_1                                               ;; 0f:5829 $41
    mF_1                                               ;; 0f:582a $51
    mF_1                                               ;; 0f:582b $51
    mG_1                                               ;; 0f:582c $71
    mG_1                                               ;; 0f:582d $71
    mE_1                                               ;; 0f:582e $41
    mE_1                                               ;; 0f:582f $41
    mB_1                                               ;; 0f:5830 $b1
    mB_3                                               ;; 0f:5831 $b3
    mE_3                                               ;; 0f:5832 $43
    mA_1                                               ;; 0f:5833 $91
    mA_1                                               ;; 0f:5834 $91
    mD_3                                               ;; 0f:5835 $23
    mOCTAVE_MINUS_1                                    ;; 0f:5836 $ec
    mB_3                                               ;; 0f:5837 $b3
    mOCTAVE_PLUS_1                                     ;; 0f:5838 $e8
    mG_1                                               ;; 0f:5839 $71
    mE_1                                               ;; 0f:583a $41
    mE_1                                               ;; 0f:583b $41
    mJUMP .data_0f_57f4                                ;; 0f:583c $f1 $f4 $57

song0f_channel3:
    mINIT3 data_0f_6668, $20, data_0f_66d2             ;; 0f:583f $fe $68 $66 $20 $d2 $66
    mC_3                                               ;; 0f:5845 $03
.data_0f_5846:
    mRest_6                                            ;; 0f:5846 $d6
    mOCTAVE_4                                          ;; 0f:5847 $e4
    mD_9                                               ;; 0f:5848 $29
    mE_9                                               ;; 0f:5849 $49
    mRest_3                                            ;; 0f:584a $d3
    mE_12                                              ;; 0f:584b $4c
    mRest_9                                            ;; 0f:584c $d9
    mD_12                                              ;; 0f:584d $2c
    mRest_9                                            ;; 0f:584e $d9
    mE_9                                               ;; 0f:584f $49
    mRest_9                                            ;; 0f:5850 $d9
    mB_4                                               ;; 0f:5851 $b4
    mRest_6                                            ;; 0f:5852 $d6
    mE_9                                               ;; 0f:5853 $49
    mF_9                                               ;; 0f:5854 $59
    mRest_3                                            ;; 0f:5855 $d3
    mA_12                                              ;; 0f:5856 $9c
    mRest_9                                            ;; 0f:5857 $d9
    mG_12                                              ;; 0f:5858 $7c
    mRest_9                                            ;; 0f:5859 $d9
    mF_9                                               ;; 0f:585a $59
    mRest_9                                            ;; 0f:585b $d9
    mF_4                                               ;; 0f:585c $54
    mRest_6                                            ;; 0f:585d $d6
    mF_9                                               ;; 0f:585e $59
    mG_9                                               ;; 0f:585f $79
    mRest_3                                            ;; 0f:5860 $d3
    mB_12                                              ;; 0f:5861 $bc
    mRest_9                                            ;; 0f:5862 $d9
    mA_12                                              ;; 0f:5863 $9c
    mRest_9                                            ;; 0f:5864 $d9
    mB_9                                               ;; 0f:5865 $b9
    mRest_9                                            ;; 0f:5866 $d9
    mG_4                                               ;; 0f:5867 $74
    mRest_6                                            ;; 0f:5868 $d6
    mG_9                                               ;; 0f:5869 $79
    mA_9                                               ;; 0f:586a $99
    mRest_3                                            ;; 0f:586b $d3
    mB_12                                              ;; 0f:586c $bc
    mG_12                                              ;; 0f:586d $7c
    mE_12                                              ;; 0f:586e $4c
    mA_2                                               ;; 0f:586f $92
    mWait_12                                           ;; 0f:5870 $cc
    mOCTAVE_MINUS_1                                    ;; 0f:5871 $ec
    mB_2                                               ;; 0f:5872 $b2
    mE_12                                              ;; 0f:5873 $4c
    mFis_12                                            ;; 0f:5874 $6c
    mG_12                                              ;; 0f:5875 $7c
    mA_12                                              ;; 0f:5876 $9c
    mB_1                                               ;; 0f:5877 $b1
    mOCTAVE_PLUS_1                                     ;; 0f:5878 $e8
    mC_6                                               ;; 0f:5879 $06
    mOCTAVE_MINUS_1                                    ;; 0f:587a $ec
    mB_12                                              ;; 0f:587b $bc
    mA_12                                              ;; 0f:587c $9c
    mG_12                                              ;; 0f:587d $7c
    mF_12                                              ;; 0f:587e $5c
    mOCTAVE_PLUS_1                                     ;; 0f:587f $e8
    mF_3                                               ;; 0f:5880 $53
    mA_3                                               ;; 0f:5881 $93
    mOCTAVE_PLUS_1                                     ;; 0f:5882 $e8
    mD_4                                               ;; 0f:5883 $24
    mCis_12                                            ;; 0f:5884 $1c
    mC_12                                              ;; 0f:5885 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5886 $ec
    mB_3                                               ;; 0f:5887 $b3
    mE_3                                               ;; 0f:5888 $43
    mD_9                                               ;; 0f:5889 $29
    mC_12                                              ;; 0f:588a $0c
    mOCTAVE_MINUS_1                                    ;; 0f:588b $ec
    mB_9                                               ;; 0f:588c $b9
    mOCTAVE_PLUS_1                                     ;; 0f:588d $e8
    mC_12                                              ;; 0f:588e $0c
    mD_12                                              ;; 0f:588f $2c
    mG_12                                              ;; 0f:5890 $7c
    mC_12                                              ;; 0f:5891 $0c
    mD_12                                              ;; 0f:5892 $2c
    mC_12                                              ;; 0f:5893 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5894 $ec
    mB_9                                               ;; 0f:5895 $b9
    mG_12                                              ;; 0f:5896 $7c
    mB_12                                              ;; 0f:5897 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5898 $e8
    mD_12                                              ;; 0f:5899 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:589a $ec
    mB_7                                               ;; 0f:589b $b7
    mOCTAVE_PLUS_1                                     ;; 0f:589c $e8
    mC_7                                               ;; 0f:589d $07
    mOCTAVE_MINUS_1                                    ;; 0f:589e $ec
    mA_3                                               ;; 0f:589f $93
    mWait_9                                            ;; 0f:58a0 $c9
    mOCTAVE_PLUS_1                                     ;; 0f:58a1 $e8
    mE_12                                              ;; 0f:58a2 $4c
    mC_12                                              ;; 0f:58a3 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58a4 $ec
    mA_12                                              ;; 0f:58a5 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:58a6 $e8
    mD_12                                              ;; 0f:58a7 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:58a8 $ec
    mB_12                                              ;; 0f:58a9 $bc
    mG_12                                              ;; 0f:58aa $7c
    mOCTAVE_PLUS_1                                     ;; 0f:58ab $e8
    mC_12                                              ;; 0f:58ac $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58ad $ec
    mA_12                                              ;; 0f:58ae $9c
    mE_12                                              ;; 0f:58af $4c
    mC_12                                              ;; 0f:58b0 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58b1 $ec
    mA_12                                              ;; 0f:58b2 $9c
    mE_12                                              ;; 0f:58b3 $4c
    mOCTAVE_PLUS_2                                     ;; 0f:58b4 $e9
    mE_12                                              ;; 0f:58b5 $4c
    mC_12                                              ;; 0f:58b6 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58b7 $ec
    mA_12                                              ;; 0f:58b8 $9c
    mF_12                                              ;; 0f:58b9 $5c
    mE_6                                               ;; 0f:58ba $46
    mE_12                                              ;; 0f:58bb $4c
    mF_12                                              ;; 0f:58bc $5c
    mE_12                                              ;; 0f:58bd $4c
    mD_12                                              ;; 0f:58be $2c
    mE_3                                               ;; 0f:58bf $43
    mOCTAVE_PLUS_1                                     ;; 0f:58c0 $e8
    mE_4                                               ;; 0f:58c1 $44
    mOCTAVE_MINUS_1                                    ;; 0f:58c2 $ec
    mB_4                                               ;; 0f:58c3 $b4
    mA_9                                               ;; 0f:58c4 $99
    mG_9                                               ;; 0f:58c5 $79
    mF_3                                               ;; 0f:58c6 $53
    mOCTAVE_PLUS_1                                     ;; 0f:58c7 $e8
    mD_12                                              ;; 0f:58c8 $2c
    mC_12                                              ;; 0f:58c9 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58ca $ec
    mB_12                                              ;; 0f:58cb $bc
    mOCTAVE_PLUS_1                                     ;; 0f:58cc $e8
    mC_12                                              ;; 0f:58cd $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58ce $ec
    mA_12                                              ;; 0f:58cf $9c
    mB_12                                              ;; 0f:58d0 $bc
    mG_12                                              ;; 0f:58d1 $7c
    mA_12                                              ;; 0f:58d2 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:58d3 $e8
    mD_12                                              ;; 0f:58d4 $2c
    mC_12                                              ;; 0f:58d5 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58d6 $ec
    mB_12                                              ;; 0f:58d7 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:58d8 $e8
    mC_12                                              ;; 0f:58d9 $0c
    mF_12                                              ;; 0f:58da $5c
    mE_12                                              ;; 0f:58db $4c
    mD_12                                              ;; 0f:58dc $2c
    mC_12                                              ;; 0f:58dd $0c
    mA_12                                              ;; 0f:58de $9c
    mG_12                                              ;; 0f:58df $7c
    mF_12                                              ;; 0f:58e0 $5c
    mE_12                                              ;; 0f:58e1 $4c
    mD_12                                              ;; 0f:58e2 $2c
    mC_12                                              ;; 0f:58e3 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58e4 $ec
    mB_12                                              ;; 0f:58e5 $bc
    mA_12                                              ;; 0f:58e6 $9c
    mG_4                                               ;; 0f:58e7 $74
    mF_12                                              ;; 0f:58e8 $5c
    mE_12                                              ;; 0f:58e9 $4c
    mD_3                                               ;; 0f:58ea $23
    mB_4                                               ;; 0f:58eb $b4
    mOCTAVE_PLUS_1                                     ;; 0f:58ec $e8
    mC_12                                              ;; 0f:58ed $0c
    mOCTAVE_MINUS_1                                    ;; 0f:58ee $ec
    mB_12                                              ;; 0f:58ef $bc
    mG_9                                               ;; 0f:58f0 $79
    mB_12                                              ;; 0f:58f1 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:58f2 $e8
    mD_12                                              ;; 0f:58f3 $2c
    mG_9                                               ;; 0f:58f4 $79
    mOCTAVE_MINUS_1                                    ;; 0f:58f5 $ec
    mB_9                                               ;; 0f:58f6 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:58f7 $e8
    mC_13                                              ;; 0f:58f8 $0d
    mWait_13                                           ;; 0f:58f9 $cd
    mOCTAVE_MINUS_1                                    ;; 0f:58fa $ec
    mA_13                                              ;; 0f:58fb $9d
    mWait_13                                           ;; 0f:58fc $cd
    mE_13                                              ;; 0f:58fd $4d
    mWait_13                                           ;; 0f:58fe $cd
    mOCTAVE_PLUS_1                                     ;; 0f:58ff $e8
    mD_13                                              ;; 0f:5900 $2d
    mWait_13                                           ;; 0f:5901 $cd
    mOCTAVE_MINUS_1                                    ;; 0f:5902 $ec
    mA_13                                              ;; 0f:5903 $9d
    mWait_13                                           ;; 0f:5904 $cd
    mE_13                                              ;; 0f:5905 $4d
    mWait_13                                           ;; 0f:5906 $cd
    mOCTAVE_PLUS_1                                     ;; 0f:5907 $e8
    mE_13                                              ;; 0f:5908 $4d
    mWait_13                                           ;; 0f:5909 $cd
    mOCTAVE_MINUS_1                                    ;; 0f:590a $ec
    mA_13                                              ;; 0f:590b $9d
    mWait_13                                           ;; 0f:590c $cd
    mE_13                                              ;; 0f:590d $4d
    mWait_13                                           ;; 0f:590e $cd
    mOCTAVE_PLUS_1                                     ;; 0f:590f $e8
    mA_13                                              ;; 0f:5910 $9d
    mWait_13                                           ;; 0f:5911 $cd
    mC_13                                              ;; 0f:5912 $0d
    mWait_13                                           ;; 0f:5913 $cd
    mOCTAVE_MINUS_1                                    ;; 0f:5914 $ec
    mA_13                                              ;; 0f:5915 $9d
    mWait_13                                           ;; 0f:5916 $cd
    mOCTAVE_PLUS_1                                     ;; 0f:5917 $e8
    mE_12                                              ;; 0f:5918 $4c
    mC_12                                              ;; 0f:5919 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:591a $ec
    mA_9                                               ;; 0f:591b $99
    mOCTAVE_PLUS_1                                     ;; 0f:591c $e8
    mD_12                                              ;; 0f:591d $2c
    mOCTAVE_MINUS_1                                    ;; 0f:591e $ec
    mB_12                                              ;; 0f:591f $bc
    mG_9                                               ;; 0f:5920 $79
    mOCTAVE_MINUS_1                                    ;; 0f:5921 $ec
    mA_12                                              ;; 0f:5922 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5923 $e8
    mC_12                                              ;; 0f:5924 $0c
    mE_12                                              ;; 0f:5925 $4c
    mA_12                                              ;; 0f:5926 $9c
    mE_12                                              ;; 0f:5927 $4c
    mA_12                                              ;; 0f:5928 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5929 $e8
    mC_12                                              ;; 0f:592a $0c
    mE_12                                              ;; 0f:592b $4c
    mJUMP .data_0f_5846                                ;; 0f:592c $f1 $46 $58

song0f_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:592f $f0 $1b $66
.data_0f_5932:
    mSTEREOPAN $01                                     ;; 0f:5932 $f6 $01
    mG_7                                               ;; 0f:5934 $77
    mG_7                                               ;; 0f:5935 $77
    mG_9                                               ;; 0f:5936 $79
    mSTEREOPAN $02                                     ;; 0f:5937 $f6 $02
    mF_12                                              ;; 0f:5939 $5c
    mA_12                                              ;; 0f:593a $9c
    mF_12                                              ;; 0f:593b $5c
    mF_12                                              ;; 0f:593c $5c
    mSTEREOPAN $03                                     ;; 0f:593d $f6 $03
    mG_14                                              ;; 0f:593f $7e
    mG_14                                              ;; 0f:5940 $7e
    mF_7                                               ;; 0f:5941 $57
    mJUMP .data_0f_5932                                ;; 0f:5942 $f1 $32 $59

song10_channel2:
    mINIT2 $8c, frequencyDeltaData, data_0f_660d, $40  ;; 0f:5945 $fe $8c $63 $66 $0d $66 $40
    mC_2                                               ;; 0f:594c $02

data_0f_594d:
    mCOUNTER_2 $02                                     ;; 0f:594d $fa $02
.data_0f_594f:
    mOCTAVE_3                                          ;; 0f:594f $e3
    mB_9                                               ;; 0f:5950 $b9
    mE_9                                               ;; 0f:5951 $49
    mA_9                                               ;; 0f:5952 $99
    mDis_9                                             ;; 0f:5953 $39
    mG_9                                               ;; 0f:5954 $79
    mOCTAVE_MINUS_1                                    ;; 0f:5955 $ec
    mB_9                                               ;; 0f:5956 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5957 $e8
    mE_9                                               ;; 0f:5958 $49
    mOCTAVE_MINUS_1                                    ;; 0f:5959 $ec
    mAis_9                                             ;; 0f:595a $a9
    mOCTAVE_PLUS_1                                     ;; 0f:595b $e8
    mAis_9                                             ;; 0f:595c $a9
    mE_9                                               ;; 0f:595d $49
    mA_9                                               ;; 0f:595e $99
    mOCTAVE_MINUS_1                                    ;; 0f:595f $ec
    mB_9                                               ;; 0f:5960 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5961 $e8
    mFis_9                                             ;; 0f:5962 $69
    mOCTAVE_MINUS_1                                    ;; 0f:5963 $ec
    mB_9                                               ;; 0f:5964 $b9
    mREPEAT_2 .data_0f_594f                            ;; 0f:5965 $f9 $4f $59
    mCOUNTER_2 $02                                     ;; 0f:5968 $fa $02
.data_0f_596a:
    mOCTAVE_PLUS_1                                     ;; 0f:596a $e8
    mAis_9                                             ;; 0f:596b $a9
    mDis_9                                             ;; 0f:596c $39
    mGis_9                                             ;; 0f:596d $89
    mD_9                                               ;; 0f:596e $29
    mFis_9                                             ;; 0f:596f $69
    mOCTAVE_MINUS_1                                    ;; 0f:5970 $ec
    mAis_9                                             ;; 0f:5971 $a9
    mOCTAVE_PLUS_1                                     ;; 0f:5972 $e8
    mDis_9                                             ;; 0f:5973 $39
    mOCTAVE_MINUS_1                                    ;; 0f:5974 $ec
    mA_9                                               ;; 0f:5975 $99
    mOCTAVE_PLUS_1                                     ;; 0f:5976 $e8
    mA_9                                               ;; 0f:5977 $99
    mDis_9                                             ;; 0f:5978 $39
    mGis_9                                             ;; 0f:5979 $89
    mOCTAVE_MINUS_1                                    ;; 0f:597a $ec
    mAis_9                                             ;; 0f:597b $a9
    mOCTAVE_PLUS_1                                     ;; 0f:597c $e8
    mF_9                                               ;; 0f:597d $59
    mOCTAVE_MINUS_1                                    ;; 0f:597e $ec
    mAis_9                                             ;; 0f:597f $a9
    mREPEAT_2 .data_0f_596a                            ;; 0f:5980 $f9 $6a $59
    mJUMP data_0f_594d                                 ;; 0f:5983 $f1 $4d $59

song10_channel1:
    mINIT1 data_0f_6687, data_0f_6615, $40             ;; 0f:5986 $fe $87 $66 $15 $66 $40
    mC_1                                               ;; 0f:598c $01
    mRest_13                                           ;; 0f:598d $dd
    mJUMP data_0f_594d                                 ;; 0f:598e $f1 $4d $59

song10_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:5991 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:5997 $03
.data_0f_5998:
    mOCTAVE_1                                          ;; 0f:5998 $e1
    mCOUNTER_2 $02                                     ;; 0f:5999 $fa $02
.data_0f_599b:
    mE_9                                               ;; 0f:599b $49
    mRest_6                                            ;; 0f:599c $d6
    mE_9                                               ;; 0f:599d $49
    mRest_6                                            ;; 0f:599e $d6
    mE_10                                              ;; 0f:599f $4a
    mRest_14                                           ;; 0f:59a0 $de
    mE_10                                              ;; 0f:59a1 $4a
    mRest_14                                           ;; 0f:59a2 $de
    mE_9                                               ;; 0f:59a3 $49
    mRest_6                                            ;; 0f:59a4 $d6
    mE_9                                               ;; 0f:59a5 $49
    mRest_6                                            ;; 0f:59a6 $d6
    mREPEAT_2 .data_0f_599b                            ;; 0f:59a7 $f9 $9b $59
    mCOUNTER_2 $02                                     ;; 0f:59aa $fa $02
.data_0f_59ac:
    mDis_9                                             ;; 0f:59ac $39
    mRest_6                                            ;; 0f:59ad $d6
    mDis_9                                             ;; 0f:59ae $39
    mRest_6                                            ;; 0f:59af $d6
    mDis_10                                            ;; 0f:59b0 $3a
    mRest_14                                           ;; 0f:59b1 $de
    mDis_10                                            ;; 0f:59b2 $3a
    mRest_14                                           ;; 0f:59b3 $de
    mDis_9                                             ;; 0f:59b4 $39
    mRest_6                                            ;; 0f:59b5 $d6
    mDis_9                                             ;; 0f:59b6 $39
    mRest_6                                            ;; 0f:59b7 $d6
    mREPEAT_2 .data_0f_59ac                            ;; 0f:59b8 $f9 $ac $59
    mJUMP .data_0f_5998                                ;; 0f:59bb $f1 $98 $59

song10_channel4:
    mSTEREOPAN $03                                     ;; 0f:59be $f6 $03
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:59c0 $f0 $1b $66
.data_0f_59c3:
    mE_4                                               ;; 0f:59c3 $44
    mE_3                                               ;; 0f:59c4 $43
    mRest_9                                            ;; 0f:59c5 $d9
    mF_3                                               ;; 0f:59c6 $53
    mB_9                                               ;; 0f:59c7 $b9
    mB_9                                               ;; 0f:59c8 $b9
    mJUMP .data_0f_59c3                                ;; 0f:59c9 $f1 $c3 $59

song07_channel2:
    mINIT2 $96, frequencyDeltaData, data_0f_661f, $c0  ;; 0f:59cc $fe $96 $63 $66 $1f $66 $c0
    mC_3                                               ;; 0f:59d3 $03
    mOCTAVE_0                                          ;; 0f:59d4 $e0
    mA_9                                               ;; 0f:59d5 $99
    mA_12                                              ;; 0f:59d6 $9c
    mA_12                                              ;; 0f:59d7 $9c
    mA_6                                               ;; 0f:59d8 $96
    mG_9                                               ;; 0f:59d9 $79
    mG_12                                              ;; 0f:59da $7c
    mG_12                                              ;; 0f:59db $7c
    mG_9                                               ;; 0f:59dc $79
    mOCTAVE_PLUS_1                                     ;; 0f:59dd $e8
    mC_6                                               ;; 0f:59de $06
    mOCTAVE_MINUS_1                                    ;; 0f:59df $ec
    mB_9                                               ;; 0f:59e0 $b9
    mA_9                                               ;; 0f:59e1 $99
    mG_9                                               ;; 0f:59e2 $79
    mF_12                                              ;; 0f:59e3 $5c
    mE_12                                              ;; 0f:59e4 $4c
    mF_9                                               ;; 0f:59e5 $59
    mG_12                                              ;; 0f:59e6 $7c
    mF_12                                              ;; 0f:59e7 $5c
    mG_9                                               ;; 0f:59e8 $79
.data_0f_59e9:
    mCOUNTER_2 $02                                     ;; 0f:59e9 $fa $02
.data_0f_59eb:
    mCOUNTER $08                                       ;; 0f:59eb $f3 $08
.data_0f_59ed:
    mA_9                                               ;; 0f:59ed $99
    mREPEAT .data_0f_59ed                              ;; 0f:59ee $f2 $ed $59
    mCOUNTER $08                                       ;; 0f:59f1 $f3 $08
.data_0f_59f3:
    mGis_9                                             ;; 0f:59f3 $89
    mREPEAT .data_0f_59f3                              ;; 0f:59f4 $f2 $f3 $59
    mCOUNTER $08                                       ;; 0f:59f7 $f3 $08
.data_0f_59f9:
    mG_9                                               ;; 0f:59f9 $79
    mREPEAT .data_0f_59f9                              ;; 0f:59fa $f2 $f9 $59
    mCOUNTER $08                                       ;; 0f:59fd $f3 $08
.data_0f_59ff:
    mFis_9                                             ;; 0f:59ff $69
    mREPEAT .data_0f_59ff                              ;; 0f:5a00 $f2 $ff $59
    mREPEAT_2 .data_0f_59eb                            ;; 0f:5a03 $f9 $eb $59
    mCOUNTER $02                                       ;; 0f:5a06 $f3 $02
.data_0f_5a08:
    mCOUNTER_2 $02                                     ;; 0f:5a08 $fa $02
.data_0f_5a0a:
    mF_9                                               ;; 0f:5a0a $59
    mF_9                                               ;; 0f:5a0b $59
    mOCTAVE_PLUS_1                                     ;; 0f:5a0c $e8
    mC_9                                               ;; 0f:5a0d $09
    mOCTAVE_MINUS_1                                    ;; 0f:5a0e $ec
    mF_9                                               ;; 0f:5a0f $59
    mB_9                                               ;; 0f:5a10 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5a11 $e8
    mC_9                                               ;; 0f:5a12 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5a13 $ec
    mREPEAT_2 .data_0f_5a0a                            ;; 0f:5a14 $f9 $0a $5a
    mJUMPIF $01, .data_0f_5a2d                         ;; 0f:5a17 $fb $01 $2d $5a
    mCOUNTER_2 $02                                     ;; 0f:5a1b $fa $02
.data_0f_5a1d:
    mG_9                                               ;; 0f:5a1d $79
    mG_9                                               ;; 0f:5a1e $79
    mOCTAVE_PLUS_1                                     ;; 0f:5a1f $e8
    mD_9                                               ;; 0f:5a20 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5a21 $ec
    mG_9                                               ;; 0f:5a22 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5a23 $e8
    mCis_9                                             ;; 0f:5a24 $19
    mD_9                                               ;; 0f:5a25 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5a26 $ec
    mREPEAT_2 .data_0f_5a1d                            ;; 0f:5a27 $f9 $1d $5a
    mREPEAT .data_0f_5a08                              ;; 0f:5a2a $f2 $08 $5a
.data_0f_5a2d:
    mG_9                                               ;; 0f:5a2d $79
    mG_12                                              ;; 0f:5a2e $7c
    mG_12                                              ;; 0f:5a2f $7c
    mG_9                                               ;; 0f:5a30 $79
    mA_9                                               ;; 0f:5a31 $99
    mA_12                                              ;; 0f:5a32 $9c
    mA_12                                              ;; 0f:5a33 $9c
    mA_9                                               ;; 0f:5a34 $99
    mB_9                                               ;; 0f:5a35 $b9
    mB_12                                              ;; 0f:5a36 $bc
    mB_12                                              ;; 0f:5a37 $bc
    mB_9                                               ;; 0f:5a38 $b9
    mA_9                                               ;; 0f:5a39 $99
    mG_12                                              ;; 0f:5a3a $7c
    mF_12                                              ;; 0f:5a3b $5c
    mE_9                                               ;; 0f:5a3c $49
    mJUMP .data_0f_59e9                                ;; 0f:5a3d $f1 $e9 $59

song07_channel1:
    mINIT1 frequencyDeltaData, data_0f_6613, $40       ;; 0f:5a40 $fe $63 $66 $13 $66 $40
    mC_3                                               ;; 0f:5a46 $03
    mOCTAVE_3                                          ;; 0f:5a47 $e3
    mE_12                                              ;; 0f:5a48 $4c
    mD_12                                              ;; 0f:5a49 $2c
    mC_12                                              ;; 0f:5a4a $0c
    mD_12                                              ;; 0f:5a4b $2c
    mE_12                                              ;; 0f:5a4c $4c
    mRest_7                                            ;; 0f:5a4d $d7
    mD_12                                              ;; 0f:5a4e $2c
    mC_12                                              ;; 0f:5a4f $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5a50 $ec
    mB_12                                              ;; 0f:5a51 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5a52 $e8
    mC_12                                              ;; 0f:5a53 $0c
    mD_12                                              ;; 0f:5a54 $2c
    mRest_12                                           ;; 0f:5a55 $dc
    mE_6                                               ;; 0f:5a56 $46
    mD_9                                               ;; 0f:5a57 $29
    mC_9                                               ;; 0f:5a58 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5a59 $ec
    mB_9                                               ;; 0f:5a5a $b9
    mA_12                                              ;; 0f:5a5b $9c
    mGis_12                                            ;; 0f:5a5c $8c
    mA_9                                               ;; 0f:5a5d $99
    mB_12                                              ;; 0f:5a5e $bc
    mA_12                                              ;; 0f:5a5f $9c
    mB_9                                               ;; 0f:5a60 $b9
.data_0f_5a61:
    mCOUNTER_2 $02                                     ;; 0f:5a61 $fa $02
.data_0f_5a63:
    mCOUNTER $02                                       ;; 0f:5a63 $f3 $02
.data_0f_5a65:
    mSTEREOPAN $02                                     ;; 0f:5a65 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5a67 $e8
    mE_9                                               ;; 0f:5a68 $49
    mOCTAVE_MINUS_1                                    ;; 0f:5a69 $ec
    mE_9                                               ;; 0f:5a6a $49
    mSTEREOPAN $01                                     ;; 0f:5a6b $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5a6d $e8
    mC_9                                               ;; 0f:5a6e $09
    mOCTAVE_MINUS_1                                    ;; 0f:5a6f $ec
    mE_9                                               ;; 0f:5a70 $49
    mREPEAT .data_0f_5a65                              ;; 0f:5a71 $f2 $65 $5a
    mCOUNTER $02                                       ;; 0f:5a74 $f3 $02
.data_0f_5a76:
    mSTEREOPAN $02                                     ;; 0f:5a76 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5a78 $e8
    mE_9                                               ;; 0f:5a79 $49
    mOCTAVE_MINUS_1                                    ;; 0f:5a7a $ec
    mE_9                                               ;; 0f:5a7b $49
    mSTEREOPAN $01                                     ;; 0f:5a7c $f6 $01
    mB_9                                               ;; 0f:5a7e $b9
    mE_9                                               ;; 0f:5a7f $49
    mREPEAT .data_0f_5a76                              ;; 0f:5a80 $f2 $76 $5a
    mCOUNTER $02                                       ;; 0f:5a83 $f3 $02
.data_0f_5a85:
    mSTEREOPAN $02                                     ;; 0f:5a85 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5a87 $e8
    mE_9                                               ;; 0f:5a88 $49
    mOCTAVE_MINUS_1                                    ;; 0f:5a89 $ec
    mE_9                                               ;; 0f:5a8a $49
    mSTEREOPAN $01                                     ;; 0f:5a8b $f6 $01
    mA_9                                               ;; 0f:5a8d $99
    mE_9                                               ;; 0f:5a8e $49
    mREPEAT .data_0f_5a85                              ;; 0f:5a8f $f2 $85 $5a
    mCOUNTER $02                                       ;; 0f:5a92 $f3 $02
.data_0f_5a94:
    mSTEREOPAN $02                                     ;; 0f:5a94 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5a96 $e8
    mD_9                                               ;; 0f:5a97 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5a98 $ec
    mD_9                                               ;; 0f:5a99 $29
    mSTEREOPAN $01                                     ;; 0f:5a9a $f6 $01
    mA_9                                               ;; 0f:5a9c $99
    mD_9                                               ;; 0f:5a9d $29
    mREPEAT .data_0f_5a94                              ;; 0f:5a9e $f2 $94 $5a
    mREPEAT_2 .data_0f_5a63                            ;; 0f:5aa1 $f9 $63 $5a
    mCOUNTER $02                                       ;; 0f:5aa4 $f3 $02
.data_0f_5aa6:
    mCOUNTER_2 $02                                     ;; 0f:5aa6 $fa $02
.data_0f_5aa8:
    mSTEREOPAN $03                                     ;; 0f:5aa8 $f6 $03
    mB_9                                               ;; 0f:5aaa $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5aab $e8
    mC_9                                               ;; 0f:5aac $09
    mSTEREOPAN $02                                     ;; 0f:5aad $f6 $02
    mOCTAVE_MINUS_1                                    ;; 0f:5aaf $ec
    mB_9                                               ;; 0f:5ab0 $b9
    mA_9                                               ;; 0f:5ab1 $99
    mSTEREOPAN $01                                     ;; 0f:5ab2 $f6 $01
    mG_9                                               ;; 0f:5ab4 $79
    mF_9                                               ;; 0f:5ab5 $59
    mREPEAT_2 .data_0f_5aa8                            ;; 0f:5ab6 $f9 $a8 $5a
    mJUMPIF $01, .data_0f_5ad3                         ;; 0f:5ab9 $fb $01 $d3 $5a
    mCOUNTER_2 $02                                     ;; 0f:5abd $fa $02
.data_0f_5abf:
    mSTEREOPAN $03                                     ;; 0f:5abf $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:5ac1 $e8
    mC_9                                               ;; 0f:5ac2 $09
    mD_9                                               ;; 0f:5ac3 $29
    mSTEREOPAN $02                                     ;; 0f:5ac4 $f6 $02
    mC_9                                               ;; 0f:5ac6 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5ac7 $ec
    mB_9                                               ;; 0f:5ac8 $b9
    mSTEREOPAN $01                                     ;; 0f:5ac9 $f6 $01
    mA_9                                               ;; 0f:5acb $99
    mG_9                                               ;; 0f:5acc $79
    mREPEAT_2 .data_0f_5abf                            ;; 0f:5acd $f9 $bf $5a
    mREPEAT .data_0f_5aa6                              ;; 0f:5ad0 $f2 $a6 $5a
.data_0f_5ad3:
    mOCTAVE_MINUS_1                                    ;; 0f:5ad3 $ec
    mSTEREOPAN $03                                     ;; 0f:5ad4 $f6 $03
    mCOUNTER_2 $03                                     ;; 0f:5ad6 $fa $03
.data_0f_5ad8:
    mB_12                                              ;; 0f:5ad8 $bc
    mB_12                                              ;; 0f:5ad9 $bc
    mB_12                                              ;; 0f:5ada $bc
    mB_12                                              ;; 0f:5adb $bc
    mB_9                                               ;; 0f:5adc $b9
    mREPEAT_2 .data_0f_5ad8                            ;; 0f:5add $f9 $d8 $5a
    mOCTAVE_PLUS_2                                     ;; 0f:5ae0 $e9
    mC_9                                               ;; 0f:5ae1 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5ae2 $ec
    mB_12                                              ;; 0f:5ae3 $bc
    mA_12                                              ;; 0f:5ae4 $9c
    mG_9                                               ;; 0f:5ae5 $79
    mJUMP .data_0f_5a61                                ;; 0f:5ae6 $f1 $61 $5a

song07_channel3:
    mINIT3 data_0f_66a9, $20, data_0f_66d2             ;; 0f:5ae9 $fe $a9 $66 $20 $d2 $66
    mC_3                                               ;; 0f:5aef $03
    mOCTAVE_4                                          ;; 0f:5af0 $e4
    mC_12                                              ;; 0f:5af1 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5af2 $ec
    mB_12                                              ;; 0f:5af3 $bc
    mA_12                                              ;; 0f:5af4 $9c
    mB_12                                              ;; 0f:5af5 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5af6 $e8
    mC_12                                              ;; 0f:5af7 $0c
    mRest_7                                            ;; 0f:5af8 $d7
    mOCTAVE_MINUS_1                                    ;; 0f:5af9 $ec
    mB_12                                              ;; 0f:5afa $bc
    mA_12                                              ;; 0f:5afb $9c
    mG_12                                              ;; 0f:5afc $7c
    mA_12                                              ;; 0f:5afd $9c
    mB_12                                              ;; 0f:5afe $bc
    mRest_12                                           ;; 0f:5aff $dc
    mE_6                                               ;; 0f:5b00 $46
    mD_9                                               ;; 0f:5b01 $29
    mC_9                                               ;; 0f:5b02 $09
    mB_9                                               ;; 0f:5b03 $b9
    mA_12                                              ;; 0f:5b04 $9c
    mGis_12                                            ;; 0f:5b05 $8c
    mA_9                                               ;; 0f:5b06 $99
    mB_12                                              ;; 0f:5b07 $bc
    mA_12                                              ;; 0f:5b08 $9c
    mB_9                                               ;; 0f:5b09 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5b0a $e8
.data_0f_5b0b:
    mE_1                                               ;; 0f:5b0b $41
    mOCTAVE_PLUS_1                                     ;; 0f:5b0c $e8
    mD_2                                               ;; 0f:5b0d $22
    mC_6                                               ;; 0f:5b0e $06
    mOCTAVE_MINUS_1                                    ;; 0f:5b0f $ec
    mB_2                                               ;; 0f:5b10 $b2
    mOCTAVE_PLUS_1                                     ;; 0f:5b11 $e8
    mC_6                                               ;; 0f:5b12 $06
    mOCTAVE_MINUS_1                                    ;; 0f:5b13 $ec
    mA_1                                               ;; 0f:5b14 $91
    mC_2                                               ;; 0f:5b15 $02
    mOCTAVE_MINUS_1                                    ;; 0f:5b16 $ec
    mB_9                                               ;; 0f:5b17 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5b18 $e8
    mC_9                                               ;; 0f:5b19 $09
    mD_3                                               ;; 0f:5b1a $23
    mOCTAVE_MINUS_1                                    ;; 0f:5b1b $ec
    mB_3                                               ;; 0f:5b1c $b3
    mOCTAVE_PLUS_1                                     ;; 0f:5b1d $e8
    mC_6                                               ;; 0f:5b1e $06
    mD_6                                               ;; 0f:5b1f $26
    mE_6                                               ;; 0f:5b20 $46
    mG_6                                               ;; 0f:5b21 $76
    mFis_1                                             ;; 0f:5b22 $61
    mB_2                                               ;; 0f:5b23 $b2
    mOCTAVE_PLUS_1                                     ;; 0f:5b24 $e8
    mC_6                                               ;; 0f:5b25 $06
    mOCTAVE_MINUS_1                                    ;; 0f:5b26 $ec
    mA_3                                               ;; 0f:5b27 $93
    mOCTAVE_PLUS_1                                     ;; 0f:5b28 $e8
    mC_2                                               ;; 0f:5b29 $02
    mD_6                                               ;; 0f:5b2a $26
    mOCTAVE_MINUS_1                                    ;; 0f:5b2b $ec
    mB_3                                               ;; 0f:5b2c $b3
    mA_3                                               ;; 0f:5b2d $93
    mB_6                                               ;; 0f:5b2e $b6
    mOCTAVE_PLUS_1                                     ;; 0f:5b2f $e8
    mC_6                                               ;; 0f:5b30 $06
    mD_6                                               ;; 0f:5b31 $26
    mE_6                                               ;; 0f:5b32 $46
    mD_0                                               ;; 0f:5b33 $20
    mOCTAVE_MINUS_1                                    ;; 0f:5b34 $ec
    mJUMP .data_0f_5b0b                                ;; 0f:5b35 $f1 $0b $5b

song07_channel4:
    mRest_1                                            ;; 0f:5b38 $d1
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:5b39 $f0 $1b $66
    mRest_1                                            ;; 0f:5b3c $d1
.data_0f_5b3d:
    mCOUNTER_2 $10                                     ;; 0f:5b3d $fa $10
.data_0f_5b3f:
    mSTEREOPAN $01                                     ;; 0f:5b3f $f6 $01
    mB_9                                               ;; 0f:5b41 $b9
    mB_9                                               ;; 0f:5b42 $b9
    mSTEREOPAN $02                                     ;; 0f:5b43 $f6 $02
    mG_14                                              ;; 0f:5b45 $7e
    mF_14                                              ;; 0f:5b46 $5e
    mRest_7                                            ;; 0f:5b47 $d7
    mREPEAT_2 .data_0f_5b3f                            ;; 0f:5b48 $f9 $3f $5b
    mCOUNTER_2 $06                                     ;; 0f:5b4b $fa $06
.data_0f_5b4d:
    mSTEREOPAN $01                                     ;; 0f:5b4d $f6 $01
    mB_9                                               ;; 0f:5b4f $b9
    mB_9                                               ;; 0f:5b50 $b9
    mSTEREOPAN $03                                     ;; 0f:5b51 $f6 $03
    mG_14                                              ;; 0f:5b53 $7e
    mF_14                                              ;; 0f:5b54 $5e
    mRest_7                                            ;; 0f:5b55 $d7
    mSTEREOPAN $02                                     ;; 0f:5b56 $f6 $02
    mG_14                                              ;; 0f:5b58 $7e
    mF_14                                              ;; 0f:5b59 $5e
    mRest_7                                            ;; 0f:5b5a $d7
    mREPEAT_2 .data_0f_5b4d                            ;; 0f:5b5b $f9 $4d $5b
    mCOUNTER_2 $02                                     ;; 0f:5b5e $fa $02
.data_0f_5b60:
    mSTEREOPAN $02                                     ;; 0f:5b60 $f6 $02
    mB_9                                               ;; 0f:5b62 $b9
    mB_12                                              ;; 0f:5b63 $bc
    mB_12                                              ;; 0f:5b64 $bc
    mG_9                                               ;; 0f:5b65 $79
    mSTEREOPAN $01                                     ;; 0f:5b66 $f6 $01
    mB_9                                               ;; 0f:5b68 $b9
    mB_12                                              ;; 0f:5b69 $bc
    mB_12                                              ;; 0f:5b6a $bc
    mG_9                                               ;; 0f:5b6b $79
    mREPEAT_2 .data_0f_5b60                            ;; 0f:5b6c $f9 $60 $5b
    mJUMP .data_0f_5b3d                                ;; 0f:5b6f $f1 $3d $5b

song0b_channel2:
    mINIT2 $5a, data_0f_6668, data_0f_65f3, $80        ;; 0f:5b72 $fe $5a $68 $66 $f3 $65 $80
    mC_3                                               ;; 0f:5b79 $03
.data_0f_5b7a:
    mOCTAVE_3                                          ;; 0f:5b7a $e3
    mFis_7                                             ;; 0f:5b7b $67
    mF_7                                               ;; 0f:5b7c $57
    mE_7                                               ;; 0f:5b7d $47
    mDis_7                                             ;; 0f:5b7e $37
    mCOUNTER_2 $02                                     ;; 0f:5b7f $fa $02
.data_0f_5b81:
    mCOUNTER $02                                       ;; 0f:5b81 $f3 $02
.data_0f_5b83:
    mJUMPIF $01, .data_0f_5ba6                         ;; 0f:5b83 $fb $01 $a6 $5b
    mOCTAVE_4                                          ;; 0f:5b87 $e4
    mAis_4                                             ;; 0f:5b88 $a4
    mDis_4                                             ;; 0f:5b89 $34
    mC_4                                               ;; 0f:5b8a $04
    mAis_4                                             ;; 0f:5b8b $a4
    mA_2                                               ;; 0f:5b8c $92
.data_0f_5b8d:
    mD_12                                              ;; 0f:5b8d $2c
    mF_12                                              ;; 0f:5b8e $5c
    mB_12                                              ;; 0f:5b8f $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5b90 $e8
    mD_12                                              ;; 0f:5b91 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5b92 $ec
    mB_12                                              ;; 0f:5b93 $bc
    mF_12                                              ;; 0f:5b94 $5c
    mD_12                                              ;; 0f:5b95 $2c
    mF_12                                              ;; 0f:5b96 $5c
    mB_12                                              ;; 0f:5b97 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5b98 $e8
    mD_12                                              ;; 0f:5b99 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:5b9a $ec
    mB_12                                              ;; 0f:5b9b $bc
    mF_12                                              ;; 0f:5b9c $5c
    mREPEAT .data_0f_5b83                              ;; 0f:5b9d $f2 $83 $5b
    mREPEAT_2 .data_0f_5b81                            ;; 0f:5ba0 $f9 $81 $5b
    mJUMP .data_0f_5b7a                                ;; 0f:5ba3 $f1 $7a $5b
.data_0f_5ba6:
    mFis_4                                             ;; 0f:5ba6 $64
    mC_4                                               ;; 0f:5ba7 $04
    mAis_4                                             ;; 0f:5ba8 $a4
    mDis_4                                             ;; 0f:5ba9 $34
    mD_2                                               ;; 0f:5baa $22
    mJUMP .data_0f_5b8d                                ;; 0f:5bab $f1 $8d $5b

song0b_channel1:
    mINIT1 frequencyDeltaData, data_0f_6603, $c0       ;; 0f:5bae $fe $63 $66 $03 $66 $c0
    mC_3                                               ;; 0f:5bb4 $03
.data_0f_5bb5:
    mVOLUME_ENVELOPE data_0f_6603                      ;; 0f:5bb5 $f0 $03 $66
    mOCTAVE_3                                          ;; 0f:5bb8 $e3
    mDis_7                                             ;; 0f:5bb9 $37
    mD_7                                               ;; 0f:5bba $27
    mCis_7                                             ;; 0f:5bbb $17
    mC_7                                               ;; 0f:5bbc $07
    mVOLUME_ENVELOPE data_0f_65e7                      ;; 0f:5bbd $f0 $e7 $65
    mCOUNTER_2 $04                                     ;; 0f:5bc0 $fa $04
.data_0f_5bc2:
    mCOUNTER $04                                       ;; 0f:5bc2 $f3 $04
.data_0f_5bc4:
    mSTEREOPAN $02                                     ;; 0f:5bc4 $f6 $02
    mC_12                                              ;; 0f:5bc6 $0c
    mDis_12                                            ;; 0f:5bc7 $3c
    mFis_12                                            ;; 0f:5bc8 $6c
    mSTEREOPAN $01                                     ;; 0f:5bc9 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5bcb $e8
    mC_12                                              ;; 0f:5bcc $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5bcd $ec
    mFis_12                                            ;; 0f:5bce $6c
    mDis_12                                            ;; 0f:5bcf $3c
    mREPEAT .data_0f_5bc4                              ;; 0f:5bd0 $f2 $c4 $5b
    mCOUNTER $04                                       ;; 0f:5bd3 $f3 $04
.data_0f_5bd5:
    mSTEREOPAN $02                                     ;; 0f:5bd5 $f6 $02
    mOCTAVE_MINUS_1                                    ;; 0f:5bd7 $ec
    mB_12                                              ;; 0f:5bd8 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5bd9 $e8
    mD_12                                              ;; 0f:5bda $2c
    mF_12                                              ;; 0f:5bdb $5c
    mSTEREOPAN $01                                     ;; 0f:5bdc $f6 $01
    mB_12                                              ;; 0f:5bde $bc
    mF_12                                              ;; 0f:5bdf $5c
    mD_12                                              ;; 0f:5be0 $2c
    mREPEAT .data_0f_5bd5                              ;; 0f:5be1 $f2 $d5 $5b
    mREPEAT_2 .data_0f_5bc2                            ;; 0f:5be4 $f9 $c2 $5b
    mJUMP .data_0f_5bb5                                ;; 0f:5be7 $f1 $b5 $5b

song0b_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:5bea $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:5bf0 $03
.data_0f_5bf1:
    mOCTAVE_2                                          ;; 0f:5bf1 $e2
    mC_7                                               ;; 0f:5bf2 $07
    mOCTAVE_MINUS_1                                    ;; 0f:5bf3 $ec
    mB_7                                               ;; 0f:5bf4 $b7
    mAis_7                                             ;; 0f:5bf5 $a7
    mA_7                                               ;; 0f:5bf6 $97
    mCOUNTER $04                                       ;; 0f:5bf7 $f3 $04
.data_0f_5bf9:
    mC_12                                              ;; 0f:5bf9 $0c
    mRest_9                                            ;; 0f:5bfa $d9
    mC_12                                              ;; 0f:5bfb $0c
    mRest_3                                            ;; 0f:5bfc $d3
    mC_12                                              ;; 0f:5bfd $0c
    mRest_9                                            ;; 0f:5bfe $d9
    mC_12                                              ;; 0f:5bff $0c
    mRest_3                                            ;; 0f:5c00 $d3
    mOCTAVE_MINUS_1                                    ;; 0f:5c01 $ec
    mB_12                                              ;; 0f:5c02 $bc
    mRest_9                                            ;; 0f:5c03 $d9
    mB_12                                              ;; 0f:5c04 $bc
    mRest_3                                            ;; 0f:5c05 $d3
    mB_12                                              ;; 0f:5c06 $bc
    mRest_9                                            ;; 0f:5c07 $d9
    mB_12                                              ;; 0f:5c08 $bc
    mRest_3                                            ;; 0f:5c09 $d3
    mOCTAVE_PLUS_1                                     ;; 0f:5c0a $e8
    mREPEAT .data_0f_5bf9                              ;; 0f:5c0b $f2 $f9 $5b
    mJUMP .data_0f_5bf1                                ;; 0f:5c0e $f1 $f1 $5b

song0b_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:5c11 $f0 $1b $66
.data_0f_5c14:
    mSTEREOPAN $03                                     ;; 0f:5c14 $f6 $03
    mRest_4                                            ;; 0f:5c16 $d4
    mRest_7                                            ;; 0f:5c17 $d7
    mG_12                                              ;; 0f:5c18 $7c
    mG_12                                              ;; 0f:5c19 $7c
    mG_12                                              ;; 0f:5c1a $7c
    mCOUNTER_2 $10                                     ;; 0f:5c1b $fa $10
.data_0f_5c1d:
    mSTEREOPAN $01                                     ;; 0f:5c1d $f6 $01
    mF_7                                               ;; 0f:5c1f $57
    mF_7                                               ;; 0f:5c20 $57
    mSTEREOPAN $02                                     ;; 0f:5c21 $f6 $02
    mG_14                                              ;; 0f:5c23 $7e
    mA_10                                              ;; 0f:5c24 $9a
    mRest_6                                            ;; 0f:5c25 $d6
    mREPEAT_2 .data_0f_5c1d                            ;; 0f:5c26 $f9 $1d $5c
    mJUMP .data_0f_5c14                                ;; 0f:5c29 $f1 $14 $5c

song12_channel2:
    mINIT2 $78, data_0f_6668, data_0f_6641, $80        ;; 0f:5c2c $fe $78 $68 $66 $41 $66 $80
    mC_3                                               ;; 0f:5c33 $03
.data_0f_5c34:
    mOCTAVE_3                                          ;; 0f:5c34 $e3
    mG_9                                               ;; 0f:5c35 $79
    mFis_9                                             ;; 0f:5c36 $69
    mG_9                                               ;; 0f:5c37 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5c38 $e8
    mC_6                                               ;; 0f:5c39 $06
    mOCTAVE_MINUS_1                                    ;; 0f:5c3a $ec
    mB_9                                               ;; 0f:5c3b $b9
    mA_9                                               ;; 0f:5c3c $99
    mB_9                                               ;; 0f:5c3d $b9
    mE_9                                               ;; 0f:5c3e $49
    mDis_9                                             ;; 0f:5c3f $39
    mE_9                                               ;; 0f:5c40 $49
    mF_6                                               ;; 0f:5c41 $56
    mE_9                                               ;; 0f:5c42 $49
    mD_9                                               ;; 0f:5c43 $29
    mC_9                                               ;; 0f:5c44 $09
    mOCTAVE_PLUS_1                                     ;; 0f:5c45 $e8
    mC_9                                               ;; 0f:5c46 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5c47 $ec
    mG_9                                               ;; 0f:5c48 $79
    mF_9                                               ;; 0f:5c49 $59
    mE_6                                               ;; 0f:5c4a $46
    mD_9                                               ;; 0f:5c4b $29
    mC_9                                               ;; 0f:5c4c $09
    mOCTAVE_MINUS_1                                    ;; 0f:5c4d $ec
    mB_9                                               ;; 0f:5c4e $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5c4f $e8
    mG_6                                               ;; 0f:5c50 $76
    mOCTAVE_PLUS_1                                     ;; 0f:5c51 $e8
    mC_9                                               ;; 0f:5c52 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5c53 $ec
    mA_4                                               ;; 0f:5c54 $94
    mWait_6                                            ;; 0f:5c55 $c6
    mG_6                                               ;; 0f:5c56 $76
    mOCTAVE_PLUS_1                                     ;; 0f:5c57 $e8
    mC_9                                               ;; 0f:5c58 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5c59 $ec
    mA_6                                               ;; 0f:5c5a $96
    mG_9                                               ;; 0f:5c5b $79
    mF_9                                               ;; 0f:5c5c $59
    mD_9                                               ;; 0f:5c5d $29
    mE_9                                               ;; 0f:5c5e $49
    mDis_9                                             ;; 0f:5c5f $39
    mE_9                                               ;; 0f:5c60 $49
    mA_4                                               ;; 0f:5c61 $94
    mF_6                                               ;; 0f:5c62 $56
    mE_9                                               ;; 0f:5c63 $49
    mF_9                                               ;; 0f:5c64 $59
    mG_9                                               ;; 0f:5c65 $79
    mD_6                                               ;; 0f:5c66 $26
    mE_9                                               ;; 0f:5c67 $49
    mD_9                                               ;; 0f:5c68 $29
    mC_9                                               ;; 0f:5c69 $09
    mB_6                                               ;; 0f:5c6a $b6
    mOCTAVE_PLUS_1                                     ;; 0f:5c6b $e8
    mC_9                                               ;; 0f:5c6c $09
    mOCTAVE_MINUS_1                                    ;; 0f:5c6d $ec
    mA_4                                               ;; 0f:5c6e $94
    mWait_6                                            ;; 0f:5c6f $c6
    mCOUNTER $02                                       ;; 0f:5c70 $f3 $02
.data_0f_5c72:
    mOCTAVE_PLUS_1                                     ;; 0f:5c72 $e8
    mE_9                                               ;; 0f:5c73 $49
    mD_9                                               ;; 0f:5c74 $29
    mC_9                                               ;; 0f:5c75 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5c76 $ec
    mB_6                                               ;; 0f:5c77 $b6
    mG_9                                               ;; 0f:5c78 $79
    mFis_9                                             ;; 0f:5c79 $69
    mG_9                                               ;; 0f:5c7a $79
    mA_9                                               ;; 0f:5c7b $99
    mGis_9                                             ;; 0f:5c7c $89
    mA_9                                               ;; 0f:5c7d $99
    mB_6                                               ;; 0f:5c7e $b6
    mJUMPIF $01, .data_0f_5c97                         ;; 0f:5c7f $fb $01 $97 $5c
    mG_9                                               ;; 0f:5c83 $79
    mD_9                                               ;; 0f:5c84 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5c85 $ec
    mB_9                                               ;; 0f:5c86 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5c87 $e8
    mC_6                                               ;; 0f:5c88 $06
    mG_9                                               ;; 0f:5c89 $79
    mF_6                                               ;; 0f:5c8a $56
    mE_9                                               ;; 0f:5c8b $49
    mD_9                                               ;; 0f:5c8c $29
    mE_9                                               ;; 0f:5c8d $49
    mC_6                                               ;; 0f:5c8e $06
    mOCTAVE_MINUS_1                                    ;; 0f:5c8f $ec
    mG_9                                               ;; 0f:5c90 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5c91 $e8
    mG_3                                               ;; 0f:5c92 $73
    mWait_9                                            ;; 0f:5c93 $c9
    mREPEAT .data_0f_5c72                              ;; 0f:5c94 $f2 $72 $5c
.data_0f_5c97:
    mB_9                                               ;; 0f:5c97 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5c98 $e8
    mC_9                                               ;; 0f:5c99 $09
    mD_9                                               ;; 0f:5c9a $29
    mE_3                                               ;; 0f:5c9b $43
    mC_3                                               ;; 0f:5c9c $03
    mOCTAVE_MINUS_1                                    ;; 0f:5c9d $ec
    mG_3                                               ;; 0f:5c9e $73
    mF_3                                               ;; 0f:5c9f $53
    mJUMP .data_0f_5c34                                ;; 0f:5ca0 $f1 $34 $5c

song12_channel1:
    mINIT1 data_0f_6668, data_0f_6631, $80             ;; 0f:5ca3 $fe $68 $66 $31 $66 $80
    mC_2                                               ;; 0f:5ca9 $02
    mOCTAVE_2                                          ;; 0f:5caa $e2
    mCOUNTER_2 $04                                     ;; 0f:5cab $fa $04
.data_0f_5cad:
    mG_4                                               ;; 0f:5cad $74
    mF_3                                               ;; 0f:5cae $53
    mWait_9                                            ;; 0f:5caf $c9
    mE_4                                               ;; 0f:5cb0 $44
    mF_3                                               ;; 0f:5cb1 $53
    mWait_9                                            ;; 0f:5cb2 $c9
    mREPEAT_2 .data_0f_5cad                            ;; 0f:5cb3 $f9 $ad $5c
    mA_4                                               ;; 0f:5cb6 $94
    mB_3                                               ;; 0f:5cb7 $b3
    mWait_9                                            ;; 0f:5cb8 $c9
    mOCTAVE_PLUS_1                                     ;; 0f:5cb9 $e8
    mC_4                                               ;; 0f:5cba $04
    mOCTAVE_MINUS_1                                    ;; 0f:5cbb $ec
    mG_3                                               ;; 0f:5cbc $73
    mWait_9                                            ;; 0f:5cbd $c9
    mE_4                                               ;; 0f:5cbe $44
    mF_3                                               ;; 0f:5cbf $53
    mWait_9                                            ;; 0f:5cc0 $c9
    mG_4                                               ;; 0f:5cc1 $74
    mD_3                                               ;; 0f:5cc2 $23
    mWait_9                                            ;; 0f:5cc3 $c9
    mA_4                                               ;; 0f:5cc4 $94
    mB_3                                               ;; 0f:5cc5 $b3
    mWait_9                                            ;; 0f:5cc6 $c9
    mOCTAVE_PLUS_1                                     ;; 0f:5cc7 $e8
    mC_4                                               ;; 0f:5cc8 $04
    mOCTAVE_MINUS_1                                    ;; 0f:5cc9 $ec
    mG_3                                               ;; 0f:5cca $73
    mWait_9                                            ;; 0f:5ccb $c9
    mVOLUME_ENVELOPE data_0f_663d                      ;; 0f:5ccc $f0 $3d $66
    mOCTAVE_PLUS_1                                     ;; 0f:5ccf $e8
    mG_3                                               ;; 0f:5cd0 $73
    mF_3                                               ;; 0f:5cd1 $53
    mE_3                                               ;; 0f:5cd2 $43
    mD_3                                               ;; 0f:5cd3 $23
    mJUMP song12_channel1                              ;; 0f:5cd4 $f1 $a3 $5c

song12_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:5cd7 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:5cdd $03
.data_0f_5cde:
    mCOUNTER_2 $04                                     ;; 0f:5cde $fa $04
.data_0f_5ce0:
    mSTEREOPAN $03                                     ;; 0f:5ce0 $f6 $03
    mOCTAVE_1                                          ;; 0f:5ce2 $e1
    mC_9                                               ;; 0f:5ce3 $09
    mG_9                                               ;; 0f:5ce4 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5ce5 $e8
    mC_9                                               ;; 0f:5ce6 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5ce7 $ec
    mF_6                                               ;; 0f:5ce8 $56
    mSTEREOPAN $01                                     ;; 0f:5ce9 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5ceb $e8
    mF_9                                               ;; 0f:5cec $59
    mE_9                                               ;; 0f:5ced $49
    mF_9                                               ;; 0f:5cee $59
    mSTEREOPAN $03                                     ;; 0f:5cef $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:5cf1 $ec
    mC_9                                               ;; 0f:5cf2 $09
    mG_9                                               ;; 0f:5cf3 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5cf4 $e8
    mC_9                                               ;; 0f:5cf5 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5cf6 $ec
    mF_6                                               ;; 0f:5cf7 $56
    mSTEREOPAN $01                                     ;; 0f:5cf8 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5cfa $e8
    mF_9                                               ;; 0f:5cfb $59
    mE_9                                               ;; 0f:5cfc $49
    mD_9                                               ;; 0f:5cfd $29
    mREPEAT_2 .data_0f_5ce0                            ;; 0f:5cfe $f9 $e0 $5c
    mCOUNTER $02                                       ;; 0f:5d01 $f3 $02
.data_0f_5d03:
    mCOUNTER_2 $02                                     ;; 0f:5d03 $fa $02
.data_0f_5d05:
    mSTEREOPAN $03                                     ;; 0f:5d05 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:5d07 $ec
    mF_9                                               ;; 0f:5d08 $59
    mOCTAVE_PLUS_1                                     ;; 0f:5d09 $e8
    mC_9                                               ;; 0f:5d0a $09
    mF_9                                               ;; 0f:5d0b $59
    mOCTAVE_MINUS_1                                    ;; 0f:5d0c $ec
    mG_6                                               ;; 0f:5d0d $76
    mSTEREOPAN $01                                     ;; 0f:5d0e $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5d10 $e8
    mD_9                                               ;; 0f:5d11 $29
    mG_9                                               ;; 0f:5d12 $79
    mB_9                                               ;; 0f:5d13 $b9
    mREPEAT_2 .data_0f_5d05                            ;; 0f:5d14 $f9 $05 $5d
    mJUMPIF $01, .data_0f_5d3c                         ;; 0f:5d17 $fb $01 $3c $5d
    mSTEREOPAN $03                                     ;; 0f:5d1b $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:5d1d $ec
    mC_9                                               ;; 0f:5d1e $09
    mG_9                                               ;; 0f:5d1f $79
    mOCTAVE_PLUS_1                                     ;; 0f:5d20 $e8
    mC_9                                               ;; 0f:5d21 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5d22 $ec
    mF_6                                               ;; 0f:5d23 $56
    mSTEREOPAN $01                                     ;; 0f:5d24 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5d26 $e8
    mF_9                                               ;; 0f:5d27 $59
    mE_9                                               ;; 0f:5d28 $49
    mD_9                                               ;; 0f:5d29 $29
    mSTEREOPAN $03                                     ;; 0f:5d2a $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:5d2c $ec
    mC_9                                               ;; 0f:5d2d $09
    mG_9                                               ;; 0f:5d2e $79
    mOCTAVE_PLUS_1                                     ;; 0f:5d2f $e8
    mC_9                                               ;; 0f:5d30 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5d31 $ec
    mG_6                                               ;; 0f:5d32 $76
    mSTEREOPAN $01                                     ;; 0f:5d33 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5d35 $e8
    mD_9                                               ;; 0f:5d36 $29
    mG_9                                               ;; 0f:5d37 $79
    mB_9                                               ;; 0f:5d38 $b9
    mREPEAT .data_0f_5d03                              ;; 0f:5d39 $f2 $03 $5d
.data_0f_5d3c:
    mC_9                                               ;; 0f:5d3c $09
    mRest_4                                            ;; 0f:5d3d $d4
    mOCTAVE_MINUS_1                                    ;; 0f:5d3e $ec
    mF_9                                               ;; 0f:5d3f $59
    mRest_4                                            ;; 0f:5d40 $d4
    mE_9                                               ;; 0f:5d41 $49
    mRest_4                                            ;; 0f:5d42 $d4
    mD_9                                               ;; 0f:5d43 $29
    mRest_4                                            ;; 0f:5d44 $d4
    mJUMP .data_0f_5cde                                ;; 0f:5d45 $f1 $de $5c

song12_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:5d48 $f0 $1b $66
.data_0f_5d4b:
    mCOUNTER_2 $0e                                     ;; 0f:5d4b $fa $0e
.data_0f_5d4d:
    mSTEREOPAN $01                                     ;; 0f:5d4d $f6 $01
    mRest_6                                            ;; 0f:5d4f $d6
    mG_4                                               ;; 0f:5d50 $74
    mSTEREOPAN $02                                     ;; 0f:5d51 $f6 $02
    mB_9                                               ;; 0f:5d53 $b9
    mSTEREOPAN $03                                     ;; 0f:5d54 $f6 $03
    mG_9                                               ;; 0f:5d56 $79
    mSTEREOPAN $02                                     ;; 0f:5d57 $f6 $02
    mB_9                                               ;; 0f:5d59 $b9
    mREPEAT_2 .data_0f_5d4d                            ;; 0f:5d5a $f9 $4d $5d
    mSTEREOPAN $01                                     ;; 0f:5d5d $f6 $01
    mB_3                                               ;; 0f:5d5f $b3
    mB_3                                               ;; 0f:5d60 $b3
    mB_3                                               ;; 0f:5d61 $b3
    mB_3                                               ;; 0f:5d62 $b3
    mJUMP .data_0f_5d4b                                ;; 0f:5d63 $f1 $4b $5d

song00_channel2:
    mINIT2 $7e, frequencyDeltaData, data_0f_6621, $40  ;; 0f:5d66 $fe $7e $63 $66 $21 $66 $40
    mC_3                                               ;; 0f:5d6d $03
    mOCTAVE_2                                          ;; 0f:5d6e $e2
    mA_12                                              ;; 0f:5d6f $9c
    mB_12                                              ;; 0f:5d70 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5d71 $e8
    mC_6                                               ;; 0f:5d72 $06
    mD_6                                               ;; 0f:5d73 $26
    mOCTAVE_MINUS_1                                    ;; 0f:5d74 $ec
.data_0f_5d75:
    mA_3                                               ;; 0f:5d75 $93
    mOCTAVE_PLUS_1                                     ;; 0f:5d76 $e8
    mE_4                                               ;; 0f:5d77 $44
    mE_12                                              ;; 0f:5d78 $4c
    mDis_12                                            ;; 0f:5d79 $3c
    mD_3                                               ;; 0f:5d7a $23
    mF_6                                               ;; 0f:5d7b $56
    mG_6                                               ;; 0f:5d7c $76
    mE_6                                               ;; 0f:5d7d $46
    mC_6                                               ;; 0f:5d7e $06
    mOCTAVE_MINUS_1                                    ;; 0f:5d7f $ec
    mA_6                                               ;; 0f:5d80 $96
    mOCTAVE_PLUS_1                                     ;; 0f:5d81 $e8
    mC_9                                               ;; 0f:5d82 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5d83 $ec
    mB_9                                               ;; 0f:5d84 $b9
    mAis_3                                             ;; 0f:5d85 $a3
    mOCTAVE_PLUS_1                                     ;; 0f:5d86 $e8
    mF_4                                               ;; 0f:5d87 $54
    mF_12                                              ;; 0f:5d88 $5c
    mD_12                                              ;; 0f:5d89 $2c
    mE_2                                               ;; 0f:5d8a $42
    mD_9                                               ;; 0f:5d8b $29
    mE_9                                               ;; 0f:5d8c $49
    mF_3                                               ;; 0f:5d8d $53
    mE_9                                               ;; 0f:5d8e $49
    mD_9                                               ;; 0f:5d8f $29
    mC_9                                               ;; 0f:5d90 $09
    mD_9                                               ;; 0f:5d91 $29
    mA_4                                               ;; 0f:5d92 $94
    mG_12                                              ;; 0f:5d93 $7c
    mA_12                                              ;; 0f:5d94 $9c
    mE_9                                               ;; 0f:5d95 $49
    mC_9                                               ;; 0f:5d96 $09
    mOCTAVE_MINUS_1                                    ;; 0f:5d97 $ec
    mA_9                                               ;; 0f:5d98 $99
    mE_9                                               ;; 0f:5d99 $49
    mOCTAVE_PLUS_1                                     ;; 0f:5d9a $e8
    mG_4                                               ;; 0f:5d9b $74
    mF_12                                              ;; 0f:5d9c $5c
    mG_12                                              ;; 0f:5d9d $7c
    mF_3                                               ;; 0f:5d9e $53
    mOCTAVE_MINUS_1                                    ;; 0f:5d9f $ec
    mCOUNTER_2 $02                                     ;; 0f:5da0 $fa $02
.data_0f_5da2:
    mA_9                                               ;; 0f:5da2 $99
    mAis_9                                             ;; 0f:5da3 $a9
    mG_9                                               ;; 0f:5da4 $79
    mA_9                                               ;; 0f:5da5 $99
    mAis_9                                             ;; 0f:5da6 $a9
    mG_9                                               ;; 0f:5da7 $79
    mA_9                                               ;; 0f:5da8 $99
    mE_9                                               ;; 0f:5da9 $49
    mOCTAVE_PLUS_1                                     ;; 0f:5daa $e8
    mCis_9                                             ;; 0f:5dab $19
    mD_9                                               ;; 0f:5dac $29
    mE_12                                              ;; 0f:5dad $4c
    mCis_12                                            ;; 0f:5dae $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5daf $ec
    mAis_12                                            ;; 0f:5db0 $ac
    mA_12                                              ;; 0f:5db1 $9c
    mG_12                                              ;; 0f:5db2 $7c
    mF_12                                              ;; 0f:5db3 $5c
    mE_12                                              ;; 0f:5db4 $4c
    mD_12                                              ;; 0f:5db5 $2c
    mSTEREOPAN $02                                     ;; 0f:5db6 $f6 $02
    mF_12                                              ;; 0f:5db8 $5c
    mE_12                                              ;; 0f:5db9 $4c
    mSTEREOPAN $01                                     ;; 0f:5dba $f6 $01
    mF_12                                              ;; 0f:5dbc $5c
    mE_12                                              ;; 0f:5dbd $4c
    mSTEREOPAN $03                                     ;; 0f:5dbe $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:5dc0 $e8
    mF_9                                               ;; 0f:5dc1 $59
    mG_9                                               ;; 0f:5dc2 $79
    mE_9                                               ;; 0f:5dc3 $49
    mD_9                                               ;; 0f:5dc4 $29
    mCis_12                                            ;; 0f:5dc5 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5dc6 $ec
    mA_12                                              ;; 0f:5dc7 $9c
    mE_12                                              ;; 0f:5dc8 $4c
    mD_12                                              ;; 0f:5dc9 $2c
    mCis_12                                            ;; 0f:5dca $1c
    mD_12                                              ;; 0f:5dcb $2c
    mG_12                                              ;; 0f:5dcc $7c
    mA_12                                              ;; 0f:5dcd $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5dce $e8
    mE_9                                               ;; 0f:5dcf $49
    mD_6                                               ;; 0f:5dd0 $26
    mCis_6                                             ;; 0f:5dd1 $16
    mF_12                                              ;; 0f:5dd2 $5c
    mE_12                                              ;; 0f:5dd3 $4c
    mSTEREOPAN $02                                     ;; 0f:5dd4 $f6 $02
    mD_12                                              ;; 0f:5dd6 $2c
    mCis_12                                            ;; 0f:5dd7 $1c
    mSTEREOPAN $01                                     ;; 0f:5dd8 $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:5dda $ec
    mAis_12                                            ;; 0f:5ddb $ac
    mA_12                                              ;; 0f:5ddc $9c
    mSTEREOPAN $03                                     ;; 0f:5ddd $f6 $03
    mREPEAT_2 .data_0f_5da2                            ;; 0f:5ddf $f9 $a2 $5d
    mJUMP .data_0f_5d75                                ;; 0f:5de2 $f1 $75 $5d

song00_channel1:
    mINIT1 frequencyDeltaData, data_0f_65e3, $40       ;; 0f:5de5 $fe $63 $66 $e3 $65 $40
    mC_3                                               ;; 0f:5deb $03
    mOCTAVE_2                                          ;; 0f:5dec $e2
    mD_12                                              ;; 0f:5ded $2c
    mE_12                                              ;; 0f:5dee $4c
    mF_6                                               ;; 0f:5def $56
    mG_6                                               ;; 0f:5df0 $76
.data_0f_5df1:
    mCOUNTER_2 $02                                     ;; 0f:5df1 $fa $02
.data_0f_5df3:
    mCOUNTER $02                                       ;; 0f:5df3 $f3 $02
.data_0f_5df5:
    mSTEREOPAN $02                                     ;; 0f:5df5 $f6 $02
    mE_9                                               ;; 0f:5df7 $49
    mC_12                                              ;; 0f:5df8 $0c
    mD_12                                              ;; 0f:5df9 $2c
    mSTEREOPAN $01                                     ;; 0f:5dfa $f6 $01
    mE_9                                               ;; 0f:5dfc $49
    mC_12                                              ;; 0f:5dfd $0c
    mD_12                                              ;; 0f:5dfe $2c
    mSTEREOPAN $02                                     ;; 0f:5dff $f6 $02
    mE_9                                               ;; 0f:5e01 $49
    mC_9                                               ;; 0f:5e02 $09
    mSTEREOPAN $01                                     ;; 0f:5e03 $f6 $01
    mJUMPIF $01, .data_0f_5e25                         ;; 0f:5e05 $fb $01 $25 $5e
    mD_9                                               ;; 0f:5e09 $29
    mE_9                                               ;; 0f:5e0a $49
    mSTEREOPAN $02                                     ;; 0f:5e0b $f6 $02
    mF_9                                               ;; 0f:5e0d $59
    mD_12                                              ;; 0f:5e0e $2c
    mE_12                                              ;; 0f:5e0f $4c
    mSTEREOPAN $01                                     ;; 0f:5e10 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5e12 $e8
    mD_12                                              ;; 0f:5e13 $2c
    mC_12                                              ;; 0f:5e14 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5e15 $ec
    mAis_9                                             ;; 0f:5e16 $a9
    mSTEREOPAN $02                                     ;; 0f:5e17 $f6 $02
    mD_9                                               ;; 0f:5e19 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5e1a $ec
    mAis_9                                             ;; 0f:5e1b $a9
    mSTEREOPAN $01                                     ;; 0f:5e1c $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5e1e $e8
    mF_12                                              ;; 0f:5e1f $5c
    mE_12                                              ;; 0f:5e20 $4c
    mD_9                                               ;; 0f:5e21 $29
    mREPEAT .data_0f_5df5                              ;; 0f:5e22 $f2 $f5 $5d
.data_0f_5e25:
    mOCTAVE_MINUS_1                                    ;; 0f:5e25 $ec
    mA_9                                               ;; 0f:5e26 $99
    mE_9                                               ;; 0f:5e27 $49
    mSTEREOPAN $02                                     ;; 0f:5e28 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5e2a $e8
    mD_9                                               ;; 0f:5e2b $29
    mC_12                                              ;; 0f:5e2c $0c
    mD_12                                              ;; 0f:5e2d $2c
    mSTEREOPAN $01                                     ;; 0f:5e2e $f6 $01
    mF_12                                              ;; 0f:5e30 $5c
    mE_12                                              ;; 0f:5e31 $4c
    mD_9                                               ;; 0f:5e32 $29
    mSTEREOPAN $02                                     ;; 0f:5e33 $f6 $02
    mD_9                                               ;; 0f:5e35 $29
    mC_9                                               ;; 0f:5e36 $09
    mSTEREOPAN $01                                     ;; 0f:5e37 $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:5e39 $ec
    mAis_9                                             ;; 0f:5e3a $a9
    mOCTAVE_PLUS_1                                     ;; 0f:5e3b $e8
    mD_9                                               ;; 0f:5e3c $29
    mREPEAT_2 .data_0f_5df3                            ;; 0f:5e3d $f9 $f3 $5d
    mCOUNTER_2 $02                                     ;; 0f:5e40 $fa $02
.data_0f_5e42:
    mSTEREOPAN $03                                     ;; 0f:5e42 $f6 $03
    mE_9                                               ;; 0f:5e44 $49
    mF_9                                               ;; 0f:5e45 $59
    mD_9                                               ;; 0f:5e46 $29
    mE_9                                               ;; 0f:5e47 $49
    mF_9                                               ;; 0f:5e48 $59
    mD_9                                               ;; 0f:5e49 $29
    mE_9                                               ;; 0f:5e4a $49
    mOCTAVE_MINUS_1                                    ;; 0f:5e4b $ec
    mA_9                                               ;; 0f:5e4c $99
    mSTEREOPAN $01                                     ;; 0f:5e4d $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5e4f $e8
    mCis_9                                             ;; 0f:5e50 $19
    mD_9                                               ;; 0f:5e51 $29
    mOCTAVE_MINUS_1                                    ;; 0f:5e52 $ec
    mA_9                                               ;; 0f:5e53 $99
    mAis_6                                             ;; 0f:5e54 $a6
    mA_12                                              ;; 0f:5e55 $9c
    mG_12                                              ;; 0f:5e56 $7c
    mSTEREOPAN $03                                     ;; 0f:5e57 $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:5e59 $e8
    mAis_12                                            ;; 0f:5e5a $ac
    mA_12                                              ;; 0f:5e5b $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5e5c $e8
    mD_12                                              ;; 0f:5e5d $2c
    mCis_12                                            ;; 0f:5e5e $1c
    mD_9                                               ;; 0f:5e5f $29
    mE_9                                               ;; 0f:5e60 $49
    mCis_9                                             ;; 0f:5e61 $19
    mOCTAVE_MINUS_1                                    ;; 0f:5e62 $ec
    mAis_9                                             ;; 0f:5e63 $a9
    mA_12                                              ;; 0f:5e64 $9c
    mE_12                                              ;; 0f:5e65 $4c
    mCis_12                                            ;; 0f:5e66 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5e67 $ec
    mAis_12                                            ;; 0f:5e68 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5e69 $e8
    mE_12                                              ;; 0f:5e6a $4c
    mF_12                                              ;; 0f:5e6b $5c
    mE_12                                              ;; 0f:5e6c $4c
    mF_12                                              ;; 0f:5e6d $5c
    mOCTAVE_PLUS_1                                     ;; 0f:5e6e $e8
    mCis_9                                             ;; 0f:5e6f $19
    mOCTAVE_MINUS_1                                    ;; 0f:5e70 $ec
    mAis_6                                             ;; 0f:5e71 $a6
    mA_6                                               ;; 0f:5e72 $96
    mOCTAVE_PLUS_1                                     ;; 0f:5e73 $e8
    mD_12                                              ;; 0f:5e74 $2c
    mCis_12                                            ;; 0f:5e75 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5e76 $ec
    mAis_12                                            ;; 0f:5e77 $ac
    mA_12                                              ;; 0f:5e78 $9c
    mF_12                                              ;; 0f:5e79 $5c
    mE_12                                              ;; 0f:5e7a $4c
    mREPEAT_2 .data_0f_5e42                            ;; 0f:5e7b $f9 $42 $5e
    mJUMP .data_0f_5df1                                ;; 0f:5e7e $f1 $f1 $5d

song00_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:5e81 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:5e87 $03
    mRest_9                                            ;; 0f:5e88 $d9
    mOCTAVE_1                                          ;; 0f:5e89 $e1
    mF_12                                              ;; 0f:5e8a $5c
    mC_12                                              ;; 0f:5e8b $0c
    mF_9                                               ;; 0f:5e8c $59
    mG_12                                              ;; 0f:5e8d $7c
    mD_12                                              ;; 0f:5e8e $2c
    mG_9                                               ;; 0f:5e8f $79
.data_0f_5e90:
    mCOUNTER $04                                       ;; 0f:5e90 $f3 $04
.data_0f_5e92:
    mCOUNTER_2 $04                                     ;; 0f:5e92 $fa $04
.data_0f_5e94:
    mA_12                                              ;; 0f:5e94 $9c
    mRest_12                                           ;; 0f:5e95 $dc
    mA_13                                              ;; 0f:5e96 $9d
    mRest_15                                           ;; 0f:5e97 $df
    mA_13                                              ;; 0f:5e98 $9d
    mRest_15                                           ;; 0f:5e99 $df
    mREPEAT_2 .data_0f_5e94                            ;; 0f:5e9a $f9 $94 $5e
    mCOUNTER_2 $02                                     ;; 0f:5e9d $fa $02
.data_0f_5e9f:
    mAis_12                                            ;; 0f:5e9f $ac
    mRest_12                                           ;; 0f:5ea0 $dc
    mAis_13                                            ;; 0f:5ea1 $ad
    mRest_15                                           ;; 0f:5ea2 $df
    mAis_13                                            ;; 0f:5ea3 $ad
    mRest_15                                           ;; 0f:5ea4 $df
    mREPEAT_2 .data_0f_5e9f                            ;; 0f:5ea5 $f9 $9f $5e
    mJUMPIF $03, .data_0f_5ebe                         ;; 0f:5ea8 $fb $03 $be $5e
    mJUMPIF $01, .data_0f_5ebe                         ;; 0f:5eac $fb $01 $be $5e
    mCOUNTER_2 $02                                     ;; 0f:5eb0 $fa $02
.data_0f_5eb2:
    mAis_12                                            ;; 0f:5eb2 $ac
    mRest_12                                           ;; 0f:5eb3 $dc
    mAis_13                                            ;; 0f:5eb4 $ad
    mRest_15                                           ;; 0f:5eb5 $df
    mAis_13                                            ;; 0f:5eb6 $ad
    mRest_15                                           ;; 0f:5eb7 $df
    mREPEAT_2 .data_0f_5eb2                            ;; 0f:5eb8 $f9 $b2 $5e
    mREPEAT .data_0f_5e92                              ;; 0f:5ebb $f2 $92 $5e
.data_0f_5ebe:
    mG_12                                              ;; 0f:5ebe $7c
    mA_12                                              ;; 0f:5ebf $9c
    mAis_12                                            ;; 0f:5ec0 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5ec1 $e8
    mC_12                                              ;; 0f:5ec2 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5ec3 $ec
    mAis_12                                            ;; 0f:5ec4 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5ec5 $e8
    mC_12                                              ;; 0f:5ec6 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5ec7 $ec
    mAis_12                                            ;; 0f:5ec8 $ac
    mG_12                                              ;; 0f:5ec9 $7c
    mREPEAT .data_0f_5e92                              ;; 0f:5eca $f2 $92 $5e
    mCOUNTER_2 $04                                     ;; 0f:5ecd $fa $04
.data_0f_5ecf:
    mA_12                                              ;; 0f:5ecf $9c
    mRest_12                                           ;; 0f:5ed0 $dc
    mA_13                                              ;; 0f:5ed1 $9d
    mRest_15                                           ;; 0f:5ed2 $df
    mA_13                                              ;; 0f:5ed3 $9d
    mRest_15                                           ;; 0f:5ed4 $df
    mA_9                                               ;; 0f:5ed5 $99
    mAis_13                                            ;; 0f:5ed6 $ad
    mRest_15                                           ;; 0f:5ed7 $df
    mAis_13                                            ;; 0f:5ed8 $ad
    mRest_15                                           ;; 0f:5ed9 $df
    mAis_9                                             ;; 0f:5eda $a9
    mG_13                                              ;; 0f:5edb $7d
    mRest_15                                           ;; 0f:5edc $df
    mG_13                                              ;; 0f:5edd $7d
    mRest_15                                           ;; 0f:5ede $df
    mG_9                                               ;; 0f:5edf $79
    mA_13                                              ;; 0f:5ee0 $9d
    mRest_15                                           ;; 0f:5ee1 $df
    mA_13                                              ;; 0f:5ee2 $9d
    mRest_15                                           ;; 0f:5ee3 $df
    mA_9                                               ;; 0f:5ee4 $99
    mF_13                                              ;; 0f:5ee5 $5d
    mRest_15                                           ;; 0f:5ee6 $df
    mF_13                                              ;; 0f:5ee7 $5d
    mRest_15                                           ;; 0f:5ee8 $df
    mF_9                                               ;; 0f:5ee9 $59
    mG_13                                              ;; 0f:5eea $7d
    mRest_15                                           ;; 0f:5eeb $df
    mG_13                                              ;; 0f:5eec $7d
    mRest_15                                           ;; 0f:5eed $df
    mG_9                                               ;; 0f:5eee $79
    mF_12                                              ;; 0f:5eef $5c
    mE_12                                              ;; 0f:5ef0 $4c
    mG_12                                              ;; 0f:5ef1 $7c
    mF_12                                              ;; 0f:5ef2 $5c
    mAis_12                                            ;; 0f:5ef3 $ac
    mA_12                                              ;; 0f:5ef4 $9c
    mREPEAT_2 .data_0f_5ecf                            ;; 0f:5ef5 $f9 $cf $5e
    mJUMP .data_0f_5e90                                ;; 0f:5ef8 $f1 $90 $5e

song00_channel4:
    mRest_4                                            ;; 0f:5efb $d4
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:5efc $f0 $1b $66
    mRest_6                                            ;; 0f:5eff $d6
.data_0f_5f00:
    mSTEREOPAN $01                                     ;; 0f:5f00 $f6 $01
    mRest_9                                            ;; 0f:5f02 $d9
    mB_12                                              ;; 0f:5f03 $bc
    mB_12                                              ;; 0f:5f04 $bc
    mSTEREOPAN $02                                     ;; 0f:5f05 $f6 $02
    mG_14                                              ;; 0f:5f07 $7e
    mF_14                                              ;; 0f:5f08 $5e
    mRest_7                                            ;; 0f:5f09 $d7
    mJUMP .data_0f_5f00                                ;; 0f:5f0a $f1 $00 $5f

song01_channel2:
    mINIT2 $7e, frequencyDeltaData, data_0f_6621, $40  ;; 0f:5f0d $fe $7e $63 $66 $21 $66 $40
    mC_2                                               ;; 0f:5f14 $02
    mOCTAVE_3                                          ;; 0f:5f15 $e3
    mCOUNTER $01                                       ;; 0f:5f16 $f3 $01
    mCOUNTER_2 $03                                     ;; 0f:5f18 $fa $03
    mJUMP .data_0f_5f48                                ;; 0f:5f1a $f1 $48 $5f
.data_0f_5f1d:
    mVOLUME_ENVELOPE data_0f_6621                      ;; 0f:5f1d $f0 $21 $66
    mCOUNTER_2 $02                                     ;; 0f:5f20 $fa $02
.data_0f_5f22:
    mCOUNTER $02                                       ;; 0f:5f22 $f3 $02
.data_0f_5f24:
    mSTEREOPAN $03                                     ;; 0f:5f24 $f6 $03
    mOCTAVE_2                                          ;; 0f:5f26 $e2
    mB_4                                               ;; 0f:5f27 $b4
    mE_4                                               ;; 0f:5f28 $44
    mJUMPIF $01, .data_0f_5f32                         ;; 0f:5f29 $fb $01 $32 $5f
    mAis_2                                             ;; 0f:5f2d $a2
    mJUMPIF $02, .data_0f_5f36                         ;; 0f:5f2e $fb $02 $36 $5f
.data_0f_5f32:
    mOCTAVE_PLUS_1                                     ;; 0f:5f32 $e8
    mE_6                                               ;; 0f:5f33 $46
    mOCTAVE_MINUS_1                                    ;; 0f:5f34 $ec
    mAis_3                                             ;; 0f:5f35 $a3
.data_0f_5f36:
    mWait_9                                            ;; 0f:5f36 $c9
    mE_9                                               ;; 0f:5f37 $49
    mB_9                                               ;; 0f:5f38 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:5f39 $e8
    mCis_9                                             ;; 0f:5f3a $19
    mVOLUME_ENVELOPE data_0f_660f                      ;; 0f:5f3b $f0 $0f $66
    mOCTAVE_MINUS_1                                    ;; 0f:5f3e $ec
    mE_4                                               ;; 0f:5f3f $44
    mE_3                                               ;; 0f:5f40 $43
    mOCTAVE_PLUS_1                                     ;; 0f:5f41 $e8
    mRest_9                                            ;; 0f:5f42 $d9
    mVOLUME_ENVELOPE data_0f_6621                      ;; 0f:5f43 $f0 $21 $66
    mSTEREOPAN $02                                     ;; 0f:5f46 $f6 $02
.data_0f_5f48:
    mE_12                                              ;; 0f:5f48 $4c
    mG_12                                              ;; 0f:5f49 $7c
    mAis_12                                            ;; 0f:5f4a $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5f4b $e8
    mE_12                                              ;; 0f:5f4c $4c
    mSTEREOPAN $01                                     ;; 0f:5f4d $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:5f4f $ec
    mFis_12                                            ;; 0f:5f50 $6c
    mA_12                                              ;; 0f:5f51 $9c
    mOCTAVE_PLUS_1                                     ;; 0f:5f52 $e8
    mC_12                                              ;; 0f:5f53 $0c
    mDis_12                                            ;; 0f:5f54 $3c
    mSTEREOPAN $02                                     ;; 0f:5f55 $f6 $02
    mOCTAVE_MINUS_1                                    ;; 0f:5f57 $ec
    mGis_12                                            ;; 0f:5f58 $8c
    mB_12                                              ;; 0f:5f59 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5f5a $e8
    mD_12                                              ;; 0f:5f5b $2c
    mF_12                                              ;; 0f:5f5c $5c
    mSTEREOPAN $01                                     ;; 0f:5f5d $f6 $01
    mOCTAVE_MINUS_1                                    ;; 0f:5f5f $ec
    mAis_12                                            ;; 0f:5f60 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:5f61 $e8
    mCis_12                                            ;; 0f:5f62 $1c
    mE_12                                              ;; 0f:5f63 $4c
    mG_12                                              ;; 0f:5f64 $7c
    mREPEAT .data_0f_5f24                              ;; 0f:5f65 $f2 $24 $5f
    mREPEAT_2 .data_0f_5f22                            ;; 0f:5f68 $f9 $22 $5f
    mOCTAVE_MINUS_1                                    ;; 0f:5f6b $ec
    mCOUNTER_2 $02                                     ;; 0f:5f6c $fa $02
.data_0f_5f6e:
    mSTEREOPAN $02                                     ;; 0f:5f6e $f6 $02
    mB_12                                              ;; 0f:5f70 $bc
    mAis_12                                            ;; 0f:5f71 $ac
    mG_12                                              ;; 0f:5f72 $7c
    mE_12                                              ;; 0f:5f73 $4c
    mSTEREOPAN $01                                     ;; 0f:5f74 $f6 $01
    mB_12                                              ;; 0f:5f76 $bc
    mAis_12                                            ;; 0f:5f77 $ac
    mG_12                                              ;; 0f:5f78 $7c
    mE_12                                              ;; 0f:5f79 $4c
    mSTEREOPAN $02                                     ;; 0f:5f7a $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5f7c $e8
    mE_12                                              ;; 0f:5f7d $4c
    mOCTAVE_MINUS_1                                    ;; 0f:5f7e $ec
    mB_12                                              ;; 0f:5f7f $bc
    mAis_12                                            ;; 0f:5f80 $ac
    mE_12                                              ;; 0f:5f81 $4c
    mSTEREOPAN $01                                     ;; 0f:5f82 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5f84 $e8
    mE_12                                              ;; 0f:5f85 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:5f86 $ec
    mB_12                                              ;; 0f:5f87 $bc
    mAis_12                                            ;; 0f:5f88 $ac
    mE_12                                              ;; 0f:5f89 $4c
    mSTEREOPAN $02                                     ;; 0f:5f8a $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5f8c $e8
    mD_12                                              ;; 0f:5f8d $2c
    mCis_12                                            ;; 0f:5f8e $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5f8f $ec
    mG_12                                              ;; 0f:5f90 $7c
    mE_12                                              ;; 0f:5f91 $4c
    mSTEREOPAN $01                                     ;; 0f:5f92 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5f94 $e8
    mD_12                                              ;; 0f:5f95 $2c
    mCis_12                                            ;; 0f:5f96 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5f97 $ec
    mG_12                                              ;; 0f:5f98 $7c
    mE_12                                              ;; 0f:5f99 $4c
    mSTEREOPAN $02                                     ;; 0f:5f9a $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:5f9c $e8
    mCis_12                                            ;; 0f:5f9d $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5f9e $ec
    mAis_12                                            ;; 0f:5f9f $ac
    mG_12                                              ;; 0f:5fa0 $7c
    mE_12                                              ;; 0f:5fa1 $4c
    mSTEREOPAN $01                                     ;; 0f:5fa2 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:5fa4 $e8
    mCis_12                                            ;; 0f:5fa5 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:5fa6 $ec
    mAis_12                                            ;; 0f:5fa7 $ac
    mG_12                                              ;; 0f:5fa8 $7c
    mE_12                                              ;; 0f:5fa9 $4c
    mREPEAT_2 .data_0f_5f6e                            ;; 0f:5faa $f9 $6e $5f
    mSTEREOPAN $03                                     ;; 0f:5fad $f6 $03
    mVOLUME_ENVELOPE data_0f_660f                      ;; 0f:5faf $f0 $0f $66
    mE_9                                               ;; 0f:5fb2 $49
    mOCTAVE_MINUS_1                                    ;; 0f:5fb3 $ec
    mB_9                                               ;; 0f:5fb4 $b9
    mG_9                                               ;; 0f:5fb5 $79
    mOCTAVE_PLUS_1                                     ;; 0f:5fb6 $e8
    mDis_9                                             ;; 0f:5fb7 $39
    mOCTAVE_MINUS_1                                    ;; 0f:5fb8 $ec
    mB_9                                               ;; 0f:5fb9 $b9
    mG_9                                               ;; 0f:5fba $79
    mOCTAVE_PLUS_1                                     ;; 0f:5fbb $e8
    mB_12                                              ;; 0f:5fbc $bc
    mA_12                                              ;; 0f:5fbd $9c
    mG_12                                              ;; 0f:5fbe $7c
    mFis_12                                            ;; 0f:5fbf $6c
    mG_12                                              ;; 0f:5fc0 $7c
    mA_12                                              ;; 0f:5fc1 $9c
    mG_12                                              ;; 0f:5fc2 $7c
    mFis_12                                            ;; 0f:5fc3 $6c
    mOCTAVE_MINUS_1                                    ;; 0f:5fc4 $ec
    mB_12                                              ;; 0f:5fc5 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5fc6 $e8
    mC_12                                              ;; 0f:5fc7 $0c
    mDis_12                                            ;; 0f:5fc8 $3c
    mFis_12                                            ;; 0f:5fc9 $6c
    mOCTAVE_PLUS_1                                     ;; 0f:5fca $e8
    mD_12                                              ;; 0f:5fcb $2c
    mC_12                                              ;; 0f:5fcc $0c
    mOCTAVE_MINUS_1                                    ;; 0f:5fcd $ec
    mB_12                                              ;; 0f:5fce $bc
    mOCTAVE_PLUS_1                                     ;; 0f:5fcf $e8
    mC_12                                              ;; 0f:5fd0 $0c
    mE_12                                              ;; 0f:5fd1 $4c
    mD_12                                              ;; 0f:5fd2 $2c
    mC_12                                              ;; 0f:5fd3 $0c
    mD_12                                              ;; 0f:5fd4 $2c
    mJUMP .data_0f_5f1d                                ;; 0f:5fd5 $f1 $1d $5f

song01_channel1:
    mINIT1 frequencyDeltaData, data_0f_6617, $00       ;; 0f:5fd8 $fe $63 $66 $17 $66 $00
    mC_3                                               ;; 0f:5fde $03
    mOCTAVE_3                                          ;; 0f:5fdf $e3
    mCOUNTER $01                                       ;; 0f:5fe0 $f3 $01
    mCOUNTER_2 $03                                     ;; 0f:5fe2 $fa $03
    mJUMP .data_0f_6027                                ;; 0f:5fe4 $f1 $27 $60
.data_0f_5fe7:
    mCOUNTER_2 $02                                     ;; 0f:5fe7 $fa $02
.data_0f_5fe9:
    mCOUNTER $02                                       ;; 0f:5fe9 $f3 $02
.data_0f_5feb:
    mVOLUME_ENVELOPE data_0f_6637                      ;; 0f:5feb $f0 $37 $66
    mJUMPIF $01, .data_0f_6009                         ;; 0f:5fee $fb $01 $09 $60
    mOCTAVE_3                                          ;; 0f:5ff2 $e3
    mG_4                                               ;; 0f:5ff3 $74
    mOCTAVE_MINUS_1                                    ;; 0f:5ff4 $ec
    mB_6                                               ;; 0f:5ff5 $b6
    mOCTAVE_PLUS_1                                     ;; 0f:5ff6 $e8
    mG_9                                               ;; 0f:5ff7 $79
    mFis_4                                             ;; 0f:5ff8 $64
    mAis_9                                             ;; 0f:5ff9 $a9
    mFis_9                                             ;; 0f:5ffa $69
    mCis_9                                             ;; 0f:5ffb $19
    mOCTAVE_MINUS_1                                    ;; 0f:5ffc $ec
    mB_12                                              ;; 0f:5ffd $bc
    mAis_12                                            ;; 0f:5ffe $ac
    mG_12                                              ;; 0f:5fff $7c
    mFis_12                                            ;; 0f:6000 $6c
    mG_12                                              ;; 0f:6001 $7c
    mFis_12                                            ;; 0f:6002 $6c
    mE_12                                              ;; 0f:6003 $4c
    mDis_12                                            ;; 0f:6004 $3c
    mJUMPIF $02, .data_0f_6020                         ;; 0f:6005 $fb $02 $20 $60
.data_0f_6009:
    mOCTAVE_MINUS_1                                    ;; 0f:6009 $ec
    mG_4                                               ;; 0f:600a $74
    mOCTAVE_MINUS_1                                    ;; 0f:600b $ec
    mB_6                                               ;; 0f:600c $b6
    mG_9                                               ;; 0f:600d $79
    mOCTAVE_PLUS_1                                     ;; 0f:600e $e8
    mB_12                                              ;; 0f:600f $bc
    mAis_12                                            ;; 0f:6010 $ac
    mG_12                                              ;; 0f:6011 $7c
    mE_12                                              ;; 0f:6012 $4c
    mD_6                                               ;; 0f:6013 $26
    mOCTAVE_MINUS_1                                    ;; 0f:6014 $ec
    mFis_6                                             ;; 0f:6015 $66
    mAis_12                                            ;; 0f:6016 $ac
    mB_12                                              ;; 0f:6017 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:6018 $e8
    mCis_12                                            ;; 0f:6019 $1c
    mD_12                                              ;; 0f:601a $2c
    mCis_12                                            ;; 0f:601b $1c
    mD_12                                              ;; 0f:601c $2c
    mCis_12                                            ;; 0f:601d $1c
    mOCTAVE_MINUS_1                                    ;; 0f:601e $ec
    mB_12                                              ;; 0f:601f $bc
.data_0f_6020:
    mVOLUME_ENVELOPE data_0f_6617                      ;; 0f:6020 $f0 $17 $66
    mOCTAVE_PLUS_1                                     ;; 0f:6023 $e8
    mB_4                                               ;; 0f:6024 $b4
    mAis_3                                             ;; 0f:6025 $a3
    mWait_9                                            ;; 0f:6026 $c9
.data_0f_6027:
    mWait_14                                           ;; 0f:6027 $ce
    mE_12                                              ;; 0f:6028 $4c
    mG_12                                              ;; 0f:6029 $7c
    mAis_12                                            ;; 0f:602a $ac
    mOCTAVE_PLUS_1                                     ;; 0f:602b $e8
    mE_12                                              ;; 0f:602c $4c
    mOCTAVE_MINUS_1                                    ;; 0f:602d $ec
    mFis_12                                            ;; 0f:602e $6c
    mA_12                                              ;; 0f:602f $9c
    mOCTAVE_PLUS_1                                     ;; 0f:6030 $e8
    mC_12                                              ;; 0f:6031 $0c
    mDis_12                                            ;; 0f:6032 $3c
    mOCTAVE_MINUS_1                                    ;; 0f:6033 $ec
    mGis_12                                            ;; 0f:6034 $8c
    mB_12                                              ;; 0f:6035 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:6036 $e8
    mD_12                                              ;; 0f:6037 $2c
    mF_12                                              ;; 0f:6038 $5c
    mOCTAVE_MINUS_1                                    ;; 0f:6039 $ec
    mAis_12                                            ;; 0f:603a $ac
    mOCTAVE_PLUS_1                                     ;; 0f:603b $e8
    mCis_12                                            ;; 0f:603c $1c
    mE_12                                              ;; 0f:603d $4c
    mG_14                                              ;; 0f:603e $7e
    mREPEAT .data_0f_5feb                              ;; 0f:603f $f2 $eb $5f
    mREPEAT_2 .data_0f_5fe9                            ;; 0f:6042 $f9 $e9 $5f
    mOCTAVE_MINUS_1                                    ;; 0f:6045 $ec
    mCOUNTER_2 $02                                     ;; 0f:6046 $fa $02
.data_0f_6048:
    mWait_14                                           ;; 0f:6048 $ce
    mB_12                                              ;; 0f:6049 $bc
    mAis_12                                            ;; 0f:604a $ac
    mG_12                                              ;; 0f:604b $7c
    mE_12                                              ;; 0f:604c $4c
    mB_12                                              ;; 0f:604d $bc
    mAis_12                                            ;; 0f:604e $ac
    mG_12                                              ;; 0f:604f $7c
    mE_12                                              ;; 0f:6050 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:6051 $e8
    mE_12                                              ;; 0f:6052 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:6053 $ec
    mB_12                                              ;; 0f:6054 $bc
    mAis_12                                            ;; 0f:6055 $ac
    mE_12                                              ;; 0f:6056 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:6057 $e8
    mE_12                                              ;; 0f:6058 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:6059 $ec
    mB_12                                              ;; 0f:605a $bc
    mAis_12                                            ;; 0f:605b $ac
    mE_12                                              ;; 0f:605c $4c
    mOCTAVE_PLUS_1                                     ;; 0f:605d $e8
    mD_12                                              ;; 0f:605e $2c
    mCis_12                                            ;; 0f:605f $1c
    mOCTAVE_MINUS_1                                    ;; 0f:6060 $ec
    mG_12                                              ;; 0f:6061 $7c
    mE_12                                              ;; 0f:6062 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:6063 $e8
    mD_12                                              ;; 0f:6064 $2c
    mCis_12                                            ;; 0f:6065 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:6066 $ec
    mG_12                                              ;; 0f:6067 $7c
    mE_12                                              ;; 0f:6068 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:6069 $e8
    mCis_12                                            ;; 0f:606a $1c
    mOCTAVE_MINUS_1                                    ;; 0f:606b $ec
    mAis_12                                            ;; 0f:606c $ac
    mG_12                                              ;; 0f:606d $7c
    mE_12                                              ;; 0f:606e $4c
    mOCTAVE_PLUS_1                                     ;; 0f:606f $e8
    mCis_12                                            ;; 0f:6070 $1c
    mOCTAVE_MINUS_1                                    ;; 0f:6071 $ec
    mAis_12                                            ;; 0f:6072 $ac
    mG_12                                              ;; 0f:6073 $7c
    mE_14                                              ;; 0f:6074 $4e
    mREPEAT_2 .data_0f_6048                            ;; 0f:6075 $f9 $48 $60
    mB_9                                               ;; 0f:6078 $b9
    mG_9                                               ;; 0f:6079 $79
    mE_9                                               ;; 0f:607a $49
    mAis_9                                             ;; 0f:607b $a9
    mG_9                                               ;; 0f:607c $79
    mE_9                                               ;; 0f:607d $49
    mG_12                                              ;; 0f:607e $7c
    mFis_12                                            ;; 0f:607f $6c
    mE_12                                              ;; 0f:6080 $4c
    mDis_12                                            ;; 0f:6081 $3c
    mOCTAVE_MINUS_1                                    ;; 0f:6082 $ec
    mB_12                                              ;; 0f:6083 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:6084 $e8
    mC_12                                              ;; 0f:6085 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:6086 $ec
    mB_12                                              ;; 0f:6087 $bc
    mAis_12                                            ;; 0f:6088 $ac
    mOCTAVE_PLUS_1                                     ;; 0f:6089 $e8
    mDis_12                                            ;; 0f:608a $3c
    mE_12                                              ;; 0f:608b $4c
    mFis_12                                            ;; 0f:608c $6c
    mDis_12                                            ;; 0f:608d $3c
    mA_12                                              ;; 0f:608e $9c
    mG_12                                              ;; 0f:608f $7c
    mFis_12                                            ;; 0f:6090 $6c
    mG_12                                              ;; 0f:6091 $7c
    mB_12                                              ;; 0f:6092 $bc
    mA_12                                              ;; 0f:6093 $9c
    mG_12                                              ;; 0f:6094 $7c
    mA_12                                              ;; 0f:6095 $9c
    mJUMP .data_0f_5fe7                                ;; 0f:6096 $f1 $e7 $5f

song01_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:6099 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:609f $03
    mOCTAVE_1                                          ;; 0f:60a0 $e1
    mE_6                                               ;; 0f:60a1 $46
    mDis_6                                             ;; 0f:60a2 $36
    mD_6                                               ;; 0f:60a3 $26
    mCis_6                                             ;; 0f:60a4 $16
.data_0f_60a5:
    mCOUNTER_2 $3e                                     ;; 0f:60a5 $fa $3e
.data_0f_60a7:
    mE_12                                              ;; 0f:60a7 $4c
    mRest_12                                           ;; 0f:60a8 $dc
    mE_13                                              ;; 0f:60a9 $4d
    mRest_15                                           ;; 0f:60aa $df
    mE_13                                              ;; 0f:60ab $4d
    mRest_15                                           ;; 0f:60ac $df
    mREPEAT_2 .data_0f_60a7                            ;; 0f:60ad $f9 $a7 $60
    mG_13                                              ;; 0f:60b0 $7d
    mWait_13                                           ;; 0f:60b1 $cd
    mAis_13                                            ;; 0f:60b2 $ad
    mWait_13                                           ;; 0f:60b3 $cd
    mOCTAVE_PLUS_1                                     ;; 0f:60b4 $e8
    mE_13                                              ;; 0f:60b5 $4d
    mWait_13                                           ;; 0f:60b6 $cd
    mDis_13                                            ;; 0f:60b7 $3d
    mWait_13                                           ;; 0f:60b8 $cd
    mD_13                                              ;; 0f:60b9 $2d
    mWait_13                                           ;; 0f:60ba $cd
    mCis_13                                            ;; 0f:60bb $1d
    mWait_13                                           ;; 0f:60bc $cd
    mOCTAVE_MINUS_1                                    ;; 0f:60bd $ec
    mE_9                                               ;; 0f:60be $49
    mRest_2                                            ;; 0f:60bf $d2
    mE_9                                               ;; 0f:60c0 $49
    mRest_9                                            ;; 0f:60c1 $d9
    mE_9                                               ;; 0f:60c2 $49
    mRest_2                                            ;; 0f:60c3 $d2
    mE_9                                               ;; 0f:60c4 $49
    mRest_1                                            ;; 0f:60c5 $d1
    mE_9                                               ;; 0f:60c6 $49
    mRest_6                                            ;; 0f:60c7 $d6
    mE_9                                               ;; 0f:60c8 $49
    mRest_4                                            ;; 0f:60c9 $d4
    mE_9                                               ;; 0f:60ca $49
    mRest_6                                            ;; 0f:60cb $d6
    mDis_9                                             ;; 0f:60cc $39
    mRest_6                                            ;; 0f:60cd $d6
    mOCTAVE_PLUS_1                                     ;; 0f:60ce $e8
    mG_12                                              ;; 0f:60cf $7c
    mFis_12                                            ;; 0f:60d0 $6c
    mE_12                                              ;; 0f:60d1 $4c
    mDis_12                                            ;; 0f:60d2 $3c
    mOCTAVE_MINUS_1                                    ;; 0f:60d3 $ec
    mAis_12                                            ;; 0f:60d4 $ac
    mRest_12                                           ;; 0f:60d5 $dc
    mFis_12                                            ;; 0f:60d6 $6c
    mRest_12                                           ;; 0f:60d7 $dc
    mE_12                                              ;; 0f:60d8 $4c
    mFis_12                                            ;; 0f:60d9 $6c
    mG_12                                              ;; 0f:60da $7c
    mE_12                                              ;; 0f:60db $4c
    mFis_12                                            ;; 0f:60dc $6c
    mE_12                                              ;; 0f:60dd $4c
    mFis_12                                            ;; 0f:60de $6c
    mB_12                                              ;; 0f:60df $bc
    mE_12                                              ;; 0f:60e0 $4c
    mOCTAVE_PLUS_1                                     ;; 0f:60e1 $e8
    mD_12                                              ;; 0f:60e2 $2c
    mC_12                                              ;; 0f:60e3 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:60e4 $ec
    mB_12                                              ;; 0f:60e5 $bc
    mJUMP .data_0f_60a5                                ;; 0f:60e6 $f1 $a5 $60

song01_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:60e9 $f0 $1b $66
    mRest_1                                            ;; 0f:60ec $d1
.data_0f_60ed:
    mCOUNTER_2 $20                                     ;; 0f:60ed $fa $20
.data_0f_60ef:
    mSTEREOPAN $01                                     ;; 0f:60ef $f6 $01
    mRest_9                                            ;; 0f:60f1 $d9
    mB_12                                              ;; 0f:60f2 $bc
    mB_12                                              ;; 0f:60f3 $bc
    mSTEREOPAN $02                                     ;; 0f:60f4 $f6 $02
    mG_14                                              ;; 0f:60f6 $7e
    mF_14                                              ;; 0f:60f7 $5e
    mRest_7                                            ;; 0f:60f8 $d7
    mREPEAT_2 .data_0f_60ef                            ;; 0f:60f9 $f9 $ef $60
    mCOUNTER_2 $10                                     ;; 0f:60fc $fa $10
.data_0f_60fe:
    mSTEREOPAN $01                                     ;; 0f:60fe $f6 $01
    mA_9                                               ;; 0f:6100 $99
    mSTEREOPAN $02                                     ;; 0f:6101 $f6 $02
    mB_9                                               ;; 0f:6103 $b9
    mREPEAT_2 .data_0f_60fe                            ;; 0f:6104 $f9 $fe $60
    mSTEREOPAN $03                                     ;; 0f:6107 $f6 $03
    mF_4                                               ;; 0f:6109 $54
    mF_4                                               ;; 0f:610a $54
    mRest_1                                            ;; 0f:610b $d1
    mF_6                                               ;; 0f:610c $56
    mJUMP .data_0f_60ed                                ;; 0f:610d $f1 $ed $60

song0d_channel2:
    mINIT2 $82, frequencyDeltaData, volumeEnvelopeData, $00 ;; 0f:6110 $fe $82 $63 $66 $d7 $65 $00
    mC_3                                               ;; 0f:6117 $03
    mOCTAVE_3                                          ;; 0f:6118 $e3
    mB_14                                              ;; 0f:6119 $be
    mAis_14                                            ;; 0f:611a $ae
    mA_14                                              ;; 0f:611b $9e
    mGis_14                                            ;; 0f:611c $8e
    mG_14                                              ;; 0f:611d $7e
    mFis_14                                            ;; 0f:611e $6e
    mF_14                                              ;; 0f:611f $5e
    mE_14                                              ;; 0f:6120 $4e
    mDis_14                                            ;; 0f:6121 $3e
    mD_14                                              ;; 0f:6122 $2e
    mCis_14                                            ;; 0f:6123 $1e
    mC_14                                              ;; 0f:6124 $0e
.data_0f_6125:
    mOCTAVE_3                                          ;; 0f:6125 $e3
    mE_9                                               ;; 0f:6126 $49
    mDis_12                                            ;; 0f:6127 $3c
    mRest_12                                           ;; 0f:6128 $dc
    mRest_3                                            ;; 0f:6129 $d3
    mG_9                                               ;; 0f:612a $79
    mFis_12                                            ;; 0f:612b $6c
    mRest_12                                           ;; 0f:612c $dc
    mRest_3                                            ;; 0f:612d $d3
    mA_9                                               ;; 0f:612e $99
    mG_12                                              ;; 0f:612f $7c
    mRest_7                                            ;; 0f:6130 $d7
    mE_9                                               ;; 0f:6131 $49
    mFis_12                                            ;; 0f:6132 $6c
    mRest_7                                            ;; 0f:6133 $d7
    mDis_9                                             ;; 0f:6134 $39
    mE_12                                              ;; 0f:6135 $4c
    mRest_7                                            ;; 0f:6136 $d7
    mSTEREOPAN $01                                     ;; 0f:6137 $f6 $01
    mE_12                                              ;; 0f:6139 $4c
    mDis_12                                            ;; 0f:613a $3c
    mD_12                                              ;; 0f:613b $2c
    mSTEREOPAN $02                                     ;; 0f:613c $f6 $02
    mCis_12                                            ;; 0f:613e $1c
    mC_12                                              ;; 0f:613f $0c
    mOCTAVE_MINUS_1                                    ;; 0f:6140 $ec
    mB_12                                              ;; 0f:6141 $bc
    mSTEREOPAN $03                                     ;; 0f:6142 $f6 $03
    mOCTAVE_PLUS_1                                     ;; 0f:6144 $e8
    mB_9                                               ;; 0f:6145 $b9
    mA_12                                              ;; 0f:6146 $9c
    mRest_12                                           ;; 0f:6147 $dc
    mRest_3                                            ;; 0f:6148 $d3
    mA_9                                               ;; 0f:6149 $99
    mG_12                                              ;; 0f:614a $7c
    mRest_12                                           ;; 0f:614b $dc
    mRest_3                                            ;; 0f:614c $d3
    mG_9                                               ;; 0f:614d $79
    mFis_12                                            ;; 0f:614e $6c
    mRest_7                                            ;; 0f:614f $d7
    mA_9                                               ;; 0f:6150 $99
    mDis_12                                            ;; 0f:6151 $3c
    mRest_7                                            ;; 0f:6152 $d7
    mSTEREOPAN $01                                     ;; 0f:6153 $f6 $01
    mDis_12                                            ;; 0f:6155 $3c
    mE_12                                              ;; 0f:6156 $4c
    mFis_12                                            ;; 0f:6157 $6c
    mSTEREOPAN $02                                     ;; 0f:6158 $f6 $02
    mA_12                                              ;; 0f:615a $9c
    mB_12                                              ;; 0f:615b $bc
    mOCTAVE_PLUS_1                                     ;; 0f:615c $e8
    mC_12                                              ;; 0f:615d $0c
    mSTEREOPAN $01                                     ;; 0f:615e $f6 $01
    mDis_12                                            ;; 0f:6160 $3c
    mE_12                                              ;; 0f:6161 $4c
    mFis_12                                            ;; 0f:6162 $6c
    mSTEREOPAN $02                                     ;; 0f:6163 $f6 $02
    mG_12                                              ;; 0f:6165 $7c
    mFis_12                                            ;; 0f:6166 $6c
    mE_12                                              ;; 0f:6167 $4c
    mSTEREOPAN $03                                     ;; 0f:6168 $f6 $03
    mOCTAVE_MINUS_1                                    ;; 0f:616a $ec
    mCOUNTER_2 $02                                     ;; 0f:616b $fa $02
.data_0f_616d:
    mE_7                                               ;; 0f:616d $47
    mFis_7                                             ;; 0f:616e $67
    mDis_7                                             ;; 0f:616f $37
    mE_7                                               ;; 0f:6170 $47
    mFis_7                                             ;; 0f:6171 $67
    mA_7                                               ;; 0f:6172 $97
    mG_7                                               ;; 0f:6173 $77
    mFis_7                                             ;; 0f:6174 $67
    mE_7                                               ;; 0f:6175 $47
    mDis_7                                             ;; 0f:6176 $37
    mE_7                                               ;; 0f:6177 $47
    mOCTAVE_MINUS_1                                    ;; 0f:6178 $ec
    mB_7                                               ;; 0f:6179 $b7
    mOCTAVE_PLUS_1                                     ;; 0f:617a $e8
    mB_4                                               ;; 0f:617b $b4
    mA_4                                               ;; 0f:617c $94
    mG_7                                               ;; 0f:617d $77
    mA_7                                               ;; 0f:617e $97
    mG_7                                               ;; 0f:617f $77
    mFis_7                                             ;; 0f:6180 $67
    mE_7                                               ;; 0f:6181 $47
    mOCTAVE_MINUS_1                                    ;; 0f:6182 $ec
    mB_7                                               ;; 0f:6183 $b7
    mOCTAVE_PLUS_1                                     ;; 0f:6184 $e8
    mFis_7                                             ;; 0f:6185 $67
    mOCTAVE_MINUS_1                                    ;; 0f:6186 $ec
    mB_7                                               ;; 0f:6187 $b7
    mOCTAVE_PLUS_1                                     ;; 0f:6188 $e8
    mG_7                                               ;; 0f:6189 $77
    mE_7                                               ;; 0f:618a $47
    mFis_7                                             ;; 0f:618b $67
    mD_7                                               ;; 0f:618c $27
    mE_2                                               ;; 0f:618d $42
    mREPEAT_2 .data_0f_616d                            ;; 0f:618e $f9 $6d $61
    mJUMP .data_0f_6125                                ;; 0f:6191 $f1 $25 $61

song0d_channel1:
    mINIT1 frequencyDeltaData, data_0f_65e3, $40       ;; 0f:6194 $fe $63 $66 $e3 $65 $40
    mC_3                                               ;; 0f:619a $03
    mOCTAVE_3                                          ;; 0f:619b $e3
    mE_14                                              ;; 0f:619c $4e
    mDis_14                                            ;; 0f:619d $3e
    mD_14                                              ;; 0f:619e $2e
    mCis_14                                            ;; 0f:619f $1e
    mC_14                                              ;; 0f:61a0 $0e
    mOCTAVE_MINUS_1                                    ;; 0f:61a1 $ec
    mB_14                                              ;; 0f:61a2 $be
    mAis_14                                            ;; 0f:61a3 $ae
    mA_14                                              ;; 0f:61a4 $9e
    mGis_14                                            ;; 0f:61a5 $8e
    mG_14                                              ;; 0f:61a6 $7e
    mFis_14                                            ;; 0f:61a7 $6e
    mF_14                                              ;; 0f:61a8 $5e
.data_0f_61a9:
    mSTEREOPAN $03                                     ;; 0f:61a9 $f6 $03
    mOCTAVE_2                                          ;; 0f:61ab $e2
    mB_9                                               ;; 0f:61ac $b9
    mB_12                                              ;; 0f:61ad $bc
    mRest_3                                            ;; 0f:61ae $d3
    mRest_12                                           ;; 0f:61af $dc
    mOCTAVE_PLUS_1                                     ;; 0f:61b0 $e8
    mE_9                                               ;; 0f:61b1 $49
    mDis_12                                            ;; 0f:61b2 $3c
    mRest_3                                            ;; 0f:61b3 $d3
    mRest_12                                           ;; 0f:61b4 $dc
    mC_9                                               ;; 0f:61b5 $09
    mOCTAVE_MINUS_1                                    ;; 0f:61b6 $ec
    mB_12                                              ;; 0f:61b7 $bc
    mRest_7                                            ;; 0f:61b8 $d7
    mG_9                                               ;; 0f:61b9 $79
    mA_12                                              ;; 0f:61ba $9c
    mRest_7                                            ;; 0f:61bb $d7
    mFis_9                                             ;; 0f:61bc $69
    mG_12                                              ;; 0f:61bd $7c
    mRest_7                                            ;; 0f:61be $d7
    mB_12                                              ;; 0f:61bf $bc
    mAis_12                                            ;; 0f:61c0 $ac
    mA_12                                              ;; 0f:61c1 $9c
    mGis_12                                            ;; 0f:61c2 $8c
    mG_12                                              ;; 0f:61c3 $7c
    mFis_12                                            ;; 0f:61c4 $6c
    mOCTAVE_PLUS_1                                     ;; 0f:61c5 $e8
    mG_9                                               ;; 0f:61c6 $79
    mFis_12                                            ;; 0f:61c7 $6c
    mRest_3                                            ;; 0f:61c8 $d3
    mRest_12                                           ;; 0f:61c9 $dc
    mFis_9                                             ;; 0f:61ca $69
    mE_12                                              ;; 0f:61cb $4c
    mRest_3                                            ;; 0f:61cc $d3
    mRest_12                                           ;; 0f:61cd $dc
    mE_9                                               ;; 0f:61ce $49
    mDis_12                                            ;; 0f:61cf $3c
    mRest_7                                            ;; 0f:61d0 $d7
    mFis_9                                             ;; 0f:61d1 $69
    mOCTAVE_MINUS_1                                    ;; 0f:61d2 $ec
    mB_12                                              ;; 0f:61d3 $bc
    mRest_7                                            ;; 0f:61d4 $d7
    mB_7                                               ;; 0f:61d5 $b7
    mB_7                                               ;; 0f:61d6 $b7
    mOCTAVE_PLUS_1                                     ;; 0f:61d7 $e8
    mFis_12                                            ;; 0f:61d8 $6c
    mE_12                                              ;; 0f:61d9 $4c
    mDis_12                                            ;; 0f:61da $3c
    mC_12                                              ;; 0f:61db $0c
    mOCTAVE_MINUS_1                                    ;; 0f:61dc $ec
    mB_12                                              ;; 0f:61dd $bc
    mAis_12                                            ;; 0f:61de $ac
    mOCTAVE_3                                          ;; 0f:61df $e3
    mCOUNTER $02                                       ;; 0f:61e0 $f3 $02
.data_0f_61e2:
    mCOUNTER_2 $04                                     ;; 0f:61e2 $fa $04
.data_0f_61e4:
    mSTEREOPAN $01                                     ;; 0f:61e4 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:61e6 $e8
    mB_9                                               ;; 0f:61e7 $b9
    mOCTAVE_MINUS_1                                    ;; 0f:61e8 $ec
    mB_12                                              ;; 0f:61e9 $bc
    mSTEREOPAN $02                                     ;; 0f:61ea $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:61ec $e8
    mB_9                                               ;; 0f:61ed $b9
    mOCTAVE_MINUS_1                                    ;; 0f:61ee $ec
    mB_12                                              ;; 0f:61ef $bc
    mREPEAT_2 .data_0f_61e4                            ;; 0f:61f0 $f9 $e4 $61
    mSTEREOPAN $01                                     ;; 0f:61f3 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:61f5 $e8
    mG_9                                               ;; 0f:61f6 $79
    mOCTAVE_MINUS_1                                    ;; 0f:61f7 $ec
    mG_12                                              ;; 0f:61f8 $7c
    mSTEREOPAN $02                                     ;; 0f:61f9 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:61fb $e8
    mFis_9                                             ;; 0f:61fc $69
    mOCTAVE_MINUS_1                                    ;; 0f:61fd $ec
    mG_12                                              ;; 0f:61fe $7c
    mSTEREOPAN $01                                     ;; 0f:61ff $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:6201 $e8
    mE_9                                               ;; 0f:6202 $49
    mOCTAVE_MINUS_1                                    ;; 0f:6203 $ec
    mG_12                                              ;; 0f:6204 $7c
    mSTEREOPAN $02                                     ;; 0f:6205 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:6207 $e8
    mDis_9                                             ;; 0f:6208 $39
    mOCTAVE_MINUS_1                                    ;; 0f:6209 $ec
    mG_12                                              ;; 0f:620a $7c
    mSTEREOPAN $01                                     ;; 0f:620b $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:620d $e8
    mE_9                                               ;; 0f:620e $49
    mOCTAVE_MINUS_1                                    ;; 0f:620f $ec
    mE_12                                              ;; 0f:6210 $4c
    mSTEREOPAN $02                                     ;; 0f:6211 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:6213 $e8
    mE_9                                               ;; 0f:6214 $49
    mOCTAVE_MINUS_1                                    ;; 0f:6215 $ec
    mE_12                                              ;; 0f:6216 $4c
    mSTEREOPAN $01                                     ;; 0f:6217 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:6219 $e8
    mFis_9                                             ;; 0f:621a $69
    mOCTAVE_MINUS_1                                    ;; 0f:621b $ec
    mFis_12                                            ;; 0f:621c $6c
    mSTEREOPAN $02                                     ;; 0f:621d $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:621f $e8
    mFis_9                                             ;; 0f:6220 $69
    mOCTAVE_MINUS_1                                    ;; 0f:6221 $ec
    mFis_12                                            ;; 0f:6222 $6c
    mCOUNTER_2 $02                                     ;; 0f:6223 $fa $02
.data_0f_6225:
    mSTEREOPAN $01                                     ;; 0f:6225 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:6227 $e8
    mB_9                                               ;; 0f:6228 $b9
    mOCTAVE_MINUS_1                                    ;; 0f:6229 $ec
    mB_12                                              ;; 0f:622a $bc
    mSTEREOPAN $02                                     ;; 0f:622b $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:622d $e8
    mB_9                                               ;; 0f:622e $b9
    mOCTAVE_MINUS_1                                    ;; 0f:622f $ec
    mB_12                                              ;; 0f:6230 $bc
    mREPEAT_2 .data_0f_6225                            ;; 0f:6231 $f9 $25 $62
    mSTEREOPAN $01                                     ;; 0f:6234 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:6236 $e8
    mA_9                                               ;; 0f:6237 $99
    mOCTAVE_MINUS_1                                    ;; 0f:6238 $ec
    mA_12                                              ;; 0f:6239 $9c
    mSTEREOPAN $02                                     ;; 0f:623a $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:623c $e8
    mG_9                                               ;; 0f:623d $79
    mOCTAVE_MINUS_1                                    ;; 0f:623e $ec
    mG_12                                              ;; 0f:623f $7c
    mSTEREOPAN $01                                     ;; 0f:6240 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:6242 $e8
    mFis_9                                             ;; 0f:6243 $69
    mOCTAVE_MINUS_1                                    ;; 0f:6244 $ec
    mFis_12                                            ;; 0f:6245 $6c
    mSTEREOPAN $02                                     ;; 0f:6246 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:6248 $e8
    mDis_9                                             ;; 0f:6249 $39
    mOCTAVE_MINUS_1                                    ;; 0f:624a $ec
    mDis_12                                            ;; 0f:624b $3c
    mSTEREOPAN $03                                     ;; 0f:624c $f6 $03
    mB_7                                               ;; 0f:624e $b7
    mG_7                                               ;; 0f:624f $77
    mA_7                                               ;; 0f:6250 $97
    mFis_7                                             ;; 0f:6251 $67
    mSTEREOPAN $01                                     ;; 0f:6252 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:6254 $e8
    mG_12                                              ;; 0f:6255 $7c
    mFis_12                                            ;; 0f:6256 $6c
    mE_12                                              ;; 0f:6257 $4c
    mSTEREOPAN $02                                     ;; 0f:6258 $f6 $02
    mOCTAVE_MINUS_1                                    ;; 0f:625a $ec
    mB_12                                              ;; 0f:625b $bc
    mG_12                                              ;; 0f:625c $7c
    mE_12                                              ;; 0f:625d $4c
    mSTEREOPAN $01                                     ;; 0f:625e $f6 $01
    mA_12                                              ;; 0f:6260 $9c
    mFis_12                                            ;; 0f:6261 $6c
    mOCTAVE_MINUS_1                                    ;; 0f:6262 $ec
    mB_12                                              ;; 0f:6263 $bc
    mSTEREOPAN $02                                     ;; 0f:6264 $f6 $02
    mOCTAVE_PLUS_1                                     ;; 0f:6266 $e8
    mG_12                                              ;; 0f:6267 $7c
    mE_12                                              ;; 0f:6268 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:6269 $ec
    mB_12                                              ;; 0f:626a $bc
    mREPEAT .data_0f_61e2                              ;; 0f:626b $f2 $e2 $61
    mJUMP .data_0f_61a9                                ;; 0f:626e $f1 $a9 $61

song0d_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:6271 $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:6277 $03
    mRest_4                                            ;; 0f:6278 $d4
.data_0f_6279:
    mOCTAVE_1                                          ;; 0f:6279 $e1
    mCOUNTER_2 $1e                                     ;; 0f:627a $fa $1e
.data_0f_627c:
    mE_12                                              ;; 0f:627c $4c
    mRest_12                                           ;; 0f:627d $dc
    mE_13                                              ;; 0f:627e $4d
    mRest_15                                           ;; 0f:627f $df
    mREPEAT_2 .data_0f_627c                            ;; 0f:6280 $f9 $7c $62
    mFis_12                                            ;; 0f:6283 $6c
    mF_12                                              ;; 0f:6284 $5c
    mFis_12                                            ;; 0f:6285 $6c
    mA_12                                              ;; 0f:6286 $9c
    mB_12                                              ;; 0f:6287 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:6288 $e8
    mC_12                                              ;; 0f:6289 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:628a $ec
    mCOUNTER $02                                       ;; 0f:628b $f3 $02
.data_0f_628d:
    mCOUNTER_2 $04                                     ;; 0f:628d $fa $04
.data_0f_628f:
    mE_12                                              ;; 0f:628f $4c
    mRest_12                                           ;; 0f:6290 $dc
    mE_13                                              ;; 0f:6291 $4d
    mRest_15                                           ;; 0f:6292 $df
    mREPEAT_2 .data_0f_628f                            ;; 0f:6293 $f9 $8f $62
    mCOUNTER_2 $04                                     ;; 0f:6296 $fa $04
.data_0f_6298:
    mFis_12                                            ;; 0f:6298 $6c
    mRest_12                                           ;; 0f:6299 $dc
    mFis_13                                            ;; 0f:629a $6d
    mRest_15                                           ;; 0f:629b $df
    mREPEAT_2 .data_0f_6298                            ;; 0f:629c $f9 $98 $62
    mCOUNTER_2 $04                                     ;; 0f:629f $fa $04
.data_0f_62a1:
    mG_12                                              ;; 0f:62a1 $7c
    mRest_12                                           ;; 0f:62a2 $dc
    mG_13                                              ;; 0f:62a3 $7d
    mRest_15                                           ;; 0f:62a4 $df
    mREPEAT_2 .data_0f_62a1                            ;; 0f:62a5 $f9 $a1 $62
    mCOUNTER_2 $04                                     ;; 0f:62a8 $fa $04
.data_0f_62aa:
    mFis_12                                            ;; 0f:62aa $6c
    mRest_12                                           ;; 0f:62ab $dc
    mFis_13                                            ;; 0f:62ac $6d
    mRest_15                                           ;; 0f:62ad $df
    mREPEAT_2 .data_0f_62aa                            ;; 0f:62ae $f9 $aa $62
    mCOUNTER_2 $04                                     ;; 0f:62b1 $fa $04
.data_0f_62b3:
    mE_12                                              ;; 0f:62b3 $4c
    mRest_12                                           ;; 0f:62b4 $dc
    mE_13                                              ;; 0f:62b5 $4d
    mRest_15                                           ;; 0f:62b6 $df
    mREPEAT_2 .data_0f_62b3                            ;; 0f:62b7 $f9 $b3 $62
    mFis_12                                            ;; 0f:62ba $6c
    mRest_12                                           ;; 0f:62bb $dc
    mFis_12                                            ;; 0f:62bc $6c
    mB_12                                              ;; 0f:62bd $bc
    mRest_12                                           ;; 0f:62be $dc
    mB_12                                              ;; 0f:62bf $bc
    mDis_12                                            ;; 0f:62c0 $3c
    mRest_12                                           ;; 0f:62c1 $dc
    mDis_12                                            ;; 0f:62c2 $3c
    mFis_12                                            ;; 0f:62c3 $6c
    mRest_12                                           ;; 0f:62c4 $dc
    mFis_12                                            ;; 0f:62c5 $6c
    mCOUNTER_2 $08                                     ;; 0f:62c6 $fa $08
.data_0f_62c8:
    mE_12                                              ;; 0f:62c8 $4c
    mRest_12                                           ;; 0f:62c9 $dc
    mE_13                                              ;; 0f:62ca $4d
    mRest_15                                           ;; 0f:62cb $df
    mREPEAT_2 .data_0f_62c8                            ;; 0f:62cc $f9 $c8 $62
    mREPEAT .data_0f_628d                              ;; 0f:62cf $f2 $8d $62
    mJUMP .data_0f_6279                                ;; 0f:62d2 $f1 $79 $62

song0d_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:62d5 $f0 $1b $66
    mRest_4                                            ;; 0f:62d8 $d4
    mRest_7                                            ;; 0f:62d9 $d7
.data_0f_62da:
    mSTEREOPAN $01                                     ;; 0f:62da $f6 $01
    mG_14                                              ;; 0f:62dc $7e
    mF_14                                              ;; 0f:62dd $5e
    mRest_9                                            ;; 0f:62de $d9
    mSTEREOPAN $02                                     ;; 0f:62df $f6 $02
    mF_7                                               ;; 0f:62e1 $57
    mJUMP .data_0f_62da                                ;; 0f:62e2 $f1 $da $62

song03_channel2:
    mINIT2 $41, frequencyDeltaData, data_0f_65e3, $00  ;; 0f:62e5 $fe $41 $63 $66 $e3 $65 $00
    mC_3                                               ;; 0f:62ec $03
    mOCTAVE_2                                          ;; 0f:62ed $e2
    mA_15                                              ;; 0f:62ee $9f
    mAis_15                                            ;; 0f:62ef $af
    mOCTAVE_PLUS_1                                     ;; 0f:62f0 $e8
    mC_15                                              ;; 0f:62f1 $0f
    mD_15                                              ;; 0f:62f2 $2f
    mE_15                                              ;; 0f:62f3 $4f
    mF_15                                              ;; 0f:62f4 $5f
    mAis_9                                             ;; 0f:62f5 $a9
    mAis_13                                            ;; 0f:62f6 $ad
    mAis_13                                            ;; 0f:62f7 $ad
    mAis_13                                            ;; 0f:62f8 $ad
    mA_12                                              ;; 0f:62f9 $9c
    mG_12                                              ;; 0f:62fa $7c
    mF_12                                              ;; 0f:62fb $5c
    mA_12                                              ;; 0f:62fc $9c
    mG_4                                               ;; 0f:62fd $74
    mTEMPO $82                                         ;; 0f:62fe $f7 $82
    mOCTAVE_MINUS_1                                    ;; 0f:6300 $ec
    mA_12                                              ;; 0f:6301 $9c
    mB_12                                              ;; 0f:6302 $bc
    mOCTAVE_PLUS_1                                     ;; 0f:6303 $e8
    mC_12                                              ;; 0f:6304 $0c
    mD_12                                              ;; 0f:6305 $2c
.data_0f_6306:
    mCOUNTER_2 $02                                     ;; 0f:6306 $fa $02
.data_0f_6308:
    mE_6                                               ;; 0f:6308 $46
    mE_6                                               ;; 0f:6309 $46
    mD_9                                               ;; 0f:630a $29
    mE_6                                               ;; 0f:630b $46
    mE_9                                               ;; 0f:630c $49
    mD_9                                               ;; 0f:630d $29
    mE_6                                               ;; 0f:630e $46
    mF_9                                               ;; 0f:630f $59
    mE_6                                               ;; 0f:6310 $46
    mD_6                                               ;; 0f:6311 $26
    mREPEAT_2 .data_0f_6308                            ;; 0f:6312 $f9 $08 $63
    mCOUNTER $02                                       ;; 0f:6315 $f3 $02
.data_0f_6317:
    mG_9                                               ;; 0f:6317 $79
    mF_9                                               ;; 0f:6318 $59
    mDis_9                                             ;; 0f:6319 $39
    mF_6                                               ;; 0f:631a $56
    mF_9                                               ;; 0f:631b $59
    mDis_9                                             ;; 0f:631c $39
    mF_9                                               ;; 0f:631d $59
    mG_6                                               ;; 0f:631e $76
    mF_6                                               ;; 0f:631f $56
    mJUMPIF $01, .data_0f_6329                         ;; 0f:6320 $fb $01 $29 $63
    mDis_6                                             ;; 0f:6324 $36
    mF_6                                               ;; 0f:6325 $56
    mREPEAT .data_0f_6317                              ;; 0f:6326 $f2 $17 $63
.data_0f_6329:
    mDis_9                                             ;; 0f:6329 $39
    mF_6                                               ;; 0f:632a $56
    mF_9                                               ;; 0f:632b $59
    mJUMP .data_0f_6306                                ;; 0f:632c $f1 $06 $63

song03_channel1:
    mINIT1 frequencyDeltaData, data_0f_65eb, $00       ;; 0f:632f $fe $63 $66 $eb $65 $00
    mC_3                                               ;; 0f:6335 $03
    mOCTAVE_3                                          ;; 0f:6336 $e3
    mC_15                                              ;; 0f:6337 $0f
    mD_15                                              ;; 0f:6338 $2f
    mE_15                                              ;; 0f:6339 $4f
    mF_15                                              ;; 0f:633a $5f
    mG_15                                              ;; 0f:633b $7f
    mA_15                                              ;; 0f:633c $9f
    mG_9                                               ;; 0f:633d $79
    mG_13                                              ;; 0f:633e $7d
    mG_13                                              ;; 0f:633f $7d
    mG_13                                              ;; 0f:6340 $7d
    mF_12                                              ;; 0f:6341 $5c
    mDis_12                                            ;; 0f:6342 $3c
    mD_12                                              ;; 0f:6343 $2c
    mF_12                                              ;; 0f:6344 $5c
    mD_4                                               ;; 0f:6345 $24
    mOCTAVE_MINUS_1                                    ;; 0f:6346 $ec
    mFis_12                                            ;; 0f:6347 $6c
    mG_12                                              ;; 0f:6348 $7c
    mA_12                                              ;; 0f:6349 $9c
    mB_12                                              ;; 0f:634a $bc
    mOCTAVE_PLUS_1                                     ;; 0f:634b $e8
.data_0f_634c:
    mCOUNTER_2 $02                                     ;; 0f:634c $fa $02
.data_0f_634e:
    mC_6                                               ;; 0f:634e $06
    mC_6                                               ;; 0f:634f $06
    mOCTAVE_MINUS_1                                    ;; 0f:6350 $ec
    mB_9                                               ;; 0f:6351 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:6352 $e8
    mC_6                                               ;; 0f:6353 $06
    mC_9                                               ;; 0f:6354 $09
    mOCTAVE_MINUS_1                                    ;; 0f:6355 $ec
    mB_9                                               ;; 0f:6356 $b9
    mOCTAVE_PLUS_1                                     ;; 0f:6357 $e8
    mC_6                                               ;; 0f:6358 $06
    mD_9                                               ;; 0f:6359 $29
    mC_6                                               ;; 0f:635a $06
    mOCTAVE_MINUS_1                                    ;; 0f:635b $ec
    mB_6                                               ;; 0f:635c $b6
    mOCTAVE_PLUS_1                                     ;; 0f:635d $e8
    mREPEAT_2 .data_0f_634e                            ;; 0f:635e $f9 $4e $63
    mCOUNTER $02                                       ;; 0f:6361 $f3 $02
.data_0f_6363:
    mDis_9                                             ;; 0f:6363 $39
    mCis_9                                             ;; 0f:6364 $19
    mC_9                                               ;; 0f:6365 $09
    mCis_6                                             ;; 0f:6366 $16
    mCis_9                                             ;; 0f:6367 $19
    mC_9                                               ;; 0f:6368 $09
    mCis_9                                             ;; 0f:6369 $19
    mDis_6                                             ;; 0f:636a $36
    mCis_6                                             ;; 0f:636b $16
    mJUMPIF $01, .data_0f_6375                         ;; 0f:636c $fb $01 $75 $63
    mC_6                                               ;; 0f:6370 $06
    mCis_6                                             ;; 0f:6371 $16
    mREPEAT .data_0f_6363                              ;; 0f:6372 $f2 $63 $63
.data_0f_6375:
    mC_9                                               ;; 0f:6375 $09
    mCis_6                                             ;; 0f:6376 $16
    mCis_9                                             ;; 0f:6377 $19
    mJUMP .data_0f_634c                                ;; 0f:6378 $f1 $4c $63

song03_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:637b $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:6381 $03
    mOCTAVE_2                                          ;; 0f:6382 $e2
    mRest_9                                            ;; 0f:6383 $d9
    mDis_9                                             ;; 0f:6384 $39
    mAis_13                                            ;; 0f:6385 $ad
    mG_13                                              ;; 0f:6386 $7d
    mDis_13                                            ;; 0f:6387 $3d
    mF_9                                               ;; 0f:6388 $59
    mD_9                                               ;; 0f:6389 $29
    mG_13                                              ;; 0f:638a $7d
    mFis_13                                            ;; 0f:638b $6d
    mG_13                                              ;; 0f:638c $7d
    mD_13                                              ;; 0f:638d $2d
    mCis_13                                            ;; 0f:638e $1d
    mD_13                                              ;; 0f:638f $2d
    mOCTAVE_MINUS_1                                    ;; 0f:6390 $ec
    mG_9                                               ;; 0f:6391 $79
    mOCTAVE_PLUS_1                                     ;; 0f:6392 $e8
    mRest_6                                            ;; 0f:6393 $d6
.data_0f_6394:
    mCOUNTER_2 $08                                     ;; 0f:6394 $fa $08
.data_0f_6396:
    mSTEREOPAN $03                                     ;; 0f:6396 $f6 $03
    mC_10                                              ;; 0f:6398 $0a
    mRest_14                                           ;; 0f:6399 $de
    mSTEREOPAN $02                                     ;; 0f:639a $f6 $02
    mFis_12                                            ;; 0f:639c $6c
    mG_12                                              ;; 0f:639d $7c
    mOCTAVE_MINUS_1                                    ;; 0f:639e $ec
    mSTEREOPAN $03                                     ;; 0f:639f $f6 $03
    mG_10                                              ;; 0f:63a1 $7a
    mRest_14                                           ;; 0f:63a2 $de
    mSTEREOPAN $01                                     ;; 0f:63a3 $f6 $01
    mOCTAVE_PLUS_1                                     ;; 0f:63a5 $e8
    mC_12                                              ;; 0f:63a6 $0c
    mG_12                                              ;; 0f:63a7 $7c
    mREPEAT_2 .data_0f_6396                            ;; 0f:63a8 $f9 $96 $63
    mCOUNTER_2 $08                                     ;; 0f:63ab $fa $08
.data_0f_63ad:
    mSTEREOPAN $03                                     ;; 0f:63ad $f6 $03
    mCis_10                                            ;; 0f:63af $1a
    mRest_14                                           ;; 0f:63b0 $de
    mSTEREOPAN $02                                     ;; 0f:63b1 $f6 $02
    mG_12                                              ;; 0f:63b3 $7c
    mGis_12                                            ;; 0f:63b4 $8c
    mOCTAVE_MINUS_1                                    ;; 0f:63b5 $ec
    mSTEREOPAN $03                                     ;; 0f:63b6 $f6 $03
    mGis_10                                            ;; 0f:63b8 $8a
    mRest_14                                           ;; 0f:63b9 $de
    mOCTAVE_PLUS_1                                     ;; 0f:63ba $e8
    mSTEREOPAN $01                                     ;; 0f:63bb $f6 $01
    mGis_12                                            ;; 0f:63bd $8c
    mOCTAVE_PLUS_1                                     ;; 0f:63be $e8
    mCis_12                                            ;; 0f:63bf $1c
    mOCTAVE_MINUS_1                                    ;; 0f:63c0 $ec
    mREPEAT_2 .data_0f_63ad                            ;; 0f:63c1 $f9 $ad $63
    mJUMP .data_0f_6394                                ;; 0f:63c4 $f1 $94 $63

song03_channel4:
    mRest_1                                            ;; 0f:63c7 $d1
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:63c8 $f0 $1b $66
    mRest_4                                            ;; 0f:63cb $d4
.data_0f_63cc:
    mSTEREOPAN $01                                     ;; 0f:63cc $f6 $01
    mG_6                                               ;; 0f:63ce $76
    mSTEREOPAN $02                                     ;; 0f:63cf $f6 $02
    mG_6                                               ;; 0f:63d1 $76
    mJUMP .data_0f_63cc                                ;; 0f:63d2 $f1 $cc $63

song0c_channel2:
    mINIT2 $96, frequencyDeltaData, data_0f_660f, $00  ;; 0f:63d5 $fe $96 $63 $66 $0f $66 $00
    mC_3                                               ;; 0f:63dc $03
.data_0f_63dd:
    mCOUNTER_2 $02                                     ;; 0f:63dd $fa $02
.data_0f_63df:
    mOCTAVE_3                                          ;; 0f:63df $e3
    mCOUNTER $04                                       ;; 0f:63e0 $f3 $04
.data_0f_63e2:
    mF_12                                              ;; 0f:63e2 $5c
    mFis_12                                            ;; 0f:63e3 $6c
    mREPEAT .data_0f_63e2                              ;; 0f:63e4 $f2 $e2 $63
    mOCTAVE_PLUS_1                                     ;; 0f:63e7 $e8
    mCOUNTER $04                                       ;; 0f:63e8 $f3 $04
.data_0f_63ea:
    mCis_12                                            ;; 0f:63ea $1c
    mC_12                                              ;; 0f:63eb $0c
    mREPEAT .data_0f_63ea                              ;; 0f:63ec $f2 $ea $63
    mREPEAT_2 .data_0f_63df                            ;; 0f:63ef $f9 $df $63
    mF_12                                              ;; 0f:63f2 $5c
    mC_12                                              ;; 0f:63f3 $0c
    mOCTAVE_MINUS_1                                    ;; 0f:63f4 $ec
    mF_12                                              ;; 0f:63f5 $5c
    mOCTAVE_PLUS_1                                     ;; 0f:63f6 $e8
    mF_12                                              ;; 0f:63f7 $5c
    mE_12                                              ;; 0f:63f8 $4c
    mOCTAVE_MINUS_1                                    ;; 0f:63f9 $ec
    mB_12                                              ;; 0f:63fa $bc
    mE_12                                              ;; 0f:63fb $4c
    mOCTAVE_PLUS_1                                     ;; 0f:63fc $e8
    mE_12                                              ;; 0f:63fd $4c
    mDis_12                                            ;; 0f:63fe $3c
    mOCTAVE_MINUS_1                                    ;; 0f:63ff $ec
    mAis_12                                            ;; 0f:6400 $ac
    mDis_12                                            ;; 0f:6401 $3c
    mOCTAVE_PLUS_1                                     ;; 0f:6402 $e8
    mDis_12                                            ;; 0f:6403 $3c
    mD_12                                              ;; 0f:6404 $2c
    mOCTAVE_MINUS_1                                    ;; 0f:6405 $ec
    mA_12                                              ;; 0f:6406 $9c
    mD_12                                              ;; 0f:6407 $2c
    mOCTAVE_PLUS_1                                     ;; 0f:6408 $e8
    mD_12                                              ;; 0f:6409 $2c
    mF_12                                              ;; 0f:640a $5c
    mDis_12                                            ;; 0f:640b $3c
    mCis_12                                            ;; 0f:640c $1c
    mC_12                                              ;; 0f:640d $0c
    mOCTAVE_MINUS_1                                    ;; 0f:640e $ec
    mAis_12                                            ;; 0f:640f $ac
    mA_12                                              ;; 0f:6410 $9c
    mAis_12                                            ;; 0f:6411 $ac
    mA_12                                              ;; 0f:6412 $9c
    mFis_12                                            ;; 0f:6413 $6c
    mF_12                                              ;; 0f:6414 $5c
    mDis_12                                            ;; 0f:6415 $3c
    mCis_12                                            ;; 0f:6416 $1c
    mC_12                                              ;; 0f:6417 $0c
    mDis_12                                            ;; 0f:6418 $3c
    mF_12                                              ;; 0f:6419 $5c
    mA_12                                              ;; 0f:641a $9c
    mOCTAVE_MINUS_1                                    ;; 0f:641b $ec
    mCOUNTER $02                                       ;; 0f:641c $f3 $02
.data_0f_641e:
    mVOLUME_ENVELOPE data_0f_6609                      ;; 0f:641e $f0 $09 $66
    mF_12                                              ;; 0f:6421 $5c
    mF_12                                              ;; 0f:6422 $5c
    mF_12                                              ;; 0f:6423 $5c
    mF_12                                              ;; 0f:6424 $5c
    mF_9                                               ;; 0f:6425 $59
    mFis_12                                            ;; 0f:6426 $6c
    mFis_12                                            ;; 0f:6427 $6c
    mFis_12                                            ;; 0f:6428 $6c
    mFis_12                                            ;; 0f:6429 $6c
    mFis_9                                             ;; 0f:642a $69
    mGis_12                                            ;; 0f:642b $8c
    mGis_12                                            ;; 0f:642c $8c
    mGis_12                                            ;; 0f:642d $8c
    mGis_12                                            ;; 0f:642e $8c
    mVOLUME_ENVELOPE data_0f_660f                      ;; 0f:642f $f0 $0f $66
    mGis_9                                             ;; 0f:6432 $89
    mOCTAVE_PLUS_1                                     ;; 0f:6433 $e8
    mJUMPIF $01, .data_0f_6445                         ;; 0f:6434 $fb $01 $45 $64
    mGis_12                                            ;; 0f:6438 $8c
    mOCTAVE_PLUS_1                                     ;; 0f:6439 $e8
    mD_12                                              ;; 0f:643a $2c
    mGis_12                                            ;; 0f:643b $8c
    mOCTAVE_MINUS_1                                    ;; 0f:643c $ec
    mGis_12                                            ;; 0f:643d $8c
    mOCTAVE_PLUS_1                                     ;; 0f:643e $e8
    mD_12                                              ;; 0f:643f $2c
    mGis_12                                            ;; 0f:6440 $8c
    mOCTAVE_MINUS_2                                    ;; 0f:6441 $ed
    mREPEAT .data_0f_641e                              ;; 0f:6442 $f2 $1e $64
.data_0f_6445:
    mB_12                                              ;; 0f:6445 $bc
    mAis_12                                            ;; 0f:6446 $ac
    mA_12                                              ;; 0f:6447 $9c
    mGis_12                                            ;; 0f:6448 $8c
    mG_12                                              ;; 0f:6449 $7c
    mFis_12                                            ;; 0f:644a $6c
    mJUMP .data_0f_63dd                                ;; 0f:644b $f1 $dd $63

song0c_channel1:
    mINIT1 frequencyDeltaData, data_0f_6613, $00       ;; 0f:644e $fe $63 $66 $13 $66 $00
    mC_3                                               ;; 0f:6454 $03
.data_0f_6455:
    mOCTAVE_2                                          ;; 0f:6455 $e2
    mSTEREOPAN $02                                     ;; 0f:6456 $f6 $02
    mC_12                                              ;; 0f:6458 $0c
    mF_12                                              ;; 0f:6459 $5c
    mC_12                                              ;; 0f:645a $0c
    mF_12                                              ;; 0f:645b $5c
    mSTEREOPAN $03                                     ;; 0f:645c $f6 $03
    mC_12                                              ;; 0f:645e $0c
    mF_12                                              ;; 0f:645f $5c
    mC_12                                              ;; 0f:6460 $0c
    mF_12                                              ;; 0f:6461 $5c
    mSTEREOPAN $01                                     ;; 0f:6462 $f6 $01
    mCis_12                                            ;; 0f:6464 $1c
    mFis_12                                            ;; 0f:6465 $6c
    mCis_12                                            ;; 0f:6466 $1c
    mFis_12                                            ;; 0f:6467 $6c
    mSTEREOPAN $03                                     ;; 0f:6468 $f6 $03
    mCis_12                                            ;; 0f:646a $1c
    mFis_12                                            ;; 0f:646b $6c
    mCis_12                                            ;; 0f:646c $1c
    mFis_12                                            ;; 0f:646d $6c
    mSTEREOPAN $02                                     ;; 0f:646e $f6 $02
    mDis_12                                            ;; 0f:6470 $3c
    mGis_12                                            ;; 0f:6471 $8c
    mDis_12                                            ;; 0f:6472 $3c
    mGis_12                                            ;; 0f:6473 $8c
    mSTEREOPAN $03                                     ;; 0f:6474 $f6 $03
    mDis_12                                            ;; 0f:6476 $3c
    mGis_12                                            ;; 0f:6477 $8c
    mDis_12                                            ;; 0f:6478 $3c
    mGis_12                                            ;; 0f:6479 $8c
    mSTEREOPAN $01                                     ;; 0f:647a $f6 $01
    mCis_12                                            ;; 0f:647c $1c
    mFis_12                                            ;; 0f:647d $6c
    mCis_12                                            ;; 0f:647e $1c
    mFis_12                                            ;; 0f:647f $6c
    mSTEREOPAN $03                                     ;; 0f:6480 $f6 $03
    mCis_12                                            ;; 0f:6482 $1c
    mFis_12                                            ;; 0f:6483 $6c
    mCis_12                                            ;; 0f:6484 $1c
    mFis_12                                            ;; 0f:6485 $6c
    mSTEREOPAN $02                                     ;; 0f:6486 $f6 $02
    mC_12                                              ;; 0f:6488 $0c
    mF_12                                              ;; 0f:6489 $5c
    mC_12                                              ;; 0f:648a $0c
    mF_12                                              ;; 0f:648b $5c
    mSTEREOPAN $01                                     ;; 0f:648c $f6 $01
    mCis_12                                            ;; 0f:648e $1c
    mFis_12                                            ;; 0f:648f $6c
    mCis_12                                            ;; 0f:6490 $1c
    mFis_12                                            ;; 0f:6491 $6c
    mSTEREOPAN $02                                     ;; 0f:6492 $f6 $02
    mDis_12                                            ;; 0f:6494 $3c
    mGis_12                                            ;; 0f:6495 $8c
    mDis_12                                            ;; 0f:6496 $3c
    mGis_12                                            ;; 0f:6497 $8c
    mSTEREOPAN $01                                     ;; 0f:6498 $f6 $01
    mCis_12                                            ;; 0f:649a $1c
    mFis_12                                            ;; 0f:649b $6c
    mCis_12                                            ;; 0f:649c $1c
    mFis_12                                            ;; 0f:649d $6c
    mCOUNTER $03                                       ;; 0f:649e $f3 $03
.data_0f_64a0:
    mSTEREOPAN $02                                     ;; 0f:64a0 $f6 $02
    mA_12                                              ;; 0f:64a2 $9c
    mF_12                                              ;; 0f:64a3 $5c
    mC_12                                              ;; 0f:64a4 $0c
    mJUMPIF $01, .data_0f_64b1                         ;; 0f:64a5 $fb $01 $b1 $64
    mSTEREOPAN $01                                     ;; 0f:64a9 $f6 $01
    mA_12                                              ;; 0f:64ab $9c
    mF_12                                              ;; 0f:64ac $5c
    mC_12                                              ;; 0f:64ad $0c
    mREPEAT .data_0f_64a0                              ;; 0f:64ae $f2 $a0 $64
.data_0f_64b1:
    mA_12                                              ;; 0f:64b1 $9c
    mCOUNTER $02                                       ;; 0f:64b2 $f3 $02
.data_0f_64b4:
    mSTEREOPAN $03                                     ;; 0f:64b4 $f6 $03
    mVOLUME_ENVELOPE data_0f_660b                      ;; 0f:64b6 $f0 $0b $66
    mC_12                                              ;; 0f:64b9 $0c
    mC_12                                              ;; 0f:64ba $0c
    mC_12                                              ;; 0f:64bb $0c
    mC_12                                              ;; 0f:64bc $0c
    mC_9                                               ;; 0f:64bd $09
    mCis_12                                            ;; 0f:64be $1c
    mCis_12                                            ;; 0f:64bf $1c
    mCis_12                                            ;; 0f:64c0 $1c
    mCis_12                                            ;; 0f:64c1 $1c
    mCis_9                                             ;; 0f:64c2 $19
    mDis_12                                            ;; 0f:64c3 $3c
    mDis_12                                            ;; 0f:64c4 $3c
    mDis_12                                            ;; 0f:64c5 $3c
    mDis_12                                            ;; 0f:64c6 $3c
    mDis_9                                             ;; 0f:64c7 $39
    mOCTAVE_PLUS_1                                     ;; 0f:64c8 $e8
    mVOLUME_ENVELOPE data_0f_6613                      ;; 0f:64c9 $f0 $13 $66
    mJUMPIF $01, .data_0f_64e1                         ;; 0f:64cc $fb $01 $e1 $64
    mSTEREOPAN $01                                     ;; 0f:64d0 $f6 $01
    mD_12                                              ;; 0f:64d2 $2c
    mGis_12                                            ;; 0f:64d3 $8c
    mOCTAVE_PLUS_1                                     ;; 0f:64d4 $e8
    mD_12                                              ;; 0f:64d5 $2c
    mSTEREOPAN $02                                     ;; 0f:64d6 $f6 $02
    mOCTAVE_MINUS_1                                    ;; 0f:64d8 $ec
    mD_12                                              ;; 0f:64d9 $2c
    mGis_12                                            ;; 0f:64da $8c
    mOCTAVE_PLUS_1                                     ;; 0f:64db $e8
    mD_12                                              ;; 0f:64dc $2c
    mOCTAVE_MINUS_2                                    ;; 0f:64dd $ed
    mREPEAT .data_0f_64b4                              ;; 0f:64de $f2 $b4 $64
.data_0f_64e1:
    mF_12                                              ;; 0f:64e1 $5c
    mE_12                                              ;; 0f:64e2 $4c
    mDis_12                                            ;; 0f:64e3 $3c
    mD_12                                              ;; 0f:64e4 $2c
    mCis_12                                            ;; 0f:64e5 $1c
    mC_12                                              ;; 0f:64e6 $0c
    mJUMP .data_0f_6455                                ;; 0f:64e7 $f1 $55 $64

song0c_channel3:
    mINIT3 frequencyDeltaData, $20, data_0f_66e2       ;; 0f:64ea $fe $63 $66 $20 $e2 $66
    mC_3                                               ;; 0f:64f0 $03
    mOCTAVE_1                                          ;; 0f:64f1 $e1
.data_0f_64f2:
    mCOUNTER_2 $10                                     ;; 0f:64f2 $fa $10
.data_0f_64f4:
    mF_10                                              ;; 0f:64f4 $5a
    mRest_14                                           ;; 0f:64f5 $de
    mFis_10                                            ;; 0f:64f6 $6a
    mRest_14                                           ;; 0f:64f7 $de
    mREPEAT_2 .data_0f_64f4                            ;; 0f:64f8 $f9 $f4 $64
    mCOUNTER_2 $02                                     ;; 0f:64fb $fa $02
.data_0f_64fd:
    mF_9                                               ;; 0f:64fd $59
    mRest_6                                            ;; 0f:64fe $d6
    mFis_9                                             ;; 0f:64ff $69
    mRest_6                                            ;; 0f:6500 $d6
    mGis_9                                             ;; 0f:6501 $89
    mRest_3                                            ;; 0f:6502 $d3
    mRest_9                                            ;; 0f:6503 $d9
    mREPEAT_2 .data_0f_64fd                            ;; 0f:6504 $f9 $fd $64
    mJUMP .data_0f_64f2                                ;; 0f:6507 $f1 $f2 $64

song0c_channel4:
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:650a $f0 $1b $66
.data_0f_650d:
    mSTEREOPAN $01                                     ;; 0f:650d $f6 $01
    mA_9                                               ;; 0f:650f $99
    mB_12                                              ;; 0f:6510 $bc
    mB_12                                              ;; 0f:6511 $bc
    mSTEREOPAN $02                                     ;; 0f:6512 $f6 $02
    mA_9                                               ;; 0f:6514 $99
    mB_12                                              ;; 0f:6515 $bc
    mB_12                                              ;; 0f:6516 $bc
    mJUMP .data_0f_650d                                ;; 0f:6517 $f1 $0d $65

song04_channel2:
    mINIT2 $78, frequencyDeltaData, data_0f_65df, $c0  ;; 0f:651a $fe $78 $63 $66 $df $65 $c0
    mC_3                                               ;; 0f:6521 $03
    mRest_4                                            ;; 0f:6522 $d4
    mOCTAVE_1                                          ;; 0f:6523 $e1
.data_0f_6524:
    mCOUNTER $02                                       ;; 0f:6524 $f3 $02
.data_0f_6526:
    mE_6                                               ;; 0f:6526 $46
    mG_6                                               ;; 0f:6527 $76
    mB_6                                               ;; 0f:6528 $b6
    mE_6                                               ;; 0f:6529 $46
    mG_3                                               ;; 0f:652a $73
    mDis_6                                             ;; 0f:652b $36
    mFis_6                                             ;; 0f:652c $66
    mB_6                                               ;; 0f:652d $b6
    mDis_6                                             ;; 0f:652e $36
    mFis_3                                             ;; 0f:652f $63
    mD_6                                               ;; 0f:6530 $26
    mG_6                                               ;; 0f:6531 $76
    mB_6                                               ;; 0f:6532 $b6
    mD_6                                               ;; 0f:6533 $26
    mG_3                                               ;; 0f:6534 $73
    mCis_6                                             ;; 0f:6535 $16
    mF_6                                               ;; 0f:6536 $56
    mB_6                                               ;; 0f:6537 $b6
    mCis_6                                             ;; 0f:6538 $16
    mF_3                                               ;; 0f:6539 $53
    mC_6                                               ;; 0f:653a $06
    mE_6                                               ;; 0f:653b $46
    mB_6                                               ;; 0f:653c $b6
    mC_6                                               ;; 0f:653d $06
    mE_3                                               ;; 0f:653e $43
    mJUMPIF $01, .data_0f_6555                         ;; 0f:653f $fb $01 $55 $65
    mDis_6                                             ;; 0f:6543 $36
    mFis_6                                             ;; 0f:6544 $66
    mB_6                                               ;; 0f:6545 $b6
    mDis_6                                             ;; 0f:6546 $36
    mFis_3                                             ;; 0f:6547 $63
    mD_6                                               ;; 0f:6548 $26
    mG_6                                               ;; 0f:6549 $76
    mB_6                                               ;; 0f:654a $b6
    mD_6                                               ;; 0f:654b $26
    mG_3                                               ;; 0f:654c $73
    mDis_6                                             ;; 0f:654d $36
    mFis_6                                             ;; 0f:654e $66
    mB_6                                               ;; 0f:654f $b6
    mDis_6                                             ;; 0f:6550 $36
    mFis_3                                             ;; 0f:6551 $63
    mREPEAT .data_0f_6526                              ;; 0f:6552 $f2 $26 $65
.data_0f_6555:
    mD_6                                               ;; 0f:6555 $26
    mFis_6                                             ;; 0f:6556 $66
    mB_6                                               ;; 0f:6557 $b6
    mD_6                                               ;; 0f:6558 $26
    mFis_3                                             ;; 0f:6559 $63
    mE_6                                               ;; 0f:655a $46
    mG_6                                               ;; 0f:655b $76
    mB_6                                               ;; 0f:655c $b6
    mE_6                                               ;; 0f:655d $46
    mG_3                                               ;; 0f:655e $73
    mE_6                                               ;; 0f:655f $46
    mG_6                                               ;; 0f:6560 $76
    mB_6                                               ;; 0f:6561 $b6
    mDis_6                                             ;; 0f:6562 $36
    mFis_6                                             ;; 0f:6563 $66
    mB_6                                               ;; 0f:6564 $b6
    mJUMP .data_0f_6524                                ;; 0f:6565 $f1 $24 $65

song04_channel1:
    mINIT1 data_0f_667a, data_0f_65fb, $40             ;; 0f:6568 $fe $7a $66 $fb $65 $40
    mC_3                                               ;; 0f:656e $03
    mOCTAVE_2                                          ;; 0f:656f $e2
.data_0f_6570:
    mCOUNTER $02                                       ;; 0f:6570 $f3 $02
.data_0f_6572:
    mB_4                                               ;; 0f:6572 $b4
    mOCTAVE_PLUS_1                                     ;; 0f:6573 $e8
    mE_1                                               ;; 0f:6574 $41
    mWait_9                                            ;; 0f:6575 $c9
    mE_4                                               ;; 0f:6576 $44
    mDis_1                                             ;; 0f:6577 $31
    mWait_9                                            ;; 0f:6578 $c9
    mDis_4                                             ;; 0f:6579 $34
    mD_1                                               ;; 0f:657a $21
    mWait_9                                            ;; 0f:657b $c9
    mD_4                                               ;; 0f:657c $24
    mCis_1                                             ;; 0f:657d $11
    mWait_9                                            ;; 0f:657e $c9
    mCis_4                                             ;; 0f:657f $14
    mJUMPIF $01, .data_0f_6593                         ;; 0f:6580 $fb $01 $93 $65
    mC_1                                               ;; 0f:6584 $01
    mWait_9                                            ;; 0f:6585 $c9
    mC_4                                               ;; 0f:6586 $04
    mOCTAVE_MINUS_1                                    ;; 0f:6587 $ec
    mB_1                                               ;; 0f:6588 $b1
    mWait_9                                            ;; 0f:6589 $c9
    mB_4                                               ;; 0f:658a $b4
    mG_1                                               ;; 0f:658b $71
    mWait_9                                            ;; 0f:658c $c9
    mG_4                                               ;; 0f:658d $74
    mFis_1                                             ;; 0f:658e $61
    mWait_9                                            ;; 0f:658f $c9
    mREPEAT .data_0f_6572                              ;; 0f:6590 $f2 $72 $65
.data_0f_6593:
    mC_1                                               ;; 0f:6593 $01
    mC_3                                               ;; 0f:6594 $03
    mD_1                                               ;; 0f:6595 $21
    mOCTAVE_MINUS_1                                    ;; 0f:6596 $ec
    mB_3                                               ;; 0f:6597 $b3
    mA_2                                               ;; 0f:6598 $92
    mG_3                                               ;; 0f:6599 $73
    mFis_6                                             ;; 0f:659a $66
    mE_1                                               ;; 0f:659b $41
    mWait_9                                            ;; 0f:659c $c9
    mJUMP .data_0f_6570                                ;; 0f:659d $f1 $70 $65

song04_channel3:
    mINIT3 data_0f_667a, $20, data_0f_66c2             ;; 0f:65a0 $fe $7a $66 $20 $c2 $66
    mC_3                                               ;; 0f:65a6 $03
    mOCTAVE_3                                          ;; 0f:65a7 $e3
    mCOUNTER $03                                       ;; 0f:65a8 $f3 $03
.data_0f_65aa:
    mE_4                                               ;; 0f:65aa $44
    mG_1                                               ;; 0f:65ab $71
    mRest_9                                            ;; 0f:65ac $d9
    mG_4                                               ;; 0f:65ad $74
    mA_1                                               ;; 0f:65ae $91
    mRest_9                                            ;; 0f:65af $d9
    mA_4                                               ;; 0f:65b0 $94
    mB_0                                               ;; 0f:65b1 $b0
.data_0f_65b2:
    mWait_2                                            ;; 0f:65b2 $c2
    mVOLUME $60                                        ;; 0f:65b3 $f0 $60
    mWait_6                                            ;; 0f:65b5 $c6
    mVOLUME $20                                        ;; 0f:65b6 $f0 $20
    mRest_9                                            ;; 0f:65b8 $d9
    mREPEAT .data_0f_65aa                              ;; 0f:65b9 $f2 $aa $65
    mRest_4                                            ;; 0f:65bc $d4
    mB_3                                               ;; 0f:65bd $b3
    mA_3                                               ;; 0f:65be $93
    mG_3                                               ;; 0f:65bf $73
    mFis_3                                             ;; 0f:65c0 $63
    mE_3                                               ;; 0f:65c1 $43
    mD_3                                               ;; 0f:65c2 $23
    mE_0                                               ;; 0f:65c3 $40
    mCOUNTER $04                                       ;; 0f:65c4 $f3 $04
    mJUMP .data_0f_65b2                                ;; 0f:65c6 $f1 $b2 $65

song04_channel4:
    mRest_4                                            ;; 0f:65c9 $d4
    mVOLUME_ENVELOPE data_0f_661b                      ;; 0f:65ca $f0 $1b $66
.data_0f_65cd:
    mSTEREOPAN $02                                     ;; 0f:65cd $f6 $02
    mF_6                                               ;; 0f:65cf $56
    mSTEREOPAN $01                                     ;; 0f:65d0 $f6 $01
    mA_6                                               ;; 0f:65d2 $96
    mB_6                                               ;; 0f:65d3 $b6
    mJUMP .data_0f_65cd                                ;; 0f:65d4 $f1 $cd $65

volumeEnvelopeData:
    db   $01, $d1, $63, $b5                            ;; 0f:65d7 ????

data_0f_65db:
    db   $01, $c1, $63, $95                            ;; 0f:65db ????

data_0f_65df:
    db   $01, $b1, $63, $85                            ;; 0f:65df ????

data_0f_65e3:
    db   $01, $a1, $63, $75                            ;; 0f:65e3 ....

data_0f_65e7:
    db   $01, $91, $63, $65                            ;; 0f:65e7 ????

data_0f_65eb:
    db   $01, $81, $63, $55                            ;; 0f:65eb ....

data_0f_65ef:
    db   $02, $79, $63, $a7                            ;; 0f:65ef ????

data_0f_65f3:
    db   $02, $79, $63, $97                            ;; 0f:65f3 ????

data_0f_65f7:
    db   $02, $79, $63, $87                            ;; 0f:65f7 ....

data_0f_65fb:
    db   $02, $79, $63, $77                            ;; 0f:65fb ????

data_0f_65ff:
    db   $02, $79, $63, $67                            ;; 0f:65ff ????

data_0f_6603:
    db   $02, $79, $63, $57, $63, $d2                  ;; 0f:6603 ??????

data_0f_6609:
    db   $63, $c2                                      ;; 0f:6609 ..

data_0f_660b:
    db   $63, $92                                      ;; 0f:660b ..

data_0f_660d:
    db   $63, $d3                                      ;; 0f:660d ??

data_0f_660f:
    db   $63, $c3                                      ;; 0f:660f ..

data_0f_6611:
    db   $63, $a3                                      ;; 0f:6611 ..

data_0f_6613:
    db   $63, $93                                      ;; 0f:6613 ..

data_0f_6615:
    db   $63, $83                                      ;; 0f:6615 ??

data_0f_6617:
    db   $63, $73                                      ;; 0f:6617 ??

data_0f_6619:
    db   $63, $53                                      ;; 0f:6619 ..

data_0f_661b:
    db   $01, $60, $63, $00                            ;; 0f:661b ....

data_0f_661f:
    db   $63, $e1                                      ;; 0f:661f ..

data_0f_6621:
    db   $03, $d2, $63, $a7                            ;; 0f:6621 ....

data_0f_6625:
    db   $03, $d2, $0a, $a0, $63, $a7                  ;; 0f:6625 ......

data_0f_662b:
    db   $02, $69, $0e, $a0, $63, $a7                  ;; 0f:662b ......

data_0f_6631:
    db   $02, $49, $0e, $80, $63, $87                  ;; 0f:6631 ......

data_0f_6637:
    db   $01, $69, $0a, $77, $63, $50                  ;; 0f:6637 ??????

data_0f_663d:
    db   $03, $b1, $63, $67                            ;; 0f:663d ....

data_0f_6641:
    db   $03, $d1, $63, $97                            ;; 0f:6641 ....

data_0f_6645:
    db   $03, $c2, $18, $90, $63, $80                  ;; 0f:6645 ......

data_0f_664b:
    db   $03, $92, $18, $60, $63, $50                  ;; 0f:664b ??????

data_0f_6651:
    db   $02, $d1, $04, $95, $63, $97                  ;; 0f:6651 ......

data_0f_6657:
    db   $02, $b1, $04, $75, $63, $77, $63, $a7        ;; 0f:6657 ......??
    db   $63, $97, $ff, $00                            ;; 0f:665f ..??

frequencyDeltaData:
    db   $63, $00, $00, $63, $66                       ;; 0f:6663 .w???

data_0f_6668:
    db   $08, $00, $02, $ff, $02, $00, $00, $6a        ;; 0f:6668 .w.w.w..
    db   $66                                           ;; 0f:6670 .

data_0f_6671:
    db   $04, $00, $01, $01, $01, $00, $00, $73        ;; 0f:6671 ????????
    db   $66                                           ;; 0f:6679 ?

data_0f_667a:
    db   $05, $00, $01, $00, $01, $02, $01, $00        ;; 0f:667a .w.w.w.w
    db   $01, $fe, $00, $7c, $66                       ;; 0f:6682 .w...

data_0f_6687:
    db   $63, $ff, $00, $87, $66                       ;; 0f:6687 ?????

data_0f_668c:
    db   $02, $00, $01, $01, $01, $00, $01, $ff        ;; 0f:668c .w.w.w.w
    db   $01, $00, $01, $02, $01, $00, $01, $fe        ;; 0f:6694 .w.w.w.w
    db   $01, $00, $01, $03, $01, $00, $01, $fd        ;; 0f:669c .w.w.w.w
    db   $01, $00, $00, $9e, $66                       ;; 0f:66a4 .w...

data_0f_66a9:
    db   $08, $00, $01, $ff, $01, $00, $00, $ab        ;; 0f:66a9 .w.w.w..
    db   $66                                           ;; 0f:66b1 .

;@data format=bbbbbbbbbbbbbbbb amount=4
wavePatternsData:
    db   $ac, $ee, $dc, $ba, $ab, $cd, $ee, $ca, $63, $21, $12, $45, $54, $32, $11, $24 ;; 0f:66b2 ???????????????? $00

data_0f_66c2:
    db   $df, $ff, $fc, $86, $12, $8b, $de, $dc, $42, $12, $46, $de, $97, $41, $00, $02 ;; 0f:66c2 ???????????????? $01

data_0f_66d2:
    db   $ee, $dd, $cc, $bb, $aa, $99, $98, $88, $77, $76, $66, $55, $44, $33, $22, $11 ;; 0f:66d2 ................ $02

data_0f_66e2:
    db   $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $00, $00, $00, $00, $00, $00, $00, $00 ;; 0f:66e2 ................ $03

;@data format=p amount=65
soundEffectDataChannel1:
    dw   data_0f_67fc                                  ;; 0f:66f2 .. $00
    dw   $0000                                         ;; 0f:66f4 ?? $01
    dw   data_0f_6817                                  ;; 0f:66f6 .. $02
    dw   data_0f_6825                                  ;; 0f:66f8 ?? $03
    dw   data_0f_6836                                  ;; 0f:66fa ?? $04
    dw   data_0f_67f6                                  ;; 0f:66fc ?? $05
    dw   $0000                                         ;; 0f:66fe ?? $06
    dw   data_0f_685c                                  ;; 0f:6700 ?? $07
    dw   data_0f_6867                                  ;; 0f:6702 ?? $08
    dw   data_0f_6875                                  ;; 0f:6704 ?? $09
    dw   data_0f_6886                                  ;; 0f:6706 ?? $0a
    dw   data_0f_689c                                  ;; 0f:6708 ?? $0b
    dw   $0000                                         ;; 0f:670a .. $0c
    dw   data_0f_68b7                                  ;; 0f:670c .. $0d
    dw   data_0f_68b1                                  ;; 0f:670e .. $0e
    dw   data_0f_68d2                                  ;; 0f:6710 .. $0f
    dw   data_0f_68dd                                  ;; 0f:6712 ?? $10
    dw   $0000                                         ;; 0f:6714 ?? $11
    dw   data_0f_68e8                                  ;; 0f:6716 ?? $12
    dw   $0000                                         ;; 0f:6718 ?? $13
    dw   $0000                                         ;; 0f:671a ?? $14
    dw   data_0f_691a                                  ;; 0f:671c .. $15
    dw   data_0f_692e                                  ;; 0f:671e .. $16
    dw   data_0f_6935                                  ;; 0f:6720 ?? $17
    dw   data_0f_693c                                  ;; 0f:6722 ?? $18
    dw   data_0f_694b                                  ;; 0f:6724 ?? $19
    dw   data_0f_6964                                  ;; 0f:6726 ?? $1a
    dw   data_0f_69af                                  ;; 0f:6728 ?? $1b
    dw   data_0f_6996                                  ;; 0f:672a ?? $1c
    dw   data_0f_69c4                                  ;; 0f:672c ?? $1d
    dw   $0000                                         ;; 0f:672e ?? $1e
    dw   data_0f_69cf                                  ;; 0f:6730 ?? $1f
    dw   data_0f_69d6                                  ;; 0f:6732 ?? $20
    dw   data_0f_69e1                                  ;; 0f:6734 .. $21
    dw   $0000                                         ;; 0f:6736 ?? $22
    dw   data_0f_69fe                                  ;; 0f:6738 ?? $23
    dw   data_0f_6a0b                                  ;; 0f:673a ?? $24
    dw   data_0f_6a1f                                  ;; 0f:673c .. $25
    dw   data_0f_6a2a                                  ;; 0f:673e ?? $26
    dw   data_0f_6a49                                  ;; 0f:6740 ?? $27
    dw   $0000                                         ;; 0f:6742 .. $28
    dw   $0000                                         ;; 0f:6744 ?? $29
    dw   data_0f_6a72                                  ;; 0f:6746 ?? $2a
    dw   data_0f_6a8f                                  ;; 0f:6748 ?? $2b
    dw   data_0f_6a9a                                  ;; 0f:674a ?? $2c
    dw   data_0f_6ab1                                  ;; 0f:674c ?? $2d
    dw   data_0f_6ac7                                  ;; 0f:674e .. $2e
    dw   data_0f_6acd                                  ;; 0f:6750 .. $2f
    dw   data_0f_6ae7                                  ;; 0f:6752 ?? $30
    dw   $0000                                         ;; 0f:6754 ?? $31
    dw   data_0f_6b03                                  ;; 0f:6756 ?? $32
    dw   $0000                                         ;; 0f:6758 ?? $33
    dw   data_0f_6b19                                  ;; 0f:675a ?? $34
    dw   $0000                                         ;; 0f:675c .. $35
    dw   data_0f_6b0e                                  ;; 0f:675e ?? $36
    dw   $0000                                         ;; 0f:6760 ?? $37
    dw   data_0f_6b32                                  ;; 0f:6762 ?? $38
    dw   data_0f_6b39                                  ;; 0f:6764 .. $39
    dw   data_0f_6b46                                  ;; 0f:6766 .. $3a
    dw   data_0f_6b57                                  ;; 0f:6768 .. $3b
    dw   data_0f_6b70                                  ;; 0f:676a .. $3c
    dw   data_0f_6b89                                  ;; 0f:676c .. $3d
    dw   data_0f_6b90                                  ;; 0f:676e ?? $3e
    dw   $0000                                         ;; 0f:6770 ?? $3f
    dw   $0000                                         ;; 0f:6772 ?? $40

;@data format=p amount=65
soundEffectDataChannel4:
    dw   data_0f_6809                                  ;; 0f:6774 .. $00
    dw   data_0f_6810                                  ;; 0f:6776 ?? $01
    dw   data_0f_681e                                  ;; 0f:6778 .. $02
    dw   data_0f_682c                                  ;; 0f:677a ?? $03
    dw   data_0f_684b                                  ;; 0f:677c ?? $04
    dw   data_0f_6803                                  ;; 0f:677e ?? $05
    dw   data_0f_6852                                  ;; 0f:6780 ?? $06
    dw   data_0f_6863                                  ;; 0f:6782 ?? $07
    dw   data_0f_686e                                  ;; 0f:6784 ?? $08
    dw   data_0f_6882                                  ;; 0f:6786 ?? $09
    dw   data_0f_6891                                  ;; 0f:6788 ?? $0a
    dw   data_0f_68a3                                  ;; 0f:678a ?? $0b
    dw   data_0f_68aa                                  ;; 0f:678c .. $0c
    dw   data_0f_68c8                                  ;; 0f:678e .. $0d
    dw   data_0f_68c2                                  ;; 0f:6790 .. $0e
    dw   data_0f_68d9                                  ;; 0f:6792 .. $0f
    dw   $0000                                         ;; 0f:6794 ?? $10
    dw   data_0f_68e4                                  ;; 0f:6796 ?? $11
    dw   data_0f_68f5                                  ;; 0f:6798 ?? $12
    dw   data_0f_68f9                                  ;; 0f:679a ?? $13
    dw   data_0f_6903                                  ;; 0f:679c ?? $14
    dw   data_0f_6921                                  ;; 0f:679e .. $15
    dw   $0000                                         ;; 0f:67a0 .. $16
    dw   $0000                                         ;; 0f:67a2 ?? $17
    dw   data_0f_6947                                  ;; 0f:67a4 ?? $18
    dw   $0000                                         ;; 0f:67a6 ?? $19
    dw   data_0f_6989                                  ;; 0f:67a8 ?? $1a
    dw   data_0f_69b6                                  ;; 0f:67aa ?? $1b
    dw   $0000                                         ;; 0f:67ac ?? $1c
    dw   data_0f_69cb                                  ;; 0f:67ae ?? $1d
    dw   data_0f_69ba                                  ;; 0f:67b0 ?? $1e
    dw   $0000                                         ;; 0f:67b2 ?? $1f
    dw   $0000                                         ;; 0f:67b4 ?? $20
    dw   data_0f_69ec                                  ;; 0f:67b6 .. $21
    dw   data_0f_69f7                                  ;; 0f:67b8 ?? $22
    dw   $0000                                         ;; 0f:67ba ?? $23
    dw   data_0f_6a18                                  ;; 0f:67bc ?? $24
    dw   data_0f_6a26                                  ;; 0f:67be .. $25
    dw   $0000                                         ;; 0f:67c0 ?? $26
    dw   $0000                                         ;; 0f:67c2 ?? $27
    dw   data_0f_6a56                                  ;; 0f:67c4 .. $28
    dw   data_0f_6a67                                  ;; 0f:67c6 ?? $29
    dw   $0000                                         ;; 0f:67c8 ?? $2a
    dw   $0000                                         ;; 0f:67ca ?? $2b
    dw   data_0f_6aa7                                  ;; 0f:67cc ?? $2c
    dw   data_0f_6abc                                  ;; 0f:67ce ?? $2d
    dw   data_0f_6ad4                                  ;; 0f:67d0 .. $2e
    dw   data_0f_6add                                  ;; 0f:67d2 .. $2f
    dw   $0000                                         ;; 0f:67d4 ?? $30
    dw   data_0f_6af8                                  ;; 0f:67d6 ?? $31
    dw   data_0f_6b0a                                  ;; 0f:67d8 ?? $32
    dw   data_0f_6b15                                  ;; 0f:67da ?? $33
    dw   $0000                                         ;; 0f:67dc ?? $34
    dw   data_0f_6b20                                  ;; 0f:67de .. $35
    dw   data_0f_6b15                                  ;; 0f:67e0 ?? $36
    dw   data_0f_6b2b                                  ;; 0f:67e2 ?? $37
    dw   $0000                                         ;; 0f:67e4 ?? $38
    dw   $0000                                         ;; 0f:67e6 .. $39
    dw   $0000                                         ;; 0f:67e8 .. $3a
    dw   $0000                                         ;; 0f:67ea .. $3b
    dw   $0000                                         ;; 0f:67ec .. $3c
    dw   data_0f_6b97                                  ;; 0f:67ee .. $3d
    dw   $0000                                         ;; 0f:67f0 ?? $3e
    dw   data_0f_6b97                                  ;; 0f:67f2 ?? $3f
    dw   data_0f_6ba4                                  ;; 0f:67f4 ?? $40

data_0f_67f6:
    db   $0b, $14, $00, $f1, $70, $82                  ;; 0f:67f6 ??????

data_0f_67fc:
    db   $08, $14, $c0, $f0, $70, $82, $00             ;; 0f:67fc .......

data_0f_6803:
    db   $04, $f1, $42, $07, $f1, $31                  ;; 0f:6803 ??????

data_0f_6809:
    db   $04, $f0, $61, $05, $f3, $41, $00             ;; 0f:6809 .......

data_0f_6810:
    db   $03, $f0, $31, $05, $f1, $42, $00             ;; 0f:6810 ???????

data_0f_6817:
    db   $09, $14, $40, $f0, $c0, $83, $00             ;; 0f:6817 .......

data_0f_681e:
    db   $08, $1a, $35, $05, $f1, $25, $00             ;; 0f:681e .......

data_0f_6825:
    db   $08, $1c, $c0, $f1, $00, $83, $00             ;; 0f:6825 ???????

data_0f_682c:
    db   $02, $c0, $33, $06, $f1, $53, $04, $d1        ;; 0f:682c ????????
    db   $32, $00                                      ;; 0f:6834 ??

data_0f_6836:
    db   $f2, $06, $14, $40, $a9, $80, $84, $ef        ;; 0f:6836 ????????
    db   $37, $68, $f2, $06, $14, $40, $59, $80        ;; 0f:683e ????????
    db   $84, $ef, $41, $68, $00                       ;; 0f:6846 ?????

data_0f_684b:
    db   $09, $69, $31, $09, $d1, $31, $00             ;; 0f:684b ???????

data_0f_6852:
    db   $02, $f1, $60, $01, $00, $77, $08, $f1        ;; 0f:6852 ????????
    db   $60, $00                                      ;; 0f:685a ??

data_0f_685c:
    db   $0a, $14, $40, $a9, $80, $84, $00             ;; 0f:685c ???????

data_0f_6863:
    db   $14, $f2, $50, $00                            ;; 0f:6863 ????

data_0f_6867:
    db   $23, $46, $00, $e0, $10, $82, $00             ;; 0f:6867 ???????

data_0f_686e:
    db   $03, $f2, $31, $20, $6a, $3b, $00             ;; 0f:686e ???????

data_0f_6875:
    db   $05, $1a, $00, $f1, $20, $81, $0a, $00        ;; 0f:6875 ????????
    db   $c0, $d1, $f0, $87, $00                       ;; 0f:687d ?????

data_0f_6882:
    db   $14, $f2, $23, $00                            ;; 0f:6882 ????

data_0f_6886:
    db   $f7, $03, $1c, $80, $f0, $e0, $87, $ef        ;; 0f:6886 ????????
    db   $87, $68, $00                                 ;; 0f:688e ???

data_0f_6891:
    db   $f7, $02, $f1, $3c, $01, $00, $4f, $ef        ;; 0f:6891 ????????
    db   $92, $68, $00                                 ;; 0f:6899 ???

data_0f_689c:
    db   $19, $08, $c0, $e0, $93, $87, $00             ;; 0f:689c ???????

data_0f_68a3:
    db   $05, $f0, $27, $14, $f0, $17, $00             ;; 0f:68a3 ???????

data_0f_68aa:
    db   $04, $f0, $71, $28, $39, $71, $00             ;; 0f:68aa .......

data_0f_68b1:
    db   $1e, $2f, $80, $4b, $ff, $87                  ;; 0f:68b1 ......

data_0f_68b7:
    db   $f2, $04, $1b, $c0, $f0, $00, $87, $ef        ;; 0f:68b7 ........
    db   $b8, $68, $00                                 ;; 0f:68bf ...

data_0f_68c2:
    db   $14, $09, $40, $0a, $f0, $41                  ;; 0f:68c2 ......

data_0f_68c8:
    db   $03, $f0, $61, $01, $00, $61, $08, $f2        ;; 0f:68c8 ........
    db   $61, $00                                      ;; 0f:68d0 ..

data_0f_68d2:
    db   $0c, $1b, $c0, $f2, $00, $87, $00             ;; 0f:68d2 .......

data_0f_68d9:
    db   $0c, $f1, $70, $00                            ;; 0f:68d9 ....

data_0f_68dd:
    db   $08, $1f, $40, $f1, $c0, $87, $00             ;; 0f:68dd ???????

data_0f_68e4:
    db   $1c, $09, $32, $00                            ;; 0f:68e4 ????

data_0f_68e8:
    db   $32, $1f, $00, $f0, $ff, $87, $32, $17        ;; 0f:68e8 ????????
    db   $00, $f0, $80, $83, $00                       ;; 0f:68f0 ?????

data_0f_68f5:
    db   $64, $f0, $5b, $00                            ;; 0f:68f5 ????

data_0f_68f9:
    db   $05, $89, $40, $06, $f0, $71, $14, $f2        ;; 0f:68f9 ????????
    db   $70, $00                                      ;; 0f:6901 ??

data_0f_6903:
    db   $f2, $0c, $f1, $3e, $06, $f1, $3e, $06        ;; 0f:6903 ????????
    db   $f1, $3e, $06, $f1, $2e, $0c, $f1, $3e        ;; 0f:690b ????????
    db   $06, $f1, $3e, $ef, $04, $69, $00             ;; 0f:6913 ???????

data_0f_691a:
    db   $4b, $1c, $00, $f0, $ff, $87, $00             ;; 0f:691a ......?

data_0f_6921:
    db   $03, $f1, $30, $0a, $f0, $a8, $19, $f0        ;; 0f:6921 ........
    db   $47, $28, $f0, $67, $00                       ;; 0f:6929 .????

data_0f_692e:
    db   $11, $26, $80, $f0, $00, $86, $00             ;; 0f:692e .......

data_0f_6935:
    db   $0f, $46, $40, $99, $10, $87, $00             ;; 0f:6935 ???????

data_0f_693c:
    db   $f3, $0c, $4f, $40, $d9, $ff, $87, $ef        ;; 0f:693c ????????
    db   $3d, $69, $00                                 ;; 0f:6944 ???

data_0f_6947:
    db   $24, $0a, $40, $00                            ;; 0f:6947 ????

data_0f_694b:
    db   $14, $16, $80, $f5, $10, $84, $14, $16        ;; 0f:694b ????????
    db   $80, $d5, $10, $84, $14, $16, $80, $b5        ;; 0f:6953 ????????
    db   $10, $84, $14, $16, $80, $95, $10, $84        ;; 0f:695b ????????
    db   $00                                           ;; 0f:6963 ?

data_0f_6964:
    db   $14, $26, $40, $f0, $00, $84, $14, $26        ;; 0f:6964 ????????
    db   $40, $f0, $60, $84, $14, $26, $40, $f0        ;; 0f:696c ????????
    db   $c0, $84, $14, $26, $40, $f0, $20, $85        ;; 0f:6974 ????????
    db   $1e, $26, $40, $f0, $80, $85, $3c, $1e        ;; 0f:697c ????????
    db   $00, $f7, $ff, $87, $00                       ;; 0f:6984 ?????

data_0f_6989:
    db   $64, $f0, $b8, $0a, $00, $00, $1e, $f0        ;; 0f:6989 ????????
    db   $50, $1e, $f3, $62, $00                       ;; 0f:6991 ?????

data_0f_6996:
    db   $0f, $3f, $c0, $59, $20, $87, $0f, $3f        ;; 0f:6996 ????????
    db   $c0, $59, $10, $87, $0f, $3f, $c0, $59        ;; 0f:699e ????????
    db   $00, $87, $0f, $3f, $c0, $59, $f0, $86        ;; 0f:69a6 ????????
    db   $00                                           ;; 0f:69ae ?

data_0f_69af:
    db   $0f, $1d, $c0, $f3, $80, $86, $00             ;; 0f:69af ???????

data_0f_69b6:
    db   $0f, $f0, $35, $00                            ;; 0f:69b6 ????

data_0f_69ba:
    db   $18, $19, $70, $12, $39, $40, $1e, $f3        ;; 0f:69ba ????????
    db   $10, $00                                      ;; 0f:69c2 ??

data_0f_69c4:
    db   $0a, $13, $c0, $f0, $b0, $82, $00             ;; 0f:69c4 ???????

data_0f_69cb:
    db   $0a, $f1, $23, $00                            ;; 0f:69cb ????

data_0f_69cf:
    db   $0f, $7f, $80, $f0, $d8, $87, $00             ;; 0f:69cf ???????

data_0f_69d6:
    db   $f3, $0a, $15, $80, $f0, $b0, $85, $ef        ;; 0f:69d6 ????????
    db   $d7, $69, $00                                 ;; 0f:69de ???

data_0f_69e1:
    db   $f7, $06, $1b, $c0, $f1, $00, $86, $ef        ;; 0f:69e1 ........
    db   $e2, $69, $00                                 ;; 0f:69e9 ...

data_0f_69ec:
    db   $f7, $03, $f0, $5c, $03, $f1, $5d, $ef        ;; 0f:69ec ........
    db   $ed, $69, $00                                 ;; 0f:69f4 ...

data_0f_69f7:
    db   $04, $f1, $3d, $1e, $f3, $3d, $00             ;; 0f:69f7 ???????

data_0f_69fe:
    db   $04, $00, $80, $f1, $df, $87, $14, $00        ;; 0f:69fe ????????
    db   $80, $f2, $e1, $87, $00                       ;; 0f:6a06 ?????

data_0f_6a0b:
    db   $0f, $00, $00, $09, $8c, $86, $0f, $00        ;; 0f:6a0b ????????
    db   $00, $f1, $8c, $86, $00                       ;; 0f:6a13 ?????

data_0f_6a18:
    db   $0f, $09, $0e, $0f, $f1, $0e, $00             ;; 0f:6a18 ???????

data_0f_6a1f:
    db   $0c, $00, $80, $f0, $f3, $87, $00             ;; 0f:6a1f .......

data_0f_6a26:
    db   $0c, $f0, $41, $00                            ;; 0f:6a26 ....

data_0f_6a2a:
    db   $08, $14, $80, $f0, $00, $83, $08, $14        ;; 0f:6a2a ????????
    db   $80, $f0, $00, $84, $08, $14, $80, $f0        ;; 0f:6a32 ????????
    db   $00, $85, $08, $14, $80, $f0, $00, $86        ;; 0f:6a3a ????????
    db   $08, $14, $80, $f0, $00, $87, $00             ;; 0f:6a42 ???????

data_0f_6a49:
    db   $0d, $4e, $40, $f0, $80, $87, $10, $2e        ;; 0f:6a49 ????????
    db   $40, $f0, $80, $86, $00                       ;; 0f:6a51 ?????

data_0f_6a56:
    db   $04, $f0, $41, $01, $f0, $89, $10, $f3        ;; 0f:6a56 ........
    db   $41, $fd, $04, $f0, $89, $ef, $60, $6a        ;; 0f:6a5e ........
    db   $00                                           ;; 0f:6a66 .

data_0f_6a67:
    db   $f2, $0b, $49, $61, $05, $f3, $60, $ef        ;; 0f:6a67 ????????
    db   $68, $6a, $00                                 ;; 0f:6a6f ???

data_0f_6a72:
    db   $06, $00, $80, $f1, $b8, $87, $f2, $06        ;; 0f:6a72 ????????
    db   $00, $80, $f1, $bd, $87, $ef, $79, $6a        ;; 0f:6a7a ????????
    db   $06, $00, $80, $f1, $b8, $87, $17, $00        ;; 0f:6a82 ????????
    db   $80, $f3, $bd, $87, $00                       ;; 0f:6a8a ?????

data_0f_6a8f:
    db   $f5, $08, $14, $40, $f3, $00, $83, $ef        ;; 0f:6a8f ????????
    db   $90, $6a, $00                                 ;; 0f:6a97 ???

data_0f_6a9a:
    db   $06, $14, $c0, $f0, $70, $82, $0c, $08        ;; 0f:6a9a ????????
    db   $c0, $a2, $ef, $87, $00                       ;; 0f:6aa2 ?????

data_0f_6aa7:
    db   $04, $f0, $61, $04, $f0, $31, $0a, $f1        ;; 0f:6aa7 ????????
    db   $30, $00                                      ;; 0f:6aaf ??

data_0f_6ab1:
    db   $f5, $06, $12, $c0, $f0, $00, $84, $ef        ;; 0f:6ab1 ????????
    db   $b2, $6a, $00                                 ;; 0f:6ab9 ???

data_0f_6abc:
    db   $f5, $05, $f1, $32, $01, $01, $22, $ef        ;; 0f:6abc ????????
    db   $bd, $6a, $00                                 ;; 0f:6ac4 ???

data_0f_6ac7:
    db   $12, $1c, $80, $f2, $ff, $87                  ;; 0f:6ac7 ......

data_0f_6acd:
    db   $1f, $1c, $80, $f3, $ff, $87, $00             ;; 0f:6acd .......

data_0f_6ad4:
    db   $03, $f1, $30, $05, $f0, $98, $0a, $f2        ;; 0f:6ad4 ........
    db   $61                                           ;; 0f:6adc .

data_0f_6add:
    db   $03, $f1, $30, $05, $f0, $98, $17, $f2        ;; 0f:6add ........
    db   $61, $00                                      ;; 0f:6ae5 ..

data_0f_6ae7:
    db   $fa, $02, $00, $80, $f0, $eb, $87, $02        ;; 0f:6ae7 ????????
    db   $00, $80, $f0, $ea, $87, $ef, $e8, $6a        ;; 0f:6aef ????????
    db   $00                                           ;; 0f:6af7 ?

data_0f_6af8:
    db   $f4, $02, $f1, $50, $04, $00, $00, $ef        ;; 0f:6af8 ????????
    db   $f9, $6a, $00                                 ;; 0f:6b00 ???

data_0f_6b03:
    db   $96, $27, $00, $0a, $80, $82, $00             ;; 0f:6b03 ???????

data_0f_6b0a:
    db   $96, $f0, $37, $00                            ;; 0f:6b0a ????

data_0f_6b0e:
    db   $19, $00, $80, $f1, $ef, $87, $00             ;; 0f:6b0e ???????

data_0f_6b15:
    db   $19, $f2, $70, $00                            ;; 0f:6b15 ????

data_0f_6b19:
    db   $0c, $25, $80, $f0, $b0, $85, $00             ;; 0f:6b19 ???????

data_0f_6b20:
    db   $f4, $02, $f0, $44, $ef, $21, $6b, $28        ;; 0f:6b20 ........
    db   $f4, $44, $00                                 ;; 0f:6b28 ...

data_0f_6b2b:
    db   $0f, $09, $44, $5a, $f7, $44, $00             ;; 0f:6b2b ???????

data_0f_6b32:
    db   $0f, $1f, $80, $f3, $50, $87, $00             ;; 0f:6b32 ???????

data_0f_6b39:
    db   $04, $00, $80, $f1, $c0, $87, $08, $00        ;; 0f:6b39 ........
    db   $80, $f1, $b0, $87, $00                       ;; 0f:6b41 .....

data_0f_6b46:
    db   $f6, $01, $00, $40, $f0, $00, $86, $01        ;; 0f:6b46 ........
    db   $00, $80, $f0, $00, $87, $ef, $47, $6b        ;; 0f:6b4e ........
    db   $00                                           ;; 0f:6b56 .

data_0f_6b57:
    db   $05, $00, $80, $f2, $06, $87, $05, $00        ;; 0f:6b57 ........
    db   $80, $f2, $44, $87, $05, $00, $80, $f2        ;; 0f:6b5f ........
    db   $59, $87, $14, $00, $80, $f2, $83, $87        ;; 0f:6b67 ........
    db   $00                                           ;; 0f:6b6f .

data_0f_6b70:
    db   $05, $00, $80, $f2, $7b, $87, $05, $00        ;; 0f:6b70 ........
    db   $80, $f2, $59, $87, $05, $00, $80, $f2        ;; 0f:6b78 ........
    db   $6b, $87, $14, $00, $80, $f2, $90, $87        ;; 0f:6b80 ........
    db   $00                                           ;; 0f:6b88 .

data_0f_6b89:
    db   $74, $57, $40, $0b, $30, $85, $00             ;; 0f:6b89 .......

data_0f_6b90:
    db   $23, $2e, $80, $49, $b0, $87, $00             ;; 0f:6b90 ???????

data_0f_6b97:
    db   $04, $f1, $23, $08, $f1, $25, $04, $f1        ;; 0f:6b97 ........
    db   $23, $14, $f2, $25, $00                       ;; 0f:6b9f .....

data_0f_6ba4:
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
