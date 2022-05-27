// Loading in table and creating an arraylist to store all Spotify objects
Table table;
ArrayList<Spotify> group = new ArrayList<Spotify>();

// loading in date and creating the background
void setup() {
  table = loadTable("https://raw.githubusercontent.com/aleguz617/APCSA/main/data%20(1).csv", "header");
  println(table.getRowCount() + " total rows in table");
  size(1200, 1000);

  // for loop iterating through each row in the table to store specific numerical values
  for (int i = 0; i < 100; i++) 
  {
    float danceability = table.getFloat(i, 2);
    float duration = table.getFloat(i, 3);
    float energy = table.getFloat(i, 4);
    float loudness = table.getFloat(i, 7);
    String title = table.getString(i, 15);
    String artist = table.getString(i, 16);

    // cretion of each spotify object and storing them into the array list
    Spotify sp = new Spotify(danceability, duration, energy, loudness, title, artist);
    group.add(sp);
  }
}

// responsible for drawing the dots, axis labels, and labels
void draw() {

  drawDots();
  drawAxis();
  drawLabel();
}

// method responsible for showing the title and artist of each dot
void drawDots() {

  background(0);
  // iterates through arraylist to show each dot
  for (Spotify s : group) {

    s.showDots();
    //s.move();
  }
  
  // consistently shows the title and artist so it's always in front of the dots
  for (Spotify s : group) {

    s.showText();
  }
}
// draws title, x-axis, and y-axis
void drawAxis() {
  fill(255);
  textSize(30);
  text("Popular Spotify Songs: Energy vs. Danceability", 300, 40);
  text("Danceability", 30, 500);
  text("Energy Level", 500, 950);
}

// draws the label key
void drawLabel() {
  fill(255);
  rect(30, 10, 200, 150);
  fill(0);
  textSize(18);
  text("Key:", 40, 34);
  text("Radius: Loudness", 40, 60);
  text("Click on each dot",34,95);
  text ("to see name and artist",34,115);
}

// the user can interact with pressing dots and seeing their tite and artist

void mousePressed() {
  for (Spotify s : group) {
    s.selected = false;
    if (dist(mouseX, mouseY, s.x, s.y) < 20) {
      s.selected = true;
      break;
    }
  }
}
