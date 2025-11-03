; ======================
; Author : Jacob Baker
; Version : Fall 2025
; ======================

; 10 SYS (2064)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $30, $36, $34, $29, $00, $00, $00

PRINTLINE=$AB1E

; program entrance
*=$0810
PROGRAM_START

        JSR CHANGE_BORDER_TO_RED

        JSR SWAP_BACKGROUND_AND_TEXT_COLORS

        ; prints "HELLO"
        lda #<HELLO_STRING
        ldy #>HELLO_STRING
        jsr PRINTLINE

        ; put a heart character in each corner
        ; upper-left corner is green
        lda #83
        sta $0400
        lda #5
        sta $D800

        ; upper-right corner is white
        lda #83
        sta $0427
        lda #1
        sta $D827

        ; lower-left corner is violet
        lda #83
        sta $07c0
        lda #4
        sta $dbc0
        
        ; lower-right corner is light green
        lda #83
        sta $07e7
        lda #13
        sta $dbe7

PROGRAM_END
        rts

HELLO_STRING
        text "hello"
        byte 13, 00

; start writing your subroutines after this line


; Changes the border to red
; Inputs: none
; Outputs: none
CHANGE_BORDER_TO_RED
        LDA #2
        STA $D020
        RTS


SWAP_BACKGROUND_AND_TEXT_COLORS
        lda $0286
        tax
        lda $d021
        sta $0286
        stx $d021
        RTS













