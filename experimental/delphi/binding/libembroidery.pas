unit libembroidery;
{**************************************************************************}
{                                                                          }
{    This C DLL header file first (automatic) conversion generated by:     }
{    HeadConv 4.0 (c) 2000 by Bob Swart (aka Dr.Bob - www.drbob42.com)     }
{      Final Delphi-Jedi (Darth) command-line units edition                }
{                                                                          }
{    Generated Date: 25/01/2014                                            }
{    Generated Time: 04:24:18                                              }
{                                                                          }
{**************************************************************************}

interface
uses
{$IFDEF FPC}
  dynlibs;
{$ELSE}
  {$IFDEF WIN32}
    Windows;
  {$ELSE}
    //Dos, Delphi 1, Delphi 2
    Wintypes, WinProcs;
  {$ENDIF}
{$ENDIF}  

{.$DEFINE EMBOBJECT}
{.$DEFINE EMBOBJECTS_PREV}
{$IFNDEF FPC}
  {$IFNDEF MSDOS}
    {$DEFINE SetErrorMode}
  {$ENDIF}
{$ENDIF}

type

  TEmbColor = record
    r: Byte;
    g: Byte;
    b: Byte;
  end {EmbColor};
  
  TEmbPoint = record
    xx: Double;   {= absolute position (not relative) }
    yy: Double;   {= positive is up, units are in mm }
  end {EmbPoint};

  PEmbPointList = ^TEmbPointList;
  TEmbPointList = record
    point: TEmbPoint;
    next: PEmbPointList;
  end {EmbPointList};

  TEmbPointObject = record
    point: TEmbPoint;
	  // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbPointObject};

  PEmbPointObjectList = ^TEmbPointObjectList;
  TEmbPointObjectList = record
    pointObj: TEmbPointObject;
    next: PEmbPointObjectList;
  end {EmbPointObjectList};


  TEmbSettings = record
    dstJumpsPerTrim: Word;
    home: TEmbPoint;
  end {EmbSettings};

  TEmbHoop = record
    width: Double;
    height: Double;
  end {EmbHoop};

  TEmbStitch = record
    flags: Integer;   {= uses codes defined above }
    xx: Double;       {= absolute position (not relative) }
    yy: Double;       {= positive is up, units are in mm }
    color: Integer;
  end {EmbStitch};

  PEmbStitchList = ^TEmbStitchList;
  TEmbStitchList = record
    stitch: TEmbStitch;
    next: PEmbStitchList;
  end;


  TEmbThread = record
    color: TEmbColor;
    description: PCHAR;
    catalogNumber: PCHAR;
  end {EmbThread};

  PEmbThreadList = ^TEmbThreadList;
  TEmbThreadList = record
    thread: TEmbThread;
    next: PEmbThreadList;
  end {EmbThreadList};


  TEmbArc = record
    startX: Double; {= absolute position (not relative) }
    startY: Double;
    midX: Double;   {= absolute position (not relative) }
    midY: Double;
    endX: Double;   {= absolute position (not relative) }
    endY: Double;
  end {EmbArc};

  TEmbArcObject = record
    arc: TEmbArc;  {+// Properties*/ }
    lineType: Integer;
    color: TEmbColor;
  end {EmbArcObject};


  PEmbArcObjectList = ^TEmbArcObjectList;
  TEmbArcObjectList = record
    arcObj: TEmbArcObject;
    next: PEmbArcObjectList;
  end {EmbArcObjectList};



  TEmbCircle = record
    centerX: Double;
    centerY: Double;
    radius: Double;
  end {EmbCircle};

  TEmbCircleObject = record
    circle: TEmbCircle;

    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbCircleObject};

  PEmbCircleObjectList = ^TEmbCircleObjectList;
  TEmbCircleObjectList = record
    circleObj : TEmbCircleObject;
    next : PEmbCircleObjectList;
  end;

  TEmbEllipse = record
    centerX: Double;
    centerY: Double;
    radiusX: Double;
    radiusY: Double;
  end {EmbEllipse};

  TEmbEllipseObject = record
    ellipse: TEmbEllipse;
    rotation: Double;
    //Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbEllipseObject};

  PEmbEllipseObjectList = ^TEmbEllipseObjectList;
  TEmbEllipseObjectList = record
    EllipseObj : TEmbEllipseObject;
    next : PEmbEllipseObjectList;
  end;


  TEmbLine = record
    x1: Double;
    y1: Double;
    x2: Double;
    y2: Double;
  end {EmbLine};

  TEmbLineObject = record
    line: TEmbLine;

    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbLineObject};


  PEmbLineObjectList = ^TEmbLineObjectList;
  TEmbLineObjectList = record
    LineObj : TEmbLineObject;
    next : PEmbLineObjectList;
  end;

