;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "wram0", WRAM0[$c000]

wC000:
    ds 64                                              ;; c000

wC040:
    ds 16                                              ;; c040

wC050:
    ds 16                                              ;; c050

wC060:
    ds 24                                              ;; c060

wC078:
    ds 8                                               ;; c078

wC080:
    ds 1                                               ;; c080

wC081:
    ds 3                                               ;; c081

wC084:
    ds 1                                               ;; c084

wC085:
    ds 3                                               ;; c085

wC088:
    ds 1                                               ;; c088

wC089:
    ds 1                                               ;; c089

wC08A:
    ds 2                                               ;; c08a

wC08C:
    ds 1                                               ;; c08c

wC08D:
    ds 1                                               ;; c08d

wC08E:
    ds 2                                               ;; c08e

wC090:
    ds 16                                              ;; c090

wBankStack:
    ds 16                                              ;; c0a0

wBankStackIndex:
    ds 1                                               ;; c0b0

wCurrentBank:
    ds 1                                               ;; c0b1

wC0B2:
    ds 1                                               ;; c0b2

wC0B3:
    ds 1                                               ;; c0b3

wC0B4:
    ds 5                                               ;; c0b4

wC0B9:
    ds 1                                               ;; c0b9

wC0BA:
    ds 1                                               ;; c0ba

wC0BB:
    ds 1                                               ;; c0bb

wC0BC:
    ds 1                                               ;; c0bc

wC0BD:
    ds 1                                               ;; c0bd

wC0BE:
    ds 2                                               ;; c0be

wC0C0:
    ds 1                                               ;; c0c0

wC0C1:
    ds 2                                               ;; c0c1

wC0C3:
    ds 61                                              ;; c0c3

wC100:
    ds 256                                             ;; c100

wC200:
    ds 15                                              ;; c200

wC20F:
    ds 1                                               ;; c20f

wC210:
    ds 32                                              ;; c210

wC230:
    ds 32                                              ;; c230

wC250:
    ds 16                                              ;; c250

wC260:
    ds 32                                              ;; c260

wC280:
    ds 16                                              ;; c280

wC290:
    ds 1                                               ;; c290

wC291:
    ds 31                                              ;; c291

wC2B0:
    ds 1                                               ;; c2b0

wC2B1:
    ds 31                                              ;; c2b1

wC2D0:
    ds 16                                              ;; c2d0

wC2E0:
    ds 16                                              ;; c2e0

wC2F0:
    ds 16                                              ;; c2f0

wC300:
    ds 16                                              ;; c300

wC310:
    ds 16                                              ;; c310

wC320:
    ds 16                                              ;; c320

wC330:
    ds 16                                              ;; c330

wC340:
    ds 16                                              ;; c340

wC350:
    ds 16                                              ;; c350

wC360:
    ds 16                                              ;; c360

wC370:
    ds 400                                             ;; c370

wC500:
    ds 1                                               ;; c500

wC501:
    ds 2                                               ;; c501

wC503:
    ds 1                                               ;; c503

wC504:
    ds 1                                               ;; c504

wC505:
    ds 2                                               ;; c505

wC507:
    ds 6                                               ;; c507

wC50D:
    ds 1                                               ;; c50d

wC50E:
    ds 2                                               ;; c50e

wC510:
    ds 5                                               ;; c510

wC515:
    ds 3                                               ;; c515

wC518:
    ds 33                                              ;; c518

wC539:
    ds 1                                               ;; c539

wC53A:
    ds 6                                               ;; c53a

wC540:
    ds 8                                               ;; c540

wC548:
    ds 8                                               ;; c548

wC550:
    ds 1                                               ;; c550

wC551:
    ds 16                                              ;; c551

wC561:
    ds 1                                               ;; c561

wC562:
    ds 1                                               ;; c562

wC563:
    ds 7                                               ;; c563

wC56A:
    ds 89                                              ;; c56a

wC5C3:
    ds 93                                              ;; c5c3

wC620:
    ds 3                                               ;; c620

wC623:
    ds 93                                              ;; c623

wC680:
    ds 3                                               ;; c680

wC683:
    ds 4                                               ;; c683

wC687:
    ds 6                                               ;; c687

wC68D:
    ds 83                                              ;; c68d

wC6E0:
    ds 3                                               ;; c6e0

wC6E3:
    ds 1                                               ;; c6e3

wC6E4:
    ds 1                                               ;; c6e4

wC6E5:
    ds 1                                               ;; c6e5

