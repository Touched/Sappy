	.include "MPlayDef.s"

	.equ	galactic_admin_battle_grp, voicegroup000
	.equ	galactic_admin_battle_pri, 0
	.equ	galactic_admin_battle_rev, 0
	.equ	galactic_admin_battle_mvl, 127
	.equ	galactic_admin_battle_key, 0
	.equ	galactic_admin_battle_tbs, 1
	.equ	galactic_admin_battle_exg, 0
	.equ	galactic_admin_battle_cmp, 1

	.section .rodata
	.global	galactic_admin_battle
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

galactic_admin_battle_1:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 200*galactic_admin_battle_tbs/2
	.byte		VOICE , 38
	.byte		PAN   , c_v+0
	.byte		MOD   , 0
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Gs1 
	.byte	W12
@ 002   ----------------------------------------
galactic_admin_battle_1_002:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte	PEND
@ 003   ----------------------------------------
galactic_admin_battle_1_003:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte	PEND
@ 004   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_002
@ 005   ----------------------------------------
galactic_admin_battle_1_005:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gn1 
	.byte	W11
	.byte		VOICE , 37
	.byte	W01
	.byte	PEND
@ 006   ----------------------------------------
	.byte		VOL   , 114*galactic_admin_battle_mvl/mxv
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 007   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_003
@ 008   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_002
@ 009   ----------------------------------------
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , An1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 010   ----------------------------------------
galactic_admin_battle_1_010:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
galactic_admin_battle_1_011:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Gs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte	PEND
@ 012   ---------------------------------------
galactic_admin_battle_1_loop:
                  .byte	 PATT
	 .word	galactic_admin_battle_1_010
@ 013   ----------------------------------------
galactic_admin_battle_1_013:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Gs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte	PEND
@ 014   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_010
@ 015   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_010
@ 017   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_013
@ 018   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_010
@ 019   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_011
@ 020   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_010
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_013
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_010
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_011
@ 024   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_010
@ 025   ----------------------------------------
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Gs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W11
	.byte		VOICE , 64
	.byte	W01
@ 026   ----------------------------------------
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		N11   
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 027   ----------------------------------------
	.byte		        Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 028   ----------------------------------------
	.byte		        Cn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Cn2 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		N11   , Cn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
@ 029   ----------------------------------------
	.byte		        Cn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Cn2 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		N11   , Gn1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
@ 030   ----------------------------------------
galactic_admin_battle_1_030:
	.byte		N11   , Cs1 , v112
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte	PEND
@ 031   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_030
@ 032   ----------------------------------------
	.byte		N11   , As0 , v112
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , As1 
	.byte	W06
	.byte		        An1 
	.byte	W06
	.byte		N11   , As0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
@ 033   ----------------------------------------
	.byte		        As0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		N05   , As1 
	.byte	W06
	.byte		        An1 
	.byte	W06
	.byte		N11   , Gn1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		N23   , An1 
	.byte	W24
@ 034   ----------------------------------------
galactic_admin_battle_1_034:
	.byte		N11   , Gs1 , v112
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte	PEND
@ 035   ----------------------------------------
galactic_admin_battle_1_035:
	.byte		N11   , Bn1 , v112
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte	PEND
@ 036   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_034
@ 037   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_035
@ 038   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_034
@ 039   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_035
@ 040   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_034
@ 041   ----------------------------------------
	.byte		N11   , Bn1 , v112
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
@ 042   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_034
@ 043   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_035
@ 044   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_034
@ 045   ----------------------------------------
	.byte		N11   , Bn1 , v112
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
@ 046   ----------------------------------------
galactic_admin_battle_1_046:
	.byte		N11   , Gs1 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Gs1 , v040
	.byte	W12
	.byte		        Gs0 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte	PEND
@ 047   ----------------------------------------
	.byte		        Fs0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
@ 048   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_046
@ 049   ----------------------------------------
	.byte		N11   , Fs0 , v112
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 050   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_002
@ 051   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_003
@ 052   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_002
@ 053   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_005
@ 054   ----------------------------------------
	.byte		VOL   , 121*galactic_admin_battle_mvl/mxv
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 055   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_003
@ 056   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_1_002
@ 057   ----------------------------------------
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N05   , Bn1 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N11   , Fn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        En1 
	.byte	W11
                  .byte  GOTO
                    .word  galactic_admin_battle_1_loop
                  .byte W06
@ 058   ----------------------------------------	
                   .byte      FINE

@**************** Track 2 (Midi-Chn.2) ****************@

galactic_admin_battle_2:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 57
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*galactic_admin_battle_mvl/mxv
	.byte		MOD   , 0
	.byte		BEND  , c_v+0
	.byte		N05   , Fn5 , v112
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
@ 001   ----------------------------------------
	.byte		        Gn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		VOICE , 60
	.byte	W01
@ 006   ----------------------------------------
	.byte		N92   , Fn2 
	.byte	W96
@ 007   ----------------------------------------
	.byte		        Bn2 
	.byte	W96
@ 008   ----------------------------------------
	.byte		        En3 
	.byte	W96
@ 009   ----------------------------------------
	.byte		        Fn3 
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
                  .byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte		PAN   , c_v-17
	.byte		TIE   , Fn1 
	.byte	W96
@ 023   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		EOT   
	.byte	W01
@ 024   ----------------------------------------
	.byte		PAN   , c_v-24
	.byte		TIE   , Fn2 
	.byte	W96
@ 025   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		EOT   
	.byte		VOICE , 40
	.byte	W01
@ 026   ----------------------------------------
	.byte		PAN   , c_v+2
	.byte		N56   , Ds4 
	.byte	W03
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte	W56
	.byte	W01
	.byte		N11   , Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
@ 027   ----------------------------------------
	.byte		N32   , Cn4 
	.byte	W36
	.byte		N23   , Cs4 
	.byte	W24
	.byte		N11   , As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        As3 
	.byte	W12
@ 028   ----------------------------------------
	.byte		N56   , Cn4 
	.byte	W60
	.byte		N11   , Bn3 
	.byte	W12
	.byte		N23   , Cn4 
	.byte	W24
@ 029   ----------------------------------------
	.byte		N68   , En4 
	.byte	W68
	.byte	W03
	.byte		VOICE , 19
	.byte	W01
	.byte		N03   , Gn3 
	.byte	W04
	.byte		        As3 
	.byte	W04
	.byte		        Ds4 
	.byte	W04
	.byte		        Gn4 
	.byte	W04
	.byte		        As4 
	.byte	W04
	.byte		        Ds5 
	.byte	W03
	.byte		VOICE , 19
	.byte	W01
@ 030   ----------------------------------------
	.byte		PAN   , c_v+6
	.byte		VOL   , 119*galactic_admin_battle_mvl/mxv
	.byte		N56   , Fn5 
	.byte	W60
	.byte		N11   , Ds5 
	.byte	W12
	.byte		        Fn5 
	.byte	W12
	.byte		        Ds5 
	.byte	W12
@ 031   ----------------------------------------
	.byte		N32   , Cs5 
	.byte	W36
	.byte		N23   , Ds5 
	.byte	W24
	.byte		N11   , Cs5 
	.byte	W12
	.byte		        Cn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
@ 032   ----------------------------------------
	.byte		N68   , As4 
	.byte	W72
	.byte		N05   , Cn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
@ 033   ----------------------------------------
	.byte		PAN   , c_v+28
	.byte		N80   , Gn5 
	.byte	W84
	.byte		N02   , Gs4 
	.byte	W03
	.byte		        Cn5 
	.byte	W03
	.byte		        Ds5 
	.byte	W03
	.byte		        Gn5 
	.byte	W03
@ 034   ----------------------------------------
	.byte		TIE   , Gs5 
	.byte	W96
@ 035   ----------------------------------------
	.byte	W92
	.byte	W01
	.byte		BEND  , c_v-1
	.byte	W03
