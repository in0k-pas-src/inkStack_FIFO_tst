unit TSTs_inkFIFO_05_getLast;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkFIFO,
     inkFIFO;

type

 tTests_inkFIFO_05_nodeGetLast= class(tTSTCTC_CORE_inkFIFO)
  published
    procedure getLast_Nil;
    procedure getLast_One;
    procedure getLast_Two;
    procedure getLast_SiX;
  end;

implementation

procedure  tTests_inkFIFO_05_nodeGetLast.getLast_Nil;
var lst:pointer;
begin
    STACK:=TST_stack_Create(0,lst);
    AssertSame('wrong last Node', lst,inkFIFO_nodeGetLast(STACK));
end;

procedure  tTests_inkFIFO_05_nodeGetLast.getLast_One;
var lst:pointer;
begin
    STACK:=TST_stack_Create(1,lst);
    AssertSame('wrong last Node', lst,inkFIFO_nodeGetLast(STACK));
end;

procedure  tTests_inkFIFO_05_nodeGetLast.getLast_Two;
var lst:pointer;
begin
    STACK:=TST_stack_Create(2,lst);
    AssertSame('wrong last Node', lst,inkFIFO_nodeGetLast(STACK));
end;

procedure  tTests_inkFIFO_05_nodeGetLast.getLast_SiX;
var lst:pointer;
begin
    STACK:=TST_stack_Create(6,lst);
    AssertSame('wrong last Node', lst,inkFIFO_nodeGetLast(STACK));
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_05_nodeGetLast);
end.

