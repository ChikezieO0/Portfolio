import gifAnimation.*;

//---------------players variables----------------
float ppx = 50.0; //player position on the x-axis
float ppy = 30.0;//player position on the y-axis
int psy = 25;//player size for the y-axis
int psx =12;//player size for the x-axis
int gun = 0;//specifically for the length of the water gun to make it "shoot"
float spdy = 0;//falling speed
float grv = 1.6;//gravity strength
float spdx = 0;//horizontal speed
float jmp = 0;//jump power
int anr = 0;//variable to animate run
PImage him,himdwn,runr0,guns,gunsp,gunsh,//sprites for character
runr1,runr2,runr3,runr4,runrr;//unused running sprites
int scr=0;//score counter
//-----------------fire variables-----------------------
Gif fire;//gif variable for fire
//lvl1
int frl11=0;//switch to "exstinguish the fire"
//lvl2
int frl21=0;
int frl22=0;
int frl23=0;
//lvl3
int frl31=0;
int frl32=0;
int frl33=0;
int frl34=0;
int frl35=0;
int frl36=0;
//------------------moving dangers------------------------
int l3dy=300;//variable to moving the danger up and down
int l3dx=200;//variable to stop danger from gyrating
//----------------interface variables------------------
int start = 0;//check for which menu to display
int level = 0;//check for which level you're on
int sbx = 150;//size of start button on x-axis
int sby=50;//size of start button on y-axis
int htwbx = 100;//size of how to play button on x-axis
int htwby = 50;//size of how to play button on y-axis
int lvls1 = 100;//size for level buttons
int lvls2 = 100;
int lvls3 = 100;
PImage Howtoplay,Background,lvlbackground,lvl1background
,lvl2background,lvl3background,lvl1,lvl2,lvl3,startbutton,htwbutton;



void setup()
{
  size(720,480);
  frameRate(30);
  // all the sprites
  him = loadImage("him.png");
  himdwn = loadImage("himdwn.png");
  runr0 = loadImage("runr0.png");
  runr1 = loadImage("runr1.png");
  runr2 = loadImage("runr2.png");
  runr3 = loadImage("runr3.png");
  runr4 = loadImage("runr4.png");
  runrr = loadImage("runrr.png");
  Howtoplay = loadImage("Howtoplay.png");
  Background = loadImage("Background.png");
  lvl1 = loadImage("lvl1.png");
  lvl2 = loadImage("lvl2.png");
  lvl3 = loadImage("lvl3.png");
  fire = new Gif(this,"fire.gif");
  fire.play();
  lvlbackground = loadImage("lvlbackground.png");
  lvl1background = loadImage("lvl1background.png");
  lvl2background = loadImage("lvl2background.png");
  lvl3background = loadImage("lvl3background.png");
  startbutton = loadImage("startbutton.png");
  htwbutton = loadImage("htwbutton.png");
  guns = loadImage("gun.png");
  gunsp = loadImage("gunsp.png");
  gunsh = loadImage("gunsh.png");
}