wC6E6:
    ds 1                                               ;; c6e6

wC6E7:
    ds 1                                               ;; c6e7

wC6E8:
    ds 1                                               ;; c6e8

wC6E9:
    ds 1                                               ;; c6e9

wC6EA:
    ds 1                                               ;; c6ea

wC6EB:
    ds 1                                               ;; c6eb

wC6EC:
    ds 1                                               ;; c6ec

wC6ED:
    ds 1                                               ;; c6ed

wC6EE:
    ds 1                                               ;; c6ee

wC6EF:
    ds 1                                               ;; c6ef

wC6F0:
    ds 1                                               ;; c6f0

wC6F1:
    ds 1                                               ;; c6f1

wC6F2:
    ds 1                                               ;; c6f2

wC6F3:
    ds 1                                               ;; c6f3

wC6F4:
    ds 3                                               ;; c6f4

wC6F7:
    ds 1                                               ;; c6f7

wC6F8:
    ds 3                                               ;; c6f8

wC6FB:
    ds 4                                               ;; c6fb

wC6FF:
    ds 1                                               ;; c6ff

wC700:
    ds 96                                              ;; c700

wC760:
    ds 32                                              ;; c760

wC780:
    ds 32                                              ;; c780

wC7A0:
    ds 16                                              ;; c7a0

wC7B0:
    ds 16                                              ;; c7b0

wC7C0:
    ds 8                                               ;; c7c0

wC7C8:
    ds 1                                               ;; c7c8

wC7C9:
    ds 1                                               ;; c7c9

wC7CA:
    ds 1                                               ;; c7ca

wC7CB:
    ds 1                                               ;; c7cb

wC7CC:
    ds 1                                               ;; c7cc

wC7CD:
    ds 1                                               ;; c7cd

wC7CE:
    ds 1                                               ;; c7ce

wC7CF:
    ds 49                                              ;; c7cf

wC800:
    ds 1                                               ;; c800

wC801:
    ds 1                                               ;; c801

wC802:
    ds 1                                               ;; c802

wC803:
    ds 1                                               ;; c803

wC804:
    ds 1                                               ;; c804

wC805:
    ds 1                                               ;; c805

wC806:
    ds 1                                               ;; c806

wC807:
    ds 8                                               ;; c807

wC80F:
    ds 1                                               ;; c80f

wC810:
    ds 16                                              ;; c810

wC820:
    ds 16                                              ;; c820

wC830:
    ds 16                                              ;; c830

wC840:
    ds 1                                               ;; c840

wC841:
    ds 1                                               ;; c841

wC842:
    ds 1                                               ;; c842

wC843:
    ds 1                                               ;; c843

wC844:
    ds 1                                               ;; c844

wC845:
    ds 1                                               ;; c845

wC846:
    ds 2                                               ;; c846

wC848:
    ds 8                                               ;; c848

wC850:
    ds 16                                              ;; c850

wC860:
    ds 1                                               ;; c860

wC861:
    ds 1                                               ;; c861

wC862:
    ds 1                                               ;; c862

wC863:
    ds 29                                              ;; c863

wC880:
    ds 20                                              ;; c880

wC894:
    ds 2                                               ;; c894

wC896:
    ds 2                                               ;; c896

wC898:
    ds 24                                              ;; c898

wC8B0:
    ds 4                                               ;; c8b0

wC8B4:
    ds 1                                               ;; c8b4

wC8B5:
    ds 6                                               ;; c8b5

wC8BB:
    ds 1                                               ;; c8bb

wC8BC:
    ds 18                                              ;; c8bc

wC8CE:
    ds 60                                              ;; c8ce

wC90A:
    ds 113                                             ;; c90a

wC97B:
    ds 6                                               ;; c97b

wC981:
    ds 4                                               ;; c981

wC985:
    ds 18                                              ;; c985

wC997:
    ds 4                                               ;; c997

wC99B:
    ds 1                                               ;; c99b

wC99C:
    ds 17                                              ;; c99c

wC9AD:
    ds 1                                               ;; c9ad

wC9AE:
    ds 1                                               ;; c9ae

wC9AF:
    ds 1                                               ;; c9af

wC9B0:
    ds 1                                               ;; c9b0

wC9B1:
    ds 1                                               ;; c9b1

wC9B2:
    ds 1                                               ;; c9b2

wC9B3:
    ds 3                                               ;; c9b3

wC9B6:
    ds 3                                               ;; c9b6

