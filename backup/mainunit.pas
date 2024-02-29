unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls, ComCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Berechnen: TButton;
    Ortsfaktor: TEdit;
    Laenge: TEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    Zwischenmenu: TButton;
    Tutorial: TButton;
    Settings: TButton;
    Weiter: TButton;
    CloseMenu: TButton;
    sizeUp: TButton;
    GraphErstellen: TButton;
    closeButton: TButton;
    sizeDown: TButton;
    Masse: TEdit;
    Federkonstante: TEdit;
    Elongation: TEdit;
    graph: TImage;
    Daempfung: TEdit;
    clearGraph: TButton;
    Topper: TPanel;
    selectType: TRadioGroup;
    values: TStringGrid;
    procedure BerechnenClick(Sender: TObject);
    procedure clearGraphClick(Sender: TObject);
    procedure closeButtonClick(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure DaempfungClick(Sender: TObject);
    procedure ElongationClick(Sender: TObject);
    procedure FederkonstanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraphErstellenClick(Sender: TObject);
    procedure LaengeClick(Sender: TObject);
    procedure MasseClick(Sender: TObject);
    procedure OrtsfaktorClick(Sender: TObject);
    procedure selectTypeClick(Sender: TObject);
    procedure sizeDownClick(Sender: TObject);
    procedure sizeUpClick(Sender: TObject);
    procedure WeiterClick(Sender: TObject);
    procedure ZwischenmenuClick(Sender: TObject);
  private

  public
    var sm,sD,sy, sk, m,D,y,l,g,k,v,a,zoom: real;
  end;

var
  Form1: TForm1;
  i, j, height, width: integer;

implementation

{$R *.lfm}

{ TForm1 }
//Anfang Form Procedures
procedure TForm1.FormCreate(Sender: TObject);
begin
  sk := 0;
  zoom := 1;
  height := screen.height;
  width := screen.width;

  graph.width := Round(screen.width*0.4);
  graph.height := screen.height div 2;
  graph.top := screen.height div 2 - graph.height div 2;
  graph.left := screen.width div 2 - graph.width div 2;
  closeButton.Width := screen.width div 15;
  closeButton.Height := screen.height div 15;
  closeButton.Left := screen.width div 2 - closeButton.width div 2;
  closeButton.Top := Round((graph.top + graph.height)*1.05);

  Zwischenmenu.Width := screen.width div 15;
  Zwischenmenu.Height := screen.height div 15;
  Zwischenmenu.Left := screen.width div 2 - Zwischenmenu.width div 2 - CloseButton.Width + 2;;
  Zwischenmenu.Top := Round((graph.top + graph.height)*1.05);

  values.width := Round((screen.width - (graph.left+graph.width))) + screen.width div 20;
  values.height := (screen.height div 3)*2;
  values.left := Round((graph.width+graph.left));
  values.top := screen.height div 2 - values.height div 2;
  values.DefaultColWidth := values.DefaultColWidth * 2;

  Topper.Width := screen.width;
  Topper.Height := values.top div 2;
  Topper.top := 0;
  Topper.left := 0;

  selectType.height := screen.height div 8;
  selectType.Top := screen.height div 2 - selectType.height;
  selectType.width :=  screen.width div 7;
  selectType.Left := screen.width div 55;

  Masse.Height := screen.height div 28;
  Masse.Width := screen.width div 14;
  Masse.Top := selectType.top + Masse.height div 2;
  Masse.left := selectType.left + selectType.width + Masse.width div 6;

  Federkonstante.Height := screen.height div 28;
  Federkonstante.Width := screen.width div 14;
  Federkonstante.Top := Masse.top + Federkonstante.height;
  Federkonstante.left := Masse.left;

  Elongation.Height := screen.height div 28;
  Elongation.Width := screen.width div 14;
  Elongation.Top := Federkonstante.top + Elongation.height;
  Elongation.left := Masse.left;

  Daempfung.Height := screen.height div 28;
  Daempfung.Width := screen.width div 14;
  Daempfung.Top := Elongation.top + Elongation.height;
  Daempfung.left := Masse.left;

  Berechnen.height := Masse.height;
  Berechnen.width := selectType.width;
  Berechnen.left := selectType.Left;
  Berechnen.top := selectType.top + selectType.height + Berechnen.height div 2;

  GraphErstellen.height := Berechnen.height;
  GraphErstellen.left := Berechnen.left;
  GraphErstellen.width := Berechnen.width;
  GraphErstellen.top := Berechnen.top + Berechnen.height;

  Laenge.height := Elongation.height;
  Laenge.width := Elongation.width;
  Laenge.top := Elongation.top + Laenge.height;
  Laenge.left := Elongation.left;

  Ortsfaktor.height := Elongation.height;
  Ortsfaktor.width := Elongation.width;
  Ortsfaktor.top := Laenge.top + Ortsfaktor.height;
  Ortsfaktor.left := Laenge.left;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  values.rowcount:=19999;
  values.colcount:=4;
end;
procedure TForm1.GraphErstellenClick(Sender: TObject);
var j: integer;
begin
   for j:=0 to 19998 do begin
       with graph do begin
          if selectType.itemindex = 0 then begin
             canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000)] := clred;
          end;
          if selectType.itemindex = 1 then begin
             canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000)] := clblue;
          end;
          if selectType.itemindex = 2 then begin
             canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000)] := clyellow;
          end;
       end;
   end;