@ 036   ----------------------------------------
	.byte		VOL   , 116*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-1
	.byte	W08
	.byte		        c_v-2
	.byte	W03
	.byte		VOL   , 114*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-3
	.byte	W03
	.byte		VOL   , 111*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-4
	.byte	W09
	.byte		VOL   , 109*galactic_admin_battle_mvl/mxv
	.byte	W03
	.byte		        106*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-5
	.byte	W03
	.byte		        c_v-4
	.byte	W12
	.byte		        c_v-5
	.byte	W09
	.byte		        c_v-6
	.byte	W03
	.byte		        c_v-6
	.byte	W03
	.byte		        c_v-7
	.byte	W03
	.byte		        c_v-8
	.byte	W03
	.byte		VOL   , 101*galactic_admin_battle_mvl/mxv
	.byte	W03
	.byte		BEND  , c_v-9
	.byte	W03
	.byte		        c_v-10
	.byte	W03
	.byte		VOL   , 106*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-11
	.byte	W03
	.byte		VOL   , 101*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-11
	.byte	W03
	.byte		        c_v-12
	.byte	W03
	.byte		        c_v-13
	.byte	W03
	.byte		        c_v-15
	.byte	W03
	.byte		        c_v-16
	.byte	W06
	.byte		        c_v-16
	.byte	W04
@ 037   ----------------------------------------
	.byte	W02
	.byte		        c_v-19
	.byte	W06
	.byte		        c_v-20
	.byte	W03
	.byte		        c_v-21
	.byte	W03
	.byte		        c_v-22
	.byte	W03
	.byte		VOL   , 96*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-23
	.byte	W03
	.byte		        c_v-24
	.byte	W03
	.byte		VOL   , 94*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-26
	.byte	W03
	.byte		        c_v-27
	.byte	W03
	.byte		        c_v-28
	.byte	W03
	.byte		        c_v-31
	.byte	W03
	.byte		VOL   , 89*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-33
	.byte	W03
	.byte		        c_v-35
	.byte	W03
	.byte		VOL   , 87*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-36
	.byte	W03
	.byte		        c_v-38
	.byte	W03
	.byte		VOL   , 84*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-38
	.byte	W03
	.byte		        c_v-39
	.byte	W06
	.byte		VOL   , 82*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-41
	.byte	W03
	.byte		VOL   , 79*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-43
	.byte	W03
	.byte		VOL   , 74*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-44
	.byte	W03
	.byte		        c_v-47
	.byte	W03
	.byte		VOL   , 72*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-48
	.byte	W03
	.byte		VOL   , 67*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-50
	.byte	W03
	.byte		        c_v-52
	.byte	W03
	.byte		        c_v-53
	.byte	W03
	.byte		        c_v-55
	.byte	W03
	.byte		VOL   , 62*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-57
	.byte	W03
	.byte		VOL   , 58*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-58
	.byte	W03
	.byte		        c_v-60
	.byte	W03
	.byte		VOL   , 53*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v-60
	.byte	W03
	.byte		EOT   
	.byte		BEND  , c_v-63
	.byte	W01
@ 038   ----------------------------------------
	.byte		VOL   , 114*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N92   , Gs3 
	.byte	W96
@ 039   ----------------------------------------
	.byte		        Gs2 
	.byte	W96
@ 040   ----------------------------------------
	.byte		N92   
	.byte	W96
@ 041   ----------------------------------------
	.byte		N68   , Gs3 
	.byte	W72
	.byte		N23   , Gn3 
	.byte	W23
	.byte		VOICE , 57
	.byte	W01
@ 042   ----------------------------------------
	.byte		PAN   , c_v+32
	.byte		N32   , Gs3 
	.byte	W36
	.byte		        As3 
	.byte	W36
	.byte		N23   , Gs3 
	.byte	W24
@ 043   ----------------------------------------
	.byte		N32   , Bn3 
	.byte	W36
	.byte		        As3 
	.byte	W36
	.byte		N23   , An3 
	.byte	W24
@ 044   ----------------------------------------
	.byte		N32   , Gs3 
	.byte	W36
	.byte		        As3 
	.byte	W36
	.byte		N23   , Gs3 
	.byte	W24
@ 045   ----------------------------------------
	.byte		N32   , Bn3 
	.byte	W36
	.byte		        As3 
	.byte	W36
	.byte		N23   , An3 
	.byte	W23
	.byte		VOICE , 56
	.byte	W01
@ 046   ----------------------------------------
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Ds4 , v040
	.byte	W06
	.byte		        Ds4 , v112
	.byte	W06
	.byte		N11   , Ds4 , v040
	.byte	W18
	.byte		N23   , Ds3 , v112
	.byte	W24
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Ds4 , v040
	.byte	W06
	.byte		        Ds4 , v112
	.byte	W06
	.byte		        Ds4 , v040
	.byte	W18
@ 047   ----------------------------------------
	.byte		PAN   , c_v+46
	.byte		N44   , Cs3 , v112
	.byte	W48
	.byte		        Dn3 
	.byte	W48
@ 048   ----------------------------------------
	.byte		PAN   , c_v+32
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Ds4 , v040
	.byte	W06
	.byte		        Ds4 , v112
	.byte	W06
	.byte		N11   , Ds4 , v040
	.byte	W18
	.byte		N23   , Ds3 , v112
	.byte	W24
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Ds4 , v040
	.byte	W06
	.byte		        Ds4 , v112
	.byte	W06
	.byte		N11   , Ds4 , v040
	.byte	W18
@ 049   ----------------------------------------
	.byte		PAN   , c_v+46
	.byte		N44   , Fs3 , v112
	.byte	W48
	.byte		        En3 
	.byte	W48
@ 050   ----------------------------------------
	.byte		PAN   , c_v+13
	.byte		N92   , Fn2 
	.byte	W96
@ 051   ----------------------------------------
	.byte		        Bn2 
	.byte	W96
@ 052   ----------------------------------------
	.byte		        En3 
	.byte	W96
@ 053   ----------------------------------------
	.byte		        Fn3 
	.byte	W96
@ 054   ----------------------------------------
	.byte		N11   , Fn3 , v040
	.byte	W11
	.byte  GOTO
                    .word  galactic_admin_battle_1_loop
                  .byte W06
@ 055    ----------------------------------------              
                  .byte       FINE

@**************** Track 3 (Midi-Chn.3) ****************@

galactic_admin_battle_3:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 56
	.byte		PAN   , c_v+48
	.byte		VOL   , 110*galactic_admin_battle_mvl/mxv
	.byte		MOD   , 0
	.byte		BEND  , c_v+0
	.byte	W06
	.byte		N05   , Bn4 , v112
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		PAN   , c_v+48
	.byte		N05   , Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		PAN   , c_v+44
	.byte		N05   , Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		PAN   , c_v+36
	.byte		N05   , Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
@ 001   ----------------------------------------
	.byte		PAN   , c_v+18
	.byte		N05   , Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		PAN   , c_v-22
	.byte		N05   , Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		PAN   , c_v-38
	.byte		N05   , Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		PAN   , c_v-49
	.byte		N05   , Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
@ 002   ----------------------------------------
	.byte		PAN   , c_v+3
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		VOICE , 19
	.byte	W01
@ 006   ----------------------------------------
galactic_admin_battle_3_006:
	.byte		N05   , Fn3 , v112
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , Gs3 , v112
	.byte	W06
	.byte		N11   , Gs3 , v040
	.byte	W30
	.byte		N23   , Bn3 , v112
	.byte	W24
	.byte	PEND
@ 007   ----------------------------------------
	.byte		N05   , Fn3 
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , An3 , v112
	.byte	W06
	.byte		N11   , An3 , v040
	.byte	W30
	.byte		N23   , Cn4 , v112
	.byte	W24
@ 008   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_3_006
@ 009   ----------------------------------------
	.byte		N05   , Fn3 , v112
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , An3 , v112
	.byte	W06
	.byte		N11   , An3 , v040
	.byte	W30
	.byte		N23   , Fn4 , v112
	.byte	W04
	.byte		BEND  , c_v-11
	.byte	W03
	.byte		        c_v-20
	.byte	W04
	.byte		        c_v-32
	.byte	W04
	.byte		        c_v-40
	.byte	W04
	.byte		        c_v-47
	.byte	W04
	.byte		VOICE , 18
	.byte	W01
@ 010   ----------------------------------------
	.byte		BEND  , c_v+0
	.byte		N32   , Gs4 
	.byte	W36
	.byte		        As4 
	.byte	W36
	.byte		N23   , Bn4 
	.byte	W24
@ 011   ----------------------------------------
	.byte		N32   , As4 
	.byte	W36
	.byte		        Gs4 
	.byte	W36
	.byte		N23   , Fn4 
	.byte	W24
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
	.byte		        Ds4 
	.byte	W24
	.byte		        Fn4 
	.byte	W24
	.byte		        Gn4 
	.byte	W24
	.byte		        Gs4 
	.byte	W24
