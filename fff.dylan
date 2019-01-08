Module: fff
Synopsis: 
Author: 
Copyright: 

define c-struct <minimal>
  slot slot-1 :: <C-unsigned-long>;
  slot slot-2 :: <C-unsigned-long*>;
  pointer-type-name: <minimal*>, c-name: "subliminal";
end;
define c-struct <maximal>
  slot max-1 :: <minimal>, address-getter: max-1*;
  slot max-2 :: <C-unsigned-char>, address-getter: max-2*;
  array slot max-3 :: <minimal>, length: 7, address-getter: max-3*;
  slot max-6 :: <C-unsigned-char>, address-getter: max-6*, setter: #f;
  slot max-7 :: <C-unsigned-char*>, address-getter: max-7*;
  pointer-type-name: <maximal*>;
end;

define c-callable-wrapper bogus of
    method (j :: <maximal*>) 
      //j.max-1;
    end
    parameter j :: <maximal*>;
  c-name: "bogus"
end;


define test itself(description: "Itself")
  assert-equal(size-of(<maximal>), 152);
  assert-equal(size-of(<minimal>), 16);
end test;

define suite fff-test-suite ()
    test itself;
end suite;
// Some immediate code:
format-out("Size of %= is %d!\n", <maximal>, size-of(<maximal>));

