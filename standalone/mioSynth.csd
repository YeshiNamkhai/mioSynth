/*
 ******* mioSynth *******
 by Yeshi Silvano Namkhai
 ************************
 rep: https://github.com/YeshiNamkhai/mioSynth
 web: https://my-hexagon.com
*/
<Cabbage>
form caption("mioSynth") size(785, 300), colour("black"), pluginid("def1") ;style("legacy")
keyboard bounds(0, 199, 790, 100) 

;VCO
groupbox bounds(4, 8, 160, 118) text("VCO 1")
groupbox bounds(166, 8, 160, 118) text("VCO 2")
combobox bounds(176, 38, 72, 30) text("saw", "pulse", "triangle") channel("wav2")
combobox bounds(14, 38, 72, 30) text("saw", "pulse", "triangle") channel("wav1") 
rslider bounds(89, 38, 30, 30) range(0.05, 0.95, 0.5, 1, 0.05) channel("pwm1")  trackercolour(0, 118, 255, 255) identchannel("pwm1i") active(0) alpha(0.3) popuptext("duty/rate")
rslider bounds(251, 38, 30, 30) range(0.05, 0.95, 0.5, 1, 0.05) channel("pwm2")  trackercolour(0, 118, 255, 255) identchannel("pwm2i") active(0) alpha(0.3) popuptext("duty/rate")
label bounds(125, 33, 28, 11) text("LFO")
label bounds(287, 33, 28, 11) text("LFO")
button bounds(125, 47, 28, 10) channel("lfo1t") text("off", "on") colour:1(255, 0, 0, 255) identchannel("lfo1i")  
button bounds(287, 47, 28, 10) channel("lfo2t") text("off", "on") colour:1(255, 0, 0, 255) identchannel("lfo2i")  
button bounds(125, 58, 28, 10) channel("lfo1v") text("off", "on") colour:1(255, 0, 0, 255) identchannel("lfo1i")  
button bounds(287, 58, 28, 10) channel("lfo2v") text("off", "on") colour:1(255, 0, 0, 255) identchannel("lfo2i")  
rslider bounds(110, 74, 45, 45) range(0, 1, 0.5, 1, 0.1) channel("mix1")  trackercolour(246, 118, 38, 255) text("Mix")
rslider bounds(272, 74, 45, 45) range(0, 1, 0.5, 1, 0.1) channel("mix2")  trackercolour(246, 118, 38, 255) text("Mix")
rslider bounds(14, 74, 45, 45) range(-36, 36, 0, 1, 1) channel("oct1")  trackercolour(0, 118, 255, 255) text("Oct") 
rslider bounds(62, 74, 45, 45) range(-25, 25, 0, 1, 1)   trackercolour(0, 118, 255, 255) channel("fin1") text("Fine") 
rslider bounds(176, 74, 45, 45) range(-36, 36, 0, 1, 1) channel("oct2")  trackercolour(0, 118, 255, 255) text("Oct") 
rslider bounds(224, 74, 45, 45) range(-25, 25, 0, 1, 1) channel("fin2")  trackercolour(0, 118, 255, 255) text("Fine") 

;Noise
groupbox bounds(4, 127, 123, 67) text("Noise")
combobox bounds(14, 152, 71, 30) text("white", "pink") channel("noise") 
rslider bounds(86, 152, 30, 30) range(0, 1, 0, 1, 0.01) channel("mix3")     trackercolour(246, 118, 38, 255)
label bounds(85, 182, 31, 10) text("Mix")

;LFO
groupbox bounds(128, 127, 82, 67) text("LFO")
rslider bounds(136, 152, 30, 30) range(0.5, 20, 2, 1, 0.01) channel("trem") trackercolour(55, 55, 118, 255)  popuptext("tremolo rate")
rslider bounds(168, 152, 30, 30) range(0.5, 20, 2, 1, 0.01) channel("vibr") trackercolour(55, 55, 118, 255)  popuptext("vibrato rate")
label bounds(128, 182, 81, 10) text("Tremolo Vibrato")

;Reverb
groupbox bounds(211, 127, 116, 69) text("Reverb")
rslider bounds(252, 152, 30, 30) range(0, 1, 0.5, 1, 0.001) channel("room") trackercolour(0, 118, 255, 255) 
rslider bounds(286, 152, 30, 30) range(0, 1, 0.5, 1, 0.001) channel("mix4") trackercolour(246, 118, 38, 255) popuptext("dry/wet")
button bounds(220, 158, 26, 18) channel("rev") text("off", "on") colour:1(255, 0, 0, 255)
label bounds(247, 182, 73, 10) text("Room    Mix")

