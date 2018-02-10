#include <stdio.h>
#include <GL/glut.h>

int Texture_ID;
int Window_Width = 300;
int Window_Height = 300;

float X_Rot   = 0.9f;
float Y_Rot   = 0.0f;
float X_Speed = 0.0f;
float Y_Speed = 0.5f;
float Z_Off   =-5.0f;

void cbRenderScene(void)
{
  glEnable(GL_TEXTURE_2D);
  glEnable(GL_LIGHTING);
  glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
  glEnable(GL_DEPTH_TEST); 
  glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,
                  GL_NEAREST_MIPMAP_NEAREST);
  glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity(); 
  glTranslatef(0.0f,0.0f,Z_Off);
  glRotatef(X_Rot,1.0f,0.0f,0.0f);
  glRotatef(Y_Rot,0.0f,1.0f,0.0f);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  glBegin(GL_QUADS); 
  glNormal3f( 0.0f, -1.0f, 0.0f); glColor4f(0.9,0.2,0.2,.75);
  glTexCoord2f(0.800f, 0.800f); glVertex3f(-1.0f, -1.0f, -1.0f); 
  glTexCoord2f(0.200f, 0.800f); glVertex3f( 1.0f, -1.0f, -1.0f);
  glTexCoord2f(0.200f, 0.200f); glVertex3f( 1.0f, -1.0f,  1.0f);
  glTexCoord2f(0.800f, 0.200f); glVertex3f(-1.0f, -1.0f,  1.0f);
 
  glNormal3f( 0.0f, 1.0f, 0.0f); glColor4f(0.5,0.5,0.5,.5);
  glTexCoord2f(0.005f, 1.995f); glVertex3f(-1.0f,  1.3f, -1.0f);
  glTexCoord2f(0.005f, 0.005f); glVertex3f(-1.0f,  1.3f,  1.0f);
  glTexCoord2f(1.995f, 0.005f); glVertex3f( 1.0f,  1.3f,  1.0f);
  glTexCoord2f(1.995f, 1.995f); glVertex3f( 1.0f,  1.3f, -1.0f);

  glNormal3f( 0.0f, 0.0f,-1.0f); glColor4f(0.2,0.9,0.2,.5); 
  glTexCoord2f(0.995f, 0.005f); glVertex3f(-1.0f, -1.0f, -1.3f);
  glTexCoord2f(2.995f, 2.995f); glVertex3f(-1.0f,  1.0f, -1.3f);
  glTexCoord2f(0.005f, 0.995f); glVertex3f( 1.0f,  1.0f, -1.3f);
  glTexCoord2f(0.005f, 0.005f); glVertex3f( 1.0f, -1.0f, -1.3f);
   
  glNormal3f( 1.0f, 0.0f, 0.0f); glColor4f(0.2,0.2,0.9,.25);
  glTexCoord2f(0.995f, 0.005f); glVertex3f( 1.0f, -1.0f, -1.0f); 
  glTexCoord2f(0.995f, 0.995f); glVertex3f( 1.0f,  1.0f, -1.0f);
  glTexCoord2f(0.005f, 0.995f); glVertex3f( 1.0f,  1.0f,  1.0f);
  glTexCoord2f(0.005f, 0.005f); glVertex3f( 1.0f, -1.0f,  1.0f);

  glNormal3f( 0.0f, 0.0f, 1.0f); 
  glColor4f(0.9f, 0.2f, 0.2f, 0.5f);glTexCoord2f( 0.005f, 0.005f);glVertex3f(-1.0f, -1.0f,  1.3f);
  glColor4f(0.2f, 0.9f, 0.2f, 0.5f);glTexCoord2f( 0.995f, 0.005f);glVertex3f( 1.0f, -1.0f,  1.3f);
  glColor4f(0.2f, 0.2f, 0.9f, 0.5f);glTexCoord2f( 0.995f, 0.995f);glVertex3f( 1.0f,  1.0f,  1.3f); 
  glColor4f(0.1f, 0.1f, 0.1f, 0.5f);glTexCoord2f( 0.005f, 0.995f);glVertex3f(-1.0f,  1.0f,  1.3f);

  glNormal3f(-1.0f, 0.0f, 0.0f); glColor4f(0.9,0.9,0.2,0.0);
  glTexCoord2f(0.005f, 0.005f); glVertex3f(-1.3f, -1.0f, -1.0f); 
  glTexCoord2f(0.995f, 0.005f); glVertex3f(-1.3f, -1.0f,  1.0f);
  glTexCoord2f(0.995f, 0.995f); glVertex3f(-1.3f,  1.0f,  1.0f);
  glTexCoord2f(0.005f, 0.995f); glVertex3f(-1.3f,  1.0f, -1.0f);

  glEnd();
  glutSwapBuffers();

  X_Rot+=X_Speed; 
  Y_Rot+=Y_Speed; 
}
void cbKeyPressed(unsigned char key, int x, int y)
{
  if(key == 27)    exit;
}
void cbSpecialKeyPressed(int key, int x, int y)
{
   switch (key) {
   case GLUT_KEY_PAGE_UP:
      Z_Off -= 0.05f;   break;
   case GLUT_KEY_PAGE_DOWN:
      Z_Off += 0.05f;   break;
   case GLUT_KEY_UP:
      X_Speed -= 0.01f; break;
   case GLUT_KEY_DOWN:
      X_Speed += 0.01f; break;
   case GLUT_KEY_LEFT:
      Y_Speed -= 0.01f; break;
   case GLUT_KEY_RIGHT:
      Y_Speed += 0.01f; break;
    }
}
void ourBuildTextures(void)
{
   GLenum gluerr;
   GLubyte tex[128][128][4];
   int x,y,t;
   int hole_size = 3300; // ~ == 57.45 ^ 2.

   glGenTextures(1,&Texture_ID);
   glBindTexture(GL_TEXTURE_2D,Texture_ID);

   for(y=0;y<128;y++) {
      for(x=0;x<128;x++) {
	if ( ( (x+4)%32 < 8 ) && ( (y+4)%32 < 8)) {
	  tex[x][y][0]=tex[x][y][1]=0; tex[x][y][2]=120;
	}
	else tex[x][y][0]=tex[x][y][1]=tex[x][y][2]=240;
	t = (x-64)*(x-64) + (y-64)*(y-64) ;
	if ( t < hole_size)
	     tex[x][y][3]=255;
	else if (t < hole_size + 100)
	     tex[x][y][3]=128;
	else tex[x][y][3]=0;
      }
   }
   if ((gluerr=gluBuild2DMipmaps(GL_TEXTURE_2D, 4, 128, 128, GL_RGBA,
                 GL_UNSIGNED_BYTE, (void *)tex))) {
      fprintf(stderr,"GLULib%s\n",gluErrorString(gluerr));
      exit(-1);
   }
   glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_REPEAT);
   glTexEnvf(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,GL_DECAL);
}
void cbResizeScene(int Width, int Height)
{
   if (Height == 0) Height = 1;
   glViewport(0, 0, Width, Height);
   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   gluPerspective(45.0f,(GLfloat)Width/(GLfloat)Height,0.1f,100.0f);
   glMatrixMode(GL_MODELVIEW);
   Window_Width  = Width;
   Window_Height = Height;
}
void ourInit(int Width, int Height) 
{
   ourBuildTextures();   

   glClearColor(0.1f, 0.1f, 0.1f, 0.0f);
   glClearDepth(1.0);
   glDepthFunc(GL_LESS); 
   glShadeModel(GL_SMOOTH);

   cbResizeScene(Width,Height);

   glLightfv(GL_LIGHT1, GL_POSITION, (float []){ 2.0f, 2.0f, 0.0f, 1.0f });
   glLightfv(GL_LIGHT1, GL_AMBIENT,  (float []){ 0.1f, 0.1f, 0.1f, 1.0f });
   glLightfv(GL_LIGHT1, GL_DIFFUSE,  (float []) { 1.2f, 1.2f, 1.2f, 1.0f }); 
   glEnable (GL_LIGHT1); 

   glColorMaterial(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE);
   glEnable(GL_COLOR_MATERIAL);
}
int main(int argc, char *argv[])
{
   glutInit(&argc, argv);
   glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH);
   glutInitWindowSize(Window_Width, Window_Height);
   glutCreateWindow(argv[0]);
   glutDisplayFunc(&cbRenderScene);
   glutIdleFunc(&cbRenderScene);
   glutReshapeFunc(&cbResizeScene);
   glutKeyboardFunc(&cbKeyPressed);
   glutSpecialFunc(&cbSpecialKeyPressed);
   ourInit(Window_Width, Window_Height);
   glutMainLoop();
   return 0;
}