wC9B9:
    ds 1                                               ;; c9b9

wC9BA:
    ds 1                                               ;; c9ba

wC9BB:
    ds 1                                               ;; c9bb

wC9BC:
    ds 1                                               ;; c9bc

wC9BD:
    ds 1                                               ;; c9bd

wC9BE:
    ds 1                                               ;; c9be

wC9BF:
    ds 3                                               ;; c9bf

wC9C2:
    ds 20                                              ;; c9c2

wC9D6:
    ds 2                                               ;; c9d6

wC9D8:
    ds 14                                              ;; c9d8

wC9E6:
    ds 17                                              ;; c9e6

wC9F7:
    ds 6                                               ;; c9f7

wC9FD:
    ds 2                                               ;; c9fd

wC9FF:
    ds 1                                               ;; c9ff

wCA00:
    ds 1                                               ;; ca00

wCA01:
    ds 1                                               ;; ca01

wCA02:
    ds 1                                               ;; ca02

wCA03:
    ds 1                                               ;; ca03

wCA04:
    ds 1                                               ;; ca04

wCA05:
    ds 1                                               ;; ca05

wCA06:
    ds 1                                               ;; ca06

wCA07:
    ds 7                                               ;; ca07

wCA0E:
    ds 1                                               ;; ca0e

wCA0F:
    ds 3                                               ;; ca0f

wCA12:
    ds 1                                               ;; ca12

wCA13:
    ds 1                                               ;; ca13

wCA14:
    ds 1                                               ;; ca14

wCA15:
    ds 1                                               ;; ca15

wCA16:
    ds 1                                               ;; ca16

wCA17:
    ds 1                                               ;; ca17

wCA18:
    ds 1                                               ;; ca18

wCA19:
    ds 1                                               ;; ca19

wCA1A:
    ds 1                                               ;; ca1a

wCA1B:
    ds 1                                               ;; ca1b

wCA1C:
    ds 1                                               ;; ca1c

wCA1D:
    ds 1                                               ;; ca1d

wCA1E:
    ds 8                                               ;; ca1e

wCA26:
    ds 2                                               ;; ca26

wCA28:
    ds 1                                               ;; ca28

wCA29:
    ds 1                                               ;; ca29

wCA2A:
    ds 1                                               ;; ca2a

wCA2B:
    ds 1                                               ;; ca2b

wCA2C:
    ds 1                                               ;; ca2c

wCA2D:
    ds 1                                               ;; ca2d

wCA2E:
    ds 1                                               ;; ca2e

wCA2F:
    ds 1                                               ;; ca2f

wCA30:
    ds 33                                              ;; ca30

wCA51:
    ds 1                                               ;; ca51

wCA52:
    ds 1                                               ;; ca52

wCA53:
    ds 1                                               ;; ca53

wCA54:
    ds 1                                               ;; ca54

wCA55:
    ds 1                                               ;; ca55

wCA56:
    ds 1                                               ;; ca56

wCA57:
    ds 1                                               ;; ca57

wCA58:
    ds 1                                               ;; ca58

wCA59:
    ds 1                                               ;; ca59

wCA5A:
    ds 3                                               ;; ca5a

wCA5D:
    ds 13                                              ;; ca5d

wCA6A:
    ds 1                                               ;; ca6a

wCA6B:
    ds 1                                               ;; ca6b

wCA6C:
    ds 1                                               ;; ca6c

wCA6D:
    ds 1                                               ;; ca6d

wCA6E:
    ds 1                                               ;; ca6e

wCA6F:
    ds 145                                             ;; ca6f

wCB00:
    ds 1                                               ;; cb00

wCB01:
    ds 1                                               ;; cb01

wCB02:
    ds 1                                               ;; cb02

wCB03:
    ds 2                                               ;; cb03

wCB05:
    ds 1                                               ;; cb05

wCB06:
    ds 2                                               ;; cb06

wCB08:
    ds 1                                               ;; cb08

wCB09:
    ds 1                                               ;; cb09

wCB0A:
    ds 2                                               ;; cb0a

wCB0C:
    ds 1                                               ;; cb0c

wCB0D:
    ds 1                                               ;; cb0d

wCB0E:
    ds 1                                               ;; cb0e

wCB0F:
    ds 2                                               ;; cb0f

wCB11:
    ds 2                                               ;; cb11

wCB13:
    ds 1                                               ;; cb13

wCB14:
    ds 2                                               ;; cb14

wCB16:
    ds 2                                               ;; cb16