@ 013   ----------------------------------------
galactic_admin_battle_3_013:
	.byte		N11   , Gn4 , v112
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        Gn4 
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte	PEND
@ 014   ----------------------------------------
galactic_admin_battle_3_014:
	.byte		N32   , Fn4 , v112
	.byte	W36
	.byte		        Gn4 
	.byte	W36
	.byte		N23   , Fn4 
	.byte	W24
	.byte	PEND
@ 015   ----------------------------------------
galactic_admin_battle_3_015:
	.byte		N32   , Ds4 , v112
	.byte	W36
	.byte		        Fn4 
	.byte	W36
	.byte		N23   , Cn4 
	.byte	W24
	.byte	PEND
@ 016   ----------------------------------------
	.byte		N92   , Fn4 
	.byte	W96
@ 017   ----------------------------------------
	.byte		N11   , Fn4 , v040
	.byte	W80
	.byte	W03
	.byte		VOICE , 20
	.byte	W01
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		N05   , Fs4 , v112
	.byte	W06
	.byte		        Gn4 
	.byte	W06
@ 018   ----------------------------------------
	.byte		N32   , Gs4 
	.byte	W36
	.byte		        As4 
	.byte	W36
	.byte		N23   , Bn4 
	.byte	W24
@ 019   ----------------------------------------
	.byte		N32   , As4 
	.byte	W36
	.byte		        Gs4 
	.byte	W36
	.byte		N23   , Fn4 
	.byte	W23
	.byte		VOICE , 20
	.byte	W01
@ 020   ----------------------------------------
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		N23   , Ds4 
	.byte	W24
	.byte		        Fn4 
	.byte	W24
	.byte		        Gn4 
	.byte	W24
	.byte		        Gs4 
	.byte	W24
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_3_013
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_3_014
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_3_015
@ 024   ----------------------------------------
	.byte		TIE   , Fn4 , v112
	.byte	W96
@ 025   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		EOT   
	.byte	W01
@ 026   ----------------------------------------
	.byte		VOICE , 40
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte		PAN   , c_v-19
	.byte		VOL   , 101*galactic_admin_battle_mvl/mxv
	.byte		N56   , Cs5 
	.byte	W60
	.byte		N11   , As4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        As4 
	.byte	W12
@ 031   ----------------------------------------
	.byte		N32   , Gs4 
	.byte	W36
	.byte		N23   , As4 
	.byte	W24
	.byte		N11   , Gs4 
	.byte	W12
	.byte		        Gn4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
@ 032   ----------------------------------------
	.byte		N88   , Fn4 
	.byte	W90
	.byte		N05   , Fn4 , v040
	.byte	W06
@ 033   ----------------------------------------
	.byte		PAN   , c_v-29
	.byte		N92   , Ds5 , v112
	.byte	W92
	.byte	W03
	.byte		VOICE , 20
	.byte	W01
@ 034   ----------------------------------------
	.byte		VOL   , 121*galactic_admin_battle_mvl/mxv
	.byte		PAN   , c_v+2
	.byte		N32   , Ds4 
	.byte	W36
	.byte		        Cn4 
	.byte	W36
	.byte		N23   , Ds4 
	.byte	W24
@ 035   ----------------------------------------
	.byte		VOL   , 111*galactic_admin_battle_mvl/mxv
	.byte		N32   , Fn4 
	.byte	W36
	.byte		        Ds4 
	.byte	W36
	.byte		N23   , Cs4 
	.byte	W24
@ 036   ----------------------------------------
	.byte		VOL   , 102*galactic_admin_battle_mvl/mxv
	.byte		N32   , Cn4 
	.byte	W36
	.byte		        Cs4 
	.byte	W36
	.byte		N23   , Ds4 
	.byte	W24
@ 037   ----------------------------------------
	.byte		VOL   , 93*galactic_admin_battle_mvl/mxv
	.byte		N32   , As3 
	.byte	W36
	.byte		        Cn4 
	.byte	W36
	.byte		N23   , Cs4 
	.byte	W24
@ 038   ----------------------------------------
	.byte		VOL   , 80*galactic_admin_battle_mvl/mxv
	.byte		N32   , Ds4 
	.byte	W36
	.byte		        Cn4 
	.byte	W36
	.byte		N23   , Ds4 
	.byte	W24
@ 039   ----------------------------------------
	.byte		VOL   , 74*galactic_admin_battle_mvl/mxv
	.byte		N32   , Fn4 
	.byte	W36
	.byte		        Ds4 
	.byte	W36
	.byte		N23   , Cs4 
	.byte	W24
@ 040   ----------------------------------------
	.byte		VOL   , 63*galactic_admin_battle_mvl/mxv
	.byte		N32   , Cn4 
	.byte	W36
	.byte		        As3 
	.byte	W36
	.byte		N23   , Gs3 
	.byte	W24
@ 041   ----------------------------------------
	.byte		N32   , Gn3 
	.byte	W36
	.byte		        Gs3 
	.byte	W36
	.byte		N23   , Gn3 
	.byte	W23
	.byte		VOICE , 57
	.byte	W01
@ 042   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		N32   , Cs4 
	.byte	W36
	.byte		        Ds4 
	.byte	W36
	.byte		N23   , Cs4 
	.byte	W24
@ 043   ----------------------------------------
galactic_admin_battle_3_043:
	.byte		N32   , En4 , v112
	.byte	W36
	.byte		        Ds4 
	.byte	W36
	.byte		N23   , Dn4 
	.byte	W24
	.byte	PEND
@ 044   ----------------------------------------
	.byte		N32   , Cs4 
	.byte	W36
	.byte		        Ds4 
	.byte	W36
	.byte		N23   , Cs4 
	.byte	W24
@ 045   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_3_043
@ 046   ----------------------------------------
	.byte		N05   , Gs4 , v112
	.byte	W06
	.byte		        Gs4 , v040
	.byte	W06
	.byte		        Gs4 , v112
	.byte	W06
	.byte		N11   , Gs4 , v040
	.byte	W18
	.byte		N23   , Gs3 , v112
	.byte	W24
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Gs4 , v040
	.byte	W06
	.byte		        Gs4 , v112
	.byte	W06
	.byte		N11   , Gs4 , v040
	.byte	W18
@ 047   ----------------------------------------
	.byte		PAN   , c_v-45
	.byte		N44   , Fs3 , v112
	.byte	W48
	.byte		        Gn3 
	.byte	W48
@ 048   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Gs4 , v040
	.byte	W06
	.byte		        Gs4 , v112
	.byte	W06
	.byte		N11   , Gs4 , v040
	.byte	W18
	.byte		N23   , Gs3 , v112
	.byte	W24
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Gs4 , v040
	.byte	W06
	.byte		        Gs4 , v112
	.byte	W06
	.byte		N11   , Gs4 , v040
	.byte	W18
@ 049   ----------------------------------------
	.byte		PAN   , c_v-48
	.byte		N44   , Bn3 , v112
	.byte	W48
	.byte		        An3 
	.byte	W48
@ 050   ----------------------------------------
	.byte		PAN   , c_v-17
	.byte		N92   , Gs3 
	.byte	W96
@ 051   ----------------------------------------
	.byte		N92   
	.byte	W96
@ 052   ----------------------------------------
	.byte		N92   
	.byte	W96
@ 053   ----------------------------------------
	.byte		N92   
	.byte	W92
	.byte	W03
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 054       ----------------------------------------
                  .byte       FINE

@**************** Track 4 (Midi-Chn.4) ****************@

galactic_admin_battle_4:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 57
	.byte		PAN   , c_v-48
	.byte		VOL   , 110*galactic_admin_battle_mvl/mxv
	.byte		MOD   , 0
	.byte		BEND  , c_v+0
	.byte		N05   , Bn4 , v112
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
@ 001   ----------------------------------------
	.byte		PAN   , c_v-16
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		PAN   , c_v-3
	.byte		N05   , Cs4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		PAN   , c_v+9
	.byte		N05   , Bn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		PAN   , c_v+21
	.byte		N05   , An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W05
	.byte		VOICE , 56
	.byte	W01
@ 002   ----------------------------------------
	.byte		PAN   , c_v+32
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		N05   , Fn3 
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , Gs3 , v112
	.byte	W06
	.byte		N11   , Gs3 , v040
	.byte	W30
	.byte		N23   , Bn3 , v112
	.byte	W24
