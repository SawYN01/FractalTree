private double fractionLength = .8; 
private int smallestBranch =10; 
private double branchAngle = .2;  
public void setup() 
{   
  size(660,550);    
  noLoop(); 
  background(219,252,255);
} 
public void draw() 
{   
  //stroke(27,80,54);
  line(340,550,340,450);  
  drawBranches(340,450,100,3*Math.PI/2);
} 
public void mouseClicked() {
    redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{ 
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2, endY2);
 
  if(branchLength > smallestBranch) {
    //stroke((int)(Math.random()*100), (int)(Math.random()*100)+150, (int)(Math.random()*50));
    stroke((int)(Math.random()*30), (int)(Math.random()*256), (int)(Math.random()*150));
    drawBranches(endX1,endY1,branchLength+1,angle1+PI/15);
    drawBranches(endX2,endY2,branchLength+1,angle2-PI/15);
  }
}