wCB18:
    ds 2                                               ;; cb18

wCB1A:
    ds 1                                               ;; cb1a

wCB1B:
    ds 1                                               ;; cb1b

wCB1C:
    ds 1                                               ;; cb1c

wCB1D:
    ds 1                                               ;; cb1d

wCB1E:
    ds 2                                               ;; cb1e

wCB20:
    ds 1                                               ;; cb20

wCB21:
    ds 1                                               ;; cb21

wCB22:
    ds 2                                               ;; cb22

wCB24:
    ds 1                                               ;; cb24

wCB25:
    ds 1                                               ;; cb25

wCB26:
    ds 1                                               ;; cb26

wCB27:
    ds 2                                               ;; cb27

wCB29:
    ds 2                                               ;; cb29

wCB2B:
    ds 1                                               ;; cb2b

wCB2C:
    ds 2                                               ;; cb2c

wCB2E:
    ds 2                                               ;; cb2e

wCB30:
    ds 1                                               ;; cb30

wCB31:
    ds 1                                               ;; cb31

wCB32:
    ds 1                                               ;; cb32

wCB33:
    ds 2                                               ;; cb33

wCB35:
    ds 1                                               ;; cb35

wCB36:
    ds 2                                               ;; cb36

wCB38:
    ds 1                                               ;; cb38

wCB39:
    ds 1                                               ;; cb39

wCB3A:
    ds 1                                               ;; cb3a

wCB3B:
    ds 1                                               ;; cb3b

wCB3C:
    ds 2                                               ;; cb3c

wCB3E:
    ds 1                                               ;; cb3e

wCB3F:
    ds 2                                               ;; cb3f

wCB41:
    ds 9                                               ;; cb41

wCB4A:
    ds 1                                               ;; cb4a

wCB4B:
    ds 1                                               ;; cb4b

wCB4C:
    ds 1                                               ;; cb4c

wCB4D:
    ds 1                                               ;; cb4d

wCB4E:
    ds 3                                               ;; cb4e

wCB51:
    ds 1                                               ;; cb51

wCB52:
    ds 2                                               ;; cb52

wCB54:
    ds 7                                               ;; cb54

wCB5B:
    ds 1                                               ;; cb5b

wCB5C:
    ds 2                                               ;; cb5c

wCB5E:
    ds 1                                               ;; cb5e

wCB5F:
    ds 2                                               ;; cb5f

wCB61:
    ds 1                                               ;; cb61

wCB62:
    ds 2                                               ;; cb62

wCB64:
    ds 2                                               ;; cb64

wCB66:
    ds 1                                               ;; cb66

wCB67:
    ds 152                                             ;; cb67

wCBFF:
    ds 2                                               ;; cbff

wCC01:
    ds 2                                               ;; cc01

wCC03:
    ds 1                                               ;; cc03

wCC04:
    ds 1                                               ;; cc04

wCC05:
    ds 2                                               ;; cc05

wCC07:
    ds 1                                               ;; cc07

wCC08:
    ds 2                                               ;; cc08

wCC0A:
    ds 1                                               ;; cc0a

wCC0B:
    ds 1                                               ;; cc0b

wCC0C:
    ds 3                                               ;; cc0c

wCC0F:
    ds 17                                              ;; cc0f

wCC20:
    ds 1                                               ;; cc20

wCC21:
    ds 1                                               ;; cc21

wCC22:
    ds 1                                               ;; cc22

wCC23:
    ds 1                                               ;; cc23

wCC24:
    ds 2                                               ;; cc24

wCC26:
    ds 2                                               ;; cc26

wCC28:
    ds 2                                               ;; cc28

wCC2A:
    ds 1                                               ;; cc2a

wCC2B:
    ds 1                                               ;; cc2b

wCC2C:
    ds 1                                               ;; cc2c

wCC2D:
    ds 1                                               ;; cc2d

wCC2E:
    ds 1                                               ;; cc2e

wCC2F:
    ds 1                                               ;; cc2f

wCC30:
    ds 1                                               ;; cc30

wCC31:
    ds 2                                               ;; cc31

wCC33:
    ds 1                                               ;; cc33

wCC34:
    ds 2                                               ;; cc34

wCC36:
    ds 1                                               ;; cc36

wCC37:
    ds 1                                               ;; cc37

wCC38:
    ds 1                                               ;; cc38

wCC39:
    ds 1                                               ;; cc39

wCC3A:
    ds 1                                               ;; cc3a

