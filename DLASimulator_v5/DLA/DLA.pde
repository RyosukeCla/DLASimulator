/*
 =================================================
 ==== Diffusion Limited Aggregation Simulator ====
 =================================================
 @autor ...... Ryosuke Suzuki - Meiji University, Interdisciplinary Mathematical Sciences, Mathematical Sciences Based on Modeling and Analysis
 @created .... 05/29/2016
 @updated .... 06/06/2016
 @license .... MIT License
 
 @website .... http://ec2-54-213-126-125.us-west-2.compute.amazonaws.com/thegma/
 
 *************************************************
 * You do not have to change or understand this  *
 * codes. Just Run this code. Then you will see  *
 * nice diffusion limited aggregation !!!        *
 *                  ENJOY :D                     *
 *************************************************
 
 VERSION 5 - NEW
 major update
 - fix
   - fix word : precipitation -> deposition
 - optimize
   - optimize collision
   - optimize graphics : while stopping, stable fps - 60
 - add Button
   - generate micro particles
 
 VERSION 4
 minor update
 - fix
   - fix spell : pricipitation -> precipitation
   - fix collision : better collision
   
 VERSION 3
 major update
 - add Menu
   - add menu button : see the left-top, you will see one button. and if you clicked this button, menus will appear!!!
   - add potential difference : effect on movement of particle towords to center position. in experiment of 7th GENSYOJIKKEN, center position is a lead of pencil.
   - add stop button : you can stop movement of particles. enjoy watching fractale!
   - add take picture button : can take a image of dla. and save to D:"/photo/". see this (DLA) folder. then you will find "photo" folder.
   - add regenerate dla button : can regenerate DLA. so you dont have to re-start this anymore!
 - improve graphics
   - add circle of potential difference : red, blue.
 - fix
   - fix collision : better collisions compatible with particle velocity.
 - add algorithms
   - add new paritlces movement : add effect by poteintial difference.
   
 VERSION 2
 major update
 - add Parameters
   - add pricipitation rate : whether particle become cluster or not. in Japanese, "SEKISYUTURITU".
   - add particle velocity
 - improve graphics
   - add max distance circle
 - improve algorithms
   - improve  calculating collisions : space partitioning.
 
*/

import java.util.Iterator;

DLAController dla;
Menu menu;
boolean isStopped;
boolean takePic;

void setup () {

  //fullScreen();
  size (1100, 700);
  isStopped = false;
  takePic = false;
  dla = new DLAController (4.0, 3000, 1.0, 50);
  isStopped = false;
  menu = new Menu ();
  menu.setPosition (20.0, 20.0);
  menu.eGraph.setFunction (new Function () {
    public float function (float x) {
      float result = 0.0;
      float e = menu.eSl.getValue();
      if (e <= 0.0) {
        return 0.5;
      }
      if (x < e) {
        result = x / e / 2.0;
      } else if (x < 1.0 - e){
        result = 0.5;
      } else {
        result = (x - 1.0 + e) / e / 2.0 + 0.5; 
      }
      return result;
    }
  });
  menu.stop.setListener (new Listener () {
    public void action () {
      if (isStopped) {
        isStopped = false;
        menu.stop.setName ("stop");
      } else {
        isStopped = true;
        dla.drawGraphics ();
        menu.stop.setName ("start");
      }
    }
  });
  menu.regene.setListener (new Listener () {
    public void action () {
      dla = new DLAController (4.0, 3000, menu.pSl.getValue(), 50);
      dla.setTimes (menu.vSl.getValue());
      dla.drawGraphics();
    }
  });
  menu.generateMicro.setListener (new Listener () {
    public void action () {
      dla = new DLAController (1.5, 10000, menu.pSl.getValue(), 250);
      dla.setTimes (menu.vSl.getValue());
      dla.drawGraphics();
    }
  });
  menu.pict.setListener (new Listener () {
    public void action () {
      takePic = true;
    }
  });
  float range = menu.eSl.getValue () * 2;
  dla.setEffectRange (range * 250, 500 - range * 250);
  menu.setListener (new Listener () {
    public void action () {
      float ran = menu.eSl.getValue () * 2;
      dla.setEffectRange (ran * 250, 500 - ran * 250);
      dla.setPricipitation (menu.pSl.getValue());
      dla.setTimes (menu.vSl.getValue());
      dla.drawGraphics();
    }
  });
  textSize (8);
  textAlign (CENTER,CENTER);
}

void draw () {
  background (50);
  if (isStopped == false) {
    dla.update ();
    dla.display ();
  } else {
    image (dla.getGraphics(), 0, 0);
  }
  if (takePic == true) {
    background (50);
    fill (255);
    textSize (12);
    textAlign (LEFT, CENTER);
    String info = "Deposition Rate : " + menu.pSl.getValue() + "\n";
    info += "Particle Velocty : " + menu.vSl.getValue() + "x \n";
    text (info, 40, 320);
    dla.display ();
    menu.eGraph.update();
    textAlign (RIGHT, CENTER);
    textSize (10);
    fill (200, 100);
    text ("Created By Ryosuke Suzuki", width - 10, height - 15);
    String fileName = "IMG_" + year() + "y" + month() + "m" + day() + "d" + hour() +"h"+ minute() +"m" + second();
    saveFrame ("photo/"+fileName + ".png");
    background (100, 100);
    takePic = false;
    return;
  }
  menu.update ();
  text (frameRate, 20.0, height - 10.0);
}

void mousePressed () {
  menu.mousePressedListener ();
}

void mouseDragged () {
  menu.mouseDraggedListener ();
  
}