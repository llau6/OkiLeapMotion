import arb.soundcipher.*;
import arb.soundcipher.constants.*;

import de.voidplus.leapmotion.*;

// ======================================================
// Table of Contents:
// ├─ 1. Callbacks
// ├─ 2. Hand
// ├─ 3. Arms
// ├─ 4. Fingers
// ├─ 5. Bones
// ├─ 6. Tools
// └─ 7. Devices
// ======================================================


LeapMotion leap;

/////////////////PIANO///////////////////
SoundCipher sc;
boolean[] keysNotePlay;
int[] keysNoteMap;

void keyPressed()
{
  sc.playNote(key - 40, 100, 0.5);
}
/////////////END PIANO///////////////////

int maxRegionCount = 64;
//playKeyay of rects
pts[] R = new pts[maxRegionCount];
int numKeys=14;
pts P = new pts();
boolean[] playKey = new boolean[127*2*2*2*2*2*2*2];
boolean[] isLeftHand = new boolean[127*2*2*2*2*2*2*2];
int[] time = new int[196];
int pitch;

void setup() {
  size(500, 500);
  background(255);
  for (int i = 0; i < 64; i++) {
  playKey[i] = false;
}
  // ...
  //for (int i=0; i<numKeys; i++) {
    //P.add(new pt((width/numKeys)*i,(height/4)));
    //P.add(new pt((width/numKeys)*2*i,(height/4)));
    //P.add(new pt((width/numKeys)*2*i,(height/4)*3));
    //P.add(new pt((width/numKeys)*i,(height/4)*3));
    //R[0] = P;  
//  }
    
/////////////PIANO SETUP//////////////////
  sc = new SoundCipher(this);
  keysNotePlay = new boolean[127];
  keysNoteMap = new int[127];
  keysNoteMap['a'] = 59;
  keysNoteMap['s'] = 60;
  keysNoteMap['d'] = 62;
  keysNoteMap['f'] = 64;
  keysNoteMap['g'] = 65;
  keysNoteMap['h'] = 67;
  keysNoteMap['j'] = 69;
  keysNoteMap['w'] = 61;
  keysNoteMap['e'] = 63;
  keysNoteMap['t'] = 66;
  keysNoteMap['y'] = 68;
  keysNoteMap['u'] = 70;
////////////END PIANO SETUP/////////////////
  leap = new LeapMotion(this);
}

// ======================================================
// 1. Callbacks

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

void keyReleased(){
  keysNotePlay[key] = false;
}