wCC3B:
    ds 2                                               ;; cc3b

wCC3D:
    ds 2                                               ;; cc3d

wCC3F:
    ds 2                                               ;; cc3f

wCC41:
    ds 11                                              ;; cc41

wCC4C:
    ds 5                                               ;; cc4c

wCC51:
    ds 4                                               ;; cc51

wCC55:
    ds 4                                               ;; cc55

wCC59:
    ds 1                                               ;; cc59

wCC5A:
    ds 1                                               ;; cc5a

wCC5B:
    ds 1                                               ;; cc5b

wCC5C:
    ds 1                                               ;; cc5c

wCC5D:
    ds 1                                               ;; cc5d

wCC5E:
    ds 3                                               ;; cc5e

wCC61:
    ds 8                                               ;; cc61

wCC69:
    ds 2                                               ;; cc69

wCC6B:
    ds 1                                               ;; cc6b

wCC6C:
    ds 1                                               ;; cc6c

wCC6D:
    ds 1                                               ;; cc6d

wCC6E:
    ds 1                                               ;; cc6e

wCC6F:
    ds 1                                               ;; cc6f

wCC70:
    ds 1                                               ;; cc70

wCC71:
    ds 2                                               ;; cc71

wCC73:
    ds 1                                               ;; cc73

wCC74:
    ds 140                                             ;; cc74

wCD00:
    ds 1                                               ;; cd00

wCD01:
    ds 1                                               ;; cd01

wCD02:
    ds 1                                               ;; cd02

wCD03:
    ds 1                                               ;; cd03

wCD04:
    ds 1                                               ;; cd04

wCD05:
    ds 1                                               ;; cd05

wCD06:
    ds 1                                               ;; cd06

wCD07:
    ds 1                                               ;; cd07

wCD08:
    ds 1                                               ;; cd08

wCD09:
    ds 1                                               ;; cd09

wCD0A:
    ds 1                                               ;; cd0a

wCD0B:
    ds 1                                               ;; cd0b

wCD0C:
    ds 1                                               ;; cd0c

wCD0D:
    ds 1                                               ;; cd0d

wCD0E:
    ds 1                                               ;; cd0e

wCD0F:
    ds 1                                               ;; cd0f

wCD10:
    ds 1                                               ;; cd10

wCD11:
    ds 1                                               ;; cd11

wCD12:
    ds 1                                               ;; cd12

wCD13:
    ds 1                                               ;; cd13

wCD14:
    ds 1                                               ;; cd14

wCD15:
    ds 1                                               ;; cd15

wCD16:
    ds 1                                               ;; cd16

wCD17:
    ds 1                                               ;; cd17

wCD18:
    ds 1                                               ;; cd18

wCD19:
    ds 1                                               ;; cd19

wCD1A:
    ds 1                                               ;; cd1a

wCD1B:
    ds 1                                               ;; cd1b

wCD1C:
    ds 1                                               ;; cd1c

wCD1D:
    ds 3                                               ;; cd1d

wCD20:
    ds 1                                               ;; cd20

wCD21:
    ds 1                                               ;; cd21

wCD22:
    ds 3                                               ;; cd22

wCD25:
    ds 1                                               ;; cd25

wCD26:
    ds 1                                               ;; cd26

wCD27:
    ds 1                                               ;; cd27

wCD28:
    ds 3                                               ;; cd28

wCD2B:
    ds 1                                               ;; cd2b

wCD2C:
    ds 2                                               ;; cd2c

wCD2E:
    ds 1                                               ;; cd2e

wCD2F:
    ds 2                                               ;; cd2f

wCD31:
    ds 1                                               ;; cd31

wCD32:
    ds 1                                               ;; cd32

wCD33:
    ds 1                                               ;; cd33

wCD34:
    ds 1                                               ;; cd34

wCD35:
    ds 1                                               ;; cd35

wCD36:
    ds 1                                               ;; cd36

wCD37:
    ds 1                                               ;; cd37

wCD38:
    ds 1                                               ;; cd38

wCD39:
    ds 1                                               ;; cd39

wCD3A:
    ds 1                                               ;; cd3a

wCD3B:
    ds 1                                               ;; cd3b

wCD3C:
    ds 1                                               ;; cd3c

wCD3D:
    ds 1                                               ;; cd3d

wCD3E:
    ds 1                                               ;; cd3e

wCD3F:
    ds 1                                               ;; cd3f

wCD40:
    ds 2                                               ;; cd40

