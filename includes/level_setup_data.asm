; level set-up subroutine for chiller 2

; level 1 setup subroutine - the forest ---------------------------------------

level1_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl1screen_loop					; begin loop
		lda l1_screen_ram,x			; load screen ram for level 1
		sta l_screen_ram,x			; store to level screen ram table
		lda l1_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l1_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l1_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl1screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!
																		
; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl1colour_loop
		lda l1_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l1_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l1_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l1_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl1colour_loop
									
									
; copy the level 1 get ready message into the general get
; ready table for printing

		ldx #$00
copygr1loop
		lda gr_lvl1_des1,x
		sta get_ready_des1,x
		lda gr_lvl1_des2,x
		sta get_ready_des2,x
		lda gr_lvl1_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr1loop
		
; copy the level 1 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l1_sprite_set
		lda l1_sprite_x,x
		sta sprite_x_buf,x
		lda l1_sprite_y,x
		sta sprite_y_buf,x
		lda l1_sprite_col,x
		sta sprite_col_buf,x
		lda l1_sprite_def,x
		sta sprite_def_buf,x
		lda l1_sprite_anims,x
		sta sprite_anims_buf,x
		lda l1_sprite_anime,x
		sta sprite_anime_buf,x
		lda l1_sprite_dir,x
		sta sprite_dir_buf,x
		lda l1_sprite_spd,x
		sta sprite_spd_buf,x
		lda l1_sprite_min,x		
		sta sprite_min_buf,x
		lda l1_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l1_sprite_set
		
; copy the level 1 cross positions into the cross byte store

		ldx #$00
l1_cross_copy
		lda l1_cross_x,x
		sta cross_x,x
		lda l1_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l1_cross_copy
		
; speed for level 1 background animation (if any)

		lda #$00
		sta bkgd_lvl_tmr		
						
		rts
				
; level 2 setup subroutine - the church ---------------------------------------

level2_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl2screen_loop					; begin loop
		lda l2_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l2_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l2_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l2_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl2screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl2colour_loop
		lda l2_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l2_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l2_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l2_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl2colour_loop									
																		
; copy the level 2 get ready message into the general get
; ready table for printing

		ldx #$00
copygr2loop
		lda gr_lvl2_des1,x
		sta get_ready_des1,x
		lda gr_lvl2_des2,x
		sta get_ready_des2,x
		lda gr_lvl2_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr2loop

; copy the level 2 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l2_sprite_set
		lda l2_sprite_x,x
		sta sprite_x_buf,x
		lda l2_sprite_y,x
		sta sprite_y_buf,x
		lda l2_sprite_col,x
		sta sprite_col_buf,x
		lda l2_sprite_def,x
		sta sprite_def_buf,x
		lda l2_sprite_anims,x
		sta sprite_anims_buf,x
		lda l2_sprite_anime,x
		sta sprite_anime_buf,x
		lda l2_sprite_dir,x
		sta sprite_dir_buf,x
		lda l2_sprite_spd,x
		sta sprite_spd_buf,x
		lda l2_sprite_min,x		
		sta sprite_min_buf,x
		lda l2_sprite_max,x		
		sta sprite_max_buf,x				
		inx
		cpx #$08
		bne l2_sprite_set
		
; copy the level 2 cross positions into the cross byte store

		ldx #$00
l2_cross_copy
		lda l2_cross_x,x
		sta cross_x,x
		lda l2_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l2_cross_copy
		
; speed for level 2 background animation (if any)

		lda #$04
		sta bkgd_lvl_tmr					
				
		rts		
	 	 	
; level 3 setup subroutine - the apartments ---------------------------------------

level3_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl3screen_loop					; begin loop
		lda l3_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l3_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l3_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l3_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl3screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!
									
; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl3colour_loop
		lda l3_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l3_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l3_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l3_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl3colour_loop									
																		
; copy the level 3 get ready message into the general get
; ready table for printing

		ldx #$00
copygr3loop
		lda gr_lvl3_des1,x
		sta get_ready_des1,x
		lda gr_lvl3_des2,x
		sta get_ready_des2,x
		lda gr_lvl3_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr3loop

