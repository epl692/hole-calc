section .data
    feet_in3: dq 1728.00
    pi: dq 3.141592
    half_it: dq 0.5

section .text
global hole_calc

hole_calc:
                                    ; xmm0 Diameter xmm1 Volume
                                    ; This program converts the volume of a cylinder to a depth to dig a hole. 
                                    ;
    mulsd   xmm1, [rel half_it]     ; Convert Diameter // radius = diameter / 2.0;
    mulsd   xmm0, [rel feet_in3]    ; Multiply diameter by 1728.00, result in xmm1 // volumeInCubicInches = volume * 1728.00;
    mulsd   xmm1, xmm1              ; Square Diameter, load into xmm0
    mulsd   xmm1, [rel pi]          ; Diameter Squared Times Pi, loaded into xmm0
    divsd   xmm0, xmm1              ; Product the final result.
    ret
    
