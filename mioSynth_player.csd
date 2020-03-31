<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
;use this for table    	
    iAat tab_i 0, p6
    iAde tab_i 1, p6
    iAsu tab_i 2, p6
    iAre tab_i 3, p6
    kPw1 tab 4, p6
    kPw2 tab 5, p6 
    kMx1 tab 6, p6
    kMx2 tab 7, p6 
    kOc1 tab 8, p6
    kOc2 tab 9, p6
    kFn1 tab 10, p6
    kFn2 tab 11, p6
    kCut tab 12, p6
    kRes tab 13, p6
    iFat tab_i 14, p6
    iFde tab_i 15, p6
    iFsu tab_i 16, p6
    iFre tab_i 17, p6
    kVol tab 18, p6
    kPan tab 19, p6
    kNse tab 20, p6
    kMx3 tab 21, p6
    kSiz tab 22, p6
    kMx4 tab 23, p6
    iRev tab_i 24, p6
    iWf1 tab_i 25, p6
    iWf2 tab_i 26, p6
    iL1t tab_i 27, p6
    iL2t tab_i 28, p6
    iL1v tab_i 29, p6
    iL2v tab_i 30, p6
    kTrm tab 31, p6
    kVbr tab 32, p6
    
;use this for notes
/*
    iAat = p6
    iAde = p7
    iAsu = p8
    iAre = p9
    kPw1 = p10
    kPw2 = p11 
    kMx1 = p12
    kMx2 = p13 
    kOc1 = p14
    kOc2 = p15
    kFn1 = p16
    kFn2 = p17
    kCut = p18
    kRes = p19
    iFat = p20
    iFde = p21
    iFsu = p22
    iFre = p23
    kVol = p24
    kPan = p25
    kNse = p26
    kMx3 = p27
    kSiz = p28
    kMx4 = p29
    iRev = p30
    iWf1 = p31
    iWf2 = p32
    iL1t = p33
    iL2t = p34
    iL1v = p35
    iL2v = p36
    kTrm = p37
    kVbr = p38
*/

    if iAat==0 then
        iAat+=0.001 
    endif
    if iFat==0 then
        iFat+=0.001 
    endif

    if iWf1==1 then ;saw
        iWf1 = 0
    elseif iWf1==2 then ;pulse
        ;do nothing
    elseif iWf1==3 then ;triangle
        iWf1 = 12
    endif

    if iWf2==1 then ;saw
        iWf2 = 0
    elseif iWf2==2 then ;pulse
        ;do nothing
    elseif iWf2==3 then ;triangle
        iWf2 = 12
    endif

    iNote = cpspch(p4)
    
    kAen madsr iAat, iAde, iAsu, iAre ;ADSR-->VCA
    kFen madsr iFat, iFde, iFsu, iFre ;ADSR-->VCF
    kLft lfo p5, kTrm
    kLfv lfo p5, kVbr

    if iL1t==1 && iL1v==1 then
        aVco1 vco2 p5*kLft, (iNote+kLfv)+(iNote+kLfv)*semitone(kOc1)+(iNote+kLfv)*semitone(kFn1)/100, iWf1, kPw1 
    elseif iL1t==1 && iL1v==0 then
        aVco1 vco2 p5*kLft, iNote+iNote*semitone(kOc1)+p4*semitone(kFn1)/100, iWf1, kPw1 
    elseif iL1t==0 && iL1v==1 then
        aVco1 vco2 p5, (iNote+kLfv)+(iNote+kLfv)*semitone(kOc1)+(iNote+kLfv)*semitone(kFn1)/100, iWf1, kPw1    
    else
        aVco1 vco2 p5, iNote+iNote*semitone(kOc1)+iNote*semitone(kFn1)/100, iWf1, kPw1
    endif
    if iL2t==1 && iL2v==1 then
        aVco2 vco2 p5*kLft, (iNote+kLfv)+(iNote+kLfv)*semitone(kOc2)+(iNote+kLfv)*semitone(kFn2)/100, iWf2, kPw2  
    elseif iL2t==1 && iL2v==0 then
        aVco2 vco2 p5*kLft, iNote+iNote*semitone(kOc2)+iNote*semitone(kFn2)/100, iWf2, kPw2  
    elseif iL2t==0 && iL2v==1 then
        aVco2 vco2 p5, (iNote+kLfv)+(iNote+kLfv)*semitone(kOc2)+(iNote+kLfv)*semitone(kFn2)/100, iWf2, kPw2  
    else
        aVco2 vco2 p5, iNote+iNote*semitone(kOc2)+iNote*semitone(kFn2)/100, iWf2, kPw2  
    endif

    aOscs =aVco1*kMx1+aVco2*kMx2

   
    if kNse==1 && kMx3>0 then     ; white noise
        aRand rand p5
        aOscs +=aRand*kMx3    
    elseif kNse==2  && kMx3>0 then ;pink noise
        aPink pinker
        aOscs +=aPink*kMx3
    endif
        
    aLp moogladder aOscs, kCut*kFen, kRes*kFen ;VCF

    if iRev==1 then
        aL, aR  freeverb aLp, aLp, kSiz, 0, sr, 0
        amixL   ntrpol aLp, aL, kMx4	;Dry/Wet L
	    amixR   ntrpol aLp, aR, kMx4	;Dry/Wet R
        outs amixL*kAen*kVol*(1-kPan), amixR*kAen*kVol*kPan
        
    else
        outs aLp*kAen*kVol*(1-kPan), aLp*kAen*kVol*kPan
    endif
    
    display aLp*kAen, 0.25, 1
endin

</CsInstruments>
<CsScore>
;brass ensamble
f01 0 33 -2 0.225 0.388 0.694 0.347 0.500 0.200 0.500 0.300 0 19 -1 1 3388.290 0.6040.246 0.510 0.694 0.327 1.000 0.500 2 0.140 0.000 0.452 1.000 1 2 0 1 1 0 2.000 2.000
i1 0 4   6.00  .8 1

i1 0 .5  8.00  .7 1
i1 + .   8.06  . 1
i1 + .   8.08  . 1
i1 + .   8.00  . 1
i1 + .   8.00  . 1
i1 + .   8.06  . 1
i1 + .   8.08  . 1
i1 + .   8.00  . 1

i1 0 .25 7.00  .6 1
i1 + .   7.06  . 1
i1 + .   7.08  . 1
i1 + .   7.00  . 1
i1 + .   7.00  . 1
i1 + .   7.06  . 1
i1 + .   7.08  . 1
i1 + .   7.00  . 1
i1 + .   7.00  . 1
i1 + .   7.06  . 1
i1 + .   7.08  . 1
i1 + .   7.00  . 1
i1 + .   7.00  . 1
i1 + .   7.06  . 1
i1 + .   7.08  . 1
i1 + .   7.00  . 1
e
</CsScore>
</CsoundSynthesizer>