@ 003   ----------------------------------------
	.byte		N05   , Fn3 
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , An3 , v112
	.byte	W06
	.byte		N11   , An3 , v040
	.byte	W30
	.byte		N23   , Cn4 , v112
	.byte	W24
@ 004   ----------------------------------------
	.byte		N05   , Fn3 
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , Gs3 , v112
	.byte	W06
	.byte		N11   , Gs3 , v040
	.byte	W30
	.byte		N23   , Bn3 , v112
	.byte	W24
@ 005   ----------------------------------------
	.byte		N05   , Fn3 
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , An3 , v112
	.byte	W06
	.byte		N11   , An3 , v040
	.byte	W30
	.byte		N23   , Cn4 , v112
	.byte	W23
	.byte		VOICE , 19
	.byte	W01
@ 006   ----------------------------------------
	.byte		VOL   , 94*galactic_admin_battle_mvl/mxv
	.byte		N05   , Fn4 
	.byte	W06
	.byte		N11   , Fn4 , v040
	.byte	W30
	.byte		N05   , Gs4 , v112
	.byte	W06
	.byte		N11   , Gs4 , v040
	.byte	W30
	.byte		N23   , Bn4 , v112
	.byte	W24
@ 007   ----------------------------------------
	.byte		N05   , Fn4 
	.byte	W06
	.byte		N11   , Fn4 , v040
	.byte	W30
	.byte		N05   , An4 , v112
	.byte	W06
	.byte		N11   , An4 , v040
	.byte	W30
	.byte		N23   , Cn5 , v112
	.byte	W24
@ 008   ----------------------------------------
	.byte		N05   , Fn4 
	.byte	W06
	.byte		N11   , Fn4 , v040
	.byte	W30
	.byte		N05   , Gs4 , v112
	.byte	W06
	.byte		N11   , Gs4 , v040
	.byte	W30
	.byte		N23   , Bn4 , v112
	.byte	W24
@ 009   ----------------------------------------
	.byte		N05   , Fn4 
	.byte	W06
	.byte		N11   , Fn4 , v040
	.byte	W30
	.byte		N05   , An4 , v112
	.byte	W06
	.byte		N11   , An4 , v040
	.byte	W30
	.byte		N23   , Cn5 , v112
	.byte	W23
	.byte		VOICE , 19
	.byte	W01
@ 010   ----------------------------------------
	.byte		PAN   , c_v+32
	.byte		VOL   , 93*galactic_admin_battle_mvl/mxv
	.byte		N44   , Fn3 
	.byte	W48
	.byte		        Gs3 
	.byte	W48
@ 011   ----------------------------------------
galactic_admin_battle_4_011:
	.byte		N32   , Bn3 , v112
	.byte	W36
	.byte		N56   , Cn4 
	.byte	W60
	.byte	PEND
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
galactic_admin_battle_4_012:
	.byte		N44   , Fn3 , v112
	.byte	W48
	.byte		        Gs3 
	.byte	W48
	.byte	PEND
@ 013   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_011
@ 014   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_012
@ 015   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_012
@ 017   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_011
@ 018   ----------------------------------------
galactic_admin_battle_4_018:
	.byte		N44   , Fn4 , v112
	.byte	W48
	.byte		        Gs4 
	.byte	W48
	.byte	PEND
@ 019   ----------------------------------------
galactic_admin_battle_4_019:
	.byte		N32   , Bn4 , v112
	.byte	W36
	.byte		N56   , Cn5 
	.byte	W60
	.byte	PEND
@ 020   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_018
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_019
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_018
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_019
@ 024   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_4_018
@ 025   ----------------------------------------
	.byte		N32   , Bn4 , v112
	.byte	W36
	.byte		N56   , Cn5 
	.byte	W56
	.byte	W03
	.byte		VOICE , 46
	.byte	W01
@ 026   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte		VOL   , 116*galactic_admin_battle_mvl/mxv
	.byte		N07   , Fs3 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		PAN   , c_v-6
	.byte		N07   , Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		PAN   , c_v-8
	.byte		N07   , Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		PAN   , c_v-11
	.byte		N07   , Ds4 
	.byte	W08
	.byte		        Fs4 
	.byte	W08
	.byte		PAN   , c_v-16
	.byte		N07   , Ds4 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		PAN   , c_v-20
	.byte		N07   , Fs3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
@ 027   ----------------------------------------
	.byte		PAN   , c_v-27
	.byte		N07   , Fs3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , Ds3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		PAN   , c_v-38
	.byte		N07   , Ds3 
	.byte	W08
	.byte		        As2 
	.byte	W08
	.byte		PAN   , c_v-41
	.byte		N07   , Ds3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		PAN   , c_v-45
	.byte		N07   , As3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		PAN   , c_v-48
	.byte		N07   , As3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
@ 028   ----------------------------------------
	.byte		PAN   , c_v-48
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v-41
	.byte		N07   , En3 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v-23
	.byte		N07   , Cn4 
	.byte	W08
	.byte		PAN   , c_v-16
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v-8
	.byte		N07   , Cn4 
	.byte	W08
	.byte		PAN   , c_v+0
	.byte		N07   , En4 
	.byte	W08
	.byte		PAN   , c_v+12
	.byte		N07   , Gn4 
	.byte	W08
	.byte		PAN   , c_v+24
	.byte		N07   , Cn5 
	.byte	W08
	.byte		PAN   , c_v+32
	.byte		N07   , En5 
	.byte	W08
	.byte		PAN   , c_v+40
	.byte		N07   , Cn5 
	.byte	W08
	.byte		PAN   , c_v+48
	.byte		N07   , En5 
	.byte	W08
@ 029   ----------------------------------------
	.byte		PAN   , c_v-48
	.byte		N07   , Gn2 
	.byte	W08
	.byte		PAN   , c_v-41
	.byte		N07   , Cn3 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , En3 
	.byte	W08
	.byte		PAN   , c_v-23
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v-16
	.byte		N07   , Cn3 
	.byte	W08
	.byte		PAN   , c_v-8
	.byte		N07   , En3 
	.byte	W08
	.byte		PAN   , c_v+0
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v+12
	.byte		N07   , Cn4 
	.byte	W08
	.byte		PAN   , c_v+24
	.byte		N07   , En4 
	.byte	W08
	.byte		PAN   , c_v+32
	.byte		N07   , Gn4 
	.byte	W08
	.byte		PAN   , c_v+40
	.byte		N07   , Cn5 
	.byte	W08
	.byte		PAN   , c_v+48
	.byte		N07   , En5 
	.byte	W08
@ 030   ----------------------------------------
	.byte		PAN   , c_v-48
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v-45
	.byte		N07   , Gs2 
	.byte	W08
	.byte		PAN   , c_v-43
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v-39
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v-36
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v-25
	.byte		N07   , Gs3 
	.byte	W08
	.byte		PAN   , c_v-20
	.byte		N07   , Cs4 
	.byte	W08
	.byte		PAN   , c_v-17
	.byte		N07   , Gs3 
	.byte	W08
	.byte		PAN   , c_v-12
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v-9
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v-6
	.byte		N07   , Gs3 
	.byte	W08
@ 031   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v+4
	.byte		N07   , Cs4 
	.byte	W08
	.byte		PAN   , c_v+6
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v+10
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v+14
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v+19
	.byte		N07   , Gs2 
	.byte	W08
	.byte		PAN   , c_v+24
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v+29
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v+35
	.byte		N07   , Gs3 
	.byte	W08
	.byte		PAN   , c_v+41
	.byte		N07   , Fn3 
	.byte	W08
	.byte		PAN   , c_v+45
	.byte		N07   , Gs3 
	.byte	W08
	.byte		PAN   , c_v+48
	.byte		N07   , Cs4 
	.byte	W08
@ 032   ----------------------------------------
	.byte		PAN   , c_v+35
	.byte		N07   , Ds3 
	.byte	W08
	.byte		PAN   , c_v+26
	.byte		N07   , As2 
	.byte	W08
	.byte		PAN   , c_v+21
	.byte		N07   , Ds3 
	.byte	W08
	.byte		PAN   , c_v+16
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v+8
	.byte		N07   , Ds3 
	.byte	W08
	.byte		PAN   , c_v+0
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v-11
	.byte		N07   , As3 
	.byte	W08
	.byte		PAN   , c_v-22
	.byte		N07   , Ds4 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , Gn4 
	.byte	W08
	.byte		PAN   , c_v-38
	.byte		N07   , As4 
	.byte	W08
	.byte		PAN   , c_v-43
	.byte		N07   , Gn4 
	.byte	W08
	.byte		PAN   , c_v-48
	.byte		N07   , As4 
	.byte	W08
