# mioSynth
Welcome to **mioSynth** a simple way to build an orchestra for [cSound](https://csound.com/) and play your favorite melody. Run it in [Cabbage](https://cabbageaudio.com/), standalone, or as VST plugin within your own DAW. 

## Programming '70 synths
It took me a great deal of time to learn about analog synth programming, if you are like me and you know little on how to make your own patches check out videos from [New York School of Synthesis](https://www.youtube.com/playlist?list=PLpOuKedj0gNkbG7EjC-5Klv2MzqbV3H6l) and the accompanying [book](https://archive.org/stream/SynthesizerBasicsDeanFriedman600dpi_201608/Synthesizer%20Basics%20Dean%20Friedman%28600dpi%29#page/n0/mode/2up), also the video [Secrets of Analog an Digital Synthesis](https://www.youtube.com/watch?v=tivES-sjHc4) and the accompanying[book](https://archive.org/download/TheSecretsOfAnalogDigitalSynthesisBySteveDeFuria600dpi/The%20Secrets%20of%20Analog%20%26%20Digital%20Synthesis%20by%20Steve%20De%20Furia%28600dpi%29.pdf), and finally [Roland's synthesizer books](http://www.smg.org/stuff/The_Synthesizer.zip). (Here i won't be quoting the main literature on the subject but i highly recommend it if you wish to take the next level)

## Front panel
At a first glance you see immediately the classic analog setting, check the schema for more details.
<div style="align:left"><img src="/img/cabbage_mioSynth.PNG" width="700"></div>

### Run in your DAW
Say you like Ableton Live, here a screenshot with mioSynth playing out of the box. You can export it as VST instrument or as standalone application.
<div style="align:left"><img src="/img/ableton_mioSynth.PNG" width="700"></div>

## Logic schema
Here every sub-panel is connected according to this diagram.
<div style="align:left"><img src="/img/schema_synth.PNG" width="600"></div>

### Midi
Connect your midi keyboard and control in realtime **mioSynth**, to customize check in the source code.

### Mono
Selecting the **mode** you choose between monophonic or polyphonic. If you playback with **mioSynth_player**, it will run always polyphonic.

### Show
Let you copy the string to add in your score and play the selected patch, check the console log for a line starting with **f1 0 33 -2** or **i1 0 1**. Open **mioSynth_player** and paste the code in the score section, add notes as usual. Remember to use **p6** to specify the ftable (actually it's your patch) you just added.
<div style="align:left"><img src="/img/cabbage_mioSynth_show.PNG" width="700"></div>

You may have as many patch as you like, just give the proper ftable number. That would be:
<blockquote>
  <code>&lt;CsScore&gt;</code><br>
  <code>;brass ensamble</code><br>
  <code>f01 0 33 -2 0.225 0.388 0.694 0.347 0.500 0.200 0.500 0.300 0 19 -1 1 3388.290 0.6040.246 0.510 0.694 0.327 1.000 0.500 2 0.140 0.000 0.452 1.000 1 2 0 1 1 0 2.000 2.000</code></p>
  <code>;p1 p2 &nbsp;p3 p4 &nbsp;&nbsp;&nbsp;p5 p6</code><br>
  <code>i1 &nbsp;0 &nbsp;&nbsp;1 &nbsp;8.00 &nbsp;.9 1</code><br>
  <code>i1 &nbsp;+ &nbsp;&nbsp;. &nbsp;8.08 &nbsp;.9 1</code><br>
  <code>e</code><br>
  <code>&lt;/CsScore&gt;</code>
</blockquote>

### Patches
To manage your patches edit the file <strong>mioSynth.snaps</strong>, you can rename or delete patches easily.

### Internals
This synth operates setting 33 parameters from the GUI, here you find every parameter explained. Generally speaking when you create a score in cSound at least you will use p1 (instrument), p2 (start time), p3 (duration), p4 (frequency or note), p5 (amplitude).
|variable name|p-var|function|module|range|
|-------------|-----|--------|------|-----|
|iAat|p6|attack|VCA|0.001, 1|
|iAde|p7|decay|VCA|0, 1|
|iAsu|p8|sustain|VCA|0, 1|
|iAre|p9|release|VCA|0, 1|
|kPw1|p10|duty cycle|OSC1|0.05, 0.95|
|kPw2|p11|duty cycle|OSC2|0.05, 0.95|
|kMx1|p12|volume|OSC1|0, 1|
|kMx2|p13|volume|OSC2|0, 1|
|kOc1|p14|octave|OSC1|-36, 36 semitones|
|kOc2|p15|octave|OSC2|-36, 36 semitones|
|kFn1|p16|fine tuning|OSC1|-25, 25 cents|
|kFn2|p17|fine tuning|OSC2|-25, 25 cents|
|kCut|p18|cut off|VCF|0, 22050|
|kRes|p19|resonance|VCF|0, 1|
|iFat|p20|attack|VCF|0.001, 1|
|iFde|p21|decay|VCA|0, 1|
|iFsu|p22|sustain|VCA|0, 1|
|iFre|p23|release|VCA|0, 1|
|kVol|p24|main volume|VCA|0, 1|
|kPan|p25|panning|VCA|0, 1|
|kNse|p26|selector|NOISE|1, 2|
|kMx3|p27|volume|NOISE|0, 1|
|kSiz|p28|room size|REVERB|0, 1|
|kMx4|p29|dry/wet|REVERB|0, 1|
|iRev|p30|switch|REVERB|0, 1|
|iWf1|p31|selector|OSC1|1, 3|
|iWf2|p32|selector|OSC2|1, 3|
|iL1t|p33|switch|OSC1|0, 1|
|iL2t|p34|switch|OSC2|0, 1|
|iL1v|p35|switch|OSC1|0, 1|
|iL2v|p36|switch|OSC2|0, 1|
|kTrm|p37|tremolo rate|REVERB|0.5, 20|
|kVbr|p38|vibrato rate|REVERB|0.5, 20|