; copy the level 3 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l3_sprite_set
		lda l3_sprite_x,x
		sta sprite_x_buf,x
		lda l3_sprite_y,x
		sta sprite_y_buf,x
		lda l3_sprite_col,x
		sta sprite_col_buf,x
		lda l3_sprite_def,x
		sta sprite_def_buf,x
		lda l3_sprite_anims,x
		sta sprite_anims_buf,x
		lda l3_sprite_anime,x
		sta sprite_anime_buf,x
		lda l3_sprite_dir,x
		sta sprite_dir_buf,x
		lda l3_sprite_spd,x
		sta sprite_spd_buf,x
		lda l3_sprite_min,x		
		sta sprite_min_buf,x
		lda l3_sprite_max,x		
		sta sprite_max_buf,x				
		inx
		cpx #$08
		bne l3_sprite_set
		
; copy the level 3 cross positions into the cross byte store

		ldx #$00
l3_cross_copy
		lda l3_cross_x,x
		sta cross_x,x
		lda l3_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l3_cross_copy
		
; speed for level 3 background animation (if any)

		lda #$03
		sta bkgd_lvl_tmr					
				
		rts		

; level 4 setup subroutine - the haunted house ---------------------------------------

level4_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl4screen_loop					; begin loop
		lda l4_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l4_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l4_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l4_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl4screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl4colour_loop
		lda l4_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l4_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l4_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l4_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl4colour_loop										
																		
; copy the level 4 get ready message into the general get
; ready table for printing

		ldx #$00
copygr4loop
		lda gr_lvl4_des1,x
		sta get_ready_des1,x
		lda gr_lvl4_des2,x
		sta get_ready_des2,x
		lda gr_lvl4_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr4loop
		
; copy the level 4 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l4_sprite_set
		lda l4_sprite_x,x
		sta sprite_x_buf,x
		lda l4_sprite_y,x
		sta sprite_y_buf,x
		lda l4_sprite_col,x
		sta sprite_col_buf,x
		lda l4_sprite_def,x
		sta sprite_def_buf,x
		lda l4_sprite_anims,x
		sta sprite_anims_buf,x
		lda l4_sprite_anime,x
		sta sprite_anime_buf,x
		lda l4_sprite_dir,x
		sta sprite_dir_buf,x
		lda l4_sprite_spd,x
		sta sprite_spd_buf,x
		lda l4_sprite_min,x		
		sta sprite_min_buf,x
		lda l4_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l4_sprite_set
		
; copy the level 4 cross positions into the cross byte store

		ldx #$00
l4_cross_copy
		lda l4_cross_x,x
		sta cross_x,x
		lda l4_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l4_cross_copy
		
; speed for level 4 background animation (if any)

		lda #$04
		sta bkgd_lvl_tmr		
						
		rts			 	 			

; level 5 setup subroutine - the cemetary ---------------------------------------

level5_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl5screen_loop					; begin loop
		lda l5_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l5_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l5_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l5_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl5screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl5colour_loop
		lda l5_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l5_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l5_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l5_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl5colour_loop										
																		
; copy the level 5 get ready message into the general get
; ready table for printing

		ldx #$00
copygr5loop
		lda gr_lvl5_des1,x
		sta get_ready_des1,x
		lda gr_lvl5_des2,x
		sta get_ready_des2,x
		lda gr_lvl5_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr5loop
		
; copy the level 5 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l5_sprite_set
		lda l5_sprite_x,x
		sta sprite_x_buf,x
		lda l5_sprite_y,x
		sta sprite_y_buf,x
		lda l5_sprite_col,x
		sta sprite_col_buf,x
		lda l5_sprite_def,x
		sta sprite_def_buf,x
		lda l5_sprite_anims,x
		sta sprite_anims_buf,x
		lda l5_sprite_anime,x
		sta sprite_anime_buf,x
		lda l5_sprite_dir,x
		sta sprite_dir_buf,x
		lda l5_sprite_spd,x
		sta sprite_spd_buf,x
		lda l5_sprite_min,x		
		sta sprite_min_buf,x
		lda l5_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l5_sprite_set
		
; copy the level 5 cross positions into the cross byte store

		ldx #$00
l5_cross_copy
		lda l5_cross_x,x
		sta cross_x,x
		lda l5_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l5_cross_copy
		
; speed for level 5 background animation (if any)

		lda #$03
		sta bkgd_lvl_tmr			
						
		rts
	
; level 6 setup subroutine - the cinema ---------------------------------------

level6_setup_subrout

; copy the level 6 layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl6screen_loop					; begin loop
		lda l6_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l6_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l6_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l6_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl6screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl6colour_loop
		lda l6_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l6_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l6_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l6_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl6colour_loop										
																		