@ 033   ----------------------------------------
	.byte		PAN   , c_v+48
	.byte		N07   , Gn2 
	.byte	W08
	.byte		PAN   , c_v+35
	.byte		N07   , As2 
	.byte	W08
	.byte		PAN   , c_v+26
	.byte		N07   , Ds3 
	.byte	W08
	.byte		PAN   , c_v+21
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v+16
	.byte		N07   , As2 
	.byte	W08
	.byte		PAN   , c_v+8
	.byte		N07   , Ds3 
	.byte	W08
	.byte		PAN   , c_v+0
	.byte		N07   , Gn3 
	.byte	W08
	.byte		PAN   , c_v-11
	.byte		N07   , As3 
	.byte	W08
	.byte		PAN   , c_v-22
	.byte		N07   , Ds4 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , Gn4 
	.byte	W08
	.byte		PAN   , c_v-38
	.byte		N07   , As4 
	.byte	W08
	.byte		PAN   , c_v-43
	.byte		N07   , Ds5 
	.byte	W08
@ 034   ----------------------------------------
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		PAN   , c_v-49
	.byte		N11   , Ds5 , v040
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	W96
@ 041   ----------------------------------------
	.byte	W96
@ 042   ----------------------------------------
	.byte	W96
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	W96
@ 045   ----------------------------------------
	.byte	W96
@ 046   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		VOICE , 29
	.byte	W01
@ 047   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		VOL   , 105*galactic_admin_battle_mvl/mxv
	.byte		N07   , As2 , v112
	.byte	W08
	.byte		PAN   , c_v-24
	.byte		N07   , Cs3 
	.byte	W08
	.byte		PAN   , c_v-15
	.byte		N07   , Fs3 
	.byte	W08
	.byte		PAN   , c_v+0
	.byte		N07   , As3 
	.byte	W08
	.byte		PAN   , c_v+13
	.byte		N07   , Cs4 
	.byte	W08
	.byte		PAN   , c_v+22
	.byte		N07   , Fs4 
	.byte	W08
	.byte		PAN   , c_v+32
	.byte		N07   , Bn3 
	.byte	W08
	.byte		PAN   , c_v+22
	.byte		N07   , Dn4 
	.byte	W08
	.byte		PAN   , c_v+8
	.byte		N07   , Gn4 
	.byte	W08
	.byte		PAN   , c_v-5
	.byte		N07   , Bn4 
	.byte	W08
	.byte		PAN   , c_v-16
	.byte		N07   , Dn5 
	.byte	W08
	.byte		PAN   , c_v-24
	.byte		N07   , Gn5 
	.byte	W08
@ 048   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		N11   , Gn5 , v040
	.byte	W96
@ 049   ----------------------------------------
	.byte		PAN   , c_v+32
	.byte		N07   , Ds3 , v112
	.byte	W08
	.byte		PAN   , c_v+20
	.byte		N07   , Fs3 
	.byte	W08
	.byte		PAN   , c_v+10
	.byte		N07   , Bn3 
	.byte	W08
	.byte		PAN   , c_v+0
	.byte		N07   , Ds4 
	.byte	W08
	.byte		PAN   , c_v-13
	.byte		N07   , Fs3 
	.byte	W08
	.byte		PAN   , c_v-23
	.byte		N07   , Bn3 
	.byte	W08
	.byte		PAN   , c_v-32
	.byte		N07   , Cs4 
	.byte	W08
	.byte		PAN   , c_v-16
	.byte		N07   , En4 
	.byte	W08
	.byte		PAN   , c_v-5
	.byte		N07   , An4 
	.byte	W08
	.byte		PAN   , c_v+6
	.byte		N07   , Cs5 
	.byte	W08
	.byte		PAN   , c_v+20
	.byte		N07   , En5 
	.byte	W08
	.byte		PAN   , c_v+32
	.byte		N07   , An5 
	.byte	W08
@ 050   ----------------------------------------
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		PAN   , c_v-22
	.byte		N80   , Fn1 
	.byte	W84
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
@ 051   ----------------------------------------
	.byte		N80   , Bn1 
	.byte	W84
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
@ 052   ----------------------------------------
	.byte		N80   , En2 
	.byte	W84
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
@ 053   ----------------------------------------
	.byte		N32   , Fn2 
	.byte	W48
	.byte		BEND  , c_v+63
	.byte		N44   , Fn1 , v127
	.byte	W02
	.byte		BEND  , c_v+52
	.byte	W03
	.byte		        c_v+48
	.byte	W03
	.byte		        c_v+41
	.byte	W04
	.byte		        c_v+35
	.byte	W02
	.byte		        c_v+25
	.byte	W03
	.byte		        c_v+17
	.byte	W03
	.byte		        c_v+9
	.byte	W04
	.byte		        c_v+1
	.byte	W02
	.byte		        c_v-12
	.byte	W03
	.byte		        c_v-21
	.byte	W03
	.byte		        c_v-30
	.byte	W04
	.byte		        c_v-35
	.byte	W02
	.byte		        c_v-47
	.byte	W03
	.byte		        c_v-56
	.byte	W03
	.byte		        c_v-64
	.byte	W04
@ 054   ----------------------------------------
	.byte		VOL   , 106*galactic_admin_battle_mvl/mxv
	.byte		PAN   , c_v+22
	.byte		BEND  , c_v+0
	.byte		N44   , Fn2 , v112
	.byte	W48
	.byte		        Gs2 
	.byte	W48
@ 055   ----------------------------------------
	.byte		N32   , Bn2 
	.byte	W36
	.byte		N56   , Cn3 
	.byte	W60
@ 056   ----------------------------------------
	.byte		N44   , Fn2 
	.byte	W48
	.byte		        Gs2 
	.byte	W48
@ 057   ----------------------------------------
	.byte		N32   , Bn2 
	.byte	W36
	.byte		N56   , Cn3 
	.byte	W56
	.byte	W03
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 058       ----------------------------------------
                  .byte       FINE

@**************** Track 5 (Midi-Chn.5) ****************@

galactic_admin_battle_5:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 19
	.byte		VOL   , 110*galactic_admin_battle_mvl/mxv
	.byte		MOD   , 0
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte		PAN   , c_v+48
	.byte		VOL   , 121*galactic_admin_battle_mvl/mxv
	.byte		N05   , Dn2 , v112
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		PAN   , c_v+36
	.byte		N05   , En2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		PAN   , c_v+24
	.byte		N05   , En2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		PAN   , c_v+12
	.byte		N05   , Fs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		PAN   , c_v-20
	.byte		N05   , Fs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		PAN   , c_v-38
	.byte		N05   , Gs2 , v100
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		PAN   , c_v-48
	.byte		N05   , Gs2 , v112
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		PAN   , c_v-55
	.byte		N05   , As2 , v127
	.byte	W06
	.byte		        Bn2 
	.byte	W05
	.byte		VOICE , 56
	.byte	W01
@ 002   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		VOL   , 125*galactic_admin_battle_mvl/mxv
	.byte		N05   , Cn3 
	.byte	W06
	.byte		N11   , Cn3 , v040
	.byte	W30
	.byte		N05   , Ds3 , v112
	.byte	W06
	.byte		N11   , Ds3 , v040
	.byte	W30
	.byte		N23   , Fs3 , v112
	.byte	W24
@ 003   ----------------------------------------
	.byte		N05   , Cn3 
	.byte	W06
	.byte		N11   , Cn3 , v040
	.byte	W30
	.byte		N05   , Fs3 , v112
	.byte	W06
	.byte		N11   , Fs3 , v040
	.byte	W30
	.byte		N23   , An3 , v112
	.byte	W24
@ 004   ----------------------------------------
	.byte		N05   , Cn3 
	.byte	W06
	.byte		N11   , Cn3 , v040
	.byte	W30
	.byte		N05   , Ds3 , v112
	.byte	W06
	.byte		N11   , Ds3 , v040
	.byte	W30
	.byte		N23   , Fs3 , v112
	.byte	W24
