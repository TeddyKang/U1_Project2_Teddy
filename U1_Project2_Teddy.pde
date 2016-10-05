int x = 119;
float Ypos = 0;

float[] yaxis1;
float[] yaxis2;

void setup()
{
  fullScreen();
  background(0);
  frameRate(10000);
  
  yaxis1 = new float[100];
  yaxis2 = new float[100];
}

void draw()
{
  stroke(255);
  fill(0,255,17);
  rect(width/2 - 550, height/2 + 150, 400, 170);//buy button
  
  fill(255,0,0);
  rect(width/2 - 100, height/2 + 150, 400, 170);//sell button
  
  textSize(180);//buy & sell
  fill(255);
  text("BUY", width/2 - 525, height/2 + 300);
  text("SELL", width/2 - 92, height/2 + 300);


  textSize(80);//total amount of $
  fill(255,223,0);
  text("$300", 1014, 593);
  
  textSize(10);//current value of graph
  fill(255);
  text("$1", 91, 478);
  text("15,000", 68, 265);
  text("$30,000", 61, 54);
  
  stroke(255);
  line(119, 45, 119, 490);//graphline height
  line(119, 490, 1232, 490);//graphline width
  
  for(int i = 0; i < 100; i+=1)
  {
    yaxis1[i] = i*10 + 50;
    line(104, yaxis1[i], 119, yaxis1[i]);
    line(104, 475 - i*10, 119, 475 - i*10);
  }
  for(int i = 0; i < 100; i+=1)
  {
    yaxis2[i] = i*10 + 45.5;
    line(106, yaxis2[i], 119, yaxis2[i]);
    line(106, 470.5 - i*10, 119, 470.5 - i*10);
  }
  fill(0);
  stroke(0);
  rect(0, 0, 120, 42);
  rect(0, 490, 119, 300);
  noStroke();
  noFill();
  
  line(104, 260, 119, 260);//middle line
  line(104, 50, 119, 50);
  line(104, 475, 119, 475);

  print("x:"); 
  println(mouseX);

 print("y:"); 
 println(mouseY); 

    linegraph();
}

void linegraph()
{
 
  if(x >= 1233)
  {
    fill(0);
    stroke(0);
    rect(119, 0, 1246, 530);
    noFill();
    x %= width;
    x += 124;
  }
  
  translate(5, height/2 + 10);
  x++;
  x %= width;
  
  float changerate = Ypos + random(-10, 10);
  
  if(changerate >= 105)
  {
    changerate = Ypos - 2;
  }
  
  stroke(100,255,100);
  line(x-1,Ypos, x,changerate);
  Ypos = changerate;
  
  if(Ypos > height/2)
  {
   Ypos = height/2;
  }
  if(Ypos < -height/2)
  {
   Ypos = -height/2; 
  }
  
}

void mousePressed()
{
  if((mouseX >= width/2 - 550)&&(mouseX <= width/2 - 150)&&(mouseY >= height/2 + 150)&&(mouseY <= height/2 + 320))
    {
      fill(0,255,0);
      ellipse1();
    }
    
    if((mouseX >= width/2 - 100)&&(mouseX <= width/2 + 300)&&(mouseY >= height/2 + 150)&&(mouseY <= height/2 + 320))
    { 
      stroke(255,0,0);
      fill(255,0,0);
      ellipse2();
    }
}

void ellipse1()
{
  for(int i=0; i < 100; i++)
  {
    yaxis1[i] = Ypos + random(-10,10);
    ellipse(x, yaxis1[i], 1, 1);
  }
}

void ellipse2()
{
  for(int i=0; i < 100; i++)
  {
   yaxis2[i] = Ypos + random(-10,10);
   ellipse(x, yaxis2[i], 1, 1);
  }
}