wCD42:
    ds 1                                               ;; cd42

wCD43:
    ds 1                                               ;; cd43

wCD44:
    ds 1                                               ;; cd44

wCD45:
    ds 1                                               ;; cd45

wCD46:
    ds 2                                               ;; cd46

wCD48:
    ds 1                                               ;; cd48

wCD49:
    ds 3                                               ;; cd49

wCD4C:
    ds 1                                               ;; cd4c

wCD4D:
    ds 1                                               ;; cd4d

wCD4E:
    ds 79                                              ;; cd4e

wCD9D:
    ds 12                                              ;; cd9d

wCDA9:
    ds 5                                               ;; cda9

wCDAE:
    ds 1                                               ;; cdae

wCDAF:
    ds 1                                               ;; cdaf

wCDB0:
    ds 1                                               ;; cdb0

wCDB1:
    ds 1                                               ;; cdb1

wCDB2:
    ds 1                                               ;; cdb2

wCDB3:
    ds 1                                               ;; cdb3

wCDB4:
    ds 3                                               ;; cdb4

wCDB7:
    ds 3                                               ;; cdb7

wCDBA:
    ds 7                                               ;; cdba

wCDC1:
    ds 1                                               ;; cdc1

wCDC2:
    ds 1                                               ;; cdc2

wCDC3:
    ds 1                                               ;; cdc3

wCDC4:
    ds 1                                               ;; cdc4

wCDC5:
    ds 1                                               ;; cdc5

wCDC6:
    ds 1                                               ;; cdc6

wCDC7:
    ds 3                                               ;; cdc7

wCDCA:
    ds 1                                               ;; cdca

wCDCB:
    ds 3                                               ;; cdcb

wCDCE:
    ds 1                                               ;; cdce

wCDCF:
    ds 1                                               ;; cdcf

wCDD0:
    ds 1                                               ;; cdd0

wCDD1:
    ds 1                                               ;; cdd1

wCDD2:
    ds 1                                               ;; cdd2

wCDD3:
    ds 1                                               ;; cdd3

wCDD4:
    ds 1                                               ;; cdd4

wCDD5:
    ds 1                                               ;; cdd5

wCDD6:
    ds 1                                               ;; cdd6

wCDD7:
    ds 1                                               ;; cdd7

wCDD8:
    ds 1                                               ;; cdd8

wCDD9:
    ds 1                                               ;; cdd9

wCDDA:
    ds 1                                               ;; cdda

wCDDB:
    ds 1                                               ;; cddb

wCDDC:
    ds 1                                               ;; cddc

wCDDD:
    ds 1                                               ;; cddd

wCDDE:
    ds 1                                               ;; cdde

wCDDF:
    ds 1                                               ;; cddf

wCDE0:
    ds 1                                               ;; cde0

wCDE1:
    ds 1                                               ;; cde1

wCDE2:
    ds 1                                               ;; cde2

wCDE3:
    ds 1                                               ;; cde3

wCDE4:
    ds 2                                               ;; cde4

wCDE6:
    ds 1                                               ;; cde6

wCDE7:
    ds 1                                               ;; cde7

wCDE8:
    ds 1                                               ;; cde8

wCDE9:
    ds 1                                               ;; cde9

wCDEA:
    ds 1                                               ;; cdea

wCDEB:
    ds 1                                               ;; cdeb

wCDEC:
    ds 20                                              ;; cdec

wCE00:
    ds 1                                               ;; ce00

wCE01:
    ds 1                                               ;; ce01

wCE02:
    ds 1                                               ;; ce02

wCE03:
    ds 25                                              ;; ce03

wCE1C:
    ds 1                                               ;; ce1c

wCE1D:
    ds 1                                               ;; ce1d

wCE1E:
    ds 1                                               ;; ce1e

wCE1F:
    ds 1                                               ;; ce1f

wCE20:
    ds 1                                               ;; ce20

wCE21:
    ds 3                                               ;; ce21

wCE24:
    ds 1                                               ;; ce24

wCE25:
    ds 1                                               ;; ce25

wCE26:
    ds 1                                               ;; ce26

wCE27:
    ds 1                                               ;; ce27

wCE28:
    ds 1                                               ;; ce28

wCE29:
    ds 2                                               ;; ce29

wCE2B:
    ds 6                                               ;; ce2b

wCE31:
    ds 11                                              ;; ce31

wCE3C:
    ds 64                                              ;; ce3c

