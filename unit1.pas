//Copyright 2020 Andrey S. Ionisyan (anserion@gmail.com)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BTN_orig1_draw: TButton;
    BTN_orig2_draw: TButton;
    BTN_orig3_draw: TButton;
    BTN_orig4_draw: TButton;
    BTN_orig_create: TButton;
    BTN_reset: TButton;
    Edit_L2_not_origs: TEdit;
    Edit_out_3_1: TEdit;
    Edit_out_3_2: TEdit;
    Edit_out_3_3: TEdit;
    Edit_out_3_4: TEdit;
    Edit_scalar_3_1: TEdit;
    Edit_scalar_3_2: TEdit;
    Edit_scalar_3_3: TEdit;
    Edit_scalar_3_4: TEdit;
    Edit_student_name: TEdit;
    Edit_L1_sigma2_1: TEdit;
    Edit_L1_sigma2_2: TEdit;
    Edit_L1_sigma2_3: TEdit;
    Edit_L1_sigma2_4: TEdit;
    Edit_L1_out1: TEdit;
    Edit_L1_out2: TEdit;
    Edit_L1_out3: TEdit;
    Edit_L1_out4: TEdit;
    GB_Layer1: TGroupBox;
    GB_Layer2: TGroupBox;
    Label1: TLabel;
    Label_L1_neuron1: TLabel;
    Label_L1_neuron2: TLabel;
    Label_L1_neuron3: TLabel;
    Label_L1_neuron4: TLabel;
    Label_L2_neuron1: TLabel;
    Label_L2_neuron2: TLabel;
    Label_L2_neuron3: TLabel;
    Label_L2_neuron4: TLabel;
    Label_L2_neuron5: TLabel;
    Label_out_3_1: TLabel;
    Label_out_3_2: TLabel;
    Label_out_3_3: TLabel;
    Label_out_3_4: TLabel;
    Label_scalar_3_1: TLabel;
    Label_scalar_3_2: TLabel;
    Label_scalar_3_3: TLabel;
    Label_scalar_3_4: TLabel;
    Label_student_name: TLabel;
    Label2: TLabel;
    Label_orig1: TLabel;
    Label_orig2: TLabel;
    Label_orig3: TLabel;
    Label_orig4: TLabel;
    Label_L2_w_1_6: TLabel;
    Label_L2_w_1_7: TLabel;
    Label_L2_w_1_8: TLabel;
    Label_L2_w_1_9: TLabel;
    Label_L2_w_2_6: TLabel;
    Label_L2_w_2_7: TLabel;
    Label_L2_w_2_8: TLabel;
    Label_L2_w_2_9: TLabel;
    Label_L2_w_3_6: TLabel;
    Label_L2_w_3_7: TLabel;
    Label_L2_w_3_8: TLabel;
    Label_L2_w_3_9: TLabel;
    Label_L2_w_4_6: TLabel;
    Label_L2_w_4_7: TLabel;
    Label_L2_w_4_8: TLabel;
    Label_L2_w_4_9: TLabel;
    Label_L1_sigma2_1: TLabel;
    Label_L1_sigma2_2: TLabel;
    Label_L1_sigma2_3: TLabel;
    Label_L1_sigma2_4: TLabel;
    Label_L1_out1: TLabel;
    Label_L1_out2: TLabel;
    Label_out3: TLabel;
    Label_L1_out4: TLabel;
    Panel_L1_neuron4: TPanel;
    Panel_L1_neuron3: TPanel;
    Panel_L1_neuron2: TPanel;
    Panel_L1_neuron1: TPanel;
    Panel_L2_neuron5: TPanel;
    Panel_L2_neuron1: TPanel;
    Panel_L2_neuron2: TPanel;
    Panel_L2_neuron3: TPanel;
    Panel_L2_neuron4: TPanel;
    PB_L1_w1: TPaintBox;
    PB_orig1: TPaintBox;
    PB_orig2: TPaintBox;
    PB_orig3: TPaintBox;
    PB_orig4: TPaintBox;
    PB_receptors: TPaintBox;
    PB_L1_w2: TPaintBox;
    PB_L1_w3: TPaintBox;
    PB_L1_w4: TPaintBox;
    procedure BTN_orig_to_S_Click(Sender: TObject);
    procedure BTN_orig_createClick(Sender: TObject);
    procedure BTN_resetClick(Sender: TObject);
    procedure Edit_L2_not_origsKeyPress(Sender: TObject; var Key: char);
    procedure Edit_L1_sigma2_KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure PB_orig_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PB_orig_Paint(Sender: TObject);
    procedure PB_receptorsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PB_receptorsPaint(Sender: TObject);
    procedure PB_w_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PB_w_Paint(Sender: TObject);
  private
    procedure Redraw_orig_cell( Sender: TObject; x,y:integer);
    procedure Redraw_widgets;
  public

  end;

