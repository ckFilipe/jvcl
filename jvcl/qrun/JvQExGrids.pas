{******************************************************************************}
{* WARNING:  JEDI VCL To CLX Converter generated unit.                        *}
{*           Manual modifications will be lost on next release.               *}
{******************************************************************************}

{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExGrids.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

unit JvQExGrids;

interface

uses  
  Qt, QGraphics, QControls, QForms, QGrids, Types, QWindows, 
  Classes, SysUtils,
  JvQTypes, JvQThemes, JVCLXVer, JvQExControls;



 {$IF not declared(PatchedVCLX)}
  {$DEFINE NeedMouseEnterLeave}
 {$IFEND}


type
 


  {$IFNDEF HAS_GRID_EDITSTYLE}
  // Compiler 5 and VisualCLX do not have TEditStyle
  TEditStyle = (esSimple, esEllipsis, esPickList);
  {$ENDIF HAS_GRID_EDITSTYLE}


  TJvExInplaceEdit = class(TInplaceEdit, IJvWinControlEvents, IJvControlEvents, IPerformControl)  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    function GetColor: TColor;
    procedure SetColor(Value: TColor);
    function GetDoubleBuffered: Boolean;
    procedure SetDoubleBuffered(Value: Boolean);
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure ColorChanged; override;
    property Color: TColor read GetColor write SetColor;
  published // asn: change to public in final
    property DoubleBuffered: Boolean read GetDoubleBuffered write SetDoubleBuffered; 
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False; 
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual; 
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas; 
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubInplaceEdit = class(TJvExInplaceEdit) 
  end;
  
  TJvExCustomGrid = class(TCustomGrid,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    function GetColor: TColor;
    procedure SetColor(Value: TColor);
    function GetDoubleBuffered: Boolean;
    procedure SetDoubleBuffered(Value: Boolean);
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure ColorChanged; override;
    property Color: TColor read GetColor write SetColor;
  published // asn: change to public in final
    property DoubleBuffered: Boolean read GetDoubleBuffered write SetDoubleBuffered; 
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False; 
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubCustomGrid = class(TJvExCustomGrid) 
  end;
   

  TJvExDrawGrid = class(TDrawGrid,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    function GetColor: TColor;
    procedure SetColor(Value: TColor);
    function GetDoubleBuffered: Boolean;
    procedure SetDoubleBuffered(Value: Boolean);
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure ColorChanged; override;
    property Color: TColor read GetColor write SetColor;
  published // asn: change to public in final
    property DoubleBuffered: Boolean read GetDoubleBuffered write SetDoubleBuffered; 
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False; 
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  {$IFNDEF HAS_GRID_EDITSTYLE}
  protected
    function GetEditStyle(ACol, ARow: Longint): TEditStyle; dynamic;
  {$ENDIF !HAS_GRID_EDITSTYLE}
  end;
  TJvExPubDrawGrid = class(TJvExDrawGrid) 
  end;
  

  TJvExStringGrid = class(TStringGrid,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    function GetColor: TColor;
    procedure SetColor(Value: TColor);
    function GetDoubleBuffered: Boolean;
    procedure SetDoubleBuffered(Value: Boolean);
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure ColorChanged; override;
    property Color: TColor read GetColor write SetColor;
  published // asn: change to public in final
    property DoubleBuffered: Boolean read GetDoubleBuffered write SetDoubleBuffered; 
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False; 
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  {$IFNDEF HAS_GRID_EDITSTYLE}
  protected
    function GetEditStyle(ACol, ARow: Longint): TEditStyle; dynamic;
  {$ENDIF !HAS_GRID_EDITSTYLE}
  end;
  TJvExPubStringGrid = class(TJvExStringGrid) 
  end;
  

implementation



procedure TJvExInplaceEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExInplaceEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExInplaceEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExInplaceEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExInplaceEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExInplaceEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExInplaceEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

function TJvExInplaceEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExInplaceEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExInplaceEdit.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

function TJvExInplaceEdit.GetColor: TColor;
begin
  Result := Brush.Color;
end;

procedure TJvExInplaceEdit.SetColor(Value: TColor);
begin
  if Brush.Color <> Value then
  begin
    inherited Color := Value;
    Brush.Color := Value;
  end;
end;

function TJvExInplaceEdit.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

procedure TJvExInplaceEdit.SetDoubleBuffered(Value: Boolean);
begin
  if Value <> FDoubleBuffered then
  begin
    if Value then
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground)
    else
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_PaletteBackground);
    FDoubleBuffered := Value;
    if not (csCreating in ControlState) then
      Invalidate;
  end;
end;

procedure TJvExInplaceEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExInplaceEdit.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExInplaceEdit.DoBoundsChanged;
begin
end;

procedure TJvExInplaceEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExInplaceEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExInplaceEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExInplaceEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExInplaceEdit.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExInplaceEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExInplaceEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;



procedure TJvExCustomGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCustomGrid.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExCustomGrid.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

function TJvExCustomGrid.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomGrid.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomGrid.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

function TJvExCustomGrid.GetColor: TColor;
begin
  Result := Brush.Color;
end;

procedure TJvExCustomGrid.SetColor(Value: TColor);
begin
  if Brush.Color <> Value then
  begin
    inherited Color := Value;
    Brush.Color := Value;
  end;
end;

function TJvExCustomGrid.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

procedure TJvExCustomGrid.SetDoubleBuffered(Value: Boolean);
begin
  if Value <> FDoubleBuffered then
  begin
    if Value then
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground)
    else
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_PaletteBackground);
    FDoubleBuffered := Value;
    if not (csCreating in ControlState) then
      Invalidate;
  end;
