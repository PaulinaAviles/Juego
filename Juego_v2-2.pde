//variables globales
figura casete;
figura cd;
figura sd;
figura disqu;
figura nube;
figura usb;



    //----
int w=1000;
int h=600;
int pantalla=1;
int turno=1;
int personaje;
String s;
int cx1,cx2,cy1,cy2,f;
int slc=1;
int j1,j2;
int sz;
int attk1, attk2, life1, life2,l1,l2;
int win;
int b1=300;
int b2=300;


float[] px=new float[1000];
float[] py=new float[600];
float[] dx=new float[1000];
float[] dy=new float[600];



  
  
void settings() {
  size(w, h);
}

void setup(){
    background(253,247,210);
        //---
    casete= new figura(width/4,height/3,.4,9,30);
    sd=new figura(width/2, height/3, 1.5,12,42);
    nube=new figura(3*width/4, height/3, .3,20,38);
    cd=new figura(width/4, 3*height/4, .3,18,35);
    disqu=new figura(width/2, 3*height/4, .3, 6, 50);
    usb=new figura(3*width/4, 3*height/4, 1.4 ,15 , 45);
        //---
      
        for(int i=0; i<400; i++){
          px[i] = random(1000);
          py[i] = random(600);
          dx[i] = random(-1,1);
          dy[i] = random(-1,1);
        }//for
        
}//setup



void draw(){
 
 if(pantalla==1){ pantalla1();}   

 if(pantalla==2){
     if (slc==1){
       grande();
       selec1();
     }
     if (slc==2){
       selec2();
       grande();
     }   
 }//pant 2
 
 
 if(pantalla==3){
   fight();
   barra();
 }
 
 if(pantalla==4){ pantalla4();}
   
}//draw



//--------------------------
    void pantalla1(){
      w=600;
      h=400;
        background(253,247,210);
      //nombre
        textAlign(CENTER);
        String s1 = "The last device standing";
        fill(200,170,200);
        textSize(60);
        text(s1, width/2, height/3);  
      
      //intro
        s1 = "En medio de un mundo con miles de opciones, ellos se pelean por ser el dispositivo principal";
        fill(80);
        textSize(20);
        textAlign(CENTER);
        //background(253,247,210);
        text(s1, width/2, 3*height/5,2*width/3,height/2); 
      
      //botón
        textAlign(CENTER,CENTER);
        noStroke();
        fill(70);
        rectMode(CENTER);
        rect(width/2, 4*height/5, 100,50,10);
      
      //texto botón
        fill(200,200,250);
        textSize(25);
        text("JUGAR", width/2, 4*height/5); 
        
      //intro
        s1 = "Da click en el botón para comenzar";
        fill(50);
        textSize(10);
        textAlign(CENTER);
        //background(253,247,210);
        text(s1, width/2, 8*height/9); 
      
      
      //pantalla1-->pantalla2
         if(mousePressed & (mouseX >= width/2-50 & mouseX <= width/2+50)&(mouseY>= 4*height/5-25 & mouseY <= 4*height/5+25)){
           pantalla=2;
            mousePressed=false;
          } //if 
      }//void 1
      

   void pantalla2(){
      w=1000;
      h=600;
       background(200,243,246);
       
        noStroke();
        fill(246,199,130);
        rectMode(CENTER);
        
       //rectangulo 1, back
        rect(width/4, height/3, 130,170,10);
        
       //rectangulo 2, back
        rect(width/2, height/3, 130,170,10);
        
       //rectangulo 3, back
        rect(3*width/4, height/3, 130,170,10);
      
      //rectangulo 4, back
        rect(width/4, 3*height/4, 130,170,10);
      
      //rectangulo 5, back
        noStroke();
        rect(width/2, 3*height/4, 130,170,10);
        
      //rectangulo 6, back
        rect(3*width/4, 3*height/4, 130,170,10);
        
         textAlign(CENTER);
         fill(90);
         textSize(20);
         
       //text p1
         text("Mix-killer-Tape", width/4, height/2+10);
         
       //text p2
         text("Scary Dude", width/2, height/2+10);  
         
       //text p3
         text("Cody lightfeet", 3*width/4, height/2+10); 
         
        //text p4
         text("Dick ChunkBlow", width/4, 2*height/2-40);
         
        //text p5
         text("Gostly Earl", width/2, 2*height/2-40);
         
        //text p6
         text("Universal crazy Bus", 3*width/4, 2*height/2-40); 
    }//void 2
    
    
    void grande(){//f= num de figura
        if (mouseX >=width/4-130/2 & mouseX <=width/4+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2){casete.escala=1;}
          else{casete.escala=.4;}
          
         if (mouseX >=width/2-130/2 & mouseX <=width/2+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2){sd.escala=1.5;}
          else{sd.escala=.5;}
          
         if (mouseX >= 3*width/4-130/2 & mouseX <= 3*width/4+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2){nube.escala=1;}
          else{nube.escala=.4;}
          
         if (mouseX >=width/4-130/2 & mouseX <=width/4+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2){cd.escala=.8;}
           else{cd.escala=.3;} 
           
         if (mouseX >=width/2-130/2 & mouseX <=width/2+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2){disqu.escala=.8;}
           else{disqu.escala=.3;} 
           
        if (mouseX >=3*width/4-130/2 & mouseX <=3*width/4+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2){usb.escala=1.4;}
           else{usb.escala=.5;} 
    }


   void selec1(){
        pantalla2();
        casete.casete1();
        sd.sd1();
        nube.nube1();
        cd.cd1();
        disqu.disqu1();
        usb.usb1();
        
           //texto "elegir"
               textAlign(CENTER);
               s = "Jugador 1. Elige tu personaje";
               fill(70);
               textSize(30);
               text(s, width/2, height/9);
               textSize(12);
               text("Usa tu mouse", width/2, height/9+25);
               
               
               
          if (mousePressed & (mouseX >=width/4-130/2 & mouseX <=width/4+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2)){
              j1=1;
               attk1=casete.attk;
               life1=casete.life;
               l1=life1;
              slc=2;}
            
          if (mousePressed & (mouseX >=width/2-130/2 & mouseX <=width/2+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2)){
              j1=2;
                attk1=sd.attk;
                life1=sd.life;
                l1=life1;
              slc=2;}
           
           if (mousePressed & (mouseX >= 3*width/4-130/2 & mouseX <= 3*width/4+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2)){
              j1=3;
                attk1=nube.attk;
                life1=nube.life;
                l1=life1;
                slc=2;}
           
           if (mousePressed & (mouseX >=width/4-130/2 & mouseX <=width/4+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2)){
              j1=4;
               attk1=cd.attk;
               life1=cd.life;
               l1=life1;
              slc=2;}
            
           if (mousePressed & (mouseX >=width/2-130/2 & mouseX <=width/2+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2)){
              j1=5;
                attk1=disqu.attk;
                life1=disqu.life;
                l1=life1;
              slc=2;}
             
          if (mousePressed & (mouseX >=3*width/4-130/2 & mouseX <=3*width/4+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2)){
                j1=6;
                  attk1=usb.attk;
                  life1=usb.life;
                  l1=life1;
                slc=2;}
      } //void  