const
  n_origs=4;
  s_width=5;
  s_height=5;
  n_L1=4;
  n_L2=4;

var
  Form1: TForm1;

  L1_w:array[1..n_L1,1..s_width,1..s_height] of real;
  L1_sigma2:array[1..n_L1]of real;
  L1_dist2:array[1..n_L1]of real;
  L1_out:array[1..n_L1]of real;

  L2_w:array[1..n_L2,1..n_L1] of real;
  L2_scalar:array[1..n_L2]of real;
  L2_out:array[1..n_L2]of real;

  S_elements: array[1..s_width,1..s_height]of integer;
  Orig_elements: array[1..n_origs,1..s_width,1..s_height]of integer;

  not_orig_epsilon:real;
implementation

{$R *.lfm}

function sigmoid(x:real):real;
begin sigmoid:=1/(1+exp(-x)); end;

function rbf_gaussian(sigma2,d2:real):real;
begin rbf_gaussian:=exp(-sigma2*d2); end;

procedure L1_calc;
var k,cell_x,cell_y:integer;
begin
  for k:=1 to n_L1 do
  begin
    L1_dist2[k]:=0;
    for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
      L1_dist2[k]:=L1_dist2[k]+
                   sqr(L1_w[k,cell_x,cell_y]-S_elements[cell_x,cell_y]);
  end;

  for k:=1 to n_L1 do L1_out[k]:=rbf_gaussian(L1_sigma2[k],L1_dist2[k]);
end;

procedure L2_calc;
var k,i:integer;
begin
  for k:=1 to n_L2 do
  begin
    L2_scalar[k]:=0;
    for i:=1 to n_L1 do
       L2_scalar[k]:=L2_scalar[k]+L2_w[k,i]*L1_out[i];
    L2_out[k]:=sigmoid(L2_scalar[k]);
  end;
end;

procedure L1_learn;
var k,cell_x,cell_y:integer;
begin
  for k:=1 to n_origs do
    for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
      L1_w[k,cell_x,cell_y]:=Orig_elements[k,cell_x,cell_y];
end;

procedure L2_learn;
var i,k:integer;
begin
  for k:=1 to n_L2 do
  for i:=1 to n_L1 do
    L2_w[k,i]:=0;

  for k:=1 to n_L2 do L2_w[k,k]:=1;
end;

{ TForm1 }