;VCF
groupbox bounds(327, 8, 133, 186) text("VCF")
rslider bounds(340, 38, 54, 54)  range(0, 22050, 22050, 0.5, 0.001) text("CutOff") channel("cut")
rslider bounds(396, 38, 54, 54)  range(0, 1, 0, 1, 0.001) text("Res") channel("res")
vslider bounds(340, 98, 25, 87) range(0.001, 1, 0.001, 1, 0.001) text("A") channel("attF")
vslider bounds(368, 98, 25, 87) range(0, 1, 0, 1, 0.001) text("D") channel("decF")
vslider bounds(396, 98, 25, 87) range(0, 1, 0.7, 1, 0.001) text("S") channel("susF")
vslider bounds(424, 98, 25, 87) range(0, 1, 0, 1, 0.001) text("R") channel("relF")

;VCA
groupbox bounds(461, 8, 132, 186) text("VCA")
vslider bounds(472, 38, 25, 87)  range(0.002, 1, 0.002, 1, 0.001) text("A") channel("attA") trackercolour(246, 118, 38, 255)
vslider bounds(500, 38, 25, 87) range(0, 1, 0, 1, 0.001) text("D") channel("decA") trackercolour(246, 118, 38, 255)
vslider bounds(528, 38, 25, 87) range(0, 1, 0.7, 1, 0.001) text("S") channel("susA") trackercolour(246, 118, 38, 255)
vslider bounds(556, 38, 25, 87) range(0, 1, 0, 1, 0.001) text("R") channel("relA") trackercolour(246, 118, 38, 255)
rslider bounds(528, 130, 54, 54) range(0, 1, 0.7, 1, 0.001) text("Master") channel("vol") trackercolour(246, 118, 38, 255)
rslider bounds(472, 130, 54, 54) range(0, 1, 0.5, 1, 0.001) text("Pan") channel("pan")  trackercolour(0, 0, 0, 255)

;Patch
groupbox bounds(594, 8, 185, 186) text("Patch")
combobox bounds(603, 158, 102, 25), , populate("*.snaps") channel("patch")
filebutton bounds(712, 158, 56, 25), channel("save"), text("Save", "Save"), mode("snapshot")
signaldisplay bounds(604, 34, 165, 97)   colour(0, 128, 0, 255) colour:0(0, 128, 0, 255) displaytype("waveform")
button bounds(729, 136, 39, 15) text("Show", "Show") colour:1(255, 0, 0, 255) channel("show")
infobutton bounds(603, 136, 39, 15) text("Help") file("mioSynth.html") channel("help")
button bounds(687, 136, 39, 15) text("Midi", "Midi") colour:1(255, 0, 0, 255) channel("midi")
button bounds(645, 136, 39, 15) text("Mono", "Poly") colour:1(255, 0, 0, 255) channel("mono")


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5 --displays
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gkNote init 0

