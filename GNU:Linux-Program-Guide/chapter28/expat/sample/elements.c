/* This is simple demonstration of how to use expat. This program
reads an XML document from standard input and writes a line with the
name of each element to standard output indenting child elements by
one tab stop more than their parent element. */

#include <stdio.h>
#include "xmlparse.h"

void handleElementData(void *userData, const char * data, int len) {
  int i;
  int *depthPtr = userData;
  if (len < 3) return;
  for (i = 0; i < *depthPtr; i++)
    putchar('\t');
  printf("    tag data: ");
  for (i=0; i<len; i++) {
    putchar(data[i]);
  }
  printf("\n");
}

void startElement(void *userData, const char *name, const char **atts)
{
  int i;
  int *depthPtr = userData;
  for (i = 0; i < *depthPtr; i++)
    putchar('\t');
  printf("tag name: ");
  puts(name);
  *depthPtr += 1;
}

void endElement(void *userData, const char *name)
{
  int *depthPtr = userData;
  *depthPtr -= 1;
}

int main()
{
  char buf[BUFSIZ];
  XML_Parser parser = XML_ParserCreate(NULL);
  int done;
  int depth = 0;
  XML_SetUserData(parser, &depth);
  XML_SetElementHandler(parser, startElement, endElement);
  XML_SetCharacterDataHandler(parser, handleElementData);
  do {
    size_t len = fread(buf, 1, sizeof(buf), stdin);
    done = len < sizeof(buf);
    if (!XML_Parse(parser, buf, len, done)) {
      fprintf(stderr,
	      "%s at line %d\n",
	      XML_ErrorString(XML_GetErrorCode(parser)),
	      XML_GetCurrentLineNumber(parser));
      return 1;
    }
  } while (!done);
  XML_ParserFree(parser);
  return 0;
}
