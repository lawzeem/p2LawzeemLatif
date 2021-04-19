import controlP5.*;
import processing.sound.*;

ControlP5 cp5;

int speed = 0;
int rpm = 0;
int fuel = 0;
int outTemp = 0;
int engTemp = 0;
int odom = 0;

Textlabel speedLabel;
Textlabel rpmLabel;
Textlabel fuelLabel;
Textlabel outTempLabel;
Textlabel engTempLabel;
Textlabel odomLabel;
Textlabel gearLabel;

String CurGear = "P";

boolean showLeft = false;
boolean showRight = false;
boolean showCruise = false;
boolean showBelt = false;
boolean showOil = false;
boolean showTire = false;
boolean showEng = false;
boolean showTracCon = false;
boolean showTracMal = false;
boolean showABS = false;
boolean showCheckEng = false;
boolean showBatt = false;
boolean showAirbag = false;
boolean showASL = false;
boolean showFog = false;
boolean showFuel = false;
boolean showSecurity = false;
boolean showWasher = false;

PImage leftArrow;
PImage rightArrow;
PImage cruise;
PImage belt;
PImage oilPres;
PImage tirePres;
PImage picEngTemp;
PImage tracCon;
PImage tracMal;
PImage ABS;
PImage checkEng;
PImage battery;
PImage airbag;
PImage autoshiftlock;
PImage fog;
PImage picFuel;
PImage picSecurity;
PImage picWasher;

Knob speedKnob;
Knob rpmKnob;
Slider fuelSlide;

