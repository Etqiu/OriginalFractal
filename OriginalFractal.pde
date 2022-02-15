public ArrayList <Integer> folds = new ArrayList <Integer> ();
public int len = 20; //length of lines
int increaser = 10;
float y = 700;
float colors = 0;
float rotation =0;
int button = 255;
int button3=255;
String tempFolds = regularPaperFold(15);
float startingX = 500; 
boolean buttonPressed = false;
int button2 = 255;
float startingY = 500; //Change starting position - Recommended: As change number of folds, change starting position and length in Tweak mode to adjust
public void setup() {
  size(1000, 1000);
  background(255);
  colorMode(HSB);
  //Change for more folds in arrayList
  for (int i = 0; i < tempFolds.length(); i++) {
    folds.add(parseInt(tempFolds.substring(i, i+1)));
  }
}

void draw() {
  
  background(255);
  stroke(y/2.8, 255, 255);

  strokeWeight(3);

  line(startingX, startingY + len, startingX, startingY); //This is just the first line
  
  dragon(startingX, startingY, folds, 0, 270);
 
  //ugly code for HUD
  
  fill(y/2.8, 255, 255);
  strokeWeight(2.5);
  stroke(0);
  rect(900, 250, 50, 500, 50); //big slider
  stroke(255);
  rect(900, y, 50, 50, 17); //slider button
 stroke(button);
  rect(850, 150, 125,50,17); 
  stroke(button2);
 rect(925,800,50,50,10); //button for +
 stroke(button3);
 rect(865,800,50,50,10); //button for -
 stroke(255);
  line(950,810,950,840);
  line(935,825,965,825);
  line(875,825,905,825);
  //System.out.println(y/2.8);

  fill(0);
  textSize(30);
  text("Number of Lines: " + increaser, 600, 100);
  text("Max Number of Lines: " + tempFolds.length(), 100, 100);
  textSize(10);
  fill(255);
   text("Don't Click. ", 887,180);
   
  //buttons glow up here
  
if(mouseX>=850 &&mouseY>=150&&mouseX<=975 &&mouseY<=200){button = 0;}else{button = 255;} //don't click!!
if(mouseX>=925 && mouseY>=800 && mouseX<=975 && mouseY<=850){button2 = 0;}else{button2 =255;} //++
if(mouseX>=865 && mouseY>800&&mouseX<=915&&mouseY<850){button3 = 0;} else{button3=255;} //--

if(buttonPressed == true){
  increaser++;
}

  if (y<=260)
    y=260;
  if (y>=690)
    y=690;
    
}
public void dragon(float startX, float startY, ArrayList<Integer> fold, int count, int ang) {
  strokeWeight(3);

  if (count == increaser) { //Change for number of folds shown
    if (fold.get(count) == 0){
      
      line(startX, startY, startX + (float)(len*Math.cos((ang - 90) * PI/180)), startY + (float)(len*Math.sin((ang - 90) * PI/180)));//Equal to having endX and endY
    }
    else{
     
      line(startX, startY, startX + (float)(len*Math.cos((ang + 90) * PI/180)), startY + (float)(len*Math.sin((ang + 90) * PI/180)));
    }
  } else {
    if (fold.get(count) == 0) {
      rotate(radians(rotation));
      float endX = startX + (float)(len*Math.cos((ang - 90) * PI/180));
      float endY = startY + (float)(len*Math.sin((ang - 90) * PI/180));
      line(startX, startY, endX, endY);
      dragon(endX, endY, fold, count+1, (ang - 90));
    } else {
      float endX = startX + (float)(len*Math.cos((ang + 90) * PI/180));
      float endY = startY + (float)(len*Math.sin((ang + 90) * PI/180));
      rotate(radians(rotation));
      line(startX, startY, endX, endY);
      dragon(endX, endY, fold, count+1, (ang + 90));
    }
  }
}

public String regularPaperFold(int numFolds) { //The following are just to get the paperfold sequence, it's just from codingBat
  if (numFolds == 1)
    return "1";
  return regularPaperFold(numFolds-1) + "1" + reverse(onesComplement(regularPaperFold(numFolds-1)));
}

public String onesComplement(String s) {
  String ans = new String();
  for (int i = 0; i < s.length(); i++)
    if (s.charAt(i) == '0')
      ans+="1";
    else
      ans+="0";
  return ans;
}

public String reverse(String sWord) {
  String ans = "";
  for (int i = sWord.length()-1; i >= 0; i--)
    ans+=sWord.charAt(i);
  return ans;
}
void mouseWheel() {
  increaser+=5;
}
void mousePressed() {
  if(mouseX>=925 && mouseY>=800 && mouseX<=975 && mouseY<=850){
    len+=2;
  }
  if(mouseX>=865 && mouseY>800&&mouseX<=915&&mouseY<850){
    len-=2;
  }
  
  if(mouseX>=850 &&mouseY>=150&&mouseX<=975 &&mouseY<=200){
    buttonPressed =!buttonPressed;
  }
}
void mouseDragged() {
  if (mouseX >= 900 && mouseY >= y && mouseX<=950 && mouseY<y+50) {
    y=mouseY-25;
  }
   if( mouseX>=800){
  }
  else{
  startingY=mouseY;
  startingX=mouseX;
  }
}
void keyPressed() {
  if (key == 'r' || key == 'R') {
   rotation +=90;
  }
}
