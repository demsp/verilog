// inf - head
// tail -next
type
List = ^cell;{Указатель на элемент типа cell}
{А это наименование нашего типа "запись" обычно динамические структуры описываются через запись}
cell = record
 // head : integer;{данные, хранимые в элементе}
 // tail : List; {указатель на следующий элемент}
  head : List;{указатель на следующий элемент}
  tail : integer; {данные, хранимые в элементе}
end;

var
 u1:List;  
 u2:List;
 u3:List;

begin

NEW(u1);
u1^.head:=nil;
u1^.tail:=3;  
  write(u1^);
NEW(u2);
u2^.head:=u1;
u2^.tail:=7;
u1:=u2;
write(u1^);

NEW(u3);
u3^.head:=u1;
u3^.tail:=9;

u1:=u3;
write(u1^);
///  
Writeln ();
While u1<> nil do
Begin
Writeln (u1^.tail);
u1:= u1^.head;
end;
   
end.