procedure TForm1.Redraw_widgets;
var k,tmp:integer; tmp_real:real;
begin
  Label_L1_neuron1.caption:='нейрон 1';
  Label_L1_neuron2.caption:='нейрон 2';
  Label_L1_neuron3.caption:='нейрон 3';
  Label_L1_neuron4.caption:='нейрон 4';

  Label_L2_neuron1.caption:='нейрон 1';
  Label_L2_neuron2.caption:='нейрон 2';
  Label_L2_neuron3.caption:='нейрон 3';
  Label_L2_neuron4.caption:='нейрон 4';
  Label_L2_neuron5.caption:='нейрон 5 (не расп.)';
  Edit_L2_not_origs.text:=FloatToStrF(not_orig_epsilon,fffixed,6,6);

  Edit_L1_sigma2_1.text:=FloatToStrF(L1_sigma2[1],ffFixed,5,1);
  Edit_L1_sigma2_2.text:=FloatToStrF(L1_sigma2[2],ffFixed,5,1);
  Edit_L1_sigma2_3.text:=FloatToStrF(L1_sigma2[3],ffFixed,5,1);
  Edit_L1_sigma2_4.text:=FloatToStrF(L1_sigma2[4],ffFixed,5,1);

  Edit_L1_out1.text:=FloatToStrF(L1_out[1],ffFixed,5,3);
  Edit_L1_out2.text:=FloatToStrF(L1_out[2],ffFixed,5,3);
  Edit_L1_out3.text:=FloatToStrF(L1_out[3],ffFixed,5,3);
  Edit_L1_out4.text:=FloatToStrF(L1_out[4],ffFixed,5,3);

  Label_L2_w_1_6.caption:='w1='+FloatToStrF(L2_w[1,1],ffFixed,5,3);
  Label_L2_w_2_6.caption:='w2='+FloatToStrF(L2_w[1,2],ffFixed,5,3);
  Label_L2_w_3_6.caption:='w3='+FloatToStrF(L2_w[1,3],ffFixed,5,3);
  Label_L2_w_4_6.caption:='w4='+FloatToStrF(L2_w[1,4],ffFixed,5,3);

  Label_L2_w_1_7.caption:='w1='+FloatToStrF(L2_w[2,1],ffFixed,5,3);
  Label_L2_w_2_7.caption:='w2='+FloatToStrF(L2_w[2,2],ffFixed,5,3);
  Label_L2_w_3_7.caption:='w3='+FloatToStrF(L2_w[2,3],ffFixed,5,3);
  Label_L2_w_4_7.caption:='w4='+FloatToStrF(L2_w[2,4],ffFixed,5,3);

  Label_L2_w_1_8.caption:='w1='+FloatToStrF(L2_w[3,1],ffFixed,5,3);
  Label_L2_w_2_8.caption:='w2='+FloatToStrF(L2_w[3,2],ffFixed,5,3);
  Label_L2_w_3_8.caption:='w3='+FloatToStrF(L2_w[3,3],ffFixed,5,3);
  Label_L2_w_4_8.caption:='w4='+FloatToStrF(L2_w[3,4],ffFixed,5,3);

  Label_L2_w_1_9.caption:='w1='+FloatToStrF(L2_w[4,1],ffFixed,5,3);
  Label_L2_w_2_9.caption:='w2='+FloatToStrF(L2_w[4,2],ffFixed,5,3);
  Label_L2_w_3_9.caption:='w3='+FloatToStrF(L2_w[4,3],ffFixed,5,3);
  Label_L2_w_4_9.caption:='w4='+FloatToStrF(L2_w[4,4],ffFixed,5,3);

  Edit_scalar_3_1.text:=FloatToStrF(L2_scalar[1],ffFixed,5,3);
  Edit_scalar_3_2.text:=FloatToStrF(L2_scalar[2],ffFixed,5,3);
  Edit_scalar_3_3.text:=FloatToStrF(L2_scalar[3],ffFixed,5,3);
  Edit_scalar_3_4.text:=FloatToStrF(L2_scalar[4],ffFixed,5,3);

  Edit_out_3_1.text:=FloatToStrF(L2_out[1],ffFixed,5,3);
  Edit_out_3_2.text:=FloatToStrF(L2_out[2],ffFixed,5,3);
  Edit_out_3_3.text:=FloatToStrF(L2_out[3],ffFixed,5,3);
  Edit_out_3_4.text:=FloatToStrF(L2_out[4],ffFixed,5,3);

  tmp:=1;
  if L2_out[1]>L2_out[tmp] then tmp:=1;
  if L2_out[2]>L2_out[tmp] then tmp:=2;
  if L2_out[3]>L2_out[tmp] then tmp:=3;
  if L2_out[4]>L2_out[tmp] then tmp:=4;

  tmp_real:=0;
  for k:=1 to n_L1 do tmp_real:=tmp_real+sqr(L1_out[k]);
  if tmp_real<not_orig_epsilon then tmp:=5;

  Label_L2_neuron1.Color:=clDefault;
  Label_L2_neuron2.Color:=clDefault;
  Label_L2_neuron3.Color:=clDefault;
  Label_L2_neuron4.Color:=clDefault;
  Label_L2_neuron5.Color:=clDefault;
  case tmp of
  1: Label_L2_neuron1.Color:=clGreen;
  2: Label_L2_neuron2.Color:=clGreen;
  3: Label_L2_neuron3.Color:=clGreen;
  4: Label_L2_neuron4.Color:=clGreen;
  5: Label_L2_neuron5.Color:=clGreen;
  end;

  PB_w_Paint(PB_L1_w1);
  PB_w_Paint(PB_L1_w2);
  PB_w_Paint(PB_L1_w3);
  PB_w_Paint(PB_L1_w4);