void draw()
{
 background(179,255,179);
 //-----------------------------start menu--------------------------------------------------
 if(start == 0)
 {
   fill(0);
   image(Background,0,0);
   rect(370-sbx/2,240,sbx,sby);//shadow for button
   image(startbutton,360-sbx/2,230,sbx,sby);//start button sprite
   //code to make click specifically the button change menus
   if(mouseX>360-sbx/2 && mouseX<360+sbx/2 && mouseY>230 && mouseY<230+sby)
   {
     if(mousePressed == true)
     {
       start=1;
     }
     //code for enlarge button when mouse is on it
     if(sbx<170 && sby <65)
     {sbx+=40; sby+=20;}
   }
   else
   {sbx=150; sby=50;}
   rect(310,390,100,50);//shadow again
   image(htwbutton,300,380);//how to play button sprite
   if(mouseX>300 && mouseX<400 && mouseY>380 && mouseY<430)
   {
     if(mousePressed == true)
     { start =5; }
   }
 }
 //--------------------------------how to play-------------------------------------------------
 if(start == 5)//code for how to play screen
 {
  image(Howtoplay,0,0);
  if(mousePressed == true)
  { start =0; }
 }
 //------------------------------level selector-------------------------------------------------
 if(start == 1)//code for level selector
 {
   image(lvlbackground,0,0);//sprites for the buttons
   image(lvl1,50,50,lvls1,lvls1);
   if(mouseX>50 && mouseX<150 && mouseY>50 && mouseY<150)//code to make button work
   {
    if(mousePressed == true)
    { start=2; level=1;}
    if(lvls1<120)
    { lvls1+=10; }//code to make button enlarge when you hover over it
   }
   else
    { lvls1=100; }//to return to regular size when mouse is no longer over the button
   
   image(lvl2,175,50,lvls2,lvls2);
   if(mouseX>175 && mouseX<275 && mouseY>50 && mouseY<150)
   {
    if(mousePressed == true)
    { start=2; level=2; }
    if(lvls2<120)
    { lvls2+=10; }
   }
   else
    { lvls2=100; }
   
   image(lvl3,300,50,lvls3,lvls3);
   if(mouseX>300 && mouseX<400 && mouseY>50 && mouseY<150)
   {
    if(mousePressed == true)
    { start=2; level=3;}
    if(lvls3<120)
    { lvls3+=10; }
   }
   else
    { lvls3=100; }
 }
 //-------------------------------------in game-----------------------------------------------
 //-------------------------------------------------------------------------------------------
 if(start == 2)
 {
   //backgrounds for all the levels
   if(level == 1)
   { image(lvl1background,0,0);}
   if(level == 2)
   { image(lvl2background,0,0); }
   if(level == 3)
   { image(lvl3background,0,0); }    
   textSize(34);
   fill(26,51,0);
   text(scr,40,40);
   if(anr == 0)
   {image(him,ppx,ppy); }
   //code for gravity
   ppy+=spdy+jmp;
   spdy+=grv;
   ppx=ppx+spdx;
   
   if(ppy>height-psy)//reset player if he falls out the bottom of the screen
   { ppy=30; ppx=50; spdy=0;}
   else {}
   
   if(keyPressed == true)
   {
     if(key == 'w' || key == 'W')//jump button
     {
       if(spdy<20)
       { jmp=-15; }
       image(runr4,ppx,ppy);
       println(spdy);
     }
     else if(key == 's' || key == 'S')//duck button
     {
       psx=25;
       psy=12;
       image(himdwn,ppx,ppy);
       anr=1;
     }
     else if(key == 'a' || key == 'A')//left button
     {
       spdx=-5;
       image(runrr,ppx,ppy);
       anr=1;
     }
     else if(key == 'd' || key == 'D')//right button
     {
       spdx=5;
       image(runr0,ppx,ppy);
       anr=1;
     }
     else if(key == 'k' || key == 'K')//shoot right
     {
       fill(77,195,255);
       rect(ppx+13,ppy+6,gun,10);
       image(guns,ppx+12,ppy+5,gun,10);
       image(gunsp,ppx+2,ppy,20,20);
       gun+=20;
     }
     else if(key == 'j' || key == 'J')//shoot left
     {
       fill(77,195,255);
       rect(ppx,ppy+5,gun,10);
       image(guns,ppx+12,ppy+5,gun,10);
       image(gunsh,ppx-2,ppy,20,20);
       gun+=-20;
     }
      else if(key == 'p' || key == 'P')//right button
     {
       start =0;
     }
     else{}
   }
   
   
   //------------------------------------------------level 1--------------------------------------
   //---------------------------------------------------------------------------------------------
  if(level==1)
  {    
     //---------------------------dangers-------------------------------
     fill(255,51,51);
     rect(200,60,50,20);
     if(ppy>60-psy && ppy<80-psy && ppx<250 && ppx>200)
     { ppy=50; ppx=50; }
     else{}
     
     rect(200,190,50,20);
     if(ppy>190-psy && ppy<210-psy && ppx<250 && ppx>200)
     { ppy=50; ppx=50; }
     else{}
     
     rect(400,80,15,102);
     if(ppy>80 && ppy<182 && ppx<415 && ppx>400)
     { ppy=50; ppx=50; }
     else{}
     
     rect(400,200,15,150);
     if(ppy>200 && ppy<350 && ppx<415 && ppx>400)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(130,200,15,150);
     if(ppy>200 && ppy<350 && ppx<145 && ppx>130)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(260,300,15,80);
     if(ppy>300 && ppy<380 && ppx<275 && ppx>260)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     //----------------------------win--------------------------------------------------
     fill(77,255,77);
     rect(540,380,180,100);
     if(ppy>380 && ppy<480 && ppx<720 && ppx>540)
     {
       level=2;
       ppy=40;
       ppx=40;
     }
     else{}
     //-------------------------fire-----------------------------------------------
     if(frl11==0)
     {
       fill(255,128,0);
       //(ppy>40 && ppy<80 && ppx<410 && ppx>370) || (ppy>40 && ppy<40 && 
       image(fire,370,40);
       if(ppy>40 && ppy<80 &&ppx+gun<410 && ppx+gun>370)
       {
         frl11=1;
         scr+=1000;
       }
       else if(ppy>40 && ppy<80 && ppx<410 && ppx>370)
       {
        frl11=1; 
        scr+=1000;
       }
     }
     //------------------------platforms--------------------------------------------
     fill(34,204,0);
     rect(0,70,540,10);
     if(ppy>70-psy && ppy<90-psy && ppx<540 && ppx>0)
     {
       spdy=0;
       ppy=70-psy;
     }
     else{}
     
      rect(100,200,620,20);
     if(ppy>200-psy && ppy<220-psy && ppx<720 && ppx>100)
     {
       spdy=0;
       ppy=200-psy;
     }
     else{}
     
     rect(0,370,540,20);
     if(ppy>370-psy && ppy<390-psy && ppx<540 && ppx>0)
     {
       spdy=0;
       ppy=370-psy;
     }
     else{}
  }
  //---------------------------------------------level 2-------------------------------------
  //-----------------------------------------------------------------------------------------
  if(level == 2)
  {
    //---------------------------dangers-------------------------------
     fill(255,51,51);
     rect(200,0,20,60);
     if(ppy>0-psy && ppy<60-12 && ppx<220 && ppx>200)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(500,0,20,60);
     if(ppy>0-psy && ppy<60-12 && ppx<520 && ppx>500)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(500,170,50,30);
     if(ppy>170-psy && ppy<200 && ppx<530 && ppx>500)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(300,90,20,75);
     if(ppy>90-psy && ppy<165 && ppx<320 && ppx>300)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(120,275,320,30);
     if(ppy>275-psy && ppy<305 && ppx<120 && ppx>440)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(200,310,20,75);
     if(ppy>200-psy && ppy<275 && ppx<220 && ppx>200)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(500,310,20,75);
     if(ppy>500-psy && ppy<575 && ppx<520 && ppx>500)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     //----------------------------win--------------------------------------------------
     fill(40,230,70);
     rect(0,410,180,70);
     if(ppy>380 && ppy<480 && ppx<180 && ppx>0)
     {
       level=3;
       ppy=40;
       ppx=40;
     }
     else{}
     //-------------------------fire-----------------------------------------------
     if(frl21==0)
     {
       fill(255,128,0);
       //(ppy>40 && ppy<80 && ppx<410 && ppx>370) || (ppy>40 && ppy<40 && 
       image(fire,370,40);
       if(ppy>40 && ppy<80 &&ppx+gun<410 && ppx+gun>370)
       {
         frl21=1;
         scr+=1000;
       }
       else if(ppy>40 && ppy<80 && ppx<410 && ppx>370)
       {
        frl21=1; 
        scr+=1000;
       }
     }
    //-----------platforms-----------------------------------
    fill(230,153,0);
     rect(0,70,540,20);
     if(ppy>70-psy && ppy<90-psy && ppx<540 && ppx>0)
     {
       spdy=0;
       ppy=70-psy;
     }
     else{}
     
     rect(100,180,720,20);
     if(ppy>180-psy && ppy<200-psy && ppx<720 && ppx>100)
     {
       spdy=0;
       ppy=180-psy;
     }
     else{}
     
     rect(0,290,540,20);
     if(ppy>290-psy && ppy<310-psy && ppx<540 && ppx>0)
     {
       spdy=0;
       ppy=290-psy;
     }
     else{}
     
     rect(160,240,200,15);
     if(ppy>240-psy && ppy<260-psy && ppx<360 && ppx>160)
     {
       spdy=0;
       ppy=240-psy;
     }
     else{}
     
      rect(100,400,720,20);
     if(ppy>400-psy && ppy<420-psy && ppx<720 && ppx>100)
     {
       spdy=0;
       ppy=400-psy;
     }
     else{}
  }
  //-------------------------------------------level 3----------------------------------------
  //-------------------------------------------------------------------------------------------
  if(level == 3)
  {
   //----------------------------win--------------------------------------------------
     fill(77,255,77);
     rect(0,410,180,70);
     if(ppy>380 && ppy<480 && ppx<180 && ppx>0)
     {
       level=0;
       start=4;
     }
     else{}
  //-------------------------fire-----------------------------------------------
     if(frl31==0)
     {
       image(fire,370,40);
       if(ppy>40 && ppy<80 &&ppx+gun<410 && ppx+gun>370)
       {
         frl31=1;
         scr+=1000;
       }
       else if(ppy>40 && ppy<80 && ppx<410 && ppx>370)
       {
        frl31=1; 
        scr+=1000;
       }
     }
     
     if(frl32==0)
     {
       image(fire,250,40);
       if(ppy>40 && ppy<80 &&ppx+gun<290 && ppx+gun>250)
       {
         frl32=1;
         scr+=1000;
       }
       else if(ppy>40 && ppy<80 && ppx<410 && ppx>370)
       {
        frl32=1; 
        scr+=1000;
       }
     }
     
     if(frl33==0)
     {
       image(fire,500,140);
       if(ppy>140 && ppy<180 &&ppx+gun<540 && ppx+gun>500)
       {
         frl33=1;
         scr+=1000;
       }
       else if(ppy>140 && ppy<180 && ppx<540 && ppx>500)
       {
        frl33=1; 
        scr+=1000;
       }
     }
     
     if(frl34==0)
     {
       image(fire,300,250);
       if(ppy>250 && ppy<290 &&ppx+gun<340 && ppx+gun>300)
       {
         frl34=1;
         scr+=1000;
       }
       else if(ppy>250 && ppy<290 && ppx<340 && ppx>300)
       {
        frl34=1; 
        scr+=1000;
       }
     }
     
     if(frl35==0)
     {
       image(fire,240,250);
       if(ppy>250 && ppy<290 &&ppx+gun<270 && ppx+gun>240)
       {
         frl35=1;
         scr+=1000;
       }
       else if(ppy>250 && ppy<290 && ppx<270 && ppx>230)
       {
        frl35=1; 
        scr+=1000;
       }
     }
     
     if(frl34==0)
     {
       image(fire,360,250);
       if(ppy>250 && ppy<290 &&ppx+gun<400 && ppx+gun>360)
       {
         frl34=1;
         scr+=1000;
       }
       else if(ppy>250 && ppy<290 && ppx<400 && ppx>360)
       {
        frl34=1; 
        scr+=1000;
       }
     }
  //---------------------------dangers-------------------------------
     fill(255,51,51);
     rect(100,0,20,60);
     if(ppy>0-psy && ppy<60-12 && ppx<120 && ppx>100)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(200,30,20,60);
     if(ppy>30-psy && ppy<90-12 && ppx<220 && ppx>200)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(300,0,20,60);
     if(ppy>0-psy && ppy<60-12 && ppx<320 && ppx>300)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(400,30,20,60);
     if(ppy>30-psy && ppy<90-12 && ppx<420 && ppx>400)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(500,0,20,60);
     if(ppy>0-psy && ppy<60-12 && ppx<520 && ppx>500)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(100,80,300,20);
     if(ppy>90-psy && ppy<100 && ppx<400 && ppx>100)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(200,160,300,40);
     if(ppy>200-psy && ppy<240 && ppx<500 && ppx>200)
     {
       ppy=50;
       ppx=50;
     }
     else{}
     
     rect(l3dx,l3dy,300,40);
     if(l3dy>=200 && 380>=l3dy && l3dx==200)
     {
       l3dy+=5;
       if(l3dy==380)
       {
         l3dx=201;
       }
     }else if(l3dy>=200 && 380>=l3dy && l3dx==201)
     {
       l3dy-=5;
       if(l3dy==200)
       {
         l3dx=200;
       }
     }
     if(ppy>l3dy-psy && ppy<l3dy+40 && ppx<500 && ppx>200)
     {
       ppy=50;
       ppx=50;
     }
     else{}
  //------------------------------platforms---------------------------------
    fill(153,77,0);
     rect(0,70,540,20);
     if(ppy>70-psy && ppy<85-psy && ppx<540 && ppx>0)
     {
       spdy=0;
       ppy=70-psy;
     }
     else{}
     
     rect(100,180,720,20);
     if(ppy>180-psy && ppy<200-psy && ppx<720 && ppx>100)
     {
       spdy=0;
       ppy=180-psy;
     }
     else{}
     
     rect(0,290,540,20);
     if(ppy>290-psy && ppy<310-psy && ppx<540 && ppx>0)
     {
       spdy=0;
       ppy=290-psy;
     }
     else{}
     
     rect(240,150,250,15);
     if(ppy>150-psy && ppy<165-psy && ppx<490 && ppx>240)
     {
       spdy=0;
       ppy=150-psy;
     }
     else{}
     
      rect(100,400,720,20);
     if(ppy>400-psy && ppy<420-psy && ppx<720 && ppx>100)
     {
       spdy=0;
       ppy=400-psy;
     }
     else{}
  }
 }
 //---------------------------------------------win game screen-----------------------------
  if(start==4 && level==0)
  {
    fill(204,255,204);
    rect(50,50,620,380);
    textSize(50);
    fill(77,153,0);
    text("Congradulations, You Won!!!",52,100);
    textSize(28);
    text("To return to main menu click anywhere on screen",52,200);
    if(mousePressed == true)
    { start=0;}
  }
 }

//----------------------------------------------controls stuff------------------------------
//---------------------------------------------------------------------------------------
void keyReleased()
{
 if(key =='a' || key == 'A')
 { spdx=0; anr=0; }
 
 else if(key =='d' || key == 'D')
 { spdx=0; anr=0; }
 
 else if(key =='w' || key == 'W')
 { jmp=1; }
 
 else if(key =='s' || key == 'S')
 { psx=12; psy=25; anr=0; }
 
 else if(key =='j' || key == 'J')
 {  gun=0; }
 
 else if(key =='k' || key == 'K')
 { gun=0; }
 
}