void selec2(){
  
   pantalla2();
   
   //texto "elegir"
         textAlign(CENTER);
         s = "Jugador 2. Elige tu personaje";
         fill(70);
         textSize(30);
         text(s, width/2, height/9); 
         textSize(12);
         text("Usa tu mouse", width/2, height/9+25);

         if (j1!=1){casete.casete1();
             if (mousePressed & (mouseX >=width/4-130/2 & mouseX <=width/4+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2)){
             j2=1;
              attk2=casete.attk;
              life2=casete.life;
              l2=life2;
             pantalla=3;}
         }
         if (j1!=2){sd.sd1();
             if (mousePressed & (mouseX >=width/2-130/2 & mouseX <=width/2+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2)){
              j2=2;
              life2=sd.life;
              attk2=sd.attk;
              l2=life2;
              pantalla=3;}
         }       
         if (j1!=3){nube.nube1();
            if (mousePressed & (mouseX >= 3*width/4-130/2 & mouseX <= 3*width/4+130/2 & mouseY >= height/3-170/2 & mouseY <= height/3+170/2)){
            j2=3;
            life2=nube.life;
            attk2=nube.attk;
            l2=life2;
            pantalla=3;}
         }         
         if (j1!=4){cd.cd1();
            if (mousePressed & (mouseX >=width/4-130/2 & mouseX <=width/4+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2)){
            j2=4;
            life2=cd.life;
            l2=life2;
            attk2=cd.attk;
            pantalla=3;}
         }
         if (j1!=5){disqu.disqu1();
            if (mousePressed & (mouseX >=width/2-130/2 & mouseX <=width/2+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2)){
            j2=5;
            life2=disqu.life;
            attk2=disqu.attk;
              l2=life2;
            pantalla=3;}
         }
         if (j1!=6){usb.usb1();
            if (mousePressed & (mouseX >=3*width/4-130/2 & mouseX <=3*width/4+130/2 & mouseY >= 3*height/4-170/2 & mouseY <= 3*height/4+170/2)){
            j2=6;
            life2=usb.life;
            attk2=usb.attk;
            l2=life2;
            pantalla=3;}
         }
         
         
    }   