end;

procedure TForm1.PB_orig_MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var cell_x,cell_y:integer; dx,dy:real;
begin
  with (sender as TPaintBox) do
  begin
    dx:=width/s_width;
    dy:=Height/s_height;
    cell_x:=trunc(X/dx)+1;
    cell_y:=trunc(Y/dy)+1;
    if orig_elements[tag,cell_x,cell_y]=1
    then orig_elements[tag,cell_x,cell_y]:=0
    else orig_elements[tag,cell_x,cell_y]:=1;
    Redraw_orig_cell(Sender,cell_x,cell_y);
  end;
  L1_learn; L2_learn;
  L1_calc; L2_calc;
  Redraw_widgets;
end;

procedure TForm1.PB_orig_Paint(Sender: TObject);
var cell_x,cell_y:integer;
begin
  with (sender as TPaintBox) do
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
        Redraw_orig_cell(Sender,cell_x,cell_y);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BTN_resetClick(self);
end;

procedure TForm1.PB_receptorsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var cell_x,cell_y:integer; dx,dy:real;
begin
  with PB_receptors do
  begin
     Canvas.Pen.Color:=clBlack;
     Canvas.Brush.Style:=bsSolid;
     dx:=width/s_width;
     dy:=Height/s_height;
     cell_x:=trunc(X/dx)+1;
     cell_y:=trunc(Y/dy)+1;
     if S_elements[cell_x,cell_y]=1
     then S_elements[cell_x,cell_y]:=0
     else S_elements[cell_x,cell_y]:=1;

     if S_elements[cell_x,cell_y]=1
     then Canvas.Brush.Color:=clBlack
     else Canvas.Brush.Color:=clWhite;
     Canvas.Rectangle(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                      trunc(cell_x*dx),trunc(cell_y*dy));
  end;
  L1_calc; L2_calc;
  Redraw_widgets;
end;

procedure TForm1.PB_receptorsPaint(Sender: TObject);
var x,y:integer; dx,dy:real;
begin
  with PB_receptors do
  begin
     Canvas.Pen.Color:=clBlack;
     Canvas.Brush.Style:=bsSolid;
     dx:=width/s_width;
     dy:=Height/s_height;
     for x:=1 to s_width do
     for y:=1 to s_height do
     begin
       if S_elements[x,y]=1
       then Canvas.Brush.Color:=clBlack
       else Canvas.Brush.Color:=clWhite;
       Canvas.Rectangle(trunc((x-1)*dx),trunc((y-1)*dy),trunc(x*dx),trunc(y*dy));
     end;
  end;
end;

procedure TForm1.PB_w_MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var cell_x,cell_y:integer; dx,dy,value:real; s:string;
begin
  with (sender as TPaintBox) do
  begin
    dx:=width/s_width;
    dy:=Height/s_height;
    cell_x:=trunc(X/dx)+1;
    cell_y:=trunc(Y/dy)+1;
    value:=L1_w[tag,cell_x,cell_y];
    s:='w('+IntToStr(cell_x)+','+IntToStr(cell_y)+')='+FloatToStrF(value,fffixed,5,3);
    case tag of
    1: Label_L1_neuron1.Caption:='нейрон 1 '+s;
    2: Label_L1_neuron2.Caption:='нейрон 2 '+s;
    3: Label_L1_neuron3.Caption:='нейрон 3 '+s;
    4: Label_L1_neuron4.Caption:='нейрон 4 '+s;
    end;
  end;
end;