; copy the level 6 get ready message into the general get
; ready table for printing

		ldx #$00
copygr6loop
		lda gr_lvl6_des1,x
		sta get_ready_des1,x
		lda gr_lvl6_des2,x
		sta get_ready_des2,x
		lda gr_lvl6_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr6loop
		
; copy the level 6 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l6_sprite_set
		lda l6_sprite_x,x
		sta sprite_x_buf,x
		lda l6_sprite_y,x
		sta sprite_y_buf,x
		lda l6_sprite_col,x
		sta sprite_col_buf,x
		lda l6_sprite_def,x
		sta sprite_def_buf,x
		lda l6_sprite_anims,x
		sta sprite_anims_buf,x
		lda l6_sprite_anime,x
		sta sprite_anime_buf,x
		lda l6_sprite_dir,x
		sta sprite_dir_buf,x
		lda l6_sprite_spd,x
		sta sprite_spd_buf,x
		lda l6_sprite_min,x		
		sta sprite_min_buf,x
		lda l6_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l6_sprite_set
		
; copy the level 6 cross positions into the cross byte store

		ldx #$00
l6_cross_copy
		lda l6_cross_x,x
		sta cross_x,x
		lda l6_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l6_cross_copy
		
; speed for level 6 background animation (if any)

		lda #$02
		sta bkgd_lvl_tmr		
						
		rts	

; level 7 setup subroutine - the park ---------------------------------------

level7_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl7screen_loop					; begin loop
		lda l7_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l7_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l7_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l7_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl7screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!
				
; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl7colour_loop
		lda l7_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l7_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l7_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l7_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl7colour_loop										
														
; copy the level 7 get ready message into the general get
; ready table for printing

		ldx #$00
copygr7loop
		lda gr_lvl7_des1,x
		sta get_ready_des1,x
		lda gr_lvl7_des2,x
		sta get_ready_des2,x
		lda gr_lvl7_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr7loop

; copy the level 7 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l7_sprite_set
		lda l7_sprite_x,x
		sta sprite_x_buf,x
		lda l7_sprite_y,x
		sta sprite_y_buf,x
		lda l7_sprite_col,x
		sta sprite_col_buf,x
		lda l7_sprite_def,x
		sta sprite_def_buf,x
		lda l7_sprite_anims,x
		sta sprite_anims_buf,x
		lda l7_sprite_anime,x
		sta sprite_anime_buf,x
		lda l7_sprite_dir,x
		sta sprite_dir_buf,x
		lda l7_sprite_spd,x
		sta sprite_spd_buf,x
		lda l7_sprite_min,x		
		sta sprite_min_buf,x
		lda l7_sprite_max,x		
		sta sprite_max_buf,x				
		inx
		cpx #$08
		bne l7_sprite_set
		
; copy the level 7 cross positions into the cross byte store

		ldx #$00
l7_cross_copy
		lda l7_cross_x,x
		sta cross_x,x
		lda l7_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l7_cross_copy
		
; speed for level 7 background animation (if any)

		lda #$03
		sta bkgd_lvl_tmr					
				
		rts
		
; level 8 setup subroutine - the sewers ---------------------------------------

level8_setup_subrout

; copy the level 8 layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl8screen_loop					; begin loop
		lda l8_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l8_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l8_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l8_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl8screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl8colour_loop
		lda l8_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l8_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l8_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l8_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl8colour_loop										
																		
; copy the level 8 get ready message into the general get
; ready table for printing

		ldx #$00
copygr8loop
		lda gr_lvl8_des1,x
		sta get_ready_des1,x
		lda gr_lvl8_des2,x
		sta get_ready_des2,x
		lda gr_lvl8_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr8loop
		
; copy the level 8 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l8_sprite_set
		lda l8_sprite_x,x
		sta sprite_x_buf,x
		lda l8_sprite_y,x
		sta sprite_y_buf,x
		lda l8_sprite_col,x
		sta sprite_col_buf,x
		lda l8_sprite_def,x
		sta sprite_def_buf,x
		lda l8_sprite_anims,x
		sta sprite_anims_buf,x
		lda l8_sprite_anime,x
		sta sprite_anime_buf,x
		lda l8_sprite_dir,x
		sta sprite_dir_buf,x
		lda l8_sprite_spd,x
		sta sprite_spd_buf,x
		lda l8_sprite_min,x		
		sta sprite_min_buf,x
		lda l8_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l8_sprite_set
		