type
  TEmbFlag = Integer;

  PEmbFlagList = ^TEmbFlagList;
  TEmbFlagList = record
    flag: Integer;
    next: PEmbFLAGList;
  end {EmbFlagList};

  TEmbPathObject = record
    pointList: PEmbPointList;
    flagList: PEmbFLAGList;
    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbPathObject};
  PEmbPathObject = ^TEmbPathObject;

  PEmbPathObjectList = ^TEmbPathObjectList;
  TEmbPathObjectList = record
    pathObj: PEmbPathObject;
    next: PEmbPathObjectList;
  end {EmbPathObjectList};

  TEmbPolygonObject = record
    pointList: PEmbPointList;
    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbPolygonObject};
  PEmbPolygonObject = TEmbPolygonObject;


  PEmbPolygonObjectList = ^TEmbPolygonObjectList;
  TEmbPolygonObjectList = record
    polygonObj: PEmbPolygonObject;
    next: PEmbPolygonObjectList;
  end {EmbPolygonObjectList};


  TEmbPolylineObject = record
    pointList: PEmbPointList;
    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbPolylineObject};
  PEmbPolylineObject= ^TEmbPolylineObject;

  PEmbPolylineObjectList = ^TEmbPolylineObjectList;
  TEmbPolylineObjectList = record
    polylineObj: PEmbPolylineObject;
    next: PEmbPolylineObjectList;
  end {EmbPolylineObjectList};


  TEmbRect = record
    top: Double;
    left: Double;
    bottom: Double;
    right: Double;
  end {EmbRect};

  TEmbRectObject = record
    rect: TEmbRect;
    rotation: Double;
    radius: Double;
    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbRectObject};


  PEmbRectObjectList = ^TEmbRectObjectList;
  TEmbRectObjectList = record
    rectObj: TEmbRectObject;
    next: PEmbRectObjectList;
  end {EmbRectObjectList};


  TEmbBezier = record
    startX: Double;
    startY: Double;
    control1X: Double;
    control1Y: Double;
    control2X: Double;
    control2Y: Double;
    endX: Double;
    endY: Double;
  end {EmbBezier};

  PEmbSplineObject = ^TEmbSplineObject;
  TEmbSplineObject = record
    bezier: TEmbBezier;
    next: PEmbSplineObject;
    // Properties
    lineType: Integer;
    color: TEmbColor;
  end {EmbSplineObject};

{ A list of bezier curves is a B-spline }
  PEmbSplineObjectList = ^TEmbSplineObjectList;
  TEmbSplineObjectList = record
    splineObj: TEmbSplineObject;
    next: PEmbSplineObjectList;
  end {EmbSplineObjectList};

{$IFDEF EMBOBJECT}
type
  PEmbObject = ^TEmbObject;
  TEmbObject = record
    kind: Char;
    pointList: PEmbPointList;

    // Properties*/
    lineType: Integer;
    color: TEmbColor;
  end {};

  PEmbObjectList = ^TEmbObjectList;
  TEmbObjectList = record
    objectObj: PEmbObject;
    {$IFDEF EMBOBJECTS_PREV}
    prev: PEmbObjectList;
    {$ENDIF}
    next: PEmbObjectList;
    child: PEmbObjectList;
  end {EmbObjectList};
{$ENDIF}

  TEmbPattern = record
    settings: TEmbSettings;
    hoop: TEmbHoop;
    stitchList: PEmbStitchList;
    threadList: PEmbThreadList;
    arcObjList: PEmbArcObjectList;
    circleObjList: PEmbCircleObjectList;
    ellipseObjList: PEmbEllipseObjectList;
    lineObjList: PEmbLineObjectList;
    pathObjList: PEmbPathObjectList;
    pointObjList: PEmbPointObjectList;
    polygonObjList: PEmbPolygonObjectList;
    polylineObjList: PEmbPolylineObjectList;
    rectObjList: PEmbRectObjectList;
    splineObjList: PEmbSplineObjectList;
    lastStitch: PEmbStitchList;
    lastThread: PEmbThreadList;
    lastArcObj: PEmbArcObjectList;
    lastCircleObj: PEmbCircleObjectList;
    lastEllipseObj: PEmbEllipseObjectList;
    lastLineObj: PEmbLineObjectList;
    lastPathObj: PEmbPathObjectList;
    lastPointObj: PEmbPointObjectList;
    lastPolygonObj: PEmbPolygonObjectList;
    lastPolylineObj: PEmbPolylineObjectList;
    lastRectObj: PEmbRectObjectList;
    lastSplineObj: PEmbSplineObjectList;
    
    currentColorIndex: Integer;
    lastX: Double;
    lastY: Double;
  end {EmbPattern};
  PEmbPattern = ^TEmbPattern;

  PEmbFormatList = ^TEmbFormatList;
  TEmbFormatList = record
    extension: PChar;
    next: PEmbFormatList;
  end {EmbFormatList};