end;
procedure TForm1.BerechnenClick(Sender: TObject);

var i: integer;
    t, tsum: real;
begin
  if selectType.ItemIndex = 0 then begin
    m := strtofloat(Masse.Text);
    D := strtofloat(Federkonstante.Text);
    y := strtofloat(Elongation.Text);
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           with values do begin
              cells[0, i] := floattostr(tsum);
              cells[1, i] := floattostr(y);
              cells[2, i] := floattostr(v);
              cells[3, i] := floattostr(a);
           end;
      end;
  end;
  if selectType.ItemIndex = 1 then begin
    m := strtofloat(Masse.Text);
    D := strtofloat(Federkonstante.Text);
    y := strtofloat(Elongation.Text);
    k := strtofloat(Daempfung.text);
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           with values do begin
              cells[0, i] := floattostr(tsum);
              cells[1, i] := floattostr(y);
              cells[2, i] := floattostr(v);
              cells[3, i] := floattostr(a);
           end;
      end;
  end;
  if selectType.ItemIndex = 2 then begin
    m := strtofloat(Masse.Text);
    y := strtofloat(Elongation.Text);
    l := strtofloat(Laenge.Text);
    g := strtofloat(Ortsfaktor.Text);
    v := 0;
    D := (m*g)/l;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           with values do begin
              cells[0, i] := floattostr(tsum);
              cells[1, i] := floattostr(y);
              cells[2, i] := floattostr(v);
              cells[3, i] := floattostr(a);
           end;
      end;
  end;


  sm := strtofloat(Masse.Text);
  sD := D;
  sy := strtofloat(Elongation.Text);
  if not selectType.Itemindex = 2 then begin
      D := strtofloat(Federkonstante.Text);
      end;
  if selectType.itemindex = 1 then begin
        sk := strtofloat(Daempfung.Text);
     end;

  Elongation.text := 'Elongation: ';
  Masse.text := 'Masse: ';
  Federkonstante.text := 'Federkonstante: ';
  Daempfung.text := 'Dämpfung: ';
  Laenge.text := 'Länge: ';
  Ortsfaktor.text := 'Ortsfaktor: ';
end;
procedure TForm1.clearGraphClick(Sender: TObject);
begin
   graph.picture := nil;