void pantalla3(){
  
  b1=(life1*300)/l1;
  b2=(life2*300)/l2;
  background(230,243,144);
  
  rectMode(CENTER);
  noStroke();
  fill(216,236,255);
  rect(2*width/2,height/2,width,height);
  
  fill(220,90);
  rect(2*width/7,height/2,400,400,30);
  rect(5*width/7,height/2,400,400,30);
  
        if (j1==1){
        casete.x= 2*width/7;
        casete.y= height/2;
        casete.escala=1.5;
        casete.casete1();
        textAlign(CENTER);
        fill(90);
        textSize(20);
        text("Mix-the killer-Tape", 2*width/7, height/6);
        }
        if (j1==2){
        sd.x= 2*width/7;
        sd.y= height/2;
        sd.sd1();
        sd.escala=2;
        textAlign(CENTER);
        fill(90);
        text("Scary Dude", 2*width/7, height/6);  
        }
        if (j1==3){
        nube.x= 2*width/7;
        nube.y= height/2;
        nube.escala=1;
        nube.nube1();textAlign(CENTER);
         fill(90);
         textSize(20);
         text("Cloudy lightfeet", 2*width/7, height/6); 
        }
        if (j1==4){
        cd.x= 2*width/7;
        cd.y= height/2;
        cd.escala=1.3;
        cd.cd1();
        fill(90);
        textSize(20);
        text("Dick ChunkBlow", 2*width/7, height/6);
        }
        if (j1==5){
        disqu.x= 2*width/7;
        disqu.y= height/2;
        disqu.escala=1;
        disqu.disqu1();
        fill(90);
        textSize(20);
         text("Gostly Earl", 2*width/7, height/6);
        }
        if (j1==6){
        usb.x= 2*width/7;
        usb.y= height/2+height/15;
        usb.escala=2;
        usb.usb1();
        fill(90);
        textSize(20);
        text("Universal crazy Fred", 2*width/7, height/6); 
        }
        
  //-------
        if (j2==1){
        casete.x= 5*width/7;
        casete.y= height/2;
        casete.escala=1.5;
        casete.casete1();
        textAlign(CENTER);
        fill(90);
        textSize(20);
        text("Mix-the killer-Tape", 5*width/7, height/6);
        }
        
        if (j2==2){
        sd.x= 5*width/7;
        sd.y= height/2;
        sd.escala=2;
        sd.sd1();
        textAlign(CENTER);
        fill(90);
        text("Scary Dude", 5*width/7, height/6);  
        }
        if (j2==3){
        nube.x= 5*width/7;
        nube.y= height/2;
        nube.escala=1;
        nube.nube1();
        fill(90);
        textSize(20);
        text("Cloudy lightfeet", 5*width/7, height/6); 
        }
        if (j2==4){
        cd.x= 5*width/7;
        cd.y= height/2;
        cd.escala=1.3;
        cd.cd1();
        fill(90);
        textSize(20);
        text("Dick ChunkBlow", 5*width/7, height/6);
        }
        if (j2==5){
        disqu.x= 5*width/7;
        disqu.y= height/2;
        disqu.escala=1;
        disqu.disqu1();
        fill(90);
        textSize(20);
        text("Gostly Earl", 5*width/7, height/6);
        }
        if (j2==6){
        usb.x= 5*width/7;
        usb.y= height/2+height/15;
        usb.escala=2;
        usb.usb1();
        fill(90);
        textSize(20);
        text("Universal crazy Fred", 5*width/7, height/6); 
        }
}//pant 3




  void fight(){
           keyCode=0;
           
       if (turno==1){
             pantalla3();
            
              textAlign(CENTER);
              fill(50);
              textSize(35);
              text("Jugador 1 ", 2*width/7, 11*height/12);
              fill(150);
              textSize(20);
              text("presiona la tecla F para atacar", 2*width/7, 6*height/7); 
            if(keyPressed && (key=='f'||key=='F') && life2>0){
                keyCode=0;
                if(life2>0)
                {
                life2-=attk1;
                b2-=(life2*300)/l2;
                //println("vida 1 :"+life1+"   vida 2 :"+life2);
                turno=2;
               }
               if(life2<=0){
               turno=3;
               b2=0;}
              }   
      }//if turno1
          
          
       if(turno==2){
                  pantalla3();
                 
                  textAlign(CENTER);
                  fill(50);
                  textSize(35);
                  text("Jugador 2 ", 5*width/7, 11*height/12);
                  textSize(20);
                  fill(150);
                  text("presiona K para atacar", 5*width/7, 6*height/7); 
                  
                 if(keyPressed && (key=='k'||key=='K' )) {
                       keyCode=0;
                       if(life1>0){
                          life1-=attk2;
                          b1-=(life1*300)/l1;
                          //println("vida 1 :"+life1+"   vida 2 :"+life2);
                          turno=1;
                       }
                       if(life1<=0){
                           turno=3;
                           b1=0;}
                       }  
               }//if turno 2
       
        if (turno==3){
               if(life1>0 ){win=j1;}
               if(life2>0){win=j2;}
              pantalla=4;
              //println(life1,',',life2,',',win);
        }//turno 3
  }//fight
  
    
 void barra(){
         rectMode(CORNER);
         noStroke();
         fill(10,40);
         rect(width/25, height/7,20,300,10);
         rect(17*width/18, height/7,20,300,10);
         if(b1>=0){
         fill(216,236,255);
         rect(width/25, (height/7)+300, 20, -b1,10);}
         if (b2>=0){
         fill(230,243,144);
         rect(17*width/18, (height/7)+300, 20,-b2,10);}
  }
  
  
          
 void pantalla4(){
       background(202,246,242,80);
 
             for(int i=0; i<600; i++){
             fill(random(0-100),random(255),random(255));
             
                    if(px[i]>1000||px[i]<0){
                    dx[i]*=-1;}
                    
                    if(py[i]>=600||py[i]<=0){
                     dy[i]*=-1; }
                     
                     px[i]+=dx[i];
                     py[i]+=dy[i];
                    ellipse(px[i],py[i],10,10);
               }//FOR
             
             //circulo ganador
             rectMode(CENTER);
             noStroke();
             fill(253,247,210,220);  
             ellipse(width/2,height/2,width/2,width/2);
       
             textAlign(CENTER);
             fill(90);
             textSize(20);
             
           if(win==1){
             text("Mix-killer-Tape", 3*width/4, height/2+10);
             casete.x=width/2;
             casete.y=height/ 2;
             casete.escala=1.5;
             casete.casete1();}
           if( win== 2){
             text("Scary Dude", width/4, height/2+10);
             sd.x=width/2;
             sd.y=height/2;
             sd.escala=2;
             sd.sd1();}
           if( win==3){
             text("Cloudy lightfeet", 3*width/4, height/2+10);
             nube.x=width/2;
             nube.y=height/2;
             nube.escala=1;
             nube.nube1();}
           if (win==4){
             text("Dick ChunkBlow", width/4, 2*height);
             cd.x=width/2;
             cd.y=height/2;
             cd.escala=1.5;
             cd.cd1();}
           if (win==5){
              text("Gostly Earl", width/4, 2*height/2-40);
             disqu.x=width/2;
             disqu.y=height/2;
             disqu.escala=1;
             disqu.disqu1();}
           if(win==6){
             text("Universal crazy Bus", 3*width/4, 2*height/2-40);
             usb.x=width/2;
             usb.y=height/2;
             usb.escala=2;
             usb.usb1(); }
       
       //"ganador"
       fill(0);
       textAlign(CENTER,CENTER);
       textSize(50);
       text("FELICIDADES",width/2,height/10);
       
       fill(0,80);
       textSize(20);
       text("HAS GANADO",width/2,height/6);
       
       //Botón
       rectMode(CENTER);
       noStroke();
       fill(220,128,128);
       rect(width/2,9*height/10,100,40,10);
       
       fill(255);
       textAlign(CENTER,CENTER);
       textSize(15);
       text("INICIO",width/2,9*height/10);
       
       
       //pantalla1-->pantalla2
         if(mousePressed & (mouseX >= width/2-50 & mouseX <= width/2+50)&(mouseY>= 9*height/10-20 & mouseY <= 9*height/10+20)){
           pantalla=1;
          } //if 
 }    //pantalla4    
         
     

    
