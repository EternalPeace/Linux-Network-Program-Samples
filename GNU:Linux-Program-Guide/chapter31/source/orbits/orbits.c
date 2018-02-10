#include <GL/glut.h>
#include <stdlib.h>
#include <stdio.h>

int central_orbit_period = 0;
int planet_rotation_period = 0;
int satellite_rotation_period = 0;

void init(void)
{
   glClearColor(0.1, 0.1, 0.1, 0.0);
   glEnable(GL_COLOR_MATERIAL);
   glShadeModel(GL_SMOOTH);

   glEnable(GL_LIGHTING);
   glEnable(GL_LIGHT0);
   glEnable(GL_CULL_FACE);
   glCullFace(GL_BACK);
   glEnable(GL_DEPTH_TEST);
}

void display(void) {
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  // push matrix, draw central planet, then pop matrix:
  glPushMatrix();
  {
    glRotatef((GLfloat)planet_rotation_period, 0.0, 1.0, 0.0);
    glColor4f(1.0, 0.0, 0.0, 1.0);
    glutSolidSphere(1.0, 10, 8);   // Draw the central planet
  } glPopMatrix();

  // push matrix, draw satellite, then pop matrix:
  glPushMatrix();
  {
    glRotatef((GLfloat)central_orbit_period, 0.0, 1.0, 0.0);
    glTranslatef(1.9, 0.0, 0.0);
    glRotatef((GLfloat)-satellite_rotation_period, 0.0, 1.0, 0.0);
    glColor4f(0.0, 1.0, 0.0, 1.0);
    glutSolidSphere(0.2, 5, 4);    // Draw the orbiting satellite
  } glPopMatrix();
  
  glutSwapBuffers();
  central_orbit_period = (central_orbit_period + 2) % 360;
  planet_rotation_period = (planet_rotation_period + 1) % 360;
  satellite_rotation_period = (satellite_rotation_period + 6) % 360;
  glutPostRedisplay();
}

void reshape(int w, int h)
{
   glViewport(0, 0, w, h); 
   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   gluPerspective(60.0, (GLfloat)w/(GLfloat)h, 1.0, 20.0);
   glMatrixMode(GL_MODELVIEW);
   glLoadIdentity();
   gluLookAt(0.0, 0.0, 4.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
}

void cycle_view() {
  static int count = 0;
  static int shade_flag = 0;
  if (++count > 2) {
    count = 0;
    shade_flag = 1 - shade_flag;
  }
  glLoadIdentity();
  switch (count)
    {
    case 0:
      gluLookAt(0.0, 0.0, 4.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
      break;
    case 1:
      gluLookAt(0.0, 5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0);
      break;
    case 2:
      gluLookAt(0.0, 0.5, -3.3, 1.0, 0.0, 0.0, -0.7, 0.2, 0.4);
      break;
    }
   if (shade_flag == 0) glShadeModel(GL_SMOOTH);
   else                 glShadeModel(GL_FLAT);

}

void key_press_callback(unsigned char key, int x, int y) {
  switch (key)
    {
    case 27: /* escape character */
    case 'q':
    case 'Q':
      exit(1);
    default:
      cycle_view();
      break;
    }
}

int main(int argc, char *argv[])
{
   glutInit(&argc, argv);
   glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
   glutInitWindowSize(500, 500); 
   glutInitWindowPosition(100, 100);
   glutCreateWindow(argv[0]);
   init();
   glutKeyboardFunc(key_press_callback);
   glutDisplayFunc(display); 
   glutReshapeFunc(reshape);
   glutMainLoop();
   return 0;
}
