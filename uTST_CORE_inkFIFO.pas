unit uTST_CORE_inkFIFO;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses inkStack_node, uTST_CORE_inkStack;

const
 cTestSuitePath__inkFIFO='ink Stack FIFO';

type

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTSTCTC_CORE_inkFIFO=class(tTSTCTC_CORE_inkStack)
  protected
    function  _stack_Create  (const Count:NativeInt; out last:pInkNodeStack):pInkNodeStack; override;
    procedure _stack_DESTROY (var   stck:pInkNodeStack);                                    override;
    function  _stack_clcCount(const stck:pInkNodeStack; out last:pInkNodeStack):NativeUint; override;
    function  _stack_getFirst(const stck:pInkNodeStack):pInkNodeStack;                      override;
    function  _stack_getNode (const stck:pInkNodeStack; index:NativeUint):pInkNodeStack;    override;
    function  _stack_getLast (const stck:pInkNodeStack):pInkNodeStack;                      override;
  end;

implementation

function tTSTCTC_CORE_inkFIFO._stack_Create(const Count:NativeInt; out last:pInkNodeStack):pInkNodeStack;
var i:NativeInt;
begin // 5 0 1 2 3 4
    result:=nil;
    last  :=nil;
    if Count>0 then begin
        result:=_node_CRT(Count-1,NIL);
        result^.next:=result;
        //---
        for i:=count-2 downto 0 do begin
           last:=_node_CRT(i,result^.next);
           result^.next:=last;
        end;
        //---
        last:=result;
    end;
end;

procedure tTSTCTC_CORE_inkFIFO._stack_DESTROY(var stck:pInkNodeStack);
var tmp:pInkNodeStack;
begin
    if stck<>nil then begin
        tmp:=stck^.next;
        stck^.next:=nil;
        stck:=tmp;
        //---
        while tmp<>nil do begin
            stck:=stck^.next;
           _node_DST(tmp);
            tmp:=stck;
        end;
    end;
end;

function tTSTCTC_CORE_inkFIFO._stack_clcCount(const stck:pInkNodeStack; out last:pInkNodeStack):NativeUint;
begin
    result:=0;
    if stck<>nil then begin
        last:=stck^.next;
        result:=1;
        while last<>stck do begin
            inc(result);
            last:=last^.next;
        end;
    end;
end;

function tTSTCTC_CORE_inkFIFO._stack_getFirst(const stck:pInkNodeStack):pInkNodeStack;
begin
    if stck<>nil then result:=stck^.next
    else result:=NIL;
end;

function tTSTCTC_CORE_inkFIFO._stack_getNode (const stck:pInkNodeStack; index:NativeUint):pInkNodeStack;
var i:NativeUint;
begin
    result:=stck;
    if (index>=0)and(result<>nil) then begin;
        for i:=0 to index do begin
            result:=result^.next;
            if result=nil then break;
        end;
    end;
end;

function tTSTCTC_CORE_inkFIFO._stack_getLast(const stck:pInkNodeStack):pInkNodeStack;
begin
    result:=stck;
end;

end.