void draw() {
  background(255);
  // ...
  //shape
  //points in the shape
  //iterate through shape's points
  //stroke(color(0,0,0));
  //fill(color(255,255,255));
  //for (int j=0; j<numKeys; j++) {
  //  for (int i=0; i < R[0].num; i++) {
  //    beginShape();
  //    vertex(R[0].P[i].pos.x, R[0].P[i].pos.y);
  //    endShape(CLOSE);
  //  }
  //}
////////////////PIANO KEYS//////////////////
  fill(255);
  if( keyPressed && keysNotePlay['a'] == true){
    fill(204);
  }
  rect (10, 10, 30, 100);
    
  fill(255);
    if( keyPressed && keysNotePlay['s'] == true){
    fill(204);
  }
  rect (40, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['d'] == true){
    fill(204);
  }
  rect (70, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['f'] == true){
    fill(204);
  }
  rect (100, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['g'] == true){
    fill(204);
  }
  
  rect (130, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['h'] == true){
    fill(204);
  }
  
  rect (160, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['j'] == true){
    fill(204);
  }
  
  rect (190, 10, 30, 100);

  //ireng
  fill(0);
  if( keyPressed && keysNotePlay['w'] == true){
    fill(204);
  }
  rect (32,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['e'] == true){
    fill(204);
  }
  rect (62,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['t'] == true){
    fill(204);
  }
  rect (122,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['y'] == true){
    fill(204);
  }
  rect (152,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['u'] == true){
    fill(204);
  }
    rect (182,10,15,60);
  if( keyPressed && keysNotePlay[key] == false){
    sc.playNote(keysNoteMap[key], 100, 1);
    println(keysNoteMap[key]);
    keysNotePlay[key] = true; 
  }
/////////////END PIANO KEYS////////////////////
  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands ()) {


    // ==================================================
    // 2. Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();

    // --------------------------------------------------
    // Drawing
    hand.draw();


    // ==================================================
    // 3. Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();
    }


    // ==================================================
    // 4. Finger

    Finger  fingerThumb        = hand.getThumb();
    // or                        hand.getFinger("thumb");
    // or                        hand.getFinger(0);

    Finger  fingerIndex        = hand.getIndexFinger();
    // or                        hand.getFinger("index");
    // or                        hand.getFinger(1);

    Finger  fingerMiddle       = hand.getMiddleFinger();
    // or                        hand.getFinger("middle");
    // or                        hand.getFinger(2);

    Finger  fingerRing         = hand.getRingFinger();
    // or                        hand.getFinger("ring");
    // or                        hand.getFinger(3);

    Finger  fingerPink         = hand.getPinkyFinger();
    // or                        hand.getFinger("pinky");
    // or                        hand.getFinger(4);
  pushMatrix();
  //translate(hand.getPosition().x, hand.getPosition().y, hand.getPosition().z);
  stroke(color(0,0,0));
    for (int i=0; i<numKeys; i++) {
      for (int j=0; j<numKeys; j++) {
        if (playKey[j*numKeys+i]) {
          fill(color(0,100,255, 255));
          
          //notes, 2 octaves, middle c onward
          if (i%14 == 0) {
            //middle C
            pitch = 60;
          } else if (i%14 == 1) {
            //D
            pitch = 62;
          } else if (i%14 == 2) {
            //E
            pitch = 64;
          } else if (i%14 == 3) {
            //F
            pitch=65;
          } else if (i%14 == 4) {
            //G
            pitch=67;
          } else if (i%14 == 5) {
            //A
            pitch=69;
          } else if (i%14 == 6) {
            //B
            pitch=71;
          } else if (i%14 == 7) {
            //High C
            pitch=72;
          } else if (i%14 == 8) {
            //High D
            pitch=74;
          } else if (i%14 == 9) {
            //High E
            pitch=76;
          } else if (i%14 == 10) {
            //High F
            pitch=77;
          } else if (i%14 == 11) {
            //High G
            pitch=79;
          } else if (i%14 == 12) {
            //High A
            pitch=81;
          } else if (i%14 == 13) {
            //High B
            pitch=83;
        }
        //if it is in the upper third, make it sharp
        if (j<(numKeys/3)) {
          pitch++;
          println("sharp");
        //if in the lower third, make it flat
        } else if (j>(2*(numKeys/3))) {
          pitch--;
          println("flat");
        } else {
          println("neutral");
        }
        //lower left hand pitch by one octave
        if (isLeftHand[j*numKeys+i] == true) {
          pitch = pitch - 24;
        }
        if (time[j*numKeys+i] > 100) {
          sc.playNote(pitch, 100, 1);
          time[j*numKeys+i] = 0;
        }
          playKey[j*numKeys+i] = false;
          isLeftHand[j*numKeys+i] = false;
        } else {
          noFill();
        }
        rect(i*(width/numKeys), j*(height/numKeys), width/numKeys, height/numKeys);
      }
  }
  popMatrix();
  
    for (int i = 0; i < time.length; i++) {
      time[i]++;
    }
    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();
      
    text("x: " + finger.getPositionOfJointTip().x 
      + " y: " +  finger.getPositionOfJointTip().y 
      + " z: " + finger.getPositionOfJointTip().z, 
      finger.getPositionOfJointTip().x, finger.getPositionOfJointTip().y);
      
      //println("y pos: " + finger.getPositionOfJointTip().y);
      //println("width: " + width);
      //println("width/numKeys: " + width/numKeys);
      //println("x pos: " + finger.getPositionOfJointTip().x);
      //println("total: " + floor(finger.getPositionOfJointTip().y/(width/numKeys))*numKeys
      //  + floor(finger.getPositionOfJointTip().x/(height/numKeys)));
      
      playKey[abs(floor(finger.getPositionOfJointTip().y/(width/numKeys)))*numKeys
        + abs(floor(finger.getPositionOfJointTip().x/(height/numKeys)))] = true;
      if (hand.isLeft()) {
        isLeftHand[abs(floor(finger.getPositionOfJointTip().y/(width/numKeys)))*numKeys
        + abs(floor(finger.getPositionOfJointTip().x/(height/numKeys)))] = true;
      }
      // ------------------------------------------------
      // Drawing

      // Drawing:
      // finger.draw();  // Executes drawBones() and drawJoints()
      // finger.drawBones();
      // finger.drawJoints();

      // ------------------------------------------------
      // Selection

      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        break;
      case 1:
        // System.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }


      // ================================================
      // 5. Bones
      // --------
      // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1

      Bone    boneDistal       = finger.getDistalBone();
      // or                      finger.get("distal");
      // or                      finger.getBone(0);

      Bone    boneIntermediate = finger.getIntermediateBone();
      // or                      finger.get("intermediate");
      // or                      finger.getBone(1);

      Bone    boneProximal     = finger.getProximalBone();
      // or                      finger.get("proximal");
      // or                      finger.getBone(2);

      Bone    boneMetacarpal   = finger.getMetacarpalBone();
      // or                      finger.get("metacarpal");
      // or                      finger.getBone(3);

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = finger.getTouchZone();
      float   touchDistance    = finger.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + fingerId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + fingerId + ")");
        break;
      }
    }


    // ==================================================
    // 6. Tools

    for (Tool tool : hand.getTools()) {
      int     toolId           = tool.getId();
      PVector toolPosition     = tool.getPosition();
      PVector toolStabilized   = tool.getStabilizedPosition();
      PVector toolVelocity     = tool.getVelocity();
      PVector toolDirection    = tool.getDirection();
      float   toolTime         = tool.getTimeVisible();

      // ------------------------------------------------
      // Drawing:
      // tool.draw();

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = tool.getTouchZone();
      float   touchDistance    = tool.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + toolId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + toolId + ")");
        break;
      }
    }
  }


  // ====================================================
  // 7. Devices

  for (Device device : leap.getDevices()) {
    float deviceHorizontalViewAngle = device.getHorizontalViewAngle();
    float deviceVericalViewAngle = device.getVerticalViewAngle();
    float deviceRange = device.getRange();
  }
}