end;
procedure TForm1.selectTypeClick(Sender: TObject);
begin
  if selectType.ItemIndex = 0 then begin
     Elongation.visible := true;
     Masse.visible := true;
     Federkonstante.visible := true;
     Berechnen.visible := true;
     GraphErstellen.visible := true;
     Daempfung.visible := false;
  end;
  if selectType.ItemIndex = 1 then begin
     Elongation.visible := true;
     Masse.visible := true;
     Federkonstante.visible := true;
     Daempfung.visible := true;
     Berechnen.visible := true;
     GraphErstellen.visible := true;
  end;
  if selectType.ItemIndex = 2 then begin
     Elongation.visible := true;
     Masse.visible := true;
     Federkonstante.visible := true;
     Laenge.visible := true;
     Ortsfaktor.visible := true;
     Berechnen.visible := true;
     GraphErstellen.visible := true;
  end;
  Elongation.text := 'Elongation: ';
  Masse.text := 'Masse: ';
  Federkonstante.text := 'Federkonstante: ';
  Daempfung.text := 'Dämpfung: ';
  Laenge.text := 'Länge: ';
  Ortsfaktor.text := 'Ortsfaktor';
end;
procedure TForm1.sizeDownClick(Sender: TObject);
var
      j:integer;
      i: integer;
      t, tsum: real;
   begin
     y := sy;
     D := sD;
     m := sm;
     k := sk;
     graph.Picture:=nil;
     zoom := zoom - 0.1;
     if selectType.ItemIndex = 0 then begin
       v := 0;
       tsum := 0;
         for i:=0 to 19998 do begin
                t := 0.005*(1/zoom);
                a := -(D/m)*y;
                v := v+a*t;
                y := y+v*t;
                tsum := tsum + t;
                with values do begin
                   cells[0, i] := floattostr(tsum);
                   cells[1, i] := floattostr(y);
                   cells[2, i] := floattostr(v);
                   cells[3, i] := floattostr(a);
                end;
           end;
       end;
     if selectType.ItemIndex = 1 then begin
       v := 0;
       tsum := 0;
       for i:=0 to 19998 do begin
              t := 0.005*(1/zoom);
              a := -(D*y+k*v)/m;
              v := v+a*t;
              y := y+v*t;
              tsum := tsum + t;
              with values do begin
                 cells[0, i] := floattostr(tsum);
                 cells[1, i] := floattostr(y);
                 cells[2, i] := floattostr(v);
                 cells[3, i] := floattostr(a);
              end;
         end;
         end;
     if selectType.ItemIndex = 0 then begin
       v := 0;
       tsum := 0;
         for i:=0 to 19998 do begin
                t := 0.005*(1/zoom);
                a := -(D/m)*y;
                v := v+a*t;
                y := y+v*t;
                tsum := tsum + t;
                with values do begin
                   cells[0, i] := floattostr(tsum);
                   cells[1, i] := floattostr(y);
                   cells[2, i] := floattostr(v);
                   cells[3, i] := floattostr(a);
                end;
           end;
       end;
     for j:=0 to 19998 do begin
        with graph do begin
           if selectType.itemindex = 0 then begin
              canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000*zoom)] := clred;
           end;
           if selectType.itemindex = 1 then begin
              canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000*zoom)] := clblue;
           end;
           if selectType.itemindex = 2  then begin
              canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000*zoom)] := clyellow;
           end;
        end;
    end;
