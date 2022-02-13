public ArrayList <Integer> folds = new ArrayList <Integer> ();
public int len = 20; //length of lines
int x = 10;
int y = 0;
void setup() {
  size(1000, 1000);
  background(255);
  String tempFolds = regularPaperFold(15); //Change for more folds in arrayList
  for(int i = 0; i < tempFolds.length(); i++) {
    folds.add(Integer.parseInt(tempFolds.substring(i, i+1)));
  }
  
  System.out.println(folds.size()); //Checks maximum number of folds
}

void draw() {
  
  background(255);
  int startingX = 266; int startingY = 576; //Change starting position - Recommended: As change number of folds, change starting position and length in Tweak mode to adjust
  strokeWeight(3);
  stroke(0);
  
  line(startingX, startingY + len, startingX, startingY); //This is just the first line 😉
  dragon(startingX, startingY, folds, 0, 270);
 x+=1;
 
}
public void dragon(float startX, float startY, ArrayList<Integer> fold, int count, int ang) {
  strokeWeight(3);
  stroke(0);
  if(count == x) { //Change for number of folds shown
    if(fold.get(count) == 0) 
      line(startX, startY, startX + (float)(len*Math.cos((ang - 90) * PI/180)), startY + (float)(len*Math.sin((ang - 90) * PI/180))); //Equal to having endX and endY
    else
      line(startX, startY, startX + (float)(len*Math.cos((ang + 90) * PI/180)), startY + (float)(len*Math.sin((ang + 90) * PI/180)));
  }
  else {
    if(fold.get(count) == 0) {
      float endX = startX + (float)(len*Math.cos((ang - 90) * PI/180));
      float endY = startY + (float)(len*Math.sin((ang - 90) * PI/180));
      line(startX, startY, endX, endY);
      dragon(endX, endY, fold, count+1, (ang - 90));
    }
    else {
      float endX = startX + (float)(len*Math.cos((ang + 90) * PI/180));
      float endY = startY + (float)(len*Math.sin((ang + 90) * PI/180));
      line(startX, startY, endX, endY);
      dragon(endX, endY, fold, count+1, (ang + 90));
    }
  }
}

public String regularPaperFold(int numFolds) { //The following are just to get the paperfold sequence, it's just from codingBat
  if(numFolds == 1)
    return "1";
  return regularPaperFold(numFolds-1) + "1" + reverse(onesComplement(regularPaperFold(numFolds-1)));
}

public String onesComplement(String s){
  String ans = new String();
  for(int i = 0; i < s.length(); i++)
    if(s.charAt(i) == '0')
      ans+="1";
    else
      ans+="0";
  return ans;
}

public String reverse(String sWord){
  String ans = "";
  for(int i = sWord.length()-1; i >= 0; i--)
    ans+=sWord.charAt(i);
  return ans;
}
void mouseWheel(){
  x+=5;
}
void mousePressed(){
  if(mouseButton == LEFT){
  len-=2;
  }
  else{
    len+=2;
  }
}