procedure TForm1.PB_w_Paint(Sender: TObject);
var cell_x,cell_y:integer; dx,dy:real; w_min,w_max:real; C:byte;
begin
  with (sender as TPaintBox) do
  begin
    w_min:=L1_w[tag,1,1]; w_max:=L1_w[tag,1,1];
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
      begin
        if L1_w[tag,cell_x,cell_y]<w_min then w_min:=L1_w[tag,cell_x,cell_y];
        if L1_w[tag,cell_x,cell_y]>w_max then w_max:=L1_w[tag,cell_x,cell_y];
      end;

    dx:=width/s_width;
    dy:=Height/s_height;
    Canvas.Pen.Color:=clBlack;
    Canvas.Brush.Style:=bsSolid;
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
      begin
        if w_max-w_min<>0
        then C:=255-trunc(255*(L1_w[tag,cell_x,cell_y]-w_min)/(w_max-w_min))
        else C:=255;
        Canvas.Brush.Color:=RGBToColor(C,C,C);
        Canvas.Rectangle(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                         trunc(cell_x*dx),trunc(cell_y*dy));
        Canvas.Frame(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                     trunc(cell_x*dx),trunc(cell_y*dy));
      end;
  end;
end;

procedure TForm1.Redraw_orig_cell(Sender:TObject; x,y:integer);
var dx,dy:real;
begin
  with (sender as TPaintBox) do
  begin
    Canvas.Pen.Color:=clBlack;
    Canvas.Brush.Style:=bsSolid;
    dx:=width/s_width;
    dy:=Height/s_height;
    if Orig_elements[tag,x,y]=1
    then Canvas.Brush.Color:=clBlack
    else Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(trunc((x-1)*dx),trunc((y-1)*dy),trunc(x*dx),trunc(y*dy));
  end;
end;

procedure TForm1.BTN_orig_to_S_Click(Sender: TObject);
var cell_x,cell_y:integer;
begin
  with Sender as TButton do
  begin
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
        S_elements[cell_x,cell_y]:=Orig_elements[tag,cell_x,cell_y];
  end;
  PB_receptorsPaint(PB_receptors);
  L1_calc; L2_calc;
  Redraw_widgets;
end;

procedure TForm1.BTN_orig_createClick(Sender: TObject);
var i,k,cell_x,cell_y,rnd_x,rnd_y:integer;
begin
  for i:=1 to n_origs do
    for cell_y:=1 to s_width do
      for cell_x:=1 to s_height do
        Orig_elements[i,cell_x,cell_y]:=0;

  for i:=1 to n_origs do
    for k:=1 to 10 do
    begin
      rnd_x:=random(5)+1;
      rnd_y:=random(5)+1;
      Orig_elements[i,rnd_x,rnd_y]:=1;
    end;

  PB_orig_Paint(PB_orig1);
  PB_orig_Paint(PB_orig2);
  PB_orig_Paint(PB_orig3);
  PB_orig_Paint(PB_orig4);

  L1_learn; L2_learn;
  L1_calc; L2_calc;
  Redraw_widgets;
end;

procedure TForm1.BTN_resetClick(Sender: TObject);
var i,k,cell_x,cell_y:integer;
begin
     randomize;
     not_orig_epsilon:=0.00001;

     for i:=1 to n_origs do
       for cell_y:=1 to s_width do
         for cell_x:=1 to s_height do
           Orig_elements[i,cell_x,cell_y]:=0;

     for cell_x:=1 to s_width do
       for cell_y:=1 to s_height do
         S_elements[cell_x,cell_y]:=0;

     for k:=1 to n_L1 do
       for cell_x:=1 to s_width do
       for cell_y:=1 to s_height do
         L1_w[k,cell_x,cell_y]:=(random)/5;

     for k:=1 to n_L1 do L1_sigma2[k]:=1;

     for k:=1 to n_L2 do
     for i:=1 to n_L1 do
       L2_w[k,i]:=0;

     PB_receptorsPaint(PB_receptors);
     PB_orig_Paint(PB_orig1);
     PB_orig_Paint(PB_orig2);
     PB_orig_Paint(PB_orig3);
     PB_orig_Paint(PB_orig4);

     L1_learn; L2_learn;
     L1_calc; L2_calc;
     Redraw_widgets;
end;

procedure TForm1.Edit_L2_not_origsKeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
  begin
    not_orig_epsilon:=StrToFloat(text);
    L1_calc; L2_calc;
    Redraw_widgets;
  end;
end;

procedure TForm1.Edit_L1_sigma2_KeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
  begin
    with (sender as TEdit) do L1_sigma2[tag]:=StrToFloat(text);
    L1_calc; L2_calc;
    Redraw_widgets;
  end;
end;

end.