; copy the level 8 cross positions into the cross byte store

		ldx #$00
l8_cross_copy
		lda l8_cross_x,x
		sta cross_x,x
		lda l8_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l8_cross_copy
		
; speed for level 8 background animation (if any)

		lda #$01
		sta bkgd_lvl_tmr		
						
		rts
		
; level 9 setup subroutine - the log cabin ---------------------------------------

level9_setup_subrout

; copy the level layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl9screen_loop					; begin loop
		lda l9_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l9_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l9_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l9_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl9screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl9colour_loop
		lda l9_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l9_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l9_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l9_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl9colour_loop										
																		
; copy the level 9 get ready message into the general get
; ready table for printing

		ldx #$00
copygr9loop
		lda gr_lvl9_des1,x
		sta get_ready_des1,x
		lda gr_lvl9_des2,x
		sta get_ready_des2,x
		lda gr_lvl9_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr9loop

; copy the level 9 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l9_sprite_set
		lda l9_sprite_x,x
		sta sprite_x_buf,x
		lda l9_sprite_y,x
		sta sprite_y_buf,x
		lda l9_sprite_col,x
		sta sprite_col_buf,x
		lda l9_sprite_def,x
		sta sprite_def_buf,x
		lda l9_sprite_anims,x
		sta sprite_anims_buf,x
		lda l9_sprite_anime,x
		sta sprite_anime_buf,x
		lda l9_sprite_dir,x
		sta sprite_dir_buf,x
		lda l9_sprite_spd,x
		sta sprite_spd_buf,x
		lda l9_sprite_min,x		
		sta sprite_min_buf,x
		lda l9_sprite_max,x		
		sta sprite_max_buf,x				
		inx
		cpx #$08
		bne l9_sprite_set
		
; copy the level 9 cross positions into the cross byte store

		ldx #$00
l9_cross_copy
		lda l9_cross_x,x
		sta cross_x,x
		lda l9_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l9_cross_copy
		
; speed for level 9 background animation (if any)

		lda #$04
		sta bkgd_lvl_tmr		
			
		rts

; level 10 setup subroutine - the sewers ---------------------------------------

level10_setup_subrout

; copy the level 10 layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl10screen_loop					; begin loop
		lda l10_screen_ram,x			; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l10_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l10_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l10_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl10screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl10colour_loop
		lda l10_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l10_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l10_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l10_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl10colour_loop										
																		
; copy the level 10 get ready message into the general get
; ready table for printing

		ldx #$00
copygr10loop
		lda gr_lvl10_des1,x
		sta get_ready_des1,x
		lda gr_lvl10_des2,x
		sta get_ready_des2,x
		lda gr_lvl10_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr10loop
		
; copy the level 10 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l10_sprite_set
		lda l10_sprite_x,x
		sta sprite_x_buf,x
		lda l10_sprite_y,x
		sta sprite_y_buf,x
		lda l10_sprite_col,x
		sta sprite_col_buf,x
		lda l10_sprite_def,x
		sta sprite_def_buf,x
		lda l10_sprite_anims,x
		sta sprite_anims_buf,x
		lda l10_sprite_anime,x
		sta sprite_anime_buf,x
		lda l10_sprite_dir,x
		sta sprite_dir_buf,x
		lda l10_sprite_spd,x
		sta sprite_spd_buf,x
		lda l10_sprite_min,x		
		sta sprite_min_buf,x
		lda l10_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l10_sprite_set
		
; copy the level 10 cross positions into the cross byte store

		ldx #$00
l10_cross_copy
		lda l10_cross_x,x
		sta cross_x,x
		lda l10_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l10_cross_copy
		
; speed for level 10 background animation (if any)

		lda #$01
		sta bkgd_lvl_tmr		
						
		rts
		
; level 11 setup subroutine - the scrapyard-------------------------------------

level11_setup_subrout

; copy the level 11 layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl11screen_loop					; begin loop
		lda l11_screen_ram,x		; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l11_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l11_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l11_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl11screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl11colour_loop
		lda l11_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l11_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l11_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l11_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl11colour_loop										
																		
; copy the level 11 get ready message into the general get
; ready table for printing

		ldx #$00
copygr11loop
		lda gr_lvl11_des1,x
		sta get_ready_des1,x
		lda gr_lvl11_des2,x
		sta get_ready_des2,x
		lda gr_lvl11_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr11loop
		
