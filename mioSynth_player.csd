/*
 ******* mioSynth *******
 by Yeshi Silvano Namkhai
 ************************
 rep: https://github.com/YeshiNamkhai/mioSynth
 web: https://my-hexagon.com
*/
<CsoundSynthesizer>
<CsOptions>
-odac -n -d -m0
</CsOptions>
<CsInstruments>
; global variables. 
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
    if p38==0 then 
    ;play a note reading an ftable containing synth params    	
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
    if p7==0 then 
        kPan tab 19, p6
    else
        kPan = p7 ;override pan
    endif
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
else 
    ;play a note reading all synth params
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
endif

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
    
    if p4>20 then
        iNote = p4 ;play frequency
    else
        iNote = cpspch(p4) ; convert from pitch classes 
    endif
    
    kAen madsr iAat, iAde, iAsu, iAre, 0, p3 ;ADSR-->VCA
    kFen madsr iFat, iFde, iFsu, iFre, 0, p3 ;ADSR-->VCF
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
   
    if kNse==1 && kMx3>0 then      ;white noise
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
endin

instr 2 ;arpeggiator
    if p8==0 then
        p8=1
    endif
    ilen = ftlen(p7)   ;table size
    idur = p3/p8       ;partial duration
    inxt = 0           ;next duration
    indx = p9          ;table index
    until p8==0 do     ;how many notes to play
        idec tab_i indx, p7
        if idec<0 && !p4>20 then
            schedule 1, inxt, idur, p4+(idec-0.88), p5, p6, p10 
        else
            schedule 1, inxt, idur, p4+idec, p5, p6, p10 
        endif
        inxt += idur   ;next start 
        p8 -= 1        ;dec notes to play
        if indx+1==ilen then
            indx = p9  ;reset index
        else
            indx += 1  ;inc index
        endif
    od
endin

instr 3 ;chords player
    ilen = ftlen(p7)   ;table size
    indx = p9          ;table index
    until p8==0 do     ;how many notes to play
        idec tab_i indx, p7
        if idec<0 then
            schedule 1, 0, p3, p4+(idec-0.88), p5, p6 
        else
            schedule 1, 0, p3, p4+idec, p5, p6 
        endif
        p8 -= 1        ;dec notes to play
        if indx+1==ilen then
            indx = p9  ;reset index
        else
            indx += 1  ;inc index
        endif
    od
endin