end;
procedure TForm1.sizeUpClick(Sender: TObject);
   var
       j:integer;
       i: integer;
       t, tsum: real;
    begin
      y := sy;
      D := sD;
      m := sm;
      k := sk;
      graph.Picture:=nil;
      zoom := zoom + 0.1;


      if selectType.ItemIndex = 0 then begin
        v := 0;
        tsum := 0;
          for i:=0 to 19998 do begin
                 t := 0.005*(1/zoom);
                 a := -(D/m)*y;
                 v := v+a*t;
                 y := y+v*t;
                 tsum := tsum + t;
                 with values do begin
                    cells[0, i] := floattostr(tsum);
                    cells[1, i] := floattostr(y);
                    cells[2, i] := floattostr(v);
                    cells[3, i] := floattostr(a);
                 end;
            end;
        end;
      if selectType.ItemIndex = 1 then begin

        v := 0;
        tsum := 0;
        for i:=0 to 19998 do begin
               t := 0.005*(1/zoom);
               a := -(D*y+k*v)/m;
               v := v+a*t;
               y := y+v*t;
               tsum := tsum + t;
               with values do begin
                  cells[0, i] := floattostr(tsum);
                  cells[1, i] := floattostr(y);
                  cells[2, i] := floattostr(v);
                  cells[3, i] := floattostr(a);
               end;
          end;
          end;
      if selectType.ItemIndex = 2 then begin
        v := 0;
        tsum := 0;
          for i:=0 to 19998 do begin
                 t := 0.005*(1/zoom);
                 a := -(D/m)*y;
                 v := v+a*t;
                 y := y+v*t;
                 tsum := tsum + t;
                 with values do begin
                    cells[0, i] := floattostr(tsum);
                    cells[1, i] := floattostr(y);
                    cells[2, i] := floattostr(v);
                    cells[3, i] := floattostr(a);
                 end;
            end;
        end;

      for j:=0 to 19998 do begin
         with graph do begin
            if selectType.itemindex = 0 then begin
               canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000*zoom)] := clred;
            end;
            if selectType.itemindex = 1 then begin
               canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000*zoom)] := clblue;
            end;
            if selectType.itemindex = 2 then begin
               canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*1000*zoom)] := clyellow;
            end;
         end;
     end;
end;
procedure TForm1.WeiterClick(Sender: TObject);
begin
  Tutorial.Visible := false;
  Settings.visible := false;
  Weiter.visible := false;
  CloseMenu.visible := false;
  Panel2.visible := false;
  Panel3.visible := false;
end;
procedure TForm1.ZwischenmenuClick(Sender: TObject);
begin

  Tutorial.visible := true;
  Settings.visible := true;
  Weiter.visible := true;
  CloseMenu.Visible := true;
  Panel2.visible := true;
  Panel3.visible := true;

  Panel3.height := screen.height;
  Panel3.width := screen.Width;
  Panel3.Top := 0;
  Panel3.Left := 0;

  Panel2.height := screen.height div 2;
  Panel2.Top := screen.height div 2 - Panel2.height div 2;
  Panel2.width :=  screen.width div 2;
  Panel2.Left := screen.width div 2 - Panel2.width div 2;
  Panel2.BringToFront;

  Tutorial.Width := screen.width div 5;
  Tutorial.Height := screen.height div 12;
  Tutorial.Left := screen.width div 2 - Tutorial.width div 2;
  Tutorial.Top := screen.height div 2 - Panel2.height div 2+ Tutorial.height;
  Tutorial.bringtofront;

  Settings.Width := screen.width div 5;
  Settings.Height := screen.height div 12;
  Settings.Left := screen.width div 2 - Settings.width div 2;
  Settings.Top := screen.height div 2 - Panel2.height div 2+ Settings.height*2;
  Settings.bringtofront;

  Weiter.Width := screen.width div 5;
  Weiter.Height := screen.height div 12;
  Weiter.Left := screen.width div 2 - Weiter.width div 2;
  Weiter.Top := screen.height div 2 - Panel2.height div 2+ Settings.height*3;
  Weiter.bringtofront;

  CloseMenu.Width := screen.width div 5;
  CloseMenu.Height := screen.height div 12;
  CloseMenu.Left := screen.width div 2 - CloseMenu.width div 2;
  CloseMenu.Top := screen.height div 2 - Panel2.height div 2 + Settings.height*4;
  CloseMenu.bringtofront;
end;

//Anfang Button Procedures

procedure TForm1.LaengeClick(Sender: TObject);
begin
   Laenge.text := '';
end;
procedure TForm1.MasseClick(Sender: TObject);
begin
  Masse.text := '';
end;
procedure TForm1.OrtsfaktorClick(Sender: TObject);
begin
  Ortsfaktor.text := '';
end;

procedure TForm1.closeButtonClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.CloseMenuClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.DaempfungClick(Sender: TObject);
begin
   Daempfung.text := '';
end;

procedure TForm1.ElongationClick(Sender: TObject);
begin
  Elongation.text := '';
end;

procedure TForm1.FederkonstanteClick(Sender: TObject);
begin
  Federkonstante.text := '';
end;

end.