@ 005   ----------------------------------------
	.byte		N05   , Cn3 
	.byte	W06
	.byte		N11   , Cn3 , v040
	.byte	W30
	.byte		N05   , Fs3 , v112
	.byte	W06
	.byte		N11   , Fs3 , v040
	.byte	W30
	.byte		N23   , An3 , v112
	.byte	W23
	.byte		VOICE , 19
	.byte	W01
@ 006   ----------------------------------------
	.byte		VOL   , 94*galactic_admin_battle_mvl/mxv
	.byte		N05   , Cn4 
	.byte	W06
	.byte		N11   , Cn4 , v040
	.byte	W30
	.byte		N05   , Ds4 , v112
	.byte	W06
	.byte		N11   , Ds4 , v040
	.byte	W30
	.byte		N23   , Fs4 , v112
	.byte	W24
@ 007   ----------------------------------------
	.byte		N05   , Cn4 
	.byte	W06
	.byte		N11   , Cn4 , v040
	.byte	W30
	.byte		N05   , Fs4 , v112
	.byte	W06
	.byte		N11   , Fs4 , v040
	.byte	W30
	.byte		N23   , An4 , v112
	.byte	W24
@ 008   ----------------------------------------
	.byte		N05   , Cn4 
	.byte	W06
	.byte		N11   , Cn4 , v040
	.byte	W30
	.byte		N05   , Ds4 , v112
	.byte	W06
	.byte		N11   , Ds4 , v040
	.byte	W30
	.byte		N23   , Fs4 , v112
	.byte	W24
@ 009   ----------------------------------------
	.byte		N05   , Cn4 
	.byte	W06
	.byte		N11   , Cn4 , v040
	.byte	W30
	.byte		N05   , Fs4 , v112
	.byte	W06
	.byte		N11   , Fs4 , v040
	.byte	W30
	.byte		N23   , An5 , v084
	.byte	W04
	.byte		BEND  , c_v-11
	.byte	W03
	.byte		        c_v-20
	.byte	W04
	.byte		        c_v-32
	.byte	W04
	.byte		        c_v-40
	.byte	W04
	.byte		        c_v-47
	.byte	W04
	.byte		VOICE , 19
	.byte	W01
@ 010   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		BEND  , c_v+0
	.byte		N44   , Cn3 , v112
	.byte	W48
	.byte		        Ds3 
	.byte	W48
@ 011   ----------------------------------------
galactic_admin_battle_5_011:
	.byte		N32   , Fs3 , v112
	.byte	W36
	.byte		N56   , Fn3 
	.byte	W60
	.byte	PEND
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
galactic_admin_battle_5_012:
	.byte		N44   , Cn3 , v112
	.byte	W48
	.byte		        Ds3 
	.byte	W48
	.byte	PEND
@ 013   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_011
@ 014   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_012
@ 015   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_012
@ 017   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_011
@ 018   ----------------------------------------
galactic_admin_battle_5_018:
	.byte		N44   , Cn4 , v112
	.byte	W48
	.byte		        Ds4 
	.byte	W48
	.byte	PEND
@ 019   ----------------------------------------
galactic_admin_battle_5_019:
	.byte		N32   , Fs4 , v112
	.byte	W36
	.byte		N56   , Fn4 
	.byte	W60
	.byte	PEND
@ 020   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_018
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_019
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_018
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_019
@ 024   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_018
@ 025   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_019
@ 026   ----------------------------------------
	.byte		N11   , Fn3 , v040
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	W96
@ 041   ----------------------------------------
	.byte	W96
@ 042   ----------------------------------------
	.byte	W96
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	W96
@ 045   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		VOICE , 80
	.byte	W01
@ 046   ----------------------------------------
galactic_admin_battle_5_046:
	.byte		N32   , Gs2 , v112
	.byte	W36
	.byte		N23   
	.byte	W24
	.byte		N56   
	.byte	W36
	.byte	PEND
@ 047   ----------------------------------------
	.byte	W96
@ 048   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_5_046
@ 049   ----------------------------------------
	.byte	W96
@ 050   ----------------------------------------
	.byte	W96
@ 051   ----------------------------------------
	.byte	W96
@ 052   ----------------------------------------
	.byte	W96
@ 053   ----------------------------------------
	.byte	W03
	.byte		PAN   , c_v+26
	.byte	W21
	.byte		VOICE , 29
	.byte	W12
	.byte		N02   , Fn1 , v112
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		BEND  , c_v+57
	.byte		N44   , Fn1 , v127
	.byte	W02
	.byte		BEND  , c_v+52
	.byte	W01
	.byte		PAN   , c_v+42
	.byte		BEND  , c_v+40
	.byte	W03
	.byte		        c_v+32
	.byte	W02
	.byte		PAN   , c_v+13
	.byte		BEND  , c_v+24
	.byte	W01
	.byte		PAN   , c_v+32
	.byte	W02
	.byte		BEND  , c_v+16
	.byte	W03
	.byte		PAN   , c_v+26
	.byte		BEND  , c_v+5
	.byte	W03
	.byte		PAN   , c_v+23
	.byte	W01
	.byte		BEND  , c_v-3
	.byte	W02
	.byte		PAN   , c_v+10
	.byte		BEND  , c_v-14
	.byte	W03
	.byte		        c_v-21
	.byte	W01
	.byte		PAN   , c_v+7
	.byte	W02
	.byte		        c_v+0
	.byte		BEND  , c_v-26
	.byte	W03
	.byte		PAN   , c_v-6
	.byte	W01
	.byte		BEND  , c_v-31
	.byte	W02
	.byte		PAN   , c_v-16
	.byte		BEND  , c_v-40
	.byte	W03
	.byte		        c_v-43
	.byte	W01
	.byte		PAN   , c_v-22
	.byte	W02
	.byte		        c_v-34
	.byte		BEND  , c_v-48
	.byte	W03
	.byte		        c_v-56
	.byte	W03
	.byte		        c_v-64
	.byte	W04
@ 054   ----------------------------------------
	.byte		PAN   , c_v-49
	.byte		VOL   , 94*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N44   , Cn2 , v112
	.byte	W48
	.byte		        Ds2 
	.byte	W48
@ 055   ----------------------------------------
	.byte		N32   , Fs2 
	.byte	W36
	.byte		N56   , Fn2 
	.byte	W60
@ 056   ----------------------------------------
	.byte		N44   , Cn2 
	.byte	W48
	.byte		        Ds2 
	.byte	W48
@ 057   ----------------------------------------
	.byte		N32   , Fs2 
	.byte	W36
	.byte		N56   , Fn2 
	.byte	W56
	.byte	W03
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 058       ----------------------------------------
                  .byte       FINE

@**************** Track 6 (Midi-Chn.6) ****************@

galactic_admin_battle_6:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 81
	.byte		PAN   , c_v+0
	.byte		VOL   , 96*galactic_admin_battle_mvl/mxv
	.byte		MOD   , 0
	.byte		BEND  , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte		N44   , Fn3 , v112
	.byte	W96
@ 003   ----------------------------------------
	.byte	W72
	.byte		N23   , Cn3 
	.byte	W24
@ 004   ----------------------------------------
	.byte		N44   , Fn3 
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte		N68   
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte		N68   
	.byte	W96
@ 009   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		VOICE , 17
	.byte	W01
	.byte		PAN   , c_v-46
	.byte		VOL   , 108*galactic_admin_battle_mvl/mxv
	.byte		N05   , Fn2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        As2 
	.byte	W03
	.byte		VOL   , 108*galactic_admin_battle_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v-25
	.byte		N05   , Cn3 
	.byte	W02
	.byte		PAN   , c_v-9
	.byte	W03
	.byte		        c_v+4
	.byte	W01
	.byte		N05   , Dn3 
	.byte	W02
	.byte		PAN   , c_v+16
	.byte	W04
	.byte		        c_v+23
	.byte		N05   , En3 
	.byte	W02
	.byte		PAN   , c_v+39
	.byte	W03
	.byte		        c_v+52
	.byte	W01
	.byte		N05   , Gn3 
	.byte	W02
	.byte		PAN   , c_v+55
	.byte	W04
