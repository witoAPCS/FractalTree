private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  

private double balls1 = 0;
private double balls2 = -balls1;
private double balls3 = balls1;

public void setup() 
{   
  frameRate(240);
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(255);   
  stroke(150,250,150);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  if(branchLength<smallestBranch) return;
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength*=fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);

  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  
   if(branchLength>smallestBranch){
   drawBranches(endX1,endY1,branchLength,angle1+balls1);
   drawBranches(endX2,endY2,branchLength,angle2-balls3+balls2);
   }
} 

void keyTyped(){
 if(key == ' '){
  
  balls1+= PI/81;
  balls3=balls1;
  } 
 if(key == 'a' || key == 'A'){

  balls1+= PI/81;
  balls2 = balls1;
  }  
  if(key == 'r' || key=='R'){
  balls1=0;
  balls2=0;
  balls3=0;
  }

 redraw();
}
