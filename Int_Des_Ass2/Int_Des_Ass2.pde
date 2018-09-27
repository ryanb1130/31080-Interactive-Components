/***************CODE STARTS HERE***************/
import beads.*;

// ====== GLOBAL VARIABLES ===== //
//KELVIN LUONG
int[] scores = { 30, 30, 45, 35, 60, 38, 55, 67 };

// RYAN BARRAGA
AudioContext ac;
Gain g;
boolean onSector;

void setup() {
  background(#50B0F7);
  size(640, 600);
  noLoop();
  initialize();
}

void initialize() {
  ac = new AudioContext();
  onSector = false;
}

void draw() {
  lineGraph(); //THOMAS NGUYEN
  //pieChart(350, scores);
}

/*
STUDENT NAME: KELVIN LUONG
 STUDENT ID: 13035946
 COMPONENT: PIE GRAPH
 REFERENCES:
 1. Processing 2018, Pie Chart, 18 September 2018, <https://processing.org/examples/piechart.html>.
 2. Processing 2018, map(), 20 September 2018, <https://processing.org/reference/map_.html>.
 */
void pieChart(float diameter, int[] scores) {
  float lastAngle = 0;
  for (int i = 0; i < scores.length; i++) {
    float colour = map(i, 0, scores.length, 50, 255);
    fill(colour);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(scores[i]));
    lastAngle += radians(scores[i]);
  }
  textSize(15);
  text("Southampton", 293, 445);
  text("Newcastle United", 360, 318);
  text("Burnley", 390, 395);
  fill(0);
  text("Chelsea", 190, 320);
  text("Manchester United", 345, 270);
  text("Arsenal", 190, 230);
  text("Liverpool", 275, 190);
  text("Watford", 215, 420);
  textSize(15);
  text("Hover your mouse over a sector in the pie graph to view detailed statistics", 50, 550);
  textSize(26);
  text("Premier League 2018", 190, 80);
}
/***************CODE ENDS HERE***************/

/***************CODE STARTS HERE***************/
/*
STUDENT NAME: THOMAS NGUYEN
 STUDENT ID: 12613749 
 COMPONENT: LINE GRAPH
 REFERENCES: 
 1. Processing Forum 2018, Array: line graph, 22nd September 2018, <https://forum.processing.org/one/topic/array-line-graph.html>.
 */
void lineGraph() {

  rect(97,170,400,350);
  float[] seasonPos1 = {1, 8, 3, 2, 4};
  stroke(255, 0, 0);
  strokeWeight(2);
  float lineWidth = (float) width/2/(seasonPos1.length-1);
  
  for (int i=0; i<seasonPos1.length-1; i++) {
    line(i*lineWidth+100, 50*seasonPos1[i]+120, (i+1)*lineWidth+100, 50*seasonPos1[i+1]+120);
    fill(0);
    text("20"+(i+11),i*lineWidth+100,seasonPos1[i]+550);//x,y,x,y
  }
    
  fill(0);  
  textSize(32);
  text("Final Season Position", 150, 50);
  textSize(20);
  text("(2011-2015)", 250, 80);
  textSize(16);
  text("Position", 0, 300);
  text("Years", 280, 580);
  textSize(11);
  text("1st", 70, 175);
  text("2nd", 70, 225);
  text("3rd", 70, 275);
  text("4th", 70, 325);
  text("5th", 70, 375);
  text("6th", 70, 425);
  text("7th", 70, 475);
  text("8th", 70, 525);
  text("2015", lineWidth+340,550); 
  
}

//still WIP, adding more, but this is to display most of it. will add labels soon.

/***************CODE ENDS HERE***************/


/***************CODE STARTS HERE***************/
/*
STUDENT NAME: SIMON KASHRO
 STUDENT ID:
 COMPONENT: VISUAL INTERACTION (ZOOM INTO PIE CHART SECTORS 
 AND DISPLAY DETAILED STATISTICS, ALTER LINE GRAPH)
 REFERENCES:
 */

//REMOVE THIS COMMENT TYPE YOUR CODE HERE

/***************CODE ENDS HERE***************/


/***************CODE STARTS HERE***************/
/*
STUDENT NAME: RYAN BARRAGA
 STUDENT ID: 98125988
 COMPONENT: AUDIO INTERACTION (SOUND CUES FOR THE VISUAL INTERACTION)
 REFERENCES:
 1. freesound.org, 23 September 2018, <https://freesound.org>
 */
void audioPlayback() {
  String audioFileName;
  if (onSector == true) 
    audioFileName = dataPath("open.wav");
  else
    audioFileName = dataPath("close.wav");
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample(audioFileName));
  g = new Gain(ac, 2, 1);
  g.addInput(player);
  ac.out.addInput(g);
  ac.start();
}

void mouseClicked() {
  //WORK IN PROGRESS. Once interactive component is completed, code will be updated to make onSector more robust.
  //When mouse is on sector and clicked, a sound will play when expanding details.
  onSector = !onSector;
  audioPlayback();
}
/***************CODE ENDS HERE***************/