wCE7C:
    ds 1                                               ;; ce7c

wCE7D:
    ds 7                                               ;; ce7d

wCE84:
    ds 4                                               ;; ce84

wCE88:
    ds 4                                               ;; ce88

wCE8C:
    ds 1                                               ;; ce8c

wCE8D:
    ds 1                                               ;; ce8d

wCE8E:
    ds 1                                               ;; ce8e

wCE8F:
    ds 1                                               ;; ce8f

wCE90:
    ds 1                                               ;; ce90

wCE91:
    ds 1                                               ;; ce91

wCE92:
    ds 1                                               ;; ce92

wCE93:
    ds 1                                               ;; ce93

wCE94:
    ds 1                                               ;; ce94

wCE95:
    ds 2                                               ;; ce95

wCE97:
    ds 66                                              ;; ce97

wCED9:
    ds 1                                               ;; ced9

wCEDA:
    ds 1                                               ;; ceda

wCEDB:
    ds 1                                               ;; cedb

wCEDC:
    ds 1                                               ;; cedc

wCEDD:
    ds 1                                               ;; cedd

wCEDE:
    ds 2                                               ;; cede

wCEE0:
    ds 288                                             ;; cee0

wD000:
    ds 1                                               ;; d000

wD001:
    ds 12                                              ;; d001

wD00D:
    ds 84                                              ;; d00d

wD061:
    ds 1                                               ;; d061

wD062:
    ds 8                                               ;; d062

wD06A:
    ds 6                                               ;; d06a

wD070:
    ds 403                                             ;; d070

wD203:
    ds 125                                             ;; d203

wD280:
    ds 128                                             ;; d280

wD300:
    ds 256                                             ;; d300

wD400:
    ds 640                                             ;; d400

wD680:
    ds 3                                               ;; d680

wD683:
    ds 2                                               ;; d683

wD685:
    ds 8                                               ;; d685

wD68D:
    ds 1                                               ;; d68d

wD68E:
    ds 1                                               ;; d68e

wD68F:
    ds 1                                               ;; d68f

wD690:
    ds 4                                               ;; d690

wD694:
    ds 4                                               ;; d694

wD698:
    ds 2                                               ;; d698

wD69A:
    ds 35                                              ;; d69a

wD6BD:
    ds 3                                               ;; d6bd

wD6C0:
    ds 8                                               ;; d6c0

wD6C8:
    ds 9                                               ;; d6c8

wD6D1:
    ds 6                                               ;; d6d1

wD6D7:
    ds 2                                               ;; d6d7

wD6D9:
    ds 4                                               ;; d6d9

wD6DD:
    ds 8                                               ;; d6dd

wD6E5:
    ds 3                                               ;; d6e5

wD6E8:
    ds 2                                               ;; d6e8

wD6EA:
    ds 6                                               ;; d6ea

wD6F0:
    ds 272                                             ;; d6f0

wD800:
    ds 34                                              ;; d800

wD822:
    ds 13                                              ;; d822

wD82F:
    ds 15                                              ;; d82f

wD83E:
    ds 8                                               ;; d83e

wD846:
    ds 36                                              ;; d846

wD86A:
    ds 9                                               ;; d86a

wD873:
    ds 1037                                            ;; d873

wDC80:
    ds 1                                               ;; dc80

wDC81:
    ds 1                                               ;; dc81

wDC82:
    ds 1                                               ;; dc82

wDC83:
    ds 2                                               ;; dc83

wDC85:
    ds 123                                             ;; dc85

wDD00:
    ds 255                                             ;; dd00

wDDFF:
    ds 1                                               ;; ddff

wDE00:
    ds 1                                               ;; de00

wDE01:
    ds 1                                               ;; de01

wDE02:
    ds 1                                               ;; de02

wDE03:
    ds 1                                               ;; de03

wDE04:
    ds 1                                               ;; de04

wDE05:
    ds 1                                               ;; de05

wDE06:
    ds 1                                               ;; de06

wDE07:
    ds 1                                               ;; de07

wDE08:
    ds 1                                               ;; de08

wDE09:
    ds 2                                               ;; de09

wDE0B:
    ds 1                                               ;; de0b

wDE0C:
    ds 1                                               ;; de0c

wDE0D:
    ds 1                                               ;; de0d

wDE0E:
    ds 1                                               ;; de0e

wDE0F:
    ds 1                                               ;; de0f

wDE10:
    ds 1                                               ;; de10

wDE11:
    ds 1                                               ;; de11