instr 1
    iMod chnget "mono"
    gkNote init p4        
    
    if iMod==0 && gkNote != 0 && gkNote != p4 then
       turnoff
    endif

    iMid chnget "midi"
    if iMid==1 then ;midi
        iCc1 = 16 ;CC rotary
        iCc2 = 17 ;CC slider
        iCc3 = 18 ;CC master
        iFat ctrl7 1, iCc2, 0.001, 1
        chnset iFat, "attF"           
        iFde ctrl7 2, iCc2, 0, 1
        chnset iFde, "decF"
        iFsu ctrl7 3, iCc2, 0, 1
        chnset iFsu, "susF"
        iFre ctrl7 4, iCc2, 0, 1
        chnset iFre, "relF"
        iAat ctrl7 5, iCc2, 0.001, 1
        chnset iAat, "attA"           
        iAde ctrl7 6, iCc2, 0, 1
        chnset iAde, "decA"
        iAsu ctrl7 7, iCc2, 0, 1
        chnset iAsu, "susA"
        iAre ctrl7 8, iCc2, 0, 1
        chnset iAre, "relA"
        kVol ctrl7 2, iCc3, 0, 1
        chnset kVol, "vol"
        kPan ctrl7 1, iCc3, 0, 1
        chnset kPan, "pan"        
        kPw1 ctrl7 1, iCc1, 0.05, 0.95   
        chnset kPw1 ,"pwm1"
        kOc1 ctrl7 2, iCc1, -36, 36
        chnset kOc1 ,"oct1"
        kFn1 ctrl7 3, iCc1, -25, 25
        chnset kFn1 ,"fin1" 
        kMx1 ctrl7 4, iCc1, 0, 1
        chnset kMx1 ,"mix1"
        kPw2 ctrl7 5, iCc1, 0.05, 0.95   
        chnset kPw2 ,"pwm2"
        kOc2 ctrl7 6, iCc1, -36, 36
        chnset kOc2 ,"oct2"
        kFn2 ctrl7 7, iCc1, -25, 25
        chnset kFn2 ,"fin2"
        kMx2 ctrl7 8, iCc1, 0, 1
        chnset kMx2 ,"mix2"
        
    else ;widget
        iAat chnget "attA"    
        iAde chnget "decA"
        iAsu chnget "susA"
        iAre chnget "relA"
        iFat chnget "attF"    
        iFde chnget "decF"
        iFsu chnget "susF"
        iFre chnget "relF"
        kVol chnget "vol"    
        kPan chnget "pan"
        kPw1 chnget "pwm1"
        kPw2 chnget "pwm2"
        kFn1 chnget "fin1"
        kFn2 chnget "fin2"        
        kMx1 chnget "mix1"
        kMx2 chnget "mix2"
        kOc1 chnget "oct1"
        kOc2 chnget "oct2"
    endif
    
    kCut chnget "cut"    
    kRes chnget "res"
    kNse chnget "noise"
    kMx3 chnget "mix3"
    kSiz chnget "size"
    kMx4 chnget "mix4"
    iRev chnget "rev"
    iWf1 chnget "wav1"
    iWf2 chnget "wav2"
    iL1t chnget "lfo1t"
    iL2t chnget "lfo2t"
    iL1v chnget "lfo1v"
    iL2v chnget "lfo2v"
    kTrm chnget "trem"
    kVbr chnget "vibr"
                   
    iDis chnget "show"
    
    if iDis==1 then
        ;use this for table
        Str1 sprintf "f1 0 33 -2 %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %i %i %i %i %.3f %.3f", iAat, iAde, iAsu, iAre, kPw1, kPw2, kMx1, kMx2, kOc1, kOc2, kFn1, kFn2, kCut, kRes
        ;use this for notes
        ;aStr1 sprintf "i1 + . %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %i %i %i %i %.3f %.3f", p4, p5, iAat, iAde, iAsu, iAre, kPw1, kPw2, kMx1, kMx2, kOc1, kOc2, kFn1, kFn2, kCut, kRes
        Str2 sprintf " %.3f %.3f %.3f %.3f %.3f %.3f %i %.3f %.3f %.3f %i %i %i %i %i %i %i %.3f %.3f", iFat, iFde, iFsu, iFre, kVol, kPan, kNse, kMx3, kSiz, kMx4, iRev, iWf1, iWf2, iL1t, iL2t, iL1v, iL2v, kTrm, kVbr
        Str strcat Str1, Str2
        puts Str, 1
    endif
    
    if iWf1==1 then ;saw
        iWf1 = 0
    elseif iWf1==2 then ;pulse
        chnset "alpha(1),active(1)", "pwm1i"
    elseif iWf1==3 then ;triangle
        iWf1 = 12
    endif

    if iWf2==1 then ;saw
        iWf2 = 0
    elseif iWf2==2 then ;pulse
        chnset "alpha(1),active(1)", "pwm2i"
    elseif iWf2==3 then ;triangle
        iWf2 = 12
    endif

    if iWf1!=2 then
        chnset "alpha(0.3),active(0)", "pwm1i"
    endif

    if iWf2!=2 then
        chnset "alpha(0.3),active(0)", "pwm2i"
    endif            
  
    kAen madsr iAat, iAde, iAsu, iAre ;ADSR-->VCA
    kFen madsr iFat, iFde, iFsu, iFre ;ADSR-->VCF
    kLft lfo p5, kTrm
    kLfv lfo p5, kVbr
    
    if iL1t==1 && iL1v==1 then
        aVco1 vco2 p5*kLft, (p4+kLfv)+(p4+kLfv)*semitone(kOc1)+(p4+kLfv)*semitone(kFn1)/100, iWf1, kPw1 
    elseif iL1t==1 && iL1v==0 then
        aVco1 vco2 p5*kLft, p4+p4*semitone(kOc1)+p4*semitone(kFn1)/100, iWf1, kPw1 
    elseif iL1t==0 && iL1v==1 then
        aVco1 vco2 p5, (p4+kLfv)+(p4+kLfv)*semitone(kOc1)+(p4+kLfv)*semitone(kFn1)/100, iWf1, kPw1    
    else
        aVco1 vco2 p5, p4+p4*semitone(kOc1)+p4*semitone(kFn1)/100, iWf1, kPw1
    endif
    if iL2t==1 && iL2v==1 then
        aVco2 vco2 p5*kLft, (p4+kLfv)+(p4+kLfv)*semitone(kOc2)+(p4+kLfv)*semitone(kFn2)/100, iWf2, kPw2  
    elseif iL2t==1 && iL2v==0 then
        aVco2 vco2 p5*kLft, p4+p4*semitone(kOc2)+p4*semitone(kFn2)/100, iWf2, kPw2  
    elseif iL2t==0 && iL2v==1 then
        aVco2 vco2 p5, (p4+kLfv)+(p4+kLfv)*semitone(kOc2)+(p4+kLfv)*semitone(kFn2)/100, iWf2, kPw2  
    else
        aVco2 vco2 p5, p4+p4*semitone(kOc2)+p4*semitone(kFn2)/100, iWf2, kPw2  
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
;causes Csound to run for about 7000 years...
f0 z
</CsScore>
</CsoundSynthesizer>