const
  EMBFORMAT_UNSUPPORTED = 0;
  EMBFORMAT_STITCHONLY  = 1;
  EMBFORMAT_STCHANDOBJ  = 3; {/* binary operation: 1+2=3*/}
  EMBFORMAT_OBJECTONLY  = 2;

var
  embFormatList_create: function:  PEmbFormatList cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
  embFormatList_free: procedure(formatList: PEmbFormatList) cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
  embFormat_info: function(const fileName: PChar; 
                           var extension: PChar; 
                           var description: PChar; 
                           var reader: Char;
                           var writer: Char; 
                           var formatType: Integer): integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};


var
  embPattern_create:  function(): PEmbPattern cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
  embPattern_read:    function(pattern: PEmbPattern;
            const fileName: PChar): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};

  embPattern_write:   function(const pattern: PEmbPattern;
             const fileName: PChar): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};

  embFormat_type:     function(const fileName: PChar): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};

{$IFDEF EMBOBJECT}
 embObject_create:   function (kind: Char;
					  points: PEmbPointList;
					  color: TEmbColor;
					  lineType: Integer): PEmbObject cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
 embObject_free:     procedure (pointer: PEmbObject) cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
 embObjectList_create: function (data: PEmbObject): PEmbObjectList cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
 embObjectList_add:  function (pointer: PEmbObjectList;
						 data: PEmbObject): PEmbObjectList cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
 embObjectList_count:  function (pointer: PEmbObjectList): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
 embObjectList_empty:  function (pointer: PEmbObjectList): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
 embObjectList_free:   procedure (pointer: PEmbObjectList) cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
{$ENDIF}


var
  DLLLoaded: Boolean { is DLL (dynamically) loaded already? }
    {$IFDEF WIN32} = False {$ENDIF};

const
{$IFDEF win32}
  emblib = 'libembroidery.dll';
{$ELSE}
  {$IFDEF darwin}
    emblib = 'libembroidery';
    {$linklib libembroidery}
  {$ELSE}
    emblib = 'libembroidery.so';
  {$ENDIF}
{$ENDIF}
    
implementation

uses
  SysUtils;
var
  SaveExit: pointer;
  DLLHandle: THandle;
{$IFDEF SetErrorMode}
  ErrorMode: Integer;
{$ENDIF}

  procedure NewExit; far;
  begin
    ExitProc := SaveExit;
    FreeLibrary(DLLHandle)
  end {NewExit};

procedure LoadDLL;
begin
  if DLLLoaded then Exit;
{$IFDEF SetErrorMode}
  ErrorMode := SetErrorMode($8000{SEM_NoOpenFileErrorBox});
{$ENDIF}
  DLLHandle := LoadLibrary(emblib);
  if DLLHandle >= 32 then
  begin
    DLLLoaded := True;
    SaveExit := ExitProc;
    ExitProc := @NewExit;

    @embPattern_create := GetProcAddress(DLLHandle,'embPattern_create');
  {$IFDEF WIN32}
    //I need to sure we are using correct lib, but this context doesn't work:
    //Assert(assigned(@embPattern_read));
  {$ENDIF}

    @embPattern_read := GetProcAddress(DLLHandle,'embPattern_read');
    @embPattern_write := GetProcAddress(DLLHandle,'embPattern_write');
    @embFormat_type := GetProcAddress(DLLHandle,'embFormat_type');

{$IFDEF EMBOBJECT}
    @embObject_create   := GetProcAddress(DLLHandle,'embObject_create');
    @embObject_free     := GetProcAddress(DLLHandle,'embObject_free');
    @embObjectList_create := GetProcAddress(DLLHandle,'embObjectList_create');
    @embObjectList_add    := GetProcAddress(DLLHandle,'embObjectList_add');
    @embObjectList_count  := GetProcAddress(DLLHandle,'embObjectList_count');
    @embObjectList_empty  := GetProcAddress(DLLHandle,'embObjectList_empty');
    @embObjectList_free   := GetProcAddress(DLLHandle,'embObjectList_free');
{$ENDIF}

    @embFormatList_create  := GetProcAddress(DLLHandle,'embFormatList_create');
    @embFormatList_free    := GetProcAddress(DLLHandle,'embFormatList_free');
    @embFormat_info   := GetProcAddress(DLLHandle,'embFormat_info');

  end
  else
  begin
    DLLLoaded := False;
    raise Exception.Create( emblib +' could not be loaded !!' );
  end;
{$IFDEF SetErrorMode}
  SetErrorMode(ErrorMode)
{$ENDIF}
end {LoadDLL};

initialization
  LoadDLL;
end.