//---------
class figura{
  //atributos
  int x;
  int y;
  float escala;
  int ancho;
  int alto;
  int attk; //ataque
  int life;//life
  
  //metodo de construccion
  figura(int x_,int y_,float escala_,int attk_, int life_){
    x=x_;
    y=y_;
    attk=attk_;
    life=life_;
    escala=escala_;
  }
  
  //Métodos
  


void casete1(){
  ancho= int(200*escala);
  alto= int(120*escala);
  
      rectMode(CENTER);
      
     //Rectangulo Morado
      fill(155,49,81);
      rect(x,y,ancho,alto);
      
     //Rectangulo Verde Centro
      fill(138,186,170);
      rect(x,y-(alto/15),ancho-(ancho/6),alto-(2*alto/6),alto/9);
      
     //Rectangulo superior Verde
      fill(18,114,102);
      rect(x,y-(alto/3),ancho-(ancho/6),alto/8,alto/3);
       
     //Linea decorativa
      line(x-(4*ancho/12),y-(alto/3),x+(4*ancho/12),y-(alto/3));
      
     //Trapecio Verde
      fill(18,114,102);
      quad(x-ancho/4,y+alto/2,x+ancho/4,y+alto/2,x+ancho/6,y+alto/3,x-ancho/6,y+alto/3);
      
     //Boca
      fill(0);
      beginShape();
      vertex(x-(ancho/15),y+(alto/9));
      bezierVertex(x-(ancho/15),y+(alto/4),x+(ancho/30),y+(alto/4), x+(ancho/15), y+(alto/9));
      vertex(x-(ancho/15),y+(alto/9));
      endShape();
      
     //Nariz
      fill(18,114,102);
      beginShape();
      vertex(x-(ancho/20),y-(alto/6));
      bezierVertex(x-(ancho/40),y-(alto/8),x-(ancho/40),y-(alto/11), x-(ancho/20), y-(alto/40));
      vertex(x+(ancho/20),y-(alto/40));
      bezierVertex(x+(ancho/40),y-(alto/11),x+(ancho/40),y-(alto/8), x+(ancho/20), y-(alto/6));
      vertex(x-(ancho/20),y-(alto/6));
      endShape();
      
     //Ojos Blancos
      fill(255);
      arc(x-(ancho/6), y-(alto/9) , alto/5,alto/5 , -0.3, PI+QUARTER_PI, CHORD);
      arc(x+(ancho/6), y-(alto/9) , alto/5,alto/5 , -QUARTER_PI, PI+0.3, CHORD);
      
      
     //Ojos Morados
      noStroke();
      fill(109,49,81);
      ellipse(x-(ancho/6), y-(alto/9) , alto/9,alto/9);
      ellipse(x+(ancho/6), y-(alto/9) , alto/9,alto/9);
      stroke(0);
      
     //Cejas
      noFill();
      bezier(x-(ancho/4), y-(9*alto/40),x-(alto/5),y-(alto/6),x-(ancho/16),y-(alto/10), x-(ancho/15), y-(9*alto/40));
      bezier(x+(ancho/4), y-(9*alto/40),x+(alto/5),y-(alto/6),x+(ancho/16),y-(alto/10), x+(ancho/15), y-(9*alto/40));
      
     //Puntos Extremos
      strokeWeight(alto/15);
      point(x-((ancho/2)-(4*ancho/60)),y+(19*alto/48));
      point(x+((ancho/2)-(4*ancho/60)),y+(19*alto/48));
      
     //3 Puntos 
      strokeWeight(alto/20);
      point(x,y+(19*alto/48));
      point(x+(4*ancho/60),y+(19*alto/48));
      point(x-(4*ancho/60),y+(19*alto/48));
      
     //Puntos Ojos
      strokeWeight(alto/30);
      point(x-(ancho/6), y-(alto/9));
      point(x+(ancho/6), y-(alto/9));
      
      
     //Pies
      strokeWeight(alto/60);
      line(x-(ancho/5),y+(alto/2),x-(ancho/5),y+(26*alto/36));
      line(x+(ancho/5),y+(alto/2),x+(ancho/5),y+(26*alto/36));
      fill(0);
      rect(x-(ancho/5)-(3*ancho/200),y+(26*alto/36),3*ancho/100,3*ancho/100);
      rect(x+(ancho/5)+(3*ancho/200),y+(26*alto/36),3*ancho/100,3*ancho/100);
      
     //Manos
      noFill();
      strokeWeight(alto/60);
      line(x+(ancho/2),y,x+(ancho/2)+(ancho/8),y);
      bezier(x-(ancho/2), y,x-(ancho/2),y+(alto/16),x-(30*ancho/40),y+(alto/6), x-(27*ancho/40), y-(alto/30));
      
     //Espadita
      strokeWeight(alto/60);
      stroke(138,186,170);
      line(x+(ancho/2)+(ancho/8),y+(alto/7),x+(ancho/2)+(ancho/8),y-(alto/5));
      stroke(0);
      fill(0);
      triangle(x+(ancho/2)+(19*ancho/160),y-(alto/5),x+(ancho/2)+(ancho/8),y-(3*alto/12),x+(ancho/2)+(21*ancho/160),y-(alto/5));
      noFill();
      
     //Puntos Mano
      strokeWeight(alto/12);
      point(x-(27*ancho/40), y-(alto/30));
      point(x+(ancho/2)+(ancho/8),y);
      
     //Puntos Pies
      strokeWeight(8*alto/120);
      point(x-(ancho/5)-(6*ancho/200),y+(26*alto/36));
      point(x+(ancho/5)+(6*ancho/200),y+(26*alto/36));  
  
    strokeWeight(alto/120); 
}//casete



void sd1(){
  ancho= int(75*escala);
  alto= int(100*escala);
 
    rectMode(CENTER);
    
    //Rectangulo Azul
    fill(11,115,204);
    beginShape();
    vertex(x-(ancho/2),y+(alto/2));
    vertex(x+(ancho/2),y+(alto/2));
    vertex(x+(ancho/2),y-(alto/2));
    vertex(x-(10*ancho/40),y-(alto/2));
    vertex(x-(ancho/2),y-(10*alto/40));
    endShape();
    
    //Boca
    fill(0);
    beginShape();
    vertex(x+(44*ancho/100),y-(45*alto/100));
    bezierVertex(x+(65*ancho/100),y-(39*alto/100),x+(52*ancho/100),y-(20*alto/100),x+(44*ancho/100),y-(14*alto/100));
    bezierVertex(x+(40*ancho/100),y-(22*alto/100),x+(18*ancho/100),y-(16*alto/100),x+(11*ancho/100),y-(14*alto/100));
    bezierVertex(x+(1*ancho/100),y-(15*alto/100),x-(10*ancho/100),y-(22*alto/100),x-(30*ancho/100),y-(16*alto/100));
    bezierVertex(x-(38*ancho/100),y-(20*alto/100),x-(50*ancho/100),y-(30*alto/100),x-(31*ancho/100),y-(43*alto/100));
    bezierVertex(x-(22*ancho/100),y-(44*alto/100),x-(15*ancho/100),y-(44*alto/100),x-(10*ancho/100),y-(38*alto/100));
    bezierVertex(x-(1*ancho/100),y-(47*alto/100),x+(15*ancho/100),y-(47*alto/100),x+(27*ancho/100),y-(40*alto/100));
  
    endShape();
    fill(242,230,197);
    rect(x+(44*ancho/100),y-(30*alto/100),ancho/15,alto/4);
    rect(x+(33*ancho/100),y-(30*alto/100),ancho/15,alto/6);
    rect(x+(22*ancho/100),y-(30*alto/100),ancho/15,alto/6);
    rect(x+(11*ancho/100),y-(30*alto/100),ancho/15,alto/4);
    rect(x+(1*ancho/100),y-(30*alto/100),ancho/15,alto/5);
    rect(x-(10*ancho/100),y-(30*alto/100),ancho/15,alto/7);
    rect(x-(20*ancho/100),y-(30*alto/100),ancho/15,alto/5);
    rect(x-(30*ancho/100),y-(30*alto/100),ancho/15,alto/5);
    
    //Ojos Blancos
    fill(255);
    stroke(0);
    arc(x-(ancho/6)+(8*ancho/100), y-(alto/2) , 12*alto/50,12*alto/50 , PI, 2*PI, CHORD);
    arc(x+(ancho/6)+(15*ancho/100), y-(alto/2) , 12*alto/50,12*alto/50 , PI, 2*PI, CHORD);
    
    //Cejas
    noFill();
    strokeWeight(alto/60);
    //bezier(x-(ancho/6)-(12*ancho/100), y-(29*alto/40),x-(8*alto/40),y-(31*alto/40),x-(6*ancho/40),y-(31*alto/40), x-(4*ancho/40), y-(29*alto/40));
    line(x-(ancho/6)-(4*ancho/100), y-(26*alto/40),x-(5*alto/80),y-(27*alto/40));
    line(x-(5*alto/80),y-(27*alto/40),x+(4*alto/80),y-(24*alto/40));
    line(x+(ancho/6)+(25*ancho/100), y-(26*alto/40),x+(5*alto/80)+(21*ancho/100),y-(27*alto/40));
    line(x+(5*alto/80)+(21*ancho/100),y-(27*alto/40),x+(4*alto/80)+(8*ancho/100),y-(24*alto/40));
   
    //Puntos Ojos
    strokeWeight(alto/18);
    point(x-(ancho/6), y-(53*alto/100));
    point(x+(ancho/6)+(10*ancho/100), y-(53*alto/100));
    
    //Pies
    strokeWeight(alto/60);
    noFill();
    bezier(x-(ancho/5),y+(alto/2), x-(ancho/5)-(9*ancho/100),y+(alto/2)+(3*alto/36) , x-(ancho/5)-(6*ancho/100),y+(22*alto/36) ,x-(ancho/5),y+(24*alto/36));
    bezier(x+(ancho/5),y+(alto/2), x+(ancho/5)-(9*ancho/100),y+(alto/2)+(3*alto/36) , x+(ancho/5)-(6*ancho/100),y+(22*alto/36) ,x+(ancho/5),y+(24*alto/36));
    fill(106,73,40);
    stroke(106,73,40);
    rect(x-(ancho/5)-(2*ancho/200),y+(26*alto/36)-(2*ancho/100),4*ancho/100,11*ancho/100);
    rect(x+(ancho/5)+(2*ancho/200),y+(26*alto/36)-(2*ancho/100),4*ancho/100,11*ancho/100);
    stroke(0);
    
    //Manos
    noFill();
    strokeWeight(alto/60);
    bezier(x-(ancho/2)+(3*ancho/40), y+(2*alto/60),x-(ancho/2)-(5*ancho/40),y,x-(30*ancho/40),y-(1*alto/60), x-(65*ancho/80), y+(4*alto/30));
    bezier(x+(ancho/2)-(3*ancho/40), y+(2*alto/60),x+(ancho/2)+(5*ancho/40),y,x+(30*ancho/40),y-(1*alto/60), x+(65*ancho/80), y+(4*alto/30));
    
    //Puntos Mano
    strokeWeight(alto/12);
    stroke(143,0,0);
    point(x-(65*ancho/80), y+(4*alto/30));
    point(x+(65*ancho/80), y+(4*alto/30));
    
    //Puntos Pies
    strokeWeight(8*alto/120);
    stroke(106,73,40);
    point(x-(ancho/5)-(9*ancho/200),y+(26*alto/36));
    point(x+(ancho/5)-(6*ancho/200),y+(26*alto/36));
    
    stroke(0);
    strokeWeight(alto/120);
}//sd



void nube1(){
ancho= int(120*escala);
alto= int(70*escala);

  rectMode(CENTER);
  
  //circulo central
  noStroke();
  fill(192,213,242);
  ellipse(x,y,ancho,2*alto);
  ellipse(x-(ancho/2),y+alto/2,ancho,alto*1.5);
  ellipse(x+(ancho/2),y+2*(alto/3),8*(ancho/5),alto*1.2);
  ellipse(x+(ancho/2),y+(ancho/12),5*(ancho/6),alto);
  
  stroke(0);
  strokeWeight(ancho/80);
  
  //Ojo izq
  fill(255);
  beginShape();
  vertex(x-(ancho/10),y-3*(alto/6));
  bezierVertex(x-(ancho/10),y-3*(alto/6),x-(ancho/5),y-(alto/15), x-(ancho/4), y-4*(alto/7));
  vertex(x-(ancho/10),y-3*(alto/6));
  endShape();
  
  //Ojo der
  fill(255);
  beginShape();
  vertex(x+(ancho/10),y-3*(alto/6));
  bezierVertex(x+(ancho/10),y-(alto/2),x+(ancho/5),y-(alto/15), x+(ancho/4), y-4*(alto/7));
  vertex(x+(ancho/10),y-3*(alto/6));
  endShape();
  
  //Puntos Ojos
  strokeWeight(ancho/17);
  point(x-(ancho/7), y-16*(alto/30));
  point(x+(ancho/7), y-16*(alto/30));
  
  //Ceja
  strokeWeight(alto/70);
  line(x-(ancho/4), y-4*(alto/7),x-(3*ancho/9), y-5*(alto/9));
  line(x+(ancho/4), y-4*(alto/7),x+(3*ancho/9), y-5*(alto/9));
  
 //Boca
 fill(0);
 ellipse(x,y,ancho/10,alto/4);
 
 //Cachete
  noFill();
  strokeWeight(alto/70);
  bezier(x+(ancho/20), y-(11*alto/20),x+(ancho/20),y-(12*alto/20),x+(2*ancho/20),y-(13.5*alto/20), x+(2*ancho/20), y-(13*alto/20));
  bezier(x-(ancho/20), y-(11*alto/20),x-(ancho/20),y-(12*alto/20),x-(2*ancho/20),y-(13.5*alto/20), x-(2*ancho/20), y-(13*alto/20));
 
  bezier(x+(3*ancho/7), y-(2*alto/20),x+(2*ancho/7),y-(alto/20),x+(2*ancho/7),y+(11*alto/20), x+(3*ancho/7), y+(16*alto/20));
}//nube



void cd1(){
  ancho= int(200*escala);
  alto= int(200*escala);

    rectMode(CENTER);
  
      //Circulo Verde-Azul Cuerpo
      fill(146,202,204);
      noStroke();
      ellipse(x,y,ancho,alto);
      stroke(0);
      
      //Boca
      strokeWeight(ancho/(100));
      line(x-(4*ancho/40),y+(alto/4),x+(4*ancho/40),y+(alto/4));
      strokeWeight(ancho/200);
      
      //Ojos Blancos
      fill(255);
      arc(x, y-(2*alto/40) , 12*alto/40,12*alto/40 , -QUARTER_PI, PI+QUARTER_PI, OPEN);
      fill(146,202,204);
      bezier(x-(5*ancho/40), y-(7*alto/40),x-(2*ancho/40),y-(4*alto/40),x+(3*ancho/40),y-(4*alto/40), x+(5*ancho/40), y-(7*alto/40));
    
      //Ojo Azul
      noStroke();
      fill(0,68,108);
      ellipse(x, y , 6*alto/40,6*alto/40);
      stroke(0);  
      
      //Puntos Ojos
      strokeWeight(alto/15);
      point(x, y);
      
      //Pies
      strokeWeight(alto/80);
      noFill();
      bezier(x-(13*ancho/40),y+(26*alto/36),x-(13*ancho/40),y+(19*alto/40),x-(9*ancho/40),y+(17*alto/40),x-(7*ancho/40),y+(15*alto/40));
      bezier(x+(13*ancho/40),y+(26*alto/36),x+(13*ancho/40),y+(19*alto/40),x+(9*ancho/40),y+(17*alto/40),x+(7*ancho/40),y+(15*alto/40));
      fill(255,125,0);
      noStroke();
      rect(x-(13*ancho/40),y+(115*alto/160),5*ancho/100,8*ancho/100);
      rect(x+(13*ancho/40),y+(115*alto/160),5*ancho/100,8*ancho/100);
      stroke(0);
      
      //Manos
      noFill();
      strokeWeight(alto/80);
      bezier(x-(15*ancho/40), y+(5*alto/40),x-(24*ancho/40),y+(5*alto/40),x-(28*ancho/40),y+(6*alto/40), x-(27*ancho/40), y-(2*alto/40));
      bezier(x+(15*ancho/40), y+(5*alto/40),x+(24*ancho/40),y+(5*alto/40),x+(28*ancho/40),y+(6*alto/40), x+(27*ancho/40), y-(2*alto/40));
      fill(0);
      bezier(x-(19*ancho/40), y+(5*alto/40),x-(20*ancho/40),y+(3*alto/40),x-(22*ancho/40),y+(3*alto/40), x-(23*ancho/40), y+(5*alto/40));
      bezier(x+(19*ancho/40), y+(5*alto/40),x+(20*ancho/40),y+(3*alto/40),x+(22*ancho/40),y+(3*alto/40), x+(23*ancho/40), y+(5*alto/40));
      
      //Puntos Mano
      strokeWeight(alto/12);
      point(x-(27*ancho/40), y-(2*alto/40));
      point(x+(27*ancho/40), y-(2*alto/40));
      
      //Puntos Pies
      stroke(255,125,0);
      strokeWeight(7*alto/120);
      point(x-(13*ancho/40)-(6*ancho/200),y+(29*alto/40));
      point(x+(13*ancho/40)+(6*ancho/200),y+(29*alto/40));
         
      stroke(0);
      strokeWeight(alto/120);  
      
      
}//cd



void disqu1(){
ancho= int(200*escala);
alto= int(200*escala);

  rectMode(CENTER);
  
  //Rectangulo Amarillo
  fill(246,239,146);
  rect(x,y,ancho,alto);
  
  //Rectangulo Azul
  fill(84,124,142);
  rect(x,y+(12*alto/60),ancho-(ancho/6),alto-(24*alto/60),alto/9,alto/9,0,0);
  
  //Rectangulo superior Azul
  fill(84,124,142);
  rect(x,y-(45*alto/120),(44*ancho/60),15*alto/60,0,0,alto/12,alto/12);
  
  //Rectangulo superior Azul Fuerte
  fill(0,42,64);
  rect(x+(68*ancho/960),y-(45*alto/120),(35*ancho/60),15*alto/60,0,0,alto/12,alto/12);
   
  fill(84,124,142);
  rect(x+(18*ancho/100),y-(45*alto/120),(6*ancho/60),14*alto/60);
  
  //Boca
  fill(0);
  beginShape();
  vertex(x-(2*ancho/15)-(9*ancho/100),y+(alto/9)+(7*alto/100));
  bezierVertex(x-(ancho/15)-(9*ancho/100),y+(alto/4)+(7*alto/100),x+(ancho/30)-(9*ancho/100),y+(alto/4)+(7*alto/100), x+(2*ancho/15)-(9*ancho/100), y+(2*alto/9)+(7*alto/100));
  bezierVertex(x+(ancho/15)-(9*ancho/100),y+(2*alto/9)-(alto/6)+(7*alto/100),x-(2*ancho/30)-(9*ancho/100),y+(alto/4)-(12*alto/60)+(7*alto/100), x-(2*ancho/15)-(9*ancho/100), y+(alto/9)+(7*alto/100));
  endShape();
  
  //Ojos Blancos
  fill(255);
  arc(x-(ancho/6), y-(alto/9) , alto/5,alto/5 , -0.3, PI+QUARTER_PI, CHORD);
  arc(x+(ancho/6), y-(alto/9) , alto/5,alto/5 , -QUARTER_PI, PI+0.3, CHORD);
  
  //Cejas
  noFill();
  strokeWeight(alto/80);
  bezier(x-(ancho/4)-(3*ancho/100), y-(9*alto/40),x-(alto/5),y-(alto/6),x-(ancho/16),y-(5*alto/40), x-(ancho/15), y-(6*alto/40));
  bezier(x+(ancho/4)+(3*ancho/100), y-(9*alto/40),x+(alto/5),y-(alto/6),x+(ancho/16),y-(5*alto/40), x+(ancho/15), y-(6*alto/40));
  
  //Puntos Ojos
  stroke(0);
  strokeWeight(alto/10);
  point(x-(ancho/6)+(2*ancho/100), y-(alto/9)+(3*alto/100));
  point(x+(ancho/6)+(2*ancho/100), y-(alto/9)+(3*alto/100));
  
  //Pies
  noFill();
  stroke(0);
  strokeWeight(alto/60);
  line(x-(ancho/5),y+(alto/2),x-(ancho/5),y+(26*alto/36));
  line(x+(ancho/5),y+(alto/2),x+(ancho/5),y+(26*alto/36));
  fill(144,42,64);
  stroke(144,42,64);
  rect(x-(ancho/5)-(1*ancho/200),y+(26*alto/36)-(2*alto/100),4*ancho/100,10*alto/100);
  rect(x+(ancho/5)+(1*ancho/200),y+(26*alto/36)-(2*alto/100),4*ancho/100,10*alto/100);
  stroke(0);
  
  //Manos
  noFill();
  strokeWeight(alto/60);
  bezier(x-(ancho/2), y,x-(ancho/2),y+(alto/16),x-(30*ancho/40),y+(alto/6), x-(31*ancho/40), y-(alto/30));
  bezier(x+(ancho/2), y,x+(ancho/2),y+(alto/16),x+(30*ancho/40),y+(alto/6), x+(31*ancho/40), y-(alto/30));
  
  //Puntos Mano
  strokeWeight(alto/12);
  point(x-(31*ancho/40), y-(alto/30));
  point(x+(31*ancho/40), y-(alto/30));
  
  //Puntos Pies
  strokeWeight(15*alto/200);
  stroke(144,42,64);
  point(x-(ancho/5)-(6*ancho/200),y+(26*alto/36));
  point(x+(ancho/5)+(6*ancho/200),y+(26*alto/36));
 
  stroke(0);
  strokeWeight(alto/200);
  

}//disqu

void usb1(){
        
      ancho= int(45*escala);
      alto= int(90*escala);
      
        rectMode(CENTER);
        
        //Rectangulo rosa
        fill(255,203,185);
        rect(x,y-(7*alto/10),ancho-(2*ancho/10),(alto/2),alto/60);
        
        //Líneas
        stroke(0);
        strokeWeight(alto/120);
        line(x,y-(7*alto/10)-alto/4,x,y-(8*alto/10));
        line(x,y-(8*alto/10),x+(ancho/10),y-(8*alto/10));
        line(x+(ancho/10),y-(8*alto/10),x+(ancho/10),y-(7*alto/10));
        line(x+(ancho/10),y-(7*alto/10),x,y-(7*alto/10));
        line(x,y-(7*alto/10),x,y-(7*alto/10)+alto/4);
        
        //Pies
        fill(66,63,121);
        noStroke();
        rect(x-(ancho/6),y+(16*alto/30),ancho/10,8.5*ancho/20);
        rect(x+(ancho/6),y+(16*alto/30),ancho/10,8.5*ancho/20);
        stroke(0);
       
        //Puntos Pies
        stroke(66,63,121);
        strokeWeight(10*alto/120);
        point(x-(40*ancho/200),y+(18*alto/30));
        point(x+(40*ancho/200),y+(18*alto/30));
        
        stroke(0);
        strokeWeight(alto/120);
        
        //Rectangulo delgado naranja
        fill(239,85,72);
        rect(x,y-(alto/2+alto/30),ancho-(ancho/10),alto/15,alto/60);
        
        //Rectangulo Naranja
        fill(239,156,72);
        rect(x,y,ancho,alto,0,0,10,10);
        
        //Rectangulos Negros
        fill(0);
        rect(x-(ancho/4),y-(22*alto/25),ancho-(12*ancho/15),alto-(19*alto/20));
        rect(x+(ancho/4),y-(22*alto/25),ancho-(12*ancho/15),alto-(19*alto/20));
        
        //Boca
        fill(0);
        beginShape();
        vertex(x-(ancho/8),y+(alto/4));
        bezierVertex(x-(ancho/8),y+(alto/4),x+(ancho/8),y-(alto/9), x+(ancho/3), y+(alto/5));
        vertex(x-(ancho/8),y+(alto/4));
        endShape();
        
        //Ojos Blancos
        fill(255);
        ellipse(x-(ancho/2), y-(alto/6) , alto/4,alto/4);
        ellipse(x+(ancho/2), y-(alto/6) , alto/4,alto/4);
        
        //Ojos Verdes
        noStroke();
        fill(0,144,73);
        ellipse(x-(ancho/2), y-(alto/6) , alto/9,alto/9);
        ellipse(x+(ancho/2), y-(alto/6) , alto/9,alto/9);
        stroke(0);
        
        //Puntos Ojos
        strokeWeight(alto/30);
        point(x-(ancho/2), y-(alto/6));
        point(x+(ancho/2), y-(alto/6));
        
        //Cejas
        noFill();
        strokeWeight(alto/70);
        bezier(x-(ancho/10), y-(alto/4),x-(ancho/5),y-(alto-2*alto/3),x-(2*ancho/4),+y-(alto-alto/2), x-(2*ancho/3), y-(2*alto/5));
        bezier(x+(ancho/10), y-(alto/4),x+(ancho/5),y-(alto-2*alto/3),x+(2*ancho/4),+y-(alto-alto/2), x+(2*ancho/3), y-(2*alto/5));
        
       //Gorro
        stroke(0);
        strokeWeight(alto/120);
        fill(239,156,72);
        rectMode(CORNERS);
        rect(x+(5*ancho/4), y-(2*alto/5),x+(17*ancho/8),y-(6*alto/8),0, ancho/10,ancho/10,0);
       
        //Manos
        noFill();
        strokeWeight(alto/70);
        bezier(x+(ancho/2), y+(alto/15),x+(ancho),y+(alto/16),x+(10*ancho/8),y-(alto/10), x+(5*ancho/4), y-(2*alto/5));
        bezier(x-(ancho/2), y+(alto/15),x-(3*ancho/5),y+(alto/15),x-(ancho),y+(alto/6), x-(ancho), y+(3*alto/7));
        
        //Puntos Mano
        strokeWeight(alto/12);
        point(x+(5*ancho/4), y-(2*alto/5)); //derecha
        point(x-(ancho), y+(3*alto/7));
      
           
        stroke(0);
        strokeWeight(alto/120);
}//usb


  

}//class