</CsInstruments>
<CsScore>
;maj7   (1 3 5 7)
f11 0 25 -2 -3 -2.04 -2.07 -2.11 -2 -1.04 -1.07 -1.11 -1 -0.04 -0.07 -0.01 0 0.04 0.07 0.11 1 1.04 1.07 1.11 2 2.04 2.07 2.11 3
;min7   (1 3b 5 7b)
f12 0 25 -2 -3 -2.03 -2.07 -2.10 -2 -1.03 -1.07 -1.10 -1 -0.03 -0.07 -0.01 0 0.03 0.07 0.10 1 1.03 1.07 1.10 2 2.03 2.07 2.10 3
;dom7   (1 3 5 7b)
f13 0 25 -2 -3 -2.04 -2.07 -2.10 -2 -1.04 -1.07 -1.10 -1 -0.04 -0.07 -0.01 0 0.04 0.07 0.10 1 1.04 1.07 1.10 2 2.04 2.07 2.10 3
;min75b (1 3b 5b 7b)
f14 0 25 -2 -3 -2.03 -2.06 -2.10 -2 -1.03 -1.06 -1.10 -1 -0.03 -0.06 -0.01 0 0.03 0.06 0.10 1 1.03 1.06 1.10 2 2.03 2.06 2.10 3
;dim7   (1 3b 5b 7bb)
f15 0 25 -2 -3 -2.03 -2.06 -2.09 -2 -1.03 -1.06 -1.09 -1 -0.03 -0.06 -0.01 0 0.03 0.06 0.09 1 1.03 1.06 1.09 2 2.03 2.06 2.09 3
;maj6   (1 3 5 6)
f16 0 25 -2 -3 -2.04 -2.07 -2.09 -2 -1.04 -1.07 -1.09 -1 -0.04 -0.07 -0.01 0 0.04 0.07 0.09 1 1.04 1.07 1.09 2 2.04 2.07 2.09 3
;min6   (1 3b 5 6)
f17 0 25 -2 -3 -2.03 -2.07 -2.09 -2 -1.03 -1.07 -1.09 -1 -0.03 -0.07 -0.01 0 0.03 0.07 0.09 1 1.03 1.07 1.09 2 2.03 2.07 2.09 3
;maj9   (1 3 5 7 9)
f18 0 31 -2 -3 -2.02 -2.04 -2.07 -2.11 -2 -1.02 -1.04 -1.07 -1.11 -1 -0.02 -0.04 -0.07 -0.01 0 0.02 0.04 0.07 0.11 1 1.02 1.04 1.07 1.11 2 2.02 2.04 2.07 2.11 3
;9      (1 3 5 7b 9)
f19 0 31 -2 -3 -2.02 -2.04 -2.07 -2.10 -2 -1.02 -1.04 -1.07 -1.10 -1 -0.02 -0.04 -0.07 -0.02 0 0.02 0.04 0.07 0.10 1 1.02 1.04 1.07 1.10 2 2.02 2.04 2.07 2.10 3
;min9   (1 3b 5 7b 9)
f20 0 31 -2 -3 -2.02 -2.03 -2.07 -2.10 -2 -1.02 -1.03 -1.07 -1.10 -1 -0.02 -0.03 -0.07 -0.02 0 0.02 0.03 0.07 0.10 1 1.02 1.03 1.07 1.10 2 2.02 2.03 2.07 2.10 3
;sus    (1 4 5)
f21 0 19 -2 -3 -2.05 -2.07 -2 -1.05 -1.07 -1 -0.05 -0.07 0 0.05 0.07 1 1.05 1.07 2 2.05 2.07 3
;7sus   (1 4 5 7b)
f22 0 25 -2 -3 -2.05 -2.07 -2.10 -2 -1.05 -1.07 -1.10 -1 -0.05 -0.07 -0.02 0 0.05 0.07 0.10 1 1.05 1.07 1.10 2 2.05 2.07 2.10 3
;9sus   (1 4 5 7b 9)
f23 0 31 -2 -3 -2.02 -2.05 -2.07 -2.10 -2 -1.02 -1.05 -1.07 -1.10 -1 -0.02 -0.05 -0.07 -0.02 0 0.02 0.05 0.07 0.10 1 1.02 1.05 1.07 1.10 2 2.02 2.05 2.07 2.10 3

;brass
f1 0 33 -2 0.134 0.673 0.755 0.388 0.500 0.500 0.700 0.400 0 0 -4 4 9031.687 0.300 0.184 0.714 0.429 0.429 0.700 0.500 1 0.000 0.000 0.312 1 1 1 0 1 1 0 1.850 6.220
;el. bass
f2 0 33 -2 0.004 0.143 0.694 0.163 0.750 0.500 0.700 0.400 0 0 0 0 1631.346 0.168 0.001 0.245 0.367 0.122 0.700 0.500 1 0.000 0.000 0.500 0 2 3 0 1 0 0 1.150 3.480
;el. guitar
f3 0 33 -2 0.002 1.000 0.122 0.776 0.850 0.150 0.800 0.500 0 0 0 0 3528.000 0.740 0.001 1.000 0.143 1.000 0.700 0.500 1 0.000 0.000 0.604 1 2 3 0 1 1 0 2.000 2.000
;timpani
f4 0 33 -2 0.002 0.735 0.000 0.327 0.500 0.500 1.000 0.500 -36 -19 -7 7 339.041 0.356 0.001 0.633 0.000 0.306 1.000 0.500 1 0.800 0.000 0.436 1 3 3 0 1 1 0 2.000 2.000
;gate kick
f5 0 33 -2 0.002 0.429 0.694 0.531 0.250 0.500 1.000 0.500 -12 -24 -1 1 101.959 0.628 0.001 0.265 0.000 0.633 1.000 0.500 2 0.800 0.000 0.388 1 2 3 1 0 0 0 2.000 2.000
;snare
f6 0 33 -2 0.001 0.510 0.000 0.224 0.500 0.050 0.300 0.200 -24 -12 -10 10 4912.387 0.260 0.021 0.469 0.000 0.755 0.700 0.500 1 0.800 0.000 0.200 1 3 2 0 1 1 0 8.240 8.400