void setup(){
  cp5 = new ControlP5(this);
    size(1000, 800);
  
  PFont speedFont = createFont("arial", 40);
  PFont gearFont = createFont("arial", 40);
  PFont miniFont = createFont("arial", 20);
  
  
  speedKnob = cp5.addKnob("MPH").setRange(0,255).setValue(speed).setPosition(350, 100).setRadius(150).setDragDirection(Knob.VERTICAL).setFont(speedFont);
  rpmKnob = cp5.addKnob("RPM").setRange(0,9).setValue(rpm).setPosition(800, 15).setRadius(80).setDragDirection(Knob.VERTICAL).setFont(miniFont);
  fuelSlide = cp5.addSlider("  ").setPosition(900, 200).setSize(100, 150).setRange(0, 100).setValue(fuel);

  cp5.addTextfield("Input Speed").setPosition(0, 500);
  cp5.addTextfield("Input RPM").setPosition(0, 550);
  cp5.addTextfield("Input Fuel").setPosition(0, 600);
  cp5.addTextfield("Input Outside Temp").setPosition(0, 650);
  cp5.addTextfield("Input Engine Temp").setPosition(0, 700);
  cp5.addTextfield("Input Odometer").setPosition(0, 750);
  
  //speedLabel = cp5.addTextlabel("Speed").setText(String.valueOf(speed)).setPosition(475, 200).setFont(speedFont);
  //rpmLabel = cp5.addTextlabel("RPM").setText(String.valueOf(rpm)).setPosition(875, 100).setFont(gearFont);
  fuelLabel = cp5.addTextlabel("Fuel").setText(String.valueOf(fuel)+" L").setPosition(790, 250).setFont(gearFont);
  outTempLabel = cp5.addTextlabel("OutTemp").setText("Outside : "+String.valueOf(outTemp)+" F").setPosition(450, 15).setFont(miniFont);
  engTempLabel = cp5.addTextlabel("EngTemp").setText("Engine : "+String.valueOf(engTemp)+" F").setPosition(450, 50).setFont(miniFont);
  odomLabel = cp5.addTextlabel("Odometer").setText(String.valueOf(odom)+" Miles").setPosition(500, 450).setFont(miniFont);
  
  gearLabel = cp5.addTextlabel("Gear").setText(CurGear).setPosition(150, 280).setFont(gearFont);
  //rect(0,500,50,50);
  //fill(0,0,256);
  cp5.addButton("Left").setValue(1).setPosition(300, 500);
  cp5.addButton("Right").setValue(2).setPosition(400, 500);
  cp5.addButton("Hazard").setValue(3).setPosition(500, 500);
  cp5.addButton("Cruise Control").setPosition(600, 500);
  cp5.addButton("Auto Shift Lock").setValue(5).setPosition(300, 550);
  cp5.addButton("Oil Pressure").setValue(6).setPosition(400, 550);
  cp5.addButton("Tire Pressure").setValue(7).setPosition(500, 550);
  cp5.addButton("Engine Temp").setValue(8).setPosition(600, 550);
  cp5.addButton("Traction Control").setValue(9).setPosition(300, 600);
  cp5.addButton("ABS").setValue(10).setPosition(400, 600);
  cp5.addButton("Traction Malfunction").setValue(11).setPosition(500, 600);
  cp5.addButton("Check Engine").setValue(12).setPosition(600, 600);
  cp5.addButton("Battery Alert").setValue(13).setPosition(300, 650);
  cp5.addButton("Low Fuel").setValue(14).setPosition(400, 650);
  cp5.addButton("Seat belt").setValue(15).setPosition(500, 650);
  cp5.addButton("Airbag").setValue(16).setPosition(600, 650);
  cp5.addButton("Security").setValue(17).setPosition(300, 700);
  cp5.addButton("Fog Lamp").setValue(18).setPosition(400, 700);
  cp5.addButton("Washer Fluid").setValue(19).setPosition(500, 700);
  //cp5.addButton("Washer Fluid").setValue(20).setPosition(600, 700);
  
  cp5.addButton("Park").setPosition(800, 500);
  cp5.addButton("Reverse").setPosition(800, 550);
  cp5.addButton("Neutral").setPosition(800, 600);
  cp5.addButton("Drive").setPosition(800, 650);
  
  cruise = loadImage("cruise.png");
  belt = loadImage("seatbelt.jpg");
  oilPres = loadImage("Oil-Pressure.jpg");
  tirePres = loadImage("Tire-Pressure.jpg");
  picEngTemp = loadImage("Engine-Temperature.jpg");
  tracCon = loadImage("Traction-Control.jpg");
  tracMal = loadImage("traction-malfunction.jpg");
  ABS = loadImage("ABS.jpg");
  checkEng = loadImage("Engine-Warning.jpg");
  battery = loadImage("battery-alert.jpg");
  airbag = loadImage("airbag.jpg");
  autoshiftlock = loadImage("auto-shift-lock.jpg");
  picEngTemp = loadImage("Engine-Temperature.jpg");
  fog = loadImage("fog.jpg");
  picFuel = loadImage("fuel.jpg");
  picSecurity = loadImage("security.jpg");
  picWasher = loadImage("Washer.jpg");
  
  leftArrow = loadImage("Left.png");
  rightArrow = loadImage("Right.png");
  
}
void draw(){
  background(0,0,0);
  fill(0,0,0);
  rect(250,0,500,500);
  fill(0,0,0);
  rect(0,0,250,200);
  fill(0,0,0);
  rect(0,250,250,100);
  fill(0,0,0);
  rect(750,0,250,200);
  fill(0,0,0);
  rect(750,200,250,200);
  fill(25,30,10);
  rect(0,500,1000,300);
  //fill(256,256,256);
  text(cp5.get(Textfield.class,"Input Speed").getText(), 360,130);
  if(!showCruise){
    image(cruise, 50, 50);
  }
  if(showOil){
    image(oilPres, 100, 50);
  }
  if(showTire){
    image(tirePres, 150, 50);
  }
  if(showTracCon){
    image(tracCon, 200, 50);
  }
  if(showTracMal){
    image(tracMal, 50, 150);
  }
  if(showBelt){
    image(belt, 100, 150);
  }
  if(showABS){
    image(ABS, 150, 150);
  }
  if(showCheckEng){
    image(checkEng, 200, 150);
  }
  if(showBatt){
    image(battery, 750, 350);
  }
  if(showAirbag){
    image(airbag, 800, 350);
  }
   if(showASL){
    image(autoshiftlock, 850, 350);
  }
  if(showEng){
    image(picEngTemp, 900, 350);
  }
  if(showFog){
    image(fog, 50, 350);
  }
  if(showFuel){
    image(picFuel, 100, 350);
  }
  if(showSecurity){
    image(picSecurity, 150, 350);
  }
  if(showWasher){
    image(picWasher, 200, 350);
  }
  if(showLeft){
    image(leftArrow, 150, 430);
  }
  if(showRight){
    image(rightArrow, 800, 430);
  }
}
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    
    println("controlEvent: accessing a string from controller '"+theEvent.getName()+"': "+theEvent.getStringValue());
    
    if(theEvent.getName() == "Input Speed"){
      //speedLabel.setText(theEvent.getStringValue());
      speedKnob.setValue(Integer.parseInt(theEvent.getStringValue()));
    }else if(theEvent.getName() == "Input RPM"){
      //rpmLabel.setText(theEvent.getStringValue());
      rpmKnob.setValue(Integer.parseInt(theEvent.getStringValue()));
    }else if(theEvent.getName() == "Input Fuel"){
      fuelLabel.setText(theEvent.getStringValue()+" L");
      fuelSlide.setValue(Integer.parseInt(theEvent.getStringValue()));
    }else if(theEvent.getName() == "Input Outside Temp"){
      outTempLabel.setText("Outside : "+theEvent.getStringValue()+" F");
    }else if(theEvent.getName() == "Input Engine Temp"){
      engTempLabel.setText("Engine : "+theEvent.getStringValue()+" F");
    }else{
      odomLabel.setText(theEvent.getStringValue()+" Miles");
    } 
    
  }
  if(theEvent.isController()) {
    if(theEvent.getName() == "Left"){
     println("Left");
     showLeft = !showLeft;
    }
    if(theEvent.getName() == "Right"){
     println("Right");
     showRight = !showRight;
    }
    if(theEvent.getName() == "Hazard"){
     println("Hazard");
     showLeft = showRight = !showLeft;
    }
    if(theEvent.getName() == "Cruise Control"){
     println("Show Cruise");
     showCruise = !showCruise;
    }if(theEvent.getName() == "Oil Pressure"){
     println("Oil Pressure");
     showOil = !showOil;
    }if(theEvent.getName() == "Tire Pressure"){
     println("Show Tire");
     showTire = !showTire;
    }if(theEvent.getName() == "Engine Temp"){
     println("Show Eng");
     showEng = !showEng;
    }if(theEvent.getName() == "Traction Control"){
     println("Show TracCon");
     showTracCon = !showTracCon;
    }if(theEvent.getName() == "ABS"){
     println("Show ABS");
     showABS = !showABS;
    }if(theEvent.getName() == "Traction Malfunction"){
     println("Show TracMal");
     showTracMal = !showTracMal;
    }if(theEvent.getName() == "Check Engine"){
     println("Show CheckEng");
     showCheckEng = !showCheckEng;
    }if(theEvent.getName() == "Battery Alert"){
     println("Show Batt");
     showBatt = !showBatt;
    }if(theEvent.getName() == "Airbag"){
     println("Show Airbag");
     showAirbag = !showAirbag;
    }if(theEvent.getName() == "Auto Shift Lock"){
     println("Show ASL");
     showASL = !showASL;
    }if(theEvent.getName() == "Fog Lamp"){
     println("Show Fog");
     showFog = !showFog;
    }if(theEvent.getName() == "Washer Fluid"){
     println("Show Washer");
     showWasher = !showWasher;
    }if(theEvent.getName() == "Security"){
     println("Show Security");
     showSecurity = !showSecurity;
    }if(theEvent.getName() == "Seat belt"){
     println("Show belt");
     showBelt = !showBelt;
    }if(theEvent.getName() == "Low Fuel"){
     println("Show fuel");
     showFuel = !showFuel;
    }if(theEvent.getName() == "Park"){
     println("Park");
     gearLabel.setText("P");
    }if(theEvent.getName() == "Reverse"){
     println("Reverse");
     gearLabel.setText("R");
    }if(theEvent.getName() == "Neutral"){
     println("Neutral");
     gearLabel.setText("N");
    }if(theEvent.getName() == "Drive"){
     println("Drive");
     gearLabel.setText("D");
    }else{
      println("Nothing");
    }
  }
}
