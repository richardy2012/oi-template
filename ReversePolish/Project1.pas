program Project1;
const
     op_set:set of char=['+','-','*','/','^','(',')'];
     shu_set:set of char=['0'..'9'];
var
   s,shu:string;i,l,sw,c,fw,x:longint;
   sz:array[0..10000]of longint;
   fz:array[0..10000]of char;
   ji,jo:array['#'..'^']of integer;

begin
     assign(input,'a.in');assign(output,'a.out');     reset(input);rewrite(output);     
     readln(s);
     s:=s+'#';
     l:=length(s);
     sw:=0;
     fw:=1;
     fz[1]:='#';
     ji['#']:=-1;     
	 ji['+']:=2;     
	 ji['-']:=2;     
	 ji['*']:=4;
     ji['/']:=4;     
	 ji['(']:=0;     
	 ji[')']:=8;     
	 jo['#']:=-1;
     jo['+']:=1;     
	 jo['-']:=1;     
	 jo['*']:=3;     
	 jo['/']:=3;
     jo['(']:=8;     
	 jo[')']:=0;
     for i:=1 to length(s) do
     if(s[i]='-')and(not (s[i-1] in shu_set)) then insert('0',s,i);
     i:=1;
     while i<=l do
     begin
          while(i<=l)and(s[i]in shu_set) do
          begin
               shu:=shu+s[i];inc(i);
          end;
          if shu<>'' then
             begin
                  inc(sw);
                  val(shu,x,c);
                  sz[sw]:=x;
                  shu:='';
             end
          else
          begin
               if jo[s[i]]>ji[fz[fw]]then
               begin
               inc(fw);fz[fw]:=s[i];
               end
               else
               begin
                    case fz[fw] of
                    '+':sz[sw-1]:=sz[sw]+sz[sw-1];
                    '-':sz[sw-1]:=sz[sw-1]-sz[sw];
                    '*':sz[sw-1]:=sz[sw]*sz[sw-1];
                    '/':sz[sw-1]:=sz[sw-1] div sz[sw];
                    end;
                    dec(sw);dec(fw);
               end;
               inc(i);
          end;
     end;

     while fw>0 do
     begin
          case fz[fw] of
          '+':sz[sw-1]:=sz[sw]+sz[sw-1];
          '-':sz[sw-1]:=sz[sw-1]-sz[sw];
          '*':sz[sw-1]:=sz[sw]*sz[sw-1];
          '/':sz[sw-1]:=sz[sw-1]div sz[sw];
          end;
          dec(sw);dec(fw);
     end;
     writeln(sz[1]);
     close(input);close(output);
end.