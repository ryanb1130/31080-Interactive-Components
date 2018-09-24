/***************CODE STARTS HERE***************/
/* COMMENTS:
 Ryan edited the original set up and draw methods in order for audio component to work.
 Ryan added initialize method to initialize global variables.
 Ryan added import for beads library.
 Thomas edited the next setup and drew new methods, such as lineGraph.
 Thomas moved around aspects such as Kelvin's draw method into the main "pieChart" method, to use draw() to call.
 */
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
  audioPlayback();
  onSector = false;
}

void draw() {
  lineGraph(); //Thomas
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
void lineGraph(){
  float[] seasonPos1 = {1,7,5,2,4};
  stroke(255,0,0);
  strokeWeight(2);
  float lineWidth = (float) width/(seasonPos1.length);
  for (int i=0; i<seasonPos1.length-1; i++) {
    line(i*lineWidth+80, 50*seasonPos1[i]+120, (i+1)*lineWidth+80, 50*seasonPos1[i+1]+120); //x,y,x,y
  }
  textSize(32);
  text("Final Season Position", 150,50);
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
  if (onSector == true) {
    String audioFileName = dataPath("open.wav");
    SamplePlayer player = new SamplePlayer(ac, SampleManager.sample(audioFileName));
    g = new Gain(ac, 2, 1);
    g.addInput(player);
    ac.out.addInput(g);
    ac.start();
  }
}

void mouseClicked() {
  //WORK IN PROGRESS. Once interactive component is completed, code will be updated to make onSector more robust.
  //When mouse is on sector and clicked, a sound will play when expanding details.
  onSector = true;
  audioPlayback();
}
/***************CODE ENDS HERE***************/