wDE12:
    ds 1                                               ;; de12

wDE13:
    ds 4                                               ;; de13

wDE17:
    ds 2                                               ;; de17

wDE19:
    ds 2                                               ;; de19

wDE1B:
    ds 37                                              ;; de1b

wDE40:
    ds 1                                               ;; de40

wDE41:
    ds 4                                               ;; de41

wDE45:
    ds 3                                               ;; de45

wDE48:
    ds 1                                               ;; de48

wDE49:
    ds 7                                               ;; de49

wDE50:
    ds 2                                               ;; de50

wDE52:
    ds 5                                               ;; de52

wDE57:
    ds 1                                               ;; de57

wDE58:
    ds 7                                               ;; de58

wDE5F:
    ds 1                                               ;; de5f

wDE60:
    ds 16                                              ;; de60

wDE70:
    ds 14                                              ;; de70

wDE7E:
    ds 2                                               ;; de7e

wDE80:
    ds 16                                              ;; de80

wDE90:
    ds 16                                              ;; de90

wDEA0:
    ds 30                                              ;; dea0

wDEBE:
    ds 1                                               ;; debe

wDEBF:
    ds 1                                               ;; debf

wDEC0:
    ds 60                                              ;; dec0

wDEFC:
    ds 1                                               ;; defc

wDEFD:
    ds 2                                               ;; defd

wDEFF:
    ds 1                                               ;; deff

wDF00:
    ds 8                                               ;; df00

wDF08:
    ds 248                                             ;; df08

SECTION "hram", HRAM[$ff80]

hFF80:
    ds 10                                              ;; ff80

hFF8A:
    ds 1                                               ;; ff8a

hFF8B:
    ds 5                                               ;; ff8b

hFF90:
    ds 1                                               ;; ff90

hFF91:
    ds 1                                               ;; ff91

hFF92:
    ds 1                                               ;; ff92

hFF93:
    ds 2                                               ;; ff93

hFF95:
    ds 1                                               ;; ff95

hFF96:
    ds 1                                               ;; ff96

hFF97:
    ds 8                                               ;; ff97

hFF9F:
    ds 1                                               ;; ff9f

hFFA0:
    ds 1                                               ;; ffa0

hFFA1:
    ds 1                                               ;; ffa1

hFFA2:
    ds 1                                               ;; ffa2

hFFA3:
    ds 1                                               ;; ffa3

hFFA4:
    ds 22                                              ;; ffa4

hFFBA:
    ds 2                                               ;; ffba

hFFBC:
    ds 1                                               ;; ffbc

hFFBD:
    ds 1                                               ;; ffbd

hFFBE:
    ds 1                                               ;; ffbe

hFFBF:
    ds 1                                               ;; ffbf

hFFC0:
    ds 1                                               ;; ffc0

hFFC1:
    ds 1                                               ;; ffc1

hFFC2:
    ds 1                                               ;; ffc2

hFFC3:
    ds 1                                               ;; ffc3

hFFC4:
    ds 1                                               ;; ffc4

hFFC5:
    ds 2                                               ;; ffc5

hFFC7:
    ds 3                                               ;; ffc7

hFFCA:
    ds 1                                               ;; ffca

hFFCB:
    ds 1                                               ;; ffcb

hFFCC:
    ds 1                                               ;; ffcc

hFFCD:
    ds 1                                               ;; ffcd

hFFCE:
    ds 1                                               ;; ffce

hFFCF:
    ds 1                                               ;; ffcf

hFFD0:
    ds 1                                               ;; ffd0

hFFD1:
    ds 1                                               ;; ffd1

hFFD2:
    ds 1                                               ;; ffd2

hFFD3:
    ds 12                                              ;; ffd3

hFFDF:
    ds 17                                              ;; ffdf

hFFF0:
    ds 4                                               ;; fff0

hFFF4:
    ds 3                                               ;; fff4

hFFF7:
    ds 3                                               ;; fff7

hFFFA:
    ds 1                                               ;; fffa

hFFFB:
    ds 2                                               ;; fffb

hFFFD:
    ds 1                                               ;; fffd

hFFFE:
    ds 1                                               ;; fffe

SECTION "vram", VRAM[$8000]
    ds 8192                                            ;; 8000

SECTION "sram", SRAM[$a000]

sA000:
    ds 240                                             ;; a000

sA0F0:
    ds 7946                                            ;; a0f0

sBFFA:
    ds 6                                               ;; bffa