;p1   p2  p3  p4    p5  p6  p7  p8  p9  10 (optional)
;intr str dur pitch amp wav arp rep pos pan

;intro
i3    0   2   8.00  .1   3   11  4   12      ;el. guitar 
i3    +   .   7.09  .2   .   12  .   .       ;chords
i3    +   .   8.02  .3   .   .   .   . 
i3    +   .   8.07  .3   .   13  .   . 

i2    0   2   8.00  .03  2   11  2   2  .8        ;bass
i2    +   .   7.09  .07  .   12  2   .  .6
i2    +   .   8.02  .1   .   .   4   .  .4
i2    +   .   8.07  .13  .   13  5   .  .2 

;theme A
{2
i3    +   2   8.00  .4  3   11  4   12  ;el. guitar
i3    +   .   7.09  .   .   12  .   .   ;chords
i3    +   .   8.02  .   .   .   .   . 
i3    +   .   8.07  .   .   13  .   . 

i2    +   2   8.00  .2  2   11  2   2  .3 ;bass
i2    +   .   7.09  .2  .   12  .   .  . 
i2    +   .   8.02  .2  .   .   .   .  .
i2    +   .   8.07  .2  .   13  .   .  .
}

i2    8   2   6.00  .5  3   11  8   12  ;el. guitar
i2    +   .   5.09  .   .   12  .   .   ;arpeggios
i2    +   .   6.02  .   .   .   .   . 
i2    +   .   6.07  .   .   13  .   . 

i2    +   2   6.00  .5  3   11  12  12 
i2    +   .   5.09  .   .   12  .   . 
i2    +   .   6.02  .   .   .   .   . 
i2    +   .   6.07  .   .   13  .   . 

;theme B
{2
i3    +   1.2 5.09  .5  3   12  4   12  .2
i3    +   .8  5.09  .   .   .   .   12  .
i3    +   1.2 6.04  .   .   .   .   .   .
i3    +   .8  6.04  .   .   .   .   .   .
i3    +   1.2 5.09  .   .   .   .   .   .
i3    +   .8  5.09  .   .   .   .   .   .
i3    +   1.2 6.05  .   .   11  .   .   .
i3    +   .8  6.05  .   .   .   .   .   .

i2    +   1.2 5.09  .5  3   12  12  12  .8
i2    +   .8  5.09  .   .   .   6   .   .
i2    +   1.2 6.04  .   .   .   12  .   .
i2    +   .8  6.04  .   .   .   6   .   .
i2    +   1.2 5.09  .   .   .   12  .   .
i2    +   .8  5.09  .   .   .   6   .   .
i2    +   1.2 6.05  .   .   11  12  .   .
i2    +   .8  6.05  .   .   .   6   .   .
}

;end
i3    +   2   8.02  .5   3   12  4   12  .1
i3    +   .   8.07  .    .   13  .   .   .3
i3    +   .   8.00  .    .   11  .   .   .5 ;el. guitar 
i3    +   .   7.09  .    .   12  .   .   .6 ;chords

i2    +   2   6.02  .5  3   12   12  12  .9
i2    +   .   6.07  .   .   13   8   .   .7
i2    +   .   6.00  .   .   11   6   .   .5 ;el. guitar
i2    +   .   5.09  .   .   12   4   .   .4 ;arpeggios


i1 9 2  4.00  .4  6  .6  ;snare drum
{7 CNT
i1 + 2  .     .   .  .
}

i1 8 2  4.00  .6  5  .4  ;gate kick    
{19 CNT 
i1 + 2  .     .   .  .
}
e
</CsScore>
</CsoundSynthesizer>