@ 010   ----------------------------------------
	.byte		VOL   , 63*galactic_admin_battle_mvl/mxv
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte		VOICE , 29
	.byte		VOL   , 80*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W24
	.byte		PAN   , c_v+48
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v+40
	.byte		N11   , Fn5 
	.byte	W12
	.byte		PAN   , c_v+24
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v+12
	.byte		N11   , Fn5 
	.byte	W12
	.byte		PAN   , c_v+0
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v-16
	.byte		N11   , Fn5 
	.byte	W12
@ 017   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v-40
	.byte		N11   , Fn5 
	.byte	W12
	.byte		PAN   , c_v-48
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v-32
	.byte		N11   , Fn5 
	.byte	W12
	.byte		PAN   , c_v-9
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v+9
	.byte		N11   , Fn5 
	.byte	W12
	.byte		PAN   , c_v+27
	.byte		N11   , As5 
	.byte	W12
	.byte		PAN   , c_v+48
	.byte		N11   , Fn5 
	.byte	W12
@ 018   ----------------------------------------
	.byte		PAN   , c_v-46
	.byte		VOL   , 122*galactic_admin_battle_mvl/mxv
	.byte	W96
@ 019   ----------------------------------------
	.byte		        96*galactic_admin_battle_mvl/mxv
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W90
	.byte		VOICE , 40
	.byte	W06
@ 026   ----------------------------------------
	.byte		PAN   , c_v-29
	.byte		N56   , Ds3 
	.byte	W60
	.byte		N11   , Cs3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
@ 027   ----------------------------------------
	.byte		N32   , Cn3 
	.byte	W36
	.byte		N23   , Cs3 
	.byte	W24
	.byte		N11   , As2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        As2 
	.byte	W12
@ 028   ----------------------------------------
	.byte		N56   , Cn3 
	.byte	W60
	.byte		N11   , Bn2 
	.byte	W12
	.byte		N23   , Cn3 
	.byte	W24
@ 029   ----------------------------------------
	.byte		N92   , En3 
	.byte	W96
@ 030   ----------------------------------------
	.byte		PAN   , c_v+5
	.byte		N56   , Fn4 
	.byte	W60
	.byte		N11   , Ds4 
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
@ 031   ----------------------------------------
	.byte		N32   , Cs4 
	.byte	W36
	.byte		N23   , Ds4 
	.byte	W24
	.byte		N11   , Cs4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
@ 032   ----------------------------------------
	.byte		N88   , As3 
	.byte	W90
	.byte		N05   , Fs4 
	.byte	W06
@ 033   ----------------------------------------
	.byte		N92   , Gn4 
	.byte	W96
@ 034   ----------------------------------------
	.byte		PAN   , c_v-36
	.byte		TIE   , Gs4 
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		EOT   
	.byte	W01
@ 040   ----------------------------------------
	.byte		N92   , Gs3 
	.byte	W96
@ 041   ----------------------------------------
	.byte		N68   , Ds4 
	.byte	W72
	.byte		N23   
	.byte	W23
	.byte		VOICE , 60
	.byte	W01
@ 042   ----------------------------------------
	.byte		PAN   , c_v+32
	.byte		N11   , Gs4 
	.byte	W12
	.byte		PAN   , c_v+28
	.byte		N11   , Cs4 
	.byte	W12
	.byte		PAN   , c_v+25
	.byte		N11   , Gs3 
	.byte	W12
	.byte		PAN   , c_v+19
	.byte		N11   , As4 
	.byte	W12
	.byte		PAN   , c_v+16
	.byte		N11   , Ds4 
	.byte	W12
	.byte		PAN   , c_v+12
	.byte		N11   , As3 
	.byte	W12
	.byte		PAN   , c_v+8
	.byte		N11   , Bn4 
	.byte	W12
	.byte		PAN   , c_v+4
	.byte		N11   , Bn3 
	.byte	W12
@ 043   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte		N11   , Cs5 
	.byte	W12
	.byte		PAN   , c_v-5
	.byte		N11   , En4 
	.byte	W12
	.byte		PAN   , c_v-8
	.byte		N11   , Cs4 
	.byte	W12
	.byte		PAN   , c_v-14
	.byte		N11   , Ds5 
	.byte	W12
	.byte		PAN   , c_v-16
	.byte		N11   , Fs4 
	.byte	W12
	.byte		PAN   , c_v-21
	.byte		N11   , Ds4 
	.byte	W12
	.byte		PAN   , c_v-24
	.byte		N11   , En5 
	.byte	W12
	.byte		PAN   , c_v-28
	.byte		N11   , En4 
	.byte	W12
@ 044   ----------------------------------------
	.byte		PAN   , c_v-32
	.byte		N11   , Cs5 
	.byte	W12
	.byte		PAN   , c_v-30
	.byte		N11   , Fs4 
	.byte	W12
	.byte		PAN   , c_v-24
	.byte		N11   , Cs4 
	.byte	W12
	.byte		PAN   , c_v-21
	.byte		N11   , Ds5 
	.byte	W12
	.byte		PAN   , c_v-18
	.byte		N11   , Gs4 
	.byte	W12
	.byte		PAN   , c_v-14
	.byte		N11   , Ds4 
	.byte	W12
	.byte		PAN   , c_v-9
	.byte		N11   , En5 
	.byte	W12
	.byte		PAN   , c_v-4
	.byte		N11   , En4 
	.byte	W12
@ 045   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte		N11   , Fs5 
	.byte	W12
	.byte		PAN   , c_v+7
	.byte		N11   , As4 
	.byte	W12
	.byte		PAN   , c_v+15
	.byte		N11   , Fs4 
	.byte	W12
	.byte		PAN   , c_v+18
	.byte		N11   , Gn5 
	.byte	W12
	.byte		PAN   , c_v+24
	.byte		N11   , Cs5 
	.byte	W12
	.byte		PAN   , c_v+28
	.byte		N11   , Gn4 
	.byte	W12
	.byte		PAN   , c_v+32
	.byte		N23   , An5 
	.byte	W24
@ 046   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Gs5 , v040
	.byte	W06
	.byte		        Gs5 , v112
	.byte	W06
	.byte		N11   , Gs5 , v040
	.byte	W42
	.byte		N05   , Gs5 , v112
	.byte	W06
	.byte		        Gs5 , v040
	.byte	W06
	.byte		        Gs5 , v112
	.byte	W06
	.byte		N11   , Gs5 , v040
	.byte	W18
@ 047   ----------------------------------------
	.byte	W96
@ 048   ----------------------------------------
	.byte		N05   , Gs5 , v112
	.byte	W06
	.byte		        Gs5 , v040
	.byte	W06
	.byte		        Gs5 , v112
	.byte	W06
	.byte		N11   , Gs5 , v040
	.byte	W42
	.byte		N05   , Gs5 , v112
	.byte	W06
	.byte		        Gs5 , v040
	.byte	W06
	.byte		        Gs5 , v112
	.byte	W06
	.byte		N11   , Gs5 , v040
	.byte	W18
@ 049   ----------------------------------------
	.byte	W96
@ 050   ----------------------------------------
	.byte		VOICE , 2
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 051       ----------------------------------------
                  .byte       FINE

@**************** Track 7 (Midi-Chn.7) ****************@

galactic_admin_battle_7:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 80
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte		BEND  , c_v+1
	.byte	W03
	.byte		VOL   , 89*galactic_admin_battle_mvl/mxv
	.byte		PAN   , c_v-1
	.byte		N05   , Fn3 , v112
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , Gs3 , v112
	.byte	W06
	.byte		N11   , Gs3 , v040
	.byte	W30
	.byte		N23   , Bn3 , v112
	.byte	W21
@ 003   ----------------------------------------
galactic_admin_battle_7_003:
	.byte	W03
	.byte		N05   , Fn3 , v112
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , An3 , v112
	.byte	W06
	.byte		N11   , An3 , v040
	.byte	W30
	.byte		N23   , Cn4 , v112
	.byte	W21
	.byte	PEND
@ 004   ----------------------------------------
	.byte	W03
	.byte		N05   , Fn3 
	.byte	W06
	.byte		N11   , Fn3 , v040
	.byte	W30
	.byte		N05   , Gs3 , v112
	.byte	W06
	.byte		N11   , Gs3 , v040
	.byte	W30
	.byte		N23   , Bn3 , v112
	.byte	W21
@ 005   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_7_003
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W72
	.byte		PAN   , c_v+0
	.byte		VOL   , 121*galactic_admin_battle_mvl/mxv
	.byte		N23   , Cn5 , v112
	.byte	W24