; copy the level 11 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l11_sprite_set
		lda l11_sprite_x,x
		sta sprite_x_buf,x
		lda l11_sprite_y,x
		sta sprite_y_buf,x
		lda l11_sprite_col,x
		sta sprite_col_buf,x
		lda l11_sprite_def,x
		sta sprite_def_buf,x
		lda l11_sprite_anims,x
		sta sprite_anims_buf,x
		lda l11_sprite_anime,x
		sta sprite_anime_buf,x
		lda l11_sprite_dir,x
		sta sprite_dir_buf,x
		lda l11_sprite_spd,x
		sta sprite_spd_buf,x
		lda l11_sprite_min,x		
		sta sprite_min_buf,x
		lda l11_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l11_sprite_set
		
; copy the level 11 cross positions into the cross byte store

		ldx #$00
l11_cross_copy
		lda l11_cross_x,x
		sta cross_x,x
		lda l11_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l11_cross_copy
		
; speed for level 11 background animation (if any)

		lda #$04
		sta bkgd_lvl_tmr		
						
		rts
		
; level 12 setup subroutine - the cave ---------------------------------------

level12_setup_subrout

; copy the level 12 layout data into the general screen table store
; to be used be the general print routine

		ldx #$00					; zero x register
copyl12screen_loop					; begin loop
		lda l12_screen_ram,x		; load screen ram for this levels
		sta l_screen_ram,x			; store to level screen ram table
		lda l12_screen_ram+230,x
		sta l_screen_ram+230,x		; do this all the way down the screen
		lda l12_screen_ram+460,x
		sta l_screen_ram+460,x
		lda l12_screen_ram+690,x
		sta l_screen_ram+690,x
		inx
		cpx #$e6					; 230 reached?
		bne copyl12screen_loop		; no? then loop back
									; yes?
									; now do the colour ram!

; expand the 'compressed' 2 nybble per byte colour ram table
; into the general colour ram store
									
		ldx #$00
		ldy #$00
copyl12colour_loop
		lda l12_colour_ram,x
		sta l_colour_ram+1,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram,y

		lda l12_colour_ram+115,x
		sta l_colour_ram+231,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+230,y

		lda l12_colour_ram+230,x
		sta l_colour_ram+461,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+460,y

		lda l12_colour_ram+345,x
		sta l_colour_ram+691,y
		lsr
		lsr
		lsr
		lsr
		sta l_colour_ram+690,y

		iny
		iny
		inx
		cpx #$73
		bne copyl12colour_loop										
																		
; copy the level 12 get ready message into the general get
; ready table for printing

		ldx #$00
copygr12loop
		lda gr_lvl12_des1,x
		sta get_ready_des1,x
		lda gr_lvl12_des2,x
		sta get_ready_des2,x
		lda gr_lvl12_des3,x
		sta get_ready_des3,x
		inx
		cpx #$28
		bne copygr12loop
		
; copy the level 12 sprite data into the sprite buffer, the buffer is
; then copied into the gameplay sprite table when the level starts!
		
		ldx #$00
l12_sprite_set
		lda l12_sprite_x,x
		sta sprite_x_buf,x
		lda l12_sprite_y,x
		sta sprite_y_buf,x
		lda l12_sprite_col,x
		sta sprite_col_buf,x
		lda l12_sprite_def,x
		sta sprite_def_buf,x
		lda l12_sprite_anims,x
		sta sprite_anims_buf,x
		lda l12_sprite_anime,x
		sta sprite_anime_buf,x
		lda l12_sprite_dir,x
		sta sprite_dir_buf,x
		lda l12_sprite_spd,x
		sta sprite_spd_buf,x
		lda l12_sprite_min,x		
		sta sprite_min_buf,x
		lda l12_sprite_max,x		
		sta sprite_max_buf,x						
		inx
		cpx #$08
		bne l12_sprite_set
		
; copy the level 12 cross positions into the cross byte store

		ldx #$00
l12_cross_copy
		lda l12_cross_x,x
		sta cross_x,x
		lda l12_cross_y,x
		sta cross_y,x
		inx
 		cpx #$14	
		bne l12_cross_copy
		
; speed for level 12 background animation (if any)

		lda #$01
		sta bkgd_lvl_tmr		
						
		rts

; end of level setup subroutine -----------------------------------------	
																	