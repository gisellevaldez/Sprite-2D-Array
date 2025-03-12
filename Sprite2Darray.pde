/* Giselle Valdez 
03/12/2025 
*/
// Add a comment to each "//" that you see. 
int cols = 5;  // for the colums 
int rows = 5;  // for the rows 
Sprite[][] sprites; // 2d array holding sprite frames 

int numFrames = 4;  // how many frames are in the sprite
PImage[] spriteFrames; // puts in image to each row and colum 
int frameDelay = 15;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  // loads the sprite frames 
  sprites = new Sprite[cols][rows];

  // iterating through the sprite objects

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(255);
  
  // iterating through to create animation and show it 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// loads in the sprite images 
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("sprite_" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 100; // controls the size of the sprite frame 
  float speedX = 0.75; // the speed the images move through 

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // updates the animation frame 
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // controls the speed 
    x += speedX;

    // 
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