@ 010   ----------------------------------------
	.byte		PAN   , c_v-18
	.byte		VOL   , 51*galactic_admin_battle_mvl/mxv
	.byte	W02
	.byte		VOICE , 18
	.byte	W01
	.byte		N32   , Gs4 
	.byte	W36
	.byte		        As4 
	.byte	W36
	.byte		N23   , Bn4 
	.byte	W21
@ 011   ----------------------------------------
galactic_admin_battle_7_011:
	.byte	W03
	.byte		N32   , As4 , v112
	.byte	W36
	.byte		        Gs4 
	.byte	W36
	.byte		N23   , Fn4 
	.byte	W21
	.byte	PEND
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
galactic_admin_battle_7_012:
	.byte	W03
	.byte		N23   , Ds4 , v112
	.byte	W24
	.byte		        Fn4 
	.byte	W24
	.byte		        Gn4 
	.byte	W24
	.byte		        Gs4 
	.byte	W21
	.byte	PEND
@ 013   ----------------------------------------
galactic_admin_battle_7_013:
	.byte	W03
	.byte		N11   , Gn4 , v112
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        Gn4 
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Fs4 
	.byte	W09
	.byte	PEND
@ 014   ----------------------------------------
galactic_admin_battle_7_014:
	.byte	W03
	.byte		N32   , Fn4 , v112
	.byte	W36
	.byte		        Gn4 
	.byte	W36
	.byte		N23   , Fn4 
	.byte	W21
	.byte	PEND
@ 015   ----------------------------------------
galactic_admin_battle_7_015:
	.byte	W03
	.byte		N32   , Ds4 , v112
	.byte	W36
	.byte		        Fn4 
	.byte	W36
	.byte		N23   , Cn4 
	.byte	W21
	.byte	PEND
@ 016   ----------------------------------------
	.byte	W03
	.byte		N92   , Fn4 
	.byte	W92
	.byte	W01
@ 017   ----------------------------------------
	.byte	W03
	.byte		N11   , Fn4 , v040
	.byte	W80
	.byte	W03
	.byte		VOICE , 20
	.byte	W01
	.byte		N05   , Fs4 , v112
	.byte	W06
	.byte		        Gn4 
	.byte	W03
@ 018   ----------------------------------------
	.byte	W03
	.byte		N32   , Gs4 
	.byte	W36
	.byte		        As4 
	.byte	W36
	.byte		N23   , Bn4 
	.byte	W21
@ 019   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_7_011
@ 020   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_7_012
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_7_013
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_7_014
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_7_015
@ 024   ----------------------------------------
	.byte	W03
	.byte		TIE   , Fn4 , v112
	.byte	W92
	.byte	W01
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W02
	.byte		EOT   
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 027       ----------------------------------------
                  .byte       FINE

@**************** Track 8 (Midi-Chn.10) ****************@

galactic_admin_battle_8:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 1
	.byte		PAN   , c_v+0
	.byte		MOD   , 0
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N44   , An2 , v112
	.byte	W48
	.byte		N23   
	.byte	W24
	.byte		N68   
	.byte	W24
@ 001   ----------------------------------------
	.byte		N92   , Gn0 
	.byte	W48
	.byte		N23   , Bn0 
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 002   ----------------------------------------
	.byte		N23   
	.byte		N68   , Cs2 
	.byte	W24
	.byte		N23   , Bn0 
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
@ 003   ----------------------------------------
galactic_admin_battle_8_003:
	.byte		N23   , Bn0 , v112
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte	PEND
@ 004   ----------------------------------------
galactic_admin_battle_8_004:
	.byte		N23   , Bn0 , v112
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
galactic_admin_battle_8_005:
	.byte		N23   , Bn0 , v112
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N11   , En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte	PEND
@ 006   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_003
@ 008   ----------------------------------------
	.byte		N23   , Bn0 , v112
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 009   ----------------------------------------
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , En1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
@ 010   ----------------------------------------
galactic_admin_battle_8_010:
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
galactic_admin_battle_8_011:
	.byte		N05   , Bn0 , v112
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 013   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_011
@ 014   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 015   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 017   ----------------------------------------
	.byte		N05   , Bn0 , v112
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
@ 018   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 019   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_011
@ 020   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_011
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_011
@ 024   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_010
@ 025   ----------------------------------------
	.byte		N92   , Gn0 , v112
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 026   ----------------------------------------
	.byte		        Bn0 
	.byte		N68   , Cs2 
	.byte	W12
	.byte		N11   , Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
@ 027   ----------------------------------------
galactic_admin_battle_8_027:
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte	PEND
@ 028   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 029   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 030   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 031   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 032   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 033   ----------------------------------------
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
@ 034   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 035   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 036   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 037   ----------------------------------------
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 038   ----------------------------------------
galactic_admin_battle_8_038:
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte		N11   , Fs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte	PEND
@ 039   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_038
@ 040   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_038
@ 041   ----------------------------------------
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte		N11   , Fs1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 042   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_038
@ 043   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_038
@ 044   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_038
@ 045   ----------------------------------------
	.byte		N11   , En1 , v112
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte		N11   , Fs1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
@ 046   ----------------------------------------
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W24
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn0 
	.byte	W12
@ 047   ----------------------------------------
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N11   , En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
@ 048   ----------------------------------------
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W24
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn0 
	.byte	W12
@ 049   ----------------------------------------
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 050   ----------------------------------------
	.byte		N68   , Cs2 
	.byte	W72
	.byte		N11   , Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
@ 051   ----------------------------------------
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
@ 052   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_005
@ 053   ----------------------------------------
	.byte		N11   , En1 , v112
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 054   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 055   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 056   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_8_027
@ 057   ----------------------------------------
	.byte		N11   , En1 , v112
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W11
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 058       ----------------------------------------
                  .byte       FINE

@**************** Track 9 (Midi-Chn.9) ****************@

galactic_admin_battle_9:
	.byte	KEYSH , galactic_admin_battle_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 51
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		MOD   , 0
	.byte		BEND  , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
galactic_admin_battle_1_loop:
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte		VOL   , 127*galactic_admin_battle_mvl/mxv
	.byte		PAN   , c_v-24
	.byte	W24
	.byte		VOL   , 111*galactic_admin_battle_mvl/mxv
	.byte	W12
	.byte		N11   , Ds2 , v112
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gs2 
	.byte	W06
@ 018   ----------------------------------------
galactic_admin_battle_9_018:
	.byte		N23   , Gs2 , v112
	.byte	W24
	.byte		N11   , Ds2 
	.byte	W12
	.byte		N23   , Gs2 
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N11   , Ds2 
	.byte	W12
	.byte	PEND
@ 019   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 020   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 021   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 022   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 023   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 024   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 025   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 026   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 027   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 028   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 029   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 030   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 031   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 032   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 033   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 034   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 035   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 036   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 037   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 038   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 039   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 040   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 041   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 042   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 043   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 044   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 045   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_018
@ 046   ----------------------------------------
galactic_admin_battle_9_046:
	.byte		N11   , Gs2 , v112
	.byte	W12
	.byte		N11   
	.byte	W24
	.byte		N23   , Ds2 
	.byte	W24
	.byte		N11   , Gs2 
	.byte	W12
	.byte		N11   
	.byte	W24
	.byte	PEND
@ 047   ----------------------------------------
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		        Ds2 
	.byte	W24
@ 048   ----------------------------------------
	.byte	PATT
	 .word	galactic_admin_battle_9_046
@ 049   ----------------------------------------
	.byte		N23   , Gs2 , v112
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		        Ds2 
	.byte	W23
	.byte GOTO
	 .word newbark_1_loop
	.byte W06
@ 050       ----------------------------------------
                  .byte       FINE

@******************************************************@
	.align	2

galactic_admin_battle:
	.byte	9	@ NumTrks
	.byte	0	@ NumBlks
	.byte	galactic_admin_battle_pri	@ Priority
	.byte	galactic_admin_battle_rev	@ Reverb.

	.word	galactic_admin_battle_grp

	.word	galactic_admin_battle_1
	.word	galactic_admin_battle_2
	.word	galactic_admin_battle_3
	.word	galactic_admin_battle_4
	.word	galactic_admin_battle_5
	.word	galactic_admin_battle_6
	.word	galactic_admin_battle_7
	.word	galactic_admin_battle_8
	.word	galactic_admin_battle_9

	.end
