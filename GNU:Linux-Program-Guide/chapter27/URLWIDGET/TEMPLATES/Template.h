#ifndef _Template_h
#define _Template_h

/****************************************************************
    *
    * Template widget
    *
    ****************************************************************/

   /* Resources:

    Name         Class        RepType Default Value
    ----                   -----      --------------------
    background   Background           PixelXtDefaultBackground
    border       BorderColor          PixelXtDefaultForeground
    borderWidth  BorderWidth          Dimension1
    destroyCallback        Callback   PointerNULL
    height       Height       Dimension0
    mappedWhenManaged      MappedWhenManagedBooleanTrue
    sensitive    Sensitive    Boolean True
    width        Width        Dimension0
    x                      Position   Position0
    y                      Position   Position0

   */

   /* define any special resource names here that are not in <X11/StringDefs.h> */

#define XtNtemplateResource        "templateResource"

#define XtCTemplateResource        "TemplateResource"

/* declare specific TemplateWidget class and instance datatypes */

typedef struct _TemplateClassRec*  TemplateWidgetClass;
typedef struct _TemplateRec*       TemplateWidget;

   /* declare the class constant */

extern WidgetClass templateWidgetClass;

#endif  _Template_h