end;

procedure TJvExCustomGrid.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomGrid.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCustomGrid.DoBoundsChanged;
begin
end;

procedure TJvExCustomGrid.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomGrid.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomGrid.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomGrid.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExCustomGrid.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  
  DoubleBuffered := True;
end;

destructor TJvExCustomGrid.Destroy;
begin
  
  inherited Destroy;
end;





procedure TJvExDrawGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExDrawGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExDrawGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExDrawGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExDrawGrid.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExDrawGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExDrawGrid.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

function TJvExDrawGrid.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExDrawGrid.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExDrawGrid.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

function TJvExDrawGrid.GetColor: TColor;
begin
  Result := Brush.Color;
end;

procedure TJvExDrawGrid.SetColor(Value: TColor);
begin
  if Brush.Color <> Value then
  begin
    inherited Color := Value;
    Brush.Color := Value;
  end;
end;

function TJvExDrawGrid.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

procedure TJvExDrawGrid.SetDoubleBuffered(Value: Boolean);
begin
  if Value <> FDoubleBuffered then
  begin
    if Value then
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground)
    else
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_PaletteBackground);
    FDoubleBuffered := Value;
    if not (csCreating in ControlState) then
      Invalidate;
  end;
end;

procedure TJvExDrawGrid.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExDrawGrid.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExDrawGrid.DoBoundsChanged;
begin
end;

procedure TJvExDrawGrid.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExDrawGrid.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExDrawGrid.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExDrawGrid.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExDrawGrid.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  
  DoubleBuffered := True;
end;

destructor TJvExDrawGrid.Destroy;
begin
  
  inherited Destroy;
end;

{$IFNDEF HAS_GRID_EDITSTYLE}
function TJvExDrawGrid.GetEditStyle(ACol, ARow: Longint): TEditStyle;
begin
  Result := esSimple;
end;
{$ENDIF !HAS_GRID_EDITSTYLE}




procedure TJvExStringGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExStringGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExStringGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExStringGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExStringGrid.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExStringGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExStringGrid.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

function TJvExStringGrid.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExStringGrid.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExStringGrid.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

function TJvExStringGrid.GetColor: TColor;
begin
  Result := Brush.Color;
end;

procedure TJvExStringGrid.SetColor(Value: TColor);
begin
  if Brush.Color <> Value then
  begin
    inherited Color := Value;
    Brush.Color := Value;
  end;
end;

function TJvExStringGrid.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

procedure TJvExStringGrid.SetDoubleBuffered(Value: Boolean);
begin
  if Value <> FDoubleBuffered then
  begin
    if Value then
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_NoBackground)
    else
      QWidget_setBackgroundMode(Handle, QWidgetBackgroundMode_PaletteBackground);
    FDoubleBuffered := Value;
    if not (csCreating in ControlState) then
      Invalidate;
  end;
end;

procedure TJvExStringGrid.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExStringGrid.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExStringGrid.DoBoundsChanged;
begin
end;

procedure TJvExStringGrid.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExStringGrid.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExStringGrid.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExStringGrid.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExStringGrid.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  
  DoubleBuffered := True;
end;

destructor TJvExStringGrid.Destroy;
begin
  
  inherited Destroy;
end;

{$IFNDEF HAS_GRID_EDITSTYLE}
function TJvExStringGrid.GetEditStyle(ACol, ARow: Longint): TEditStyle;
begin
  Result := esSimple;
end;
{$ENDIF !HAS_GRID_EDITSTYLE}


end.
